//+------------------------------------------------------------------+
//|                                                LineasHIGHLOW.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property  indicator_plots 0

input int Limit=400;
input color ColorHigh=clrBlue;
input color ColorLow=clrRed;
input ENUM_LINE_STYLE EstiloLinea=STYLE_DASHDOT;
input int Width=1;
input ENUM_TIMEFRAMES TimeFrame=PERIOD_CURRENT;

string UP_Trend="TrendUP2022_Indi";
string DN_Trend="TrendDN2022_Indi";

MqlRates rates[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   ArraySetAsSeries(rates,true);
//--- indicator buffers mapping
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

   ArraySetAsSeries(time,true);
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);

   static datetime PrevTimeTime=0;
   static datetime PrevTimeCurrent=0;
   static int ratesAnterior=0;

   int copied=CopyRates(NULL,TimeFrame,0,MathMin(rates_total-3,Limit),rates);
   if(copied<=0)
      return rates_total;

   if(ArraySize(rates)<=2)
      return rates_total;

   static int start=ArraySize(rates)-1;
   static int start2=Limit;

   if(prev_calculated==0 || ratesAnterior!=ArraySize(rates))
     {
      start=ArraySize(rates)-1;
      start2=iBarShift(Symbol(),PERIOD_CURRENT,rates[ArraySize(rates)-1].time,false);
      ratesAnterior=ArraySize(rates);
      ObjectsDeleteAll(0,UP_Trend,0,OBJ_TREND);
      ObjectsDeleteAll(0,DN_Trend,0,OBJ_TREND);
     }
   else
     {
      start=1;
      start2=1;
     }


   if(PrevTimeTime!=rates[0].time)
     {
      for(int i=start; i>0; i--)
        {
         int shift=iBarShift(Symbol(),PERIOD_CURRENT,rates[i-1].time,false);
         if(shift<rates_total && shift!=-1)
           {
            string NombreUP=UP_Trend+TimeToString(rates[i].time), NombreDN=DN_Trend+TimeToString(rates[i].time);
            if(!TrendCreate(0,NombreUP,0,rates[i].time,rates[i].high,rates[i-1].time,rates[i].high,ColorHigh,EstiloLinea,Width,true,false,false,false,true,0))
               Print("Error ",GetLastError());
            if(!TrendCreate(0,NombreDN,0,rates[i].time,rates[i].low,rates[i-1].time,rates[i].low,ColorLow,EstiloLinea,Width,true,false,false,false,true,0))
               Print("Error ",GetLastError());

            bool MoveUP=false, MoveDN=false;

            for(int Move=iBarShift(Symbol(),PERIOD_CURRENT,rates[i-1].time,false); Move>0 && (MoveUP==false || MoveDN==false); Move--)
              {
               //Print(iBarShift(Symbol(),PERIOD_CURRENT,rates[i-1].time,false),"  ",rates[i].time);
               if(MoveUP==false)
                 {
                  if(high[Move]>rates[i].high && low[Move]<rates[i].high)
                    {
                     if(!ObjectSetInteger(0,NombreUP,OBJPROP_TIME,1,time[Move]))
                        Print("Error ",GetLastError());
                     MoveUP=true;
                    }
                  if(Move==1 && MoveUP==false)
                    {
                     if(!ObjectSetInteger(0,NombreUP,OBJPROP_TIME,1,time[Move]))
                        Print("Error ",GetLastError());
                    }
                 }

               if(MoveDN==false && MoveDN==false)
                 {
                  if(high[Move]>rates[i].low && low[Move]<rates[i].low)
                    {
                     if(!ObjectSetInteger(0,NombreDN,OBJPROP_TIME,1,time[Move]))
                        Print("Error ",GetLastError());
                     MoveDN=true;
                    }
                  if(Move==1)
                    {
                     if(!ObjectSetInteger(0,NombreDN,OBJPROP_TIME,1,time[Move]))
                        Print("Error ",GetLastError());
                    }

                 }

              }
           }
        }
      PrevTimeTime=rates[0].time;
     }



   if(PrevTimeCurrent!=time[0])
     {
      for(int i=1; i>0; i--)
        {
         int Trends=ObjectsTotal(0,0,OBJ_TREND);



         for(int j=0; j<Trends; j++)
           {
            string Nombre=ObjectName(0,j,0,OBJ_TREND);
            if(ObjectGetInteger(0,Nombre,OBJPROP_TIME,0)<time[MathMin(rates_total-1,MathMax(0,iBarShift(Symbol(),PERIOD_CURRENT,rates[ArraySize(rates)-1].time,false)))])
               ObjectDelete(0,Nombre);
            else if(StringFind(Nombre,UP_Trend,0)!=-1 || StringFind(Nombre,DN_Trend,0)!=-1)
              {
               if(iBarShift(Symbol(),PERIOD_CURRENT,ObjectGetInteger(0,Nombre,OBJPROP_TIME,1),false)==i)
                 {
                  double Precio=ObjectGetDouble(0,Nombre,OBJPROP_PRICE,1);
                  if(Precio>high[i] || Precio<low[i])
                    {
                     if(!ObjectSetInteger(0,Nombre,OBJPROP_TIME,1,time[i-1]))
                        Print("Error ",GetLastError());
                    }
                 }
              }

           }
        }
      PrevTimeCurrent=time[0];
     }


   return(rates_total);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,UP_Trend,0,OBJ_TREND);
   ObjectsDeleteAll(0,DN_Trend,0,OBJ_TREND);
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
