//+------------------------------------------------------------------+
//|                                                ExpSinteticos.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"


#include<Trade\Trade.mqh>
CTrade trade;

enum Tipo
  {
   comprar=0,
   vender=1,
  };

input Tipo Tipo_Operacion=comprar;
input double Lote=1;
input int espera_spike=7;//Espera Maximo del Spike
input int espera_despues_spike=3;//Espera Despues del Spike Maximo
input int magicNumber=222222;
input string comentario="Exp Sinteticos";
input string S1_="********************* RSI *********************";//***************************************************************
input int RSI_Period=14;
input ENUM_APPLIED_PRICE RSI_AppliedPrice=PRICE_CLOSE;
input double level_vender=92.5;
input double level_comprar=7.5;

int Handle_RSI=0;
double RSI[];
MqlRates rates[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
  
   ArraySetAsSeries(rates,true);
   ArraySetAsSeries(RSI,true);
   Handle_RSI=iRSI(Symbol(),PERIOD_CURRENT,RSI_Period,RSI_AppliedPrice);

   trade.SetExpertMagicNumber(magicNumber);
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
   int Bars_Actual=Bars(Symbol(),PERIOD_CURRENT);
   static int Bars_=Bars_Actual;

   if(Bars_Actual!=Bars_)
     {
      if(CopyRates(Symbol(),PERIOD_CURRENT,0,espera_spike+espera_despues_spike+2,rates)>0)
        {
         GestionOperaciones(rates);
         if(BarsCalculated(Handle_RSI)==Bars_Actual)
           {
            if(CopyBuffer(Handle_RSI,0,0,3,RSI)>0)
              {
               if(NumeroOperaciones()==0)
                 {
                  double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
                  double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

                  if(Tipo_Operacion==comprar && RSI[1]<=level_comprar && RSI[2]>level_comprar)
                    {
                     if(!trade.Buy(Lote,Symbol(),Ask,0,0,comentario))
                        Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                    }
                  if(Tipo_Operacion==vender && RSI[1]>=level_vender && RSI[2]<level_vender)
                    {
                     if(!trade.Sell(Lote,Symbol(),Bid,0,0,comentario))
                        Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                    }
                 }
               Bars_=Bars_Actual;
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int NumeroOperaciones() // FUNCION DEL TS Y BREAK VEN
  {
   int operaciones=0;
   for(int cnt=0; cnt<PositionsTotal(); cnt++) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)==magicNumber && PositionGetSymbol(cnt)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
         operaciones++;
     }
   return operaciones;
  }
//+------------------------------------------------------------------+
void GestionOperaciones(MqlRates &mqrates[]) // FUNCION DEL TS Y BREAK VEN
  {
   for(int cnt=PositionsTotal()-1; cnt>=0; cnt--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)==magicNumber && PositionGetSymbol(cnt)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
        {
         int Bar=iBarShift(Symbol(),PERIOD_CURRENT,PositionGetInteger(POSITION_TIME),false);
         if(Bar!=-1)
           {
            bool IsBuy=(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY);
            for(int i=1; i<=Bar; i++)
              {
               if(i>=espera_spike)
                 {
                  trade.PositionClose(Ticket,-1);
                  break;
                 }
               if((IsBuy && mqrates[i].close>mqrates[i].open) || (!IsBuy && mqrates[i].close<mqrates[i].open))
                 {
                  if(i>espera_despues_spike)
                     trade.PositionClose(Ticket,-1);
                  break;
                 }
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
