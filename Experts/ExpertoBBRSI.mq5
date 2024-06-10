//+------------------------------------------------------------------+
//|                                                 ExpertoBBRSI.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;

enum Tipo_Operaciones
  {
   SOLO_COMPRAS,
   SOLO_VENTAS,
   VENTAS_Y_COMPRAS,
  };

input Tipo_Operaciones Tipo_Operacion=VENTAS_Y_COMPRAS;
input ENUM_TIMEFRAMES Periodo_Operaciones=PERIOD_CURRENT;
input string S1="======================== Configuracion RSI ========================";//============================================================================================================
input int RSI_Periodo=8;//Longitud RSI
input int upperThresholdRSI=70;// Umbral Superior RSI
input int lowerThresholdRSI=30;// Umbral Inferior RSI
input ENUM_APPLIED_PRICE RSI_Applied_Price=PRICE_CLOSE;
input string S2="======================== BOLLINGER BANDS ========================";//================================================================================================
input int BB_Period=20;//Longitud BB
input double BB_Deviation=1;//Multiplicador BB
int BB_Shift=0;
ENUM_APPLIED_PRICE BB_AppliedPrice=PRICE_CLOSE;
input string S33="======================== Apalancamiento ========================";//============================================================================================================
input double leverage=1;//Aplancamiento
input string S4="============ GESTION RIESGO ==============";//==============================================================================================
input double riskPerTrade=1.0;//Riesgo por Operacion(%)
input double stopLossATRMultiple=1.0;//Múltiplo de ATR para Stop Loss
input string S5="============ EXPERT IDE ==============";//==============================================================================================
input int numberMagic=22222;
input string comentarioExpert="Expert ATR";//Comentario Expert

int atr_periodo=14;

int atr_handle=0;
int bb_handle=0;
int rsi_handle=0;

double ATR[];
double RSI[];
double BB_UP[];
double BB_DN[];

MqlRates rates[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   atr_handle=iATR(Symbol(),Periodo_Operaciones,atr_periodo);
   bb_handle=iBands(Symbol(),Periodo_Operaciones,BB_Period,BB_Shift,BB_Deviation,BB_AppliedPrice);
   rsi_handle= iRSI(Symbol(),Periodo_Operaciones,RSI_Periodo,RSI_Applied_Price);

   ArraySetAsSeries(ATR,true);
   ArraySetAsSeries(RSI,true);
   ArraySetAsSeries(BB_UP,true);
   ArraySetAsSeries(BB_DN,true);

   ArraySetAsSeries(rates,true);
   
   trade.SetExpertMagicNumber(numberMagic);
//---
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
   int barras_actuales=LoadBarsFromSymbol(Symbol(),Periodo_Operaciones);
   static int barLast=barras_actuales;

   if(barras_actuales!=barLast)
     {
      if(CopyRates(Symbol(),Periodo_Operaciones,0,3,rates)>0)
        {
         if(BarsCalculated(atr_handle)==barras_actuales && BarsCalculated(bb_handle)==barras_actuales && BarsCalculated(rsi_handle)==barras_actuales)
           {
            if(CopyBuffer(atr_handle,0,0,3,ATR)>0 && CopyBuffer(bb_handle,1,0,3,BB_UP)>0 && CopyBuffer(bb_handle,2,0,3,BB_DN)>0 && CopyBuffer(rsi_handle,0,0,3,RSI)>0)
              {
               bool IsBuy;
               double Lote;
               if(Condicion(IsBuy))
                  if(ObtenerLote(Lote,ATR[1]))
                    {
                     if(IsBuy)
                       {
                        if(HayOperacion(IsBuy))
                           Operar(IsBuy,comentarioExpert,Lote,NormalizeDouble(rates[1].close - ATR[1] * stopLossATRMultiple,Digits()), NormalizeDouble(rates[1].close + ATR[1] * stopLossATRMultiple*2,Digits()));
                       }
                     else
                       {
                        if(HayOperacion(IsBuy))
                           Operar(IsBuy,comentarioExpert,Lote,NormalizeDouble(rates[1].close + ATR[1] * stopLossATRMultiple,Digits()), NormalizeDouble(rates[1].close - ATR[1] * stopLossATRMultiple*2,Digits()));
                       }
                    }
               barLast=barras_actuales;
              }
           }
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
//+------------------------------------------------------------------+
void Operar(bool isBuy,string comentario,double lote,double stopLoss,double takeProfit_)
  {
   if(!isBuy)
     {
      if(!trade.Sell(lote,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_BID),stopLoss,takeProfit_,comentario))
         Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
   else
      if(!trade.Buy(lote,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_ASK),stopLoss,takeProfit_,comentario))
         Print("No opero buy error : ",GetLastError()," result error ",trade.ResultRetcode());
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ObtenerLote(double &Lote,double atr)
  {
   double riskAmount = AccountInfoDouble(ACCOUNT_EQUITY) * riskPerTrade / 100;

   Lote = NormalizeDouble((riskAmount / ((atr/Point()) * stopLossATRMultiple)) * leverage,2);
   double Lots=int(Lote*100);
   Lots=NormalizeDouble(Lots/100.0,2);

   double Lote_Step=Lots/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
   int Lote_Step_int=int(Lots/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP));

// Print("Lote calculado es igual a  ",DoubleToString(Lots,2));

   if((Lote_Step-Lote_Step_int)>0)
     {
      Lote=Lote_Step_int*SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
      Print("Redondeando al Lote mas cercano permitido");
     }

   Print("Lote Calculado ",DoubleToString(Lots,2));

   if(Lots>SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
     {
      Print("Lote Calculado ",DoubleToString(Lots,2)," es mayor al lote maximo permitido... igualando al lote maximo permitido");
      Lote=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);
      return true;
     }

   if(Lots>=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
      return true;
   else
      Print("No opero porque el lote calculado es inferior al Lote Minimo para el simbolo");


   Print("Error al calcular el Lotaje... revisar los comentarios en la pestaña Expertos");
   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HayOperacion(bool IsBuy)
  {
   int totalPositions=PositionsTotal();

   for(int i = 0; i < totalPositions; i++)
     {
      if(PositionSelectByTicket(PositionGetTicket(i)))
        {
         if(PositionGetInteger(POSITION_MAGIC)==numberMagic && PositionGetString(POSITION_SYMBOL)==Symbol())
           {
            if(IsBuy?(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY):(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL))
               return false;
           }
        }
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*bool CalcularLotaje(double &Lots,int SL_Puntos)
  {
   double Tick_Value=SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE);
   double Perdida=AccountInfoDouble(ACCOUNT_BALANCE);
   Perdida=Perdida*(Lote_Porcentaje/100.0);
   double Lotaje=Perdida/(Tick_Value*SL_Puntos);

   Lots=int(Lotaje*100);
   Lots=NormalizeDouble(Lots/100.0,2);

   double Lote_Step=Lots/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
   int Lote_Step_int=int(Lots/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP));

// Print("Lote calculado es igual a  ",DoubleToString(Lots,2));

   if((Lote_Step-Lote_Step_int)>0)
     {
      Lots=Lote_Step_int*SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
      Print("Redondeando al Lote mas cercano permitido");
     }

   Print("Lote Calculado ",DoubleToString(Lots,2));

   if(Lots>SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
     {
      Print("Lote Calculado ",DoubleToString(Lots,2)," es mayor al lote maximo permitido... igualando al lote maximo permitido");
      Lots=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);
      return true;
     }

   if(Lots>=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
      return true;
   else
      Print("No opero porque el lote calculado es inferior al Lote Minimo para el simbolo");

   Print("Error al calcular el Lotaje... revisar los comentarios en la pestaña Expertos");
   return false;
  }*/
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Condicion(bool &IsBuy)
  {
  // if(RSI[2]>lowerThresholdRSI || BB_DN[2]>rates[2].close)
      if(RSI[1]<lowerThresholdRSI && BB_DN[1]<rates[1].close)
        {
         if(Tipo_Operacion==SOLO_VENTAS)
            return false;

         IsBuy=true;
         return true;
        }
  // if(RSI[2]<upperThresholdRSI || BB_UP[2]<rates[2].close)
      if(RSI[1]>upperThresholdRSI && BB_UP[1]>rates[1].close)
        {
         if(Tipo_Operacion==SOLO_COMPRAS)
            return false;

         IsBuy=false;
         return true;
        }
   return false;
  }
//+------------------------------------------------------------------+
