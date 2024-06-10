//+------------------------------------------------------------------+
//|                                      MACD_RompimientoHighLow.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0;

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


input string S2="========== Configuracion MACD ==========";//==========================================================================================
input int Ema_Rapida=120;//EMA Rapida
input int Ema_Lenta=240;//EMA Lenta
input int MediaMovilExponencial=18;//Periodo Media Movil Exponencial
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;
input string S1="========== Configuracion High Low Line ==========";//==========================================================================================
input ENUM_Horas HoraStart=16;


int macd_handle=0;
int HL_handle=0;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   macd_handle=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\MACD_colores","",Ema_Rapida,Ema_Lenta,MediaMovilExponencial,Applied_Price_MACD);
   HL_handle=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\High_Low_Diario",HoraStart);

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
//---

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
