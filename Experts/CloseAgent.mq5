//+------------------------------------------------------------------+
//|                                                 TradeManager.mq5 |
//|                                    Copyright 2020, David J. Díez |
//|                         https://www.mql5.com/es/users/davidjdiez |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, David J. Díez Munilla"
#property link      "https://www.mql5.com/en/users/davidjdiez"
#property version   "1.00"
//+--- Libraries ----------------------------------------------------!
#include <Trade\Trade.mqh>
enum PosicionesTipo{
All=0,
OnlyProfits=1,
};

//+--- Definitions --------------------------------------------------!
enum OPMODE{DayTrader=0,SwingTrader=1};
enum PCOUNT{OpenOrders=0,ProfitOrders=1};
//+--- Parameters ---------------------------------------------------!
input PosicionesTipo PosCounter=All;
input OPMODE TradingMode  = 0;
input double RiskFactor   = 2.0;   // RiskFactor (AR)
input double SL_Divider   = 1.618; // SL_Divider (AR)
input string SwingComment = "Swing";
datetime UNTIL=D'2020.11.29 00:00'; 
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit(){
return(INIT_SUCCEEDED);}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason){}
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick(){
   if(TimeCurrent()<UNTIL){
   double OrdersCount=0;
   CTrade trade;double ATR[];
   ArrayResize(ATR,3);
   ArraySetAsSeries(ATR,true);
   string Comentario=" ";
   for(int s=0;s<SymbolsTotal(true);s++){
      string SName=SymbolName(s,true);        
      for(int i=0;i<PositionsTotal();i++){
            double VolumePosiciones=0;
            double SUMALOTSIZE=0;
            
            for(int j=0;j<PositionsTotal();j++){
            ulong iTicket2=PositionGetTicket(j);
            string NameSymbol=PositionGetString(POSITION_SYMBOL);
            int ATRHL=iATR(NameSymbol,PERIOD_D1,14); 
            CopyBuffer(ATRHL,0,0,3,ATR);
            double Balance2=AccountInfoDouble(ACCOUNT_BALANCE);
            double SPoint2=SymbolInfoDouble(SName,SYMBOL_POINT);
            double Tick2=SymbolInfoDouble(SName,SYMBOL_TRADE_TICK_VALUE);
            double Risk2=(Balance2/100+10)/Balance2;if(Risk2<RiskFactor){Risk2=RiskFactor;}
            if(PosCounter!=All){
            if(PositionGetDouble(POSITION_PROFIT)>0){
            Print("ACA");
            VolumePosiciones=VolumePosiciones+PositionGetDouble(POSITION_VOLUME); 
            SUMALOTSIZE=SUMALOTSIZE+ValorLotSize(Risk2,Balance2,ATR,Tick2,SPoint2);}
            }
            else {
            VolumePosiciones=VolumePosiciones+PositionGetDouble(POSITION_VOLUME);     
            SUMALOTSIZE=SUMALOTSIZE+ValorLotSize(Risk2,Balance2,ATR,Tick2,SPoint2);
            }}
       
         ulong iTicket=PositionGetTicket(i);
         if(PositionGetString(POSITION_SYMBOL)==SName){
            Print("SUMALOTSIZE:",SUMALOTSIZE," VolumePosiciones:",VolumePosiciones," Posiciones:",PositionsTotal());
            int ATRH=iATR(SName,PERIOD_D1,14);
            CopyBuffer(ATRH,0,0,3,ATR);
            double Positions=PositionsTotal()*VolumePosiciones/SUMALOTSIZE;
            Comment("SUMALOTSIZE= ",SUMALOTSIZE," || VolumePosiciones= ",VolumePosiciones," || Posiciones= ",PositionsTotal(),"\n","PosicionesResultado= ",Positions);
            Print("PosicionesResultado:",Positions);
            double Balance=AccountInfoDouble(ACCOUNT_BALANCE);
            double SPoint=SymbolInfoDouble(SName,SYMBOL_POINT);
            double Tick=SymbolInfoDouble(SName,SYMBOL_TRADE_TICK_VALUE);
            double Risk=(Balance/100+10)/Balance;if(Risk<RiskFactor){Risk=RiskFactor;}
            //+------------------------------------------------------¡
            double Ask=SymbolInfoDouble(SName,SYMBOL_ASK);
            double Bid=SymbolInfoDouble(SName,SYMBOL_BID);
            double DTarget=Positions*(Balance*Risk)/100;
            double PO=PositionGetDouble(POSITION_PRICE_OPEN);
            double PC=PositionGetDouble(POSITION_VOLUME)/1.618;
            double CTarget=Positions*(Balance*Risk/1.618)/100;
            int SDigits=(int)SymbolInfoInteger(SName,SYMBOL_DIGITS);
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY){
               if(PositionGetDouble(POSITION_SL)<PO){
                  if(PositionGetDouble(POSITION_VOLUME)>PC){
                     //+------------------------------- ScalpMode ---!
                     if(PositionGetString(POSITION_COMMENT)!=SwingComment&&
                     TradingMode==0&&AccountInfoDouble(ACCOUNT_EQUITY)-Balance>=CTarget){
                        if(Ask>=PO+ATR[1]*0.382||(AccountInfoDouble(ACCOUNT_EQUITY)-Balance>=DTarget&&Ask>=PO+ATR[1]*0.236)){
                           if(!trade.PositionClosePartial(iTicket,NormalizeDouble(PC,2),ULONG_MAX)){
                              Print("PositionClosePartial error ",trade.ResultRetcode());
                              return;
                              }
                           else if(!trade.PositionModify(iTicket,PO,PO+ATR[1]/1.618)){
                              if(!trade.PositionModify(iTicket,PO+ATR[1]*0.382,PO+ATR[1])){
                                 Print("PositionModify error ",trade.ResultRetcode());
                                 return;
                                 }
                              }
                           else{i--;}
                           }
                        }
                     //+------------------------------- SwingMode ---!
                     else if(Ask>=PO+ATR[1]){
                        double TP=PositionGetDouble(POSITION_TP);
                        if(!trade.PositionClosePartial(iTicket,NormalizeDouble(PC,2),ULONG_MAX)){
                           Print("PositionClosePartial error ",trade.ResultRetcode());
                           return;
                           }
                        else if(!trade.PositionModify(iTicket,PO+ATR[1]/1.618,PO+ATR[1]*1.618)){
                           Print("PositionModify error ",trade.ResultRetcode());
                           return;
                           }
                        }
                     }
                  }
               }
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL){
               if(PositionGetDouble(POSITION_SL)>PO||PositionGetDouble(POSITION_SL)==0){
                  if(PositionGetDouble(POSITION_VOLUME)>PC){
                     //+------------------------------- ScalpMode ---!
                     if(PositionGetString(POSITION_COMMENT)!=SwingComment&&
                     TradingMode==0&&AccountInfoDouble(ACCOUNT_EQUITY)-Balance>=CTarget){
                        if(Bid<=PO-ATR[1]*0.382||(AccountInfoDouble(ACCOUNT_EQUITY)-Balance>=DTarget&&Bid<=PO-ATR[1]*0.236)){
                           if(!trade.PositionClosePartial(iTicket,NormalizeDouble(PC,2),ULONG_MAX)){
                              Print("PositionClosePartial error ",trade.ResultRetcode());
                              return;
                              }
                           else if(!trade.PositionModify(iTicket,PO,PO-ATR[1]/1.618)){
                              if(!trade.PositionModify(iTicket,PO-ATR[1]*0.382,PO-ATR[1])){
                                 Print("PositionModify error ",trade.ResultRetcode());
                                 return;
                                 }
                              }
                           else{i--;}
                           }
                        }
                     //+------------------------------- SwingMode ---!
                     else if(Bid<=PO-ATR[1]){
                        double TP=PositionGetDouble(POSITION_TP);
                        if(!trade.PositionClosePartial(iTicket,NormalizeDouble(PC,2),ULONG_MAX)){
                           Print("PositionClosePartial error ",trade.ResultRetcode());
                           return;
                           }
                        else if(!trade.PositionModify(iTicket,PO-ATR[1]/1.618,PO-ATR[1]*1.618)){
                           Print("PositionModify error ",trade.ResultRetcode());
                           return;
                           }
                        }
                     }
                  }
               }
            }
         }
      }
   }
 }
//+------------------------------------------------------------------+


double ValorLotSize(double Risk,double Balance,double const &ATRS[],double Tick,double SPoint){
 double LotSize=NormalizeDouble(Risk*(Balance/((ATRS[1]/SL_Divider)/SPoint))/Tick,2);
 return LotSize;
 }