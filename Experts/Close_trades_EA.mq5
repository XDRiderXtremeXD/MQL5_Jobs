//+------------------------------------------------------------------+
//|                                              Close_trades_EA.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

int HistoryDeal=0;
#include <Trade\Trade.mqh>
CTrade trade;

input int numeroMagico=222222;//numero Magico EA principal
input string ParDivisa="USDJPY";//Par Divisa de las op que se cerraran
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   HistorySelect(0,TimeCurrent());
   HistoryDeal=HistoryDealsTotal();

   if(!VerificarSiExisteDivisa(ParDivisa))
      return INIT_FAILED;
//---
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

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTrade()
  {

   HistorySelect(0,TimeCurrent());
   int ActualHistory=HistoryDealsTotal();
   ulong ticket=0;

   if(HistoryDeal!=ActualHistory)
     {
      for(int i=ActualHistory-1;i>=HistoryDeal;i--)
         if((ticket=HistoryDealGetTicket(i))>0)
           {
            datetime time=TimeLocal();
            string symbol=HistoryDealGetString(ticket,DEAL_SYMBOL);
            long type  =HistoryDealGetInteger(ticket,DEAL_TYPE);
            long entry =HistoryDealGetInteger(ticket,DEAL_ENTRY);
            long numberMagic=HistoryDealGetInteger(ticket,DEAL_MAGIC);
            double lote=HistoryDealGetDouble(ticket,DEAL_VOLUME);
            double tp=HistoryDealGetDouble(ticket,DEAL_TP);
            double sl=HistoryDealGetDouble(ticket,DEAL_SL);
            double price=HistoryDealGetDouble(ticket,DEAL_PRICE);
            //--- only for current symbol
            if(entry==DEAL_ENTRY_OUT && (type==DEAL_TYPE_BUY || type==DEAL_TYPE_SELL) && numberMagic==numeroMagico)
              {
               CerrarOperacionesDivisa();
               break;
              }
           }
      HistoryDeal=ActualHistory;
     }

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarOperacionesDivisa()
  {
   int totalPositions = PositionsTotal();
   for(int i = totalPositions-1; i >=0; i--)
     {
      if(PositionSelectByTicket(PositionGetTicket(i)))
        {
         if(PositionGetString(POSITION_SYMBOL)==ParDivisa)
            if(!trade.PositionClose(PositionGetTicket(i),-1))
               Print("Error al cerrar posicion ",GetLastError()," resultRetcode ",trade.ResultRetcode());
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarSiExisteDivisa(string divisa)
  {
   bool customSymbol;
   if(!SymbolExist(divisa,customSymbol))
     {
      Alert("La divisa ingresada no existe");
      return false;
     }
   return true;
  }
//+------------------------------------------------------------------+
