//+------------------------------------------------------------------+
//|                                                      TMA-ATR.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "mladen"
#property link      "mladenfx@gmail.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers    6
#property indicator_plots 3
#property indicator_color1     White
#property indicator_color2     Red
#property indicator_color3     Blue
#property indicator_type1    DRAW_LINE
#property indicator_type2    DRAW_LINE
#property indicator_type3    DRAW_LINE
#property indicator_style1     STYLE_DOT
#property indicator_style2     STYLE_DOT
#property indicator_style3     STYLE_DOT

//
//
//
//
//

input string TimeFrame       = "current time frame";
input int    HalfLength      = 56;
input ENUM_APPLIED_PRICE    Price   = PRICE_CLOSE;
input double ATRMultiplier   = 2;
input int    ATRPeriod       = 100;
input bool   Interpolate     = true;

input bool   alertsOn        = false;
input bool   alertsOnCurrent = false;
input bool   alertsOnHighLow = false;
input bool   alertsMessage   = false;
input bool   alertsSound     = false;
input bool   alertsEmail     = false;

//

double buffer1[];
double buffer2[];
double buffer3[];
double trend[];

//

string indicatorFileName;
bool   calculateValue;
bool   returnBars;
int    timeFrame;

int ma_handle=0;
int atr_handle=0;
double MABuffer[];
double ATRBuffer[];
//+------------------------------------------------------------------+

int HalfLength_=HalfLength;
//+------------------------------------------------------------------+
int OnInit()
  {
   HalfLength_=MathMax(HalfLength_,1);
   SetIndexBuffer(0,buffer1,INDICATOR_DATA);
   SetIndexBuffer(1,buffer2,INDICATOR_DATA);
   SetIndexBuffer(2,buffer3,INDICATOR_DATA);
   SetIndexBuffer(3,trend,INDICATOR_DATA);
   SetIndexBuffer(4,MABuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,ATRBuffer,INDICATOR_CALCULATIONS);

   ArraySetAsSeries(buffer1,true);
   ArraySetAsSeries(buffer2,true);
   ArraySetAsSeries(buffer3,true);
   ArraySetAsSeries(trend,true);
   ArraySetAsSeries(MABuffer,true);
   ArraySetAsSeries(ATRBuffer,true);

   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,HalfLength_);
   PlotIndexSetInteger(1,PLOT_DRAW_BEGIN,HalfLength_);
   PlotIndexSetInteger(2,PLOT_DRAW_BEGIN,HalfLength_);
   PlotIndexSetInteger(3,PLOT_DRAW_BEGIN,HalfLength_);

//
   indicatorFileName = MQLInfoString(MQL_PROGRAM_NAME);

   returnBars        = TimeFrame=="returnBars";
   if(returnBars)
      return(INIT_SUCCEEDED);
   calculateValue    = TimeFrame=="calculateValue";
   if(calculateValue)
      return(INIT_SUCCEEDED);
   timeFrame         = stringToTimeFrame(TimeFrame);

   ma_handle=iMA(NULL,0,1,0,MODE_SMA,Price);
   atr_handle=iATR(NULL,0,ATRPeriod);
//
   IndicatorSetString(INDICATOR_SHORTNAME,timeFrameToString(timeFrame)+" TMA bands )"+IntegerToString(HalfLength_)+")");


   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason) {}




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
                const datetime& time[],     // Time
                const double& open[],       // Open
                const double& high[],       // High
                const double& low[],        // Low
                const double& close[],      // Close
                const long& tick_volume[],  // Tick Volume
                const long& volume[],       // Real Volume
                const int& spread[]         // Spread
               )
  {

   ArraySetAsSeries(high,true);
   ArraySetAsSeries(close,true);
   ArraySetAsSeries(open,true);
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(time,true);


   if(BarsCalculated(ma_handle)<rates_total)
      return(0);
   if(BarsCalculated(atr_handle)<rates_total)
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
   if(CopyBuffer(ma_handle,0,0,to_copy,MABuffer)<=0)
      return(0);
   if(CopyBuffer(atr_handle,0,0,to_copy,ATRBuffer)<=0)
      return(0);


   int counted_bars=prev_calculated;
   int i,j,k,limit;

   if(counted_bars<0)
      return(0);
   if(counted_bars>0)
      counted_bars--;
   limit=MathMin(rates_total-HalfLength_-10,rates_total-counted_bars+HalfLength_);

   if(returnBars)
     {
      buffer1[0] = limit+1;
      return(rates_total);
     }

//
//
//
//
//

   if(calculateValue || timeFrame==Period())
     {
      for(i=limit; i>=0; i--)
        {
         double sum  = (HalfLength_+1)*MABuffer[i];
         double sumw = (HalfLength_+1);

         for(j=1, k=HalfLength_; j<=HalfLength_&& j+i<rates_total; j++, k--)
           {
            sum  += k*MABuffer[i+j];
            sumw += k;

            if(j<=i)
              {
               sum  += k*MABuffer[i-j];
               sumw += k;
              }
           }

         //
         //
         //
         //
         //

         double range = ATRBuffer[i+10]*ATRMultiplier;
         buffer1[i] = sum/sumw;
         buffer2[i] = buffer1[i]+range;
         buffer3[i] = buffer1[i]-range;

         //
         //
         //
         //
         //

         trend[i] = 0;
         if(alertsOnHighLow)
           {
            if(high[i] > buffer2[i])
               trend[i] =  1;
            if(low[i]  < buffer3[i])
               trend[i] = -1;
           }
         else
           {
            if(close[i] > buffer2[i])
               trend[i] =  1;
            if(close[i] < buffer3[i])
               trend[i] = -1;
           }
        }
      if(!calculateValue)
         manageAlerts(time);
      return(rates_total);
     }

//
//
//
//
//
   double Label1Buffer[],b1[],b2[],b3[],tr[];
   int HandleCustom=iCustom(NULL,ENUM_TIMEFRAMES(timeFrame),indicatorFileName,"returnBars");
   int HandleCustomBuffer=iCustom(NULL,ENUM_TIMEFRAMES(timeFrame),indicatorFileName,"calculateTma",HalfLength_,Price,ATRMultiplier,ATRPeriod);

   if(BarsCalculated(HandleCustomBuffer)<Bars(Symbol(),ENUM_TIMEFRAMES(timeFrame)))
      return 0;
    
   /* if(BarsCalculated(HandleCustom)<Bars(Symbol(),ENUM_TIMEFRAMES(timeFrame)))
      return 0;  
   Print(BarsCalculated(HandleCustom));
   Print(BarsCalculated(HandleCustomBuffer));*/

   int copy=CopyBuffer(HandleCustom,0,0,1,Label1Buffer);
   if(copy==-1)
   return 0;

   limit = MathMax(limit,MathMin(rates_total-1,int(Label1Buffer[0]*PeriodSeconds(ENUM_TIMEFRAMES(timeFrame))/PeriodSeconds(Period()))));

   for(i=limit; i>=0; i--)
     {
      int y = iBarShift(NULL,ENUM_TIMEFRAMES(timeFrame),time[i]);
      CopyBuffer(HandleCustomBuffer,0,y,1,b1);
      CopyBuffer(HandleCustomBuffer,1,y,1,b2);
      CopyBuffer(HandleCustomBuffer,2,y,1,b3);
      CopyBuffer(HandleCustomBuffer,3,y,1,tr);


      buffer1[i] = b1[0];
      buffer2[i] = b2[0];
      buffer3[i] = b3[0];
      trend[i]   = tr[0];

     // Print(i," ",b1[0]);
      //
      //
      //
      //
      //

      if(i-1<0)
         continue;

      if(timeFrame <= Period() || (y==iBarShift(NULL,ENUM_TIMEFRAMES(timeFrame),time[i-1])))
         continue;
      if(!Interpolate)
         continue;

      //
      //
      //
      //
      //

      datetime time_ = iTime(NULL,ENUM_TIMEFRAMES(timeFrame),y);
      int n=1;

      if(i+n>=rates_total)
         continue;

      for(n = 1; i+n <rates_total && time[i+n] >= time_; n++)
         continue;
      for(k = 1; k < n && i+n<rates_total; k++)
        {
         buffer1[i+k] = buffer1[i]  +(buffer1[i+n]-buffer1[i])*k/n;
         buffer2[i+k] = buffer2[i]  +(buffer2[i+n]-buffer2[i])*k/n;
         buffer3[i+k] = buffer3[i]  +(buffer3[i+n]-buffer3[i])*k/n;
        }
     }

//
//
//
//
//

   manageAlerts(time);
   return(rates_total);
  }

//+-------------------------------------------------------------------
//|
//+-------------------------------------------------------------------
//
//
//
//
//

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void manageAlerts(const datetime &time[])
  {
   if(alertsOn)
     {
      int whichBar=0;
      if(alertsOnCurrent)
         whichBar = 0;
      else
         whichBar = 1;
      whichBar = iBarShift(NULL,0,iTime(NULL,ENUM_TIMEFRAMES(timeFrame),whichBar));
      if(trend[whichBar] != trend[whichBar+1])
        {
         if(trend[whichBar] == 1)
            doAlert(whichBar,"up",time);
         if(trend[whichBar] ==-1)
            doAlert(whichBar,"down",time);
        }
     }
  }

//
//
//
//
//

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void doAlert(int forBar, string doWhat,const datetime &time[])
  {
   static string   previousAlert="nothing";
   static datetime previousTime;
   string message;

   if(previousAlert != doWhat || previousTime != time[forBar])
     {
      previousAlert  = doWhat;
      previousTime   = time[forBar];

      //
      //
      //
      //
      //

      StringConcatenate(message,Symbol()," at ",TimeToString(TimeLocal(),TIME_SECONDS)," "+timeFrameToString(timeFrame)+" TMA bands price penetrated ",doWhat," band");
      if(alertsMessage)
         Alert(message);
      if(alertsEmail)
        {
         SendMail(Symbol()+"TMA bands ",message);
        }
      if(alertsSound)
         PlaySound("alert2.wav");
     }
  }

//+-------------------------------------------------------------------
//|
//+-------------------------------------------------------------------
//
//
//
//
//

string sTfTable[] = {"M1","M5","M15","M30","H1","H4","D1","W1","MN"};
int    iTfTable[] = {1,5,15,30,60,240,1440,10080,43200};
ENUM_TIMEFRAMES    iTfTablePeriodo[] = {PERIOD_M1,PERIOD_M5,PERIOD_M15,PERIOD_M30,PERIOD_H1,PERIOD_H4,PERIOD_D1,PERIOD_W1,PERIOD_MN1};
//
//
//
//
//

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ENUM_TIMEFRAMES stringToTimeFrame(string tfs)
  {
   tfs = StringUpperCase(tfs);
   for(int i=ArraySize(iTfTable)-1; i>=0; i--)
      if(tfs==sTfTable[i] || tfs==""+IntegerToString(iTfTable[i]))
        {
         if(PeriodSeconds(ENUM_TIMEFRAMES(Period()))>PeriodSeconds(iTfTablePeriodo[i]))
            return Period();
         else
           {
            return iTfTablePeriodo[i];
           }
        }
   return(Period());
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

//
//
//
//
//

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringUpperCase(string str)
  {
   string   s = str;

   for(int length=StringLen(str)-1; length>=0; length--)
     {
      int ñchar = StringGetCharacter(s, length);
      if((ñchar > 96 && ñchar < 123) || (ñchar > 223 && ñchar < 256))
         StringSetCharacter(s, length,ushort(ñchar - 32));
      else
         if(ñchar > -33 && ñchar < 0)
            StringSetCharacter(s, length,ushort(ñchar + 224));
     }
   return(s);
  }
//+------------------------------------------------------------------+
