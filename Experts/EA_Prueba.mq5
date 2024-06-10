//+------------------------------------------------------------------+
//|                                                    EA_Prueba.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;
#include <Trade\AccountInfo.mqh>
CAccountInfo InfoAccount;

enum tipo
  {
   SOLO_VENTAS=1,
   SOLO_COMPRAS=2,
  };

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


input ENUM_TIMEFRAMES Periodo_Operaciones=PERIOD_CURRENT;
input tipo tipo_operaciones=SOLO_VENTAS;
input string S0="========== Configuracion Trade ==========";//==========================================================================================
input double Volumen=0.1;
input int StopLoss=200;
input int TakeProfit_1=200;
input int TakeProfit_2=300;
input int TakeProfit_3=400;
input string ExpertComentario="PRUEBA";
input int NumeroMagico=243525;
input string S3="========== Configuracion HORARIO ==========";//==========================================================================================
input ENUM_Horas Hora_Ejecuta=_10am;
input int Minuto_Ejecuta=0;



MqlRates rates[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(!VerificacionesLoteTPSL())
      return INIT_PARAMETERS_INCORRECT;

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
   int barras_actuales=LoadBarsFromSymbol(Symbol(),Periodo_Operaciones);
   static int barLast=barras_actuales;
   int copiaBarras=3;

   if(barras_actuales!=barLast)
     {
      if(CopyRates(Symbol(),Periodo_Operaciones,0,copiaBarras,rates)>0)
        {
         bool EsCompra=(tipo_operaciones==SOLO_COMPRAS);

         MqlDateTime time;
         datetime tiempoEvalua=rates[1].time;
         TimeToStruct(tiempoEvalua,time);

         if(time.hour==Hora_Ejecuta && time.min==Minuto_Ejecuta)
            if(!HayOperaciones(EsCompra))
              {
               Operar_(EsCompra,"Operacion 1",Volumen,StopLoss,TakeProfit_1);
               Operar_(EsCompra,ExpertComentario,Volumen,StopLoss,TakeProfit_2);
               Operar_(EsCompra,ExpertComentario,Volumen,StopLoss,TakeProfit_3);
              }
        }
      barLast=barras_actuales;
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
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Operar_(bool EsCompra,string comentario,double lote,int stopLoss,int takeProfit)
  {
   long spread=SymbolInfoInteger(Symbol(),SYMBOL_SPREAD);
   if(spread>=stopLoss)
     {
      Print("No opera porque el Spread es muy alto y no deja poner el Stop Loss");
      return;
     }

   if(EsCompra)
     {
      if(InfoAccount.FreeMarginCheck(Symbol(),ORDER_TYPE_BUY,lote*3,SymbolInfoDouble(Symbol(),SYMBOL_ASK))<0)
        {
         Print("No puede operar porque se opero sin margen disponible para poner 3 operaciones con lote ",lote);
         return;
        }


      double stopLoss_=stopLoss==0?0:SymbolInfoDouble(Symbol(),SYMBOL_ASK)-stopLoss*Point();
      double takeProfit_=takeProfit==0?0:SymbolInfoDouble(Symbol(),SYMBOL_ASK)+takeProfit*Point();

      if(!trade.Buy(lote,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_ASK),stopLoss_,takeProfit_,comentario))
         Print("No opero buy error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
   else
     {
      if(InfoAccount.FreeMarginCheck(Symbol(),ORDER_TYPE_SELL,lote*3,SymbolInfoDouble(Symbol(),SYMBOL_BID))<0)
        {
         Print("No puede operar porque se opero sin margen disponible para poner 3 operaciones con lote ",lote);
         return;
        }

      double stopLoss_=stopLoss==0?0:SymbolInfoDouble(Symbol(),SYMBOL_BID)+stopLoss*Point();
      double takeProfit_=takeProfit==0?0:SymbolInfoDouble(Symbol(),SYMBOL_BID)-takeProfit*Point();

      if(!trade.Sell(lote,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_BID),stopLoss_,takeProfit_,comentario))
         Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HayOperaciones(bool Compras)
  {
   int totalPositions=PositionsTotal();
   for(int i =totalPositions-1; i >= 0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket!=0)
         if(Compras?PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY:PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
            return true;
     }
   return false;
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificacionesLoteTPSL()
  {

   long stopMin=SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL);
   if(StopLoss<stopMin)
     {
      Alert("El Stop Loss Puntos debe ser mayor o igual a ",stopMin," para este activo");
      return false;
     }

   if(TakeProfit_1<stopMin)
     {
      Alert("El TakeProfit Menor Puntos debe ser mayor o igual a ",stopMin," para este activo");
      return false;
     }

   double vMax=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX);
   double vMin=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN);

   if(Volumen==vMin)
      return true;


   if(Volumen<vMin)
     {
      Alert("EL VOLUMEN DEBE SER MAYOR O IGUAL A ",vMin);
      return false;
     }

   if(Volumen>SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX))
     {
      Alert("EL VOLUMEN DEBE SER MENOR O IGUAL A ",vMax);
      return false;
     }

   double LoteEvalua=Volumen/SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
   if(LoteEvalua-((int)LoteEvalua)>0)
     {
      Alert("EL VOLUMEN DEBE SER MULTIPLO A ",SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP));
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
