//+------------------------------------------------------------------+
//|                                                    EA Diario.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

int HandleADX=0;


#include<Trade\Trade.mqh>
CTrade trade;

input double VOLUME=0.1;
input int TakeProfit=0;

input int PeriodoADX=14;
input int ToleranciaPuntos=800;
input int Desfase=50;
input int ADXNIVEL=30;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
MqlRates rates2[];

double ADX[];
int OnInit()
  {

   HandleADX=iADX(NULL,PERIOD_D1,PeriodoADX); // Slow length);
   ArraySetAsSeries(ADX,true);

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


   CopyBuffer(HandleADX,0,0,5,ADX);

   int total=PositionsTotal();
   int OrdersBuy=0, OrdersSell=0;

   int copied=CopyRates(NULL,0,0,20,rates2);
   ArraySetAsSeries(rates2,true);


   MqlDateTime TIEMPO;
   TimeToStruct(TimeCurrent(),TIEMPO);

   double bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   for(int i=0; i<total; i++)
     {
      //--- parámetros de la orden
      ulong  position_ticket=PositionGetTicket(i);// ticket de la posición
      string position_symbol=PositionGetString(POSITION_SYMBOL); // símbolo
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);  // tipo de posición


      double Bid=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_BID);
      double Ask=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_ASK);
      double OrderOpen=PositionGetDouble(POSITION_PRICE_OPEN);
      double StopLoss=PositionGetDouble(POSITION_SL);
      double TakeProfit__=PositionGetDouble(POSITION_TP);
      double Point_=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_POINT);
      int Digitos_=(int)SymbolInfoInteger(PositionGetString(POSITION_SYMBOL),SYMBOL_DIGITS);
      ENUM_POSITION_TYPE Tipo=(ENUM_POSITION_TYPE) PositionGetInteger(POSITION_TYPE);

      if(type==POSITION_TYPE_BUY)
        {
         /*  if((Fast_Trend[1]<rates2[1].low && Slow_Trend[1]<rates2[1].low))
             {
              if(StopLoss==0 || StopLoss<Fast_Trend[1]-10*Point_)
                 trade.PositionModify(position_ticket,Fast_Trend[1]-10*Point_,TakeProfit__);
             }*/
         if(TIEMPO.day_of_week==5 && TIEMPO.hour>=20)
            trade.PositionClose(position_ticket,-1);
         else
            OrdersBuy++;
        }
      if(type==POSITION_TYPE_SELL)
        {
         /* if((Fast_Trend[1]>rates2[1].high && Slow_Trend[1]>rates2[1].high))
            {
             if(StopLoss==0 || StopLoss>Fast_Trend[1]+10*Point_)
                trade.PositionModify(position_ticket,Fast_Trend[1]+10*Point_,TakeProfit__);
            }


          if((Fast_Trend[1]>rates2[1].high && Slow_Trend[1]>rates2[1].high))
            {
             if(StopLoss==0 || StopLoss>Fast_Trend[1]+10*Point_)
                trade.PositionModify(position_ticket,Fast_Trend[1]+10*Point_,TakeProfit__);
            }*/
         if(TIEMPO.day_of_week==5 && TIEMPO.hour==20)
            trade.PositionClose(position_ticket,-1);
         else
            OrdersSell++;
        }
     }

   static datetime TIEMPOACTUAL=0;
   TimeToStruct(iTime(NULL,PERIOD_D1,0),TIEMPO);

   MqlDateTime TIEMPO2;
   TimeToStruct(iTime(NULL,PERIOD_D1,1),TIEMPO2);

   MqlDateTime TIEMPO3;
   TimeToStruct(iTime(NULL,PERIOD_D1,2),TIEMPO3);

   datetime TiempoInicio,TiempoFinal;
   SymbolInfoSessionTrade(NULL,ENUM_DAY_OF_WEEK(TIEMPO.day),0,TiempoInicio,TiempoFinal);

   
   Comment(TIEMPO.day_of_week);
   
   if(TIEMPOACTUAL!=iTime(NULL,PERIOD_D1,0) && ADX[2]>=ADXNIVEL)
     {
      if(TIEMPO.day_of_week==3)
        {

         double ValorMaximo=iHigh(NULL,PERIOD_D1,iHighest(NULL,PERIOD_D1,MODE_HIGH,2,1));
         double ValorMinimo=iLow(NULL,PERIOD_D1,iLowest(NULL,PERIOD_D1,MODE_LOW,2,1));

         if((ValorMaximo-ValorMinimo)/Point()<ToleranciaPuntos)
           {
            double SL=ValorMaximo;
            double TP=TakeProfit==0?0:ValorMinimo-TakeProfit*Point()-Desfase*Point();

            bool Ejecuto=0;
            Ejecuto=trade.SellStop(VOLUME,ValorMinimo-Desfase*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,iTime(NULL,PERIOD_D1,0)+PeriodSeconds(Period()),NULL);
            if(Ejecuto==false)
               Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
            else
               TIEMPOACTUAL=iTime(NULL,PERIOD_D1,0);


            SL=ValorMinimo;
            TP=TakeProfit==0?0:ValorMaximo+TakeProfit*Point()+Desfase*Point();

            Ejecuto=0;
            Ejecuto=trade.BuyStop(VOLUME,ValorMaximo+Desfase*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,iTime(NULL,PERIOD_D1,0)+PeriodSeconds(Period()),NULL);
            if(Ejecuto==false)
               Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
            else
               TIEMPOACTUAL=iTime(NULL,PERIOD_D1,0);

           }
        }
     }
   /* if(SymbolInfoInteger(Symbol(),SYMBOL_SPREAD)<15)
    if(EvaluaHorario(Hora_Inicio,Hora_Final))
      {
       static datetime TIME=0;
       bool IsBuy=false;

       int copied=CopyRates(NULL,0,0,20,rates2);
       ArraySetAsSeries(rates2,true);

       if(copied<=0)
          Print("Fallo al copiar los datos de precios ",GetLastError());

       if((rates2[1].high-rates2[1].low)/Point()<=Puntos)
          if(IgualarDiveregencias(TIME,IsBuy))
            {
             if(!IsBuy)
               {
                double Nivel=0;
                for(int i=2; i<20; i++)
                  {
                   if(i==2)
                      if(rates2[i].open>rates2[i].close)
                         continue;

                   if(rates2[i].open<rates2[i].close)
                      Nivel=rates2[i].low;

                   if(rates2[i].open>rates2[i].close)
                      break;
                  }



                if((Fast_Trend[1]<rates2[1].low || Slow_Trend[1]<rates2[1].low))
                  {
                   if(OrdersSell==0)
                     {
                      bool Ejecuto=0;
                      double SL=rates2[1].high+10*Point();
                      double TP=rates2[1].low-TakeProfit_*Point();//rates2[1].low-TakeProfit_*Point();
                      if(Nivel==0 || Nivel>bid)
                         Ejecuto=trade.SellStop(VOLUME,bid-15*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,TimeCurrent()+5*PeriodSeconds(Period()),NULL);
                      else
                         if((MathAbs(Nivel-rates2[1].low))/Point()<=ToleranciaPuntos)
                            Ejecuto=trade.SellStop(VOLUME,Nivel-30*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,TimeCurrent()+5*PeriodSeconds(Period()),NULL);
                      if(Ejecuto==false)
                         Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                     }
                  }
               }
             else
               {
                double Nivel=0;
                for(int i=2; i<20; i++)
                  {
                   if(i==2)
                      if(rates2[i].open<rates2[i].close)
                         continue;

                   if(rates2[i].open>rates2[i].close)
                      Nivel=rates2[i].high;

                   if(rates2[i].open<rates2[i].close)
                      break;
                  }


                if((Fast_Trend[1]>rates2[1].high || Slow_Trend[1]>rates2[1].high))
                  {
                   if(OrdersBuy==0)
                     {
                      bool Ejecuto=0;
                      double SL=rates2[1].low-10*Point();
                      double TP=rates2[1].high+TakeProfit_*Point();//rates2[1].high+TakeProfit_*Point();;
                      if(Nivel==0 || Nivel<ask)
                         Ejecuto=trade.BuyStop(VOLUME,ask+15*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,TimeCurrent()+5*PeriodSeconds(Period()),NULL);
                      else
                         if(MathAbs((Nivel-rates2[1].high))/Point()<=ToleranciaPuntos)
                            Ejecuto=trade.BuyStop(VOLUME,Nivel+30*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,TimeCurrent()+5*PeriodSeconds(Period()),NULL);

                      if(Ejecuto==false)
                         Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                     }
                  }
               }
            }
      }*/
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

   return rates[1].time;
//Print("Z2");
  }

//+------------------------------------------------------------------+
