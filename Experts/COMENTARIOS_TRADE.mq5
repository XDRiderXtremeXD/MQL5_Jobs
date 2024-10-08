//+------------------------------------------------------------------+
//|                                            COMENTARIOS_TRADE.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

input    int days=7;            // profundidad de la historia comercial en días
//--- establecemos a nivel global los límites de la historia comercial
datetime     start;             // fecha de comienzo de la historia comercial en la caché
datetime     end;               // fecha de finalización de la historia comercial en la caché
//--- contadores globales
int          orders;            // número de órdenes activas
int          positions;         // número de posiciones abiertas
int          deals;             // número de transacciones en la caché de la historia comercial
int          history_orders;    // número de órdenes en la caché de la historia comercial
bool         started=false;     // bandera de relevancia de los contadores

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   end=TimeCurrent();
   start=end-days*PeriodSeconds(PERIOD_D1);
   PrintFormat("Límites de la historia comercial a cargar: comienzo - %s, final - %s",
               TimeToString(start),TimeToString(end));
   InitCounters();
//---
   return(0);
  }
//+------------------------------------------------------------------+
//|  Inicialización de los contadores de posiciones, órdenes y transacciones
//+------------------------------------------------------------------+
void InitCounters()
  {
   ResetLastError();
//--- cargamos la historia
   bool selected=HistorySelect(start,end);
   if(!selected)
     {
      PrintFormat("%s. No se ha logrado cargar en la caché la historia desde %s hasta %s. Código de error: %d",
                  __FUNCTION__,TimeToString(start),TimeToString(end),GetLastError());
      return;
     }
//--- obtenemos los valores actuales
   orders=OrdersTotal();
   positions=PositionsTotal();
   deals=HistoryDealsTotal();
   history_orders=HistoryOrdersTotal();
   started=true;
   Print("Los contadores de posiciones, órdenes y transacciones se han inicializado con éxito");
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   if(started)
      SimpleTradeProcessor();
   else
      InitCounters();
  }
//+------------------------------------------------------------------+
//| se llama al suceder el evento Trade                              |
//+------------------------------------------------------------------+
void OnTrade()
  {
   if(started)
      SimpleTradeProcessor();
   else
      InitCounters();
  }
//+------------------------------------------------------------------+
//| ejemplo de procesamiento de los cambios en el comercio y la historia
//+------------------------------------------------------------------+
void SimpleTradeProcessor()
  {
   end=TimeCurrent();
   ResetLastError();
//--- cargamos en la caché del programa la historia comercial del intervalo indicado
   bool selected=HistorySelect(start,end);
   if(!selected)
     {
      PrintFormat("%s. No se ha logrado cargar en la caché la historia desde %s hasta %s. Código de error: %d",
                  __FUNCTION__,TimeToString(start),TimeToString(end),GetLastError());
      return;
     }
//--- obtenemos los valores actuales
   int curr_orders=OrdersTotal();
   int curr_positions=PositionsTotal();
   int curr_deals=HistoryDealsTotal();
   int curr_history_orders=HistoryOrdersTotal();
//--- comprobamos los cambios en el número de órdenes activas
   if(curr_orders!=orders)
     {
      //--- el número de órdenes activas ha cambiado
      PrintFormat("El número de órdenes ha cambiado. Era %d, ahora es %d",
                  orders,curr_orders);
      //--- actualizamos el valor
      orders=curr_orders;
     }
//--- cambios en el número de posiciones abiertas
   if(curr_positions!=positions)
     {
      //--- el número de posiciones abiertas ha cambiado
      PrintFormat("El número de posiciones ha cambiado. Era %d, ahora es %d",
                  positions,curr_positions);
      //--- actualizamos el valor
      positions=curr_positions;
     }
//--- cambios en el número de transacciones en la caché de la historia comercial
   if(curr_deals!=deals)
     {
      //--- el número de transacciones en la caché de la historia comercial ha cambiado
      PrintFormat("Ha cambiado el número de transacciones. Era %d, ahora es %d",
                  deals,curr_deals);

      long ticket=HistoryDealGetTicket(curr_deals-1);
      if(ticket>0)
         Print("tipo ",HistoryDealGetInteger(ticket,DEAL_TYPE)," ENTRY ",HistoryDealGetInteger(ticket,DEAL_ENTRY)," ",HistoryDealGetInteger(ticket,DEAL_POSITION_ID));
      //--- actualizamos el valor
      deals=curr_deals;
     }
//--- cambios en el número de órdenes históricas en la caché de la historia comercial
   if(curr_history_orders!=history_orders)
     {
      //--- el número de órdenes históricas en la caché de la historia comercial ha cambiado
      PrintFormat("Ha cambiado el número de órdenes en la historia. Era %d, ahora es %d",
                  history_orders,curr_history_orders);
      long ticket=HistoryOrderGetTicket(curr_history_orders-1);
      if(ticket>0)
         Print("tipo ",HistoryOrderGetInteger(ticket,ORDER_TYPE)," STATE ",HistoryOrderGetInteger(ticket,ORDER_STATE));
      //--- actualizamos el valor
      history_orders=curr_history_orders;
     }
//--- comprobamos la necesidad de cambiar los límites de la historia comercial para la solicitud a la caché
   CheckStartDateInTradeHistory();
  }
//+------------------------------------------------------------------+
//|  cambios de la fecha inicial para solicitar la historia comercial|
//+------------------------------------------------------------------+
void CheckStartDateInTradeHistory()
  {
//--- intervalo inicial, si empezáramos el trabajo ahora mismo
   datetime curr_start=TimeCurrent()-days*PeriodSeconds(PERIOD_D1);
//--- comprobamos que el límite de inicio de la historia comercial se haya apartado no más
//--- de 1 día de la fecha pensada
   if(curr_start-start>PeriodSeconds(PERIOD_D1))
     {
      //--- se deberá corregir la fecha de inicio de la historia cargada en la caché
      start=curr_start;
      PrintFormat("Nuevo límite de comienzo de la historia comercial a cargar: inicio => %s",
                  TimeToString(start));
      //--- ahora cargamos de nuevo la historia comercial para el intervalo actualizado
      HistorySelect(start,end);
      //--- corregimos los contadores de transacciones y órdenes en la historia para la siguiente comparación
      history_orders=HistoryOrdersTotal();
      deals=HistoryDealsTotal();
     }
  }
//+------------------------------------------------------------------+
/* Ejemplo de muestra:
  Límites de la historia comercial cargada: inicio - 2018.07.16 18:11, final - 2018.07.23 18:11
  Los contadores de órdenes, posiciones y transacciones han sido inicializados correctamente
  Ha cambiado el número de órdenes. Era 0, ahora es 1
  Ha cambiado el número de órdenes. Era 1, ahora es 0
  Ha cambiado el número de posiciones. Era 0, ahora es 1
  Ha cambiado el número de transacciones. Era 0, ahora es 1
  Ha cambiado el número de órdenes en la historia. Era 0, ahora es 1*/
//+------------------------------------------------------------------+
