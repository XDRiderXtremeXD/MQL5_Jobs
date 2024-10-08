//+------------------------------------------------------------------+
//|                                        AUTOTRENDLINES_EXPERT.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"


enum ENUM_LINE_TYPE {
   EXM_EXM,    // 1: By 2 extremums
   EXM_DELTA   // 2: Extremum and delta
};

enum ENUM_MODE_TRADE {
   MODE_NORMAL,    // 1: MODE_NORMAL
   MODE_BREAKOUT,   // 2: MODE_BREAKOUT
};




input double VOLUME=0.01;//Lot
input double TP=40; //Take Profit(Points)
input double SL=40;//StopLoss(Points)
 bool Enable_Points_BreakEven=false;
double PointsBreakEvenDistance=100;
input bool Enable_Bar_BreakEven=false;
input int NumberBar=5;
bool Enable_SL_SR=true;//Enable SL in (Support/Resistance)
bool Enable_TP_SR=true;//Enable TP in (Support/Resistance)
int SwingHighLow=50;// SwingHighLow(Points)

int ConteoBarrasBuy=0;
int ConteoBarrasSell=0;


input ENUM_MODE_TRADE Mode_Estrategy=MODE_NORMAL;
input ENUM_LINE_TYPE InpLineType = EXM_DELTA;// Line type
input int            InpLeftExmSide = 10;    // Left extremum side (Type 1, 2)
input int            InpRightExmSide = 3;    // Right extremum side (Type 1)
input int            InpFromCurrent = 3;     // Offset from the current barà (Type 2)
input bool           InpPrevExmBar = false;  // Account for the bar before the extremum (Type 2)
//---
input int            InpLinesWidth = 2;      // lines width
input color          InpSupColor = clrRed;   // Support line color
input color          InpResColor = clrBlue;  // Resistance line color



datetime until=D'2020.10.20 00:00';


  double StopLoss;
  double TakeProfit;

#include<Trade\Trade.mqh>
CTrade trade;

   MqlRates rates[]; 
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
  int a=0;
  for(int i=0;i<ChartIndicatorsTotal(0,0);i++){
  if(ChartIndicatorName(0,0,i)=="autotrendlines"){
  a++;
  }
  }
  if(a==0){
    int handle=iCustom(Symbol(),PERIOD_CURRENT,"autotrendlines",InpLineType,InpLeftExmSide,InpRightExmSide,InpFromCurrent,InpPrevExmBar,InpLinesWidth,InpSupColor,InpResColor)  ;
    ChartIndicatorAdd(0,0,handle);}
    
   StopLoss=SL*Point();
   TakeProfit=TP*Point();
   
//---
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
  // Comment(TakeProfit);
   //if(TimeCurrent()<until){
  
   //trade.Buy(VOLUME,Symbol(),bid,STOPLOSS,TAKEPROFIT,"");
   //trade.Sell(VOLUME,Symbol(),ask,STOPLOSS,TAKEPROFIT,"");
   
   ArraySetAsSeries(rates,true);  
   int copied=CopyRates(NULL,0,0,3,rates); 
   if(copied<=0) 
      Print("Fallo al copiar los datos de precios ",GetLastError()); 
   //else Print("Se ha copiado ",ArraySize(rates)," barras"); 
  double PrecioResistencia;
  double PrecioSoporte;
    
   
   
   double bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK); 
   
//---
   double Precio=0;
   static datetime prev_time=0;
   int total=PositionsTotal();
   int OrdersBuy=0;
   int OrdersSell=0;
   ulong OrderTicketBuy=0;
   ulong OrderTicketSell=0;
  for(int i=0; i<total; i++)
     {
      //--- parámetros de la orden
      ulong  position_ticket=PositionGetTicket(i);// ticket de la posición
      string position_symbol=PositionGetString(POSITION_SYMBOL); // símbolo
      double Tp_Position=PositionGetDouble(POSITION_TP);
      double SL_Position=PositionGetDouble(POSITION_SL);
      double Open_Position=PositionGetDouble(POSITION_PRICE_OPEN);
      string ComentOperation=PositionGetString(POSITION_COMMENT);
      
      if(ComentOperation!="SELLEXPERTAUTOTRENDLINES" && ComentOperation!="BUYEXPERTAUTOTRENDLINES"){
      continue;
      }
      
      if(position_symbol!=Symbol()){
      continue;
      }
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);  // tipo de posición
       if(type==POSITION_TYPE_BUY)
        {
         if( (Enable_Points_BreakEven && bid>Open_Position+PointsBreakEvenDistance && SL_Position!=Open_Position && SL_Position<Open_Position) ){
         trade.PositionModify(position_ticket,Open_Position,Tp_Position);
         }
         ConteoBarrasBuy++;
         OrdersBuy++;
         OrderTicketBuy=position_ticket;
         if(ConteoBarrasBuy==NumberBar && Enable_Bar_BreakEven){
         trade.PositionClose(OrderTicketBuy,-1);
         OrdersBuy--;
         }
        }
       if(type==POSITION_TYPE_SELL)
        {
        if(Enable_Points_BreakEven && ask<Open_Position-PointsBreakEvenDistance && SL_Position!=Open_Position && SL_Position>Open_Position){
         trade.PositionModify(position_ticket,Open_Position,Tp_Position);
         }
         ConteoBarrasSell++;
         OrdersSell++;
         OrderTicketSell=position_ticket;
         if(ConteoBarrasSell==NumberBar && Enable_Bar_BreakEven){
         trade.PositionClose(OrderTicketSell,-1);
         OrdersSell--;
         }
        }
     }
   
   
   
   if(prev_time!=rates[0].time){
      
     PrecioResistencia=ObjectGetValueByTime(0,"Current_Resistance",iTime(Symbol(),PERIOD_CURRENT,1));  
     PrecioSoporte=ObjectGetValueByTime(0,"Current_Support",iTime(Symbol(),PERIOD_CURRENT,1));  
      
     for(int k=ObjectsTotal(0,0,OBJ_TREND)-1; k>-1; k--)
     {
      string NameSymbol=ObjectName(0,k,0,OBJ_TREND);
      
      if(StringFind(NameSymbol,"Current_Resistance",0)!=-1)
        {
         Precio=ObjectGetValueByTime(0,NameSymbol,iTime(Symbol(),PERIOD_CURRENT,0));
         Precio=NormalizeDouble(Precio,Digits());
         double Precio1=ObjectGetValueByTime(0,NameSymbol,iTime(Symbol(),PERIOD_CURRENT,1));
         Precio1=NormalizeDouble(Precio,Digits());
         double PrecioAnterior2=ObjectGetValueByTime(0,NameSymbol,iTime(Symbol(),PERIOD_CURRENT,2));
         PrecioAnterior2=NormalizeDouble(Precio,Digits());
         
         if(Mode_Estrategy==MODE_NORMAL){
         if(OrdersBuy>0 && rates[0].high>=Precio && Enable_TP_SR){
         trade.PositionClose(OrderTicketBuy,-1);
         }
         if(PrecioAnterior2>rates[2].low && PrecioAnterior2<rates[2].high  && Precio1>rates[1].open && Precio1>rates[1].close && rates[1].close<rates[1].open && OrdersSell==0 && PrecioResistencia>PrecioSoporte){
          double TAKEPROFIT=TakeProfit!=0?ask-TakeProfit:0;
          double STOPLOSS;
          STOPLOSS=Enable_SL_SR?(StopLoss!=0?Precio1+SwingHighLow*Point():0):(StopLoss!=0?bid+StopLoss:0);
          trade.Sell(VOLUME,Symbol(),ask,STOPLOSS,TAKEPROFIT,"SELLEXPERTAUTOTRENDLINES");
          ConteoBarrasSell=0;
          }
          }
         
         else if(Mode_Estrategy==MODE_BREAKOUT){
          if(PrecioAnterior2<rates[2].high && PrecioAnterior2>rates[2].low && Precio1<rates[1].open && Precio1<rates[1].close && OrdersBuy==0 && rates[1].close>rates[1].open ){
          double TAKEPROFIT=TakeProfit!=0?bid+TakeProfit:0;
          double STOPLOSS;
          STOPLOSS=Enable_SL_SR?(StopLoss!=0?Precio1-SwingHighLow*Point():0):(StopLoss!=0?ask-StopLoss:0);
          trade.Buy(VOLUME,Symbol(),bid,STOPLOSS,TAKEPROFIT,"BUYEXPERTAUTOTRENDLINES");
          ConteoBarrasBuy=0;
          }
         }
        }
       
       if(StringFind(NameSymbol,"Current_Support",0)!=-1)
        {
        Precio=ObjectGetValueByTime(0,NameSymbol,iTime(Symbol(),PERIOD_CURRENT,0));
         Precio=NormalizeDouble(Precio,Digits());
         double Precio1=ObjectGetValueByTime(0,NameSymbol,iTime(Symbol(),PERIOD_CURRENT,1));
         Precio1=NormalizeDouble(Precio,Digits());
         double PrecioAnterior2=ObjectGetValueByTime(0,NameSymbol,iTime(Symbol(),PERIOD_CURRENT,2));
         PrecioAnterior2=NormalizeDouble(Precio,Digits());
         
         if(Mode_Estrategy==MODE_NORMAL){
         if(OrdersSell>0 && rates[0].low<=Precio && Enable_TP_SR){
         trade.PositionClose(OrderTicketSell,-1);
         }
         if(PrecioAnterior2>rates[2].low && PrecioAnterior2<rates[2].high && Precio1<rates[1].open && Precio1<rates[1].close && rates[1].close>rates[1].open && OrdersBuy==0 && PrecioResistencia>PrecioSoporte){
          double TAKEPROFIT=TakeProfit!=0?bid+TakeProfit:0;
          double STOPLOSS;
          STOPLOSS=Enable_SL_SR?(StopLoss!=0?Precio1-SwingHighLow*Point():0):(StopLoss!=0?ask-StopLoss:0);
          trade.Buy(VOLUME,Symbol(),bid,STOPLOSS,TAKEPROFIT,"BUYEXPERTAUTOTRENDLINES");
          ConteoBarrasBuy=0;
         }}
         else if(Mode_Estrategy==MODE_BREAKOUT){
          if(PrecioAnterior2<rates[2].high && PrecioAnterior2>rates[2].low && Precio1>rates[1].open && Precio1>rates[1].close && OrdersSell==0 && rates[1].close<rates[1].open ){
          double TAKEPROFIT=TakeProfit!=0?ask-TakeProfit:0;
          double STOPLOSS;
          STOPLOSS=Enable_SL_SR?(StopLoss!=0?Precio1+SwingHighLow*Point():0):(StopLoss!=0?bid+StopLoss:0);
          trade.Sell(VOLUME,Symbol(),ask,STOPLOSS,TAKEPROFIT,"SELLEXPERTAUTOTRENDLINES");
          ConteoBarrasSell=0;
          }
         }
        }
     }
     prev_time=rates[0].time;
    }
   //}
 }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+





