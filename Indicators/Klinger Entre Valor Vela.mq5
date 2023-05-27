//+------------------------------------------------------------------+
//|                                     Klinger Entre Valor Vela.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window 
#property indicator_buffers 2 
#property indicator_plots   2 
//--- plot Histogram 
#property indicator_label1  "Histogram" 
#property indicator_type1   DRAW_HISTOGRAM
#property indicator_color1  clrAqua 
#property indicator_style1  STYLE_SOLID 
#property indicator_width1  2 

#property indicator_label2  "Signal"
#property indicator_type2   DRAW_LINE
#property indicator_color2  clrYellow
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2 

double         HistogramBuffer[]; 

enum Modo_Visual{
Histogram=0,
Line=1,
};

input string Settings_Indicador="***Settings_Indicador***";   ///*---
input int PeriodoExponencial=14;
input Modo_Visual Modo=Histogram;
input string Settings_Klinger_Oscillator="***Settings_Klinger_Oscillator***";   ///*---
input uint     InpPeriodFast  =  34;   // Fast period
input uint     InpPeriodSlow  =  55;   // Slow period
input uint     InpPeriodSig   =  13;   // Signal period

int Klinger_Oscilator;
double Klinger_Bufffer[];
double BufferSignal[];

#include <MovingAverages.mqh>
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
SetIndexBuffer(0,HistogramBuffer,INDICATOR_DATA); 
PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
if(Modo==Line)
PlotIndexSetInteger(0,PLOT_DRAW_TYPE,DRAW_LINE);
ArrayResize(Klinger_Bufffer,2);
ArraySetAsSeries(Klinger_Bufffer,true);

SetIndexBuffer(1,BufferSignal,INDICATOR_DATA);

Klinger_Oscilator=iCustom(Symbol(),PERIOD_CURRENT,"Klinger_Oscillator",InpPeriodFast,InpPeriodSlow,InpPeriodSig);

IndicatorSetString(INDICATOR_SHORTNAME,"Klinger_Entre_Valor_Absoluto_Vela");
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
     }
   else
      Start=rates_total-1;

   for(int shift=Start; shift<rates_total; shift++)
     {
      HistogramBuffer[shift]=EMPTY_VALUE;
      CopyBuffer(Klinger_Oscilator,0,rates_total-1-shift,1,Klinger_Bufffer);
      double Divisor=MathAbs(open[shift]-close[shift]);
      if(Divisor==0)
      Divisor=0.00001;
      if(Modo==Histogram)
      HistogramBuffer[shift]=MathAbs(Klinger_Bufffer[0]/(Divisor));
      else
      HistogramBuffer[shift]=Klinger_Bufffer[0]/(Divisor);
      }
      
  if(ExponentialMAOnBuffer(rates_total,prev_calculated,0,PeriodoExponencial,HistogramBuffer,BufferSignal)==0)
     return 0;
   prevTime=time[rates_total-1];
   return(rates_total);
  }
//+------------------------------------------------------------------+
