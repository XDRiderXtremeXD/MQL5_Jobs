//+------------------------------------------------------------------+
//|                                                Expert3Medias.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;

enum tipoEjecucion
  {
   candle_current=0,
   candle_close=1,
  };

enum tipoOperaciones
  {
   BUYS=0,
   SELLS=1,
   AMBOS=2,
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


input ENUM_TIMEFRAMES TF_Expert=PERIOD_CURRENT;
tipoEjecucion vela_ejecucion=candle_close;//Vela Ejecucion
input tipoOperaciones operaciones=AMBOS;
input string S0="-----------------------   Trade  ---------------------";//----------------------------
input double Lote=0.01;
input int SL=100;
input int TP=400;
input string S11="-----------------------   ID  ---------------------";//----------------------------
input int numberMagic=22222;
input string comentario="expert 3 emas";
input string S1="-----------------------   FAST MA  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Fast_Period=14;
input int Fast_Shift=0;
input ENUM_MA_METHOD Fast_Method=MODE_EMA;
input ENUM_APPLIED_PRICE Fast_AppliedPrice=PRICE_CLOSE;
input string S2="-----------------------   NEUTRAL MA  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Neutral_Period=24;
input int Neutral_Shift=0;
input ENUM_MA_METHOD Neutral_Method=MODE_EMA;
input ENUM_APPLIED_PRICE Neutral_AppliedPrice=PRICE_CLOSE;
input string S3="-----------------------   SLOW MA  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Slow_Period=35;
input int Slow_Shift=0;
input ENUM_MA_METHOD Slow_Method=MODE_EMA;
input ENUM_APPLIED_PRICE Slow_AppliedPrice=PRICE_CLOSE;
input string S4="-----------------------   HORARIO  ---------------------";//--------------------------------------------------------
input ENUM_Horas  Hora_Inicio=_2am;
input ENUM_Horas Hora_Final=_2am;

int handle_Fast=0;
int handle_Neutral=0;
int handle_Slow=0;

double FAST[];
double NEUTRAL[];
double SLOW[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(Fast_Period>=Neutral_Period || Fast_Period>=Slow_Period)
     {
      Alert("Fast Period debe ser menor que los periodos de las otras MA");
      return INIT_PARAMETERS_INCORRECT;
     }
   if(Slow_Period<=Neutral_Period || Slow_Period<=Fast_Period)
     {
      Alert("Slow_Period debe ser mayor que los periodos de las otras MA");
      return INIT_PARAMETERS_INCORRECT;
     }

   handle_Fast=iMA(Symbol(),TF_Expert,Fast_Period,Fast_Shift,Fast_Method,Fast_AppliedPrice);
   handle_Neutral=iMA(Symbol(),TF_Expert,Neutral_Period,Neutral_Shift,Neutral_Method,Neutral_AppliedPrice);
   handle_Slow=iMA(Symbol(),TF_Expert,Slow_Period,Slow_Shift,Slow_Method,Slow_AppliedPrice);

   ArraySetAsSeries(FAST,true);
   ArraySetAsSeries(NEUTRAL,true);
   ArraySetAsSeries(SLOW,true);

   trade.SetExpertMagicNumber(numberMagic);

   if(!VerificarSLTP())
      return INIT_PARAMETERS_INCORRECT;

   if(!VerificarLotaje())
      return INIT_PARAMETERS_INCORRECT;
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
   int barras=LoadBarsFromSymbol(Symbol(),TF_Expert);
   static int barrasLast=barras;

//SI ESTA DENTRO DEL HORARIO
   if(EvaluaHorario(Hora_Inicio,Hora_Final,TimeCurrent()))
     {
      //CARGAR INDICADORES Media Moviles
      if(CargarMas(barras))
         if(barrasLast!=barras)
           {
            bool IsBuy=false;
            // SI HAY CONDICION PARA ABRIR UNA OPERACION
            if(CondicionAbrir(IsBuy))
              {
               if(!HayOperaciones(IsBuy))
                 {
                  Operar(IsBuy);
                  barrasLast=barras;
                 }
              }

            CondicionCierreCorte();

            if(vela_ejecucion==candle_close)
               barrasLast=barras;
           }
     }
   else// SI NO ESTA DENTRO DEL HORARIO CIERRA OPERACIONES
      CerrarOperaciones();

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarSLTP()
  {
   int minSLTP=(int)SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL);

   if(SL<minSLTP || TP<minSLTP)
     {
      Alert("SL Y TP sus valores deben ser mayor o igual a ",minSLTP," por la restriccion del Activo");
      return false;
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarLotaje()
  {

   double Paso=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
   double Min=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
   double Max=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);

   int digitsLote=2;
   if(Min==1)
      digitsLote= 0;
   if(Min==0.1)
      digitsLote= 1;
   if(Min==0.01)
      digitsLote= 2;
   if(Min==0.001)
      digitsLote= 3;

   double Resultado=int(Lote*MathPow(10,digitsLote))/(int(Paso*MathPow(10,digitsLote)));

   if(Resultado-int(Resultado)>0.0000)
     {
      Alert("El Lotaje debe ser divisible en ",Paso);
      return false;
     }

   if(Lote<Min)
     {
      Alert("El lotaje es menor al minimo ",Min);
      return false;
     }
   else
      if(Lote>Max)
        {
         Alert("El lotaje es mayor al maximo ",Max);
         return false;
        }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Operar(bool IsBuy)
  {
   if(!IsBuy)
     {
      if(operaciones==SELLS || operaciones==AMBOS)
        {
         double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
         double stopLoss=SL==0?0:NormalizeDouble(Bid+SL*Point(),Digits());
         double takeProfit=TP==0?0:NormalizeDouble(Bid-TP*Point(),Digits());

         if(!trade.Sell(Lote,Symbol(),Bid,stopLoss,takeProfit,comentario))
            Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
        }
     }
   else
     {
      if(operaciones==BUYS || operaciones==AMBOS)
        {
         double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
         double stopLoss=SL==0?0:NormalizeDouble(Ask-SL*Point(),Digits());
         double takeProfit=TP==0?0:NormalizeDouble(Ask+TP*Point(),Digits());

         if(!trade.Buy(Lote,Symbol(),Ask,stopLoss,takeProfit,comentario))
            Print("No opero buy error : ",GetLastError()," result error ",trade.ResultRetcode());
        }
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CargarMas(int BarrasTF)
  {

   if(BarsCalculated(handle_Fast)<BarrasTF)
      return(false);
   if(CopyBuffer(handle_Fast,0,0,3,FAST)<=0)
      return(false);

   if(BarsCalculated(handle_Neutral)<BarrasTF)
      return(false);
   if(CopyBuffer(handle_Neutral,0,0,3,NEUTRAL)<=0)
      return(false);

   if(BarsCalculated(handle_Slow)<BarrasTF)
      return(false);
   if(CopyBuffer(handle_Slow,0,0,3,SLOW)<=0)
      return(false);

   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
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
bool CondicionAbrir(bool &IsBuy)
  {
   if(FAST[vela_ejecucion]>NEUTRAL[vela_ejecucion] && NEUTRAL[vela_ejecucion]>=SLOW[vela_ejecucion] && FAST[vela_ejecucion]>FAST[vela_ejecucion+1])
     {
      IsBuy=true;
      return true;
     }

   if(FAST[vela_ejecucion]<NEUTRAL[vela_ejecucion] && NEUTRAL[vela_ejecucion]<=SLOW[vela_ejecucion] && FAST[vela_ejecucion]<FAST[vela_ejecucion+1])
     {
      IsBuy=false;
      return true;
     }

   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CondicionCierreCorte()
  {
   if(FAST[vela_ejecucion]<NEUTRAL[vela_ejecucion])
      CerrarOperacionesPorTipo(true);

   if(FAST[vela_ejecucion]>NEUTRAL[vela_ejecucion])
      CerrarOperacionesPorTipo(false);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HayOperaciones(bool isBuy)
  {
   int totalPositions=PositionsTotal();
   for(int i = totalPositions-1; i >= 0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket!=0)
         if(PositionGetString(POSITION_SYMBOL)==Symbol() && PositionGetInteger(POSITION_MAGIC)==numberMagic)
            if(isBuy?PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY:PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
               return true;
     }
   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarOperaciones()
  {
   int totalPositions=PositionsTotal();
   for(int i = totalPositions-1; i >= 0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket!=0)
         if(PositionGetString(POSITION_SYMBOL)==Symbol() && PositionGetInteger(POSITION_MAGIC)==numberMagic)
            trade.PositionClose(ticket,-1);
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarOperacionesPorTipo(bool isBuy)
  {
   int totalPositions=PositionsTotal();
   for(int i = totalPositions-1; i >= 0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket!=0)
         if(PositionGetString(POSITION_SYMBOL)==Symbol() && PositionGetInteger(POSITION_MAGIC)==numberMagic)
            if(isBuy?PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY:PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
               trade.PositionClose(ticket,-1);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluaHorario(int Apertura,int Cierre,datetime TimeEvalua)
  {
   MqlDateTime time;
   TimeToStruct(TimeEvalua,time);

   if(Cierre==Apertura)
      return true;

   if(Apertura>Cierre && (time.hour>=Apertura || time.hour<Cierre))
      return true;
   else
      if(Apertura<Cierre && time.hour>=Apertura && time.hour<Cierre)
         return true;

   return false;
  }
//+------------------------------------------------------------------+
