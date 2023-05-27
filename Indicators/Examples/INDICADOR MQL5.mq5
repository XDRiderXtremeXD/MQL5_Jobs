//+------------------------------------------------------------------+
//|                                               INDICADOR MQL5.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.00"
#property description "Indicador para Calcular IP e IN"
#property indicator_separate_window
#property indicator_buffers 8
#property indicator_plots   2
#property indicator_label1  "IP"
#property indicator_type1   DRAW_FILLING
#property indicator_color1  clrDarkGreen,clrRed
#property indicator_width1  4
#property indicator_label2  "IN"
#property indicator_type2   DRAW_FILLING
#property indicator_color2  clrLightBlue,clrBlue
#property indicator_width2  4


//--- búfer para los índices del Histograma
double         IVN_HISTOGRAM[];
double         IVP_HISTOGRAM[];
//--- bufer para los indices RSI
input int PeriodoIndicador=20;
input ENUM_MA_METHOD Modo=MODE_EMA;
int IndicatorIVN;
int IndicatorIVP;
int IndicatorEMAIVN;
int IndicatorEMAIVP;
double EMA_Buffer_IVN[];
double EMA_Buffer_IVP[];
double Buffer_IVN[];
double Buffer_IVP[];
double VALORCERO[];
double VALORCERO2[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   SetIndexBuffer(0,IVP_HISTOGRAM,INDICATOR_DATA);
   SetIndexBuffer(1,VALORCERO,INDICATOR_DATA);
   SetIndexBuffer(2,IVN_HISTOGRAM,INDICATOR_DATA);
   SetIndexBuffer(3,VALORCERO2,INDICATOR_DATA);
   SetIndexBuffer(4,EMA_Buffer_IVN,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,EMA_Buffer_IVP,INDICATOR_CALCULATIONS);
   SetIndexBuffer(6,Buffer_IVN,INDICATOR_CALCULATIONS);
   SetIndexBuffer(7,Buffer_IVP,INDICATOR_CALCULATIONS);
   IndicatorSetString(INDICATOR_SHORTNAME,"INDICATOR_MQL5");
   IndicatorIVN=iCustom(Symbol(),PERIOD_CURRENT,"IVN_HISTOGRAM");
   IndicatorIVP=iCustom(Symbol(),PERIOD_CURRENT,"IVP_HISTOGRAM");
   IndicatorEMAIVN=iMA(Symbol(),PERIOD_CURRENT,PeriodoIndicador,0,Modo,IndicatorIVN);  
   IndicatorEMAIVP=iMA(Symbol(),PERIOD_CURRENT,PeriodoIndicador,0,Modo,IndicatorIVP);
   PlotIndexGetInteger(0,PLOT_DRAW_BEGIN,PeriodoIndicador+2);
   PlotIndexGetInteger(1,PLOT_DRAW_BEGIN,PeriodoIndicador+2);
   PlotIndexGetInteger(2,PLOT_DRAW_BEGIN,PeriodoIndicador+2);
   PlotIndexGetInteger(3,PLOT_DRAW_BEGIN,PeriodoIndicador+2);
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

  
   if(BarsCalculated(IndicatorIVN)<rates_total) return(0);
   if(BarsCalculated(IndicatorIVP)<rates_total) return(0);
   if(BarsCalculated(IndicatorEMAIVN)<rates_total) return(0);
   if(BarsCalculated(IndicatorEMAIVP)<rates_total) return(0);
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0) to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(IndicatorEMAIVN,0,0,to_copy,EMA_Buffer_IVN)<=0) return(0);
   if(CopyBuffer(IndicatorEMAIVP,0,0,to_copy,EMA_Buffer_IVP)<=0) return(0);
   if(CopyBuffer(IndicatorIVP,0,0,to_copy,Buffer_IVP)<=0) return(0);
   if(CopyBuffer(IndicatorIVN,0,0,to_copy,Buffer_IVN)<=0) return(0);
   int start=PeriodoIndicador+1;
   if(prev_calculated>0) start=prev_calculated-1; 
   for(int i=start; i<rates_total; i++)
     { 
      Comment(time[0]);
      VALORCERO2[i]=0;
      VALORCERO[i]=0;
      IVP_HISTOGRAM[i]=((Buffer_IVP[i]-EMA_Buffer_IVP[i])*100)/Buffer_IVP[i];
      IVN_HISTOGRAM[i]=((Buffer_IVN[i]-EMA_Buffer_IVN[i])*100)/Buffer_IVN[i];
     }
   //Comment("IVN_HISTOGRAM[0]= ",IVN_HISTOGRAM[rates_total-1]+"     IVP_HISTOGRAM[0]= ",IVP_HISTOGRAM[rates_total-1],"\n"+
     //      "IVN_HISTOGRAM[1]= ",IVN_HISTOGRAM[rates_total-2]+"     IVP_HISTOGRAM[1]= ",IVP_HISTOGRAM[rates_total-2],"\n"+
       //    "IVN_HISTOGRAM[2]= ",IVN_HISTOGRAM[rates_total-3]+"     IVP_HISTOGRAM[2]= ",IVP_HISTOGRAM[rates_total-3],"\n"+
         //  "IVN_HISTOGRAM[3]= ",IVN_HISTOGRAM[rates_total-4]+"     IVP_HISTOGRAM[3]= ",IVP_HISTOGRAM[rates_total-4]
           //);
   return(rates_total);
  }
//+------------------------------------------------------------------+