//+------------------------------------------------------------------+
//|                                                      Ejemplo.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;

input int ExpertMagicNumber=22222;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

   trade.SetExpertMagicNumber(ExpertMagicNumber);
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
//---

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarPendientes()
  {
   int OrdenesPendientes=OrdersTotal();

   for(int cnt=OrdenesPendientes-1; cnt>=0; cnt--)
     {
      ulong ticket=OrderGetTicket(cnt);
      if(ticket!=0)
        {
         if(OrderGetInteger(ORDER_MAGIC)!=ExpertMagicNumber || OrderGetString(ORDER_SYMBOL)!=Symbol())
            continue;

         trade.OrderDelete(ticket);
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarPocisiones()
  {
   int Posiciones=PositionsTotal();

   for(int cnt=Posiciones-1; cnt>=0; cnt--)
     {
      ulong ticket=PositionGetTicket(cnt);
      if(ticket!=0)
        {
         if(PositionGetInteger(POSITION_MAGIC)!=ExpertMagicNumber || PositionGetString(POSITION_SYMBOL)!=Symbol())
            continue;

         trade.PositionClose(ticket,-1);
        }
     }
  }
//+------------------------------------------------------------------+
