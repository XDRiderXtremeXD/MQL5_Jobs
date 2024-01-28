//+------------------------------------------------------------------+
//|                                                    Funciones.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
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
//EJEMPLOS
   double Maximo,Minimo;
//SACARA EL MAXIMO Y MINIMO DE LOS HIGHST DE TODAS LAS VELAS QUE ESTEN EN EL RANGO DE 0 a 100 barras atras del PERIODO DE TU GRAFICO Y EL ACTIVO DE TU GRAFICO
   Sacar_Minimo_Maximo(Symbol(),PERIOD_CURRENT,MODE_HIGH,100,Maximo,Minimo);
//SACARA EL MAXIMO Y MINIMO DE LOS HIGHST DE TODAS LAS VELAS QUE ESTEN EN EL RANGO DE 0 a 100 barras atras del PERIODO DEL EURUSD EN PERIODO Diario
   Sacar_Minimo_Maximo("EURUSD",PERIOD_D1,MODE_HIGH,100,Maximo,Minimo);
//ESTOS SON LOS MODOS
   /*
   MODE_OPEN
   MODE_LOW
   MODE_HIGH
   MODE_CLOSE
   MODE_VOLUME
   MODE_REAL_VOLUME
   MODE_SPREAD
   */

/// SI EL ULTIMO PARAMETRO ES TRUE, VERIFICARA SOLO BUYS, SI ES FALSE VERIFICARA SOLO SELLS
///EL PARAMETRO NUMBER MAGIC es el identificador de las operaciones que genera el bot, para que solo evalue aquellas que fueron puestas con el numero magico que le pongas
// si quieres que evalue todas pon 0 sin importar por cual bot abrio o de forma manual
   Verificar_si_hay_Operaciones_en_Rango(Symbol(),0,1.22000,0.05000,true);

  }
//+------------------------------------------------------------------+
void Sacar_Minimo_Maximo(string Simbolo,ENUM_TIMEFRAMES TimeFrame,ENUM_SERIESMODE Modo,int cantidadBarras,double &Maximo,double &Minimo)
  {
   int MaximoBar=iHighest(Simbolo,TimeFrame,Modo,cantidadBarras,0);
   int MinimoBar=iLowest(Simbolo,TimeFrame,Modo,cantidadBarras,0);

   switch(Modo)
     {
      case MODE_OPEN:
         Maximo=iOpen(Simbolo,TimeFrame,MaximoBar);
         Minimo=iOpen(Simbolo,TimeFrame,MinimoBar);
         break;
      case MODE_LOW:
         Maximo=iLow(Simbolo,TimeFrame,MaximoBar);
         Minimo=iLow(Simbolo,TimeFrame,MinimoBar);
         break;
      case MODE_HIGH:
         Maximo=iHigh(Simbolo,TimeFrame,MaximoBar);
         Minimo=iHigh(Simbolo,TimeFrame,MinimoBar);
         break;
      case MODE_CLOSE:
         Maximo=iClose(Simbolo,TimeFrame,MaximoBar);
         Minimo=iClose(Simbolo,TimeFrame,MinimoBar);
         break;
      case MODE_VOLUME:
         Maximo=(double)iVolume(Simbolo,TimeFrame,MaximoBar);
         Minimo=(double)iVolume(Simbolo,TimeFrame,MinimoBar);
         break;
      case MODE_REAL_VOLUME:
         Maximo=(double)iRealVolume(Simbolo,TimeFrame,MaximoBar);
         Minimo=(double)iRealVolume(Simbolo,TimeFrame,MinimoBar);
         break;
      default:
         Maximo=iSpread(Simbolo,TimeFrame,MaximoBar);
         Minimo=iSpread(Simbolo,TimeFrame,MinimoBar);
         break;
     }

   if(Maximo==0)
      Print("No calculo bien el Maximo ",GetLastError());

   if(Minimo==0)
      Print("No calculo bien el Minimo ",GetLastError());
  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Verificar_si_hay_Operaciones_en_Rango(string Simbolo,int NumberMagic,double precio,double valorRango,bool IsBuy)
  {
   double High=precio+valorRango;
   double Low=precio-valorRango;

   int total=PositionsTotal();
   for(int cnt=total-1; cnt>=0; cnt--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;
      if((PositionGetInteger(POSITION_MAGIC)==NumberMagic || NumberMagic==0) && PositionGetString(POSITION_SYMBOL)==Simbolo)  // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
        {
         if(IsBuy?(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY):(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL))
            if(PositionGetDouble(POSITION_PRICE_OPEN)<=High && PositionGetDouble(POSITION_PRICE_OPEN)>=Low)
               return true;
        }
     }
   return false;
  }
//+------------------------------------------------------------------+
