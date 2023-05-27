//+------------------------------------------------------------------+
//|                                          Bollinger Alligator.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;

int Alligator;
int Bollinger_1;
int Bollinger_2;
int ForceIndex;
int Bollinger_ForceIndex;


input string Settings_Trades="***Settings_Trades***";
input double Lotes=0.01;
input double StopLoss=30; //Stop Loss in PIPS
input double TakeProfit=30;// Take Profit in PIPS

input string Settings_Alligator="***Settings_Alligator***";
input int Jaw=13;
input int Jaw_Shift=8;
input int Teeth=8;
input int Teeth_Shift=5;
input int Lips=5;
input int Lips_Shift=3;
input ENUM_MA_METHOD Mode_Alligator=MODE_SMMA;
input ENUM_APPLIED_PRICE AppliedPrice_Alligator=PRICE_MEDIAN;
input string Settings_Bollinger_1="***Settings_Bollinger_1***";
input int Bollinger_1_Periodo=20;
input int Bollinger_1_Shift=0;
input int Bollinger_1_Desviation=7;
input string Settings_Bollinger_2="***Settings_Bollinger_2***";
input int Bollinger_2_Periodo=30;
input int Bollinger_2_Shift=0;
input int Bollinger_2_Desviation=2;
input double DistanciaBollinger2=0.00015;
input string Settings_Force_Index="***Settings_Force_Index***";
input int Force_Periodo=30;
input ENUM_MA_METHOD Force_Mode=MODE_SMA;
input ENUM_APPLIED_VOLUME Force_Volume_Type=VOLUME_TICK;
input string Settings_Bollinger_ForceIndex="***Settings_Bollinger_ForceIndex***";
input int Bollinger_ForceIndex_Periodo=20;
input int Bollinger_ForceIndex_Shift=0;
input int Bollinger_ForceIndex_Desviation=2;
input string Settings_Alerts="***Settings_Alerts***";
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=true;

double AlligatorBuffer[];
double ForceIndexBuffer[];
double Bollinger_1_Buffer_UP[];
double Bollinger_1_Buffer_DN[];
double Bollinger_2_Buffer_DN[];
double Bollinger_2_Buffer_UP[];
double Bollinger_2_Buffer_BASE[];
double Bollinger_ForceIndex_Buffer_DN[];
double Bollinger_ForceIndex_Buffer_UP[];

double Point_,TakeProfit_,StopLoss_;

datetime TimeStart;

MqlRates Rates[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   Alligator=iAlligator(Symbol(),PERIOD_CURRENT,Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator);
   Bollinger_1=iBands(Symbol(),PERIOD_CURRENT,Bollinger_1_Periodo,Bollinger_1_Shift,Bollinger_1_Desviation,Alligator);
   Bollinger_2=iBands(Symbol(),PERIOD_CURRENT,Bollinger_2_Periodo,Bollinger_2_Shift,Bollinger_2_Desviation,Bollinger_1);
   ForceIndex=iForce(Symbol(),PERIOD_CURRENT,Force_Periodo,Force_Mode,Force_Volume_Type);
   Bollinger_ForceIndex=iBands(Symbol(),PERIOD_CURRENT,Bollinger_ForceIndex_Periodo,Bollinger_ForceIndex_Shift,Bollinger_ForceIndex_Desviation,ForceIndex);

   ArraySetAsSeries(Rates,true);
   ArraySetAsSeries(AlligatorBuffer,true);
   ArraySetAsSeries(ForceIndexBuffer,true);
   ArraySetAsSeries(Bollinger_1_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_1_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_2_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_2_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_2_Buffer_BASE,true);

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

   CopyBuffer(Bollinger_1,1,0,3,Bollinger_1_Buffer_UP);
   CopyBuffer(Bollinger_1,2,0,3,Bollinger_1_Buffer_DN);
   CopyBuffer(Bollinger_2,1,0,4,Bollinger_2_Buffer_UP);
   CopyBuffer(Bollinger_2,2,0,4,Bollinger_2_Buffer_DN);
   CopyBuffer(Bollinger_2,0,0,4,Bollinger_2_Buffer_BASE);
   CopyBuffer(ForceIndex,0,0,4,ForceIndexBuffer);
   CopyBuffer(Bollinger_ForceIndex,2,0,4,Bollinger_ForceIndex_Buffer_DN);
   CopyBuffer(Bollinger_ForceIndex,1,0,4,Bollinger_ForceIndex_Buffer_UP);

   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   ResetLastError();

   int Buy=0,Sell=0;

   for(int i=0; i<PositionsTotal(); i++)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetSymbol(i)!=Symbol() || PositionGetString(POSITION_COMMENT)!="Expert Final"+string (TimeStart))
      continue;
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
         Buy++;
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
         Sell++;
     }

   if(Rates[2].open<Bollinger_1_Buffer_UP[2] && Rates[2].close>Bollinger_1_Buffer_UP[2]
      && Rates[1].open>Bollinger_1_Buffer_UP[1] && Rates[1].close>Bollinger_1_Buffer_UP[1]
      && (Bollinger_2_Buffer_UP[0]-Bollinger_2_Buffer_DN[0]<=DistanciaBollinger2 || (
             Bollinger_2_Buffer_BASE[3]>Bollinger_2_Buffer_BASE[2] && Bollinger_2_Buffer_BASE[2]>Bollinger_2_Buffer_BASE[1] &&
             Bollinger_2_Buffer_UP[3]>Bollinger_2_Buffer_UP[2] && Bollinger_2_Buffer_UP[2]>Bollinger_2_Buffer_UP[1] &&
             Bollinger_2_Buffer_DN[3]>Bollinger_2_Buffer_DN[2] && Bollinger_2_Buffer_DN[2]>Bollinger_2_Buffer_DN[1])) &&
      Bollinger_ForceIndex_Buffer_UP[1]<ForceIndexBuffer[1] && Buy==0 && Rates[1].close>Rates[1].open)
     {
      bool BuyTradeBool=trade.Buy(Lotes,Symbol(),Ask,Bid-StopLoss_,Ask+TakeProfit_,"Expert Final"+string (TimeStart));
      if(BuyTradeBool)
        {
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

   if(Rates[2].open>Bollinger_1_Buffer_DN[2] && Rates[2].close<Bollinger_1_Buffer_DN[2]
      && Rates[1].open<Bollinger_1_Buffer_DN[1] && Rates[1].close<Bollinger_1_Buffer_DN[1]
      && (Bollinger_2_Buffer_UP[0]-Bollinger_2_Buffer_DN[0]<=DistanciaBollinger2 || (
             Bollinger_2_Buffer_BASE[3]<Bollinger_2_Buffer_BASE[2] && Bollinger_2_Buffer_BASE[2]<Bollinger_2_Buffer_BASE[1] &&
             Bollinger_2_Buffer_UP[3]<Bollinger_2_Buffer_UP[2] && Bollinger_2_Buffer_UP[2]<Bollinger_2_Buffer_UP[1] &&
             Bollinger_2_Buffer_DN[3]<Bollinger_2_Buffer_DN[2] && Bollinger_2_Buffer_DN[2]<Bollinger_2_Buffer_DN[1])) &&
      Bollinger_ForceIndex_Buffer_DN[1]>ForceIndexBuffer[1] && Sell==0 && Rates[1].close<Rates[1].open)
     {
      bool SellTradeBool=trade.Sell(Lotes,Symbol(),Bid,Ask+StopLoss_,Bid-TakeProfit_,"Expert Final"+string (TimeStart));
      if(SellTradeBool)
        {
         if(AlertPC)
            Alert("Operacion Sell en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
         if(AlertMovil)
            SendNotification("Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
         if(AlertMail)
            SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
        }
      else
         Print("ERROR (No abrio Operacion):",GetLastError());
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
