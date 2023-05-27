//+------------------------------------------------------------------+
//|                                                 Tres Moviles.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 7
#property indicator_plots   2
//--- plot ColorLine
#property indicator_label1  "Line Seguimiento"
#property indicator_type1   DRAW_COLOR_SECTION
//--- estableceremos 5 colores para colorear cada barra (se almacenan en un array especial)
#property indicator_color1  clrLime,clrMagenta,clrNONE // (se puede especificar hasta 64 colores) 
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2  "Line Contrario"
#property indicator_type2   DRAW_COLOR_SECTION
//--- estableceremos 5 colores para colorear cada barra (se almacenan en un array especial)
#property indicator_color2  clrLime,clrMagenta,clrNONE // (se puede especificar hasta 64 colores) 
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

input bool VerSalto=true;//Ver Salto
input string S5="************* CONFIGURACION MEDIAS MOVILES *********************";//******************************************************
input string S1_FAST="=== Fast ===";//------------>
input int Ma_Periodo_Fast=21;//Base_Periodo Fast
input int Ma_Shift_Fast=0;//Base_Shift Fast
input ENUM_MA_METHOD Ma_Method_Fast=MODE_EMA;//Base Method Fast
input ENUM_APPLIED_PRICE Ma_AppliedPrice_Fast=PRICE_CLOSE;//Base Applied Price Fast
input string S1_SLOW="=== Slow ===";//------------>
input int Ma_Periodo_Slow=40;//Base_Periodo Slow
input int Ma_Shift_Slow=0;//Base_Shift Slow
input ENUM_MA_METHOD Ma_Method_Slow=MODE_EMA;//Base Method Slow
input ENUM_APPLIED_PRICE Ma_AppliedPrice_Slow=PRICE_CLOSE;//Base Applied Price Slow
input string S8="************* CONFIGURACION SAR *********************";//******************************************************
input double SAR_Step=0.02;//Onda A
input double SAR_Maximun=0.2;//Onda B
input string S9="************* CONFIGURACION LINEAS *********************";//******************************************************
input string S1_UP="=== Alcista ===";//------------>
input color Color_Seguimiento_Alcista=clrGreen;//Color Seguimiento
input color Color_Contraria_Alcista=clrAqua;//Color Contraria
input string S2_Middle="=== Bajista ===";//------------>
input color Color_Seguimiento_Bajista=clrRed;//Color Seguimiento
input color Color_Contraria_Bajista=clrMagenta;//Color Contraria
input string S3_Middle="=== Grosor ===";//------------>
input uint Grosor_Linea_Seguimiento=1;//Grosor Linea Seguimiento
input uint Grosor_Linea_Contraria=1;//Grosor Linea Contraria
input string S4_Middle="=== Estilo ===";//------------>
input ENUM_LINE_STYLE Estilo_Linea_Seguimiento=STYLE_SOLID;//Estilo Linea Segumiento
input ENUM_LINE_STYLE Estilo_Linea_Contraria=STYLE_SOLID;//Estilo Linea Contraria

double         Seguimiento_Buffer[];
double         Colors_Seguimiento_Color[];
double         Contrario_Buffer[];
double         Colors_Contrario_Color[];
double         SAR_Buffer[];
double         MA_Buffer_Fast[];
double         MA_Buffer_Slow[];


int Handle_MA_Fast=0;
int Handle_MA_Slow=0;
int Handle_SAR=0;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(Ma_Periodo_Fast>=Ma_Periodo_Slow)
     {
      Alert("Periodo Base Fast debe ser menor al Periodo Base Slow");
      return INIT_PARAMETERS_INCORRECT;
     }


   Handle_MA_Fast=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo_Fast,Ma_Shift_Fast,Ma_Method_Fast,Ma_AppliedPrice_Fast);
   Handle_MA_Slow=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo_Slow,Ma_Shift_Slow,Ma_Method_Slow,Ma_AppliedPrice_Slow);
   Handle_SAR=iSAR(Symbol(),PERIOD_CURRENT,SAR_Step,SAR_Maximun);
//--- vinculación del array con el búfer indicador
   SetIndexBuffer(0,Seguimiento_Buffer,INDICATOR_DATA);
   SetIndexBuffer(1,Colors_Seguimiento_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,Contrario_Buffer,INDICATOR_DATA);
   SetIndexBuffer(3,Colors_Contrario_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(4,SAR_Buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,MA_Buffer_Fast,INDICATOR_CALCULATIONS);
   SetIndexBuffer(6,MA_Buffer_Slow,INDICATOR_CALCULATIONS);
//--- inicialización del generador de números pseudoaleatorios
   ArraySetAsSeries(Seguimiento_Buffer,false);
   ArraySetAsSeries(Colors_Seguimiento_Color,false);
   ArraySetAsSeries(Contrario_Buffer,false);
   ArraySetAsSeries(Colors_Contrario_Color,false);
   ArraySetAsSeries(SAR_Buffer,false);
   ArraySetAsSeries(MA_Buffer_Fast,false);
   ArraySetAsSeries(MA_Buffer_Slow,false);


   PlotIndexSetInteger(0,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       0,       //  índice del color donde escribiremos el color
                       Color_Seguimiento_Alcista);
   PlotIndexSetInteger(0,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       1,       //  índice del color donde escribiremos el color
                       Color_Seguimiento_Bajista);

   PlotIndexSetInteger(0,PLOT_LINE_STYLE,Estilo_Linea_Seguimiento);
   PlotIndexSetInteger(0,PLOT_LINE_WIDTH,Grosor_Linea_Seguimiento);

   PlotIndexSetInteger(1,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       0,       //  índice del color donde escribiremos el color
                       Color_Contraria_Alcista);
   PlotIndexSetInteger(1,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       1,       //  índice del color donde escribiremos el color
                       Color_Contraria_Bajista);

   PlotIndexSetInteger(1,PLOT_LINE_STYLE,Estilo_Linea_Contraria);
   PlotIndexSetInteger(1,PLOT_LINE_WIDTH,Grosor_Linea_Contraria);


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
   if(BarsCalculated(Handle_MA_Fast)<rates_total)
      return(0);
   if(BarsCalculated(Handle_MA_Slow)<rates_total)
      return(0);

   if(BarsCalculated(Handle_SAR)<rates_total)
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
   if(CopyBuffer(Handle_MA_Fast,0,0,to_copy,MA_Buffer_Fast)<=0)
      return(0);
   if(CopyBuffer(Handle_MA_Slow,0,0,to_copy,MA_Buffer_Slow)<=0)
      return(0);
   if(CopyBuffer(Handle_SAR,0,0,to_copy,SAR_Buffer)<=0)
      return 0;

   ArraySetAsSeries(time,false);
   ArraySetAsSeries(high,false);
   ArraySetAsSeries(low,false);
   ArraySetAsSeries(close,false);
   ArraySetAsSeries(open,false);

   if(prev_calculated==0)
     {
      ArrayInitialize(Seguimiento_Buffer,EMPTY_VALUE);
      ArrayInitialize(Contrario_Buffer,EMPTY_VALUE);
     }

   if(prev_calculated==rates_total)
      return rates_total;


   int start=MathMax(rates_total-(rates_total-prev_calculated),4);

////////// RUPTURA DE SOP o RES
   for(int shift=start; shift<rates_total; shift++)
     {
      Seguimiento_Buffer[shift]=EMPTY_VALUE;
      Seguimiento_Buffer[shift-1]=EMPTY_VALUE;
      Contrario_Buffer[shift]=EMPTY_VALUE;
      Contrario_Buffer[shift-1]=EMPTY_VALUE;


      if(SAR_Buffer[shift-1]>=high[shift-1] && SAR_Buffer[shift-2]<=low[shift-2])
        {
         bool IsA=false;
         int IndiceUltimo=0;
         for(int i=2; i<100 && shift-i-1>=0; i++)
           {
            if(SAR_Buffer[shift-i-1]>close[shift-i-1])
              {
               IndiceUltimo=i;
               break;
              }

            if(SAR_Buffer[shift-i]>=MA_Buffer_Fast[shift-i] && SAR_Buffer[shift-i-1]<MA_Buffer_Fast[shift-i-1])
              {
               IsA=true;
               break;
              }
           }

         if(!IsA)
           {
            if(MA_Buffer_Fast[shift-1]<MA_Buffer_Slow[shift-1])
               IgualarBufferSeguimiento(shift,IndiceUltimo,true);

            if(MA_Buffer_Fast[shift-IndiceUltimo]<MA_Buffer_Slow[shift-IndiceUltimo]  && MA_Buffer_Fast[shift-1]<MA_Buffer_Slow[shift-1])
               IgualarBufferContraria(shift,IndiceUltimo,close,true);
           }
        }

      else
         if(SAR_Buffer[shift-1]<=low[shift-1] && SAR_Buffer[shift-2]>=high[shift-2])
           {
            bool IsA=false;
            int IndiceUltimo=0;
            for(int i=2; i<100 && shift-i-1>=0; i++)
              {
               if(SAR_Buffer[shift-i-1]<close[shift-i-1])
                 {
                  IndiceUltimo=i;
                  break;
                 }

               if(SAR_Buffer[shift-i]<=MA_Buffer_Fast[shift-i] && SAR_Buffer[shift-i-1]>MA_Buffer_Fast[shift-i-1])
                 {
                  IsA=true;
                  break;
                 }
              }

            if(!IsA)
              {
               if(MA_Buffer_Fast[shift-1]>MA_Buffer_Slow[shift-1])
                  IgualarBufferSeguimiento(shift,IndiceUltimo,false);

               if(MA_Buffer_Fast[shift-IndiceUltimo]>MA_Buffer_Slow[shift-IndiceUltimo] && MA_Buffer_Fast[shift-1]>MA_Buffer_Slow[shift-1])
                  IgualarBufferContraria(shift,IndiceUltimo,close,false);
              }
           }



      if(Seguimiento_Buffer[shift-1]==EMPTY_VALUE)
        {
         Seguimiento_Buffer[shift-1]=Seguimiento_Buffer[shift-2];
         Colors_Seguimiento_Color[shift-1]=Colors_Seguimiento_Color[shift-2];
        }
      if(Contrario_Buffer[shift-1]==EMPTY_VALUE)
        {
         Contrario_Buffer[shift-1]=Contrario_Buffer[shift-2];
         Colors_Contrario_Color[shift-1]=Colors_Contrario_Color[shift-2];
        }

     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IgualarBufferSeguimiento(int shift,int IndiceUltimo,bool IsAlcista)
  {
   Seguimiento_Buffer[shift-1]=SAR_Buffer[shift-1];
// Contrario_Buffer[shift-1]=NormalizeDouble(MIDDLE_Buffer[shift-1]-desf,Digits());

   Colors_Seguimiento_Color[shift-1]=IsAlcista?1:0;
//Colors_Contrario_Color[shift-1]=Variables.Alcista?1:0;

   if(!VerSalto)
     {
      Colors_Seguimiento_Color[shift-3]=2;
      // Colors_Contrario_Color[shift-3]=2;

      Colors_Seguimiento_Color[shift-2]=2;
      // Colors_Contrario_Color[shift-2]=2;

      Seguimiento_Buffer[shift-2]=Seguimiento_Buffer[shift-1];
      //Contrario_Buffer[shift-2]=Contrario_Buffer[shift-1];
     }
   else
     {
      Seguimiento_Buffer[shift-2]=EMPTY_VALUE;
      //Contrario_Buffer[shift-2]=EMPTY_VALUE;

      Seguimiento_Buffer[shift-3]=EMPTY_VALUE;
      // Contrario_Buffer[shift-3]=EMPTY_VALUE;

      Seguimiento_Buffer[shift-2]=Seguimiento_Buffer[shift-1];
      // Contrario_Buffer[shift-2]=Contrario_Buffer[shift-1];

     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IgualarBufferContraria(int shift,int IndiceUltimo,double const &Close[],bool IsAlcista)
  {
// Seguimiento_Buffer[shift-1]=SAR_Buffer[shift-1];
   Contrario_Buffer[shift-1]=Close[shift-IndiceUltimo];

//   Colors_Seguimiento_Color[shift-1]=Variables.Alcista?1:0;
   Colors_Contrario_Color[shift-1]=IsAlcista?1:0;

   if(!VerSalto)
     {
     // Colors_Seguimiento_Color[shift-3]=2;
       Colors_Contrario_Color[shift-3]=2;

      //Colors_Seguimiento_Color[shift-2]=2;
       Colors_Contrario_Color[shift-2]=2;

      //Seguimiento_Buffer[shift-2]=Seguimiento_Buffer[shift-1];
      Contrario_Buffer[shift-2]=Contrario_Buffer[shift-1];
     }
   else
     {
      //Seguimiento_Buffer[shift-2]=EMPTY_VALUE;
      Contrario_Buffer[shift-2]=EMPTY_VALUE;

      //Seguimiento_Buffer[shift-3]=EMPTY_VALUE;
       Contrario_Buffer[shift-3]=EMPTY_VALUE;

      //Seguimiento_Buffer[shift-2]=Seguimiento_Buffer[shift-1];
       Contrario_Buffer[shift-2]=Contrario_Buffer[shift-1];

     }
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
