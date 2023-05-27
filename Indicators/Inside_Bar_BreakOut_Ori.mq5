//+------------------------------------------------------------------+
//|                                      !jl_Inside_Bar_Breakout.mq5 |
//|                                Copyright © March 2021, jeanlouie |
//|                                   www.forexfactory.com/jeanlouie |
//|                               www.mql5.com/en/users/jeanlouie_ff |
//+------------------------------------------------------------------+
#property copyright "Copyright © March 2021, jeanlouie"
#property description "jeanlouie"
#property link      "www.mql5.com/en/users/jeanlouie_ff"
#property version   "1.00"
#property strict
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_plots   2

double Buffer[];

#property indicator_label1  "Top"
#property indicator_color1  clrPink
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2  "Botton"
#property indicator_color2  clrOrange
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int emaThreeShiftTwoBackward_Handle, emaFiveShiftTwoBackward_Handle,sa_Handler,force_Handle,forcePrevious_Handle,Bands_Backward_Handle,Band_Handle;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+

#property indicator_buffers 2

double buff_up[];
double buff_dn[];

string tag;


datetime UNTIL=D'2021.04.10 00:00'; 

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   Comment("Test until the day " ,TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
   tag = "IBB_";
  
   SetIndexBuffer(0,buff_up,INDICATOR_DATA);
   SetIndexBuffer(1,buff_dn,INDICATOR_DATA);

   ArrayInitialize(buff_up,EMPTY_VALUE);
   ArrayInitialize(buff_dn,EMPTY_VALUE);

   PlotIndexSetInteger(0,PLOT_ARROW,233);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(1,PLOT_ARROW,234);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   emaThreeShiftTwoBackward_Handle = iMA(Symbol(), PERIOD_CURRENT,3,-2,MODE_EMA,PRICE_CLOSE);
   emaFiveShiftTwoBackward_Handle = iMA(Symbol(), PERIOD_CURRENT,3,0,MODE_EMA,PRICE_CLOSE);
   sa_Handler=iSAR(Symbol(),PERIOD_CURRENT,0.02,0.2);
   force_Handle=iForce(Symbol(),PERIOD_CURRENT,13,MODE_SMA,VOLUME_TICK);//verificar
   forcePrevious_Handle=iForce(Symbol(),PERIOD_CURRENT,13,MODE_SMA,VOLUME_TICK);//verificar

   Bands_Backward_Handle=iBands(Symbol(),PERIOD_CURRENT,20,-2,2,PRICE_CLOSE);

//Print("UpperbandShiftTwoBackward" +UpperbandShiftTwoBackward);

   Band_Handle=iBands(Symbol(),PERIOD_CURRENT,20,0,2,PRICE_CLOSE);
   
  if(TimeCurrent()>UNTIL){
  Alert("Test expired on the day ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
  return(INIT_FAILED);}

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
  if(TimeCurrent()>UNTIL){
  Comment("Test expired on the day ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
  return rates_total;}
  

   static bool en_in;
   static double en_high;
   static double en_low;
   static datetime t1;
   static datetime t2;
   static double p1;
   static double p2;
   static int counter;

   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(open,true);
   ArraySetAsSeries(close,true);
   ArraySetAsSeries(time,true);

   ArraySetAsSeries(buff_dn,true);
   ArraySetAsSeries(buff_up,true);


   ArraySetAsSeries(Buffer,true);

   int lookback = 0;
   int limit = MathMax(rates_total-1-prev_calculated,2);

   if(prev_calculated==0)
     {
      ArrayInitialize(buff_dn,EMPTY_VALUE);
      ArrayInitialize(buff_up,EMPTY_VALUE);
     }

////////////////////////////////
   /*
      static datetime prevTime=0;
   if(prevTime==time[rates_total-1])
   return(rates_total);

   int Start=100;
   if(prev_calculated==0){
   Start=100;
   ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
   }
   else
   Start=rates_total-1;

   for(int shift=Start;shift<rates_total;shift++){*/
///////////////////////////////////////////////////////

//Comment(rates_total-1-prev_calculated);
   for(int i = limit; i >= 2 && !IsStopped(); i--)
     {
      //CopyBuffer(emaThreeShiftTwoBackward_Handle,0,rates_total-1-shift,3,Bollinger_1_Buffer_UP);
      CopyBuffer(emaThreeShiftTwoBackward_Handle,0,i-1,3,Buffer);
      double emaThreeShiftTwoBackward =Buffer[0];
      CopyBuffer(emaFiveShiftTwoBackward_Handle,0,i-1,3,Buffer);
      double emaFiveShiftTwoBackward = Buffer[0];
      CopyBuffer(sa_Handler,0,i-1,3,Buffer);
      double sar=Buffer[0];
      CopyBuffer(force_Handle,0,i-1,3,Buffer);
      double force=Buffer[0];
      double forcePrevious=Buffer[1];
      long volNow=iVolume(Symbol(), PERIOD_CURRENT,i);
      long volPrev=iVolume(Symbol(), PERIOD_CURRENT,i-1);

      CopyBuffer(Bands_Backward_Handle,0,i,3,Buffer);
      double MiddlebandShiftTwoBackward=Buffer[0];
      CopyBuffer(Bands_Backward_Handle,1,i,3,Buffer);
      double UpperbandShiftTwoBackward=Buffer[0];
      CopyBuffer(Bands_Backward_Handle,2,i,3,Buffer);
      double LowerbandShiftTwoBackward=Buffer[0];

      CopyBuffer(Band_Handle,0,i-1,3,Buffer);
      double Middleband=Buffer[0];
      CopyBuffer(Band_Handle,1,i-1,3,Buffer);
      double Upperband=Buffer[0];
      CopyBuffer(Band_Handle,2,i-1,3,Buffer);
      double Lowerband=Buffer[0];;

      //Print("Upperband" +Upperband);

      if(high[i]>high[i-1] && low[i]<low[i-1])
        {
         counter++;
         en_in = true;
         t1 = time[i];
         t2 = time[i];
         en_high = high[i];
         en_low = low[i];
         p1 = en_high;
         p2 = en_low;


         TrendCreate(0,tag+" top "+IntegerToString(counter),0,t1,p1,t2,p1,clrRed,STYLE_SOLID,2,false,false,false,false,true,0);

         TrendCreate(0,tag+" bot "+IntegerToString(counter),0,t1,p2,t2,p2,clrRed,STYLE_SOLID,2,false,false,false,false,true,0);
        }

      if(en_in)
        {
         t2 = time[i-1];
         ObjectSetInteger(0,tag+" top "+IntegerToString(counter),OBJPROP_TIME,1,t2);//Verificar
         ObjectSetInteger(0,tag+" bot "+IntegerToString(counter),OBJPROP_TIME,1,t2);//Verificar

         if(close[i-1] > en_high && open[i-1]<=en_high)
            //Print(TimeToString(time[i],TIME_DATE|TIME_MINUTES),"  ",en_high,"  ",i);
            // if(open[i]<close[i-1] || open[i]>close[i-1])
            if(emaThreeShiftTwoBackward>emaFiveShiftTwoBackward)
               if(sar<close[i-1])
                  if(force>0)
                     if(forcePrevious<force)
                        if(volNow<(volPrev+3))
                           if(Upperband<UpperbandShiftTwoBackward && LowerbandShiftTwoBackward<Lowerband)
                              //if(close[i-1]>Upperband)

                             {
                              buff_up[i-1]= EMPTY_VALUE;
                              buff_dn[i-1]= EMPTY_VALUE;
                              en_in = false;
                              buff_up[i-1]= (en_high+en_low)/2.0;
                             }

         //Print("Entra UP");


         if(close[i-1]<en_low && open[i-1]>=en_low)

            // if(open[i]<close[i-1] || open[i]>close[i-1])
            if(emaThreeShiftTwoBackward<emaFiveShiftTwoBackward)
               if(sar>close[i-1])
                  if(force<0)
                     if(forcePrevious>force)
                        if(volNow<(volPrev+3))
                           if(Lowerband>LowerbandShiftTwoBackward && UpperbandShiftTwoBackward>Upperband)
                              //if(close[i-1]<Lowerband)
                             {
                              //Print(TimeToString(time[i-1],TIME_DATE|TIME_MINUTES),"  DN");
                              en_in = false;
                              buff_up[i-1]= EMPTY_VALUE;
                              buff_dn[i-1]= EMPTY_VALUE;
                              buff_dn[i-1] = (en_high+en_low)/2.0;
                             }

         //Print("Entra DN");
        }
     }//main i loop
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Crear la línea de tendencia según las coordenadas establecidas                     |
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
void OnDeinit(const int reason)
  {
// 0 = REASON_PROGRAM
// 1 = REASON_REMOVE
// 2 = REASON_RECOMPILE
// 3 = REASON_CHARTCHANGE
// 4 = REASON_CHARTCLOSE
// 5 = REASON_PARAMETERS
// 6 = REASON_ACCOUNT
// 7 = REASON_TEMPLATE
// 8 = REASON_INITFAILED
// 9 = REASON_CLOSE
//if(reason == 1 || reason == 4)
//{
//for(int iObj=ObjectsTotal()-1; iObj >= 0; iObj--)
//{
//   string objname = ObjectName(iObj);
//   if(StringFind(objname,tag) != -1)
//   {
//      ObjectDelete(0,objname);
//   }
//}
//}

   ObjectsDeleteAll(0,tag,-1,-1);
   Comment("");
  }
//+------------------------------------------------------------------+
