//+------------------------------------------------------------------+
//|                                               Trabajo_Charts.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//--- conectamos la biblioteca de los elementos de control
#include <ChartObjects\ChartObjectsTxtControls.mqh>
//--- constantes predefinidas
#define X_PROPERTY_NAME_1    10  // coordenada X del nombre de la propiedad en la primera columna
#define X_PROPERTY_VALUE_1   225 // x-coordenada X del valor de la propiedad en la primera columna
#define X_PROPERTY_NAME_2    345 // coordenada X del nombre de la propiedad en la segunda y la tercera columnas
#define X_PROPERTY_VALUE_2   550 // coordenada X del valor de la propiedad en la segunda y la tercera columnas
#define X_BUTTON_1           285 // coordenada X del botón en la primera columna
#define X_BUTTON_2           700 // coordenada X del botón en la segunda columna
#define Y_PROPERTY_1         30  // coordenada Y del inicio de la primera y la segunda columnas
#define Y_PROPERTY_2         286 // coordenada Y del inicio de la tercera columna
#define Y_DISTANCE           16  // distancia por el eje Y entre las filas
#define LAST_PROPERTY_NUMBER 111 // el número de la última propiedad gráfica
//--- parámetros de entrada
input color InpFirstColor=clrDodgerBlue; // Color de las filas impares
input color InpSecondColor=clrGoldenrod; // Color de las filas pares
//--- variables y arrays
CChartObjectLabel  ExtLabelsName[];  // etiquetas para visualizar los nombres de propiedades
CChartObjectLabel  ExtLabelsValue[]; // etiquetas para visualizar los valores de propiedades
CChartObjectButton ExtButtons[];     // botones
int                ExtNumbers[];     // índices de propiedades
string             ExtNames[];       // nombres de propiedades
uchar              ExtDataTypes[];   // tipos de datos de propiedades (integer, double, string)
uint               ExtGroupTypes[];  // array que almacena los datos sobre la pertenencia de las propiedades a uno de los grupos
uchar              ExtDrawTypes[];   // array que almacena los datos sobre el modo de visualización de las propiedades
double             ExtMaxValue[];    // valores máximos permitidos para las propiedades durante su trabajo con este panel
double             ExtMinValue[];    // valores mínimos permitidos para las propiedades durante su trabajo con este panel
double             ExtStep[];        // pasos para cambiar las propiedades
int                ExtCount;         // número total de todas las propiedades
color              ExtColors[2];     // array de colores para visualizar las filas
string             ExtComments[2];   // array de comentarios (para la propiedad CHART_COMMENT)
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- mostramos el comentario sobre el gráfico
   Comment("SomeComment");
//--- guardamos los colores en el array para conmutarse luego entre ellos
   ExtColors[0]=InpFirstColor;
   ExtColors[1]=InpSecondColor;
//--- guardamos los comentarios en el array para conmutarse luego entre ellos
   ExtComments[0]="FirstComment";
   ExtComments[1]="SecondComment";
//--- preparamos y visualizamos el panel de control de las propiedades del gráfico
   if(!PrepareControls())
      return(INIT_FAILED);
//--- ejecución con éxito
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Deinitialization function of the expert                          |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- quitamos el texto del comentario en el gráfico
   Comment("");
  }
//+------------------------------------------------------------------+
//| Manejador de eventos del gráfico                                 |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//--- comprobación del evento de pinchar sobre un objeto del gráfico
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      //--- dividimos el nombre del objeto por el separador
      string obj_name[];
      StringSplit(sparam,'_',obj_name);
      //--- prueba de que si el objeto es un botón
      if(obj_name[0]=="Button")
        {
         //--- obtenemos el índice del botón
         int index=(int)StringToInteger(obj_name[1]);
         //--- ponemos el botón en el estado no presionado
         ExtButtons[index].State(false);
         //--- establecemos nuevo valor de la propiedad en función de su tipo
         if(ExtDataTypes[index]=='I')
            ChangeIntegerProperty(index);
         if(ExtDataTypes[index]=='D')
            ChangeDoubleProperty(index);
         if(ExtDataTypes[index]=='S')
            ChangeStringProperty(index);
        }
     }
//--- redibujo de valores de propiedad
   RedrawProperties();
   ChartRedraw();
  }
//+------------------------------------------------------------------+
//| Cambio de la propiedad integer del gráfico                       |
//+------------------------------------------------------------------+
void ChangeIntegerProperty(const int index)
  {
//--- obtenemos el valor actual de la propiedad
   long value=ChartGetInteger(0,(ENUM_CHART_PROPERTY_INTEGER)ExtNumbers[index]);
//--- determinamos el siguiente valor de la propiedad
   switch(ExtDrawTypes[index])
     {
      case 'C':
         value=GetNextColor((color)value);
         break;
      default:
         value=(long)GetNextValue((double)value,index);
         break;
     }
//--- establecemos nuevo valor de la propiedad
   ChartSetInteger(0,(ENUM_CHART_PROPERTY_INTEGER)ExtNumbers[index],0,value);
  }
//+------------------------------------------------------------------+
//| Cambio de la propiedad double del gráfico                        |
//+------------------------------------------------------------------+
void ChangeDoubleProperty(const int index)
  {
//--- obtenemos el valor actual de la propiedad
   double value=ChartGetDouble(0,(ENUM_CHART_PROPERTY_DOUBLE)ExtNumbers[index]);
//--- determinamos el siguiente valor de la propiedad
   value=GetNextValue(value,index);
//--- establecemos nuevo valor de la propiedad
   ChartSetDouble(0,(ENUM_CHART_PROPERTY_DOUBLE)ExtNumbers[index],value);
  }
//+------------------------------------------------------------------+
//| Cambio de la propiedad string del gráfico                        |
//+------------------------------------------------------------------+
void ChangeStringProperty(const int index)
  {
//--- variable estática para conmutar dentro del array de comentarios ExtComments
   static uint comment_index=1;
//--- cambiamos el índice para obtener otro comentario
   comment_index=1-comment_index;
//--- establecemos nuevo valor de la propiedad
   ChartSetString(0,(ENUM_CHART_PROPERTY_STRING)ExtNumbers[index],ExtComments[comment_index]);
  }
//+------------------------------------------------------------------+
//| Determinación del siguiente valor de la propiedad                         |
//+------------------------------------------------------------------+
double GetNextValue(const double value,const int index)
  {
   if(value+ExtStep[index]<=ExtMaxValue[index])
      return(value+ExtStep[index]);
   else
      return(ExtMinValue[index]);
  }
//+------------------------------------------------------------------+
//| Obtención del siguiente color para la propiedad del tipo color               |
//+------------------------------------------------------------------+
color GetNextColor(const color clr)
  {
//--- devolvemos el siguiente valor del color
   switch(clr)
     {
      case clrWhite: return(clrRed);
      case clrRed:   return(clrGreen);
      case clrGreen: return(clrBlue);
      case clrBlue:  return(clrBlack);
      default:       return(clrWhite);
     }
  }
//+------------------------------------------------------------------+
//| Redibujo de valores de las propiedades                                     |
//+------------------------------------------------------------------+
void RedrawProperties(void)
  {
//--- texto del valor de la propiedad
   string text;
   long   value;
//--- ciclo según el número de propiedades
   for(int i=0;i<ExtCount;i++)
     {
      text="";
      switch(ExtDataTypes[i])
        {
         case 'I':
            //--- obtenemos el valor actual de la propiedad
            if(!ChartGetInteger(0,(ENUM_CHART_PROPERTY_INTEGER)ExtNumbers[i],0,value))
            break;
            //--- texto de la propiedad integer
            switch(ExtDrawTypes[i])
              {
               //--- propiedad del color
               case 'C':
                  text=(string)((color)value);
                  break;
                  //--- propiedad booleana
               case 'B':
                  text=(string)((bool)value);
                  break;
                  //--- propiedad de la enumeración ENUM_CHART_MODE
               case 'M':
                  text=EnumToString((ENUM_CHART_MODE)value);
                  break;
                  //--- propiedad de la enumeración ENUM_CHART_VOLUME_MODE
               case 'V':
                  text=EnumToString((ENUM_CHART_VOLUME_MODE)value);
                  break;
                  //--- número del tipo int
               default:
                  text=IntegerToString(value);
                  break;
              }
            break;
         case 'D':
            //--- texto de la propiedad double
            text=DoubleToString(ChartGetDouble(0,(ENUM_CHART_PROPERTY_DOUBLE)ExtNumbers[i]),4);
            break;
         case 'S':
            //--- texto de la propiedad string
            text=ChartGetString(0,(ENUM_CHART_PROPERTY_STRING)ExtNumbers[i]);
            break;
        }
      //--- visualizamos el valor de la propiedad
      ExtLabelsValue[i].Description(text);
     }
  }
//+------------------------------------------------------------------+
//| Crear el panel para gestionar las propiedades del gráfico                |
//+------------------------------------------------------------------+
bool PrepareControls(void)
  {
//--- adjudicamos la memoria para los arrays con reserva
   MemoryAllocation(LAST_PROPERTY_NUMBER+1);
//--- variables
   int i=0;     // variable del ciclo
   int col_1=0; // número de propiedades en la primera columna
   int col_2=0; // número de propiedades en la segunda columna
   int col_3=0; // número de propiedades en la tercera columna
//--- número de propiedades actuales - 0
   ExtCount=0;
//--- buscamos las propiedades en el ciclo
   while(i<=LAST_PROPERTY_NUMBER)
     {
      //--- guardamos el número actual de la propiedad
      ExtNumbers[ExtCount]=i;
      //--- aumentamos el valor de la variable del ciclo
      i++;
      //--- comprobamos si hay propiedad con este número
      if(CheckNumber(ExtNumbers[ExtCount],ExtNames[ExtCount],ExtDataTypes[ExtCount],ExtGroupTypes[ExtCount],ExtDrawTypes[ExtCount]))
        {
         //--- creamos los elementos de control para la propiedad
         switch(ExtGroupTypes[ExtCount])
           {
            case 1:
               //--- creamos las etiquetas y el botón para la propiedad
               if(!ShowProperty(ExtCount,0,X_PROPERTY_NAME_1,X_PROPERTY_VALUE_1,X_BUTTON_1,Y_PROPERTY_1+col_1*Y_DISTANCE,true))
               return(false);
               //--- el número de elementos en la primera columna se ha aumentado
               col_1++;
               break;
            case 2:
               //--- creamos las etiquetas y el botón para la propiedad
               if(!ShowProperty(ExtCount,1,X_PROPERTY_NAME_2,X_PROPERTY_VALUE_2,X_BUTTON_2,Y_PROPERTY_1+col_2*Y_DISTANCE,true))
               return(false);
               //--- el número de elementos en la segunda columna se ha aumentado
               col_2++;
               break;
            case 3:
               //--- creamos sólo las etiquetas para la propiedad
               if(!ShowProperty(ExtCount,2,X_PROPERTY_NAME_2,X_PROPERTY_VALUE_2,0,Y_PROPERTY_2+col_3*Y_DISTANCE,false))
               return(false);
               //--- el número de elementos en la tercera columna se ha aumentado
               col_3++;
               break;
           }
         //--- determinamos el valor máximo, mínimo y el paso
         GetMaxMinStep(ExtNumbers[ExtCount],ExtMaxValue[ExtCount],ExtMinValue[ExtCount],ExtStep[ExtCount]);
         //--- aumentamos el número de propiedades
         ExtCount++;
        }
     }
//--- liberamos la memoria que no se utiliza por los arrays
   MemoryAllocation(ExtCount);
//--- redibujamos los valores de las propiedades
   RedrawProperties();
   ChartRedraw();
//--- ejecución con éxito
   return(true);
  }
//+------------------------------------------------------------------+
//| Adjudicación de memoria para los arrays                                    |
//+------------------------------------------------------------------+
void MemoryAllocation(const int size)
  {
   ArrayResize(ExtLabelsName,size);
   ArrayResize(ExtLabelsValue,size);
   ArrayResize(ExtButtons,size);
   ArrayResize(ExtNumbers,size);
   ArrayResize(ExtNames,size);
   ArrayResize(ExtDataTypes,size);
   ArrayResize(ExtGroupTypes,size);
   ArrayResize(ExtDrawTypes,size);
   ArrayResize(ExtMaxValue,size);
   ArrayResize(ExtMinValue,size);
   ArrayResize(ExtStep,size);
  }
//+------------------------------------------------------------------+
//| Comprobamos si el índice de la propiedad pertenece a una de          |
//| las enumeraciones ENUM_CHART_PROPERTIES                               |
//+------------------------------------------------------------------+
bool CheckNumber(const int ind,string &name,uchar &data_type,uint &group_type,uchar &draw_type)
  {
//--- comprobamos si la propiedad es del tipo entero (integer)
   ResetLastError();
   name=EnumToString((ENUM_CHART_PROPERTY_INTEGER)ind);
   if(_LastError==0)
     {
      data_type='I';                      // propiedad de la enumeración ENUM_CHART_PROPERTY_INTEGER
      GetTypes(ind,group_type,draw_type); // definimos los parámetros de visualización de la propiedad
      return(true);
     }
//--- comprobamos si la propiedad es del tipo real (double)
   ResetLastError();
   name=EnumToString((ENUM_CHART_PROPERTY_DOUBLE)ind);
   if(_LastError==0)
     {
      data_type='D';                      // propiedad de la enumeración ENUM_CHART_PROPERTY_DOUBLE
      GetTypes(ind,group_type,draw_type); // definimos los parámetros de visualización de la propiedad
      return(true);
     }
//--- comprobamos si la propiedad es del tipo literal (string)
   ResetLastError();
   name=EnumToString((ENUM_CHART_PROPERTY_STRING)ind);
   if(_LastError==0)
     {
      data_type='S';                      // propiedad de la enumeración ENUM_CHART_PROPERTY_STRING
      GetTypes(ind,group_type,draw_type); // definimos los parámetros de visualización de la propiedad
      return(true);
     }
//--- la propiedad no pertenece a ninguna de las enumeraciones
   return(false);
  }
//+------------------------------------------------------------------+
//| Determinación del grupo en el que debe almacenarse la propiedad,     |
//| así como su tipo de visualización                                            |
//+------------------------------------------------------------------+
void GetTypes(const int property_number,uint &group_type,uchar &draw_type)
  {
//--- comprobamos si la propiedad pertenece al tercer grupo
//--- las propiedades del tercer grupo se muestran en la segunda columna empezando de CHART_BRING_TO_TOP
   if(CheckThirdGroup(property_number,group_type,draw_type))
      return;
//--- comprobamos si la propiedad pertenece al segundo grupo
//--- las propiedades del segundo grupo se muestran en la segunda columna desde su inicio
   if(CheckSecondGroup(property_number,group_type,draw_type))
      return;
//--- si nos hemos encontrado aquí, entonces la propiedad pertenece al primer grupo (primera columna)
   CheckFirstGroup(property_number,group_type,draw_type);
  }
//+------------------------------------------------------------------+
//| La función comprueba si la propiedad pertenece al tercer grupo, y     |
//| si es así, determina su tipo de visualización                       |
//+------------------------------------------------------------------+
bool CheckThirdGroup(const int property_number,uint &group_type,uchar &draw_type)
  {
//--- comprobamos si la propiedad pertenece al tercer grupo
   switch(property_number)
     {
      //--- propiedades booleanas
      case CHART_IS_OBJECT:
      case CHART_WINDOW_IS_VISIBLE:
         draw_type='B';
         break;
         //--- propiedades enteras (integer)
      case CHART_VISIBLE_BARS:
      case CHART_WINDOWS_TOTAL:
      case CHART_WINDOW_HANDLE:
      case CHART_WINDOW_YDISTANCE:
      case CHART_FIRST_VISIBLE_BAR:
      case CHART_WIDTH_IN_BARS:
      case CHART_WIDTH_IN_PIXELS:
         draw_type='I';
         break;
         //--- propiedades reales (double)
      case CHART_PRICE_MIN:
      case CHART_PRICE_MAX:
         draw_type='D';
         break;
         //--- de hecho, esta propiedad es un comando de visualización del gráfico por encima de todos los demás
         //--- no hay necesidad de aplicarla para este panel, porque la ventana siempre
         //--- va a colocarse por encima de todas las demás antes de que la utilicemos
      case CHART_BRING_TO_TOP:
         draw_type=' ';
         break;
         //--- la propiedad no pertenece al tercer grupo
      default:
         return(false);
     }
//--- la propiedad pertenece al tercer grupo
   group_type=3;
   return(true);
  }
//+------------------------------------------------------------------+
//| La función comprueba si la propiedad pertenece al segundo grupo, y si |
//| es así, determina su tipo de visualización                            |
//+------------------------------------------------------------------+
bool CheckSecondGroup(const int property_number,uint &group_type,uchar &draw_type)
  {
//--- comprobamos si la propiedad pertenece al segundo grupo
   switch(property_number)
     {
      //--- la propiedad del tipo ENUM_CHART_MODE
      case CHART_MODE:
         draw_type='M';
         break;
         //--- la propiedad del tipo ENUM_CHART_VOLUME_MODE
      case CHART_SHOW_VOLUMES:
         draw_type='V';
         break;
         //--- propiedad literal (string)
      case CHART_COMMENT:
         draw_type='S';
         break;
         //--- propiedad del color
      case CHART_COLOR_BACKGROUND:
      case CHART_COLOR_FOREGROUND:
      case CHART_COLOR_GRID:
      case CHART_COLOR_VOLUME:
      case CHART_COLOR_CHART_UP:
      case CHART_COLOR_CHART_DOWN:
      case CHART_COLOR_CHART_LINE:
      case CHART_COLOR_CANDLE_BULL:
      case CHART_COLOR_CANDLE_BEAR:
      case CHART_COLOR_BID:
      case CHART_COLOR_ASK:
      case CHART_COLOR_LAST:
      case CHART_COLOR_STOP_LEVEL:
         draw_type='C';
         break;
         //--- la propiedad no pertenece al segundo grupo
      default:
         return(false);
     }
//--- la propiedad pertenece al segundo grupo
   group_type=2;
   return(true);
  }
//+------------------------------------------------------------------+
//| Esta función se invoca sólo si ya se sabe   |
//| que la propiedad no pertenece ni al segundo, ni al tercer grupo de propiedades     |
//+------------------------------------------------------------------+
void CheckFirstGroup(const int property_number,uint &group_type,uchar &draw_type)
  {
//--- la propiedad pertenece al primer grupo
   group_type=1;
//--- determinamos el tipo de visualización de la propiedad
   switch(property_number)
     {
      //--- propiedades enteras (integer)
      case CHART_SCALE:
      case CHART_HEIGHT_IN_PIXELS:
         draw_type='I';
         return;
         //--- propiedades reales (double)
      case CHART_SHIFT_SIZE:
      case CHART_FIXED_POSITION:
      case CHART_FIXED_MAX:
      case CHART_FIXED_MIN:
      case CHART_POINTS_PER_BAR:
         draw_type='D';
         return;
         //--- sólo quedan las propiedades booleanas
      default:
         draw_type='B';
         return;
     }
  }
//+------------------------------------------------------------------+
//| Crear las etiquetas y el botón para la propiedad                           |
//+------------------------------------------------------------------+
bool ShowProperty(const int ind,const int type,const int x1,const int x2,
                  const int xb,const int y,const bool btn)
  {
//--- array estático para conmutar dentro del array de color ExtColors
   static uint color_index[3]={1,1,1};
//--- cambiamos el índice para obtener otro color
   color_index[type]=1-color_index[type];
//--- mostramos etiquetas y el botón (si btn=true) para la propiedad
   if(!LabelCreate(ExtLabelsName[ind],"name_"+(string)ind,ExtNames[ind],ExtColors[color_index[type]],x1,y))
      return(false);
   if(!LabelCreate(ExtLabelsValue[ind],"value_"+(string)ind,"",ExtColors[color_index[type]],x2,y))
      return(false);
   if(btn && !ButtonCreate(ExtButtons[ind],(string)ind,xb,y+1))
      return(false);
//--- ejecución con éxito
   return(true);
  }
//+------------------------------------------------------------------+
//| Crear etiqueta                                                 |
//+------------------------------------------------------------------+
bool LabelCreate(CChartObjectLabel &lbl,const string name,const string text,
                 const color clr,const int x,const int y)
  {
   if(!lbl.Create(0,"Label_"+name,0,x,y)) return(false);
   if(!lbl.Description(text))             return(false);
   if(!lbl.FontSize(10))                  return(false);
   if(!lbl.Color(clr))                    return(false);
//--- ejecución con éxito
   return(true);
  }
//+------------------------------------------------------------------+
//| Crear el botón                                                  |
//+------------------------------------------------------------------+
bool ButtonCreate(CChartObjectButton &btn,const string name,
                  const int x,const int y)
  {
   if(!btn.Create(0,"Button_"+name,0,x,y,50,15)) return(false);
   if(!btn.Description("Next"))                  return(false);
   if(!btn.FontSize(10))                         return(false);
   if(!btn.Color(clrBlack))                      return(false);
   if(!btn.BackColor(clrWhite))                  return(false);
   if(!btn.BorderColor(clrBlack))                return(false);
//--- ejecución con éxito
   return(true);
  }
//+------------------------------------------------------------------+
//| Establecemos el valor máximo, mínimo y el paso  |
//+------------------------------------------------------------------+
void GetMaxMinStep(const int property_number,double &max,double &min,double &step)
  {
   double value;
//--- establecemos valores en función del tipo de la propiedad
   switch(property_number)
     {
      case CHART_SCALE:
         max=5;
         min=0;
         step=1;
         break;
      case CHART_MODE:
      case CHART_SHOW_VOLUMES:
         max=2;
         min=0;
         step=1;
         break;
      case CHART_SHIFT_SIZE:
         max=50;
         min=10;
         step=2.5;
         break;
      case CHART_FIXED_POSITION:
         max=90;
         min=0;
         step=15;
         break;
      case CHART_POINTS_PER_BAR:
         max=19;
         min=1;
         step=3;
         break;
      case CHART_FIXED_MAX:
         value=ChartGetDouble(0,CHART_FIXED_MAX);
         max=value*1.25;
         min=value;
         step=value/32;
         break;
      case CHART_FIXED_MIN:
         value=ChartGetDouble(0,CHART_FIXED_MIN);
         max=value;
         min=value*0.75;
         step=value/32;
         break;
      case CHART_HEIGHT_IN_PIXELS:
         max=700;
         min=520;
         step=30;
         break;
         //--- valores por defecto
      default:
         max=1;
         min=0;
         step=1;
     }
  }

