//+------------------------------------------------------------------+
//|                                           Experto_BOOM_CRASH.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;

int BOOM_CRASH;

double BOOM_CRASH_BUY[];

int Alligator;
int Bollinger_1;

input string Settings_Trades="***Settings_Trades***";
input double StopLoss=30; //Stop Loss in PIPS
input double TakeProfit=30;// Take Profit in PIPS
input double Porcentaje=2;
input double LoteSize=100000;

input string Settings_Alligator="***Settings_Alligator***";
input int Jaw=13;
input int Jaw_Shift=8;
input int Teeth=8;
input int Teeth_Shift=5;
input int Lips=5;
input int Lips_Shift=3;
input ENUM_MA_METHOD Mode_Alligator=MODE_SMMA;
input ENUM_APPLIED_PRICE AppliedPrice_Alligator=PRICE_MEDIAN;
input string Settings_Bollinger_1_Cierre="***Settings_Bollinger_1_Para_Cierre***";
input int Bollinger_1_Periodo_Cierre=10;
input int Bollinger_1_Shift_Cierre=0;
input int Bollinger_1_Desviation_Cierre=9;
input string Settings_Bollinger_1="***Settings_Bollinger_1***";
input int Bollinger_1_Periodo=20;
input int Bollinger_1_Shift=0;
input int Bollinger_1_Desviation=7;
input string Settings_Bollinger_2="***Settings_Bollinger_2***";
input int Bollinger_2_Periodo=10;
input int Bollinger_2_Shift=0;
input int Bollinger_2_Desviation=9;

input string Settings_DivergenciaPuntos_1="***Settings_DivergenciaPuntos_1***";
input int PeriodoDivergenciaPuntos_1=7;
input int DesviacionDivergenciaPuntos_1=2;

input string Settings_DivergenciaPuntos_2="***Settings_DivergenciaPuntos_2***";
input int PeriodoDivergenciaPuntos_2=10;
input int DesviacionDivergenciaPuntos_2=0;

input string Settings_DivergenciaPuntos_3="***Settings_DivergenciaPuntos_3***";
input int PeriodoDivergenciaPuntos_3=20;
input int DesviacionDivergenciaPuntos_3=2;

input string Settings_DivergenciaPuntos_4="***Settings_DivergenciaPuntos_4***";
input int PeriodoDivergenciaPuntos_4=10;
input int DesviacionDivergenciaPuntos_4=2;

input string Settings_Bollinger_EMA_Alligator="***Settings_Bollinger_EMA_Alligator***";
input int Periodo_EMA=50;
input int Shift_EMA=0;
input ENUM_MA_METHOD Mode_EMA=MODE_EMA;
input string Settings_ADX="***Settings_ADX***";
input uint    PeriodoADX=25;
input string Settings_Bollinger_ADX="***Settings_Bollinger_ADX***";
input int Bollinger_ADX_Periodo=20;
input int Bollinger_ADX_Shift=0;
input int Bollinger_ADX_Desviation=2;

input string Settings_Alerts="***Settings_Alerts***";
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=true;

double Point_,TakeProfit_,StopLoss_;

datetime TimeStart,PrevTimeBuy=0;

double Bollinger_1_Buffer_UP[];
double Bollinger_1_Buffer_DN[];

MqlRates Rates[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   Alligator=iAlligator(Symbol(),PERIOD_CURRENT,Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator);
   Bollinger_1=iBands(Symbol(),PERIOD_CURRENT,Bollinger_1_Periodo_Cierre,Bollinger_1_Shift_Cierre,Bollinger_1_Desviation_Cierre,Alligator);
   BOOM_CRASH=iCustom(Symbol(),PERIOD_CURRENT,"x4_2_Bandas_CRASH",
                      Settings_Alligator,Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator
                      ,AppliedPrice_Alligator,Settings_Bollinger_1,Bollinger_1_Periodo,Bollinger_1_Shift,Bollinger_1_Desviation,Settings_Bollinger_2
                      ,Bollinger_2_Periodo,Bollinger_2_Shift,Bollinger_2_Desviation,Settings_DivergenciaPuntos_1,PeriodoDivergenciaPuntos_1,DesviacionDivergenciaPuntos_1,
                      Settings_DivergenciaPuntos_2,PeriodoDivergenciaPuntos_2,DesviacionDivergenciaPuntos_2,Settings_DivergenciaPuntos_3
                      ,PeriodoDivergenciaPuntos_3,DesviacionDivergenciaPuntos_3,Settings_DivergenciaPuntos_4,PeriodoDivergenciaPuntos_4,DesviacionDivergenciaPuntos_4
                      ,Settings_Bollinger_EMA_Alligator,Periodo_EMA,Shift_EMA,Mode_EMA,Settings_ADX,PeriodoADX,Settings_Bollinger_ADX,Bollinger_ADX_Periodo,
                      Bollinger_ADX_Shift,Bollinger_ADX_Desviation,Settings_Alerts,AlertPC,AlertMovil,AlertMail);


   ArraySetAsSeries(BOOM_CRASH_BUY,true);

   ArraySetAsSeries(Bollinger_1_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_1_Buffer_DN,true);

   if((Digits()==5)||(Digits()==3))
     { Point_=Point()*10;}
   else
      Point_=Point();

   TakeProfit_=Point_*TakeProfit;
   StopLoss_=Point_*StopLoss;

   TimeStart=TimeCurrent();

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   int copied=CopyRates(Symbol(),PERIOD_CURRENT,0,3,Rates);
   if(copied<=0)
      Print("Fallo al copiar los datos de precios ",GetLastError());

   CopyBuffer(BOOM_CRASH,1,0,3,BOOM_CRASH_BUY);
   CopyBuffer(Bollinger_1,1,0,3,Bollinger_1_Buffer_UP);
   CopyBuffer(Bollinger_1,2,0,3,Bollinger_1_Buffer_DN);

   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   ResetLastError();

   int Buy=0;

   for(int i=0; i<PositionsTotal(); i++)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetSymbol(i)!=Symbol() || PositionGetString(POSITION_COMMENT)!="Expert Final"+string(TimeStart))
         continue;
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
        {
         if(Ask>Bollinger_1_Buffer_UP[0])
           {
            trade.PositionClose(Ticket,-1);
           }
         else
            Buy++;
        }
     }

   if(BOOM_CRASH_BUY[1]!=EMPTY_VALUE && Buy==0 && PrevTimeBuy!=Rates[0].time)
     {
      double TP=TakeProfit==0?0:Ask+TakeProfit_;
      double SL=StopLoss==0?0:Bid-StopLoss_;
      double LOTE=(AccountInfoInteger(ACCOUNT_LEVERAGE)*AccountInfoDouble(ACCOUNT_BALANCE)*Porcentaje/100)/LoteSize;
      LOTE=NormalizeDouble(LOTE,2);
      Print("LOTE=",LOTE," BALANCE=",AccountInfoDouble(ACCOUNT_BALANCE)," APALANCAMIENTO=",AccountInfoInteger(ACCOUNT_LEVERAGE)," Porcentaje=",Porcentaje);
      if(LOTE>=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
        {
         bool BuyTradeBool=trade.Buy(LOTE,Symbol(),Ask,SL,TP,"Expert Final"+string(TimeStart));
         if(BuyTradeBool)
           {
            PrevTimeBuy=Rates[0].time;
            if(AlertPC)
               Alert("Operacion Buy en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
            if(AlertMovil)
               SendNotification("Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
            if(AlertMail)
               SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
           }
         else
            Print("ERROR (No abrio Operacion):",GetLastError());
        }
      else
         Print("ERROR Lote Calulado menor que el lote minimo,NO SE ABRE OPERACION");
     }

  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
