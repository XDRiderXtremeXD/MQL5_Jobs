//+------------------------------------------------------------------+
//|                                       Calculo_Lotaje_Control.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

input double Capital_Base=6000;
input double Porcentaje_Perdida=0.6;

#include<Trade\Trade.mqh>
CTrade trade;

int Ordenes=0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   Ordenes=0;


   EventSetMillisecondTimer(1);
//---
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EventKillTimer();

  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnTimer()
  {
   int OrdenesTotales=OrdersTotal();

   if(OrdenesTotales!=Ordenes)
     {
      for(int i=OrdenesTotales-1; i>=0; i--)
        {
         ulong Ticket=OrderGetTicket(i);
         double SL=OrderGetDouble(ORDER_SL);
         double TP=OrderGetDouble(ORDER_TP);
         double OP=OrderGetDouble(ORDER_PRICE_OPEN);
         string Simbolo=OrderGetString(ORDER_SYMBOL);
         int Reason=(int)OrderGetInteger(ORDER_REASON);
         int tipo=(int)OrderGetInteger(ORDER_TYPE);

         if(tipo==ORDER_TYPE_BUY_LIMIT || tipo==ORDER_TYPE_BUY_STOP
            ||tipo==ORDER_TYPE_SELL_STOP||tipo==ORDER_TYPE_SELL_LIMIT)
            if(Reason==ORDER_REASON_MOBILE)
              {
               Sleep(1000);
               if(trade.OrderDelete(Ticket))
                 {
                  double Lotaje=0;
                  if(CalcularLotaje(OP,SL,Lotaje,Simbolo))
                     if(Lotaje!=0)
                       {
                        if(tipo==ORDER_TYPE_BUY_LIMIT)
                           trade.BuyLimit(Lotaje,OP,Simbolo,SL,TP,ORDER_TIME_DAY,0,"Lot recalculado");

                        if(tipo==ORDER_TYPE_BUY_STOP)
                           trade.BuyStop(Lotaje,OP,Simbolo,SL,TP,ORDER_TIME_DAY,0,"Lot recalculado");

                        if(tipo==ORDER_TYPE_SELL_LIMIT)
                           trade.SellLimit(Lotaje,OP,Simbolo,SL,TP,ORDER_TIME_DAY,0,"Lot recalculado");

                        if(tipo==ORDER_TYPE_SELL_STOP)
                           trade.SellStop(Lotaje,OP,Simbolo,SL,TP,ORDER_TIME_DAY,0,"Lot recalculado");

                        Print("Codigo resultante para ",Simbolo," con ticket ",Ticket," ",trade.ResultRetcode());
                       }
                 }
               else
                  Print("ERROR AL CERRAR OPERACION PENDIENTE DE ",Simbolo," ticket ",Ticket," ",trade.ResultRetcode());
              }

        }
      Ordenes=OrdenesTotales;
     }
  }
//+------------------------------------------------------------------+
bool CalcularLotaje(double Open,double SL,double &Lotaje_,string Simbolo)
  {
   double Tick_Value=SymbolInfoDouble(Simbolo,SYMBOL_TRADE_TICK_VALUE);
   int rango=int(MathAbs(Open-SL)/SymbolInfoDouble(Simbolo,SYMBOL_POINT))+1;
   double Perdida=Capital_Base*Porcentaje_Perdida/100.0;
   Print("Perdida Calculada ",DoubleToString(Perdida,2));
   double Lotaje=Perdida/(Tick_Value*rango);

   double Lots=int(Lotaje*100);
   Lots=NormalizeDouble(Lots/100.0,2);

   double Lote_Step=Lots/SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_STEP);
   int Lote_Step_int=int(Lots/SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_STEP));

// Print("Lote calculado es igual a  ",DoubleToString(Lots,2));

   if((Lote_Step-Lote_Step_int)>0)
     {
      Lots=Lote_Step_int*SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_STEP);
      Lots=NormalizeDouble(Lots,2);
      Print("Redondeando al Lote mas cercano permitido");
     }
//Lots=NormalizeDouble(Lots-SymbolInfoDouble(OrderSymbol(),SYMBOL_VOLUME_STEP),2);
   Print("Lote Calculado ",DoubleToString(Lots,2));

   if(Lots<SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_MIN))
     {
      Alert("Lote calculado menor que el minimo permitido por el Simbolo, No se ejecuta operacion");
      // Print("Lote = ",DoubleToString(SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN)));
      // Lots=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
      //Lotaje_=Lots;
      return false;
     }


   if(Lots<=SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_MAX))
     {
      Lotaje_=Lots;
      return true;
     }
   else
      Print("No opero porque el lote calculado es Superior al Lote Maximo del Simbolo");

   return false;

  }
//+------------------------------------------------------------------+
