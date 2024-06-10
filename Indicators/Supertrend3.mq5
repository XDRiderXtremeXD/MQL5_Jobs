//+------------------------------------------------------------------+
//|                                                  Supertrend3.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 3
#property indicator_plots 3

//--- plot Intersection
#property indicator_label1  "DN Rebote"
#property indicator_color1  clrAqua
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2  "UP Rebote"
#property indicator_color2  clrAqua
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

#property indicator_label3  "MA"
#property indicator_color3  clrRed
#property indicator_type3   DRAW_LINE
#property indicator_style3  STYLE_SOLID
#property indicator_width3  2

#resource "\\Indicators\\IndicatorPersonalized.ex5"
#resource "\\Indicators\\SuperTrendMQL5.ex5"

input string S11_="-----------------------   ALERTAS ---------------------";//--------------------------------------------------------------
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=true;
input string S1_="-----------------------   SUPERTREND 1 ---------------------";//--------------------------------------------------------------
input bool Filtro_1=true;//Filtro;
input ENUM_TIMEFRAMES PeriodoIndicador1=PERIOD_H2;
input int Length1 = 10;//ATR Period
input double ATR_Multiplier1=3.0;//ATR Multiplier
input string S2_="-----------------------   SUPERTREND 2  ---------------------";//--------------------------------------------------------------
input bool Filtro_2=true;//Filtro;
input ENUM_TIMEFRAMES PeriodoIndicador2=PERIOD_H4;
input int Length2 = 10;//ATR Period
input double ATR_Multiplier2=3.0;//ATR Multiplier
input string S3_="-----------------------   SUPERTREND 3  ---------------------";//--------------------------------------------------------------
input bool Filtro_3=true;//Filtro;
input ENUM_TIMEFRAMES PeriodoIndicador3=PERIOD_H8;
input int Length3 = 10;//ATR Period
input double ATR_Multiplier3=3.0;//ATR Multiplier
input string S11="-----------------------   Filtro MA---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Filter_MA=true;
input int Velas_MA=100;
input int puntos_tolerancia=0;
input int Period_MA=550;
input int Shift_MA=0;
input ENUM_APPLIED_PRICE APP_MA=PRICE_CLOSE;
input ENUM_MA_METHOD MODE_MA=MODE_SMA;
input string S12="-----------------------   Filtro Traspaso---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Filter_Traspaso=true;
input int Velas_sin_traspasar=100;
input int Tolerancia_traspaso=0;
input string S12_="----------------------- CONFIGURACION TREND -----------------------";//------------------------------------------------------------------------------------------------------------------------------------------
input int inpFastLength = 10; // Fast length
input int inpSlowLength = 40; // Slow length


int handle_SUPERTREND1=0;
int handle_SUPERTREND2=0;
int handle_SUPERTREND3=0;

int Handle_TREND=0;
int Handle_TREND2=0;

int handle_MA=0;

double MA[];

double STD_UP_1[];
double STD_DN_1[];
double STD_UP_2[];
double STD_DN_2[];
double STD_UP_3[];
double STD_DN_3[];

double SLOW[];
double FAST[];
double COLOR[];

double         ArrowSignalUP[];
double         ArrowSignalDN[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   handle_SUPERTREND1=iCustom(Symbol(),PeriodoIndicador1,"::Indicators\\SuperTrendMQL5",PeriodoIndicador1,Length1,ATR_Multiplier1,S1_,clrGreen,clrRed);
   handle_SUPERTREND2=iCustom(Symbol(),PeriodoIndicador2,"::Indicators\\SuperTrendMQL5",PeriodoIndicador2,Length2,ATR_Multiplier2,S2_,clrGreen,clrRed);
   handle_SUPERTREND3=iCustom(Symbol(),PeriodoIndicador3,"::Indicators\\SuperTrendMQL5",PeriodoIndicador3,Length3,ATR_Multiplier3,S3_,clrGreen,clrRed);
   Handle_TREND=iCustom(Symbol(),PeriodoIndicador1,"::Indicators\\IndicatorPersonalized.ex5",inpFastLength,inpSlowLength); // Slow length);
   Handle_TREND2=iCustom(Symbol(),PeriodoIndicador1,"::Indicators\\IndicatorPersonalized.ex5",inpFastLength,inpSlowLength); // Slow length);
   handle_MA=iMA(Symbol(),PERIOD_CURRENT,Period_MA,Shift_MA,MODE_MA,APP_MA);
//---
//--- indicator buffers mapping
   SetIndexBuffer(0,ArrowSignalUP,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalDN,INDICATOR_DATA);
   SetIndexBuffer(2,MA,INDICATOR_DATA);


   ArraySetAsSeries(ArrowSignalUP,true);
   ArraySetAsSeries(ArrowSignalDN,true);
   ArraySetAsSeries(MA,true);

   ArraySetAsSeries(STD_DN_1,true);
   ArraySetAsSeries(STD_UP_1,true);
   ArraySetAsSeries(STD_DN_2,true);
   ArraySetAsSeries(STD_UP_2,true);
   ArraySetAsSeries(STD_DN_3,true);
   ArraySetAsSeries(STD_UP_3,true);

   ArraySetAsSeries(SLOW,true);
   ArraySetAsSeries(FAST,true);
   ArraySetAsSeries(COLOR,true);

   PlotIndexSetInteger(0,PLOT_ARROW,234);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetInteger(1,PLOT_ARROW,233);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

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
   ArraySetAsSeries(time,true);
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(close,true);
   ArraySetAsSeries(open,true);

   if(prev_calculated==rates_total)
      return rates_total;

   if(BarsCalculated(handle_MA)<rates_total)
      return(0);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }

   if(CopyBuffer(handle_MA,0,0,to_copy,MA)<=0)
      return(0);

   if(Filtro_1)
      if(!CopiarSuperTrend(PeriodoIndicador1,handle_SUPERTREND1,STD_UP_1,STD_DN_1,prev_calculated,rates_total))
         return 0;
   if(Filtro_2)
      if(!CopiarSuperTrend(PeriodoIndicador2,handle_SUPERTREND2,STD_UP_2,STD_DN_2,prev_calculated,rates_total))
         return 0;
   if(Filtro_3)
      if(!CopiarSuperTrend(PeriodoIndicador3,handle_SUPERTREND3,STD_UP_3,STD_DN_3,prev_calculated,rates_total))
         return 0;

  // if(!CopiarTrend(PeriodoIndicador1,Handle_TREND,SLOW,FAST,COLOR,prev_calculated,rates_total))
    //  return 0;

   int end=MathMin(to_copy,rates_total-50);

   if(prev_calculated==0)
     {
      ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
     }

   for(int shift=0; shift<end; shift++)
     {
      ArrowSignalUP[shift+1]=EMPTY_VALUE;
      ArrowSignalDN[shift+1]=EMPTY_VALUE;

      int barshift_1=0,barshift_2=0,barshift_3=0;

     // if((barshift_1=barshift(PeriodoIndicador1,time,shift,SLOW,FAST))==-1)
       //  continue;

      if(Filtro_1)
         if((barshift_1=barshift(PeriodoIndicador1,time,shift,STD_DN_1,STD_UP_1))==-1)
            continue;
      if(Filtro_2)
         if((barshift_2=barshift(PeriodoIndicador2,time,shift,STD_DN_2,STD_UP_2))==-1)
            continue;
      if(Filtro_3)
         if((barshift_3=barshift(PeriodoIndicador3,time,shift,STD_DN_3,STD_UP_3))==-1)
            continue;
/*
      if(ArraySize(FAST)<=barshift_1+2)
         continue;

      if(ArraySize(SLOW)<=barshift_1+2)
         continue;

      if(ArraySize(COLOR)<=barshift_1+2)
         continue;
         */
      if(Filtro_1)
         if(ArraySize(STD_UP_1)<=barshift_1+2)
            continue;
      if(Filtro_2)
         if(ArraySize(STD_UP_2)<=barshift_2+2)
            continue;
      if(Filtro_3)
         if(ArraySize(STD_UP_3)<=barshift_3+2)
            continue;

      if(Filtro_1)
         if(ArraySize(STD_DN_1)<=barshift_1+2)
            continue;
      if(Filtro_2)
         if(ArraySize(STD_DN_2)<=barshift_2+2)
            continue;
      if(Filtro_3)
         if(ArraySize(STD_DN_3)<=barshift_3+2)
            continue;

     //    if(COLOR[barshift_1+1]!=EMPTY_VALUE && SLOW[barshift_1+1]<FAST[barshift_1+1])
            if((!Filtro_1 || (STD_UP_1[barshift_1+2]!=EMPTY_VALUE))/*||
         (!Filtro_2 || STD_UP_2[barshift_2+2]!=EMPTY_VALUE)||
            (!Filtro_3 || STD_UP_3[barshift_3+2]!=EMPTY_VALUE)*/)

               if(!Filtro_1 || (STD_DN_1[barshift_1+1]!=EMPTY_VALUE))
                  if(!Filtro_2 || STD_DN_2[barshift_2+1]!=EMPTY_VALUE)
                     if(!Filtro_3 || STD_DN_3[barshift_3+1]!=EMPTY_VALUE)
                        if(FiltroTraspaso(shift,high[shift+1],true,close,open,high,low,rates_total))
                           if(FiltroMA(shift,true,close,open,high,low,rates_total))
                             {
                              ArrowSignalDN[shift+1]=high[shift+1];
                             }

    //     if(COLOR[barshift_1+1]!=EMPTY_VALUE && SLOW[barshift_1+1]>FAST[barshift_1+1])
            if((!Filtro_1 || (STD_DN_1[barshift_1+2]!=EMPTY_VALUE))/*||
         (!Filtro_2 || STD_DN_2[barshift_2+2]!=EMPTY_VALUE)||
            (!Filtro_3 || STD_DN_3[barshift_3+2]!=EMPTY_VALUE)*/)

               if(!Filtro_1 || (STD_UP_1[barshift_1+1]!=EMPTY_VALUE))
                  if(!Filtro_2 || STD_UP_2[barshift_2+1]!=EMPTY_VALUE)
                     if(!Filtro_3 || STD_UP_3[barshift_3+1]!=EMPTY_VALUE)
                        if(FiltroTraspaso(shift,low[shift+1],false,close,open,high,low,rates_total))
                           if(FiltroMA(shift,false,close,open,high,low,rates_total))
                             {
                              ArrowSignalUP[shift+1]=low[shift+1];
                             }

      if(shift==0)
        {
         if(ArrowSignalUP[1]!=EMPTY_VALUE)
            Alertas("ST3 SELL");
         if(ArrowSignalDN[1]!=EMPTY_VALUE)
            Alertas("ST3 BUY");
        }
     }

   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CopiarSuperTrend(ENUM_TIMEFRAMES PeriodoIndicador,int &handle,double &STD_UP[],double &STD_DN[],int prev_calculated,int rates_total)
  {
   int bars=iBars(Symbol(),PeriodoIndicador);
   if(BarsCalculated(handle)<bars)
      return(false);
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=bars;
   else
     {
      to_copy= MathMax(10,MathMin(bars,(rates_total-prev_calculated)*int(PeriodSeconds(Period())/PeriodSeconds(PeriodoIndicador))));
      //--- last value is always copied
      to_copy++;
     }
   if(CopyBuffer(handle,0,0,to_copy,STD_UP)<=0)
      return(false);
   if(CopyBuffer(handle,1,0,to_copy,STD_DN)<=0)
      return(false);

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CopiarTrend(ENUM_TIMEFRAMES PeriodoIndicador,int &handle,double &SLOW_[],double &FAST_[],double &COLOR_[],int prev_calculated,int rates_total)
  {
   int bars=iBars(Symbol(),PeriodoIndicador);
   if(BarsCalculated(handle)<bars)
      return(false);
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=bars;
   else
     {
      to_copy= MathMax(10,MathMin(bars,(rates_total-prev_calculated)*int(PeriodSeconds(Period())/PeriodSeconds(PeriodoIndicador))));
      //--- last value is always copied
      to_copy++;
     }
   if(CopyBuffer(handle,5,0,to_copy,SLOW_)<=0)
      return(false);
   if(CopyBuffer(handle,6,0,to_copy,FAST_)<=0)
      return(false);
   if(CopyBuffer(handle,0,0,to_copy,COLOR_)<=0)
      return(false);

   return true;
  }
//+------------------------------------------------------------------+
int barshift(ENUM_TIMEFRAMES PeriodoIndicador,datetime const &time[],int shift,double &STD_DN[],double &STD_UP[])
  {
   int barshift=iBarShift(Symbol(),PeriodoIndicador,time[shift],false);
   if(barshift>ArraySize(STD_DN)-2 || barshift>ArraySize(STD_UP)-2)
      return -1;

   return barshift;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Alertas(string Frase)
  {
   if(AlertPC)
      Alert(Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));
   if(AlertMail)
      SendNotification(Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));
   if(AlertPC)
      SendMail(Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())),Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroTraspaso(int bar,double price,bool IsBuy,double const &close[],double const &open[],double const &high[],double const &low[],int const rates_total)
  {
   if(!Filter_Traspaso)
      return true;

   int traspaso=Velas_sin_traspasar;

   int tolerancia=Tolerancia_traspaso;

   double rango=MathAbs(close[bar]-open[bar]);

   for(int i=1; i<=traspaso && bar+i<rates_total; i++)
     {

      if(IsBuy?(high[bar]+tolerancia*Point()<close[bar+i]):(low[bar]-tolerancia*Point()>close[bar+i]))
         return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroMA(int bar,bool IsBuy,double const &close[],double const &open[],double const &high[],double const &low[],int const rates_total)
  {
   if(!Filter_MA)
      return true;

   int traspaso=Velas_MA;

   int tolerancia=puntos_tolerancia;

   for(int i=1; i<=traspaso && bar+i<rates_total; i++)
     {
      if(IsBuy?(MA[bar+i]-tolerancia*Point()>=low[bar+i]):(MA[bar+i]+tolerancia*Point()<=high[bar+i]))
         return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
