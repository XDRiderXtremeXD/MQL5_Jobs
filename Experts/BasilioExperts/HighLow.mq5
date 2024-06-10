//+------------------------------------------------------------------+
//|                                                      HighLow.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;
#include <Trade\AccountInfo.mqh>
CAccountInfo InfoAccount;

#resource "\\Indicators\\HighLow_MACD.ex5"

enum tipo
  {
   COMPRAS_VENTAS=0,
   SOLO_VENTAS=1,
   SOLO_COMPRAS=2,
  };

enum ENUM_Horas
  {
   _0am = 0,   //:  0 am
   _1am = 1,   //:  1 am
   _2am = 2,   //:  2 am
   _3am = 3,   //:  3 am
   _4am = 4,   //:  4 am
   _5am = 5,   //:  5 am
   _6am = 6,   //:  6 am
   _7am = 7,   //:  7 am
   _8am = 8,   //:  8 am
   _9am = 9,   //:  9 am
   _10am = 10, //: 10 am
   _11am = 11, //: 11 am
   _12pm = 12, //: 12 pm
   _1pm = 13,  //:  1 pm
   _2pm = 14,  //:  2 pm
   _3pm = 15,  //:  3 pm
   _4pm = 16,  //:  4 pm
   _5pm = 17,  //:  5 pm
   _6pm = 18,  //:  6 pm
   _7pm = 19,  //:  7 pm
   _8pm = 20,  //:  8 pm
   _9pm = 21,  //:  9 pm
   _10pm = 22, //:  10 pm
   _11pm = 23, //:  11 pm
  };



input bool Operar=true;
input ENUM_TIMEFRAMES Periodo_Operaciones=PERIOD_M1;
input tipo tipo_operaciones=COMPRAS_VENTAS;
input int puntos_cercania=50;
input string S0="========== Configuracion Trade ==========";//==========================================================================================
input double Volumen=0.1;
input int StopLoss=200;
input int TakeProfit_1=200;
input int TakeProfit_2=300;
input int TakeProfit_3=400;
input int MaximoPerdidas=2;
input string ExpertComentario="3 MACDS";
input int NumeroMagico=243525;
input string S011="========== Configuracion TS ==========";//==========================================================================================
input int Primer_TakeProfit=50;
input int Segundo_TakeProfit=200;
input string S1="========== Configuracion High Low Line ==========";//==========================================================================================
input ENUM_Horas HoraStart=16;
input string S2="========== Configuracion MACD ==========";//==========================================================================================
input int Ema_Rapida=120;//EMA Rapida
input int Ema_Lenta=240;//EMA Lenta
input int MediaMovilExponencial=18;//Periodo Media Movil Exponencial
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;
input string S3="========== Configuracion HORARIO ==========";//==========================================================================================
input ENUM_Horas Hora_Inicio=_10am;
input int Minuto_Inicio=0;
input ENUM_Horas Hora_Final=_9pm;
input int Minuto_Final=30;


#resource "\\Indicators\\MACD_colores.ex5"
#resource "\\Indicators\\High_Low_Diario.ex5"


int entradas_handle=0;
//BUFFERS
double SELL[];
double BUY[];


MqlRates rates[];

double VolumenReal=0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
  VolumenReal=NormalizeDouble(Volumen*3,2);
  
   if(!SetHandleHIGHLOWLINE())
      return INIT_PARAMETERS_INCORRECT;

   if(!VerificacionesLoteTPSL())
      return INIT_PARAMETERS_INCORRECT;

   if(!VerificacionesTP_TS())
      return INIT_PARAMETERS_INCORRECT;

   ArraySetAsSeries(rates,true);
   ArraySetAsSeries(BUY,true);
   ArraySetAsSeries(SELL,true);

   trade.SetExpertMagicNumber(NumeroMagico);


   if(MQLInfoInteger(MQL_TESTER))
     {
      int macd_handle=iCustom(Symbol(),Periodo_Operaciones,"::Indicators\\MACD_colores","",Ema_Rapida,Ema_Lenta,MediaMovilExponencial,Applied_Price_MACD);
      int HL_handle=iCustom(Symbol(),Periodo_Operaciones,"::Indicators\\High_Low_Diario",HoraStart);
      ChartIndicatorAdd(0,0,macd_handle);
      ChartIndicatorAdd(0,0,HL_handle);
     }
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
   int barras_actuales=LoadBarsFromSymbol(Symbol(),Periodo_Operaciones);
   static int barLast=barras_actuales;
   int copiaBarras=3;

   if(barras_actuales!=barLast)
     {
      if(CopyRates(Symbol(),Periodo_Operaciones,0,copiaBarras,rates)>0)
        {
         if(BarsCalculated(entradas_handle)==barras_actuales)
           {
            if(CopyBuffer(entradas_handle,0,0,3,BUY)>0 && CopyBuffer(entradas_handle,1,0,3,SELL)>0)
              {
               bool EsCompra=false;
               if(CondicionEntrada(EsCompra))
                 {
                  CerrarPosiciones(!EsCompra);

                  if(Operar)
                     if(!HayOperaciones(EsCompra))
                        if(VerificarPerdidas())
                           if(tipo_operaciones==COMPRAS_VENTAS || (EsCompra?tipo_operaciones==SOLO_COMPRAS:tipo_operaciones==SOLO_VENTAS))
                              if(EvaluarHorario(Hora_Inicio,Hora_Final,Minuto_Inicio,Minuto_Final,rates[0].time))
                                {
                                 Operar_(EsCompra,ExpertComentario,VolumenReal,StopLoss,TakeProfit_1);
                                }

                  barLast=barras_actuales;
                 }
              }
           }
        }
     }


   TrailingStop();

  }
//+------------------------------------------------------------------+
bool CondicionEntrada(bool &EsCompra)
  {
   if(SELL[0]!=EMPTY_VALUE)
     {
      EsCompra=false;
      return true;
     }
   if(BUY[0]!=EMPTY_VALUE)
     {
      EsCompra=true;
      return true;
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetHandleHIGHLOWLINE()
  {
   entradas_handle=iCustom(Symbol(),Periodo_Operaciones,"::Indicators\\HighLow_MACD",puntos_cercania,S1,HoraStart,S2,Ema_Rapida,Ema_Lenta,MediaMovilExponencial,Applied_Price_MACD);

   if(INVALID_HANDLE==entradas_handle)
     {
      Alert("ERROR en el indicador High Low Entradas ",GetLastError());
      return false;
     }
   return true;
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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Operar_(bool EsCompra,string comentario,double lote,int stopLoss,int takeProfit)
  {
   long spread=SymbolInfoInteger(Symbol(),SYMBOL_SPREAD);
   if(spread>=stopLoss)
     {
      Print("No opera porque el Spread es muy alto y no deja poner el Stop Loss");
      return;
     }

   if(EsCompra)
     {
      if(InfoAccount.FreeMarginCheck(Symbol(),ORDER_TYPE_BUY,lote*3,SymbolInfoDouble(Symbol(),SYMBOL_ASK))<0)
        {
         Print("No puede operar porque se opero sin margen disponible para poner 3 operaciones con lote ",lote);
         return;
        }


      double stopLoss_=stopLoss==0?0:SymbolInfoDouble(Symbol(),SYMBOL_ASK)-stopLoss*Point();
      double takeProfit_=takeProfit==0?0:SymbolInfoDouble(Symbol(),SYMBOL_ASK)+takeProfit*Point();

      if(!trade.Buy(lote,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_ASK),stopLoss_,takeProfit_,comentario))
         Print("No opero buy error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
   else
     {
      if(InfoAccount.FreeMarginCheck(Symbol(),ORDER_TYPE_SELL,lote*3,SymbolInfoDouble(Symbol(),SYMBOL_BID))<0)
        {
         Print("No puede operar porque se opero sin margen disponible para poner 3 operaciones con lote ",lote);
         return;
        }

      double stopLoss_=stopLoss==0?0:SymbolInfoDouble(Symbol(),SYMBOL_BID)+stopLoss*Point();
      double takeProfit_=takeProfit==0?0:SymbolInfoDouble(Symbol(),SYMBOL_BID)-takeProfit*Point();

      if(!trade.Sell(lote,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_BID),stopLoss_,takeProfit_,comentario))
         Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
  }
//+------------------------------------------------------------------+
void CerrarPosiciones(bool Compras)
  {
   int totalPositions=PositionsTotal();
   for(int i =totalPositions-1; i >= 0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket!=0)
         if(Compras?PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY:PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
            trade.PositionClose(ticket,-1);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HayOperaciones(bool Compras)
  {
   int totalPositions=PositionsTotal();
   for(int i =totalPositions-1; i >= 0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket!=0)
         if(Compras?PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY:PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
            return true;
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluarHorario(int Inicio, int Final, int MInicio, int MFinal, datetime Time)
  {
   MqlDateTime TimeEvalua;
   TimeToStruct(Time,TimeEvalua);

   int Minuto = TimeEvalua.min;
   int Hora = TimeEvalua.hour;

   if((Inicio < Final)?((Inicio <= Hora && Hora <= Final)==false):((Inicio <= Hora || Hora <= Final)==false))
      return false;

   if(Inicio!=Final)
     {
      if(Inicio == Hora)
         if(Minuto < MInicio)
            return false;

      if(Final == Hora)
         if(Minuto >= MFinal)
            return false;
     }
   else
     {
      if(MFinal > MInicio)
        {
         if(Hora != Inicio)
            return false;
        }
      else
         if(MFinal < MInicio)
           {
            if(Hora == Inicio)
               if(!(MInicio <= Minuto || Minuto < MFinal))
                  return false;
           }
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TrailingStop()
  {
   int TotalPosiciones=PositionsTotal();
   for(int i=0; i<TotalPosiciones; i++)
     {
      ulong Ticket=PositionGetTicket(i);

      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)!=NumeroMagico || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      double Precio=PositionGetDouble(POSITION_PRICE_CURRENT);

      if(Ticket!=0)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && TakeProfit_1>0 && NormalizeDouble(Precio-TakeProfit_1*Point(),Digits())>=PositionGetDouble(POSITION_PRICE_OPEN))
           {
            if(PositionGetDouble(POSITION_VOLUME)==NormalizeDouble(Volumen*3,2))
               trade.Sell(Volumen,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_BID),0,0,ExpertComentario);

            if(NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)+Primer_TakeProfit*Point(),Digits())>PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0)
               trade.PositionModify(Ticket,NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)+Primer_TakeProfit*Point(),Digits()),PositionGetDouble(POSITION_TP));
           }


         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && TakeProfit_1>0 && NormalizeDouble(Precio+TakeProfit_1*Point(),Digits())<=PositionGetDouble(POSITION_PRICE_OPEN))
           {
            if(PositionGetDouble(POSITION_VOLUME)==NormalizeDouble(Volumen*3,2))
               trade.Buy(Volumen,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_ASK),0,0,ExpertComentario);

            if(NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)-Primer_TakeProfit*Point(),Digits())<PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0)
               trade.PositionModify(Ticket,NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)-Primer_TakeProfit*Point(),Digits()),PositionGetDouble(POSITION_TP));
           }


         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && TakeProfit_2>0 && NormalizeDouble(Precio-TakeProfit_2*Point(),Digits())>=PositionGetDouble(POSITION_PRICE_OPEN))
           {
            if(NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)+Segundo_TakeProfit*Point(),Digits())>PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0)
               trade.PositionModify(Ticket,NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)+Segundo_TakeProfit*Point(),Digits()),PositionGetDouble(POSITION_TP));

            if(PositionGetDouble(POSITION_VOLUME)==NormalizeDouble(Volumen*2,2))
               trade.Sell(Volumen,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_BID),0,0,ExpertComentario);
           }

         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && TakeProfit_2>0 && NormalizeDouble(Precio+TakeProfit_2*Point(),Digits())<=PositionGetDouble(POSITION_PRICE_OPEN))
           {
            if(PositionGetDouble(POSITION_VOLUME)==NormalizeDouble(Volumen*2,2))
               trade.Buy(Volumen,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_ASK),0,0,ExpertComentario);

            if(NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)-Segundo_TakeProfit*Point(),Digits())<PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0)
               trade.PositionModify(Ticket,NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)-Segundo_TakeProfit*Point(),Digits()),PositionGetDouble(POSITION_TP));
           }

         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && TakeProfit_3>0 && NormalizeDouble(Precio-TakeProfit_3*Point(),Digits())>=PositionGetDouble(POSITION_PRICE_OPEN))
           {
            if(PositionGetDouble(POSITION_VOLUME)==NormalizeDouble(Volumen*2,2))
               trade.Sell(Volumen,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_BID),0,0,ExpertComentario);

            if(NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)+Segundo_TakeProfit*Point(),Digits())>PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0)
               trade.PositionModify(Ticket,NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)+Segundo_TakeProfit*Point(),Digits()),PositionGetDouble(POSITION_TP));
           }

         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && TakeProfit_3>0 && NormalizeDouble(Precio+TakeProfit_3*Point(),Digits())<=PositionGetDouble(POSITION_PRICE_OPEN))
            if(PositionGetDouble(POSITION_VOLUME)==NormalizeDouble(Volumen*1,2))
               trade.Buy(Volumen,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_ASK),0,0,ExpertComentario);

         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && TakeProfit_3>0 && NormalizeDouble(Precio-TakeProfit_3*Point(),Digits())>=PositionGetDouble(POSITION_PRICE_OPEN))
            if(PositionGetDouble(POSITION_VOLUME)==NormalizeDouble(Volumen*1,2))
               trade.Sell(Volumen,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_BID),0,0,ExpertComentario);
        }

     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarPerdidas()
  {
   MqlDateTime str1;
   TimeToStruct(TimeCurrent(),str1);

   str1.hour=0;
   str1.min=0;
   str1.sec=0;

   double slLast=0;

   datetime dia=StructToTime(str1);
//--- request trade history
   HistorySelect(dia,TimeCurrent());
//--- create objects
   int     total=HistoryDealsTotal();
   ulong    ticket=0;
   int perdidas=0;
   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         // int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         double Profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double SL=HistoryDealGetDouble(ticket,DEAL_SL);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
         int reason=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         string comentario=HistoryDealGetString(ticket,DEAL_COMMENT);
         //string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
         if(Magic==NumeroMagico && Symbol()==Simbolo)
           {
            if(entry==DEAL_ENTRY_OUT && reason==DEAL_REASON_SL && Profit<0)
              {
               if(slLast!=SL)
                 {
                  slLast=SL;
                  perdidas++;
                 }
              }
           }
        }
     }

   if(perdidas>=MaximoPerdidas)
      return false;

   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificacionesLoteTPSL()
  {

   long stopMin=SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL);
   if(StopLoss<stopMin)
     {
      Alert("El Stop Loss Puntos debe ser mayor o igual a ",stopMin," para este activo");
      return false;
     }

   if(TakeProfit_1<stopMin)
     {
      Alert("El TakeProfit Menor Puntos debe ser mayor o igual a ",stopMin," para este activo");
      return false;
     }

   double vMax=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX);
   double vMin=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN);

   if(Volumen==vMin)
      return true;


   if(Volumen<vMin)
     {
      Alert("EL VOLUMEN DEBE SER MAYOR O IGUAL A ",vMin);
      return false;
     }

   if(Volumen>SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX))
     {
      Alert("EL VOLUMEN DEBE SER MENOR O IGUAL A ",vMax);
      return false;
     }

   double LoteEvalua=Volumen/SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
   if(LoteEvalua-((int)LoteEvalua)>0)
     {
      Alert("EL VOLUMEN DEBE SER MULTIPLO A ",SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP));
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificacionesTP_TS()
  {

   if(TakeProfit_1>TakeProfit_2 || TakeProfit_2>TakeProfit_3)
     {
      Alert("Los TakeProfits deben ser cantidades con orden creciente, por ejemplo TP1=20 TP2=30 TP3=40");
      return false;
     }

   if(Primer_TakeProfit>TakeProfit_2 )
     {
      Alert("El primer Trailing Stop (Primer_TakeProfit) debe ser menor a TakeProfit2 ",TakeProfit_2);
      return false;
     }

   if(Segundo_TakeProfit>TakeProfit_3)
     {
      Alert("El segundo Trailing Stop (Primer_TakeProfit) debe ser menor a TakeProfit3 ",TakeProfit_3);
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
