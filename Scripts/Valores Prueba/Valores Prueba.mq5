//+------------------------------------------------------------------+
//|                                               Valores Prueba.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+---------------------------------------
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

void OnStart()
  {
   Alert("Minimo Lote para este activo ",SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN));
   Print("SYMBOL_SECTOR_NAME Symbol=", SymbolInfoString(Symbol(), SYMBOL_SECTOR_NAME));
   Print("SYMBOL_BASIS=", SymbolInfoString(Symbol(), SYMBOL_BASIS));
   Print("SYMBOL_CATEGORY=", SymbolInfoString(Symbol(), SYMBOL_CATEGORY));
   Print("SYMBOL_COUNTRY=", SymbolInfoString(Symbol(), SYMBOL_COUNTRY));
   Print("SYMBOL_SECTOR_NAME=", SymbolInfoString(Symbol(), SYMBOL_SECTOR_NAME));
   Print("SYMBOL_INDUSTRY_NAME=", SymbolInfoString(Symbol(), SYMBOL_INDUSTRY_NAME));
   Print("SYMBOL_CURRENCY_BASE=", SymbolInfoString(Symbol(), SYMBOL_CURRENCY_BASE));
   Print("SYMBOL_CURRENCY_PROFIT=", SymbolInfoString(Symbol(), SYMBOL_CURRENCY_PROFIT));
   Print("SYMBOL_CURRENCY_MARGIN=", SymbolInfoString(Symbol(), SYMBOL_CURRENCY_MARGIN));
   Print("SYMBOL_BANK=", SymbolInfoString(Symbol(), SYMBOL_BANK));
   Print("SYMBOL_DESCRIPTION=", SymbolInfoString(Symbol(), SYMBOL_DESCRIPTION));
   Print("SYMBOL_EXCHANGE=", SymbolInfoString(Symbol(), SYMBOL_EXCHANGE));
   Print("SYMBOL_FORMULA=", SymbolInfoString(Symbol(), SYMBOL_FORMULA));
   Print("SYMBOL_ISIN=", SymbolInfoString(Symbol(), SYMBOL_ISIN));
   Print("SYMBOL_PAGE=", SymbolInfoString(Symbol(), SYMBOL_PAGE));
   Print("SYMBOL_PATH=", SymbolInfoString(Symbol(), SYMBOL_PATH));
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
//+------------------------------------------------------------------+
