//+------------------------------------------------------------------+
//|                                               Valores Prueba.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart() 
  { 
   Print("Initial margin requirements for 1 lot=",SymbolInfoDouble(Symbol(),SYMBOL_MARGIN_INITIAL)); 
   Print("Initial margin requirements for 1 lot=",SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE)); 
   Print("Initial margin requirements for 1 lot=",SymbolInfoDouble(Symbol(),SYMBOL_TRADE_CONTRACT_SIZE)); 
   Print("Initial margin requirements for 1 lot=",SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_SIZE)); 
   Print("Margin to maintain open orders calculated for 1 lot=",SymbolInfoDouble(Symbol(),SYMBOL_MARGIN_MAINTENANCE)); 
   Print("STOP ",SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL)); 
   Print("Point ",SymbolInfoDouble(Symbol(),SYMBOL_POINT)); 
   Print("Digitos ",SymbolInfoInteger(Symbol(),SYMBOL_DIGITS)); 
   SymbolInfoDouble(Symbol(),SYMBOL_MARGIN_INITIAL);
  }
