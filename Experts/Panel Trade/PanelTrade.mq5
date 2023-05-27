//+------------------------------------------------------------------+
//|                                                   PanelTrade.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2009-2017, MetaQuotes Software Corp."
#property link      "http://www.mql5.com"
#property version   "1.00"
#include "ControlsPanelTrade.mqh"

input double Volumen=0.01;//Volumen Default
input int Posiciones=1;//Posiciones Default
input int SL=0;//SL Default
input int TP=0;//TP Default
input bool Contar_Posiciones_del_Bot=true;//Contar solo operaciones abiertas por el bot
input bool Solicitar_Confirmacion=false;//Solicitar confirmacion en los botones
input int SizeLetras=11;//Tamaño de letas
input int MagicNumber=127645;//Numero Magico
input string Colores="----------------- COLORES -----------------";//------------------------
input color Color_Buy=clrLime;//Color Buy
input color Color_Sell=clrRed;//Color Sell
input color Color_Modificar_TP=clrLightCyan;//Color Modificar TP
input color Color_Modificar_SL=clrLightPink;//Color Modificar SL
input color Color_Cerrar_Positivas=clrDeepSkyBlue;//Color Cerrar Positivas
input color Color_Cerrar_Negativas=clrCoral;//Color Cerrar Negativas
input color Color_Cerrar_Todas=clrOrchid;//Color Cerrar Todas


#include<Trade\Trade.mqh>
CTrade Trade;


int OrdenesACT=0;
int PosicionesACT=0;
//+------------------------------------------------------------------+
//| Global Variables                                                 |
//+------------------------------------------------------------------+
CControlsDialog ExtDialog;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   OrdenesACT=0;
   PosicionesACT=0;

   int TProfit=GlobalVariableCheck(string(ChartID())+" TakeProfit ControlPanel")?(int)GlobalVariableGet(string(ChartID())+" TakeProfit ControlPanel"):TP;
   int SLoss=GlobalVariableCheck(string(ChartID())+" StopLoss ControlPanel")?(int)GlobalVariableGet(string(ChartID())+" StopLoss ControlPanel"):SL;
   int PosicionesInit=GlobalVariableCheck(string(ChartID())+" Posiciones ControlPanel")?(int)GlobalVariableGet(string(ChartID())+" Posiciones ControlPanel"):Posiciones;
   double VolumenInit=GlobalVariableCheck(string(ChartID())+" Volumen ControlPanel")?GlobalVariableGet(string(ChartID())+" Volumen ControlPanel"):Volumen;

   VerificarLoteValido(VolumenInit,Symbol());
   GlobalVariableSet(string(ChartID())+" Volumen ControlPanel",VolumenInit);

//--- create application dialog
   if(!ExtDialog.Create(0,"Panel Trade",0,10,30,370,334,TProfit,SLoss,VolumenInit,PosicionesInit,MagicNumber,Contar_Posiciones_del_Bot,Solicitar_Confirmacion
                        ,Color_Buy,Color_Sell,Color_Modificar_TP,Color_Modificar_SL,Color_Cerrar_Positivas,Color_Cerrar_Negativas,Color_Cerrar_Todas,SizeLetras))
      return(INIT_FAILED);


   Trade.SetExpertMagicNumber(MagicNumber);
//--- run application
   ExtDialog.Run();

   EventSetMillisecondTimer(1);
//--- succeed
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   ;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   int Ordenes=0;
   int Posiciones_=0;
   ActualizarPos();

  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {

   if(reason!=REASON_CHARTCHANGE)
     {
      GlobalVariableDel(string(ChartID())+" TakeProfit ControlPanel");
      GlobalVariableDel(string(ChartID())+" StopLoss ControlPanel");
      GlobalVariableDel(string(ChartID())+" Posiciones ControlPanel");
      GlobalVariableDel(string(ChartID())+" Volumen ControlPanel");
      GlobalVariableDel(string(ChartID())+" X ControlPanel");
      GlobalVariableDel(string(ChartID())+" Y ControlPanel");
     }

//--- destroy dialog
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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ActualizarPos()
  {
   int Total=PositionsTotal();


   if(Total!=PosicionesACT)
     {
      int OrdenesTotales=0;

      for(int i=Total-1; i>=0; i--)
        {
         ulong Ticket=PositionGetTicket(i);
         if(Ticket==0)
            continue;

         if(Contar_Posiciones_del_Bot && PositionGetInteger(POSITION_MAGIC)!=MagicNumber)
            continue;

         if(PositionGetString(POSITION_SYMBOL)!=Symbol())
            continue;

         OrdenesTotales++;
        }

      if(OrdenesTotales!=OrdenesACT)
        {
         OrdenesACT=OrdenesTotales;
         ExtDialog.ActualizarPosiciones(OrdenesTotales);
         ChartRedraw();
        }

      PosicionesACT=Total;
     }

  }
//+------------------------------------------------------------------+
