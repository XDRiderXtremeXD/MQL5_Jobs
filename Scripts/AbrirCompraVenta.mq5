//+------------------------------------------------------------------+
//|                                             AbrirCompraVenta.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Trade\Trade.mqh>
CTrade trade;

input double lotSize = 1; // Tamaño del lote para ambas órdenes
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   // Compra
   trade.Buy(lotSize, Symbol(),0,0,0,"OrdenCompra");

   // Venta
   trade.Sell(lotSize, Symbol(),0,0,0,"OrdenVenta");
  }