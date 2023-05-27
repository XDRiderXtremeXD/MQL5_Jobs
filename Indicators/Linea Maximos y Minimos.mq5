//+------------------------------------------------------------------+
//|                                      Linea Maximos y Minimos.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#property description "Indicador para dibujar Maximos y Minimos"
 
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_plots   2

//--- parámetros input
//--- plot Color_Histogram
#property indicator_label1  "Linea_Maximo"
#property indicator_type1   DRAW_LINE
#property indicator_label2  "Linea_Minimo"
#property indicator_type2   DRAW_LINE
//--- estableceremos 8 colores para colorear los segmentos (se guardan en un array especial)
#property indicator_color1  clrLightSeaGreen;
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2
#property indicator_color2  clrLightSeaGreen;
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

double         MaximoLinea[];
//--- búfer para los Maximos
double         MinimoLinea[];
//--- búfer para los Minimos
input uint Periodos=14;


int IndicatorTrend;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   
   
   SetIndexBuffer(0, MaximoLinea,INDICATOR_DATA);
   SetIndexBuffer(1,MinimoLinea,INDICATOR_DATA);

   ArraySetAsSeries(MaximoLinea,true);
   ArraySetAsSeries(MinimoLinea,true);   
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
  int limit=rates_total-prev_calculated;
  for(int i=0;i<limit;i++){
  MaximoLinea[i]=iHigh(NULL,PERIOD_CURRENT,iHighest(Symbol(),PERIOD_CURRENT,MODE_HIGH,Periodos,i));
  MinimoLinea[i]=iLow(NULL,PERIOD_CURRENT,iLowest(Symbol(),PERIOD_CURRENT,MODE_LOW,Periodos,i));
  }
   return(rates_total);
  }