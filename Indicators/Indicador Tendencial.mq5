//+------------------------------------------------------------------+
//|                                         Indicador Tendencial.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2011, MetaQuotes Software Corp." 
#property link      "https://www.mql5.com" 
#property version   "1.00" 
  
#property description "Indicador para demostrar DRAW_COLOR_LINE" 
#property description "Dibuja con segmentos de colores de 20 barras la línea a base de los precios Close" 
#property description "El color, grosor y el estilo de segmentos de la línea se cambian de forma aleatoria" 
#property description "cada N tics" 
  
#property indicator_chart_window 
#property indicator_buffers 2 
#property indicator_plots   1 
//--- plot ColorLine 
#property indicator_label1  "ColorLine" 
#property indicator_type1   DRAW_COLOR_LINE 
//--- estableceremos 5 colores para colorear cada barra (se almacenan en un array especial) 
#property indicator_color1  clrRed,clrBlue,clrMagenta // (se puede especificar hasta 64 colores) 
#property indicator_style1  STYLE_SOLID 
#property indicator_width1  1 

double         ColorLineBuffer[]; 
//--- búfer para almacenar el color del trazado de la línea en cada barra 
double         ColorLineColors[]; 

input string ParametrosMedia="***Parametros Media***";
input int PeriodoEMA=12;
input int ShiftEMA=0;
input ENUM_MA_METHOD ModeEMA= MODE_SMA;
input ENUM_APPLIED_PRICE AppliedPriceEMA=PRICE_CLOSE;
input string ParametrosEstocastico="***Parametros Estocastico***";
input int K_Stocastico=5;
input int D_Stocastico=3;
input int Slowing_Stocastico=3;
input ENUM_MA_METHOD Mode_Stocastico=MODE_SMA;
input ENUM_STO_PRICE Sto_Mode_Stocastico=STO_LOWHIGH;
input string Estilizador="***Estilizador Indicador***";
input int WhidthLine=2;
input color ColorUp=clrBlue;
input color ColorDn=clrRed;
input int PuntosAlejadoPrecio=5;
input string EnlaceCodigosWinding="https://docs.mql4.com/constants/objectconstants/wingdings";
input int WindingUp=225;
input int WindingDn=226;

color ColorConteo=clrBlue;

int EMA;

bool DireccionUP=true;
double CloseCruce=0;
int CodeArrow=225;

int Estocastico;

datetime UNTIL=D'2020.12.08 00:00'; 

//+------------------------------------------------------------------+ 
//| Custom indicator initialization function                         | 
//+------------------------------------------------------------------+ 
int OnInit() 
  { 
   if(UNTIL<TimeCurrent())
   return(INIT_FAILED);
   
//--- vinculación del array con el búfer indicador 
   SetIndexBuffer(0,ColorLineBuffer,INDICATOR_DATA); 
   SetIndexBuffer(1,ColorLineColors,INDICATOR_COLOR_INDEX); 
//--- inicialización del generador de números pseudoaleatorios 
   PlotIndexSetInteger(0,PLOT_LINE_COLOR,0,ColorDn);      //  índice del color donde escribiremos el color 
   PlotIndexSetInteger(0,PLOT_LINE_COLOR,1,ColorUp);  
   PlotIndexSetInteger(0,PLOT_LINE_WIDTH,WhidthLine); 

   EMA=iMA(Symbol(),PERIOD_CURRENT,PeriodoEMA,ShiftEMA,ModeEMA,AppliedPriceEMA);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   if(ObjectFind(0,"ConteoPips")!=0)
      TextCreate(0,"ConteoPips",0,TimeCurrent()+PeriodSeconds(Period())*(PuntosAlejadoPrecio+2),Bid,"---","Arial",12,clrAqua,0,0,false,false,true,0);
    
    if(ObjectFind(0,"ConteoFlecha")!=0)
    ArrowCreate(0,"ConteoFlecha",0,TimeCurrent()+PeriodSeconds(Period())*PuntosAlejadoPrecio,Bid,225,ANCHOR_TOP,ColorConteo,STYLE_SOLID,2,true,false,true,0);

  Estocastico=iStochastic(Symbol(),PERIOD_CURRENT,K_Stocastico,D_Stocastico,Slowing_Stocastico,Mode_Stocastico,Sto_Mode_Stocastico);

  int WindowsTotal=int(ChartGetInteger(0,CHART_WINDOWS_TOTAL,0));
  for(int i=0;i<WindowsTotal;i++){
  for(int j=0;j<ChartIndicatorsTotal(0,i);j++){
  string NameIndicador=ChartIndicatorName(0,i,j);
  if(StringFind(NameIndicador,"Stoch",0)!=-1)
  ChartIndicatorDelete(0,i,NameIndicador);
  }
  }
  
  WindowsTotal=int(ChartGetInteger(0,CHART_WINDOWS_TOTAL,0));
  
  ChartIndicatorAdd(0,WindowsTotal,Estocastico);
//--- indicator buffers mapping

   Comment("Periodo Prueba Hasta: ",UNTIL);
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
  
   if(UNTIL<TimeCurrent())
   return (rates_total);
   
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   
   ArraySetAsSeries(close,false);
   ArraySetAsSeries(time,true);
  
  if(BarsCalculated(EMA)<rates_total) return(0);
  
  int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0) to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(EMA,0,0,to_copy,ColorLineBuffer)<=0) return(0);
  
//--- bloque para calcular los valores del indicador 
   
   int Start=1;
   if(prev_calculated!=0)
   Start=rates_total-1;
   
   for(int i=Start;i<rates_total ;i++) 
     { 
      if(ColorLineBuffer[i]<ColorLineBuffer[i-1]){
      ColorLineColors[i]=0;
      DireccionUP=false;
      if(ColorLineColors[i-1]==1)
      CloseCruce=ColorLineBuffer[i];
      }
      else if(ColorLineBuffer[i]>ColorLineBuffer[i-1]){
      ColorLineColors[i]=1;
      DireccionUP=true;
      if(ColorLineColors[i-1]==0)
      CloseCruce=ColorLineBuffer[i];
      }
      else 
      ColorLineColors[i]=2;
     } 
   if(DireccionUP==true){
   ColorConteo=ColorUp;
   CodeArrow=WindingUp;
   }
   else{
   ColorConteo=ColorDn;
   CodeArrow=WindingDn;}
   
   double Calculo=(MathAbs(CloseCruce-close[rates_total-1]))/Point();
   if(ObjectFind(0,"ConteoPips")==0){
   ObjectSetString(0,"ConteoPips",OBJPROP_TEXT,IntegerToString(int(Calculo),0,' ')); 
   ObjectSetInteger(0,"ConteoPips",OBJPROP_TIME,0,time[0]+PeriodSeconds(Period())*(PuntosAlejadoPrecio+2));
   ObjectSetInteger(0,"ConteoPips",OBJPROP_COLOR,ColorConteo); 
   ObjectSetDouble(0,"ConteoPips",OBJPROP_PRICE,0,Bid);
   }
   if(ObjectFind(0,"ConteoFlecha")==0){
   ObjectSetInteger(0,"ConteoFlecha",OBJPROP_TIME,0,time[0]+PeriodSeconds(Period())*PuntosAlejadoPrecio);
   ObjectSetInteger(0,"ConteoFlecha",OBJPROP_COLOR,ColorConteo); 
   ObjectSetInteger(0,"ConteoFlecha",OBJPROP_ARROWCODE,CodeArrow);
   ObjectSetDouble(0,"ConteoFlecha",OBJPROP_PRICE,0,Bid);
   }
  
//--- volveremos el valor prev_calculated para la siguiente llamada de la función 
   return(rates_total); 
  } 
  
  
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
  
void OnDeinit(const int reason){
if(ObjectFind(0,"ConteoPips")==0)
      ObjectDelete(0,"ConteoPips");

if(ObjectFind(0,"ConteoFlecha")==0)
      ObjectDelete(0,"ConteoFlecha");   
      
Comment("");   
}  


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
//--- establecemos las coordenadas del punto de anclaje si todavía no han sido establecidas 
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