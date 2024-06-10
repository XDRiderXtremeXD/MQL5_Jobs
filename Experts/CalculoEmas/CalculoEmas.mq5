//+------------------------------------------------------------------+
//|                                                  CalculoEmas.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"


#include "ControlsDialog.mqh"

input string S0="=== LINEAS ULTIMAS=================";//=======================================
input string S1="Variables para InterCompra e InterVenta";//=======================================
input ENUM_LINE_STYLE styleInterCompra = STYLE_SOLID;
input int widthInterCompra = 2;
input color clrInterCompra = "C'0,0,128'";
input ENUM_LINE_STYLE styleInterVenta = STYLE_SOLID;
input color clrInterVenta = "C'0,0,128'";
input int widthInterVenta = 2;
input string S2="Variables para MaxCompra y MaxVenta";//=======================================
input ENUM_LINE_STYLE styleMaxCompra = STYLE_SOLID;
input int widthMaxCompra = 2;
input color clrMaxCompra = "C'0,0,128'";
input ENUM_LINE_STYLE styleMaxVenta = STYLE_SOLID;
input int widthMaxVenta = 2;
input color clrMaxVenta = "C'0,0,128'";
input string S3="Variables para SobreCompra y SobreVenta";//=======================================
input ENUM_LINE_STYLE styleSobreCompra = STYLE_DASHDOT;
input int widthSobreCompra = 1;
input color clrSobreCompra = "C'128,128,255'";
input ENUM_LINE_STYLE styleSobreVenta = STYLE_DASHDOT;
input int widthSobreVenta = 1;
input color clrSobreVenta = "C'128,128,255'";
input string S4="Emas Automatico";//=======================================
input int Ma_Periodo_Fast=3;
input int Ma_Periodo_Slow=9;
input ENUM_MA_METHOD Ma_Method=MODE_EMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;



//+------------------------------------------------------------------+
//| Global Variables                                                 |
//+------------------------------------------------------------------+
CControlsDialog ExtDialog;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

//--- create application dialog
   if(!ExtDialog.Create(0,"Indicador Sobre Compra y Venta",0,20,20,520,540,
                        styleInterCompra, styleInterVenta,
                        widthInterCompra, widthInterVenta,
                        clrInterCompra, clrInterVenta,
                        styleMaxCompra, styleMaxVenta,
                        widthMaxCompra, widthMaxVenta,
                        clrMaxCompra, clrMaxVenta,
                        styleSobreCompra, styleSobreVenta,
                        widthSobreCompra, widthSobreVenta,
                        clrSobreCompra, clrSobreVenta,
                        Ma_Periodo_Fast,Ma_Periodo_Slow,Ma_Method,Ma_AppliedPrice))
      return(INIT_FAILED);
//--- run application
   ExtDialog.Run();
   
   EventSetMillisecondTimer(1);
//--- succeed
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ExtDialog.OnDeinit_(reason);
//--- destroy dialog
   ExtDialog.Destroy(reason);
//---
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   ExtDialog.OnTick_();

  }
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // identificador de evento
                  const long& lparam,   // parámetro de evento del tipo long
                  const double& dparam, // parámetro de evento del tipo double
                  const string& sparam  // parámetro de evento del tipo string
                 )
  {

   ExtDialog.ChartEvent(id,lparam,dparam,sparam);
   ExtDialog.OnEvent_(id,lparam,dparam,sparam);

  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
