//+------------------------------------------------------------------+
//|                                                    EMA_COLOR.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.00"

#property description "Indicador para Dibujar EMA"

#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots   1
#property indicator_label1  "Color_EMA"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

//--- búfer para los índices de Histogram
double         EMA[];
///////variable para alternar
///////////////////////

//--- Variables para el RSI
input int Periodo=14;
input int Shift_MA=0;
input ENUM_APPLIED_PRICE APP_MA=PRICE_CLOSE;
input ENUM_MA_METHOD MODE_MA=MODE_SMA;
input string Label="EMA";
input int Grosor=1;
input ENUM_LINE_STYLE Estilo=STYLE_SOLID;
input color Color=clrRed;

int IndicatorValue=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {


   SetIndexBuffer(0,EMA,INDICATOR_DATA);
//////---------------APLICAR ema-------//////////
   IndicatorValue=iMA(NULL,PERIOD_CURRENT,Periodo,Shift_MA,MODE_MA,APP_MA);

   PlotIndexSetInteger(0,PLOT_LINE_WIDTH,Grosor);
   PlotIndexSetInteger(0,PLOT_LINE_STYLE,Estilo);
   PlotIndexSetInteger(0,PLOT_LINE_COLOR,Color);
   PlotIndexSetString(0,PLOT_LABEL,Label);

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

   if(BarsCalculated(IndicatorValue)<rates_total)
      return(0);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(IndicatorValue,0,0,to_copy,EMA)<=0)
      return(0);

   return(rates_total);
  }
//+------------------------------------------------------------------+
