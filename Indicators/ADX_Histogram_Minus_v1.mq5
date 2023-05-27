//+------------------------------------------------------------------+
//|                                       ADX_Histogram_Minus_v1.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2011, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#property description "Indicador para Dibujer EST en Histograma"

#property indicator_separate_window
#property indicator_buffers 3
#property indicator_plots   1
//--- parámetros input
//--- plot Color_Histogram
#property indicator_label1  "Color_Histogram"
#property indicator_type1   DRAW_COLOR_HISTOGRAM
//--- estableceremos 8 colores para colorear los segmentos (se guardan en un array especial)
#property indicator_color1  clrRed,clrDarkGreen,clrOrange,clrLimeGreen
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

double         Color_HistogramBuffer[];
//--- búfer para los índices de colores
double         Color_HistogramColors[];
//--- bufer para los indices RSI
double         ADXBufferMinus[];

///////variable para alternar
int IndicatorValue;
///////////////////////

//--- Variables para el ADX
input uint PeriodIndicator=7;

input uint LevelIndicator=40;
int IndicatorTrend;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {


   SetIndexBuffer(0,Color_HistogramBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,Color_HistogramColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,ADXBufferMinus,INDICATOR_DATA);

   ArraySetAsSeries(Color_HistogramBuffer,false);
   ArraySetAsSeries(Color_HistogramColors,false);
   ArraySetAsSeries(ADXBufferMinus,false);
//////---------------APLICAR RSI-------//////////
   IndicatorValue=iADX(Symbol(),PERIOD_CURRENT,PeriodIndicator);
///////////////////////////////////////////////////
   IndicatorSetString(INDICATOR_SHORTNAME,"Histogram_ADX_Minus("+IntegerToString(PeriodIndicator,3,' ')+")");

   PlotIndexSetInteger(0,PLOT_SHOW_DATA,false);
//IndicatorSetString(INDICATOR_SHORTNAME," ");

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
////// o SIGNAL_LINE............
   if(CopyBuffer(IndicatorValue,MINUSDI_LINE,0,to_copy,ADXBufferMinus)<=0)
      return(0);

   int start=0;
   if(prev_calculated>0)
      start=rates_total-1;

   for(int i=start; i<rates_total; i++)
     {
      if(ADXBufferMinus[i]>LevelIndicator)
        {
         Color_HistogramBuffer[i]=1;
         Color_HistogramColors[i]=1;
        }
      else
        {
         Color_HistogramBuffer[i]=0;
         Color_HistogramColors[i]=0;
        }

     }
   return(rates_total);
  }
//+------------------------------------------------------------------+
