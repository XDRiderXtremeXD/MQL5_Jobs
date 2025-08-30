//+------------------------------------------------------------------+
//|                                                      RSI_MAS.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;
#include <Trade\AccountInfo.mqh>
CAccountInfo infoTrade;

enum tipoOperacion
  {
   Compra=0,
   Venta=1,
  };

enum tipoOperacionBot
  {
   Solo_Compra=0,
   Solo_Venta=1,
   Ventas_Y_Compras=2,
  };


input ENUM_TIMEFRAMES TF=PERIOD_CURRENT;
input tipoOperacionBot Tipo_Operaciones=Ventas_Y_Compras;
input string S11="-----------------------   Configuracion Operaciones  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input double Lotaje=0.01;
input int SL_Puntos=100;
input int TP_Puntos=200;
input string S12="-----------------------   Configuracion Operaciones ID  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int numero_magico=22222;
input string comentario="Expert RSI";
input string S1="-----------------------   Configuracion Medias Moviles  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_FAST=50;
input int Ma_Periodo_SLOW=100;
input int Ma_Shift=0;
input ENUM_MA_METHOD Ma_Method=MODE_EMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;
input string S2="-----------------------   Configuracion RSI ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int RSI_Periodo=14;
input ENUM_APPLIED_PRICE RSI_Applied_Price=PRICE_CLOSE;
input int nivel_Arriba=70;
input int nivel_Abajo=30;

double MA_F[];
double MA_S[];
double RSI[];

int rsi_handle;
int ma_handle_F;
int ma_handle_S;

int barrasAnteriores;

datetime until=D'2024.09.30 00:00';
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(TimeCurrent()>until)
     {
      Alert("Tiempo prueba concluyo el dia ",TimeToString(until,TIME_DATE));
      return INIT_FAILED;
     }
   else
      Comment("Tiempo prueba hasta el dia ",TimeToString(until,TIME_DATE));


   if(Ma_Periodo_FAST>=Ma_Periodo_SLOW)
     {
      Alert("Fast debe ser menor a Slow");
      return INIT_FAILED;
     }

   if(!VerificarLotajeInicial(Lotaje))
      return INIT_FAILED;

   ma_handle_S=iMA(Symbol(),TF,Ma_Periodo_SLOW,Ma_Shift,Ma_Method,Ma_AppliedPrice);
   ma_handle_F=iMA(Symbol(),TF,Ma_Periodo_FAST,Ma_Shift,Ma_Method,Ma_AppliedPrice);
   rsi_handle=iRSI(Symbol(),TF,RSI_Periodo,RSI_Applied_Price);

   barrasAnteriores=iBars(Symbol(),TF);

   trade.SetExpertMagicNumber(numero_magico);

   ArraySetAsSeries(RSI,true);
   ArraySetAsSeries(MA_S,true);
   ArraySetAsSeries(MA_F,true);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   Comment("");
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   if(TimeCurrent()>until)
     {
      Alert("Tiempo prueba concluyo el dia ",TimeToString(until,TIME_DATE));
      ExpertRemove();
     }


   if(!SetearIndicadores())
      return;

   if(CambioBarra())
      if(!HayOperaciones())
        {
         if(Tipo_Operaciones==Solo_Venta || Tipo_Operaciones==Ventas_Y_Compras)
            if(CondicioneVenta())
               AbrirVenta();

         if(Tipo_Operaciones==Solo_Compra || Tipo_Operaciones==Ventas_Y_Compras)
            if(CondicionCompra())
               AbrirCompra();
        }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HayOperaciones()
  {
   int posiciones=PositionsTotal();
   for(int i=posiciones-1;i>=0;i++)
      if(PositionGetTicket(i)!=0 && PositionGetInteger(POSITION_MAGIC)==numero_magico && PositionGetString(POSITION_SYMBOL)==Symbol())
         return true;

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetearIndicadores()
  {
   int barras=iBars(Symbol(),TF);

   if(BarsCalculated(ma_handle_F)!=barras)
      return false;
   if(BarsCalculated(ma_handle_S)!=barras)
      return false;
   if(BarsCalculated(rsi_handle)!=barras)
      return false;

   if(CopyBuffer(ma_handle_F,0,0,3,MA_F)<=0)
      return false;
   if(CopyBuffer(ma_handle_S,0,0,3,MA_S)<=0)
      return false;
   if(CopyBuffer(rsi_handle,0,0,3,RSI)<=0)
      return false;

   return true;
  }
//+------------------------------------------------------------------+
bool CambioBarra()
  {
   int barrasActuales=iBars(Symbol(),TF);
   if(barrasActuales!=barrasAnteriores)
     {
      barrasAnteriores=barrasActuales;
      return true;
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CondicioneVenta()
  {
   if(MA_F[1]<MA_S[1] && MA_F[2]>MA_S[2] && RSI[1]<=nivel_Abajo)
      return true;

   return false;
  }
//+------------------------------------------------------------------+
bool CondicionCompra()
  {
   if(MA_F[1]>MA_S[1] && MA_F[2]<MA_S[2] && RSI[1]>=nivel_Arriba)
      return true;

   return false;
  }
//+------------------------------------------------------------------+
void AbrirVenta()
  {
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double stopLoss=SL_Puntos==0?0:Bid+SL_Puntos*Point();
   double takeProfit=TP_Puntos==0?0:Bid-TP_Puntos*Point();

   double lote=Lotaje;
   if(VerificarLotaje(lote))
      if(!trade.Sell(lote,Symbol(),Bid,stopLoss,takeProfit,comentario))
         Print("No abrio venta error ",trade.ResultRetcode()," ",GetLastError());
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void AbrirCompra()
  {
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double stopLoss=SL_Puntos==0?0:Ask-SL_Puntos*Point();
   double takeProfit=TP_Puntos==0?0:Ask+TP_Puntos*Point();

   double lote=Lotaje;
   if(VerificarLotaje(lote))
      if(!trade.Buy(lote,Symbol(),Ask,stopLoss,takeProfit,comentario))
         Print("No abrio compra error ",trade.ResultRetcode()," ",GetLastError());
  }
//+------------------------------------------------------------------+
bool VerificarLotaje(double &lote)
  {
   double step=SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
   double min=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN);
   double max=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX);

   double LoteEvalua=NormalizeDouble(lote/step,2);

   if(LoteEvalua-((int)LoteEvalua)>0)
      lote=(int)LoteEvalua*step;

   if(lote<min)
     {
      Print("El lotaje elegido es menor al minimo ",min);
      return false;
     }

   if(lote>max)
      lote=max;

   if(infoTrade.FreeMarginCheck(Symbol(),ORDER_TYPE_BUY,lote,SymbolInfoDouble(Symbol(),SYMBOL_ASK))<=0)
     {
      Print("No se pone operacion por bajo Margen libre para el ",lote);
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarLotajeInicial(double lote)
  {
   double step=SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
   double min=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN);
   double max=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX);

   double LoteEvalua=NormalizeDouble(lote/step,2);

   if(LoteEvalua-((int)LoteEvalua)>0)
     {
      Alert("El lotaje no es compatible con el paso ",step," tiene que ser un numero divisible entre el paso para este activo ",Symbol());
      return false;
     }

   if(lote<min)
     {
      Alert("El lotaje elegido es menor al minimo de este activo ",min);
      return false;
     }

   if(lote>max)
     {
      Alert("El lotaje elegido es mayor al maximo de este activo ",max);
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
