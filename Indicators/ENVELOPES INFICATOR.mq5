//+------------------------------------------------------------------+
//|                                          ENVELOPES INFICATOR.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2011, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
 
#property description "Indicador para Dibujar Envelopes Break en Histograma"
 
#property indicator_separate_window
#property indicator_buffers 6
#property indicator_plots   1
//--- parámetros input
//--- plot Color_Histogram
#property indicator_label1  "Color_Histogram2"
#property indicator_type1   DRAW_COLOR_HISTOGRAM
//--- estableceremos 8 colores para colorear los segmentos (se guardan en un array especial)
#property indicator_color1  clrRed,clrDarkGreen,clrOrange,clrLimeGreen
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

double         Color_HistogramBuffer[];
//--- búfer para los índices de colores
double         Color_HistogramColors[];
//--- bufer para los indices RSI
double         EnvelopesPlus[];
double         EnvelopesMinus[];
double         MovingMA[];
double         Estocastico[];

///////variable para alternar 
int IndicatorValue;
int IndicatorValueMA;
int IndicatorValueEstocastico;
///////////////////////

//--- Variables para el RSI
input int PeriodIndicator=14;
input uint ShiftIndicator=0;
input double DesviationIndicator=0.050;
input ENUM_MA_METHOD MethodMAIndicator=MODE_SMA;
input ENUM_APPLIED_PRICE PriceAppliedIndicator=PRICE_CLOSE;

input int PeriodIndicatorMA=25;
input uint ShiftIndicatorMA=0;
input ENUM_MA_METHOD MethodMAIndicatorMA=MODE_SMA;
input ENUM_APPLIED_PRICE PriceAppliedIndicatorMA=PRICE_CLOSE;
int IndicatorTrend;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   
   if(PERIOD_CURRENT>PERIOD_H1){
   return(INIT_FAILED);
   }
   
   SetIndexBuffer(0,Color_HistogramBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,Color_HistogramColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,EnvelopesPlus,INDICATOR_DATA);
   SetIndexBuffer(3,EnvelopesMinus,INDICATOR_DATA);
   SetIndexBuffer(4,MovingMA,INDICATOR_DATA);
   SetIndexBuffer(5,Estocastico,INDICATOR_DATA);

   ArraySetAsSeries(Color_HistogramBuffer,true);
   ArraySetAsSeries(Color_HistogramColors,true);
   
   ArraySetAsSeries(EnvelopesPlus,true);
   ArraySetAsSeries(EnvelopesMinus,true);
   ArraySetAsSeries(MovingMA,true);
    ArraySetAsSeries(Estocastico,true);
   
   //////---------------APLICAR RSI-------//////////
   IndicatorValue=iEnvelopes(Symbol(),PERIOD_CURRENT,PeriodIndicator,ShiftIndicator,MethodMAIndicator,PriceAppliedIndicator,DesviationIndicator);
   IndicatorValueMA=iMA(Symbol(),PERIOD_CURRENT,PeriodIndicatorMA,ShiftIndicatorMA,MethodMAIndicatorMA,PriceAppliedIndicatorMA);
   IndicatorValueEstocastico=iStochastic(Symbol(),PERIOD_CURRENT,5,3,3,MODE_SMA,STO_LOWHIGH);
   ///////////////////////////////////////////////////
   IndicatorSetString(INDICATOR_SHORTNAME,"Histogram_Envelopes_Break("+IntegerToString(PeriodIndicator,0,' ')+")");
   
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
  
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(close,true);
   ArraySetAsSeries(open,true);
   ArraySetAsSeries(time,true);
    
   MqlDateTime Tiempo;
   
  
  if(BarsCalculated(IndicatorValue)<rates_total) return(0);
  
  int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0) to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(IndicatorValue,0,0,to_copy,EnvelopesPlus)<=0) return(0);
   
   
   if(prev_calculated>rates_total || prev_calculated<=0) to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(IndicatorValue,1,0,to_copy,EnvelopesMinus)<=0) return(0);
   
   
   if(prev_calculated>rates_total || prev_calculated<=0) to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(IndicatorValueMA,0,0,to_copy,MovingMA)<=0) return(0);
   
   
   if(prev_calculated>rates_total || prev_calculated<=0) to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(IndicatorValueEstocastico,0,0,to_copy,Estocastico)<=0) return(0);
   
   
   
  
   int start=0;
   if(prev_calculated>0) start=prev_calculated-1; 
   
   for(int i=start;i<rates_total-PeriodIndicator-1;i++)
     {
     TimeToStruct(time[i],Tiempo);
     
     
     if(EnvelopesPlus[i]<close[i] && EnvelopesPlus[i+1]>open[i+1] && EnvelopesPlus[i+1]>close[i+1] && Tiempo.hour>5 && Tiempo.hour <20 && Estocastico[i]>20 && (Estocastico[i+1]<20 || Estocastico[i+2]<20 || Estocastico[i+3]<20)){//&& close[i]>MovingMA[i]){
     Color_HistogramBuffer[i]=1;
     Color_HistogramColors[i]=3;
     }
     else if(EnvelopesMinus[i]>close[i] && EnvelopesMinus[i+1]<open[i+1] && EnvelopesMinus[i+1]<close[i+1] && Tiempo.hour>5 && Tiempo.hour <20 && Estocastico[i]<80 && (Estocastico[i+1]>80 || Estocastico[i+2]>80 || Estocastico[i+3]>80)){//&& close[i]<MovingMA[i] ){
     Color_HistogramBuffer[i]=1;
     Color_HistogramColors[i]=0;
     }
     
     else{
     Color_HistogramBuffer[i]=0;
     }
     }
   return(rates_total);
  }
  
  
  
  
  
  