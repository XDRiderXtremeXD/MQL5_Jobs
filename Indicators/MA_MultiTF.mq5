//+------------------------------------------------------------------+
//|                                                   MA_MultiTF.mq5 |
//|                        Copyright 2017, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
//---- indicator settings
#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots   1
#property indicator_type1   DRAW_LINE
#property indicator_color1  Blue
#property indicator_width1  1
//---- input parameters
input ENUM_TIMEFRAMES    tf              = 5;              // Time Frame
input int                maPeriod        = 13;             // MA period
input int                Shift           = 0;              // Shift
input ENUM_MA_METHOD     InpMAMethod     = MODE_SMA;       // Moving average method
input ENUM_APPLIED_PRICE InpAppliedPrice = PRICE_CLOSE;    // Applied price
input bool               Interpolate     = true;
input  int               Bars_Calculated = 500;
input int Width=1;
input ENUM_LINE_STYLE Style=STYLE_SOLID;
input color Color_Line=clrBlue;
//---- indicator buffers
double ExtMA[];
//---- handles for moving averages
int    MA_Handle;
//--- bars minimum for calculation
int    ExtBarsMinimum;
ENUM_TIMEFRAMES _tf;
int pf;
int draw_begin;
//--- we will keep the number of values in the Moving Average indicator
int    bars_calculated=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   _tf=tf;
   ENUM_TIMEFRAMES timeframe;
   int draw_shift=Shift;// initial PLOT_SHIFT value
   draw_begin=maPeriod;// initial value PLOT_DRAW_BEGIN
//---
   timeframe=_Period;
   if(_tf<=timeframe)
      _tf=timeframe;// if the TF is less than or is equal to the current one, set it to PERIOD_CURRENT
   pf=(int)MathFloor(PeriodSeconds(_tf)/PeriodSeconds(timeframe));// calculate coefficient for PLOT_DRAW_BEGIN, PLOT_SHIFT and the number of calculation bars.

   draw_begin=maPeriod*pf;// calculate PLOT_DRAW_BEGIN
   draw_shift=Shift*pf;// calculate PLOT_SHIFT
//---- indicator buffers mapping
   SetIndexBuffer(0,ExtMA,INDICATOR_DATA);
//---
   PlotIndexSetInteger(0,PLOT_SHIFT,draw_shift);                              //line shifts when drawing
   PlotIndexSetString(0,PLOT_LABEL,"MA("+string(tf)+" "+string(maPeriod)+")");//name for DataWindow
//---- Disabling drawing of empty indicator values
   PlotIndexSetDouble(0, PLOT_EMPTY_VALUE, 0.0);

   PlotIndexSetInteger(0,PLOT_LINE_WIDTH,Width);
   PlotIndexSetInteger(0,PLOT_LINE_STYLE,Style);
   PlotIndexSetInteger(0,PLOT_LINE_COLOR,Color_Line);
//--- get MA's handles
   MA_Handle=iMA(NULL,_tf,maPeriod,0,InpMAMethod,InpAppliedPrice);            //
   if(MA_Handle==INVALID_HANDLE)
     {
      Print("getting MA Handle is failed! Error",GetLastError());
      return(INIT_FAILED);
     }
//--- set accuracy
   IndicatorSetInteger(INDICATOR_DIGITS,_Digits);

   IndicatorSetString(INDICATOR_SHORTNAME,"MA_MultiTF");

   ArrayInitialize(ExtMA,0);
//--- bars minimum for calculation
   ExtBarsMinimum=draw_begin+draw_shift;// calculate the minimum required number of bars for the calculation

//--- initialization done
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

//--- check for rates total
   if(rates_total<ExtBarsMinimum+pf)
     {
      return(0);
     } // not enough bars for calculation

   int limit;
   if(Bars_Calculated!=0)
      draw_begin=Bars(NULL,0)-Bars_Calculated;
//---
   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,draw_begin+pf);                      //sets first bar from what index will be drawn
//--- apply timeseries indexing to array elements
   ArraySetAsSeries(time,true);
   ArraySetAsSeries(ExtMA,true);
//--- not all data may be calculated
   int calculated=BarsCalculated(MA_Handle);
//---
   if(calculated<=0)
     {
    //  Print("Not all data of ExtHandle1 is calculated (",calculated,"bars ). Error",GetLastError());
      return(0);
     }
//--- detect start position
//--- calculations of the necessary amount of data to be copied
//--- and the 'limit' starting index for the bars recalculation loop
   if(prev_calculated>rates_total || prev_calculated<=0|| calculated!=bars_calculated)// checking for the first start of the indicator calculation
     {
      ArrayInitialize(ExtMA,0);
      limit=rates_total-ExtBarsMinimum-1; // starting index for calculation of all bars
     }
   else
     {
      limit=(rates_total-prev_calculated)+pf+1; // starting index for calculation of new bars
     }
   if(Bars_Calculated!=0)
      limit=MathMin(Bars_Calculated,limit);


   if(PeriodSeconds(tf)<PeriodSeconds(_Period))
     {
      return rates_total;
     }

//--- main cycle
   for(int i=limit;i>=0 && !IsStopped();i--)
     {
      ExtMA[i]=_CopyBuffer(MA_Handle,time[i]);
     }
//---
   bars_calculated=calculated;
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
double _CopyBuffer(int handle,datetime start_time)
  {
   double buf[];
   if(CopyBuffer(handle,0,start_time,1,buf)>0)
      return(buf[0]);

   return(EMPTY_VALUE);
  }

//+------------------------------------------------------------------+
