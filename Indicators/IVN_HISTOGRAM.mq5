//+------------------------------------------------------------------+
//|                                                IVN_HISTOGRAM.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.00"

#property description "Indicador para Dibujer EST en Histograma"

#property indicator_separate_window
#property indicator_buffers 2
#property indicator_plots   1
#property indicator_label1  "LINEA_RED"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2


//--- búfer para los índices del Histograma
double         IVN_HISTOGRAM[];
//--- bufer para los indices RSI
double         PVI[];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {


   SetIndexBuffer(0,IVN_HISTOGRAM,INDICATOR_DATA);
   SetIndexBuffer(1,PVI,INDICATOR_CALCULATIONS);
   IndicatorSetString(INDICATOR_SHORTNAME,"IVN_HISTOGRAM");
   return(INIT_SUCCEEDED);
   IVN_HISTOGRAM[0]=1;
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
    
   int start=1;
   
   if(prev_calculated>0) start=prev_calculated-1; 

   for(int i=start; i<rates_total; i++)
     { 
       double VolumenAnterior=double (tick_volume[i-1]);
       double Volumen=double (tick_volume[i]);
       
       if(i==1){
       PVI[i]=1;
       }
       
       else{
       if(Volumen<VolumenAnterior){
       //PVI[i]=PVI[i-1]+((close[i]-close[i-1])/close[i-1])*PVI[i-1];
       PVI[i]=PVI[i-1]+((close[i]-close[i-1])/(close[i-1]*PVI[i-1]));
       }
       else{
       PVI[i]=PVI[i-1];
       }}
         IVN_HISTOGRAM[i]=PVI[i];
       }
   //Comment(IVN_HISTOGRAM[rates_total-1]);

   return(rates_total);
  }
//+------------------------------------------------------------------+
