//+------------------------------------------------------------------+
//|                                                       3 Days.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade Trade;


input double VOLUME=0.01;//Lot
input bool DayMonday=true; 
input bool DayTuesday=true;
input bool DayWednesday=true;
input bool DayThursday=true;
input bool DayFriday=true;

input double TP_Monday=10; //Take Profit(PIPS)
input double TP_Tuesday=20; //Take Profit(PIPS)
input double TP_Wednesday=10; //Take Profit(PIPS)
input double TP_Thursday=10; //Take Profit(PIPS)
input double TP_Friday=1; //Take Profit(PIPS)

 MqlRates Rates[];
 
 double Main[];
  double Signal[];

double TPPlusCross=10; //TP Plus (PIPS))

/*
input ENUM_TIMEFRAMES PeriodStochastic=PERIOD_H1;
input int K_Period=5;
input int D_Period=3;
input int Slowing=3;
input ENUM_MA_METHOD MODE=MODE_SMA;*/

input double DistanceLevels=0;//Distance Between Levels (PIPS)
double DL=0;

double TAKEPROFIT=0;
double OrderPLaceTPbuy=0;
double OrderPLaceTPsell=0;
bool CambioTPSell=false;
bool CambioTPBuy=false;
//double TPplus=0;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   DL=DistanceLevels*Point()*10;
   //TPplus=TPPlusCross*Point()*10;
//---
   ArraySetAsSeries(Rates,true);
   ArraySetAsSeries(Signal,true);
   ArraySetAsSeries(Main,true);
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   Comment(" ");
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
  //CopiaEstocastico(Main,0);
  //CopiaEstocastico(Signal,1);
 
   int copied=CopyRates(Symbol(),PERIOD_D1,0,4,Rates); 
   if(copied<=0) 
      Print("Fallo al copiar los datos de precios ",GetLastError()); 
   else Print("Se ha copiado ",ArraySize(Rates)," barras"); 
  static datetime TradingDay=0;
  
  double Higth=iHigh(Symbol(),PERIOD_D1,iHighest(Symbol(),PERIOD_D1,MODE_HIGH,3,1));
  double Low=iLow(Symbol(),PERIOD_D1,iLowest(Symbol(),PERIOD_D1,MODE_LOW,3,1));
  double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
  double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
  
  MqlDateTime _TimeCurrent;
  
  TimeToStruct(TimeCurrent(),_TimeCurrent);
  

 /* 
 int total=PositionsTotal();
   for(int i=0; i<total; i++)
     {
      ulong  position_ticket=PositionGetTicket(i);// ticket de la posición
      string position_symbol=PositionGetString(POSITION_SYMBOL); // símbolo
      string Comentario=PositionGetString(POSITION_COMMENT);
      if(position_symbol!=Symbol())continue;
      if(Comentario!="EA HIGHT 3 DAYS" && Comentario!="EA LOW 3 DAYS")continue;
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);  // tipo de posición
       if(type==POSITION_TYPE_BUY)
        {
         if(Main[1]>Signal[1] && Main[2]<Signal[2] && CambioTPBuy==false ){
         Trade.PositionModify(position_ticket,PositionGetDouble(POSITION_SL),PositionGetDouble(POSITION_TP)+TPplus);
         CambioTPBuy=true;
         }
        }
       if(type==POSITION_TYPE_SELL)
        {
         if(Main[1]<Signal[1] && Main[2]>Signal[2] && CambioTPSell==false ){
         Trade.PositionModify(position_ticket,PositionGetDouble(POSITION_SL),PositionGetDouble(POSITION_TP)-TPplus);
         CambioTPSell=true;
         }
        }
     }*/
     
  if(TradingDay!=Rates[0].time){
  int Dia=_TimeCurrent.day_of_week;
  switch(Dia) 
  { 
   case 1: 
      TAKEPROFIT=TP_Monday*Point()*10;
       break;
   case 2: 
      TAKEPROFIT=TP_Tuesday*Point()*10;
       break;
   case 3: 
      TAKEPROFIT=TP_Wednesday*Point()*10;
       break;
   case 4: 
      TAKEPROFIT=TP_Thursday*Point()*10;
       break;
   case 5: 
      TAKEPROFIT=TP_Friday*Point()*10;
       break;
  } 
  
  
  CambioTPBuy=false;
  CambioTPSell=false;
   if ( (Dia==1 && DayMonday==true) || (Dia==2 && DayTuesday==true)
   || (Dia==3 && DayWednesday==true) || (Dia==4 && DayThursday==true) || (Dia==5 && DayFriday==true )
   ) {
   if( Ask<Higth){
   Trade.BuyStop(VOLUME,Higth+DL,Symbol(),Low,Higth+TAKEPROFIT+DL,ORDER_TIME_DAY,0,"EA HIGHT 3 DAYS");
   OrderPLaceTPbuy=Higth+TAKEPROFIT+DL;
   }
   if(Bid>Low){
   Trade.SellStop(VOLUME,Low-DL,Symbol(),Higth,Low-TAKEPROFIT-DL,ORDER_TIME_DAY,0,"EA LOW 3 DAYS");
   OrderPLaceTPsell=Low-TAKEPROFIT-DL;
   }

   }
   TradingDay=Rates[0].time;
   
   }
  
  
  
   }
  
//+------------------------------------------------------------------+

/*
void CopiaEstocastico(double &BufferIndicador[],int Index)
  {
   int handleIndicador;
   handleIndicador=iStochastic(Symbol(),PeriodStochastic,K_Period,D_Period,Slowing,MODE,STO_LOWHIGH) ;
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleIndicador,Index,0,3,BufferIndicador)<0)
     {
      Sleep(5);
     };
  }*/
  
