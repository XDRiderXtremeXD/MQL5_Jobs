//+------------------------------------------------------------------+
//|                                                       ATR MM.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window

#property indicator_buffers 2
#property indicator_plots   2
#property indicator_label1  "ATR"
#property indicator_label2  "MM"
#property indicator_type1   DRAW_LINE
#property indicator_type2   DRAW_LINE
#property indicator_color1  clrAqua
#property indicator_color2 clrOrange
#property indicator_style1  STYLE_SOLID
#property indicator_style2  STYLE_SOLID
#property indicator_width1  1
#property indicator_width2  1

double         atr_Buffer[];
double         mm_Buffer[];

input int ATR_Period=14;
input int MM_Period = 13;
input ENUM_MA_METHOD MM_Mode = MODE_EMA;

int ATR_Handle;
int MM_Handle;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   SetIndexBuffer(0,atr_Buffer,INDICATOR_DATA);
   SetIndexBuffer(1,mm_Buffer,INDICATOR_DATA);


   ArraySetAsSeries(atr_Buffer,true);
   ArraySetAsSeries(mm_Buffer,true);

//////---------------APLICAR RSI-------//////////
   ATR_Handle=iATR(NULL, 0,ATR_Period);
   MM_Handle=iMA(Symbol(),PERIOD_CURRENT,MM_Period,0,MM_Mode,ATR_Handle);
///////////////////////////////////////////////////
   IndicatorSetString(INDICATOR_SHORTNAME,"ATR("+IntegerToString(ATR_Period)+") - "+"MM ("+IntegerToString(MM_Period)+")");

//PlotIndexSetInteger(0,PLOT_SHOW_DATA,false);
   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,ATR_Period);

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

   if(BarsCalculated(ATR_Handle)<rates_total)
      return(0);
   if(BarsCalculated(MM_Handle)<rates_total)
      return(0);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(ATR_Handle,0,0,to_copy,atr_Buffer)<=0)
      return(0);

   if(CopyBuffer(MM_Handle,0,0,to_copy,mm_Buffer)<=0)
      return(0);

   return(rates_total);
  }
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Comment(" ");
  }
//+------------------------------------------------------------------+
