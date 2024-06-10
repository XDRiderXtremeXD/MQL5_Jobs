//+------------------------------------------------------------------+
//|                                    Tendencia3VelasContrarias.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"


#include<Trade\Trade.mqh>
CTrade trade;
enum TypeOperacion
  {
   compra=0,
   venta=1,
   compra_venta=2,
  };

enum TypeVolumen
  {
   fijo=0,
   porcentaje_Riesgo=1,
  };

enum TypeCierre
  {
   high_low=0,
   close=1,
  };

input int barrasContrarias=3;
input ENUM_TIMEFRAMES Periodo_Operaciones=PERIOD_CURRENT;
input TypeOperacion TipoOperacion=compra;
input TypeCierre TipoCierre=high_low;
input int PuntosMinimoCuerpoVela=20;//Puntos minimo cuerpo vela
input string S10="-----------------------   TRADE ---------------------";//------------------------------------------------------------------------------------------------
input int StopLoss=135;//StopLoss (disable==0)
input int TakeProfit=0;//TakeProfit (disable==0)
input int MagicNumber=222222;
input string comentario="Expert Tendencia";//Comentario de Operaciones
input string S1="-----------------------   LOTAJE ---------------------";//--------------------------------------------------------------------------------------------------------------------------------------------
input TypeVolumen tipo_volumen=fijo;
input double Lote_Fijo=0.1;
input double PorcentajeRiesgo_Dinamico=1;
input string S2="-----------------------   MEDIA MOVILS  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_fast=5;//Periodo Rapido
input int Ma_Periodo_slow=200;//Periodo Lento
input ENUM_MA_METHOD Ma_Method=MODE_EMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;
input string S3="-----------------------   TS  ---------------------";//------------------------------------------------
input bool Trailing_Stop=true;
input int Distancia_a_MediaMovil=150;//Distancia a Media Movil
input int PasoTrailing_Stop=100;//Trailing Paso

int ma_handleFAST=0;
int ma_handleSLOW=0;

double MA_FAST[];
double MA_SLOW[];

MqlRates rates[];

#include <Trade\AccountInfo.mqh>
CAccountInfo InfoAccount;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//VERIFICA SI EL PERIDOO DE LA EMA RAPIDA ES MENOR A LA EMA LENTA
   if(Ma_Periodo_fast>Ma_Periodo_slow)
     {
      Alert("Periodo Rapido debe ser menor a Periodo Lento");
      return INIT_PARAMETERS_INCORRECT;
     }

//VERIFICA SI EL PERIDOO DE LA EMA RAPIDA ES MENOR A LA EMA LENTA
   if(tipo_volumen==PorcentajeRiesgo_Dinamico && StopLoss==0)
     {
      Alert("Si el tipo de volumen es dinamico... El Stop Loss no puede ser igual a 0");
      return INIT_PARAMETERS_INCORRECT;
     }

//VERIFICA SI EL LOTE Y LOS TP Y SL SON CORRECTOS PARA EL ACTIVO
   if(!VerificacionesLoteTPSL())
      return INIT_PARAMETERS_INCORRECT;

//SETEA MANEJADORES DE LAS MEDIAS MOVILES
   ma_handleFAST=iMA(Symbol(),Periodo_Operaciones,Ma_Periodo_fast,0,Ma_Method,Ma_AppliedPrice);
   ma_handleSLOW=iMA(Symbol(),Periodo_Operaciones,Ma_Periodo_slow,0,Ma_Method,Ma_AppliedPrice);

   ArraySetAsSeries(MA_FAST,true);
   ArraySetAsSeries(MA_SLOW,true);
   ArraySetAsSeries(rates,true);

//SETEA EL NUMERO MAGICO DE LAS OPERACIONES
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
//CARGA EL NUMERO DE BARRAS DE LA TEMPORALIDAD (Periodo_Operaciones)
   int barras_actuales=LoadBarsFromSymbol(Symbol(),Periodo_Operaciones);
   static int barLast=barras_actuales;

   int copiaBarras=barrasContrarias+2;



//COPIA VALORES DE LAS ULTIMAS VELAS (CopiaBarras)
   if(CopyRates(NULL,Periodo_Operaciones,0,copiaBarras,rates)>0)
     {
      //VERIFICA SI LOS INDICADORES FUERON CARGADOS PARA TODAS LAS BARRAS ACTUALES
      if(BarsCalculated(ma_handleFAST)==barras_actuales &&  BarsCalculated(ma_handleSLOW)==barras_actuales)
        {
         //COPIA LOS 3 ULTIMOS VALORES DE LOS INDICADORES EN UN ARREGLO
         if(CopyBuffer(ma_handleFAST,0,0,3,MA_FAST)>0 && CopyBuffer(ma_handleSLOW,0,0,3,MA_SLOW))
           {
            //SE EJECUTA TRAILING STOP
            TS_(MA_FAST[0]);
            //SE EJECUTA CADA VEZ QUE SE CREA UNA NUEVA BARRA EN LA TEMPORALIDAD (Periodo_Operaciones)
            if(barras_actuales!=barLast)
              {
               //VERIFICA SI LA TENDENCIA ES ALCISTA O BAJISTA ( SI ES ALCISTA SERA TRUE DE LO CONTRARIO SI ES BAJISTA SERA FALSE)
               bool TendenciaAlcista=MA_FAST[1]>MA_SLOW[1];

               //VERIFICA SI LA VELA ANTERIOR PASO LA EMA RAPIDA HACIA ARRIBA PARA CERRAR COMPRAS
               if((TipoCierre==close?(rates[1].close):rates[1].high)>MA_FAST[1])
                  CerrarPosiciones(true);

               //VERIFICA SI LA VELA ANTERIOR PASO LA EMA RAPIDA HACIA ABAJO PARA CERRAR VENTAS
               if((TipoCierre==close?(rates[1].close):rates[1].low)<MA_FAST[1])
                  CerrarPosiciones(false);

               //SI TENDENCIA ALCISTA
               if(TendenciaAlcista)
                 {
                  //VERIFICA SI EL VALOR ACTUAL DE LA VELA ESTE POR DEBAJO DE LA MA RAPIDAD PARA QUE NO CIERRE EN EL INSTANTE
                  if(rates[1].close<MA_FAST[1])
                     if(TipoOperacion==compra || TipoOperacion==compra_venta)
                        //VERIFICA LA LOGICA DE LAS VELAS CONTRARIAS PARA TENDENCIA ALCISTA
                        if(VerificarBarrasContarias(true))
                          {
                           double Lote=CalculoLoteRiesgoSL(StopLoss);
                           //OPERA COMPRA
                           Operar(true,comentario,Lote,StopLoss,TakeProfit);
                          }

                 }
               //SI TENDENCIA BAJISTA
               else
                 {
                  //VERIFICA SI EL VALOR ACTUAL DE LA VELA ESTE POR ARRIBA DE LA MA RAPIDADPARA QUE NO CIERRE EN EL INSTANTE
                  if(rates[1].close>MA_FAST[1])
                     if(TipoOperacion==venta || TipoOperacion==compra_venta)
                        //VERIFICA LA LOGICA DE LAS VELAS CONTRARIAS PARA TENDENCIA BAJISTA
                        if(VerificarBarrasContarias(false))
                          {
                           double Lote=CalculoLoteRiesgoSL(StopLoss);
                           //OPERA VENTA
                           Operar(false,comentario,Lote,StopLoss,TakeProfit);
                          }
                 }
               barLast=barras_actuales;
              }
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarPosiciones(bool Buys)
  {
   int totalPositions = PositionsTotal();
   for(int i = totalPositions-1; i >=0; i--)
     {
      if(PositionSelectByTicket(PositionGetTicket(i)))
        {
         if(PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetString(POSITION_SYMBOL)==Symbol())
            if(Buys?PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY:PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
               if(!trade.PositionClose(PositionGetTicket(i),-1))
                  Print("Error al cerrar posicion ",GetLastError()," resultRetcode ",trade.ResultRetcode());
        }
     }
  }

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
//|                                                                  |
//+------------------------------------------------------------------+
void Operar(bool isCompra,string comentario_,double lote,int stopLoss,int takeProfit)
  {
   double ASK=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double BID=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   if(!isCompra)
     {
      if(InfoAccount.FreeMarginCheck(Symbol(),ORDER_TYPE_SELL,lote,BID)<0)
        {
         Print("No puede operar SELL porque se opero sin margen disponible para poner una operacion con lote ",lote);
         return;
        }

      double SL=stopLoss==0?0:BID+stopLoss*Point();
      double TP=takeProfit==0?0:BID-takeProfit*Point();

      if(!trade.Sell(lote,Symbol(),BID,SL,TP,comentario_))
         Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
   else
     {
      if(InfoAccount.FreeMarginCheck(Symbol(),ORDER_TYPE_BUY,lote,ASK)<0)
        {
         Print("No puede operar BUY porque se opero sin margen disponible para poner una operacion con lote ",lote);
         return;
        }

      double SL=stopLoss==0?0:ASK-stopLoss*Point();
      double TP=takeProfit==0?0:ASK+takeProfit*Point();

      if(!trade.Buy(lote,Symbol(),ASK,SL,TP,comentario))
         Print("No opero buy error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarBarrasContarias(bool IsAlcista)
  {
   bool velaAlcistaUltima=rates[barrasContrarias+1].close>rates[barrasContrarias+1].open;

   if(IsAlcista?velaAlcistaUltima==false:velaAlcistaUltima==true)
      return false;

   for(int i=1;i<=barrasContrarias;i++)
     {
      bool velaAlcista=rates[i].close>rates[i].open;

      if((MathAbs(rates[i].close-rates[i].open)/Point())<PuntosMinimoCuerpoVela)
         return false;

      if(rates[i].close==rates[i].open)
         return false;

      if(IsAlcista?velaAlcista:!velaAlcista)
         return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
bool VerificacionesLoteTPSL()
  {

   long stopMin=SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL);
   if(StopLoss<stopMin && StopLoss!=0)
     {
      Alert("El Stop Loss Puntos debe ser mayor o igual a ",stopMin," para este activo");
      return false;
     }

   if(TakeProfit<stopMin && TakeProfit!=0)
     {
      Alert("El TakeProfit Puntos debe ser mayor o igual a ",stopMin," para este activo");
      return false;
     }

   double vMax=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX);
   double vMin=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN);

   if(Lote_Fijo==vMin)
      return true;


   if(Lote_Fijo<vMin)
     {
      Alert("EL LOTE FIJO DEBE SER MAYOR O IGUAL A ",vMin);
      return false;
     }

   if(Lote_Fijo>SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX))
     {
      Alert("EL LOTE FIJO DEBE SER MENOR O IGUAL A ",vMax);
      return false;
     }

   double LoteEvalua=Lote_Fijo/SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
   if(LoteEvalua-((int)LoteEvalua)>0)
     {
      Alert("EL LOTE FIJO DEBE SER MULTIPLO A ",SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP));
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CalculoLoteRiesgoSL(int pointsSL)
  {
   if(tipo_volumen==fijo)
      return Lote_Fijo;

   double Lotes=(AccountInfoDouble(ACCOUNT_MARGIN_FREE)*PorcentajeRiesgo_Dinamico/100.0)/(SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE)*pointsSL);

   double Paso=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);

   double Resultado=Lotes/Paso;

   if(Resultado-int(Resultado)>0)
      Lotes=NormalizeDouble(Paso*int(Resultado),2);

   if(Lotes<SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
      Lotes=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
   else
      if(Lotes>SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
         Lotes=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);

   return Lotes;
  }

//+------------------------------------------------------------------+
void TS_(double ema_Fast) // FUNCION DEL TS Y BREAK VEN
  {
   if(!Trailing_Stop)
      return;

   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   for(int cnt=0; cnt<PositionsTotal(); cnt++) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetSymbol(cnt)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
        {
         double Precio=PositionGetDouble(POSITION_PRICE_CURRENT);
         double Open=PositionGetDouble(POSITION_PRICE_OPEN);
         double SL=PositionGetDouble(POSITION_SL);
         double TP=PositionGetDouble(POSITION_TP);
         //TS Funcion
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && ema_Fast<=Precio-Distancia_a_MediaMovil*Point() && NormalizeDouble(Precio-PasoTrailing_Stop*Point(),Digits())>=Open &&
            ((Bid-SL>=PasoTrailing_Stop*2*Point() && SL<NormalizeDouble(Precio-PasoTrailing_Stop*Point(),Digits())) || SL==0))
            if(!trade.PositionModify(Ticket,NormalizeDouble(Precio-PasoTrailing_Stop*Point(),Digits()),TP))
               Print("ResultRetcode error ",trade.ResultRetcode());

         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && ema_Fast>=Precio+Distancia_a_MediaMovil*Point() && NormalizeDouble(Precio+PasoTrailing_Stop*Point(),Digits())<=Open &&
            ((SL-Precio>=PasoTrailing_Stop*2*Point() && SL>NormalizeDouble(Ask+PasoTrailing_Stop*Point(),Digits())) || SL==0))
            if(!trade.PositionModify(Ticket,NormalizeDouble(Precio+PasoTrailing_Stop*Point(),Digits()),TP))
               Print("ResultRetcode error ",trade.ResultRetcode());

        }
     }
  }
//+------------------------------------------------------------------+
