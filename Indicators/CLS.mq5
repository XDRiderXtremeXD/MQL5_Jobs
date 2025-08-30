//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2020, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                          CLS.mq5 |
//|                        Copyright 2021, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property indicator_separate_window
#property indicator_buffers 4
#property indicator_plots 4
#property indicator_color1 clrChocolate
#property indicator_color2 clrGreenYellow
#property indicator_color3 clrAqua
#property indicator_color4 clrRed
#property indicator_label1 "Marron"
#property indicator_label2 "Verde"
#property indicator_label3 "Azul"
#property indicator_label4 "Media"

// Buffers
double marronBuffer[];
double verdeBuffer[];
double azulBuffer[];
double mediaBuffer[];

double PVI[];
double NVI[];

double PVI_EMA[];
double NVI_EMA[];
double K_BUFFER[];

// Input parameters
input int lengthEMA = 255;
input int m = 15;
input double mult = 2.0;

// Function to calculate RMA

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double calc_pvi(const long &volumes[], const double &closes[],int i,int indexPVI)
  {
   if(i == 0)
      return 0;

   double sval = double(volumes[i]);

   if(volumes[i] > volumes[i - 1])
      return PVI[indexPVI-1] + ((closes[i] - closes[i - 1]) / closes[i - 1]) * sval;
   else
     {
      return PVI[indexPVI-1];
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double calc_nvi(const long &volumes[], const double &closes[],int i,int indexPVI)
  {
   if(i == 0)
      return 0;

   double sval = double(volumes[i]);
   if(volumes[i] < volumes[i - 1])
      return NVI[indexPVI-1] + ((closes[i] - closes[i - 1]) / closes[i - 1]) * sval;
   else
      return  NVI[indexPVI-1];
  }

/*

double calc_stoch(const double &closes[], int length, int smoothFastD, int i) {
    double ll = Low[iLowest(NULL, 0, MODE_LOW, length, i)];
    double hh = High[iHighest(NULL, 0, MODE_HIGH, length, i)];
    double k = 100 * (closes[i] - ll) / (hh - ll);
    double k_array[1];
    k_array[0] = k;
    return iMAOnArray(k_array, 0, smoothFastD, 0, MODE_SMA, 0);
}*/
int ma_handle;
int std_handle;
int rsi_handle;
int mfi_handle;

double MA[];
double STD[];
double RSI[];
double XMF[];
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   SetIndexBuffer(0, marronBuffer,INDICATOR_DATA);
   SetIndexBuffer(1, verdeBuffer,INDICATOR_DATA);
   SetIndexBuffer(2, azulBuffer,INDICATOR_DATA);
   SetIndexBuffer(3, mediaBuffer,INDICATOR_DATA);
//SetIndexBuffer(4, PVI,INDICATOR_CALCULATIONS);

   PlotIndexSetInteger(0,PLOT_DRAW_TYPE,DRAW_LINE);
   PlotIndexSetInteger(0,PLOT_LINE_STYLE,STYLE_SOLID);
   PlotIndexSetInteger(0,PLOT_LINE_WIDTH,2);

   PlotIndexSetInteger(1,PLOT_DRAW_TYPE,DRAW_LINE);
   PlotIndexSetInteger(1,PLOT_LINE_STYLE,STYLE_SOLID);
   PlotIndexSetInteger(1,PLOT_LINE_WIDTH,2);

   PlotIndexSetInteger(2,PLOT_DRAW_TYPE,DRAW_LINE);
   PlotIndexSetInteger(2,PLOT_LINE_STYLE,STYLE_SOLID);
   PlotIndexSetInteger(2,PLOT_LINE_WIDTH,2);

   PlotIndexSetInteger(3,PLOT_DRAW_TYPE,DRAW_LINE);
   PlotIndexSetInteger(3,PLOT_LINE_STYLE,STYLE_SOLID);
   PlotIndexSetInteger(3,PLOT_LINE_WIDTH,2);

   ArraySetAsSeries(marronBuffer,false);
   ArraySetAsSeries(verdeBuffer,false);
   ArraySetAsSeries(azulBuffer,false);
   ArraySetAsSeries(mediaBuffer,false);

   ArraySetAsSeries(PVI,false);
   ArraySetAsSeries(NVI,false);
   ArraySetAsSeries(PVI_EMA,false);
   ArraySetAsSeries(NVI_EMA,false);
   ArraySetAsSeries(K_BUFFER,false);

   ArraySetAsSeries(MA,true);
   ArraySetAsSeries(STD,true);
   ArraySetAsSeries(RSI,true);
   ArraySetAsSeries(XMF,true);


   IndicatorSetInteger(INDICATOR_LEVELS,1);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,0,0);
   IndicatorSetInteger(INDICATOR_LEVELCOLOR,clrWhite);

   ArrayResize(PVI,m*2+1);
   ArrayResize(NVI,m*2+1);
   ArrayResize(K_BUFFER,m*2+1);
   ArrayResize(NVI_EMA,92);
   ArrayResize(PVI_EMA,92);

   ArrayInitialize(PVI,0);
   ArrayInitialize(NVI,0);
   ArrayInitialize(K_BUFFER,0);
   ArrayInitialize(NVI_EMA,0);
   ArrayInitialize(PVI_EMA,0);


   ma_handle=iMA(Symbol(),PERIOD_CURRENT,25,0,MODE_SMA,PRICE_WEIGHTED);
   std_handle=iStdDev(Symbol(),PERIOD_CURRENT,25,0,MODE_SMA,PRICE_WEIGHTED);
   rsi_handle=iRSI(Symbol(),PERIOD_CURRENT,14,PRICE_WEIGHTED);
   mfi_handle=iMFI(Symbol(),PERIOD_CURRENT,14,VOLUME_TICK);

   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(int const reason)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
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

   ArraySetAsSeries(open,false);
   ArraySetAsSeries(high,false);
   ArraySetAsSeries(low,false);
   ArraySetAsSeries(close,false);
   ArraySetAsSeries(tick_volume,false);
   ArraySetAsSeries(marronBuffer,false);


   if(prev_calculated==0 || rates_total<=0)
     {
      ArrayInitialize(PVI,0);
      ArrayInitialize(NVI,0);
      ArrayInitialize(K_BUFFER,0);
      ArrayInitialize(NVI_EMA,0);
      ArrayInitialize(PVI_EMA,0);
     }

   Comment("Cargando..");
//--- check if all data calculated
   if(BarsCalculated(ma_handle)<rates_total)
      return(0);
   if(BarsCalculated(std_handle)<rates_total)
      return(0);
   if(BarsCalculated(rsi_handle)<rates_total)
      return(0);
   if(BarsCalculated(mfi_handle)<rates_total)
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
   if(CopyBuffer(ma_handle,0,0,to_copy+1,MA)<=0)
      return(0);
   if(CopyBuffer(std_handle,0,0,to_copy+1,STD)<=0)
      return(0);
   if(CopyBuffer(rsi_handle,0,0,to_copy+1,RSI)<=0)
      return(0);
   if(CopyBuffer(mfi_handle,0,0,to_copy+1,XMF)<=0)
      return(0);


   for(int i = rates_total-to_copy; i <rates_total; i++)
     {
      double Value = (open[i] + high[i] + low[i] + close[i]) / 4;

      // Calculating PVI
      if(prev_calculated!=rates_total)
        {
         reordenarArreglo(PVI);
         reordenarArreglo(NVI);
         reordenarArreglo(PVI_EMA);
         reordenarArreglo(NVI_EMA);
         reordenarArreglo(K_BUFFER);
        }

      NVI[m*2]=calc_nvi(tick_volume, close,i, m*2);

      PVI[m*2]=calc_pvi(tick_volume, close,i, m*2);

      // Calculating NVI

      
      PVI_EMA[91]=iMAOnArray(PVI, m, 0, MODE_EMA,0);

      NVI_EMA[91]=iMAOnArray(NVI, m, 0, MODE_EMA,0);

      //marronBuffer[i]=NVI_EMA[i];

      double pvimax=Highest(PVI_EMA,91,90);
      double pvimin=Lowest(PVI_EMA,91,90);
      double nvimax=Highest(NVI_EMA,91,90);
      double nvimin=Lowest(NVI_EMA,91,90);

      double oscp = (PVI[m*2] - PVI_EMA[91]) * 100.0/ ((pvimax - pvimin)==0?1:pvimax - pvimin);
      azulBuffer[i]=(NVI[m*2] - NVI_EMA[91]) * 100.0/ ((nvimax - nvimin)==0?1:nvimax - nvimin);

      double basis=MA[rates_total-1-i];
      double dev=mult*STD[rates_total-1-i];
      double upper = basis + dev;
      double lower = basis - dev;
      double OB1 = (upper + lower) / 2.0;
      double OB2 = upper - lower;
      double BollOsc = ((Value - OB1) / (OB2==0?1:OB2)) * 100;
      double xrsi = RSI[rates_total-1-i];

      double ll=Lowest(low,i,21);
      double hh=Highest(high,i,21);
      K_BUFFER[m*2]=100*(Value-ll)/(hh-ll);
      double stoc=iMAOnArray(K_BUFFER, 3, 0, MODE_SMA, 0);

      marronBuffer[i]=(xrsi+XMF[rates_total-1-i]+ BollOsc + (stoc / 3))/2;
      verdeBuffer[i]=marronBuffer[i]+oscp;
      SacarMedia(marronBuffer,m,0,MODE_EMA,mediaBuffer,i);
     }
     
   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double iMAOnArray(double& array[], int period, int ma_shift, ENUM_MA_METHOD ma_method, int shift,bool es=false)
  {

   double buf[], arr[];
   int total = ArraySize(array);

   if(total <= period)
      return 0;

   if(shift > total - period - ma_shift)
      return 0;

   switch(ma_method)
     {

      case MODE_SMA:
        {

         total = ArrayCopy(arr, array, 0, shift + ma_shift, period);
         if(ArrayResize(buf, total) < 0)
            return 0;

         double sum = 0;
         int i, pos = total-1;

         for(i = 1; i < period && i<ArraySize(array); i++, pos--)

            sum += arr[pos];

         while(pos >= 0)
           {

            sum += arr[pos];

            buf[pos] = sum / period;

            sum -= arr[pos + period - 1];

            pos--;

           }

         return buf[0];

        }



      case MODE_EMA:
        {


         if(ArrayResize(buf, total) < 0)
           {
            return 0;
           }

         double pr = 2.0 / (period + 1);

         int pos = total - 2;
         while(pos >= 0)
           {

            if(pos == total - 2)
              {

               buf[pos+1] = array[pos+1];
              }

            buf[pos] = array[pos] * pr + buf[pos+1] * (1-pr);
            ;
            pos--;

           }

         return buf[shift+ma_shift];

        }



      case MODE_SMMA:
        {

         if(ArrayResize(buf, total) < 0)

            return(0);

         double sum = 0;

         int i, k, pos;



         pos = total - period;

         while(pos >= 0)
           {

            if(pos == total - period)
              {

               for(i = 0, k = pos; i < period; i++, k++)
                 {

                  sum += array[k];

                  buf[k] = 0;

                 }

              }

            else

               sum = buf[pos+1] * (period-1) + array[pos];

            buf[pos]=sum/period;

            pos--;

           }

         return buf[shift+ma_shift];

        }



      case MODE_LWMA:
        {

         if(ArrayResize(buf, total) < 0)

            return 0;

         double sum = 0.0, lsum = 0.0;

         double price;

         int i, weight = 0, pos = total-1;



         for(i = 1; i <= period; i++, pos--)
           {

            price = array[pos];

            sum += price * i;

            lsum += price;

            weight += i;

           }

         pos++;

         i = pos + period;

         while(pos >= 0)
           {

            buf[pos] = sum / weight;

            if(pos == 0)

               break;

            pos--;

            i--;

            price = array[pos];

            sum = sum - lsum + price * period;

            lsum -= array[i];

            lsum += price;

           }

         return buf[shift+ma_shift];

        }

     }

   return 0;

  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SacarMedia(double& array[], int period, int ma_shift, ENUM_MA_METHOD ma_method,double &arrayDst[],int index)
  {
  if(index<2)
  return;

   double buf[], arr[];
   int total = ArraySize(array);

   if(total <= period)
      return ;

   switch(ma_method)
     {
      case MODE_EMA:
        {
         if(ArrayResize(buf, total) < 0)
            return ;

         double pr = 2.0 / (period + 1);

         int pos = total - 2;

         double valorAnterior=arrayDst[index-1];

         if(index == 2 || !MathIsValidNumber(valorAnterior))
            arrayDst[index-1] = array[index-1];
          
        
         arrayDst[index] = array[index] * pr + arrayDst[index-1] * (1-pr);
        }
     }

   return ;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void reordenarArreglo(double &array[])
  {
   int size=ArraySize(array);
   for(int i=0; i<size-1; i++)
      array[i]=array[i+1];
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Highest(double &series[],int i,int conteo)
  {
   double Maximo=series[i];
   for(int j=1; j<conteo && i-j>=0; j++)
     {
      if(series[i-j]>Maximo)
         Maximo=series[i-j];
     }
   return Maximo;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Lowest(double &series[],int i,int conteo)
  {
   double Minimo=series[i];
   for(int j=1; j<conteo && i-j>=0; j++)
     {
      if(series[i-j]<Minimo)
         Minimo=series[i-j];
     }
   return Minimo;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Highest(double const &series[],int i,int conteo)
  {
   double Maximo=series[i];
   for(int j=1; j<conteo && i-j>=0; j++)
     {
      if(series[i-j]>Maximo)
         Maximo=series[i-j];
     }
   return Maximo;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Lowest(double const &series[],int i,int conteo)
  {
   double Minimo=series[i];
   for(int j=1; j<conteo && i-j>=0; j++)
     {
      if(series[i-j]<Minimo)
         Minimo=series[i-j];
     }
   return Minimo;
  }
//+------------------------------------------------------------------+
