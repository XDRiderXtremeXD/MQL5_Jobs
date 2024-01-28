//+------------------------------------------------------------------+
//|                                              MACDExponencial.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window
#property indicator_buffers 3
#property indicator_plots   2

#property indicator_label1  "MACD"
#property indicator_type1   DRAW_COLOR_HISTOGRAM
#property indicator_color1  clrWhite
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1
//--- las propiedades de la línea están establecidas por medio de las directivas del compilador
#property indicator_label2  "Signal"      // nombre de la construcción para la "Ventana de datos" 
#property indicator_type2   DRAW_LINE   // tipo de construcción gráfica - una línea 
#property indicator_color2  clrRed      // color de la línea 
#property indicator_style2  STYLE_SOLID // estilo de la línea 
#property indicator_width2  1           // grosor de la línea 

input int Ema_Rapida=12;//EMA Rapida
input int Ema_Lenta=26;//EMA Lenta
input int MediaMovilExponencial=12;//Periodo Media Movil
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;


double         MACD_HistogramBuffer[];
double         MACD_HistogramColors[];

int ma_fast=0;
int ma_slow=0;

double FAST[];
double SLOW[];
double LineBuffer[];

double SmoothingFactor=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   SetIndexBuffer(0,MACD_HistogramBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,MACD_HistogramColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,LineBuffer,INDICATOR_DATA);

   ArraySetAsSeries(MACD_HistogramBuffer,true);
   ArraySetAsSeries(MACD_HistogramColors,true);
   ArraySetAsSeries(FAST,true);
   ArraySetAsSeries(SLOW,true);
   ArraySetAsSeries(LineBuffer,true);

   SetIndicatorPropiedades();
   
   SmoothingFactor=2.0/(MediaMovilExponencial+1);

   if(!SetHandles())
      return INIT_FAILED;

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

   int to_copy=BarrasFaltanIterar(prev_calculated,rates_total);

   if(!SetValuesIndicatorsAuxiliares(to_copy,rates_total))
      return 0;

   for(int shift=to_copy-1; shift>=0; shift--)
     {
      MACD_HistogramBuffer[shift]=FAST[shift]-SLOW[shift];
      MACD_HistogramColors[shift]=0;
      
      if(shift==rates_total-1)
         LineBuffer[shift]=MACD_HistogramBuffer[shift];
      else
         LineBuffer[shift] =LineBuffer[shift+1] + SmoothingFactor * (MACD_HistogramBuffer[shift] - LineBuffer[shift+1]);
     }

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetIndicatorPropiedades()
  {
   IndicatorSetInteger(INDICATOR_DIGITS,Digits());

   IndicatorSetString(INDICATOR_SHORTNAME,"MACD ("+"EMA_Rapida="+IntegerToString(Ema_Rapida)+"  EMA_Lenta="+IntegerToString(Ema_Lenta)+"  PromedioMovilExponencial="+IntegerToString(MediaMovilExponencial)+"  APPrice="+IntegerToString(Applied_Price_MACD)+")");

   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,MathMax(Ema_Rapida,Ema_Lenta)+1);
   IndicatorSetInteger(INDICATOR_DIGITS,6);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetColorBarMACD(int shift,int const rates_total)
  {
//0 Red, 1 Green, 2 White, ver linea 17
   if(rates_total-1>shift)
     {
      MACD_HistogramColors[shift]=MACD_HistogramColors[shift+1];

      if(MACD_HistogramBuffer[shift]>MACD_HistogramBuffer[shift+1])
         MACD_HistogramColors[shift]=1;

      if(MACD_HistogramBuffer[shift]<MACD_HistogramBuffer[shift+1])
         MACD_HistogramColors[shift]=0;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int BarrasFaltanIterar(int prev_calculated,int rates_total)
  {
   int to_copy=0;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      //--- last value is always copied
      to_copy++;
     }
   return to_copy;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetValuesIndicatorsAuxiliares(int toCopy,int rates_total)
  {
   toCopy=MathMin(rates_total,toCopy+3);
//--- check if all data calculated
   if(BarsCalculated(ma_fast)<rates_total)
      return(false);
   if(BarsCalculated(ma_slow)<rates_total)
      return(false);
//--- we can copy not all data
//--- try to copy
   if(CopyBuffer(ma_fast,0,0,toCopy,FAST)<=0)
      return(false);
   if(CopyBuffer(ma_slow,0,0,toCopy,SLOW)<=0)
      return(false);

   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetHandles()
  {
   ma_fast=iMA(Symbol(),PERIOD_CURRENT,Ema_Rapida,0,MODE_EMA,Applied_Price_MACD);
   ma_slow=iMA(Symbol(),PERIOD_CURRENT,Ema_Lenta,0,MODE_EMA,Applied_Price_MACD);

   if(INVALID_HANDLE==ma_fast)
     {
      Alert("ERROR en el indicador MA FAST ",GetLastError());
      return false;
     }

   if(INVALID_HANDLE==ma_slow)
     {
      Alert("ERROR en el indicador MA SLOW ",GetLastError());
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
