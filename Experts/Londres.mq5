//+------------------------------------------------------------------+
//|                                                      Londres.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Trade\Trade.mqh>
CTrade trade;

enum ENUM_Horas
  {
   _0am = 0,   //:  0 am
   _1am = 1,   //:  1 am
   _2am = 2,   //:  2 am
   _3am = 3,   //:  3 am
   _4am = 4,   //:  4 am
   _5am = 5,   //:  5 am
   _6am = 6,   //:  6 am
   _7am = 7,   //:  7 am
   _8am = 8,   //:  8 am
   _9am = 9,   //:  9 am
   _10am = 10, //: 10 am
   _11am = 11, //: 11 am
   _12pm = 12, //: 12 pm
   _1pm = 13,  //:  1 pm
   _2pm = 14,  //:  2 pm
   _3pm = 15,  //:  3 pm
   _4pm = 16,  //:  4 pm
   _5pm = 17,  //:  5 pm
   _6pm = 18,  //:  6 pm
   _7pm = 19,  //:  7 pm
   _8pm = 20,  //:  8 pm
   _9pm = 21,  //:  9 pm
   _10pm = 22, //:  10 pm
   _11pm = 23, //:  11 pm
  };

input string S1="==== CONF CONDITIONS ====";//==============================================================================
input ENUM_TIMEFRAMES Periodo=PERIOD_M15;
input ENUM_Horas  Hora_Londres=_9am;
input uint  Minutos_Londres=15;
input string S2="==== CONF TRADE ====";//==============================================================================
input double Volumen_Porcentaje_Balance=10;
input int SL=600;
input int TP=150;
input string S3="==== ID TRADE ====";//==============================================================================
input int Numero_Magico=222222;
input string Comentario_Experto="EXP LONDRES";

datetime until=D'2024.08.15 00:00';
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   if(until<TimeCurrent())
     {
      Alert("Trial period ended on ",TimeToString(until,TIME_DATE));
      return INIT_FAILED;
     }
   else
      Comment("Trial period until ", TimeToString(until,TIME_DATE));

//---

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

   if(until<TimeCurrent())
     {
      Alert("Trial period ended on ",TimeToString(until,TIME_DATE));
      ExpertRemove();
     }

   if(IsNewCandle(Symbol(),Periodo))
     {
      datetime barTime=iTime(Symbol(),Periodo,0);
      MqlDateTime barTimeStruct;
      TimeToStruct(barTime,barTimeStruct);
      if(barTimeStruct.hour==Hora_Londres && barTimeStruct.min==Minutos_Londres)
        {
         double Lotes=GetLote(SL);
         if(iClose(Symbol(),Periodo,1)>iOpen(Symbol(),Periodo,1))
            SELL(Symbol(),SL,TP,Lotes,Comentario_Experto);
         if(iClose(Symbol(),Periodo,1)<iOpen(Symbol(),Periodo,1))
            BUY(Symbol(),SL,TP,Lotes,Comentario_Experto);
        }
     }

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetLote(int puntosSL)
  {
   int ratio=puntosSL;
   double Lotes=(AccountInfoDouble(ACCOUNT_BALANCE)*Volumen_Porcentaje_Balance/100.0)/(SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE)*ratio);


   double step=SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
   double min=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN);
   double max=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX);
   double LoteEvalua=NormalizeDouble(Lotes/step,2);

   if(LoteEvalua-((int)LoteEvalua)>0)
     {
      Print("Lote calculado ",Lotes);
      Print("Igualando a un lote valido ",step*((int)LoteEvalua));
      Lotes=step*((int)LoteEvalua);
     }

   if(Lotes<min)
     {
      Print("Lote calculado es menor al minimo, igualando al minimo lote ",min);
      Lotes=min;
     }

   if(Lotes>max)
     {
      Print("Lote calculado es mayor al maximo, igualando al maximo lote ",max);
      Lotes=max;
     }
   return Lotes;
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---

  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsNewCandle(string Simbolo,ENUM_TIMEFRAMES Periodo_)
  {
   static int BarsOnChart = iBars(Simbolo,Periodo_);
   int Bars_=iBars(Simbolo,Periodo_);
   if(Bars_== BarsOnChart)
      return (false);
   BarsOnChart = Bars_;
   return(true);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SELL(string activo,int sl,int tp,double lotaje,string commentExpert)
  {

   double BID=SymbolInfoDouble(activo,SYMBOL_BID);
   double SL_Price=(sl==0)?0:BID+sl*Point();
   double TP_Price=(tp==0)?0:BID-tp*Point();

   if(!trade.Sell(lotaje,activo,BID,SL_Price,TP_Price,commentExpert))
      Print("Error opening SELL order : ",GetLastError()," ",trade.ResultRetcode());// IMPRIME ERROR
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BUY(string activo,double sl,double tp,double lotaje,string commentExpert)
  {
   double ASK=SymbolInfoDouble(activo,SYMBOL_ASK);
   double SL_Price=(sl==0)?0:ASK-sl*Point();
   double TP_Price=(tp==0)?0:ASK+tp*Point();

   if(!trade.Buy(lotaje,activo,ASK,SL_Price,TP_Price,commentExpert))
      Print("Error opening BUY order : ",GetLastError()," ",trade.ResultRetcode());// IMPRIME ERROR
  }
//+------------------------------------------------------------------+
