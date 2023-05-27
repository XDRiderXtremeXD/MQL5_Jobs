//+------------------------------------------------------------------+
//|                                    TradingView RSI Indicator.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 7
#property indicator_plots   4
//--- plot ColorSection
#property indicator_label1  "ColorSection"
#property indicator_type1   DRAW_COLOR_SECTION
//--- estableceremos 8 colores para colorear los segmentos (se guardan en un array especial)
#property indicator_color1  clrRed,clrGreen
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2
#property indicator_label2  "BUY"
#property indicator_type2   DRAW_ARROW
#property indicator_color2  clrGreen
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2
#property indicator_label3  "SELL"
#property indicator_type3   DRAW_ARROW
#property indicator_color3  clrRed
#property indicator_style3  STYLE_SOLID
#property indicator_width3  2

input int RSI_Period=14;
input int level_Up=70;
input int level_Dn=30;


double         ColorSectionBuffer[];
double         ColorSectionColors[];
double         Direccion[];
double         RSI_UP[];
double         RSI_DN[];
double         BUY[];
double         SELL[];


int rsi_handle_UP=0;
int rsi_handle_DN=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,ColorSectionBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,ColorSectionColors,INDICATOR_DATA);
   SetIndexBuffer(2,BUY,INDICATOR_DATA);
   SetIndexBuffer(3,SELL,INDICATOR_DATA);
   SetIndexBuffer(4,Direccion,INDICATOR_DATA);
   SetIndexBuffer(5,RSI_UP,INDICATOR_DATA);
   SetIndexBuffer(6,RSI_DN,INDICATOR_DATA);

   rsi_handle_UP=iRSI(Symbol(),PERIOD_CURRENT,RSI_Period,PRICE_HIGH);
   rsi_handle_DN=iRSI(Symbol(),PERIOD_CURRENT,RSI_Period,PRICE_LOW);
//--- el valor 0 (valor vacío) no va a participar en el proceso de trazado
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(3,PLOT_EMPTY_VALUE,0);
   ArrayInitialize(Direccion,0);

   PlotIndexSetInteger(1,PLOT_ARROW,233);
   PlotIndexSetInteger(2,PLOT_ARROW,234);


   ArraySetAsSeries(ColorSectionBuffer,false);
   ArraySetAsSeries(ColorSectionColors,false);
   ArraySetAsSeries(Direccion,false);
   ArraySetAsSeries(RSI_DN,false);
   ArraySetAsSeries(RSI_UP,false);

   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,RSI_Period+1);
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
//--- check if all data calculated
   if(BarsCalculated(rsi_handle_UP)<rates_total)
      return(0);
   if(BarsCalculated(rsi_handle_DN)<rates_total)
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
   if(CopyBuffer(rsi_handle_UP,0,0,to_copy,RSI_UP)<=0)
      return(0);
   if(CopyBuffer(rsi_handle_DN,0,0,to_copy,RSI_DN)<=0)
      return(0);

//--- número de la barra a partir del cual empezaremos a calcular los valores del indicador
   int start=RSI_Period+1;
//--- si el indicador ha sido calculado antes, estableceremos start para la barra anterior
   if(prev_calculated>0)
     {
      start=prev_calculated-1;
     }
   else
     {
      ArrayInitialize(ColorSectionBuffer,0);
      ArrayInitialize(BUY,0);
      ArrayInitialize(SELL,0);
      ArrayInitialize(Direccion,0);
     }
//--- aquí están todos los cálculos de los valores del indicador
   for(int i=start; i<rates_total; i++)
     {
      Direccion[i]=Direccion[i-1];
      ColorSectionBuffer[i]=0;
      BUY[i]=0;
      SELL[i]=0;

      if(RSI_DN[i-1]>=level_Dn && RSI_DN[i]<level_Dn && (Direccion[i-1]==-1 || Direccion[i-1]==0))
        {
         ColorSectionBuffer[i]=high[i];
         ColorSectionColors[i]=1;
         Direccion[i]=1;
         SELL[i]=high[i];
        }

      if(RSI_UP[i-1]<=level_Up && RSI_UP[i]>level_Up  && (Direccion[i-1]==1 || Direccion[i-1]==0))
        {
         ColorSectionBuffer[i]=low[i];
         ColorSectionColors[i]=0;
         Direccion[i]=-1;
         BUY[i]=low[i];
        }
     }
//--- volveremos el valor prev_calculated para la siguiente llamada de la función
   return(rates_total);
  }
//+------------------------------------------------------------------+
