//+------------------------------------------------------------------+
//|                                     BotIndicatorPersonalized.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

double Star[];
MqlRates rates[]; 
#include<Trade\Trade.mqh>
CTrade trade;

//datetime until=D'2020.10.18 00:00';

double StopLoss;
double TakeProfit;

 input double VOLUME=1;//Lot
input double TP=30; //Take Profit(PIPS)
input double SL=30;//StopLoss(PIPS)

 input int inpFastLength = 3; // Fast length
 input int inpSlowLength = 7; // Slow length
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   //TesterHideIndicators(true);
   ArraySetAsSeries(Star,true);
   ArraySetAsSeries(rates,true);
//---
    double points=SymbolInfoDouble(Symbol(),SYMBOL_POINT);
    StopLoss=SL*points*10;
   TakeProfit=TP*points*10;
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
  
  //if(until>TimeCurrent()){
  static double TAKEPROFIT;
   static double STOPLOSS;
   int copied=CopyRates(NULL,0,0,3,rates); 
   if(copied<=0) 
      Print("Fallo al copiar los datos de precios ",GetLastError()); 
   
   CopieIndicatroPersonalized(Star);
      Comment(rates[0].open," ",Star[0] );
   
   int total=PositionsTotal();
   int OrdersBuy=0, OrdersSell=0;
   
   double bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK); 
   for(int i=0; i<total; i++)
     {
      //--- parámetros de la orden
      ulong  position_ticket=PositionGetTicket(i);// ticket de la posición
      string position_symbol=PositionGetString(POSITION_SYMBOL); // símbolo
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);  // tipo de posición
       if(type==POSITION_TYPE_BUY)
        {
         OrdersBuy++;
         if(rates[1].open<Star[1]  && Star[1]!=EMPTY_VALUE) {
         
         trade.PositionClose(position_ticket,-1);
         
         OrdersBuy--;
         }
        }
       if(type==POSITION_TYPE_SELL)
        {
         OrdersSell++;
         
         if(rates[1].open>Star[1] && Star[1]!=EMPTY_VALUE ){
         
         trade.PositionClose(position_ticket,-1);
         OrdersSell--;
         }
        }
     }
   
   if(rates[1].open<Star[1]  && Star[1]!=EMPTY_VALUE && OrdersSell==0){
   TAKEPROFIT=TakeProfit!=0?ask-TakeProfit:0;
   STOPLOSS=StopLoss!=0?bid+StopLoss:0;
   trade.Sell(VOLUME,Symbol(),ask,STOPLOSS,TAKEPROFIT,"");
   
   }
    if(rates[1].open>Star[1] && Star[1]!=EMPTY_VALUE && OrdersBuy==0){
   TAKEPROFIT=TakeProfit!=0?bid+TakeProfit:0;
   STOPLOSS=StopLoss!=0?ask-StopLoss:0;
   trade.Buy(VOLUME,Symbol(),bid,STOPLOSS,TAKEPROFIT,"");
   }
  // }
  }
//+------------------------------------------------------------------+




void CopieIndicatroPersonalized(double &BufferIndicador[])
  {
   int handleIndicador;
   handleIndicador=iCustom(Symbol(),PERIOD_CURRENT,"IndicatorPersonalized",inpFastLength,inpSlowLength); // Slow length);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleIndicador,7,0,3,BufferIndicador)<0)
     {
      Sleep(5);
    };
}