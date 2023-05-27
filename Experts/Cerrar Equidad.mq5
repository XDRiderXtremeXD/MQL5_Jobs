//+------------------------------------------------------------------+
//|                                               Cerrar Equidad.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;

input double Equidad_Inicial=400;//EQUIDAD INICIAL
input double Multiplicador_Equidad=1.2;
input string Parametros_Estilizador_Variados="---------- Parametros Estilizador Texto ----------";//*---
input int Size_Texto=10;
input ENUM_BASE_CORNER CORNER_BOTON=CORNER_LEFT_UPPER;
input int Desplazamiento_X=40;
input int Desplazamiento_Y=40;
input color ColorTexto=clrAqua;

string Texto_Nombre="001_Texto_Nombre_Equidad";
double Equidad=Equidad_Inicial;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   ENUM_ANCHOR_POINT ANCHOR=ANCHOR_LEFT_LOWER;
   if(CORNER_BOTON==CORNER_LEFT_UPPER)
      ANCHOR=ANCHOR_LEFT_UPPER;
   if(CORNER_BOTON==CORNER_LEFT_LOWER)
      ANCHOR=ANCHOR_LEFT_UPPER;
   if(CORNER_BOTON==CORNER_RIGHT_UPPER)
      ANCHOR=ANCHOR_RIGHT_UPPER;//Desplace1 y Desplace tamaño de Ancho de Cada Boton
   if(CORNER_BOTON==CORNER_RIGHT_LOWER)
      ANCHOR=ANCHOR_RIGHT_LOWER;
//Desplace1 y Desplace tamaño de Ancho de Cada Boton

   Equidad=Equidad_Inicial;

   if(ObjectFind(0,Texto_Nombre)!=0)
      LabelCreate(0,Texto_Nombre,0,Desplazamiento_X,Desplazamiento_Y,CORNER_BOTON,"Equidad para el Cierre: "+DoubleToString(Equidad,2),"Arial",Size_Texto,ColorTexto,0,ANCHOR,false,false,true,0);

   if(Equidad<AccountInfoDouble(ACCOUNT_BALANCE))
     {
      Alert("ERROR: EQUIDAD INICIAL MENOR AL BALANCE ACTUAL DE LA CUENTA, DEBE SER MAYOR");
      return INIT_PARAMETERS_INCORRECT;
     }

//---
   EventSetMillisecondTimer(1);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {

   if(ObjectFind(0,Texto_Nombre)==0)
      ObjectDelete(0,Texto_Nombre);

   EventKillTimer();

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
   FuncionCierre();

  }
//+------------------------------------------------------------------+
void FuncionCierre()
  {
   if(AccountInfoDouble(ACCOUNT_EQUITY)>=Equidad)
     {
      int TotalPosiciones=PositionsTotal();
      for(int i=TotalPosiciones-1; i>=0; i--)
        {
         ulong Ticket=PositionGetTicket(i);
         trade.PositionClose(Ticket,-1);
        }
      Equidad=Equidad*Multiplicador_Equidad;
      if(ObjectFind(0,Texto_Nombre)==0)
         ObjectSetString(0,Texto_Nombre,OBJPROP_TEXT,"Equidad para el Cierre: "+DoubleToString(Equidad,2));
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool LabelCreate(const long              chart_ID=0,               // chart's ID
                 const string            name="Label",             // label name
                 const int               sub_window=0,             // subwindow index
                 const int               x=0,                      // X coordinate
                 const int               y=0,                      // Y coordinate
                 const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                 const string            text="Label",             // text
                 const string            font="Arial",             // font
                 const int               font_size=10,             // font size
                 const color             clr=clrRed,               // color
                 const double            angle=0.0,                // text slope
                 const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // anchor type
                 const bool              back=false,               // in the background
                 const bool              selection=false,          // highlight to move
                 const bool              hidden=true,              // hidden in the object list
                 const long              z_order=0)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create a text label
   if(!ObjectCreate(chart_ID,name,OBJ_LABEL,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": failed to create text label! Error code = ",GetLastError());
      return(false);
     }
//--- set label coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set the chart's corner, relative to which point coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set the text
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- set text font
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- set font size
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- set the slope angle of the text
   ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);
//--- set anchor type
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
//--- set color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of moving the label by mouse
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- hide (true) or display (false) graphical object name in the object list
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- set the priority for receiving the event of a mouse click in the chart
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- successful execution
   return(true);
  }
//+------------------------------------------------------------------+
