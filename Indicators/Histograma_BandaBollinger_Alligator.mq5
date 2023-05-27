//+------------------------------------------------------------------+
//|                          Histograma_BandaBollinger_Alligator.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window 
#property indicator_buffers 3
#property indicator_plots   2 
//--- plot Histogram 
#property indicator_label1  "Histogram" 
#property indicator_type1   DRAW_COLOR_HISTOGRAM 
#property indicator_color1  clrRed,clrGreen
#property indicator_style1  STYLE_SOLID 
#property indicator_width1  2 

#property indicator_label2  "Media"
#property indicator_type2   DRAW_LINE
#property indicator_color2  clrYellow
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2 

double         HistogramBuffer[]; 
double         ColorBufferHistogram[]; 

input string Settings_Media="***Settings_Media***";   ///*---
input int PeriodoExponencial=14;
input string Settings_Alligator="***Settings_Alligator***"; ///*---
input int Jaw=13;
input int Jaw_Shift=8;
input int Teeth=8;
input int Teeth_Shift=5;
input int Lips=5;
input int Lips_Shift=3;
input ENUM_MA_METHOD Mode_Alligator=MODE_SMMA;
input ENUM_APPLIED_PRICE AppliedPrice_Alligator=PRICE_MEDIAN;
input string Settings_Bollinger="***Settings_Bollinger***";  ///*---
input int Bollinger_1_Periodo=20;
input int Bollinger_1_Shift=0;
input int Bollinger_1_Desviation=7;

int Alligator;
int Bollinger;
double Bollinger_Bufffer_UP[];
double Bollinger_Bufffer_DN[];

double Media[];

#include <MovingAverages.mqh>
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
SetIndexBuffer(0,HistogramBuffer,INDICATOR_DATA); 
SetIndexBuffer(1,ColorBufferHistogram,INDICATOR_COLOR_INDEX); 

PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

SetIndexBuffer(2,Media,INDICATOR_DATA);
PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,EMPTY_VALUE);

ArrayResize(Bollinger_Bufffer_DN,3);
ArrayResize(Bollinger_Bufffer_UP,3);
ArraySetAsSeries(Bollinger_Bufffer_DN,true);
ArraySetAsSeries(Bollinger_Bufffer_UP,true);

Alligator=iAlligator(Symbol(),PERIOD_CURRENT,Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator);
Bollinger=iBands(Symbol(),PERIOD_CURRENT,Bollinger_1_Periodo,Bollinger_1_Shift,Bollinger_1_Desviation,Alligator);

IndicatorSetString(INDICATOR_SHORTNAME,"Histograma BandaBollinger Alligator");
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
   
   static datetime prevTime=0;
   if(prevTime==time[rates_total-1])
      return(rates_total);

   int Start=0;
   if(prev_calculated==0)
     {
      Start=100;
      ArrayInitialize(HistogramBuffer,EMPTY_VALUE);
      ArrayInitialize(Media,EMPTY_VALUE);
     }
   else
      Start=rates_total-1;

   for(int shift=Start; shift<rates_total; shift++)
     {
      HistogramBuffer[shift]=EMPTY_VALUE;
      CopyBuffer(Bollinger,1,rates_total-1-shift,2,Bollinger_Bufffer_UP);
      CopyBuffer(Bollinger,2,rates_total-1-shift,2,Bollinger_Bufffer_DN);
      HistogramBuffer[shift]=Bollinger_Bufffer_UP[0]-Bollinger_Bufffer_DN[0];
      if(HistogramBuffer[shift-1]<HistogramBuffer[shift])
      ColorBufferHistogram[shift]=1;
      else
      ColorBufferHistogram[shift]=0;
      }
  
  if(ExponentialMAOnBuffer(rates_total,prev_calculated,0,PeriodoExponencial,HistogramBuffer,Media)==0)
     return 0;
 
   prevTime=time[rates_total-1];
   return(rates_total);
  }
//+------------------------------------------------------------------+
