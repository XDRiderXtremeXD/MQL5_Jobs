//+------------------------------------------------------------------+
//|                                                  RSI Proyect.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"


#include<Trade\Trade.mqh>
CTrade trade;

#resource "\\Indicators\\TradingView RSI Indicator_NoRepintado.ex5"


input string S1="---- Configuracion Lote ----";//-------------------------------
input double Lote=0.01;//Lote por cada (x)
input double Cada=1000;//Cada
input string S2="---- Configuracion STOP ----";//-------------------------------
input int Porcentaje_Stop=0;// Porcentaje STOP(Balance Inicio Dia) (disable 0)
input string S3_="---- Configuracion TrailingStop ----";//-------------------------------
input double TS=2;//Porcentaje Trail
input int X_trail=200;//Mover cada X puntos
input string S3="---- Configuracion Trade ----";//-------------------------------
input double TP=2;// Porcentaje TP (disable = 0)
input double SL=2;// Porcentaje SL (disable = 0)
input int MagicNumb=22222;
input string S4="---- Configuracion Indicador ----";//-------------------------------
input int RSI_Period=14;
input int level_Up=70;
input int level_Dn=30;


int Handle=0;
double RSI_UP[];
double RSI_DN[];

datetime TimeStop=0;
bool Activo=true;

datetime Tiempo=0;

struct Trailing_Struct
  {
   double            Trail_Start;
   long              Ticket;
  };

Trailing_Struct Tickets[];

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   ArrayResize(Tickets,0);

   Activo=true;

   Handle=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\TradingView RSI Indicator_NoRepintado.ex5",RSI_Period,level_Up,level_Dn);

   if(Handle==INVALID_HANDLE)
     {
      Alert("No se encontro el indicador");
      return  INIT_FAILED;
     }


   trade.SetExpertMagicNumber(MagicNumb);

   TesterHideIndicators(false);

   ArraySetAsSeries(RSI_UP,true);
   ArraySetAsSeries(RSI_DN,true);
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
   Trailing();


   double BalanceInicial=BalanceInicial();

   double PerdidaMaxima=BalanceInicial*Porcentaje_Stop/100.0;

   string Comentario="";
   if(!Activo)
      Comentario=Comentario+"\nTiempo para Reiniciar(24H): "+TimeToString(TimeStop,TIME_DATE|TIME_MINUTES);
   else
      Comentario="Balance Inicial Diaria : "+DoubleToString(BalanceInicial,2)+" Perdida para Parar :"+DoubleToString(PerdidaMaxima,2)+" Estado del Bot "+(Activo?"Activo":"Desactivo");
   Comment(Comentario);

   if(Porcentaje_Stop>0 && Activo && BalanceInicial-PerdidaMaxima>AccountInfoDouble(ACCOUNT_BALANCE))
     {
      Activo=false;
      TimeStop=TimeCurrent()+PeriodSeconds(PERIOD_D1);
     }
   if(!Activo)
     {
      if(TimeStop<TimeCurrent())
         Activo=true;
     }

   bool CargaUP=true,CargaSELL=true;

   if(CopyBuffer(Handle,2,0,3,RSI_UP)<=0)
      CargaUP=false;
   if(CopyBuffer(Handle,3,0,3,RSI_DN)<=0)
      CargaSELL=false;

//if(iTime(Symbol(),PERIOD_CURRENT,0)==D'2022.01.03 09:57')
// Print(RSI_UP[1]," ",RSI_DN[1]);

   if(Tiempo!=iTime(Symbol(),PERIOD_CURRENT,0))
     {
      if(RSI_UP[0]!=0)
        {
         // if(iTime(Symbol(),PERIOD_CURRENT,0)==D'2022.01.03 09:57')
         //Print("Entra");

         Buy(Activo);
         Tiempo=iTime(Symbol(),PERIOD_CURRENT,0);
        }
      if(RSI_DN[0]!=0)
        {
         Sell(Activo);
         Tiempo=iTime(Symbol(),PERIOD_CURRENT,0);
        }
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Buy(bool Actividad)
  {
   int TotalPosiciones=PositionsTotal();
   bool HayBuy=false;
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);

      if(PositionGetInteger(POSITION_MAGIC)!=MagicNumb)
         continue;

      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
        {
         Print("CIERRA SELL");
         trade.PositionClose(Ticket,-1);
        }
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
         HayBuy=true;
     }
   if(Actividad)
     {
      if(!HayBuy)
        {

         double Calculo= int(AccountInfoDouble(ACCOUNT_BALANCE)/Cada);
         Calculo=Calculo*Lote;
         if(Calculo>SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
            Calculo=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);

         if(Calculo>=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
           {
            int TP_C=CalcularTP(Calculo);
            int SL_C=CalcularSL(Calculo);
            int TS_C=CalcularTS(Calculo);
            Print("TP ",TP_C," SL: ",SL_C);
            if((TP_C>=5 || TP==0) && (SL_C>=5 || SL==0))
              {
               double Entrada=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
               double SL_=NormalizeDouble(Entrada-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*SL_C,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
               double TP_=NormalizeDouble(Entrada+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*TP_C,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
               bool Trade=trade.Buy(Calculo,Symbol(),Entrada,SL==0?0:SL_,TP==0?0:TP_,"EXPERT RSI");
               if(!Trade)
                  Print("ERROR al poner BUY ",trade.ResultRetcode());
               else
                  Add_Ticket(trade.ResultDeal(),Entrada+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*TS_C);
              }
            else
               Print("ERROR TP O SL , Calculo menor que 4 puntos "+"TP: "+IntegerToString(TP_C)+" SL: "+IntegerToString(SL_C));
           }
         else
            Print("No hay suficiente balance para poner un Lote correcto");

        }
      else
         Print("HAY UN BUY ACTIVO por eso no ejecuta otro BUY");
     }
   else
      Print("Pudo ejecutar BUY pero Experto esta deshabilitado");
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Sell(bool Actividad)
  {
   int TotalPosiciones=PositionsTotal();
   bool HaySell=false;
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);

      if(PositionGetInteger(POSITION_MAGIC)!=MagicNumb)
         continue;

      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
        {
         Print("CIERRA BUY");
         trade.PositionClose(Ticket,-1);
        }
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
         HaySell=true;
     }

   if(Actividad)
     {
      if(!HaySell)
        {
         double Calculo= int(AccountInfoDouble(ACCOUNT_BALANCE)/Cada);
         Calculo=Calculo*Lote;
         if(Calculo>SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
            Calculo=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);


         if(Calculo>=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
           {
            int TP_C=CalcularTP(Calculo);
            int SL_C=CalcularSL(Calculo);
            int TS_C=CalcularTS(Calculo);
            Print("TP ",TP_C," SL: ",SL_C);
            if((TP_C>=5 || TP==0) && (SL_C>=5 || SL==0))
              {
               double Entrada=SymbolInfoDouble(Symbol(),SYMBOL_BID);
               double SL_=NormalizeDouble(Entrada+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*SL_C,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
               double TP_=NormalizeDouble(Entrada-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*TP_C,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
               bool Trade=trade.Sell(Calculo,Symbol(),Entrada,SL==0?0:SL_,TP==0?0:TP_,"EXPERT RSI");
               if(!Trade)
                  Print("ERROR al poner SELL ",trade.ResultRetcode());
               else
                  Add_Ticket(trade.ResultDeal(),Entrada-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*TS_C);
              }
            else
               Print("ERROR TP O SL , Calculo menor que 4 puntos "+"TP: "+IntegerToString(TP_C)+" SL: "+IntegerToString(SL_C));
           }
         else
            Print("No hay suficiente balance para poner un Lote correcto");

        }
      else
         Print("HAY UN SELL ACTIVO por eso no ejecuta otro SELL");
     }
   else
      Print("Pudo ejecutar SELL pero Experto esta deshabilitado");
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CalcularTP(double Calculo)
  {
   double Valor=Calculo*SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE);
   double ValorTP=AccountInfoDouble(ACCOUNT_BALANCE)*(TP/100.0);
   int TP_=int(ValorTP/Valor);

   return TP_;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CalcularTS(double Calculo)
  {
   double Valor=Calculo*SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE);
   double ValorTP=AccountInfoDouble(ACCOUNT_BALANCE)*(TS/100.0);
   int TS_=int(ValorTP/Valor);

   return TS_;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CalcularSL(double Calculo)
  {
   double Valor=Calculo*SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE);
   double ValorSL=AccountInfoDouble(ACCOUNT_BALANCE)*(SL/100.0);

   Print("Balance Actual ",AccountInfoDouble(ACCOUNT_BALANCE));
   Print("Valor Perdida con ",SL," Porcentaje: ",DoubleToString(ValorSL,2));

   int SL_=int(ValorSL/Valor);

   Print("Puntos para generar esa perdida con lote:",DoubleToString(Calculo,2)," aprox= ",SL_);

   return SL_;
  }


//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double BalanceInicial()
  {
   double ProfitTotal=0;
//--- request trade history
   HistorySelect(iTime(Symbol(),PERIOD_D1,0),TimeCurrent());
//--- create objects
   int     total=HistoryDealsTotal();
   ulong    ticket=0;
//--- for all deals
   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         // int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         double Profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         //string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);

         if(entry==DEAL_ENTRY_OUT || entry==DEAL_ENTRY_IN)
           {
            Profit=Profit+Comision+Swap;
            ProfitTotal=Profit+ProfitTotal;
           }
        }
      //}
     }
   return AccountInfoDouble(ACCOUNT_BALANCE)-ProfitTotal;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  Trailing()
  {
   int TotalPosiciones=ArraySize(Tickets);
   bool HayBuy=false;
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      if(PositionSelectByTicket(Tickets[i].Ticket))
        {
         if(PositionGetInteger(POSITION_MAGIC)!=MagicNumb)
            continue;

         //if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
         //{
         double SL_=PositionGetDouble(POSITION_SL);
         double Entrada=PositionGetDouble(POSITION_PRICE_OPEN);
         double Precio=PositionGetDouble(POSITION_PRICE_CURRENT);
         double TP_=PositionGetDouble(POSITION_TP);
         double StopLoss=0;

         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
           {
            double Distancia_alpha=Tickets[i].Trail_Start-Entrada-2*X_trail*Point();
            if(Distancia_alpha<0)
               Distancia_alpha=0;

            if(Precio>=Tickets[i].Trail_Start)
              {

               if(SL_<Entrada || SL_==0)
                  StopLoss=Entrada;
               else
                  if(SL_!=0)
                    {
                     if(Precio-SL_-Distancia_alpha>=2*X_trail*Point())
                        StopLoss=SL_+X_trail*Point();
                    }
               if(  (SL_==0 || (StopLoss!=SL_&& SL_<StopLoss))  && StopLoss!=0 )
                 {
                  Print(Distancia_alpha);
                  Print("BUY  SL en: ",StopLoss);
                  trade.PositionModify(Tickets[i].Ticket,StopLoss,TP_);
                 }

              }
           }


         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
           {
            double Distancia_alpha=MathAbs(Tickets[i].Trail_Start-Entrada)-2*X_trail*Point();
            if(Distancia_alpha<0)
               Distancia_alpha=0;

            if(Precio<=Tickets[i].Trail_Start)
              {

               if(SL_>Entrada || SL_==0)
                  StopLoss=Entrada;
               else
                  if(SL_!=0)
                    {
                     if(MathAbs(Precio-SL_)-Distancia_alpha>=2*X_trail*Point())
                        StopLoss=SL_-X_trail*Point();
                    }
               if(  (SL_==0 || (StopLoss!=SL_&& SL_>StopLoss))  && StopLoss!=0 )
                 {
                  Print(Distancia_alpha);
                  Print("SELL  SL en: ",StopLoss);
                  trade.PositionModify(Tickets[i].Ticket,StopLoss,TP_);
                 }

              }
           }


        }



     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Add_Ticket(long Ticket,double PriceTS)
  {
   int TotalPosiciones=ArraySize(Tickets);
   bool HayBuy=false;
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      if(!PositionSelectByTicket(Tickets[i].Ticket))
        {
         Tickets[i].Ticket=Ticket;
         Tickets[i].Trail_Start=PriceTS;
         return true;
        }
     }

   int Size=ArraySize(Tickets);
   ArrayResize(Tickets,Size+1);
   Tickets[Size].Ticket=Ticket;
   Tickets[Size].Trail_Start=PriceTS;

   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
