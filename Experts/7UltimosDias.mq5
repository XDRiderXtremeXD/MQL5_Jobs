//+------------------------------------------------------------------+
//|                                                 7UltimosDias.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
#include<Trade\Trade.mqh>
CTrade trade;

int LastDay=0;
double high,low;

enum Tipo_Operacion
  {
   Only_BUY,
   Only_SELL,
   Both,
  };

input Tipo_Operacion TipoOperacion=Both;//Tipo Operacion
input string S20="===================   OPERATIVA ===================";//=========================================================
input double Lote=0.01;
input int SL=200;//Stop Loss Puntos (0 disable)
input string comentario="Expert 7Dias";
input int magicNumber=22222;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   LastDay=0;
   high=0;
   low=0;


   trade.SetExpertMagicNumber(magicNumber);
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
   MqlDateTime time;
   TimeToStruct(TimeCurrent(),time);

   if(LastDay!=time.day_of_year || high==0 || low==0)
     {
      GetLastMonthHighLow(high,low);
      LastDay=time.day_of_year;
     }

   /* if(high!=0 && low!=0)
      {
       if(TipoOperacion==Only_BUY || TipoOperacion==Both)
          if(!HayPosicion(true))
             if(!HayPendiente(true))
                PonerPendiente(true,high,low);

       if(TipoOperacion==Only_SELL || TipoOperacion==Both)
          if(!HayPosicion(false))
             if(!HayPendiente(false))
                PonerPendiente(false,high,low);
      }
   */

  }
//+------------------------------------------------------------------+
void GetLastMonthHighLow(double &high_, double &low_)
  {
   double high_Last=high;
   double low_Last=low;

   MqlDateTime time;
   TimeToStruct(TimeCurrent(),time);
// Obtener la fecha actual
   int currentYear = time.year;
   int currentMonth = time.mon;

// Calcular el mes anterior
   int previousYear = currentYear;
   int previousMonth = currentMonth - 1;
   if(previousMonth <= 0)
     {
      previousMonth = 12;
      previousYear--;
     }


// Calcular la fecha del primer día del mes anterior
   datetime firstDayOfMonth = StringToTime(StringFormat("%04d.%02d.01", currentYear, currentMonth));

   int shift=iBarShift(Symbol(),PERIOD_D1,firstDayOfMonth,false);

   if(shift!=-1)
     {
      int indHigh=iHighest(Symbol(),PERIOD_D1,MODE_HIGH,7,shift+1);
      int indLow=iLowest(Symbol(),PERIOD_D1,MODE_LOW,7,shift+1);

      if(indHigh!=-1)
         high_=iHigh(Symbol(),PERIOD_D1,indHigh);

      if(indLow!=-1)
         low_=iLow(Symbol(),PERIOD_D1,indLow);
     }


   if(high_!=high_Last)
     {     
      EliminarPendientes(true);
      PonerTP(true,high_,low_);
      if(!HuboOperacion(true))
         if(TipoOperacion==Only_BUY || TipoOperacion==Both)
            PonerPendiente(true,high,low);
     }

   if(low_!=low_Last)
     {     
      EliminarPendientes(false);
      PonerTP(false,high_,low_);
      
      if(!HuboOperacion(false))
         if(TipoOperacion==Only_SELL || TipoOperacion==Both)
            PonerPendiente(false,high,low);
     }

   Comment(iBarShift(Symbol(),PERIOD_D1,firstDayOfMonth,false),"   ",high_,"  ",low_);

  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EliminarPendientes(bool IsBuy)
  {
   int totalOrders=OrdersTotal();

   for(int i = totalOrders-1; i >= 0; i--)
     {
      if(OrderGetTicket(i)!=0)
        {
         if(OrderGetInteger(ORDER_MAGIC)==magicNumber && OrderGetString(ORDER_SYMBOL)==Symbol())
           {
            long tipo=OrderGetInteger(ORDER_TYPE);

            if((tipo==ORDER_TYPE_BUY_LIMIT || tipo==ORDER_TYPE_BUY_STOP) && IsBuy)
               if(!trade.OrderDelete(OrderGetInteger(ORDER_TICKET)))
                  Print("No elimino buy Pendiente error : ",GetLastError()," result error ",trade.ResultRetcode());

            if((tipo==ORDER_TYPE_SELL_LIMIT || tipo==ORDER_TYPE_SELL_STOP) && !IsBuy)
               if(!trade.OrderDelete(OrderGetInteger(ORDER_TICKET)))
                  Print("No elimino sell Pendiente error : ",GetLastError()," result error ",trade.ResultRetcode());
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HayPosicion(bool Buy)//true Buy false Sell
  {
   int totalOrders=PositionsTotal();

   for(int i = totalOrders-1; i >= 0; i--)
     {
      if(PositionGetTicket(i)!=0)
        {
         if(PositionGetInteger(POSITION_MAGIC)==magicNumber && PositionGetString(POSITION_SYMBOL)==Symbol())
           {
            long tipo=PositionGetInteger(POSITION_TYPE);

            if(tipo==POSITION_TYPE_BUY && Buy)
               return true;

            if(tipo==POSITION_TYPE_SELL && !Buy)
               return true;
           }
        }
     }
   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PonerTP(bool Buy,double high_,double low_)
  {
   int totalOrders=PositionsTotal();

   for(int i = totalOrders-1; i >= 0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket!=0)
        {
         if(PositionGetInteger(POSITION_MAGIC)==magicNumber && PositionGetString(POSITION_SYMBOL)==Symbol())
           {
            long tipo=PositionGetInteger(POSITION_TYPE);

            if(tipo==POSITION_TYPE_BUY && Buy)
              {
               if(PositionGetDouble(POSITION_TP)==0)
                  if(!trade.PositionModify(ticket,PositionGetDouble(POSITION_SL),high_))
                    {
                     Print("No Modifico buy TP error : ",GetLastError()," result error ",trade.ResultRetcode());
                     Print("Procede a cerrar");
                     if(!trade.PositionClose(ticket,-1))
                        Print("No Modifico buy No cerro error : ",GetLastError()," result error ",trade.ResultRetcode());
                    }
              }

            if(tipo==POSITION_TYPE_SELL && !Buy)
               if(PositionGetDouble(POSITION_TP)==0)
                  if(!trade.PositionModify(ticket,PositionGetDouble(POSITION_SL),low_))
                    {
                     Print("No Modifico sell TP error : ",GetLastError()," result error ",trade.ResultRetcode());
                     Print("Procede a cerrar");
                     if(!trade.PositionClose(ticket,-1))
                        Print("No Modifico buy No cerro error : ",GetLastError()," result error ",trade.ResultRetcode());
                    }
           }
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HayPendiente(bool Buy)//true Buy false Sell
  {
   int totalOrders=OrdersTotal();

   for(int i = totalOrders-1; i >= 0; i--)
     {
      if(OrderGetTicket(i)!=0)
        {
         if(OrderGetInteger(ORDER_MAGIC)==magicNumber && OrderGetString(ORDER_SYMBOL)==Symbol())
           {
            long tipo=OrderGetInteger(ORDER_TYPE);

            if((tipo==ORDER_TYPE_BUY_LIMIT || tipo==ORDER_TYPE_BUY_STOP) && Buy)
               return true;

            if((tipo==ORDER_TYPE_SELL_LIMIT || tipo==ORDER_TYPE_SELL_STOP) && !Buy)
               return true;
           }
        }
     }
   return false;
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PonerPendiente(bool IsBuy,double High,double Low)
  {

   double ASK=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double BID=SymbolInfoDouble(Symbol(),SYMBOL_BID);


   if(IsBuy)
     {
      double StopLoss=SL==0?0:NormalizeDouble(High-SL*Point(),Digits());

      if(ASK<High)
         if(!trade.BuyStop(Lote,High,Symbol(),StopLoss,0,ORDER_TIME_GTC,0,comentario))
           {
            Print("No opero buyStop error : ",GetLastError()," result error ",trade.ResultRetcode());
            if(!trade.Buy(Lote,Symbol(),ASK,Low,0,comentario))
               Print("No opero buy error : ",GetLastError()," result error ",trade.ResultRetcode());
           }
     }
   else
     {
      double StopLoss=SL==0?0:NormalizeDouble(Low+SL*Point(),Digits());

      if(BID>Low)
         if(!trade.SellStop(Lote,Low,Symbol(),StopLoss,0,ORDER_TIME_GTC,0,comentario))
           {
            Print("No opero sellStop error : ",GetLastError()," result error ",trade.ResultRetcode());
            if(!trade.Buy(Lote,Symbol(),ASK,Low,0,comentario))
               Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
           }
     }

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HuboOperacion(bool IsBuy)
  {
   HistorySelect(iTime(Symbol(),PERIOD_MN1,0),TimeCurrent());
//--- número total en la lista de transacciones
   int deals=HistoryDealsTotal();
   static int DealsLast=deals;
//--- ahora vamos a procesar cada transacción
   for(int i=DealsLast; i<deals; i++)
     {
      ulong deal_ticket=              HistoryDealGetTicket(i);
      ulong magic=                    HistoryDealGetInteger(deal_ticket,DEAL_MAGIC);
      ulong entry=                    HistoryDealGetInteger(deal_ticket,DEAL_ENTRY);
      string comentario_=              HistoryDealGetString(deal_ticket,DEAL_COMMENT);
      ulong tipo=                      HistoryDealGetInteger(deal_ticket,DEAL_TYPE);
      string symbol=                   HistoryDealGetString(deal_ticket,DEAL_SYMBOL);

      if(magic==magicNumber && entry==DEAL_ENTRY_IN && ((tipo==DEAL_TYPE_BUY && IsBuy) || (tipo==DEAL_TYPE_SELL && !IsBuy)))
         return true;
     }
   return false;
  }
//+------------------------------------------------------------------+
