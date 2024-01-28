//+------------------------------------------------------------------+
//|                                                     MACD_RSI.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;

enum TipoOperacion
  {
   SOLO_BUYS=0,
   SOLO_SELLS=1,
   BUYS_SELLS=2,
  };


input ENUM_TIMEFRAMES Periodo_Operacion=PERIOD_CURRENT;
input TipoOperacion OperacionesTipo=BUYS_SELLS;
input double Lote=0.1;
input int TakeProfit=500;
input int StopLoss=500;
input int NumeroMagico=22222;
input string Comentario="Expert";
input string S5="===========   MA  ===========";//===========
input int Ma_Periodo=200;
input int Ma_Shift=0;
input ENUM_MA_METHOD Ma_Method=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;
input string S8="===========   RSI ===========";//===========
input int RSI_Periodo=14;
input ENUM_APPLIED_PRICE RSI_Applied_Price=PRICE_CLOSE;
input string S6_="===========              MACD            ===========";//===========
input int Period_MACD=12;
input int Slow_Ema_MACD=26;
input int Signal_Period_MACD=9;
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;



int handleRSI=0;
int handleMACD=0;
int handleMA=0;


double RSI[];
double MACD[];
double MACD_MA[];
double MA[];

MqlRates rates[];

datetime until=D'2023.11.05 00:00';
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   handleMACD=iMACD(Symbol(),Periodo_Operacion,Period_MACD,Slow_Ema_MACD,Signal_Period_MACD,Applied_Price_MACD);
   handleMA=iMA(Symbol(),Periodo_Operacion,Ma_Periodo,Ma_Shift,Ma_Method,Ma_AppliedPrice);
   handleRSI=iRSI(Symbol(),Periodo_Operacion,RSI_Periodo,RSI_Applied_Price);

   ArraySetAsSeries(RSI,true);
   ArraySetAsSeries(MACD,true);
   ArraySetAsSeries(MACD_MA,true);
   ArraySetAsSeries(MA,true);
   ArraySetAsSeries(rates,true);

   trade.SetExpertMagicNumber(NumeroMagico);

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
   if(until<TimeCurrent())
     {
      Alert("Test terminado el dia ",TimeToString(until));
      ExpertRemove();
     }

   int barras_actuales=LoadBarsFromSymbol(Symbol(),Periodo_Operacion);
   static int barrasLast=barras_actuales;

   if(barrasLast!=barras_actuales)
      if(CargarIndicadores(barras_actuales))
         if(CargarValoresBarras())
           {
            bool IsBuy=false;
            if(CondicionOperacion(IsBuy))
              {
               if(IsBuy)
                  BUY();
               else
                  SELL();
              }
            barrasLast=barras_actuales;
           }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SELL()
  {
   double BID=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double SL=BID+StopLoss*Point();
   double TP=BID-TakeProfit*Point();
   if(!trade.Sell(Lote,NULL,BID,SL,TP,Comentario))
      Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BUY()
  {
   double ASK=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double SL=ASK-StopLoss*Point();
   double TP=ASK+TakeProfit*Point();
   if(!trade.Buy(Lote,NULL,ASK,SL,TP,Comentario))
      Print("No opero buy error : ",GetLastError()," result error ",trade.ResultRetcode());
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CargarValoresBarras()
  {
   int copied=CopyRates(Symbol(),Periodo_Operacion,0,3,rates);
   return (copied>0);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CondicionOperacion(bool &IsBuy)
  {
// RSI  MA
   bool toqueRSI50=((RSI[2]>50 && RSI[1]<=50) || (RSI[2]<50 && RSI[1]>=50));
   if(toqueRSI50)
      return IgualarTipoOperacion(IsBuy,MA[1]<rates[1].close);
// MACD
   if(MACD[2]>MACD_MA[2] && MACD[1]<MACD_MA[1])
      return IgualarTipoOperacion(IsBuy,true);

   if(MACD[2]<MACD_MA[2] && MACD[1]>MACD_MA[1])
      return IgualarTipoOperacion(IsBuy,false);

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IgualarTipoOperacion(bool &IsBuy,bool estado)
  {
   if(estado==true && OperacionesTipo==SOLO_SELLS)
      return false;

   if(estado==false && OperacionesTipo==SOLO_BUYS)
      return false;

   IsBuy=estado;
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CargarIndicadores(int barras)
  {
   if(!(BarsCalculated(handleMA)==barras && CopyBuffer(handleMA,0,0,3,MA)>0))
      return false;

   if(!(BarsCalculated(handleMACD)==barras && CopyBuffer(handleMACD,0,0,3,MACD)>0 && CopyBuffer(handleMACD,1,0,3,MACD_MA)>0))
      return false;

   if(!(BarsCalculated(handleRSI)==barras && CopyBuffer(handleRSI,0,0,3,RSI)>0))
      return false;

   return true;
  }
//+------------------------------------------------------------------+
int LoadBarsFromSymbol(string symbol, ENUM_TIMEFRAMES timeframe)
  {
   MqlTick tick;

   int bars = iBars(symbol, timeframe);

   bool tick_bool=SymbolInfoTick(symbol, tick);

   return bars;
  }
//+------------------------------------------------------------------+
