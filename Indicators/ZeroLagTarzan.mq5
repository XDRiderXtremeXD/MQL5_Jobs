//+------------------------------------------------------------------+
//|                                                ZeroLagTarzan.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window

#property indicator_buffers 9
#property indicator_plots   2

#property indicator_label1  "SIGNAL SELL"
#property indicator_color1  clrAqua
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2  "SIGNAL BUY"
#property indicator_color2  clrAqua
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

#resource "\\Indicators\\Tarzan.ex5"
#resource "\\Indicators\\Zero lag Hull average.ex5"

enum tipo
  {
   SOLO_SELL=0,//Solo Sell
   SOLO_BUY=1,//Solo Buy
   BUY_y_SELL=2,//Buy y Sell
  };


input tipo Tipo_Operacion=BUY_y_SELL;
input bool Patron_1=true;
input bool Patron_2=true;
input string S1="=================== TARZAN ========================";//============================================================
input uint                 InpPeriodRSI      =  5;             // RSI period
input ENUM_APPLIED_PRICE   InpAppliedPrice   =  PRICE_CLOSE;   // RSI Applied price
input uint                 InpPeriodMA       =  50;            // MA period
input ENUM_MA_METHOD       InpMethod         =  MODE_SMA;      // MA Method
input uint                 InpChannelTop     =  20;            // Channel top size
input uint                 InpChannelBottom  =  20;            // Channel bottom size
input string S2="=================== ZERO_LAG ========================";//============================================================
input double             inpPeriod = 20;           // Period
input ENUM_APPLIED_PRICE inpPrice  = PRICE_MEDIAN; // Price




int Handle_Tarzan=0;
int Handle_ZL=0;

double A_Sell[];
double A_Buy[];

double RSI[];
double Top[];
double Botton[];
double Sell[];
double Buy[];
double ColorZL[];
double ValorZL[];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   SetIndexBuffer(0,A_Sell,INDICATOR_DATA);
   SetIndexBuffer(1,A_Buy,INDICATOR_DATA);
   PlotIndexSetInteger(0,PLOT_ARROW,234);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetInteger(1,PLOT_ARROW,233);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(2,RSI,INDICATOR_DATA);
   SetIndexBuffer(3,Top,INDICATOR_DATA);
   SetIndexBuffer(4,Botton,INDICATOR_DATA);
   SetIndexBuffer(5,Sell,INDICATOR_DATA);
   SetIndexBuffer(6,Buy,INDICATOR_DATA);
   SetIndexBuffer(7,ColorZL,INDICATOR_DATA);
   SetIndexBuffer(8,ValorZL,INDICATOR_DATA);

   Handle_Tarzan=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\Tarzan.ex5",InpPeriodRSI,InpAppliedPrice,InpPeriodMA,InpMethod,InpChannelTop,InpChannelBottom);
   Handle_ZL=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\Zero lag Hull average.ex5",inpPeriod,inpPrice);

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


//--- check if all data calculated
   if(BarsCalculated(Handle_ZL)<rates_total)
      return(0);
   if(BarsCalculated(Handle_Tarzan)<rates_total)
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

   if(prev_calculated==0)
     {
      ArrayInitialize(A_Sell,EMPTY_VALUE);
      ArrayInitialize(A_Buy,EMPTY_VALUE);
     }

//--- try to copy
   if(CopyBuffer(Handle_Tarzan,0,0,to_copy,RSI)<=0)
      return(0);
   if(CopyBuffer(Handle_Tarzan,3,0,to_copy,Top)<=0)
      return(0);
   if(CopyBuffer(Handle_Tarzan,4,0,to_copy,Botton)<=0)
      return(0);
   if(CopyBuffer(Handle_Tarzan,5,0,to_copy,Sell)<=0)
      return(0);
   if(CopyBuffer(Handle_Tarzan,6,0,to_copy,Buy)<=0)
      return(0);

   if(CopyBuffer(Handle_ZL,0,0,to_copy,ValorZL)<=0)
      return(0);
   if(CopyBuffer(Handle_ZL,1,0,to_copy,ColorZL)<=0)
      return(0);

   int Start=MathMax(4,rates_total-(rates_total-prev_calculated));

   for(int shift=Start; shift<rates_total; shift++)
     {
      A_Sell[shift-1]=EMPTY_VALUE;
      A_Buy[shift-1]=EMPTY_VALUE;
      if(Patron_1)
        {
         if(Tipo_Operacion==BUY_y_SELL || Tipo_Operacion==SOLO_SELL)
            if(Top[shift-3]>=RSI[shift-3] && Top[shift-2]<RSI[shift-2] && Top[shift-1]>=RSI[shift-1] && Sell[shift-1]!=EMPTY_VALUE && Sell[shift-1]!=0 && ColorZL[shift-1]==1 && high[shift-2]<ValorZL[shift-2])
               A_Sell[shift-1]=high[shift-1];

         if(Tipo_Operacion==BUY_y_SELL || Tipo_Operacion==SOLO_BUY)
            if(Botton[shift-3]<=RSI[shift-3] && Botton[shift-2]>RSI[shift-2] && Botton[shift-1]<=RSI[shift-1] && Buy[shift-1]!=EMPTY_VALUE && Buy[shift-1]!=0  && ColorZL[shift-1]==2 && low[shift-2]>ValorZL[shift-2])
               A_Buy[shift-1]=low[shift-1];
        }

      if(Patron_2)
        {
         if(Tipo_Operacion==BUY_y_SELL || Tipo_Operacion==SOLO_SELL)
           {
            if(Top[shift-3]<RSI[shift-3] && Top[shift-2]<RSI[shift-2] && Top[shift-1]>=RSI[shift-1] && Sell[shift-1]!=EMPTY_VALUE && Sell[shift-1]!=0
               && ColorZL[shift-1]==2 && high[shift-1]>=ValorZL[shift-1] && low[shift-1]<=ValorZL[shift-1])
               A_Sell[shift-1]=high[shift-1];
           }

         if(Tipo_Operacion==BUY_y_SELL || Tipo_Operacion==SOLO_BUY)
            if(Botton[shift-3]>RSI[shift-3] && Botton[shift-2]>RSI[shift-2] && Botton[shift-1]<=RSI[shift-1] && Buy[shift-1]!=EMPTY_VALUE && Buy[shift-1]!=0
               && ColorZL[shift-1]==1  && high[shift-1]>=ValorZL[shift-1] && low[shift-1]<=ValorZL[shift-1])
               A_Buy[shift-1]=low[shift-1];
        }
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
