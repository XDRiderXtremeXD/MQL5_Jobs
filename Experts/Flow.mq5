//+------------------------------------------------------------------+
//|                                                     Template.mq5 |
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
//+--- Paramaters ---------------------------------------------------!
input double RiskFactor    = 2.0;
input double MaxSpread     = 1.5;
input ENUM_TIMEFRAMES WTimeframe = PERIOD_M1;
input OPMODE OperationMode = 1;
input double ATR_Divider   = 13.0;
input double Martingale    = 1.618;
input int    MaxOrders     = 20;
input double StopLoss      = 0.0;
input string CustomComment = "Grid";
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
   CTrade trade;
   double ATR[],MFI[];
   ArraySetAsSeries(ATR,true);
   ArraySetAsSeries(MFI,true);
   for(int s=0;s<SymbolsTotal(true);s++){
      string SName=SymbolName(s,true);
      //---------------------------------------- Indicator values ---!
      int ATRh=iATR(SName,PERIOD_D1,14);
      double Ask=SymbolInfoDouble(SName,SYMBOL_ASK);
      double Bid=SymbolInfoDouble(SName,SYMBOL_BID);
      int MFIh=iMFI(SName,WTimeframe,14,VOLUME_TICK);
      CopyBuffer(ATRh,0,0,100,ATR);CopyBuffer(MFIh,0,0,100,MFI);
      double Spread=(int)SymbolInfoInteger(SName,SYMBOL_SPREAD)/10;
      //---------------------------------------- Money management ---!
      double Balance=AccountInfoDouble(ACCOUNT_BALANCE);
      double SPoint=SymbolInfoDouble(SName,SYMBOL_POINT);
      double minLot=SymbolInfoDouble(SName,SYMBOL_VOLUME_MIN);
      double maxLot=SymbolInfoDouble(SName,SYMBOL_VOLUME_MAX);
      double Tick=SymbolInfoDouble(SName,SYMBOL_TRADE_TICK_VALUE);
      double LotSize=NormalizeDouble(Balance/((ATR[1]/SPoint)/Tick)/100,2);
      /*if(LotSize<minLot){LotSize=minLot;};*/if(LotSize>maxLot){LotSize=maxLot;}
      //+------------------------------------------ Internal loop ---!
      double BEFSell=0,BEFBuy=0;
      int SDigits=0;
      double PriceOpen=0;
      double Lots=0 ,VolumeBuy=0, VolumeSell=0;
      double BELong=0,BEShort=0;
      int BuyOrders=0,SellOrders=0;
      double BuyProfit=0,SellProfit=0;
       Print("ENTRA");
      for(int i=PositionsTotal()-1;i>=0;i--){
         ulong iTicket=PositionGetTicket(i);
         if(PositionGetString(POSITION_SYMBOL)==SName){
            PriceOpen=PositionGetDouble(POSITION_PRICE_OPEN);
            SDigits=(int)SymbolInfoInteger(SName,SYMBOL_DIGITS);
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY){
               Lots=PositionGetDouble(POSITION_VOLUME);
               VolumeBuy+=PositionGetDouble(POSITION_VOLUME);
               BuyProfit+=PositionGetDouble(POSITION_PROFIT);
               BuyOrders++;BEFSell+=(Lots*PriceOpen);BELong=BEFSell/VolumeBuy;
               }
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL){
               Lots=PositionGetDouble(POSITION_VOLUME);
               VolumeSell+=PositionGetDouble(POSITION_VOLUME);
               SellProfit+=PositionGetDouble(POSITION_PROFIT);
               SellOrders++;BEFBuy+=(Lots*PriceOpen);BEShort=BEFBuy/VolumeSell;
               }
            }
         }
      //--------------------------------------------------- Start ---!
     
      if(LotSize>=minLot){
         if(Spread<=MaxSpread){
            if(MFI[OperationMode]<20&&BuyOrders<1){
               if(!trade.PositionOpen(SName,ORDER_TYPE_BUY,LotSize,Ask,0,0,CustomComment)){
                  Print("PositionOpen error ",trade.ResultRetcode());
                  return;
                  }
               }
            else if(MFI[OperationMode]>80&&SellOrders<1){
               if(!trade.PositionOpen(SName,ORDER_TYPE_SELL,LotSize,Bid,0,0,CustomComment)){
                  Print("PositionOpen error ",trade.ResultRetcode());
                  return;
                  }
               }
            }
         }
        Print("ENTRA2");
      //---------------------------------------------------- Grid ---!
      for(int i=0;i<PositionsTotal();i++){
         ulong iTicket=PositionGetTicket(i);
         if(PositionGetString(POSITION_SYMBOL)==SName){
            Lots=PositionGetDouble(POSITION_VOLUME);
            PriceOpen=PositionGetDouble(POSITION_PRICE_OPEN);
            double GridLots=NormalizeDouble(Lots*Martingale,2);
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY){
               if(ATR_Divider>0){
                  double TPL=NormalizeDouble(BELong+ATR[1]/ATR_Divider,SDigits);
                  if(PositionGetDouble(POSITION_TP)!=TPL){
                     Print(BELong," ",TPL);
                     if(!trade.PositionModify(iTicket,0,TPL)){
                        Print("PositionModify error ",trade.ResultRetcode(),"Bid: ",Bid," TPS: ",TPL);
                        return;
                        }
                     }
                  if(Spread<=MaxSpread){
                     Comment("Next BUY grid order at ",PriceOpen-ATR[1]/ATR_Divider);
                     if(Martingale<1.5){GridLots=NormalizeDouble(LotSize*MathPow(Martingale,BuyOrders),2);}
                     if(Ask<=PriceOpen-ATR[1]/ATR_Divider&&BuyOrders<MaxOrders){
                        if(!trade.PositionOpen(SName,ORDER_TYPE_BUY,GridLots,Ask,0,0,CustomComment)){
                           Print("PositionOpen error ",trade.ResultRetcode());
                           return;
                           }
                        break;
                        }
                     }
                  }
               if(StopLoss>0){
                  if(MathAbs(BuyProfit)>Balance*(StopLoss/100)){
                     if(!trade.PositionClose(iTicket,ULONG_MAX)){
                        Print("PositionClose error ",trade.ResultRetcode());
                        return;
                        }
                     else{i--;}
                     break;
                     }               
                  }
               }
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL){
               if(ATR_Divider>0){
                  double TPS=NormalizeDouble(BEShort-ATR[1]/ATR_Divider,SDigits);
                  if(PositionGetDouble(POSITION_TP)!=TPS){
                     Print(BEShort," ",TPS);
                     if(!trade.PositionModify(iTicket,0,TPS)){
                        Print("PositionModify error ",trade.ResultRetcode(),"Ask: ",Ask," TPS: ",TPS);
                        return;
                        }
                     }
                  if(Spread<=MaxSpread){
                     Comment("Next SELL grid order at ",PriceOpen+ATR[1]/ATR_Divider);
                     if(Martingale<1.5){GridLots=NormalizeDouble(LotSize*MathPow(Martingale,SellOrders),2);}
                     if(Bid>=PriceOpen+ATR[1]/ATR_Divider&&SellOrders<MaxOrders){
                        if(!trade.PositionOpen(SName,ORDER_TYPE_SELL,GridLots,Bid,0,0,CustomComment)){
                           Print("PositionOpen error ",trade.ResultRetcode());
                           return;
                           }
                        break;
                        }
                     }
                  }
               if(StopLoss>0){
                  if(MathAbs(SellProfit)>Balance*(StopLoss/100)){
                     if(!trade.PositionClose(iTicket,ULONG_MAX)){
                        Print("PositionClose error ",trade.ResultRetcode());
                        return;
                        }
                     else{i--;}
                     break;
                     }
                  }
               }
            break;
            }
         }
      }
   }
//+--------------------------------------------------------- End. ---+
// Breakeven.
// Diferentes TP.