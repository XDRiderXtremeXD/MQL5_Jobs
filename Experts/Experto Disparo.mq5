//+------------------------------------------------------------------+
//|                                              Experto Disparo.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

string BOTONAUTO="BOTON 2021 AUTO";
string BOTONTS="BOTON 2021 TS";
string BOTONBUY="BOTON 2021 BUY";
string BOTONSELL="BOTON 2021 SELL";
string BOTONVOL="BOTON 2021 VOL";
string EDITVOL="BOTON 2021 VOL EDIT";
string BOTONTP="BOTON 2021 TP";
string EDITTP="BOTON 2021 TP EDIT";
string BOTONSL="BOTON 2021 SL";
string EDITSL="BOTON 2021 SL EDIT";

string BOTONOP="BOTON 2021 OP";
string BOTONPLUS="BOTON 2021 PL";

string BOTON_TS_START="BOTON 2021 TS START";
string BOTON_TS_STEP="BOTON 2021 TS STEP";

string EDIT_TS_START="BOTON 2021 TS START EDIT";
string EDIT_TS_STEP="BOTON 2021 TS STEP EDIT";

string BOTONBE="BOTON 2021 BE";
string BOTON_BE_START="BOTON 2021 BE START";
string BOTON_BE_STEP="BOTON 2021 BE STEP";

string EDIT_BE_START="BOTON 2021 BE START EDIT";
string EDIT_BE_STEP="BOTON 2021 BE STEP EDIT";

string EDIT_NAME_HORA="BOTON 2021 NAME_HORA";
string EDIT_HORA="BOTON 2021 HORA";
string EDIT_NAME_MINUTOS="BOTON 2021 NAME_MINUTOS";
string EDIT_MINUTOS="BOTON 2021 MINUTOS";
string EDIT_NAME_SEGUNDOS="BOTON 2021 NAME_SEGUNDOS";
string EDIT_SEGUNDOS="BOTON 2021 SEGUNDOS";

//LIBRERIA PARA HACER LAS OPERACIONES DE FORMA FACIL Y LAS OPCIONES PARA TRADEAR
#include<Trade\Trade.mqh>
CTrade trade;

enum ENUM_Horas {_0=0, _1_=1, _2=2, _3=3, _4=4, _5=5, _6=6, _7=7, _8=8, _9=9, _10=10, _11=11, _12=12,
                 _13=13, _14=14, _15=15, _16=16, _17=17, _18=18, _19=19, _20=20, _21=21, _22=22, _23=23,
                };

enum Modo
  {
   Manual=0,
   SemiAutomatico=1,
   Automatico=2,
  };


input Modo Modo_Trade=SemiAutomatico;
input string Horario="********************** Horario Disparo **********************";///******************************************************************************************************************************
input ENUM_Horas  Hora_Disparo=_0;
input uint Minuto_Disparo=10;
input uint Segundos_Disparo=0;
input ENUM_TIMEFRAMES TimeFrame_Vela_Evaluar=PERIOD_M5;
input string S1="********************** Configuracion Trade **********************";///*************************************************************************************************
input double Lote=0.01;
input int SL=100;//Stop Loss en Puntos
input int TP=100;//Take Profit en Puntos
input int MagicNumb=22222;
input string Comentario="Experto Disparo";
input string S2="********************** Configuracion Trailing **********************";///***********************************************************************************
input bool Activar_Trailing=true;
input int Trail_Start=100;//Empezar Trailing a X puntos en Positivo
input int Trail_Stop=100;//Mover Trailing a X puntos
input bool Activar_BreakEven=true;
input int Breakeven_Start=100;//BreakEven Start valor en puntos
input int Breakeven_Stop=0;//BreakEven Stop valor en puntos
input string S4="**********************   Configuracion Botones  **********************";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input ENUM_BASE_CORNER CORNER_BOTON=CORNER_LEFT_UPPER;
input int Boton_Desplazamiento_X=5;
input int Boton_Desplazamiento_Y=27;
input int SizeTexto=12;
input int Espacio=3;
input string S5="**********************   Configuracion Alertas  **********************";//-----------------------------
input bool AlertaMovil=false;


int TrailStop=0;
int TrailStart=0;
int SL_=0;
int TP_=0;
double Lote_=0.1;
int BreakevenStart=0;
int BreakevenStop=0;
int HoraDisparo=0;
int MinutoDisparo=0;
int SegundosDisparo=0;

string TS_Start_String_Anterior=" ";
string TS_Step_String_Anterior=" ";

string BE_Start_String_Anterior=" ";
string BE_Step_String_Anterior=" ";

string Vol_String_Anterior=" ";
string TP_String_Anterior=" ";
string SL_String_Anterior=" ";

string  Hora_String_Anterior=" ";
string  Minutos_String_Anterior=" ";
string Segundos_String_Anterior=" ";


bool ActivarBreakEven=true;
bool ActivarTrailing=true;

int ModoTrade=0;

datetime TiempoEntra=0;


//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   ModoTrade=Modo_Trade;
   TrailStart=Trail_Start;
   TrailStop=Trail_Stop;
   SL_=SL;
   TP_=TP;
   Lote_=Lote;
   BreakevenStart=Breakeven_Start;
   BreakevenStop=Breakeven_Stop;
   ActivarBreakEven=Activar_BreakEven;
   ActivarTrailing=Activar_Trailing;
   HoraDisparo=Hora_Disparo;
   MinutoDisparo=(int)Minuto_Disparo;
   SegundosDisparo=(int)Segundos_Disparo;

   TS_Start_String_Anterior=IntegerToString(TrailStart,0,' ');
   TS_Step_String_Anterior=IntegerToString(TrailStop,0,' ');

   BE_Start_String_Anterior=IntegerToString(BreakevenStart,0,' ');
   BE_Step_String_Anterior=IntegerToString(BreakevenStop,0,' ');

   Vol_String_Anterior=DoubleToString(Lote_);
   TP_String_Anterior=IntegerToString(TP_);
   SL_String_Anterior=IntegerToString(SL_);

   Hora_String_Anterior=DoubleToString(HoraDisparo);
   Minutos_String_Anterior=IntegerToString(MinutoDisparo);
   Segundos_String_Anterior=IntegerToString(SegundosDisparo);

   CrearBotonesEdits();

   if(Minuto_Disparo>59)
     {
      Alert("Minuto debe ser menor o igual a 59");
      return INIT_PARAMETERS_INCORRECT;
     }
   if(Segundos_Disparo>59)
     {
      Alert("Segundos debe ser menor o igual a 59");
      return INIT_PARAMETERS_INCORRECT;
     }



   EventSetMillisecondTimer(1);
//---
// SETEAR EL NUMERO MAGICO DEL EXPERTO
   trade.SetExpertMagicNumber(MagicNumb);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EventKillTimer();

   ObjectsDeleteAll(0,"BOTON 2021",-1,OBJ_BUTTON);
   ObjectsDeleteAll(0,"BOTON 2021",-1,OBJ_EDIT);

   ChartRedraw();

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   if(MQLInfoInteger(MQL_TESTER))
      OnTimer();

//---

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   ComprobarSegundos();
   ComprobarMinutos();
   ComprobarHora();
   ComprobarVolumen();
   ComprobarSL();
   ComprobarTP();
   BotonBE();
   BotonTS();
   CambiarModo();
   ComprobarBE();
   ComprobarTS();
   BotonBuy();
   BotonSell();
//Funcion Trailing
   TS_and_BE();

// COPIAR DATOS DEL TIEMPO ACTUAL A ESTRUCTURA PARA SACAR EL HORARIO Y MINUTO ACTUAL
   MqlDateTime TimeCURRENT;
   TimeToStruct(TimeCurrent(),TimeCURRENT);
///////////////////////////////////////////////////


/// COPIAR VELAS DEL TIMEFRAME QUE SE VA A EVALUAR
   bool Carga=false;
   MqlRates rates[];
   int copied=CopyRates(Symbol(),TimeFrame_Vela_Evaluar,0,3,rates);
   if(copied>0)
      Carga=true;
////////////////////////////////////////////////////////

//SI LLEGA AL HORARIO SE EJECUTA LA FUNCION
   if((TimeCURRENT.hour==HoraDisparo && TimeCURRENT.min==MinutoDisparo && TimeCURRENT.sec==SegundosDisparo) && (TiempoEntra==0 || TiempoEntra<TimeCurrent()))
     {
      if(MQLInfoInteger(MQL_TRADE_ALLOWED))
        {
         // SI CARGO LOS DATOS DE LA VELA A EVALUAR, SE EJECUTA LA FUNCION
         if(Carga)
           {
            // SI LA VELA ACTUAL ES UNA VELA ALCISTA GENERA UN BUY
            bool isBuy=rates[0].close>rates[0].open;

            if(ModoTrade==Automatico)
              {
               if(isBuy)
                  Buy();
               else
                  Sell();
              }
            else
               if(ModoTrade==SemiAutomatico)
                 {
                  if(AlertaMovil)
                     SendNotification("Deseas operar "+(isBuy?" Buy?":" Sell?")+" en "+Symbol());

                  datetime ToleranciaTime=TimeCurrent()+PeriodSeconds(PERIOD_M1)*2;
                  PlaySound("alert.wav");
                  if(MessageBox("Deseas operar "+(isBuy?" Buy?":" Sell?")+" en "+Symbol(),"Confirmacion",MB_YESNO)==IDYES)
                    {
                     if(ToleranciaTime>TimeCurrent())
                       {
                        if(isBuy)
                           Buy();
                        else
                           Sell();
                       }
                     else
                        Alert("No se opero por seguridad, ya que a pasado mas de 2 minutos");
                    }
                 }
           }
         else
           {
            Alert("ERROR NO CARGO LOS DATOS DEL TIMEFRAME DE LA VELA A EVALUAR");
           }
        }
      else
        {
         Alert("NO TIENE PERMISO PARA TRADEAR (Mercado Cerrado/Robot no habilitado)");
        }
      TiempoEntra=TimeCurrent()+PeriodSeconds(PERIOD_M1);
     }

  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TS_and_BE() // FUNCION DEL TS Y BREAK VEN
  {
   int Pocisiones=PositionsTotal();
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   for(int cnt=0; cnt<Pocisiones; cnt++) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;


      if(PositionGetString(POSITION_SYMBOL)==Symbol() && PositionGetInteger(POSITION_MAGIC)==MagicNumb) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
         //donde esta el experto.. entonces no lo evalua
        {
         if(ActivarBreakEven)
           {
            //BE Funcion
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && BreakevenStart>0 && (PositionGetDouble(POSITION_SL)<PositionGetDouble(POSITION_PRICE_OPEN)+Point()*BreakevenStop || PositionGetDouble(POSITION_SL)==0)
               && Bid-BreakevenStart*Point()>PositionGetDouble(POSITION_PRICE_OPEN) && Bid>PositionGetDouble(POSITION_PRICE_OPEN)+Point()*BreakevenStop)  //Si Operacion es un BUY y Breakeven>0 y StopLoss No esta en Precio de Entrada y El precio supera el Precio establecido para el BE
               if(!trade.PositionModify(Ticket,PositionGetDouble(POSITION_PRICE_OPEN)+Point()*BreakevenStop,PositionGetDouble(POSITION_TP)))
                  Print("No opero Modifico BE.. ERROR:",trade.ResultRetcode());

            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && BreakevenStart>0 && (PositionGetDouble(POSITION_SL)>PositionGetDouble(POSITION_PRICE_OPEN)-Point()*BreakevenStop || PositionGetDouble(POSITION_SL)==0)//Si Operacion es un SELL y Breakeven>0 y StopLoss No esta en Precio de Entrada y El precio supera el Precio establecido para el BE
               && Ask+BreakevenStart*Point()<PositionGetDouble(POSITION_PRICE_OPEN) && Ask<PositionGetDouble(POSITION_PRICE_OPEN)-Point()*BreakevenStop)
               if(!trade.PositionModify(Ticket,PositionGetDouble(POSITION_PRICE_OPEN)-Point()*BreakevenStop,PositionGetDouble(POSITION_TP)))
                  Print("No opero Modifico BE.. ERROR:",trade.ResultRetcode());
           }

         if(ActivarTrailing)
           {
            //TS Funcion
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY  && TrailStop>0 &&  NormalizeDouble(Bid-TrailStart*Point(),Digits())>PositionGetDouble(POSITION_PRICE_OPEN) && (NormalizeDouble(Bid-TrailStop*Point(),Digits())>PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0))
               if(!trade.PositionModify(Ticket,NormalizeDouble(Bid-TrailStop*Point(),Digits()),PositionGetDouble(POSITION_TP)))
                  Print("No opero Modifico TS.. ERROR:",trade.ResultRetcode());

            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && TrailStop>0  &&  NormalizeDouble(Ask+TrailStart*Point(),Digits())<PositionGetDouble(POSITION_PRICE_OPEN) && (NormalizeDouble(Ask+TrailStop*Point(),Digits())<PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0))
               if(!trade.PositionModify(Ticket,NormalizeDouble(Ask+TrailStop*Point(),Digits()),PositionGetDouble(POSITION_TP)))
                  Print("No opero Modifico TS.. ERROR:",trade.ResultRetcode());
           }

        }
     }
  }
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
            ": failed to create the button! Error code = Error(",GetLastError());
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
//|                                                                  |
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
            ": failed to create \"Edit\" object! Error code = Error(",GetLastError());
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
void  CrearBotonesEdits()
  {

   int Desplace=0;
   ENUM_ANCHOR_POINT ANCHOR=ANCHOR_LEFT_LOWER;
   if(CORNER_BOTON==CORNER_LEFT_UPPER)
      ANCHOR=ANCHOR_LEFT_UPPER;
   if(CORNER_BOTON==CORNER_LEFT_LOWER)
      ANCHOR=ANCHOR_LEFT_LOWER;
   if(CORNER_BOTON==CORNER_RIGHT_UPPER)
     {
      ANCHOR=ANCHOR_RIGHT_UPPER;
      Desplace=50;
     } //Desplace1 y Desplace tamaño de Ancho de Cada Boton
   if(CORNER_BOTON==CORNER_RIGHT_LOWER)
     {
      ANCHOR=ANCHOR_RIGHT_UPPER;
      Desplace=50;
     } //Desplace1 y Desplace tamaño de Ancho de Cada Boton


   int Size=int(SizeTexto*3/1.5);
   int Desplazamiento=Boton_Desplazamiento_X+Desplace;

   int Desplazamiento2=Desplazamiento;
   int Desplazamiento3=Desplazamiento;

   string Texto=ModoTrade==0?"Manual":(ModoTrade==1?"Semiautomatico":"Automatico");


   int DesplazamientoY=Boton_Desplazamiento_Y;

   if(ObjectFind(0,EDIT_NAME_HORA)!=0)
      EditCreate(0,EDIT_NAME_HORA,0,Desplazamiento3,DesplazamientoY,SizeTexto*6+6,Size,"HORA: ","Arial",SizeTexto,ALIGN_CENTER,true,CORNER_BOTON,clrBlack,clrDarkGray,clrRed,false,false,true,0);

   Desplazamiento3=Desplazamiento3+SizeTexto*6+6;

   if(ObjectFind(0,EDIT_HORA)!=0)
      EditCreate(0,EDIT_HORA,0,Desplazamiento3,DesplazamientoY,SizeTexto*4+6,Size,IntegerToString(HoraDisparo),"Arial",SizeTexto,ALIGN_CENTER,false,CORNER_BOTON,clrBlack,clrWhite,clrRed,false,false,true,0);

   Desplazamiento3=Desplazamiento3+SizeTexto*4+6+Espacio;

   if(ObjectFind(0,EDIT_NAME_MINUTOS)!=0)
      EditCreate(0,EDIT_NAME_MINUTOS,0,Desplazamiento3,DesplazamientoY,SizeTexto*7+6,Size,"MINUTOS: ","Arial",SizeTexto,ALIGN_CENTER,true,CORNER_BOTON,clrBlack,clrDarkGray,clrRed,false,false,true,0);

   Desplazamiento3=Desplazamiento3+SizeTexto*7+6;

   if(ObjectFind(0,EDIT_MINUTOS)!=0)
      EditCreate(0,EDIT_MINUTOS,0,Desplazamiento3,DesplazamientoY,SizeTexto*4+6,Size,IntegerToString(MinutoDisparo),"Arial",SizeTexto,ALIGN_CENTER,false,CORNER_BOTON,clrBlack,clrWhite,clrRed,false,false,true,0);

   Desplazamiento3=Desplazamiento3+SizeTexto*4+6+Espacio;

   if(ObjectFind(0,EDIT_NAME_SEGUNDOS)!=0)
      EditCreate(0,EDIT_NAME_SEGUNDOS,0,Desplazamiento3,DesplazamientoY,SizeTexto*10+6,Size,"SEGUNDOS: ","Arial",SizeTexto,ALIGN_CENTER,true,CORNER_BOTON,clrBlack,clrDarkGray,clrRed,false,false,true,0);

   Desplazamiento3=Desplazamiento3+SizeTexto*10+6;

   if(ObjectFind(0,EDIT_SEGUNDOS)!=0)
      EditCreate(0,EDIT_SEGUNDOS,0,Desplazamiento3,DesplazamientoY,SizeTexto*4+6,Size,IntegerToString(SegundosDisparo),"Arial",SizeTexto,ALIGN_CENTER,false,CORNER_BOTON,clrBlack,clrWhite,clrRed,false,false,true,0);

   Desplazamiento3=Desplazamiento3+SizeTexto*4+6+Espacio;

   if(ObjectFind(0,BOTONAUTO)!=0)
      ButtonCreate(0,BOTONAUTO,0,Desplazamiento3,DesplazamientoY,SizeTexto*14+2,Size,CORNER_BOTON,Texto,"Arial",SizeTexto,clrWhite,clrPurple,clrPurple,false,false,false,true,0);

   DesplazamientoY=DesplazamientoY+int(SizeTexto*3/1.5)+Espacio;

   if(ObjectFind(0,BOTONTS)!=0)
      ButtonCreate(0,BOTONTS,0,Desplazamiento2,DesplazamientoY,SizeTexto*3+2,Size,CORNER_BOTON,"TS","Arial",SizeTexto,clrWhite,ActivarTrailing?clrGreen:clrOrangeRed,ActivarTrailing?clrGreen:clrOrangeRed,ActivarTrailing,false,false,true,0);

   Desplazamiento2=Desplazamiento2+Espacio+SizeTexto*3+2;

   if(ObjectFind(0,BOTON_TS_START)!=0)
      ButtonCreate(0,BOTON_TS_START,0,Desplazamiento2,DesplazamientoY,SizeTexto*8+2,Size,CORNER_BOTON,"TS START:","Arial",SizeTexto,clrBlack,clrDarkGray,clrRed,false,false,false,true,0);

   Desplazamiento2=Desplazamiento2+SizeTexto*8+2;

   if(ObjectFind(0,EDIT_TS_START)!=0)
      EditCreate(0,EDIT_TS_START,0,Desplazamiento2,DesplazamientoY,SizeTexto*4+6,Size,IntegerToString(TrailStart),"Arial",SizeTexto,ALIGN_CENTER,false,CORNER_BOTON,clrBlack,clrWhite,clrRed,false,false,true,0);

   Desplazamiento2=Desplazamiento2+SizeTexto*4+6+Espacio;

   if(ObjectFind(0,BOTON_TS_STEP)!=0)
      ButtonCreate(0,BOTON_TS_STEP,0,Desplazamiento2,DesplazamientoY,SizeTexto*8+2,Size,CORNER_BOTON,"TS STEP:","Arial",SizeTexto,clrBlack,clrDarkGray,clrRed,false,false,false,true,0);

   Desplazamiento2=Desplazamiento2+SizeTexto*8+2;

   if(ObjectFind(0,EDIT_TS_STEP)!=0)
      EditCreate(0,EDIT_TS_STEP,0,Desplazamiento2,DesplazamientoY,SizeTexto*4+6,Size,IntegerToString(TrailStop),"Arial",SizeTexto,ALIGN_CENTER,false,CORNER_BOTON,clrBlack,clrWhite,clrRed,false,false,true,0);

   Desplazamiento2=Desplazamiento2+SizeTexto*4+6+Espacio;

   if(ObjectFind(0,BOTONBE)!=0)
      ButtonCreate(0,BOTONBE,0,Desplazamiento2,DesplazamientoY,SizeTexto*3+2,Size,CORNER_BOTON,"BE","Arial",SizeTexto,clrWhite,ActivarBreakEven?clrGreen:clrOrangeRed,ActivarBreakEven?clrGreen:clrOrangeRed,ActivarBreakEven,false,false,true,0);

   Desplazamiento2=Desplazamiento2+Espacio+SizeTexto*3+2;

   if(ObjectFind(0,BOTON_BE_START)!=0)
      ButtonCreate(0,BOTON_BE_START,0,Desplazamiento2,DesplazamientoY,SizeTexto*8+2,Size,CORNER_BOTON,"BE START:","Arial",SizeTexto,clrBlack,clrDarkGray,clrRed,false,false,false,true,0);

   Desplazamiento2=Desplazamiento2+SizeTexto*8+2;

   if(ObjectFind(0,EDIT_BE_START)!=0)
      EditCreate(0,EDIT_BE_START,0,Desplazamiento2,DesplazamientoY,SizeTexto*4+6,Size,IntegerToString(BreakevenStart),"Arial",SizeTexto,ALIGN_CENTER,false,CORNER_BOTON,clrBlack,clrWhite,clrRed,false,false,true,0);

   Desplazamiento2=Desplazamiento2+SizeTexto*4+6+Espacio;

   if(ObjectFind(0,BOTON_BE_STEP)!=0)
      ButtonCreate(0,BOTON_BE_STEP,0,Desplazamiento2,DesplazamientoY,SizeTexto*8+2,Size,CORNER_BOTON,"BE STOP:","Arial",SizeTexto,clrBlack,clrDarkGray,clrRed,false,false,false,true,0);

   Desplazamiento2=Desplazamiento2+SizeTexto*8+2;

   if(ObjectFind(0,EDIT_BE_STEP)!=0)
      EditCreate(0,EDIT_BE_STEP,0,Desplazamiento2,DesplazamientoY,SizeTexto*4+6,Size,IntegerToString(BreakevenStop),"Arial",SizeTexto,ALIGN_CENTER,false,CORNER_BOTON,clrBlack,clrWhite,clrRed,false,false,true,0);


   DesplazamientoY=DesplazamientoY+int(SizeTexto*3/1.5)+Espacio;



   if(ObjectFind(0,BOTONBUY)!=0)
      ButtonCreate(0,BOTONBUY,0,Desplazamiento,DesplazamientoY,SizeTexto*3+4,Size,CORNER_BOTON,"BUY","Arial",SizeTexto,clrWhite,clrGreen,clrGreen,false,false,false,true,0);

   Desplazamiento=Desplazamiento+Espacio+SizeTexto*3+4;

   if(ObjectFind(0,BOTONSELL)!=0)
      ButtonCreate(0,BOTONSELL,0,Desplazamiento,DesplazamientoY,SizeTexto*4+4,Size,CORNER_BOTON,"SELL","Arial",SizeTexto,clrWhite,clrRed,clrRed,false,false,false,true,0);


   Desplazamiento=Desplazamiento+Espacio+SizeTexto*4+4;

   if(ObjectFind(0,BOTONVOL)!=0)
      ButtonCreate(0,BOTONVOL,0,Desplazamiento,DesplazamientoY,SizeTexto*4+2,Size,CORNER_BOTON,"Vol:","Arial",SizeTexto,clrBlack,clrDarkGray,clrRed,false,false,false,true,0);


   Desplazamiento=Desplazamiento+SizeTexto*4+2;

   if(ObjectFind(0,EDITVOL)!=0)
      EditCreate(0,EDITVOL,0,Desplazamiento,DesplazamientoY,SizeTexto*4+6,Size,DoubleToString(Lote_,2),"Arial",SizeTexto,ALIGN_CENTER,false,CORNER_BOTON,clrBlack,clrWhite,clrRed,false,false,true,0);


   Desplazamiento=Desplazamiento+Espacio+SizeTexto*4+6;

   if(ObjectFind(0,BOTONTP)!=0)
      ButtonCreate(0,BOTONTP,0,Desplazamiento,DesplazamientoY,SizeTexto*4+2,Size,CORNER_BOTON,"TP:","Arial",SizeTexto,clrBlack,clrDarkGray,clrRed,false,false,false,true,0);


   Desplazamiento=Desplazamiento+SizeTexto*4+2;

   if(ObjectFind(0,EDITTP)!=0)
      EditCreate(0,EDITTP,0,Desplazamiento,DesplazamientoY,SizeTexto*4+6,Size,IntegerToString(TP_,0,' '),"Arial",SizeTexto,ALIGN_CENTER,false,CORNER_BOTON,clrBlack,clrWhite,clrRed,false,false,true,0);



   Desplazamiento=Desplazamiento+Espacio+SizeTexto*4+6;

   if(ObjectFind(0,BOTONSL)!=0)
      ButtonCreate(0,BOTONSL,0,Desplazamiento,DesplazamientoY,SizeTexto*4+2,Size,CORNER_BOTON,"SL:","Arial",SizeTexto,clrBlack,clrDarkGray,clrRed,false,false,false,true,0);


   Desplazamiento=Desplazamiento+SizeTexto*4+2;

   if(ObjectFind(0,EDITSL)!=0)
      EditCreate(0,EDITSL,0,Desplazamiento,DesplazamientoY,SizeTexto*4+6,Size,IntegerToString(SL_,0,' '),"Arial",SizeTexto,ALIGN_CENTER,false,CORNER_BOTON,clrBlack,clrWhite,clrRed,false,false,true,0);
   ChartRedraw();
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ComprobarTS()
  {
   if(ObjectFind(0,EDIT_TS_START)==0)
     {
      string Valor=ObjectGetString(0,EDIT_TS_START,OBJPROP_TEXT,0);
      if(TS_Start_String_Anterior!=Valor)
        {
         Valor=ModificarTexto(Valor);
         if(VerificarInt(Valor))
           {
            TrailStart=(int)StringToInteger(Valor);
            ObjectSetString(0,EDIT_TS_START,OBJPROP_TEXT,IntegerToString(TrailStart,0,' '));
            TS_Start_String_Anterior=Valor;
           }
         else
           {
            Alert("Trailing Start debe ser un numero entero mayor que 0");
            ObjectSetString(0,EDIT_TS_START,OBJPROP_TEXT,TS_Start_String_Anterior);
           }
        }
     }

   if(ObjectFind(0,EDIT_TS_STEP)==0)
     {
      string Valor=ObjectGetString(0,EDIT_TS_STEP,OBJPROP_TEXT,0);
      if(TS_Step_String_Anterior!=Valor)
        {
         Valor=ModificarTexto(Valor);
         if(VerificarInt(Valor))
           {
            TrailStop=(int)StringToInteger(Valor);
            ObjectSetString(0,EDIT_TS_STEP,OBJPROP_TEXT,Valor);
            TS_Step_String_Anterior=Valor;
           }
         else
           {
            Alert("Trailing Step debe ser un numero entero mayor que 0");
            ObjectSetString(0,EDIT_TS_STEP,OBJPROP_TEXT,TS_Step_String_Anterior);
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ComprobarVolumen()
  {
   if(ObjectFind(0,EDITVOL)==0)
     {
      string Valor=ObjectGetString(0,EDITVOL,OBJPROP_TEXT,0);
      if(Vol_String_Anterior!=Valor)
        {
         Valor=ModificarTexto(Valor);
         if(VerificarDouble(Valor))
           {
            Lote_=(double)StringToDouble(Valor);
            if(SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX)<Lote_)
              {
               Lote_=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);
               Alert("Lote supera el maximo posible por el Simbolo, se igualara al maximo");
              }
            else
               if(SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN)>Lote_)
                 {
                  Lote_=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
                  Alert("Lote es inferior al minimo posible por el Simbolo, se igualara al minimo");
                 }

            ObjectSetString(0,EDITVOL,OBJPROP_TEXT,DoubleToString(Lote_,2));
            Vol_String_Anterior=Valor;
           }
         else
           {
            Alert("Lote debe ser un numero entero mayor que 0");
            ObjectSetString(0,EDITVOL,OBJPROP_TEXT,Vol_String_Anterior);
           }
        }
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ComprobarTP()
  {
   if(ObjectFind(0,EDITTP)==0)
     {
      string Valor=ObjectGetString(0,EDITTP,OBJPROP_TEXT,0);
      if(TP_String_Anterior!=Valor)
        {
         Valor=ModificarTexto(Valor);
         if(VerificarInt(Valor))
           {
            TP_=(int)StringToInteger(Valor);
            ObjectSetString(0,EDITTP,OBJPROP_TEXT,IntegerToString(TP_));
            TP_String_Anterior=Valor;
           }
         else
           {
            Alert("TP debe ser un numero entero mayor que 0");
            ObjectSetString(0,EDITTP,OBJPROP_TEXT,TP_String_Anterior);
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ComprobarSL()
  {
   if(ObjectFind(0,EDITSL)==0)
     {
      string Valor=ObjectGetString(0,EDITSL,OBJPROP_TEXT,0);
      if(SL_String_Anterior!=Valor)
        {
         Valor=ModificarTexto(Valor);
         if(VerificarInt(Valor))
           {
            SL_=(int)StringToInteger(Valor);
            ObjectSetString(0,EDITSL,OBJPROP_TEXT,IntegerToString(SL_));
            SL_String_Anterior=Valor;
           }
         else
           {
            Alert("SL debe ser un numero entero mayor que 0");
            ObjectSetString(0,EDITSL,OBJPROP_TEXT,SL_String_Anterior);
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ComprobarBE()
  {
   if(ObjectFind(0,EDIT_BE_START)==0)
     {
      string Valor=ObjectGetString(0,EDIT_BE_START,OBJPROP_TEXT,0);


      if(BE_Start_String_Anterior!=Valor)
        {
         Valor=ModificarTexto(Valor);
         if(VerificarInt(Valor))
           {
            if((int)StringToInteger(Valor)>(int)BreakevenStop)
              {
               BreakevenStart=(int)StringToInteger(Valor);
               ObjectSetString(0,EDIT_BE_START,OBJPROP_TEXT,IntegerToString(BreakevenStart));
               BE_Start_String_Anterior=Valor;
              }
            else
              {
               Alert("BE START DEBE SER MAYOR A BE STOP");
               ObjectSetString(0,EDIT_BE_START,OBJPROP_TEXT,BE_Start_String_Anterior);
              }
           }
         else
           {
            Alert("BE START debe ser un numero entero mayor que 0");
            ObjectSetString(0,EDIT_BE_START,OBJPROP_TEXT,BE_Start_String_Anterior);
           }
        }
     }

   if(ObjectFind(0,EDIT_BE_STEP)==0)
     {
      string Valor=ObjectGetString(0,EDIT_BE_STEP,OBJPROP_TEXT,0);
      if(BE_Step_String_Anterior!=Valor)
        {
         Valor=ModificarTexto(Valor);
         if(VerificarIntNegative(Valor))
           {
            if((int)StringToInteger(Valor)<(int)BreakevenStart)
              {
               BreakevenStop=(int)StringToInteger(Valor);
               ObjectSetString(0,EDIT_BE_STEP,OBJPROP_TEXT,IntegerToString(BreakevenStop));
               BE_Step_String_Anterior=Valor;
              }
            else
              {
               Alert("BE STOP DEBE SER MAYOR A BE STOP");
               ObjectSetString(0,EDIT_BE_STEP,OBJPROP_TEXT,BE_Step_String_Anterior);
              }
           }
         else
           {
            Alert("BE STOP debe ser un numero entero mayor que 0");
            ObjectSetString(0,EDIT_BE_STEP,OBJPROP_TEXT,BE_Step_String_Anterior);
           }
        }
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ComprobarHora()
  {
   if(ObjectFind(0,EDIT_HORA)==0)
     {
      string Valor=ObjectGetString(0,EDIT_HORA,OBJPROP_TEXT,0);


      if(Hora_String_Anterior!=Valor)
        {
         Valor=ModificarTexto(Valor);
         if(VerificarInt(Valor))
           {
            if((int)StringToInteger(Valor)<24)
              {
               HoraDisparo=(int)StringToInteger(Valor);
               ObjectSetString(0,EDIT_HORA,OBJPROP_TEXT,IntegerToString(HoraDisparo));
               Hora_String_Anterior=Valor;
              }
            else
              {
               Alert("HORA DEBE SER MENOR QUE 24");
               ObjectSetString(0,EDIT_HORA,OBJPROP_TEXT,Hora_String_Anterior);
              }
           }
         else
           {
            Alert("HORA debe ser un numero entero mayor que 0");
            ObjectSetString(0,EDIT_HORA,OBJPROP_TEXT,Hora_String_Anterior);
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ComprobarMinutos()
  {
   if(ObjectFind(0,EDIT_MINUTOS)==0)
     {
      string Valor=ObjectGetString(0,EDIT_MINUTOS,OBJPROP_TEXT,0);


      if(Minutos_String_Anterior!=Valor)
        {
         Valor=ModificarTexto(Valor);
         if(VerificarInt(Valor))
           {
            if((int)StringToInteger(Valor)<60)
              {
               MinutoDisparo=(int)StringToInteger(Valor);
               ObjectSetString(0,EDIT_MINUTOS,OBJPROP_TEXT,IntegerToString(MinutoDisparo));
               Minutos_String_Anterior=Valor;
              }
            else
              {
               Alert("MINUTOS DEBE SER MENOR QUE 60");
               ObjectSetString(0,EDIT_MINUTOS,OBJPROP_TEXT,Minutos_String_Anterior);
              }
           }
         else
           {
            Alert("MINUTOS debe ser un numero entero mayor que 0");
            ObjectSetString(0,EDIT_MINUTOS,OBJPROP_TEXT,Minutos_String_Anterior);
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ComprobarSegundos()
  {
   if(ObjectFind(0,EDIT_SEGUNDOS)==0)
     {
      string Valor=ObjectGetString(0,EDIT_SEGUNDOS,OBJPROP_TEXT,0);


      if(Segundos_String_Anterior!=Valor)
        {
         Valor=ModificarTexto(Valor);
         if(VerificarInt(Valor))
           {
            if((int)StringToInteger(Valor)<60)
              {
               SegundosDisparo=(int)StringToInteger(Valor);
               ObjectSetString(0,EDIT_SEGUNDOS,OBJPROP_TEXT,IntegerToString(SegundosDisparo));
               Segundos_String_Anterior=Valor;
              }
            else
              {
               Alert("SEGUNDOS DEBE SER MENOR QUE 60");
               ObjectSetString(0,EDIT_SEGUNDOS,OBJPROP_TEXT,Segundos_String_Anterior);
              }
           }
         else
           {
            Alert("SEGUNDOS debe ser un numero entero mayor que 0");
            ObjectSetString(0,EDIT_SEGUNDOS,OBJPROP_TEXT,Segundos_String_Anterior);
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarInt(string Texto)
  {
   int Numero=0;
   for(int i=0; i<StringLen(Texto); i++)
     {
      ushort CHAR=StringGetCharacter(Texto,i);

      if(CHAR<='9' && CHAR>='0')
         Numero++;

      if((CHAR>'9' || CHAR<'0') && CHAR!=' ')
         return false;
     }

   if(Numero==0)
      return false;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string ModificarTexto(string Texto)
  {

   string TextoS="";
   int Vacio=0;
   for(int i=0; i<StringLen(Texto); i++)
     {
      ushort CHAR=StringGetCharacter(Texto,i);
      if(CHAR!=' ')
         TextoS=TextoS+CharToString((char)CHAR);
     }
   return TextoS;
  }
//+------------------------------------------------------------------+
bool VerificarIntNegative(string Texto)
  {
   int Numero=0;

   for(int i=0; i<StringLen(Texto); i++)
     {
      ushort CHAR=StringGetCharacter(Texto,i);

      if(CHAR<='9' && CHAR>='0')
         Numero++;

      if(((CHAR>'9' || CHAR<'0') && CHAR!=' ' && CHAR!='-') || (CHAR=='-' && i!=0))
         return false;
     }

   if(Numero==0)
      return false;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarDouble(string Texto)
  {
   int Punto=0;
   int Numero=0;
   for(int i=0; i<StringLen(Texto); i++)
     {
      ushort CHAR=StringGetCharacter(Texto,i);

      if(CHAR<='9' && CHAR>='0')
         Numero++;

      if((CHAR>'9' || CHAR<'0') && CHAR!='.' && CHAR!=' ')
         return false;

      if(CHAR=='.')
         Punto++;

      if(Punto>1)
         return false;
     }

   if(Numero==0)
      return false;

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CambiarModo()
  {
   if(ObjectFind(0,BOTONAUTO)==0)
     {
      if(ObjectGetInteger(0,BOTONAUTO,OBJPROP_STATE,0))
        {
         ModoTrade=(ModoTrade+1)%3;

         string Texto=ModoTrade==0?"Manual":(ModoTrade==1?"Semiautomatico":"Automatico");
         ObjectSetString(0,BOTONAUTO,OBJPROP_TEXT,Texto);
         ObjectSetInteger(0,BOTONAUTO,OBJPROP_STATE,false);
         ChartRedraw();
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BotonBuy()
  {
   if(ObjectFind(0,BOTONBUY)==0)
     {
      if(ObjectGetInteger(0,BOTONBUY,OBJPROP_STATE,0))
        {
         Buy();
         ObjectSetInteger(0,BOTONBUY,OBJPROP_STATE,false);
         ChartRedraw();
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BotonSell()
  {
// SELL
   if(ObjectFind(0,BOTONSELL)==0)
     {
      if(ObjectGetInteger(0,BOTONSELL,OBJPROP_STATE,0))
        {
         Sell();
         ObjectSetInteger(0,BOTONSELL,OBJPROP_STATE,false);
         ChartRedraw();
        }
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BotonTS()
  {
// SELL
   bool Estado=ObjectGetInteger(0,BOTONTS,OBJPROP_STATE,0);

   if(Estado!=ActivarTrailing)
     {
      ActivarTrailing=Estado;
      ObjectSetInteger(0,BOTONTS,OBJPROP_BGCOLOR,ActivarTrailing?clrGreen:clrOrangeRed);
      ObjectSetInteger(0,BOTONTS,OBJPROP_BORDER_COLOR,ActivarTrailing?clrGreen:clrOrangeRed);
      ChartRedraw();
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BotonBE()
  {
// SELL
   bool Estado=ObjectGetInteger(0,BOTONBE,OBJPROP_STATE,0);

   if(Estado!=ActivarBreakEven)
     {
      ActivarBreakEven=Estado;
      ObjectSetInteger(0,BOTONBE,OBJPROP_BGCOLOR,ActivarBreakEven?clrGreen:clrOrangeRed);
      ObjectSetInteger(0,BOTONBE,OBJPROP_BORDER_COLOR,ActivarBreakEven?clrGreen:clrOrangeRed);
      ChartRedraw();
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Buy()
  {
   double Entrada=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double SLoss_=NormalizeDouble(Entrada-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*SL_,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
   double TProfit_=NormalizeDouble(Entrada+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*TP_,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
   bool Trade=trade.Buy(Lote_,Symbol(),Entrada,SL_==0?0:SLoss_,TP_==0?0:TProfit_,Comentario);
   if(!Trade)
      Alert("ERROR AL PONER BUY",trade.ResultRetcode());
   else
     {
      if(AlertaMovil)
         SendNotification("Opero Buy en "+Symbol());
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Sell()
  {

// SELL
   double Entrada=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   Print(Entrada);
   double SLoss_=NormalizeDouble(Entrada+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*SL_,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
   double TProfit_=NormalizeDouble(Entrada-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*TP_,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
   bool Trade=trade.Sell(Lote_,Symbol(),Entrada,SL_==0?0:SLoss_,TP_==0?0:TProfit_,Comentario);
   if(!Trade)
      Alert("ERROR AL PONER SELL ",trade.ResultRetcode());
   else
     {
      if(AlertaMovil)
         SendNotification("Opero  Sell en "+Symbol());
     }

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
