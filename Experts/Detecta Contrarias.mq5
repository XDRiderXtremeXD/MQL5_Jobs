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
MODO Modo_Operacion=UP; // Direccion Herramienta Financiera
input int Trailing_Stop=0;// Trailing Stop (in pips)
input int Trailing_Step=0;// Trailing Step (in pips)
input int Gap=1;//Gap in pips
input ENUM_TIMEFRAMES Time_Frame=PERIOD_CURRENT;
input int Magic_Number=2222222;
input string CommentExpert="Experto Crash Boom";
input string S2="------------------ CONFIGURACION OPERACIONES CONTRARIAS ------------------";
input double Lotes_2=0.2; // Lotes
input double SL_2=1000; //Stop Loss (in pips)
double TP_2=0; //Take Profit (in pips)
input string S3="------------------ CONFIGURACION CIERRE EXPERTO POR GANANCIA ------------------";
input bool Activar_Cierre_Experto=false;
input double Ganancia=100;

double BALANCE_EMPIEZA=0;

double Alcance=0;
bool Entra=true;

MqlRates rates[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   if(StringFind(Symbol(),"Crash",0)!=1)
      Modo_Operacion=UP;
   else
      if(StringFind(Symbol(),"Boom",0)!=1)
         Modo_Operacion=DOWN;
      else
        {
         Alert("Simbolo no es Crash ni boom");
         return INIT_FAILED;
        }

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
//+-----------------------------------------------------------------
//| Expert tick function                                             |
//+------------------------------------------------------------------+-+
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

   int copied=CopyRates(Symbol(),Time_Frame,0,3,rates);

   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   if(prevTime!=rates[0].time)
     {
      Close_Velas_Contarias();
      prevTime=rates[0].time;
     }


   if(Modo_Operacion==UP)
     {

      bool Condicion_2=false;
      double Alcance_Evalua=Bid;
      if(Alcance!=0 && Alcance>Alcance_Evalua)
        {
         Condicion_2=true;
        }
      Alcance=Alcance_Evalua;

      if(Condicion_2 && Entra==true)
        {
         double TP_=TP_2==0?0:Bid-TP_2*Point();
         double SL_=SL_2==0?0:Ask+SL_2*Point();
         // Operamos DOWN con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
         bool SellTradeBool=trade.Sell(Lotes_2,Symbol(),Bid,SL_,TP_,CommentExpert);
         Entra=false;
        }
     }
   if(Modo_Operacion==DOWN)
     {
      bool Condicion_2=false;
      double Alcance_Evalua=Ask;
      if(Alcance!=0 && Alcance<Alcance_Evalua)
        {
         Condicion_2=true;
        }
      Alcance=Alcance_Evalua;

      if(Condicion_2 && Entra==true)
        {
         double TP_=TP_2==0?0:Ask+TP_2*Point();
         double SL_=SL_2==0?0:Bid-SL_2*Point();
         // Operamos UP con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
         bool BuyTradeBool=trade.Buy(Lotes_2,Symbol(),Ask,SL_,TP_,CommentExpert);
         Entra=false;
        }
     }
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
void Close_Velas_Contarias()
  {
   int TotalPosiciones=PositionsTotal();
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      trade.PositionClose(Ticket,-1);
      Entra=true;
      Alcance=0;
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

   if(Total>0)
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
