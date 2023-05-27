//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2020, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

#property copyright "Created with mql5.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property description "bb+obv"

enum Conteo_Tipo
  {
   ONLY_BOT=0,//Only Bot
   ALL=1,//All
  };

enum Type_Volume
  {
   Martingale=0,//Martingale
   Fixed_Volume=1,//Fixed Volume
   Volume_Risk=2,//Volume Risk %
  };

#include<Trade\Trade.mqh>
CTrade trade;

input string S1="=========== SETTINGS TRADE ====================";//==============================
input Type_Volume Volume_Type=Martingale;
input double Stop = 30;
input double target = 60;
input double trailing_stop = 10;
input double pips_trailing = 5;
input double maxima_ganancia = 10;
input int MaxOpenTrades = 1;
input bool Hedging = true;
input int MaxSlippage = 3; //slippage, adjusted in OnInit
input int MagicNumber = 350577;
int LotDigits; //initialized in OnInit
input string S22__="=========== (IF VOLUME FIXED) ====================";//==============================
input double If_Volume_Fixed=0.01;//VOLUME
input string S2__="=========== (IF VOLUME RISK) ====================";//==============================
input double If_Volume_Risk = 3;//% RISK
input string S2="=========== (IF VOLUME MARTINGALE) ====================";//==============================
input double MM_Martingale_Start = 0.1;
input double MM_Martingale_ProfitFactor = 1.5;
input double MM_Martingale_LossFactor = 0.8;
input bool MM_Martingale_RestartProfit = false;
input bool MM_Martingale_RestartLoss = false;
input int MM_Martingale_RestartLosses = 3;
input int MM_Martingale_RestartProfits = 2;
int MaxSlippage_;
input string S3="=========== HOUR ====================";//==============================
input string Hour_Start="00:00";
input string Hour_End="18:00";
input string S4="=========== DAYS ====================";//==============================
input bool TradeMonday = true;
input bool TradeTuesday = true;
input bool TradeWednesday = true;
input bool TradeThursday = true;
input bool TradeFriday = true;
input bool TradeSaturday = true;
input bool TradeSunday = true;
bool crossed[2]; //initialized to true, used in function Cross
input string S5="=========== ALERTS ====================";//==============================
input bool Send_Email = true;
input bool Audible_Alerts = true;
input bool Push_Notifications = true;
input string S6="===========   SETTINGS CONTROL PROFIT-===========";//=================================
Conteo_Tipo Operation_Count=ONLY_BOT;
input bool Count_Swap=true;
input bool Count_Comission=true;
input double Maximum_Profit=100;
input double Maximum_Loss=100;
input string S8="======================   CONFIGURACION BOTONES  ======================";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input ENUM_BASE_CORNER CORNER_BOTON=CORNER_LEFT_UPPER;
input int Boton_Desplazamiento_X=5;
input int Boton_Desplazamiento_Y=27;
input int SizeTexto=10;
input int Espacio=1;

int TOD_From_Hour = 09; //time of the day (from hour)
int TOD_From_Min = 45; //time of the day (from min)
int TOD_To_Hour = 16; //time of the day (to hour)
int TOD_To_Min = 15; //time of the day (to min)

int MaxLongTrades = 1000;
int MaxShortTrades = 1000;
int MaxPendingOrders = 1000;
int MaxLongPendingOrders = 1000;
int MaxShortPendingOrders = 1000;

int OrderRetry = 5; //# of retries if sending order returns error
int OrderWait = 5; //# of seconds to wait if sending order returns error
double myPoint; //initialized in OnInit
int OBV_handle;
double OBV[];
int MA_handle;
double MA[];
double Close[];
int Bands_handle;
double Bands_Main[];
datetime InicioTime=0;

string BOTON_REINICIO="BOTON 2021 REINICIO";

string PROFIT_ACTUAL="BOTON 2021 PROFIT ACTUAL";
string PROFIT_MAXIMO="BOTON 2021 PROFIT MAXIMO";
string PROFIT_MINIMO="BOTON 2021 PROFIT MINIMO";

string EDIT_PROFIT_ACTUAL="EDIT 2021 PROFIT ACTUAL";
string EDIT_TIME_START="EDIT 2021 TIME START";

datetime TimeStart=0;

bool Si_GananciaMaxima=false;
bool Si_PerdidaMaxima=false;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool inTimeInterval(datetime t, int From_Hour, int From_Min, int To_Hour, int To_Min)
  {
   string TOD = TimeToString(t, TIME_MINUTES);
   string TOD_From = StringFormat("%02d", From_Hour)+":"+StringFormat("%02d", From_Min);
   string TOD_To = StringFormat("%02d", To_Hour)+":"+StringFormat("%02d", To_Min);
   return((StringCompare(TOD, TOD_From) >= 0 && StringCompare(TOD, TOD_To) <= 0)
          || (StringCompare(TOD_From, TOD_To) > 0
              && ((StringCompare(TOD, TOD_From) >= 0 && StringCompare(TOD, "23:59") <= 0)
                  || (StringCompare(TOD, "00:00") >= 0 && StringCompare(TOD, TOD_To) <= 0))));
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Volume(double Price,bool isBuy) //martingale / anti-martingale
  {
   if(Volume_Type==Fixed_Volume)
      return If_Volume_Fixed;
   else
      if(Volume_Type==Martingale)
         return MM_Size();
      else
         return CalculateVolumeRisk(Price,isBuy);


   return 0.01;// --> NEVER RUN
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CalculateVolumeRisk(double Price,bool isBuy)
  {
   double Tick_Value=SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE);
   int rango=int(MathAbs(Price-(Stop*Point()))/Point())+1;
   double Perdida=AccountInfoDouble(ACCOUNT_BALANCE)*If_Volume_Risk/100.0;
   Print("Perdida Calculada ",DoubleToString(Perdida,2));
   double Lotaje=Perdida/(Tick_Value*rango);

   double Lots=int(Lotaje*100);
   Lots=NormalizeDouble(Lots/100.0,2);

   double Lote_Step=Lots/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
   int Lote_Step_int=int(Lots/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP));

// Print("Lote calculado es igual a  ",DoubleToString(Lots,2));

   if((Lote_Step-Lote_Step_int)>0)
     {
      Lots=Lote_Step_int*SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
      Print("Redondeando al Lote mas cercano permitido");
     }
//Lots=NormalizeDouble(Lots-SymbolInfoDouble(OrderSymbol(),SYMBOL_VOLUME_STEP),2);
   Print("Lote Calculado ",DoubleToString(Lots,2));

   if(Lots<SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
     {
      Print("Lote calculado menor que el minimo permitido por el Simbolo, igualando al lote minimo");
      Print("Lote = ",DoubleToString(SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN)));
      Lots=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
     }


   if(Lots>SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
     {
      Print("Lote calculado mayor que el maximo permitido por el Simbolo, igualando al lote maximo");
      Print("Lote = ",DoubleToString(SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX)));
      Lots=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);
     }

   return Lots;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double MM_Size() //martingale / anti-martingale
  {
   double lots = MM_Martingale_Start;
   double MaxLot = SymbolInfoDouble(Symbol(), SYMBOL_VOLUME_MAX);
   double MinLot = SymbolInfoDouble(Symbol(), SYMBOL_VOLUME_MIN);
   ulong ticket = 0;
   if((ticket = LastHistoryTradeTicket(DEAL_ENTRY_OUT)) > 0)
     {
      if(HistoryDealGetDouble(ticket, DEAL_PROFIT) > 0 && !MM_Martingale_RestartProfit)
         lots = HistoryDealGetDouble(ticket, DEAL_VOLUME) * MM_Martingale_ProfitFactor;
      else
         if(HistoryDealGetDouble(ticket, DEAL_PROFIT) < 0 && !MM_Martingale_RestartLoss)
            lots = HistoryDealGetDouble(ticket, DEAL_VOLUME) * MM_Martingale_LossFactor;
         else
            if(HistoryDealGetDouble(ticket, DEAL_PROFIT) == 0)
               lots = HistoryDealGetDouble(ticket, DEAL_VOLUME);
     }
   if(ConsecutivePL(false, MM_Martingale_RestartLosses))
      lots = MM_Martingale_Start;
   if(ConsecutivePL(true, MM_Martingale_RestartProfits))
      lots = MM_Martingale_Start;
   if(lots > MaxLot)
      lots = MaxLot;
   if(lots < MinLot)
      lots = MinLot;
   return(lots);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool TradeDayOfWeek()
  {
   MqlDateTime tm;
   TimeCurrent(tm);
   int day = tm.day_of_week;
   return((TradeMonday && day == 1)
          || (TradeTuesday && day == 2)
          || (TradeWednesday && day == 3)
          || (TradeThursday && day == 4)
          || (TradeFriday && day == 5)
          || (TradeSaturday && day == 6)
          || (TradeSunday && day == 0));
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cross(int i, bool condition) //returns true if "condition" is true and was false in the previous call
  {
   bool ret = condition && !crossed[i];
   crossed[i] = condition;
   return(ret);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void myAlert(string type, string message)
  {
   int handle;
   if(type == "print")
      Print(message);
   else
      if(type == "error")
        {
         Print(type+" | millonario @ "+Symbol()+","+IntegerToString(Period())+" | "+message);
        }
      else
         if(type == "order")
           {
            Print(type+" | millonario @ "+Symbol()+","+IntegerToString(Period())+" | "+message);
            if(Audible_Alerts)
               Alert(type+" | millonario @ "+Symbol()+","+IntegerToString(Period())+" | "+message);
            if(Send_Email)
               SendMail("millonario", type+" | millonario @ "+Symbol()+","+IntegerToString(Period())+" | "+message);
            handle = FileOpen("millonario.txt", FILE_TXT|FILE_READ|FILE_WRITE|FILE_SHARE_READ|FILE_SHARE_WRITE, ';');
            if(handle != INVALID_HANDLE)
              {
               FileSeek(handle, 0, SEEK_END);
               FileWrite(handle, type+" | millonario @ "+Symbol()+","+IntegerToString(Period())+" | "+message);
               FileClose(handle);
              }
            if(Push_Notifications)
               SendNotification(type+" | millonario @ "+Symbol()+","+IntegerToString(Period())+" | "+message);
           }
         else
            if(type == "modify")
              {
              }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int TradesCount(ENUM_ORDER_TYPE type) //returns # of open trades for order type, current symbol and magic number
  {
   if(type <= 1)
     {
      int result = 0;
      int total = PositionsTotal();
      for(int i = 0; i < total; i++)
        {
         if(PositionGetTicket(i) <= 0)
            continue;
         if(PositionGetInteger(POSITION_MAGIC) != MagicNumber || PositionGetString(POSITION_SYMBOL) != Symbol() || PositionGetInteger(POSITION_TYPE) != type)
            continue;
         result++;
        }
      return(result);
     }
   else
     {
      int result = 0;
      int total = OrdersTotal();
      for(int i = 0; i < total; i++)
        {
         if(OrderGetTicket(i) <= 0)
            continue;
         if(OrderGetInteger(ORDER_MAGIC) != MagicNumber || OrderGetString(ORDER_SYMBOL) != Symbol() || OrderGetInteger(ORDER_TYPE) != type)
            continue;
         result++;
        }
      return(result);
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ulong LastHistoryTradeTicket(int deal_io)
  {
   HistorySelect(InicioTime, TimeCurrent());
   int total = HistoryDealsTotal();
   ulong ticket = 0;
   for(int i = total-1; i >= 0; i--)
     {
      if((ticket = HistoryDealGetTicket(i)) <= 0)
         continue;
      if(HistoryDealGetString(ticket, DEAL_SYMBOL) == Symbol()
         && HistoryDealGetInteger(ticket, DEAL_MAGIC) == MagicNumber
         && HistoryDealGetInteger(ticket, DEAL_TYPE) <= 1 && HistoryDealGetInteger(ticket, DEAL_ENTRY) == deal_io)
         return(ticket);
     }
   return(0);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ConsecutivePL(bool profits, int n)
  {
   int count = 0;
   HistorySelect(0, TimeCurrent());
   int total = HistoryDealsTotal();
   ulong ticket = 0;
   for(int i = total-1; i >= 0; i--)
     {
      if((ticket = HistoryDealGetTicket(i)) <= 0)
         continue;
      if(HistoryDealGetString(ticket, DEAL_SYMBOL) == Symbol()
         && HistoryDealGetInteger(ticket, DEAL_TYPE) <= 1 && HistoryDealGetInteger(ticket, DEAL_ENTRY) == DEAL_ENTRY_OUT)
        {
         if((!profits && HistoryDealGetDouble(ticket, DEAL_PROFIT) >= 0) || (profits && HistoryDealGetDouble(ticket, DEAL_PROFIT) <= 0))
            break;
         count++;
        }
     }
   return(count >= n);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ulong myOrderSend(ENUM_ORDER_TYPE type, double price, double volume, string ordername) //send order, return ticket ("price" is irrelevant for market orders)
  {
   if(!TerminalInfoInteger(TERMINAL_TRADE_ALLOWED) || !MQLInfoInteger(MQL_TRADE_ALLOWED))
      return(0);
   int retries = 0;
   int long_trades = TradesCount(ORDER_TYPE_BUY);
   int short_trades = TradesCount(ORDER_TYPE_SELL);
   int long_pending = TradesCount(ORDER_TYPE_BUY_LIMIT) + TradesCount(ORDER_TYPE_BUY_STOP) + TradesCount(ORDER_TYPE_BUY_STOP_LIMIT);
   int short_pending = TradesCount(ORDER_TYPE_SELL_LIMIT) + TradesCount(ORDER_TYPE_SELL_STOP) + TradesCount(ORDER_TYPE_SELL_STOP_LIMIT);
   string ordername_ = ordername;
   if(ordername != "")
      ordername_ = "("+ordername+")";
//test Hedging
   if(!Hedging && ((type % 2 == 0 && short_trades + short_pending > 0) || (type % 2 == 1 && long_trades + long_pending > 0)))
     {
      myAlert("print", "Order"+ordername_+" not sent, hedging not allowed");
      return(0);
     }
//test maximum trades
   if((type % 2 == 0 && long_trades >= MaxLongTrades)
      || (type % 2 == 1 && short_trades >= MaxShortTrades)
      || (long_trades + short_trades >= MaxOpenTrades)
      || (type > 1 && type % 2 == 0 && long_pending >= MaxLongPendingOrders)
      || (type > 1 && type % 2 == 1 && short_pending >= MaxShortPendingOrders)
      || (type > 1 && long_pending + short_pending >= MaxPendingOrders)
     )
     {
      myAlert("print", "Order"+ordername_+" not sent, maximum reached");
      return(0);
     }
//prepare to send order
   MqlTradeRequest request;
   ZeroMemory(request);
   request.action = (type <= 1) ? TRADE_ACTION_DEAL : TRADE_ACTION_PENDING;

//set allowed filling type
   int filling = (int)SymbolInfoInteger(Symbol(),SYMBOL_FILLING_MODE);
   if(request.action == TRADE_ACTION_DEAL && (filling & 1) != 1)
      request.type_filling = ORDER_FILLING_IOC;

   request.magic = MagicNumber;
   request.symbol = Symbol();
   request.volume = NormalizeDouble(volume, LotDigits);
   request.sl = 0;
   request.tp = 0;
   request.deviation = MaxSlippage_;
   request.type = type;
   request.comment = ordername;

   int expiration=(int)SymbolInfoInteger(Symbol(), SYMBOL_EXPIRATION_MODE);
   if((expiration & SYMBOL_EXPIRATION_GTC) != SYMBOL_EXPIRATION_GTC)
     {
      request.type_time = ORDER_TIME_DAY;
      request.type_filling = ORDER_FILLING_RETURN;
     }

   MqlTradeResult result;
   ZeroMemory(result);
   while(!OrderSuccess(result.retcode) && retries < OrderRetry+1)
     {
      //refresh price before sending order
      MqlTick last_tick;
      SymbolInfoTick(Symbol(), last_tick);
      if(type == ORDER_TYPE_BUY)
         price = last_tick.ask;
      else
         if(type == ORDER_TYPE_SELL)
            price = last_tick.bid;
         else
            if(price < 0) //invalid price for pending order
              {
               myAlert("order", "Order"+ordername_+" not sent, invalid price for pending order");
               return(0);
              }
      request.price = NormalizeDouble(price, Digits());
      if(!OrderSend(request, result) || !OrderSuccess(result.retcode))
        {
         myAlert("print", "OrderSend"+ordername_+" error: "+result.comment);
         Sleep(OrderWait*1000);
        }
      retries++;
     }
   if(!OrderSuccess(result.retcode))
     {
      myAlert("error", "OrderSend"+ordername_+" failed "+IntegerToString(OrderRetry+1)+" times; error: "+result.comment);
      return(0);
     }
   string typestr[8] = {"Buy", "Sell", "Buy Limit", "Sell Limit", "Buy Stop", "Sell Stop", "Buy Stop Limit", "Sell Stop Limit"};
   myAlert("order", "Order sent"+ordername_+": "+typestr[type]+" "+Symbol()+" Magic #"+IntegerToString(MagicNumber));
   return(result.order);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int myOrderModify(ENUM_ORDER_TYPE type, ulong ticket, double SL, double TP) //modify SL and TP (absolute price), zero targets do not modify
  {
   if(!TerminalInfoInteger(TERMINAL_TRADE_ALLOWED) || !MQLInfoInteger(MQL_TRADE_ALLOWED))
      return(-1);
   bool netting = AccountInfoInteger(ACCOUNT_MARGIN_MODE) != ACCOUNT_MARGIN_MODE_RETAIL_HEDGING;
   int retries = 0;
   int err = 0;
   SL = NormalizeDouble(SL, Digits());
   TP = NormalizeDouble(TP, Digits());
   if(SL < 0)
      SL = 0;
   if(TP < 0)
      TP = 0;
//prepare to select order
   Sleep(10);
   if((type <= 1 && ((netting && !PositionSelect(Symbol())) || (!netting && !PositionSelectByTicket(ticket)))) || (type > 1 && !OrderSelect(ticket)))
     {
      err = GetLastError();
      myAlert("error", "PositionSelect / OrderSelect failed; error #"+IntegerToString(err));
      return(-1);
     }
//ignore open positions other than "type"
   if(type <= 1 && PositionGetInteger(POSITION_TYPE) != type)
      return(0);
//prepare to modify order
   double currentSL = (type <= 1) ? PositionGetDouble(POSITION_SL) : OrderGetDouble(ORDER_SL);
   double currentTP = (type <= 1) ? PositionGetDouble(POSITION_TP) : OrderGetDouble(ORDER_TP);
   if(NormalizeDouble(SL, Digits()) == 0)
      SL = currentSL; //not to modify
   if(NormalizeDouble(TP, Digits()) == 0)
      TP = currentTP; //not to modify
   if(NormalizeDouble(SL - currentSL, Digits()) == 0
      && NormalizeDouble(TP - currentTP, Digits()) == 0)
      return(0); //nothing to do
   MqlTradeRequest request;
   ZeroMemory(request);
   request.action = (type <= 1) ? TRADE_ACTION_SLTP : TRADE_ACTION_MODIFY;
   if(type > 1)
      request.order = ticket;
   else
      request.position = PositionGetInteger(POSITION_TICKET);
   request.symbol = Symbol();
   request.price = (type <= 1) ? PositionGetDouble(POSITION_PRICE_OPEN) : OrderGetDouble(ORDER_PRICE_OPEN);
   request.sl = NormalizeDouble(SL, Digits());
   request.tp = NormalizeDouble(TP, Digits());
   request.deviation = MaxSlippage_;
   MqlTradeResult result;
   ZeroMemory(result);
   while(!OrderSuccess(result.retcode) && retries < OrderRetry+1)
     {
      if(!OrderSend(request, result) || !OrderSuccess(result.retcode))
        {
         err = GetLastError();
         myAlert("print", "OrderModify error #"+IntegerToString(err));
         Sleep(OrderWait*1000);
        }
      retries++;
     }
   if(!OrderSuccess(result.retcode))
     {
      myAlert("error", "OrderModify failed "+IntegerToString(OrderRetry+1)+" times; error #"+IntegerToString(err));
      return(-1);
     }
   string alertstr = "Order modify: ticket="+IntegerToString(ticket);
   if(NormalizeDouble(SL, Digits()) != 0)
      alertstr = alertstr+" SL="+DoubleToString(SL);
   if(NormalizeDouble(TP, Digits()) != 0)
      alertstr = alertstr+" TP="+DoubleToString(TP);
   myAlert("modify", alertstr);
   return(0);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int myOrderModifyRel(ENUM_ORDER_TYPE type, ulong ticket, double SL, double TP) //works for positions and orders, modify SL and TP (relative to open price), zero targets do not modify, ticket is irrelevant for open positions
  {
   if(!TerminalInfoInteger(TERMINAL_TRADE_ALLOWED) || !MQLInfoInteger(MQL_TRADE_ALLOWED))
      return(-1);
   bool netting = AccountInfoInteger(ACCOUNT_MARGIN_MODE) != ACCOUNT_MARGIN_MODE_RETAIL_HEDGING;
   int retries = 0;
   int err = 0;
   SL = NormalizeDouble(SL, Digits());
   TP = NormalizeDouble(TP, Digits());
   if(SL < 0)
      SL = 0;
   if(TP < 0)
      TP = 0;
//prepare to select order
   Sleep(10);
   if((type <= 1 && ((netting && !PositionSelect(Symbol())) || (!netting && !PositionSelectByTicket(ticket)))) || (type > 1 && !OrderSelect(ticket)))
     {
      err = GetLastError();
      myAlert("error", "PositionSelect / OrderSelect failed; error #"+IntegerToString(err));
      return(-1);
     }
//ignore open positions other than "type"
   if(type <= 1 && PositionGetInteger(POSITION_TYPE) != type)
      return(0);
//prepare to modify order, convert relative to absolute
   double openprice = (type <= 1) ? PositionGetDouble(POSITION_PRICE_OPEN) : OrderGetDouble(ORDER_PRICE_OPEN);
   if(((type <= 1) ? PositionGetInteger(POSITION_TYPE) : OrderGetInteger(ORDER_TYPE)) % 2 == 0) //buy
     {
      if(NormalizeDouble(SL, Digits()) != 0)
         SL = openprice - SL;
      if(NormalizeDouble(TP, Digits()) != 0)
         TP = openprice + TP;
     }
   else //sell
     {
      if(NormalizeDouble(SL, Digits()) != 0)
         SL = openprice + SL;
      if(NormalizeDouble(TP, Digits()) != 0)
         TP = openprice - TP;
     }
   double currentSL = (type <= 1) ? PositionGetDouble(POSITION_SL) : OrderGetDouble(ORDER_SL);
   double currentTP = (type <= 1) ? PositionGetDouble(POSITION_TP) : OrderGetDouble(ORDER_TP);
   if(NormalizeDouble(SL, Digits()) == 0)
      SL = currentSL; //not to modify
   if(NormalizeDouble(TP, Digits()) == 0)
      TP = currentTP; //not to modify
   if(NormalizeDouble(SL - currentSL, Digits()) == 0
      && NormalizeDouble(TP - currentTP, Digits()) == 0)
      return(0); //nothing to do
   MqlTradeRequest request;
   ZeroMemory(request);
   request.action = (type <= 1) ? TRADE_ACTION_SLTP : TRADE_ACTION_MODIFY;
   if(type > 1)
      request.order = ticket;
   else
      request.position = PositionGetInteger(POSITION_TICKET);
   request.symbol = Symbol();
   request.price = (type <= 1) ? PositionGetDouble(POSITION_PRICE_OPEN) : OrderGetDouble(ORDER_PRICE_OPEN);
   request.sl = NormalizeDouble(SL, Digits());
   request.tp = NormalizeDouble(TP, Digits());
   request.deviation = MaxSlippage_;
   MqlTradeResult result;
   ZeroMemory(result);
   while(!OrderSuccess(result.retcode) && retries < OrderRetry+1)
     {
      if(!OrderSend(request, result) || !OrderSuccess(result.retcode))
        {
         err = GetLastError();
         myAlert("print", "OrderModify error #"+IntegerToString(err));
         Sleep(OrderWait*1000);
        }
      retries++;
     }
   if(!OrderSuccess(result.retcode))
     {
      myAlert("error", "OrderModify failed "+IntegerToString(OrderRetry+1)+" times; error #"+IntegerToString(err));
      return(-1);
     }
   string alertstr = "Order modify: ticket="+IntegerToString(ticket);
   if(NormalizeDouble(SL, Digits()) != 0)
      alertstr = alertstr+" SL="+DoubleToString(SL);
   if(NormalizeDouble(TP, Digits()) != 0)
      alertstr = alertstr+" TP="+DoubleToString(TP);
   myAlert("modify", alertstr);
   return(0);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TrailingStopTrail(ENUM_ORDER_TYPE type, double TS, double step, bool aboveBE, double aboveBEval) //set Stop Loss to "TS" if price is going your way with "step"
  {
   TS = NormalizeDouble(TS, Digits());
   step = NormalizeDouble(step, Digits());
   int total = PositionsTotal();
   for(int i = total-1; i >= 0; i--)
     {
      if(PositionGetTicket(i) <= 0)
         continue;
      if(PositionGetInteger(POSITION_MAGIC) != MagicNumber || PositionGetString(POSITION_SYMBOL) != Symbol() || PositionGetInteger(POSITION_TYPE) != type)
         continue;
      MqlTick last_tick;
      SymbolInfoTick(Symbol(), last_tick);
      double SL = PositionGetDouble(POSITION_SL);
      double openprice = PositionGetDouble(POSITION_PRICE_OPEN);
      ulong ticket = PositionGetInteger(POSITION_TICKET);
      if(type == ORDER_TYPE_BUY && (!aboveBE || last_tick.bid > openprice + TS + aboveBEval) && (NormalizeDouble(SL, Digits()) <= 0 || last_tick.bid > SL + TS + step))
         myOrderModify(ORDER_TYPE_BUY, ticket, last_tick.bid - TS, 0);
      else
         if(type == ORDER_TYPE_SELL && (!aboveBE || last_tick.ask < openprice - TS - aboveBEval) && (NormalizeDouble(SL, Digits()) <= 0 || last_tick.ask < SL - TS - step))
            myOrderModify(ORDER_TYPE_SELL, ticket, last_tick.ask + TS, 0);
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool OrderSuccess(uint retcode)
  {
   return(retcode == TRADE_RETCODE_PLACED || retcode == TRADE_RETCODE_DONE
          || retcode == TRADE_RETCODE_DONE_PARTIAL || retcode == TRADE_RETCODE_NO_CHANGES);
  }

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   TimeStart=TimeCurrent();
   IniciarControl();
   Si_GananciaMaxima=false;
   Si_PerdidaMaxima=false;
   InicioTime=0;

   if(!ComprobarHorario(Hour_Start,TOD_From_Hour,TOD_From_Min))
   return INIT_PARAMETERS_INCORRECT;
   
   if(!ComprobarHorario(Hour_End,TOD_To_Hour,TOD_To_Min))
   return INIT_PARAMETERS_INCORRECT;

   MaxSlippage_ = MaxSlippage;
//initialize myPoint
   myPoint = Point();
   if(Digits() == 5 || Digits() == 3)
     {
      myPoint *= 10;
      MaxSlippage_ *= 10;
     }
//initialize LotDigits
   double LotStep = SymbolInfoDouble(Symbol(), SYMBOL_VOLUME_STEP);
   if(NormalizeDouble(LotStep, 3) == round(LotStep))
      LotDigits = 0;
   else
      if(NormalizeDouble(10*LotStep, 3) == round(10*LotStep))
         LotDigits = 1;
      else
         if(NormalizeDouble(100*LotStep, 3) == round(100*LotStep))
            LotDigits = 2;
         else
            LotDigits = 3;
   int i;
//initialize crossed
   for(i = 0; i < ArraySize(crossed); i++)
      crossed[i] = true;
   OBV_handle = iOBV(NULL, PERIOD_CURRENT, VOLUME_TICK);
   if(OBV_handle < 0)
     {
      Print("The creation of iOBV has failed: OBV_handle=", INVALID_HANDLE);
      Print("Runtime error = ", GetLastError());
      return(INIT_FAILED);
     }

   MA_handle = iMA(NULL, PERIOD_CURRENT, 50, 0, MODE_EMA, OBV_handle);
   if(MA_handle < 0)
     {
      Print("The creation of iMA has failed: MA_handle=", INVALID_HANDLE);
      Print("Runtime error = ", GetLastError());
      return(INIT_FAILED);
     }

   Bands_handle = iBands(NULL, PERIOD_CURRENT, 20, 0, 2, PRICE_CLOSE);
   if(Bands_handle < 0)
     {
      Print("The creation of iBands has failed: Bands_handle=", INVALID_HANDLE);
      Print("Runtime error = ", GetLastError());
      return(INIT_FAILED);
     }

   EventSetMillisecondTimer(1);

   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EventKillTimer();

   if(reason==1 || reason==4 || reason==6 || reason==7 || reason==8)
     {
      ObjectsDeleteAll(0,"BOTON 2021",-1,OBJ_BUTTON);
      ObjectsDeleteAll(0,"EDIT 2021",-1,OBJ_EDIT);
      ObjectsDeleteAll(0,"LINEAS STOP LIMIT",0,OBJ_HLINE);
     }

  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   if(MQLInfoInteger(MQL_TESTER))
      OnTimer();

   ulong ticket = 0;
   double price;
   double SL;
   double TP;

   if(CopyBuffer(OBV_handle, 0, 0, 200, OBV) <= 0)
      return;
   ArraySetAsSeries(OBV, true);
   if(CopyBuffer(MA_handle, 0, 0, 200, MA) <= 0)
      return;
   ArraySetAsSeries(MA, true);
   if(CopyClose(Symbol(), PERIOD_CURRENT, 0, 200, Close) <= 0)
      return;
   ArraySetAsSeries(Close, true);
   if(CopyBuffer(Bands_handle, BASE_LINE, 0, 200, Bands_Main) <= 0)
      return;
   ArraySetAsSeries(Bands_Main, true);
   TrailingStopTrail(ORDER_TYPE_BUY, trailing_stop * myPoint, pips_trailing * myPoint, true, 10 * myPoint); //Trailing Stop = trail
   TrailingStopTrail(ORDER_TYPE_SELL, trailing_stop * myPoint, pips_trailing * myPoint, true, 10 * myPoint); //Trailing Stop = trail

   if(!Control_Lost_Earnings())
     {
      //Open Buy Order, instant signal is tested first
      if(Cross(0, OBV[1] > MA[1]) //On Balance Volume crosses above Moving Average
         && Close[1] > Bands_Main[1] //Candlestick Close > Bollinger Bands
        )
        {
         MqlTick last_tick;
         SymbolInfoTick(Symbol(), last_tick);
         price = last_tick.ask;
         SL = Stop * myPoint; //Stop Loss = value in points (relative to price)
         TP = target * myPoint; //Take Profit = value in points (relative to price)
         if(!inTimeInterval(TimeCurrent(), TOD_From_Hour, TOD_From_Min, TOD_To_Hour, TOD_To_Min))
            return; //open trades only at specific times of the day
         if(!TradeDayOfWeek())
            return; //open trades only on specific days of the week
         if(TerminalInfoInteger(TERMINAL_TRADE_ALLOWED) && MQLInfoInteger(MQL_TRADE_ALLOWED))
           {
            ticket = myOrderSend(ORDER_TYPE_BUY, price, Volume(price,true), "");
            if(ticket == 0)
               return;
           }
         else //not autotrading => only send alert
            myAlert("order", "");
         myOrderModifyRel(ORDER_TYPE_BUY, ticket, SL, 0);
         myOrderModifyRel(ORDER_TYPE_BUY, ticket, 0, TP);
        }

      //Open Sell Order, instant signal is tested first
      if(Cross(1, OBV[1] < MA[1]) //On Balance Volume crosses below Moving Average
         && Close[1] > Bands_Main[1] //Candlestick Close > Bollinger Bands
        )
        {
         MqlTick last_tick;
         SymbolInfoTick(Symbol(), last_tick);
         price = last_tick.bid;
         SL = Stop * myPoint; //Stop Loss = value in points (relative to price)
         TP = target * myPoint; //Take Profit = value in points (relative to price)
         if(!inTimeInterval(TimeCurrent(), TOD_From_Hour, TOD_From_Min, TOD_To_Hour, TOD_To_Min))
            return; //open trades only at specific times of the day
         if(!TradeDayOfWeek())
            return; //open trades only on specific days of the week
         if(TerminalInfoInteger(TERMINAL_TRADE_ALLOWED) && MQLInfoInteger(MQL_TRADE_ALLOWED))
           {
            ticket = myOrderSend(ORDER_TYPE_SELL, price, Volume(price,false), "");
            if(ticket == 0)
               return;
           }
         else //not autotrading => only send alert
            myAlert("order", "");
         myOrderModifyRel(ORDER_TYPE_SELL, ticket, SL, 0);
         myOrderModifyRel(ORDER_TYPE_SELL, ticket, 0, TP);
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Control_Lost_Earnings()
  {
   datetime TiempoDay=iTime(Symbol(),PERIOD_D1,0);
   static datetime TiempoCambio=TiempoDay;
   bool CambioTiempo=false;

   if(TiempoCambio!=TiempoDay)
     {
      TiempoCambio=TiempoDay;
      CambioTiempo=true;
     }

   if(CambioTiempo && (Si_GananciaMaxima==true || Si_PerdidaMaxima==true))
     {
      Si_GananciaMaxima=false;
      Si_PerdidaMaxima=false;
      TimeStart=TiempoDay;
     }

   if(Si_GananciaMaxima==true || Si_PerdidaMaxima==true)
      return true;


   double ProfitTotal=0;
//--- request trade history
   HistorySelect(TimeStart,TimeCurrent());
//--- create objects
   int     total=HistoryDealsTotal();
   ulong    ticket=0;
//--- for all deals

   int IDs[];

   ArrayResize(IDs,0);

   if(Operation_Count==ONLY_BOT)
      for(int i=total-1; i>=0; i--)
        {
         //--- try to get deals ticket
         if((ticket=HistoryDealGetTicket(i))>0)
           {
            int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
            int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
            int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
            string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);

            if(Simbolo!=Symbol())
               continue;

            if(MagicNumber==Magic)
               if(entry==DEAL_ENTRY_IN)
                 {
                  int Size=ArraySize(IDs);
                  ArrayResize(IDs,Size+1);
                  IDs[Size]=ID;
                 }
            //}
           }
        }

   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         // int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         double Profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);

         if(Simbolo!=Symbol())
            continue;

         if(Operation_Count==ONLY_BOT)
           {
            for(int j=0; j<ArraySize(IDs); j++)
              {
               if(IDs[j]==ID)
                 {
                  if(entry==DEAL_ENTRY_OUT)
                    {
                     Profit=Profit+(Count_Comission?Comision:0)+(Count_Swap?Swap:0);
                     ProfitTotal=Profit+ProfitTotal;
                     break;
                    }
                 }
              }
           }
         else
           {
            if(entry==DEAL_ENTRY_OUT)
              {
               Profit=Profit+(Count_Comission?Comision:0)+(Count_Swap?Swap:0);
               ProfitTotal=Profit+ProfitTotal;
              }
           }
        }
     }

   ulong Tickets[];

   ArrayResize(Tickets,0);

   int TotalPosiciones=PositionsTotal();
   for(int i=0; i<TotalPosiciones; i++)
     {
      ulong Ticket=PositionGetTicket(i);
      double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
      double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

      if((PositionGetInteger(POSITION_MAGIC)!=MagicNumber && Operation_Count==ONLY_BOT) || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      double Swap=PositionGetDouble(POSITION_SWAP);

      int Size=ArraySize(Tickets);

      ArrayResize(Tickets,Size+1);

      Tickets[Size]=Ticket;

      if(Ticket!=0)
        {
         double Profit=PositionGetDouble(POSITION_PROFIT)+(Count_Swap?Swap:0);
         ProfitTotal=ProfitTotal+Profit;
        }
     }

   ulong TicketsOrder[];

   ArrayResize(TicketsOrder,0);

   int TotalOrdenes=OrdersTotal();

   for(int i=0; i<TotalOrdenes; i++)
     {
      ulong TicketO=OrderGetTicket(i);

      if(OrderGetString(ORDER_SYMBOL)!=Symbol())
         continue;

      if((OrderGetInteger(ORDER_MAGIC)==MagicNumber && Operation_Count==ONLY_BOT))
        {
         int Size=ArraySize(TicketsOrder);

         ArrayResize(TicketsOrder,Size+1);

         TicketsOrder[Size]=OrderGetInteger(ORDER_TICKET);
        }
      else
         if(Operation_Count!=ONLY_BOT)
           {
            int Size=ArraySize(TicketsOrder);

            ArrayResize(TicketsOrder,Size+1);

            TicketsOrder[Size]=OrderGetInteger(ORDER_TICKET);
           }
     }


   ObjectSetString(0,EDIT_PROFIT_ACTUAL,OBJPROP_TEXT,DoubleToString(ProfitTotal,2));
   ChartRedraw();


   if(ProfitTotal>(MathAbs(Maximum_Profit)))
     {
      int Size=ArraySize(Tickets);

      for(int i=0; i<Size; i++)
        {
         if(PositionSelectByTicket(Tickets[i]))
            trade.PositionClose(Tickets[i],-1);
        }

      Size=ArraySize(TicketsOrder);

      for(int i=0; i<Size; i++)
        {
         if(OrderSelect(TicketsOrder[i]))
            trade.OrderDelete(TicketsOrder[i]);
        }
      InicioTime=TimeCurrent()+10;
      Si_GananciaMaxima=true;
      return true;
     }
   if(ProfitTotal<(MathAbs(Maximum_Loss)*-1))
     {
      int Size=ArraySize(Tickets);

      for(int i=0; i<Size; i++)
        {
         if(PositionSelectByTicket(Tickets[i]))
            trade.PositionClose(Tickets[i],-1);
        }

      Size=ArraySize(TicketsOrder);

      for(int i=0; i<Size; i++)
        {
         if(OrderSelect(TicketsOrder[i]))
            trade.OrderDelete(TicketsOrder[i]);
        }
      InicioTime=TimeCurrent()+10;
      Si_PerdidaMaxima=true;
      return true;
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Creacion_CONTROL(int Desplazamiento,int Desplace,int DesplazamientoY,int Derecha,int Size)
  {
   int j=0;

   for(int i=0; i<8; i++)
     {
      j=Derecha==0?i:MathAbs(7-i);

      if(j==0)
        {
         if(ObjectFind(0,BOTON_REINICIO)!=0)
            ButtonCreate(0,BOTON_REINICIO,0,Desplazamiento+(Desplace*(SizeTexto*8+2)),DesplazamientoY,SizeTexto*8+2,Size,CORNER_BOTON,"REINICIO","Arial",SizeTexto,clrWhite,clrRed,clrWhite,false,false,false,true,0);

         Desplazamiento=Desplazamiento+SizeTexto*8+2;
        }

      if(j==1)
        {
         if(ObjectFind(0,EDIT_TIME_START)!=0)
            EditCreate(0,EDIT_TIME_START,0,Desplazamiento+(Desplace*(SizeTexto*15+6)),DesplazamientoY,SizeTexto*15+6,Size,TimeToString(TimeStart,TIME_DATE|TIME_MINUTES|TIME_SECONDS),"Arial",SizeTexto,ALIGN_CENTER,true,CORNER_BOTON,clrBlack,clrLightSlateGray,clrRed,false,false,true,0);
         else
            TimeStart=StringToTime(ObjectGetString(0,EDIT_TIME_START,OBJPROP_TEXT,0));

         Desplazamiento=Desplazamiento+SizeTexto*15+6;
        }

      if(j==2)
        {
         if(ObjectFind(0,PROFIT_ACTUAL)!=0)
            ButtonCreate(0,PROFIT_ACTUAL,0,Desplazamiento+(Desplace*(SizeTexto*30+2)),DesplazamientoY,SizeTexto*30+2,Size,CORNER_BOTON,"PERDIDAS Y GANANCIAS ACTUALES: ","Arial",SizeTexto,clrBlack,clrOrange,clrRed,false,false,false,true,0);

         Desplazamiento=Desplazamiento+SizeTexto*30+2;
        }
      if(j==3)
        {

         if(ObjectFind(0,EDIT_PROFIT_ACTUAL)!=0)
            EditCreate(0,EDIT_PROFIT_ACTUAL,0,Desplazamiento+(Desplace*(SizeTexto*6+6)),DesplazamientoY,SizeTexto*6+6,Size,IntegerToString(0),"Arial",SizeTexto,ALIGN_CENTER,true,CORNER_BOTON,clrBlack,clrWhite,clrRed,false,false,true,0);

         Desplazamiento=Desplazamiento+SizeTexto*6+6;
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ButtonCreate(const long              chart_ID=0,               // chart's ID
                  const string            name="Button",            // button name
                  const int               sub_window=0,             // subwindow index
                  const int               x=0,                      // X coordinate
                  const int               y=0,                      // Y coordinate
                  const int               width=50,                 // button width
                  const int               height=18,                // button height
                  const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                  const string            text="Button",            // text
                  const string            font="Arial",             // font
                  const int               font_size=10,             // font size
                  const color             clr=clrBlack,             // text color
                  const color             back_clr=C'236,233,216',  // background color
                  const color             border_clr=clrNONE,       // border color
                  const bool              state=false,              // pressed/released
                  const bool              back=false,               // in the background
                  const bool              selection=false,          // highlight to move
                  const bool              hidden=true,              // hidden in the object list
                  const long              z_order=0)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create the button
   if(!ObjectCreate(chart_ID,name,OBJ_BUTTON,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": failed to create the button! Error code = ,Error ",(GetLastError()));
      return(false);
     }
//--- set button coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set button size
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- set the chart's corner, relative to which point coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set the text
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- set text font
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- set font size
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- set text color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set background color
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- set border color
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- set button state
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
//--- enable (true) or disable (false) the mode of moving the button by mouse
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- hide (true) or display (false) graphical object name in the object list
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- set the priority for receiving the event of a mouse click in the chart
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- successful execution
   return(true);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EditCreate(const long             chart_ID=0,               // chart's ID
                const string           name="Edit",              // object name
                const int              sub_window=0,             // subwindow index
                const int              x=0,                      // X coordinate
                const int              y=0,                      // Y coordinate
                const int              width=50,                 // width
                const int              height=18,                // height
                const string           text="Text",              // text
                const string           font="Arial",             // font
                const int              font_size=10,             // font size
                const ENUM_ALIGN_MODE  align=ALIGN_CENTER,       // alignment type
                const bool             read_only=false,          // ability to edit
                const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                const color            clr=clrBlack,             // text color
                const color            back_clr=clrWhite,        // background color
                const color            border_clr=clrNONE,       // border color
                const bool             back=false,               // in the background
                const bool             selection=false,          // highlight to move
                const bool             hidden=true,              // hidden in the object list
                const long             z_order=0)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create edit field
   if(!ObjectCreate(chart_ID,name,OBJ_EDIT,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": failed to create \"Edit\" object! Error code = Error", (GetLastError()));
      return(false);
     }
//--- set object coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set object size
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- set the text
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- set text font
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- set font size
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- set the type of text alignment in the object
   ObjectSetInteger(chart_ID,name,OBJPROP_ALIGN,align);
//--- enable (true) or cancel (false) read-only mode
   ObjectSetInteger(chart_ID,name,OBJPROP_READONLY,read_only);
//--- set the chart's corner, relative to which object coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set text color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set background color
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- set border color
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of moving the label by mouse
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- hide (true) or display (false) graphical object name in the object list
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- set the priority for receiving the event of a mouse click in the chart
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- successful execution
   return(true);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IniciarControl()
  {
   int Desplace=0;
   int Abajo=0;
   int Derecha=0;
   ENUM_ANCHOR_POINT ANCHOR=ANCHOR_LEFT_LOWER;
   if(CORNER_BOTON==CORNER_LEFT_UPPER)
     {
      ANCHOR=ANCHOR_LEFT_UPPER;
     }
   if(CORNER_BOTON==CORNER_LEFT_LOWER)
     {
      ANCHOR=ANCHOR_LEFT_LOWER;
      Abajo=1;
     }
   if(CORNER_BOTON==CORNER_RIGHT_UPPER)
     {
      Derecha=1;
      ANCHOR=ANCHOR_RIGHT_UPPER;
      Desplace=1;
     } //Desplace1 y Desplace tamaño de Ancho de Cada Boton
   if(CORNER_BOTON==CORNER_RIGHT_LOWER)
     {
      Derecha=1;
      ANCHOR=ANCHOR_RIGHT_UPPER;
      Desplace=1;
      Abajo=1;
     } //Desplace1 y Desplace tamaño de Ancho de Cada Boton


   int Size=int(SizeTexto*3/1.5);
   int Desplazamiento=Boton_Desplazamiento_X+Desplace;

   int DesplazamientoY=Abajo==1?(Boton_Desplazamiento_Y+int(SizeTexto*3/1.5)+Espacio):Boton_Desplazamiento_Y;


   Creacion_CONTROL(Desplazamiento,Desplace,DesplazamientoY,Derecha,Size);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   if(ObjectFind(0,BOTON_REINICIO)==0)
     {
      if(Si_GananciaMaxima==true || Si_PerdidaMaxima==true)
         ObjectSetInteger(0,BOTON_REINICIO,OBJPROP_BGCOLOR,clrRed);
      else
         ObjectSetInteger(0,BOTON_REINICIO,OBJPROP_BGCOLOR,clrDarkSlateGray);

      if(ObjectGetInteger(0,BOTON_REINICIO,OBJPROP_STATE,0))
        {
         if(Si_GananciaMaxima==true || Si_PerdidaMaxima==true)
           {
            ObjectSetString(0,EDIT_PROFIT_ACTUAL,OBJPROP_TEXT,DoubleToString(0,2));
            Si_GananciaMaxima=false;
            Si_PerdidaMaxima=false;
            TimeStart=TimeCurrent()+1;
           }

         ObjectSetInteger(0,BOTON_REINICIO,OBJPROP_STATE,false);
         ChartRedraw();
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ComprobarHorario(string Cadena,int &Hour,int &Minute)
  {

   if(StringLen(Cadena)!=5)
     {
      Alert("El horario ",Cadena," No tiene la longitud correspondiente (5)");
      return false;
     }

   for(int i=0; i<StringLen(Cadena); i++)
     {
      ushort Char=StringGetCharacter(Cadena,i);

      if(i!=2)
        {
         if('0'>Char || Char>'9')
           {
            Alert("Caracter ",i," de ",Cadena," no es un numero");
            return false;
           }
        }
      else
        {
         if(Char!=':')
           {
            Alert("Caracter ",i," de ",Cadena," no es ':' ");
            return false;
           }
        }
     }
   Hour=(int)StringToInteger(StringSubstr(Cadena,0,2));
   Minute=(int)StringToInteger(StringSubstr(Cadena,3,-1));

   if(Hour>23)
     {
      Alert("ERROR Hora de ",Cadena," es mayor a 23");
      return false;
     }
   if(Minute>59)
     {
      Alert("ERROR Minuto de ",Cadena," es mayor a 59");
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
