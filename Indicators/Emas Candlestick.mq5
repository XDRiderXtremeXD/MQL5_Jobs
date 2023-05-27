//+------------------------------------------------------------------+
//|                                        Indicador Candlestick.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"
#property description "Indicador que avisa mediante una alerta la formacion de un patron regresivo"
#property description "con vela recien formandose- en otras palabras te avisa cuando se esta formando"
#property description "el patron regresivo y no cuando ha terminado de formarse la vela"

#property indicator_chart_window
#property indicator_buffers 5
#property indicator_plots   3

#property indicator_label1  "Intersection"
#property indicator_type1   DRAW_FILLING
#property indicator_color1  clrGreen,clrYellow
#property indicator_width1  1

#property indicator_label2  "LINE_50"
#property indicator_type2   DRAW_LINE
#property indicator_color2  clrWhite
#property indicator_width2  2

#property indicator_label3  "LINE_30"
#property indicator_type3   DRAW_COLOR_LINE
#property indicator_color3  clrBlue,clrRed // (se puede especificar hasta 64 colores) 
#property indicator_style3  STYLE_SOLID
#property indicator_width3  2

double         IntersectionBuffer1[];
double         IntersectionBuffer2[];
double        LINE_30[];
double        LINE_30_COLOR[];
double        LINE_50[];


int DefinitionInteccion1=0;
int DefinitionInteccion2=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   DefinitionInteccion1=iMA(Symbol(),Period(),30,0,MODE_LWMA,PRICE_CLOSE);
   DefinitionInteccion2=iMA(Symbol(),Period(),50,0,MODE_LWMA,PRICE_CLOSE);
   
   

   IndicatorSetString(INDICATOR_SHORTNAME,"PatronesCandlestick");

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetDouble(3,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetDouble(4,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(0,IntersectionBuffer1,INDICATOR_DATA);
   SetIndexBuffer(1,IntersectionBuffer2,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,LINE_50,INDICATOR_DATA);
   SetIndexBuffer(3,LINE_30,INDICATOR_DATA);
   SetIndexBuffer(4,LINE_30_COLOR,INDICATOR_COLOR_INDEX);

   ArraySetAsSeries(LINE_30,false);
   ArraySetAsSeries(LINE_50,false);
   ArraySetAsSeries(LINE_30_COLOR,false);

   ArrayInitialize(LINE_30,EMPTY_VALUE);
   ArrayInitialize(LINE_50,EMPTY_VALUE);
   ArrayInitialize(LINE_30_COLOR,EMPTY_VALUE);
   
   
   
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,0,OBJ_TEXT);
   Comment("");
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &Time[],
                const double &Open[],
                const double &High[],
                const double &Low[],
                const double &Close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   if(BarsCalculated(DefinitionInteccion1)<rates_total) //BASTA CON UNO PARA HACER EL CALCULO
      return(0);
   if(BarsCalculated(DefinitionInteccion2)<rates_total) //BASTA CON UNO PARA HACER EL CALCULO
      return(0);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
////// o SIGNAL_LINE............
   if(CopyBuffer(DefinitionInteccion1,0,0,to_copy,IntersectionBuffer1)<=0)
      return(0);
   if(CopyBuffer(DefinitionInteccion2,0,0,to_copy,IntersectionBuffer2)<=0)
      return(0);
   if(CopyBuffer(DefinitionInteccion2,0,0,to_copy,LINE_50)<=0)
      return(0);
   if(CopyBuffer(DefinitionInteccion1,0,0,to_copy,LINE_30)<=0)
      return(0);
  static datetime prevtime=0;   
     
      if(prevtime==Time[0])
     {
      return(rates_total);
     }  
   
   prevtime=Time[0];
   
   int start=12;
   if(prev_calculated!=0)
      start=rates_total-1;

   for(int shift=start; shift<rates_total; shift++)
     {
      if(LINE_50[shift]<LINE_30[shift])
         LINE_30_COLOR[shift]=0;
      else
         LINE_30_COLOR[shift]=1;}

   return(rates_total);
  }