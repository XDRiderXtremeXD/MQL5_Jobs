//+------------------------------------------------------------------+
//|                                                  CalculoEmas.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

struct IndicatorsHandle
  {
   int               handlesIndicator;
   string            nameIndicator;
  };

IndicatorsHandle  Ind[];
int               IndicadoresTotal;

string seleccionadoUP="SELECCIONUP";
string seleccionadoDN="SELECCIONDN";
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   ChartSetInteger(0,CHART_EVENT_MOUSE_MOVE,true);
   IndicadoresTotal=0;
   FunctionComprobarCambioIndicadores();
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   ObjectDelete(0,seleccionadoUP);
   ObjectDelete(0,seleccionadoDN);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   FunctionComprobarCambioIndicadores();

  }
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // identificador de evento
                  const long& lparam,   // parámetro de evento del tipo long
                  const double& dparam, // parámetro de evento del tipo double
                  const string& sparam  // parámetro de evento del tipo string
                 )
  {


   Print(id," ",lparam," ",dparam," ",sparam);


   datetime time;
   double price;
   int chart;

   ChartXYToTimePrice(0,(int)lparam,(int)dparam,chart,time,price);
   Print(time,"   ",price);

   int bar=iBarShift(Symbol(),PERIOD_CURRENT,time,false);

   Print("BAR ",IntegerToString(bar));

   double EMA[1];
   double Valores[];
   ArrayResize(Valores,ArraySize(Ind));

   for(int i=0;i<ArraySize(Ind);i++)
     {
      if(BarsCalculated(Ind[i].handlesIndicator)==iBars(Symbol(),PERIOD_CURRENT))
         if(CopyBuffer(Ind[i].handlesIndicator,0,bar,1,EMA))
           {
            Valores[i]=NormalizeDouble(EMA[0],6);
            Print(DoubleToString(EMA[0],6));
           }
     }

   if(ArraySize(Ind)!=0)
     {
      static int indiceSeleccionado=0;
      
      for(int i=0;i<ArraySize(Ind);i++)
        {
         if(price-10*Point()<Valores[i] && Valores[i]<price+10*Point())
            indiceSeleccionado=i;
        }
       
       if(indiceSeleccionado>=ArraySize(Ind))
       indiceSeleccionado=0;


      if(ObjectFind(0,seleccionadoUP)!=0)
        {
         ArrowCreate(0,seleccionadoUP,0,iTime(Symbol(),PERIOD_CURRENT,bar),Valores[indiceSeleccionado],218,ANCHOR_BOTTOM,clrAqua,STYLE_SOLID,1,false,false,true,0);
         ArrowCreate(0,seleccionadoDN,0,iTime(Symbol(),PERIOD_CURRENT,bar),Valores[indiceSeleccionado],217,ANCHOR_TOP,clrAqua,STYLE_SOLID,1,false,false,true,0);
        }
      else
        {
         ObjectSetDouble(0,seleccionadoUP,OBJPROP_PRICE,Valores[indiceSeleccionado]);
         ObjectSetInteger(0,seleccionadoUP,OBJPROP_TIME,iTime(Symbol(),PERIOD_CURRENT,bar));
         ObjectSetDouble(0,seleccionadoDN,OBJPROP_PRICE,Valores[indiceSeleccionado]);
         ObjectSetInteger(0,seleccionadoDN,OBJPROP_TIME,iTime(Symbol(),PERIOD_CURRENT,bar));
        }
      ChartRedraw();
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ActualiceHandles(void)
  {
   ArrayResize(Ind,0);

   int windows=(int)ChartGetInteger(0,CHART_WINDOWS_TOTAL);

   for(int w=0; w<windows; w++)
     {
      //--- cuántos indicadores hay en esta ventana/subventana
      int total=ChartIndicatorsTotal(0,w);
      //--- repasamos todos los indicadores en la ventana
      for(int i=0; i<total; i++)
        {
         //--- obtenemos el nombre corto del indicador
         string name=ChartIndicatorName(0,w,i);

         if(StringFind(name,"MA",0)==-1)
            continue;
         //--- obtenemos el manejador del indicador
         int handle=ChartIndicatorGet(0,w,name);

         int size=ArraySize(Ind);
         ArrayResize(Ind,size+1);
         Ind[size].handlesIndicator=handle;
         Ind[size].nameIndicator=name;
         //--- mostramos en el diario
         PrintFormat("Window=%d,  index=%d,  name=%s,  handle=%d",w,i,name,handle);
         //--- release handle
        }
     }

   ChartRedraw();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FunctionComprobarCambioIndicadores(void)
  {
   int Indicators=0;
   int windows=(int)ChartGetInteger(0,CHART_WINDOWS_TOTAL);

   for(int w=0; w<windows; w++)
     {
      int total=ChartIndicatorsTotal(0,w);
      Indicators+=total;
     }

   if(IndicadoresTotal!=Indicators)
     {
      ActualiceHandles();
      IndicadoresTotal=Indicators;
     }
  }
//+------------------------------------------------------------------+
bool ArrowCreate(const long              chart_ID=0,           // ID del gráfico
                 const string            name="Arrow",         // nombre de la flecha
                 const int               sub_window=0,         // número de subventana
                 datetime                time=0,               // hora del punto de anclaje
                 double                  price=0,              // precio del punto de anclaje
                 const uchar             arrow_code=252,       // código de la flecha
                 const ENUM_ARROW_ANCHOR anchor=ANCHOR_BOTTOM, // posición del punto de anclaje
                 const color             clr=clrRed,           // color de la flecha
                 const ENUM_LINE_STYLE   style=STYLE_SOLID,    // estilo de la línea del contorno
                 const int               width=3,              // tamaño de la flecha
                 const bool              back=false,           // al fondo
                 const bool              selection=true,       // seleccionar para mover
                 const bool              hidden=true,          // ocultar en la lista de objetos
                 const long              z_order=0)            // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la flecha
   if(!ObjectCreate(chart_ID,name,OBJ_ARROW,sub_window,time,price))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la flecha! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos el código de la flecha
   ObjectSetInteger(chart_ID,name,OBJPROP_ARROWCODE,arrow_code);
//--- establecemos el modo de anclaje
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
//--- establecemos el color de la flecha
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el estilo de la línea del contorno
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- establecemos el tamaño de la flecha
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de desplazamiento de la flecha con ratón
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
