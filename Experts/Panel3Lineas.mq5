//+------------------------------------------------------------------+
//|                                                 Panel3Lineas.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
#include<Trade\Trade.mqh>
CTrade trade;

int Des_X=7;
int Des_Y=7;

input string Letra_ejecucion="Y";//Letra Ejecucion en Mayuscula
input int Stop_Loss_Default=60;
input bool Modificar_Stop=true;//Permitir Modificar Stop
input bool Panel_Detras_Grafico=true;//Panel detras del grafico
input bool Pedir_Confirmacion=true;//Pedir confirmacion para trade
input string S4="------------Configuracion Cuadro------------";//*--------------------------------------------------------------
input int Cuadro_X_Point=10;
input int Cuadro_Y_Point=10;
input int Grosor_Cuadro=250;
input int Altura_Cuadro=200;
input color clrSeleccion=clrMaroon;
input string S5="------------Configuracion Lineas------------";//*--------------------------------------------------------------
input color clrSL=clrRed;//Color Linea StopLoss
input color clrPO=clrDodgerBlue;//Color Linea Precio Actual
input color clrTP=clrSeaGreen;//Color Linea Take Profit
input int Grosor_Linea=2;
input ENUM_LINE_STYLE Estilo_Linea=STYLE_SOLID;

string Cuadro="Cuadro Panel 2023";

struct ObjetosPanel
  {
   int               XDistance;
   int               YDistance;
   string            Nombre;
  };


struct ValoresPanel
  {
   bool              IsMin;
   int               StopPerdida;
   bool              Auto;
   bool              IsShow;
   bool              IsInst;
   int               Point_X;
   int               Point_Y;
  };

enum indicesPanel
  {
   Contenedor,
   Edit,
   MinMax,
   Inst,
   Pend,
   Show,
   Auto
  };

ObjetosPanel Objetos[7];
ValoresPanel Valores;

string Linea="LINEAS STOP LIMIT";
string LINEAOP=Linea+" OP";
string LINEASL=Linea+" SL";
string LINEATP=Linea+" TP";

string InpDirectoryName="Carpeta_Panel_Lineas";

uchar letraEjecucion=0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(StringLen(Letra_ejecucion)!=1)
     {
      Alert("La letra ejecucion debe ser 1 letra o numero");
      return INIT_PARAMETERS_INCORRECT;
     }

   letraEjecucion=StringGetCharacter(Letra_ejecucion,0);

   Valores.IsMin=false;
   Valores.StopPerdida=Stop_Loss_Default;
   Valores.Auto=!Pedir_Confirmacion;
   Valores.IsShow=true;
   Valores.IsInst=false;
   Valores.Point_X=Cuadro_X_Point;
   Valores.Point_Y=Cuadro_Y_Point;

   LoadParameters();

   CrearPanel(Valores.Point_X,Valores.Point_Y);
   Crear_Actualizar_Lineas();
//CrearPanelMin(Cuadro_X_Point,Cuadro_Y_Point);
   ChartSetInteger(0,CHART_EVENT_MOUSE_MOVE,true);
   ChartRedraw();
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,Cuadro,0,-1);
   SaveParameters(reason);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // identificador de evento
                  const long& lparam,   // parámetro de evento del tipo long
                  const double& dparam, // parámetro de evento del tipo double
                  const string& sparam  // parámetro de evento del tipo string
                 )
  {
   static int XPanelPoint=0;
   static int YPanelPoint=0;
   static int XPanelSize=0;
   static int YPanelSize=0;
   static int XPointInicio=0;
   static int YPointInicio=0;
   static bool Mover=false;
   static datetime tiempoPausaMin=TimeLocal();


   if(id==0)
     {
      if(Valores.IsShow)
         if(lparam==letraEjecucion)
           {
            if(Valores.Auto || MessageBox("Desea Poner operacion?","Confirmacion Operacion",MB_OKCANCEL)==IDOK)
               if(GestionarLineas())
                 {
                  Valores.IsShow=false;
                  ObjectSetString(0,Objetos[Show].Nombre,OBJPROP_TEXT,Valores.IsShow?"HIDE":"SHOW");
                  ObjectSetInteger(0,Objetos[Show].Nombre,OBJPROP_STATE,Valores.IsShow);
                  Crear_Actualizar_Lineas();
                 }
           }
     }




   if(Mover==false)
     {
      if(id==10 && sparam=="1"
         && ObjectGetInteger(0,Objetos[MinMax].Nombre,OBJPROP_XDISTANCE,0)<=lparam &&
         (ObjectGetInteger(0,Objetos[MinMax].Nombre,OBJPROP_XDISTANCE,0)+ObjectGetInteger(0,Objetos[2].Nombre,OBJPROP_XSIZE,0))>=lparam
         && ObjectGetInteger(0,Objetos[MinMax].Nombre,OBJPROP_YDISTANCE,0)<=dparam &&
         (ObjectGetInteger(0,Objetos[MinMax].Nombre,OBJPROP_YDISTANCE,0)+ObjectGetInteger(0,Objetos[2].Nombre,OBJPROP_YSIZE,0))>=dparam
        )
        {
         XPanelPoint=ObjectGetInteger(0,Objetos[Contenedor].Nombre,OBJPROP_XDISTANCE,0);
         YPanelPoint=ObjectGetInteger(0,Objetos[Contenedor].Nombre,OBJPROP_YDISTANCE,0);
         XPanelSize=ObjectGetInteger(0,Objetos[Contenedor].Nombre,OBJPROP_XSIZE,0);
         YPanelSize=ObjectGetInteger(0,Objetos[Contenedor].Nombre,OBJPROP_YSIZE,0);
         XPointInicio=lparam;
         YPointInicio=dparam;
         Mover=true;
         ChartSetInteger(0,CHART_MOUSE_SCROLL,false);
        }
      else
        {
         ChartSetInteger(0,CHART_MOUSE_SCROLL,true);
        }
     }
   else
     {
      if(sparam=="0")
        {
         SetDistances();
         ChartSetInteger(0,CHART_MOUSE_SCROLL,true);
         Mover=false;
        }
      else
        {
         if((lparam-XPointInicio)!=0)
            tiempoPausaMin=TimeLocal();
         if((dparam-YPointInicio)!=0)
            tiempoPausaMin=TimeLocal();
         int XPoint=XPanelPoint+(lparam-XPointInicio);
         int YPoint=YPanelPoint+(dparam-YPointInicio);
         MoverPanel(XPoint<0?(-XPanelPoint):(XPoint+XPanelSize>ChartGetInteger(0,CHART_WIDTH_IN_PIXELS)?(ChartGetInteger(0,CHART_WIDTH_IN_PIXELS)-XPanelPoint-XPanelSize):(lparam-XPointInicio)),
                    YPoint<0?-YPanelPoint:(YPoint+YPanelSize>ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS)?(ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS)-YPanelPoint-YPanelSize):(dparam-YPointInicio)));

         Valores.Point_X=ObjectGetInteger(0,Objetos[Contenedor].Nombre,OBJPROP_XDISTANCE,0);
         Valores.Point_Y=ObjectGetInteger(0,Objetos[Contenedor].Nombre,OBJPROP_YDISTANCE,0);
         ChartRedraw();
        }
     }

   if(tiempoPausaMin<TimeLocal())
      if(id==CHARTEVENT_OBJECT_CLICK)
        {
         string clickedChartObject=sparam;
         //--- si hacemos clic en el objeto con el nombre buttonID
         if(ObjectGetInteger(0,clickedChartObject,OBJPROP_TYPE,0)==OBJ_BUTTON)
           {
            //--- estado del botón - está apretado o no
            bool selected=ObjectGetInteger(0,clickedChartObject,OBJPROP_STATE);
            //--- registramos el mensaje de la depuración
            for(int i=0; i<7; i++)
              {
               if(Objetos[i].Nombre==clickedChartObject)
                 {
                  if(i==MinMax)
                    {
                     ObjectsDeleteAll(0,Cuadro,0,-1);
                     Valores.IsMin=selected;
                     CrearPanel(Objetos[Contenedor].XDistance,Objetos[Contenedor].YDistance);
                    }
                  if(i==Show)
                    {
                     Valores.IsShow=selected;
                     ObjectSetString(0,Objetos[i].Nombre,OBJPROP_TEXT,Valores.IsShow?"HIDE":"SHOW");
                     Crear_Actualizar_Lineas();
                    }
                  if(i==Pend || i==Inst)
                    {
                     Valores.IsInst=(i==Inst)?(selected):!selected;

                     ObjectSetInteger(0,Objetos[Pend].Nombre,OBJPROP_STATE,!Valores.IsInst);
                     ObjectSetInteger(0,Objetos[Pend].Nombre,OBJPROP_BGCOLOR,!Valores.IsInst?clrSeleccion:clrBlack);

                     ObjectSetInteger(0,Objetos[Inst].Nombre,OBJPROP_STATE,Valores.IsInst);
                     ObjectSetInteger(0,Objetos[Inst].Nombre,OBJPROP_BGCOLOR,Valores.IsInst?clrSeleccion:clrBlack);
                     Crear_Actualizar_Lineas();
                    }
                  ChartRedraw();
                 }
              }
           }
        }

   if(id==3)
     {
      string clickedChartObject=sparam;
      //--- si hacemos clic en el objeto con el nombre buttonID
      if(ObjectGetInteger(0,clickedChartObject,OBJPROP_TYPE,0)==OBJ_EDIT)
        {
         if(Objetos[Edit].Nombre==clickedChartObject)
           {
            string texto=ObjectGetString(0,clickedChartObject,OBJPROP_TEXT,0);
            if(texto!=IntegerToString(Valores.StopPerdida))
              {
               if(IsInteger(texto))
                 {
                  if(MessageBox("Deseas cambiar la cantidad de Perdida?","Confirmacion cambio",MB_OKCANCEL)==IDOK)
                     Valores.StopPerdida=StringToInteger(texto);
                  else
                     ObjectSetString(0,clickedChartObject,OBJPROP_TEXT,IntegerToString(Valores.StopPerdida));
                 }
               else
                  ObjectSetString(0,clickedChartObject,OBJPROP_TEXT,IntegerToString(Valores.StopPerdida));
              }
            ChartRedraw();
           }
        }
     }

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SacarDimensiones(int Zona,int &Porcentaje[],int &Inicio[],int &Final[],int Divisiones,int espacio,int point,int desfase)
  {
   if(ArraySize(Porcentaje)<Divisiones)
     {
      Alert("Los porcentajes del arreglo debe ser mayor o igual a las divisiones");
      return false;
     }
   ArrayResize(Inicio,Divisiones);
   ArrayResize(Final,Divisiones);

   int ini=point+desfase;
   for(int i=0; i<Divisiones; i++)
     {
      Inicio[i]=ini;
      Final[i]=ini-(i>0?espacio:0)+int((Zona*Porcentaje[i]/100.0)-(i<Divisiones-1?espacio:0));
      ini=Final[i]+espacio*2;
     }

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ButtonCreate(const long              chart_ID=0,               // ID del gráfico
                  const string            name="Button",            // nombre del botón
                  const int               sub_window=0,             // número de subventana
                  const int               x=0,                      // coordenada por el eje X
                  const int               y=0,                      // coordenada por el eje Y
                  const int               width=50,                 // ancho del botón
                  const int               height=18,                // alto del botón
                  const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace
                  const string            text="Button",            // texto
                  const string            font="Arial",             // fuente
                  const int               font_size=10,             // tamaño de la fuente
                  const color             clr=clrBlack,             // color del texto
                  const color             back_clr=C'236,233,216',  // color del fondo
                  const color             border_clr=clrNONE,       // color del borde
                  const bool              state=false,              // pulsado/no pulsado
                  const bool              back=false,               // al fondo
                  const bool              selection=false,          // seleccionar para mover
                  const bool              hidden=true,              // ocultar en la lista de objetos
                  const long              z_order=0)                //prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos el botón
   if(!ObjectCreate(chart_ID,name,OBJ_BUTTON,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear el botón! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos las coordenadas del botón
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- establecemos el tamaño del botón
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del punto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- ponemos el texto
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- establecemos la fuente del texto
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- establecemos el tamaño del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- establecemos el color del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el color del fondo
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- establecemos el color del borde
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- set button state
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
//--- activar (true) o desactivar (false) el modo de desplazamiento del botón con ratón
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
//|                                                                  |
//+------------------------------------------------------------------+
bool EditCreate(const long             chart_ID=0,               // ID del gráfico
                const string           name="Edit",              // nombre del objeto
                const int              sub_window=0,             // número de subventana
                const int              x=0,                      // coordenada por el eje X
                const int              y=0,                      // coordenada por el eje Y
                const int              width=50,                 // ancho
                const int              height=18,                // alto
                const string           text="Text",              // texto
                const string           font="Arial",             // fuente
                const int              font_size=10,             // tamaño de la fuente
                const ENUM_ALIGN_MODE  align=ALIGN_CENTER,       // modo de alineación
                const bool             read_only=false,          // posibilidad de edición
                const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace
                const color            clr=clrBlack,             // color del texto
                const color            back_clr=clrWhite,        // color del fondo
                const color            border_clr=clrNONE,       // color del borde
                const bool             back=false,               // al fondo
                const bool             selection=false,          // seleccionar para mover
                const bool             hidden=true,              // ocultar en la lista de objetos
                const long             z_order=0)                // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos el campo de edición
   if(!ObjectCreate(chart_ID,name,OBJ_EDIT,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear el objeto \"Campo de edición\"! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos las coordenadas del objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- establecemos el tamaño del objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- ponemos el texto
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- establecemos la fuente del texto
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- establecemos el tamaño del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- establecemos el modo de alineación del texto dentro del objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_ALIGN,align);
//--- ponemos (true) o cancelamos (false) el modo sólo para lectura
   ObjectSetInteger(chart_ID,name,OBJPROP_READONLY,read_only);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- establecemos el color del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el color del fondo
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- establecemos el color del borde
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de desplazamiento de la etiqueta con ratón
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
bool RectLabelCreate(const long             chart_ID=0,               // ID del gráfico
                     const string           name="RectLabel",         // nombre de la etiqueta
                     const int              sub_window=0,             // número de subventana
                     const int              x=0,                      // coordenada por el eje X
                     const int              y=0,                      // coordenada por el eje Y
                     const int              width=50,                 // ancho
                     const int              height=18,                // alto
                     const color            back_clr=C'236,233,216',  // color del fondo
                     const ENUM_BORDER_TYPE border=BORDER_SUNKEN,     // tipo del borde
                     const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace
                     const color            clr=clrRed,               // color del contorno plano (Flat)
                     const ENUM_LINE_STYLE  style=STYLE_SOLID,        // estilo del contorno plano
                     const int              line_width=1,             // grosor del contorno plano
                     const bool             back=false,               // al fondo
                     const bool             selection=false,          // seleccionar para mover
                     const bool             hidden=true,              // ocultar en la lista de objetos
                     const long             z_order=0)                // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la etiqueta rectangular
   if(!ObjectCreate(chart_ID,name,OBJ_RECTANGLE_LABEL,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la etiqueta rectangular! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos las coordenadas de la etiqueta
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- establecemos las dimensiones de la etiqueta
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- establecemos el color del fondo
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- establecemos el tipo del borde
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_TYPE,border);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del punto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- establecemos el color del contorno plano (en modo Flat)
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el estilo de las líneas del contorno plano
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- establecemos el grosor del contorno plano
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,line_width);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de desplazamiento de la etiqueta con ratón
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
//|                                                                  |
//+------------------------------------------------------------------+
void CrearPanel(int X_Point,int Y_Point)
  {
   if(!Valores.IsMin)
     {
      X_Point=MathMin(X_Point,ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0)-Grosor_Cuadro);
      Y_Point=MathMin(Y_Point,ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0)-Altura_Cuadro);
      ///////////////// CONTENEDOR
      Objetos[0].Nombre=Cuadro+"Contenedor";
      RectLabelCreate(0,Objetos[0].Nombre,0,X_Point,Y_Point,Grosor_Cuadro,Altura_Cuadro,clrBlack,BORDER_SUNKEN,CORNER_LEFT_UPPER,clrOrange,STYLE_SOLID,2,Panel_Detras_Grafico,false,true,10);
      Objetos[0].XDistance=X_Point;
      Objetos[0].YDistance=Y_Point;
      //////////////////////////////////////

      int ZonaX=Grosor_Cuadro-2*Des_X;
      int ZonaY=Altura_Cuadro-2*Des_Y;

      int InicioX[];
      int FinalX[];

      int porcentajes[2]= {65,35};
      SacarDimensiones(ZonaX,porcentajes,InicioX,FinalX,2,3,X_Point,Des_X);

      int InicioY[];
      int FinalY[];
      int porcentajes2[2]= {50,50};
      SacarDimensiones(ZonaY,porcentajes2,InicioY,FinalY,2,3,Y_Point,Des_Y);

      ///////////////// EDIT PERDIDA
      Objetos[1].Nombre=Cuadro+"Edit Perdida";
      if(ObjectFind(0,Objetos[1].Nombre)!=0)
         EditCreate(0,Objetos[1].Nombre,0,InicioX[0],InicioY[0],FinalX[0]-InicioX[0],FinalY[0]-InicioY[0],Valores.StopPerdida,"Arial",32,ALIGN_CENTER,!Modificar_Stop,CORNER_LEFT_UPPER,clrOrange,clrBlack,clrWhite,Panel_Detras_Grafico,false,true,10);
      else
        {
         ObjectSetInteger(0,Objetos[1].Nombre,OBJPROP_XDISTANCE,InicioX[0]);
         ObjectSetInteger(0,Objetos[1].Nombre,OBJPROP_YDISTANCE,InicioY[0]);
        }
      Objetos[1].XDistance=InicioX[0];
      Objetos[1].YDistance=InicioY[0];

      ///////////////// MINMAX
      Objetos[2].Nombre=Cuadro+"MinMax";
      if(ObjectFind(0,Objetos[2].Nombre)!=0)
         ButtonCreate(0,Objetos[2].Nombre,0,InicioX[1],InicioY[0],FinalX[1]-InicioX[1],FinalY[0]-InicioY[0],CORNER_LEFT_UPPER,"─","Arial",32,clrOrange,clrBlack,clrWhite,false,Panel_Detras_Grafico,false,true,10);
      else
        {
         ObjectSetInteger(0,Objetos[2].Nombre,OBJPROP_XDISTANCE,InicioX[1]);
         ObjectSetInteger(0,Objetos[2].Nombre,OBJPROP_YDISTANCE,InicioY[0]);
        }
      Objetos[2].XDistance=InicioX[1];
      Objetos[2].YDistance=InicioY[0];
      ///////////////////////////////////

      porcentajes[0]=50;
      porcentajes[1]=50;
      SacarDimensiones(ZonaX,porcentajes,InicioX,FinalX,2,3,X_Point,Des_X);

      int InicioY2[];
      int FinalY2[];
      int porcentajes3[2]= {50,50};
      SacarDimensiones(FinalY[1]-InicioY[1],porcentajes3,InicioY2,FinalY2,2,3,0,0);

      ///////////////// INST
      Objetos[3].Nombre=Cuadro+"Inst";
      if(ObjectFind(0,Objetos[3].Nombre)!=0)
         ButtonCreate(0,Objetos[3].Nombre,0,InicioX[0],InicioY[1]+InicioY2[0],FinalX[0]-InicioX[0],FinalY2[0]-InicioY2[0],CORNER_LEFT_UPPER,"INST","Arial",18,clrOrange,Valores.IsInst?clrSeleccion:clrBlack,clrWhite,Valores.IsInst,Panel_Detras_Grafico,false,true,10);
      else
        {
         ObjectSetInteger(0,Objetos[3].Nombre,OBJPROP_XDISTANCE,InicioX[0]);
         ObjectSetInteger(0,Objetos[3].Nombre,OBJPROP_YDISTANCE,InicioY[1]+InicioY2[0]);
        }
      Objetos[3].XDistance=InicioX[0];
      Objetos[3].YDistance=InicioY[1]+InicioY2[0];


      ///////////////// PEND
      Objetos[4].Nombre=Cuadro+"Pend";
      if(ObjectFind(0,Objetos[4].Nombre)!=0)
         ButtonCreate(0,Objetos[4].Nombre,0,InicioX[0],InicioY[1]+InicioY2[1],FinalX[0]-InicioX[0],FinalY2[1]-InicioY2[1],CORNER_LEFT_UPPER,"PEND","Arial",18,clrOrange,!Valores.IsInst?clrSeleccion:clrBlack,clrWhite,!Valores.IsInst,Panel_Detras_Grafico,false,true,10);
      else
        {
         ObjectSetInteger(0,Objetos[4].Nombre,OBJPROP_XDISTANCE,InicioX[0]);
         ObjectSetInteger(0,Objetos[4].Nombre,OBJPROP_YDISTANCE,InicioY[1]+InicioY2[1]);
        }
      Objetos[4].XDistance=InicioX[0];
      Objetos[4].YDistance=InicioY[1]+InicioY2[1];


      ///////////////// SHOW
      Objetos[5].Nombre=Cuadro+"Show";
      if(ObjectFind(0,Objetos[5].Nombre)!=0)
         ButtonCreate(0,Objetos[5].Nombre,0,InicioX[1],InicioY[1],FinalX[1]-InicioX[1],FinalY[1]-InicioY[1],CORNER_LEFT_UPPER,Valores.IsShow?"HIDE":"SHOW","Arial",18,clrOrange,clrBlack,clrWhite,Valores.IsShow,Panel_Detras_Grafico,false,true,10);
      else
        {
         ObjectSetInteger(0,Objetos[5].Nombre,OBJPROP_XDISTANCE,InicioX[1]);
         ObjectSetInteger(0,Objetos[5].Nombre,OBJPROP_YDISTANCE,InicioY[1]);
        }
      Objetos[5].XDistance=InicioX[1];
      Objetos[5].YDistance=InicioY[1];
     }
   else
     {
      int ContendorMinX=(35/100.0)*Grosor_Cuadro;
      int ContendorMinY=(40/100.0)*Altura_Cuadro;
      ///////////////// CONTENEDOR
      Objetos[0].Nombre=Cuadro+"Contenedor";
      RectLabelCreate(0,Objetos[0].Nombre,0,X_Point,Y_Point,ContendorMinX,ContendorMinY,clrBlack,BORDER_SUNKEN,CORNER_LEFT_UPPER,clrOrange,STYLE_SOLID,2,Panel_Detras_Grafico,false,true,10);
      Objetos[0].XDistance=X_Point;
      Objetos[0].YDistance=Y_Point;
      //////////////////////////////////////

      int ZonaX=ContendorMinX-2*Des_X;
      int ZonaY=ContendorMinY-2*Des_Y;

      int InicioX[];
      int FinalX[];

      int porcentajes[1]= {100};
      SacarDimensiones(ZonaX,porcentajes,InicioX,FinalX,1,3,X_Point,Des_X);

      int InicioY[];
      int FinalY[];
      int porcentajes2[1]= {100};
      SacarDimensiones(ZonaY,porcentajes2,InicioY,FinalY,1,3,Y_Point,Des_Y);

      ///////////////// MINMAX
      Objetos[2].Nombre=Cuadro+"MinMax";
      if(ObjectFind(0,Objetos[2].Nombre)!=0)
         ButtonCreate(0,Objetos[2].Nombre,0,InicioX[0],InicioY[0],FinalX[0]-InicioX[0],FinalY[0]-InicioY[0],CORNER_LEFT_UPPER,"█","Arial",32,clrOrange,clrBlack,clrWhite,true,Panel_Detras_Grafico,false,true,10);
      else
        {
         ObjectSetInteger(0,Objetos[2].Nombre,OBJPROP_XDISTANCE,InicioX[1]);
         ObjectSetInteger(0,Objetos[2].Nombre,OBJPROP_YDISTANCE,InicioY[0]);
        }
      Objetos[2].XDistance=InicioX[0];
      Objetos[2].YDistance=InicioY[0];
      ///////////////////////////////////
     }

   ChartRedraw();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void MoverPanel(int X_PointPlus,int Y_PointPlus)
  {
   for(int i=0; i<7; i++)
     {
      if(ObjectFind(0,Objetos[i].Nombre)==0)
        {
         ObjectSetInteger(0,Objetos[i].Nombre,OBJPROP_XDISTANCE,Objetos[i].XDistance+X_PointPlus);
         ObjectSetInteger(0,Objetos[i].Nombre,OBJPROP_YDISTANCE,Objetos[i].YDistance+Y_PointPlus);
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetDistances()
  {
   for(int i=0; i<7; i++)
     {
      if(ObjectFind(0,Objetos[i].Nombre)==0)
        {
         Objetos[i].XDistance=ObjectGetInteger(0,Objetos[i].Nombre,OBJPROP_XDISTANCE,0);
         Objetos[i].YDistance=ObjectGetInteger(0,Objetos[i].Nombre,OBJPROP_YDISTANCE,0);
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsInteger(string str)
  {
   string   s = str;

   for(int length=StringLen(str)-1; length>=0; length--)
     {
      int char_ = StringGetCharacter(s, length);
      if(!(char_ > 47 && char_ < 58))
         return false;
     }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Crear_Actualizar_Lineas()
  {
   int TP_=0;
   int SL_=0;

   double PrecioStep=(ChartGetDouble(0,CHART_PRICE_MAX,0)-ChartGetDouble(0,CHART_PRICE_MIN,0));
   double PrecioStep1=PrecioStep/30;
   double PrecioStep2=PrecioStep/15;

   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double TP=Bid+PrecioStep1+PrecioStep2; //SE ESTABLECE EL TP
   double SL=Bid-PrecioStep1+PrecioStep2; //SE ESTABLECE EL SL

   if(!Valores.IsInst==true)
     {
      if(ObjectFind(0,LINEAOP)!=0)
         HLineCreate(0,LINEAOP,0,Bid+PrecioStep2,Valores.IsShow?clrPO:clrNONE,Estilo_Linea,Grosor_Linea,false,true,true,30);
      else
        {
         ObjectSetDouble(0,LINEAOP,OBJPROP_PRICE,0,Bid+PrecioStep2);
         ObjectSetInteger(0,LINEAOP,OBJPROP_COLOR,Valores.IsShow?clrPO:clrNONE);
        }
     }
   else
     {
      if(ObjectFind(0,LINEAOP)==0)
         ObjectDelete(0,LINEAOP);
     }

   if(ObjectFind(0,LINEASL)!=0)
      HLineCreate(0,LINEASL,0,SL,Valores.IsShow?clrSL:clrNONE,Estilo_Linea,Grosor_Linea,false,true,true,30);
   else
     {
      ObjectSetDouble(0,LINEASL,OBJPROP_PRICE,0,SL);
      ObjectSetInteger(0,LINEASL,OBJPROP_COLOR,Valores.IsShow?clrSL:clrNONE);
     }

   if(ObjectFind(0,LINEATP)!=0)
      HLineCreate(0,LINEATP,0,TP,Valores.IsShow?clrTP:clrNONE,Estilo_Linea,Grosor_Linea,false,true,true,30);
   else
     {
      ObjectSetDouble(0,LINEATP,OBJPROP_PRICE,0,TP);
      ObjectSetInteger(0,LINEATP,OBJPROP_COLOR,Valores.IsShow?clrTP:clrNONE);
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool GestionarLineas()
  {
   if(!Valores.IsInst)
     {
      if(ObjectFind(0,LINEAOP)==0)
        {
         if(ObjectFind(0,LINEASL)==0)
           {
            double SL=0;
            double TP=0;
            double OP=0;

            if(ObjectFind(0,LINEAOP)==0)
               OP=NormalizeDouble(ObjectGetDouble(0,LINEAOP,OBJPROP_PRICE,0),Digits());
            if(ObjectFind(0,LINEASL)==0)
               SL=NormalizeDouble(ObjectGetDouble(0,LINEASL,OBJPROP_PRICE,0),Digits());
            if(ObjectFind(0,LINEATP)==0)
               TP=NormalizeDouble(ObjectGetDouble(0,LINEATP,OBJPROP_PRICE,0),Digits());

            double Volumen=0;
            double Ask=SymbolInfoDouble(NULL,SYMBOL_ASK);
            double Bid=SymbolInfoDouble(NULL,SYMBOL_BID);

            if(SL<OP && (TP==0 || OP<TP))
              {
               if(CalcularLotaje(OP,SL,Volumen,double(Valores.StopPerdida)))
                 {
                  if(Ask<OP)
                    {
                     bool Ejecuto=trade.BuyStop(Volumen,OP,NULL,SL,TP,ORDER_TIME_GTC,0,"EXPERTO CONTROL");

                     if(Ejecuto==false)
                        Print("ERROR NO ABRIO ORDEN PENDIENTE: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                    }
                  else
                    {

                     bool Ejecuto=trade.BuyLimit(Volumen,OP,NULL,SL,TP,ORDER_TIME_GTC,0,"EXPERTO CONTROL");

                     if(Ejecuto==false)
                        Print("ERROR NO ABRIO ORDEN PENDIENTE: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                    }
                 }
               else
                  return false;
              }
            else
               if(SL>OP && (TP==0 || OP>TP))
                 {
                  if(CalcularLotaje(OP,SL,Volumen,double(Valores.StopPerdida)))
                    {
                     if(Bid>OP)
                       {
                        bool Ejecuto=trade.SellStop(Volumen,OP,NULL,SL,TP,ORDER_TIME_GTC,0,"EXPERTO CONTROL");

                        if(Ejecuto==false)
                           Print("ERROR NO ABRIO ORDEN PENDIENTE: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                       }
                     else
                       {
                        bool Ejecuto=trade.SellLimit(Volumen,OP,NULL,SL,TP,ORDER_TIME_GTC,0,"EXPERTO CONTROL");

                        if(Ejecuto==false)
                           Print("ERROR NO ABRIO ORDEN PENDIENTE: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                       }
                    }
                  else
                     return false;
                 }
               else
                 {
                  Alert("Niveles de Precio Incorrectos");
                  return false;
                 }
           }
         else
           {
            Alert("No se puede definir STOP o LIMIT orden sin que este presente las linea SL");
            Crear_Actualizar_Lineas();
            return false;
           }
        }
      else
        {
         Alert("No hay linea OP");
         Crear_Actualizar_Lineas();
         return false;
        }
     }
   else
     {
      if(ObjectFind(0,LINEASL)==0)
        {
         double SL=0;
         double TP=0;

         if(ObjectFind(0,LINEASL)==0)
            SL=NormalizeDouble(ObjectGetDouble(0,LINEASL,OBJPROP_PRICE,0),Digits());
         if(ObjectFind(0,LINEATP)==0)
            TP=NormalizeDouble(ObjectGetDouble(0,LINEATP,OBJPROP_PRICE,0),Digits());

         double Volumen=0;
         double Ask=SymbolInfoDouble(NULL,SYMBOL_ASK);
         double Bid=SymbolInfoDouble(NULL,SYMBOL_BID);


         if(Ask>SL && (TP==0 || Ask<TP))
           {
            if(CalcularLotaje(Ask,SL,Volumen,double(Valores.StopPerdida)))
              {
               bool Ejecuto=trade.Buy(Volumen,NULL,Ask,SL,TP,"EXPERTO CONTROL");

               if(Ejecuto==false)
                  Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
              }
            else
               return false;
           }
         else
            if(Bid<SL && (TP==0 || Bid>TP))
              {
               if(CalcularLotaje(Bid,SL,Volumen,double(Valores.StopPerdida)))
                 {
                  bool Ejecuto=trade.Sell(Volumen,NULL,Bid,SL,TP,"EXPERTO CONTROL");

                  if(Ejecuto==false)
                     Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                 }
               else
                  return false;
              }
            else
               Alert("Niveles de Precio Incorrectos");

        }
      else
        {
         Alert("No se puede definir MERCADO orden sin que este presente las linea SL");
         Crear_Actualizar_Lineas();
         return false;
        }
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CalcularLotaje(double Open,double SL,double &Lotaje_,double Perdida)
  {
   double Tick_Value=SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE);
   int rango=int(MathAbs(Open-SL)/Point())+1;
//  double Perdida=Capital_Base*Porcentaje_Perdida/100.0;
//  Print("Perdida Calculada ",DoubleToString(Perdida,2));
   double Lotaje=Perdida/(Tick_Value*rango);
   string subSimbol=StringSubstr(Symbol(),0,3);
   
   Lotaje=Lotaje/((subSimbol=="XAU" || subSimbol=="XAG")?100.0:1.0);

   double Lots=int(Lotaje*100);
   Lots=NormalizeDouble(Lots/100.0,2);

   double Lote_Step=Lots/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
   int Lote_Step_int=int(Lots/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP));

// Print("Lote calculado es igual a  ",DoubleToString(Lots,2));

   if((Lote_Step-Lote_Step_int)>0)
     {
      Lots=Lote_Step_int*SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
      Print("Redondeando al Lote mas cercano permitido");
     }
//Lots=NormalizeDouble(Lots-SymbolInfoDouble(OrderSymbol(),SYMBOL_VOLUME_STEP),2);
   Print("Lote Calculado ",DoubleToString(Lots,2));

   if(Lots<SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
     {
      Alert("Lote calculado menor que el minimo permitido por el Simbolo, No se ejecuta operacion");
      // Print("Lote = ",DoubleToString(SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN)));
      // Lots=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
      //Lotaje_=Lots;
      return false;
     }


   if(Lots<=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
     {
      Lotaje_=Lots;
      return true;
     }
   else
      Print("No opero porque el lote calculado es Superior al Lote Maximo del Simbolo");

   return false;

  }
//+------------------------------------------------------------------+
bool HLineCreate(const long            chart_ID=0,        // chart's ID
                 const string          name="HLine",      // line name
                 const int             sub_window=0,      // subwindow index
                 double                price=0,           // line price
                 const color           clr=clrRed,        // line color
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // line style
                 const int             width=1,           // line width
                 const bool            back=false,        // in the background
                 const bool            selection=true,    // highlight to move
                 const bool            hidden=true,       // hidden in the object list
                 const long            z_order=0)         // priority for mouse click
  {
//--- if the price is not set, set it at the current Bid price level
   if(!price)
      price=SymbolInfoDouble(Symbol(),SYMBOL_BID);
//--- reset the error value
   ResetLastError();
//--- create a horizontal line
   if(!ObjectCreate(chart_ID,name,OBJ_HLINE,sub_window,0,price))
     {
      Print(__FUNCTION__,
            ": failed to create a horizontal line! Error code = ",GetLastError());
      return(false);
     }
//--- set line color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set line display style
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- set line width
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of moving the line by mouse
//--- when creating a graphical object using ObjectCreate function, the object cannot be
//--- highlighted and moved by default. Inside this method, selection parameter
//--- is true by default making it possible to highlight and move the object
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- hide (true) or display (false) graphical object name in the object list
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- set the priority for receiving the event of a mouse click in the chart
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- successful execution
   return(true);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SaveParameters(const int reason)
  {
   if(reason==REASON_CHARTCHANGE || reason==REASON_CLOSE)
     {
      int file_handle=FileOpen(InpDirectoryName+"//"+IntegerToString(ChartID()),FILE_READ|FILE_WRITE|FILE_BIN|FILE_COMMON);
      if(file_handle!=INVALID_HANDLE)
        {
         PrintFormat("El archivo %s está abierto para la escritura",IntegerToString(ChartID()));
         PrintFormat("Ruta del archivo: %s\\Files\\",TerminalInfoString(TERMINAL_COMMONDATA_PATH));
         //--- preparamos el contador del número de bytes
         uint counter=0;
         //--- escribimos los valores del array usando el ciclo
         uint byteswritten=FileWriteStruct(file_handle,Valores);

         FileClose(file_handle);
         PrintFormat("Datos escritos, archivo %s cerrado",IntegerToString(ChartID()));
        }
      else
         PrintFormat("Fallo al abrir el archivo %s, Código del error = %d",IntegerToString(ChartID()),GetLastError());
     }
   else
      if(FileIsExist(InpDirectoryName+"//"+IntegerToString(ChartID()),FILE_COMMON))
         FileDelete(InpDirectoryName+"//"+IntegerToString(ChartID()),FILE_COMMON);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void LoadParameters(void)
  {
   bool carga=false;
   int file_handle=FileOpen(InpDirectoryName+"//"+IntegerToString(ChartID()),FILE_READ|FILE_BIN|FILE_COMMON);
   if(file_handle!=INVALID_HANDLE)
     {
      PrintFormat("Archivo %s abierto para la lectura",IntegerToString(ChartID()));
      PrintFormat("Ruta del archivo: %s\\Files\\",TerminalInfoString(TERMINAL_COMMONDATA_PATH));
      //--- leemos los datos desde el archivo
      while(!FileIsEnding(file_handle))
        {
         //--- escribimos los datos en el array
         FileReadStruct(file_handle,Valores);
         //--- comprobamos si el array está sobrecargado
        }
      //--- cerramos el archivo
      FileClose(file_handle);
      PrintFormat("Datos leídos, archivo %s cerrado",IntegerToString(ChartID()));
     }
   else
     {
      PrintFormat("Fallo al abrir el archivo %s, Código del error = %d",IntegerToString(ChartID()),GetLastError());
      return;
     }
  }
//+------------------------------------------------------------------+
