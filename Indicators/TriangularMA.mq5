//+------------------------------------------------------------------+
//|                                                 TriangularMA.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "mladen"
#property link      "mladenfx@gmail.com"

#property indicator_chart_window
#property indicator_buffers 9


#property indicator_color1  clrDodgerBlue
#property indicator_color2  clrOrangeRed
#property indicator_color3  clrLimeGreen
#property indicator_color4  clrYellow
#property indicator_color5  clrYellow

#property indicator_style1  STYLE_DOT
#property indicator_style2  STYLE_DOT
#property indicator_style3  STYLE_DOT


//
//
//
//
//

input string TimeFrame       = "0";
input int    HalfLength      = 50;
input int    Price           = PRICE_WEIGHTED;
input double BandsDeviations = 2.618;
input double koeff           = 0.0001;
input bool   Interpolate     = true;
input bool   alertsOn        = false;
input bool   alertsOnCurrent = false;
input bool   alertsOnHighLow = false;
input bool   alertsMessage   = false;
input bool   alertsSound     = false;
input bool   alertsEmail     = false;

//
//
//
//
//

double tmBuffer[];
double upBuffer[];
double dnBuffer[];
double wuBuffer[];
double wdBuffer[];
double upArrow[];
double dnArrow[];
double ATR[];
double MA[];
//
//
//
//
//

string IndicatorFileName;
bool   calculatingTma = false;
bool   returningBars  = false;
ENUM_TIMEFRAMES    timeFrame;

int halfLength;
int atrHandle;
int maHandle;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//
//
//
//

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   halfLength=HalfLength;
   timeFrame  = stringToTimeFrame(TimeFrame);
   halfLength = MathMax(halfLength,1);
   SetIndexBuffer(0,tmBuffer);
   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,halfLength);
   PlotIndexSetInteger(0,PLOT_DRAW_TYPE,DRAW_LINE);
   SetIndexBuffer(1,upBuffer);
   PlotIndexSetInteger(1,PLOT_DRAW_BEGIN,halfLength);
   PlotIndexSetInteger(1,PLOT_DRAW_TYPE,DRAW_LINE);
   SetIndexBuffer(2,dnBuffer);
   PlotIndexSetInteger(2,PLOT_DRAW_BEGIN,halfLength);
   PlotIndexSetInteger(2,PLOT_DRAW_TYPE,DRAW_LINE);
   SetIndexBuffer(3,dnArrow);
   PlotIndexSetInteger(3,PLOT_DRAW_TYPE,DRAW_ARROW);
   PlotIndexSetInteger(3,PLOT_ARROW,233);
   SetIndexBuffer(4,upArrow);
   PlotIndexSetInteger(4,PLOT_DRAW_TYPE,DRAW_ARROW);
   PlotIndexSetInteger(4,PLOT_ARROW,234);
   SetIndexBuffer(5,wuBuffer);
   SetIndexBuffer(6,wdBuffer);
   SetIndexBuffer(7,ATR);
   SetIndexBuffer(8,MA);

   ArraySetAsSeries(tmBuffer,true);
   ArraySetAsSeries(upBuffer,true);
   ArraySetAsSeries(dnBuffer,true);
   ArraySetAsSeries(dnArrow,true);
   ArraySetAsSeries(upArrow,true);
   ArraySetAsSeries(wuBuffer,true);
   ArraySetAsSeries(wdBuffer,true);
   ArraySetAsSeries(ATR,true);
   ArraySetAsSeries(MA,true);

   if(TimeFrame=="calculateTma")
     {
      calculatingTma=true;
      return(0);
     }
   if(TimeFrame=="returnBars")
     {
      returningBars=true;
      return(0);
     }
   atrHandle=iATR(Symbol(),PERIOD_CURRENT,20);
   maHandle=iMA(Symbol(),PERIOD_CURRENT,1,0,MODE_SMA,Price);

   IndicatorFileName=MQLInfoString(MQL_PROGRAM_NAME);
   return(0);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(int const reason) {  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//
//
//
//
//

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,       // tamaño de series temporales de entrada
                const int prev_calculated,  // procesado de barras en la anterior llamada
                const datetime& Time[],     // Time
                const double& Open[],       // Open
                const double& High[],       // High
                const double& Low[],        // Low
                const double& Close[],      // Close
                const long& tick_volume[],  // Tick Volume
                const long& volume[],       // Real Volume
                const int& spread[]         // Spread
               )
  {
   ArraySetAsSeries(Open,true);
   ArraySetAsSeries(Close,true);
   ArraySetAsSeries(High,true);
   ArraySetAsSeries(Low,true);
   ArraySetAsSeries(Time,true);

   if(BarsCalculated(atrHandle)<rates_total)
      return(0);
   if(BarsCalculated(maHandle)<rates_total)
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
   if(CopyBuffer(atrHandle,0,0,to_copy,ATR)<=0)
      return(0);
   if(CopyBuffer(maHandle,0,0,to_copy,MA)<=0)
      return(0);

   int counted_bars=prev_calculated;
   int i,limit;

   if(counted_bars<0)
      return(-1);
   if(counted_bars>0)
      counted_bars--;
   limit=MathMin(rates_total-2,rates_total-counted_bars+halfLength);

   if(returningBars)
     {
      tmBuffer[0] = limit;
      return(prev_calculated);
     }
   if(calculatingTma)
     {
      calculateTma(limit,rates_total);
      return(prev_calculated);
     }
   if(PeriodSeconds(timeFrame)>PeriodSeconds(Period()))
      limit=MathMax(limit,MathMin(rates_total-2,iCustom(NULL,timeFrame,IndicatorFileName,"returnBars",0,0)*PeriodSeconds(timeFrame)/PeriodSeconds(Period())));

//
//
//
//
//

   for(i=limit; i>=0; i--)
     {
      int      shift1 = iBarShift(NULL,timeFrame,Time[i]);
      datetime time1  = iTime(NULL,timeFrame,shift1);

      //
      //
      //
      //
      //

      tmBuffer[i] = iCustom(NULL,timeFrame,IndicatorFileName,"calculateTma",halfLength,Price,BandsDeviations,0,shift1);
      upBuffer[i] = iCustom(NULL,timeFrame,IndicatorFileName,"calculateTma",halfLength,Price,BandsDeviations,1,shift1);
      dnBuffer[i] = iCustom(NULL,timeFrame,IndicatorFileName,"calculateTma",halfLength,Price,BandsDeviations,2,shift1);

      upArrow[i] = EMPTY_VALUE;
      dnArrow[i] = EMPTY_VALUE;
      if(High[i+1]>upBuffer[i+1] && Close[i+1]>Open[i+1] && Close[i]<Open[i])
         upArrow[i] = High[i]+ATR[i]+koeff;
      if(Low[i+1]<dnBuffer[i+1] && Close[i+1]<Open[i+1] && Close[i]>Open[i])
         dnArrow[i] = Low[i]-ATR[i]-koeff;

      if(PeriodSeconds(timeFrame)<=PeriodSeconds(Period()) || shift1==iBarShift(NULL,timeFrame,Time[i-1]))
         continue;
      if(!Interpolate)
         continue;

      //
      //
      //
      //
      //
      int n;
      for(n=1; i+n<rates_total && Time[i+n]>=time1; n++)
         continue;
      double factor=1.0/n;
      for(int k=1; k<n; k++)
        {
         tmBuffer[i+k] = k*factor*tmBuffer[i+n] + (1.0-k*factor)*tmBuffer[i];
         upBuffer[i+k] = k*factor*upBuffer[i+n] + (1.0-k*factor)*upBuffer[i];
         dnBuffer[i+k] = k*factor*dnBuffer[i+n] + (1.0-k*factor)*dnBuffer[i];
        }
     }

//
//
//
//
//
   int forBar=0;
   if(alertsOn)
     {
      if(alertsOnCurrent)
         forBar = 0;
      else
         forBar = 1;
      if(alertsOnHighLow)
        {
         if(High[forBar]>upBuffer[forBar] && High[forBar+1]<upBuffer[forBar+1])
            doAlert("HIGH|SELL",Time);
         if(Low[forBar]<dnBuffer[forBar] && Low[forBar+1]>dnBuffer[forBar+1])
            doAlert("LOW|BUY",Time);
        }
      else
        {
         if(Close[forBar]>upBuffer[forBar] && Close[forBar+1]<upBuffer[forBar+1])
            doAlert("CLOSE|SELL",Time);
         if(Close[forBar]<dnBuffer[forBar] && Close[forBar+1]>dnBuffer[forBar+1])
            doAlert("CLOSE|BUY",Time);
        }
     }

   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//
//
//
//
//

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void calculateTma(int limit,int const rates_total)
  {
   int i,j,k;
   double FullLength=2.0*halfLength+1.0;


   for(i=limit; i>=0; i--)
     {
      double sum  = (halfLength+1)*MA[i];
      double sumw = (halfLength+1);
      for(j=1,k=halfLength; j<=halfLength; j++,k--)
        {
         sum  += k*MA[i+j];
         sumw += k;

         if(j<=i)
           {
            sum  += k*MA[i-j];
            sumw += k;
           }
        }
      tmBuffer[i]=sum/sumw;

      //
      //
      //
      //
      //

      double diff=MA[i]-tmBuffer[i];
      if(i>(rates_total-halfLength-1))
         continue;
      if(i==(rates_total-halfLength-1))
        {
         upBuffer[i] = tmBuffer[i];
         dnBuffer[i] = tmBuffer[i];
         if(diff>=0)
           {
            wuBuffer[i] = MathPow(diff,2);
            wdBuffer[i] = 0;
           }
         else
           {
            wdBuffer[i] = MathPow(diff,2);
            wuBuffer[i] = 0;
           }
         continue;
        }

      //
      //
      //
      //
      //

      if(diff>=0)
        {
         wuBuffer[i] = (wuBuffer[i+1]*(FullLength-1)+MathPow(diff,2))/FullLength;
         wdBuffer[i] =  wdBuffer[i+1]*(FullLength-1)/FullLength;
        }
      else
        {
         wdBuffer[i] = (wdBuffer[i+1]*(FullLength-1)+MathPow(diff,2))/FullLength;
         wuBuffer[i] =  wuBuffer[i+1]*(FullLength-1)/FullLength;
        }
      upBuffer[i] = tmBuffer[i] + BandsDeviations*MathSqrt(wuBuffer[i]);
      dnBuffer[i] = tmBuffer[i] - BandsDeviations*MathSqrt(wdBuffer[i]);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//
//
//
//
//

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void doAlert(string doWhat,datetime const &Time[])
  {
   static string   previousAlert="";
   static datetime previousTime;
   string message;

   if(previousAlert!=doWhat || previousTime!=Time[0])
     {
      previousAlert = doWhat;
      previousTime  = Time[0];

      StringConcatenate(message,Symbol(),"|# Time: ",TimeToString(TimeLocal(),TIME_SECONDS)," |#",doWhat);
      if(alertsMessage)
         Alert(message);
      if(alertsEmail)
        {
         string resultString;
         StringConcatenate(resultString,Symbol(),"TMA ");
         SendMail(resultString,message);
        }
      if(alertsSound)
         PlaySound("alert2.wav");
      SendNotification(message+" |# TF = "+EnumToString(ChartPeriod()));
     }
  }

//
//
//
//
//

//-------------------------------------------------------------------
//
//-------------------------------------------------------------------

string sTfTable[] = {"M1","M5","M15","M30","H1","H4","D1","W1","MN"};
int    iTfTable[] = {1,5,15,30,60,240,1440,10080,43200};
ENUM_TIMEFRAMES    periodTable[] = {PERIOD_M1,PERIOD_M5,PERIOD_M15,PERIOD_M30,PERIOD_H1,PERIOD_H4,PERIOD_D1,PERIOD_W1,PERIOD_MN1};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ENUM_TIMEFRAMES stringToTimeFrame(string tfs)
  {
   StringToUpper(tfs);
   for(int i=ArraySize(iTfTable)-1; i>=0; i--)
      if(tfs==sTfTable[i] || tfs==""+IntegerToString(iTfTable[i]))
        {
         ENUM_TIMEFRAMES Periodo=PeriodSeconds(PERIOD_CURRENT)<PeriodSeconds(periodTable[i])?periodTable[i]:PERIOD_CURRENT;
         return Periodo;
        }
   return(PERIOD_CURRENT);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string timeFrameToString(int tf)
  {
   for(int i=ArraySize(iTfTable)-1; i>=0; i--)
      if(tf==iTfTable[i])
         return(sTfTable[i]);
   return("");
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
