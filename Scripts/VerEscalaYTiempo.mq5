//+------------------------------------------------------------------+
//|                                             VerEscalaYTiempo.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property script_show_inputs

enum show
  {
   No_Ver_Precio_Tiempo,
   Ver_Precio_Tiempo,
  };


input show Visualizacion=No_Ver_Precio_Tiempo;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   ChartSetInteger(0,CHART_SHOW_DATE_SCALE,Visualizacion);
   ChartSetInteger(0,CHART_SHOW_PRICE_SCALE,Visualizacion);
  }
//+------------------------------------------------------------------+
