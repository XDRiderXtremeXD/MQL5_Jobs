#property description "El script construye el objeto gráfico \"Retrocesos de Fibonacci\"." 
#property description "Las coordenadas de los puntos de anclaje se establecen en por cientos" 
#property description "de las dimensiones de la ventana del gráfico." 
//--- mostramos la ventana de los parámetros de entrada durante el arranque del script 
#property script_show_inputs 
//--- los parámetros de entrada del script 
input string          InpName="FiboLevels";      // Nombre del objeto 
input int             InpDate1=10;               // Fecha del 1-er punto en % 
input int             InpPrice1=65;              // Precio del 1-er punto en % 
input int             InpDate2=90;               // Fecha del 2-do punto en % 
input int             InpPrice2=85;              // Precio del 2-do punto en % 
input color           InpColor=clrRed;           // Color del objeto 
input ENUM_LINE_STYLE InpStyle=STYLE_DASHDOTDOT; // Estilo de la línea 
input int             InpWidth=2;                // Grosor de la línea 
input bool            InpBack=false;             // Objeto al fondo 
input bool            InpSelection=true;         // Seleccionar para mover 
input bool            InpRayLeft=false;          // Continuación del objeto a la izquierda 
input bool            InpRayRight=false;         // Continuación del objeto a la derecha 
input bool            InpHidden=true;            // Ocultar en la lista de objetos 
input long            InpZOrder=0;               // Prioridad para el clic del ratón 
//+------------------------------------------------------------------+ 
//| Crea los "Retrocesos de Fibonacci" según las coordenadas establecidas               | 
//+------------------------------------------------------------------+ 
bool FiboLevelsCreate(const long            chart_ID=0,        // ID del gráfico 
                      const string          name="FiboLevels", // nombre del objeto 
                      const int             sub_window=0,      // número de subventana  
                      datetime              time1=0,           // hora del primer punto 
                      double                price1=0,          // precio del primer punto 
                      datetime              time2=0,           // hora del segundo punto 
                      double                price2=0,          // precio del segundo punto 
                      const color           clr=clrRed,        // color del objeto 
                      const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de las líneas del objeto 
                      const int             width=1,           // grosor de las líneas del objeto 
                      const bool            back=false,        // al fondo 
                      const bool            selection=true,    // seleccionar para mover 
                      const bool            ray_left=false,    // continuación del objeto a la izquierda 
                      const bool            ray_right=false,   // continuación del objeto a la derecha 
                      const bool            hidden=true,       // ocultar en la lista de objetos 
                      const long            z_order=0)         // prioridad para el clic del ratón 
  { 
//--- establecemos las coordenadas de los puntos de anclaje si todavía no han sido establecidas 
   ChangeFiboLevelsEmptyPoints(time1,price1,time2,price2); 
//--- anulamos el valor del error 
   ResetLastError(); 
//--- creamos los "Retrocesos de Fibonacci" según las coordenadas establecidas 
   if(!ObjectCreate(chart_ID,name,OBJ_FIBO,sub_window,time1,price1,time2,price2)) 
     { 
      Print(__FUNCTION__, 
            ": ¡Falo al crear los \"Retrocesos de Fibonacci\"! Código del error = ",GetLastError()); 
      return(false); 
     } 
//--- establecemos el color 
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr); 
//--- establecemos el estilo de la línea 
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style); 
//--- establecemos el grosor de la línea 
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width); 
//--- mostramos en el primer plano (false) o al fondo (true) 
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back); 
//--- activar (true) o desactivar (false) el modo de selección del objeto para mover 
//--- cuando el objeto gráfico se crea usando la función ObjectCreate, por defecto el objeto 
//--- no se puede seleccionar y mover. Mientras que dentro de este método el parámetro selection 
//--- por defecto es igual a true, lo que permite seleccionar y mover este objeto 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection); 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection); 
//--- activamos (true) o desactivamos (false) el modo de continuación del objeto a la izquierda 
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_LEFT,ray_left); 
//--- activamos (true) o desactivamos (false) el modo de continuación del objeto a la derecha 
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right); 
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos 
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden); 
//--- establecemos la prioridad para obtener el evento de cliquear con el ratón sobre el gráfico 
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order); 
//--- ejecución con éxito 
   return(true); 
  } 
//+------------------------------------------------------------------+ 
//| Establece el número de los niveles y sus parámetros           | 
//+------------------------------------------------------------------+ 
bool FiboLevelsSet(int             levels,            // número de las líneas del nivel 
                   double          &values[],         // valores de las líneas del nivel 
                   color           &colors[],         // color de las líneas del nivel 
                   ENUM_LINE_STYLE &styles[],         // estilo de las líneas del nivel 
                   int             &widths[],         // grosor de las líneas del nivel 
                   const long      chart_ID=0,        // ID del gráfico 
                   const string    name="FiboLevels") // nombre del objeto 
  { 
//--- comprobamos los tamaños de los arrays 
   if(levels!=ArraySize(colors) || levels!=ArraySize(styles) || 
      levels!=ArraySize(widths) || levels!=ArraySize(widths)) 
     { 
      Print(__FUNCTION__,": ¡Error. La longitud del array no corresponde al número de los niveles!"); 
      return(false); 
     } 
//--- establecemos el número de los niveles 
   ObjectSetInteger(chart_ID,name,OBJPROP_LEVELS,levels); 
//--- establecemos las propiedades de los niveles en el ciclo 
   for(int i=0;i<levels;i++) 
     { 
      //--- valor del nivel 
      ObjectSetDouble(chart_ID,name,OBJPROP_LEVELVALUE,i,values[i]); 
      //--- color del nivel 
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELCOLOR,i,colors[i]); 
      //--- estilo del nivel 
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELSTYLE,i,styles[i]); 
      //--- grosor del nivel 
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELWIDTH,i,widths[i]); 
      //--- descripción del nivel 
      ObjectSetString(chart_ID,name,OBJPROP_LEVELTEXT,i,DoubleToString(100*values[i],1)); 
     } 
//--- ejecución con éxito 
   return(true); 
  } 
//+------------------------------------------------------------------+ 
//| Mueve el punto de anclaje de los "Retrocesos de Fibonacci"                    | 
//+------------------------------------------------------------------+ 
bool FiboLevelsPointChange(const long   chart_ID=0,        // ID del gráfico 
                           const string name="FiboLevels", // nombre del objeto 
                           const int    point_index=0,     // número del punto de anclaje 
                           datetime     time=0,            // coordenada del tiempo del punto de anclaje 
                           double       price=0)           // coordenada del precio del punto de anclaje 
  { 
//--- si las coordenadas del punto de anclaje no han sido establecidas, lo movemos a la barra actual con el precio Bid 
   if(!time) 
      time=TimeCurrent(); 
   if(!price) 
      price=SymbolInfoDouble(Symbol(),SYMBOL_BID); 
//--- anulamos el valor del error 
   ResetLastError(); 
//--- movemos el punto de anclaje 
   if(!ObjectMove(chart_ID,name,point_index,time,price)) 
     { 
      Print(__FUNCTION__, 
            ": ¡Fallo al mover el punto de anclaje! Código del error = ",GetLastError()); 
      return(false); 
     } 
//--- ejecución con éxito 
   return(true); 
  } 
//+------------------------------------------------------------------+ 
//| Elimina los "Retrocesos de Fibonacci"                                       | 
//+------------------------------------------------------------------+ 
bool FiboLevelsDelete(const long   chart_ID=0,        // ID del gráfico 
                      const string name="FiboLevels") // nombre del objeto 
  { 
//--- anulamos el valor del error 
   ResetLastError(); 
//--- eliminamos el objeto 
   if(!ObjectDelete(chart_ID,name)) 
     { 
      Print(__FUNCTION__, 
            ": ¡Falo al eliminar los \"Retrocesos de Fibonacci\"! Código del error = ",GetLastError()); 
      return(false); 
     } 
//--- ejecución con éxito 
   return(true); 
  } 
//+------------------------------------------------------------------+ 
//| //| Comprueba los valores de los puntos de anclaje de los "Retrocesos de Fibonacci" y para     | 
//| los valores vacíos establece los valores por defecto              | 
//+------------------------------------------------------------------+ 
void ChangeFiboLevelsEmptyPoints(datetime &time1,double &price1, 
                                 datetime &time2,double &price2) 
  { 
//--- si la hora del segundo punto no ha sido establecida, se colocará en la barra actual 
   if(!time2) 
      time2=TimeCurrent(); 
//--- si el precio del segundo punto no ha sido establecido, tendrá el valor Bid 
   if(!price2) 
      price2=SymbolInfoDouble(Symbol(),SYMBOL_BID); 
//--- si la hora del primer punto no ha sido establecida, se colocará a 9 barras a la izquierda del segundo 
   if(!time1) 
     { 
      //--- array para recibir la hora de apertura de las últimas 10 barras 
      datetime temp[10]; 
      CopyTime(Symbol(),Period(),time2,10,temp); 
      //--- colocamos el primer punto a 9 barras a la izquierda del segundo 
      time1=temp[0]; 
     } 
//--- si el precio del primer punto no ha sido establecido, lo moveremos a 200 puntos por debajo del segundo punto 
   if(!price1) 
      price1=price2-200*SymbolInfoDouble(Symbol(),SYMBOL_POINT); 
  } 
//+------------------------------------------------------------------+ 
//| Script program start function                                    | 
//+------------------------------------------------------------------+ 
void OnStart() 
  { 
//--- comprobamos si los parámetros de entrada son correctos 
   if(InpDate1<0 || InpDate1>100 || InpPrice1<0 || InpPrice1>100 ||  
      InpDate2<0 || InpDate2>100 || InpPrice2<0 || InpPrice2>100) 
     { 
      Print("¡Error. Los parámetros de entrada no son correctos!"); 
      return; 
     } 
//--- número de barras visibles en la ventana del gráfico 
   int bars=(int)ChartGetInteger(0,CHART_VISIBLE_BARS); 
//--- tamaño del array price 
   int accuracy=1000; 
//--- arrays para guardar los valores de las fechas y precios que van a utilizarse 
//--- para establecer y modificar las coordenadas de los puntos de anclaje de los "Retrocesos de Fibonacci" 
   datetime date[]; 
   double   price[]; 
//--- asignación de la memoria 
   ArrayResize(date,bars); 
   ArrayResize(price,accuracy); 
//--- llenamos el array de datos 
   ResetLastError(); 
   if(CopyTime(Symbol(),Period(),0,bars,date)==-1) 
     { 
      Print("¡Fallo al copiar el valor de la hora! Código del error = ",GetLastError()); 
      return; 
     } 
//--- llenamos el array de precios 
//--- encontramos el valor máximo y mínimo del gráfico 
   double max_price=ChartGetDouble(0,CHART_PRICE_MAX); 
   double min_price=ChartGetDouble(0,CHART_PRICE_MIN); 
//--- determinamos el paso del cambio del precio y llenamos el array 
   double step=(max_price-min_price)/accuracy; 
   for(int i=0;i<accuracy;i++) 
      price[i]=min_price+i*step; 
//--- definimos los puntos para trazar los "Retrocesos de Fibonacci" 
   int d1=InpDate1*(bars-1)/100; 
   int d2=InpDate2*(bars-1)/100; 
   int p1=InpPrice1*(accuracy-1)/100; 
   int p2=InpPrice2*(accuracy-1)/100; 
//--- creamos el objeto 
   if(!FiboLevelsCreate(0,InpName,0,date[d1],price[p1],date[d2],price[p2],InpColor, 
      InpStyle,InpWidth,InpBack,InpSelection,InpRayLeft,InpRayRight,InpHidden,InpZOrder)) 
     { 
      return; 
     } 
//--- redibujamos el gráfico y esperamos 1 segundo 
   ChartRedraw(); 
   Sleep(1000); 
//--- ahora vamos a mover los puntos de anclaje 
//--- contador del ciclo 
   int v_steps=accuracy*2/5; 
//--- movemos el primer punto de anclaje 
   for(int i=0;i<v_steps;i++) 
     { 
      //--- cogemos el siguiente valor 
      if(p1>1) 
         p1-=1; 
      //--- movemos el punto 
      if(!FiboLevelsPointChange(0,InpName,0,date[d1],price[p1])) 
         return; 
      //--- comprobamos si el trabajo del script ha sido finalizado forzosamente 
      if(IsStopped()) 
         return; 
      //--- redibujamos el gráfico 
      ChartRedraw(); 
     } 
//--- retardo de 1 segundo 
   Sleep(1000); 
//--- contador del ciclo 
   v_steps=accuracy*4/5; 
//--- movemos el segundo punto de anclaje 
   for(int i=0;i<v_steps;i++) 
     { 
      //--- cogemos el siguiente valor 
      if(p2>1) 
         p2-=1; 
      //--- movemos el punto 
      if(!FiboLevelsPointChange(0,InpName,1,date[d2],price[p2])) 
         return; 
      //--- comprobamos si el trabajo del script ha sido finalizado forzosamente 
      if(IsStopped()) 
         return; 
      //--- redibujamos el gráfico 
      ChartRedraw(); 
     } 
//--- retardo de 1 segundo 
   Sleep(1000); 
//--- eliminamos el objeto desde el gráfico 
   FiboLevelsDelete(0,InpName); 
   ChartRedraw(); 
//--- retardo de 1 segundo 
   Sleep(1000); }
//--- 