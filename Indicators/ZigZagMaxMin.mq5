//+------------------------------------------------------------------+
//|                                                 ZigZagMaxMin.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots 1
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+

#property indicator_label1  "ZZ"
#property indicator_color1  clrRed
#property indicator_type1   DRAW_SECTION
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1



input string S6_="==================     ZIGZAG     ================================";//*--
input int ZigZag_Depth=14;     // Depth
input int ZigZag_Deviation=5;  // Deviation
input int ZigZag_Backstep=3;   // Backstep


int ZigZag=0;
double ZZ_Buffer[];

double UltimosZZ_Maximos[];
double UltimosZZ_Minimos[];
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   ZigZag=iCustom(Symbol(),PERIOD_CURRENT,"Examples//ZigZag",ZigZag_Depth,ZigZag_Deviation,ZigZag_Backstep);  // Registro del máximo del ZigZag
   SetIndexBuffer(0,ZZ_Buffer,INDICATOR_DATA);
   ArraySetAsSeries(ZZ_Buffer,true);//Para que el Arreglo se invierta automaticamente
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);

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

   ArraySetAsSeries(close,true);
   ArraySetAsSeries(open,true);

   if(prev_calculated==rates_total)
      return rates_total;

   if(BarsCalculated(ZigZag)<rates_total)
      return(0);
//--- we can copy not all data
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=MathMin(rates_total, (ZigZag_Depth*ZigZag_Deviation*ZigZag_Backstep)*50);
      //--- last value is always copied
      to_copy++;
     }
   if(CopyBuffer(ZigZag,0,0,rates_total,ZZ_Buffer)<=0)
      return(0);


   ArrayResize(UltimosZZ_Maximos,0);
   ArrayResize(UltimosZZ_Minimos,0);
   int SizeArrayMaximos=ArraySize(UltimosZZ_Maximos);
   int SizeArrayMinimos=ArraySize(UltimosZZ_Maximos);

   for(int i=0; (SizeArrayMaximos<4 || SizeArrayMinimos<4) && i<rates_total; i++)
     {
      double UP=(close[i]>open[i])?close[i]:open[i];
      double DN=(close[i]<open[i])?close[i]:open[i];
      double Value_ZZ=ZZ_Buffer[i];

      if(Value_ZZ!=0)
        {
         SizeArrayMaximos=ArraySize(UltimosZZ_Maximos);
         SizeArrayMinimos=ArraySize(UltimosZZ_Minimos);

         if(SizeArrayMaximos<4)
            if(UP<=Value_ZZ)
              {
               ArrayResize(UltimosZZ_Maximos,SizeArrayMaximos+1);
               if(SizeArrayMaximos!=0)
                  UltimosZZ_Maximos[SizeArrayMaximos-1]=ZZ_Buffer[i];
               else
                  ZZ_Buffer[i]=0;
              }
         if(SizeArrayMinimos<4)
            if(DN>=Value_ZZ)
              {
               ArrayResize(UltimosZZ_Minimos,SizeArrayMinimos+1);
               if(SizeArrayMinimos!=0)
                  UltimosZZ_Minimos[SizeArrayMinimos-1]=ZZ_Buffer[i];
               else
                  ZZ_Buffer[i]=0;
              }
        }
     }
   if(SizeArrayMaximos>3 && SizeArrayMinimos>3)
      Comment(
         "ALTOS:  "+ DoubleToString(UltimosZZ_Maximos[0],2), " ", DoubleToString(UltimosZZ_Maximos[1],2), " ", DoubleToString(UltimosZZ_Maximos[2],2)+"\n"
         "BAJOS:  "+ DoubleToString(UltimosZZ_Minimos[0],2), " ", DoubleToString(UltimosZZ_Minimos[1],2), " ", DoubleToString(UltimosZZ_Minimos[2],2));

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
