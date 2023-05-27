
//+------------------------------------------------------------------+
//|                                               OnTimer_Sample.mq5 |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property description "Ejemplo de uso de un temporizador para calcular la hora de un servidor comercial"
#property description "Es mejor iniciar el asesor al final de la semana comercial, antes del fin de semana"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- creamos un temporizador con un periodo de 1 segundo
   EventSetTimer(PeriodSeconds(PERIOD_M1));
 
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- eliminamos el temporizador al finalizar el trabajo
   EventKillTimer();
 
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
 
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//--- hora de la primera llamada de OnTimer()
   static datetime start_time=TimeCurrent();
//--- hora del servidor comercial en la primera llamada de OnTimer();
   static datetime start_tradeserver_time=0;
//--- hora calculada del servidor comercial
   static datetime calculated_server_time=0;
//--- hora local en la computadora
   datetime local_time=TimeLocal();
//--- hora calculada actual del servidor comercial
   datetime trade_server_time=TimeTradeServer();
//--- si por algún motivo se desconoce la hora del servidor, salimos antes de tiempo
   if(trade_server_time==0)
      return;
//--- si el valor inicial del servidor comercial no se ha establecido aún
   if(start_tradeserver_time==0)
     {
      start_tradeserver_time=trade_server_time;
      //--- establecemos el valor a calcular del servidor comercial      
      Print(trade_server_time);
      calculated_server_time=trade_server_time;
     }
   else
     {
      //--- aumentamos la hora de la primera llamada de OnTimer()
      if(start_tradeserver_time!=0)
         calculated_server_time=calculated_server_time+1;;
     }
//--- 
   string com=StringFormat("                  Start time: %s\r\n",TimeToString(start_time,TIME_MINUTES|TIME_SECONDS));
   com=com+StringFormat("                  Local time: %s\r\n",TimeToString(local_time,TIME_MINUTES|TIME_SECONDS));
   com=com+StringFormat("TimeTradeServer time: %s\r\n",TimeToString(trade_server_time,TIME_MINUTES|TIME_SECONDS));
   com=com+StringFormat(" EstimatedServer time: %s\r\n",TimeToString(calculated_server_time,TIME_MINUTES|TIME_SECONDS));
//--- mostramos los valores de todos los contadores en el gráfico
   Comment(com);
  }