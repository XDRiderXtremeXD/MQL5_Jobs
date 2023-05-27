//+------------------------------------------------------------------+
//|                                                  Probar_Deal.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   double Ask_=SymbolInfoDouble(NULL,SYMBOL_ASK);
   double Bid_=SymbolInfoDouble(NULL,SYMBOL_BID);

   bool Ejecuto=trade.Sell(0.01,NULL,Bid_,0,0,"  ");

   if(Ejecuto==false)
     {
      Print(" ResultCode()= ",trade.ResultRetcode());
     }
   else
     {
      ulong Deal=trade.ResultOrder();
      Print(" con TICKET Orden: ",Deal," ResultCode()= ",trade.ResultRetcode());
      //long POSITION_ID=HistoryDealGetInteger(Deal,DEAL_POSITION_ID);
      //long POSITION_TYPE_=HistoryDealGetInteger(Deal,DEAL_TYPE);
      //Print(" POSITION_ID: ",POSITION_ID," TYPE:",POSITION_TYPE_);
     }



   int Total=PositionsTotal();
   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;
      long POSITION_ID=PositionGetInteger(POSITION_IDENTIFIER);
      Print(" POSITION_ID_2: ",POSITION_ID);
     }


  Total=OrdersTotal();
   for(int i=Total-1; i>=0; i--)
     {
      Print("1");
      ulong Ticket=OrderGetTicket(i);
      Print("Ticket Deal= ",Ticket);
      if(Ticket==0)
         continue;
      long POSITION_ID=OrderGetInteger(ORDER_POSITION_ID);
      Print(" ORDER_ID: ",POSITION_ID);
     }

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {


  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
