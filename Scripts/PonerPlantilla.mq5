//+------------------------------------------------------------------+
//|                                               PonerPlantilla.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property script_show_inputs

input string Nombre_Template="";
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {

   long currChart,prevChart=ChartFirst();
   int i=0,limit=100;
   Print("ChartFirst = ",ChartSymbol(prevChart)," ID = ",prevChart);

   while(i<limit)// seguramente no tenemos más de 100 gráficos abiertos
     {
      if(prevChart>=0)
         if(ChartApplyTemplate(prevChart,Nombre_Template+".tpl"))
           {
            Print("The template "+Nombre_Template+" applied successfully");
            //--- redraw chart
            ChartRedraw();
           }
         else
           {
            Alert("Failed to apply "+Nombre_Template+", error code ",GetLastError());
            break;
           }

      currChart=ChartNext(prevChart); // a base del anterior obtenemos un gráfico nuevo
      if(currChart<0)
         break;          // hemos llegado al final de la lista de gráficos
      Print(i,ChartSymbol(currChart)," ID = ",currChart);
      prevChart=currChart;// vamos a guardar el identificador del gráfico corriente para ChartNext()
      i++;// no olvidemos aumentar el contador
     }
  }
//+------------------------------------------------------------------+
