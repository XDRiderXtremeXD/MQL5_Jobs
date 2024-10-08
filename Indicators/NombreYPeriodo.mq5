//+------------------------------------------------------------------+
//|                                               NombreYPeriodo.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 0
#property indicator_plots 0

input color Color_Texto=clrIndigo;//Color Texto
input int  SizeTexto=50;//Tamaño Texto
input int x_Desfase=0;//Distancia Eje X
input int y_Porcentaje_Distancia=50;//Separacion Eje Y en Porcentaje

string namePeriod="LABEL NAMEPERIOD 2023";
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   int PrecioStep=int(ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0));
   int yCenter=int(PrecioStep/2);
   int ySeparacion= int(yCenter*(y_Porcentaje_Distancia/100.0));

   string Periodo=EnumToString(Period());
   Periodo=StringSubstr(Periodo,7,-1);

   LabelCreate(0,namePeriod+"UP",0,x_Desfase,yCenter-ySeparacion,CORNER_RIGHT_UPPER,Symbol()+" "+Periodo,"Arial",SizeTexto,Color_Texto,0,ANCHOR_RIGHT,false,false,true,0);
   LabelCreate(0,namePeriod+"Center",0,x_Desfase,yCenter,CORNER_RIGHT_UPPER,Symbol()+" "+Periodo,"Arial",SizeTexto,Color_Texto,0,ANCHOR_RIGHT,false,false,true,0);
   LabelCreate(0,namePeriod+"DN",0,x_Desfase,yCenter+ySeparacion,CORNER_RIGHT_UPPER,Symbol()+" "+Periodo,"Arial",SizeTexto,Color_Texto,0,ANCHOR_RIGHT,false,false,true,0);

   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,namePeriod,-1,-1);
  }


//+------------------------------------------------------------------+
//|                                                                  |
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

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
bool LabelCreate(const long              chart_ID=0,               // ID del gráfico
                 const string            name="Label",             // nombre de la etiqueta
                 const int               sub_window=0,             // número de subventana
                 const int               x=0,                      // coordenada por el eje X
                 const int               y=0,                      // coordenada por el eje Y
                 const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace
                 const string            text="Label",             // texto
                 const string            font="Arial",             // fuente
                 const int               font_size=10,             // tamaño de la fuente
                 const color             clr=clrRed,               // color
                 const double            angle=0.0,                // inclinación del texto
                 const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // modo de anclaje
                 const bool              back=false,               // al fondo
                 const bool              selection=false,          // seleccionar para mover
                 const bool              hidden=true,              // ocultar en la lista de objetos
                 const long              z_order=0)                //prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la etiqueta de texto
   if(!ObjectCreate(chart_ID,name,OBJ_LABEL,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la etiqueta de texto! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos las coordenadas de la etiqueta
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del punto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- ponemos el texto
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- establecemos la fuente del texto
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- establecemos el tamaño del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- establecemos el ángulo de inclinación del texto
   ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);
//--- establecemos el modo de anclaje
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
//--- establecemos el color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
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
void OnChartEvent(const int id,         // identificador de evento
                  const long& lparam,   // parámetro de evento del tipo long
                  const double& dparam, // parámetro de evento del tipo double
                  const string& sparam  // parámetro de evento del tipo string
                 )
  {

   if(id==9)
     {
      int PrecioStep=int(ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0));
      int yCenter=int(PrecioStep/2);
      int ySeparacion= int(yCenter*(y_Porcentaje_Distancia/100.0));

      ObjectSetInteger(0,namePeriod+"UP",OBJPROP_YDISTANCE,yCenter-ySeparacion);
      ObjectSetInteger(0,namePeriod+"Center",OBJPROP_YDISTANCE,yCenter);
      ObjectSetInteger(0,namePeriod+"DN",OBJPROP_YDISTANCE,yCenter+ySeparacion);
      ChartRedraw();
     }
  }
//+------------------------------------------------------------------+
