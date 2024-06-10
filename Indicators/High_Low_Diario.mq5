//+------------------------------------------------------------------+
//|                                              High_Low_Diario.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_plots   2

#property indicator_label1  "HIGH"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrAquamarine
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2  "LOW"
#property indicator_type2   DRAW_LINE
#property indicator_color2  clrAquamarine
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

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

input ENUM_Horas HoraStart=16;

datetime horaLast=-1;

double HIGH[];
double LOW[];

double highLast=-1;
double lowLast=-1;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   SetIndexBuffer(0,HIGH,INDICATOR_DATA);
   SetIndexBuffer(1,LOW,INDICATOR_DATA);

   ArraySetAsSeries(HIGH,false);
   ArraySetAsSeries(LOW,false);
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

   ArraySetAsSeries(time,false);
   ArraySetAsSeries(low,false);
   ArraySetAsSeries(high,false);


   if(prev_calculated==0)
     {
      ArrayInitialize(HIGH,EMPTY_VALUE);
      ArrayInitialize(LOW,EMPTY_VALUE);
       horaLast=-1;
       highLast=-1;
       lowLast=-1;
     }

   int to_copy=BarrasFaltanIterarClose(prev_calculated,rates_total);

   for(int shift=MathMax(0,rates_total-to_copy); shift<=rates_total-1; shift++)
     {     
      HIGH[shift]=EMPTY_VALUE;
      LOW[shift]=EMPTY_VALUE;

      MqlDateTime timeShift,timeCurrent;
      TimeToStruct(time[shift],timeShift);
      TimeToStruct(time[shift],timeCurrent);

      timeShift.hour=HoraStart;
      timeShift.min=0;
      timeShift.sec=0;

      if((horaLast<StructToTime(timeShift) && StructToTime(timeCurrent)>=StructToTime(timeShift)))
        {
         highLast=0;
         lowLast=0;
         horaLast=StructToTime(timeShift);
        }

      if(lowLast!=-1)
         if(lowLast==0 || low[shift]<lowLast)
            lowLast=low[shift];

      if(highLast!=-1)
         if(highLast==0 || high[shift]>highLast)
            highLast=high[shift];

      if(highLast!=-1)
         HIGH[shift]=highLast;
      if(lowLast!=-1)
         LOW[shift]=lowLast;
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int BarrasFaltanIterarClose(int prev_calculated,int rates_total)
  {
   int to_copy=0;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
      //--- last value is always copied
     }
   return to_copy;
  }
//+------------------------------------------------------------------+
