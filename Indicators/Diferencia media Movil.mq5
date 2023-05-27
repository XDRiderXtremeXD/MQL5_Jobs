//+------------------------------------------------------------------+
//|                                       Diferencia media Movil.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Copyright 2011, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
 
#property description "Indicador para Dibujer RSI en Histograma"
 
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
double         MABuffer[];

///////variable para alternar 
int IndicatorValue;
///////////////////////

input uint PeriodIndicator=8;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   
   
   SetIndexBuffer(0,Color_HistogramBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,Color_HistogramColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,MABuffer,INDICATOR_DATA);

   ArraySetAsSeries(Color_HistogramBuffer,true);
   ArraySetAsSeries(Color_HistogramColors,true);
   ArraySetAsSeries(MABuffer,true);
   //////---------------APLICAR RSI-------//////////
   IndicatorValue=iMA(Symbol(),PERIOD_CURRENT,PeriodIndicator,0,MODE_SMA,PRICE_CLOSE);
   ///////////////////////////////////////////////////
   IndicatorSetString(INDICATOR_SHORTNAME,"Histogram_MA_Diference("+IntegerToString(PeriodIndicator,0,' ')+")");
   
   //PlotIndexSetInteger(0,PLOT_SHOW_DATA,false); 
   
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
  
  if(BarsCalculated(IndicatorValue)<rates_total) return(0);
  
  int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0) to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(IndicatorValue,0,0,to_copy,MABuffer)<=0) return(0);
   
   
   Comment(MABuffer[2]," ",MABuffer[1]," ",MABuffer[0] );
  
  int limit=rates_total-prev_calculated;
  for(int i=0;i<limit;i++){
  MABuffer[i+1]=NormalizeDouble(MABuffer[i+1],Digits());
  Color_HistogramBuffer[i]=MathAbs(MABuffer[i]-MABuffer[i+1]);
  Color_HistogramColors[i]=3;
  }
  
  /* int start=0;
   if(prev_calculated>0) start=prev_calculated-1; 
   
   for(int i=start;i<rates_total-14;i++)
     {
     if(RSIBuffer[i]>LevelIndicatorUp){
         IndicatorTrend=1;}
      if(RSIBuffer[i]<LevelIndicatorDown)
         IndicatorTrend=-1;
      if(RSIBuffer[i]>LevelIndicatorDown && RSIBuffer[i]<LevelIndicatorUp)
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
       if(IndicatorTrend==0){
        if(RSIBuffer[i+1]<LevelIndicatorDown){ //SI EL INDICADOR RSI ESTA EN SOBRE COMPRA Y SALE DE ESE BUCLE 
         Color_HistogramBuffer[i]=1;
         Color_HistogramColors[i]=3;
        }
        else if(RSIBuffer[i+1]>LevelIndicatorUp){ // SI EL INDICADOR RSI ESTAN SOBREVENTA Y SALE DE ESE BUCLE 
         Color_HistogramBuffer[i]=1;
         Color_HistogramColors[i]=2;
        }
        else{  
         Color_HistogramBuffer[i]=0;
        }
       }
     }*/
   return(rates_total);
  }