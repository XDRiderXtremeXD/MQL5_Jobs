//+------------------------------------------------------------------+
//|                                                    LinePrice.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0

input color clrLine=clrAqua;
input ENUM_LINE_STYLE StyleLine=STYLE_SOLID;
input uint WidthLine=1;


string NombreBoton="BOTON 2022";

string LinePrice="Linea Precio 2022 AFK";
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   if(ObjectFind(0,LinePrice)!=0)
      HLineCreate(0,LinePrice,0,0,clrLine,StyleLine,WidthLine,false,false,true,0);

   ButtonCreate(0,NombreBoton,0,50,50,50,18);
   EventSetMillisecondTimer(1);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   if(ObjectFind(0,LinePrice)==0)
      ObjectMove(0,LinePrice,0,TimeCurrent(),SymbolInfoDouble(Symbol(),SYMBOL_BID));
//--- return value of prev_calculated for next call
   return(rates_total);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EventKillTimer();
   if(ObjectFind(0,LinePrice)==0)
      ObjectDelete(0,LinePrice);

   if(ObjectFind(0,NombreBoton)==0)
      ObjectDelete(0,NombreBoton);
  }
//+------------------------------------------------------------------+
bool HLineCreate(const long            chart_ID=0,        // ID del gráfico
                 const string          name="HLine",      // nombre de la línea
                 const int             sub_window=0,      // índice de subventana
                 double                price=0,           // precio de la línea
                 const color           clr=clrRed,        // color de la línea
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de la línea
                 const int             width=1,           // grosor de la línea
                 const bool            back=false,        // al fondo
                 const bool            selection=true,    // seleccionar para mover
                 const bool            hidden=true,       // ocultar en la lista de objetos
                 const long            z_order=1000)         // prioridad para el clic del ratón
  {
//--- si el precio no ha sido establecido, la ponemos en el nivel del precio Bid actual
   if(!price)
      price=SymbolInfoDouble(Symbol(),SYMBOL_BID);
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la línea horizontal
   if(!ObjectCreate(chart_ID,name,OBJ_HLINE,sub_window,0,price))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la línea horizontal! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos el color de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el estilo de visualización de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- establecemos el grosor de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de desplazamiento de la línea con ratón
//--- cuando el objeto gráfico se crea usando la función ObjectCreate, por defecto el objeto
//--- no se puede seleccionar y mover. Mientras que dentro de este método el parámetro selection
//--- por defecto es igual a true, lo que permite seleccionar y mover este objeto
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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ButtonCreate(const long              chart_ID=0,               // ID del gráfico
                  const string            name="Button",            // nombre del botón
                  const int               sub_window=0,             // número de subventana
                  const int               x=0,                      // coordenada por el eje X
                  const int               y=0,                      // coordenada por el eje Y
                  const int               width=50,                 // ancho del botón
                  const int               height=18,                // alto del botón
                  const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace
                  const string            text="Button",            // texto
                  const string            font="Arial",             // fuente
                  const int               font_size=10,             // tamaño de la fuente
                  const color             clr=clrBlack,             // color del texto
                  const color             back_clr=C'236,233,216',  // color del fondo
                  const color             border_clr=clrNONE,       // color del borde
                  const bool              state=false,              // pulsado/no pulsado
                  const bool              back=false,               // al fondo
                  const bool              selection=false,          // seleccionar para mover
                  const bool              hidden=true,              // ocultar en la lista de objetos
                  const long              z_order=0)                //prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos el botón
   if(!ObjectCreate(chart_ID,name,OBJ_BUTTON,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear el botón! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos las coordenadas del botón
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- establecemos el tamaño del botón
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del punto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- ponemos el texto
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- establecemos la fuente del texto
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- establecemos el tamaño del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- establecemos el color del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el color del fondo
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- establecemos el color del borde
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- set button state
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
//--- activar (true) o desactivar (false) el modo de desplazamiento del botón con ratón
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,false);
//--- establecemos la prioridad para obtener el evento de cliquear sobre el gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- ejecución con éxito
   return(true);
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  OnTimer()
  {
   if(ObjectFind(0,NombreBoton)==0)
     {
      if(ObjectGetInteger(0,NombreBoton,OBJPROP_STATE)==true)
        {
        Print("Entra");
         if(!ObjectSetInteger(0,LinePrice,OBJPROP_BACK,!ObjectGetInteger(0,LinePrice,OBJPROP_BACK,0)))
         Print("No modifico");

         ObjectSetInteger(0,NombreBoton,OBJPROP_STATE,false);
        }

     }
  }
//+------------------------------------------------------------------+
