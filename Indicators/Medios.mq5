//+------------------------------------------------------------------+
//|                                                       Medios.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots   1
#property indicator_buffers 1

#property indicator_label1  "Middle"
#property indicator_color1  clrRed
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

input color ColorPunto=clrBlack;

double Cuadrado_Medio[];

datetime prevtime=0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {     
   SetIndexBuffer(0,Cuadrado_Medio,INDICATOR_DATA);
   PlotIndexSetInteger(0,PLOT_ARROW,167);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetInteger(0,PLOT_LINE_COLOR,ColorPunto);
   
   ArrayInitialize(Cuadrado_Medio,EMPTY_VALUE);
   
   return(INIT_SUCCEEDED);
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
   
   if(prevtime == time[rates_total-1]) //|| ENUM_TIMEFRAMES(Period())!=PERIOD_D1)
      return(rates_total);
      
   prevtime = time[rates_total-1];

   int START;
   if(prev_calculated==0)
     {
      START=0;
      ArrayInitialize(Cuadrado_Medio,EMPTY_VALUE);
     }
   else
      START=rates_total-1;

   for(int shift = START; shift < rates_total ; shift++)
     {
      Cuadrado_Medio[shift]=EMPTY_VALUE;
      double Suma=close[shift]>open[shift]?open[shift]:close[shift];
      double Valor=Suma+(MathAbs(close[shift]-open[shift])/2);
      Cuadrado_Medio[shift]=Valor;
     }

   return(rates_total);
  }
//+------------------------------------------------------------------+