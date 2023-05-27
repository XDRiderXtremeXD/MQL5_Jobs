//+------------------------------------------------------------------+
//|                                                RSI_Histogram.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
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
input uint PeriodIndicator=14;
input ENUM_APPLIED_PRICE ApliedPrice=PRICE_CLOSE;
input uint LevelIndicatorDown=30;
input uint LevelIndicatorUp=70;

int IndicatorTrend;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   
   
   SetIndexBuffer(0,Color_HistogramBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,Color_HistogramColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,RSIBuffer,INDICATOR_DATA);
   
   
   ArraySetAsSeries(Color_HistogramBuffer,true);
   ArraySetAsSeries(Color_HistogramColors,true);
   ArraySetAsSeries(RSIBuffer,true);
   
   //////---------------APLICAR RSI-------//////////
   IndicatorValue=iRSI(Symbol(),PERIOD_CURRENT,PeriodIndicator,ApliedPrice);
   ///////////////////////////////////////////////////
   IndicatorSetString(INDICATOR_SHORTNAME,"Histogram_RSI("+IntegerToString(PeriodIndicator,0,' ')+")");
   
   PlotIndexSetInteger(0,PLOT_SHOW_DATA,false); 
   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,PeriodIndicator);
   IndicatorSetDouble(INDICATOR_MAXIMUM,1);
   IndicatorSetDouble(INDICATOR_MINIMUM,0);
   
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
   if(CopyBuffer(IndicatorValue,0,0,to_copy,RSIBuffer)<=0) return(0);
  
   int end=rates_total;
   if(prev_calculated>0) end=1; 
   
   for(int i=0;i<end;i++)
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
        if(RSIBuffer[i+1]<LevelIndicatorDown){ //SI EL INDICADOR RSI ESTA EN SOBRE COMPRA Y SALE DE ESA ZONA
         Color_HistogramBuffer[i]=1;
         Color_HistogramColors[i]=3;
        }
        else if(RSIBuffer[i+1]>LevelIndicatorUp){ // SI EL INDICADOR RSI ESTAN SOBREVENTA Y SALE DE ESA ZONA
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