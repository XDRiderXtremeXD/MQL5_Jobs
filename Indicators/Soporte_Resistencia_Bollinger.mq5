//+------------------------------------------------------------------+
//|                                Soporte_Resistencia_Bollinger.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 4
#property indicator_plots 2

#property indicator_label1   "FLECHA-BUY"
#property indicator_color1  clrPink
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2   "FLECHA-SELL"
#property indicator_color2  clrAqua
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

double ArrowSignalBuy[];
double ArrowSignalSell[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
input string Settings_Alligator="***Settings_Alligator***";
input int Jaw=13;
input int Jaw_Shift=8;
input int Teeth=8;
input int Teeth_Shift=5;
input int Lips=5;
input int Lips_Shift=3;
input ENUM_MA_METHOD Mode_Alligator=MODE_SMMA;
input ENUM_APPLIED_PRICE AppliedPrice_Alligator=PRICE_MEDIAN;
input string Settings_Bollinger_1="***Settings_Bollinger_1***";
input int Bollinger_1_Periodo=20;
input int Bollinger_1_Shift=0;
input int Bollinger_1_Desviation=7;

int Puntos_Rompimiento_Tendencia;

double Puntos_UP_Buffer[];
double Puntos_DN_Buffer[];

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   PlotIndexSetInteger(0,PLOT_ARROW,172);
   PlotIndexSetInteger(1,PLOT_ARROW,172);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(0,ArrowSignalBuy,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalSell,INDICATOR_DATA);
   
   Puntos_Rompimiento_Tendencia=iCustom(Symbol(),PERIOD_CURRENT,"Puntos_Rompimiento_Tendencia",Settings_Alligator,Jaw,Jaw_Shift,Teeth,
   Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator,
   Settings_Bollinger_1,Bollinger_1_Periodo,Bollinger_1_Shift,Bollinger_1_Desviation);
   
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
 static datetime prev_time=0;

   if(BarsCalculated(Puntos_Rompimiento_Tendencia)<rates_total)
      return(0);
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(Puntos_Rompimiento_Tendencia,1,0,to_copy,Puntos_UP_Buffer)<=0)
   if(CopyBuffer(Puntos_Rompimiento_Tendencia,0,0,to_copy,Puntos_DN_Buffer)<=0)
      return(0);


   if(prev_time==time[rates_total-1])
      return(rates_total);

   int Start=54;
   if(prev_calculated>0)
      Start=rates_total-1;


   for(int i=Start ; i<rates_total; i++)
     {
      ArrowSignalBuy[i]=EMPTY_VALUE;
      ArrowSignalSell[i]=EMPTY_VALUE;
      
     }
   prev_time=time[rates_total-1];
   return(rates_total);
  }
//+------------------------------------------------------------------+
