//+------------------------------------------------------------------+
//|                                            Posible Direccion.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window
#property indicator_buffers 3
#property indicator_plots 1

#property indicator_label1  "Color_Histogram"
#property indicator_type1   DRAW_COLOR_HISTOGRAM
//--- estableceremos 8 colores para colorear los segmentos (se guardan en un array especial)
#property indicator_color1  clrRed,clrLimeGreen,clrYellow,clrMagenta
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2


double         Color_HistogramBuffer[];
//--- búfer para los índices de colores
double         Color_HistogramColors[];
//--- bufer para los indices RSI
double         BufferTrend[];

///////variable para alternar
int IndicatorTrend;
///////////////////////

input int Evaluacion=10;
#resource "\\Indicators\\Trend direction and force.ex5"
input string S111__="-----------------------   Configuracion TREND FORCE--------------------";//----------------------------------------------------------------------------------------------------------------
input int    trendPeriod  = 7;      // Trend period
input double TriggerUp    =  0.05;   // Trigger up level
input double TriggerDown  = -0.05;   // Trigger down level
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {


   SetIndexBuffer(0,Color_HistogramBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,Color_HistogramColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,BufferTrend,INDICATOR_CALCULATIONS);

   ArraySetAsSeries(Color_HistogramBuffer,true);
   ArraySetAsSeries(Color_HistogramColors,true);
   ArraySetAsSeries(BufferTrend,true);

    
    IndicatorSetDouble(INDICATOR_MAXIMUM,1);
    
   IndicatorTrend=iCustom(NULL,PERIOD_CURRENT,"::Indicators\\Trend direction and force.ex5",trendPeriod,TriggerUp,TriggerDown);

//--- indicator buffers mapping

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

   if(BarsCalculated(IndicatorTrend)<rates_total)
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
   if(CopyBuffer(IndicatorTrend,2,0,to_copy,BufferTrend)<=0)
      return(0);
//---


   int start=0;
   if(prev_calculated>0)
      start=prev_calculated-1;

   for(int i=start; i<rates_total-14; i++)
     {
      if(BufferTrend[i+1]>TriggerUp)
        {
         Color_HistogramBuffer[i]=1;
         Color_HistogramColors[i]=1;
        }

      else
         if(BufferTrend[i+1]<TriggerDown)
           {
            Color_HistogramBuffer[i]=1;
            Color_HistogramColors[i]=0;
           }
         else
            if(BufferTrend[i+1]>=TriggerDown && BufferTrend[i+1]<=TriggerUp)
              {
               uint Dato=0;
               for(int j=0; j<Evaluacion; j++)
                 {
                  if(BufferTrend[i+1+j]>TriggerUp)
                    {
                     Dato=2;
                     break;
                    }
                  if(BufferTrend[i+1+j]<TriggerDown)
                    {
                     Dato=1;
                     break;
                    }
                 }
               if(Dato==0)
                 {
                  Color_HistogramBuffer[i]=1;
                  Color_HistogramColors[i]=2;
                 }
               else
                  if(Dato==1)
                    {
                     Color_HistogramBuffer[i]=1;
                     Color_HistogramColors[i]=1;
                    }
                  else
                    {
                     Color_HistogramBuffer[i]=1;
                     Color_HistogramColors[i]=0;
                    }

              }

     }
   return(rates_total);

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
