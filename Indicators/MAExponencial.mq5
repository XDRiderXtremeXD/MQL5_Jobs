//+------------------------------------------------------------------+
//|                                                MAExponencial.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots   1
//--- las propiedades de la línea están establecidas por medio de las directivas del compilador
#property indicator_label1  "EMA_TradeStation"      // nombre de la construcción para la "Ventana de datos" 
#property indicator_type1   DRAW_LINE   // tipo de construcción gráfica - una línea 
#property indicator_color1  clrRed      // color de la línea 
#property indicator_style1  STYLE_SOLID // estilo de la línea 
#property indicator_width1  1           // grosor de la línea 


input ENUM_APPLIED_PRICE Price=PRICE_CLOSE;
input int Length=12;

double SmoothingFactor=0;

double LineBuffer[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(Length<0)
     {
      Alert("The Length input of the XAverage function must be greater than or equal to 0.");
      return INIT_PARAMETERS_INCORRECT;
     }

   SetIndexBuffer(0,LineBuffer,INDICATOR_DATA);

   ArraySetAsSeries(LineBuffer,true);
//--- indicator buffers mapping
   SmoothingFactor=2.0/(Length+1);
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
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(open,true);
   ArraySetAsSeries(close,true);

   int to_copy=BarrasFaltanIterar(prev_calculated,rates_total);

   for(int shift=to_copy-1; shift>=0; shift--)
     {
      double precio=Precio(high,low,open,close,shift);

      if(shift==rates_total-1)
         LineBuffer[shift]=precio;
      else
         LineBuffer[shift] =LineBuffer[shift+1] + SmoothingFactor * (precio - LineBuffer[shift+1]);
     }

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
int BarrasFaltanIterar(int prev_calculated,int rates_total)
  {
   int to_copy=0;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      //--- last value is always copied
      to_copy++;
     }
   return to_copy;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Precio(double const &high[],double const &low[],double const &open[],double const &close[],int shift)
  {
   if(Price==PRICE_CLOSE)
      return close[shift];
   if(Price==PRICE_OPEN)
      return open[shift];
   if(Price==PRICE_HIGH)
      return high[shift];
   if(Price==PRICE_LOW)
      return low[shift];
   if(Price==PRICE_MEDIAN)
      return ((high[shift]+low[shift])/2);
   if(Price==PRICE_TYPICAL)
      return ((high[shift]+low[shift]+close[shift])/3);
   if(Price==PRICE_WEIGHTED)
      return ((high[shift]+low[shift]+close[shift]+close[shift])/4);

   return close[shift];
  }
//+------------------------------------------------------------------+
