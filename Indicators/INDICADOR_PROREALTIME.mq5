//+------------------------------------------------------------------+
//|                                        INDICADOR_PROREALTIME.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.00"
#property description "Indicador para Calcular IP e IN"
#property indicator_separate_window
#property indicator_buffers 14
#property indicator_plots   4
#property indicator_label1  "LINEA_AZUL"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrBlue
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2
#property indicator_label2  "LINEA_MARRON"
#property indicator_type2   DRAW_LINE
#property indicator_color2  clrBrown
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2
#property indicator_label3  "LINEA_VERDE"
#property indicator_type3   DRAW_LINE
#property indicator_color3  clrGreen
#property indicator_style3  STYLE_SOLID
#property indicator_width3  2
#property indicator_label4  "LINEA_MEDIA"
#property indicator_type4   DRAW_LINE
#property indicator_color4  clrOrange
#property indicator_style4  STYLE_SOLID
#property indicator_width4  2

#property indicator_level1  0
#property indicator_levelcolor clrWhite
#property indicator_levelwidth 2



//--- búfer para los índices del Histograma
double         LINEBLUE[];
double         LINEBROWN[];
double         LINEGREEN[];
double         LINEORANGE[];
//--- bufer para los indices RSI
input int PeriodoIndicador=20;
input ENUM_MA_METHOD Modo=MODE_EMA;
int IndicatorIVN;
int IndicatorIVP;
int IndicatorEMAIVN;
int IndicatorEMAIVP;
int IndicatorMARRON;
int IndicatorEMAMarron;

double EMA_Buffer_MARRON[];
double BufferMARRON[];
double EMA_Buffer_IVN[];
double EMA_Buffer_IVP[];
double Buffer_IVN[];
double Buffer_IVP[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   SetIndexBuffer(0,LINEBLUE,INDICATOR_DATA);
   SetIndexBuffer(1,LINEBROWN,INDICATOR_DATA);
   SetIndexBuffer(2,LINEGREEN,INDICATOR_DATA);
   SetIndexBuffer(3,LINEORANGE,INDICATOR_DATA);
   SetIndexBuffer(4,EMA_Buffer_IVN,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,EMA_Buffer_IVP,INDICATOR_CALCULATIONS);
   SetIndexBuffer(6,Buffer_IVN,INDICATOR_CALCULATIONS);
   SetIndexBuffer(7,Buffer_IVP,INDICATOR_CALCULATIONS);
   SetIndexBuffer(8,BufferMARRON,INDICATOR_CALCULATIONS);
   SetIndexBuffer(9,EMA_Buffer_MARRON,INDICATOR_CALCULATIONS);
   
   ArrayInitialize(LINEBLUE,0);
   ArrayInitialize(LINEBROWN,0);
   ArrayInitialize(LINEGREEN,0);
   ArrayInitialize(LINEORANGE,0);
   ArrayInitialize(EMA_Buffer_IVN,0);
   ArrayInitialize(EMA_Buffer_IVP,0);
   ArrayInitialize(Buffer_IVN,0);
   ArrayInitialize(Buffer_IVP,0);
   ArrayInitialize(BufferMARRON,0);
   ArrayInitialize(EMA_Buffer_MARRON,0);
   

   IndicatorSetString(INDICATOR_SHORTNAME,"INDICATOR_MQL5");

   IndicatorMARRON=iCustom(Symbol(),PERIOD_CURRENT,"Indicator_Marron",14,VOLUME_TICK);
   IndicatorIVN=iCustom(Symbol(),PERIOD_CURRENT,"IVN_HISTOGRAM");
   IndicatorIVP=iCustom(Symbol(),PERIOD_CURRENT,"IVP_HISTOGRAM");
   IndicatorEMAIVN=iMA(Symbol(),PERIOD_CURRENT,PeriodoIndicador,0,MODE_EMA,IndicatorIVN);
   IndicatorEMAIVP=iMA(Symbol(),PERIOD_CURRENT,PeriodoIndicador,0,MODE_EMA,IndicatorIVP);
   IndicatorEMAMarron=iMA(Symbol(),PERIOD_CURRENT,PeriodoIndicador,0,MODE_EMA,IndicatorMARRON);

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


   if(BarsCalculated(IndicatorIVN)<rates_total)
      return(0);
   if(BarsCalculated(IndicatorIVP)<rates_total)
      return(0);
   if(BarsCalculated(IndicatorEMAIVN)<rates_total)
      return(0);
   if(BarsCalculated(IndicatorEMAIVP)<rates_total)
      return(0);
   if(BarsCalculated(IndicatorMARRON)<rates_total)
      return(0);
   if(BarsCalculated(IndicatorEMAMarron)<rates_total)
      return(0);
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(IndicatorEMAIVN,0,0,to_copy,EMA_Buffer_IVN)<=0)
      return(0);
   if(CopyBuffer(IndicatorEMAIVP,0,0,to_copy,EMA_Buffer_IVP)<=0)
      return(0);
   if(CopyBuffer(IndicatorIVP,0,0,to_copy,Buffer_IVP)<=0)
      return(0);
   if(CopyBuffer(IndicatorIVN,0,0,to_copy,Buffer_IVN)<=0)
      return(0);
   if(CopyBuffer(IndicatorMARRON,0,0,to_copy,BufferMARRON)<=0)
      return(0);
   if(CopyBuffer(IndicatorEMAMarron,0,0,to_copy,EMA_Buffer_MARRON)<=0)
      return(0);
   Sleep(5000);
   int start=0;
   if(prev_calculated>0)
      start=prev_calculated-1;
   for(int i=start; i<rates_total; i++)
     {
     if(i<=100){
         LINEBLUE[i] = 0;
         LINEGREEN[i] = 0;
         LINEBROWN[i] = 0;
         LINEORANGE[i]= 0;
       }
      double pvimax, nvimax,pvimin,nvimin;
      if(i>100)
        {
         LINEBLUE[i] = 0;
         LINEGREEN[i] = 0;
         LINEBROWN[i] = 0;
         LINEORANGE[i]= 0;
         pvimax=HIGHEST(EMA_Buffer_IVP,i,90);
         pvimin=LOWEST(EMA_Buffer_IVP,i,90);
         nvimax=HIGHEST(EMA_Buffer_IVN,i,90);
         nvimin=LOWEST(EMA_Buffer_IVN,i,90);

         double oscp=((Buffer_IVP[i]-EMA_Buffer_IVP[i])*100)/(pvimax-pvimin);
         LINEBLUE[i] = (Buffer_IVN[i] - EMA_Buffer_IVN[i]) * 100/ (nvimax - nvimin);
         LINEGREEN[i] = BufferMARRON[i] + oscp;
         LINEBROWN[i] = BufferMARRON[i] ;
         LINEORANGE[i]= EMA_Buffer_MARRON[i];
         Comment(oscp);
        }
     }
   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double HIGHEST(double &BUFFER[],int index,int N)
  {
   double mayor=-1.7976931348623158e+308;
   for(int i=index; i>=index-N; i--)
     {
      if(BUFFER[i]>mayor)
        {
         mayor=BUFFER[i];
        }
     }
     return mayor;
   }

   double LOWEST(double &BUFFER[],int index,int N)
     {
      double menor=1.7976931348623158e+308;
      for(int i=index; i>=index-N; i--)
        {
         if(BUFFER[i]<menor)
           {
            menor=BUFFER[i];
           }
        }
       return menor;
     }



//+------------------------------------------------------------------+
