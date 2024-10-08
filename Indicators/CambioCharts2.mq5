//+------------------------------------------------------------------+
//|                                                CambioCharts2.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0

//#resource "\\Indicators\\ChartSecun.ex5"

input int Segundos_Pausa=5;

//#include <WinAPI\winapi.mqh>


input string Letra_play="P";//Letra Stop/Play
input string Letra_change="C";//Letra CHANGE

input string Letra_right="D";//Letra Stop/Play
input string Letra_left="A";//Letra CHANGE
/*
input string S1="-------- Led Switch ----------";
input int X=10;
input int Y=10;
input ENUM_BASE_CORNER Corner=CORNER_LEFT_LOWER;
*/

//int handle_ind=0;
//string ch="ChartSecun";
bool ciclo=true;
ushort letraEjecucion=0;
ushort letraEjecucionCambio=0;

ushort letraleft=0;
ushort letraright=0;

static int prevSimboloIndice=0;
int TotalSimbolos=0;

string Simbolos[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(StringLen(Letra_play)!=1)
     {
      Alert("La letra ejecucion debe ser 1 letra o numero");
      return INIT_PARAMETERS_INCORRECT;
     }

   if(StringLen(Letra_change)!=1)
     {
      Alert("La letra cambio debe ser 1 letra o numero");
      return INIT_PARAMETERS_INCORRECT;
     }

   if(StringLen(Letra_right)!=1)
     {
      Alert("La letra right debe ser 1 letra o numero");
      return INIT_PARAMETERS_INCORRECT;
     }

   if(StringLen(Letra_left)!=1)
     {
      Alert("La letra left debe ser 1 letra o numero");
      return INIT_PARAMETERS_INCORRECT;
     }


   letraEjecucion=StringGetCharacter(Letra_play,0);
   letraEjecucionCambio=StringGetCharacter(Letra_change,0);
   letraleft=StringGetCharacter(Letra_left,0);
   letraright=StringGetCharacter(Letra_right,0);

   TotalSimbolos=SymbolsTotal(true);
   ArrayResize(Simbolos,TotalSimbolos);

   for(int i=0; i<TotalSimbolos; i++)
     {
      Simbolos[i]=SymbolName(i,true);
      if(Simbolos[i]==Symbol())
         prevSimboloIndice=i;
     }

//if(GlobalVariableCheck("Indice Simbolo"))
// prevSimboloIndice=(int)GlobalVariableGet("Indice Simbolo");

   ciclo=true;
   if(GlobalVariableCheck("Bucle Chart"))
      ciclo=(GlobalVariableGet("Bucle Chart")==1?true:false);



   EventSetTimer(1);

   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   /*
    long currChart,prevChartX=ChartFirst();
    int i=0,limit=100;

    while(i<limit)// seguramente no tenemos más de 100 gráficos abiertos
      {
       ChartIndicatorDelete(prevChartX,0,ch);
       currChart=ChartNext(prevChartX); // a base del anterior obtenemos un gráfico nuevo
       if(currChart<0)
          break;          // hemos llegado al final de la lista de gráficos
       prevChartX=currChart;// vamos a guardar el identificador del gráfico corriente para ChartNext()
       i++;// no olvidemos aumentar el contador
      }*/

   EventKillTimer();
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


   return(rates_total);
  }
//+------------------------------------------------------------------+
void OnTimer()
  {
   static int charts=0;

   static datetime TiempoPausa=TimeLocal();

   if(ciclo)
      if(TimeLocal()>=TiempoPausa+Segundos_Pausa)
        {
         Print(prevSimboloIndice);
         long prevChartX=ChartFirst();
         int i=0,limit=100;

         if(prevChartX<0)
            return;


         while(i<limit)// seguramente no tenemos más de 100 gráficos abiertos
           {
            if(ChartGetString(prevChartX,CHART_COMMENT)!="NO CAMBIO")
              {
               ENUM_TIMEFRAMES Periodo=ChartPeriod(prevChartX);
               ChartSetSymbolPeriod(prevChartX,Simbolos[prevSimboloIndice],Periodo);
              }

            prevChartX=ChartNext(prevChartX); // a base del anterior obtenemos un gráfico nuevo
            if(prevChartX<0)
               break;          // hemos llegado al final de la lista de gráficos
            i++;// no olvidemos aumentar el contador
           }

         TiempoPausa=TimeLocal();
         prevSimboloIndice++;
         if(prevSimboloIndice>=TotalSimbolos)
            prevSimboloIndice=0;

         GlobalVariableSet("Indice Simbolo",prevSimboloIndice);
        }
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

   if(id==0 && lparam==letraEjecucionCambio && !ciclo)
     {
      long prevChartX=ChartFirst();
      int i=0,limit=100;

      if(prevChartX<0)
         return;

      while(i<limit)// seguramente no tenemos más de 100 gráficos abiertos
        {
         if(ChartGetString(prevChartX,CHART_COMMENT)!="NO CAMBIO")
            if(prevChartX!=ChartID())
              {
               ENUM_TIMEFRAMES Periodo=ChartPeriod(prevChartX);
               ChartSetSymbolPeriod(prevChartX,Symbol(),Periodo);
              }

         prevChartX=ChartNext(prevChartX); // a base del anterior obtenemos un gráfico nuevo
         if(prevChartX<0)
            break;          // hemos llegado al final de la lista de gráficos
         i++;// no olvidemos aumentar el contador
        }
     }

   if(id==0 && lparam==letraEjecucion)
     {
      ciclo=!ciclo;

      GlobalVariableSet("Bucle Chart",ciclo?1:0);
      //CambiarColor(ciclo);

      if(ciclo)
         Print("INICIA BUCLE");
      else
         Print("PAUSA BUCLE");
     }

   if(id==0 && !ciclo && (lparam==letraright || lparam==letraleft))
     {



      if(lparam==letraright)
        {
         Print("Derecha");
         prevSimboloIndice++;
        }
      if(lparam==letraleft)
        {
         prevSimboloIndice--;
         Print("Izquierda");
        }

      if(prevSimboloIndice>=TotalSimbolos)
         prevSimboloIndice=0;
      if(prevSimboloIndice<0)
         prevSimboloIndice=TotalSimbolos-1;

      Print(prevSimboloIndice);
      long prevChartX=ChartFirst();
      int i=0,limit=100;

      if(prevChartX<0)
         return;

      while(i<limit)// seguramente no tenemos más de 100 gráficos abiertos
        {
         if(ChartGetString(prevChartX,CHART_COMMENT)!="NO CAMBIO")
           {
            ENUM_TIMEFRAMES Periodo=ChartPeriod(prevChartX);
            ChartSetSymbolPeriod(prevChartX,Simbolos[prevSimboloIndice],Periodo);
           }

         prevChartX=ChartNext(prevChartX); // a base del anterior obtenemos un gráfico nuevo
         if(prevChartX<0)
            break;          // hemos llegado al final de la lista de gráficos
         i++;// no olvidemos aumentar el contador
        }
      GlobalVariableSet("Indice Simbolo",prevSimboloIndice);
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*
bool PonerIndicador(long prevChart_)
  {
//Print(prevChart);
//--- cuántos indicadores hay en esta ventana/subventana
   int total=ChartIndicatorsTotal(prevChart_,0);
//--- repasamos todos los indicadores en la ventana
   for(int i=0; i<total; i++)
     {
      string name=ChartIndicatorName(prevChart_,0,i);
      // Print(name);
      if(name==ch)
         return false;
     }

   handle_ind=iCustom(ChartSymbol(prevChart_),ChartPeriod(prevChart_),"::Indicators\\ChartSecun.ex5",ChartID(),prevChart_,letraEjecucion,X,Y,Corner);

   ChartIndicatorAdd(prevChart_,0,handle_ind);

   return true;
  }*/
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*
void CambiarColor(bool Play)
  {
   string Boton="boton play 2023";
   long currChart,prevChartX=ChartFirst();
   int i=0,limit=100;

   while(i<limit)// seguramente no tenemos más de 100 gráficos abiertos
     {
      ObjectSetInteger(prevChartX,Boton,OBJPROP_BGCOLOR,Play?clrGreen:clrGray);
      ChartRedraw(prevChartX);
      currChart=ChartNext(prevChartX); // a base del anterior obtenemos un gráfico nuevo
      if(currChart<0)
         break;          // hemos llegado al final de la lista de gráficos
      prevChartX=currChart;// vamos a guardar el identificador del gráfico corriente para ChartNext()
      i++;// no olvidemos aumentar el contador
     }
  }*/
//+------------------------------------------------------------------+
