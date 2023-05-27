//+------------------------------------------------------------------+
//|                                        Momentun_Histogram_v1.mq5 |
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
double         MomentunBuffer[];

///////variable para alternar 
int IndicatorValue;
///////////////////////

//--- Variables para el RSI
input uint PeriodIndicator=14;
input double LevelIndicatorDown=99.50;
input double LevelIndicatorUp=100.50;
int IndicatorTrend;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   
   
   SetIndexBuffer(0,Color_HistogramBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,Color_HistogramColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,MomentunBuffer,INDICATOR_DATA);

   ArraySetAsSeries(Color_HistogramBuffer,true);
   ArraySetAsSeries(Color_HistogramColors,true);
   ArraySetAsSeries(MomentunBuffer,true);
   //////---------------APLICAR RSI-------//////////
   IndicatorValue=iMomentum(Symbol(),PERIOD_CURRENT,PeriodIndicator,PRICE_CLOSE);
   ///////////////////////////////////////////////////
   IndicatorSetString(INDICATOR_SHORTNAME,"Histogram_Momentun("+IntegerToString(PeriodIndicator,0,' ')+", Lup "+    
   DoubleToString(LevelIndicatorUp,2)+", Ldowm "+DoubleToString(LevelIndicatorDown,2)+")");
   
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
  
  if(BarsCalculated(IndicatorValue)<rates_total) return(0);
  
  int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0) to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(IndicatorValue,0,0,to_copy,MomentunBuffer)<=0) return(0);
  
   int start=0;
   if(prev_calculated>0) start=prev_calculated-1; 
   
   for(int i=start;i<rates_total-14;i++)
     {
     if(MomentunBuffer[i]>LevelIndicatorUp){
         IndicatorTrend=1;}
      if(MomentunBuffer[i]<LevelIndicatorDown)
         IndicatorTrend=-1;
      if(MomentunBuffer[i]>LevelIndicatorDown && MomentunBuffer[i]<LevelIndicatorUp)
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
        if(MomentunBuffer[i+1]<LevelIndicatorDown){ //SI EL INDICADOR RSI ESTA EN SOBRE COMPRA Y SALE DE ESE BUCLE 
         Color_HistogramBuffer[i]=1;
         Color_HistogramColors[i]=3;
        }
        else if(MomentunBuffer[i+1]>LevelIndicatorUp){ // SI EL INDICADOR RSI ESTAN SOBREVENTA Y SALE DE ESE BUCLE 
         Color_HistogramBuffer[i]=1;
         Color_HistogramColors[i]=2;
        }
        else{  
         Color_HistogramBuffer[i]=0;
        }
       }
     }
   return(rates_total);
  }