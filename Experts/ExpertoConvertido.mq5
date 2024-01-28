//+-----------------------------------------------------------------------+
//|                                    Return Target Close_v4.mq4         |
//|                                       Copyright © 2016, Ángel Larroca |
//|                                       tradingformoney2014@gmail.com   |
//+-----------------------------------------------------------------------+
#include<Trade\Trade.mqh>
CTrade trade;

#property copyright "Copyright © 2016,Ángel Larroca"
#property link      "tradingformoney2014@gmail.com"
#define  NL "\n"
#property version "4.0"

// Rev 1.00 (23 Noviembre 2016)
// Rev 2.00 (18 Mayo 2017)
// Rev 3.00 (26 Noviembre 2018)
// Rev 4.00 (02 Octubre 2021)

//    1. FUNCIONAMIENTO: Este EA permite fijar un objetivo de rentabilidad por trade y cierra todas las órdenes abiertas (incluyendo las pendientes) una vez que se alcanza o supera dicho objetivo.

input string _1              = "==== SETTINGS ====";
input bool   ActivateEA = true;   // EA Ignition
input string _1a              = "If Initial Equity is not indicated the EA will not work";
input double IndicateInitialEquity = 0.0;
input bool   ClosePendingToo = false;     //Seleccionar False para que el EA no cierre las órdenes pendientes también.
input bool   ProfitPercentToCloseAllOrders = false;
input double SetProfitPercentToCloseAllOrders = 0.00;//Porcentaje de beneficio establecido para cerrar todas las posiciones abiertas
input bool   DrawdownPercentToCloseAllOrders = true;
input double SetDrawdownPercentToCloseAllOrders = 0.00;//Porcentaje de pérdida establecido para cerrar todas las posiciones abiertas
input int    MaxSlippage     = 3;         //Cantidad máxima de pips de slippapge permitida (auto-ajustable para brokers de 4 o 5 dígitos)
input string _2              = "==== DISPLAY ====";
input int    TopPadding      = 0;         //to shift Display X number of lines down from topleft corner
input int    LeftPadding     = 0;         //to shift Display X number of spaces right from topleft corner


int mt;


datetime tiempoUntil=D'2023.11.18 00:00';
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {


   if(Digits()==3||Digits()==5)
      mt=10;
   else
      mt=1;

   return INIT_SUCCEEDED;
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {

   if(TimeCurrent()>tiempoUntil)
     {
      Alert("Tiempo de prueba termino ");
      ExpertRemove();
     }

   PrintComments();


   if(ProfitPercentToCloseAllOrders == true)

     {

      if(AccountInfoDouble(ACCOUNT_PROFIT)>= AccountInfoDouble(ACCOUNT_EQUITY) * (SetProfitPercentToCloseAllOrders/100))

        {CloseAll();}


     }

   if(DrawdownPercentToCloseAllOrders == true)

     {

      if(AccountInfoDouble(ACCOUNT_PROFIT)<= AccountInfoDouble(ACCOUNT_EQUITY) * (SetDrawdownPercentToCloseAllOrders*-1/100))

        {CloseAll();}


     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseAll()
  {
   bool   Result;
   int    i;
   int    Total=PositionsTotal();

   for(i=Total-1; i>=0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket!=0)
        {
         Result=trade.PositionClose(ticket,-1);
         if(Result!=true)
            Print("Ultimo ERROR = ",GetLastError()," resultRetcode ",trade.ResultRetcode());
        }
     }

   ClosePendingOrders();
   return;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ClosePendingOrders()
  {
   bool result=false;
   for(int i = OrdersTotal()-1; i >= 0; i--)
     {
      ulong ticket=OrderGetTicket(i);
      if(ticket==0)
         continue;

      if(OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_BUY_STOP||ORDER_TYPE_BUY_LIMIT||ORDER_TYPE_SELL_STOP||ORDER_TYPE_SELL_LIMIT)
         result=trade.OrderDelete(ticket);
      else
         continue;

      if(result==false)
         Print("ClosePendingOrders failed with error#",GetLastError()," retcode: ",trade.ResultRetcode());
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PrintComments()
  {
   MqlTick tickValues;
   SymbolInfoTick(Symbol(),tickValues);


   double Bid=tickValues.bid;
   double Ask=tickValues.ask;

   double CurrentSpread = (Ask - Bid) * 10000;

   string sComment   = "";
   string sep        = "==================================\n";
   string nl         = "\n";




   if(ActivateEA == true)
      if(ProfitPercentToCloseAllOrders == true)
         if(DrawdownPercentToCloseAllOrders == true)
            if(ClosePendingToo == true)


              {
               sComment = "========== EA IGNITION ==========" + nl;
               sComment = sComment + nl;
               sComment = sComment + "Expert Advisor: Return Target Close 4.0" + nl;
               sComment = sComment + "EA Status: ROBOT ON" + nl;
               sComment = sComment + "Initial Equity: " + DoubleToString(IndicateInitialEquity) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Current Equity: " + DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY)) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Market: " + Symbol()+ nl;
               sComment = sComment + "Current Spread: " + DoubleToString(CurrentSpread) + " Pips " + nl;
               sComment = sComment + "SELL Price: " + DoubleToString(Bid) + nl;
               sComment = sComment + "BUY Price: " + DoubleToString(Ask) + nl;
               sComment = sComment + "Profit Close All Orders System: ACTIVATED" + nl;
               sComment = sComment + "Drawdown Close All Orders System: ACTIVATED" + nl;
               sComment = sComment + "Close Pending Orders System: ACTIVATED" + nl;
               sComment = sComment + "Percentage of Equity Benefit to Close All Orders: " +  DoubleToString(SetProfitPercentToCloseAllOrders) + "%" + nl;
               sComment = sComment + "Percentage of Equity Lose to Close All Orders: " +  DoubleToString(SetDrawdownPercentToCloseAllOrders) + "%" + nl;
               sComment = sComment + "Minimum Profit to Close All Orders: " + DoubleToString((AccountInfoDouble(ACCOUNT_EQUITY) * SetProfitPercentToCloseAllOrders/100),2) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Minimum Lose to Close All Orders: " + DoubleToString((AccountInfoDouble(ACCOUNT_EQUITY) * SetDrawdownPercentToCloseAllOrders*-1/100),2) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;

              }

            else
              {
               sComment = "========== EA IGNITION ==========" + nl;

                 {
                  sComment = "========== EA IGNITION ==========" + nl;
                  sComment = sComment + nl;
                  sComment = sComment + "Expert Advisor: Return Target Close 4.0" + nl;
                  sComment = sComment + "EA Status: ROBOT OFF" + nl;
                  sComment = sComment + "Initial Equity: " + DoubleToString(IndicateInitialEquity) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
                  sComment = sComment + "Current Equity: " + DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY)) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
                  sComment = sComment + "Market: " + Symbol()+ nl;
                  sComment = sComment + "Current Spread: " + DoubleToString(CurrentSpread) + " Pips " + nl;
                  sComment = sComment + "SELL Price: " + DoubleToString(Bid) + nl;
                  sComment = sComment + "BUY Price: " + DoubleToString(Ask) + nl;
                  sComment = sComment + "Profit Close All Orders System: ACTIVATED" + nl;
                  sComment = sComment + "Drawdown Close All Orders System: ACTIVATED" + nl;
                  sComment = sComment + "Close Pending Orders System: ACTIVATED" + nl;
                  sComment = sComment + "Percentage of Equity Benefit to Close All Orders: " +  DoubleToString(SetProfitPercentToCloseAllOrders) + "%" + nl;
                  sComment = sComment + "Percentage of Equity Lose to Close All Orders: " +  DoubleToString(SetDrawdownPercentToCloseAllOrders) + "%" + nl;
                  sComment = sComment + "Minimum Profit to Close All Orders: " + DoubleToString((AccountInfoDouble(ACCOUNT_EQUITY) * SetProfitPercentToCloseAllOrders/100),2) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
                  sComment = sComment + "Minimum Lose to Close All Orders: " + DoubleToString((AccountInfoDouble(ACCOUNT_EQUITY) * SetDrawdownPercentToCloseAllOrders*-1/100),2) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
                 }

              }

   if(ActivateEA == true)
      if(ProfitPercentToCloseAllOrders == true)
         if(DrawdownPercentToCloseAllOrders == true)
            if(ClosePendingToo == false)


              {
               sComment = "========== EA IGNITION ==========" + nl;
               sComment = sComment + nl;
               sComment = sComment + "Expert Advisor: Return Target Close 4.0" + nl;
               sComment = sComment + "EA Status: ROBOT ON" + nl;
               sComment = sComment + "Initial Equity: " + DoubleToString(IndicateInitialEquity) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Current Equity: " + DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY)) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Market: " + Symbol()+ nl;
               sComment = sComment + "Current Spread: " + DoubleToString(CurrentSpread) + " Pips " + nl;
               sComment = sComment + "SELL Price: " + DoubleToString(Bid) + nl;
               sComment = sComment + "BUY Price: " + DoubleToString(Ask) + nl;
               sComment = sComment + "Profit Close All Orders System: ACTIVATED" + nl;
               sComment = sComment + "Drawdown Close All Orders System: ACTIVATED" + nl;
               sComment = sComment + "Close Pending Orders System: DEACTIVATED" + nl;
               sComment = sComment + "Percentage of Equity Benefit to Close All Orders: " +  DoubleToString(SetProfitPercentToCloseAllOrders) + "%" + nl;
               sComment = sComment + "Percentage of Equity Lose to Close All Orders: " +  DoubleToString(SetDrawdownPercentToCloseAllOrders) + "%" + nl;
               sComment = sComment + "Minimum Profit to Close All Orders: " + DoubleToString((AccountInfoDouble(ACCOUNT_EQUITY) * SetProfitPercentToCloseAllOrders/100),2) + " " +AccountInfoString(ACCOUNT_CURRENCY)  + nl;
               sComment = sComment + "Minimum Lose to Close All Orders: " + DoubleToString((AccountInfoDouble(ACCOUNT_EQUITY) * SetDrawdownPercentToCloseAllOrders*-1/100),2) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;

              }


   if(ActivateEA == true)
      if(ProfitPercentToCloseAllOrders == false)
         if(DrawdownPercentToCloseAllOrders == true)
            if(ClosePendingToo == true)

              {

               sComment = "========== EA IGNITION ==========" + nl;
               sComment = sComment + nl;
               sComment = sComment + "Expert Advisor: Return Target Close 4.0" + nl;
               sComment = sComment + "EA Status: ROBOT ON" + nl;
               sComment = sComment + "Initial Equity: " + DoubleToString(IndicateInitialEquity) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Current Equity: " + DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY)) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Market: " + Symbol()+ nl;
               sComment = sComment + "Current Spread: " + DoubleToString(CurrentSpread) + " Pips " + nl;
               sComment = sComment + "SELL Price: " + DoubleToString(Bid) + nl;
               sComment = sComment + "BUY Price: " + DoubleToString(Ask) + nl;
               sComment = sComment + "Profit Close All Orders System: DEACTIVATED" + nl;
               sComment = sComment + "Drawdown Close All Orders System: ACTIVATED" + nl;
               sComment = sComment + "Close Pending Orders System: ACTIVATED" + nl;
               sComment = sComment + "Percentage of Equity Lose to Close All Orders: " +  DoubleToString(SetDrawdownPercentToCloseAllOrders) + "%" + nl;
               sComment = sComment + "Minimum Lose to Close All Orders: " + DoubleToString((AccountInfoDouble(ACCOUNT_EQUITY) * SetDrawdownPercentToCloseAllOrders*-1/100),2) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;

              }

   if(ActivateEA == true)
      if(ProfitPercentToCloseAllOrders == false)
         if(DrawdownPercentToCloseAllOrders == true)
            if(ClosePendingToo == false)

              {

               sComment = "========== EA IGNITION ==========" + nl;
               sComment = sComment + nl;
               sComment = sComment + "Expert Advisor: Return Target Close 4.0" + nl;
               sComment = sComment + "EA Status: ROBOT ON" + nl;
               sComment = sComment + "Initial Equity: " + DoubleToString(IndicateInitialEquity) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Current Equity: " + DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY)) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Market: " + Symbol()+ nl;
               sComment = sComment + "Current Spread: " + DoubleToString(CurrentSpread) + " Pips " + nl;
               sComment = sComment + "SELL Price: " + DoubleToString(Bid) + nl;
               sComment = sComment + "BUY Price: " + DoubleToString(Ask) + nl;
               sComment = sComment + "Profit Close All Orders System: DEACTIVATED" + nl;
               sComment = sComment + "Drawdown Close All Orders System: ACTIVATED" + nl;
               sComment = sComment + "Close Pending Orders System: DEACTIVATED" + nl;
               sComment = sComment + "Percentage of Equity Lose to Close All Orders: " +  DoubleToString(SetDrawdownPercentToCloseAllOrders) + "%" + nl;
               sComment = sComment + "Minimum Lose to Close All Orders: " + DoubleToString((AccountInfoDouble(ACCOUNT_EQUITY) * SetDrawdownPercentToCloseAllOrders*-1/100),2) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;

              }

   if(ActivateEA == true)
      if(ProfitPercentToCloseAllOrders == true)
         if(DrawdownPercentToCloseAllOrders == false)
            if(ClosePendingToo == true)

              {

               sComment = "========== EA IGNITION ==========" + nl;
               sComment = sComment + nl;
               sComment = sComment + "Expert Advisor: Return Target Close 4.0" + nl;
               sComment = sComment + "EA Status: ROBOT ON" + nl;
               sComment = sComment + "Initial Equity: " + DoubleToString(IndicateInitialEquity) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Current Equity: " + DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY)) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Market: " + Symbol()+ nl;
               sComment = sComment + "Current Spread: " + DoubleToString(CurrentSpread) + " Pips " + nl;
               sComment = sComment + "SELL Price: " + DoubleToString(Bid) + nl;
               sComment = sComment + "BUY Price: " + DoubleToString(Ask) + nl;
               sComment = sComment + "Profit Close All Orders System: ACTIVATED" + nl;
               sComment = sComment + "Drawdown Close All Orders System: DEACTIVATED" + nl;
               sComment = sComment + "Close Pending Orders System: ACTIVATED" + nl;
               sComment = sComment + "Percentage of Equity Benefit to Close All Orders: " +  DoubleToString(SetProfitPercentToCloseAllOrders) + "%" + nl;
               sComment = sComment + "Minimum Profit to Close All Orders: " + DoubleToString((AccountInfoDouble(ACCOUNT_EQUITY) * SetProfitPercentToCloseAllOrders/100),2) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
              }

   if(ActivateEA == true)
      if(ProfitPercentToCloseAllOrders == true)
         if(DrawdownPercentToCloseAllOrders == false)
            if(ClosePendingToo == false)

              {

               sComment = "========== EA IGNITION ==========" + nl;
               sComment = sComment + nl;
               sComment = sComment + "Expert Advisor: Return Target Close 4.0" + nl;
               sComment = sComment + "EA Status: ROBOT ON" + nl;
               sComment = sComment + "Initial Equity: " + DoubleToString(IndicateInitialEquity) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Current Equity: " + DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY)) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Market: " + Symbol()+ nl;
               sComment = sComment + "Current Spread: " + DoubleToString(CurrentSpread) + " Pips " + nl;
               sComment = sComment + "SELL Price: " + DoubleToString(Bid) + nl;
               sComment = sComment + "BUY Price: " + DoubleToString(Ask) + nl;
               sComment = sComment + "Profit Close All Orders System: ACTIVATED" + nl;
               sComment = sComment + "Drawdown Close All Orders System: DEACTIVATED" + nl;
               sComment = sComment + "Close Pending Orders System: DEACTIVATED" + nl;
               sComment = sComment + "Percentage of Equity Benefit to Close All Orders: " +  DoubleToString(SetProfitPercentToCloseAllOrders) + "%" + nl;
               sComment = sComment + "Minimum Profit to Close All Orders: " + DoubleToString((AccountInfoDouble(ACCOUNT_EQUITY) * SetProfitPercentToCloseAllOrders/100),2) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
              }



   if(ActivateEA == true)
      if(ProfitPercentToCloseAllOrders == false)
         if(DrawdownPercentToCloseAllOrders == false)
            if(ClosePendingToo == true)

              {

               sComment = "========== EA IGNITION ==========" + nl;
               sComment = sComment + nl;
               sComment = sComment + "Expert Advisor: Return Target Close 4.0" + nl;
               sComment = sComment + "EA Status: ROBOT ON" + nl;
               sComment = sComment + "Initial Equity: " + DoubleToString(IndicateInitialEquity) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Current Equity: " + DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY)) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Market: " + Symbol()+ nl;
               sComment = sComment + "Current Spread: " + DoubleToString(CurrentSpread) + " Pips " + nl;
               sComment = sComment + "SELL Price: " + DoubleToString(Bid) + nl;
               sComment = sComment + "BUY Price: " + DoubleToString(Ask) + nl;
               sComment = sComment + "Profit Close All Orders System: DEACTIVATED" + nl;
               sComment = sComment + "Drawdown Close All Orders System: DEACTIVATED" + nl;
               sComment = sComment + "Close Pending Orders System: ACTIVATED" + nl;

              }

   if(ActivateEA == true)
      if(ProfitPercentToCloseAllOrders == false)
         if(DrawdownPercentToCloseAllOrders == false)
            if(ClosePendingToo == false)

              {

               sComment = "========== EA IGNITION ==========" + nl;
               sComment = sComment + nl;
               sComment = sComment + "Expert Advisor: Return Target Close 4.0" + nl;
               sComment = sComment + "EA Status: ROBOT ON" + nl;
               sComment = sComment + "Initial Equity: " + DoubleToString(IndicateInitialEquity) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Current Equity: " + DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY)) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
               sComment = sComment + "Market: " + Symbol()+ nl;
               sComment = sComment + "Current Spread: " + DoubleToString(CurrentSpread) + " Pips " + nl;
               sComment = sComment + "SELL Price: " + DoubleToString(Bid) + nl;
               sComment = sComment + "BUY Price: " + DoubleToString(Ask) + nl;
               sComment = sComment + "Profit Close All Orders System: DEACTIVATED" + nl;
               sComment = sComment + "Drawdown Close All Orders System: DEACTIVATED" + nl;
               sComment = sComment + "Close Pending Orders System: DEACTIVATED" + nl;

              }



   if(ActivateEA == true)

     {
      sComment = sComment + nl;
      sComment = sComment + "========== EA CURRENT PERFORMANCE ==========" + nl;
      sComment = sComment + nl;
      sComment = sComment + "Current Percentage of Risk Capital: " + DoubleToString((AccountInfoDouble(ACCOUNT_EQUITY) -AccountInfoDouble(ACCOUNT_MARGIN_FREE)) / (AccountInfoDouble(ACCOUNT_EQUITY) * 100),2) + " % " + nl;
      sComment = sComment + "Current Profitability: " + DoubleToString((-1+AccountInfoDouble(ACCOUNT_EQUITY)/IndicateInitialEquity)*100,2) + "%" + nl;
      sComment = sComment + "Account Balance updated: " + DoubleToString((IndicateInitialEquity - AccountInfoDouble(ACCOUNT_EQUITY))* -1,2) + " " + AccountInfoString(ACCOUNT_CURRENCY) + nl;
      sComment = sComment + nl;

     }


   Comment(sComment);

   return;
  }
//+------------------------------------------------------------------+
