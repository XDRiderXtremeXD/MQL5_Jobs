//+------------------------------------------------------------------+
//|                                              EXPERTO CONTROL.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;

input double Capital_Base=500;
input double Porcentaje_Perdida=2;

string BOTONCREAR="BOTON 2021 CREAR STOP LIMIT";
string BOTONDIBUJAR="BOTON 2021 DIBUJAR STOP LIMIT";
string BOTON_SWITCH="BOTON 2021 DIBUJAR SWITCH";
string BOTON_REINICIO="BOTON 2021 REINICIO";

string PROFIT_ACTUAL="BOTON 2021 PROFIT ACTUAL";
string PROFIT_MAXIMO="BOTON 2021 PROFIT MAXIMO";
string PROFIT_MINIMO="BOTON 2021 PROFIT MINIMO";

string EDIT_PROFIT_ACTUAL="EDIT 2021 PROFIT ACTUAL";
string EDIT_PROFIT_MAXIMO="EDIT 2021 PROFIT MAXIMO";
string EDIT_PROFIT_MINIMO="EDIT 2021 PROFIT MINIMO";

string LINEAOP="LINEAS STOP LIMIT OP";
string LINEASL="LINEAS STOP LIMIT SL";
string LINEATP="LINEAS STOP LIMIT TP";

enum Conteo_Tipo
  {
   SOLO_BOT=0,
   TODAS=1,
  };

input string S1="-----------------------   CONFIGURACION BOTONES  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input ENUM_BASE_CORNER CORNER_BOTON=CORNER_LEFT_UPPER;
input int Boton_Desplazamiento_X=5;
input int Boton_Desplazamiento_Y=27;
input int SizeTexto=10;
input int Espacio=1;
input string S4="-----------------------   CONFIGURACION TRADES  ---------------------";//------
input Conteo_Tipo Conteo_Operaciones=SOLO_BOT;
input int MagicNumber=22222;
input double Maxima_Ganancia=100;
input double Maxima_Perdida=100;


double PerdidaMaxima=0;
double GananciaMaxima=0;

bool IsStLi=true;
datetime TimeStart=0;

bool IsAlpha=false;

int MagicNumb=0;

bool Si_GananciaMaxima=false;
bool Si_PerdidaMaxima=false;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   Si_GananciaMaxima=false;
   Si_PerdidaMaxima=false;


   if(!GlobalVariableCheck("EXPERTO ALPHA"))
     {
      Print("ESTABLECIENDO EXPERTO ALPHA EN ESTE GRAFICO");
      GlobalVariableSet("EXPERTO ALPHA",MagicNumber);
      MagicNumb=MagicNumber;
      IsAlpha=true;
     }
   else
     {
      MagicNumb=(int)GlobalVariableGet("EXPERTO ALPHA");
      IsAlpha=false;
     }


   TimeStart=TimeCurrent();
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


   if(IsAlpha)
      Creacion_CONTROL(Desplazamiento,Desplace,DesplazamientoY,Derecha,Size);



   PerdidaMaxima=0;
   GananciaMaxima=0;

   ChartRedraw();

   IsStLi=true;

   trade.SetExpertMagicNumber(MagicNumb);

   EventSetMillisecondTimer(1);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,"LINEAS STOP LIMIT",0,OBJ_HLINE);
   ObjectsDeleteAll(0,"BOTON 2021",-1,OBJ_BUTTON);
   ObjectsDeleteAll(0,"EDIT 2021",-1,OBJ_EDIT);

   if(IsAlpha)
     {
      GlobalVariablesDeleteAll("EXPERTO ALPHA",0);
     }

   EventKillTimer();
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {


  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {

   if(!IsAlpha)
     {
      if(!GlobalVariableCheck("EXPERTO ALPHA"))
        {
         ObjectsDeleteAll(0,"LINEAS STOP LIMIT",0,OBJ_HLINE);
         ObjectsDeleteAll(0,"BOTON 2021",-1,OBJ_BUTTON);
         ObjectsDeleteAll(0,"EDIT 2021",-1,OBJ_EDIT);
         Alert("EL EXPERTO ALPHA FUE QUITADO");
         ExpertRemove();
        }
     }
   else
      CerrarOrdenes();


   if(ObjectFind(0,BOTONDIBUJAR)==0)
     {
      if(ObjectGetInteger(0,BOTONDIBUJAR,OBJPROP_STATE,0))
        {
         ObjectsDeleteAll(0,"LINEAS STOP LIMIT",0,OBJ_HLINE);
         CrearLineas();
         ObjectSetInteger(0,BOTONDIBUJAR,OBJPROP_STATE,false);
         ChartRedraw();
        }
     }

   if(ObjectFind(0,BOTON_REINICIO)==0)
     {
      if(ObjectGetInteger(0,BOTON_REINICIO,OBJPROP_STATE,0))
        {
         ObjectSetString(0,EDIT_PROFIT_ACTUAL,OBJPROP_TEXT,DoubleToString(0,2));
         ObjectSetString(0,EDIT_PROFIT_MINIMO,OBJPROP_TEXT,DoubleToString(0,2));
         ObjectSetString(0,EDIT_PROFIT_MAXIMO,OBJPROP_TEXT,DoubleToString(0,2));
         GananciaMaxima=0;
         PerdidaMaxima=0;

         Si_GananciaMaxima=false;
         Si_PerdidaMaxima=false;
         TimeStart=TimeCurrent()+1;

         ObjectSetInteger(0,BOTON_REINICIO,OBJPROP_STATE,false);
         ChartRedraw();
        }
     }


   if(ObjectFind(0,BOTONCREAR)==0)
     {
      if(ObjectGetInteger(0,BOTONCREAR,OBJPROP_STATE,0))
        {
         if(!Si_PerdidaMaxima && !Si_GananciaMaxima)
           {
            if(!GestionarLineas())
               Print("No hay lineas para poder Crear Ordenes Limit o Stop -- Dibuje las lineas con el boton DIBUJAR STOP/LIMIT");
           }
         else
           {
            Alert("El robot ha llegado a la PERDIDA MAXIMA o a llegado a la GANANCIA MAXIMA, REINICIE EL CONTEO");
           }
         ObjectsDeleteAll(0,"LINEAS STOP LIMIT",0,OBJ_HLINE);

         ObjectSetInteger(0,BOTONCREAR,OBJPROP_STATE,false);
         ChartRedraw();
        }
     }


   static bool EstadoSwitch=false;

   if(ObjectFind(0,BOTON_SWITCH)==0)
     {
      if(ObjectGetInteger(0,BOTON_SWITCH,OBJPROP_STATE,0) && EstadoSwitch==false)
        {
         ObjectSetInteger(0,BOTON_SWITCH,OBJPROP_BGCOLOR,clrBrown);
         ObjectSetString(0,BOTON_SWITCH,OBJPROP_TEXT,"MERCADO");
         IsStLi=false;
         EstadoSwitch=true;

         if(ObjectFind(0,LINEAOP)==0)
            ObjectDelete(0,LINEAOP);

         ChartRedraw();
        }
      if(!ObjectGetInteger(0,BOTON_SWITCH,OBJPROP_STATE,0) && EstadoSwitch==true)
        {
         ObjectSetInteger(0,BOTON_SWITCH,OBJPROP_BGCOLOR,clrMagenta);
         ObjectSetString(0,BOTON_SWITCH,OBJPROP_TEXT,"STOP / LIMIT");
         IsStLi=true;
         EstadoSwitch=false;

         if(ObjectFind(0,LINEASL)==0 && ObjectFind(0,LINEATP)==0)
            CrearLineas();

         ChartRedraw();
        }
     }

  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool GestionarLineas()
  {
   if(IsStLi)
     {
      if(ObjectFind(0,LINEAOP)==0)
        {
         if(ObjectFind(0,LINEASL)==0 && ObjectFind(0,LINEATP)==0)
           {
            double SL=0;
            double TP=0;
            double OP=0;

            if(ObjectFind(0,LINEAOP)==0)
               OP=NormalizeDouble(ObjectGetDouble(0,LINEAOP,OBJPROP_PRICE,0),Digits());
            if(ObjectFind(0,LINEASL)==0)
               SL=NormalizeDouble(ObjectGetDouble(0,LINEASL,OBJPROP_PRICE,0),Digits());
            if(ObjectFind(0,LINEATP)==0)
               TP=NormalizeDouble(ObjectGetDouble(0,LINEATP,OBJPROP_PRICE,0),Digits());

            double Volumen=0;
            double Ask=SymbolInfoDouble(NULL,SYMBOL_ASK);
            double Bid=SymbolInfoDouble(NULL,SYMBOL_BID);

            if(TP>OP && SL<OP)
              {
               if(CalcularLotaje(OP,SL,Volumen))
                 {
                  if(Ask<OP)
                    {
                     bool Ejecuto=trade.BuyStop(Volumen,OP,NULL,SL,TP,ORDER_TIME_GTC,0,"EXPERTO CONTROL");

                     if(Ejecuto==false)
                        Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                    }
                  else
                    {

                     bool Ejecuto=trade.BuyLimit(Volumen,OP,NULL,SL,TP,ORDER_TIME_GTC,0,"EXPERTO CONTROL");

                     if(Ejecuto==false)
                        Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                    }
                 }
              }
            else
               if(SL>OP && TP<OP)
                 {
                  if(CalcularLotaje(OP,SL,Volumen))
                    {
                     if(Bid>OP)
                       {
                        bool Ejecuto=trade.SellStop(Volumen,OP,NULL,SL,TP,ORDER_TIME_GTC,0,"EXPERTO CONTROL");

                        if(Ejecuto==false)
                           Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                       }
                     else
                       {
                        bool Ejecuto=trade.SellLimit(Volumen,OP,NULL,SL,TP,ORDER_TIME_GTC,0,"EXPERTO CONTROL");

                        if(Ejecuto==false)
                           Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                       }
                    }
                 }
               else
                 {
                  Print("Niveles de Precio Incorrectos");
                  return false;
                 }
           }
         else
           {
            Alert("No se puede definir STOP o LIMIT orden sin que este presente las linea SL Y TP");
            return false;
           }
        }
     }
   else
     {
      if(ObjectFind(0,LINEASL)==0 && ObjectFind(0,LINEATP)==0)
        {
         double SL=0;
         double TP=0;

         if(ObjectFind(0,LINEASL)==0)
            SL=NormalizeDouble(ObjectGetDouble(0,LINEASL,OBJPROP_PRICE,0),Digits());
         if(ObjectFind(0,LINEATP)==0)
            TP=NormalizeDouble(ObjectGetDouble(0,LINEATP,OBJPROP_PRICE,0),Digits());

         double Volumen=0;
         double Ask=SymbolInfoDouble(NULL,SYMBOL_ASK);
         double Bid=SymbolInfoDouble(NULL,SYMBOL_BID);


         if(Ask>SL && TP>Ask)
           {
            if(CalcularLotaje(Ask,SL,Volumen))
              {
               bool Ejecuto=trade.Buy(Volumen,NULL,Ask,SL,TP,"EXPERTO CONTROL");

               if(Ejecuto==false)
                  Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
              }
           }
         else
            if(Bid<SL && Bid>TP)
              {
               if(CalcularLotaje(Bid,SL,Volumen))
                 {
                  bool Ejecuto=trade.Sell(Volumen,NULL,Bid,SL,TP,"EXPERTO CONTROL");

                  if(Ejecuto==false)
                     Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                 }
              }
            else
               Print("Niveles de Precio Incorrectos");

        }
      else
        {
         Alert("No se puede definir MERCADO orden sin que este presente las linea SL Y TP");
         return false;
        }
     }

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CrearLineas()
  {

   int TP_=0;
   int SL_=0;
   double Bid=SymbolInfoDouble(NULL,SYMBOL_BID);

   double TP=Bid+100*Point(); //SE ESTABLECE EL TP
   double SL=Bid-100*Point(); //SE ESTABLECE EL SL

   if(IsStLi==true)
      if(ObjectFind(0,LINEAOP)!=0)
         HLineCreate(0,LINEAOP,0,Bid,clrBlueViolet,STYLE_DASH,1,false,true,true,0);

   if(ObjectFind(0,LINEASL)!=0)
      HLineCreate(0,LINEASL,0,SL,clrRed,STYLE_DASH,1,false,true,true,0);

   if(ObjectFind(0,LINEATP)!=0)
      HLineCreate(0,LINEATP,0,TP,clrGreen,STYLE_DASH,1,false,true,true,0);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HLineCreate(const long            chart_ID=0,        // chart's ID
                 const string          name="HLine",      // line name
                 const int             sub_window=0,      // subwindow index
                 double                price=0,           // line price
                 const color           clr=clrRed,        // line color
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // line style
                 const int             width=1,           // line width
                 const bool            back=false,        // in the background
                 const bool            selection=true,    // highlight to move
                 const bool            hidden=true,       // hidden in the object list
                 const long            z_order=0)         // priority for mouse click
  {
//--- if the price is not set, set it at the current Bid price level
   if(!price)
      price=SymbolInfoDouble(Symbol(),SYMBOL_BID);
//--- reset the error value
   ResetLastError();
//--- create a horizontal line
   if(!ObjectCreate(chart_ID,name,OBJ_HLINE,sub_window,0,price))
     {
      Print(__FUNCTION__,
            ": failed to create a horizontal line! Error code = ",GetLastError());
      return(false);
     }
//--- set line color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set line display style
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- set line width
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of moving the line by mouse
//--- when creating a graphical object using ObjectCreate function, the object cannot be
//--- highlighted and moved by default. Inside this method, selection parameter
//--- is true by default making it possible to highlight and move the object
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
//|                                                                  |
//+------------------------------------------------------------------+
bool CalcularLotaje(double Open,double SL,double &Lotaje_)
  {
   double Tick_Value=SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE);
   int rango=int(MathAbs(Open-SL)/Point())+1;
   double Perdida=Capital_Base*Porcentaje_Perdida/100.0;
   Print("Perdida Calculada ",DoubleToString(Perdida,2));
   double Lotaje=Perdida/(Tick_Value*rango);

   double Lots=int(Lotaje*100);
   Lots=NormalizeDouble(Lots/100.0,2);

   double Lote_Step=Lots/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
   int Lote_Step_int=int(Lots/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP));

// Print("Lote calculado es igual a  ",DoubleToString(Lots,2));

   if((Lote_Step-Lote_Step_int)>0)
     {
      Lots=Lote_Step_int*SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
      Print("Redondeando al Lote mas cercano permitido");
     }
//Lots=NormalizeDouble(Lots-SymbolInfoDouble(OrderSymbol(),SYMBOL_VOLUME_STEP),2);
   Print("Lote Calculado ",DoubleToString(Lots,2));

   if(Lots<SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
     {
      Print("Lote calculado menor que el minimo permitido por el Simbolo, igualando al lote minimo");
      Print("Lote = ",DoubleToString(SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN)));
      Lots=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
      Lotaje_=Lots;
      return true;
     }


   if(Lots<=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
     {
      Lotaje_=Lots;
      return true;
     }
   else
      Print("No opero porque el lote calculado es Superior al Lote Maximo del Simbolo");

   return false;

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarOrdenes()
  {

   double ProfitTotal=0;
//--- request trade history
   HistorySelect(TimeStart,TimeCurrent());
//--- create objects
   int     total=HistoryDealsTotal();
   ulong    ticket=0;
//--- for all deals

   int IDs[];

   ArrayResize(IDs,0);

   if(Conteo_Operaciones==SOLO_BOT)
      for(int i=total-1; i>=0; i--)
        {
         //--- try to get deals ticket
         if((ticket=HistoryDealGetTicket(i))>0)
           {
            int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
            int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
            int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
            double Profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
            int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
            string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);

            if(MagicNumb==Magic)
               if(entry==DEAL_ENTRY_IN)
                 {
                  int Size=ArraySize(IDs);
                  ArrayResize(IDs,Size+1);
                  IDs[Size]=ID;
                 }
            //}
           }
        }

   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         double Profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
         if(Conteo_Operaciones==SOLO_BOT)
           {
            for(int j=0; j<ArraySize(IDs); j++)
              {
               if(IDs[j]==ID)
                 {
                  if(entry==DEAL_ENTRY_OUT)
                    {
                     ProfitTotal=Profit+ProfitTotal;
                     break;
                    }
                 }
              }
           }
         else
           {
            if(entry==DEAL_ENTRY_OUT)
               ProfitTotal=Profit+ProfitTotal;
           }
         //}
        }
     }

   ulong Tickets[];

   ArrayResize(Tickets,0);

   int TotalPosiciones=PositionsTotal();
   for(int i=0; i<TotalPosiciones; i++)
     {
      ulong Ticket=PositionGetTicket(i);
      double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
      double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
      // if(PositionGetString(POSITION_COMMENT)!=CommentExpert)
      // continue;qp
      if(PositionGetInteger(POSITION_MAGIC)!=MagicNumb && Conteo_Operaciones==SOLO_BOT)
         continue;

      int Size=ArraySize(Tickets);

      ArrayResize(Tickets,Size+1);

      Tickets[Size]=Ticket;

      if(Ticket!=0)
        {
         ProfitTotal=ProfitTotal+PositionGetDouble(POSITION_PROFIT);
        }
     }

   ObjectSetString(0,EDIT_PROFIT_ACTUAL,OBJPROP_TEXT,DoubleToString(ProfitTotal,2));

   if(PerdidaMaxima>ProfitTotal)
     {
      ObjectSetString(0,EDIT_PROFIT_MINIMO,OBJPROP_TEXT,DoubleToString(ProfitTotal,2));
      PerdidaMaxima=ProfitTotal;
     }

   if(GananciaMaxima<ProfitTotal)
     {
      ObjectSetString(0,EDIT_PROFIT_MAXIMO,OBJPROP_TEXT,DoubleToString(ProfitTotal,2));
      GananciaMaxima=ProfitTotal;
     }


   if(ProfitTotal>(MathAbs(Maxima_Ganancia)))
     {
      int Size=ArraySize(Tickets);

      for(int i=0; i<Size; i++)
        {
         if(PositionSelectByTicket(Tickets[i]))
            trade.PositionClose(Tickets[i],-1);
        }
      Si_GananciaMaxima=true;

     }
   if(ProfitTotal<(MathAbs(Maxima_Perdida)*-1))
     {
      int Size=ArraySize(Tickets);

      for(int i=0; i<Size; i++)
        {
         if(PositionSelectByTicket(Tickets[i]))
            trade.PositionClose(Tickets[i],-1);
        }
      Si_PerdidaMaxima=true;

     }
  }

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
         if(ObjectFind(0,BOTONCREAR)!=0)
            ButtonCreate(0,BOTONCREAR,0,Desplazamiento+(Desplace*(SizeTexto*15+2)),DesplazamientoY,SizeTexto*15+2,Size,CORNER_BOTON,"Crear OPERACION","Arial",SizeTexto,clrWhite,clrBlue,clrNONE,false,false,false,true,0);

         Desplazamiento=Desplazamiento+SizeTexto*15+2+Espacio;
        }
      if(j==1)
        {
         if(ObjectFind(0,BOTONDIBUJAR)!=0)
            ButtonCreate(0,BOTONDIBUJAR,0,Desplazamiento+(Desplace*(SizeTexto*15+2)),DesplazamientoY,SizeTexto*15+2,Size,CORNER_BOTON,"Dibujar LINEAS","Arial",SizeTexto,clrWhite,clrBlue,clrNONE,false,false,false,true,0);

         Desplazamiento=Desplazamiento+SizeTexto*15+2+Espacio;
        }

      if(j==2)
        {
         if(ObjectFind(0,BOTON_SWITCH)!=0)
            ButtonCreate(0,BOTON_SWITCH,0,Desplazamiento+(Desplace*(SizeTexto*15+2)),DesplazamientoY,SizeTexto*15+2,Size,CORNER_BOTON,"STOP / LIMIT","Arial",SizeTexto,clrWhite,clrMagenta,clrNONE,false,false,false,true,0);
         else
            ObjectSetInteger(0,BOTON_SWITCH,OBJPROP_STATE,false);

         Desplazamiento=Desplazamiento+SizeTexto*15+2+Espacio;
        }
     }
  }
//+------------------------------------------------------------------+




//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Creacion_CONTROL(int Desplazamiento,int Desplace,int DesplazamientoY,int Derecha,int Size)
  {
   int j=0;

   for(int i=0; i<7; i++)
     {
      j=Derecha==0?i:MathAbs(6-i);

      if(j==0)
        {
         if(ObjectFind(0,BOTON_REINICIO)!=0)
            ButtonCreate(0,BOTON_REINICIO,0,Desplazamiento+(Desplace*(SizeTexto*8+2)),DesplazamientoY,SizeTexto*8+2,Size,CORNER_BOTON,"REINICIO","Arial",SizeTexto,clrWhite,clrRed,clrWhite,false,false,false,true,0);

         Desplazamiento=Desplazamiento+SizeTexto*8+2;
        }


      if(j==1)
        {
         if(ObjectFind(0,PROFIT_ACTUAL)!=0)
            ButtonCreate(0,PROFIT_ACTUAL,0,Desplazamiento+(Desplace*(SizeTexto*30+2)),DesplazamientoY,SizeTexto*30+2,Size,CORNER_BOTON,"PERDIDAS Y GANANCIAS ACTUALES: ","Arial",SizeTexto,clrBlack,clrOrange,clrRed,false,false,false,true,0);

         Desplazamiento=Desplazamiento+SizeTexto*30+2;
        }
      if(j==2)
        {

         if(ObjectFind(0,EDIT_PROFIT_ACTUAL)!=0)
            EditCreate(0,EDIT_PROFIT_ACTUAL,0,Desplazamiento+(Desplace*(SizeTexto*6+6)),DesplazamientoY,SizeTexto*6+6,Size,IntegerToString(0),"Arial",SizeTexto,ALIGN_CENTER,true,CORNER_BOTON,clrBlack,clrWhite,clrRed,false,false,true,0);

         Desplazamiento=Desplazamiento+SizeTexto*6+6;
        }

      if(j==3)
        {
         if(ObjectFind(0,PROFIT_MAXIMO)!=0)
            ButtonCreate(0,PROFIT_MAXIMO,0,Desplazamiento+(Desplace*(SizeTexto*26+2)),DesplazamientoY,SizeTexto*26+2,Size,CORNER_BOTON,"MAXIMA GANANCIA POTENCIAL: ","Arial",SizeTexto,clrBlack,clrOrange,clrRed,false,false,false,true,0);

         Desplazamiento=Desplazamiento+SizeTexto*26+2;
        }

      if(j==4)
        {
         if(ObjectFind(0,EDIT_PROFIT_MAXIMO)!=0)
            EditCreate(0,EDIT_PROFIT_MAXIMO,0,Desplazamiento+(Desplace*(SizeTexto*6+6)),DesplazamientoY,SizeTexto*6+6,Size,IntegerToString(0),"Arial",SizeTexto,ALIGN_CENTER,true,CORNER_BOTON,clrBlack,clrWhite,clrRed,false,false,true,0);

         Desplazamiento=Desplazamiento+SizeTexto*6+6;
        }



      if(j==5)
        {
         if(ObjectFind(0,PROFIT_MINIMO)!=0)
            ButtonCreate(0,PROFIT_MINIMO,0,Desplazamiento+(Desplace*(SizeTexto*26+2)),DesplazamientoY,SizeTexto*26+2,Size,CORNER_BOTON,"MAXIMA PERDIDA POTENCIAL: ","Arial",SizeTexto,clrBlack,clrOrange,clrRed,false,false,false,true,0);

         Desplazamiento=Desplazamiento+SizeTexto*26+2;
        }

      if(j==6)
        {
         if(ObjectFind(0,EDIT_PROFIT_MINIMO)!=0)
            EditCreate(0,EDIT_PROFIT_MINIMO,0,Desplazamiento+(Desplace*(SizeTexto*6+6)),DesplazamientoY,SizeTexto*6+6,Size,IntegerToString(0),"Arial",SizeTexto,ALIGN_CENTER,true,CORNER_BOTON,clrBlack,clrWhite,clrRed,false,false,true,0);

         Desplazamiento=Desplazamiento+SizeTexto*6+6;
        }
     }
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
