//+------------------------------------------------------------------+
//|                                               BB_TradingView.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window

#property indicator_buffers 3
#property indicator_plots   3
//--- las propiedades de la línea están establecidas por medio de las directivas del compilador
#property indicator_label1  "MIDDLE"      // nombre de la construcción para la "Ventana de datos" 
#property indicator_type1   DRAW_LINE   // tipo de construcción gráfica - una línea 
#property indicator_color1  clrYellow      // color de la línea 
#property indicator_style1  STYLE_SOLID // estilo de la línea 

#property indicator_label2  "UPPER"      // nombre de la construcción para la "Ventana de datos" 
#property indicator_type2   DRAW_LINE   // tipo de construcción gráfica - una línea 
#property indicator_color2  clrYellow      // color de la línea 
#property indicator_style2  STYLE_SOLID // estilo de la línea 

#property indicator_label3  "LOWER"      // nombre de la construcción para la "Ventana de datos" 
#property indicator_type3   DRAW_LINE   // tipo de construcción gráfica - una línea 
#property indicator_color3  clrYellow     // color de la línea 
#property indicator_style3  STYLE_SOLID // estilo de la línea 


double UP[];
double LOW[];
double MIDDLE[];



input int lengthBB=20;//Longitud BB"
input double multBB=2.0;//Multiplicador BB
int handle_std;
int handle_ma;

double MA[];
double STD[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- vinculación del array con el búfer indicador
   SetIndexBuffer(0,UP,INDICATOR_DATA);
   SetIndexBuffer(1,LOW,INDICATOR_DATA);
   SetIndexBuffer(2,MIDDLE,INDICATOR_DATA);

   handle_std=iStdDev(Symbol(),PERIOD_CURRENT,lengthBB,0,MODE_SMA,PRICE_CLOSE);
   handle_ma=iMA(Symbol(),PERIOD_CURRENT,lengthBB,0,MODE_SMA,PRICE_CLOSE);

   ArraySetAsSeries(STD,true);
   ArraySetAsSeries(MA,true);

   ArraySetAsSeries(UP,true);
   ArraySetAsSeries(LOW,true);
   ArraySetAsSeries(MIDDLE,true);
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

   if(prev_calculated==0)
     {
      ArrayInitialize(UP,EMPTY_VALUE);
      ArrayInitialize(LOW,EMPTY_VALUE);
      ArrayInitialize(MIDDLE,EMPTY_VALUE);
     }


   if(BarsCalculated(handle_std)<rates_total)
      return(0);

   if(BarsCalculated(handle_ma)<rates_total)
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
   if(CopyBuffer(handle_std,0,0,to_copy,STD)<=0)
      return(0);
   if(CopyBuffer(handle_ma,0,0,to_copy,MA)<=0)
      return 0;

   for(int shift=0; shift<to_copy; shift++)
     {

      double basisBB = MA[shift];

      double devBB = multBB * STD[shift];

      double upperBB = basisBB + devBB;

      double lowerBB = basisBB - devBB;
    
      UP[shift]=upperBB;
      LOW[shift]=lowerBB;
      MIDDLE[shift]=basisBB;
     }

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+

/*int  iStdDev(
   string              symbol,            // nombre del símbolo
   ENUM_TIMEFRAMES     period,            // período
   int                 ma_period,         // período promedio
   int                 ma_shift,          // desplazamiento horizontal del indicador
   ENUM_MA_METHOD      ma_method,         // tipo de suavizado
   ENUM_APPLIED_PRICE  applied_price      // tipo de precio o manejador
   );*/
