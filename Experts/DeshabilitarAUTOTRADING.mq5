//+------------------------------------------------------------------+
//|                                      DeshabilitarAUTOTRADING.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"


#define MT_WMCMD_EXPERTS   32851
#define WM_COMMAND 0x0111
#define GA_ROOT    2
#include <WinAPI\winapi.mqh>

input int NivelMargen_Cerrar=1000;
input int NivelMargen_Abrir=5000;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

string Comentario="";


datetime UNTIL=D'2022.10.05 00:00'; 

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   if(NivelMargen_Cerrar>NivelMargen_Abrir){
   Alert("El nivel de Margen para cerrar tiene que ser menor al nivel de margen para abrir");
      return (INIT_FAILED);
   }

   if(UNTIL<TimeCurrent())
     {
      Alert("Tiempo de prueba finalizado el dia "+TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
      return (INIT_FAILED);
     }
   else
      Comentario+="Tiempo de prueba hasta el dia "+TimeToString(UNTIL,TIME_DATE|TIME_MINUTES)+"\n";



   return(INIT_SUCCEEDED);
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
   if(UNTIL<TimeCurrent())
     {
      Comment("Tiempo de prueba finalizado el dia ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
      ExpertRemove();
     }

   Comentario+="Nivel de Margen Actual: "+DoubleToString(AccountInfoDouble(ACCOUNT_MARGIN_LEVEL),2)+"\nNivel de Margen para cerrar: "+IntegerToString(NivelMargen_Cerrar)
               +"\nNivel de Margen para abrir "+IntegerToString(NivelMargen_Abrir);

   Comment(Comentario);

   if(AccountInfoDouble(ACCOUNT_MARGIN_LEVEL)!=0)
     {
      if(AccountInfoDouble(ACCOUNT_MARGIN_LEVEL)<NivelMargen_Cerrar)
         AlgoTradingStatus(false);

      if(AccountInfoDouble(ACCOUNT_MARGIN_LEVEL)>NivelMargen_Abrir)
         AlgoTradingStatus(true);
     }

  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void AlgoTradingStatus(bool Enable)
  {
   bool Status = (bool) TerminalInfoInteger(TERMINAL_TRADE_ALLOWED);

   if(Enable != Status)
     {
      HANDLE hChart = (HANDLE) ChartGetInteger(ChartID(), CHART_WINDOW_HANDLE);
      PostMessageW(GetAncestor(hChart, GA_ROOT), WM_COMMAND, MT_WMCMD_EXPERTS, 0);
     }
  }
//+------------------------------------------------------------------+
