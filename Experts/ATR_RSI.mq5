//+------------------------------------------------------------------+
//|                                                      ATR_RSI.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

color  ButtonTXColor  = Black; //Button Text Color
color  ButtonBGColor  = White;  //Button Color
input ENUM_DAY_OF_WEEK StartDay = 1; //Trade Days Start
input ENUM_DAY_OF_WEEK EndDay = 4; //Trade Days End
input string StartTime="00:15:00";
input string EndTime="22:30:00";

input int MAPeriod               = 200;
input ENUM_MA_METHOD MAMethod      = MODE_EMA;
input ENUM_APPLIED_PRICE MAApplyPrice = PRICE_CLOSE;
input ENUM_TIMEFRAMES  TF = PERIOD_M5;
input int ATRPeriod = 14;
input double XRecovATR = 3;
input double XRecovTP = 3;
input double XATR = 2;
double TPT;
input bool Use_TrailingStop=true;
input double XATR_TrailingAt=1;
input double XATR_TrailingStep=1;
input int RSI_Period  =2;
input double RSI_BuyLevel = 25.0;
input double RSI_SellLevel = 75;
input double Min_ATR=0.0003;
input double Max_ATR=0.001;

datetime T;
bool Cambia = true;
double HrB;
double HB;
double HS;
double HrS;
string Symb="";
double NextPrice;
double TP;
double NextLot;
double Pass=3;
bool Choc=false;
bool Chac=false;
bool Chic=true;
input int MagicNumber=12345;
int Lasticket1;
int Lasticket2;
input int Magic=1234;
int OldT1,OldT2;
double TakeProfitS;
double TakeProfitB;
input double Multiply=2.5;
input double Lots=0.1;
datetime Ref_day        = D'2021.02.28 21:00';

int HandleRSI,HandleMA,HandleATR;

double RSI[],MA[],ATR[];

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   HandleRSI=iRSI(Symbol(),TF,RSI_Period,PRICE_CLOSE);
   HandleMA=iMA(Symbol(),TF,MAPeriod,0,MAMethod,MAApplyPrice);
   HandleATR=iATR(Symbol(),TF,ATRPeriod);
  
  ArraySetAsSeries(RSI,true);
  ArrayResize(RSI,3);
  
  ArraySetAsSeries(MA,true);
  ArrayResize(MA,3);
  
  ArraySetAsSeries(ATR,true);
  ArrayResize(ATR,3);
   NextLot=Lots;

   return(INIT_SUCCEEDED);   // Exit the special funct. init()
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
   if(aNewBarEVENT())
      Cambia=true;
   if(CountPosition(Magic) == 0 && CountPosition(MagicNumber) == 0)
     {
      Chic=true;
      Choc=false;
      Chac=false;
      NextLot=Multiply*Lots;
      Pass=3;
      //TakeProfitB;
      //TakeProfitS;
     }
   OrderClos();
   TrailingStop();
   
   MqlDateTime TiempoActual;
   TimeToStruct(TimeCurrent(),TiempoActual);
   
   if(TiempoActual.day_of_week >= StartDay && TiempoActual.day_of_week<=EndDay)
     {
      if(StringToTime(StartTime)<TimeCurrent() && StringToTime(EndTime)+5>TimeCurrent())
        {

         OpenPosition();
         if(PositionExcist1(Magic)==true && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && Chic==true)
           {
            CopyBuffer(HandleATR,0,0,3,ATR);
            double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
            double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
            HB=Ask;
            HrB= Ask-ATR[1]*XRecovATR;
            NextPrice= Ask-ATR[1]*XRecovATR;
            TP=ATR[1]*XRecovTP;
            TPT=ATR[1];

            Pass=0;
            Chac=true;
            Chic=false;
            TakeProfitS=Bid-TP-ATR[1]*XRecovATR;
            TakeProfitB=Ask + TP;
           }
         if(PositionExcist1(Magic)==true && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && Chic==true)
           {
            CopyBuffer(HandleATR,0,0,3,ATR);
            double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
            double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
            
            HS=Bid;
            HrS=Bid+ATR[1]*XRecovATR;
            NextPrice=Bid+ATR[1]*XRecovATR;
            TP=ATR[1]*XRecovTP;
            TPT=ATR[1];
            Pass=0;
            Choc=true;
            Chic=false;
            TakeProfitS=Bid-TP;
            TakeProfitB=Ask + TP+ATR[1]*XRecovATR;
           }
        }
     }
   HedgeOrder();
   TpHit();
   
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*
bool TradedThisCandle()
  {
   bool Traded = false;

   for(int i = 0; i < OrdersTotal(); i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES) == false)
         break;
      if(OrderSymbol() != Symbol())
         continue;
      if(OrderOpenTime() >= Time[0])
        {
         Traded = true;
        }
     }
   return Traded;
  }*/
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OrderClos()
  {
   if(OrderSelect(Lasticket1,SELECT_BY_TICKET))
     {
      if(OrderCloseTime()!=0  &&(OrderProfit()<0 || OrderProfit()>0) && Lasticket1!=OldT1)
        {
         //Alert("SE");
          ClosAll();
         Lasticket1=OldT1;
        }
     }
   if(OrderSelect(Lasticket2,SELECT_BY_TICKET))
     {
      if(OrderCloseTime()!=0 && (OrderProfit()<0 || OrderProfit()>0) && Lasticket2!=OldT2)
        {
         //Alert("SE");
         ClosAll();
         Lasticket2=OldT2;
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CountPosition(int magic)
  {
   int x = 0;
   for(int i=0; i<OrdersTotal(); i++)
     {
      if(OrderSelect(i,SELECT_BY_POS)==false)
         continue;
      if(OrderSymbol() == Symbol() && (OrderMagicNumber() == Magic || OrderMagicNumber() == MagicNumber) && (OrderType()==OP_SELL || OrderType() == OP_BUY))
         x++;
     }
   return x;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ClosAll()
  {
   int index =OrdersTotal() -1;
   while(index >=0 && OrderSelect(index,SELECT_BY_POS,MODE_TRADES)== true)
     {
      if(OrderSymbol()==Symbol()  && (OrderType()==OP_SELL || OrderType() == OP_BUY) && (OrderMagicNumber() == Magic || OrderMagicNumber() == MagicNumber))
        {
         OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),3,clrAquamarine);
        }
      if(OrderSymbol()==Symbol()  && (OrderType()==OP_SELLSTOP || OrderType() == OP_BUYSTOP) && (OrderMagicNumber() == Magic || OrderMagicNumber() == MagicNumber))
        {
         OrderDelete(OrderTicket());
        }
      index--;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TrailingStop()
  {
   RefreshRates();

   for(int i=0; i<OrdersTotal(); i++)
     {
      if(OrderSelect(i,SELECT_BY_POS)==false)
         continue;

      if(OrderType() == OP_BUY && OrderMagicNumber() == Magic && Use_TrailingStop==true && !PositionExcistT(MagicNumber))
        {
         if(MarketInfo(OrderSymbol(),MODE_BID)-OrderOpenPrice()>TPT*XATR_TrailingAt)
           {
            if(OrderStopLoss()<MarketInfo(OrderSymbol(),MODE_BID)-TPT*XATR_TrailingStep)
              {
               //--- modify order and exit
               if(!OrderModify(OrderTicket(),OrderOpenPrice(),MarketInfo(OrderSymbol(),MODE_BID)-TPT*XATR_TrailingStep,OrderTakeProfit(),0,Green))
                  Print("OrderModify error ",GetLastError());
               return;
              }
           }
        }

      if(OrderType() == OP_SELL &&  OrderMagicNumber() == Magic && Use_TrailingStop==true && !PositionExcistT(MagicNumber))
        {
         if((OrderOpenPrice()-MarketInfo(OrderSymbol(),MODE_ASK))>TPT*XATR_TrailingAt)
           {
            if(OrderStopLoss()>MarketInfo(OrderSymbol(),MODE_ASK)+TPT*XATR_TrailingStep || OrderStopLoss() == 0)
              {
               //--- modify order and exit
               if(!OrderModify(OrderTicket(),OrderOpenPrice(),MarketInfo(OrderSymbol(),MODE_ASK)+TPT*XATR_TrailingStep,OrderTakeProfit(),0,Red))
                  Print("OrderModify error ",GetLastError());
               return;
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void HedgeOrder()
  {
   if(MarketInfo(Symbol(),MODE_BID)<=NextPrice && Chac==true && Pass==0)
     {
      //Alert("POs");
      Lasticket1= OrderSend(Symbol(),OP_SELL,NextLot,MarketInfo(Symbol(),MODE_BID),3,0,TakeProfitS,NULL,MagicNumber,0,clrRed);
      NextPrice=HB ;
      Chac=true;
      Pass=1;
      NextLot=NextLot*Multiply;
      if(PositionExcist1(Magic) && OrderType()==OP_BUY)
         if(!OrderModify(OrderTicket(),OrderOpenPrice(),0,TakeProfitB,0,Red))
            Print("OrderModify error ",GetLastError());
     }
   if(MarketInfo(Symbol(),MODE_ASK)>=NextPrice && Chac==true && Pass==1)
     {
      Lasticket2= OrderSend(Symbol(),OP_BUY,NextLot,MarketInfo(Symbol(),MODE_ASK),3,0,TakeProfitB,NULL,MagicNumber,0,clrBlue);
      Chac=true;
      NextPrice=HrB;
      Pass=0;
      NextLot=NextLot*Multiply;
     }


   if(MarketInfo(Symbol(),MODE_ASK)>=NextPrice && Choc==true && Pass==0)
     {
      Lasticket2= OrderSend(Symbol(),OP_BUY,NextLot,MarketInfo(Symbol(),MODE_ASK),3,0,TakeProfitB,NULL,MagicNumber,0,clrBlue);
      NextPrice= HS;
      Choc=true;
      Pass=1;
      NextLot=NextLot*Multiply;
      if(PositionExcist1(Magic) && OrderType()==OP_SELL)
         if(!OrderModify(OrderTicket(),OrderOpenPrice(),0,TakeProfitS,0,Red))
            Print("OrderModify error ",GetLastError());
     }
   if(MarketInfo(Symbol(),MODE_BID)<=NextPrice && Choc==true && Pass==1)
     {
      Lasticket1=  OrderSend(Symbol(),OP_SELL,NextLot,MarketInfo(Symbol(),MODE_BID),3,0,TakeProfitS,NULL,MagicNumber,0,clrRed);
      Choc=true;
      NextPrice= HrS;
      Pass=0;
      NextLot=NextLot*Multiply;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OpenPosition()
  {
  CopyBuffer(HandleRSI,0,0,3,RSI);  
  CopyBuffer(HandleMA,0,0,3,MA);
  CopyBuffer(HandleATR,0,0,3,ATR);
   
   if(RSI[1]<RSI_BuyLevel && RSI[0]<RSI_BuyLevel && RSI[2]>RSI_BuyLevel && iClose(Symbol(),TF,1)>MA[1] && ATR[1]>Min_ATR && ATR[1]<Max_ATR &&  Cambia==true && !PositionExcistl(Magic) && !PositionExcist1(Magic))
     {

      OrderSend(Symbol(),OP_BUY,Lots,MarketInfo(Symbol(),MODE_ASK),3,0,MarketInfo(Symbol(),MODE_ASK) + (iATR(Symbol(),TF,ATRPeriod,1)*XATR)/2,NULL,Magic,0,clrBlue);
      T=TimeCurrent();
      Cambia=false;

     }
   if(RSI[1]>RSI_SellLevel && RSI[0]>RSI_BuyLevel && RSI[2]<RSI_SellLevel && iClose(Symbol(),TF,1)<MA[1] && ATR[1]>Min_ATR && ATR[1]<Max_ATR &&  Cambia==true && !PositionExcistl(Magic) && !PositionExcist1(Magic))
     {
      //Alert("ok");
      OrderSend(Symbol(),OP_SELL,Lots,MarketInfo(Symbol(),MODE_BID),3,0,MarketInfo(Symbol(),MODE_BID)-(iATR(Symbol(),TF,ATRPeriod,1)*XATR)/2,NULL,Magic,0,clrRed);
      Cambia=false;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool PositionExcist1(int magic)
  {
  
   for(int i=0; i<PositionsTotal(); i++)
     {
      if(!PositionGetTicket(i)!=0)
        continue;
      else{
      if(PositionGetInteger(POSITION_MAGIC)==magic && PositionGetSymbol(i)==Symbol())
         return(true);
      }
     }
   return(false);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime ConvertTF()
  {
   if(TF==PERIOD_M1)
      return 60*60;
   if(TF==PERIOD_M5)
      return 60*60*5;
   if(TF==PERIOD_M15)
      return 60*60*5*3;
   if(TF==PERIOD_M30)
      return 60*60*5*3*2;
   if(TF==PERIOD_H1)
      return 60*60*5*3*4;
   if(TF==PERIOD_H4)
      return 60*60*5*3*16;
   if(TF==PERIOD_D1)
      return 60*60*5*3*16*6;
   if(TF==PERIOD_MN1)
      return 60*60*5*3*16*6*30;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TpHit()
  {
   if(MarketInfo(Symbol(),MODE_ASK)>=TakeProfitB || MarketInfo(Symbol(),MODE_BID)<=TakeProfitS)
     {
      // Alert("SA");
      ClosAll();
     }
  }

//New Candle
bool aNewBarEVENT()
  {
   static  int anAlreadyObservedBarCOUNT = EMPTY;    // .INIT
   if(Bars > anAlreadyObservedBarCOUNT)              // .TEST
     {
      anAlreadyObservedBarCOUNT = Bars;     // .UPD
      return(true);                         // .ACK
     }
   return(false);                                    // .NACK
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ObjDelete(const long   chart_ID=0,       // chart's ID
               const string name="Rectangle") // line name
  {
//--- reset the error value
   ResetLastError();
//--- delete a trend line
   if(!ObjectDelete(chart_ID,name))
     {
      Print(__FUNCTION__,
            ": failed to delete a trend line! Error code = ",GetLastError());
      return(false);
     }
//--- successful execution
   return(true);
  }


//+------------------------------------------------------------------+
//| return error description
//+------------------------------------------------------------------+
string ErrorDescription(int error_code)
  {
   string error_string;

//---
   switch(error_code)
     {
      //--- codes returned from trade server
      case 0:
         error_string="no error";
         break;
      case 1:
         error_string="no error, trade conditions not changed";
         break;
      case 2:
         error_string="common error";
         break;
      case 3:
         error_string="invalid trade parameters";
         break;
      case 4:
         error_string="trade server is busy";
         break;
      case 5:
         error_string="old version of the client terminal";
         break;
      case 6:
         error_string="no connection with trade server";
         break;
      case 7:
         error_string="not enough rights";
         break;
      case 8:
         error_string="too frequent requests";
         break;
      case 9:
         error_string="malfunctional trade operation (never returned error)";
         break;
      case 64:
         error_string="account disabled";
         break;
      case 65:
         error_string="invalid account";
         break;
      case 128:
         error_string="trade timeout";
         break;
      case 129:
         error_string="invalid price";
         break;
      case 130:
         error_string="invalid stops";
         break;
      case 131:
         error_string="invalid trade volume";
         break;
      case 132:
         error_string="market is closed";
         break;
      case 133:
         error_string="trade is disabled";
         break;
      case 134:
         error_string="not enough money";
         break;
      case 135:
         error_string="price changed";
         break;
      case 136:
         error_string="off quotes";
         break;
      case 137:
         error_string="broker is busy (never returned error)";
         break;
      case 138:
         error_string="requote";
         break;
      case 139:
         error_string="order is locked";
         break;
      case 140:
         error_string="long positions only allowed";
         break;
      case 141:
         error_string="too many requests";
         break;
      case 145:
         error_string="modification denied because order is too close to market";
         break;
      case 146:
         error_string="trade context is busy";
         break;
      case 147:
         error_string="expirations are denied by broker";
         break;
      case 148:
         error_string="amount of open and pending orders has reached the limit";
         break;
      case 149:
         error_string="hedging is prohibited";
         break;
      case 150:
         error_string="prohibited by FIFO rules";
         break;

      //--- mql4 errors
      case 4000:
         error_string="no error (never generated code)";
         break;
      case 4001:
         error_string="wrong function pointer";
         break;
      case 4002:
         error_string="array index is out of range";
         break;
      case 4003:
         error_string="no memory for function call stack";
         break;
      case 4004:
         error_string="recursive stack overflow";
         break;
      case 4005:
         error_string="not enough stack for parameter";
         break;
      case 4006:
         error_string="no memory for parameter string";
         break;
      case 4007:
         error_string="no memory for temp string";
         break;
      case 4008:
         error_string="non-initialized string";
         break;
      case 4009:
         error_string="non-initialized string in array";
         break;
      case 4010:
         error_string="no memory for array\' string";
         break;
      case 4011:
         error_string="too long string";
         break;
      case 4012:
         error_string="remainder from zero divide";
         break;
      case 4013:
         error_string="zero divide";
         break;
      case 4014:
         error_string="unknown command";
         break;
      case 4015:
         error_string="wrong jump (never generated error)";
         break;
      case 4016:
         error_string="non-initialized array";
         break;
      case 4017:
         error_string="dll calls are not allowed";
         break;
      case 4018:
         error_string="cannot load library";
         break;
      case 4019:
         error_string="cannot call function";
         break;
      case 4020:
         error_string="expert function calls are not allowed";
         break;
      case 4021:
         error_string="not enough memory for temp string returned from function";
         break;
      case 4022:
         error_string="system is busy (never generated error)";
         break;
      case 4023:
         error_string="dll-function call critical error";
         break;
      case 4024:
         error_string="internal error";
         break;
      case 4025:
         error_string="out of memory";
         break;
      case 4026:
         error_string="invalid pointer";
         break;
      case 4027:
         error_string="too many formatters in the format function";
         break;
      case 4028:
         error_string="parameters count is more than formatters count";
         break;
      case 4029:
         error_string="invalid array";
         break;
      case 4030:
         error_string="no reply from chart";
         break;
      case 4050:
         error_string="invalid function parameters count";
         break;
      case 4051:
         error_string="invalid function parameter value";
         break;
      case 4052:
         error_string="string function internal error";
         break;
      case 4053:
         error_string="some array error";
         break;
      case 4054:
         error_string="incorrect series array usage";
         break;
      case 4055:
         error_string="custom indicator error";
         break;
      case 4056:
         error_string="arrays are incompatible";
         break;
      case 4057:
         error_string="global variables processing error";
         break;
      case 4058:
         error_string="global variable not found";
         break;
      case 4059:
         error_string="function is not allowed in testing mode";
         break;
      case 4060:
         error_string="function is not confirmed";
         break;
      case 4061:
         error_string="send mail error";
         break;
      case 4062:
         error_string="string parameter expected";
         break;
      case 4063:
         error_string="integer parameter expected";
         break;
      case 4064:
         error_string="double parameter expected";
         break;
      case 4065:
         error_string="array as parameter expected";
         break;
      case 4066:
         error_string="requested history data is in update state";
         break;
      case 4067:
         error_string="internal trade error";
         break;
      case 4068:
         error_string="resource not found";
         break;
      case 4069:
         error_string="resource not supported";
         break;
      case 4070:
         error_string="duplicate resource";
         break;
      case 4071:
         error_string="cannot initialize custom indicator";
         break;
      case 4072:
         error_string="cannot load custom indicator";
         break;
      case 4073:
         error_string="no history data";
         break;
      case 4074:
         error_string="not enough memory for history data";
         break;
      case 4075:
         error_string="not enough memory for indicator";
         break;
      case 4099:
         error_string="end of file";
         break;
      case 4100:
         error_string="some file error";
         break;
      case 4101:
         error_string="wrong file name";
         break;
      case 4102:
         error_string="too many opened files";
         break;
      case 4103:
         error_string="cannot open file";
         break;
      case 4104:
         error_string="incompatible access to a file";
         break;
      case 4105:
         error_string="no order selected";
         break;
      case 4106:
         error_string="unknown symbol";
         break;
      case 4107:
         error_string="invalid price parameter for trade function";
         break;
      case 4108:
         error_string="invalid ticket";
         break;
      case 4109:
         error_string="trade is not allowed in the expert properties";
         break;
      case 4110:
         error_string="longs are not allowed in the expert properties";
         break;
      case 4111:
         error_string="shorts are not allowed in the expert properties";
         break;
      case 4200:
         error_string="object already exists";
         break;
      case 4201:
         error_string="unknown object property";
         break;
      case 4202:
         error_string="object does not exist";
         break;
      case 4203:
         error_string="unknown object type";
         break;
      case 4204:
         error_string="no object name";
         break;
      case 4205:
         error_string="object coordinates error";
         break;
      case 4206:
         error_string="no specified subwindow";
         break;
      case 4207:
         error_string="graphical object error";
         break;
      case 4210:
         error_string="unknown chart property";
         break;
      case 4211:
         error_string="chart not found";
         break;
      case 4212:
         error_string="chart subwindow not found";
         break;
      case 4213:
         error_string="chart indicator not found";
         break;
      case 4220:
         error_string="symbol select error";
         break;
      case 4250:
         error_string="notification error";
         break;
      case 4251:
         error_string="notification parameter error";
         break;
      case 4252:
         error_string="notifications disabled";
         break;
      case 4253:
         error_string="notification send too frequent";
         break;
      case 4260:
         error_string="ftp server is not specified";
         break;
      case 4261:
         error_string="ftp login is not specified";
         break;
      case 4262:
         error_string="ftp connect failed";
         break;
      case 4263:
         error_string="ftp connect closed";
         break;
      case 4264:
         error_string="ftp change path error";
         break;
      case 4265:
         error_string="ftp file error";
         break;
      case 4266:
         error_string="ftp error";
         break;
      case 5001:
         error_string="too many opened files";
         break;
      case 5002:
         error_string="wrong file name";
         break;
      case 5003:
         error_string="too long file name";
         break;
      case 5004:
         error_string="cannot open file";
         break;
      case 5005:
         error_string="text file buffer allocation error";
         break;
      case 5006:
         error_string="cannot delete file";
         break;
      case 5007:
         error_string="invalid file handle (file closed or was not opened)";
         break;
      case 5008:
         error_string="wrong file handle (handle index is out of handle table)";
         break;
      case 5009:
         error_string="file must be opened with FILE_WRITE flag";
         break;
      case 5010:
         error_string="file must be opened with FILE_READ flag";
         break;
      case 5011:
         error_string="file must be opened with FILE_BIN flag";
         break;
      case 5012:
         error_string="file must be opened with FILE_TXT flag";
         break;
      case 5013:
         error_string="file must be opened with FILE_TXT or FILE_CSV flag";
         break;
      case 5014:
         error_string="file must be opened with FILE_CSV flag";
         break;
      case 5015:
         error_string="file read error";
         break;
      case 5016:
         error_string="file write error";
         break;
      case 5017:
         error_string="string size must be specified for binary file";
         break;
      case 5018:
         error_string="incompatible file (for string arrays-TXT, for others-BIN)";
         break;
      case 5019:
         error_string="file is directory, not file";
         break;
      case 5020:
         error_string="file does not exist";
         break;
      case 5021:
         error_string="file cannot be rewritten";
         break;
      case 5022:
         error_string="wrong directory name";
         break;
      case 5023:
         error_string="directory does not exist";
         break;
      case 5024:
         error_string="specified file is not directory";
         break;
      case 5025:
         error_string="cannot delete directory";
         break;
      case 5026:
         error_string="cannot clean directory";
         break;
      case 5027:
         error_string="array resize error";
         break;
      case 5028:
         error_string="string resize error";
         break;
      case 5029:
         error_string="structure contains strings or dynamic arrays";
         break;
      default:
         error_string="unknown error";
     }

//---
   return(error_string);
  }


//+------------------------------------------------------------------+
//Bye

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+


//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
