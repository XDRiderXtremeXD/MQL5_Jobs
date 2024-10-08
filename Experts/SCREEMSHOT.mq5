//+------------------------------------------------------------------+
//|                                                   SCREEMSHOT.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property description "El Asesor Experto muestra cómo se crea una serie de screenshots del gráfico actual"
#property description "utilizando la función ChartScreenShot(). Para que sea más cómodo, el nombre del archivo también"
#property description "se visualiza en el gráfico. Las macros determinan el alto y el ancho de las imágenes."
 
#define        WIDTH  800     // ancho de la imagen para llamar a ChartScreenShot()
#define        HEIGHT 600     // alto de la imagen para llamar a ChartScreenShot()
 
//--- input parameters
input int      pictures=5;    // número de imágenes en la serie
int            mode=-1;       // -1 significa el desplazamiento hacia el lado derecho del gráfico, 1 - hacia el lado izquierdo
int            bars_shift=300;// número de barras durante el desplazamiento del gráfico con la función ChartNavigate()
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
void OnInit()
  {
//--- desactivamos el desplazamiento automático del gráfico
   ChartSetInteger(0,CHART_AUTOSCROLL,false);
//--- establecemos la sangría del borde derecho del gráfico
   ChartSetInteger(0,CHART_SHIFT,true);
//--- mostramos el gráfico como una secuencia de velas japonesas
   ChartSetInteger(0,CHART_MODE,CHART_CANDLES);
//---
   Print("La preparación del EA para el trabajo está finalizada");
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
 
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//--- mostrar el nombre de la función, hora de la llamada y el identificador del evento
   Print(__FUNCTION__,TimeCurrent(),"   id=",id,"   mode=",mode);
//--- procesamiento del evento CHARTEVENT_CLICK ("Clic del ratón en el gráfico")
   if(id==CHARTEVENT_CLICK)
     {
      //--- desplazamiento inicial del borde del gráfico
      int pos=0;
      //--- modo de trabajo con el borde izquierdo del gráfico
      if(mode>0)
        {
         //--- desplazamos el gráfico hacia el borde izquierdo
         ChartNavigate(0,CHART_BEGIN,pos);
         for(int i=0;i<pictures;i++)
           {
            //--- preparamos el texto a mostrar en el gráfico y el nombre para el archivo
            string name="ChartScreenShot"+"CHART_BEGIN"+string(pos)+".gif";
            //--- mostramos el nombre en el gráfico en forma del comentario
            Comment(name);
            //--- guardamos el screenshot del gráfico en la carpeta directorio_del_terminal\MQL5\Files\
            if(ChartScreenShot(0,name,WIDTH,HEIGHT,ALIGN_LEFT))
               Print("Hemos guardado el screenshot ",name);
            //---
            pos+=bars_shift;
            //--- dejamos al usuario tiempo para que mire una nueva área del gráfico
            Sleep(3000);
            //--- desplazamos el gráfico a bars_shift a la derecha de su posición actual
            ChartNavigate(0,CHART_CURRENT_POS,bars_shift);
           }
         //--- cambio del modo al opuesto
         mode*=-1;
        }
      else // modo de trabajo con el borde derecho del gráfico
        {
         //--- desplazamos el gráfico hacia el borde derecho
         ChartNavigate(0,CHART_END,pos);
         for(int i=0;i<pictures;i++)
           {
            //--- preparamos el texto a mostrar en el gráfico y el nombre para el archivo
            string name="ChartScreenShot"+"CHART_END"+string(pos)+".gif";
            //--- mostramos el nombre en el gráfico en forma del comentario
            Comment(name);
            //--- guardamos el screenshot del gráfico en la carpeta directorio_del_terminal\MQL5\Files\
            if(ChartScreenShot(0,name,WIDTH,HEIGHT,ALIGN_RIGHT))
               Print("Hemos guardado el screenshot ",name);
            //---
            pos+=bars_shift;
            //--- dejamos al usuario tiempo para que mire una nueva área del gráfico
            Sleep(3000);
            //--- desplazamos el gráfico a bars_shift a la derecha de su posición actual
            ChartNavigate(0,CHART_CURRENT_POS,-bars_shift);
           }
         //--- cambio del modo al opuesto
         mode*=-1;
        }
     }  // fin del procesamiento del evento CHARTEVENT_CLICK
//--- fin del manejador OnChartEvent()  
  }