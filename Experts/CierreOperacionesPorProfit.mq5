//+------------------------------------------------------------------+
//|                                   CierreOperacionesPorProfit.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;

input double beneficio=0.5;
input double perdida=-0.5;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }


void OnTick()

  {

   int PosicionesTotal=PositionsTotal();

   for(int op=PosicionesTotal-1; op>=0; op--)
     {
      ulong ticket=PositionGetTicket(op);
      double profit=PositionGetDouble(POSITION_PROFIT);

      if(profit<=perdida || beneficio<=profit)
         trade.PositionClose(ticket,-1);
     }

  }
//+------------------------------------------------------------------+
