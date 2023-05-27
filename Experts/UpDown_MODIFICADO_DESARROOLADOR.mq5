//+------------------------------------------------------------------+
//|                                                       UpDown.mq5 |
//|                                 Copyright 2021, Manuel Rodríguez |
//|                                             http://www.telmx.com |
//+------------------------------------------------------------------+

#property copyright "Copyright 2021, Manuel Rodríguez"
#property link      "http://www.telmx.com"
#property version   "1.00"

#property strict

#include <Trade\PositionInfo.mqh>
#include <Trade\Trade.mqh>
#include <Trade\SymbolInfo.mqh>
#include <Trade\AccountInfo.mqh>
#include <Trade\OrderInfo.mqh>

CPositionInfo  m_position;                   // trade position object
CTrade         m_trade;                      // trading object
CSymbolInfo    m_symbol;                     // symbol info object
CAccountInfo   m_account;                    // account info wrapper
COrderInfo     m_order;                      // pending orders object


enum Modo
  {
   Mode_Multiplier,
   Mode_Balance
  };
//#include <MT4Orders.mqh>


datetime UNTIL=D'2022.04.07 00:00';

#define EA_NAME MQLInfoString(MQL_PROGRAM_NAME);

enum flag {on,off};

input Modo     Mode_Volume_=Mode_Balance;
input int BalanceMultiplicador=5;
string   Font              = "Reckoner Bold";
input string   EA_Comment        = "USDMXN"; // EA comment
input ulong    Magic             = 77777;    // Magic
input flag     Suspend           = off;      // Suspend trades
input double   Breakeven         = 0;        // Average price last year
input bool     OpenOnNewCandle   = 1;        // Open on new candle
bool     IncludeManualTrades = 0;           // Include manual trades

input string   up                = "";      // UP SETTINGS
input flag     UpTrading         = on;      // Up
input double   UpLots            = 0.01;    // Lots
input double   UpMultiplier      = 0;       // Multiplier (if Mode_Volume_=Mode Multiplier)
input double   UpStartPrice      = 0;       // Start price
input double   UpGrid            = 500;     // Grid distance
input double   UpTPdistance      = 0;       // Take profit in points
input double   UpTPmoney         = 5;       // Profit in money


input string   down              = "";      // DOWN SETTINGS
input flag     DnTrading         = on;      // Down
input double   DnLots            = 0.01;    // Lots
input double   DnMultiplier      = 0;       // Multiplier (if Mode_Volume_=Mode Multiplier)
input double   DnStartPrice      = 0;       // Start price
input double   DnGrid            = 500;     // Grid distance
input double   DnTPdistance      = 0;       // Take profit in points
input double   DnTPmoney         = 5;       // Profit in money


input string disp        = "";              // DISPLAY
input bool   Show_disp   = true;            // Show display
input color  Title_Color = clrGold;         // Title color
input color  Text_Color  = clrTurquoise;    // Text color


//-------------------------------------------------------------------

string   ID = EA_Comment;

string   Orders_Settings      = "===== Orders_Settings =====";
int      MaxOrders            = 9999;             // MaxOrders  (0 = disabled)
int      Slippage             = 3;                // Slippage

string            Visual_Settings   = "===== Visual_Settings =====";
ENUM_BASE_CORNER  InfoCorner        = CORNER_RIGHT_LOWER;
color             BullColor         = clrDodgerBlue;     // BullColor
color             BearColor         = clrTomato;         // BearColor
color             InfoColor         = clrYellow;         // InfoColor



datetime bartime  = 0;

double Ask, Bid;

int operation = -1;
int signal = -1;

bool armed = 0;


double refbuy, refsell, refzero;
double BuyLots=0, SellLots=0, BuyProfit=0, SellProfit=0, NetProfit=0, BuyCount=0, SellCount=0, AllCount=0, BuyLevel=0, SellLevel=0, BELevel=0;

int lastcountHistoryTotal = 0;

double real_today = 0, real_yesterday = 0, real_month = 0, real_all = 0;
double dd = 0, maxeq = 0, maxdd = 0, maxfloat = 0, minfloat = 0;

bool uptrig = 0, dntrig = 0;
bool testing = 0;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

//RefreshRates();
//m_symbol.Refresh();

   m_trade.SetExpertMagicNumber(Magic);
   m_symbol.Name(_Symbol);
//---
   EraseAll(ID);

   testing = MQLInfoInteger(MQL_TESTER);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   EraseAll(ID);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {

   if(UNTIL<TimeCurrent())
      ExpertRemove();

//---
   Ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
   Bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);

   GetStats();

   if(Show_disp)
      Display();

   HistorySelect(0,TimeCurrent());
   if(HistoryDealsTotal() != lastcountHistoryTotal)
     {
      if(!IncludeManualTrades)
         ReadHistory();
      //if (IncludeManualTrades)         ReadOldHistory();

      /*
      SetTLabel(0, "real_today", 0, InfoCorner, 5, 40, "Today: " + DoubleToString(real_today,2), TriColor(real_today > 0, clrGreen, real_today < 0, clrRed, InfoColor));
      SetTLabel(0, "real_yesterday", 0, InfoCorner, 5, 55, "Yesterday: " + DoubleToString(real_yesterday,2), TriColor(real_yesterday > 0, clrGreen, real_yesterday < 0, clrRed, InfoColor));
      if (!MQLInfoInteger(MQL_TESTER))
         SetTLabel(0, "real_month", 0, InfoCorner, 5, 70, "Month: " + DoubleToString(real_month,2), TriColor(real_month > 0, clrGreen, real_month < 0, clrRed, InfoColor));
      if (MQLInfoInteger(MQL_TESTER))
         SetTLabel(0, "real_all", 0, InfoCorner, 5, 70, "History: " + DoubleToString(real_all,2), TriColor(real_all > 0, clrGreen, real_all < 0, clrRed, InfoColor));
      */
      lastcountHistoryTotal = HistoryDealsTotal();
     }


   if(BuyCount < 1)
      dntrig = 0;                                   // reset trigger for BUY side
   if(!dntrig)
      if(Ask <= DnStartPrice || Count(POSITION_TYPE_BUY) > 0)
         dntrig = 1;

   if(SellCount < 1)
      uptrig = 0;                                  // reset trigger for SELL side
   if(!uptrig)
      if(Bid >= UpStartPrice || Count(POSITION_TYPE_SELL) > 0)
         uptrig = 1;


   if(bartime != iTime(_Symbol, 0, 0))
     {
      if(OpenOnNewCandle)
         GetMeIn();
      bartime = iTime(_Symbol, 0, 0);
     }

   if(!OpenOnNewCandle)
      GetMeIn();

   if(BuyCount + SellCount > 0)
      CheckTP();


   if(testing)
      CheckDD();

  }

//+------------------------------------------------------------------+
//--------------------------------------------------------------------
//--------------------------------------------------------------------


//-------------
void Display()
  {
   DisplayText(ID+"EAName",5,25,Title_Color,16,EA_Comment);
   DisplayText(ID+"OpenOrders",5,70,Text_Color,11,"Open orders: " + DoubleToString(BuyCount+SellCount,0) + " ( " + DoubleToString(BuyProfit+SellProfit,2) + " " + AccountInfoString(ACCOUNT_CURRENCY) + " )");
   DisplayText(ID+"buyorders",30,95,Text_Color,11,"Buy : " + DoubleToString(BuyCount,0));
   DisplayText(ID+"sellsorders",30,120,Text_Color,11,"Sell : " + DoubleToString(SellCount,0));
   DisplayText(ID+"TLots",30,145,Text_Color,11,"Lots : " + DoubleToString(BuyLots+SellLots,2));
   DisplayText(ID+"ProfitToday",5,180,Text_Color,11,"Profit today : " + DoubleToString(real_today,2) + " " + AccountInfoString(ACCOUNT_CURRENCY));
   DisplayText(ID+"ProfitYester",5,205,Text_Color,11,"Profit yesterday : " + DoubleToString(real_yesterday,2) + " " + AccountInfoString(ACCOUNT_CURRENCY));

   if(!testing)
      DisplayText(ID+"ProfitMonth",5,230,Text_Color,11,"Monthly profit : " + DoubleToString(real_month,2) + " " + AccountInfoString(ACCOUNT_CURRENCY));
   if(testing)
     {
      DisplayText(ID+"ProfitMonth",5,230,Text_Color,11,"Monthly profit : " + DoubleToString(real_all,2) + " " + AccountInfoString(ACCOUNT_CURRENCY));
      DisplayText(ID+"DDn",5,255,Text_Color,11,"Max. Drawdown : " + DoubleToString(minfloat,2)+ " " + AccountInfoString(ACCOUNT_CURRENCY));
     }
  }


//---------------------------------------------------------------------------------------------
void DisplayText(string name,long XDist, long YDist,color TextColor,long Font_size,string Text)
  {
   name = name + " " + EA_NAME;

   if(ObjectFind(ChartID(),name) == -1)
     {
      ObjectCreate(ChartID(),name,OBJ_LABEL,0,0,0,0);
      ObjectSetInteger(ChartID(),name,OBJPROP_XDISTANCE,XDist);
      ObjectSetInteger(ChartID(),name,OBJPROP_YDISTANCE,YDist);
      ObjectSetInteger(ChartID(),name,OBJPROP_COLOR,TextColor);
      ObjectSetInteger(ChartID(),name,OBJPROP_FONTSIZE,Font_size);
      //ObjectSetString(ChartID(),name,OBJPROP_FONT,Font);
      //ObjectSetInteger(ChartID(),name,OBJPROP_ZORDER,1000);
     }

   ObjectSetString(ChartID(),name,OBJPROP_TEXT,Text);
  }

/*
//--------------------
void ReadOldHistory()
   {
   double tprofit = 0, swap = 0, commission = 0;
   datetime closetime;
   int prn = 0;

   real_today = 0; real_yesterday = 0; real_month = 0; real_all = 0;

   for(int i=OrdersHistoryTotal()-1; i>=0  && !IsStopped(); i--)
      {
      if (!OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
         {
         Print("OrderSelect( ", i, ", SELECT_BY_POS, MODE_HISTORY ) - Error #", GetLastError());
         continue;
         }

      if (OrderSymbol() != Symbol())   continue;
      if (OrderMagicNumber() != Magic) continue;

      double orderProfit = OrderProfit() + OrderSwap() + OrderCommission();
      closetime = OrderCloseTime();

      tprofit += orderProfit;

      if (closetime >= iTime(Symbol(), PERIOD_D1, 0) && closetime < iTime(Symbol(), PERIOD_D1, 0) + 1440 * 60)
         real_today += orderProfit;

      if (closetime >= iTime(Symbol(), PERIOD_D1, 1) && closetime < iTime(Symbol(), PERIOD_D1, 1) + 1440 * 60)
         real_yesterday += orderProfit;

      if (closetime >= iTime(Symbol(), PERIOD_MN1, 0) && closetime < iTime(Symbol(), PERIOD_MN1, 0) + 43200 * 60)
         real_month += orderProfit;

      real_all += orderProfit;

      }

   }
*/

//-----------------
void ReadHistory()
  {
   double tprofit = 0, swap = 0, commission = 0;
   datetime closetime;
   int prn = 0;

   real_today = 0;
   real_yesterday = 0;
   real_month = 0;
   real_all = 0;

   HistorySelect(0,TimeCurrent());
   int orders = HistoryDealsTotal();
   for(int i = orders-1 ; i >= 0; i--)
     {
      ulong ticket = HistoryDealGetTicket(i);
      if(ticket == 0)
         break;

      if(HistoryDealGetString(ticket,DEAL_SYMBOL) == _Symbol)
         if(HistoryDealGetInteger(ticket,DEAL_ENTRY) == DEAL_ENTRY_OUT)
            if(HistoryDealGetInteger(ticket,DEAL_MAGIC) == Magic)
              {
               /*
               if (prn < 5)
                  {
                  if (prn == 0)
                     Print (">==================================== last 5 exit deals ==============================================<");

                  Print(   "| Order " + HistoryDealGetInteger(ticket,DEAL_ORDER)
                        + " | Magic " + HistoryDealGetInteger(ticket,DEAL_MAGIC)
                        + " | Entry " + HistoryDealGetInteger(ticket,DEAL_ENTRY)
                        + " | Reason " + HistoryDealGetInteger(ticket,DEAL_REASON)
                        + " | POS_ID " + HistoryDealGetInteger(ticket,DEAL_POSITION_ID)
                        );
                  }
               prn++;
               */
               closetime = (datetime)HistoryDealGetInteger(ticket,DEAL_TIME);
               tprofit = HistoryDealGetDouble(ticket,DEAL_PROFIT);
               swap = HistoryDealGetDouble(ticket,DEAL_SWAP);
               commission = HistoryDealGetDouble(ticket,DEAL_COMMISSION);

               if(closetime >= iTime(Symbol(), PERIOD_D1, 0) && closetime < iTime(Symbol(), PERIOD_D1, 0) + 1440 * 60)
                  real_today += tprofit + swap + commission;

               if(closetime >= iTime(Symbol(), PERIOD_D1, 1) && closetime < iTime(Symbol(), PERIOD_D1, 1) + 1440 * 60)
                  real_yesterday += tprofit + swap + commission;

               if(closetime >= iTime(Symbol(), PERIOD_MN1, 0) && closetime < iTime(Symbol(), PERIOD_MN1, 0) + 43200 * 60)
                  real_month += tprofit + swap + commission;

               real_all += tprofit + swap + commission;
              }
     }
  }


//-------------
void CheckDD()
  {
   double eq = AccountInfoDouble(ACCOUNT_EQUITY);
   if(eq > maxeq)
      maxeq = eq;
   double floating = BuyProfit + SellProfit;
   if(floating > maxfloat)
      maxfloat = floating;
   if(floating < minfloat)
      minfloat = floating;
   double ddnow = floating * 100 / maxeq;
   if(ddnow < maxdd)
      maxdd = ddnow;

//SetTLabel(0, "dd", 0, InfoCorner, 5, 90, "DD now: " + DoubleToString(ddnow,2) + " % (max: " + DoubleToString(maxdd,2) + ")", InfoColor);
//SetTLabel(0, "floating", 0, InfoCorner, 5, 105, "float: " + DoubleToString(floating,2) + " $ (" + DoubleToString(minfloat,2) + " / " + DoubleToString(maxfloat,2) + ")", InfoColor);
  }



//--------------
void CheckTP()
  {

   double tpb = 0, tps = 0;
   double tpbd = 0, tpsd = 0;
   bool mod = false;

   for(int i = PositionsTotal() - 1; i >= 0; i--)
      if(m_position.SelectByIndex(i) && m_position.Symbol() == _Symbol && m_position.Magic() == Magic)
        {
         if(BuyCount > 0)
           {
            if(DnTPmoney > 0 && BuyProfit >= DnTPmoney)
              {
               Close(POSITION_TYPE_BUY);
               return;
              }

            if(m_position.PositionType() == POSITION_TYPE_BUY)
              {
               if(DnTPdistance > 0)
                  if(MathAbs(m_position.PriceOpen()+DnTPdistance * _Point - m_position.TakeProfit()) > _Point)
                     mod = m_trade.PositionModify(m_position.Ticket(),m_position.StopLoss(),m_position.PriceOpen()+DnTPdistance * _Point);
               if(DnTPdistance == 0)
                  if(m_position.TakeProfit() != 0)
                     mod = m_trade.PositionModify(m_position.Ticket(),m_position.StopLoss(),0);
              }
           }

         if(SellCount > 0)
           {
            if(UpTPmoney > 0 && SellProfit >= UpTPmoney)
              {
               Close(POSITION_TYPE_SELL);
               return;
              }

            if(m_position.PositionType() == POSITION_TYPE_SELL)
              {
               if(UpTPdistance > 0)
                  if(MathAbs(m_position.PriceOpen()-UpTPdistance * _Point - m_position.TakeProfit()) > _Point)
                     mod = m_trade.PositionModify(m_position.Ticket(),m_position.StopLoss(),m_position.PriceOpen()-UpTPdistance * _Point);
               if(UpTPdistance == 0)
                  if(m_position.TakeProfit() != 0)
                     mod = m_trade.PositionModify(m_position.Ticket(),m_position.StopLoss(),0);
              }
           }

        }
  }

//-------------
void GetMeIn()
  {
   if(MaxOrders > 0 && CountAll() >= MaxOrders)
      return;
   if(Suspend == on)
      return;

   if(DnTrading == on)
      if(DnStartPrice == 0 || (Ask <= DnStartPrice && dntrig))
         if(Breakeven == 0 || Ask <= Breakeven)
            if(Ask <= BotBuy() || BuyCount == 0)
               if(!Congested(DnGrid * _Point, Ask, POSITION_TYPE_BUY))
                  if(m_trade.Buy(GetLot(POSITION_TYPE_BUY)))
                     Print("New BUY order");
//return;

   if(UpTrading == on)
      if(UpStartPrice == 0 || (Bid >= UpStartPrice && uptrig))
         if(Breakeven == 0 || Bid >= Breakeven)
            if(Bid >= TopSell() || SellCount == 0)
               if(!Congested(UpGrid * _Point, Bid, POSITION_TYPE_SELL))
                  if(m_trade.Sell(GetLot(POSITION_TYPE_SELL)))
                     Print("New SELL order");
//return;
  }


//------------------------
double GetLot(int type)
  {
   double entrylot = 0;
   double minlot = SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MIN);
   double maxlot = SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MAX);
   double Volumen=0;

   double entrylotSell=0;
   double entrylotBuy=0;

   if(Mode_Volume_==Mode_Balance)
      for(int i=PositionsTotal()-1; i>=0; i--)
         if(m_position.SelectByIndex(i))
            if(m_position.Symbol() == _Symbol)
               if(m_position.Magic() == Magic)
                 {
                  if(m_position.PositionType()==POSITION_TYPE_SELL)
                     if(m_position.InfoDouble(POSITION_VOLUME,Volumen))
                        entrylotSell+=Volumen;
                  if(m_position.PositionType()==POSITION_TYPE_BUY)
                     if(m_position.InfoDouble(POSITION_VOLUME,Volumen))
                        entrylotBuy+=Volumen;
                 }

   if(type == POSITION_TYPE_BUY)
     {
      if(Mode_Volume_==Mode_Multiplier)
         if(DnMultiplier > 0)
            entrylot = MathMax(DnLots, Biggest(POSITION_TYPE_BUY) * DnMultiplier);
      if(Mode_Volume_==Mode_Balance)
        {
         double lot=entrylotSell-entrylotBuy;

         if(DnLots*BalanceMultiplicador>=lot)
            entrylot=DnLots*BalanceMultiplicador;
        }
     }

   if(type == POSITION_TYPE_SELL)
     {
      if(Mode_Volume_==Mode_Multiplier)
         if(UpMultiplier > 0)
            entrylot = MathMax(UpLots, Biggest(POSITION_TYPE_SELL) * UpMultiplier);

      if(Mode_Volume_==Mode_Balance)
        {
         double lot=entrylotBuy-entrylotSell;

         if(UpLots*BalanceMultiplicador>=lot)
            entrylot=UpLots*BalanceMultiplicador;
        }
     }

   if(entrylot < minlot)
     {
      if(type == POSITION_TYPE_BUY)
         entrylot = MathMax(DnLots,minlot);
      if(type == POSITION_TYPE_SELL)
         entrylot = MathMax(UpLots,minlot);
     }
   if(entrylot > maxlot)
      entrylot = maxlot;

   entrylot = NormalizeDouble(entrylot,2);
   return (entrylot);
  }

//--------------------------------------------------------------
bool Congested(double proxydistance, double refprice, int dir)
  {
   double PointsDistance = 0;
   bool proximity = false;
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      if(m_position.SelectByIndex(i))
         if(m_position.Symbol() == _Symbol)
            if(m_position.Magic() == Magic)
               if(m_position.PositionType()==dir)
                 {
                  PointsDistance = MathAbs(refprice-m_position.PriceOpen());
                  if(PointsDistance <= proxydistance)
                     proximity = true;
                  //Print(" | refprice ",refprice," | PointsDistance ",PointsDistance," | proxydistance ",proxydistance," | proximity ",proximity);
                 }
     }
//Print(" | proximity ",proximity);
   return (proximity);
  }


//-------------
void GetStats()
  {
   double TickValue=SymbolInfoDouble(_Symbol,SYMBOL_TRADE_TICK_VALUE);

   BuyLots=0;
   SellLots=0;
   BuyProfit=0;
   SellProfit=0;
   NetProfit=0;
   BuyCount=0;
   SellCount=0;
   AllCount=0;
   BuyLevel=0;
   SellLevel=0;
   BELevel=0;

   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      if(m_position.SelectByIndex(i))
         if(m_position.Symbol() ==_Symbol)
            if(m_position.Magic() == Magic)
              {
               if(m_position.PositionType()==POSITION_TYPE_BUY)
                 {
                  BuyLots=BuyLots+m_position.Volume();
                  BuyProfit=BuyProfit+m_position.Profit()+m_position.Commission()+m_position.Swap();
                  BuyCount++;
                 }
               if(m_position.PositionType()==POSITION_TYPE_SELL)
                 {
                  SellLots=SellLots+m_position.Volume();
                  SellProfit=SellProfit+m_position.Profit()+m_position.Commission()+m_position.Swap();
                  SellCount++;
                 }
              }
     }

   NetProfit=BuyProfit+SellProfit;
   AllCount=BuyCount+SellCount;

   if(BuyLots>0)
      BuyLevel    = NormalizeDouble(Bid-(BuyProfit/(TickValue*BuyLots)*_Point),_Digits);
   else
      BuyLevel=0;
   if(SellLots>0)
      SellLevel   = NormalizeDouble(Ask+(SellProfit/(TickValue*SellLots)*_Point),_Digits);
   else
      SellLevel=0;
   if(BuyLots-SellLots>0)
      BELevel     = NormalizeDouble(Bid-((BuyProfit+SellProfit)/(TickValue*(BuyLots-SellLots))*_Point),_Digits);
   if(SellLots-BuyLots>0)
      BELevel     = NormalizeDouble(Ask+((BuyProfit+SellProfit)/(TickValue*(SellLots-BuyLots))*_Point),_Digits);
   if(BELevel==0)
      BELevel     = Ask;

//string buyside    = DoubleToString(BuyCount,0)  + " B | " + DoubleToString(BuyLots,2)    +" | $ "+DoubleToString(BuyProfit,2)   +" | BE @ "+DoubleToString(BuyLevel,_Digits);
//string sellside   = DoubleToString(SellCount,0) + " S | " + DoubleToString(SellLots,2)   +" | $ "+DoubleToString(SellProfit,2)  +" | BE @ "+DoubleToString(SellLevel,_Digits);
//string netside    = "Net " +DoubleToString(BuyLots-SellLots,2) +" | $ "+DoubleToString(BuyProfit+SellProfit,2) +" | @ "+DoubleToString(BELevel,_Digits);

//SetTLabel(0, "netside", 0, CORNER_LEFT_LOWER, 5, 35, netside, Color(BuyProfit+SellProfit>0,BullColor,BearColor));
//SetHline (0, "netline", 0, BELevel, InfoColor, STYLE_SOLID, 2, "netline");
//SetTLabel(0, "buyside", 0, InfoCorner, 5, 20, buyside, TriColor(BuyProfit > 0, clrGreen, BuyProfit < 0, clrRed, InfoColor));
//SetHline (0, "buyline", 0, BuyLevel, BullColor, STYLE_SOLID, 2, "buyline");
//SetTLabel(0, "sellside", 0, InfoCorner, 5, 5, sellside, TriColor(SellProfit > 0, clrGreen, SellProfit < 0, clrRed, InfoColor));
//SetHline (0, "sellline", 0, SellLevel, BearColor, STYLE_SOLID, 2, "sellline");
  }



//+------------------------------------------------------------------+
//| Refreshes the symbol quotes data                                 |
//+------------------------------------------------------------------+
bool RefreshRates()
  {
//--- refresh rates
   if(!m_symbol.RefreshRates())
      return(false);
//--- protection against the return value of "zero"
   if(m_symbol.Ask()==0 || m_symbol.Bid()==0)
      return(false);
//---
   return(true);
  }





//----------------------
int EraseAll(string pr)
  {
   for(int i=ObjectsTotal(0)-1; i>=0; i--)
     {
      string st=ObjectName(0,i);
      if(StringFind(st,pr,0)==0)
         ObjectDelete(0,st);
     }
   return(0);
  }


//--------------
void CloseAll()
  {
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      if(m_position.SelectByIndex(i))
         if(m_position.Symbol()==_Symbol)
            if(m_position.Magic()==Magic)
               m_trade.PositionClose(m_position.Ticket());
     }
  }


//------------------
void Close(int type)
  {
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      if(m_position.SelectByIndex(i))
         if(m_position.Symbol()==_Symbol)
            if(m_position.Magic()==Magic)
               if(m_position.PositionType()==type)
                  m_trade.PositionClose(m_position.Ticket());
     }

  }

//-------------
int CountAll()
  {
   int total=0;
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      if(m_position.SelectByIndex(i))
         if(m_position.Symbol()==_Symbol)
            if(m_position.Magic()==Magic)
               total++;
     }

   return(total);
  }




//---------------
double TopSell()
  {
   double ol = 0;
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      if(m_position.SelectByIndex(i))
         if(m_position.Symbol() == _Symbol)
            if(m_position.Magic() == Magic)
               if(m_position.PositionType() == POSITION_TYPE_SELL)
                  if(m_position.PriceOpen() > ol || ol == 0)
                     ol = m_position.PriceOpen();
     }
   return(ol);
  }

//---------------
double BotBuy()
  {
   double ol = 0;
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      if(m_position.SelectByIndex(i))
         if(m_position.Symbol() == _Symbol)
            if(m_position.Magic() == Magic)
               if(m_position.PositionType() == POSITION_TYPE_BUY)
                  if(m_position.PriceOpen() < ol || ol == 0)
                     ol = m_position.PriceOpen();
     }
   return(ol);
  }

//----------------------
double Biggest(int type)
  {
   double ov = 0;
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      if(m_position.SelectByIndex(i))
         if(m_position.Symbol() == _Symbol)
            if(m_position.Magic() == Magic)
               if(m_position.PositionType() == type)
                  if(m_position.Volume() > ov)
                     ov = m_position.Volume();
     }
   return(ov);
  }

//--------------------
int Count(int type)
  {
   int total=0;
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      if(m_position.SelectByIndex(i))
         if(m_position.Symbol()==_Symbol)
            if(m_position.Magic()==Magic)
               if(m_position.PositionType()==type)
                  total++;
     }

   return(total);
  }



//+------------------------------------------------------------------+
//|  Horizontal Line creation                                        |
//+------------------------------------------------------------------+
void CreateHline(long     chart_id,      // chart ID
                 string   name,          // object name
                 int      nwin,          // window index
                 double   price1,        // price level 1
                 color    Color,         // line color
                 int      style,         // line style
                 int      width,         // line width
                 string   text)          // text
  {
//----
   ObjectCreate(chart_id,name,OBJ_HLINE,nwin,0,price1);
   ObjectSetInteger(chart_id,name,OBJPROP_COLOR,Color);
   ObjectSetInteger(chart_id,name,OBJPROP_STYLE,style);
   ObjectSetInteger(chart_id,name,OBJPROP_WIDTH,width);
   ObjectSetString(chart_id,name,OBJPROP_TEXT,text);
   ObjectSetInteger(chart_id,name,OBJPROP_BACK,false);
   ObjectSetInteger(chart_id,name,OBJPROP_RAY_RIGHT,true);
   ObjectSetInteger(chart_id,name,OBJPROP_RAY,true);
   ObjectSetInteger(chart_id,name,OBJPROP_SELECTED,true);
   ObjectSetInteger(chart_id,name,OBJPROP_SELECTABLE,true);
   ObjectSetInteger(chart_id,name,OBJPROP_ZORDER,true);
//----
  }


//+------------------------------------------------------------------+
//|  Horizontal Line                                        |
//+------------------------------------------------------------------+
void SetHline(long     chart_id,      // chart ID
              string   name,          // object name
              int      nwin,          // window index
              double   price1,        // price level 1
              color    Color,         // line color
              int      style,         // line style
              int      width,         // line width
              string   text)          // text
  {
//----
   if(ObjectFind(chart_id,name)==-1)
     {
      CreateHline(chart_id,name,nwin,price1,Color,style,width,text);
     }
   else
     {
      ObjectSetString(chart_id,name,OBJPROP_TEXT,text);
      ObjectMove(chart_id,name,0,0,price1);
      ObjectSetInteger(chart_id,name,OBJPROP_COLOR,Color);
      ObjectSetInteger(chart_id,name,OBJPROP_WIDTH,width);
     }
//----
  }


//-------------------------------------------------------------------
color Color(bool P,color a,color b) { if(P) return(a);   return(b); }
//-------------------------------------------------------------------

//-------------------------------------------------------------------
color TriColor(bool P,color a,bool Q,color b,color c) { if(P) return(a); if(Q) return (b);  return(c); }
//-------------------------------------------------------------------





//----------------------------------------------------------------------------------------
void SetTLabel(long chart_id, string name, int nwin, ENUM_BASE_CORNER corner, int X, int Y, string text, color Color)
  {
   ObjectCreate(chart_id,name,OBJ_LABEL,0,0,0);
   ObjectSetInteger(chart_id,name,OBJPROP_CORNER,corner);
   ObjectSetInteger(chart_id,name,OBJPROP_ANCHOR,ENUM_ANCHOR_POINT(2*corner));
   ObjectSetInteger(chart_id,name,OBJPROP_XDISTANCE,X);
   ObjectSetInteger(chart_id,name,OBJPROP_YDISTANCE,Y);
   ObjectSetString(chart_id,name,OBJPROP_TEXT,text);
   ObjectSetInteger(chart_id,name,OBJPROP_COLOR,Color);
   ObjectSetString(chart_id,name,OBJPROP_FONT,"Arial");
   ObjectSetInteger(chart_id,name,OBJPROP_FONTSIZE,11);
   ObjectSetString(chart_id,name,OBJPROP_TOOLTIP,name);
   ObjectSetInteger(chart_id,name,OBJPROP_BACK,true);
  }


//+------------------------------------------------------------------+
//|  Trend line creation                                             |
//+------------------------------------------------------------------+
void CreateTline(long     chart_id,      // chart ID
                 string   name,          // object name
                 int      nwin,          // window index
                 datetime time1,         // price level time 1
                 double   price1,        // price level 1
                 datetime time2,         // price level time 2
                 double   price2,        // price level 2
                 color    Color,         // line color
                 int      style,         // line style
                 int      width,         // line width
                 string   text)          // text
  {
//----
   ObjectCreate(chart_id,name,OBJ_TREND,nwin,time1,price1,time2,price2);
   ObjectSetInteger(chart_id,name,OBJPROP_COLOR,Color);
   ObjectSetInteger(chart_id,name,OBJPROP_STYLE,style);
   ObjectSetInteger(chart_id,name,OBJPROP_WIDTH,width);
   ObjectSetString(chart_id,name,OBJPROP_TEXT,text);
   ObjectSetInteger(chart_id,name,OBJPROP_BACK,false);
//ObjectSetInteger(chart_id,name,OBJPROP_RAY_RIGHT,true);
//ObjectSetInteger(chart_id,name,OBJPROP_RAY,true);
   ObjectSetInteger(chart_id,name,OBJPROP_SELECTED,false);
   ObjectSetInteger(chart_id,name,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(chart_id,name,OBJPROP_ZORDER,true);
//----
   ChartRedraw();
  }

//+------------------------------------------------------------------+
//|  Trend line reinstallation                                       |
//+------------------------------------------------------------------+
void SetTline(long     chart_id,      // chart ID
              string   name,          // object name
              int      nwin,          // window index
              datetime time1,         // price level time 1
              double   price1,        // price level 1
              datetime time2,         // price level time 2
              double   price2,        // price level 2
              color    Color,         // line color
              int      style,         // line style
              int      width,         // line width
              string   text)          // text
  {
//----
   if(ObjectFind(chart_id,name)==-1)
     {
      CreateTline(chart_id,name,nwin,time1,price1,time2,price2,Color,style,width,text);
     }
   else
     {
      ObjectSetString(chart_id,name,OBJPROP_TEXT,text);
      ObjectMove(chart_id,name,0,time1,price1);
      ObjectMove(chart_id,name,1,time2,price2);
      ObjectSetInteger(chart_id,name,OBJPROP_COLOR,Color);
     }
//----
   ChartRedraw();
  }

//------------------------------------------------------------
double ND(double val)   {return(NormalizeDouble(val,_Digits));}
//------------------------------------------------------------

//-----------------------------------------------------------
string DS(double val)   {return(DoubleToString(val,_Digits));}
//-----------------------------------------------------------





//+------------------------------------------------------------------+
