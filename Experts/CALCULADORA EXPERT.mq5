//+------------------------------------------------------------------+
//|                                           CALCULADORA EXPERT.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;

string BUTTON_SELL="BOTON 2021 CREAR STOP LIMIT";
string BUTTON_BUY="BOTON 2021 DIBUJAR STOP LIMIT";

input double LOTE=0.1;
input double Porcentaje_SL=10;
input double Porcentaje_TP=10;
//input double Porcentaje_Lote=2.0;
input int MagicNumb=2000;
input string S1="-----------------------   CONFIGURACION BOTONES  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input ENUM_BASE_CORNER CORNER_BOTON=CORNER_LEFT_UPPER;
input int Boton_Desplazamiento_X=5;
input int Boton_Desplazamiento_Y=50;
input int SizeTexto=10;
input int Espacio=1;


datetime TiempoPrueba=D'2022.11.20 00:00';
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(TiempoPrueba<TimeCurrent())
     {
      Alert("Tiempo prueba terminado el dia ",TimeToString(TiempoPrueba,TIME_DATE|TIME_MINUTES));
      return INIT_FAILED;
     }
   Comment("Tiempo prueba hasta el dia ",TimeToString(TiempoPrueba,TIME_DATE|TIME_MINUTES));


   int Desplace=0;
   int Abajo=0;
   int Derecha=0;
   ENUM_ANCHOR_POINT ANCHOR=ANCHOR_LEFT_LOWER;
   if(CORNER_BOTON==CORNER_LEFT_UPPER)
     {
      ANCHOR=ANCHOR_LEFT_UPPER;
     }
   if(CORNER_BOTON==CORNER_LEFT_LOWER)
     {
      ANCHOR=ANCHOR_LEFT_LOWER;
      Abajo=1;
     }
   if(CORNER_BOTON==CORNER_RIGHT_UPPER)
     {
      Derecha=1;
      ANCHOR=ANCHOR_RIGHT_UPPER;
      Desplace=1;
     } //Desplace1 y Desplace tamaño de Ancho de Cada Boton
   if(CORNER_BOTON==CORNER_RIGHT_LOWER)
     {
      Derecha=1;
      ANCHOR=ANCHOR_RIGHT_UPPER;
      Desplace=1;
      Abajo=1;
     } //Desplace1 y Desplace tamaño de Ancho de Cada Boton


   int Size=int(SizeTexto*3/1.5);
   int Desplazamiento=Boton_Desplazamiento_X+Desplace;

   int DesplazamientoY=Abajo==1?(Boton_Desplazamiento_Y+int(SizeTexto*3/1.5)+Espacio):Boton_Desplazamiento_Y;

   Creacion_BOTONES(Desplazamiento,Desplace,DesplazamientoY,Derecha,Size);

   DesplazamientoY=Abajo==0?(Boton_Desplazamiento_Y+int(SizeTexto*3/1.5)+Espacio):Boton_Desplazamiento_Y;
   Desplazamiento=Boton_Desplazamiento_X+Desplace;

   ChartRedraw();

   trade.SetExpertMagicNumber(MagicNumb);
   
   
   Alert("APALANCAMIENTO   ",AccountInfoInteger(ACCOUNT_LEVERAGE));

   EventSetMillisecondTimer(1);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   if(reason==1 || reason==4 || reason==6 || reason==7 || reason==8)
     {
      ObjectsDeleteAll(0,"BOTON 2021",-1,OBJ_BUTTON);
     }
   Comment("");
   EventKillTimer();
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   if(TiempoPrueba<TimeCurrent())
     {
      Alert("Tiempo prueba terminado el dia ",TimeToString(TiempoPrueba,TIME_DATE|TIME_MINUTES));
      ExpertRemove();
     }

  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {

   if(ObjectFind(0,BUTTON_BUY)==0)
     {
      if(ObjectGetInteger(0,BUTTON_BUY,OBJPROP_STATE,0))
        {
         int DistanciaTP=0;
         int DistanciaSL=0;
         double Perdida=0;
         double Ganancia=0;
         CalcularDistancia(DistanciaTP,LOTE,Porcentaje_TP,Ganancia);
         CalcularDistancia(DistanciaSL,LOTE,Porcentaje_SL,Perdida);

         double Entrada=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
         double SL=NormalizeDouble(Entrada-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*DistanciaSL,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
         double TP=NormalizeDouble(Entrada+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*DistanciaTP,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
         bool Trade=trade.Buy(LOTE,Symbol(),Entrada,SL,TP,NULL);
         Perdida=Perdida*-1;
         if(!Trade)
            Alert("ERROR ",trade.ResultRetcode(),"| SL Calculado: ",SL,"| TP Calculado: ",TP,"| Perdida Calculada: ",Perdida,"| Ganancia Calculada: ",Ganancia);

         ObjectSetInteger(0,BUTTON_BUY,OBJPROP_STATE,false);
         ChartRedraw();
        }
     }


   if(ObjectFind(0,BUTTON_SELL)==0)
     {
      if(ObjectGetInteger(0,BUTTON_SELL,OBJPROP_STATE,0))
        {
         int DistanciaTP=0;
         int DistanciaSL=0;
         double Perdida=0;
         double Ganancia=0;
         CalcularDistancia(DistanciaTP,LOTE,Porcentaje_TP,Ganancia);
         CalcularDistancia(DistanciaSL,LOTE,Porcentaje_SL,Perdida);
         double Entrada=SymbolInfoDouble(Symbol(),SYMBOL_BID);
         double SL=NormalizeDouble(Entrada+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*DistanciaSL,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
         double TP=NormalizeDouble(Entrada-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*DistanciaTP,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
         bool Trade=trade.Sell(LOTE,Symbol(),Entrada,SL,TP,NULL);
          Perdida=Perdida*-1;
         if(!Trade)
            Alert("ERROR ",trade.ResultRetcode(),"| SL Calculado: ",SL,"| TP Calculado: ",TP,"| Perdida Calculada: ",Perdida,"| Ganancia Calculada: ",Ganancia);

         ObjectSetInteger(0,BUTTON_SELL,OBJPROP_STATE,false);
         ChartRedraw();
        }
     }

  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CalcularDistancia(int &Distancia,double Lotaje_,double Porcentaje,double &Profit)
  {
   double Tick_Value=SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE);
   double Perdida=AccountInfoDouble(ACCOUNT_BALANCE)*AccountInfoInteger(ACCOUNT_LEVERAGE)*(Porcentaje/100.0);
   Profit=Perdida;
   if(Porcentaje==Porcentaje_TP)
      Print("Ganancia ",Perdida);
   if(Porcentaje==Porcentaje_SL)
      Print("Perdida ",Perdida);
   Distancia=int(Perdida/(Tick_Value*Lotaje_));
   Print(Distancia);
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ButtonCreate(const long              chart_ID=0,               // chart's ID
                  const string            name="Button",            // button name
                  const int               sub_window=0,             // subwindow index
                  const int               x=0,                      // X coordinate
                  const int               y=0,                      // Y coordinate
                  const int               width=50,                 // button width
                  const int               height=18,                // button height
                  const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                  const string            text="Button",            // text
                  const string            font="Arial",             // font
                  const int               font_size=10,             // font size
                  const color             clr=clrBlack,             // text color
                  const color             back_clr=C'236,233,216',  // background color
                  const color             border_clr=clrNONE,       // border color
                  const bool              state=false,              // pressed/released
                  const bool              back=false,               // in the background
                  const bool              selection=false,          // highlight to move
                  const bool              hidden=true,              // hidden in the object list
                  const long              z_order=0)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create the button
   if(!ObjectCreate(chart_ID,name,OBJ_BUTTON,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": failed to create the button! Error code = ,Error ",(GetLastError()));
      return(false);
     }
//--- set button coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set button size
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- set the chart's corner, relative to which point coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set the text
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- set text font
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- set font size
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- set text color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set background color
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- set border color
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- set button state
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
//--- enable (true) or disable (false) the mode of moving the button by mouse
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




//+------------------------------------------------------------------+
bool EditCreate(const long             chart_ID=0,               // chart's ID
                const string           name="Edit",              // object name
                const int              sub_window=0,             // subwindow index
                const int              x=0,                      // X coordinate
                const int              y=0,                      // Y coordinate
                const int              width=50,                 // width
                const int              height=18,                // height
                const string           text="Text",              // text
                const string           font="Arial",             // font
                const int              font_size=10,             // font size
                const ENUM_ALIGN_MODE  align=ALIGN_CENTER,       // alignment type
                const bool             read_only=false,          // ability to edit
                const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                const color            clr=clrBlack,             // text color
                const color            back_clr=clrWhite,        // background color
                const color            border_clr=clrNONE,       // border color
                const bool             back=false,               // in the background
                const bool             selection=false,          // highlight to move
                const bool             hidden=true,              // hidden in the object list
                const long             z_order=0)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create edit field
   if(!ObjectCreate(chart_ID,name,OBJ_EDIT,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": failed to create \"Edit\" object! Error code = Error", (GetLastError()));
      return(false);
     }
//--- set object coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set object size
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- set the text
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- set text font
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- set font size
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- set the type of text alignment in the object
   ObjectSetInteger(chart_ID,name,OBJPROP_ALIGN,align);
//--- enable (true) or cancel (false) read-only mode
   ObjectSetInteger(chart_ID,name,OBJPROP_READONLY,read_only);
//--- set the chart's corner, relative to which object coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set text color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set background color
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- set border color
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
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


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Creacion_BOTONES(int Desplazamiento,int Desplace,int DesplazamientoY,int Derecha,int Size)
  {
   int j=0;

   for(int i=0; i<3; i++)
     {
      j=Derecha==0?i:MathAbs(2-i);

      if(j==0)
        {
         if(ObjectFind(0,BUTTON_SELL)!=0)
            ButtonCreate(0,BUTTON_SELL,0,Desplazamiento+(Desplace*(SizeTexto*15+2)),DesplazamientoY,SizeTexto*15+2,Size,CORNER_BOTON,"SELL","Arial",SizeTexto,clrWhite,clrRed,clrNONE,false,false,false,true,0);

         Desplazamiento=Desplazamiento+SizeTexto*15+2+Espacio;
        }
      if(j==1)
        {
         if(ObjectFind(0,BUTTON_BUY)!=0)
            ButtonCreate(0,BUTTON_BUY,0,Desplazamiento+(Desplace*(SizeTexto*15+2)),DesplazamientoY,SizeTexto*15+2,Size,CORNER_BOTON,"BUY","Arial",SizeTexto,clrWhite,clrGreen,clrNONE,false,false,false,true,0);

         Desplazamiento=Desplazamiento+SizeTexto*15+2+Espacio;
        }

      /* if(j==2)
         {
          if(ObjectFind(0,BOTON_SWITCH)!=0)
             ButtonCreate(0,BOTON_SWITCH,0,Desplazamiento+(Desplace*(SizeTexto*15+2)),DesplazamientoY,SizeTexto*15+2,Size,CORNER_BOTON,"STOP / LIMIT","Arial",SizeTexto,clrWhite,clrMagenta,clrNONE,false,false,false,true,0);
          else
            {
             if(!ObjectGetInteger(0,BOTON_SWITCH,OBJPROP_STATE,0))
               {
                IsStLi=true;
                EstadoSwitch=false;
               }
             else
               {
                EstadoSwitch=true;
                IsStLi=false;
               }
            }
          Desplazamiento=Desplazamiento+SizeTexto*15+2+Espacio;
         }*/
     }
  }
//+------------------------------------------------------------------+
