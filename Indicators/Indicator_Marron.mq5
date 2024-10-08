//+------------------------------------------------------------------+
//|                                             Indicator_Marron.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.00"

#property description "Indicador para Dibujer EST en Histograma"

#property indicator_separate_window
#property indicator_buffers 7
#property indicator_plots   1
#property indicator_label1  "LINEA_RED"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

input int PERIDOMFI=14;
input ENUM_APPLIED_VOLUME VOLUMETICK=VOLUME_TICK;

int IndicadorMFI;
int IndicadorBands;
int IndicadorRSI;
int IndicadorEST;
int IndicadorTotalPrice;

double BufferMFI[];
double BufferBandsUp[];
double BufferBandsDown[];
double BufferEST[];
double BufferRSI[];
double BufferTotalPrice[];

//--- búfer para los índices del Histograma
double         HISTOGRAM_MARRON[];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
  /*
  xmf = MoneyFlowIndex[14]

OB1 = (BollingerUp[25](TotalPrice) + BollingerDown[25](TotalPrice)) / 2
OB2 = BollingerUp[25](TotalPrice) - BollingerDown[25](TotalPrice)

BollOsc = ((TotalPrice - OB1) / OB2 ) * 100

xrsi = rsi [14](TotalPrice)

STOC = Stochastic[21,3](TotalPrice)

marron = (xrsi + xmf + BollOsc + (STOC / 3))/2*/


   SetIndexBuffer(0,HISTOGRAM_MARRON,INDICATOR_DATA);
   SetIndexBuffer(1,BufferMFI,INDICATOR_CALCULATIONS);
   SetIndexBuffer(2,BufferBandsUp,INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,BufferBandsDown,INDICATOR_CALCULATIONS);
   SetIndexBuffer(4,BufferRSI,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,BufferEST,INDICATOR_CALCULATIONS);
   SetIndexBuffer(6,BufferEST,INDICATOR_CALCULATIONS);
   
   IndicatorSetString(INDICATOR_SHORTNAME,"HISTOGRAM_MARRON");
   IndicadorTotalPrice=iCustom(Symbol(),PERIOD_CURRENT,"TOTAL_PRICE");
   IndicadorMFI=iCustom(Symbol(),PERIOD_CURRENT,"mfi",PERIDOMFI,VOLUMETICK);
   IndicadorBands=iBands(Symbol(),PERIOD_CURRENT,25,0,2.000,IndicadorTotalPrice); //PRICE WIGTHED POR MIENTRAS;
   IndicadorRSI=iRSI(Symbol(),PERIOD_CURRENT,14,IndicadorTotalPrice); //PRICE WIGTHED POR MIENTRAS;
   //IndicadorEST=iStochastic(Symbol(),PERIOD_CURRENT,3,3,21,MODE_SMA,STO_LOWHIGH);//STO_LOWHIGH POR MIENTRAS;
   IndicadorEST=iCustom(NULL,PERIOD_CURRENT,"StocasticoTotalPrice",21,3,3);
   
   ArrayInitialize(HISTOGRAM_MARRON,0);
   
   PlotIndexGetInteger(0,PLOT_DRAW_BEGIN,25+1);
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
  
   if(BarsCalculated(IndicadorMFI)<rates_total) return(0);
   if(BarsCalculated(IndicadorBands)<rates_total) return(0);
   if(BarsCalculated(IndicadorRSI)<rates_total) return(0);
   if(BarsCalculated(IndicadorEST)<rates_total) return(0);
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0) to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(IndicadorMFI,0,0,to_copy,BufferMFI)<=0) return(0);
   if(CopyBuffer(IndicadorBands,1,0,to_copy,BufferBandsUp)<=0) return(0);
   if(CopyBuffer(IndicadorBands,2,0,to_copy,BufferBandsDown)<=0) return(0);
   if(CopyBuffer(IndicadorRSI,0,0,to_copy,BufferEST)<=0) return(0);
   if(CopyBuffer(IndicadorEST,0,0,to_copy,BufferRSI)<=0) return(0);
    
   int start=1;
   
   if(prev_calculated>0) start=prev_calculated-1; 

   for(int i=start; i<rates_total; i++)
     { 
      double xmf,OB1,OB2,BollOsc,STOC,xrsi;
      HISTOGRAM_MARRON[i]=0;
      if(i>30){
      HISTOGRAM_MARRON[i]=0;
      xmf =BufferMFI[i];
      OB1 = (BufferBandsUp[i] + BufferBandsDown[i]) / 2;
      OB2 = BufferBandsUp[i] - BufferBandsDown[i];
      BollOsc = ((  ((close[i]+open[i]+low[i]+high[i])/4) - OB1) / OB2 ) * 100;
      xrsi=BufferRSI[i];
      STOC=BufferEST[i];
      
      HISTOGRAM_MARRON[i]=(xrsi + xmf + BollOsc + (STOC / 3))/2;
      }
      
     }
   //Comment(IVN_HISTOGRAM[rates_total-1]);

   return(rates_total);
  }
//+------------------------------------------------------------------+
