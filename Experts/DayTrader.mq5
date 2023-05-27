//+------------------------------------------------------------------+
//|                                                    DayTrader.mq5 |
//|                                    Copyright 2020, David J. Díez |
//|                         https://www.mql5.com/es/users/davidjdiez |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, David J. Díez Munilla"
#property link      "https://www.mql5.com/en/users/davidjdiez"
#property version   "1.00"
//+--- Libraries ----------------------------------------------------!
#include <Trade\Trade.mqh>
//+--- Definitions --------------------------------------------------!
enum OPMODE{LiveBar=0,NewBar=1};
//+--- Parameters ---------------------------------------------------!
input double RiskFactor    = 2.0;
input double StopLoss      = 1.618;
input double TakeProfit    = 1.618;
input bool   Martingale    = true;
input OPMODE OperationMode = 0;
input string CustomComment = "DayTrader";

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit(){return(INIT_SUCCEEDED);}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason){}
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick(){
   double ATR[];CTrade trade;
   double PDIS[],PDIM[],PDIL[];
   double MDIS[],MDIM[],MDIL[];
   double RSIS[],RSIM[],RSIL[];
   ArraySetAsSeries(ATR,true);
   ArraySetAsSeries(PDIS,true);
   ArraySetAsSeries(PDIM,true);
   ArraySetAsSeries(PDIL,true);
   ArraySetAsSeries(MDIS,true);
   ArraySetAsSeries(MDIM,true);
   ArraySetAsSeries(MDIL,true);
   ArraySetAsSeries(RSIS,true);
   ArraySetAsSeries(RSIM,true);
   ArraySetAsSeries(RSIL,true);
	for(int s=0;s<SymbolsTotal(true);s++){
      string SName=SymbolName(s,true);
      int ADXLh=iADX(SName,PERIOD_H1,14);
      int ADXMh=iADX(SName,PERIOD_M30,14);
      int ADXSh=iADX(SName,PERIOD_M15,14);
      double Ask=SymbolInfoDouble(SName,SYMBOL_ASK);
      double Bid=SymbolInfoDouble(SName,SYMBOL_BID);
      int RSISh=iRSI(SName,PERIOD_H1,14,PRICE_CLOSE);
      int RSIMh=iRSI(SName,PERIOD_H4,14,PRICE_CLOSE);
      int RSILh=iRSI(SName,PERIOD_D1,14,PRICE_CLOSE);
      int ATRh=iATR(SName,PERIOD_D1,14);CopyBuffer(ATRh,0,0,21,ATR);
      CopyBuffer(RSISh,0,0,21,RSIS);CopyBuffer(RSIMh,0,0,21,RSIM);CopyBuffer(RSILh,0,0,21,RSIL);
      CopyBuffer(ADXSh,1,0,21,PDIS);CopyBuffer(ADXSh,2,0,21,MDIS);CopyBuffer(ADXMh,1,0,21,PDIM);
      CopyBuffer(ADXMh,2,0,21,MDIM);CopyBuffer(ADXLh,1,0,21,PDIL);CopyBuffer(ADXLh,2,0,21,MDIL);
      //---------------------------------------- Money management ---!
      double Balance=AccountInfoDouble(ACCOUNT_BALANCE);
      double SPoint=SymbolInfoDouble(SName,SYMBOL_POINT);
      double minLot=SymbolInfoDouble(SName,SYMBOL_VOLUME_MIN);
      double maxLot=SymbolInfoDouble(SName,SYMBOL_VOLUME_MAX);
      double Tick=SymbolInfoDouble(SName,SYMBOL_TRADE_TICK_VALUE);
      double LotSize=NormalizeDouble((RiskFactor/100)*(Balance/(ATR[1]/SPoint))/Tick,2);
      if(StopLoss>0){NormalizeDouble((RiskFactor/100)*(Balance/((ATR[1]/StopLoss)/SPoint))/Tick,2);}
      if(LotSize<minLot){LotSize=minLot;};if(LotSize>maxLot){LotSize=maxLot;}
      //+------------------------------------------ Internal loop ---!
      int OrdersCount=0;
      double OrderLots=0;
      double OrderProfit=0;
      int BuyOrders=0,SellOrders=0;
      for(int i=PositionsTotal()-1;i>=0;i--){
         ulong iTicket=PositionGetTicket(i);
         if(PositionGetString(POSITION_SYMBOL)==SName){
            OrderLots=PositionGetDouble(POSITION_VOLUME);
            OrderProfit=PositionGetDouble(POSITION_PROFIT);
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY){BuyOrders++;}
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL){SellOrders++;}
            if(Martingale==true&&OrderProfit<0){LotSize=NormalizeDouble(LotSize*1.618,2);}
            OrdersCount++;if(OrdersCount>1){
               if(!trade.PositionClose(iTicket,ULONG_MAX)){
                  Print("PositionClose error ",trade.ResultRetcode());
                  return;
                  }
               }
            }
         }
      //+-------------------------------------------------- Start ---!
      if((PDIS[1]+PDIM[1]+PDIL[1])/3>(MDIS[1]+MDIM[1]+MDIL[1])/3){
         if((RSIS[1]+RSIM[1]+RSIL[OperationMode])/3<40&&BuyOrders<1){
            double SL=0;if(StopLoss>0){SL=Ask-ATR[1]/StopLoss;}
            double TP=0;if(TakeProfit>0){TP=Ask+ATR[1]*TakeProfit;}
            if(!trade.PositionOpen(SName,ORDER_TYPE_BUY,LotSize,Ask,SL,TP,CustomComment)){
               Print("PositionOpen error ",trade.ResultRetcode());
               return;
               }
            }
         }
      else if((PDIS[1]+PDIM[1]+PDIL[1])/3<(MDIS[1]+MDIM[1]+MDIL[1])/3){
         if((RSIS[1]+RSIM[1]+RSIL[OperationMode])/3>60&&SellOrders<1){
            double SL=0;if(StopLoss>0){SL=Bid+ATR[1]/StopLoss;}
            double TP=0;if(TakeProfit>0){TP=Bid-ATR[1]*TakeProfit;}
            if(!trade.PositionOpen(SName,ORDER_TYPE_SELL,LotSize,Bid,SL,TP,CustomComment)){
               Print("PositionOpen error ",trade.ResultRetcode());
               return;
               }
            }
         }
      }
   }
//+------------------------------------------------------------------+
