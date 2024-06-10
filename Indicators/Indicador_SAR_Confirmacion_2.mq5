//+------------------------------------------------------------------+
//|                               Indicador_SAR_Confirmacion_RSI.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 4
#property indicator_plots   4

#property indicator_label1  "BUY"
#property indicator_color1  clrMagenta
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2  "SELL"
#property indicator_color2  clrMagenta
#property indicator_type2  DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

#property indicator_label3  "SAR"
#property indicator_color3  clrWhite
#property indicator_type3  DRAW_ARROW
#property indicator_style3  STYLE_SOLID
#property indicator_width3  1

#property indicator_label4  "MA"
#property indicator_color4  clrYellow
#property indicator_type4  DRAW_LINE
#property indicator_style4  STYLE_SOLID
#property indicator_width4  2


input string S1="*********************   Configuracion SAR *********************";//***************************************************************
input double SAR_Step=0.02;//Onda A
input double SAR_Maximun=0.2;//Onda B
input string S3_="********************* MA *********************";//***************************************************************
input int Ma_Periodo=50;
input int Ma_Shift=0;
input ENUM_MA_METHOD Ma_Method=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;
input string S5="*********************   Configuracion Color *********************";//***************************************************************
input color Color_Alcista=clrLime;
input color Color_Bajista=clrMagenta;


double         Arrow_UP[];
double         Arrow_DN[];
double         MA[];
double         SAR_Buffer[];

int Handle_SAR=0;
int Handle_MA=0;

enum direccion
  {
   vacio=0,
   alcista=1,
   bajista=2,
  };


direccion dir;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   Handle_SAR=iSAR(Symbol(),PERIOD_CURRENT,SAR_Step,SAR_Maximun);
   Handle_MA=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo,Ma_Shift,Ma_Method,Ma_AppliedPrice);
//--- vinculación del array con el búfer indicador

   SetIndexBuffer(0,Arrow_UP,INDICATOR_DATA);
   SetIndexBuffer(1,Arrow_DN,INDICATOR_DATA);
   SetIndexBuffer(2,SAR_Buffer,INDICATOR_DATA);
   SetIndexBuffer(3,MA,INDICATOR_DATA);
//--- inicialización del generador de números pseudoaleatorios
   ArraySetAsSeries(Arrow_UP,false);
   ArraySetAsSeries(Arrow_DN,false);
   ArraySetAsSeries(SAR_Buffer,false);
   ArraySetAsSeries(MA,false);

   PlotIndexSetInteger(0,PLOT_ARROW,225);
   PlotIndexSetInteger(1,PLOT_ARROW,226);
   PlotIndexSetInteger(2,PLOT_ARROW,159);



   PlotIndexSetInteger(0,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       0,       //  índice del color donde escribiremos el color
                       Color_Alcista);

   PlotIndexSetInteger(1,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       0,       //  índice del color donde escribiremos el color
                       Color_Bajista);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
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
   ArraySetAsSeries(close,false);
   ArraySetAsSeries(time,false);
   ArraySetAsSeries(low,false);
   ArraySetAsSeries(high,false);

   if(BarsCalculated(Handle_SAR)<rates_total)
      return(0);

   if(BarsCalculated(Handle_MA)<rates_total)
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
   if(CopyBuffer(Handle_SAR,0,0,to_copy,SAR_Buffer)<=0)
      return 0;

   if(CopyBuffer(Handle_MA,0,0,to_copy,MA)<=0)
      return 0;

   if(prev_calculated==0)
     {
      ArrayInitialize(Arrow_UP,EMPTY_VALUE);
      ArrayInitialize(Arrow_DN,EMPTY_VALUE);
      dir=vacio;
     }

   if(prev_calculated==rates_total)
      return rates_total;

   int start=MathMax(rates_total-(rates_total-prev_calculated),4);
////////// RUPTURA DE SOP o RES
   for(int shift=start; shift<rates_total; shift++)
     {
      Arrow_UP[shift]=EMPTY_VALUE;
      Arrow_UP[shift-1]=EMPTY_VALUE;
      Arrow_DN[shift]=EMPTY_VALUE;
      Arrow_DN[shift-1]=EMPTY_VALUE;

      if(dir!=alcista)
         if(SAR_Buffer[shift-1]<close[shift-1] && SAR_Buffer[shift-2]>close[shift-2] && MA[shift-1]<SAR_Buffer[shift-1])
            dir=alcista;

      if(dir!=bajista)
         if(SAR_Buffer[shift-1]>close[shift-1] && SAR_Buffer[shift-2]<close[shift-2] && MA[shift-1]>SAR_Buffer[shift-1])
            dir=bajista;

      if(dir==alcista)
         if(close[shift-1]<open[shift-1])
           {
            Arrow_UP[shift-1]=low[shift-1];
            dir=vacio;
           }

      if(dir==bajista)
         if(close[shift-1]>open[shift-1])
           {
            Arrow_DN[shift-1]=high[shift-1];
            dir=vacio;
           }
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
