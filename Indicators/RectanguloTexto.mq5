//+------------------------------------------------------------------+
//|                                              RectanguloTexto.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                   LineaTexto.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0



enum enum_Ubicacion
  {
   Inicio=0,
   Medio=1,
   Final=2,
  };

input string texto="--------- TEXTO -----------";//-----------------------
input enum_Ubicacion Ubicacion_X=Inicio;
input enum_Ubicacion Ubicacion_Y=Inicio;
input string Texto="Hola";
input string Fuente="Arial";
input uint  Size_Texto=12;//Tamaño texto
input color color_Texto=clrBlue;
input string Cuadro="--------- CUADRO -----------";//-----------------------
input color ColorLinea_Borde=clrMagenta;//Color Linea Borde
input int Width_Linea_Borde=1;//Tamaño Linea Borde
input color color_Rectangulo=clrAqua;//Color Fondo Rectangulo
input color color_Linea_Alerta=clrGold;//Color Fondo Alerta Rectangulo
uint grosor_Rectangulo=1;
input ENUM_LINE_STYLE estilo_Rectangulo=STYLE_SOLID;//Estilo Borde Rectangulo
input bool rellenar=true;
input bool fondo=false;
input string alertas="--------- ALERTAS -----------";//-----------------------
input bool Alert_Push=true;
input bool Alert_Sound=true;
input bool Alert_Mail=false;


double Precio_P=0;
datetime Tiempo_P=0;

int sub;
int X;
int Y;

datetime tiempoRecarga=0;
string Trend="Rectangulo 1004 ";

MqlRates RatesM1[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   ChartSetInteger(0,CHART_EVENT_MOUSE_MOVE,true);
   ChartSetInteger(0,CHART_EVENT_OBJECT_DELETE,true);

   ArraySetAsSeries(RatesM1,true);
//---
   return(INIT_SUCCEEDED);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
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

   ArraySetAsSeries(close,true);


   ArrayResize(RatesM1,3);
   int copied=CopyRates(NULL,0,0,3,RatesM1);

   int RayosUP=ObjectsTotal(0,0,OBJ_RECTANGLE);
   for(int i=RayosUP-1; i>=0; i--)
     {
      string Name_Trend=ObjectName(0,i,0,OBJ_RECTANGLE);
      if(StringFind(Name_Trend,Trend,0)!=-1)
        {
         double Price1=ObjectGetDouble(0,Name_Trend,OBJPROP_PRICE,0);
         double Price2=ObjectGetDouble(0,Name_Trend,OBJPROP_PRICE,1);
         string descripcion=ObjectGetString(0,Name_Trend,OBJPROP_TEXT,0);

         if(descripcion!="AlertaSonada")
           {
            if((RatesM1[1].close<Price1 && RatesM1[0].close>Price1) || (RatesM1[1].close>Price1 && RatesM1[0].close<Price1))
              {
               Alertas(Price1);
               ObjectSetString(0,Name_Trend,OBJPROP_TEXT,"AlertaSonada");
               ObjectSetInteger(0,Name_Trend,OBJPROP_COLOR,color_Linea_Alerta);
              }
            if((RatesM1[1].close<Price2 && RatesM1[0].close>Price2) || (RatesM1[1].close>Price2 && RatesM1[0].close<Price2))
              {
               Alertas(Price1);
               ObjectSetString(0,Name_Trend,OBJPROP_TEXT,"AlertaSonada");
               ObjectSetInteger(0,Name_Trend,OBJPROP_COLOR,color_Linea_Alerta);
              }
           }
        }
     }


//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // identificador de evento
                  const long& lparam,   // parámetro de evento del tipo long
                  const double& dparam, // parámetro de evento del tipo double
                  const string& sparam  // parámetro de evento del tipo string
                 )
  {

   if(id==6)
     {
      if(StringFind(sparam,Trend,0)!=-1)
        {
         ObjectDelete(0,sparam+"Text");
         ObjectDelete(0,sparam+"up");
         ObjectDelete(0,sparam+"dn");
         ObjectDelete(0,sparam+"left");
         ObjectDelete(0,sparam+"right");
         ChartRedraw();
        }
     }

   if(id==2)
     {
      if((ObjectGetInteger(0,sparam,OBJPROP_TYPE,0)==OBJ_RECTANGLE) && StringFind(sparam,Trend,0)!=-1)
        {
         string IDs[2];
         string Id=StringSubstr(sparam,StringFind(sparam,"ID:",0)+3,-1);
         StringSplit(Id,StringGetCharacter(",",0),IDs);

         double PrecioIncio=ObjectGetDouble(0,sparam,OBJPROP_PRICE,0);
         double PrecioFinal=ObjectGetDouble(0,sparam,OBJPROP_PRICE,1);
         datetime TiempoInicio=(datetime)ObjectGetInteger(0,sparam,OBJPROP_TIME,0);
         datetime TiempoFinal=(datetime)ObjectGetInteger(0,sparam,OBJPROP_TIME,1);

         ObjectSetDouble(0,sparam+"up",OBJPROP_PRICE,0,PrecioIncio);
         ObjectSetDouble(0,sparam+"up",OBJPROP_PRICE,1,PrecioIncio);
         ObjectSetInteger(0,sparam+"up",OBJPROP_TIME,0,TiempoInicio);
         ObjectSetInteger(0,sparam+"up",OBJPROP_TIME,1,TiempoFinal);
         
         ObjectSetDouble(0,sparam+"dn",OBJPROP_PRICE,0,PrecioFinal);
         ObjectSetDouble(0,sparam+"dn",OBJPROP_PRICE,1,PrecioFinal);
         ObjectSetInteger(0,sparam+"dn",OBJPROP_TIME,0,TiempoInicio);
         ObjectSetInteger(0,sparam+"dn",OBJPROP_TIME,1,TiempoFinal);
         
         ObjectSetDouble(0,sparam+"left",OBJPROP_PRICE,0,PrecioIncio);
         ObjectSetDouble(0,sparam+"left",OBJPROP_PRICE,1,PrecioFinal);
         ObjectSetInteger(0,sparam+"left",OBJPROP_TIME,0,TiempoInicio);
         ObjectSetInteger(0,sparam+"left",OBJPROP_TIME,1,TiempoInicio);
         
         ObjectSetDouble(0,sparam+"right",OBJPROP_PRICE,0,PrecioIncio);
         ObjectSetDouble(0,sparam+"right",OBJPROP_PRICE,1,PrecioFinal);
         ObjectSetInteger(0,sparam+"right",OBJPROP_TIME,0,TiempoFinal);
         ObjectSetInteger(0,sparam+"right",OBJPROP_TIME,1,TiempoFinal);

         int XI=0,XF=0;
         int YI=0,YF=0;
         ChartTimePriceToXY(0,0,TiempoInicio,PrecioIncio,XI,YI);
         ChartTimePriceToXY(0,0,TiempoFinal,PrecioFinal,XF,YF);
         int XM=XI+int((XF-XI)/2.0);
         int YM=YI+int((YF-YI)/2.0);

         datetime TiempoUbicacion=0;
         double   PrecioUbicacion=0;

         double PrecioMedio=PrecioIncio+(PrecioFinal-PrecioIncio)/2;

         ENUM_ANCHOR_POINT Anchor=ANCHOR_LEFT_LOWER;
         if(IDs[1]=="Inicio")
           {
            if(IDs[0]=="Inicio")
              {
               ChartXYToTimePrice(0,XI,YI,sub,TiempoUbicacion,PrecioUbicacion);
               TiempoUbicacion=TiempoInicio;
               PrecioUbicacion=PrecioIncio;
              }
            else
               if(IDs[0]=="Medio")
                 {
                  ChartXYToTimePrice(0,XM,YI,sub,TiempoUbicacion,PrecioUbicacion);
                  TiempoUbicacion=TiempoUbicacion;
                  PrecioUbicacion=PrecioIncio;
                 }
               else
                 {
                  ChartXYToTimePrice(0,XF,YI,sub,TiempoUbicacion,PrecioUbicacion);
                  TiempoUbicacion=TiempoFinal;
                  PrecioUbicacion=PrecioIncio;
                 }
           }
         else
            if(IDs[1]=="Medio")
              {
               if(IDs[0]=="Inicio")
                 {
                  ChartXYToTimePrice(0,XI,YM,sub,TiempoUbicacion,PrecioUbicacion);
                  TiempoUbicacion=TiempoInicio;
                  PrecioUbicacion=PrecioMedio;
                 }
               else
                  if(IDs[0]=="Medio")
                    {
                     ChartXYToTimePrice(0,XM,YM,sub,TiempoUbicacion,PrecioUbicacion);
                     TiempoUbicacion=TiempoUbicacion;
                     PrecioUbicacion=PrecioMedio;
                    }
                  else
                    {
                     ChartXYToTimePrice(0,XF,YM,sub,TiempoUbicacion,PrecioUbicacion);
                     TiempoUbicacion=TiempoFinal;
                     PrecioUbicacion=PrecioMedio;
                    }
              }
            else
              {
               if(IDs[0]=="Inicio")
                 {
                  ChartXYToTimePrice(0,XI,YF,sub,TiempoUbicacion,PrecioUbicacion);
                  TiempoUbicacion=TiempoInicio;
                  PrecioUbicacion=PrecioFinal;
                 }
               else
                  if(IDs[0]=="Medio")
                    {
                     ChartXYToTimePrice(0,XM,YF,sub,TiempoUbicacion,PrecioUbicacion);
                     TiempoUbicacion=TiempoUbicacion;
                     PrecioUbicacion=PrecioFinal;
                    }
                  else
                    {
                     ChartXYToTimePrice(0,XF,YF,sub,TiempoUbicacion,PrecioUbicacion);
                     TiempoUbicacion=TiempoFinal;
                     PrecioUbicacion=PrecioFinal;
                    }
              }

         ObjectSetDouble(0,sparam+"Text",OBJPROP_PRICE,0,PrecioUbicacion);
         ObjectSetInteger(0,sparam+"Text",OBJPROP_TIME,0,TiempoUbicacion);

         ChartRedraw(0);
        }
     }


   if(id==CHARTEVENT_MOUSE_MOVE)
     {
      X=(int)lparam;
      Y=(int)dparam;
      ChartXYToTimePrice(0,X,Y,sub,Tiempo_P,Precio_P);
     }

   if(id==CHARTEVENT_KEYDOWN)
     {
      if(lparam==71)
        {
         static int Enumeracion=0;
         int Width_Barras=(int)ChartGetInteger(0,CHART_WIDTH_IN_BARS,0);

         /* ArraySetAsSeries(Rates,true);
          ArrayResize(Rates,3);
          int copied=CopyRates(NULL,0,0,3,Rates);
          if(copied<=0)
             Print("Error copying price data ",GetLastError());
          */if(Enumeracion==100)
            Enumeracion=0;

         string ID="ID:"+EnumToString(Ubicacion_X)+","+EnumToString(Ubicacion_Y);

         string Name_Rectangle=Trend+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES|TIME_SECONDS)+" N°:"+(string)Enumeracion+ID;
         string Name_Text=Name_Rectangle+"Text";

         int Bar=iBarShift(Symbol(),PERIOD_CURRENT,Tiempo_P,false);

         int X_Max=(int)ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0);
         int Y_Max=(int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0);
         int X1=(int)(X_Max/4.0);
         int Y1=(int)(Y_Max/4.0);

         int X_=MathMin(X+X1,X_Max);
         int Y_=MathMin(Y+Y1,Y_Max);

         datetime Tiempo_F=0;
         double Precio_F=0;

         ChartXYToTimePrice(0,X_,Y_,sub,Tiempo_F,Precio_F);

         if(RectangleCreate(0,Name_Rectangle,0,Tiempo_P,Precio_P,Tiempo_F,Precio_F,color_Rectangulo,estilo_Rectangulo,grosor_Rectangulo,rellenar,fondo,true,true,0))
           {
            double PrecioIncio=ObjectGetDouble(0,Name_Rectangle,OBJPROP_PRICE,0);
            double PrecioFinal=ObjectGetDouble(0,Name_Rectangle,OBJPROP_PRICE,1);
            datetime TiempoInicio=(datetime)ObjectGetInteger(0,Name_Rectangle,OBJPROP_TIME,0);
            datetime TiempoFinal=(datetime)ObjectGetInteger(0,Name_Rectangle,OBJPROP_TIME,1);

            TrendCreate(0,Name_Rectangle+"up",0,TiempoInicio,PrecioIncio,TiempoFinal,PrecioIncio,ColorLinea_Borde,estilo_Rectangulo,Width_Linea_Borde,fondo,false,false,false,true,0);
            TrendCreate(0,Name_Rectangle+"dn",0,TiempoInicio,PrecioFinal,TiempoFinal,PrecioFinal,ColorLinea_Borde,estilo_Rectangulo,Width_Linea_Borde,fondo,false,false,false,true,0);
            TrendCreate(0,Name_Rectangle+"left",0,TiempoInicio,PrecioIncio,TiempoInicio,PrecioFinal,ColorLinea_Borde,estilo_Rectangulo,Width_Linea_Borde,fondo,false,false,false,true,0);
            TrendCreate(0,Name_Rectangle+"right",0,TiempoFinal,PrecioIncio,TiempoFinal,PrecioFinal,ColorLinea_Borde,estilo_Rectangulo,Width_Linea_Borde,fondo,false,false,false,true,0);

            double PrecioMedio=PrecioIncio+(PrecioFinal-PrecioIncio)/2;

            int XI=0,XF=0;
            int YI=0,YF=0;
            ChartTimePriceToXY(0,0,TiempoInicio,PrecioIncio,XI,YI);
            ChartTimePriceToXY(0,0,TiempoFinal,PrecioFinal,XF,YF);
            int XM=XI+int((XF-XI)/2.0);
            int YM=YI+int((YF-YI)/2.0);

            datetime TiempoUbicacion=0;
            double   PrecioUbicacion=0;

            ENUM_ANCHOR_POINT Anchor=ANCHOR_LEFT_LOWER;
            if(Ubicacion_Y==Inicio)
              {
               if(Ubicacion_X==Inicio)
                 {
                  Anchor=ANCHOR_LEFT_UPPER;
                  ChartXYToTimePrice(0,XI,YI,sub,TiempoUbicacion,PrecioUbicacion);
                  TiempoUbicacion=TiempoInicio;
                  PrecioUbicacion=PrecioIncio;
                 }
               else
                  if(Ubicacion_X==Medio)
                    {
                     Anchor=ANCHOR_UPPER;
                     ChartXYToTimePrice(0,XM,YI,sub,TiempoUbicacion,PrecioUbicacion);
                     TiempoUbicacion=TiempoUbicacion;
                     PrecioUbicacion=PrecioIncio;
                    }
                  else
                    {
                     Anchor=ANCHOR_RIGHT_UPPER;
                     ChartXYToTimePrice(0,XF,YI,sub,TiempoUbicacion,PrecioUbicacion);
                     TiempoUbicacion=TiempoFinal;
                     PrecioUbicacion=PrecioIncio;
                    }
              }
            else
               if(Ubicacion_Y==Medio)
                 {
                  if(Ubicacion_X==Inicio)
                    {
                     Anchor=ANCHOR_LEFT;
                     ChartXYToTimePrice(0,XI,YM,sub,TiempoUbicacion,PrecioUbicacion);
                     TiempoUbicacion=TiempoInicio;
                     PrecioUbicacion=PrecioMedio;
                    }
                  else
                     if(Ubicacion_X==Medio)
                       {
                        Anchor=ANCHOR_CENTER;
                        ChartXYToTimePrice(0,XM,YM,sub,TiempoUbicacion,PrecioUbicacion);
                        TiempoUbicacion=TiempoUbicacion;
                        PrecioUbicacion=PrecioMedio;
                       }
                     else
                       {
                        Anchor=ANCHOR_RIGHT;
                        ChartXYToTimePrice(0,XF,YM,sub,TiempoUbicacion,PrecioUbicacion);
                        TiempoUbicacion=TiempoFinal;
                        PrecioUbicacion=PrecioMedio;
                       }
                 }
               else
                 {
                  if(Ubicacion_X==Inicio)
                    {
                     Anchor=ANCHOR_LEFT_LOWER;
                     ChartXYToTimePrice(0,XI,YF,sub,TiempoUbicacion,PrecioUbicacion);
                     TiempoUbicacion=TiempoInicio;
                     PrecioUbicacion=PrecioFinal;
                    }
                  else
                     if(Ubicacion_X==Medio)
                       {
                        Anchor=ANCHOR_LOWER;
                        ChartXYToTimePrice(0,XM,YF,sub,TiempoUbicacion,PrecioUbicacion);
                        TiempoUbicacion=TiempoUbicacion;
                        PrecioUbicacion=PrecioFinal;
                       }
                     else
                       {
                        Anchor=ANCHOR_RIGHT_LOWER;
                        ChartXYToTimePrice(0,XF,YF,sub,TiempoUbicacion,PrecioUbicacion);
                        TiempoUbicacion=TiempoFinal;
                        PrecioUbicacion=PrecioFinal;
                       }
                 }

            TextCreate(0,Name_Text,0,TiempoUbicacion,PrecioUbicacion,Texto,Fuente,Size_Texto,color_Texto,0,Anchor,true,true,true,5);

            Enumeracion++;
           }
         ChartRedraw();
        }
     }
  }
//+------------------------------------------------------------------+
bool RectangleCreate(const long            chart_ID=0,        // ID del gráfico
                     const string          name="Rectangle",  // nombre del rectángulo
                     const int             sub_window=0,      // número de subventana
                     datetime              time1=0,           // hora del primer punto
                     double                price1=0,          // precio del primer punto
                     datetime              time2=0,           // hora del segundo punto
                     double                price2=0,          // precio del segundo punto
                     const color           clr=clrRed,        // color del rectángulo
                     const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de las líneas del rectángulo
                     const int             width=1,           // grosor de las líneas del rectángulo
                     const bool            fill=false,        // relleno del rectángulo con el color
                     const bool            back=false,        // al fondo
                     const bool            selection=true,    // seleccionar para mover
                     const bool            hidden=true,       // ocultar en la lista de objetos
                     const long            z_order=0)         // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos el rectángulo según las coordenadas establecidas
   if(!ObjectCreate(chart_ID,name,OBJ_RECTANGLE,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear el rectángulo! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos el color del rectángulo
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el estilo de las líneas del rectángulo
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- establecemos el grosor de las líneas del rectángulo
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- activar (true) o desactivar (false) el modo de relleno del rectángulo
   ObjectSetInteger(chart_ID,name,OBJPROP_FILL,fill);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de selección del rectángulo para mover
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
//|                                                                  |
//+------------------------------------------------------------------+
bool TrendCreate(const long            chart_ID=0,        // ID del gráfico
                 const string          name="TrendLine",  // Nombre de la línea
                 const int             sub_window=0,      // índice de subventana
                 datetime              time1=0,           // hora del primer punto
                 double                price1=0,          // precio del primer punto
                 datetime              time2=0,           // hora del segundo punto
                 double                price2=0,          // precio del segundo punto
                 const color           clr=clrRed,        // color de la línea
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de la línea
                 const int             width=1,           // grosor de la línea
                 const bool            back=false,        // al fondo
                 const bool            selection=true,    // seleccionar para mover
                 const bool            ray_left=false,    // continuación de la línea a la izquierda
                 const bool            ray_right=false,   // continuación de la línea a la derecha
                 const bool            hidden=true,       // ocultar en la lista de objetos
                 const long            z_order=0)         // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la línea de tendencia según las coordenadas establecidas
   if(!ObjectCreate(chart_ID,name,OBJ_TREND,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la línea de tendencia! Código del error = ",GetLastError());
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
//--- activamos (true) o desactivamos (false) el modo de continuación de la línea a la izquierda
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_LEFT,ray_left);
//--- activamos (true) o desactivamos (false) el modo de continuación de la línea a la derecha
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right);
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
bool TextCreate(const long              chart_ID=0,               // ID del gráfico
                const string            name="Text",              // nombre del objeto
                const int               sub_window=0,             // número de subventana
                datetime                time=0,                   // hora del punto de anclaje
                double                  price=0,                  // precio del punto de anclaje
                const string            text="Text",              // el texto
                const string            font="Arial",             // fuente
                const int               font_size=10,             // tamaño de la fuente
                const color             clr=clrRed,               // color
                const double            angle=0.0,                // inclinación del texto
                const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // modo de anclaje
                const bool              back=false,               // al fondo
                const bool              selection=false,          // seleccionar para mover
                const bool              hidden=true,              // ocultar en la lista de objetos
                const long              z_order=0)                // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos el objeto "Texto"
   if(!ObjectCreate(chart_ID,name,OBJ_TEXT,sub_window,time,price))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear el objeto \"Texto\"! Código del error = ",GetLastError());
      return(false);
     }
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
//--- activar (true) o desactivar (false) el modo de desplazamiento del texto con ratón
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
void Alertas(double Price)
  {
   if(Alert_Sound)
      Alert("Precio llego a "+DoubleToString(Price,Digits())+" en "+Symbol());

   if(Alert_Push)
      SendNotification("Precio llego a "+DoubleToString(Price,Digits())+" en "+Symbol());

   if(Alert_Mail)
      SendMail("Precio llego a "+DoubleToString(Price,Digits())+" en "+Symbol(),"Precio llego a "+DoubleToString(Price,Digits())+" en "+Symbol());

  }
//+------------------------------------------------------------------+
