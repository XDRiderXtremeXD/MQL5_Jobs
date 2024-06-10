//------------------------------------------------------------------
#property copyright ""
#property link  ""

//------------------------------------------------------------------

#property indicator_separate_window
#property indicator_buffers 5
#property indicator_plots 2
#property indicator_label1  "Histogram"
#property indicator_type1   DRAW_COLOR_HISTOGRAM
#property indicator_color1  clrLime,clrRed
#property indicator_label2  "ColorArrow"
#property indicator_type2   DRAW_COLOR_ARROW
#property indicator_color2  clrMagenta,clrAqua
//---- input parameters
input int       bolPrd=20;
input double    bolDev=2.0;
input int       keltPrd=20;
input double    keltFactor=1.5;
input int       momPrd=12;
//---- buffers
double Value_HistogramBuffer[];
double Color_HistogramColors[];
double ArrowBuffer[];
double ArrowColors[];
double MABuffer[];

int i,j,slippage=3;
double breakpoint=0.0;
double ema=0.0;
int peakf=0;
int peaks=0;
int valleyf=0;
int valleys=0;
double ccis[61],ccif[61];
double delta=0;
double ugol=0;

int ma_handle;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   SetIndexBuffer(0,Value_HistogramBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,Color_HistogramColors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(2,ArrowBuffer,INDICATOR_DATA);
   SetIndexBuffer(3,ArrowColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(4,MABuffer,INDICATOR_CALCULATIONS);

   PlotIndexSetInteger(1,PLOT_ARROW,159);

   ma_handle=iMA(NULL,0,bolPrd,0,MODE_EMA,PRICE_CLOSE);

   ArraySetAsSeries(Value_HistogramBuffer,true);
   ArraySetAsSeries(Color_HistogramColors,true);
   ArraySetAsSeries(ArrowBuffer,true);
   ArraySetAsSeries(ArrowColors,true);
   ArraySetAsSeries(MABuffer,true);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custor indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
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
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(close,true);
   ArraySetAsSeries(open,true);
   ArraySetAsSeries(time,true);

   if(BarsCalculated(ma_handle)<rates_total)
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


   if(prev_calculated==0)
     {
      ArrayInitialize(Value_HistogramBuffer,EMPTY_VALUE);
      ArrayInitialize(Color_HistogramColors,EMPTY_VALUE);
      ArrayInitialize(ArrowBuffer,EMPTY_VALUE);
      ArrayInitialize(ArrowColors,EMPTY_VALUE);
     }


   int counted_bars=prev_calculated;
   int shift,limit;
//  double diff,d,std,bbs;
   double d;
   if(counted_bars<0)
      return(-1);
   if(counted_bars>0)
      counted_bars--;
   limit=rates_total-(bolPrd+1);
   if(counted_bars>=(bolPrd+1))
      limit=rates_total-counted_bars-1;

   for(shift=limit; shift>=0; shift--)
     {
      //d=iMomentum(NULL,0,momPrd,PRICE_CLOSE,shift);
      d=LinearRegressionValue(bolPrd,shift,low,high,close,rates_total);
      if(d>0)
        {
         Value_HistogramBuffer[shift]=d;
         Color_HistogramColors[shift]=0;
        }
      else
        {
         Color_HistogramColors[shift]=1;
         Value_HistogramBuffer[shift]=d;
        }
      /*
         diff = iATR(NULL,0,keltPrd,shift)*keltFactor;
         std = iStdDev(NULL,0,bolPrd,MODE_SMA,0,PRICE_CLOSE,shift);
         bbs = bolDev * std / diff;
         if(bbs<1)
           {
            upK[shift]=0;
            loK[shift]=EMPTY_VALUE;
           }
         else
           {
            loK[shift]=0;
            upK[shift]=EMPTY_VALUE;
           }
       */
     }
   return(rates_total);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double LinearRegressionValue(int Len,int shift,const double &Low[],const double &High[],const double &Close[],int rt)
  {
   double SumBars = 0;
   double SumSqrBars = 0;
   double SumY = 0;
   double Sum1 = 0;
   double Sum2 = 0;
   double Slope = 0;

   SumBars = Len * (Len-1) * 0.5;
   SumSqrBars = (Len - 1) * Len * (2 * Len - 1)/6;

   for(int x=0; x<=Len-1; x++)
     {
      double HH = Low[x+shift];
      double LL = High[x+shift];
      for(int y=x; y<=(x+Len)-1 && y+shift<rt; y++)
        {
         HH = MathMax(HH, High[y+shift]);
         LL = MathMin(LL, Low[y+shift]);
        }
      Sum1 += x* (Close[x+shift]-((HH+LL)/2 + MABuffer[x+shift])/2);
      SumY += (Close[x+shift]-((HH+LL)/2 +  MABuffer[x+shift])/2);
     }
   Sum2 = SumBars * SumY;
   double Num1 = Len * Sum1 - Sum2;
   double Num2 = SumBars * SumBars-Len * SumSqrBars;

   if(Num2 != 0.0)
     {
      Slope = Num1/Num2;
     }
   else
     {
      Slope = 0;
     }

   double Intercept = (SumY - Slope*SumBars) /Len;
//debugPrintln(Intercept+" : "+Slope);
   double LinearRegValue = Intercept+Slope * (Len - 1);

   return (LinearRegValue);

  }

//+------------------------------------------------------------------+
