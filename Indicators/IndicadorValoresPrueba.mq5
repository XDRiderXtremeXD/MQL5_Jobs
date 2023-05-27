//+------------------------------------------------------------------+
//|                                       IndicadorValoresPrueba.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping

   int IDs=0;
   int TotalPosiciones=PositionsTotal();
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      Print(PositionGetDouble(POSITION_PROFIT));
      IDs=(int)PositionGetInteger(POSITION_IDENTIFIER);
      Print(EnumToString(ENUM_POSITION_REASON(PositionGetInteger(POSITION_REASON)))," ID ",IDs);
     }

   Print("------------------------------------------------------");
//--- request trade history
   HistorySelect(iTime(Symbol(),PERIOD_D1,0),TimeCurrent());
//--- create objects
   int     total=HistoryDealsTotal();
   ulong    ticket=0;

   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         double SL =HistoryDealGetDouble(ticket,DEAL_SL);
         double TP =HistoryDealGetDouble(ticket,DEAL_TP);
         double OP =HistoryDealGetDouble(ticket,DEAL_PRICE);

         Print("ID ",ID," MAGIG ",Magic," ENTRY ",EnumToString(ENUM_DEAL_ENTRY(entry)));
         Print("SL ",SL," TP ",TP," OP ",OP);
         //}
        }
     }
   Print("------------------------------------------------------");
//--- request trade history
   HistorySelect(iTime(Symbol(),PERIOD_D1,0),TimeCurrent());
//--- create objects
   total=HistoryOrdersTotal();
   ticket=0;

   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryOrderGetTicket(i))>0)
        {
         int ID  =(int)HistoryOrderGetInteger(ticket,ORDER_POSITION_ID);
         int Magic=(int)HistoryOrderGetInteger(ticket,ORDER_MAGIC);
         int entry =(int)HistoryOrderGetInteger(ticket,ORDER_REASON);
         double SL =HistoryOrderGetDouble(ticket,ORDER_SL);
         double TP =HistoryOrderGetDouble(ticket,ORDER_TP);
         double OP =HistoryOrderGetDouble(ticket,ORDER_PRICE_OPEN);
         string Simbolo=HistoryOrderGetString(ticket,ORDER_SYMBOL);

         Print(Simbolo,"  ID ",ID," MAGIG ",Magic," REASON ",EnumToString(ENUM_ORDER_REASON(entry)));
         Print("SL ",SL," TP ",TP," OP ",OP);
         //}
        }
     }

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
