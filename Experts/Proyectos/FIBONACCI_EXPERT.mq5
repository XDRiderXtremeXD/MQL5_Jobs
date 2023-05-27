//+------------------------------------------------------------------+
//|                                             FIBONACCI_EXPERT.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

string NAMEFIBO="FIBOEXPERT";

int LunesDay=-1;
double ZigZag[];
MqlRates RATES[];
bool ENTRABUCLE=false;
double EMA[];
color Colorfibo=clrAqua;
bool CHANGEPOINT=false;
int Levels=10;
double ValoresFibo[10]= {0,0.15,0.23,0.382,0.50,0.618,0.786,0.886,1.00,1.382};
double ValoresPriceFibo[10];
bool FIBOUP=false;

input int      InpDepth    =12;
input int      InpDeviation=5;
input int      InpBackstep =3;

int VecesSeguidas=0;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   ArraySetAsSeries(ZigZag,true);
   ArraySetAsSeries(RATES,true);
   ArraySetAsSeries(EMA,true);
//--- create timer

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {



  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   double bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   static datetime TiempoY1=0;
   static double X1=0;
   static datetime  TiempoY2=0;
   static double  X2=0;
   static datetime Tiempo0=0;
//Comment(X1," ",TiempoY1," ",TiempoY2,"  ",X2);

   CopiaEMA(EMA);
   CopiaZIGZAG(ZigZag);
   int copied=CopyRates(NULL,0,0,101,RATES);
   if(copied<=0)
      Print("Fallo al copiar los datos de precios ",GetLastError());

   MqlDateTime TiempoCurrent;
   TimeToStruct(TimeCurrent(),TiempoCurrent);


   if(ENTRABUCLE==false)
     {
      TiempoY1=0;
      X1=0;
      TiempoY2=0;
      X2=0;
      Tiempo0=0;
      int NumerodeFibos=0;

      for(int k=ObjectsTotal(0,0,OBJ_FIBO)-1; k>-1; k--)
        {
         string NameSymbol=ObjectName(0,k,0,OBJ_FIBO);
         if(StringFind(NameSymbol,"FIBOEXPERT",0)!=-1)
           {
            NumerodeFibos++;
           }
        }

      if(TiempoCurrent.day_of_year!=LunesDay && TiempoCurrent.day_of_week==1 && NumerodeFibos==0)
        {
         ENTRABUCLE=true;
         LunesDay=TiempoCurrent.day_of_year;
         Tiempo0=RATES[0].time;
         Comment("ENTROEVALUACION");
        }

      if(NumerodeFibos!=0)
        {
         if(FIBOUP==false)
           {
            if(ask+Point()*10<ValoresPriceFibo[9])
              {
               Comment("CHOCO 138");
               if(VecesSeguidas==0)
                 {
                 Tiempo0=RATES[0].time;
                 VecesSeguidas=1;
                 ENTRABUCLE=true;
                 }
               else if(VecesSeguidas==1)
                 {
                 ObjectDelete(0,NAMEFIBO);
                  Tiempo0=RATES[0].time;
                  VecesSeguidas=0;
                  ENTRABUCLE=true;
                 }
              }
              
              if(bid-Point()*10>ValoresPriceFibo[0]){
              ObjectDelete(0,NAMEFIBO);
              Tiempo0=RATES[0].time;
              VecesSeguidas=0;
              ENTRABUCLE=true;
              
              }
           }
         else
           {
            if(bid-Point()*10>ValoresPriceFibo[9])
              {
               Comment("CHOCO 138");
              }
           }
        }
     }
   else
     {
      DrawFibonacci(ZigZag,Tiempo0,TiempoY2,X2,TiempoY1,X1,RATES,EMA);
      
      if(VecesSeguidas==1 && X1!=0 && TiempoY1!=0){
      
      if( FiboLevelsPointChange(0,NAMEFIBO,0,TiempoY1,X1)){
            ActualizarValoresDeArray();
      }
      //ChartRedraw(); 
      ENTRABUCLE=false;
      }
      if(TiempoY1!=0 && TiempoY2!=0 && X1!=0 && X2!=0 && VecesSeguidas==0)
        {
         if(FiboLevelsCreate(0,NAMEFIBO,0,TiempoY1,X1,TiempoY2,X2,clrAqua,STYLE_SOLID,1,false,
         true,false,true,true,0)               // Prioridad para el clic del ratón
         )
           {
            FiboLevelsSet(10,ValoresFibo,clrAqua,STYLE_SOLID,1,0,NAMEFIBO);
            ActualizarValoresDeArray();
           }
         ENTRABUCLE=false;
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopiaZIGZAG(double &BufferIndicador[])
  {
   int handleIndicador;
   handleIndicador=iCustom(Symbol(),PERIOD_CURRENT,"Examples/ZigZag",InpDepth,InpDeviation,InpBackstep);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleIndicador,0,0,100,BufferIndicador)<0)
     {
      Sleep(5);
     };
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DrawFibonacci(double &BufferZigZag[],datetime Tiempo0,datetime &TiempoY1,double &X1
                   ,datetime &TiempoY2,double &X2,MqlRates &rates[],double &BufferEMA[])
  {
   bool UP;
   Comment(Tiempo0);
   if(rates[2].time==Tiempo0 && X1==0 )
     {
      Print("ENTRA");
      int i=3;
      while(BufferZigZag[i]==0 && i<99)
        {
         i++;
        }
      Print(i);
      X1=BufferZigZag[i];
      TiempoY1=rates[i].time;
      UP=BufferEMA[i]>BufferEMA[i+1]?true:false;
     }

   else
     {
      if(Tiempo0<rates[10].time)
        {
         int i=2;

         while(rates[i].time>Tiempo0 && BufferZigZag[i]==0)
           {
            i++;
           }
         if(UP=true)
           {
            if(BufferZigZag[i]>X1 && BufferZigZag[i]!=0)
              {
               X1=BufferZigZag[i];
               TiempoY1=rates[i].time;
              }
            else
               if(BufferZigZag[i]<X1 && BufferZigZag[i]!=0)
                 {
                  X2=BufferZigZag[i];
                  TiempoY2=rates[i].time;
                 }
           }
         else
           {

            if(BufferZigZag[i]<X1 && BufferZigZag[i]!=0)
              {
               X1=BufferZigZag[i];
               TiempoY1=rates[i].time;
              }
            else
               if(BufferZigZag[i]>X1 && BufferZigZag[i]!=0)
                 {
                  X2=BufferZigZag[i];
                  TiempoY2=rates[i].time;
                 }
           }
        }

     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopiaEMA(double &BufferIndicador[])
  {
   int handleIndicador;
   handleIndicador=iMA(Symbol(),PERIOD_CURRENT,5,0,MODE_SMA,PRICE_CLOSE);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleIndicador,0,0,50,BufferIndicador)<0)
     {
      Sleep(5);
     };
  }
//+------------------------------------------------------------------+
//|                                                                  |
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
                   color           colors,         // color de las líneas del nivel 
                   ENUM_LINE_STYLE styles,         // estilo de las líneas del nivel 
                   int             widths,         // grosor de las líneas del nivel 
                   const long      chart_ID=0,        // ID del gráfico 
                   const string    name="FiboLevels") // nombre del objeto 
  { 
//--- comprobamos los tamaños de los arrays 
   if(levels!=ArraySize(values)) 
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
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELCOLOR,i,colors); 
      //--- estilo del nivel 
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELSTYLE,i,styles); 
      //--- grosor del nivel 
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELWIDTH,i,widths); 
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

void ActualizarValoresDeArray(){
             double Valor1=ObjectGetDouble(0,"FIBOEXPERT",OBJPROP_PRICE,0);
            double Valor2=ObjectGetDouble(0,"FIBOEXPERT",OBJPROP_PRICE,1);
            double Resta=Valor2-Valor1;
            FIBOUP=Resta>=0?false:true;
            for(int i=0; i<Levels; i++)
              {
               ValoresPriceFibo[i]=Valor2-(ObjectGetDouble(0,"FIBOEXPERT",OBJPROP_LEVELVALUE,i)*Resta);
              }
}