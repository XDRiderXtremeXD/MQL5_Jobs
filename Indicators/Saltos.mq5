//+------------------------------------------------------------------+
//|                                                   Desbalance.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0


input int Evaluacion_Historial=200;
input color Clr_Saltos=clrOrange;
input int Width=1;
input ENUM_LINE_STYLE Style=STYLE_SOLID;
input string H_Line="LH 363023";
input bool Borrar_=true;//Borrar al cerrar


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string Name_Line=H_Line+EnumToString(ENUM_TIMEFRAMES(Period()));
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   Name_Line=H_Line+EnumToString(ENUM_TIMEFRAMES(Period()));
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
   if(prev_calculated==rates_total)
      return rates_total;

   if(prev_calculated==0)
     {
      ObjectsDeleteAll(0,Name_Line+"S ",0,OBJ_TREND);
     }

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      //--- last value is always copied
      to_copy++;
     }

   for(int i=MathMax(MathMax(2,rates_total-Evaluacion_Historial),rates_total-to_copy); i<rates_total; i++)
     {
      EliminarSaltos(close[i-1],open[i-1],high[i-1],low[i-1]);

      if((open[i-1]!=close[i-2]) && ((close[i-2]<open[i-1] && close[i-1]>=close[i-2]) || (close[i-2]>open[i-1] && close[i-1]<=close[i-2])))
         //if((open[i-1]!=close[i-2]))
         TrendCreate(0,Name_Line+"S "+TimeToString(time[i-1],TIME_DATE|TIME_MINUTES),0,time[i-1],close[i-2],time[rates_total-1]+PeriodSeconds(PERIOD_CURRENT),close[i-2],Clr_Saltos,Style,Width,false,false,false,true,true,0);

      if(close[i-2]<open[i-1] && close[i-1]>=close[i-2])
        {
         if((open[i-1]-low[i-1])>0)
            ObjectSetString(0,Name_Line+"S "+TimeToString(time[i-1],TIME_DATE|TIME_MINUTES),OBJPROP_TEXT,IntegerToString(1));
        }
      else
         if((high[i-1]-open[i-1])>0)
            ObjectSetString(0,Name_Line+"S "+TimeToString(time[i-1],TIME_DATE|TIME_MINUTES),OBJPROP_TEXT,IntegerToString(1));
     }

   static datetime tiempoDia=0;
   if(tiempoDia!=0 && tiempoDia!=iTime(Symbol(),PERIOD_D1,0))
     {
      datetime tiempoInicio=time[MathMax(rates_total-Evaluacion_Historial-1,1)];
      EliminarLineasHistorial(tiempoInicio);
     }

   tiempoDia=iTime(Symbol(),PERIOD_D1,0);
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+

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
//--- establecemos las coordenadas de los puntos de anclaje si todavía no han sido establecidas
   ChangeTrendEmptyPoints(time1,price1,time2,price2);
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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ChangeTrendEmptyPoints(datetime &time1,double &price1,
                            datetime &time2,double &price2)
  {
//--- si la hora del primer punto no ha sido establecida, se colocará en la barra actual
   if(!time1)
      time1=TimeCurrent();
//--- si el precio del primer punto no ha sido establecido, tendrá el valor Bid
   if(!price1)
      price1=SymbolInfoDouble(Symbol(),SYMBOL_BID);
//--- si la hora del segundo punto no ha sido establecida, se colocará a 9 barras a la izquierda del segundo
   if(!time2)
     {
      //--- array para recibir la hora de apertura de las últimas 10 barras
      datetime temp[10];
      CopyTime(Symbol(),Period(),time1,10,temp);
      //--- colocamos el segundo punto a 9 barras a la izquierda del primero
      time2=temp[0];
     }
//--- si el precio del segundo punto no ha sido establecido, va a coincidir con el precio del primer punto
   if(!price2)
      price2=price1;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   if(Borrar_)
      ObjectsDeleteAll(0,Name_Line+"S ",0,OBJ_TREND);

   ChartRedraw();
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EliminarSaltos(double close,double open,double high,double low)
  {

   int Total=ObjectsTotal(0,0,OBJ_TREND);

   for(int i=Total-1; i>=0; i--)
     {
      string Nombre=ObjectName(0,i,0,OBJ_TREND);

      if(StringFind(Nombre,Name_Line+"S ",0)!=-1)
        {
         double Precio=ObjectGetDouble(0,Nombre,OBJPROP_PRICE,0);
         string descripcion=ObjectGetString(0,Nombre,OBJPROP_TEXT,0);
         int choque_Mecha=(descripcion=="")?0:(int)StringToInteger(descripcion);

         double mayor=close>open?close:open;
         double menor=close<open?close:open;

         if(mayor>=Precio && menor<=Precio)
            ObjectDelete(0,Nombre);

         if((high>=Precio && Precio>=mayor) || (low<=Precio && Precio<=menor))
           {
            if(choque_Mecha+1>=2)
               ObjectDelete(0,Nombre);
            else
               ObjectSetString(0,Nombre,OBJPROP_TEXT,IntegerToString(choque_Mecha+1));
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EliminarLineasHistorial(datetime Tiempo)
  {
   int Total=ObjectsTotal(0,0,OBJ_TREND);

   for(int i=Total-1; i>=0; i--)
     {
      string Nombre=ObjectName(0,i,0,OBJ_TREND);

      if(StringFind(Nombre,Name_Line+"S ",0)!=-1)
        {
         datetime openTime=(datetime)ObjectGetInteger(0,Nombre,OBJPROP_TIME,0);
         if(Tiempo>openTime)
            ObjectDelete(0,Nombre);
        }
     }
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
