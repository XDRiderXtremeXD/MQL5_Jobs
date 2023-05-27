//+------------------------------------------------------------------+
//|                                    DRAW_ARROW_HAROLD_P2D_RSI.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"


#property indicator_chart_window
#property indicator_buffers 2
#property indicator_plots   2
#property indicator_label1  "ARROW_BUY"
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1
#property indicator_color1  clrMagenta
#property indicator_label2  "ARROW_SELL"
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1
#property indicator_color2  clrYellow

double      ARROW_SIGNAL_BUY[];
double      ARROW_SIGNAL_SELL[];
double      BUFFER_HAROLD[];

input int PeriodoRSI=2;
input ENUM_APPLIED_PRICE Price_Applied_RSI=PRICE_CLOSE;
input int levelup=90;
input int leveldown=10;

int HANDLE_P2_RSI;
int PeriodoMaximo;

int OnInit()
  {
   SetIndexBuffer(0,ARROW_SIGNAL_BUY,INDICATOR_DATA);
   SetIndexBuffer(1,ARROW_SIGNAL_SELL,INDICATOR_DATA);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);
   PlotIndexSetInteger(0,PLOT_ARROW,172);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,0);
   PlotIndexSetInteger(1,PLOT_ARROW,172);

   PeriodoMaximo=PeriodoRSI;
//---
   HANDLE_P2_RSI=iCustom(Symbol(),PERIOD_CURRENT,"HAROLD P2D RSI",PeriodoRSI,Price_Applied_RSI,leveldown,levelup);

   IndicatorSetString(INDICATOR_SHORTNAME,"HAROLD P2D RSI");
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
   static datetime prevtime=1;
   if(prevtime==time[0])
     {
      return(rates_total);
     }
   prevtime=time[rates_total-1];

   if(prev_calculated==0)
     {
      int copied1=CopyBuffer(HANDLE_P2_RSI,1,0,rates_total,BUFFER_HAROLD);
     }
   else 
     {
      int to_copy=rates_total-prev_calculated;
      if(to_copy==0)
         to_copy=1;
      int copied1=CopyBuffer(HANDLE_P2_RSI,1,0,to_copy,BUFFER_HAROLD);
     }

   int start=PeriodoRSI+10;
   if(prev_calculated>0)
      start=prev_calculated-1;
   for(int i=start; i<rates_total-1; i++)
     {
      ARROW_SIGNAL_BUY[i]=0;
      ARROW_SIGNAL_SELL[i]=0;
      if(BUFFER_HAROLD[i]!=BUFFER_HAROLD[i-1])
        {
         if(BUFFER_HAROLD[i]==0)
            ARROW_SIGNAL_BUY[i]=high[i];
         else
            ARROW_SIGNAL_SELL[i]=low[i];
        }
     }
   return(rates_total);
  }