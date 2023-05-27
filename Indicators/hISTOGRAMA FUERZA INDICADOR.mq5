//+------------------------------------------------------------------+
//|                                  hISTOGRAMA FUERZA INDICADOR.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//BUFFER 1 PARA USARLO COMO SEÑAL VALORES 2 Y 3 SEÑALES VENTA Y COMPRA RESPECTIVAMENTE

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.00"

#property description "Indicador para Dibujar RSI en Histograma"

#property indicator_separate_window
#property indicator_buffers 3
#property indicator_plots   1
#property indicator_label1  "Color_Histogram"
#property indicator_type1   DRAW_COLOR_HISTOGRAM
#property indicator_color1  clrRed,clrDarkGreen,clrOrange,clrLimeGreen
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

//--- búfer para los índices de Histogram
double         Color_HistogramBuffer[];
//--- búfer para los índices de colores
double         Color_HistogramColors[];
//--- bufer para los indices RSI
double         RSIBuffer[];

///////variable para alternar
int IndicatorValue;
///////////////////////

//--- Variables para el RSI
input int Period_MA=50;
input int Shift_MA=PRICE_CLOSE;
input ENUM_APPLIED_PRICE APP_MA=PRICE_CLOSE;
input ENUM_MA_METHOD MODE_MA=MODE_SMA;

int IndicatorTrend;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {


   SetIndexBuffer(0,Color_HistogramBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,Color_HistogramColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,RSIBuffer,INDICATOR_DATA);
   
   ArraySetAsSeries(RSIBuffer,false);
//////---------------APLICAR RSI-------//////////
   IndicatorValue=iMA(NULL,PERIOD_CURRENT,Period_MA,Shift_MA,MODE_MA,APP_MA);
///////////////////////////////////////////////////
   IndicatorSetString(INDICATOR_SHORTNAME,"Histogram_MA_Forece("+IntegerToString(Period_MA,0,' ')+")");

   PlotIndexSetInteger(0,PLOT_SHOW_DATA,false);

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
   if(CopyBuffer(IndicatorValue,0,0,to_copy,RSIBuffer)<=0)
      return(0);

   int start=5;
   if(prev_calculated>0)
      start=rates_total-1;

   for(int i=start; i<rates_total-1; i++)
     {
      Color_HistogramBuffer[i]=MathAbs(RSIBuffer[i]-RSIBuffer[i-1]);
      Color_HistogramColors[i]=3;
      
       Color_HistogramBuffer[rates_total-1]=0;


     }

   return(rates_total);
  }
//+------------------------------------------------------------------+
