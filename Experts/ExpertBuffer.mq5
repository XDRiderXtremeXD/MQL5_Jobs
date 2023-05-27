//+------------------------------------------------------------------+
//|                                                 ExpertBuffer.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"



int handles[];
double Valor[3];
int Indicadores=0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
  ActualizarHandles();
   EventSetMillisecondTimer(1);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EventKillTimer();

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {

   int Indicadores2=0;
   int windows=(int)ChartGetInteger(0,CHART_WINDOWS_TOTAL);

   for(int w=0; w<windows; w++)
     {
      int total=ChartIndicatorsTotal(0,w);
      Indicadores2+=total;
     }
   
   if(Indicadores!=Indicadores2){
   ActualizarHandles();
   Indicadores=Indicadores2;
   }



   string Commentario="";
   for(int i=0; i<ArraySize(handles); i++)
     {
      if(BarsCalculated(handles[i])==iBars(Symbol(),PERIOD_CURRENT))
        {
         if(CopyBuffer(handles[i],0,0,3,Valor)>0){
            Commentario+=(IntegerToString(i)+" "+(Valor[1]!=EMPTY_VALUE?DoubleToString(Valor[1],Digits()):"EMPTY VALUE")+"\n");}
        }
     }
   Comment(Commentario);

  }
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // identificador de evento
                  const long& lparam,   // parámetro de evento del tipo long
                  const double& dparam, // parámetro de evento del tipo double
                  const string& sparam  // parámetro de evento del tipo string
                 )
  {
   Print(id," ",lparam," ",dparam," ",sparam);



  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ActualizarHandles()
  {
   ArrayResize(handles,0);


   int windows=(int)ChartGetInteger(0,CHART_WINDOWS_TOTAL);

   for(int w=0; w<windows; w++)
     {
      //--- cuántos indicadores hay en esta ventana/subventana
      int total=ChartIndicatorsTotal(0,w);
      Indicadores+=total;
      //--- repasamos todos los indicadores en la ventana
      for(int i=0; i<total; i++)
        {
         //--- obtenemos el nombre corto del indicador
         string name=ChartIndicatorName(0,w,i);
         //--- obtenemos el manejador del indicador
         int handle=ChartIndicatorGet(0,w,name);

         int size=ArraySize(handles);
         ArrayResize(handles,size+1);
         handles[size]=handle;
         //--- mostramos en el diario
         PrintFormat("Window=%d,  index=%d,  name=%s,  handle=%d",w,i,name,handle);
         //--- release handle
        }
     }
  }
//+------------------------------------------------------------------+
