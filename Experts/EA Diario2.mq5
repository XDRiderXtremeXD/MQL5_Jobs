//+------------------------------------------------------------------+
//|                                                   EA Diario2.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

int HandleADX=0;


#include<Trade\Trade.mqh>
CTrade trade;

input ENUM_TIMEFRAMES TimeFrame=PERIOD_D1;
input double VOLUME=0.1;
input int TakeProfit=100;
input int StopLoss=100;
input int Desfase=0;
input string S1="======== DAYS ========";//=========================================
input bool Lunes=true;
input bool Martes=true;
input bool Miercoles=true;
input bool Jueves=true;
input bool Viernes=true;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   TesterHideIndicators(true);
//---
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
// EventKillTimer();
  }//------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {

   

   static datetime TIEMPOACTUAL=0;
   
   datetime Actulaiza=ActualizarDatos(Symbol(),TimeFrame);
   
   MqlDateTime TIEMPODAY;
   TimeToStruct(iTime(NULL,PERIOD_D1,0),TIEMPODAY);

   if(TIEMPOACTUAL!=iTime(NULL,TimeFrame,0))
     {
      if((TIEMPODAY.day_of_week==1 && Lunes) || (TIEMPODAY.day_of_week==2 && Martes) 
      || (TIEMPODAY.day_of_week==3 && Miercoles) || (TIEMPODAY.day_of_week==4 && Jueves) || (TIEMPODAY.day_of_week==5 && Viernes))
        {
         double ValorMaximo=iHigh(NULL,TimeFrame,iHighest(NULL,TimeFrame,MODE_HIGH,2,1));
         double ValorMinimo=iLow(NULL,TimeFrame,iLowest(NULL,TimeFrame,MODE_LOW,2,1));

         double SL=StopLoss==0?0:ValorMinimo+StopLoss*Point()-Desfase*Point();
         double TP=TakeProfit==0?0:ValorMinimo-TakeProfit*Point()-Desfase*Point();

         bool Ejecuto=0;
         Ejecuto=trade.SellStop(VOLUME,ValorMinimo-Desfase*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,iTime(NULL,TimeFrame,0)+PeriodSeconds(TimeFrame),NULL);
         if(Ejecuto==false)
            Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
         else
            TIEMPOACTUAL=iTime(NULL,TimeFrame,0);


         SL=StopLoss==0?0:ValorMaximo-StopLoss*Point()+Desfase*Point();
         TP=TakeProfit==0?0:ValorMaximo+TakeProfit*Point()+Desfase*Point();

         Ejecuto=0;
         Ejecuto=trade.BuyStop(VOLUME,ValorMaximo+Desfase*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,iTime(NULL,TimeFrame,0)+PeriodSeconds(TimeFrame),NULL);
         if(Ejecuto==false)
            Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
         else
            TIEMPOACTUAL=iTime(NULL,TimeFrame,0);
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime ActualizarDatos(string Simbolo,ENUM_TIMEFRAMES TimeFrames)
  {
   if(TimeFrames==PERIOD_CURRENT)
     {
      TimeFrames=ENUM_TIMEFRAMES(Period());
     }
//---
   MqlRates rates[];
   ArraySetAsSeries(rates,true);

   int copied=CopyRates(Simbolo,TimeFrames,0,50,rates);

   uchar Conteo=13;

   while(copied<0 && !IsStopped())
     {
      ResetLastError();
      Conteo--;
      Print("Cargando datos históricos para el símbolo ",Simbolo);
      Sleep(1000);
      copied=CopyRates(Simbolo,TimeFrames,0,100,rates);
      if(Conteo<10)
        {
         int Error=GetLastError();
         if(copied<0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE ",Simbolo," ",EnumToString(TimeFrames),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE ",Simbolo," ",EnumToString(TimeFrames),"  Cod ",Error);
            ExpertRemove();
           }
        }
     }

   return rates[0].time;
//Print("Z2");
  }

//+------------------------------------------------------------------+
