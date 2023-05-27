//+------------------------------------------------------------------+
//|                                                Experto salto.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

double  SL,TP;

#include<Trade\Trade.mqh>
CTrade trade;

input string S4="---------------- Parametros ----------------";//--------------------------------
input double Lotaje_a_Operar=0.01; //Lotaje Inicial
input int TakeProfit=50; //Take Profit valor en (Puntos)
input int Stop_Loss=10; // Stop loss valor en (Puntos)
input int Distancia_Recorrido=25; // Distancia Recorrido valor en (Puntos)

string CommentExpert="EXPERTO SALTO";

double Entrada;

datetime TimeFinish=D'2021.08.11 00:00';


//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   Comment("Tiempo de Prueba hasta el dia ",TimeToString(TimeFinish,TIME_DATE|TIME_MINUTES));

   if(TimeFinish<TimeCurrent())
     {
      Alert("Tiempo de prueba finalizado el dia ",TimeToString(TimeFinish,TIME_DATE|TIME_MINUTES));
      Comment(" ");
      return(INIT_FAILED);
     }

   /*
      if(Minutos>59 || 0>Minutos || Segundos>59 || Segundos<0)
        {
         Print("Parametro Minutos y Segundos deben ser mayor o igual a 0 y menor a 60");
         return (INIT_FAILED);
        }
      if(Aumento_Lote<=1 && Modo_Aumento==Multiplicador)
        {
         Alert("Aumento Lote en Modo Multiplicador debe ser mayor a 1");
         return (INIT_FAILED);
        }
      else
         if(Aumento_Lote>1 && Modo_Aumento==Multiplicador)
           {
            if(NormalizeDouble(Lotaje_a_Operar*Aumento_Lote,2)==Lotaje_a_Operar)
              {
               Alert("Aumento Lote en Modo Multiplicador debe ser mayor a ",Aumento_Lote);
               return (INIT_FAILED);
              }
           }

      if(Modo_Aumento==Sumatoria)
        {
         double STEP=SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
         if(int(Aumento_Lote/STEP)-Aumento_Lote/STEP>0)
           {
            Alert("Aumento en modo sumatoria no es factible debido a que no es un paso correcto del simbolo, paso minimo es ",STEP);
            return (INIT_FAILED);
           }
        }


      double STEP=SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
      if(int(Lotaje_a_Operar/STEP)-Lotaje_a_Operar/STEP>0)
        {
         Alert("Lotaje Inicial no es valido para este simbolo , debe ser divisible de ",STEP);
         return (INIT_FAILED);
        }

      if(Lotaje_a_Operar>SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX) || Lotaje_a_Operar<SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN))
        {
         Alert("Lotaje Inicial no es valido para este simbolo debe ser menor o igual a ",SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX)," y mayor o igual a ",SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN));
         return (INIT_FAILED);
        }

      if(SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL)>TakeProfit || SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL)>Stop_Loss
       || SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL)>TakeProfit_I || SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL)>TakeProfit_I){
       Alert("Los valores del TP y Sl deben ser mayores o igual a ",SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL));
       return (INIT_FAILED);
       }*/

   EventSetMillisecondTimer(1);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Comment(" ");
   EventKillTimer();

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   if(TimeFinish<TimeCurrent())
     {
      Alert("Tiempo de prueba finalizado el dia ",TimeToString(TimeFinish,TIME_DATE|TIME_MINUTES));
      Comment(" ");
      ExpertRemove();
     }


   /*
      Comment(SymbolInfoInteger(Symbol(),SYMBOL_SPREAD));
      double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
      double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
      static bool En=false;
      if(En==false)
        {
         if(!trade.Sell(1,NULL,Bid,0,0,NULL))
            Print("No opero Sell Bien.. ERROR:",trade.ResultRetcode());
         else
            En=true;
         if(!trade.Buy(1,NULL,Ask,0,0,NULL))
            Print("No opero Buy Bien.. ERROR:",trade.ResultRetcode());
         else
            En=true;
        }*/
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTimer()
  {
   TS_and_BE(); // Se llama a la funcion para realizar el Trailing Stop y El BreakEven si en caso esta activado
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TS_and_BE() // FUNCION DEL TS Y BREAK VEN
  {
   int Pocisiones=PositionsTotal();

   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   for(int cnt=Pocisiones-1; cnt>=0; cnt--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;

      if(PositionGetString(POSITION_SYMBOL)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
         //donde esta el experto.. entonces no lo evalua
        {

         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
           {
            if(Bid<=PositionGetDouble(POSITION_PRICE_OPEN)-Distancia_Recorrido*Point())
              {
               SL=Stop_Loss<=0?0:Bid+Stop_Loss*Point(); //SE ESTABLECE EL SL
               TP=TakeProfit<=0?0:Bid-TakeProfit*Point();//SE ESTABLECE EL TP
               Print(Entrada," SL",SL," TP",TP);
               uint Codigo=0;
               if(!trade.Sell(Lotaje_a_Operar,Symbol(),Bid,SL,TP,CommentExpert))
                 {
                  Codigo=trade.ResultRetcode();
                  Print("No opero Sell Bien.. ERROR:",Codigo);
                 }
               if(Codigo==10016)
                  Print("SL invalido, fijarse en el SL>Spread, es ",Stop_Loss,">",SymbolInfoInteger(Symbol(),SYMBOL_SPREAD),"?");
               trade.PositionClose(Ticket,-1);
              }
           }
         else
           {
            if(Ask>=PositionGetDouble(POSITION_PRICE_OPEN)+Distancia_Recorrido*Point())
              {
               SL=Stop_Loss<=0?0:Ask-Stop_Loss*Point(); //SE ESTABLECE EL SL
               TP=TakeProfit<=0?0:Ask+TakeProfit*Point(); //SE ESTABLECE EL TP
               uint Codigo=0;
               if(!trade.Buy(Lotaje_a_Operar,Symbol(),Ask,SL,TP,CommentExpert))
                 {
                  Codigo=trade.ResultRetcode();
                  Print("No opero Buy Bien.. ERROR:",Codigo);
                 }
               if(Codigo==10016)
                  Print("SL invalido, fijarse en el SL>Spread, es ",Stop_Loss,">",SymbolInfoInteger(Symbol(),SYMBOL_SPREAD),"?");
               trade.PositionClose(Ticket,-1);
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
