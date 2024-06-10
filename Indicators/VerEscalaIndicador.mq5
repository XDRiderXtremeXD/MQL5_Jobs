//+------------------------------------------------------------------+
//|                                           VerEscalaIndicador.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0


enum show
  {
   No_Ver_Precio,
   Ver_Precio,
  };


input show Visualizacion=No_Ver_Precio;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
  ChartSetInteger(0,CHART_SHOW_PRICE_SCALE,Visualizacion);
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
//---

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // identificador de evento
                  const long& lparam,   // parámetro de evento del tipo long
                  const double& dparam, // parámetro de evento del tipo double
                  const string& sparam  // parámetro de evento del tipo string
                 )
  {

   if(ChartGetInteger(0,CHART_SHOW_PRICE_SCALE,0)!=Visualizacion)
      ChartSetInteger(0,CHART_SHOW_PRICE_SCALE,Visualizacion);

  }
//+------------------------------------------------------------------+
