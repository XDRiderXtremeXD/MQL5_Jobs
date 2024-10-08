//+------------------------------------------------------------------+
//|                                                    Expert PP.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>

CTrade trade;

input string NameIndicator="Signal-EA2";
input double Lots_Size=0.01; 
input ENUM_TIMEFRAMES Signal_Time_Frame=PERIOD_CURRENT;
input ENUM_TIMEFRAMES Pivot_Value_Time_Frame=PERIOD_CURRENT;
input bool TakeProfit=true;
input double TP=30; //Take Profit(PIPS)
input bool StopLoss=true;
input double SL=30;//Stop Loss(PIPS)
//input bool If_Spread_below_take_order=true; 
//input int Max_Slippage=3; 

int SLIPPAGE=0;
double TakeProfit_=0;
double StopLoss_=0;

input string ParameterIndicator="**ParameterIndicator**";
input int                inpAvgPeriod = 50;          // Average period
input ENUM_MA_METHOD     inpMaMethod  = MODE_SMA;    // Average method
input ENUM_APPLIED_PRICE inpPrice     = PRICE_CLOSE; // Price
input int                inpDevPeriod = 0;           // Deviation period (<=1 for same as average period)
input double             inpDeviation = 2;           // Deviation multiplier
input string             __º__01_00   = "";          // .
input string             __º__01_01   = "";          // Risk settings
input string             __º__01_02   = "";          // .
input double             inpRisk      = 0.75;        // Risk multiplier
input double             inpRisk2     = 1.5;         // Risk 2 multiplier
input double             inpRisk3     = 2.5;         // Risk 3 multiplier

int IndicatorHandle;
double IndicatorBufferUP[];
double IndicatorBufferDN[];

datetime TimeAnularBUY=0;
datetime TimeAnularSELL=0;

datetime UNTIL=D'2020.12.03 00:00'; 
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   
   ArrayResize(IndicatorBufferUP,3);
   ArrayResize(IndicatorBufferDN,3);
   ArraySetAsSeries(IndicatorBufferDN,true);
   ArraySetAsSeries(IndicatorBufferUP,true);
   
   //if(If_Spread_below_take_order==true)
   //SLIPPAGE=Max_Slippage;
   
   

   IndicatorHandle=iCustom(Symbol(),Signal_Time_Frame,NameIndicator,inpAvgPeriod,inpMaMethod,inpPrice,inpDevPeriod,inpDeviation,
                     __º__01_00,__º__01_01,__º__01_02,inpRisk,inpRisk2,inpRisk3);
//---
   Comment("Test until ",TimeToString(UNTIL));
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
   if(TimeCurrent()<UNTIL){
   double PP=(iClose(Symbol(),Pivot_Value_Time_Frame,1)+iHigh(Symbol(),Pivot_Value_Time_Frame,1)+iLow(Symbol(),Pivot_Value_Time_Frame,1))/3;
   CopyBuffer(IndicatorHandle,6,0,3,IndicatorBufferUP);
   CopyBuffer(IndicatorHandle,7,0,3,IndicatorBufferDN);
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   bool PositionBuy=false;
   bool PositionSell=false;
   int Total=PositionsTotal();
   for(int i=0; i<PositionsTotal(); i++)
     {
      ulong TicketPosition=PositionGetTicket(i);
      if(PositionGetSymbol(i)!=Symbol() || PositionGetString(POSITION_COMMENT)!="Position EA PP")
         continue;
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
        {
         if(IndicatorBufferDN[0]!=EMPTY_VALUE){
            trade.PositionClose(TicketPosition,-1);
            TimeAnularBUY=iTime(Symbol(),Signal_Time_Frame,1);
            TimeAnularSELL=iTime(Symbol(),Signal_Time_Frame,1);
            }
         else
            PositionBuy=true;
        }
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
        {
         if(IndicatorBufferUP[0]!=EMPTY_VALUE){
            trade.PositionClose(TicketPosition,-1);
            TimeAnularSELL=iTime(Symbol(),Signal_Time_Frame,1);
            TimeAnularBUY=iTime(Symbol(),Signal_Time_Frame,1);
            }
         else{
            PositionSell=true;
            }
        }
     }

      if(IndicatorBufferUP[0]!=EMPTY_VALUE && iOpen(Symbol(),Signal_Time_Frame,0)>PP && TimeAnularBUY!=iTime(Symbol(),Signal_Time_Frame,1) && PositionBuy==false)
        {if(TakeProfit==true)
         TakeProfit_=Ask+TP*10*Point();
         if(StopLoss==true)
         StopLoss_=Bid-SL*10*Point();
         trade.Buy(Lots_Size,NULL,Ask,StopLoss_,TakeProfit_,"Position EA PP");
         TimeAnularBUY=iTime(Symbol(),Signal_Time_Frame,0);
        }
        
      if(IndicatorBufferDN[0]!=EMPTY_VALUE && iOpen(Symbol(),Signal_Time_Frame,0)<PP && TimeAnularSELL!=iTime(Symbol(),Signal_Time_Frame,1) && PositionSell==false)
        {
         if(TakeProfit==true)
         TakeProfit_=Bid-TP*10*Point();
         if(StopLoss==true)
         StopLoss_=Ask+SL*10*Point();
         trade.Sell(Lots_Size,NULL,Bid,StopLoss_,TakeProfit_,"Position EA PP");
         TimeAnularSELL=iTime(Symbol(),Signal_Time_Frame,0);
        }
      }
     }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
   
