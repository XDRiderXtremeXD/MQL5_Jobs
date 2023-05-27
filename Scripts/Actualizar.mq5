//+------------------------------------------------------------------+
//|                                                   Actualizar.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property script_show_inputs


input string Simbolo="USDCAD";
input ENUM_TIMEFRAMES TimeFrames=PERIOD_D1;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
  Print(TimeToString(iTime(Simbolo,TimeFrames,1),TIME_DATE|TIME_MINUTES));
   
  }
//+------------------------------------------------------------------+
