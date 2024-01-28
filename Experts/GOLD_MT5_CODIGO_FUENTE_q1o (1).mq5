//+------------------------------------------------------------------+
//|                                               |
//|                                                                  |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "GOLD bot"
#property link      " "
#property version   "2.7"
#property description "XAUUSD h4"
#property strict

string Activo_1 = "XAUUSD";
string Activo_2 = "XAUUSD";
string Activo_3 = "XAUUSD";
string Activo_4 = "XAUUSD";

//Licencia
int numero_de_cuenta=45332249;//Colocar el número de cuenta permitido y despues punto y coma (;)
datetime fecha_de_caducidad = D'2122.05.06';//Colar fecha respetando formato: D'AAAA/MM/DD' y despues punto y coma (;)


#include <Trade\OrderInfo.mqh>
#include <Trade\DealInfo.mqh>

#include <Trade\PositionInfo.mqh>
CPositionInfo m_position;
#include <Trade\Trade.mqh>
CTrade m_trade;


COrderInfo orderInfo;
CDealInfo dealInfo;


#define Bid SymbolInfoDouble(_Symbol,SYMBOL_BID)
#define Ask SymbolInfoDouble(_Symbol,SYMBOL_ASK)
//--- Declaration of constants
#define OP_BUY 0           //Buy 
#define OP_SELL 1          //Sell 
#define OP_BUYLIMIT 2      //Pending order of BUY LIMIT type 
#define OP_SELLLIMIT 3     //Pending order of SELL LIMIT type 
#define OP_BUYSTOP 4       //Pending order of BUY STOP type 
#define OP_SELLSTOP 5      //Pending order of SELL STOP type 


//#property strict
//+------------------------------------------------------------------+

input  string   Licencia         = "LICENCIA integrada, cargar configuración.";          //Licencia
input int      TP               =5;
input int      SL               =2000;
input int       Dist             =20;
input int       Step             =5;
input double   Exponenta        =1;
input int       MaxOrders        =20;
input int      TimeStart        =9;
input int      TimeEnd          =20;
input color     BuyLine          =Blue;
input color     SellLine         =Red;
input int       Magic            =2020;
input string    sep1             = "--- Interes compuesto ---";// //////////////////////////////////////////////////
input int       pares            = 1;//No modificar
input int       saldo            = 200;//Lotaje ( modificable )
input double    lotaje           = 0.01;//No Modificar
//+------------------------------------------------------------------+
string commentario ="GOLD bot";
int r, D;
double PricSellLine, PricBuyLine, NewLot, NewProfProc;
double NewTPb, NewSLb, NewTPs, NewSLs;
double OpPric =0;
bool se;


double Lot__, balance,digitos, lotes;


bool          enable_panel            = true;
color         panel_color_bg          = clrBlack;
color         panel_color_border      = clrDarkOrange;
color         panel_color_title       = clrGold;
color         panel_color_text        = clrBisque;
color         panel_color_button      = clrYellow;
string          fontfamily       = "Calibri";
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   Print(POSITION_TYPE_BUY);

   if(!checkSymbol())
      //return(INIT_FAILED);

      if(AccountInfoInteger(ACCOUNT_LOGIN) != numero_de_cuenta)
        {
         Alert("Licencia solo disponible para cuenta Nro.: ", numero_de_cuenta);
         //return(INIT_FAILED);
        }

   if(TimeCurrent() >= fecha_de_caducidad)
     {
      Alert("Licencia expirada");
      //return(INIT_FAILED);
     }

   m_trade.SetExpertMagicNumber(Magic);

//---
   D=1;
   if(Digits()==5 || Digits()==3)
      D=10;
//---
   HLineCreate("LineBuy",Ask+Dist*D*Point(),BuyLine);
   HLineCreate("LineSell",Bid-Dist*D*Point(),SellLine);

//--- Lotaje
   balance = AccountInfoDouble(ACCOUNT_BALANCE);
   digitos = getLotDigit();

   if((balance/pares/saldo*lotaje - MathFloor(balance/pares/saldo*lotaje) < lotaje/2))
      lotes = NormalizeDouble(balance/pares/saldo*lotaje,digitos);
   else
      lotes = NormalizeDouble(balance/pares/saldo*lotaje-lotaje/2,digitos);

   Lot__ = lotes;


   HC_ButtonCreate("button_showhide",0,240,2,80,14,"show/hide",11,clrGold,panel_color_bg,CORNER_LEFT_UPPER,0,fontfamily,panel_color_bg);

//---
   return(INIT_SUCCEEDED);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool checkSymbol()
  {
   if(Symbol() == Activo_1 ||Symbol() == Activo_2 ||Symbol() == Activo_3 ||Symbol() == Activo_4 ||
      Symbol() == Activo_1 + "m" ||Symbol() == Activo_2 + "m" ||Symbol() == Activo_3 + "m" ||Symbol() == Activo_4 + "m" ||
      Symbol() == Activo_1 + "#" ||Symbol() + "#" == Activo_2 ||Symbol() == Activo_3 + "#" ||Symbol() == Activo_4 + "#")
      return true;
   else
     {
      Alert("Activo NO VALIDO, el EA no puede trabajar en este activo ");
      return false;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int getLotDigit()
  {
   double Lot_Digits;

   double MinLot = SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN);

   if(MinLot == 0.01)
      Lot_Digits = 2;

   if(MinLot == 0.1)
      Lot_Digits = 1;

   if(MinLot == 1)
      Lot_Digits = 0;

   return Lot_Digits;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,0,OBJ_HLINE);
   ObjectsDeleteAll(0,"p_");
   ObjectDelete(0,"button_showhide");
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   double Lot=Lot__;
   actualizarLotaje();

   int i=0;

   if(ObjectFind(0,"LineBuy")>=0)
      PricBuyLine=ObjectGetDouble(0,"LineBuy",OBJPROP_PRICE);
   if(ObjectFind(0,"LineSell")>=0)
      PricSellLine=ObjectGetDouble(0,"LineSell",OBJPROP_PRICE);

   if(Ask+Dist*D*Point()<PricBuyLine)
     {
      HLineMove("LineBuy",Ask+Dist*D*Point());
     }

   if(Bid-Dist*D*Point()>PricSellLine)
     {
      HLineMove("LineSell",Bid-Dist*D*Point());
     }

   if(Ask<PricSellLine && Bid-Dist*D*Point()>PricBuyLine)
     {
      HLineMove("LineBuy",Ask+Dist*D*Point());
     }

   if(Bid>PricBuyLine && Ask+Dist*D*Point()<PricSellLine)
     {
      HLineMove("LineSell",Bid-Dist*D*Point());
     }

   if(TimeHour(TimeCurrent())>=TimeStart && TimeHour(TimeCurrent())<TimeEnd)
     {
      if(iOpen(NULL,PERIOD_CURRENT,0)>iClose(NULL,PERIOD_CURRENT,0) && Ask<=PricSellLine && LastType()!=DEAL_TYPE_SELL && Count(-1)==0)
        {
         r = m_trade.Sell(Lot,Symbol(),Bid,0,0,commentario);

         HLineMove("LineBuy",Ask+Dist*D*Point());
        }



      if(iOpen(NULL,PERIOD_CURRENT,0)<iClose(NULL,PERIOD_CURRENT,0) && Bid>=PricBuyLine && LastType()!=DEAL_TYPE_BUY && Count(-1)==0)
        {

         r = m_trade.Buy(Lot,Symbol(),Ask,0,0,commentario);

         HLineMove("LineSell",Bid-Dist*D*Point());
        }




     }
//---Усреднение
//NewLot=Lot*(MathPow(Exponenta,Count(-1)));
   NewLot=NormalizeDouble(Lot*(MathPow(Exponenta,Count(-1))),getLotDigit());

   if(iOpen(NULL,PERIOD_CURRENT,0)>iClose(NULL,PERIOD_CURRENT,0) && Bid>=PricBuyLine && Count(POSITION_TYPE_SELL)>0 && Bid-Step*D*Point()>SellPric() && Count(POSITION_TYPE_SELL)<MaxOrders)
     {
      r = m_trade.Sell(NewLot,Symbol(),Bid,0,0,commentario);
      HLineMove("LineBuy",Ask+Dist*D*Point());
     }

   if(iOpen(NULL,PERIOD_CURRENT,0)<iClose(NULL,PERIOD_CURRENT,0) && Ask<=PricSellLine && Count(POSITION_TYPE_BUY)>0 && Ask+Step*D*Point()<BuyPric() && Count(POSITION_TYPE_BUY)<MaxOrders)
     {
      r = m_trade.Buy(NewLot,Symbol(),Ask,0,0,commentario);
      HLineMove("LineSell",Bid-Dist*D*Point());
     }

   double lots=0;
   double sum=0;

   for(i = 0; i < PositionsTotal(); i++)
     {
      ulong ticket = m_position.SelectByIndex(i);

      if(m_position.Symbol() != Symbol())
         continue;
      if(m_position.Type()==POSITION_TYPE_BUY)
        {
         lots = lots + m_position.Volume();
         sum = sum + m_position.Volume() * m_position.PriceOpen();
        }

      if(m_position.Type()==POSITION_TYPE_SELL)
        {
         lots = lots - m_position.Volume();
         sum = sum - m_position.Volume() * m_position.PriceOpen();
        }


     }

   double price=0;
   if(lots!=0)
      price=sum/lots;
   if(price>0)
      OpPric=NormalizeDouble(price,Digits());


   if(Count(POSITION_TYPE_BUY)>0)
     {
      NewTPb=OpPric+TP*D*Point();
      NewSLb=BuyPric()-SL*D*Point();
     }

   if(Count(POSITION_TYPE_SELL)>0)
     {
      NewTPs=OpPric-TP*D*Point();
      NewSLs=SellPric()+SL*D*Point();
     }


   if(Count(POSITION_TYPE_BUY)>0 && (LastTypeTP()==0 || LastTypeSL()==0))
     {
      for(i = 0; i < PositionsTotal(); i++)
        {
         ulong ticket = m_position.SelectByIndex(i);

         if(m_position.Symbol()==Symbol() && m_position.Magic()==Magic && m_position.Type()==POSITION_TYPE_BUY)
           {
            if(m_position.StopLoss()!=NormalizeDouble(NewSLb,Digits()) || m_position.TakeProfit()!=NormalizeDouble(NewTPb,Digits()))
               if(!m_trade.PositionModify(m_position.Ticket(),NewSLb,NewTPb))
                  Print("No modifico BUY error: ",m_trade.ResultRetcode());
           }
        }
     }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

   if(Count(POSITION_TYPE_SELL)>0 && (LastTypeTP()==0 || LastTypeSL()==0))
     {
      for(i = 0; i < PositionsTotal(); i++)
        {
         ulong ticket = m_position.SelectByIndex(i);

         if(m_position.Symbol()==Symbol() && m_position.Magic()==Magic && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
           {
            if(m_position.StopLoss()!=NormalizeDouble(NewSLs,Digits()) || m_position.TakeProfit()!=NormalizeDouble(NewTPs,Digits()))
               if(!m_trade.PositionModify(m_position.Ticket(),NewSLs,NewTPs))
                  Print("No modifico SELL error: ",m_trade.ResultRetcode());
           }
        }
     }


//--- 面板制作
//--- info panel ----------------------
   HC_RectLabelCreate("p_abackground",0,3,15,220,225,panel_color_bg,CORNER_LEFT_UPPER,0,BORDER_FLAT,panel_color_border,STYLE_SOLID,1,false,false,true,0);
   HC_LabelCreate("p_title",0,10,20,"Trades Info",12,panel_color_title);
   HC_LabelCreate("p_time",0,10,45,TimeToString(TimeLocal()),8,panel_color_text);
//---
   HC_LabelCreate("p_spread_item",0,10,65,"Spread:",8,panel_color_text);
   HC_LabelCreate("p_spread_value",0,100,65,StringFormat("%d points",SymbolInfoInteger(_Symbol,SYMBOL_SPREAD)),8,panel_color_text);
//---
   HC_LabelCreate("p_number_item",0,10,80,"Trades Number:",8,panel_color_text);
   HC_LabelCreate("p_number_value",0,100,80,StringFormat("S:%d | B:%d",(int)HC_PositionSumCalc("number",1,2,Magic),(int)HC_PositionSumCalc("number",0,2,Magic)),8,panel_color_text);
//---
   HC_LabelCreate("p_lots_item",0,10,95,"Trades Lots:",8,panel_color_text);
   HC_LabelCreate("p_lots_value",0,100,95,StringFormat("S:%.2f | B:%.2f",HC_PositionSumCalc("volume",1,2,Magic),HC_PositionSumCalc("volume",0,2,Magic)),8,panel_color_text);
//--
   double buy_profit  = HC_PositionSumCalc("profit",0,2,Magic);
   double sell_profit = HC_PositionSumCalc("profit",1,2,Magic);
   HC_LabelCreate("p_profit_item",0,10,110,"Trades Profit:",8,panel_color_text);
   HC_LabelCreate("p_profit_value",0,100,110,StringFormat("S:%.2f | B:%.2f",sell_profit,buy_profit),8,panel_color_text);
//--
   double total_profit = buy_profit+sell_profit;
   HC_LabelCreate("p_netprofit_item",0,10,130,"Net Profit:",8,panel_color_text);
   HC_LabelCreate("p_netprofit_value",0,100,130,StringFormat("%.2f",total_profit),8,panel_color_text);
//--
   HC_LabelCreate("p_drawdown_item",0,10,145,"Draw Down:",8,panel_color_text);
   HC_LabelCreate("p_drawdown_value",0,100,145,StringFormat("%.2f (%.2f%%)",total_profit,100*total_profit/AccountInfoDouble(ACCOUNT_BALANCE)),8,panel_color_text);
//--
   double today_profit = HC_HistoryDealSumCalc("profit",2,2,Magic,_Symbol,NULL,iTime(_Symbol,PERIOD_D1,0));
   HC_LabelCreate("p_todayprofit_item",0,10,160,"Today Profit:",8,panel_color_text);
   HC_LabelCreate("p_todayprofit_value",0,100,160,StringFormat("%.2f",today_profit),8,panel_color_text);
//--
   double week_profit = HC_HistoryDealSumCalc("profit",2,2,Magic,_Symbol,NULL,iTime(_Symbol,PERIOD_W1,0));
   HC_LabelCreate("p_weekprofit_item",0,10,175,"Weekly Profit:",8,panel_color_text);
   HC_LabelCreate("p_weekprofit_value",0,100,175,StringFormat("%.2f",week_profit),8,panel_color_text);
//---
   HC_LabelCreate("p_balance_item",0,10,200,"Balance:",8,panel_color_text);
   HC_LabelCreate("p_balance_value",0,100,200,StringFormat("%.2f",AccountInfoDouble(ACCOUNT_BALANCE)),8,panel_color_text);
//---
   HC_LabelCreate("p_equity_item",0,10,215,"Equity:",8,panel_color_text);
   HC_LabelCreate("p_equity_value",0,100,215,StringFormat("%.2f",AccountInfoDouble(ACCOUNT_BALANCE)),8,panel_color_text);


  }

//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   if(id==CHARTEVENT_OBJECT_CLICK&&sparam=="button_showhide")
     {
      if(ObjectGetInteger(0,"button_showhide",OBJPROP_STATE,0)==false)
        {
         ObjectsVisibleByName("p_");
         return;
        }
      if(ObjectGetInteger(0,"button_showhide",OBJPROP_STATE,0)==true)
        {
         ObjectsHidenByName("p_");
         return;
        }
     }
  }



//+------------------------------------------------------------------+
//| Считаем общий профит                                             |
//+------------------------------------------------------------------+
double Profit(int type)
  {
   double Profit = 0;

   for(int cnt = PositionsTotal() - 1; cnt >= 0; cnt--)
     {
      ulong ticket = m_position.SelectByIndex(cnt);

      if(m_position.Symbol()==Symbol() && m_position.Magic()==Magic)
        {
         Profit += m_position.Profit() + m_position.Swap() + m_position.Commission();
        }
     }

   return (Profit);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ClosePlus(int ot)
  {
   for(int cnt = PositionsTotal() - 1; cnt >= 0; cnt--)
     {
      ulong ticket = m_position.SelectByIndex(cnt);

      if(m_position.Symbol()==Symbol() && m_position.Magic()==Magic && m_position.Profit() + m_position.Swap() + m_position.Commission() > 0)
        {
         if(m_position.Type()==0 && (ot==0 || ot==-1))
           {
            m_trade.PositionClose(ticket);
           }
         if(m_position.Type()==1 && (ot==1 || ot==-1))
           {
            m_trade.PositionClose(ticket);
           }

        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseMinus(int ot)
  {
   for(int cnt = PositionsTotal() - 1; cnt >= 0; cnt--)
     {
      ulong ticket = m_position.SelectByIndex(cnt);

      if(m_position.Symbol()==Symbol() && m_position.Magic()==Magic && m_position.Profit() + m_position.Swap() + m_position.Commission() < 0)
        {
         if(m_position.Type()==0 && (ot==0 || ot==-1))
           {
            m_trade.PositionClose(ticket);
           }
         if(m_position.Type()==1 && (ot==1 || ot==-1))
           {
            m_trade.PositionClose(ticket);
           }

        }
     }
  }

//+------------------------------------------------------------------+
//| Создает горизонтальную линию                                     |
//+------------------------------------------------------------------+
bool HLineCreate(string name,double price,color clr)
  {
//--- если цена не задана, то установим ее на уровне текущей цены Bid
   if(!price)
      price=SymbolInfoDouble(Symbol(),SYMBOL_BID);
//--- сбросим значение ошибки
   ResetLastError();
//--- создадим горизонтальную линию
   if(!ObjectCreate(0,name,OBJ_HLINE,0,0,price))
     {
      Print(__FUNCTION__,": не удалось создать горизонтальную линию! Код ошибки = ",GetLastError());
      return(false);
     }
//--- установим цвет линии
   ObjectSetInteger(0,name,OBJPROP_COLOR,clr);
//--- установим стиль отображения линии
   ObjectSetInteger(0,name,OBJPROP_STYLE,STYLE_SOLID);
//--- установим толщину линии
   ObjectSetInteger(0,name,OBJPROP_WIDTH,1);
//--- отобразим на переднем (false) или заднем (true) плане
   ObjectSetInteger(0,name,OBJPROP_BACK,false);
//--- включим (true) или отключим (false) режим перемещения линии мышью
   ObjectSetInteger(0,name,OBJPROP_SELECTABLE,true);
   ObjectSetInteger(0,name,OBJPROP_SELECTED,true);
//--- скроем (true) или отобразим (false) имя графического объекта в списке объектов
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
//--- установим приоритет на получение события нажатия мыши на графике
   ObjectSetInteger(0,name,OBJPROP_ZORDER,0);
//--- успешное выполнение
   return(true);
  }
//+------------------------------------------------------------------+
//| Перемещение горизонтальной линии                                 |
//+------------------------------------------------------------------+
bool HLineMove(string name,double price)
  {
   if(!price)
      price=SymbolInfoDouble(Symbol(),SYMBOL_BID);
//--- сбросим значение ошибки
   ResetLastError();
//--- переместим горизонтальную линию
   if(!ObjectMove(0,name,0,0,price))
     {
      Print(__FUNCTION__,": не удалось переместить горизонтальную линию! Код ошибки = ",GetLastError());
      return(false);
     }
//--- успешное выполнение
   return(true);
  }
//+------------------------------------------------------------------+
//| Определяем тип последнего ордера                                 |
//+------------------------------------------------------------------+
int LastType()
  {
   int type=-1;

   HistorySelect(0,TimeCurrent());

   for(int pos=HistoryDealsTotal()-1; pos>=0; pos--)
     {
      ulong ticket = HistoryDealGetTicket(pos);

      if(HistoryDealGetString(ticket,DEAL_SYMBOL) == Symbol() && HistoryDealGetInteger(ticket,DEAL_MAGIC) == Magic
         && HistoryDealGetInteger(ticket,DEAL_ENTRY) == 0)
         type = HistoryDealGetInteger(ticket,DEAL_TYPE);
      break;
     }

   return(type);
  }
//+------------------------------------------------------------------+
//| Определяем цену последнего ордера бай                            |
//+------------------------------------------------------------------+
double BuyPric()
  {
   double oldorderopenprice=1111;
   int oldticketnumber;
   double unused = 0;
   int ticketnumber = 0;
   bool Entra=false;


   for(int cnt = PositionsTotal() - 1; cnt >= 0; cnt--)
     {
      ulong ticket = m_position.SelectByIndex(cnt);

      if(m_position.Symbol() == Symbol() && m_position.Magic() == Magic && m_position.PositionType() == POSITION_TYPE_BUY)
        {
         Entra=true;
         oldticketnumber = ticket;
         if(oldticketnumber > ticketnumber || ticketnumber==0)
           {
            oldorderopenprice = m_position.PriceOpen();
            unused = oldorderopenprice;
            ticketnumber = oldticketnumber;
           }
        }
     }
   return (oldorderopenprice);
  }
//+------------------------------------------------------------------+
//| Определяем цену последнего ордера селл                           |
//+------------------------------------------------------------------+
double SellPric()
  {
   double oldorderopenprice=1111;
   int oldticketnumber;
   double unused = 0;
   int ticketnumber = 0;
   bool Entra=false;

   for(int cnt = PositionsTotal() - 1; cnt >= 0; cnt--)
     {
      ulong ticket =m_position.SelectByIndex(cnt);

      if(m_position.Symbol() == Symbol() && m_position.Magic() == Magic && m_position.PositionType()==POSITION_TYPE_SELL)
        {
         Entra=true;
         oldticketnumber = ticket;
         if(oldticketnumber > ticketnumber || ticketnumber==0)
           {
            oldorderopenprice = m_position.PriceOpen();
            unused = oldorderopenprice;
            ticketnumber = oldticketnumber;
           }
        }
     }
   return (oldorderopenprice);
  }
//+------------------------------------------------------------------+
//| Считаем количество ордеров по типу                               |
//+------------------------------------------------------------------+
int Count(int type)
  {
   int count=0;
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong ticket = m_position.SelectByIndex(i);

      if(m_position.Symbol() == Symbol() && m_position.Magic() == Magic && (type==-1 || m_position.PositionType()==type))
         count++;

     }
   return(count);
  }
//--------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Определяем тейк        последнего ордера                         |
//+------------------------------------------------------------------+
int LastTypeTP()
  {
   double tp=0;
   datetime dt=0;
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong ticket = m_position.SelectByIndex(i);

      if(m_position.Symbol() == Symbol() && m_position.Magic() == Magic)
        {
         if(m_position.Time()>dt)
           {
            dt=m_position.Time();
            tp=m_position.TakeProfit();
           }
        }
     }
   return(tp);
  }//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
int LastTypeSL()
  {
   double sl=0;
   datetime dt=0;
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong ticket = m_position.SelectByIndex(i);

      if(m_position.Symbol() == Symbol() && m_position.Magic() == Magic)
        {
         if(m_position.Time()>dt)
           {
            dt=m_position.Time();
            sl=m_position.StopLoss();
           }
        }
     }

   return(sl);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//+------------------------------------------------------------------+++
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+-------------------CONTROL DE COPIAS------------------------------+
//+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------

static int ExtBase64Decode[256]=
  {
   -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
      -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
      -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  62,  -1,  -1,  -1,  63,
      52,  53,  54,  55,  56,  57,  58,  59,  60,  61,  -1,  -1,  -1,  -2,  -1,  -1,
      -1,   0,   1,   2,   3,   4,   5,   6,   7,   8,   9,  10,  11,  12,  13,  14,
      15,  16,  17,  18,  19,  20,  21,  22,  23,  24,  25,  -1,  -1,  -1,  -1,  -1,
      -1,  26,  27,  28,  29,  30,  31,  32,  33,  34,  35,  36,  37,  38,  39,  40,
      41,  42,  43,  44,  45,  46,  47,  48,  49,  50,  51,  -1,  -1,  -1,  -1,  -1,
      -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
      -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
      -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
      -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
      -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
      -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
      -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
      -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1
     };


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void actualizarLotaje()
  {
   balance = AccountInfoDouble(ACCOUNT_BALANCE);
   digitos = getLotDigit();

   if((balance/pares/saldo*lotaje - MathFloor(balance/pares/saldo*lotaje) < lotaje/2))
      lotes = NormalizeDouble(balance/pares/saldo*lotaje,digitos);
   else
      lotes = NormalizeDouble(balance/pares/saldo*lotaje-lotaje/2,digitos);

   Lot__ = lotes;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int TimeHour(datetime date)
  {
   MqlDateTime tm;
   TimeToStruct(date,tm);
   return(tm.hour);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Create the button                                                |
//+------------------------------------------------------------------+
bool HC_ButtonCreate(const string            name="Button",            // button name
                     const int               sub_window=0,             // subwindow index
                     const int               x=0,                      // X coordinate
                     const int               y=0,                      // Y coordinate
                     const int               width=50,                 // button width
                     const int               height=18,                // button height
                     const string            text="Button",            // text
                     const int               font_size=10,             // font size
                     const color             clr=clrBlack,             // text color
                     const color             back_clr=C'236,233,216',  // background color
                     //---
                     const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                     //---
                     const long              chart_ID=0,               // chart's ID
                     string            font="Arial",             // font
                     const color             border_clr=clrNONE,       // border color
                     const bool              state=false,              // pressed/released
                     const bool              back=false,               // in the background
                     const bool              selection=false,          // highlight to move
                     const bool              hidden=true,              // hidden in the object list
                     const long              z_order=2)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create the button
   if(!ObjectCreate(chart_ID,name,OBJ_BUTTON,sub_window,0,0))
     {
      int error_code = GetLastError();
      if(error_code!=4200)
        {
         Print(__FUNCTION__,": failed to create the button! Error code = ",GetLastError());
         return(false);
        }
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
//| Create rectangle label                                           |
//+------------------------------------------------------------------+
bool HC_RectLabelCreate(const string           name="RectLabel",         // label name
                        const int              sub_window=0,             // subwindow index
                        const int              x=0,                      // X coordinate
                        const int              y=0,                      // Y coordinate
                        const int              width=50,                 // width
                        const int              height=18,                // height
                        const color            back_clr=C'236,233,216',  // background color
                        //---
                        const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                        //---
                        const long             chart_ID=0,               // chart's ID
                        const ENUM_BORDER_TYPE border=BORDER_FLAT,       // border type
                        const color            clr=clrNONE,              // flat border color (Flat)
                        const ENUM_LINE_STYLE  style=STYLE_SOLID,        // flat border style
                        const int              line_width=1,             // flat border width
                        const bool             back=false,               // in the background
                        const bool             selection=false,          // highlight to move
                        const bool             hidden=true,              // hidden in the object list
                        const long             z_order=1)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create a rectangle label
   if(!ObjectCreate(chart_ID,name,OBJ_RECTANGLE_LABEL,sub_window,0,0))
     {
      int error_code = GetLastError();
      if(error_code!=4200)
        {
         Print(__FUNCTION__,": failed to create a rectangle label! Error code = ",error_code);
         return(false);
        }
     }
//--- set label coordinates
   bool res = ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set label size
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- set background color
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- set border type
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_TYPE,border);
//--- set the chart's corner, relative to which point coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set flat border color (in Flat mode)
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set flat border line style
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- set flat border width
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,line_width);
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
//| Create a text label                                              |
//+------------------------------------------------------------------+
bool HC_LabelCreate(const string            name="Label",             // label name
                    const int               sub_window=0,             // subwindow index
                    const int               x=0,                      // X coordinate
                    const int               y=0,                      // Y coordinate
                    const string            text="Label",             // text
                    const int               font_size=10,             // font size
                    const color             clr=clrRed,               // color
                    //---
                    const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                    const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // anchor type
                    const double            angle=0.0,                // text slope
                    //---
                    const long              chart_ID=0,               // chart's ID
                    string            font="Arial",             // font
                    const bool              back=false,               // in the background
                    const bool              selection=false,          // highlight to move
                    const bool              hidden=true,              // hidden in the object list
                    const long              z_order=2)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create a text label
   if(!ObjectCreate(chart_ID,name,OBJ_LABEL,sub_window,0,0))
     {
      int error_code = GetLastError();
      if(error_code!=4200)
        {
         Print(__FUNCTION__,": failed to create text label! Error code = ",GetLastError());
         return(false);
        }
     }
//--- set label coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set the chart's corner, relative to which point coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set the text
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- set text font
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- set font size
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- set the slope angle of the text
   ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);
//--- set anchor type
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
//--- set color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
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
//| 订单统计功能 - 总和                                             |
//+------------------------------------------------------------------+
double HC_PositionSumCalc(string sum_type,int type = 2,int profit_type = 2,ulong magic = 0,string symbol = "current",string comment = NULL)
  {
   if(symbol == "current")
      symbol = _Symbol;
   int total = PositionsTotal(); // number of open positions
   double sum_value = 0;
   for(int i = 0; i < total; i++)
     {
      //--- parameters of the position
      ulong  i_ticket = PositionGetTicket(i);
      string i_symbol = PositionGetString(POSITION_SYMBOL);
      //---
      ENUM_POSITION_TYPE i_type = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
      if(type == 0 && i_type == POSITION_TYPE_SELL)
         continue;
      if(type == 1 && i_type == POSITION_TYPE_BUY)
         continue;
      //---
      if(magic   != 0     && magic   != PositionGetInteger(POSITION_MAGIC))
         continue;
      if(symbol  != "all" && symbol  != PositionGetString(POSITION_SYMBOL))
         continue;
      if(comment != NULL  && comment != PositionGetString(POSITION_COMMENT))
         continue;
      //---
      if(profit_type == 0 && PositionGetDouble(POSITION_PROFIT) < 0)
         continue;
      if(profit_type == 1 && PositionGetDouble(POSITION_PROFIT) >= 0)
         continue;
      //---
      if(sum_type == "number")
         sum_value += 1;
      //---
      double i_volume = PositionGetDouble(POSITION_VOLUME);
      if(sum_type == "volume")
         sum_value += i_volume;
      //---
      double i_profit      = PositionGetDouble(POSITION_PROFIT);
      double i_profit_full = i_profit + PositionGetDouble(POSITION_SWAP);
      if(sum_type == "profit")
         sum_value += i_profit;
      if(sum_type == "profit_full")
         sum_value += i_profit_full;
      if(sum_type == "profit_point")
         sum_value += NormalizeDouble(i_profit / (i_volume * SymbolInfoDouble(i_symbol,SYMBOL_TRADE_TICK_VALUE)),0);
      if(sum_type == "profit_point_full")
         sum_value += NormalizeDouble(i_profit_full / (i_volume * SymbolInfoDouble(i_symbol,SYMBOL_TRADE_TICK_VALUE)),0);
     }
//---
   return sum_value;
  }

//+------------------------------------------------------------------+
//| 订单统计功能 - 总和                                             |
//+------------------------------------------------------------------+
double HC_HistoryDealSumCalc(string sum_type,int type=2,int profit_type=2,ulong magic=0,string symbol="current",string comment=NULL,datetime from=0,datetime to=0)
  {
   if(symbol == "current")
      symbol = _Symbol;
   if(to==0)
      to = TimeCurrent();
   HistorySelect(from,to);
   int total = HistoryDealsTotal(); // number of history deal
//---
   double sum_value = 0;
   for(int i = 0; i < total; i++)
     {
      //--- parameters of the position
      ulong  i_ticket = HistoryDealGetTicket(i);
      //---
      ENUM_DEAL_TYPE i_type = (ENUM_DEAL_TYPE)HistoryDealGetInteger(i_ticket,DEAL_TYPE);
      if(type == 0 && i_type == DEAL_TYPE_SELL)
         continue;
      if(type == 1 && i_type == DEAL_TYPE_BUY)
         continue;
      //---
      if(magic   != 0    && magic   != HistoryDealGetInteger(i_ticket,DEAL_MAGIC))
         continue;
      if(symbol  != NULL && symbol  != HistoryDealGetString(i_ticket,DEAL_SYMBOL))
         continue;
      if(comment != NULL && comment != HistoryDealGetString(i_ticket,DEAL_COMMENT))
         continue;
      //---
      if(profit_type == 0 && HistoryDealGetDouble(i_ticket,DEAL_PROFIT) < 0)
         continue;
      if(profit_type == 1 && HistoryDealGetDouble(i_ticket,DEAL_PROFIT) >= 0)
         continue;
      //---
      if(sum_type == "number")
         sum_value += 1;
      //---
      double i_volume = HistoryDealGetDouble(i_ticket,DEAL_VOLUME);
      if(sum_type == "volume")
         sum_value += i_volume;
      //---
      double i_profit      = HistoryDealGetDouble(i_ticket,DEAL_PROFIT);
      double i_profit_full = i_profit + HistoryDealGetDouble(i_ticket,DEAL_SWAP);
      if(sum_type == "profit")
         sum_value += i_profit;
      if(sum_type == "profit_full")
         sum_value += i_profit_full;
      if(sum_type == "profit_point")
         sum_value += NormalizeDouble(i_profit / (i_volume * SymbolInfoDouble(symbol,SYMBOL_TRADE_TICK_VALUE)),0);
      if(sum_type == "profit_point_full")
         sum_value += NormalizeDouble(i_profit_full / (i_volume * SymbolInfoDouble(symbol,SYMBOL_TRADE_TICK_VALUE)),0);
     }
//---
   return sum_value;
  }

//+------------------------------------------------------------------+
void ObjectsHidenByName(string name)
//+------------------------------------------------------------------+
  {
   int nameLen = StringLen(name);
   int ObjectsNum = ObjectsTotal(0,-1);
   for(int i=0; i<ObjectsNum; i++)
     {
      string ObjName = ObjectName(0,i);
      if(StringSubstr(ObjName,0,nameLen)==name)
         ObjectSetInteger(0,ObjName,OBJPROP_TIMEFRAMES,OBJ_NO_PERIODS);
     }
   printf("%s Minimized!",name);
  }

//+------------------------------------------------------------------+
void ObjectsVisibleByName(string PName)
//+------------------------------------------------------------------+
  {
   int nameLen = StringLen(PName);
   int ObjectsNum = ObjectsTotal(0,-1);
   for(int i=0; i<ObjectsNum; i++)
     {
      string ObjName = ObjectName(0,i);
      if(StringSubstr(ObjName,0,nameLen)==PName)
         ObjectSetInteger(0,ObjName,OBJPROP_TIMEFRAMES,OBJ_ALL_PERIODS);
     }
   printf("%s Restored!",PName);
  }
//+------------------------------------------------------------------+
