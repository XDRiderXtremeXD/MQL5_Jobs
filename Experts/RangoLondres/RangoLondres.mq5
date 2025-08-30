//+------------------------------------------------------------------+
//|                                                 RangoLondres.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include "RangoFunciones.mqh"

input int numero_magico=2222;
input int maximoCaja=250;
input string s0="=== CHECKPOINTS ====";//========================================
input uint sl_puntos=50;//Stop Loss
input uint puntos1=50;//1 CheckPoint
input uint puntos2=100;//2 CheckPoint
input uint puntos3=150;//3 CheckPoint
input uint tp_puntos=200;//4 CheckPoint (0 se desactiva)
input double lotaje=0.01;//Volumen
input string s1="=== TRAILING, si es 0 se desactiva ====";//========================================
input uint TrailingEn2=50;//Puntos Trailing en 2 CheckPoint
input uint TrailingEn3=100;//Puntos Trailing en 3 CheckPoint
input string s2="=== MA ====";//========================================
input ENUM_TIMEFRAMES tf_MA=PERIOD_H4;
input uint periodo_MA_=15;
input ENUM_MA_METHOD method_MA=MODE_SMA;
input int conteoMA=8;
input string            S2="=== LONDRES ====";//================================================
input string            TiempoStart1 = "07:00";             // Tiempo de inicio para el rango
input string            TiempoEnd1 = "08:00";               // Tiempo de fin para el rango
input string            TiempoEvaluacionFinal1 = "17:00";               // Tiempo evaluacion final rango
input color             colorRango1=clrAqua; //Color Rango

RangoFunciones rangoLondon();

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   if(!rangoLondon.CrearRango(TiempoStart1,TiempoEnd1,TiempoEvaluacionFinal1,"LONDRES",colorRango1))
      return INIT_FAILED;
   if(!rangoLondon.SetearInicial(numero_magico,sl_puntos,puntos1,puntos2,puntos3,tp_puntos,lotaje,TrailingEn2,TrailingEn3,maximoCaja,tf_MA,periodo_MA_,method_MA,conteoMA))
      return INIT_FAILED;
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   rangoLondon.OnTick_();
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---

  }
//+------------------------------------------------------------------+
