//+------------------------------------------------------------------+
//|                                                 ExpertBuffer.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#include "ControlExpertBuffer.mqh"

input double Volum=0.01;//Volumen
input int SLoss=30;//Stop Loss (Puntos)
input int TProfit=30;//Take Profit (Puntos)
input string Coment="Expert Buffer";//Comentario
input int MagicN=22222;//MagicNumber
input string S1="----------------- TESTING --------------------";
input string TESTING_Indicator="INDICADOR PATRONES PRO//PATRONES ANTIGUO PERSONALIZED V4";
input int TESTING_BufferBUY=0;
input int TESTING_BufferSELL=1;



datetime Until=D'2023.07.10 00:00';
//+------------------------------------------------------------------+
//| Global Variables                                                 |
//+------------------------------------------------------------------+
CControlsExpertBuffer ExtDialog;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(TimeCurrent()>Until)
     {
      Alert("Tiempo de prueba finalizado el dia ",TimeToString(Until,TIME_DATE|TIME_MINUTES));
      return(INIT_FAILED);
     }

   Comment("Tiempo limite hasta el dia ",TimeToString(Until,TIME_DATE|TIME_MINUTES));
//--- create application dialog
   if(!ExtDialog.Create(0,"Controls",0,20,20,360,324))
      return(INIT_FAILED);

   ExtDialog.ConfigurarTrade(Volum,SLoss,TProfit,Coment,MagicN);

   if(MQLInfoInteger(MQL_TESTER))
     {
      int handleTesting=iCustom(Symbol(),PERIOD_CURRENT,TESTING_Indicator);
      if(handleTesting==INVALID_HANDLE)
        {
         Alert("INDICADOR INVALIDO");
         return INIT_FAILED;
        }
      ExtDialog.ConfigurarTesting(handleTesting,TESTING_BufferBUY,TESTING_BufferSELL);
     }

//--- run application
   EventSetMillisecondTimer(1);
   ExtDialog.Run();



//--- succeed
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ExtDialog.OnDeinit_();
   EventKillTimer();
//--- destroy dialog
   ExtDialog.Destroy(reason);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   ExtDialog.OnTick_();
  }
//+------------------------------------------------------------------+
//| Expert chart event function                                      |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // event ID
                  const long& lparam,   // event parameter of the long type
                  const double& dparam, // event parameter of the double type
                  const string& sparam) // event parameter of the string type
  {
   ExtDialog.ChartEvent(id,lparam,dparam,sparam);
  }
//+------------------------------------------------------------------+
void OnTimer()
  {
   if(TimeCurrent()>Until)
      ExpertRemove();

   ExtDialog.OnTimer_();
  }
//+------------------------------------------------------------------+
