//+------------------------------------------------------------------+
//|                                             DATOS POSICIONES.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   for(int i=0;i<PositionsTotal();i++)
     {
      Print("F POSICION TICKET: ",PositionGetTicket(i)," ID: ",PositionGetInteger(POSITION_IDENTIFIER)," MAGIC: ",PositionGetInteger(POSITION_MAGIC));
     }
  }
//+------------------------------------------------------------------+
