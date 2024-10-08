//+------------------------------------------------------------------+
//|                                   Diferencia Emas Histograma.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//BUFFER 1 PARA USARLO COMO SEÑAL VALORES 2 Y 3 SEÑALES VENTA Y COMPRA RESPECTIVAMENTE

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.00"

#property description "Indicador para Dibujar RSI en Histograma"

#property indicator_separate_window
#property indicator_buffers 4
#property indicator_plots   1
#property indicator_label1  "Color_Histogram"
#property indicator_type1   DRAW_COLOR_HISTOGRAM
#property indicator_color1  clrRed,clrGreen
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

//--- búfer para los índices de Histogram
double         Color_HistogramBuffer[];
//--- búfer para los índices de colores
double         Color_HistogramColors[];
//--- bufer para los indices RSI
double         EMAFAST_Buffer[];

double         EMASLOW_Buffer[];

///////variable para alternar
int IndicatorValue;
///////////////////////

input string S6_="=== CONFIGURACION MA =======================================================================================";//=======================================================================================
input int Period_MA_SLOW=150;
input int Period_MA=50;
input int Shift_MA=0;
input ENUM_APPLIED_PRICE APP_MA=PRICE_CLOSE;
input ENUM_MA_METHOD MODE_MA=MODE_SMA;
int MA=0,MASLOW=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {


   SetIndexBuffer(0,Color_HistogramBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,Color_HistogramColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,EMAFAST_Buffer,INDICATOR_DATA);
   SetIndexBuffer(3,EMASLOW_Buffer,INDICATOR_DATA);

   MA=iMA(NULL,PERIOD_CURRENT,Period_MA,Shift_MA,MODE_MA,APP_MA);
   MASLOW=iMA(NULL,PERIOD_CURRENT,Period_MA_SLOW,Shift_MA,MODE_MA,APP_MA);
///////////////////////////////////////////////////
   IndicatorSetString(INDICATOR_SHORTNAME,"Histogram_RSI("+IntegerToString(Period_MA_SLOW)+" con "+IntegerToString(Period_MA)+")");

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

   if(BarsCalculated(MA)<rates_total)
      return(0);

   if(BarsCalculated(MASLOW)<rates_total)
      return(0);


   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(MA,0,0,to_copy,EMAFAST_Buffer)<=0)
      return(0);

   if(CopyBuffer(MASLOW,0,0,to_copy,EMASLOW_Buffer)<=0)
      return(0);

   int start=5;
   if(prev_calculated>0)
      start=prev_calculated-1;

   for(int i=start; i<rates_total; i++)
     {
     double Diferencia=MathAbs(EMAFAST_Buffer[i]-EMASLOW_Buffer[i]); 
     
      Color_HistogramBuffer[i]=Diferencia;
      
      if(EMAFAST_Buffer[i]>EMASLOW_Buffer[i])
      Color_HistogramColors[i]=1;
      else
      Color_HistogramColors[i]=0;


     }
   return(rates_total);
  }
//+------------------------------------------------------------------+
