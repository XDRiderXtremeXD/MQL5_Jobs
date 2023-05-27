//+------------------------------------------------------------------+
//|                                                        Ticks.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots   0
//--- input parameters
input int      bars=20;
input ENUM_TIMEFRAMES TimeFrame=PERIOD_H1;
input string S1="======== SEPARADORES ========";//=======================================
input color Clr_Linea=clrRed;
input uint Grosor_Linea=1;
input ENUM_LINE_STYLE Estilo_Linea=STYLE_SOLID;
input string S2="======== TEXTO ========";//=======================================
input color Clr_VT=clrAqua;//Color VT
input color Clr_VP=clrLawnGreen;//Color VP
input color Clr_VN=clrOrange;//Color VN
input int Size_Texto=10;//Tamaño Texto

string Lineas="Lineas cod311022";
bool Cargado=false;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnInit()
  {
   Cargado=false;
   EventSetMillisecondTimer(1);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EventKillTimer();
   ObjectsDeleteAll(0,Lineas,0,OBJ_VLINE);
   ObjectsDeleteAll(0,Lineas,0,OBJ_TEXT);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   MoverText();
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
   if(TimeFrame>=Period()==true)
     {
      if(!ActualizarDatos(Symbol(),TimeFrame))
         return rates_total;

      if(prev_calculated==0 || !Cargado)
        {
         if(!IniciarEvaluacion(rates_total))
            return rates_total;
        }
      else
        {
         datetime TimeActual=iTime(Symbol(),TimeFrame,0);
         static datetime TimeFrameEvalua=TimeActual;

         if(TimeFrameEvalua!=TimeActual)
           {
            TimeFrameEvalua=TimeActual;
            MoverLineasTextos(TimeActual);
           }
         if(!ActualizarTicks(TimeActual))
            return rates_total;
        }
     }
   return(rates_total);
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
//--- establecemos las coordenadas del punto de anclaje si todavía no han sido establecidas
   ChangeTextEmptyPoint(time,price);
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
bool VLineCreate(const long            chart_ID=0,        // ID del gráfico
                 const string          name="VLine",      // nombre de la línea
                 const int             sub_window=0,      // índice de subventana
                 datetime              time=0,            // hora de la línea
                 const color           clr=clrRed,        // color de la línea
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de la línea
                 const int             width=1,           // grosor de la línea
                 const bool            back=false,        // al fondo
                 const bool            selection=true,    // seleccionar para mover
                 const bool            ray=true,          // continuación de la línea abajo
                 const bool            hidden=true,       // ocultar en la lista de objetos
                 const long            z_order=0)         // prioridad para el clic del ratón
  {
//--- si la hora de la línea no está definida, la trazamos en la última barra
   if(!time)
      time=TimeCurrent();
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la línea vertical
   if(!ObjectCreate(chart_ID,name,OBJ_VLINE,sub_window,time,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la línea vertical! Código del error = ",GetLastError());
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
//--- activar (true) o desactivar (false) el modo de visualización de la línea en las subventanas del gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY,ray);
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- establecemos la prioridad para obtener el evento de cliquear sobre el gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- ejecución con éxito
   return(true);
  }
//+------------------------------------------------------------------+
//| Comprueba los valores de los puntos de anclaje y para          |
//| los valores vacíos establece los valores por defecto                              |
//+------------------------------------------------------------------+
void ChangeTextEmptyPoint(datetime &time,double &price)
  {
//--- si la hora del punto no ha sido establecida, se colocará en la barra actual
   if(!time)
      time=TimeCurrent();
//--- si el precio del punto no ha sido establecido, tendrá el valor Bid
   if(!price)
      price=SymbolInfoDouble(Symbol(),SYMBOL_BID);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Paso(int i)
  {
   double Max=ChartGetDouble(0,CHART_PRICE_MAX,0);
   double Min=ChartGetDouble(0,CHART_PRICE_MIN,0);
   return Max-((Max-Min)/20)*i;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void MoverText()
  {
   double Max=ChartGetDouble(0,CHART_PRICE_MAX,0);
   static double Price=Max;
   int Totales=ObjectsTotal(0,0,OBJ_TEXT);
   if(Price!=Max)
     {
      for(int i=0; i<Totales; i++)
        {
         string Name=ObjectName(0,i,0,OBJ_TEXT);
         if(StringFind(Name,Lineas+"VT",0)!=-1)
            ObjectSetDouble(0,Name,OBJPROP_PRICE,0,Paso(1));
         if(StringFind(Name,Lineas+"VP",0)!=-1)
            ObjectSetDouble(0,Name,OBJPROP_PRICE,0,Paso(2));
         if(StringFind(Name,Lineas+"VN",0)!=-1)
            ObjectSetDouble(0,Name,OBJPROP_PRICE,0,Paso(3));
        }
      ChartRedraw();
      Price=Max;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ContadoresMqlTick(MqlTick &tick_array[],int &counter,int &Positive,int &Negative)
  {
   double BidAnterior=0;
   for(int j=0; j<ArraySize(tick_array); j++)
     {
      //--- Checking flags
      bool buy_tick=((tick_array[j].flags&TICK_FLAG_BUY)==TICK_FLAG_BUY);
      bool sell_tick=((tick_array[j].flags&TICK_FLAG_SELL)==TICK_FLAG_SELL);
      bool bid_tick=((tick_array[j].flags&TICK_FLAG_BID)==TICK_FLAG_BID);

      if(!buy_tick && !sell_tick)
        {
         if(bid_tick)
           {
            if(BidAnterior==0 || tick_array[j].bid>BidAnterior)
               Positive++;
            else
               Negative++;
            BidAnterior=tick_array[j].bid;
            counter++;
           }
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DrawText_and_Line(int i,int counter,int Positive,int Negative,const int rates_total)
  {

   int Bar=iBarShift(Symbol(),Period(),iTime(Symbol(),TimeFrame,i),false);

   if(Bar<rates_total && Bar!=-1)
     {
      Cargado=true;
      if(!VLineCreate(0,Lineas+IntegerToString(i),0,iTime(Symbol(),PERIOD_CURRENT,Bar),Clr_Linea,Estilo_Linea,Grosor_Linea,true,false,false,true,0))
         Print("ERROR ",GetLastError());
      TextCreate(0,Lineas+"VT"+IntegerToString(i),0,iTime(Symbol(),PERIOD_CURRENT,Bar),Paso(1),
                 "VT: "+IntegerToString(counter),"Arial",Size_Texto,Clr_VT,0,ANCHOR_LEFT_UPPER,false,false,true,0);

      TextCreate(0,Lineas+"VP"+IntegerToString(i),0,iTime(Symbol(),PERIOD_CURRENT,Bar),Paso(2),
                 "VP: "+IntegerToString(Positive),"Arial",Size_Texto,Clr_VP,0,ANCHOR_LEFT_UPPER,false,false,true,0);

      TextCreate(0,Lineas+"VN"+IntegerToString(i),0,iTime(Symbol(),PERIOD_CURRENT,Bar),Paso(3),
                 "VN: "+IntegerToString(Negative),"Arial",Size_Texto,Clr_VN,0,ANCHOR_LEFT_UPPER,false,false,true,0);
     }
  }


//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void MoverLineasTextos(datetime TimeActual)
  {
   for(int i=bars-1; i>0; i--)
     {
      string  AnteriorVT=Lineas+"VT"+IntegerToString(i);
      string  PosteriorVT=Lineas+"VT"+IntegerToString(i-1);

      string  AnteriorVP=Lineas+"VP"+IntegerToString(i);
      string  PosteriorVP=Lineas+"VP"+IntegerToString(i-1);

      string AnteriorVN=Lineas+"VN"+IntegerToString(i);
      string PosteriorVN=Lineas+"VN"+IntegerToString(i-1);

      string AnteriorLinea=Lineas+IntegerToString(i);
      string PosteriorLinea=Lineas+IntegerToString(i-1);

      if(ObjectFind(0,PosteriorVT)==0 && ObjectFind(0,PosteriorVP)==0 && ObjectFind(0,PosteriorVN)==0
         && ObjectFind(0,PosteriorLinea)==0)
        {
         datetime Time=(datetime)ObjectGetInteger(0,PosteriorVT,OBJPROP_TIME,0);

         string TicksVT=ObjectGetString(0,PosteriorVT,OBJPROP_TEXT,0);
         string TicksVP=ObjectGetString(0,PosteriorVP,OBJPROP_TEXT,0);
         string TicksVN=ObjectGetString(0,PosteriorVN,OBJPROP_TEXT,0);


         if(ObjectFind(0,AnteriorVT)==0)
           {
            ObjectSetString(0,AnteriorVT,OBJPROP_TEXT,0,TicksVT);
            ObjectSetInteger(0,AnteriorVT,OBJPROP_TIME,0,Time);
           }
         if(ObjectFind(0,AnteriorVP)==0)
           {
            ObjectSetString(0,AnteriorVP,OBJPROP_TEXT,0,TicksVP);
            ObjectSetInteger(0,AnteriorVP,OBJPROP_TIME,0,Time);
           }
         if(ObjectFind(0,AnteriorVN)==0)
           {
            ObjectSetString(0,AnteriorVN,OBJPROP_TEXT,0,TicksVN);
            ObjectSetInteger(0,AnteriorVN,OBJPROP_TIME,0,Time);
           }
         if(ObjectFind(0,AnteriorLinea)==0)
            ObjectSetInteger(0,AnteriorLinea,OBJPROP_TIME,0,Time);
        }
     }

   string  Linea=Lineas+IntegerToString(0);
   ObjectSetInteger(0,Linea,OBJPROP_TIME,0,TimeActual);

   string  VT=Lineas+"VT"+IntegerToString(0);
   string  VP=Lineas+"VP"+IntegerToString(0);
   string  VN=Lineas+"VN"+IntegerToString(0);

   if(ObjectFind(0,VT)==0)
      ObjectSetInteger(0,VT,OBJPROP_TIME,0,TimeActual);
   if(ObjectFind(0,VP)==0)
      ObjectSetInteger(0,VP,OBJPROP_TIME,0,TimeActual);
   if(ObjectFind(0,VN)==0)
      ObjectSetInteger(0,VN,OBJPROP_TIME,0,TimeActual);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ActualizarTicks(datetime TimeActual)
  {
   int Bars_=iBars(Symbol(),TimeFrame);
   if(Bars_>0)
     {
      int ticks;
      MqlTick tick_array[];

      if((ticks=CopyTicksRange(_Symbol,tick_array,COPY_TICKS_INFO,TimeActual*1000,(TimeActual+PeriodSeconds(TimeFrame))*1000))==-1)
         return false;

      int counter=0;
      int Positive=0;
      int Negative=0;

      ContadoresMqlTick(tick_array,counter,Positive,Negative);

      string  VT=Lineas+"VT"+IntegerToString(0);
      string  VP=Lineas+"VP"+IntegerToString(0);
      string  VN=Lineas+"VN"+IntegerToString(0);

      ObjectSetString(0,VT,OBJPROP_TEXT,0,"VT: "+IntegerToString(counter));
      ObjectSetString(0,VP,OBJPROP_TEXT,0,"VP: "+IntegerToString(Positive));
      ObjectSetString(0,VN,OBJPROP_TEXT,0,"VN: "+IntegerToString(Negative));
     }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IniciarEvaluacion(const int rates_total)
  {
   int Bars_=iBars(Symbol(),TimeFrame);
   int ticks;
   MqlTick tick_array[];

   for(int i=0; i<bars; i++)
     {
      if(Bars_>i)
        {
         if((ticks=CopyTicksRange(_Symbol,tick_array,COPY_TICKS_INFO,iTime(Symbol(),TimeFrame,i)*1000,(iTime(Symbol(),TimeFrame,i)+PeriodSeconds(TimeFrame))*1000))==-1)
            return false;

         int counter=0;
         int Positive=0;
         int Negative=0;

         ContadoresMqlTick(tick_array,counter,Positive,Negative);
         DrawText_and_Line(i,counter,Positive,Negative,rates_total);
        }
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ActualizarDatos(string Simbolo,ENUM_TIMEFRAMES TimeFrames)
  {
   if(TimeFrames==PERIOD_CURRENT)
     {
      TimeFrames=ENUM_TIMEFRAMES(Period());
     }

//---
   MqlRates rates[];

   ArraySetAsSeries(rates,true);

   int copied=CopyRates(Simbolo,TimeFrames,0,50,rates);

   uchar Conteo=13;

   while(copied<0 && !IsStopped())
     {
      ResetLastError();
      Conteo--;
      Print("Cargando datos históricos para el símbolo ",Simbolo);
      Sleep(1000);
      copied=CopyRates(Simbolo,TimeFrames,0,100,rates);
      if(Conteo<10)
        {
         int Error=GetLastError();
         if(copied<0)
           {
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE ",Simbolo," ",EnumToString(TimeFrames),"  Cod ",Error);
            return false;
           }
        }
     }
   if(ArraySize(rates)==0)
      ArrayResize(rates,1);

   return true;
  }
//+------------------------------------------------------------------+
