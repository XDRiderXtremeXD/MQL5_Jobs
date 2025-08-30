//+------------------------------------------------------------------+
//|                                                     Controls.mq5 |
//|                             Copyright 2000-2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2000-2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#include "ControlsDialog.mqh"


input string PrimerActivo_="AUDUSD";
input double PrimerLotaje_=0.01;
input string SegundoActivo_="EURUSD";
input double SegundoLotaje_=0.01;
input bool Primer_Activo_Es_Compra_=true;
input double Close_At_=100;
//+------------------------------------------------------------------+
//| Global Variables                                                 |
//+------------------------------------------------------------------+
CControlsDialog ExtDialog();

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   bool custom;
   if(!SymbolExist(PrimerActivo_,custom))
     {
      Alert(PrimerActivo_," no existe en esta cuenta");
      return INIT_PARAMETERS_INCORRECT;
     }
   if(!SymbolExist(SegundoActivo_,custom))
     {
      Alert(SegundoActivo_," no existe en esta cuenta");
      return INIT_PARAMETERS_INCORRECT;
     }

//--- create application dialog
   if(!ExtDialog.Create(0,"Controls",0,20,20,360,350,
                        PrimerActivo_,
                        PrimerLotaje_,
                        SegundoActivo_,
                        SegundoLotaje_,
                        Primer_Activo_Es_Compra_,
                        Close_At_))
      return(INIT_FAILED);
//--- run application
   ExtDialog.Run();

   EventSetMillisecondTimer(1);
//--- succeed
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy dialog
   ExtDialog.SaveParameters(reason);
   ExtDialog.Destroy(reason);
   EventKillTimer();
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
//--- destroy dialog
   ExtDialog.ActualizarBasket();
  }
//+------------------------------------------------------------------+
