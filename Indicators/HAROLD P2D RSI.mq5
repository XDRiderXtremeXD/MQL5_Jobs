//+------------------------------------------------------------------+
//|                                               HAROLD P2D RSI.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2011, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
 
#property indicator_separate_window
#property indicator_buffers 5
#property indicator_plots   1
#property indicator_label1  "LineaRSI" 
#property indicator_type1   DRAW_COLOR_LINE 
#property indicator_color1  clrRed,clrLime
#property indicator_style1  STYLE_SOLID 
#property indicator_width1  1 

#property indicator_minimum 0
#property indicator_maximum 100
 

double         RSIBuffer[];
double         COLOR_BUFFER_RSI[];
double         BUFFER_RSI[];
double         BUFFER_MA200[];
double         BUFFER_MA5[];

int RSI;
int MA200;
int MA5;

input int PeriodoRSI=2;
input ENUM_APPLIED_PRICE APPLIEDPRICE=PRICE_CLOSE;
input double LevelIndicatorDown=10;
input double LevelIndicatorUp=90;
int PeriodoMaximo=0;
int OnInit()
  {
   SetIndexBuffer(0,BUFFER_RSI,INDICATOR_DATA);
   SetIndexBuffer(1,COLOR_BUFFER_RSI,INDICATOR_CALCULATIONS);
   SetIndexBuffer(2,RSIBuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,BUFFER_MA200,INDICATOR_CALCULATIONS);
   SetIndexBuffer(4,BUFFER_MA5,INDICATOR_CALCULATIONS);
   
    PlotIndexSetDouble( 0,PLOT_EMPTY_VALUE,0);
    PlotIndexSetDouble( 1,PLOT_EMPTY_VALUE,0);
    PlotIndexSetDouble( 2,PLOT_EMPTY_VALUE,0);
   
   IndicatorSetInteger(INDICATOR_LEVELS,2);
   IndicatorSetInteger(INDICATOR_DIGITS,2);
   
   
   PeriodoMaximo=PeriodoRSI;
   RSI=iRSI(Symbol(),PERIOD_CURRENT,PeriodoRSI,APPLIEDPRICE);
   MA200=iMA(Symbol(),PERIOD_CURRENT,200,0,MODE_SMA,PRICE_CLOSE);
   MA5=iMA(Symbol(),PERIOD_CURRENT,5,0,MODE_SMA,PRICE_CLOSE);
   
   IndicatorSetString(INDICATOR_SHORTNAME,"HAROLD P2D RSI");
   
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
 
   if(prev_calculated==0)
     {
      int copied1=CopyBuffer(RSI,0,0,rates_total,RSIBuffer);
      int copied2=CopyBuffer(MA200,0,0,rates_total,BUFFER_MA200);
      int copied3=CopyBuffer(MA5,0,0,rates_total,BUFFER_MA5);
     }
   else
     {
      int to_copy=rates_total-prev_calculated;
      if(to_copy==0) to_copy=1;
      int copied1=CopyBuffer(RSI,0,0,to_copy,RSIBuffer);
      int copied2=CopyBuffer(MA200,0,0,to_copy,BUFFER_MA200);
      int copied3=CopyBuffer(MA5,0,0,to_copy,BUFFER_MA5);
     }
     
   int start=PeriodoMaximo;
   if(prev_calculated>0) start=prev_calculated-1;
   for(int i=start; i<rates_total; i++)
     {
      BUFFER_RSI[i]=RSIBuffer[i];
      
      if(close[i]>BUFFER_MA200[i] && close[i]<BUFFER_MA5[i] && RSIBuffer[i]<LevelIndicatorDown){
      COLOR_BUFFER_RSI[i]=0;
      }
      else 
      if (close[i]<BUFFER_MA200[i] && BUFFER_MA5[i]<close[i] && RSIBuffer[i]>LevelIndicatorUp){
      COLOR_BUFFER_RSI[i]=1;
      }
      else{
      COLOR_BUFFER_RSI[i]=1;
      }
      
      //col = close > ma200 and close < ma5 and rsi < 10 ? lime : close < ma200 and close > ma5 and rsi > 90 ? yellow : yellow
      
     }
   return(rates_total);
  }

