//+------------------------------------------------------------------+
//|                                                       Cuadro.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 7
#property indicator_plots   4

#property indicator_label1  "A"
#property indicator_color1  clrMagenta
#property indicator_type1  DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  5

#property indicator_label2  "B"
#property indicator_color2  clrMagenta
#property indicator_type2  DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  5

#property indicator_label3  "Sop o Res"
#property indicator_type3   DRAW_FILLING
#property indicator_color3  clrBlue,clrRed
#property indicator_width3  1

#property indicator_label4  "Linea Extrema"
#property indicator_type4   DRAW_LINE
#property indicator_color4  clrRed
#property indicator_width4  1

double         IntersectionBuffer1[];
double         IntersectionBuffer2[];
double         Line_Extrema[];

input bool Ver_Todo_Historial=false;
input int Historial_Velas=2000;//Historial Velas (Si Ver_Todo_Historial=false)
input bool VerSalto=true;//Ver Salto
input string S5="************* CONFIGURACION MEDIAS MOVILES *********************";//******************************************************
input int Ma_Periodo=21;//Base_Periodo
input int Ma_Shift=0;//Base_Shift
input ENUM_MA_METHOD Ma_Method=MODE_EMA;//Base Method
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;//Base Applied Price
input string S8="************* CONFIGURACION SAR *********************";//******************************************************
input double SAR_Step=0.02;//Onda A
input double SAR_Maximun=0.2;//Onda B
input string S10="************* CONFIGURACION PUNTOS A B *********************";//******************************************************
input color Color_A=clrNONE;
input color Color_B=clrNONE;
input string S11="************* CONFIGURACION CUADRO LINEA *********************";//******************************************************
input string s1Linea="=== Linea Cuadro ===";//------->
input color Color_Linea=clrRed;
input uint Grosor_Linea=2;
input ENUM_LINE_STYLE Estilo_Linea=STYLE_SOLID;
input string s1Cuadro="=== Cuadro ===";//------->
input color color_UP_Cuadro=clrBlue;
input color color_DN_Cuadro=clrBlue;
input uint Grosor_Cuadro=2;
input string s1Vertical="=== Linea Vertical ===";//------->
input color Color_Vertical=clrYellow;
input uint Grosor_Vertical=2;
input ENUM_LINE_STYLE Estilo_Vertical=STYLE_SOLID;


double         SAR_Buffer[];
double         MA_Buffer[];

double         Arrow_A[];
double         Arrow_B[];

int Handle_MA=0;
int Handle_SAR=0;


struct Estructura_Variables
  {
   bool              Alcista;
   int               Cantidad_B;
   bool              Condicion;
   double            B1;
   int               Indice_B1;
   double            B2A;
   double            B2B;
   int               Indice_B2A;
   int               Indice_B2B;
   double            B3A;
   double            B3B;
   int               Indice_B3A;
   int               Indice_B3B;
  };

string Vertical="Vertical 2023";

Estructura_Variables Variables;
bool Primero=false;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   Variables.Alcista=true;
   Variables.Cantidad_B=0;
   Primero=false;

   Handle_MA=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo,Ma_Shift,Ma_Method,Ma_AppliedPrice);
   Handle_SAR=iSAR(Symbol(),PERIOD_CURRENT,SAR_Step,SAR_Maximun);
//--- vinculación del array con el búfer indicador
   SetIndexBuffer(0,Arrow_A,INDICATOR_DATA);
   SetIndexBuffer(1,Arrow_B,INDICATOR_DATA);
   SetIndexBuffer(2,IntersectionBuffer1,INDICATOR_DATA);
   SetIndexBuffer(3,IntersectionBuffer2,INDICATOR_DATA);
   SetIndexBuffer(4,Line_Extrema,INDICATOR_DATA);
   SetIndexBuffer(5,SAR_Buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(6,MA_Buffer,INDICATOR_CALCULATIONS);
//--- inicialización del generador de números pseudoaleatorios
   ArraySetAsSeries(SAR_Buffer,false);
   ArraySetAsSeries(MA_Buffer,false);
   ArraySetAsSeries(Arrow_A,false);
   ArraySetAsSeries(Arrow_B,false);
   ArraySetAsSeries(Line_Extrema,false);
   ArraySetAsSeries(IntersectionBuffer1,false);
   ArraySetAsSeries(IntersectionBuffer2,false);

   PlotIndexSetInteger(0,PLOT_ARROW,163);
   PlotIndexSetInteger(1,PLOT_ARROW,163);


   PlotIndexSetInteger(0,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       0,       //  índice del color donde escribiremos el color
                       Color_A);

   PlotIndexSetInteger(1,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       0,       //  índice del color donde escribiremos el color
                       Color_B);

   PlotIndexSetInteger(2,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       0,       //  índice del color donde escribiremos el color
                       color_UP_Cuadro);

   PlotIndexSetInteger(2,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       1,       //  índice del color donde escribiremos el color
                       color_DN_Cuadro);

   PlotIndexSetInteger(2,                    //  número del estilo gráfico
                       PLOT_LINE_WIDTH,Grosor_Cuadro);

   PlotIndexSetInteger(3,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       0,       //  índice del color donde escribiremos el color
                       Color_Linea);

   PlotIndexSetInteger(3,                    //  número del estilo gráfico
                       PLOT_LINE_WIDTH,Grosor_Linea);

   PlotIndexSetInteger(3,                    //  número del estilo gráfico
                       PLOT_LINE_STYLE,Estilo_Linea);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,Vertical,0,OBJ_VLINE);
   Comment("");
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

   BorrarDibujos();

   if(BarsCalculated(Handle_MA)<rates_total)
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
   if(CopyBuffer(Handle_MA,0,0,to_copy,MA_Buffer)<=0)
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
      ArrayInitialize(Arrow_A,EMPTY_VALUE);
      ArrayInitialize(Arrow_B,EMPTY_VALUE);
      ArrayInitialize(IntersectionBuffer1,0);
      ArrayInitialize(IntersectionBuffer2,0);
      ArrayInitialize(Line_Extrema,EMPTY_VALUE);

      ObjectsDeleteAll(0,Vertical,0,OBJ_VLINE);
      Primero=false;
     }

   if(prev_calculated==rates_total)
      return rates_total;


   int start=MathMax(rates_total-(rates_total-prev_calculated),MathMax(Ver_Todo_Historial?0:rates_total-Historial_Velas,4));

////////// RUPTURA DE SOP o RES
   for(int shift=start; shift<rates_total; shift++)
     {
      Arrow_A[shift-1]=EMPTY_VALUE;
      Arrow_B[shift-1]=EMPTY_VALUE;
      Arrow_A[shift]=EMPTY_VALUE;
      Arrow_B[shift]=EMPTY_VALUE;
      IntersectionBuffer1[shift]=0;
      IntersectionBuffer2[shift]=0;
      Line_Extrema[shift]=EMPTY_VALUE;


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

            if(SAR_Buffer[shift-i]>=MA_Buffer[shift-i] && SAR_Buffer[shift-i-1]<MA_Buffer[shift-i-1])
              {
               IsA=true;
               if(Variables.Alcista==false)
                  break;
              }
           }

         if(!IsA)
           {
            if(Variables.Alcista)
              {
               IgualarVariables(shift,IndiceUltimo,time);
               Arrow_B[shift-IndiceUltimo]=SAR_Buffer[shift-IndiceUltimo];
              }
           }
         else
           {
            if(Variables.Alcista!=false)
              {
               Variables.Cantidad_B=0;
               Variables.Alcista=false;
               Variables.Condicion=false;
               Arrow_A[shift-IndiceUltimo]=SAR_Buffer[shift-IndiceUltimo];
              }
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

               if(SAR_Buffer[shift-i]<=MA_Buffer[shift-i] && SAR_Buffer[shift-i-1]>MA_Buffer[shift-i-1])
                 {
                  IsA=true;
                  if(Variables.Alcista==true)
                     break;
                 }
              }

            if(!IsA)
              {
               if(!Variables.Alcista)
                 {
                  IgualarVariables(shift,IndiceUltimo,time);
                  Arrow_B[shift-IndiceUltimo]=SAR_Buffer[shift-IndiceUltimo];
                 }
              }
            else
              {
               if(Variables.Alcista!=true)
                 {
                  Variables.Cantidad_B=0;
                  Variables.Alcista=true;
                  Variables.Condicion=false;
                  Arrow_A[shift-IndiceUltimo]=SAR_Buffer[shift-IndiceUltimo];
                 }
              }
           }


      if(Variables.Condicion)
        {
         IntersectionBuffer1[shift-1]=Variables.B1;
         IntersectionBuffer2[shift-1]=Variables.B2A;
         Line_Extrema[shift-1]=Variables.B1;
        }

     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Dibujar(datetime const &time[],int shift)
  {
   VLineCreate(0,Vertical+TimeToString(time[shift],TIME_DATE|TIME_MINUTES),0,time[shift],Color_Vertical,Estilo_Vertical,Grosor_Vertical,false,false,false,true,0);
   ChartRedraw();
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IgualarVariables(int shift,int IndiceUltimo,datetime const &time[])
  {

   if(Variables.Cantidad_B==0)
     {
      Variables.B1=SAR_Buffer[shift-IndiceUltimo];
      Variables.Indice_B1=shift-IndiceUltimo;

      Variables.Cantidad_B++;
     }
   if(Variables.Cantidad_B==1)
     {
      Variables.B2A=SAR_Buffer[shift-IndiceUltimo];
      Variables.B2B=SAR_Buffer[shift-2];
      Variables.Indice_B2A=shift-IndiceUltimo;

      if(Variables.Alcista)
         if(Variables.B2A<Variables.B1 && Variables.B2B<Variables.B1)
            Variables.Cantidad_B++;

      if(!Variables.Alcista)
         if(Variables.B2A>Variables.B1 && Variables.B2B>Variables.B1)
            Variables.Cantidad_B++;

     }
   if(Variables.Cantidad_B==2)
     {
      Variables.B3A=SAR_Buffer[shift-IndiceUltimo];
      Variables.B3B=SAR_Buffer[shift-2];

      if(Variables.Alcista)
         if(Variables.B3A<Variables.B2A)
            if(Variables.B3B<Variables.B1)
              {
               if(Primero)
                  Variables.Condicion=true;
               Primero=true;
               Variables.Cantidad_B++;
              }

      if(!Variables.Alcista)
         if(Variables.B3A>Variables.B2A)
            if(Variables.B3B>Variables.B1)
              {
               if(Primero)
                  Variables.Condicion=true;
               Primero=true;
               Variables.Cantidad_B++;
              }

      if(Variables.Condicion)
         Dibujar(time,shift-1);
     }
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
//|                                                                  |
//+------------------------------------------------------------------+
void BorrarDibujos()
  {
   static datetime TiempoWeek=iTime(Symbol(),PERIOD_W1,0);
   datetime Week=iTime(Symbol(),PERIOD_W1,0);

   if(Week!=TiempoWeek)
     {
      datetime TiempoBorrado=TimeCurrent()-PeriodSeconds(PERIOD_CURRENT)*Historial_Velas;
      if(TiempoBorrado!=0)
        {
         int Vert=ObjectsTotal(0,0,OBJ_VLINE);
         for(int i=Vert-1; i>=0; i--)
           {
            string Nombre=ObjectName(0,i,0,OBJ_VLINE);
            if(ObjectGetInteger(0,Nombre,OBJPROP_TIME,0)<TiempoBorrado)
              {
               if(StringFind(Nombre,Vertical,0)!=-1)
                  ObjectDelete(0,Nombre);
              }
           }
         ChartRedraw();
        }
     }
  }
//+------------------------------------------------------------------+
