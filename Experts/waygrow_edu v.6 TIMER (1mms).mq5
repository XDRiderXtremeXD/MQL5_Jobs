//+------------------------------------------------------------------+
//|                                                  waygrow_edu.mq5 |
//|                                                    Dariel Iserne |
//|                      https://www.mql5.com/en/users/aeonic/seller |
//+------------------------------------------------------------------+
#property copyright "Dariel Iserne"
#property link      "https://www.mql5.com/en/users/aeonic/seller"
#property version   "1.00"
#include <stderror.mqh>
#include <stdlib.mqh>
#include <Trade\Trade.mqh>
CTrade trade;

input int Filter = 140;
input int MagicNumber = 1;
input string TradeComment = "";
input int StopLoss = 23;
input int Slipagge = 3;
input double MinLots = 0.01;
input double MaxLots = 100000.0;
input double Risk = 60.0;
input double FixedLots = 0.1;
input bool UseMM = true;
input double MaxSpreadPlusCommission = 10000.0;
input int Limit = 20;
input int TrailingStop = 21;
input int MAPeriod = 3;
input ENUM_MA_METHOD MAMethod = 3;
input string TimeFilter = "----------Time Filter";
input int StartHour = 0;
input int StartMinute = 0;
input int EndHour = 23;
input int EndMinute = 59;
int Gi_180 = 0;
double G_pips_184 = 0.0;
int G_digits_192 = 0;
double G_point_196 = 0.0;
double Gi_204;
double Gd_208;
double Gd_216;
double Gd_224;
double Gd_232;
double Gd_240;
double Gd_248;
double Gd_256;
int G_slippage_264 = Slipagge;
bool Gi_268;
double Gd_272;
double Gda_280[30];
int Gi_284 = 0;
string Gs_dummy_288;
string Gs_unused_316 = "";
string Gs_unused_324 = "";
double Gd_336;
double Gd_344;
int G_time_352;
int Gi_356;
int G_datetime_360;
string Gs_364 = "000,000,000";
string Gs_372 = "000,000,255";
int Gi_380;
int Gi_384;
int Gi_388;
int Gi_392 = 40;
double G_timeframe_396 = 240.0;
bool Gi_404 = true;
color G_color_408 = DimGray;
string G_name_412 = "SpreadIndikatorObj";
double Gd_420;
color G_color_428 = Red;
color G_color_432 = DarkGray;
color G_color_436 = SpringGreen;
bool Gi_440 = true;
double G_ihigh_444;
double G_ilow_452;
double Gd_460;
int G_datetime_468;
int ma_high_handle, ma_low_handle;
double ma_high[], ma_low[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   EventSetMillisecondTimer(1);
//---
   int timeframe_8;
   ArrayInitialize(Gda_280, 0);
   G_digits_192 = _Digits;
   G_point_196 = _Point;
   Print("Digits: " + IntegerToString(G_digits_192) + " Point: " + DoubleToString(G_point_196, G_digits_192));
   double lotstep_0 = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_STEP);
   Gi_204 = MathLog(lotstep_0) / MathLog(0.1);
   Gd_208 = MathMax(MinLots, SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN));
   Gd_216 = MathMin(MaxLots, SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MAX));
   Gd_224 = Risk / 100.0;
   Gd_232 = NormalizeDouble(MaxSpreadPlusCommission * G_point_196, G_digits_192 + 1);
   Gd_240 = NormalizeDouble(Limit * G_point_196, G_digits_192);
   Gd_248 = NormalizeDouble(TrailingStop * G_point_196, G_digits_192);
   Gd_256 = NormalizeDouble(G_point_196 * Filter, G_digits_192);
   Gi_268 = false;
   Gd_272 = NormalizeDouble(G_pips_184 * G_point_196, G_digits_192 + 1);
   ma_low_handle=iMA(_Symbol,PERIOD_CURRENT,MAPeriod,Gi_180,MAMethod,PRICE_LOW);
   ma_high_handle=iMA(_Symbol,PERIOD_CURRENT,MAPeriod,Gi_180,MAMethod,PRICE_HIGH);
   trade.SetExpertMagicNumber(MagicNumber);
   trade.SetDeviationInPoints(Slipagge);
   trade.SetTypeFilling(ORDER_FILLING_FOK);
   if(!MQLInfoInteger(MQL_TESTER))
     {
      //f0_8();
      if(Gi_404)
        {
         timeframe_8 = Period();
         switch(timeframe_8)
           {
            case PERIOD_M1:
               G_timeframe_396 = 5;
               break;
            case PERIOD_M5:
               G_timeframe_396 = 15;
               break;
            case PERIOD_M15:
               G_timeframe_396 = 30;
               break;
            case PERIOD_M30:
               G_timeframe_396 = 60;
               break;
            case PERIOD_H1:
               G_timeframe_396 = 240;
               break;
            case PERIOD_H4:
               G_timeframe_396 = 1440;
               break;
            case PERIOD_D1:
               G_timeframe_396 = 10080;
               break;
            case PERIOD_W1:
               G_timeframe_396 = 43200;
               break;
            case PERIOD_MN1:
               G_timeframe_396 = 43200;
           }
        }
      Gd_420 = 0.0001;
      //f0_7();
      //f0_2();
      //f0_0();
      //f0_3();
     }

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   EventKillTimer();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
  }


//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTimer()
  {
//Comment(AccountInfoInteger(ACCOUNT_LEVERAGE));
//---
//int error_8=0;
//string Ls_12;
//int ticket_20=0;
//double price_24=0;
//bool bool_32=0;
//double Ld_36=0;
//double Ld_44=0;
//double price_60=0;
//double Ld_112=0;
//int cmd_188=0;
//int pos_108=0;
//double Ld_196=0;
//double Ld_204=0;
   int error_8;
   string Ls_12;
   int ticket_20;
   double price_24;
   bool bool_32;
   double Ld_36;
   double Ld_44;
   double price_60;
   double Ld_112;
   int cmd_188;
   int pos_108;
   double Ld_196;
   double Ld_204;
   static double price_buystop=0, price_sellstop=0;
   double ihigh_68 = iHigh(NULL, 0, 0);
   double ilow_76 = iLow(NULL, 0, 0);
   CopyBuffer(ma_low_handle,0,0,1,ma_low);
   ArraySetAsSeries(ma_low,true);
   CopyBuffer(ma_high_handle,0,0,1,ma_high);
   ArraySetAsSeries(ma_high,true);
   double Ask=SymbolInfoDouble(_Symbol,SYMBOL_ASK);
   double Bid=SymbolInfoDouble(_Symbol,SYMBOL_BID);
   trade.SetExpertMagicNumber(MagicNumber);
   trade.SetDeviationInPoints(Slipagge);
   trade.SetTypeFilling(ORDER_FILLING_FOK);
   double ima_84 = ma_low[0];
   double ima_92 = ma_high[0];
   double Ld_100 = ima_84 - ima_92;
//if (!Gi_268) {
//   for (pos_108 = HistoryDealsTotal() - 1; pos_108 >= 0; pos_108--) {
//      ulong ticket=HistoryDealGetTicket(pos_108);
//      if(HistoryDealSelect(ticket)!=true) continue;
//      if(HistoryDealGetInteger(ticket,DEAL_ENTRY)==DEAL_ENTRY_OUT){
//         if (HistoryDealGetDouble(ticket,DEAL_PROFIT) != 0.0) {
//            if (HistoryDealGetDouble(ticket,DEAL_CLOSE) != HistoryDealGetDouble(ticket,DEAL_PRICE)) {
//               if (OrderSymbol() == Symbol()) {
//                  Gi_268 = true;
//                  Ld_112 = MathAbs(HistoryDealGetDouble(ticket,DEAL_PROFIT) / (OrderClosePrice() - HistoryDealGetDouble(ticket,DEAL_PRICE)));
//                  Gd_272 = (-HistoryDealGetDouble(ticket,DEAL_COMMISSION)) / Ld_112;
//                  break;
//               }
//            }
//         }
//      }
//   }
//}

   double Ld_120 = Ask - Bid;
   int Li_180=0;
   ArrayCopy(Gda_280, Gda_280, 0, 1, 29);
   ArraySetAsSeries(Gda_280,true);
   Gda_280[29] = Ld_120;
   if(Gi_284 < 30)
      Gi_284++;
   double Ld_128 = 0;
   pos_108 = 29;
   for(int count_136 = 0; count_136 < Gi_284; count_136++)
     {
      Ld_128 += Gda_280[pos_108];
      pos_108--;
     }
   double Ld_140 = Ld_128 / Gi_284;
   double Ld_148 = NormalizeDouble(Ask + Gd_272, G_digits_192);
   double Ld_156 = NormalizeDouble(Bid - Gd_272, G_digits_192);
   double Ld_164 = NormalizeDouble(Ld_140 + Gd_272, G_digits_192 + 1);
   double Ld_172 = ihigh_68 - ilow_76;
   if(Ld_172 > Gd_256)
     {
      if(Bid < ima_84)
         Li_180 = -1;
      else
         if(Bid > ima_92)
            Li_180 = 1;
     }//Comment(Ld_172 > Gd_256);
   int count_184 = 0;
   for(int pos_1089 = 0; pos_1089 < PositionsTotal(); pos_1089++)
     {
      ulong ticket=PositionGetTicket(pos_1089);
      if(PositionSelectByTicket(ticket))
        {
         if(PositionGetInteger(POSITION_MAGIC) == MagicNumber)
           {
            cmd_188 = PositionGetInteger(POSITION_TYPE);
            //if (cmd_188 == ORDER_TYPE_BUY_LIMIT || cmd_188 == ORDER_TYPE_SELL_LIMIT) continue;
            if(PositionGetString(POSITION_SYMBOL) == _Symbol)
              {
               count_184++;
               switch(cmd_188)
                 {
                  case POSITION_TYPE_BUY:
                     if(TrailingStop < 0)
                        break;
                     Ld_44 = NormalizeDouble(PositionGetDouble(POSITION_SL), G_digits_192);
                     price_60 = NormalizeDouble(Bid - Gd_248, G_digits_192);
                     if(!((Ld_44 == 0.0 || price_60 > Ld_44)))
                        break;
                     bool_32 = trade.PositionModify(ticket,price_60,PositionGetDouble(POSITION_TP));
                     if(!(!bool_32))
                        break;
                     error_8 = GetLastError();
                     Ls_12 = ErrorDescription(error_8);
                     Print("BUY Modify Error Code: " + error_8 + " Message: " + Ls_12 + " OP: " + DoubleToString(price_24, G_digits_192) + " SL: " + DoubleToString(price_60, G_digits_192) +
                           " Bid: " + DoubleToString(Bid, G_digits_192) + " Ask: " + DoubleToString(Ask, G_digits_192));
                     break;
                  case POSITION_TYPE_SELL:
                     if(TrailingStop < 0)
                        break;
                     Ld_44 = NormalizeDouble(PositionGetDouble(POSITION_SL), G_digits_192);
                     price_60 = NormalizeDouble(Ask + Gd_248, G_digits_192);
                     if(!((Ld_44 == 0.0 || price_60 < Ld_44)))
                        break;
                     bool_32 = trade.PositionModify(ticket,price_60,PositionGetDouble(POSITION_TP));
                     if(!(!bool_32))
                        break;
                     error_8 = GetLastError();
                     Ls_12 = ErrorDescription(error_8);
                     Print("SELL Modify Error Code: " + error_8 + " Message: " + Ls_12 + " OP: " + DoubleToString(price_24, G_digits_192) + " SL: " + DoubleToString(price_60, G_digits_192) +
                           " Bid: " + DoubleToString(Bid, G_digits_192) + " Ask: " + DoubleToString(Ask, G_digits_192));
                     break;
                 }
              }
           }
        }
     }
   for(int pos_1088 = 0; pos_1088 < OrdersTotal(); pos_1088++)
     {
      ulong ticket=OrderGetTicket(pos_1088);
      if(OrderSelect(ticket))
        {
         if(OrderGetInteger(ORDER_MAGIC) == MagicNumber)
           {
            cmd_188 = OrderGetInteger(ORDER_TYPE);
            if(cmd_188 == ORDER_TYPE_BUY_LIMIT || cmd_188 == ORDER_TYPE_SELL_LIMIT)
               continue;
            if(OrderGetString(ORDER_SYMBOL) == _Symbol)
              {
               count_184++;
               switch(cmd_188)
                 {
                  case ORDER_TYPE_BUY_STOP:
                     Ld_36 = NormalizeDouble(OrderGetDouble(ORDER_PRICE_OPEN), G_digits_192);
                     price_24 = NormalizeDouble(Ask + Gd_240, G_digits_192);
                     if(!((price_24 < Ld_36)))
                        break;
                     price_60 = NormalizeDouble(price_24 - StopLoss * _Point, G_digits_192);
                     bool_32 = trade.OrderModify(ticket,price_24,price_60,OrderGetDouble(ORDER_TP),ORDER_TIME_DAY,0);//Comment(bool_32);
                     //bool_32 = OrderModify(OrderTicket(), price_24, price_60, OrderTakeProfit(), 0, Lime);
                     if(!(!bool_32))
                        break;
                     error_8 = GetLastError();
                     Ls_12 = ErrorDescription(error_8);
                     Print("BUYSTOP Modify Error Code: " + error_8 + " Message: " + Ls_12 + " OP: " + DoubleToString(price_24, G_digits_192) + " SL: " + DoubleToString(price_60, G_digits_192) +
                           " Bid: " + DoubleToString(Bid, G_digits_192) + " Ask: " + DoubleToString(Ask, G_digits_192));
                     break;
                  case ORDER_TYPE_SELL_STOP:
                     Ld_36 = NormalizeDouble(OrderGetDouble(ORDER_PRICE_OPEN), G_digits_192);
                     price_24 = NormalizeDouble(Bid - Gd_240, G_digits_192);
                     if(!((price_24 > Ld_36)))
                        break;
                     price_60 = NormalizeDouble(price_24 + StopLoss * _Point, G_digits_192);
                     bool_32 = trade.OrderModify(ticket,price_24,price_60,OrderGetDouble(ORDER_TP),ORDER_TIME_DAY,0);//Comment(bool_32);
                     //bool_32 = OrderModify(OrderTicket(), price_24, price_60, OrderTakeProfit(), 0, Orange);
                     if(!(!bool_32))
                        break;
                     error_8 = GetLastError();
                     Ls_12 = ErrorDescription(error_8);
                     Print("SELLSTOP Modify Error Code: " + error_8 + " Message: " + Ls_12 + " OP: " + DoubleToString(price_24, G_digits_192) + " SL: " + DoubleToString(price_60, G_digits_192) +
                           " Bid: " + DoubleToString(Bid, G_digits_192) + " Ask: " + DoubleToString(Ask, G_digits_192));
                 }
              }
           }
        }
     }

   if(count_184 == 0 && Li_180 != 0 && Ld_164 <= Gd_232 && f0_4())
     {
      Ld_196 = AccountInfoDouble(ACCOUNT_BALANCE) * AccountInfoInteger(ACCOUNT_LEVERAGE) * Gd_224;//Comment(Ld_196);
      if(!UseMM)
         Ld_196 = FixedLots;
      Ld_204 = NormalizeDouble(Ld_196 / SymbolInfoDouble(_Symbol, SYMBOL_TRADE_CONTRACT_SIZE), Gi_204);
      Ld_204 = MathMax(Gd_208, Ld_204);
      Ld_204 = MathMin(Gd_216, Ld_204);
      if(Li_180 < 0)
        {
         price_24 = NormalizeDouble(Ask + Gd_240, G_digits_192);
         price_60 = NormalizeDouble(price_24 - StopLoss * _Point, G_digits_192);//Comment(MathAbs(price_60-price_24));
         price_buystop=price_24;
         ticket_20=trade.BuyStop(Ld_204,price_24,_Symbol,price_60,0,ORDER_TIME_DAY,0,TradeComment);
         //ticket_20 = OrderSend(Symbol(), OP_BUYSTOP, Ld_204, price_24, G_slippage_264, price_60, 0, TradeComment, MagicNumber, 0, Lime);
         //double precio_de_entrada_buystop=0; if(PositionSelectByTicket(PositionGetTicket(PositionsTotal()-1))){ precio_de_entrada_buystop=PositionGetDouble(POSITION_PRICE_OPEN);}
         //Print("Queria que abriese en ",Ask," y abrio en ",precio_de_entrada_buystop,", ",MathAbs(Ask-precio_de_entrada_buystop), " puntos de diferencia");
         if(ticket_20 <= 0)
           {
            error_8 = GetLastError();
            Ls_12 = ErrorDescription(error_8);
            Print("BUYSTOP Send Error Code: " + error_8 + " Message: " + Ls_12 + " LT: " + DoubleToString(Ld_204, Gi_204) + " OP: " + DoubleToString(price_24, G_digits_192) + " SL: " +
                  DoubleToString(price_60, G_digits_192) + " Bid: " + DoubleToString(Bid, G_digits_192) + " Ask: " + DoubleToString(Ask, G_digits_192));
           }
        }
      else
        {
         price_24 = NormalizeDouble(Bid - Gd_240, G_digits_192);
         price_60 = NormalizeDouble(price_24 + StopLoss * _Point, G_digits_192);//Comment(MathAbs(price_60-price_24));
         price_sellstop=price_24;
         ticket_20=trade.SellStop(Ld_204,price_24,_Symbol,price_60,0,ORDER_TIME_DAY,0,TradeComment);
         //ticket_20 = OrderSend(Symbol(), OP_SELLSTOP, Ld_204, price_24, G_slippage_264, price_60, 0, TradeComment, MagicNumber, 0, Orange);
         //double precio_de_entrada_sellstop=0; if(PositionSelectByTicket(PositionGetTicket(PositionsTotal()-1))){ precio_de_entrada_sellstop=PositionGetDouble(POSITION_PRICE_OPEN);}
         //Print("Queria que abriese en ",Bid," y abrio en ",precio_de_entrada_sellstop,", ",MathAbs(price_24-precio_de_entrada_sellstop), " puntos de diferencia");
         if(ticket_20 <= 0)
           {
            error_8 = GetLastError();
            Ls_12 = ErrorDescription(error_8);
            Print("BUYSELL Send Error Code: " + error_8 + " Message: " + Ls_12 + " LT: " + DoubleToString(Ld_204, Gi_204) + " OP: " + DoubleToString(price_24, G_digits_192) + " SL: " +
                  DoubleToString(price_60, G_digits_192) + " Bid: " + DoubleToString(Bid, G_digits_192) + " Ask: " + DoubleToString(Ask, G_digits_192));
           }
        }
     }
   string Ls_212 = "AvgSpread:" + DoubleToString(Ld_140, G_digits_192) + "  Commission rate:" + DoubleToString(Gd_272, G_digits_192 + 1) + "  Real avg. spread:" + DoubleToString(Ld_164,
                   G_digits_192 + 1);
   if(Ld_164 > Gd_232)
     {
      Ls_212 = Ls_212
               + "\n"
               + "The EA can not run with this spread ( " + DoubleToString(Ld_164, G_digits_192 + 1) + " > " + DoubleToString(Gd_232, G_digits_192 + 1) + " )";
     }
//if (count_184 != 0 || Li_180 != 0) {OrderGetInteger(OR)
//}
//if (!IsTesting()) {
//   f0_2();
//   f0_7();
//   f0_0();
//   f0_3();
//   f0_8();
//}
//if(PositionsTotal()>0){
//   if(PositionSelectByTicket(PositionGetTicket(PositionsTotal()-1))){
//      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY){
//         double precio_de_entrada_buy=0; if(PositionSelectByTicket(PositionGetTicket(PositionsTotal()-1))){ precio_de_entrada_buy=PositionGetDouble(POSITION_PRICE_OPEN);}
//         Comment("Queria que abriese en ",price_buystop," y abrio en ",precio_de_entrada_buy,", ",MathAbs(price_buystop-precio_de_entrada_buy), " puntos de diferencia");}
//      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL){
//         double precio_de_entrada_sell=0; if(PositionSelectByTicket(PositionGetTicket(PositionsTotal()-1))){ precio_de_entrada_sell=PositionGetDouble(POSITION_PRICE_OPEN);}
//         Comment("Queria que abriese en ",price_sellstop," y abrio en ",precio_de_entrada_sell,", ",MathAbs(price_sellstop-precio_de_entrada_sell), " puntos de diferencia");}}}
//Comment("\n\n\n\n\n",HistoryDealGetDouble(HistoryDealGetTicket(HistoryDealsTotal()-1),DEAL_SWAP));
//if(PositionsTotal()>0){
//   if(PositionSelectByTicket(PositionGetTicket(PositionsTotal()-1))){
//      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY){
//         double SL_Buy=0; if(PositionSelectByTicket(PositionGetTicket(PositionsTotal()-1))){ SL_Buy=PositionGetDouble(POSITION_SL);}
//         //Comment("\n\n\n\n\n",MathAbs(Ask-SL_Buy));}
//         Comment("Ask    ",Ask,"\nSL_Buy    ",SL_Buy,"\nDiferencia    ",MathAbs(Ask-SL_Buy));}
//      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL){
//         double SL_Sell=0; if(PositionSelectByTicket(PositionGetTicket(PositionsTotal()-1))){ SL_Sell=PositionGetDouble(POSITION_SL);}
//         //Comment("\n\n\n\n\n",MathAbs(Bid-SL_Sell));}}}
//         Comment("Bid    ",Bid,"\nSL_Sell    ",SL_Sell,"\nDiferencia    ",MathAbs(Bid-SL_Sell));}}}
   HistorySelect(0,TimeCurrent());
   double ldProfit=0,ldComission=0,ldSwap=0;
//for(int j=HistoryDealsTotal()-1; j>0 && !(profit==0 && percent==0); j--){
   ulong ticket=HistoryDealGetTicket(HistoryDealsTotal()-1);
   if(HistoryDealGetInteger(ticket,DEAL_ENTRY)==DEAL_ENTRY_OUT)
     {
      ldProfit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
      ldComission=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
      ldSwap=HistoryDealGetDouble(ticket,DEAL_SWAP);
     }
   Comment("Balance  ",AccountInfoDouble(ACCOUNT_BALANCE),"\nEquity  ",AccountInfoDouble(ACCOUNT_EQUITY),"\nMarginFree  ",AccountInfoDouble(ACCOUNT_MARGIN_FREE),
           "\nApalancamiento  ",AccountInfoInteger(ACCOUNT_LEVERAGE),"\nSpread  ",SymbolInfoInteger(_Symbol,SYMBOL_SPREAD),"\nComission Last Order  ",ldComission,"\nSwap Last Order  ",ldSwap,
           "\nProfit Last Order  ",ldProfit);

  }
//+------------------------------------------------------------------+
int f0_4()
  {
   MqlDateTime time;
   TimeCurrent(time);
   if((time.hour > StartHour && time.hour < EndHour) || (time.hour == StartHour && time.min >= StartMinute) || (time.hour == EndHour && time.min < EndMinute))
      return (1);
   return (0);
  }
//+------------------------------------------------------------------+
