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
input double TP=10; //TP in Pips
input double SL=10; //SL in Pips

datetime UNTIL=D'2020.11.21 00:00:00';


enum ENUM_Horas {_0am=0,_1am=1,_2am=2,_3am=3,_4am=4,_5am=5,_6am=6,_7am=7,_8am=8,_9am=9,_10am=10,_11am=11,_12pm=12,
                 _1pm=13,_2pm=14,_3pm=15,_4pm=16,_5pm=17,_6pm=18,_7pm=19,_8pm=20,_9pm=21,_10pm=22,_11pm=23,
                };
enum ENUM_TYPE {BUY=0,SELL=1};

input ENUM_Horas  Hora_Last=_2am;
input ENUM_Horas Hora_First=_4pm;


input ENUM_TYPE OrderType=BUY;

MqlRates Rates[];

//double TPplus=0;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   Comment("TEST UNTIL ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
   ArraySetAsSeries(Rates,true);
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
  if(TimeCurrent()<UNTIL){
   int copied=CopyRates(Symbol(),PERIOD_D1,0,4,Rates); 
   if(copied<=0) 
      Print("Fallo al copiar los datos de precios ",GetLastError());
   else Print("Se ha c opiado ",ArraySize(Rates)," barras"); 
  static datetime TradingDay=0;
  
  double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
  double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
  
  MqlDateTime _TimeCurrent;
  
  TimeToStruct(TimeCurrent(),_TimeCurrent);
   
  int Hora=_TimeCurrent.hour;  
     
  if(TradingDay!=Rates[0].time && Hora==Hora_First){
  int Dia=_TimeCurrent.day_of_week;
  
   if (  (Dia==1 && DayMonday==true) || (Dia==2 && DayTuesday==true)
   || (Dia==3 && DayWednesday==true) || (Dia==4 && DayThursday==true) || (Dia==5 && DayFriday==true)  )
    {
   if( OrderType==BUY){
   Trade.Buy(VOLUME,Symbol(),Ask,Ask-SL*Point()*10,Ask+TP*Point()*10,"EA HORAS BUY");;
   }
   if(OrderType==SELL){
   Trade.Sell(VOLUME,Symbol(),Bid,Bid+SL*Point()*10,Bid-TP*Point()*10,"EA HORAS SELL");;
   }
   }
   TradingDay=Rates[0].time;
   }
   
   if(Hora==Hora_Last){
   int total=PositionsTotal(); // número de posiciones abiertas
   for(int i=0;i<total;i++){
   ulong  position_ticket=PositionGetTicket(i);// ticket de la posición
   string position_symbol=PositionGetString(POSITION_SYMBOL); // símbolo
   string position_comment=PositionGetString(POSITION_COMMENT); // símbolo
   
   if(Symbol()!=position_symbol)
   continue;
   
   if(position_comment!="EA HORAS BUY" && position_comment!="EA HORAS SELL")
   continue;
   
   ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);  // tipo de posición
    
   if(type==POSITION_TYPE_BUY || type==POSITION_TYPE_SELL)     
   Trade.PositionClose( position_ticket,0);   
   }
   }
   }
 }
  
