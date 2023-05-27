//+------------------------------------------------------------------+
//|                                                   Crash_Boom.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// LIBRERIA PARA GENERAR UNA ORDEN (SELL, BUY, BUY_STOP, ETC)
#include<Trade\Trade.mqh>
CTrade trade;

enum MODO
  {
   UP=0,
   DOWN=1,
  };

input string S1="------------------ CONFIGURACION EXPERTO ------------------";
input MODO Modo_Operacion=UP; // Direccion Herramienta Financiera
input int Entrar_Barra=4;// Entrar en la (X) Barra Positivo
input double Lotes=0.2;
input double SL=0; //Stop Loss (in pips)
input double TP=0; //Take Profit (in pips)
input int Trailing_Stop=5;// Trailing Stop (in pips)
input int Trailing_Step=5;// Trailing Step (in pips)
input int Gap=1;//Gap in pips
input ENUM_TIMEFRAMES Time_Frame=PERIOD_CURRENT;
input int Magic_Number=2222222;
input double Close_All=0.25;//Close_All_if_Profit>=
input string CommentExpert="Experto Crash Boom";
input string S2="------------------ CONFIGURACION OPERACIONES CONTRARIAS ------------------";
input bool Habilitar_Operaciones_Contrarias=true; // Habilitar Operaciones Contrarias
input double Lotes_2=0.2; // Lotes
input double SL_2=0; //Stop Loss (in pips)
double TP_2=0; //Take Profit (in pips)
input string S3="------------------ CONFIGURACION CIERRE EXPERTO POR GANANCIA ------------------";
input bool Activar_Cierre_Experto=true;
input double Ganancia=100;

double BALANCE_EMPIEZA=0;



MqlRates rates[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   trade.SetExpertMagicNumber(Magic_Number);
   ArraySetAsSeries(rates,true);

   BALANCE_EMPIEZA=AccountInfoDouble(ACCOUNT_BALANCE);

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

   if(AccountInfoDouble(ACCOUNT_EQUITY)-BALANCE_EMPIEZA>=Ganancia && Activar_Cierre_Experto)
     {
      Alert("Ganancia Objetiva Obtenida ",DoubleToString(Ganancia,2),"$ Cierre del Experto");
      Close_All_Experto();
      ExpertRemove();
     }

   TrailingStop();
   static datetime prevTime=0;

   int copied=CopyRates(Symbol(),Time_Frame,0,Entrar_Barra+2,rates);

   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   if(prevTime!=rates[0].time)
     {
      Print("Tiempo_Entra ",TimeToString(prevTime,TIME_DATE|TIME_MINUTES));
      if(MathAbs(rates[1].close-rates[0].open)/Point()<=Gap)
        {
         if(Modo_Operacion==UP)
           {
            if(rates[1].close<rates[1].open)
               Close_Velas_Contarias(true);

            Print("Tiempo_Entra BUY ",TimeToString(prevTime,TIME_DATE|TIME_MINUTES));
            bool Condicion=true;
            for(int i=1; i<Entrar_Barra; i++)
              {
               if(rates[i].close<rates[i].open)
                 {
                  Condicion=false;
                  break;
                 }
              }

            if(Condicion)
              {
               double TP_=TP==0?0:Ask+TP*Point();
               double SL_=SL==0?0:Bid-SL*Point();
               // Operamos UP con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
               bool BuyTradeBool=trade.Buy(Lotes,Symbol(),Ask,SL_,TP_,CommentExpert);

               if(Habilitar_Operaciones_Contrarias)
                 {
                  TP_=TP_2==0?0:Bid-TP_2*Point();
                  SL_=SL_2==0?0:Ask+SL_2*Point();
                  // Operamos DOWN con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
                  bool SellTradeBool=trade.Sell(Lotes_2,Symbol(),Bid,SL_,TP_,CommentExpert);
                 }
              }
           }
         if(Modo_Operacion==DOWN)
           {
            if(rates[1].close>rates[1].open)
               Close_Velas_Contarias(false);

            bool Condicion=true;
            for(int i=1; i<Entrar_Barra; i++)
              {
               if(rates[i].close>rates[i].open)
                 {
                  Condicion=false;
                  break;
                 }
              }

            if(Condicion)
              {
               double TP_=TP==0?0:Bid-TP*Point();
               double SL_=SL==0?0:Ask+SL*Point();
               // Operamos DOWN con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
               bool SellTradeBool=trade.Sell(Lotes,Symbol(),Bid,SL_,TP_,CommentExpert);
               if(Habilitar_Operaciones_Contrarias)
                 {
                  TP_=TP_2==0?0:Ask+TP_2*Point();
                  SL_=SL_2==0?0:Bid-SL_2*Point();
                  // Operamos UP con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
                  bool BuyTradeBool=trade.Buy(Lotes_2,Symbol(),Ask,SL_,TP_,CommentExpert);
                 }
              }
           }
        }

      prevTime=rates[0].time;
     }
   Close_All_();
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TrailingStop()
  {

   int TotalPosiciones=PositionsTotal();
   for(int i=0; i<TotalPosiciones; i++)
     {
      ulong Ticket=PositionGetTicket(i);
      double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
      double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
      // if(PositionGetString(POSITION_COMMENT)!=CommentExpert)
      // continue;qp
      if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      if(Ticket!=0)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && Trailing_Stop>0 && NormalizeDouble(Bid-Trailing_Stop*Point()*10,Digits())>PositionGetDouble(POSITION_PRICE_OPEN)
            && (Bid-PositionGetDouble(POSITION_SL)>=Trailing_Step*2* Point() || PositionGetDouble(POSITION_SL)==0 || PositionGetDouble(POSITION_SL)<PositionGetDouble(POSITION_PRICE_OPEN)) && PositionGetDouble(POSITION_SL)<NormalizeDouble(Bid-Trailing_Step*Point(),Digits()))
           {
            double Evalua=NormalizeDouble(Bid-Trailing_Step*Point(),Digits());
            trade.PositionModify(Ticket,Evalua,PositionGetDouble(POSITION_TP));
           }

         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && Trailing_Stop>0 && NormalizeDouble(Ask+Trailing_Stop*Point()*10,Digits())<PositionGetDouble(POSITION_PRICE_OPEN) &&
            (PositionGetDouble(POSITION_SL)-Ask>=Trailing_Step*2*Point() || PositionGetDouble(POSITION_SL)==0 || PositionGetDouble(POSITION_SL)>PositionGetDouble(POSITION_PRICE_OPEN)) && PositionGetDouble(POSITION_SL)>NormalizeDouble(Ask+Trailing_Step*Point(),Digits()))
           {
            double Evalua=NormalizeDouble(Ask+Trailing_Step*Point(),Digits());
            trade.PositionModify(Ticket,Evalua,PositionGetDouble(POSITION_TP));
           }

        }
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Close_Velas_Contarias(bool IsUP)
  {

   int TotalPosiciones=PositionsTotal();
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      if(IsUP==true)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
           {
            trade.PositionClose(Ticket,-1);
           }
        }

      if(IsUP==false)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
            trade.PositionClose(Ticket,-1);
        }

     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Close_All_()
  {
   ulong Array_Posiciones[];

   ArrayResize(Array_Posiciones,1);
   int Posiciones=0;

   double Total=0;

   int TotalPosiciones=PositionsTotal();
   for(int i=0; i<TotalPosiciones; i++)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      if(Modo_Operacion==UP)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
            continue;
        }

      if(Modo_Operacion==DOWN)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
            continue;
        }

      if(Ticket!=0)
        {
         ArrayResize(Array_Posiciones,Posiciones+1);
         Array_Posiciones[Posiciones]=Ticket;
         Posiciones++;
         Total=Total+PositionGetDouble(POSITION_PROFIT);
        }
     }

   if(Total>Close_All)
     {
      for(int i=0; i<ArraySize(Array_Posiciones); i++)
        {
         ulong Ticket=Array_Posiciones[i];
         if(PositionSelectByTicket(Ticket))
            trade.PositionClose(Ticket,-1);
        }

     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Close_All_Experto()
  {

   int TotalPosiciones=PositionsTotal();
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;
         
      trade.PositionClose(Ticket,-1);
      trade.PositionClose(Ticket,-1);
     }

  }
//+------------------------------------------------------------------+
