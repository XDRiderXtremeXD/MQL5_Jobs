//+------------------------------------------------------------------+
//|                                             EST_Histogram_v1.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//BUFFER 1 PARA USARLO COMO SEÑAL VALORES 2 Y 3 SEÑALES VENTA Y COMPRA RESPECTIVAMENTE

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.00"

#property description "Indicador para Dibujer EST en Histograma"

#property indicator_separate_window
#property indicator_buffers 3
#property indicator_plots   1
#property indicator_label1  "Color_Histogram"
#property indicator_type1   DRAW_COLOR_HISTOGRAM
#property indicator_color1  clrRed,clrDarkGreen,clrOrange,clrLimeGreen
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

//--- búfer para los índices del Histograma
double         Color_HistogramBuffer[];
//--- búfer para los índices de colores
double         Color_HistogramColors[];
//--- bufer para los indices RSI
double         ESTBuffer[];

///////Handle del indicador
int IndicatorValue;
///////////////////////

//--- Variables para el EST
input uint PeriodK=5;
input uint PeriodD=3;
input uint PeriodSlowing=3;
input ENUM_MA_METHOD Mode_MA=MODE_SMA;
input ENUM_STO_PRICE Mode_STO=STO_LOWHIGH;
input uint LevelIndicatorDown=20;
input uint LevelIndicatorUp=80;
int IndicatorTrend;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {


   SetIndexBuffer(0,Color_HistogramBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,Color_HistogramColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,ESTBuffer,INDICATOR_DATA);

//////---------------APLICAR EST-------//////////
   IndicatorValue=iStochastic(Symbol(),PERIOD_CURRENT,PeriodK,PeriodD,PeriodSlowing,Mode_MA,Mode_STO);
///////////////////////////////////////////////////
   IndicatorSetString(INDICATOR_SHORTNAME,"Histogram_EST("+IntegerToString(PeriodK,0,' ')+" "+
                      IntegerToString(PeriodD,0,' ')+" "+
                      IntegerToString(PeriodSlowing,0,' ')+")"
                     );

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
////// NAIN LINE............
   if(CopyBuffer(IndicatorValue,MAIN_LINE,0,to_copy,ESTBuffer)<=0)
      return(0);

   int start=5;

   for(int i=start; i<rates_total; i++)
     {
      if(ESTBuffer[i]>LevelIndicatorUp)
        {
         IndicatorTrend=1;
        }
      if(ESTBuffer[i]<LevelIndicatorDown)
         IndicatorTrend=-1;
      if(ESTBuffer[i]>LevelIndicatorDown && ESTBuffer[i]<LevelIndicatorUp)
         IndicatorTrend=0;
      //---
      if(IndicatorTrend>0)
        {
         Color_HistogramBuffer[i]=1;
         Color_HistogramColors[i]=0;
        }
      //---
      if(IndicatorTrend<0)
        {
         Color_HistogramBuffer[i]=1;
         Color_HistogramColors[i]=1;
        }
      if(IndicatorTrend==0)
        {
         if(ESTBuffer[i-1]<LevelIndicatorDown)  //SI EL INDICADOR EST ESTA EN SOBRE COMPRA Y SALE DE ESA ZONA
           {
            Color_HistogramBuffer[i]=1;
            Color_HistogramColors[i]=3;
           }
         else
            if(ESTBuffer[i-1]>LevelIndicatorUp)  // SI EL INDICADOR EST ESTAN SOBREVENTA Y SALE DE ESA ZONA
              {
               Color_HistogramBuffer[i]=1;
               Color_HistogramColors[i]=2;
              }
            else
              {
               Color_HistogramBuffer[i]=0;
              }
        }
     }

   return(rates_total);
  }
//+------------------------------------------------------------------+
