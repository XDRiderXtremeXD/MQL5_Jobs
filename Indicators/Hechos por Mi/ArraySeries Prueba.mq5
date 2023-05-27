#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots   1
//---- plot Numeration
#property indicator_label1  "Numeration"
#property indicator_type1   DRAW_LINE
#property indicator_color1  CLR_NONE
//--- indicator buffers
double         NumerationBuffer[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,NumerationBuffer,INDICATOR_DATA);
//--- establecemos la indexación para el buffer como en serie temporal
   ArraySetAsSeries(NumerationBuffer,true);
//--- establecemos la precisión de representación en DataWindow
   IndicatorSetInteger(INDICATOR_DIGITS,0);
//--- como va a visualizarse el nombre del array de indicador en DataWindow
   PlotIndexSetString(0,PLOT_LABEL,"Bar #"); 
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
//---  vamos a guardar la hora de apertura de la barra cero actual
   static datetime currentBarTimeOpen=0;
//--- revertimos el acceso al array time[] - lo hacemos como en serie temporal
   ArraySetAsSeries(time,true);
//--- Si la hora de barra cero se diferencia de la que estamos guardando,
   if(currentBarTimeOpen!=time[0])
     {
     //--- vamos a enumerar todos las barras desde el momento actual hacia dentro del gráfico
      for(int i=rates_total-1;i>=0;i--) NumerationBuffer[i]=i;
      currentBarTimeOpen=time[0];
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }