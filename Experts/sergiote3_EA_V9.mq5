//+------------------------------------------------------------------+
//|                                                  Sergiot3_EA.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//|                                 mailto: mt5autotrading@gmail.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#include <Trade\Trade.mqh>
#include <Trade\PositionInfo.mqh>
#include <Trade\OrderInfo.mqh>
COrderInfo        order;
CPositionInfo     po;
CTrade            trd;
enum ORDER_MODE
  {
   ORDER_STOP   =0,      //  Order Stop
   MARKET_ORDER =1,      //  Mercado (nueva vela)
  };
enum ENUME_TRADES
  {
   ONE   =1,     //  1
   TWO   =2,     //  2
   THREE =3      //  3
  };
enum SL_MODE
  {
   TICK       =0,      //  Ticks
   PORCENTAGE =1,      //  Porcentage Fibo
  };
enum TP_MODE
  {
   TICK       =0,      //  Ticks
   PORCENTAGE =1,      //  Porcentage Fibo
  };
//--- ENUM MINUTOS
enum ENUM_MIN
  {
   m0,    // 00
   m5,    // 05
   m10,   // 10
   m15,   // 15
   m20,   // 20
   m25,   // 25
   m30,   // 30
   m35,   // 35
   m40,   // 40
   m45,   // 45
   m50,   // 50
   m55,   // 55
  };
//--- ENUM HORAS
enum ENUM_HOUR
  {
   h0,    // 00
   h1,    // 01
   h2,    // 02
   h3,    // 03
   h4,    // 04
   h5,    // 05
   h6,    // 06
   h7,    // 07
   h8,    // 08
   h9,    // 09
   h10,   // 10
   h11,   // 11
   h12,   // 12
   h13,   // 13
   h14,   // 14
   h15,   // 15
   h16,   // 16
   h17,   // 17
   h18,   // 18
   h19,   // 19
   h20,   // 20
   h21,   // 21
   h22,   // 22
   h23,   // 23
  };
//+------------------------------------------------------------------+
//| Inputs                                                           |
//+------------------------------------------------------------------+
sinput group "----- Parámetros de Operaciones"
input double       in_Lots            = 1;      // Volumen
input ORDER_MODE   in_OrderMode       = 0;      // Tipo de la order
input ENUME_TRADES in_Mode            = 1;      // Velas
input double       in_TamanhoMax      = 130;    // Tamaño Máximo (Ticks)
input double       in_TamanhoMin      = 40;     // Tamaño Mínimo (Ticks)
input double       in_ticksaddMargen  = 2;      // Margen (ticks)
input TP_MODE      in_tpMode          = 0;      // Modo Take Profit
input double       in_TP              = 121;    // Valor Take Profit (0=off)
input SL_MODE      in_slMode          = 0;      // Modo Stop Loss
input double       in_SL              = 61;     // Valor Stop Loss (0=off)
input bool         in_BCond           = true;   // Borrar la Orden anterior nuevo signal
input bool         in_UseTrailingStop = false;  // Usar Trailing
input double       in_TrailingStop    = 15;     // Trailing Stop (Ticks)
input double       in_TrailingStep    = 5;      // Trailing Step (Ticks)
input ulong        in_Slippage        = 30;     // Slippage
input ulong        in_MagicN          = 908070; // Magic Number
sinput   group    "------ Horarios"
input ENUM_HOUR    in_HourStart       = h0;     // Hora de inicio
input ENUM_MIN     in_MinStart        = m0;     // Minuto de Inicio
input ENUM_HOUR    in_HourEnd         = h19;    // Hora de finalización
input ENUM_MIN     in_MinEnd          = m0;     // Minuto de finalización
input string S3="--------------------------Settings_Button--------------------------";//-----------------------------
input color ColorTiempo=clrWhite;
input bool Boton_Start_in=false;
input int DesplazarTextoDerecha=30;
input ENUM_BASE_CORNER CORNER_BOTON=CORNER_LEFT_UPPER;
input int Boton_Desplazamiento_X=40;
input int Boton_Desplazamiento_Y=40;
//+------------------------------------------------------------------+
//| Global Variables                                                 |
//+------------------------------------------------------------------+
bool stop_trading;
datetime t_i0, t_f0, time_init;
double tick_size;
datetime time_buy=0,time_sell=0;
int bull_candle = 0, bear_candle = 0;
double sell_high = 0;
double sell_low = 0;
double buy_low = 0;
double buy_high = 0;
double ExtMinTa = 0.0;
double ExtMaxTa = 0.0;
double ExtTickAdd = 0.0;
double ExtTP = 0.0;
double ExtSL = 0.0;
datetime timeTradeSell;
int sell_shift=-1;
datetime timeTradeBuy;
int buy_shift=-1;
bool Operar=false;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---


      if(Boton_Start_in)
      Operar=true;
   else
      Operar=false;

   int Desplace1=0,Desplace=0;
   ENUM_ANCHOR_POINT ANCHOR=ANCHOR_LEFT_LOWER;
   if(CORNER_BOTON==CORNER_LEFT_UPPER)
      ANCHOR=ANCHOR_LEFT_UPPER;
   if(CORNER_BOTON==CORNER_LEFT_LOWER)
      ANCHOR=ANCHOR_LEFT_UPPER;
   if(CORNER_BOTON==CORNER_RIGHT_UPPER)
     {
      ANCHOR=ANCHOR_RIGHT_UPPER;
      Desplace1=50;
      Desplace=30;
     } //Desplace1 y Desplace tamaño de Ancho de Cada Boton
   if(CORNER_BOTON==CORNER_RIGHT_LOWER)
     {
      ANCHOR=ANCHOR_RIGHT_UPPER;
      Desplace1=50;
      Desplace=30;
     } //Desplace1 y Desplace tamaño de Ancho de Cada Boton
   
   t_i0 = StringToTime(TimeHour(in_HourStart)+":"+TimeMin(in_MinStart));
   t_f0 = StringToTime(TimeHour(in_HourEnd)+":"+TimeMin(in_MinEnd));
   if(t_f0<=t_i0)
     {
      Print("Hora Final no puede ser menor que la Hora Inicial.");
      return(INIT_PARAMETERS_INCORRECT);
     }
   string err_text="";
   if(in_Lots>0.0)
      if(!CheckVolume(in_Lots, err_text))
        {
         Print(err_text);
         return(INIT_PARAMETERS_INCORRECT);
        }
//---
   trd.SetExpertMagicNumber(in_MagicN);
//---
   tick_size = SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_SIZE);
   ExtMinTa = in_TamanhoMin*tick_size;
   ExtMaxTa = in_TamanhoMax*tick_size;
   ExtTickAdd = in_ticksaddMargen*tick_size;
   ExtTP = in_TP*tick_size;
   ExtSL = in_SL*tick_size;
   time_init = TimeCurrent();
   
   
    if(ObjectFind(0,"BOTONWITCH")!=0)
     {
      ButtonCreate(0,"BOTONWITCH",0,Boton_Desplazamiento_X+Desplace,Boton_Desplazamiento_Y,30,20,CORNER_BOTON,"OFF","Arial",10,clrRed,C'236,233,216',clrYellow,false,false,false,true,0);
      ObjectSetInteger(0,"BOTONWITCH",OBJPROP_STATE,false);

      if(Boton_Start_in)
        {
         ObjectSetString(0,"BOTONWITCH",OBJPROP_TEXT,"ON");
         ObjectSetInteger(0,"BOTONWITCH",OBJPROP_COLOR,clrGreen);
         ObjectSetInteger(0,"BOTONWITCH",OBJPROP_STATE,true);
        }
     }
    
    
   if(ObjectFind(0,"LABEL_TIME")!=0)
      ButtonCreate(0,"LABEL_TIME",0,Boton_Desplazamiento_X+Desplace+30+5,Boton_Desplazamiento_Y,60,20,CORNER_BOTON,"Tiempo","Arial",10,ColorTiempo,C'236,233,216',clrYellow,false,false,false,true,0);
      
   EventSetMillisecondTimer(50);

   Comment(" ");
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   DeleteALL();
   ObjectDelete(0,"TrendBUY");
   ObjectDelete(0,"TrendSELL");
   
   
   if(ObjectFind(0,"BOTONWITCH")==0)
   ObjectDelete(0,"BOTONWITCH");

   if(ObjectFind(0,"PIVOT_BUY")==0)
      ObjectDelete(0,"PIVOT_BUY");
   if(ObjectFind(0,"PIVOT_SELL")==0)
      ObjectDelete(0,"PIVOT_SELL");
   if(ObjectFind(0,"LABEL_TIME")==0)
      ObjectDelete(0,"LABEL_TIME");
      
   EventKillTimer();
//---
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
   if(Operar)
     {
   if(IsNewBarDay())
      stop_trading=false;
   if(TimeCurrent()>=t_f0)
     {
     // ClosePositions();
      DeleteOrders();
      ObjectDelete(0,"TrendBUY");
      ObjectDelete(0,"TrendSELL");
      return;
     }
   MqlRates rates[];
   ArraySetAsSeries(rates,true);
   if(CopyRates(Symbol(), Period(), 0, 5, rates)<0)
     {
      Print("Error Copying Mql Rates data - error:", GetLastError());
      ResetLastError();
      return;
     }
   if(rates[0].time<t_i0)
      return;
   if(in_UseTrailingStop)
      Trailing();
   for(int i=PositionsTotal()-1; i>=0; i--) 
      if(po.SelectByIndex(i))
         if(po.Symbol()==Symbol() && po.Magic()==in_MagicN)
           {
            DeleteOrders();
            ObjectDelete(0, "MIN_H");
            ObjectDelete(0, "MAX_H");
           }
   bool buy_signal=false, sell_signal=false;
   int buy_shift_bar=-1;
   int sell_shift_bar=-1;
   buy_shift_bar = iBarShift(NULL,0,time_buy);
   sell_shift_bar = iBarShift(NULL,0,time_sell);
   if(rates[1].time<t_i0)
      return;
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
   if(IsNewBar())
     {
      if((rates[1].close>rates[1].open)||
         (rates[1].close==rates[1].open && rates[1].high<rates[2].high && bull_candle>0))
        {
         bull_candle++;
         bear_candle=0;
        }
      if((rates[1].close<rates[1].open)||
         (rates[1].close==rates[1].open && rates[1].low<rates[2].low && bear_candle>0))
        {
         bear_candle++;
         bull_candle=0;
        }
     }
   if(bull_candle==1 && bear_candle==0)
     {
      time_buy = rates[1].time;
      time_sell=0;
     }
   else
      if(bull_candle==0 && bear_candle==1)
        {
         time_sell = rates[1].time;
         time_buy=0;
        }
   if(bull_candle>0 && buy_shift_bar<=in_Mode && buy_shift_bar>0)
     {
      buy_low = Low_Bar_BUY(buy_shift_bar);
      buy_high = Highest_Bar_BUY(buy_shift_bar);
      if(rates[1].low<buy_low)
        {
         buy_low=rates[1].low;
         fibo_x1=1;
         buy_high=rates[1].high;
        }
      if((buy_high-buy_low)>=ExtMinTa && (buy_high-buy_low)*tick_size<=ExtMaxTa)
        {
         buy_signal = true;
         sell_signal = false;
         if(in_BCond)
           {
            DeleteOrders(ORDER_TYPE_SELL_STOP);
            ObjectDelete(0,"TrendSELL");
           }
        }
     }
   if(bear_candle>0 && sell_shift_bar<=in_Mode && sell_shift_bar>0)
     {
      sell_high = High_Bar_SELL(sell_shift_bar);
      sell_low = Lowest_Bar_SELL(sell_shift_bar);
      if(rates[1].high>sell_high)
        {
         sell_high=rates[1].high;
         fibo_x2 = 1;
         sell_low = rates[1].low;
        }
      if((sell_high-sell_low)>=ExtMinTa && (sell_high-sell_low)<=ExtMaxTa)
        {
         sell_signal = true;
         buy_signal = false;
         if(in_BCond)
           {
            DeleteOrders(ORDER_TYPE_BUY_STOP);
            ObjectDelete(0,"TrendBUY");
           }
        }
     }
   for(int i=OrdersTotal()-1; i>=0; i--)
      if(order.SelectByIndex(i))
         if(order.Symbol()==Symbol() && order.Magic()==in_MagicN)
           {
            if(order.OrderType()==ORDER_TYPE_BUY_STOP && buy_signal)
              {
               buy_shift = iBarShift(NULL,0,timeTradeBuy);
               if(buy_shift>=1)
                 {
                  ObjectDelete(0,"TrendBUY");
                  double xmax = rates[1].high+ExtTickAdd;
                  double bsl=0;
                  double btp=0;
                  if(in_slMode==0)
                     bsl = xmax-ExtSL;
                  else
                     bsl = getPriceLevel(buy_high,buy_low,in_SL,1);
                  if(in_tpMode==0)
                     btp = xmax+ExtTP;
                  else
                     btp = getPriceLevel(buy_high,buy_low,in_TP,1);
                  if(NormalizePrice(xmax)!=order.PriceOpen())
                     if(!trd.OrderModify(order.Ticket(),
                                         NormalizePrice(xmax),
                                         NormalizePrice(bsl),
                                         NormalizePrice(btp),
                                         ORDER_TIME_GTC,0,0))
                        Print("error ORDER_TYPE_BUY_STOP ");
                     else
                       {
                        TrendCreate(0,"TrendBUY",0,rates[fibo_x1].time,buy_low,rates[val_index_high].time,buy_high,clrBlue);
                        timeTradeBuy=rates[0].time;
                       }
                 }
              }
            if(order.OrderType()==ORDER_TYPE_SELL_STOP && sell_signal)
              {
               sell_shift=iBarShift(NULL,0,timeTradeSell);
               if(sell_shift>=1)
                 {
                  ObjectDelete(0,"TrendSELL");
                  double xmin = rates[1].low-ExtTickAdd;
                  double ssl=0;
                  double stp=0;
                  if(in_slMode==0)
                     ssl = xmin+ExtSL;
                  else
                     ssl = getPriceLevel(sell_high,sell_low,in_SL,2);
                  if(in_tpMode==0)
                     stp = xmin-ExtTP;
                  else
                     stp = getPriceLevel(sell_high,sell_low,in_TP,2);
                  if(NormalizePrice(xmin)!=order.PriceOpen())
                     if(!trd.OrderModify(order.Ticket(),
                                         NormalizePrice(xmin),
                                         NormalizePrice(ssl),
                                         NormalizePrice(stp),
                                         ORDER_TIME_GTC,0,0))
                        Print("error ORDER_TYPE_SELL_STOP ");
                     else
                       {
                        TrendCreate(0,"TrendSELL",0,rates[fibo_x2].time,sell_high,rates[val_index_low].time,sell_low,clrRed);
                        timeTradeSell=rates[0].time;
                       }
                 }
              }
           }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
   if(buy_signal && !ExistOrders(ORDER_TYPE_BUY_STOP) && !ExistPosition())
     {
      if(DayFilter() && ClosedBar())
        {
         ObjectDelete(0,"TrendBUY");
         double xmax = rates[1].high+ExtTickAdd;
         double bsl=0;
         double btp=0;
         if(in_OrderMode==0)
           {
            if(in_slMode==0)
               bsl = xmax-ExtSL;
            else
               bsl = getPriceLevel(buy_high,buy_low,in_SL,1);
            if(in_tpMode==0)
               btp = xmax+ExtTP;
            else
               btp = NormalizePrice(getPriceLevel(buy_high,buy_low,in_TP,1));
            if(MarketOrder(Symbol(),ORDER_TYPE_BUY_STOP,in_Lots,xmax,bsl,btp,in_MagicN,in_Slippage))
              {
               TrendCreate(0,"TrendBUY",0,rates[fibo_x1].time,buy_low,rates[val_index_high].time,buy_high,clrBlue);
               buy_signal=false;
               timeTradeBuy=rates[0].time;
               return;
              }
           }
         else
           {
            double Ask = SymbolInfoDouble(Symbol(),SYMBOL_ASK);
            if(in_slMode==0)
               bsl = Ask-ExtSL;
            else
               bsl = getPriceLevel(buy_high,buy_low,in_SL,1)-(xmax-Ask);
            if(in_tpMode==0)
               btp = Ask+ExtTP;
            else
               btp = (getPriceLevel(buy_high,buy_low,in_TP,1))-(xmax-Ask);
            if(MarketOrder(Symbol(),ORDER_TYPE_BUY,in_Lots,0,bsl,btp,in_MagicN,in_Slippage))
              {
               TrendCreate(0,"TrendBUY",0,rates[fibo_x1].time,buy_low,rates[val_index_high].time,buy_high,clrBlue);
               buy_signal=false;
               timeTradeBuy=rates[0].time;
               return;
              }
           }
        }
     }
   else
      if(sell_signal && !ExistOrders(ORDER_TYPE_SELL_STOP) && !ExistPosition())
        {
         if(DayFilter() && ClosedBar())
           {
            ObjectDelete(0,"TrendSELL");
            double xmin = rates[1].low-ExtTickAdd;
            double ssl=0;
            double stp=0;
            if(in_OrderMode==0)
              {
               if(in_slMode==0)
                  ssl = xmin+ExtSL;
               else
                  ssl = getPriceLevel(sell_high,sell_low,in_SL,2);
               if(in_tpMode==0)
                  stp = xmin-ExtTP;
               else
                  stp = getPriceLevel(sell_high,sell_low,in_TP,2);
               if(MarketOrder(Symbol(),ORDER_TYPE_SELL_STOP,in_Lots,xmin,ssl,stp,in_MagicN,in_Slippage))
                 {
                  TrendCreate(0,"TrendSELL",0,rates[fibo_x2].time,sell_high,rates[val_index_low].time,sell_low,clrRed);
                  sell_signal=false;
                  timeTradeSell=rates[0].time;
                  return;
                 }
              }
            else
              {
               double Bid = SymbolInfoDouble(Symbol(),SYMBOL_BID);
               if(in_slMode==0)
                  ssl = Bid+ExtSL;
               else
                  ssl = getPriceLevel(sell_high,sell_low,in_SL,2)+(Bid-xmin);
               if(in_tpMode==0)
                  stp = Bid-ExtTP;
               else
                  stp = getPriceLevel(sell_high,sell_low,in_TP,2)+(Bid-xmin);
               if(MarketOrder(Symbol(),ORDER_TYPE_SELL,in_Lots,0,ssl,stp,in_MagicN,in_Slippage))
                 {
                  TrendCreate(0,"TrendSELL",0,rates[fibo_x2].time,sell_high,rates[val_index_low].time,sell_low,clrRed);
                  sell_signal=false;
                  timeTradeSell=rates[0].time;
                  return;
                 }
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
//| Check if Exist Position                                          |
//+------------------------------------------------------------------+
bool ExistPosition()
  {
   for(int i=PositionsTotal()-1; i>=0; i--)
      if(po.SelectByIndex(i))
         if(po.Symbol()==Symbol() && po.Magic()==in_MagicN)
            return(true);
//---
   return(false);
  }
//+------------------------------------------------------------------+
//| New  Candle D1                                                   |
//+------------------------------------------------------------------+
bool IsNewBarDay()
  {
   static datetime BarTimeDay=0;
   datetime BarTimeCurrentDay=iTime(Symbol(), PERIOD_D1, 0);
   if(BarTimeDay!=BarTimeCurrentDay)
     {
      t_i0 = StringToTime(TimeHour(in_HourStart)+":"+TimeMin(in_MinStart));
      t_f0 = StringToTime(TimeHour(in_HourEnd)+":"+TimeMin(in_MinEnd));
      BarTimeDay=BarTimeCurrentDay;
      return (true);
     }
   return (false);
  }
//+------------------------------------------------------------------+
//| New Candle Current                                               |
//+------------------------------------------------------------------+
bool IsNewBar()
  {
   static datetime BarTimeDay=0;
   datetime BarTimeCurrentDay=iTime(Symbol(), Period(), 0);
   if(BarTimeCurrentDay<time_init)
      return(false);
   if(BarTimeDay!=BarTimeCurrentDay)
     {
      BarTimeDay=BarTimeCurrentDay;
      return (true);
     }
   return (false);
  }
//+------------------------------------------------------------------+
//| Closing Positions                                                |
//+------------------------------------------------------------------+
void ClosePositions()
  {
   for(int i=PositionsTotal()-1; i>=0; i--)
      if(po.SelectByIndex(i))
         if(po.Symbol()==Symbol() && po.Magic()==in_MagicN)
            trd.PositionClose(po.Ticket());
  }
//+------------------------------------------------------------------+
//| Deleting Pending Orders                                          |
//+------------------------------------------------------------------+
void DeleteOrders(int otype=-1)
  {
   for(int i=OrdersTotal()-1; i>=0; i--)
      if(order.SelectByIndex(i))
         if(order.Symbol()==Symbol() && order.Magic()==in_MagicN)
            if(order.OrderType()==otype||otype==-1)
               trd.OrderDelete(order.Ticket());
  }
//+------------------------------------------------------------------+
//| Time Filter Hours                                                |
//+------------------------------------------------------------------+
string TimeHour(int HR)
  {
   string time_hours= " ";
   switch(HR)
     {
      case h0:         time_hours="00";         break;
      case h1:         time_hours="01";         break;
      case h2:         time_hours="02";         break;
      case h3:         time_hours="03";         break;
      case h4:         time_hours="04";         break;
      case h5:         time_hours="05";         break;
      case h6:         time_hours="06";         break;
      case h7:         time_hours="07";         break;
      case h8:         time_hours="08";         break;
      case h9:         time_hours="09";         break;
      case h10:        time_hours="10";         break;
      case h11:        time_hours="11";         break;
      case h12:        time_hours="12";         break;
      case h13:        time_hours="13";         break;
      case h14:        time_hours="14";         break;
      case h15:        time_hours="15";         break;
      case h16:        time_hours="16";         break;
      case h17:        time_hours="17";         break;
      case h18:        time_hours="18";         break;
      case h19:        time_hours="19";         break;
      case h20:        time_hours="20";         break;
      case h21:        time_hours="21";         break;
      case h22:        time_hours="22";         break;
      case h23:        time_hours="23";         break;
     }
   return (time_hours);
  }
//+------------------------------------------------------------------+
//| Time filter Minutes                                              |
//+------------------------------------------------------------------+
string TimeMin(int MH)
  {
   string time_mins= " ";
   switch(MH)
     {
      case m0:         time_mins="00";         break;
      case m5:         time_mins="05";         break;
      case m10:        time_mins="10";         break;
      case m15:        time_mins="15";         break;
      case m20:        time_mins="20";         break;
      case m25:        time_mins="25";         break;
      case m30:        time_mins="30";         break;
      case m35:        time_mins="35";         break;
      case m40:        time_mins="40";         break;
      case m45:        time_mins="45";         break;
      case m50:        time_mins="50";         break;
      case m55:        time_mins="55";         break;
     }
   return (time_mins);
  }
//+------------------------------------------------------------------+
//| Time Filter Check                                                |
//+------------------------------------------------------------------+
bool DayFilter()
  {
   datetime t_curr = TimeCurrent();
   if(t_i0 < t_f0 && t_i0 <= t_curr && t_curr < t_f0)
      return(true);
   return(false);
  }
//+------------------------------------------------------------------+
//| Delete All                                                        |
//+------------------------------------------------------------------+
void DeleteALL()
  {
   int subwindows = (int)ChartGetInteger(0, CHART_WINDOWS_TOTAL);
   for(int i=subwindows; i>=0; i--)
     {
      int indicators=ChartIndicatorsTotal(0, i);
      for(int j=indicators-1; j>=0; j--)
        {
         ChartIndicatorDelete(0, i, ChartIndicatorName(0, i, j));
        }
     }
  }
//+------------------------------------------------------------------+
//| Market Orders or Pending Orders                                  |
//+------------------------------------------------------------------+
bool MarketOrder(const string sSymbol, const ENUM_ORDER_TYPE eType, const double fLot, const double prices, const double nSL = 0, const double nTP = 0, const ulong nMagic = 0, const ulong nSlippage = 1000)
  {
   bool bRetVal = false;
   MqlTradeRequest oRequest = {0};
   MqlTradeResult  oResult = {0};
   int nDigits = (int) SymbolInfoInteger(sSymbol, SYMBOL_DIGITS);
   if(prices == 0)
      oRequest.action = TRADE_ACTION_DEAL;
   else
      if(prices > 0)
         oRequest.action = TRADE_ACTION_PENDING;
   oRequest.symbol    = sSymbol;
   oRequest.volume    = fLot;
   oRequest.stoplimit = 0;
   oRequest.deviation = nSlippage;
   oRequest.comment   = "Magic: " +IntegerToString(in_MagicN);
   oRequest.sl        = NormalizePrice(nSL) * (in_SL > 0);
   oRequest.tp        = NormalizePrice(nTP) * (in_TP > 0);
   if(eType == ORDER_TYPE_SELL_STOP)
     {
      oRequest.type  = ORDER_TYPE_SELL_STOP;
      oRequest.price = NormalizePrice(prices);
     }
   else
      if(eType == ORDER_TYPE_BUY_STOP)
        {
         oRequest.type  = ORDER_TYPE_BUY_STOP;
         oRequest.price = NormalizePrice(prices);
        }
      else
         if(eType == ORDER_TYPE_BUY && prices == 0)
           {
            oRequest.type  = ORDER_TYPE_BUY;
            oRequest.price = NormalizeDouble(SymbolInfoDouble(sSymbol, SYMBOL_ASK), nDigits);
           }
         else
            if(eType == ORDER_TYPE_SELL && prices == 0)
              {
               oRequest.type  = ORDER_TYPE_SELL;
               oRequest.price = NormalizeDouble(SymbolInfoDouble(sSymbol, SYMBOL_BID), nDigits);
              }
   if((int) SymbolInfoInteger(sSymbol, SYMBOL_FILLING_MODE)==SYMBOL_FILLING_FOK)
      oRequest.type_filling = ORDER_FILLING_FOK;
   if((int) SymbolInfoInteger(sSymbol, SYMBOL_FILLING_MODE)==SYMBOL_FILLING_IOC)
      oRequest.type_filling = ORDER_FILLING_IOC;
   if((int) SymbolInfoInteger(sSymbol, SYMBOL_FILLING_MODE)==0)
      oRequest.type_filling = ORDER_FILLING_RETURN;
//--- check filling
   if((int) SymbolInfoInteger(sSymbol, SYMBOL_FILLING_MODE)>2)
     {
      if(!FillingCheck(sSymbol))
         return(false);
     }
   oRequest.magic = nMagic;
   MqlTradeCheckResult oCheckResult= {0};
   bool bCheck = OrderCheck(oRequest, oCheckResult);
   Print("Order Check MarketOrder:",
         " OrderCheck = ",    bCheck,
         ", retcode = ",      oCheckResult.retcode,
         ", comment = ",      oCheckResult.comment);
   if(bCheck == true && oCheckResult.retcode == 0)
     {
      bool bResult = false;
      for(int k = 0; k < 5; k++)
        {
         bResult = OrderSend(oRequest, oResult);
         if(bResult == true && (oResult.retcode == TRADE_RETCODE_PLACED || oResult.retcode == TRADE_RETCODE_DONE))
            break;
         if(k == 4)
            break;
         Sleep(100);
        }
      if(oResult.retcode == TRADE_RETCODE_DONE)
         bRetVal = true;
     }
   else
      if(oResult.retcode == TRADE_RETCODE_NO_MONEY)
        {
         Print("NO MONEY.");
         ExpertRemove();
        }
   return(bRetVal);
  }
//+------------------------------------------------------------------+
//| Checks and corrects type of filling policy                       |
//+------------------------------------------------------------------+
bool FillingCheck(const string symbol)
  {
   MqlTradeRequest   m_request= {0};        // request data
   MqlTradeResult    m_result= {0};         // result data
   ENUM_ORDER_TYPE_FILLING m_type_filling=0;
//--- get execution mode of orders by symbol
   ENUM_SYMBOL_TRADE_EXECUTION exec=(ENUM_SYMBOL_TRADE_EXECUTION)SymbolInfoInteger(symbol,SYMBOL_TRADE_EXEMODE);
//--- check execution mode
   if(exec==SYMBOL_TRADE_EXECUTION_REQUEST || exec==SYMBOL_TRADE_EXECUTION_INSTANT)
     {
      //--- neccessary filling type will be placed automatically
      return(true);
     }
//--- get possible filling policy types by symbol
   uint filling=(uint)SymbolInfoInteger(symbol,SYMBOL_FILLING_MODE);
//--- check execution mode again
   if(exec==SYMBOL_TRADE_EXECUTION_MARKET)
     {
      //--- for the MARKET execution mode
      //--- analyze order
      if(m_request.action!=TRADE_ACTION_PENDING)
        {
         //--- in case of instant execution order
         //--- if the required filling policy is supported, add it to the request
         if(m_type_filling==ORDER_FILLING_FOK && (filling & SYMBOL_FILLING_FOK)!=0)
           {
            m_request.type_filling=m_type_filling;
            return(true);
           }
         if(m_type_filling==ORDER_FILLING_IOC && (filling & SYMBOL_FILLING_IOC)!=0)
           {
            m_request.type_filling=m_type_filling;
            return(true);
           }
         //--- wrong filling policy, set error code
         m_result.retcode=TRADE_RETCODE_INVALID_FILL;
         return(false);
        }
      return(true);
     }
//--- EXCHANGE execution mode
   switch(m_type_filling)
     {
      case ORDER_FILLING_FOK:
         //--- analyze order
         if(m_request.action==TRADE_ACTION_PENDING)
           {
            //--- in case of pending order
            //--- add the expiration mode to the request
            if(!ExpirationCheck(symbol))
               m_request.type_time=ORDER_TIME_DAY;
            //--- stop order?
            if(m_request.type==ORDER_TYPE_BUY_STOP || m_request.type==ORDER_TYPE_SELL_STOP)
              {
               //--- in case of stop order
               //--- add the corresponding filling policy to the request
               m_request.type_filling=ORDER_FILLING_RETURN;
               return(true);
              }
           }
         //--- in case of limit order or instant execution order
         //--- if the required filling policy is supported, add it to the request
         if((filling & SYMBOL_FILLING_FOK)!=0)
           {
            m_request.type_filling=m_type_filling;
            return(true);
           }
         //--- wrong filling policy, set error code
         m_result.retcode=TRADE_RETCODE_INVALID_FILL;
         return(false);
      case ORDER_FILLING_IOC:
         //--- analyze order
         if(m_request.action==TRADE_ACTION_PENDING)
           {
            //--- in case of pending order
            //--- add the expiration mode to the request
            if(!ExpirationCheck(symbol))
               m_request.type_time=ORDER_TIME_DAY;
            //--- stop order?
            if(m_request.type==ORDER_TYPE_BUY_STOP || m_request.type==ORDER_TYPE_SELL_STOP)
              {
               //--- in case of stop order
               //--- add the corresponding filling policy to the request
               m_request.type_filling=ORDER_FILLING_RETURN;
               return(true);
              }
           }
         //--- in case of limit order or instant execution order
         //--- if the required filling policy is supported, add it to the request
         if((filling & SYMBOL_FILLING_IOC)!=0)
           {
            m_request.type_filling=m_type_filling;
            return(true);
           }
         //--- wrong filling policy, set error code
         m_result.retcode=TRADE_RETCODE_INVALID_FILL;
         return(false);
      case ORDER_FILLING_RETURN:
         //--- add filling policy to the request
         m_request.type_filling=m_type_filling;
         return(true);
     }
//--- unknown execution mode, set error code
   m_result.retcode=TRADE_RETCODE_ERROR;
   return(false);
  }
//+------------------------------------------------------------------+
//| Check expiration type of pending order                           |
//+------------------------------------------------------------------+
#include <Trade/SymbolInfo.mqh>
bool ExpirationCheck(const string symbol)
  {
   CSymbolInfo sym;
   MqlTradeRequest   m_request= {0};        // request data
   MqlTradeResult    m_result= {0};         // result data
//--- check symbol
   if(!sym.Name((symbol==NULL)?Symbol():symbol))
      return(false);
//--- get flags
   int flags=sym.TradeTimeFlags();
//--- check type
   switch(m_request.type_time)
     {
      case ORDER_TIME_GTC:
         if((flags&SYMBOL_EXPIRATION_GTC)!=0)
            return(true);
         break;
      case ORDER_TIME_DAY:
         if((flags&SYMBOL_EXPIRATION_DAY)!=0)
            return(true);
         break;
      case ORDER_TIME_SPECIFIED:
         if((flags&SYMBOL_EXPIRATION_SPECIFIED)!=0)
            return(true);
         break;
      case ORDER_TIME_SPECIFIED_DAY:
         if((flags&SYMBOL_EXPIRATION_SPECIFIED_DAY)!=0)
            return(true);
         break;
      default:
         Print(__FUNCTION__+": Unknown expiration type");
         break;
     }
//--- failed
   return(false);
  }
//+------------------------------------------------------------------+
//| Checking if Exist Order Especified                               |
//+------------------------------------------------------------------+
bool ExistOrders(int otype = -1)
  {
   for(int i=OrdersTotal()-1; i>=0; i--)
      if(order.SelectByIndex(i))
         if(order.Symbol()==Symbol() && order.Magic()==in_MagicN)
            if(order.OrderType()==otype||otype==-1)
               return(true);
//---
   return(false);
  }
//+------------------------------------------------------------------+
//| Low Period                                                       |
//+------------------------------------------------------------------+
int fibo_x1;
double Low_Bar_BUY(const int shift_low)
  {
   fibo_x1 = shift_low;
   return(iLow(Symbol(),Period(),shift_low));
  }
//+------------------------------------------------------------------+
//| Highest Period                                                   |
//+------------------------------------------------------------------+
int val_index_high;
double Highest_Bar_BUY(const int shift_high)
  {
   double h=0;
   val_index_high=iHighest(Symbol(), Period(), MODE_HIGH,shift_high,1);
   if(val_index_high!=-1)
      h = iHigh(Symbol(),Period(),val_index_high);
   return(h);
  }
//+------------------------------------------------------------------+
//| High Period                                                      |
//+------------------------------------------------------------------+
int fibo_x2;
double High_Bar_SELL(const int high_shift)
  {
   fibo_x2 = high_shift;
   return(iHigh(Symbol(),Period(),high_shift));
  }
//+------------------------------------------------------------------+
//| Lowest Period                                                    |
//+------------------------------------------------------------------+
int val_index_low;
double Lowest_Bar_SELL(const int shift_low)
  {
   double l=0;
   val_index_low=iLowest(Symbol(), Period(), MODE_LOW,shift_low,1);
   if(val_index_low!=-1)
      l = iLow(Symbol(),Period(),val_index_low);
   return(l);
  }
//+------------------------------------------------------------------+
//| Trailing Function                                                |
//+------------------------------------------------------------------+
void Trailing()
  {
   if(in_TrailingStop==0)
      return;
   for(int i=PositionsTotal()-1; i>=0; i--)
      if(po.SelectByIndex(i))
         if(po.Symbol()==Symbol() && po.Magic()==in_MagicN)
           {
            if(po.PositionType()==POSITION_TYPE_BUY)
              {
               if((po.PriceCurrent()-po.PriceOpen())>(in_TrailingStop*tick_size+in_TrailingStep*tick_size))
                  if(po.StopLoss()<po.PriceCurrent()-(in_TrailingStop*tick_size+in_TrailingStep*tick_size))
                    {
                     if(!trd.PositionModify(po.Ticket(),
                                            NormalizePrice(po.PriceCurrent()-in_TrailingStop*tick_size),
                                            po.TakeProfit()))
                        Print("Modify BUY ",po.Ticket(),
                              " Position -> false. Result Retcode: ",trd.ResultRetcode(),
                              ", description of result: ",trd.ResultRetcodeDescription());
                    }
              }
            else
              {
               if((po.PriceOpen()-po.PriceCurrent())>(in_TrailingStop*tick_size+in_TrailingStep*tick_size))
                  if((po.StopLoss()>(po.PriceCurrent()+(in_TrailingStop*tick_size+in_TrailingStep*tick_size))) ||
                     (po.StopLoss()==0))
                    {
                     if(!trd.PositionModify(po.Ticket(),
                                            NormalizePrice(po.PriceCurrent()+in_TrailingStop*tick_size),
                                            po.TakeProfit()))
                        Print("Modify SELL ",po.Ticket(),
                              " Position -> false. Result Retcode: ",trd.ResultRetcode(),
                              ", description of result: ",trd.ResultRetcodeDescription());
                    }
              }
           }
  }
//+------------------------------------------------------------------+
//| Getting Price Level                                              |
//+------------------------------------------------------------------+
double getPriceLevel(double high, double low, double fibonacciLevel, int etype)
  {
   fibonacciLevel = fibonacciLevel/100;
   double D=high-low;
   double V=D*fibonacciLevel;
   double priceLevel=(etype==1)?V+low:(high-V);
   return(NormalizeDouble(priceLevel,Digits()));
  }
//+------------------------------------------------------------------+
//| Trend Create                                                     |
//+------------------------------------------------------------------+
bool TrendCreate(const long            chart_ID=0,
                 const string          name="TrendLine",
                 const int             sub_window=0,
                 datetime              time1=0,
                 double                price1=0,
                 datetime              time2=0,
                 double                price2=0,
                 const color           clr=clrRed,
                 const ENUM_LINE_STYLE style=STYLE_SOLID,
                 const int             width=1,
                 const bool            back=false,
                 const bool            selection=true,
                 const bool            ray_left=false,
                 const bool            ray_right=false,
                 const bool            hidden=true,
                 const long            z_order=0)
  {
   ResetLastError();
   if(!ObjectCreate(chart_ID,name,OBJ_TREND,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": Fail creating trending! Error Code = ",GetLastError());
      return(false);
     }
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_LEFT,ray_left);
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right);
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
   return(true);
  }
//+------------------------------------------------------------------+
//| checking if Exist a Deal in Bar Current                          |
//+------------------------------------------------------------------+
bool ClosedBar()
  {
   datetime time=0;
   bool no_trade_in_bar = true;
   HistorySelect(iTime(NULL,0,0),TimeCurrent());
   for(int x = HistoryDealsTotal()-1; x>=0; x--)
     {
      ulong ticket = HistoryDealGetTicket(x);
      if(HistoryDealGetString(ticket,DEAL_SYMBOL) ==Symbol() &&
         HistoryDealGetInteger(ticket,DEAL_MAGIC) == in_MagicN)
        {
         if(HistoryDealGetInteger(ticket,DEAL_ENTRY) == DEAL_ENTRY_IN
            ||HistoryDealGetInteger(ticket,DEAL_ENTRY) == DEAL_ENTRY_OUT)
            time = (datetime)HistoryDealGetInteger(ticket,DEAL_TIME);
        }
      if(iTime(NULL,0,0) <= time)
         no_trade_in_bar = false;
     }
   return(no_trade_in_bar);
  }
//+------------------------------------------------------------------+
//| Normalize price                                                  |
//+------------------------------------------------------------------+
double NormalizePrice(const double price)
  {
   int idigits = (int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS);
   if(tick_size!=0)
      return(NormalizeDouble(MathRound(price/tick_size)*tick_size,idigits));
//---
   return(NormalizeDouble(price,idigits));
  }
//+------------------------------------------------------------------+
//| Volumen Correcto                                                   |
//+------------------------------------------------------------------+
bool CheckVolume(double volume, string &err_desc)
  {
   double min_volume  = SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
   double max_volume  = SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);
   double volume_step = SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
   if(volume<min_volume)
     {
      err_desc=StringFormat("El volumen es menor que el mínimo permitido: %.2f", min_volume);
      return(false);
     }
   if(volume>max_volume)
     {
      err_desc=StringFormat("El volumen es mayor que el máximo permitido: %.2f", max_volume);
      return(false);
     }
   int ratio=(int)MathRound(volume/volume_step);
   if(MathAbs(ratio*volume_step-volume)>0.0000001)
     {
      err_desc=StringFormat("El volumen no es múltiplo del volumen mínimo: %.2f, El volumen más cercano es: %.2f",
                            volume_step, ratio*volume_step);
      return(false);
     }
   err_desc="Correct volume value";
   return(true);
  }

void OnTimer()
  {

   bool STATEACTUAL=ObjectGetInteger(0,"BOTONWITCH",OBJPROP_STATE,0);
   static bool STATEANTERIOR=Boton_Start_in?true:false;

   if(STATEACTUAL==true && STATEANTERIOR==false)
     {
      Operar=true;
      ChartRedraw();
      ObjectSetString(0,"BOTONWITCH",OBJPROP_TEXT,"ON");
      ObjectSetInteger(0,"BOTONWITCH",OBJPROP_COLOR,clrGreen);
      STATEANTERIOR=true;
      Sleep(50);
     }
   else
      if(STATEACTUAL==false && STATEANTERIOR==true)
        {
         Operar=false;
         ChartRedraw();
         ObjectSetString(0,"BOTONWITCH",OBJPROP_TEXT,"OFF");
         ObjectSetInteger(0,"BOTONWITCH",OBJPROP_COLOR,clrRed);
         STATEANTERIOR=false;
         Sleep(50);
        }
    if(ObjectFind(0,"LABEL_TIME")==0)
    ObjectSetString(0,"LABEL_TIME",OBJPROP_TEXT,TimeToString(TimeCurrent(),TIME_MINUTES|TIME_SECONDS));
  }
  

bool LabelCreate(const long              chart_ID=0,               // ID del gráfico 
                 const string            name="Label",             // nombre de la etiqueta 
                 const int               sub_window=0,             // número de subventana 
                 const int               x=0,                      // coordenada por el eje X 
                 const int               y=0,                      // coordenada por el eje Y 
                 const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace 
                 const string            text="Label",             // texto 
                 const string            font="Arial",             // fuente 
                 const int               font_size=10,             // tamaño de la fuente 
                 const color             clr=clrRed,               // color 
                 const double            angle=0.0,                // inclinación del texto 
                 const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // modo de anclaje 
                 const bool              back=false,               // al fondo 
                 const bool              selection=false,          // seleccionar para mover 
                 const bool              hidden=true,              // ocultar en la lista de objetos 
                 const long              z_order=0)                //prioridad para el clic del ratón 
  { 
//--- anulamos el valor del error 
   ResetLastError(); 
//--- creamos la etiqueta de texto 
   if(!ObjectCreate(chart_ID,name,OBJ_LABEL,sub_window,0,0)) 
     { 
      Print(__FUNCTION__, 
            ": ¡Fallo al crear la etiqueta de texto! Código del error = ",GetLastError()); 
      return(false); 
     } 
//--- establecemos las coordenadas de la etiqueta 
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y); 
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del punto 
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner); 
//--- ponemos el texto 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text); 
//--- establecemos la fuente del texto 
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font); 
//--- establecemos el tamaño del texto 
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size); 
//--- establecemos el ángulo de inclinación del texto 
   ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle); 
//--- establecemos el modo de anclaje 
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor); 
//--- establecemos el color 
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr); 
//--- mostramos en el primer plano (false) o al fondo (true) 
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back); 
//--- activar (true) o desactivar (false) el modo de desplazamiento de la etiqueta con ratón 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection); 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection); 
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos 
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden); 
//--- establecemos la prioridad para obtener el evento de cliquear sobre el gráfico 
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order); 
//--- ejecución con éxito 
   return(true); 
  } 
  

bool ButtonCreate(const long              chart_ID=0,               // ID del gráfico
                  const string            name="Button",            // nombre del botón
                  const int               sub_window=0,             // número de subventana
                  const int               x=0,                      // coordenada por el eje X
                  const int               y=0,                      // coordenada por el eje Y
                  const int               width=50,                 // ancho del botón
                  const int               height=18,                // alto del botón
                  const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace
                  const string            text="Button",            // texto
                  const string            font="Arial",             // fuente
                  const int               font_size=10,             // tamaño de la fuente
                  const color             clr=clrBlack,             // color del texto
                  const color             back_clr=C'236,233,216',  // color del fondo
                  const color             border_clr=clrNONE,       // color del borde
                  const bool              state=false,              // pulsado/no pulsado
                  const bool              back=false,               // al fondo
                  const bool              selection=false,          // seleccionar para mover
                  const bool              hidden=true,              // ocultar en la lista de objetos
                  const long              z_order=0)                //prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos el botón
   if(!ObjectCreate(chart_ID,name,OBJ_BUTTON,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear el botón! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos las coordenadas del botón
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- establecemos el tamaño del botón
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del punto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- ponemos el texto
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- establecemos la fuente del texto
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- establecemos el tamaño del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- establecemos el color del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el color del fondo
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- establecemos el color del borde
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- set button state
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
//--- activar (true) o desactivar (false) el modo de desplazamiento del botón con ratón
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- establecemos la prioridad para obtener el evento de cliquear sobre el gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- ejecución con éxito
   return(true);
  }