
//+------------------------------------------------------------------+
//|                                             Low Frecuency EA.mq5 |
//+------------------------------------------------------------------+
#include<Trade\Trade.mqh>

CTrade trade;

#property version     "1.00"
#property copyright   "Copyright, Ing. Gerardo Monita Ruiz"
#property link        "https://t.me/germor82"
#property description "IMPORTANTE: Use magic number diferente para cada par/grafico"
#property description "EURUSD,todos los pares mayores y menores"
#property description "GBPUSD pipsdistance"
#property strict
input uint     MagicNumber=1234;
input uint     Slippage=3;
input double  Lots =0.10;

input string  INFO1= "HEDGING SYSTEM";

input bool    MARTINGALE=true;
input double  Pipdistance=10;
input double  multi=2.0;
input uint      Maxnumbertrades=20;
input bool    Targetbytrade=true;
input double  targetbyeachtrade=3.0;
double  prec;
input double  StopLoss=80;

input string  INFO = "TRAILING SYSTEM";

input bool    Trailing=true;
input double  TrailingStart=30;
input double  TrailingStop=15;
input  int    TrailingStep =5;
input  double TakeProfittrailing =150;

input string  INFO3 = "TYPE & HOURS TRADING";

input int      Hour_init=0;
input int      Hour_end=24;
input bool     OpenSELL=true;
input bool     OpenBUY=true;



input string  INFO4 = "Stochastic";
input bool UsarStochastic=true;
input uint K=5;
input uint D=3;
input uint Slowing=3;
input ENUM_STO_PRICE Price_field=0;
uint Stoch_shift=0;
input uint Lo_level=30;
input uint Up_level=70;
datetime         Timebarra=0;
int           Numerodecuenta=176000;    //ACA PONES LA CUENTA LA QUE VA A RECIBIR EL ROBOT
datetime Tiempolimite=D'2021.09.19';
datetime Tiempoactual=TimeCurrent();

double Precioultima1=0;
double Precioultima2=0;
double Precioprimera=0;
double Preciosegunda=0;
string text[19], prefix="";
double minlot;
ulong Ticket1buy;
ulong Ticket1sell;

int Estocastico;
double EstBuffer[1];


double _Lot = 0.0;

bool   OpenSELL_=true;
bool   OpenBUY_=true;
int    Hour_init_=0;
int    Hour_end_=0;
bool   UsarStochastic_=true;
uint Lo_level_=30;
uint Up_level_=70;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   OpenSELL_=OpenSELL;
   OpenBUY_=OpenBUY;  
   Hour_init_=Hour_init;
   Hour_end_=Hour_end;
   UsarStochastic_=UsarStochastic;
   Lo_level_=Lo_level;
   Up_level_=Up_level;
  
   minlot   =   SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
   _Lot = NormalizeLot(Lots);
   while(_Lot>minlot && !CheckMoneyForTrade(_Symbol,_Lot,0))
     {
      _Lot-=minlot;
     }
   minlot   =   SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
   if(minlot==0.01)
      prec=2;
   if(minlot==0.1)
      prec=1;

   if(!OpenSELL_ && !OpenBUY_)
     {
      Alert("Buy and Sell was enabled...");
      OpenSELL_ = true;
      OpenBUY_ = true;
      //return(-1);
     }
//if(MQLInfoInteger(MQL_TESTER) && !MQLInfoInteger(MQL_VISUAL_MODE))
     {
      if(Hour_end_>24)
         Hour_end_ = 24;
      if(Hour_init_>Hour_end_)
         Hour_init_=Hour_end_;
      if(Lo_level_<1)
         Lo_level_=1;
      if(Up_level_<1)
         Up_level_=1;

      Hour_init_=0;
      Hour_end_=24;

      if(Up_level_>2365 || Lo_level_>2365)
         UsarStochastic_ = false;
     }
   Estocastico=iStochastic(Symbol(),PERIOD_CURRENT,K,D,Slowing,MODE_SMA,Price_field);
   
   trade.SetExpertMagicNumber(MagicNumber);
   return(INIT_SUCCEEDED);
  }

 iCustom(Symbol(),PERIOD_CURRENT,"MI_INDICADOR",....,.....,....)
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   bool Retorno=true;
   MqlDateTime TiempoCurrent_;
   TimeToStruct(TimeCurrent(),TiempoCurrent_);
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   
   CopyBuffer(Estocastico,1,Stoch_shift,1,EstBuffer);
   
   if((AccountInfoInteger(ACCOUNT_LOGIN)==Numerodecuenta)&&(Tiempoactual<Tiempolimite))
     {
      if(TradeAllowed())
        {
            string comentariocompra="Low Frecuency EA B  L-"+DoubleToString((TotalOrdersCountBUY()+1),0);
            string comentarioventa="Low Frecuency EA S  L-"+DoubleToString((TotalOrdersCountSELL()+1),0);

            bool result0=false;
            bool result00=false;
            bool result1=false;
            bool result11=false;

            double TheTakeProfit0=0;
            double TheTakeProfit1=0;
            double TheTakeProfit00=0;
            double TheTakeProfit11=0;

            double lastlotbuy=0.01;
            double lastlotsell=0.01;
            double TheStopLoss0=0;
            double TheStopLoss1=0;
            double TheStopLoss00=0;
            double TheStopLoss11=0;

            double MyPoint=Point();

            if(Digits()==3 || Digits()==5|| Digits()==2)
               MyPoint=Point()*10;
            
            double Pipdistancia1=Pipdistance*Point()*10;

            for(int cntac=0; cntac<PositionsTotal(); cntac++)
              {
               //ciclo buy
               ulong TicketPosition=PositionGetTicket(cntac);
               if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && PositionGetString(POSITION_SYMBOL)==Symbol() && PositionGetInteger(POSITION_MAGIC)==MagicNumber)
                 {
                  Precioultima1=PositionGetDouble(POSITION_PRICE_OPEN);
                 }
               //ciclo  sell
               if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && PositionGetString(POSITION_SYMBOL)==Symbol() && PositionGetInteger(POSITION_MAGIC)==MagicNumber)
                 {

                  Precioultima2=PositionGetDouble(POSITION_PRICE_OPEN);
                 }
              }

            if((TotalOrdersCountBUY()>1)&&(Targetbytrade==true)&&(TotalOrdersprofitBUY()>(targetbyeachtrade*TotalOrdersCountBUY())))
              {
               closeallbuy();
              }


            if((TotalOrdersCountSELL()>1)&&(Targetbytrade==true)&&(TotalOrdersprofitSELL()>(targetbyeachtrade*TotalOrdersCountSELL())) && Retorno==true)
              {
               closeallsell();
              }

            if(((TotalOrdersCountBUY()==0)||(TotalOrdersCountSELL()==0))&&((TiempoCurrent_.hour>=Hour_init_)&&(TiempoCurrent_.hour<Hour_end_)) && Retorno==true)
              {
               if( OpenBUY_==true&& TotalOrdersCountBUY()==0 &&( (EstBuffer[0]<Lo_level && UsarStochastic==true)|| UsarStochastic==false) && iTime(NULL,PERIOD_M1,0)-Timebarra>61 && CheckMoneyForTrade(_Symbol,_Lot,ORDER_TYPE_BUY))
                 {
                  result0=trade.Buy(_Lot,Symbol(),Ask,0,0,comentariocompra);
                  Timebarra=iTime(NULL,PERIOD_M1,0);

                  if(result0==true)
                    {
                     Ticket1buy=trade.ResultDeal();
                     TheStopLoss0=0;
                     TheTakeProfit0=0;
                     
                     if(TakeProfittrailing>0)
                        TheTakeProfit0=Ask+TakeProfittrailing*MyPoint;
                     if(StopLoss>0)
                        TheStopLoss0=Ask-StopLoss*MyPoint;
                     bool Seleccionar=PositionSelectByTicket(Ticket1buy);
                     if(Seleccionar && NDD(TheStopLoss0)!=PositionGetDouble(POSITION_SL) && TheTakeProfit0!=PositionGetDouble(POSITION_TP))
                      bool r1=trade.PositionModify(Ticket1buy,NormalizeDouble(TheStopLoss0,Digits()),NormalizeDouble(TheTakeProfit0,Digits()));
                    }
                 }
                 
               if( OpenSELL_==true && TotalOrdersCountSELL()==0 && ((EstBuffer[0]>Up_level && UsarStochastic==true)|| UsarStochastic==false) && iTime(NULL,PERIOD_M1,0)-Timebarra>61 && CheckMoneyForTrade(_Symbol,_Lot,ORDER_TYPE_SELL) )

                 {
                  result1=trade.Sell(_Lot,Symbol(),Bid,0,0,comentarioventa);
                  Timebarra=iTime(NULL,PERIOD_M1,0);

                  if(result1==true)
                    {
                     Ticket1sell=trade.ResultDeal();
                     TheStopLoss1=0;
                     TheTakeProfit1=0;
                     if(TakeProfittrailing>0)
                        TheTakeProfit1=Bid-TakeProfittrailing*MyPoint;
                     if(StopLoss>0)
                        TheStopLoss1=Bid+StopLoss*MyPoint;
                        
                     bool Seleccionar=PositionSelectByTicket(Ticket1sell);
                     
                     if(Seleccionar && NDD(TheStopLoss1)!=PositionGetDouble(POSITION_SL) && TheTakeProfit1!=PositionGetDouble(POSITION_TP))
                      bool r1=trade.PositionModify(Ticket1sell,NormalizeDouble(TheStopLoss1,Digits()),NormalizeDouble(TheTakeProfit1,Digits()));
                    } 
                 }
              }

            if(MARTINGALE==true)
              {
               if((OpenBUY_==true)&&(TotalOrdersCountBUY()>=1)&&(TotalOrdersCountBUY()<=Maxnumbertrades)&&((MathAbs(Bid-Precioultima1))>Pipdistancia1)&&((Bid-Precioultima1)<0)&&((iTime(NULL,PERIOD_M1,0)-Timebarra)>61) && CheckMoneyForTrade(_Symbol,lotc1(),0) )

                 {
                  result00=trade.Buy(lotc1(),Symbol(),Ask,0,0,comentariocompra);
                  Timebarra=iTime(NULL,PERIOD_M1,0);
                  if(result00==true)
                    {
                     TheStopLoss00=0;
                     TheTakeProfit00=0;
                     
                     if(TakeProfittrailing>0)
                        TheTakeProfit00=0;//Ask+TakeProfittrailing*MyPoint;
                     if(StopLoss>0)
                        TheStopLoss00=Ask-StopLoss*MyPoint;
                     
                     ulong Ticket=trade.ResultDeal();
                     bool Seleccionar=PositionSelectByTicket(Ticket);

                     if(Seleccionar && NDD(TheStopLoss00)!=PositionGetDouble(POSITION_SL))
                     bool r=trade.PositionModify(Ticket,NormalizeDouble(TheStopLoss00,Digits()),NormalizeDouble(TheTakeProfit00,Digits()));
                    }
                 }

               if((OpenSELL_==true)&&(TotalOrdersCountSELL()>=1)&&(TotalOrdersCountSELL()<=Maxnumbertrades)&&((MathAbs(Bid-Precioultima2))>Pipdistancia1)&&((Bid-Precioultima2)>0)&&((iTime(NULL,PERIOD_M1,0)-Timebarra)>61) && CheckMoneyForTrade(_Symbol,lotv1(),1) )
                 {
                  result11=trade.Sell(lotv1(),Symbol(),Bid,0,0,comentarioventa);
                  Timebarra=iTime(NULL,PERIOD_M1,0);

                  if(result11==true)
                    {
                     TheStopLoss11=0;
                     TheTakeProfit11=0;
                     if(TakeProfittrailing>0)
                        TheTakeProfit11=0;//Bid-TakeProfittrailing*MyPoint;
                     if(StopLoss>0)
                        TheStopLoss11=Bid+StopLoss*MyPoint;
                     
                     ulong Ticket=trade.ResultDeal();
                     bool Seleccionar=PositionSelectByTicket(Ticket);

                     if(Seleccionar && NDD(TheStopLoss11)!=PositionGetDouble(POSITION_SL))
                        bool r=trade.PositionModify(Ticket,NormalizeDouble(TheStopLoss11,Digits()),NormalizeDouble(TheTakeProfit11,Digits()));
                    }
                 }
              }

             
            if(PositionSelectByTicket(Ticket1buy))
              {
              
               if((PositionGetString(POSITION_SYMBOL)==Symbol())&&(Trailing==true))
                 {
                  if(TrailingStop>0)
                    {
                     if(Bid-PositionGetDouble(POSITION_PRICE_OPEN)>MyPoint*TrailingStart)
                       {
                        if(Bid-PositionGetDouble(POSITION_PRICE_OPEN)>MyPoint*TrailingStop)
                          {
                           if(PositionGetDouble(POSITION_SL)<Bid-MyPoint*(TrailingStop+TrailingStep))
                             {
                              if(NDD(Bid-TrailingStop*MyPoint)!=PositionGetDouble(POSITION_SL))
                                 bool r= trade.PositionModify(Ticket1buy,Bid-TrailingStop*MyPoint,PositionGetDouble(POSITION_TP));
                             }
                          }
                       }
                    }
                 }
              }

              {
              
               if(PositionSelectByTicket(Ticket1sell) )
                 {
                  if(PositionGetString(POSITION_SYMBOL)==Symbol() && Trailing==true )
                    {
                     if(TrailingStop>0)
                       {
                        if((PositionGetDouble(POSITION_PRICE_OPEN)-Ask)>MyPoint*TrailingStart)
                          {
                           if((PositionGetDouble(POSITION_PRICE_OPEN)-Ask)>(MyPoint*TrailingStop))
                             {
                              if((PositionGetDouble(POSITION_SL)>(Ask+MyPoint*(TrailingStop+TrailingStep))) || (PositionGetDouble(POSITION_SL)==0))
                                {
                                 if(NDD(Ask+MyPoint*TrailingStop)!=PositionGetDouble(POSITION_SL))
                                    bool r= trade.PositionModify(Ticket1sell,Ask+MyPoint*TrailingStop,PositionGetDouble(POSITION_TP));
                                }
                             }
                          }
                       }
                    }
                 }
              }
        }
     }

   else

      if((AccountInfoInteger(ACCOUNT_LOGIN) != Numerodecuenta)||(Tiempoactual!=Tiempolimite))
        {

         Alert("You don't have permission to use this ADVISOR EXPERT!");
         ExpertRemove();
        }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void closeallsell()
  {
   for(int irr=PositionsTotal()-1; irr>=0; irr--)
     {
      ulong TicketPosition=PositionGetTicket(irr);

      if(PositionGetString(POSITION_SYMBOL)!=Symbol() || PositionGetInteger(POSITION_MAGIC)!=MagicNumber||(PositionGetInteger(POSITION_TYPE)!=POSITION_TYPE_SELL))
         continue;


      else
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
             trade.PositionClose(TicketPosition,3);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void closeallbuy()
  {
    for(int iy=PositionsTotal()-1; iy>=0; iy--)
     {
      ulong TicketPosition=PositionGetTicket(iy);

      if(PositionGetString(POSITION_SYMBOL)!=Symbol() || PositionGetInteger(POSITION_MAGIC)!=MagicNumber||(PositionGetInteger(POSITION_TYPE)!=POSITION_TYPE_BUY))
         continue;


      else
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
             trade.PositionClose(TicketPosition,3);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double TotalOrdersCountBUY()
  {
   double resultBUY=0;

   for(int i=0; i<PositionsTotal(); i++)
     {
      ulong TicketPosition=PositionGetTicket(i);
      
      if(PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
         resultBUY++;
     }
   return (resultBUY);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double TotalOrdersCountSELL()
  {
   double resultSELL=0;
   
   for(int ih=0; ih<PositionsTotal(); ih++)
     {
      ulong TicketPosition=PositionGetTicket(ih);
      if(PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
         resultSELL++;

     }
   return (resultSELL);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double TotalOrdersprofitBUY()
  {
   double resultprofitBUY=0;

   for(int iss=0; iss<PositionsTotal(); iss++)
     {
      ulong TicketPosition=PositionGetTicket(iss);
      if(PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
         resultprofitBUY+=PositionGetDouble(POSITION_PROFIT);
     }
   return (resultprofitBUY);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double TotalOrdersprofitSELL()
  {
   double resultprofitSELL=0;
   
   for(int iutu=0; iutu<PositionsTotal(); iutu++)
     {
      ulong TicketPosition=PositionGetTicket(iutu);
      if(PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
         resultprofitSELL+=PositionGetDouble(POSITION_PROFIT);

     }
   return (resultprofitSELL);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double lotc1()
  {
   double lotec1=Lots;

   if(((multi>=1.5))&&(Lots<0.1))
     {
      if(TotalOrdersCountBUY()>=1)
         lotec1=NormalizeDouble(lastlotbuy()*multi,(int)prec);
     }


   if(((multi>=1.5))&&(Lots>=0.1))
     {
      if(TotalOrdersCountBUY()>=1)
         lotec1=NormalizeDouble(lastlotbuy()*multi,2);
     }


   if((multi<1.5)&&(Lots>=0.1))
     {
      if(TotalOrdersCountBUY()>=1)
         lotec1=NormalizeDouble(Lots*MathPow(multi,TotalOrdersCountBUY()),2);
     }

   if((multi<1.5)&&(Lots<0.1))
     {
      if(TotalOrdersCountBUY()>=1)
         lotec1=NormalizeDouble(Lots*MathPow(multi,TotalOrdersCountBUY()),(int)prec);
     }
   return(lotec1);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double lotv1()
  {

   double lotev1=Lots;

   if((multi>=1.5)&&(Lots<0.1))
     {
      if((TotalOrdersCountSELL()>=1))
         lotev1=NormalizeDouble(lastlotsell()*multi,(int)prec);
     }
   if((multi>=1.5)&&(Lots>=0.1))
     {
      if((TotalOrdersCountSELL()>=1))
         lotev1=NormalizeDouble(lastlotsell()*multi,2);
     }
   if((multi<1.5)&&(Lots>=0.1))
     {
      if((TotalOrdersCountSELL()>=1))
         lotev1=NormalizeDouble(Lots*MathPow(multi,TotalOrdersCountSELL()),2);
     }
   if((multi<1.5)&&(Lots<0.1))
     {
      if((TotalOrdersCountSELL()>=1))
         lotev1=NormalizeDouble(Lots*MathPow(multi,TotalOrdersCountSELL()),(int)prec);
     }
   return(lotev1);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double lastlotbuy()
  {
   double lastlotbuy=Lots;
   for(int ihkj=0; ihkj<PositionsTotal(); ihkj++)
     {
      ulong TicketPosition=PositionGetTicket(ihkj);
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && PositionGetString(POSITION_SYMBOL)==Symbol() && PositionGetInteger(POSITION_MAGIC)==MagicNumber)
         lastlotbuy=PositionGetDouble(POSITION_VOLUME);
     }
   return(lastlotbuy);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double lastlotsell()
  {

   double lastlotsell=Lots;
   for(int ihkj=0; ihkj<PositionsTotal(); ihkj++)
     {
     ulong TicketPosition=PositionGetTicket(ihkj);
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && PositionGetString(POSITION_SYMBOL)==Symbol() && PositionGetInteger(POSITION_MAGIC)==MagicNumber)
         lastlotsell=PositionGetDouble(POSITION_VOLUME);
     }
   return(lastlotsell);
  }
  
//+------------------------------------------------------------------+
//| Check the correctness of the order volume                        |
//+------------------------------------------------------------------+
bool CheckVolumeValue(double volume/*,string &description*/)
  {
   double lot=volume;
//--- select lot size
//--- maximal allowed volume of trade operations
   double max_volume=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);
   if(lot>max_volume)

      Print("Volume is greater than the maximal allowed ,we use",max_volume);
//  return(false);

//--- minimal allowed volume for trade operations
   double minlot1=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
   if(lot<minlot1)

      Print("Volume is less than the minimal allowed ,we use",minlot);
//  return(false);

//--- get minimal step of volume changing
   double volume_step=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
   int ratio=(int)MathRound(lot/volume_step);
   if(MathAbs(ratio*volume_step-lot)>0.0000001)
     {
      Print("Volume is not a multiple of the minimal step ,we use, the closest correct volume is %.2f",
            volume_step,ratio*volume_step);
      return(false);
     }
//description="Correct volume value";
   return(true);
  }
  
//+------------------------------------------------------------------+
//| TradeAllowed - The function checks the possibility               |
//|                of automatic trading                              |
//+------------------------------------------------------------------+
bool TradeAllowed()
  {
   static bool _Alert=false;
   bool result=true;
   if(MQLInfoInteger(MQL_OPTIMIZATION) || MQLInfoInteger(MQL_TESTER))
     {
      return(result);
     }
   if(result && !TerminalInfoInteger(TERMINAL_TRADE_ALLOWED))
     {
      if(!_Alert)
        {
         Alert("Check the terminal settings for the permission to trade automatically!");
        }
      result=false;
      _Alert= true;
     }
   if(result && !TerminalInfoInteger(TERMINAL_TRADE_ALLOWED))
     {
      if(!_Alert)
        {
         Alert("Check the terminal settings for the permission to trade automatically!");
        }
      result=false;
      _Alert= true;
     }
   else
     {
      if(result && !MQLInfoInteger(MQL_TRADE_ALLOWED))
        {
         if(!_Alert)
           {
            Alert("Automatic trading is prohibited in the program properties for ",__FILE__);
           }
         result=false;
         _Alert= true;
        }
     }
   if(result && !AccountInfoInteger(ACCOUNT_TRADE_EXPERT))
     {
      if(!_Alert)
         Alert("Automatic trading is prohibited for the account ",AccountInfoInteger(ACCOUNT_LOGIN),
               " on the trade server side");
      result=false;
      _Alert= true;
     }
   if(result && !AccountInfoInteger(ACCOUNT_TRADE_ALLOWED))
     {
      Comment("Trading is prohibited for the account ",AccountInfoInteger(ACCOUNT_LOGIN),
              ".\n Perhaps the connection to the trading account is made by the invest password.",
              "\n Check the terminal log if there is such an entry:",
              "\n\'",AccountInfoInteger(ACCOUNT_LOGIN),"\': trading has been disabled - investor mode.");
      if(!_Alert)
         Alert("Trading is prohibited for the account ",AccountInfoInteger(ACCOUNT_LOGIN),
               ".\n Perhaps the connection to the trading account is made by the invest password.",
               "\n Check the terminal log if there is such an entry:",
               "\n\'",AccountInfoInteger(ACCOUNT_LOGIN),"\': trading has been disabled - investor mode.");
      result=false;
      _Alert= true;
     }
   if(result)
     {
      _Alert=false;
     }
   return(result);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double NormalizeLot(double lot)
  {

   double min =SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MIN);
   double max =SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MAX);
   double step=SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_STEP);
   double _lot=lot<min?min:(lot>max?max:lot);
   _lot=MathCeil(_lot/step)*step;
   if(lot<=0.0)
      return(min);
   return(_lot);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CheckMoneyForTrade(string symb,double lots,ENUM_ORDER_TYPE type)
  {
   double free_margin = -1.0;
   double margen=0;
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double Price=0;
   if(type==ORDER_TYPE_BUY)
   Price=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   else
   Price=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   
   if(lots>0.0){
      free_margin=AccountInfoDouble(ACCOUNT_MARGIN_FREE);
      if(!OrderCalcMargin(type,symb,lots,Price,margen))
      Print("No se pudo Calcular el Margen");
     }
//-- если денег не хватает
   if(free_margin-margen<0)
     {
      string oper=(type==ORDER_TYPE_BUY)? "Buy":"Sell";
      Print("Not enough money for ",oper," ",lots," ",symb," Error code=",GetLastError());
      return(false);
     }
//-- проверка прошла успешно
   return(true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double NDD(double Value)
  {
   return(NormalizeDouble(Value,_Digits));
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
