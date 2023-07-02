//+------------------------------------------------------------------+
//|                                            ZeroLagTarzan_Bot.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#resource "\\Indicators\\ZeroLagTarzan.ex5"

#include<Trade\Trade.mqh>
CTrade trade;

enum tipo
  {
   SOLO_SELL=0,//Solo Sell
   SOLO_BUY=1,//Solo Buy
   BUY_y_SELL=2,//Buy y Sell
  };

input ENUM_TIMEFRAMES TF_Operacion=PERIOD_CURRENT;
input double Lote=0.01;
input int TP=400;//TP (en Puntos)
input int SL=200;//SL (en Puntos)
input int MagicNumber=222222;
input string Comentario="Experto ZLT";
input string S0="=================== CONDICIONES INDICADOR ========================";//============================================================
input tipo Tipo_Operacion=BUY_y_SELL;
input bool Patron_1=true;
input bool Patron_2=true;
input string S1="=================== TARZAN ========================";//============================================================
input uint                 InpPeriodRSI      =  5;             // RSI period
input ENUM_APPLIED_PRICE   InpAppliedPrice   =  PRICE_CLOSE;   // RSI Applied price
input uint                 InpPeriodMA       =  50;            // MA period
input ENUM_MA_METHOD       InpMethod         =  MODE_SMA;      // MA Method
input uint                 InpChannelTop     =  20;            // Channel top size
input uint                 InpChannelBottom  =  20;            // Channel bottom size
input string S2="=================== ZERO_LAG ========================";//============================================================
input double             inpPeriod = 20;           // Period
input ENUM_APPLIED_PRICE inpPrice  = PRICE_MEDIAN; // Price
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int handleZLT=0;
double SELL[],BUY[];

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   handleZLT=iCustom(Symbol(),TF_Operacion,"::Indicators\\ZeroLagTarzan.ex5",Tipo_Operacion,Patron_1,Patron_2,
                     S1,InpPeriodRSI,InpAppliedPrice,InpPeriodMA,InpMethod,InpChannelTop,InpChannelBottom,S2,inpPeriod,inpPrice);

   trade.SetExpertMagicNumber(MagicNumber);
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
   

   int barras=LoadBarsFromSymbol(Symbol(),TF_Operacion);
   static int Barras=barras;
   if(Barras!=barras)
     {
      if(BarsCalculated(handleZLT)==barras && CopyBuffer(handleZLT,0,0,3,SELL)>0 && CopyBuffer(handleZLT,1,0,3,BUY)>0)
        {
         double ASK=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
         double BID=SymbolInfoDouble(Symbol(),SYMBOL_BID);
         if(BUY[1]!=EMPTY_VALUE)
           {
            double  StopL=SL==0?0:ASK-Point()*SL;
            double  TakeP=TP==0?0:ASK+Point()*TP;

            if(!trade.Buy(Lote,Symbol(),ASK,StopL,TakeP,Comentario))
               Print("No opero Buy, ERROR: ",GetLastError()," retcode= ",trade.ResultRetcode());

           }
         if(SELL[1]!=EMPTY_VALUE)
           {
            double  StopL=SL==0?0:BID+Point()*SL;
            double  TakeP=TP==0?0:BID-Point()*TP;

            if(!trade.Sell(Lote,Symbol(),BID,StopL,TakeP,Comentario))
               Print("No opero Buy, ERROR: ",GetLastError()," retcode= ",trade.ResultRetcode());
           }

         Barras=barras;
        }
     }
  }
//+------------------------------------------------------------------+
int LoadBarsFromSymbol(string symbol, ENUM_TIMEFRAMES timeframe)
  {
   MqlTick tick;

   int bars = iBars(symbol, timeframe);

   bool tick_bool=SymbolInfoTick(symbol, tick);

   return bars;
  }
