//+------------------------------------------------------------------+
//|                                                   ExpertFish.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
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

enum TipoOperaciones
  {
   Buy=0,// Solo Buys
   Sell=1,// Solo Sells
   Buys_y_Sells=2,// Buys y Sells
  };

input double VOLUME=1;//Lot
input double TP=0; //Take Profit(PUNTOS)
input double SL=0;//StopLoss(PUNTOS)
input TipoOperaciones Tipo_Operaciones=Buys_y_Sells;
input int Magic_Number=9999;
input string S2_="  STOP PERDIDAS O GANANCIAS  ";//-------------------------------------------
input bool Funcion_Perdidas=true;
input int Cantidad_Perdidas=100;
input bool Funcion_Ganancias=true;
input int Cantidad_Ganancias=100;
input string S1_="  INDICADOR FISH  ";//-------------------------------------------
input string Name_Indicator="fish";
input int Fish_Period=10;

double StopLoss;
double TakeProfit;

double BufferFish[];
datetime StartDate=0;

double Profit_History=0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   Profit_History=0;
   StartDate=TimeCurrent();

   StopLoss=SL*Point();
   TakeProfit=TP*Point();

   int handleIndicador;
   handleIndicador=iCustom(Symbol(),PERIOD_CURRENT,Name_Indicator,Fish_Period);

   if(handleIndicador==INVALID_HANDLE)
     {
      Alert("No se encontro el indicador Fish");
      return INIT_FAILED;
     }

   ArraySetAsSeries(BufferFish,true);

   TesterHideIndicators(true);

   trade.SetExpertMagicNumber(Magic_Number);

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
   CopyWhiteBuffer(BufferFish,0);
   Posiciones();

   double TAKEPROFIT;
   double STOPLOSS;
   static datetime prev_time=0;

   double bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   if(prev_time!=iTime(Symbol(),PERIOD_CURRENT,0))
     {
      if(BufferFish[1]>=0 && (Tipo_Operaciones==Buy || Tipo_Operaciones==Buys_y_Sells))
        {
         TAKEPROFIT=TakeProfit!=0?ask+TakeProfit:0;
         STOPLOSS=StopLoss!=0?ask-StopLoss:0;
         trade.Buy(VOLUME,Symbol(),bid,STOPLOSS,TAKEPROFIT,"");
        }

      if(BufferFish[1]<=0  && (Tipo_Operaciones==Sell || Tipo_Operaciones==Buys_y_Sells))
        {
         TAKEPROFIT=TakeProfit!=0?bid-TakeProfit:0;
         STOPLOSS=StopLoss!=0?bid+StopLoss:0;
         trade.Sell(VOLUME,Symbol(),ask,STOPLOSS,TAKEPROFIT,"");
        }

      prev_time=iTime(Symbol(),PERIOD_CURRENT,0);
     }



  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopyWhiteBuffer(double &BufferIndicador[],int IndexBuffer)
  {
   int handleIndicador;
   handleIndicador=iCustom(Symbol(),PERIOD_CURRENT,Name_Indicator,Fish_Period);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleIndicador,IndexBuffer,0,3,BufferIndicador)<0 && !IsStopped())
     {
      Sleep(5);
     };
  }


//+------------------------------------------------------------------+
void Posiciones()
  {
   int TotalPosiciones=PositionsTotal();
   double Profit=0;
   bool Cierre=false;
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
      double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
      // if(PositionGetString(POSITION_COMMENT)!=CommentExpert)
      // continue;qp
      if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      Profit=Profit+PositionGetDouble(POSITION_PROFIT);
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
        {
         if(BufferFish[0]<0)
           {
            Cierre=true;
            trade.PositionClose(Ticket,-1);
           }
        }
      else
        {
         if(BufferFish[0]>0)
           {
            Cierre=true;
            trade.PositionClose(Ticket,-1);
           }
        }

     }

   double PT=Profit_History+Profit;

   if(Cierre)
     {
      History();
     }
   else
     {
      if(PT<=(Cantidad_Perdidas)*-1 && Funcion_Perdidas)
        {
         int Total=PositionsTotal();
         for(int i=Total-1; i>=0; i--)
           {
            ulong Ticket=PositionGetTicket(i);
            double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
            double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
            // if(PositionGetString(POSITION_COMMENT)!=CommentExpert)
            // continue;qp
            if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_SYMBOL)!=Symbol())
               continue;
            trade.PositionClose(Ticket,-1);
           }
         Alert("Cierre del Bot por Perdida");
         ExpertRemove();
        }
      if(PT>=(Cantidad_Ganancias) && Funcion_Ganancias)
        {
         int Total=PositionsTotal();
         for(int i=Total-1; i>=0; i--)
           {
            ulong Ticket=PositionGetTicket(i);
            double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
            double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
            // if(PositionGetString(POSITION_COMMENT)!=CommentExpert)
            // continue;qp
            if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_SYMBOL)!=Symbol())
               continue;
            trade.PositionClose(Ticket,-1);
           }
         Alert("Cierre del Bot por Ganancia");
         ExpertRemove();
        }
     }

  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void History()
  {
   double Profit=0;

//--- request trade history
   HistorySelect(StartDate,TimeCurrent());
//--- create objects
   int     total=HistoryDealsTotal();
   ulong    ticket=0;
//--- for all deals
   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         double Prof=HistoryDealGetDouble(ticket,DEAL_PROFIT);

         if(entry==DEAL_ENTRY_OUT)
           {
            Profit=Profit+Prof;
           }
        }
     }

   Profit_History=Profit;
//--- apply on chart
   ChartRedraw();
  }
//+------------------------------------------------------------------+
