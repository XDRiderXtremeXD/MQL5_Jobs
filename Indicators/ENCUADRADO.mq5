//+------------------------------------------------------------------+
//|                                                   ENCUADRADO.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright © Propiedad de Luis Felipe Amasifuén"
#property description "Zonas de Oferta y Demanda - Bloque de Ordenes"
#property description "Indicador Multitimeframe para todos los mercados financieros"
#property description "- Forex"
#property description "- Indices		"
#property description "- Futuros"
#property description "- Crypto"

#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots 0


//#resource "\\Indicators\\Fisher.ex5"
#resource "\\Indicators\\Trend direction and force.ex5"

input int EvaluaBarras=200;
input string S111__="-----------------------   Configuracion TREND FORCE--------------------";//----------------------------------------------------------------------------------------------------------------
input int    trendPeriod  = 7;      // Trend period
input double TriggerUp    =  0.1;   // Trigger up level
input double TriggerDown  = -0.1;   // Trigger down level


int IndicatorTrend=0;
double BufferTrend[];

string NombreLinea="LINEA FORCE TREND 2022";
//double SizeCandleMaxCal=0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

// Nivel_Minimo=Nivel_Minimo-Nivel;
   IndicatorTrend=iCustom(NULL,PERIOD_CURRENT,"::Indicators\\Trend direction and force.ex5",trendPeriod,TriggerUp,TriggerDown);

   SetIndexBuffer(0,BufferTrend,INDICATOR_CALCULATIONS);

   return(INIT_SUCCEEDED);

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,NombreLinea,0,OBJ_TREND);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &Time[],
                const double &Open[],
                const double &High[],
                const double &Low[],
                const double &Close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {

   if(BarsCalculated(IndicatorTrend)<rates_total)
      return(0);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
////// o SIGNAL_LINE............
   if(CopyBuffer(IndicatorTrend,2,0,to_copy,BufferTrend)<=0)
      return(0);

   int static Start=MathMax((rates_total-EvaluaBarras),100);

   if(prev_calculated!=0)
      for(int shift=Start; shift<rates_total; shift++)
        {
         if(rates_total-1!=shift)
           {
            if((BufferTrend[shift]>TriggerUp || BufferTrend[shift]<TriggerDown) && (BufferTrend[shift-1]<=TriggerUp && BufferTrend[shift-1]>=TriggerDown))
              {
               int Indice=0;
               int IndiceShift=shift;
               for(int i=shift-1; i>0; i--)
                 {
                  IndiceShift=i;
                  if(BufferTrend[i]>TriggerUp || BufferTrend[i]<TriggerDown)
                     break;
                  Indice++;
                 }
               double High__=iHigh(NULL,PERIOD_CURRENT,iHighest(NULL,PERIOD_CURRENT,MODE_HIGH,Indice,rates_total-1-shift+1));
               double Low__=iLow(NULL,PERIOD_CURRENT,iLowest(NULL,PERIOD_CURRENT,MODE_LOW,Indice,rates_total-1-shift+1));

               if(ObjectFind(0,NombreLinea+"H"+string(Indice))!=0)
                 {
                  TrendCreate(0,NombreLinea+"H"+string(Indice),0,Time[IndiceShift],High__,Time[shift-1],High__,clrOrange,STYLE_SOLID,2,false,false,false,false,true,0);
                 }
               else
                 {
                  ObjectMove(0,NombreLinea+"H"+string(Indice),0,Time[IndiceShift-1],High__);
                  ObjectMove(0,NombreLinea+"H"+string(Indice),1,Time[shift],High__);
                 }


               if(ObjectFind(0,NombreLinea+"L"+string(Indice))!=0)
                 {
                  TrendCreate(0,NombreLinea+"L"+string(Indice),0,Time[IndiceShift],Low__,Time[shift-1],Low__,clrOrange,STYLE_SOLID,2,false,false,false,false,true,0);
                 }
               else
                 {
                  ObjectMove(0,NombreLinea+"L"+string(Indice),0,Time[IndiceShift-1],Low__);
                  ObjectMove(0,NombreLinea+"L"+string(Indice),1,Time[shift],Low__);
                 }

              }
           }
         else
            if(BufferTrend[rates_total-1]<TriggerUp && BufferTrend[rates_total-1]>TriggerDown)
              {

               int Indice=rates_total-1;
               for(int i=rates_total-1; i>0; i--)
                 {
                  Indice=i;
                  if(BufferTrend[i]>TriggerUp || BufferTrend[i]<TriggerDown)
                     break;
                 }


               double High__=iHigh(NULL,PERIOD_CURRENT,iHighest(NULL,PERIOD_CURRENT,MODE_HIGH,rates_total-1-(Indice)+1,0));
               double Low__=iLow(NULL,PERIOD_CURRENT,iLowest(NULL,PERIOD_CURRENT,MODE_LOW,rates_total-1-(Indice)+1,0));



               if(ObjectFind(0,NombreLinea+"H"+string(Indice))!=0)
                 {
                  TrendCreate(0,NombreLinea+"H"+string(Indice),0,Time[Indice],High__,Time[rates_total-1],High__,clrOrange,STYLE_SOLID,2,false,false,false,false,true,0);
                 }
               else
                 {
                  ObjectMove(0,NombreLinea+"H"+string(Indice),0,Time[Indice],High__);
                  ObjectMove(0,NombreLinea+"H"+string(Indice),1,Time[rates_total-1],High__);
                 }


               if(ObjectFind(0,NombreLinea+"L"+string(Indice))!=0)
                 {
                  TrendCreate(0,NombreLinea+"L"+string(Indice),0,Time[Indice],Low__,Time[rates_total-1],Low__,clrOrange,STYLE_SOLID,2,false,false,false,false,true,0);
                 }
               else
                 {
                  ObjectMove(0,NombreLinea+"L"+string(Indice),0,Time[Indice],Low__);
                  ObjectMove(0,NombreLinea+"L"+string(Indice),1,Time[rates_total-1],Low__);
                 }
              }

        }

   if(prev_calculated==0)
     {
      Start=MathMax((rates_total-EvaluaBarras),100);
      ObjectsDeleteAll(0,NombreLinea,0,OBJ_TREND);
     }
   else
      Start=rates_total-1;

   return rates_total;
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
