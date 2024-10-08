//+------------------------------------------------------------------+
//|                                                       ZigZag.mq5 |
//|                   Copyright 2009-2020, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "2009-2020, MetaQuotes Software Corp."
#property link      "http://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 3
#property indicator_plots   1
//--- plot ZigZag
#property indicator_label1  "ZigZag"
#property indicator_type1   DRAW_SECTION
#property indicator_color1  clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1
//--- input parameters
input int InpDepth    =12;  // Depth
input int InpDeviation=5;   // Deviation
input int InpBackstep =3;   // Back Step
input string S1="----------- LINEA SEGUIMIENTO ------------";//------------------------------------------------------------
input color colorLinea=clrMagenta;
input ENUM_LINE_STYLE estiloLinea=STYLE_DOT;
input uint grosorLinea=1;
//--- indicator buffers
double    ZigZagBuffer[];      // main buffer
double    HighMapBuffer[];     // ZigZag high extremes (peaks)
double    LowMapBuffer[];      // ZigZag low extremes (bottoms)

int       ExtRecalc=3;         // number of last extremes for recalculation

enum EnSearchMode
  {
   Extremum=0, // searching for the first extremum
   Peak=1,     // searching for the next ZigZag peak
   Bottom=-1   // searching for the next ZigZag bottom
  };

string NombreLinea="LINEA 2023";

datetime UNTIL=D'2023.01.15 00:00';
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(UNTIL<TimeCurrent())
     {
      Alert("Termino el periodo prueba el dia ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
      return INIT_FAILED;
     }
     
   Comment("Periodo prueba hasta el dia ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));

//--- indicator buffers mapping
   SetIndexBuffer(0,ZigZagBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,HighMapBuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(2,LowMapBuffer,INDICATOR_CALCULATIONS);
//--- set short name and digits
   string short_name=StringFormat("ZigZag(%d,%d,%d)",InpDepth,InpDeviation,InpBackstep);
   IndicatorSetString(INDICATOR_SHORTNAME,short_name);
   PlotIndexSetString(0,PLOT_LABEL,short_name);
   IndicatorSetInteger(INDICATOR_DIGITS,_Digits);
//--- set an empty value
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0.0);

   return INIT_SUCCEEDED;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  OnDeinit(const int reason)
  {
   ObjectDelete(0,NombreLinea);
  }
//+------------------------------------------------------------------+
//| ZigZag calculation                                               |
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
   if(UNTIL<TimeCurrent())
     {
      Comment("Termino el periodo prueba el dia ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
      return rates_total;
     }


   if(rates_total<100)
      return(0);
//---
   int    i=0;
   int    start=0,extreme_counter=0,extreme_search=Extremum;
   int    shift=0,back=0,last_high_pos=0,last_low_pos=0;
   double val=0,res=0;
   double curlow=0,curhigh=0,last_high=0,last_low=0;
//--- initializing
   if(prev_calculated==0)
     {
      ArrayInitialize(ZigZagBuffer,0.0);
      ArrayInitialize(HighMapBuffer,0.0);
      ArrayInitialize(LowMapBuffer,0.0);
      start=InpDepth;
     }

//--- ZigZag was already calculated before
   if(prev_calculated>0)
     {
      i=rates_total-1;
      //--- searching for the third extremum from the last uncompleted bar
      while(extreme_counter<ExtRecalc && i>rates_total-100)
        {
         res=ZigZagBuffer[i];
         if(res!=0.0)
            extreme_counter++;
         i--;
        }
      i++;
      start=i;

      //--- what type of exremum we search for
      if(LowMapBuffer[i]!=0.0)
        {
         curlow=LowMapBuffer[i];
         extreme_search=Peak;
        }
      else
        {
         curhigh=HighMapBuffer[i];
         extreme_search=Bottom;
        }
      //--- clear indicator values
      for(i=start+1; i<rates_total && !IsStopped(); i++)
        {
         ZigZagBuffer[i] =0.0;
         LowMapBuffer[i] =0.0;
         HighMapBuffer[i]=0.0;
        }
     }

//--- searching for high and low extremes
   for(shift=start; shift<rates_total && !IsStopped(); shift++)
     {
      //--- low
      val=low[Lowest(low,InpDepth,shift)];
      if(val==last_low)
         val=0.0;
      else
        {
         last_low=val;
         if((low[shift]-val)>InpDeviation*_Point)
            val=0.0;
         else
           {
            for(back=1; back<=InpBackstep; back++)
              {
               res=LowMapBuffer[shift-back];
               if((res!=0) && (res>val))
                  LowMapBuffer[shift-back]=0.0;
              }
           }
        }
      if(low[shift]==val)
         LowMapBuffer[shift]=val;
      else
         LowMapBuffer[shift]=0.0;
      //--- high
      val=high[Highest(high,InpDepth,shift)];
      if(val==last_high)
         val=0.0;
      else
        {
         last_high=val;
         if((val-high[shift])>InpDeviation*_Point)
            val=0.0;
         else
           {
            for(back=1; back<=InpBackstep; back++)
              {
               res=HighMapBuffer[shift-back];
               if((res!=0) && (res<val))
                  HighMapBuffer[shift-back]=0.0;
              }
           }
        }
      if(high[shift]==val)
         HighMapBuffer[shift]=val;
      else
         HighMapBuffer[shift]=0.0;
     }

//--- set last values
   if(extreme_search==0) // undefined values
     {
      last_low=0.0;
      last_high=0.0;
     }
   else
     {
      last_low=curlow;
      last_high=curhigh;
     }

   int last_shift=-1;
   double last_value=0;
//--- final selection of extreme points for ZigZag
   for(shift=start; shift<rates_total && !IsStopped(); shift++)
     {
      res=0.0;
      switch(extreme_search)
        {
         case Extremum:
            if(last_low==0.0 && last_high==0.0)
              {
               if(HighMapBuffer[shift]!=0)
                 {
                  last_high=high[shift];
                  last_high_pos=shift;
                  extreme_search=Bottom;
                  ZigZagBuffer[shift]=last_high;
                  last_shift=shift;
                  last_value=last_high;
                  res=1;
                 }
               if(LowMapBuffer[shift]!=0.0)
                 {
                  last_low=low[shift];
                  last_low_pos=shift;
                  extreme_search=Peak;
                  ZigZagBuffer[shift]=last_low;
                  last_shift=shift;
                  last_value=last_low;
                  res=1;
                 }
              }
            break;
         case Peak:
            if(LowMapBuffer[shift]!=0.0 && LowMapBuffer[shift]<last_low && HighMapBuffer[shift]==0.0)
              {
               ZigZagBuffer[last_low_pos]=0.0;
               last_low_pos=shift;
               last_low=LowMapBuffer[shift];
               ZigZagBuffer[shift]=last_low;
               last_shift=shift;
               last_value=last_low;
               res=1;
              }
            if(HighMapBuffer[shift]!=0.0 && LowMapBuffer[shift]==0.0)
              {
               last_high=HighMapBuffer[shift];
               last_high_pos=shift;
               ZigZagBuffer[shift]=last_high;
               extreme_search=Bottom;
               last_shift=shift;
               last_value=last_high;
               res=1;
              }
            break;
         case Bottom:
            if(HighMapBuffer[shift]!=0.0 && HighMapBuffer[shift]>last_high && LowMapBuffer[shift]==0.0)
              {
               ZigZagBuffer[last_high_pos]=0.0;
               last_high_pos=shift;
               last_high=HighMapBuffer[shift];
               ZigZagBuffer[shift]=last_high;
               last_shift=shift;
               last_value=last_high;
              }
            if(LowMapBuffer[shift]!=0.0 && HighMapBuffer[shift]==0.0)
              {
               last_low=LowMapBuffer[shift];
               last_low_pos=shift;
               ZigZagBuffer[shift]=last_low;
               extreme_search=Peak;
               last_shift=shift;
               last_value=last_low;
              }
            break;
         default:
            return(rates_total);
        }
     }

   if(ObjectFind(0,NombreLinea)!=0)
      TrendCreate(0,NombreLinea,0,iTime(Symbol(),PERIOD_CURRENT,rates_total-1-last_shift),last_value,TimeCurrent(),close[rates_total-1],colorLinea,estiloLinea,grosorLinea,false,false,false,false,true,0);
   else
     {
      ObjectMove(0,NombreLinea,0,iTime(Symbol(),PERIOD_CURRENT,rates_total-1-last_shift),last_value);
      ObjectMove(0,NombreLinea,1,TimeCurrent(),close[rates_total-1]);
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//|  Search for the index of the highest bar                         |
//+------------------------------------------------------------------+
int Highest(const double &array[],const int depth,const int start)
  {
   if(start<0)
      return(0);

   double max=array[start];
   int    index=start;
//--- start searching
   for(int i=start-1; i>start-depth && i>=0; i--)
     {
      if(array[i]>max)
        {
         index=i;
         max=array[i];
        }
     }
//--- return index of the highest bar
   return(index);
  }
//+------------------------------------------------------------------+
//|  Search for the index of the lowest bar                          |
//+------------------------------------------------------------------+
int Lowest(const double &array[],const int depth,const int start)
  {
   if(start<0)
      return(0);

   double min=array[start];
   int    index=start;
//--- start searching
   for(int i=start-1; i>start-depth && i>=0; i--)
     {
      if(array[i]<min)
        {
         index=i;
         min=array[i];
        }
     }
//--- return index of the lowest bar
   return(index);
  }
//+------------------------------------------------------------------+
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
