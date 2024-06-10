//+------------------------------------------------------------------+
//|                                               SuperTrendMQL5.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//======================================================================================================================================================//
#property indicator_chart_window
#property indicator_buffers 8
#property indicator_plots 4
//======================================================================================================================================================//
double ATR_UP[];
double ATR_DN[];
double ARROW_BUY[];
double ARROW_SELL[];
double Long[];
double Short[];
double dir[];
double ATR[];
//======================================================================================================================================================//
input ENUM_TIMEFRAMES PeriodoIndicador=PERIOD_CURRENT;
input int Length = 10;//ATR Period
input double ATR_Multiplier=3.0;//ATR Multiplier
input string S1="============= COLORES ================";//===================================
input color ClrBuy=clrGreen;
input color ClrSell=clrRed;


string path="";
int handleDiferentPeriod=0;
double STD_UP[],STD_DN[];


long loginAutor=61180017;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   SetIndexBuffer(0,ATR_UP,INDICATOR_DATA);
   SetIndexBuffer(1,ATR_DN,INDICATOR_DATA);
   SetIndexBuffer(2,ARROW_BUY,INDICATOR_DATA);
   SetIndexBuffer(3,ARROW_SELL,INDICATOR_DATA);
   SetIndexBuffer(4,dir,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,Long,INDICATOR_CALCULATIONS);
   SetIndexBuffer(6,Short,INDICATOR_CALCULATIONS);
   SetIndexBuffer(7,ATR,INDICATOR_CALCULATIONS);

   PlotIndexSetInteger(0,PLOT_DRAW_TYPE,DRAW_LINE);
   PlotIndexSetInteger(1,PLOT_DRAW_TYPE,DRAW_LINE);
   PlotIndexSetInteger(0,PLOT_LINE_STYLE,STYLE_SOLID);
   PlotIndexSetInteger(1,PLOT_LINE_STYLE,STYLE_SOLID);
   PlotIndexSetInteger(0,PLOT_LINE_WIDTH,3);
   PlotIndexSetInteger(1,PLOT_LINE_WIDTH,3);
   PlotIndexSetInteger(0,PLOT_LINE_COLOR,ClrSell);
   PlotIndexSetInteger(1,PLOT_LINE_COLOR,ClrBuy);

   PlotIndexSetInteger(2,PLOT_DRAW_TYPE,DRAW_ARROW);
   PlotIndexSetInteger(3,PLOT_DRAW_TYPE,DRAW_ARROW);
   PlotIndexSetInteger(2,PLOT_LINE_STYLE,STYLE_SOLID);
   PlotIndexSetInteger(3,PLOT_LINE_STYLE,STYLE_SOLID);
   PlotIndexSetInteger(2,PLOT_LINE_WIDTH,3);
   PlotIndexSetInteger(3,PLOT_LINE_WIDTH,3);
   PlotIndexSetInteger(2,PLOT_LINE_COLOR,ClrBuy);
   PlotIndexSetInteger(3,PLOT_LINE_COLOR,ClrSell);

   PlotIndexSetInteger(2,PLOT_ARROW,108);
   PlotIndexSetInteger(3,PLOT_ARROW,108);
//--------------------------------------------------------------------------------
   PlotIndexSetString(0,PLOT_LABEL,"ATR_UP");
   PlotIndexSetString(1,PLOT_LABEL,"ATR_DN");
   PlotIndexSetString(2,PLOT_LABEL,"BUY");
   PlotIndexSetString(3,PLOT_LABEL,"SELL");
   PlotIndexSetString(4,PLOT_LABEL,"Long");
   PlotIndexSetString(5,PLOT_LABEL,"Short");
   PlotIndexSetString(6,PLOT_LABEL,"Direccion");
   PlotIndexSetString(7,PLOT_LABEL,"ATR RMA");
//--------------------------------------------------------------------------------
   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,Length);
   PlotIndexSetInteger(1,PLOT_DRAW_BEGIN,Length);
   PlotIndexSetInteger(2,PLOT_DRAW_BEGIN,Length);
   PlotIndexSetInteger(3,PLOT_DRAW_BEGIN,Length);
   PlotIndexSetInteger(4,PLOT_DRAW_BEGIN,Length);
   PlotIndexSetInteger(5,PLOT_DRAW_BEGIN,Length);
   PlotIndexSetInteger(6,PLOT_DRAW_BEGIN,Length);
   PlotIndexSetInteger(7,PLOT_DRAW_BEGIN,Length);
//--------------------------------------------------------------------------------
   ArraySetAsSeries(Long,false);
   ArraySetAsSeries(Short,false);
   ArraySetAsSeries(ATR_DN,false);
   ArraySetAsSeries(ATR_UP,false);
   ArraySetAsSeries(dir,false);
   ArraySetAsSeries(ARROW_BUY,false);
   ArraySetAsSeries(ARROW_SELL,false);
   ArraySetAsSeries(ATR,false);

   ArraySetAsSeries(STD_DN,true);
   ArraySetAsSeries(STD_UP,true);

   if(!SacarPath())
      return INIT_FAILED;

   IndicatorSetString(INDICATOR_SHORTNAME,"SuperTrendMQL5_"+EnumToString(PeriodoIndicador));

   if(PeriodSeconds(Period())!=PeriodSeconds(PeriodoIndicador))
      handleDiferentPeriod=iCustom(Symbol(),PeriodoIndicador,path,PeriodoIndicador,Length,ATR_Multiplier,S1,ClrBuy,ClrSell);

   if(INVALID_HANDLE==handleDiferentPeriod)
     {
      Alert("HANDLE INVALIDO");
      return INIT_FAILED;
     }

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Comment("");
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

//MQLInfoString(MQL_PROGRAM_NAME)
//---
   ArraySetAsSeries(close,false);
   ArraySetAsSeries(high,false);
   ArraySetAsSeries(low,false);
   ArraySetAsSeries(time,false);

   static int Start=0;
   if(prev_calculated==0)
     {
      ArrayInitialize(ATR_UP,EMPTY_VALUE);
      ArrayInitialize(ATR_DN,EMPTY_VALUE);
      ArrayInitialize(Long,EMPTY_VALUE);
      ArrayInitialize(Short,EMPTY_VALUE);
      ArrayInitialize(dir,EMPTY_VALUE);
      ArrayInitialize(ARROW_BUY,EMPTY_VALUE);
      ArrayInitialize(ARROW_SELL,EMPTY_VALUE);
      ArrayInitialize(ATR,EMPTY_VALUE);

      Start=100;
     }
   else
      Start=rates_total-(rates_total-prev_calculated+1);

//  Print(PeriodSeconds(ENUM_TIMEFRAMES(Period())),"   ",PeriodSeconds(PeriodoIndicador));

   if(PeriodSeconds(Period())!=PeriodSeconds(PeriodoIndicador))
     {
      int bars=iBars(Symbol(),PeriodoIndicador);
      if(BarsCalculated(handleDiferentPeriod)<bars)
         return(0);
      int to_copy;
      if(prev_calculated>rates_total || prev_calculated<=0)
         to_copy=bars;
      else
        {
         to_copy= MathMin(bars,(rates_total-prev_calculated)*int(PeriodSeconds(Period())/PeriodSeconds(PeriodoIndicador)));
         //--- last value is always copied
         to_copy++;
        }
      if(CopyBuffer(handleDiferentPeriod,0,0,to_copy,STD_UP)<=0)
         return(0);
      if(CopyBuffer(handleDiferentPeriod,1,0,to_copy,STD_DN)<=0)
         return(0);

      //--- return value of prev_calculated for next call
      for(int IndicatorShift=MathMin(Start,rates_total-int(PeriodSeconds(PeriodoIndicador)/PeriodSeconds(Period()))); IndicatorShift<rates_total; IndicatorShift++)
        {
         int barshift=iBarShift(Symbol(),PeriodoIndicador,time[IndicatorShift-1],false);
         
         if(barshift==-1){
         Print(IndicatorShift);
         Print(time[IndicatorShift-1]);
         continue;}
         
         if(barshift>ArraySize(STD_DN)-1 || barshift>ArraySize(STD_UP)-1)
            continue;

         ATR_UP[IndicatorShift]=EMPTY_VALUE;
         ATR_DN[IndicatorShift]=EMPTY_VALUE;
         ARROW_BUY[IndicatorShift]=EMPTY_VALUE;
         ARROW_SELL[IndicatorShift]=EMPTY_VALUE;

         if(barshift==0)
            continue;

         ATR_UP[IndicatorShift-1]=STD_UP[barshift];
         ATR_DN[IndicatorShift-1]=STD_DN[barshift];

         if(ATR_UP[IndicatorShift-2]!=EMPTY_VALUE && ATR_DN[IndicatorShift-1]!=EMPTY_VALUE)
            ARROW_BUY[IndicatorShift-1]=ATR_DN[IndicatorShift-1];
         if(ATR_DN[IndicatorShift-2]!=EMPTY_VALUE && ATR_UP[IndicatorShift-1]!=EMPTY_VALUE)
            ARROW_SELL[IndicatorShift-1]=ATR_UP[IndicatorShift-1];
        }
     }
   else
      for(int IndicatorShift=Start; IndicatorShift<rates_total; IndicatorShift++)
        {
         ARROW_BUY[IndicatorShift]=EMPTY_VALUE;
         ARROW_SELL[IndicatorShift]=EMPTY_VALUE;

         int shiftInverso=(rates_total-1)-IndicatorShift;

         ATR_RMA(IndicatorShift,close,high,low);

         double  atr = ATR_Multiplier * ATR[IndicatorShift];

         double medianPrice=(high[IndicatorShift]+low[IndicatorShift])/2;

         double  longStop= medianPrice-(atr);
         double  longStopPrev = Long[IndicatorShift-1]==EMPTY_VALUE?longStop:Long[IndicatorShift-1];
         longStop = close[IndicatorShift-1] > longStopPrev ? MathMax(longStop, longStopPrev) : longStop;
         Long[IndicatorShift]=longStop;

         double  shortStop=medianPrice+(atr);

         double  shortStopPrev = Short[IndicatorShift-1]==EMPTY_VALUE?shortStop:Short[IndicatorShift-1];
         shortStop = close[IndicatorShift-1] < shortStopPrev ? MathMin(shortStop, shortStopPrev) : shortStop;
         Short[IndicatorShift]=shortStop;

         double dire=1;
         if(dir[IndicatorShift-1]!=EMPTY_VALUE)
           {
            if(dir[IndicatorShift-1]==1)
               dire=close[IndicatorShift] > longStopPrev ? 1 : close[IndicatorShift] < shortStopPrev ? -1: 1;
            else
               dire=close[IndicatorShift] < shortStopPrev? -1: close[IndicatorShift] > longStopPrev ? 1 : 1;
           }

         dir[IndicatorShift] =dire;

         ATR_UP[IndicatorShift]=dire==-1?shortStop:EMPTY_VALUE;
         ATR_DN[IndicatorShift]=dire==1?longStop:EMPTY_VALUE;


         if(dir[IndicatorShift-1]!=dir[IndicatorShift-2])
           {
            if(dir[IndicatorShift-1]==1)
              {
               double Minimo=MathMin(ATR_DN[IndicatorShift-1],low[IndicatorShift-1]);
               ATR_DN[IndicatorShift-1]=Minimo;
               ARROW_BUY[IndicatorShift-1]=Minimo;
              }
            if(dir[IndicatorShift-1]==-1)
              {
               double Maximo=MathMax(ATR_UP[IndicatorShift-1],high[IndicatorShift-1]);
               ATR_UP[IndicatorShift-1]=Maximo;
               ARROW_SELL[IndicatorShift-1]=Maximo;
              }
           }
        }

   return(rates_total);
  }

//+------------------------------------------------------------------+
double trueRange(int shift,double const &close[],double const &high[],double const &low[])
  {

   double t1 = high[shift] - low[shift];
   double t2 = MathAbs(high[shift] - close[shift-1]);
   double t3 = MathAbs(low[shift] - close[shift-1]);

   return MathMax(MathMax(t1, t2), t3);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ATR_RMA(int indice,double const &close[],double const &high[],double const &low[])
  {
   double alpha=1.0/Length;
   if(ATR[indice-1]==EMPTY_VALUE)
     {
      // Print("Indice ",indice," Close ",close[indice]);
      double sum = 0;
      for(int i=0; i<Length; i++)
         sum += trueRange(indice-i,close,high,low);
      ATR[indice] = sum/Length;
      //Print("ATR ",ATR[indice]);
     }
   else
     {
      ATR[indice] = alpha*trueRange(indice,close,high,low) + (1-alpha)*ATR[indice-1];
     }
  }
//+------------------------------------------------------------------+
bool SacarPath()
  {
   int Index=StringFind(MQLInfoString(MQL_PROGRAM_PATH),"Indicators\\",0);
   if(Index==-1)
      Index=StringFind(MQLInfoString(MQL_PROGRAM_PATH),"indicators\\",0);

   if(Index==-1)
     {
      Alert("El archivo debe de estar en la carpeta Indicadores");
      return false;
     }

   path=StringSubstr(MQLInfoString(MQL_PROGRAM_PATH),Index+11,-1);
   return true;
  }
//+------------------------------------------------------------------+
