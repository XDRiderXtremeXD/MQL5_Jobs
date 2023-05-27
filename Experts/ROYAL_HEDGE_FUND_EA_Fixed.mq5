//+------------------------------------------------------------------+
//|                                    ROYAL_HEDGE_FUND_EA_Fixed.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Trade\AccountInfo.mqh>
CAccountInfo AInfo;

#include<Trade\Trade.mqh>
CTrade trade;

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12pm=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

extern string title6 = "GENERAL SETTINGS"; // General Settings
extern int MagicNumber = 12345; // Magic Number
extern int Slippage = 1;
extern string Comentario="Royal Hedge";
extern string title1 = "TIME SETTINGS"; // Time Setting
extern int Secs = 60; // ORDER MODIFICATIONS (Should be same as TF)
extern string title2 = "MONEY MANAGEMENT"; // MONEY MANAGEMENT
extern double FixedLot = 0.01; // Fixed Lots 0.0 = MM
extern double RiskPercent; // Risk MM%
extern string title3 = "TRADE SETTING IN POINTS"; // TRADE SETTINGS
extern double Delta = 0.5; // ORDER DISTANCE
extern double MaxDistance = 7; // THETA (inhibition of order range)
extern double Stop = 10; // Stop Loss size
extern double MaxTrailing = 4; // COS (Inhibition of Trailing Range)
extern int MaxSpread = 5555; // Max Spread Limit
input string S1_31="|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|   HORARIO OPERAR  |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|";//---------------------------------------
input ENUM_Horas HoraInicioOperar=_12pm;
input uchar MinutoInicioOperar=30;
input ENUM_Horas HoraFinalOperar=_9pm;
input uchar MinutoFinalOperar=30;
input string STSS_="|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|              LIMITADORES            |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|";//----------
input string SS_="Si se pone en 0 se desactiva limitador";//......................................
input double Ganancia_Limitador_Porcentaje_Diario=0;//Ganancia Limitador Porcentaje DIARIO
input double Ganancia_Limitador_Porcentaje_Mensual=10;//Ganancia Limitador Porcentaje MENSUAL
input double Perdida_Limitador_Porcentaje_Diario=5;//Perdida Limitador Porcentaje DIARIO
input double Perdida_Limitador_Porcentaje_Mensual=0;//Perdida Limitador Porcentaje MENSUAL

bool Diario=true;
bool Mensual=true;

int HistoryAnterior=0;
string ComentarioLimitador="";
double BalanceMes=0;
double BalanceDia=0;


int returned_i;
bool Gb_0000;
double Id_0038;
double Ind_000;
double Id_0040;
double Id_0030;
int Ii_009C;
double Id_01C0;
double Id_00F0;
double Id_0068;
double Id_0100;
double Id_0070;
double Id_0110;
double Id_0060;
int Ii_00A0;
double Id_01B8;
int Ii_0098;
double Id_0140;
double Id_00B0;
double Id_00B8;
double Id_00A8;
double Id_0130;
int Ii_0084;
int Gi_0000;
double Ind_004;
double Id_0138;
int Ii_0088;
double Gd_0000;
double Id_00C8;
double Id_0120;
int Ii_0000;
int Ii_0080;
int Ii_0028;
int Gi_0021;
double Gd_0001;
double Id_0128;
bool Gb_0001;
double Ind_002;
double Id_00C0;
double Gd_0002;
double Gd_0003;
int Gi_0001;
bool returned_b;
double Id_00D0;
int Gi_0002;
int Ii_004C;
double Gd_0004;
double Gd_0005;
double Id_0108;
double Gd_0006;
double Id_00E0;
double Id_00F8;
double Id_00E8;
double Id_0170;
double Id_0178;
double Gd_0007;
double Id_00D8;
long returned_l;
int Ii_007C;
bool Gb_0007;
bool Gb_000D;
bool Gb_002F;
int Gi_002F;
int Ii_0094;
int Ii_002C;
bool Gb_0030;
double Gd_0030;
bool Gb_0032;
int Gi_0032;
double Gd_0034;
double Gd_0035;
double Id_0160;
string Is_0008;
int Ii_008C;
bool Gb_0035;
int Gi_0035;
bool Gb_0036;
double Gd_0036;
bool Gb_0038;
int Gi_0038;
double Gd_003A;
double Gd_003B;
double Id_0168;
int Ii_0090;
bool Gb_0037;
double Gd_0037;
double Gd_0038;
double Gd_0039;
bool Gb_0031;
double Gd_0031;
double Gd_0032;
double Gd_0033;
int Gi_000E;
int Ii_0024;
bool Gb_000E;
double Gd_000E;
bool Gb_000F;
int Gi_000F;
double Gd_0010;
double Gd_0011;
bool Gb_0013;
int Gi_0011;
double Gd_0012;
double Gd_0013;
int Gi_0008;
bool Gb_0008;
double Gd_0008;
bool Gb_0009;
int Gi_0009;
double Gd_000A;
double Gd_000B;
int Gi_000B;
double Gd_000C;
double Gd_000D;
double Gd_0021;
double Gd_0022;
double Gd_0023;
double Gd_0024;
double Gd_0025;
double Gd_0026;
bool Gb_0027;
double Gd_0027;
double Gd_002D;
double Id_0118;
double Gd_002F;
double Gd_0028;
double Gd_0029;
double Gd_002A;
double Gd_002B;
bool Gb_002C;
double Gd_002C;
double Gd_002E;
double Gd_0014;
double Gd_0015;
double Gd_0016;
double Gd_0017;
double Gd_0018;
bool Gb_0019;
double Gd_0019;
double Gd_001F;
bool Gb_0021;
double Gd_001A;
double Gd_001B;
double Gd_001C;
double Gd_001D;
bool Gb_001E;
double Gd_001E;
double Gd_0020;
string Is_0018;
int Ii_0048;
long Il_0050;
int Ii_0058;
bool Ib_0078;
double Id_0148;
double Id_0150;
double Id_0158;
double Id_0180[];
double returned_double;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   Diario=true;
   Mensual=true;
   int Li_FFFC;

   Ii_0000 = 0;
   Is_0008 = "";
   Is_0018 = "TICK SETTINGS";
   Ii_0024 = 2;
   Ii_0028 = 30;
   Ii_002C = 0;
   Id_0030 = 3;
   Id_0038 = 0.5;
   Id_0040 = 7.5;
   Ii_0048 = 1;
   Ii_004C = 0;
   Il_0050 = 7346597700;
   Ii_0058 = 0;
   Id_0060 = 0;
   Id_0068 = 0;
   Id_0070 = 0;
   Ib_0078 = true;
   Ii_007C = 0;
   Ii_0080 = 0;
   Ii_0084 = 0;
   Ii_0088 = 0;
   Ii_008C = 0;
   Ii_0090 = 0;
   Ii_0094 = 0;
   Ii_0098 = 0;
   Ii_009C = 0;
   Ii_00A0 = 0;
   Id_00A8 = 0;
   Id_00B0 = 0;
   Id_00B8 = 0;
   Id_00C0 = 0;
   Id_00C8 = 0;
   Id_00D0 = 0;
   Id_00D8 = 0;
   Id_00E0 = 0;
   Id_00E8 = 0;
   Id_00F0 = 0;
   Id_00F8 = 0;
   Id_0100 = 0;
   Id_0108 = 0;
   Id_0110 = 0;
   Id_0118 = 0;
   Id_0120 = 0;
   Id_0128 = 0;
   Id_0130 = 0;
   Id_0138 = 0;
   Id_0140 = 0;
   Id_0148 = 0;
   Id_0150 = 0;
   Id_0158 = 0;
   Id_0160 = 0;
   Id_0168 = 0;
   Id_0170 = 0;
   Id_0178 = 0;
   Id_01B8 = 0;
   Id_01C0 = 0;

   if((Id_0038 > Delta))
     {
      Delta = (Id_0038 + 0.1);
     }
   if((MaxTrailing > Id_0040))
     {
      Id_0040 = (MaxTrailing + 0.1);
     }
   if((Id_0030 < 1))
     {
      Id_0030 = 1;
     }
   Ii_009C = 0;
   Id_01C0 = 0;
   Id_00F0 = Id_0068;
   Id_0100 = Id_0070;
   Id_0110 = Id_0060;
   Ii_00A0 = _Digits;
   Id_01B8 = _Point;
   Ii_0098 =(int)AccountInfoInteger(ACCOUNT_LEVERAGE);
   Id_0140 = SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_STEP);
   Id_00B0 = SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MAX);
   Id_00B8 = SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MIN);
   Id_00A8 = (SymbolInfoDouble(_Symbol, SYMBOL_MARGIN_INITIAL) * Id_00B8);
   Id_0130 = 0;
   Ii_0084 = (int)SymbolInfoInteger(_Symbol, SYMBOL_TRADE_STOPS_LEVEL);
   if(Ii_0084 > 0)
     {
      Gi_0000 = Ii_0084 + 1;
      Id_0130 = (Gi_0000 * _Point);
     }
   Id_0138 = 0;
   Ii_0088 = (int)SymbolInfoInteger(_Symbol, SYMBOL_TRADE_FREEZE_LEVEL);
   if(Ii_0088 > 0)
     {
      Gi_0000 = Ii_0088 + 1;
      Id_0138 = (Gi_0000 * _Point);
     }
   if(Ii_0084 > 0 || Ii_0088 > 0)
     {

      Print("WARNING! Broker is not suitable, the stoplevel is greater than zero.");
     }
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);


   Id_00C8 = NormalizeDouble((Ask - Bid), Ii_00A0);
   Id_0120 = Id_00C8;
   if(Ii_0000 == 0)
     {
      Ii_0080 = Ii_0028;
     }
   else
     {
      Ii_0080 = 3;
     }
   ArrayResize(Id_0180, Ii_0080, 0);
   if(Ii_0080 != 0)
     {
      Gi_0000 = Ii_0080;
     }
   Id_0128 = NormalizeDouble((MaxSpread * _Point), Ii_00A0);
   if((FixedLot > 0))
     {
      Gd_0001 = ceil((FixedLot / Id_0140));
      Id_00C0 = (Gd_0001 * Id_0140);
     }
   else
     {
      if((Id_00A8 > 0))
        {
         Gd_0001 = Id_00B8;
         Gd_0002 = (((RiskPercent / 100) * AccountInfoDouble(ACCOUNT_BALANCE)) * Id_00B8);
         Gd_0002 = NormalizeDouble((Gd_0002 / Id_00A8), 2);
         if(Gd_0002 >= Id_00B0)
           {
            Gd_0003 = Id_00B0;
           }
         else
           {
            Gd_0003 = Gd_0002;
           }
         if(Gd_0003 <= Gd_0001)
           {
            Gd_0002 = Gd_0001;
           }
         else
           {
            Gd_0002 = Gd_0003;
           }
         Id_00C0 = Gd_0002;
        }
     }
   TesterHideIndicators(true);
   Li_FFFC = 0;

   trade.SetExpertMagicNumber(MagicNumber);


   return INIT_SUCCEEDED;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   CierresLIMITADORES();
   Comment(""+((!Diario || !Mensual)?("\n"+ComentarioLimitador):""));
   Funcion();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Comment("");
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Funcion()
  {
   /*int hstTotal=OrdersHistoryTotal();
    static datetime Dia=0,Mes=0;
    datetime diaActual=iTime(Symbol(),PERIOD_D1,0);
    datetime mesActual=iTime(Symbol(),PERIOD_MN1,0);
    static int HistoryAnterior=0;

    if(HistoryAnterior!=hstTotal)
      {
       Diario=GananciaPerdida(diaActual,Ganancia_Limitador_Porcentaje_Diario,Perdida_Limitador_Porcentaje_Diario,"DIARIO");
       Mensual=GananciaPerdida(mesActual,Ganancia_Limitador_Porcentaje_Mensual,Perdida_Limitador_Porcentaje_Mensual,"MENSUAL");
       HistoryAnterior=hstTotal;
      }
    if(Dia!=diaActual)
      {
       Diario=GananciaPerdida(diaActual,Ganancia_Limitador_Porcentaje_Diario,Perdida_Limitador_Porcentaje_Diario,"DIARIO");
       Dia=diaActual;
      }
    if(Mes!=mesActual)
      {
       Mensual=GananciaPerdida(mesActual,Ganancia_Limitador_Porcentaje_Mensual,Perdida_Limitador_Porcentaje_Mensual,"MENSUAL");
       Mes=mesActual;
      }

    if(Mensual && Diario)
       Comment("");
    */

   int Li_FFF8;
   long Li_FFF4;
   int Li_FFF0;
   int Li_FFEC;
   int Li_FFE8;
   int Li_FFE4;
   int Li_FFE0;
   int Li_FFDC;
   int Li_FFD8;
   double Ld_FFD0;
   double Ld_FFC8;
   double Ld_FFC0;
   double Ld_FFB8;
   double Ld_FFB0;
   double Ld_FFA8;
   double Ld_FFA0;
   double Ld_FF98;
   double Ld_FF90;
   double Ld_FF88;
   double Ld_FF80;
   double Ld_FF78;
   double Ld_FF70;
   double Ld_FF68;
   double Ld_FF60;
   double Ld_FF58;
   double Ld_FF50;
   int Li_FF4C;
   int Li_FF48;
   int Li_FFFC;

   Ii_009C = Ii_009C + 1;
   if((Id_01C0 == 0))
     {
      Print("Entra");
      HistorySelect(0,TimeCurrent());
      Gi_0000 = HistoryDealsTotal() - 1;
      Gi_0001 = Gi_0000;
      if(Gi_0000 >= 0)
        {
         double OpenPrice=0;
         double sale_Profit=0;
         double sale_commision=0;
         double sale_Price=0;
         double open_Price=0;
         do
           {
            ulong ticket=0;
            if((ticket=HistoryDealGetTicket(Gi_0001))>0)
              {

               int ID_  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
               int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
               // int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
               double Profit_=HistoryDealGetDouble(ticket,DEAL_PROFIT);
               double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
               double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
               int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
               double Price=HistoryDealGetDouble(ticket,DEAL_PRICE);
               double Commision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
               string Symbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
               //string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
               if(entry==DEAL_ENTRY_IN)
                 {
                  open_Price=Price;
                 }

               if(entry==DEAL_ENTRY_OUT)
                 {
                  sale_Profit=Profit_;
                  sale_commision=Comision;
                  sale_Price=Price;
                 }


               if(sale_Profit!=0 && entry==DEAL_ENTRY_IN)
                 {
                  Gd_0000 = sale_Price;
                  if(Gd_0000 != open_Price && Symbolo == _Symbol)
                    {
                     Gd_0000 = sale_Profit;
                     Gd_0002 = sale_Price;
                     Gd_0002 = fabs(Gd_0002 - open_Price);
                     Id_01C0 = fabs((Gd_0000 / Gd_0002));
                     Gd_0002 = -sale_commision;
                     Id_00D0 = (Gd_0002 / Id_01C0);
                     break;
                    }
                 }
               //}
              }
            Gi_0001 = Gi_0001 - 1;
           }
         while(Gi_0001 >= 0);
        }
     }
   double Ld_FF14[];
   ArrayResize(Ld_FF14, (Ii_0080 - 1), 0);
   ArrayCopy(Ld_FF14, Id_0180, 0, 1, (Ii_0080 - 1));
   ArrayResize(Ld_FF14, Ii_0080, 0);
   Gi_0002 = Ii_0080 - 1;
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   Ld_FF14[Gi_0002] = NormalizeDouble((Ask - Bid), Ii_00A0);
   ArrayCopy(Id_0180, Ld_FF14, 0, 0, 0);
   returned_double = iMAOnArray(Id_0180,Ii_0080, 0, 3, 0);
   Id_00C8 = returned_double;
   Gd_0003 = (Ii_004C * Id_01B8);
   Gd_0004 = (returned_double + Id_00D0);
   if(Gd_0004 <= Gd_0003)
     {
     }
   else
     {
      Gd_0003 = Gd_0004;
     }
   Id_0120 = Gd_0003;
   Gd_0003 = (Gd_0003 * Delta);
   if(Gd_0003 <= Id_0130)
     {
      Gd_0005 = Id_0130;
     }
   else
     {
      Gd_0005 = Gd_0003;
     }
   Id_0108 = Gd_0005;
   Gd_0005 = (Id_0120 * Id_0038);
   if(Gd_0005 <= Id_0138)
     {
      Gd_0006 = Id_0138;
     }
   else
     {
      Gd_0006 = Gd_0005;
     }
   Id_00E0 = Gd_0006;
   Id_00F8 = (Id_0120 * MaxTrailing);
   Id_00E8 = (Id_0120 * Id_0040);
   Id_0170 = (Id_0120 * MaxDistance);
   Id_0178 = (Gd_0006 / Id_0030);
   Gd_0006 = (Id_0120 * Stop);
   if(Gd_0006 <= Id_0130)
     {
      Gd_0007 = Id_0130;
     }
   else
     {
      Gd_0007 = Gd_0006;
     }
   Id_00D8 = Gd_0007;
   ArrayFree(Ld_FF14);
   Li_FFF8 = 0;
   Li_FFF4 = 0;
   Li_FFF0 = (int)TimeCurrent();
   Li_FFEC = 0;
   Li_FFE8 = 0;
   Li_FFE4 = 0;
   Li_FFE0 = 0;
   Li_FFDC = 0;
   Li_FFD8 = 0;
   Ld_FFD0 = 0;
   Ld_FFC8 = 0;
   Ld_FFC0 = 0;
   Ld_FFB8 = 0;
   Ld_FFB0 = 0;
   Ld_FFA8 = 0;
   Ld_FFA0 = 0;
   Ld_FF98 = 0;
   Ld_FF90 = 0;
   Ld_FFA0 = 0;
   Ld_FF88 = 0;
   Ld_FF80 = 0;
   Ld_FF78 = 0;
   Ld_FF70 = 0;
   Ld_FF68 = 0;
   Ld_FF60 = 0;
   Ld_FF58 = 99999;
   Ld_FF50 = 0;
   Li_FF4C =  PositionsTotal() - 1;
   if(Li_FF4C >= 0)
     {
      do
        {
         Ii_007C =(int) PositionGetTicket(Li_FF4C);
         if(Ii_007C>0)
            if(PositionGetString(POSITION_SYMBOL)== _Symbol && PositionGetInteger(POSITION_MAGIC) == MagicNumber)
              {
               Ld_FFC8 = PositionGetDouble(POSITION_SL);
               Ld_FFB8 =PositionGetDouble(POSITION_PRICE_OPEN);
               Ld_FFC0 = PositionGetDouble(POSITION_TP);
               Li_FFF4 =(long) PositionGetInteger(POSITION_TICKET);
               Ld_FFD0 = PositionGetDouble(POSITION_VOLUME);
               double openPrice = PositionGetDouble(POSITION_PRICE_OPEN);
               double orderLots = PositionGetDouble(POSITION_VOLUME);
               returned_i =(int) PositionGetInteger(POSITION_TYPE);
               //if(returned_i <= 5)
               //{
               /* if(returned_i == 4)
                  {

                   Li_FFEC = Li_FFEC + 1;
                   Li_FFDC = Li_FFDC + 1;
                  }
                if(returned_i == 5)
                  {

                   Li_FFE8 = Li_FFE8 + 1;
                   Li_FFD8 = Li_FFD8 + 1;
                  }*/
               if(returned_i == POSITION_TYPE_BUY)
                 {

                  Li_FFE4 = Li_FFE4 + 1;
                  if(Ld_FFC8 == 0 || (Ld_FFC8 > 0 && Ld_FFC8 < Ld_FFB8))
                    {

                     Li_FFDC = Li_FFDC + 1;
                    }
                  Id_0160 = Ld_FFC8;
                  Gd_0007 = openPrice;
                  Ld_FF88 = ((Gd_0007 * orderLots) + Ld_FF88);
                  Ld_FF80 = (Ld_FF80 + orderLots);
                  if((openPrice < Ld_FF58))
                    {
                     Ld_FF58 = openPrice;
                    }
                 }
               if(returned_i == POSITION_TYPE_SELL)
                 {

                  Li_FFE0 = Li_FFE0 + 1;
                  if(Ld_FFC8 == 0 || (Ld_FFC8 > 0 && Ld_FFC8 > Ld_FFB8))
                    {

                     Li_FFD8 = Li_FFD8 + 1;
                    }
                  Id_0168 = Ld_FFC8;
                  if((openPrice > Ld_FF50))
                    {
                     Ld_FF50 = openPrice;
                    }
                  Gd_0007 = openPrice;
                  Ld_FF78 = ((Gd_0007 * orderLots) + Ld_FF78);
                  Ld_FF70 = (Ld_FF70 + orderLots);
                 }
               // }
              }
         Li_FF4C = Li_FF4C - 1;
        }
      while(Li_FF4C >= 0);
     }



   Li_FF4C =  OrdersTotal() - 1;
   if(Li_FF4C >= 0)
     {
      do
        {
         Ii_007C =(int) OrderGetTicket(Li_FF4C);
         if(Ii_007C>0)
            if(OrderGetString(ORDER_SYMBOL)== _Symbol && OrderGetInteger(ORDER_MAGIC) == MagicNumber)
              {
               returned_i =(int) OrderGetInteger(ORDER_TYPE);
               //if(returned_i <= 5)
               //{
               if(returned_i == ORDER_TYPE_BUY_STOP)
                 {

                  Li_FFEC = Li_FFEC + 1;
                  Li_FFDC = Li_FFDC + 1;
                 }
               if(returned_i == ORDER_TYPE_SELL_STOP)
                 {

                  Li_FFE8 = Li_FFE8 + 1;
                  Li_FFD8 = Li_FFD8 + 1;
                 }
               // }
              }
         Li_FF4C = Li_FF4C - 1;
        }
      while(Li_FF4C >= 0);
     }



   if((Ld_FF80 > 0))
     {
      Ld_FF68 = NormalizeDouble((Ld_FF88 / Ld_FF80), Ii_00A0);
     }
   if((Ld_FF70 > 0))
     {
      Ld_FF60 = NormalizeDouble((Ld_FF78 / Ld_FF70), Ii_00A0);
     }
   Li_FF48 = OrdersTotal() - 1;


   Li_FF48 =  PositionsTotal() - 1;
   if(Li_FF48 >= 0)
     {
      do
        {
         Ii_007C =(int) PositionGetTicket(Li_FF48);
         if(Ii_007C>0)
            if(PositionGetString(POSITION_SYMBOL)== _Symbol && PositionGetInteger(POSITION_MAGIC) == MagicNumber)
              {
               Ld_FFC8 = PositionGetDouble(POSITION_SL);
               Ld_FFB8 =PositionGetDouble(POSITION_PRICE_OPEN);
               Ld_FFC0 = PositionGetDouble(POSITION_TP);
               Li_FFF4 = PositionGetInteger(POSITION_TICKET);
               Ld_FFD0 = PositionGetDouble(POSITION_VOLUME);
               double openPrice = PositionGetDouble(POSITION_PRICE_OPEN);
               double orderLots = PositionGetDouble(POSITION_VOLUME);
               returned_i =(int) PositionGetInteger(POSITION_TYPE);

               if(returned_i == POSITION_TYPE_BUY)
                 {

                  Gd_0013 = ((Bid - Ld_FFB8) + Id_00D0);
                  if(Gd_0013 <= 0)
                    {
                     Gd_0014 = 0;
                    }
                  else
                    {
                     Gd_0014 = Gd_0013;
                    }
                  Ld_FF98 = Gd_0014;
                  Gd_0013 = Id_0130;
                  Gd_0015 = Id_00F8;
                  Gd_0016 = Id_00F0;
                  Gd_0017 = Id_00E8;
                  Gd_0018 = 0;
                  if((Id_00E8 == 0))
                    {
                     Gd_0019 = Id_00F8;
                    }
                  else
                    {
                     Gd_001A = (Gd_0014 - Gd_0018);
                     Gd_001A = (Gd_001A / (Gd_0017 - Gd_0018));
                     Gd_001A = (((Gd_0015 - Gd_0016) * Gd_001A) + Gd_0016);
                     Gd_001B = Gd_001A;
                     Gd_001C = Gd_0015;
                     Gd_001D = Gd_0016;
                     if(Gd_0016 <= Gd_001A)
                       {
                       }
                     else
                       {
                        Gd_001A = Gd_001D;
                       }
                     if(Gd_001A >= Gd_001C)
                       {
                        Gd_001D = Gd_001C;
                       }
                     else
                       {
                        Gd_001D = Gd_001A;
                       }
                     if((Gd_0016 > Gd_0015))
                       {
                        Gd_001E = Gd_0015;
                        Gd_001F = Gd_0016;
                        if(Gd_0016 >= Gd_001B)
                          {
                           Gd_0020 = Gd_001B;
                          }
                        else
                          {
                           Gd_0020 = Gd_001F;
                          }
                        if(Gd_0020 <= Gd_001E)
                          {
                           Gd_001F = Gd_001E;
                          }
                        else
                          {
                           Gd_001F = Gd_0020;
                          }
                        Gd_001D = Gd_001F;
                       }
                     Gd_0019 = Gd_001D;
                    }
                  if(Gd_0019 <= Gd_0013)
                    {
                     Gd_001F = Gd_0013;
                    }
                  else
                    {
                     Gd_001F = Gd_0019;
                    }
                  Id_0118 = Gd_001F;
                  Ld_FFA8 = NormalizeDouble((Bid - Gd_001F), Ii_00A0);
                  Ld_FF90 = ((Ld_FFB8 + Id_00D0) + Id_0100);
                  if(((Bid - Ld_FF90) > Gd_001F))
                    {
                     if(Ld_FFC8 == 0 || ((Bid - Ld_FFC8) > Gd_001F))
                       {

                        if((Ld_FFA8 != Ld_FFC8))
                          {
                           Ii_007C = trade.PositionModify(Li_FFF4, Ld_FFA8, Ld_FFC0);
                          }
                       }
                    }
                 }
               if(returned_i == POSITION_TYPE_SELL)
                 {

                  Gd_0021 = ((Ld_FFB8 - Ask) - Id_00D0);
                  if(Gd_0021 <= 0)
                    {
                     Gd_0022 = 0;
                    }
                  else
                    {
                     Gd_0022 = Gd_0021;
                    }
                  Ld_FF98 = Gd_0022;
                  Gd_0021 = Id_0130;
                  Gd_0023 = Id_00F8;
                  Gd_0024 = Id_00F0;
                  Gd_0025 = Id_00E8;
                  Gd_0026 = 0;
                  if((Id_00E8 == 0))
                    {
                     Gd_0027 = Id_00F8;
                    }
                  else
                    {
                     Gd_0028 = (Gd_0022 - Gd_0026);
                     Gd_0028 = (Gd_0028 / (Gd_0025 - Gd_0026));
                     Gd_0028 = (((Gd_0023 - Gd_0024) * Gd_0028) + Gd_0024);
                     Gd_0029 = Gd_0028;
                     Gd_002A = Gd_0023;
                     Gd_002B = Gd_0024;
                     if(Gd_0024 <= Gd_0028)
                       {
                       }
                     else
                       {
                        Gd_0028 = Gd_002B;
                       }
                     if(Gd_0028 >= Gd_002A)
                       {
                        Gd_002B = Gd_002A;
                       }
                     else
                       {
                        Gd_002B = Gd_0028;
                       }
                     if((Gd_0024 > Gd_0023))
                       {
                        Gd_002C = Gd_0023;
                        Gd_002D = Gd_0024;
                        if(Gd_0024 >= Gd_0029)
                          {
                           Gd_002E = Gd_0029;
                          }
                        else
                          {
                           Gd_002E = Gd_002D;
                          }
                        if(Gd_002E <= Gd_002C)
                          {
                           Gd_002D = Gd_002C;
                          }
                        else
                          {
                           Gd_002D = Gd_002E;
                          }
                        Gd_002B = Gd_002D;
                       }
                     Gd_0027 = Gd_002B;
                    }
                  if(Gd_0027 <= Gd_0021)
                    {
                     Gd_002D = Gd_0021;
                    }
                  else
                    {
                     Gd_002D = Gd_0027;
                    }
                  Id_0118 = Gd_002D;
                  Ld_FFA8 = NormalizeDouble((Ask + Gd_002D), Ii_00A0);
                  Ld_FF90 = ((Ld_FFB8 - Id_00D0) - Id_0100);
                  if(((Ld_FF90 - Ask) > Gd_002D))
                    {
                     if(Ld_FFC8 == 0 || ((Ld_FFC8 - Ask) > Gd_002D))
                       {

                        if((Ld_FFA8 != Ld_FFC8))
                          {
                           Ii_007C = trade.PositionModify(Li_FFF4, Ld_FFA8, Ld_FFC0);
                          }
                       }
                    }
                 }
               // }
              }
         Li_FF48 = Li_FF48 - 1;
        }
      while(Li_FF48 >= 0);
     }





   Li_FF48 =  OrdersTotal() - 1;
   if(Li_FF48 >= 0)
     {
      do
        {
         Ii_007C =(int) OrderGetTicket(Li_FF48);
         if(Ii_007C>0)
            if(OrderGetString(ORDER_SYMBOL)== _Symbol && OrderGetInteger(ORDER_MAGIC) == MagicNumber)
              {
               Ld_FFC8 = OrderGetDouble(ORDER_SL);
               Ld_FFB8 = OrderGetDouble(ORDER_PRICE_OPEN);
               Ld_FFC0 = OrderGetDouble(ORDER_TP);
               Li_FFF4 = OrderGetInteger(ORDER_TICKET);
               returned_i =(int) OrderGetInteger(ORDER_TYPE);
               //if(returned_i <= 5)
               //{
               if(returned_i <= 5)
                 {
                  if(returned_i == ORDER_TYPE_BUY_STOP)
                    {
                     if(Ii_0000 == 0)
                       {
                        Gb_0007 = (Id_0120 > Id_0128);
                        if(EvaluarHorario(HoraInicioOperar,HoraFinalOperar,MinutoInicioOperar,MinutoFinalOperar,TimeCurrent()) && Mensual && Diario)
                          {
                           Gb_0007 = true;
                          }
                        else
                          {
                           Gb_0007 = false;
                          }

                        if(Id_0120 > Id_0128 || !Gb_0007)
                          {
                           Ii_007C = trade.OrderDelete(Li_FFF4);
                          }
                        else
                          {
                           Gi_0008 = Li_FFF0 - Ii_008C;
                           if(Gi_0008 > Secs
                              || (Ii_009C % Ii_0024 == 0 && ((Li_FFE4 < 1 && (Ld_FFB8 - Ask) < Id_00E0) || Ld_FFB8 - Ask < Id_0178 || Ld_FFB8 - Ask > Id_0170)))
                             {

                              if(Li_FFE4 > 0)
                                {
                                 Gd_000A = (Id_0108 / Id_0030);
                                 if(Gd_000A <= Id_0130)
                                   {
                                    Gd_000B = Id_0130;
                                   }
                                 else
                                   {
                                    Gd_000B = Gd_000A;
                                   }
                                 Ld_FFB0 = NormalizeDouble((Ask + Gd_000B), Ii_00A0);
                                 Ld_FFA8 = Id_0160;
                                }
                              else
                                {
                                 Gd_000C = Id_0108;
                                 if(Id_0108 <= Id_0130)
                                   {
                                    Gd_000D = Id_0130;
                                   }
                                 else
                                   {
                                    Gd_000D = Gd_000C;
                                   }
                                 Ld_FFB0 = NormalizeDouble((Ask + Gd_000D), Ii_00A0);
                                 Ld_FFA8 = NormalizeDouble((Ld_FFB0 - Id_00D8), Ii_00A0);
                                }
                              if((Li_FFE4 > 0 && Ld_FFB0 > Ld_FF68)
                                 || Li_FFE4 == 0)
                                {

                                 if((Ld_FFB0 != Ld_FFB8) && ((Ld_FFB8 - Ask) > Id_0138))
                                   {
                                    bool Ii_007C_ = trade.OrderModify(Li_FFF4, Ld_FFB0, Ld_FFA8, Ld_FFA0,ORDER_TIME_GTC,0,0);
                                    if(Ii_007C_==true)
                                      {
                                       Ii_008C = Li_FFF0;
                                      }
                                   }
                                }
                             }
                          }
                       }
                    }
                  if(returned_i == ORDER_TYPE_SELL_STOP)
                    {
                     if(Ii_0000 == 0)
                       {
                        Gb_000D = (Id_0120 > Id_0128);
                        if(EvaluarHorario(HoraInicioOperar,HoraFinalOperar,MinutoInicioOperar,MinutoFinalOperar,TimeCurrent()) && Mensual && Diario)
                          {

                           Gb_000D = true;
                          }
                        else
                          {
                           Gb_000D = false;
                          }

                        if(Id_0120 > Id_0128 || !Gb_000D)
                          {
                           Ii_007C = trade.OrderDelete(Li_FFF4);
                          }
                        else
                          {
                           Gi_000E = Li_FFF0 - Ii_0090;
                           if(Gi_000E > Secs || (Ii_009C % Ii_0024 == 0 && ((Li_FFE0 < 1 && (Bid - Ld_FFB8) < Id_00E0) || Bid - Ld_FFB8 < Id_0178 || Bid - Ld_FFB8 > Id_0170)))
                             {

                              if(Li_FFE0 > 0)
                                {
                                 Gd_0010 = (Id_0108 / Id_0030);
                                 if(Gd_0010 <= Id_0130)
                                   {
                                    Gd_0011 = Id_0130;
                                   }
                                 else
                                   {
                                    Gd_0011 = Gd_0010;
                                   }
                                 Ld_FFB0 = NormalizeDouble((Bid - Gd_0011), Ii_00A0);
                                 Ld_FFA8 = Id_0168;
                                }
                              else
                                {
                                 Gd_0012 = Id_0108;
                                 if(Id_0108 <= Id_0130)
                                   {
                                    Gd_0013 = Id_0130;
                                   }
                                 else
                                   {
                                    Gd_0013 = Gd_0012;
                                   }
                                 Ld_FFB0 = NormalizeDouble((Bid - Gd_0013), Ii_00A0);
                                 Ld_FFA8 = NormalizeDouble((Ld_FFB0 + Id_00D8), Ii_00A0);
                                }
                              if((Li_FFE0 > 0 && Ld_FFB0 < Ld_FF60) || Li_FFE0 == 0)
                                {

                                 if((Ld_FFB0 != Ld_FFB8) && ((Bid - Ld_FFB8) > Id_0138))
                                   {
                                    bool Ii_007C_ = trade.OrderModify(Li_FFF4, Ld_FFB0, Ld_FFA8, Ld_FFA0,ORDER_TIME_GTC, 0,0);
                                    if(Ii_007C_ == true)
                                      {
                                       Ii_0090 = Li_FFF0;
                                      }
                                   }
                                }
                             }
                          }
                       }
                    }
                  // }
                 }
              }
         Li_FF48 = Li_FF48 - 1;
        }
      while(Li_FF48 >= 0);
     }




   if((Id_0030 > 1 && Li_FFDC < 1) || Li_FFE4 < 1)
     {

      if(Li_FFEC < 1)
        {
         Gb_002F = (Id_0120 <= Id_0128);
         if(Gb_002F)
           {
            Gi_002F = Li_FFF0 - Ii_0094;
            if(Gi_002F > Ii_002C)
              {
               if(EvaluarHorario(HoraInicioOperar,HoraFinalOperar,MinutoInicioOperar,MinutoFinalOperar,TimeCurrent()) && Mensual && Diario)
                 {
                  Gb_002F = true;
                 }
               else
                 {
                  Gb_002F = false;
                 }


               if(Gb_002F && Ii_0000 == 0)
                 {
                  if((FixedLot > 0))
                    {
                     Gd_0030 = ceil((FixedLot / Id_0140));
                     Id_00C0 = (Gd_0030 * Id_0140);
                     Gd_0030 = round((Id_00C0 / Id_0140));
                     Gd_0030 = (Gd_0030 * Id_0140);
                    }
                  else
                    {
                     if((Id_00A8 > 0))
                       {
                        Gd_0031 = Id_00B8;
                        Gd_0032 = (((RiskPercent / 100) * AccountInfoDouble(ACCOUNT_BALANCE)) * Id_00B8);
                        Gd_0032 = NormalizeDouble((Gd_0032 / Id_00A8), 2);
                        if(Gd_0032 >= Id_00B0)
                          {
                           Gd_0033 = Id_00B0;
                          }
                        else
                          {
                           Gd_0033 = Gd_0032;
                          }
                        if(Gd_0033 <= Gd_0031)
                          {
                           Gd_0032 = Gd_0031;
                          }
                        else
                          {
                           Gd_0032 = Gd_0033;
                          }
                        Id_00C0 = Gd_0032;
                       }
                     Gd_0032 = round((Id_00C0 / Id_0140));
                     Gd_0030 = (Gd_0032 * Id_0140);
                    }

                  //  AccountInfoDouble()
                  if(AInfo.FreeMarginCheck(_Symbol, ORDER_TYPE_BUY, Gd_0030,Ask)<= 0 || GetLastError() == 134)
                    {

                     Li_FFFC = 0;
                     return Li_FFFC;
                    }
                  Gd_0034 = Id_0108;
                  if(Id_0108 <= Id_0130)
                    {
                     Gd_0035 = Id_0130;
                    }
                  else
                    {
                     Gd_0035 = Gd_0034;
                    }
                  Ld_FFB0 = NormalizeDouble((Ask + Gd_0035), Ii_00A0);
                  if(Li_FFE4 > 0)
                    {
                     Ld_FFA8 = Id_0160;
                    }
                  else
                    {
                     Ld_FFA8 = NormalizeDouble((Ld_FFB0 - Id_00D8), Ii_00A0);
                    }
                  bool Li_FFF8_ = trade.BuyStop(Id_00C0,Ld_FFB0,_Symbol,Ld_FFA8,Ld_FFA0,ORDER_TIME_GTC,0,Comentario);
                  if(Li_FFF8_ == true)
                    {
                     Ii_008C = Li_FFF0;
                     Ii_0094 = Li_FFF0;
                    }
                 }
              }
           }
        }
     }
   if((Id_0030 > 1 && Li_FFD8 < 1) || Li_FFE0 < 1)
     {

      if(Li_FFE8 < 1)
        {
         Gb_0035 = (Id_0120 <= Id_0128);
         if(Gb_0035)
           {
            Gi_0035 = Li_FFF0 - Ii_0094;
            if(Gi_0035 > Ii_002C)
              {
               if(EvaluarHorario(HoraInicioOperar,HoraFinalOperar,MinutoInicioOperar,MinutoFinalOperar,TimeCurrent()) && Mensual && Diario)
                 {
                  Gb_0035 = true;
                 }
               else
                 {
                  Gb_0035 = false;
                 }
               if(Gb_0035 && Ii_0000 == 0)
                 {
                  if((FixedLot > 0))
                    {
                     Gd_0036 = ceil((FixedLot / Id_0140));
                     Id_00C0 = (Gd_0036 * Id_0140);
                     Gd_0036 = round((Id_00C0 / Id_0140));
                     Gd_0036 = (Gd_0036 * Id_0140);
                    }
                  else
                    {
                     if((Id_00A8 > 0))
                       {
                        Gd_0037 = Id_00B8;
                        Gd_0038 = (((RiskPercent / 100) * AccountInfoDouble(ACCOUNT_BALANCE)) * Id_00B8);
                        Gd_0038 = NormalizeDouble((Gd_0038 / Id_00A8), 2);
                        if(Gd_0038 >= Id_00B0)
                          {
                           Gd_0039 = Id_00B0;
                          }
                        else
                          {
                           Gd_0039 = Gd_0038;
                          }
                        if(Gd_0039 <= Gd_0037)
                          {
                           Gd_0038 = Gd_0037;
                          }
                        else
                          {
                           Gd_0038 = Gd_0039;
                          }
                        Id_00C0 = Gd_0038;
                       }
                     Gd_0038 = round((Id_00C0 / Id_0140));
                     Gd_0036 = (Gd_0038 * Id_0140);
                    }
                  if(AInfo.FreeMarginCheck(_Symbol, ORDER_TYPE_SELL, Gd_0036,Bid) <= 0 || GetLastError() == 134)
                    {
                     Li_FFFC = 0;
                     return Li_FFFC;
                    }
                  Gd_003A = Id_0108;
                  if(Id_0108 <= Id_0130)
                    {
                     Gd_003B = Id_0130;
                    }
                  else
                    {
                     Gd_003B = Gd_003A;
                    }
                  Ld_FFB0 = NormalizeDouble((Bid - Gd_003B), Ii_00A0);
                  if(Li_FFE0 > 0)
                    {
                     Ld_FFA8 = Id_0168;
                    }
                  else
                    {
                     Ld_FFA8 = NormalizeDouble((Ld_FFB0 + Id_00D8), Ii_00A0);
                    }
                  bool Li_FFF8_ = trade.SellStop(Id_00C0,Ld_FFB0,_Symbol,Ld_FFA8,Ld_FFA0,ORDER_TIME_GTC,0,Comentario);
                  if(Li_FFF8_ == true)
                    {
                     Ii_0090 = Li_FFF0;
                     Ii_0094 = Li_FFF0;
                    }
                 }
              }
           }
        }
     }
   ObjectsDeleteAll(-1, -1);
   Li_FFFC = 0;

   return Li_FFFC;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluarHorario(int Inicio,int Final,int MInicio,int MFinal,datetime TimeEvalua)
  {

   MqlDateTime timeActual;
   TimeToStruct(TimeEvalua,timeActual);


   int Minuto=timeActual.min;
   int Hora=timeActual.hour;

   if(Inicio<Final)
     {
      if(!(Inicio<=Hora && Hora<Final))
         return false;
     }
   else
     {
      if(!(Inicio<=Hora || Hora<Final))
         return false;
     }

   if(Hora==Inicio)
     {
      if(!(Minuto>=MInicio))
         return false;
     }
   if(Hora==Final)
     {
      if(!(Minuto<MFinal))
         return false;
     }


   if(Inicio==Final && Hora==Inicio)
     {
      if(MFinal<MInicio)
        {
         if(!(MInicio<=Minuto || Minuto<MFinal))
            return false;
        }
     }

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CierresLIMITADORES()
  {
   HistorySelect(0,TimeCurrent());
   int hstTotal=HistoryDealsTotal();

   static datetime Dia=0,Mes=0;
   datetime diaActual=iTime(Symbol(),PERIOD_D1,0);
   datetime mesActual=iTime(Symbol(),PERIOD_MN1,0);
//datetime M1=ActualizarDatos(NULL,PERIOD_M1);
   if(Diario && Mensual)
      if(HistoryAnterior!=hstTotal)
        {
         Diario=true;
         Mensual=true;
         BalanceDia=GananciaPerdidaCerrada(diaActual);
         BalanceMes=GananciaPerdidaCerrada(mesActual);
         HistoryAnterior=hstTotal;
        }
   if(Dia!=diaActual)
     {
      Diario=true;
      BalanceDia=GananciaPerdidaCerrada(diaActual);
      Dia=diaActual;
     }
   if(Mes!=mesActual)
     {
      Mensual=true;
      BalanceMes=GananciaPerdidaCerrada(mesActual);
      Mes=mesActual;
     }

   if(Mensual)
      Mensual=EvaluarBalanceProfitsAbiertos(BalanceMes,"MENSUAL",Ganancia_Limitador_Porcentaje_Mensual,Perdida_Limitador_Porcentaje_Mensual);

   if(Diario)
      Diario=EvaluarBalanceProfitsAbiertos(BalanceDia,"DIARIA",Ganancia_Limitador_Porcentaje_Diario,Perdida_Limitador_Porcentaje_Diario);

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluarBalanceProfitsAbiertos(double Balance,string ID,double LimitadorGanancia,double LimitadorPerdida)
  {

   int Total=PositionsTotal();
   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetSymbol(i)==Symbol())
         Balance=Balance-PositionGetDouble(POSITION_PROFIT)-PositionGetDouble(POSITION_SWAP);
     }


   double GananciaLimitador=Balance*(LimitadorGanancia/100.0);
   double PerdidaLimitador=Balance*(LimitadorPerdida/100.0);

   if(LimitadorGanancia!=0)
      if(GananciaLimitador<=AccountInfoDouble(ACCOUNT_BALANCE)-Balance)
        {
         ComentarioLimitador="DETENIDO POR LIMITADOR GANANCIA "+ID;
         // if(Cierre_en_Limitador)
         // {
         CerrarOrdenes();
         //TiempoInicio=TiempoFinal+1;
         //}
         DesaparecerOrdenes();
         return false;
        }

   if(LimitadorPerdida!=0)
      if(PerdidaLimitador<=Balance-AccountInfoDouble(ACCOUNT_BALANCE))
        {
         //if(Cierre_en_Limitador)
         //{
         CerrarOrdenes();
         //  TiempoInicio=TiempoFinal+1;
         //}
         DesaparecerOrdenes();

         ComentarioLimitador="DETENIDO POR LIMITADOR PERDIDA "+ID;
         return false;
        }
   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DesaparecerOrdenes()
  {
   for(int cnt=OrdersTotal()-1; cnt>=0; cnt--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=OrderGetTicket(cnt);
      if(Ticket==0)
         continue;
      if(OrderGetInteger(ORDER_MAGIC)==MagicNumber && OrderGetString(ORDER_SYMBOL)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
         //donde esta el experto.. entonces no lo evalua
        {
         trade.OrderDelete(OrderGetInteger(ORDER_TICKET));
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarOrdenes()
  {
   int Total=PositionsTotal();
   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetSymbol(i)==Symbol())
         trade.PositionClose(Ticket,-1);
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GananciaPerdidaCerrada(datetime Tiempo)
  {
   double Balance=AccountInfoDouble(ACCOUNT_BALANCE);

   HistorySelect(Tiempo,TimeCurrent());

   int     total=HistoryDealsTotal();
   ulong    ticket=0;
//--- for all deals


   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID_  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         // int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         double Profit_=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         //string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);

         if(Magic==MagicNumber)
            if(entry==DEAL_ENTRY_OUT)
              {
               Profit_=Profit_+(true?Comision:0)+(true?Swap:0);
               Balance=Balance-Profit_;
              }
         //}
        }
     }
   return Balance;
  }


//+------------------------------------------------------------------+
double BuscarOpenPrice(int ID)
  {
   HistorySelect(0,TimeCurrent());
   int TOTAL = HistoryDealsTotal() - 1;
   for(int i=TOTAL ; i>=0; i++)
     {
      ulong ticket=0;
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID_  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         double Price=(int)HistoryDealGetDouble(ticket,DEAL_PRICE);
         //string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
         if(entry==DEAL_ENTRY_IN && ID==ID_)
            return Price;
        }
     }
   return -1;
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
double iMAOnArray(double& array[], int period, int ma_shift, ENUM_MA_METHOD ma_method, int shift)
  {

   double buf[], arr[];
   int total = ArraySize(array);

   if(total <= period)
      return 0;

   if(shift > total - period - ma_shift)
      return 0;

   switch(ma_method)
     {

      case MODE_SMA:
        {

         total = ArrayCopy(arr, array, 0, shift + ma_shift, period);
         if(ArrayResize(buf, total) < 0)
            return 0;

         double sum = 0;
         int i, pos = total-1;

         for(i = 1; i < period; i++, pos--)

            sum += arr[pos];

         while(pos >= 0)
           {

            sum += arr[pos];

            buf[pos] = sum / period;

            sum -= arr[pos + period - 1];

            pos--;

           }

         return buf[0];

        }



      case MODE_EMA:
        {

         if(ArrayResize(buf, total) < 0)

            return 0;

         double pr = 2.0 / (period + 1);

         int pos = total - 2;



         while(pos >= 0)
           {

            if(pos == total - 2)

               buf[pos+1] = array[pos+1];

            buf[pos] = array[pos] * pr + buf[pos+1] * (1-pr);

            pos--;

           }

         return buf[shift+ma_shift];

        }



      case MODE_SMMA:
        {

         if(ArrayResize(buf, total) < 0)

            return(0);

         double sum = 0;

         int i, k, pos;



         pos = total - period;

         while(pos >= 0)
           {

            if(pos == total - period)
              {

               for(i = 0, k = pos; i < period; i++, k++)
                 {

                  sum += array[k];

                  buf[k] = 0;

                 }

              }

            else

               sum = buf[pos+1] * (period-1) + array[pos];

            buf[pos]=sum/period;

            pos--;

           }

         return buf[shift+ma_shift];

        }



      case MODE_LWMA:
        {

         if(ArrayResize(buf, total) < 0)

            return 0;

         double sum = 0.0, lsum = 0.0;

         double price;

         int i, weight = 0, pos = total-1;



         for(i = 1; i <= period; i++, pos--)
           {

            price = array[pos];

            sum += price * i;

            lsum += price;

            weight += i;

           }

         pos++;

         i = pos + period;

         while(pos >= 0)
           {

            buf[pos] = sum / weight;

            if(pos == 0)

               break;

            pos--;

            i--;

            price = array[pos];

            sum = sum - lsum + price * period;

            lsum -= array[i];

            lsum += price;

           }

         return buf[shift+ma_shift];

        }

     }

   return 0;

  }
//+------------------------------------------------------------------+
