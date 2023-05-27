//+------------------------------------------------------------------+
//|                                         PRUEBA NOMBRE SECTOR.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0


double WITIGHER[];
int DefinitionWT=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   DefinitionWT=iCustom(Symbol(),PERIOD_CURRENT,"WT_SuperT-MA_v4.7",0,1,"-",0,0,0,20," ",false,110,2.6," ",1000);
   ArraySetAsSeries(WITIGHER,true);
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

   if(BarsCalculated(DefinitionWT)<rates_total)
      return(0);
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(DefinitionWT,3,0,to_copy,WITIGHER)<=0)
      return(0);
      
    static bool Angelo=true;
    for(int i=0;i<10 && Angelo==true;i++){
    Print(i," ",WITIGHER[i]);
    }
    Angelo=false;
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |