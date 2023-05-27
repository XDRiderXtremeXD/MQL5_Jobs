//+------------------------------------------------------------------+
//|                                                   BALANCE TP.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#include <Trade\AccountInfo.mqh>
CAccountInfo Trade;
double Balances;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
 Balances=Trade.Balance();
 
 Comment(ORDER_TYPE_SELL);
 
 
 
   uint  total=HistoryOrdersTotal(); 
   ulong ticket;  
  for(uint i=0;i<total;i++) 
     { 
      //--- recibimos el ticket de la orden según su posición en la lista 
      if((ticket=HistoryOrderGetTicket(i))>0) 
        { 
        
         //if(HistoryOrderGetInteger( i,ORDER_TYPE)==ORDER_TYPE_BUY || HistoryOrderGetInteger( i,ORDER_TYPE)==ORDER_TYPE_SELL ){       
         double open_price=       HistoryOrderGetDouble(ticket,ORDER_PRICE_OPEN); 
         long time_setup=       (datetime)HistoryOrderGetInteger(ticket,ORDER_TIME_SETUP); 
         long time_done=        (datetime)HistoryOrderGetInteger(ticket,ORDER_TIME_DONE); 
         string symbol=           HistoryOrderGetString(ticket,ORDER_SYMBOL); 
         long order_magic=      HistoryOrderGetInteger(ticket,ORDER_MAGIC); 
         long positionID =      HistoryOrderGetInteger(ticket,ORDER_POSITION_ID); 
         double initial_volume=   HistoryOrderGetDouble(ticket,ORDER_VOLUME_INITIAL); 
         long type= HistoryOrderGetInteger(ticket,ORDER_TYPE); 
         //--- preparamos y mostramos información sobre la orden 
         printf("#ticket %d %s %G %s at %G was set up at %s => done at %s, pos ID=%d", 
                ticket,                  // ticket de la orden 
                type,                    // tipo 
                initial_volume,          // volumen colocado 
                symbol,                  // símbolo 
                open_price,              // precio de apertura especificado 
                TimeToString(time_setup),// hora de colocación de la orden 
                TimeToString(time_done), // hora de ejecución y eliminación 
                positionID               // ID de la posición en la que ha sido incluida la transacción según la orden 
                ); 
        //}
       }
     } 
 
 
   
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
  MqlDateTime StrDay;
  datetime DayAnt;
  int interactive=0;
  do{
  DayAnt=iTime(Symbol(),PERIOD_D1,interactive);
  TimeToStruct(DayAnt,StrDay);
  interactive++;
  }while (StrDay.day_of_week!=0);
  datetime TiempoInicio=DayAnt;
  
  
  
//--- repasamos todas las órdenes en el ciclo 
  
  
  
  //Comment(Balances);
  }
//+------------------------------------------------------------------+

