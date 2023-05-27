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
input enum_Ubicacion Ubicacion=Inicio;
input string Texto="Hola";
input string Fuente="Arial";
input uint  Size_Texto=12;//Tamaño texto
input color color_Texto=clrAqua;
input string linea="--------- LINEA -----------";//-----------------------
input color color_Linea=clrAqua;
input color color_Linea_Alerta=clrGold;
input uint grosor_Linea=1;
input ENUM_LINE_STYLE estilo_Linea=STYLE_SOLID;
input string alertas="--------- ALERTAS -----------";//-----------------------
input bool Alert_Push=true;
input bool Alert_Sound=true;
input bool Alert_Mail=false;


double Precio_P=0;
datetime Tiempo_P=0;
datetime Tiempo_U=0;
double Precio_U=0;
datetime Tiempo_M=0;
double Precio_M=0;

int sub;
datetime TiempoEspera=0;
MqlRates Rates[];
MqlRates RatesM1[];

int X;
int Y;

datetime tiempoRecarga=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   int X1=(int)ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0);
   int Y1=(int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0);
   ChartXYToTimePrice(0,X1,Y1,sub,Tiempo_U,Precio_U);
   Funcion_Cambio_Trend(Tiempo_U);
   
   ArraySetAsSeries(RatesM1,true);

//--- indicator buffers mapping
   ChartSetInteger(0,CHART_EVENT_MOUSE_MOVE,true);
   ChartSetInteger(0,CHART_EVENT_OBJECT_DELETE,true);

   EventSetMillisecondTimer(1);
//---
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   if(tiempoRecarga!=0)
     {
      if(TimeLocal()>=tiempoRecarga)
        {
         int X1=(int)ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0);
         int Y1=(int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0);
         ChartXYToTimePrice(0,X1,Y1,sub,Tiempo_U,Precio_U);
         Funcion_Cambio_Trend(Tiempo_U);

         tiempoRecarga=0;
        }
     }

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EventKillTimer();
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

   if(prev_calculated!=rates_total)
      Funcion_Cambio_Trend(Tiempo_U);


   ArrayResize(RatesM1,3);
   int copied=CopyRates(NULL,0,0,3,RatesM1);

   int RayosUP=ObjectsTotal(0,0,OBJ_TREND);
   for(int i=RayosUP-1; i>=0; i--)
     {
      string Name_Trend=ObjectName(0,i,0,OBJ_TREND);
      if(StringFind(Name_Trend,"TrendLine 1004",0)!=-1)
        {
         double Price1=ObjectGetDouble(0,Name_Trend,OBJPROP_PRICE,0);
         string descripcion=ObjectGetString(0,Name_Trend,OBJPROP_TEXT,0);

         if(descripcion!="AlertaSonada")
            if((RatesM1[1].close<Price1 && RatesM1[0].close>Price1) || (RatesM1[1].close>Price1 && RatesM1[0].close<Price1))
              {
               Alertas(Price1);
               ObjectSetString(0,Name_Trend,OBJPROP_TEXT,"AlertaSonada");
               ObjectSetInteger(0,Name_Trend,OBJPROP_COLOR,color_Linea_Alerta);
               ObjectSetInteger(0,Name_Trend+"Text",OBJPROP_COLOR,color_Linea_Alerta);
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
// Print(ChartGetInteger(0,CHART_SCALE,0)," ",id," ",lparam," ",dparam," ",sparam);

   if(id==6)
     {
      if(StringFind(sparam,"TrendLine 1004 ",0)!=-1)
        {
         ObjectDelete(0,sparam+"Text");
         ChartRedraw();
        }
     }


   if(id==CHARTEVENT_MOUSE_MOVE)
     {
      X=(int)lparam;
      Y=(int)dparam;
      ChartXYToTimePrice(0,X,Y,sub,Tiempo_P,Precio_P);

      int X1=(int)ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0);
      int Y1=(int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0);
      ChartXYToTimePrice(0,X1,Y1,sub,Tiempo_U,Precio_U);


      if(((uint)sparam& 1)== 1)
         Funcion_Cambio_Trend(Tiempo_U);
     }

   static uint Escala=(uint)ChartGetInteger(0,CHART_SCALE,0);
   if(Escala!=ChartGetInteger(0,CHART_SCALE,0))
     {
      Escala=(uint)ChartGetInteger(0,CHART_SCALE,0);
      tiempoRecarga=TimeLocal()+1;
     }


   if(id==CHARTEVENT_KEYDOWN)
     {
      if(lparam==68)
        {
         static int Enumeracion=0;

         int Width_Barras=(int)ChartGetInteger(0,CHART_WIDTH_IN_BARS,0);

         ArraySetAsSeries(Rates,true);
         ArrayResize(Rates,3);
         int copied=CopyRates(NULL,0,0,3,Rates);
         if(copied<=0)
            Print("Error copying price data ",GetLastError());
         if(Enumeracion==100)
            Enumeracion=0;

         string Name_TrendLine="TrendLine 1004 "+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES|TIME_SECONDS)+" N°:"+(string)Enumeracion+
                               (Ubicacion==Inicio?"Inicio":(Ubicacion==Final?"Final":"Medio"));
         string Name_Text=Name_TrendLine+"Text";

         int Bar=iBarShift(Symbol(),PERIOD_CURRENT,Tiempo_P,false);

         if(TrendCreate(0,Name_TrendLine,0,Tiempo_P,Precio_P,Tiempo_U+PeriodSeconds(Period())*1,Precio_P,color_Linea,estilo_Linea,grosor_Linea,true,true,false,true,0,OBJ_ALL_PERIODS))
           {
            if(!ObjectSetInteger(0,Name_TrendLine,OBJPROP_RAY,true))
               Print("No se modifico para Rayo");

            ENUM_ANCHOR_POINT Anchor=(Ubicacion==Inicio?ANCHOR_LEFT_LOWER:(Ubicacion==Final?ANCHOR_RIGHT_LOWER:ANCHOR_LOWER));

            if(Ubicacion==Medio)
              {
               int X3=(int)ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0);
               int Y3=(int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0);
               ChartXYToTimePrice(0,X3,Y3,sub,Tiempo_M,Precio_M);
               if(Tiempo_M>Tiempo_P)
                  ChartXYToTimePrice(0,X+((X3-X)/2),Y3,sub,Tiempo_M,Precio_M);
              }

            datetime tiempo=(Ubicacion==Inicio?Tiempo_P:(Ubicacion==Final?Tiempo_U:Tiempo_M));

            TextCreate(0,Name_Text,0,tiempo,Precio_P,Texto,Fuente,Size_Texto,color_Texto,0,Anchor,true,true,true,0);

            Enumeracion++;
           }
         ChartRedraw();
        }
     }
  }
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
void Funcion_Cambio_Trend(datetime tiempoU)
  {
   int Width_Barras=(int)ChartGetInteger(0,CHART_WIDTH_IN_BARS,0);
   int RayosUP=ObjectsTotal(0,0,OBJ_TREND);
   for(int i=RayosUP-1; i>=0; i--)
     {
      string Name_Trend=ObjectName(0,i,0,OBJ_TREND);
      if(StringFind(Name_Trend,"TrendLine 1004",0)!=-1)
        {
         datetime Tiempo1=(datetime)ObjectGetInteger(0,Name_Trend,OBJPROP_TIME,0);
         double Price1=ObjectGetDouble(0,Name_Trend,OBJPROP_PRICE,0);
         int Bar=iBarShift(Symbol(),PERIOD_CURRENT,Tiempo1,false);
         ObjectSetDouble(0,Name_Trend,OBJPROP_PRICE,1,Price1);
         ObjectSetDouble(0,Name_Trend+"Text",OBJPROP_PRICE,0,Price1);
         if(tiempoU>Tiempo1)
            ObjectSetInteger(0,Name_Trend,OBJPROP_TIME,1,tiempoU+PeriodSeconds(Period()));

         uint tipo=0;
         if(StringFind(Name_Trend,"Inicio",0)!=-1)
            tipo=0;
         if(StringFind(Name_Trend,"Medio",0)!=-1)
            tipo=1;
         if(StringFind(Name_Trend,"Final",0)!=-1)
            tipo=2;

         if(tipo==Medio)
           {
            int X3=(int)ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0);
            int Y3=(int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0);
            ChartXYToTimePrice(0,X3,Y3,sub,Tiempo_M,Precio_M);
            if(Tiempo_M>Tiempo1)
              {
               int X_Inicio;
               int Y_Inicio;
               ChartTimePriceToXY(0,0,Tiempo1,Price1,X_Inicio,Y_Inicio);
               ChartXYToTimePrice(0,X_Inicio+((X3-X_Inicio)/2),Y3,sub,Tiempo_M,Precio_M);
              }
           }

         datetime tiempo=(tipo==Inicio?Tiempo1:(tipo==Final?tiempoU:Tiempo_M));


         if(tiempo>=Tiempo1)
            ObjectSetInteger(0,Name_Trend+"Text",OBJPROP_TIME,0,tiempo);
         ChartRedraw();
        }
     }
   ChartRedraw();
  }
//+------------------------------------------------------------------+


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
