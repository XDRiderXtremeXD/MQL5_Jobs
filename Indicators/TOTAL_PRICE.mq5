//+------------------------------------------------------------------+
//|                                                  TOTAL_PRICE.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.00"

#property description "Indicador para Dibujar TOTALPRICE"

#property indicator_separate_window
#property indicator_buffers 1
#property indicator_plots   1
#property indicator_label1  "LINEA_RED"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2


//--- búfer para los índices del Histograma
double         HISTOGRAM_TOTALPRICE[];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {


   SetIndexBuffer(0,HISTOGRAM_TOTALPRICE,INDICATOR_DATA);
   IndicatorSetString(INDICATOR_SHORTNAME,"IVP_HISTOGRAM");
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
      
   int start=1;
   if(prev_calculated>0) start=prev_calculated-1; 

   for(int i=start; i<rates_total; i++)
     { 
     HISTOGRAM_TOTALPRICE[i]=(close[i]+open[i]+low[i]+high[i])/4;
     }

   return(rates_total);
  }
//+------------------------------------------------------------------+
