//+------------------------------------------------------------------+
//|                                                   Crash_Boom.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// LIBRERIA PARA GENERAR UNA ORDEN (SELL, BUY, BUY_STOP, ETC)
#include<Trade\Trade.mqh>
CTrade trade;

enum MODO
  {
   UP=0,
   DOWN=1,
  };


input string S1="------------------ CONFIGURACION EXPERTO ------------------";
MODO Modo_Operacion=UP; // Direccion Herramienta Financiera
input double Lotes=0.2;
double SL=0; //Stop Loss (in pips)
double TP=0; //Take Profit (in pips)
//input ENUM_TIMEFRAMES Time_Frame=PERIOD_CURRENT;
input int VelasMaximasSpike=3;
input int VelasMaximasRegulares=3;
input int Magic_Number=2222222;
input string S0="------------------ CONFIGURACION EXPERTO PRINCIPAL ------------------";
input bool ExpertoPrincipal=true;
input double Maxima_Ganancia=10;
input double Maxima_Perdida=10;
input string CommentExpert="Experto Crash Boom ICHIMOKU WITH ARROWS";//Comentario Acoplar
input string S2="------------------ CONFIGURACION INDICADOR ------------------";
input string Nombre_Indicador="PZ_DoubleTopBottom";
input string Se_Ex="=======INDICATOR SETTINGS=======";
input int Amplitude=12;
input int Max_History=2000;
input string PA_Ex="=======PATERNS=======";
input color Color_of_bullish_pattern=clrLightSkyBlue;
input color Color_of_bearish_pattern=clrSalmon;
input string BR_Ex="=======BREAKOUTS========";
input bool Breakouts_enabled=true;
input color Color_of_bullish_Breakouts=clrDodgerBlue;
input color Color_of_bearish_Breakouts=clrRed;
input int Arrow_Size=3;
input int Breakout_Period=2;
input string Alerts_ex="=======ALERTS=======";
input string Custom_Alert_Name="My Alert Name";
input bool Display_Alerts=false;
input bool Email_Alerts=false;
input bool Push_Alerts=false;
input bool Soun_Alerts=false;
input string Sound_File="alert.wav";
input string S3="------------------ CONFIGURACION ICHIMOKU ------------------";
input int Tenkan_Sen=9;
input int Kijun_Sen=26;
input int Senkou_Span_b=52;

datetime TiempoStart=0;

int Filtro_1=0,Filtro_2=0;
//datetime TiempoSell=0,TiempoBuy=0;
double ICHIMOKU_1[],ICHIMOKU_2[];

MqlRates rates[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   GlobalVariableSet("Varible Expert Arrows",1);
   

   if(StringFind(Symbol(),"Crash",0)!=-1)
      Modo_Operacion=UP;
   else
      if(StringFind(Symbol(),"Boom",0)!=-1)
         Modo_Operacion=DOWN;
      else
        {
         Alert("Simbolo no es Crash ni boom");
         return INIT_FAILED;
        }

   trade.SetExpertMagicNumber(Magic_Number);
   ArraySetAsSeries(rates,true);
   ArraySetAsSeries(ICHIMOKU_1,true);
   ArraySetAsSeries(ICHIMOKU_2,true);

   TiempoStart=TimeCurrent();



   Filtro_1=iCustom(Symbol(),PERIOD_CURRENT,Nombre_Indicador,Se_Ex, Amplitude,Max_History,PA_Ex,Color_of_bullish_pattern,Color_of_bearish_pattern,BR_Ex
                    ,Breakouts_enabled,Color_of_bullish_Breakouts,Color_of_bearish_Breakouts,Arrow_Size,Breakout_Period,Alerts_ex,Custom_Alert_Name,Display_Alerts
                    ,Email_Alerts,Push_Alerts,Soun_Alerts,Sound_File);


   if(Filtro_1==INVALID_HANDLE)
     {
      Alert("INVALID HANDLE "+Nombre_Indicador);
      return INIT_FAILED;
     }

   Filtro_2=iIchimoku(Symbol(),PERIOD_CURRENT,Tenkan_Sen,Kijun_Sen,Senkou_Span_b);


   if(Filtro_2==INVALID_HANDLE)
     {
      Alert("INVALID HANDLE ICHIMOKU");
      return INIT_FAILED;
     }





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

   if(GlobalVariableGet("Varible Expert Arrows")==0)
      ExpertRemove();

   History();

   MqlDateTime TimeCurrent_;
   static datetime prevTime=0;
   int copied=CopyRates(Symbol(),PERIOD_CURRENT,0,5,rates);

   copied=CopyBuffer(Filtro_2,2,0,5,ICHIMOKU_1);
   copied=CopyBuffer(Filtro_2,3,0,5,ICHIMOKU_2);

   if(prevTime!=rates[1].time)
     {
      double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
      double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

      bool Buy_Arrow=false;
      bool Sell_Arrow=false;

      for(int i=ObjectsTotal(0,0,OBJ_ARROW)-1; i>=0; i--)
        {
         string name=ObjectName(0,i,0,OBJ_ARROW);
         if(rates[1].time==ObjectGetInteger(0,name,OBJPROP_TIME,0))
           {
            if(StringFind(name,"PZTA",0)!=-1)
              {
               if(ObjectGetDouble(0,name,OBJPROP_PRICE)>=rates[1].high)
                  Sell_Arrow=true;
               if(ObjectGetDouble(0,name,OBJPROP_PRICE)<=rates[1].low)
                  Buy_Arrow=true;
              }
            break;
           }
        }
      //Comment(ICHIMOKU_1[1],"  ",ICHIMOKU_2[1]);
      if(Modo_Operacion==UP)
        {
         //Comment(TimeToString(TiempoSell,TIME_DATE|TIME_MINUTES));
         Close_Velas_Contarias(true);
         Close_Velas_Direccion(true);

         if(Buy_Arrow && rates[1].close<ICHIMOKU_1[1] && rates[1].close<ICHIMOKU_2[1])
           {
            double TP_=TP==0?0:Ask+TP*Point();
            TP_=NormalizeDouble(TP_,Digits());
            double SL_=SL==0?0:Ask-SL*Point();
            SL_=NormalizeDouble(SL_,Digits());
            // Operamos UP con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
            bool BuyTradeBool=trade.Buy(Lotes,Symbol(),Ask,SL_,TP_,CommentExpert);
            if(BuyTradeBool==false)
               Print("Entrada ", Ask," SL=",SL_);
           }
         if(Sell_Arrow)
           {
            double TP_=TP==0?0:Bid-TP*Point();
            TP_=NormalizeDouble(TP_,Digits());
            double SL_=SL==0?0:Bid+SL*Point();
            SL_=NormalizeDouble(SL_,Digits());
            // Operamos DOWN con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
            bool SellTradeBool=trade.Sell(Lotes,Symbol(),Bid,SL_,TP_,CommentExpert);
            if(SellTradeBool==false)
               Print("Entrada ", Bid," SL=",SL_);
           }
        }

      if(Modo_Operacion==DOWN)
        {
         Close_Velas_Contarias(false);
         Close_Velas_Direccion(false);

         if(Sell_Arrow && rates[1].close>ICHIMOKU_1[1] && rates[1].close>ICHIMOKU_2[1])
           {
            double TP_=TP==0?0:Bid-TP*Point();
            TP_=NormalizeDouble(TP_,Digits());
            double SL_=SL==0?0:Bid+SL*Point();
            SL_=NormalizeDouble(SL_,Digits());
            // Operamos DOWN con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
            bool SellTradeBool=trade.Sell(Lotes,Symbol(),Bid,SL_,TP_,CommentExpert);
            if(SellTradeBool==false)
               Print("Entrada ", Bid," SL=",SL_);

           }
         if(Buy_Arrow)
           {
            double TP_=TP==0?0:Ask+TP*Point();
            TP_=NormalizeDouble(TP_,Digits());
            double SL_=SL==0?0:Ask-SL*Point();
            SL_=NormalizeDouble(SL_,Digits());
            // Operamos UP con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
            bool BuyTradeBool=trade.Buy(Lotes,Symbol(),Ask,SL_,TP_,CommentExpert);
            if(BuyTradeBool==false)
               Print("Entrada ", Ask," SL=",SL_);
           }
        }

     }
   prevTime=rates[1].time;
  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Close_Velas_Contarias(bool IsUP)
  {
   int TotalPosiciones=PositionsTotal();
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;
      if(Ticket==0)
         continue;

      if((datetime)PositionGetInteger(POSITION_TIME)+PeriodSeconds((ENUM_TIMEFRAMES) Period())*VelasMaximasSpike<=rates[0].time)
        {
         if(IsUP==true)
           {
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
              {
               trade.PositionClose(Ticket,-1);
              }
           }

         if(IsUP==false)
           {
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
               trade.PositionClose(Ticket,-1);
           }
        }
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Close_Velas_Direccion(bool IsUP)
  {
   int TotalPosiciones=PositionsTotal();
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;
      if(Ticket==0)
         continue;
      if((datetime)PositionGetInteger(POSITION_TIME)+PeriodSeconds((ENUM_TIMEFRAMES) Period())*VelasMaximasRegulares<=rates[0].time)
        {
         if(IsUP==false)
           {
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
              {
               trade.PositionClose(Ticket,-1);
              }
           }

         if(IsUP==true)
           {
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
               trade.PositionClose(Ticket,-1);
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CierreTotal()
  {
   int TotalPosiciones=PositionsTotal();
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_COMMENT)!=CommentExpert)
         continue;
      if(Ticket==0)
         continue;

      trade.PositionClose(Ticket,-1);
     }
  }

//+------------------------------------------------------------------+




//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void History()
  {
   double Profit=0;

   color BuyColor =clrBlue;
   color SellColor=clrRed;
//--- request trade history
   HistorySelect(TiempoStart,TimeCurrent());
//--- create objects
//string   name;
   uint     total=HistoryDealsTotal();
   ulong    ticket=0;
//double   price;
   double   profit;
//datetime time;
   string   symbol;
   long     type;
   long magic;
   string comentario;
//long     entry;
//--- for all deals
   for(uint i=0; i<total && ExpertoPrincipal; i++)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         //--- get deals properties
         //price =HistoryDealGetDouble(ticket,DEAL_PRICE);
         ///time  =(datetime)HistoryDealGetInteger(ticket,DEAL_TIME);
         symbol=HistoryDealGetString(ticket,DEAL_SYMBOL);
         type  =HistoryDealGetInteger(ticket,DEAL_TYPE);
         //entry =HistoryDealGetInteger(ticket,DEAL_ENTRY);
         profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         magic=HistoryDealGetInteger(ticket,DEAL_MAGIC);
         comentario=HistoryDealGetString(ticket,DEAL_COMMENT);

         if((type==DEAL_TYPE_BUY || type==DEAL_TYPE_SELL) && Magic_Number==magic && comentario==CommentExpert)
            Profit=Profit+profit;
         //--- only for current symbol
         /*if(price && time && symbol==Symbol())
           {
            //--- create price object
            name="TradeHistory_Deal_"+string(ticket);
            if(entry)
               ObjectCreate(0,name,OBJ_ARROW_RIGHT_PRICE,0,time,price,0,0);
            else
               ObjectCreate(0,name,OBJ_ARROW_LEFT_PRICE,0,time,price,0,0);
            //--- set object properties
            ObjectSetInteger(0,name,OBJPROP_SELECTABLE,0);
            ObjectSetInteger(0,name,OBJPROP_BACK,0);
            ObjectSetInteger(0,name,OBJPROP_COLOR,type?BuyColor:SellColor);
            if(profit!=0)
               ObjectSetString(0,name,OBJPROP_TEXT,"Profit: "+string(profit));
           }*/
        }
     }

   if(Profit>=Maxima_Ganancia && ExpertoPrincipal)
     {
      CierreTotal();
      Alert("EXPERTO CERRO POR MAXIMA GANANCIA");
      GlobalVariableSet("Varible Expert Arrows",0);
      ExpertRemove();
     }
   if(Profit<=(Maxima_Perdida)*-1 && ExpertoPrincipal)
     {
      CierreTotal();
      Alert("EXPERTO CERRO POR MAXIMA PERDIDA");
      GlobalVariableSet("Varible Expert Arrows",0);
      ExpertRemove();
     }

// Comment(Profit);
//--- apply on chart
   ChartRedraw();

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
