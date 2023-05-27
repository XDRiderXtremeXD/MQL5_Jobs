//+------------------------------------------------------------------+
//|                                          BOT_KALMAN_FILTER_2.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
#include<Trade\Trade.mqh>

CTrade trade;
MqlTick Tick;

enum ENUM_DELAY_BAR{
DELAY_CURRENTBAR=0,
DELAY_LASTBAR=1,
};


//int KALMAN_FILTER;

datetime MAXIMO=D'2020.10.17 00:00';

double BufferKalman[];

input ENUM_DELAY_BAR DELAY_BAR=DELAY_CURRENTBAR;

input double VOLUME=0.01;//Lot
input double TP=30; //Take Profit(PIPS)
input double SL=30;//StopLoss(PIPS)

enum ENUM_TYPE_ORDER
{
    ORDER_BUY=0,
    ORDER_SELL=1,
    BUY_AND_SELL=2,
};

input  ENUM_TYPE_ORDER   TYPE_ORDERS=2; 
input string Separate="--------------------------------------";
input string Separate2="----INDICATOR PARAMETERS----";



enum enTimeFrames
{
   tf_cu  = PERIOD_CURRENT, // Current time frame
   tf_m1  = PERIOD_M1,      // 1 minute
   tf_m2  = PERIOD_M2,      // 2 minutes
   tf_m3  = PERIOD_M3,      // 3 minutes
   tf_m4  = PERIOD_M4,      // 4 minutes
   tf_m5  = PERIOD_M5,      // 5 minutes
   tf_m6  = PERIOD_M6,      // 6 minutes
   tf_m10 = PERIOD_M10,     // 10 minutes
   tf_m12 = PERIOD_M12,     // 12 minutes
   tf_m15 = PERIOD_M15,     // 15 minutes
   tf_m20 = PERIOD_M20,     // 20 minutes
   tf_m30 = PERIOD_M30,     // 30 minutes
   tf_h1  = PERIOD_H1,      // 1 hour
   tf_h2  = PERIOD_H2,      // 2 hours
   tf_h3  = PERIOD_H3,      // 3 hours
   tf_h4  = PERIOD_H4,      // 4 hours
   tf_h6  = PERIOD_H6,      // 6 hours
   tf_h8  = PERIOD_H8,      // 8 hours
   tf_h12 = PERIOD_H12,     // 12 hours
   tf_d1  = PERIOD_D1,      // daily
   tf_w1  = PERIOD_W1,      // weekly
   tf_mn  = PERIOD_MN1,     // monthly
   tf_cp1 = -1,             // Next higher time frame
   tf_cp2 = -2,             // Second higher time frame
   tf_cp3 = -3              // Third higher time frame
};

input enTimeFrames       inpTimeFrame = tf_cu;       // Time frame
input double             inpPeriod    = 1;           // Period/smoothing ratio
input ENUM_APPLIED_PRICE inpPrice     = PRICE_CLOSE; // Price
enum enIterpolate
{
   interolate_yes=(int)true, // Interpolate data when in multi time frame
   interolate_no =(int)false // Do not interpolate data when in multi time frame
};
input enIterpolate inpInterpolate = interolate_yes; // Interpolation

double StopLoss;
double TakeProfit;

double ValorKalman[];

int OnInit()
  {
   if(MAXIMO<TimeCurrent()){
   return INIT_PARAMETERS_INCORRECT;
   }
  
   double points=SymbolInfoDouble(Symbol(),SYMBOL_POINT);
   StopLoss=SL*points*10;
   TakeProfit=TP*points*10;
   ArraySetAsSeries(BufferKalman,true);
   ArraySetAsSeries(ValorKalman,true);
   //KALMAN_FILTER=iCustom(Symbol(),PERIOD_CURRENT,"Kalman_filter_2",inpTimeFrame,inpPeriod,inpPrice,inpInterpolate);
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
   double TAKEPROFIT;
   double STOPLOSS;
   CopiaKalman_filter_2(BufferKalman,1);
   CopiaKalman_filter_2(ValorKalman,0);
   double bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK); 
   
   int total=PositionsTotal();
   int OrdersBuy=0, OrdersSell=0;
   for(int i=0; i<total; i++)
     {
      //--- parámetros de la orden
      ulong  position_ticket=PositionGetTicket(i);// ticket de la posición
      string position_symbol=PositionGetString(POSITION_SYMBOL); // símbolo
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);  // tipo de posición
       if(type==POSITION_TYPE_BUY)
        {
         OrdersBuy++;
         if( BufferKalman[0+DELAY_BAR]==1 && ValorKalman[1]>iClose(Symbol(),PERIOD_CURRENT,1)+5*Point()){
         trade.PositionClose(position_ticket,-1);
         OrdersBuy=0;
         }
        }
       if(type==POSITION_TYPE_SELL)
        {
         OrdersSell++;
         if(BufferKalman[1+DELAY_BAR]==2 && ValorKalman[1]<iClose(Symbol(),PERIOD_CURRENT,1)-5*Point()){
         trade.PositionClose(position_ticket,-1);
         OrdersSell=0;
         }
        }
     }
   Comment(ValorKalman[1],"  ",iClose(Symbol(),PERIOD_CURRENT,1));
   
   if(TYPE_ORDERS==2 || TYPE_ORDERS==1){
   if(BufferKalman[0+DELAY_BAR]==2 && BufferKalman[1+DELAY_BAR]==1  && OrdersSell==0 ){
   TAKEPROFIT=TakeProfit!=0?ask-TakeProfit:0;
   STOPLOSS=StopLoss!=0?bid+StopLoss:0;
   trade.Sell(VOLUME,Symbol(),ask,STOPLOSS,TAKEPROFIT,"");
   }}
   
   if(TYPE_ORDERS==2 || TYPE_ORDERS==0){
   if (BufferKalman[0+DELAY_BAR]==1 && BufferKalman[1+DELAY_BAR]==2  && OrdersBuy==0){
   TAKEPROFIT=TakeProfit!=0?bid+TakeProfit:0;
   STOPLOSS=StopLoss!=0?ask-StopLoss:0;
   trade.Buy(VOLUME,Symbol(),bid,STOPLOSS,TAKEPROFIT,"");
   }}
   
//---
   //Comment(BufferKalman[1]);
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+

void CopiaKalman_filter_2(double &BufferIndicador[],int IndexValor)
  {
   int handleIndicador;
   handleIndicador=iCustom(Symbol(),PERIOD_CURRENT,"Kalman_filter_2mtfx",inpTimeFrame,inpPeriod,inpPrice,inpInterpolate);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleIndicador,IndexValor,0,3,BufferIndicador)<0)
     {
      Sleep(5);
     };
  }