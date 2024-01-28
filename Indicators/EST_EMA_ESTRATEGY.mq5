//+------------------------------------------------------------------+
//|                                            EST_EMA_ESTRATEGY.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window

#property indicator_buffers 6
#property indicator_plots   2

#property indicator_label1  "ATR"
#property indicator_label2  "MM"
#property indicator_type1   DRAW_ARROW
#property indicator_type2   DRAW_ARROW
#property indicator_color1  clrAqua
#property indicator_color2 clrAqua
#property indicator_style1  STYLE_SOLID
#property indicator_style2  STYLE_SOLID
#property indicator_width1  1
#property indicator_width2  1


enum ENUM_Horas
  {
   _0am = 0,   //:  0 am
   _1am = 1,   //:  1 am
   _2am = 2,   //:  2 am
   _3am = 3,   //:  3 am
   _4am = 4,   //:  4 am
   _5am = 5,   //:  5 am
   _6am = 6,   //:  6 am
   _7am = 7,   //:  7 am
   _8am = 8,   //:  8 am
   _9am = 9,   //:  9 am
   _10am = 10, //: 10 am
   _11am = 11, //: 11 am
   _12pm = 12, //: 12 pm
   _1pm = 13,  //:  1 pm
   _2pm = 14,  //:  2 pm
   _3pm = 15,  //:  3 pm
   _4pm = 16,  //:  4 pm
   _5pm = 17,  //:  5 pm
   _6pm = 18,  //:  6 pm
   _7pm = 19,  //:  7 pm
   _8pm = 20,  //:  8 pm
   _9pm = 21,  //:  9 pm
   _10pm = 22, //:  10 pm
   _11pm = 23, //:  11 pm
  };


input int Evaluacion_Estocastico=2;
input int Evaluacion_RSI=2;
input int Evaluacion_Media_Traspaso=2;
input double DistanciaMACD=0.000500;
input int Tolerancia=10;//Tolerancia 2 EMAS
input string S1="-----------------------   Configuracion Medias Moviles  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo=150;
input int Ma_Periodo2=75;
input int Ma_Shift=0;
input ENUM_MA_METHOD Ma_Method=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;
input string S2="-----------------------   Configuracion Estocastico ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int RSI_Periodo=14;
input ENUM_APPLIED_PRICE RSI_Applied_Price=PRICE_CLOSE;
input string S22="-----------------------   Configuracion RSI ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int K_Periodo=5;
input int D_Periodo=3;
input int Slowing=3;
input ENUM_MA_METHOD Ma_Method_EST=MODE_SMA;
input ENUM_STO_PRICE STO_EST=STO_LOWHIGH;
input string S6_="-----------------------   MACD  ---------------------";//----------------------------------------------------------------------------------------------------------------------------
input int Period_MACD=50;
input int Slow_Ema_MACD=150;
input int Signal_Period_MACD=9;
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;
input string S7_="-----------------------   SUPERTREND  ---------------------";//--------------------------------------------------------------
input ENUM_TIMEFRAMES PeriodoIndicador=PERIOD_H1;
input int Length = 10;//ATR Period
input double ATR_Multiplier=3.0;//ATR Multiplier
input string S72_="-----------------------   SUPERTREND 2  ---------------------";//--------------------------------------------------------------
input ENUM_TIMEFRAMES PeriodoIndicador2=PERIOD_H4;
input int Length2 = 10;//ATR Period
input double ATR_Multiplier2=3.0;//ATR Multiplier
input string S723_="-----------------------   SUPERTREND 3  ---------------------";//--------------------------------------------------------------
input ENUM_TIMEFRAMES PeriodoIndicador3=PERIOD_H4;
input int Length3 = 10;//ATR Period
input double ATR_Multiplier3=3.0;//ATR Multiplier
input string S722_="-----------------------   HORARIO  ---------------------";//-----------
input ENUM_Horas  Hora_Inicio=_2am;
input ENUM_Horas Hora_Final=_4pm;



double UP[];
double DN[];
double EST[];
double MA[];
double MA2[];
double MACD[];
double RSI[];
double STD_UP[];
double STD_DN[];
double STD_UP2[];
double STD_DN2[];
double STD_UP3[];
double STD_DN3[];
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int handle_EST=0;
int handle_EMA=0;
int handle_EMA2=0;
int handle_MACD=0;
int handle_RSI=0;
int handle_SUPERTREND=0;
int handle_SUPERTREND2=0;
int handle_SUPERTREND3=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   handle_EST=iStochastic(Symbol(),PERIOD_CURRENT,K_Periodo,D_Periodo,Slowing,Ma_Method_EST,STO_EST);
   handle_EMA=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo,Ma_Shift,Ma_Method,Ma_AppliedPrice);
   handle_EMA2=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo2,Ma_Shift,Ma_Method,Ma_AppliedPrice);
   handle_MACD=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo,Ma_Shift,Ma_Method,Ma_AppliedPrice);
   handle_MACD=iMACD(Symbol(),PERIOD_CURRENT,Period_MACD,Slow_Ema_MACD,Signal_Period_MACD,Applied_Price_MACD);
   handle_RSI=iRSI(Symbol(),PERIOD_CURRENT,RSI_Periodo,RSI_Applied_Price);
   handle_SUPERTREND=iCustom(Symbol(),PeriodoIndicador,"SuperTrendMQL5",PeriodoIndicador,Length,ATR_Multiplier,S1,clrGreen,clrRed);
   handle_SUPERTREND2=iCustom(Symbol(),PeriodoIndicador2,"SuperTrendMQL5",PeriodoIndicador2,Length2,ATR_Multiplier2,S1,clrGreen,clrRed);
   handle_SUPERTREND3=iCustom(Symbol(),PeriodoIndicador3,"SuperTrendMQL5",PeriodoIndicador3,Length3,ATR_Multiplier3,S1,clrGreen,clrRed);

   PlotIndexSetInteger(0,PLOT_ARROW,233);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(1,PLOT_ARROW,234);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(0,UP,INDICATOR_DATA);
   SetIndexBuffer(1,DN,INDICATOR_DATA);
   SetIndexBuffer(2,EST,INDICATOR_DATA);
   SetIndexBuffer(3,MA,INDICATOR_DATA);
   SetIndexBuffer(4,MA2,INDICATOR_DATA);
   SetIndexBuffer(5,RSI,INDICATOR_DATA);

   ArraySetAsSeries(UP,true);
   ArraySetAsSeries(DN,true);
   ArraySetAsSeries(EST,true);
   ArraySetAsSeries(MA,true);
   ArraySetAsSeries(MA2,true);
   ArraySetAsSeries(MACD,true);
   ArraySetAsSeries(RSI,true);

   ArraySetAsSeries(STD_DN,true);
   ArraySetAsSeries(STD_UP,true);

   ArraySetAsSeries(STD_DN2,true);
   ArraySetAsSeries(STD_UP2,true);

   ArraySetAsSeries(STD_DN3,true);
   ArraySetAsSeries(STD_UP3,true);

   if(!MQLInfoInteger(MQL_TESTER))
     {
      //--- repasamos las ventanas
      int total=ChartIndicatorsTotal(0,0);
      //--- repasamos todos los indicadores en la ventana
      for(int i=total-1; i>=0; i--)
        {
         //--- obtenemos el nombre corto del indicador
         string name=ChartIndicatorName(0,0,i);

         if(StringFind(name,"MA(",0)!=-1)
            ChartIndicatorDelete(0,0,name);

         if(StringFind(name,"SuperTrendMQL5",0)!=-1)
            ChartIndicatorDelete(0,i,name);
         //--- obtenemos el manejador del indicador
        }

      ChartIndicatorAdd(0,0,handle_EMA);
      ChartIndicatorAdd(0,0,handle_EMA2);
      ChartIndicatorAdd(0,0,handle_SUPERTREND);
      ChartIndicatorAdd(0,0,handle_SUPERTREND2);
      ChartIndicatorAdd(0,0,handle_SUPERTREND3);
     }

   return(INIT_SUCCEEDED);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
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
   ArraySetAsSeries(time,true);
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(close,true);
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(open,true);


   int bars=iBars(Symbol(),PeriodoIndicador);
   if(BarsCalculated(handle_SUPERTREND)<bars)
      return(0);
   int to_copy1;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy1=bars;
   else
     {
      to_copy1= MathMax(3,MathMin(bars,(rates_total-prev_calculated)*int(PeriodSeconds(Period())/PeriodSeconds(PeriodoIndicador))));
      //--- last value is always copied
      to_copy1++;
     }
   if(CopyBuffer(handle_SUPERTREND,0,0,to_copy1,STD_UP)<=0)
      return(0);
   if(CopyBuffer(handle_SUPERTREND,1,0,to_copy1,STD_DN)<=0)
      return(0);


   int bars2=iBars(Symbol(),PeriodoIndicador2);
   if(BarsCalculated(handle_SUPERTREND2)<bars2)
      return(0);
   int to_copy2;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy2=bars2;
   else
     {
      to_copy2= MathMax(3,MathMin(bars2,(rates_total-prev_calculated)*int(PeriodSeconds(Period())/PeriodSeconds(PeriodoIndicador2))));
      //--- last value is always copied
      to_copy2++;
     }
   if(CopyBuffer(handle_SUPERTREND2,0,0,to_copy2,STD_UP2)<=0)
      return(0);
   if(CopyBuffer(handle_SUPERTREND2,1,0,to_copy2,STD_DN2)<=0)
      return(0);


   int bars3=iBars(Symbol(),PeriodoIndicador3);
   if(BarsCalculated(handle_SUPERTREND3)<bars3)
      return(0);
   int to_copy3;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy3=bars2;
   else
     {
      to_copy3= MathMax(3,MathMin(bars3,(rates_total-prev_calculated)*int(PeriodSeconds(Period())/PeriodSeconds(PeriodoIndicador3))));
      //--- last value is always copied
      to_copy3++;
     }
   if(CopyBuffer(handle_SUPERTREND3,0,0,to_copy3,STD_UP3)<=0)
      return(0);
   if(CopyBuffer(handle_SUPERTREND3,1,0,to_copy3,STD_DN3)<=0)
      return(0);


   if(prev_calculated==0)
     {
      ArrayInitialize(UP,EMPTY_VALUE);
      ArrayInitialize(DN,EMPTY_VALUE);
     }

   if(BarsCalculated(handle_EMA)<rates_total)
      return(0);
   if(BarsCalculated(handle_EST)<rates_total)
      return(0);
   if(BarsCalculated(handle_MACD)<rates_total)
      return(0);
   if(BarsCalculated(handle_EMA2)<rates_total)
      return(0);
   if(BarsCalculated(handle_RSI)<rates_total)
      return(0);
//--- we can copy not all data
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      //--- last value is always copied
      to_copy++;
     }
//--- try to copy
   if(CopyBuffer(handle_EMA,0,0,to_copy,MA)<=0)
      return(0);
   if(CopyBuffer(handle_EMA2,0,0,to_copy,MA2)<=0)
      return(0);
   if(CopyBuffer(handle_EST,0,0,to_copy,EST)<=0)
      return(0);
   if(CopyBuffer(handle_MACD,0,0,to_copy,MACD)<=0)
      return(0);
   if(CopyBuffer(handle_RSI,0,0,to_copy,RSI)<=0)
      return(0);

   Comment(STD_DN2[1]," ",STD_UP2[1]);

   int end=MathMin(rates_total-MathMax(Evaluacion_Estocastico,Evaluacion_Media_Traspaso)-2,rates_total-prev_calculated);

   UP[0]=EMPTY_VALUE;
   DN[0]=EMPTY_VALUE;

   for(int i=0; i<end; i++)
     {
      UP[i+1]=EMPTY_VALUE;
      DN[i+1]=EMPTY_VALUE;

      if(!EvaluaHorario(Hora_Inicio,Hora_Final,time[i]))
         continue;

      int barshift=iBarShift(Symbol(),PeriodoIndicador,time[i],false);
      if(barshift>ArraySize(STD_DN)-2 || barshift>ArraySize(STD_UP)-2)
         continue;

      int barshift2=iBarShift(Symbol(),PeriodoIndicador2,time[i],false);
      if(barshift2>ArraySize(STD_DN2)-2 || barshift2>ArraySize(STD_UP2)-2)
         continue;

      int barshift3=iBarShift(Symbol(),PeriodoIndicador3,time[i],false);
      if(barshift3>ArraySize(STD_DN3)-2 || barshift3>ArraySize(STD_UP3)-2)
         continue;

      if(MA2[i+1]<=close[i+1] && close[i+1]>open[i+1])
        {
         if(STD_DN3[barshift3+1]!=EMPTY_VALUE)
            if(STD_DN2[barshift2+1]!=EMPTY_VALUE)
               if(STD_DN[barshift+1]!=EMPTY_VALUE)
                  if(/*FiltroMACD(true,i) &&*/FiltroEMADistancia(true,i,rates_total) && FiltroAmpliacion2EMAS(true,i,rates_total) && FiltroTraspaso(true,i,low,high) /*&& FiltroRSI(true,i,rates_total)*/ && FiltroEstocastico(true,i,rates_total))
                     UP[i+1]=low[i+1];
        }

      if(MA2[i+1]>=close[i+1] && close[i+1]<open[i+1])
        {
         if(STD_UP3[barshift3+1]!=EMPTY_VALUE)
            if(STD_UP2[barshift2+1]!=EMPTY_VALUE)
               if(STD_UP[barshift+1]!=EMPTY_VALUE)
                  if(/*FiltroMACD(false,i) &&*/FiltroEMADistancia(false,i,rates_total) && FiltroAmpliacion2EMAS(false,i,rates_total) && FiltroTraspaso(false,i,low,high) /*&& FiltroRSI(false,i,rates_total)*/ && FiltroEstocastico(false,i,rates_total))
                     DN[i+1]=high[i+1];
        }
     }

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroTraspaso(bool isBuy,int i,double const &low[],double const &high[])
  {
   for(int j=i+1; j<i+1+Evaluacion_Media_Traspaso; j++)
     {
      if(isBuy)
        {
         if(MA2[j]>=low[j])
            return true;
        }
      else
        {
         if(MA2[j]<=high[j])
            return true;
        }
     }
   return false;
  }
//+------------------------------------------------------------------+
bool FiltroEstocastico(bool isBuy,int i,const int rates_total)
  {
   for(int j=i+1; j<i+1+Evaluacion_Estocastico; j++)
     {
      if(isBuy)
         if(20>=EST[j])
            return true;

      if(!isBuy)
         if(80<=EST[j])
            return true;
     }
   return false;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroRSI(bool isBuy,int i,const int rates_total)
  {
   for(int j=i+1; j<i+1+Evaluacion_RSI; j++)
     {
      if(isBuy)
         if(30>=RSI[j])
            return true;

      if(!isBuy)
         if(70<=RSI[j])
            return true;
     }
   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroMACD(bool isBuy,int i)
  {
   if(isBuy)
     {
      if(MACD[i+1]>=DistanciaMACD)
         return true;
     }
   else
     {
      if(MACD[i+1]<=DistanciaMACD*-1)
         return true;
     }
   return false;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroAmpliacion2EMAS(bool isBuy,int i,const int rates_total)
  {
   if(isBuy)
      if(MA[i+1]>MA2[i+1])
         return false;

   if(!isBuy)
      if(MA[i+1]<MA2[i+1])
         return false;

   /*for(int j=i+1; j<rates_total-2; j++)
     {
      if(isBuy)
        {
         if(MA[j]>MA2[j])
            break;


         if(MA[j]+Tolerancia*Point()<MA[j+1])
            return false;

         if(MA2[j]+Tolerancia*Point()<MA2[j+1])
            return false;
        }

      if(!isBuy)
        {
         if(MA[j]<MA2[j])
            break;

         if(MA[j]-Tolerancia*Point()>MA[j+1])
            return false;

         if(MA2[j]-Tolerancia*Point()>MA2[j+1])
            return false;
        }
     }*/
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroEMADistancia(bool isBuy,int i,const int rates_total)
  {
   int Distancia=100;
   int Tolerancia_=10;

   double value=0;

   for(int j=i+1; j<=i+Distancia && j<rates_total-2; j++)
     {
      if(isBuy)
        {
         if(MA[j]+0*Point()<MA[j+1])
            return false;
        }

      if(!isBuy)
        {
         if(MA[j]-0*Point()>MA[j+1])
            return false;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluaHorario(int Apertura,int Cierre,datetime TimeEvalua)
  {
   MqlDateTime time;
   TimeToStruct(TimeEvalua,time);
   if(Apertura==Cierre)
      return true;


   if(Apertura>Cierre && (time.hour>=Apertura || time.hour<Cierre))
      return true;
   else
      if(Apertura<Cierre && time.hour>=Apertura && time.hour<Cierre)
         return true;

   return false;
  }
//+------------------------------------------------------------------+
