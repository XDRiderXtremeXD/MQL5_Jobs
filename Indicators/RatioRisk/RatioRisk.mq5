//+------------------------------------------------------------------+
//|                                                    RatioRisk.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0

#include "RatioRiskObjects.mqh"

input double Lote=1.0;

input int TP_Points_Default=200;//TP Puntos
input int SL_Points_Default=100;//SL Puntos
input int SizeText=14;//Tamaño letra
input color colorTP=clrGreen;//Color TP
input color colorSL=clrRed;//Color SL
input color colorOP=clrWhite;
input bool Fill=true;
input ENUM_BASE_CORNER PosicionBotones=CORNER_LEFT_LOWER;

Risk_Objects Ratios;


datetime TiempoPrueba=D'2023.10.6 00:00';

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(TiempoPrueba<TimeCurrent())
     {
      Alert("Tiempo Prueba finalizo el dia ",TimeToString(TiempoPrueba,TIME_DATE|TIME_MINUTES));
      return INIT_FAILED;
     }
   Comment("Tiempo prueba hasta el dia ",TimeToString(TiempoPrueba,TIME_DATE|TIME_MINUTES));

   Ratios.Initialice_And_LoadObjetos(TP_Points_Default,SL_Points_Default,colorTP,colorSL,colorOP,Lote,PosicionBotones,SizeText,Fill);
//--- indicator buffers mapping
   ChartSetInteger(0,CHART_EVENT_MOUSE_MOVE,true);
   ChartSetInteger(0,CHART_EVENT_OBJECT_DELETE,true);
//---
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Ratios.OnDeinit_(reason);

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
   static bool prueba=true;
   if(TiempoPrueba<TimeCurrent())
     {
      if(prueba)
         Alert("Tiempo Prueba finalizo el dia ",TimeToString(TiempoPrueba,TIME_DATE|TIME_MINUTES));
      prueba=false;
     }
   else
      Ratios.ChartEven_(id,lparam,dparam,sparam);

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
