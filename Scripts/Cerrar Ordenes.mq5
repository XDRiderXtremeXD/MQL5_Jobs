//+------------------------------------------------------------------+
//|                                               Cerrar Ordenes.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property script_show_inputs

#include<Trade\Trade.mqh>
CTrade trade;

enum ENUM_MODO_OPERACION
  {
   Solo_Abiertas=0,
   Solo_Pendientes=1,
   Todas=2,
  };
  
enum ENUM_MODO_CIERRE
  {
   Solo_Simbolo=0,
   Global=1,
  };


input ENUM_MODO_OPERACION Modo_Cierre=Solo_Abiertas;
input ENUM_MODO_CIERRE Modo=Solo_Simbolo;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   Cerrar_Abiertas();
   Cerrar_Pendientes();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cerrar_Abiertas() // FUNCION DEL TS Y BREAK VEN
  {
   int Pocisiones=PositionsTotal();

   for(int cnt=Pocisiones-1; cnt>=0 && (Modo_Cierre==Solo_Abiertas || Modo_Cierre==Todas); cnt--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;

      if( (PositionGetString(POSITION_SYMBOL)==Symbol() && Modo==Solo_Simbolo) || Modo==Global) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
         //donde esta el experto.. entonces no lo evalua
        {
         trade.PositionClose(Ticket,-1);
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cerrar_Pendientes() // FUNCION DEL TS Y BREAK VEN
  {
   int Pocisiones=OrdersTotal();

   for(int cnt=Pocisiones-1; cnt>=0 && (Modo_Cierre==Solo_Pendientes || Modo_Cierre==Todas); cnt--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=OrderGetTicket(cnt);
      if(Ticket==0)
         continue;

      if( (OrderGetString(ORDER_SYMBOL)==Symbol() && Modo==Solo_Simbolo) || Modo==Global) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
         //donde esta el experto.. entonces no lo evalua
        {
         trade.OrderDelete(Ticket);
        }
     }
  }
