//+------------------------------------------------------------------+
//|                                          IndicadorMacdTrends.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 9
#property indicator_plots   2

#property indicator_label1  "DN Rebote"
#property indicator_color1  clrMagenta
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2  "UP Rebote"
#property indicator_color2  clrMagenta
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

input string S1="-----------------------   MA 1  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_1=10;
input int Ma_Shift_1=0;
input ENUM_MA_METHOD Ma_Method_1=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_1=PRICE_CLOSE;
input string S2="-----------------------   MA 2  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_2=12;
input int Ma_Shift_2=0;
input ENUM_MA_METHOD Ma_Method_2=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_2=PRICE_CLOSE;
input string S3="-----------------------   MA 3  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_3=14;
input int Ma_Shift_3=0;
input ENUM_MA_METHOD Ma_Method_3=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_3=PRICE_CLOSE;
input string S4="-----------------------   MA 4  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_4=16;
input int Ma_Shift_4=0;
input ENUM_MA_METHOD Ma_Method_4=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_4=PRICE_CLOSE;
input string S5="-----------------------   MA 5  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_5=18;
input int Ma_Shift_5=0;
input ENUM_MA_METHOD Ma_Method_5=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_5=PRICE_CLOSE;
input string S6_="-----------------------              MACD            -----------------------";//---------------------------------------------------------------------------------------------------------------
input int Fast_Ema_MACD=12;
input int Slow_Ema_MACD=26;
input int Signal_Period_MACD=9;
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;

int H_MACD=0;
int H_TREND_1=0;
int H_TREND_2=0;
int H_TREND_3=0;
int H_TREND_4=0;
int H_TREND_5=0;
// BUFFERS
double MACD_Buffer[];
double MACD_Buffer_Signal[];
double MA1_Buffer[];
double MA2_Buffer[];
double MA3_Buffer[];
double MA4_Buffer[];
double MA5_Buffer[];

double ArrowSignalUP[];
double ArrowSignalDN[];

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(Ma_Periodo_1>Ma_Periodo_2 || Ma_Periodo_2>Ma_Periodo_3 || Ma_Periodo_3>Ma_Periodo_4 || Ma_Periodo_4>Ma_Periodo_5)
     {
      Alert("Los Periodos de la Ema debe ser en orden ascendete  MA1_Perido tiene que ser menor MA2_Periodo y asi con los demas periodos");
      return INIT_PARAMETERS_INCORRECT;
     }


   H_MACD=iMACD(Symbol(),PERIOD_CURRENT,Fast_Ema_MACD,Slow_Ema_MACD,Signal_Period_MACD,Applied_Price_MACD);
   H_TREND_1=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo_1,Ma_Shift_1,Ma_Method_1,Ma_AppliedPrice_1);
   H_TREND_2=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo_2,Ma_Shift_2,Ma_Method_2,Ma_AppliedPrice_2);
   H_TREND_3=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo_3,Ma_Shift_3,Ma_Method_3,Ma_AppliedPrice_3);
   H_TREND_4=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo_4,Ma_Shift_4,Ma_Method_4,Ma_AppliedPrice_4);
   H_TREND_5=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo_5,Ma_Shift_5,Ma_Method_5,Ma_AppliedPrice_5);

   SetIndexBuffer(0,ArrowSignalUP,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalDN,INDICATOR_DATA);
   SetIndexBuffer(2,MACD_Buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,MACD_Buffer_Signal,INDICATOR_CALCULATIONS);
   SetIndexBuffer(4,MA1_Buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,MA2_Buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(6,MA3_Buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(7,MA4_Buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(8,MA5_Buffer,INDICATOR_CALCULATIONS);

   PlotIndexSetInteger(0,PLOT_ARROW,234);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetInteger(1,PLOT_ARROW,233);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetString(0,PLOT_LABEL,"ARROW_DN");
   PlotIndexSetString(1,PLOT_LABEL,"ARROW_UP");

   ArraySetAsSeries(ArrowSignalUP,true);
   ArraySetAsSeries(ArrowSignalDN,true);
   ArraySetAsSeries(MACD_Buffer,true);
   ArraySetAsSeries(MACD_Buffer_Signal,true);
   ArraySetAsSeries(MA1_Buffer,true);
   ArraySetAsSeries(MA2_Buffer,true);
   ArraySetAsSeries(MA3_Buffer,true);
   ArraySetAsSeries(MA4_Buffer,true);
   ArraySetAsSeries(MA5_Buffer,true);

   IndicatorSetString(INDICATOR_SHORTNAME,"Indicador MACDTRENDS");

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

   ArraySetAsSeries(time,true);
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(high,true);

   if(BarsCalculated(H_MACD)<rates_total)
      return(0);
   if(BarsCalculated(H_TREND_1)<rates_total)
      return(0);
   if(BarsCalculated(H_TREND_2)<rates_total)
      return(0);
   if(BarsCalculated(H_TREND_3)<rates_total)
      return(0);
   if(BarsCalculated(H_TREND_4)<rates_total)
      return(0);
   if(BarsCalculated(H_TREND_5)<rates_total)
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
   if(CopyBuffer(H_MACD,0,0,to_copy,MACD_Buffer)<=0)
      return(0);
   if(CopyBuffer(H_MACD,1,0,to_copy,MACD_Buffer_Signal)<=0)
      return(0);
   if(CopyBuffer(H_TREND_1,0,0,to_copy,MA1_Buffer)<=0)
      return(0);
   if(CopyBuffer(H_TREND_2,0,0,to_copy,MA2_Buffer)<=0)
      return(0);
   if(CopyBuffer(H_TREND_3,0,0,to_copy,MA3_Buffer)<=0)
      return(0);
   if(CopyBuffer(H_TREND_4,0,0,to_copy,MA4_Buffer)<=0)
      return(0);
   if(CopyBuffer(H_TREND_5,0,0,to_copy,MA5_Buffer)<=0)
      return(0);

   if(prev_calculated==0)
     {
      ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
     }

   if(prev_calculated==rates_total)
      return rates_total;

   int end=(prev_calculated>0)?MathMin(to_copy,rates_total-4):rates_total-4;
////////// RUPTURA DE SOP o RES
   for(int shift=0; shift<end; shift++)
     {
      ArrowSignalUP[0]=EMPTY_VALUE;
      ArrowSignalDN[0]=EMPTY_VALUE;
      ArrowSignalUP[shift+1]=EMPTY_VALUE;
      ArrowSignalDN[shift+1]=EMPTY_VALUE;


      if(MACD_Buffer[shift+1]<0)
        {
         if(MACD_Buffer[shift+2]<MACD_Buffer_Signal[shift+2] && MACD_Buffer[shift+1]>MACD_Buffer_Signal[shift+1])
           {
            if(MA1_Buffer[shift+1]>MA2_Buffer[shift+1])
               ArrowSignalDN[shift+1]=low[shift+1];
           }
        }
      else
        {
         if(MACD_Buffer[shift+2]>MACD_Buffer_Signal[shift+2] && MACD_Buffer[shift+1]<MACD_Buffer_Signal[shift+1])
           {
            if(MA1_Buffer[shift+1]<MA2_Buffer[shift+1])
               ArrowSignalUP[shift+1]=high[shift+1];
           }
        }
     }

   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
