//+------------------------------------------------------------------+
//|                           Estrategia Estocastico RSI con ADX.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2011, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#property description "Indicador para Dibujer EST en Histograma"

#property indicator_separate_window
#property indicator_buffers 6
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
double         ESTBuffer[];
double         RSIBuffer[];
double         ADXPlusBuffer[];
double         ADXMinusBuffer[];

///////variable para alternar
int IndicatorValueEST;
int IndicatorValueRSI;
int IndicatorValueADX;
///////////////////////

//--- Variables para el RSI
input uint PeriodESTK=5;
input uint PeriodESTD=3;
input uint PeriodESTSlowing=3;
input uint PeriodRSI=14;
input uint PeriodADX=7;

input uint LevelIndicatorDownEST=20;
input uint LevelIndicatorUpEST=80;
input uint LevelIndicatorDownRSI=30;
input uint LevelIndicatorUpRSI=70;
input uint LevelIndicatorADX=40;

int PeriodoCalculo=0;
int PeriodoCalculoFor[5];


int IndicatorTrend;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  { 
   PeriodoCalculoFor[0]=int (PeriodESTK);
   PeriodoCalculoFor[1]=int (PeriodESTD);
   PeriodoCalculoFor[2]=int (PeriodESTSlowing);
   PeriodoCalculoFor[3]=int (PeriodRSI);
   PeriodoCalculoFor[4]=int (PeriodADX);
   
   for(int i=0;i<5;i++){
   if(PeriodoCalculo<PeriodoCalculoFor[i]){
   PeriodoCalculo=PeriodoCalculoFor[i];
   }
   }
   
  
   SetIndexBuffer(0,Color_HistogramBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,Color_HistogramColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,ESTBuffer,INDICATOR_DATA);
   SetIndexBuffer(3,RSIBuffer,INDICATOR_DATA);
   SetIndexBuffer(4,ADXPlusBuffer,INDICATOR_DATA);
   SetIndexBuffer(5,ADXMinusBuffer,INDICATOR_DATA);

   ArraySetAsSeries(Color_HistogramBuffer,true);
   ArraySetAsSeries(Color_HistogramColors,true);
   ArraySetAsSeries(ESTBuffer,true);
   ArraySetAsSeries(RSIBuffer,true);
   ArraySetAsSeries(ADXPlusBuffer,true);
   ArraySetAsSeries(ADXMinusBuffer,true);

//////---------------APLICAR RSI-------//////////
   IndicatorValueEST=iStochastic(Symbol(),PERIOD_CURRENT,PeriodESTK,PeriodESTD,PeriodESTSlowing,MODE_SMA,STO_LOWHIGH);
   IndicatorValueRSI=iRSI(Symbol(),PERIOD_CURRENT,PeriodRSI,PRICE_CLOSE);
   IndicatorValueADX=iADX(Symbol(),PERIOD_CURRENT,PeriodADX);
///////////////////////////////////////////////////
   IndicatorSetString(INDICATOR_SHORTNAME,"Histogram_EST_ADX_RSI_Estrategia("+IntegerToString(PeriodESTK,0,' ')+" "+
                      IntegerToString(PeriodESTD,0,' ')+" "+
                      IntegerToString(PeriodESTSlowing,0,' ')+" "+
                      IntegerToString(PeriodADX,0,' ')+" "+
                      IntegerToString(PeriodRSI,0,' ')+" "+
                      ")"
                     );

   PlotIndexSetInteger(0,PLOT_SHOW_DATA,false);
//IndicatorSetString(INDICATOR_SHORTNAME," ");

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

   if(BarsCalculated(IndicatorValueEST)<rates_total) //BASTA CON UNO PARA HACER EL CALCULO
      return(0);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
////// o SIGNAL_LINE............
   if(CopyBuffer(IndicatorValueEST,MAIN_LINE,0,to_copy,ESTBuffer)<=0)
      return(0);
   if(CopyBuffer(IndicatorValueRSI,0,0,to_copy,RSIBuffer)<=0)
      return(0);
   if(CopyBuffer(IndicatorValueADX,PLUSDI_LINE,0,to_copy,ADXPlusBuffer)<=0)
      return(0);
   if(CopyBuffer(IndicatorValueADX,MINUSDI_LINE,0,to_copy,ADXMinusBuffer)<=0)
      return(0);

   int start=0;
   if(prev_calculated>0)
      start=prev_calculated-1;

   

   for(int i=start; i<rates_total-PeriodoCalculo; i++)
     {
      bool Estocastico=false;
      bool RSI=false;
      Color_HistogramBuffer[i]=0;
      Color_HistogramColors[i]=0;
      /*
      if(ESTBuffer[i]>LevelIndicatorUpEST ){
          IndicatorTrend=1;}
       if(ESTBuffer[i]<LevelIndicatorDownEST)
          IndicatorTrend=-1;*/
      if(ESTBuffer[i]>LevelIndicatorDownEST && ESTBuffer[i]<LevelIndicatorUpEST)
        {
         Estocastico=true;
        }
      if(RSIBuffer[i]>LevelIndicatorDownRSI && RSIBuffer[i]<LevelIndicatorUpRSI)
        {
         RSI=true;
        }
      //---
      if(Estocastico==true)
        {
         if(ESTBuffer[i+1]<LevelIndicatorDownEST && (ADXMinusBuffer[i]>LevelIndicatorADX || 
         ADXMinusBuffer[i+1]>LevelIndicatorADX || ADXMinusBuffer[i+2]>LevelIndicatorADX))  //SI EL INDICADOR RSI ESTA EN SOBRE VENTA Y SALE DE ESE BUCLE
           {
            Color_HistogramBuffer[i]=1;
            Color_HistogramColors[i]=3;
           }
         else
            if(ESTBuffer[i+1]>LevelIndicatorUpEST && (ADXPlusBuffer[i]>LevelIndicatorADX || 
          ADXPlusBuffer[i+1]>LevelIndicatorADX || ADXPlusBuffer[i+2]>LevelIndicatorADX))  // SI EL INDICADOR RSI ESTAN SOBRE COMPRA Y SALE DE ESE BUCLE
              {
               Color_HistogramBuffer[i]=1;
               Color_HistogramColors[i]=2;
              }
        }

      if(RSI==true)
        {
         if(RSIBuffer[i+1]<LevelIndicatorDownRSI && ( ADXMinusBuffer[i+1]>LevelIndicatorADX ||
          ADXMinusBuffer[i+1]>LevelIndicatorADX || ADXMinusBuffer[i+2]>LevelIndicatorADX))  //SI EL INDICADOR RSI ESTA EN SOBRE VENTA Y SALE DE ESE BUCLE
           {
            Color_HistogramBuffer[i]=1;
            Color_HistogramColors[i]=3;
           }
         else
            if(RSIBuffer[i+1]>LevelIndicatorUpRSI && (ADXPlusBuffer[i]>LevelIndicatorADX  || 
         ADXPlusBuffer[i+1]>LevelIndicatorADX || ADXPlusBuffer[i+2]>LevelIndicatorADX))  // SI EL INDICADOR RSI ESTAN SOBRE COMPRA Y SALE DE ESE BUCLE
              {
               Color_HistogramBuffer[i]=1;
               Color_HistogramColors[i]=2;
              }
        }
     }
   return(rates_total);
  }
//+------------------------------------------------------------------+
