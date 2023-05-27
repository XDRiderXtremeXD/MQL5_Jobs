//+------------------------------------------------------------------+
//|                                       Experto RSI MACD STOCH.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"


input string Settings_RSI="***Settings RSI***";
input ENUM_TIMEFRAMES TimeFrame_RSI=PERIOD_CURRENT;
input int Periodo_RSI=14;
input ENUM_APPLIED_PRICE AppliedPrice_RSI=PRICE_CLOSE;

input string Settings_MACD="***Settings MACD***";
input string NombreMACD="//Market//Traditional MACD";
input ENUM_TIMEFRAMES TimeFrame_MACD=PERIOD_CURRENT;
input int FastEma_MACD=12;
input int SlowEma_MACD=9;
input int Signal_MACD=26;
input ENUM_APPLIED_PRICE AppliedPrice_MACD=PRICE_CLOSE;

input string Settings_STOCHASTIC="***Settings STOCHASTIC***";
input ENUM_TIMEFRAMES TimeFrame_Stochastic=PERIOD_CURRENT;
input int KPeriodo_Stochastic=5;
input int DPeriodo_Stochastic=3;
input int Slowing_Stochastic=3;
input ENUM_MA_METHOD MA_Method_Stochastic= MODE_SMA;
input ENUM_STO_PRICE STO_Mode_Stochastic=STO_LOWHIGH;

input int RSI_Nivel_Buy=35;
input int RSI_Nivel_Sell=65;
input int STOCHASTIC_Nivel_Buy=20;
input int STOCHASTIC_Nivel_Sell=80;
input int Abertura_Minima_MACD=10;
int RSI,MACD,STOCH;

double Stochastic_Buffer[];
double RSI_Buffer[];
double MACD_Buffer[];

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   RSI=iRSI(Symbol(),TimeFrame_RSI,Periodo_RSI,AppliedPrice_RSI);
   MACD=iCustom(Symbol(),TimeFrame_MACD,NombreMACD);
   STOCH=iStochastic(Symbol(),TimeFrame_Stochastic,KPeriodo_Stochastic,DPeriodo_Stochastic,Slowing_Stochastic,MA_Method_Stochastic,STO_Mode_Stochastic);
    
  ArraySetAsSeries(RSI_Buffer,true);
  ArraySetAsSeries(Stochastic_Buffer,true);
  ArraySetAsSeries(MACD_Buffer,true);
  
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
  
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   CopyBuffer(RSI,0,0,3,RSI_Buffer);
   CopyBuffer(STOCH,0,0,3,Stochastic_Buffer);
   CopyBuffer(MACD,0,0,3,MACD_Buffer);
   
   if(RSI_Buffer[1]<RSI_Nivel_Buy && Stochastic_Buffer[1]<STOCHASTIC_Nivel_Buy  ){}
   
   
   else if(RSI_Buffer[1]>RSI_Nivel_Sell && Stochastic_Buffer[1]>STOCHASTIC_Nivel_Sell ){}
   
  }
//+------------------------------------------------------------------+
