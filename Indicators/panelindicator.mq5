//+------------------------------------------------------------------
//|                                               PanelIndicator.mq5 |
//|                        Copyright 2011, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------
#property copyright "Copyright 2011, MetaQuotes Software Corp."
#property link      "http://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window
#property indicator_plots               0
#property indicator_buffers             0
#property indicator_minimum             0.0
#property indicator_maximum             0.0
//+------------------------------------------------------------------+
//| Archivos include                                                 |
//+------------------------------------------------------------------+
#include <paneldialog.mqh>
//+------------------------------------------------------------------+
//| Variables globales                                               |
//+------------------------------------------------------------------+
CPanelDialog ExtDialog;
//+------------------------------------------------------------------+
//| Inicialización                                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- Creando el diálogo de aplicación
   if(!ExtDialog.Create(0,"Panel Indicator",0,0,0,0,130))
      return(-1);
//--- iniciando la aplicación
   if(!ExtDialog.Run())
      return(-2);
//--- Creando el temporizador
   EventSetTimer(1);
//--- éxito
   return(0);
  }
//+------------------------------------------------------------------+
//| Deinicialización                                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- Destruyendo el diálogo
   ExtDialog.Destroy();
//--- Matando el temporizador
   EventKillTimer();
  }
//+------------------------------------------------------------------+
//| Iteración                                                        |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const int begin,
                const double &price[])
  {
//--- Cambiando la propiedad de diálogo
   ExtDialog.SetRed(MathRand()%256);
//--- devolviendo el valor prev_calculated para la siguiente llamada
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| Controlador de eventos del temporizador                          |
//+------------------------------------------------------------------+
void OnTimer()
  {
//--- Cambiando la propiedad de diálogo
   ExtDialog.SetGreen(MathRand()%256);
  }
//+------------------------------------------------------------------+
//| Controlador de eventos del Gráfico                               |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//--- controlando del evento
   ExtDialog.ChartEvent(id,lparam,dparam,sparam);
  }
//+------------------------------------------------------------------
