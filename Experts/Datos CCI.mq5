//+------------------------------------------------------------------+
//|                                                    Datos CCI.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
#include<Trade\Trade.mqh>
CTrade trade;

input double Lote=0.01;
input int SL=100;//Stop Loss en Puntos
input int TP=100;//Take Profit en Puntos
input int MagicNumb=22222;

int Periodos[3]= {14,20,50};
ENUM_TIMEFRAMES Tiempos[2]= {PERIOD_M1,PERIOD_M5};

double ArrayCCI[];
//ArrayCCIM1[3];
//ArrayCCIM5[3];

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   ArrayResize(ArrayCCI,ArraySize(Periodos));

   trade.SetExpertMagicNumber(MagicNumb);
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
   /* bool Bool_M1=CopiarDatos(PERIOD_M1,0,ArrayCCIM1);
    bool Bool_M5=CopiarDatos(PERIOD_M5,0,ArrayCCIM5);
   */
   //string Comentario="";
   /*
      if(Bool_M1)
        {
         Comentario="DATA M1: [14]: "+DoubleToString(ArrayCCIM1[0],2)+" [20]: "+DoubleToString(ArrayCCIM1[1],2)+" [50]: "+DoubleToString(ArrayCCIM1[2],2);
         if(ArrayCCIM1[0]>0 && ArrayCCIM1[1]>0 && ArrayCCIM1[2]>0)
            PonerBuy_CerrarSell("M1");
         else
            if(ArrayCCIM1[0]<0 && ArrayCCIM1[1]<0 && ArrayCCIM1[2]<0)
               PonerSell_CerrarBuy("M1");
        }

      if(Bool_M5)
        {
         Comentario=Comentario+"\nDATA M5: [14]: "+DoubleToString(ArrayCCIM5[0],2)+" [20]: "+DoubleToString(ArrayCCIM5[1],2)+" [50]: "+DoubleToString(ArrayCCIM5[2],2);
         if(ArrayCCIM5[0]>0 && ArrayCCIM5[1]>0 && ArrayCCIM5[2]>0)
            PonerBuy_CerrarSell("M5");
         else
            if(ArrayCCIM5[0]<0 && ArrayCCIM5[1]<0 && ArrayCCIM5[2]<0)
               PonerSell_CerrarBuy("M5");
        }
   */
   /*REFACTORIZANDO*/
   for(int i=0; i<ArraySize(Tiempos); i++)
     {
      bool Bool=CopiarDatos(Tiempos[i],0,ArrayCCI);

      if(Bool)
        {
         // QUITAR LINEA 85 (COMENTARIO) YA QUE NO ES DINAMICO A LA HORA DE CAMBIAR LA MATRIZ/ SOLO ES PARA PRUEBAS
        // Comentario=Comentario+"\nDATA "+EnumToString(Tiempos[i])+": [14 ]: "+DoubleToString(ArrayCCI[0],2)+" [20]: "+DoubleToString(ArrayCCI[1],2)+" [50]: "+DoubleToString(ArrayCCI[2],2);
         if(ArrayCCI[0]>0 && ArrayCCI[1]>0 && ArrayCCI[2]>0)
            PonerBuy_CerrarSell(EnumToString(Tiempos[i]));
         else
            if(ArrayCCI[0]<0 && ArrayCCI[1]<0 && ArrayCCI[2]<0)
               PonerSell_CerrarBuy(EnumToString(Tiempos[i]));
        }

     }

   //Comment(Comentario);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CopiarDatos(ENUM_TIMEFRAMES tiempo, uint retroceso,double &arrayDataTimeFrame[])
  {
// ITERAMOS LOS PERIODOS PARA SACAR LOS DATOS DE CADA INDICADOR
   for(int i=0; i<ArraySize(Periodos); i++)
     {
      double dato=0;
      // SI EN CASO NO COPIO BIEN EL DATO, RETORNA FALSE
      if(!ObtenerDato(tiempo,Periodos[i],retroceso,dato))
         return false;
      arrayDataTimeFrame[i]=dato;
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ObtenerDato(ENUM_TIMEFRAMES tiempo,uint periodo, uint retroceso,double &dato)
  {
// SE IMPLEMENTA EL HANDLE DEL INDICADOR DESEADO CON EL PERIODO Y TIEMPO
   int Handle=iCCI(_Symbol,tiempo,periodo,PRICE_CLOSE);
   double ArrayData[];
// COPIAMOS 1 DATO DEL INDICADOR EN EL ArrayDATA, Se copiara el elemento de la posicion (retroceso)
// CoppyBuffer(HANDLE, BUFFER, Posicion,Cantidad de valores a Copiar,Array donde se copiara)
   if(CopyBuffer(Handle,0,retroceso,1,ArrayData)<=0)
      return false;
// SI ESTA BIEN, EL DATO SE IGUALA AL DATO CONSEGUIDO ANTERIORMENTE
   dato=ArrayData[0];

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PonerBuy_CerrarSell(string Comentario)
  {

   int TotalPosiciones=PositionsTotal();
   bool HayBuy=false;
   for(int i=0; i<TotalPosiciones; i++)
     {
      ulong Ticket=PositionGetTicket(i);

      if(PositionGetInteger(POSITION_MAGIC)!=MagicNumb || PositionGetString(POSITION_COMMENT)!=Comentario)
         continue;

      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
         trade.PositionClose(Ticket,-1);
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
         HayBuy=true;
     }

   if(!HayBuy)
     {
      double Entrada=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
      double SL_=NormalizeDouble(Entrada-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*SL,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
      double TP_=NormalizeDouble(Entrada+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*TP,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
      bool Trade=trade.Buy(Lote,Symbol(),Entrada,SL==0?0:SL_,TP==0?0:TP_,Comentario);
      if(!Trade)
         Print("ERROR ",trade.ResultRetcode());
     }
  }
//+------------------------------------------------------------------+
void PonerSell_CerrarBuy(string Comentario)
  {
   int TotalPosiciones=PositionsTotal();
   bool HaySell=false;
   for(int i=0; i<TotalPosiciones; i++)
     {
      ulong Ticket=PositionGetTicket(i);

      if(PositionGetInteger(POSITION_MAGIC)!=MagicNumb || PositionGetString(POSITION_COMMENT)!=Comentario)
         continue;

      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
         trade.PositionClose(Ticket,-1);
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
         HaySell=true;
     }

   if(!HaySell)
     {
      double Entrada=SymbolInfoDouble(Symbol(),SYMBOL_BID);
      double SL_=NormalizeDouble(Entrada+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*SL,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
      double TP_=NormalizeDouble(Entrada-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*TP,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
      bool Trade=trade.Sell(Lote,Symbol(),Entrada,SL==0?0:SL_,TP==0?0:TP_,Comentario);
      if(!Trade)
         Print("ERROR ",trade.ResultRetcode());
     }
  }
//+------------------------------------------------------------------+
