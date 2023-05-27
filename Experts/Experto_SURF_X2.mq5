//+------------------------------------------------------------------+
//|                                                 Experto SURF.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

#include<Trade\Trade.mqh>
CTrade trade;


enum Modo_Op
  {
   Compras=0,//Solo Compras
   Ventas=1,//Solo Ventas
  };

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12am=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };


input Modo_Op Tipo_Operaciones=Compras;
input ENUM_TIMEFRAMES TimeFrame=PERIOD_CURRENT;
input double Lote_Inicial=0.01;
input double Factor=2;
input int Cantidad_Martingalas=5;
input double Profit_Operacion=0;
input double Flotante_Permitido=0;
input double Valor_Total_TP=0;
input double Valor_Total_SL=0;
input int MagicNumber=2222;
input string comentario="Experto Surf";//Comentario
input string S1="---------- CONFIGURACION TIJERA ------------";//-------------------------------------
input bool Activar_Tijera=true;
input double Lote_Tijera=0.01;
input int TakeProfit=0;//TP (puntos)
input int StopLoss=0;//SL (puntos)
input string S4="---------- CONFIGURACION BOTON ------------";//-------------------------------------
input int X_Boton=20;
input int Y_Boton=20;
input ENUM_BASE_CORNER Corner_Boton=CORNER_LEFT_UPPER;
input string S5="---------- CONFIGURACION ALERTAS ------------";//-------------------------------------
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;
input string Settings_Horario="-----------------------Settings HORARIO-----------------------";
input ENUM_Horas  Hora_Inicio=_8am;
input ENUM_Horas Hora_Final=_8am;
input bool Domingo=true;
input bool Lunes=true;
input bool Martes=true;
input bool Miercoles=true;
input bool Jueves=true;
input bool Viernes=true;
input bool Sabado=true;
input string S6="-----------------------   Filtro Medias Moviles  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Filtro_MA=true;
input int Ma_Periodo=21;//Base_Periodo
input int Ma_Shift=0;//Base_Shift
input ENUM_MA_METHOD Ma_Method=MODE_EMA;//Base Method
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;//Base Applied Prive
input string Settings_Archivo="-----------------------Settings Archivo-----------------------";
input string Carpeta="Datos Experto";


bool Activado=false;
Modo_Op Tipo_Operaciones_A=Compras;

string BOTON="BOTON 2023";
string BOTON_TIPO="BOTON 2023 Tipo";
string EDIT_INICIO="EDIT 2023 Inicio";
string EDIT_PROFIT="EDIT 2023 Profit";
string EDIT_PROFIT_ACTUAL="EDIT 2023 Profit Actual";

int broadcastEventID=5000;


datetime TiempoInicio=0;

int HandleMA=0;
MqlRates rates[];
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   Activado=false;
   Tipo_Operaciones_A=Tipo_Operaciones;
   TiempoInicio=TimeCurrent();

   int AgregarX=0;
   int AgregarX2=0;
   int AgregarY=0;

   if(Corner_Boton==CORNER_RIGHT_LOWER || Corner_Boton==CORNER_RIGHT_UPPER)
     {
      AgregarX=50;
      AgregarX2=130;
     }
   if(Corner_Boton==CORNER_LEFT_LOWER || Corner_Boton==CORNER_RIGHT_LOWER)
      AgregarY=18;

   if(MQLInfoInteger(MQL_TESTER))
      Activado=true;


   if(ObjectFind(0,BOTON)!=0)
     {
      ButtonCreate(0,BOTON,0,AgregarX+X_Boton,AgregarY+Y_Boton,50,18,Corner_Boton,(!Activado?"Off":"On"),"Arial",12,clrWhite,(!Activado?clrRed:clrGreen),clrWhite,(!Activado?false:true),false,false,true,0);
     }
   else
      Activado=ObjectGetInteger(0,BOTON,OBJPROP_STATE,0);

   if(ObjectFind(0,BOTON_TIPO)!=0)
      ButtonCreate(0,BOTON_TIPO,0,AgregarX2+X_Boton+60,AgregarY+Y_Boton,130,18,Corner_Boton,Tipo_Operaciones==Compras?"Solo Compras":"Solo Ventas","Arial",12,clrWhite,Tipo_Operaciones==Compras?clrBlue:clrMaroon,clrWhite,Tipo_Operaciones==Compras?true:false,false,false,true,0);
   else
      Tipo_Operaciones_A=ObjectGetInteger(0,BOTON_TIPO,OBJPROP_STATE,0)?Compras:Ventas;


   if(ObjectFind(0,EDIT_INICIO)!=0)
     {
      EditCreate(0,EDIT_INICIO,0,AgregarX2+X_Boton,AgregarY+Y_Boton+25,140,18,"--------------","Arial",12,ALIGN_CENTER,true,Corner_Boton,clrBlack,clrGray,clrGray,false,false,true,0);
      if(Activado)
        {
         TiempoInicio=TimeCurrent();
         ObjectSetString(0,EDIT_INICIO,OBJPROP_TEXT,TimeToString(TiempoInicio,TIME_DATE|TIME_MINUTES));
         ObjectSetInteger(0,EDIT_INICIO,OBJPROP_BGCOLOR,clrIndigo);
         ObjectSetInteger(0,EDIT_INICIO,OBJPROP_COLOR,clrWhite);
        }
     }
   else
      if(Activado)
         TiempoInicio=StringToTime(ObjectGetString(0,EDIT_INICIO,OBJPROP_TEXT,0));

   if(ObjectFind(0,EDIT_PROFIT)!=0)
      EditCreate(0,EDIT_PROFIT,0,AgregarX2+X_Boton+150,AgregarY+Y_Boton+25,200,18,"Profit Ganado : "+DoubleToString(0,2),"Arial",12,ALIGN_CENTER,true,Corner_Boton,clrBlack,clrGray,clrGray,false,false,true,0);


   if(ObjectFind(0,EDIT_PROFIT_ACTUAL)!=0)
      EditCreate(0,EDIT_PROFIT_ACTUAL,0,AgregarX2+X_Boton,AgregarY+Y_Boton+50,240,18,"Profit Actual Ganado : "+DoubleToString(0,2),"Arial",12,ALIGN_CENTER,true,Corner_Boton,clrBlack,clrGray,clrGray,false,false,true,0);

   ChartRedraw();

   if(Filtro_MA || Activar_Tijera)
      HandleMA=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo,Ma_Shift,Ma_Method,Ma_AppliedPrice);

   trade.SetExpertMagicNumber(MagicNumber);
   ArraySetAsSeries(rates,true);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   if(reason!=REASON_CHARTCHANGE && reason!=REASON_CLOSE)
     {
      ObjectDelete(0,BOTON);
      ObjectDelete(0,BOTON_TIPO);
      ObjectDelete(0,EDIT_INICIO);
      ObjectDelete(0,EDIT_PROFIT);
      ObjectDelete(0,EDIT_PROFIT_ACTUAL);
      ChartRedraw();
     }
   IndicatorRelease(HandleMA);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {

   if(IsNewCandle())
     {
      CerrarPosicionesContrarias();
      if(Activado)
        {
         if(EvaluaDias(TimeCurrent()) && EvaluaHorario(Hora_Inicio,Hora_Final,TimeCurrent()))
           {
            int copied=CopyRates(NULL,TimeFrame,0,3,rates);
            if(copied<=0)
               Print("Fallo al copiar los datos de precios ",GetLastError());
            else
              {
               int TotalPos=0;
               double Profit=0;
               CalculoPosiciones(TotalPos,Profit);
               datetime TiempoStart=TimeCurrent();
               if(Tipo_Operaciones_A==Compras)
                 {
                  if(FiltroMA(true,rates[0].close))
                     if(rates[1].open>rates[1].close)
                       {
                        if((TotalPos==0 || Profit<0) && TotalPos<Cantidad_Martingalas)
                          {
                           double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
                           double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
                           double Lote=CalculoLote(TotalPos);

                           if(trade.Buy(Lote,Symbol(),Ask,0,0,comentario))
                             {
                              ulong Ticket=trade.ResultDeal();
                              Print(" Ticket Transaccion:"+string(Ticket)+" Ticket Orden:"+string(trade.ResultOrder())+" Ejecuto con Codigo"+string(trade.ResultRetcode()));
                              EscribirOperacion(Ticket,TiempoStart,"Principal ");
                             }
                           else
                              Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                          }
                       }
                  if(FiltroTijera(true,rates[1].close,rates[1].open))
                    {
                     double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
                     double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
                     double TP=TakeProfit==0?0:Bid-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*TakeProfit;
                     double SL=StopLoss==0?0:Bid+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*StopLoss;
                     double Lote=CalculoLote(TotalPos);

                     if(trade.Sell(Lote_Tijera,Symbol(),Bid,SL,TP,"op Tijera"))
                       {
                        ulong Ticket=trade.ResultDeal();
                        Print(" Ticket Transaccion:"+string(Ticket)+" Ticket Orden:"+string(trade.ResultOrder())+" Ejecuto con Codigo"+string(trade.ResultRetcode()));
                        EscribirOperacion(Ticket,TiempoStart,"Tijera ");
                       }
                     else
                        Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));

                    }
                 }
               else
                 {
                  if(FiltroMA(false,rates[0].close))
                     if(rates[1].open<rates[1].close)
                       {
                        if((TotalPos==0 || Profit<0) && TotalPos<Cantidad_Martingalas)
                          {
                           double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
                           double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
                           double Lote=CalculoLote(TotalPos);

                           if(trade.Sell(Lote,Symbol(),Bid,0,0,comentario))
                             {
                              ulong Ticket=trade.ResultDeal();
                              Print(" Ticket Transaccion:"+string(Ticket)+" Ticket Orden:"+string(trade.ResultOrder())+" Ejecuto con Codigo"+string(trade.ResultRetcode()));
                              EscribirOperacion(Ticket,TiempoStart,"Principal ");
                             }
                           else
                              Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));

                          }
                       }

                  if(FiltroTijera(false,rates[1].close,rates[1].open))
                    {
                     double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
                     double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
                     double TP=TakeProfit==0?0:Ask+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*TakeProfit;
                     double SL=StopLoss==0?0:Ask-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*StopLoss;
                     double Lote=CalculoLote(TotalPos);

                     if(trade.Buy(Lote_Tijera,Symbol(),Ask,SL,TP,"op Tijera"))
                       {
                        ulong Ticket=trade.ResultDeal();
                        Print(" Ticket Transaccion:"+string(Ticket)+" Ticket Orden:"+string(trade.ResultOrder())+" Ejecuto con Codigo"+string(trade.ResultRetcode()));
                        EscribirOperacion(Ticket,TiempoStart,"Tijera ");
                       }
                     else
                        Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));

                    }
                 }
              }
           }
         FuncionesCerrar();
        }
     }
  }
//+------------------------------------------------------------------+


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
            ": failed to create the button! Error code = ",GetLastError());
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
bool EditCreate(const long             chart_ID=0,               // ID del gráfico
                const string           name="Edit",              // nombre del objeto
                const int              sub_window=0,             // número de subventana
                const int              x=0,                      // coordenada por el eje X
                const int              y=0,                      // coordenada por el eje Y
                const int              width=50,                 // ancho
                const int              height=18,                // alto
                const string           text="Text",              // texto
                const string           font="Arial",             // fuente
                const int              font_size=10,             // tamaño de la fuente
                const ENUM_ALIGN_MODE  align=ALIGN_CENTER,       // modo de alineación
                const bool             read_only=false,          // posibilidad de edición
                const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace
                const color            clr=clrBlack,             // color del texto
                const color            back_clr=clrWhite,        // color del fondo
                const color            border_clr=clrNONE,       // color del borde
                const bool             back=false,               // al fondo
                const bool             selection=false,          // seleccionar para mover
                const bool             hidden=true,              // ocultar en la lista de objetos
                const long             z_order=0)                // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos el campo de edición
   if(!ObjectCreate(chart_ID,name,OBJ_EDIT,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear el objeto \"Campo de edición\"! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos las coordenadas del objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- establecemos el tamaño del objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- ponemos el texto
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- establecemos la fuente del texto
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- establecemos el tamaño del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- establecemos el modo de alineación del texto dentro del objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_ALIGN,align);
//--- ponemos (true) o cancelamos (false) el modo sólo para lectura
   ObjectSetInteger(chart_ID,name,OBJPROP_READONLY,read_only);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- establecemos el color del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el color del fondo
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- establecemos el color del borde
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de desplazamiento de la etiqueta con ratón
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- establecemos la prioridad para obtener el evento de cliquear sobre el gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- ejecución con éxito
   return(true);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//--- Check the event by pressing a mouse button
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      string clickedChartObject=sparam;
      //--- If you click on the object with the name buttonID
      if(clickedChartObject==BOTON || clickedChartObject==BOTON_TIPO)
        {
         //--- State of the button - pressed or not
         bool selected=ObjectGetInteger(0,sparam,OBJPROP_STATE);
         //--- log a debug message
         Print("Button pressed = ",selected);
         int customEventID; // Number of the custom event to send
         string message;    // Message to be sent in the event
         //--- If the button is pressed
         message="Button pressed";
         customEventID=CHARTEVENT_CUSTOM+1;

         //--- Send a custom event "our" chart
         EventChartCustom(0,ushort(customEventID-CHARTEVENT_CUSTOM),(int)selected,0,sparam);
         ///--- Send a message to all open charts
         BroadcastEvent(ChartID(),0,"Broadcast Message");
         //--- Debug message
         Print("Sent an event with ID = ",customEventID);

        }

      ChartRedraw();// Forced redraw all chart objects
     }

//--- Check the event belongs to the user events
   if(id>CHARTEVENT_CUSTOM && id==1001)
     {
      if(id==broadcastEventID)
        {
         Print("Got broadcast message from a chart with id = "+string(lparam));
        }
      else
        {
         if(sparam==BOTON)
           {
            if((bool)lparam==true)
              {
               ObjectSetInteger(0,BOTON,OBJPROP_BGCOLOR,clrGreen);
               ObjectSetString(0,BOTON,OBJPROP_TEXT,"On");
               Activado=true;
               TiempoInicio=TimeCurrent();
               ObjectSetString(0,EDIT_INICIO,OBJPROP_TEXT,TimeToString(TiempoInicio,TIME_DATE|TIME_MINUTES));
               ObjectSetInteger(0,EDIT_INICIO,OBJPROP_BGCOLOR,clrIndigo);
               ObjectSetInteger(0,EDIT_INICIO,OBJPROP_COLOR,clrWhite);
              }
            else
              {
               ObjectSetInteger(0,BOTON,OBJPROP_BGCOLOR,clrRed);
               ObjectSetString(0,BOTON,OBJPROP_TEXT,"Off");
               Activado=false;
               ObjectSetString(0,EDIT_INICIO,OBJPROP_TEXT,"----------");
               ObjectSetInteger(0,EDIT_INICIO,OBJPROP_BGCOLOR,clrGray);
               ObjectSetInteger(0,EDIT_INICIO,OBJPROP_COLOR,clrBlack);
              }
           }
         if(sparam==BOTON_TIPO)
           {
            if((bool)lparam==true)
              {
               if(!Activado)
                 {
                  ObjectSetInteger(0,sparam,OBJPROP_BGCOLOR,clrBlue);
                  ObjectSetString(0,sparam,OBJPROP_TEXT,"Solo Compras");
                  Tipo_Operaciones_A=Compras;
                 }
               else
                  ObjectSetInteger(0,sparam,OBJPROP_STATE,false);
              }
            else
              {
               if(!Activado)
                 {
                  ObjectSetInteger(0,sparam,OBJPROP_BGCOLOR,clrMaroon);
                  ObjectSetString(0,sparam,OBJPROP_TEXT,"Solo Ventas");
                  Tipo_Operaciones_A=Ventas;
                 }
               else
                  ObjectSetInteger(0,sparam,OBJPROP_STATE,true);
              }
           }
         ChartRedraw();// Forced redraw all chart objects
        }
     }
  }
//+------------------------------------------------------------------+
void BroadcastEvent(long lparam,double dparam,string sparam)
  {
   int eventID=broadcastEventID-CHARTEVENT_CUSTOM;
   long currChart=ChartFirst();
   int i=0;
   while(i<CHARTS_MAX)                 // We have certainly no more than CHARTS_MAX open charts
     {
      EventChartCustom(currChart,ushort(eventID),lparam,dparam,sparam);
      currChart=ChartNext(currChart); // We have received a new chart from the previous
      if(currChart==-1)
         break;        // Reached the end of the charts list
      i++;// Do not forget to increase the counter
     }
  }
//+------------------------------------------------------------------+
bool IsNewCandle()
  {
   static int BarsOnChart = iBars(Symbol(),TimeFrame);
   int Bars_=iBars(Symbol(),TimeFrame);
   if(Bars_== BarsOnChart)
      return (false);
   BarsOnChart = Bars_;
   return(true);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CalculoPosiciones(int &Total,double &ProfitTotal)
  {
   int PosicionesTotales=PositionsTotal();
   ProfitTotal=0;
   Total=0;

   for(int i=PosicionesTotales-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);

      if(Ticket!=0)
        {
         if(PositionGetString(POSITION_SYMBOL)==Symbol() && PositionGetInteger(POSITION_MAGIC)==MagicNumber)
           {
            ProfitTotal+=PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP);
            if(PositionGetString(POSITION_COMMENT)!="op Tijera")
               Total++;
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CalculoLote(int TotalPos)
  {

   double Lote=NormalizeDouble(Lote_Inicial*MathPow(Factor,TotalPos),2);

   if(Lote>SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
      return SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);

   double Div=NormalizeDouble(Lote/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP),2);
   int DivInt=(int)Div;

   if(Div-DivInt>0)
      Lote=NormalizeDouble(SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP)*DivInt,2);

   return Lote;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FuncionesCerrar()
  {
   double Profit=0;
   int TotalPos=0;
   CalculoPosiciones(TotalPos,Profit);

   if(Profit_Operacion!=0)
      if(Profit>=Profit_Operacion)
        {
         CerrarPosiciones("PROFIT OPERACION");
         Print("Cierra posiciones por Profit Operacion");
        }

   if(Flotante_Permitido!=0)
      if(Profit<=Flotante_Permitido*-1)
        {
         CerrarPosiciones("MAXIMO FLOTANTE PERMITIDO");
         Print("Cierra posiciones por Flotante Permitido");
        }


   double ProfitPerdidaGanancia=CalcularPerdidaGananciaTotal(Profit);
   ObjectSetString(0,EDIT_PROFIT,OBJPROP_TEXT,"Profit Ganado : "+DoubleToString(ProfitPerdidaGanancia,2));
   if(ProfitPerdidaGanancia>0)
      ObjectSetInteger(0,EDIT_PROFIT,OBJPROP_BGCOLOR,clrGreen);
   else
      if(ProfitPerdidaGanancia<0)
         ObjectSetInteger(0,EDIT_PROFIT,OBJPROP_BGCOLOR,clrRed);
      else
         ObjectSetInteger(0,EDIT_PROFIT,OBJPROP_BGCOLOR,clrGray);

   ObjectSetString(0,EDIT_PROFIT_ACTUAL,OBJPROP_TEXT,"Profit Actual Ganado : "+DoubleToString(Profit,2));
   if(Profit>0)
      ObjectSetInteger(0,EDIT_PROFIT_ACTUAL,OBJPROP_BGCOLOR,clrGreen);
   else
      if(Profit<0)
         ObjectSetInteger(0,EDIT_PROFIT_ACTUAL,OBJPROP_BGCOLOR,clrRed);
      else
         ObjectSetInteger(0,EDIT_PROFIT_ACTUAL,OBJPROP_BGCOLOR,clrGray);


   if(Valor_Total_TP!=0)
      if(Valor_Total_TP<=ProfitPerdidaGanancia)
        {
         CerrarPosiciones("VALOR TOTAL TP");
         ObjectSetInteger(0,BOTON,OBJPROP_BGCOLOR,clrRed);
         ObjectSetString(0,BOTON,OBJPROP_TEXT,"Off");
         Activado=false;
         ObjectSetString(0,EDIT_INICIO,OBJPROP_TEXT,"----------");
         ObjectSetInteger(0,EDIT_INICIO,OBJPROP_BGCOLOR,clrGray);
         ObjectSetInteger(0,EDIT_INICIO,OBJPROP_COLOR,clrBlack);

         Alertas("Cierra Posiciones y Desactiva el bot por VALOR TOTAL TP");
        }

   if(Valor_Total_SL!=0)
      if(Valor_Total_SL*-1>=ProfitPerdidaGanancia)
        {
         CerrarPosiciones("VALOR TOTAL SL");
         ObjectSetInteger(0,BOTON,OBJPROP_BGCOLOR,clrRed);
         ObjectSetString(0,BOTON,OBJPROP_TEXT,"Off");
         Activado=false;
         ObjectSetString(0,EDIT_INICIO,OBJPROP_TEXT,"----------");
         ObjectSetInteger(0,EDIT_INICIO,OBJPROP_BGCOLOR,clrGray);
         ObjectSetInteger(0,EDIT_INICIO,OBJPROP_COLOR,clrBlack);

         Alertas("Cierra Posiciones y Desactiva el bot por VALOR TOTAL SL");
        }

   ChartRedraw();
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarPosiciones(string TipoCierr)
  {
   datetime TiempoStart=TimeCurrent();
   string TiempoCierre=TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES|TIME_SECONDS);
   long IDs[];
   ArrayResize(IDs,0);
   int PosicionesTotales=PositionsTotal();

   for(int i=PosicionesTotales-1; i>=0; i--)
     {
      ulong Ticket=0;

      if((Ticket=PositionGetTicket(i))!=0)
        {
         if(PositionGetString(POSITION_SYMBOL)==Symbol() && PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetString(POSITION_COMMENT)!="op Tijera")
           {
            long ID=(long)PositionGetInteger(POSITION_IDENTIFIER);

            if(trade.PositionClose(Ticket,-1))
              {
               Print(" Ticket Transaccion:"+string(trade.ResultDeal())+" Ticket Orden:"+string(trade.ResultOrder())+" Ejecuto con Codigo"+string(trade.ResultRetcode()));
               int Size=ArraySize(IDs);
               ArrayResize(IDs,Size+1);
               IDs[Size]=ID;
              }
            else
               Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
           }
        }
     }

   EscribirArchivoCierre(IDs,TiempoCierre,TiempoStart,TipoCierr);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarPosicionesContrarias()
  {
   datetime TiempoStart=TimeCurrent();
   string TiempoCierre=TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES|TIME_SECONDS);
   long IDs[];
   ArrayResize(IDs,0);
   int PosicionesTotales=PositionsTotal();

   for(int i=PosicionesTotales-1; i>=0; i--)
     {
      ulong Ticket=0;
      if((Ticket=PositionGetTicket(i))!=0)
        {
         if(PositionGetString(POSITION_SYMBOL)==Symbol() && PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetString(POSITION_COMMENT)=="op Tijera")
           {
            long ID=(long)PositionGetInteger(POSITION_IDENTIFIER);
            if(iBarShift(Symbol(),PERIOD_CURRENT,PositionGetInteger(POSITION_TIME),false)!=0)
               if(PositionGetDouble(POSITION_PROFIT)>0)
                  if(trade.PositionClose(Ticket,-1))
                    {
                     Print(" Ticket Transaccion:"+string(trade.ResultDeal())+" Ticket Orden:"+string(trade.ResultOrder())+" Ejecuto con Codigo"+string(trade.ResultRetcode()));
                     int Size=ArraySize(IDs);
                     ArrayResize(IDs,Size+1);
                     IDs[Size]=ID;
                    }
                  else
                     Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
           }
        }
     }

   EscribirArchivoCierre(IDs,TiempoCierre,TiempoStart,"Cierre Tijera ");
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CalcularPerdidaGananciaTotal(double ProfitTotal)
  {
//--- request trade history
   HistorySelect(TiempoInicio,TimeCurrent());
//--- create objects
   int     total=HistoryDealsTotal();
   ulong    ticket=0;

   static int total_memoria=0;

   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         // int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         double Profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
         //string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
         if(Magic==MagicNumber && Symbol()==Simbolo)
            if(entry==DEAL_ENTRY_OUT)
              {
               Profit=Profit+Comision+Swap;
               ProfitTotal=Profit+ProfitTotal;
              }
         //}
        }
     }

   return ProfitTotal;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Alertas(string Frase)
  {
   if(AlertPC)
      Alert(Frase);
   if(AlertMovil)
      SendNotification(Frase);
   if(AlertMail)
      SendMail(Frase,Frase);
  }
//+------------------------------------------------------------------+
bool EvaluaHorario(int Apertura,int Cierre,datetime Tiempo)
  {
   MqlDateTime TiempoMql;
   TimeToStruct(Tiempo,TiempoMql);

   if(Apertura==Cierre)
      return true;

   if(Apertura>Cierre && (TiempoMql.hour>=Apertura || TiempoMql.hour<Cierre))
      return true;
   else
      if(Apertura<Cierre && TiempoMql.hour>=Apertura && TiempoMql.hour<Cierre)
         return true;

   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluaDias(datetime TiempoEvalua)
  {
   MqlDateTime TiempoMql;
   TimeToStruct(TiempoEvalua,TiempoMql);

   uint Dia=TiempoMql.day_of_week;

   if(Dia==0 && Domingo)
      return true;
   else
      if(Dia==1 && Lunes)
         return true;
      else
         if(Dia==2 && Martes)
            return true;
         else
            if(Dia==3 && Miercoles)
               return true;
            else
               if(Dia==4 && Jueves)
                  return true;
               else
                  if(Dia==5 && Viernes)
                     return true;
                  else
                     if(Dia==6 && Sabado)
                        return true;

   return false;

  }
//+------------------------------------------------------------------+
void WhriteFile(string Datos,string NombreArchivo)
  {
   StringReplace(NombreArchivo,".","_");
   StringReplace(NombreArchivo," ","_");
   StringReplace(NombreArchivo,":","_");

   ResetLastError();

   int file_handle=FileOpen(Carpeta+"//"+NombreArchivo+".txt",FILE_READ|FILE_WRITE|FILE_CSV);

   if(file_handle!=INVALID_HANDLE)
     {
      PrintFormat("El archivo %s está abierto para la escritura",Carpeta+"//"+NombreArchivo+".txt");
      PrintFormat("Ruta del archivo: %s\\Files\\",TerminalInfoString(TERMINAL_DATA_PATH));
      //--- la cadena está formada, la escribimos en el archivo
      FileWriteString(file_handle,Datos);
      //--- cerramos el archivo
      FileClose(file_handle);
      PrintFormat("Datos grabados, el archivo %s cerrado",Carpeta+"//"+NombreArchivo+".txt");
     }
   else
      PrintFormat("Fallo al abrir el archivo %s, Código del error = %d",Carpeta+"//"+NombreArchivo+".txt",GetLastError());

  }
//+------------------------------------------------------------------+

//|                                                                  |
//+------------------------------------------------------------------+
void EscribirArchivoCierre(long &IDs[],string Tiempo,datetime TiempoStart,string TipoCierre)
  {

   HistorySelect(TiempoStart,TimeCurrent());
//--- create objects
   int     total=HistoryDealsTotal();
   ulong    ticket=0;
//--- for all deals
   string message="----- CIERRE POR "+TipoCierre+" -----\n";
   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         // int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         double Profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         ENUM_DEAL_TYPE tipo=ENUM_DEAL_TYPE(HistoryDealGetInteger(ticket,DEAL_TYPE));
         string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
         double Cierre=HistoryDealGetDouble(ticket,DEAL_PRICE);
         //string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
         for(int j=ArraySize(IDs)-1; j>=0; j--)
            if(ID==IDs[j])
               if(entry==DEAL_ENTRY_OUT)
                 {
                  message+=(Simbolo+" "+EnumToString(ENUM_DEAL_TYPE(tipo))+" Profit="+DoubleToString(Profit,2)+" Commision="+DoubleToString(Comision,2)
                            +" Swap="+DoubleToString(Swap,2)+" Numero Magico="+IntegerToString(Magic)+" Precio Cierre="+DoubleToString(Cierre,Digits())+"\n");
                 }
        }
     }
   WhriteFile(message,"Cierre "+Tiempo);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EscribirOperacion(ulong Ticket,datetime TiempoStart,string Comentario)
  {
   ulong    ticket=0;
//--- for all deals
   string message="";
//--- try to get deals ticket
   if(HistoryDealSelect(Ticket))
     {
      ticket=Ticket;
      int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
      int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
      // int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
      double Profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
      double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
      double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
      int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
      ENUM_DEAL_TYPE tipo=ENUM_DEAL_TYPE(HistoryDealGetInteger(ticket,DEAL_TYPE));
      string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
      double Cierre=HistoryDealGetDouble(ticket,DEAL_PRICE);
      datetime TiempoAbre=(datetime)HistoryDealGetInteger(ticket,DEAL_TIME);
      //string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
      message+=(Comentario+" Abre "+Simbolo+" "+EnumToString(ENUM_DEAL_TYPE(tipo))+" Numero Magico="+IntegerToString(Magic)+" Precio Entrada="+DoubleToString(Cierre,Digits())+" Tiempo Entrada="+TimeToString(TiempoAbre,TIME_DATE|TIME_MINUTES)+"\n");
      Print(message);


      WhriteFile(message,"Abre "+Simbolo+" "+TimeToString(TiempoAbre,TIME_DATE|TIME_MINUTES));
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroMA(bool IsBuy,double Close)
  {
   if(!Filtro_MA)
      return true;

   static double MA[1];
   int conteo=0;
   while(CopyBuffer(HandleMA,0,0,1,MA)<=0 && conteo<5)
     {
      Sleep(1000);
      conteo++;
      if(conteo>=5)
        {
         Print("Error, no pudo cargar bien los datos de la ema");
         return false;
        }
     }


   if(IsBuy)
     {
      if(MA[0]<Close)
         return true;
     }
   else
     {
      if(MA[0]>Close)
         return true;
     }

   return false;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroTijera(bool IsBuy,double Close,double Open)
  {
   if(!Activar_Tijera)
      return false;

   static double MA[1];
   int conteo=0;
   while(CopyBuffer(HandleMA,0,0,1,MA)<=0 && conteo<5)
     {
      Sleep(1000);
      conteo++;
      if(conteo>=5)
        {
         Print("Error, no pudo cargar bien los datos de la ema");
         return false;
        }
     }

   if(IsBuy)
     {
      if(MA[0]>Open)
         if(Open>Close)
            return true;
     }
   else
     {
      if(MA[0]<Open)
         if(Open<Close)
            return true;
     }
   return false;
  }
//+------------------------------------------------------------------+
