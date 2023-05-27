//+------------------------------------------------------------------+
//|                                           ProbandoParametros.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//--- obtenemos el manejador del indicador
   int handle=iMA(Symbol(),PERIOD_CURRENT,12,0,MODE_EMA,PRICE_CLOSE);
//--- mostramos en el diario
//---
   MqlParam parameters[];
   ENUM_INDICATOR indicator_type;
   int params=IndicatorParameters(handle,indicator_type,parameters);
//--- encabezamiento del mensaje
   string par_info="Short name ADX"+", type "
                   +EnumToString(ENUM_INDICATOR(indicator_type))+"\r\n";
//---
   for(int p=0; p<params; p++)
     {
      par_info+=StringFormat("parameter %d: type=%s, long_value=%d, double_value=%G,string_value=%s\r\n",
                             p,
                             EnumToString((ENUM_DATATYPE)parameters[p].type),
                             parameters[p].integer_value,
                             parameters[p].double_value,
                             parameters[p].string_value
                            );
     }
     Print(par_info);
  }
//+------------------------------------------------------------------+
