//+------------------------------------------------------------------+
//|                                                 MACD_colores.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#resource "\\Indicators\\MACDExponencial.ex5"

#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window
#property indicator_buffers 2
#property indicator_plots   1

#property indicator_label1  "Color_MACD"
#property indicator_type1   DRAW_COLOR_HISTOGRAM
#property indicator_color1  clrRed,clrGreen
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

input string S7="========== Configuracion MACD ==========";//==========================================================================================
input int Ema_Rapida=12;//EMA Rapida
input int Ema_Lenta=26;//EMA Lenta
input int MediaMovilExponencial=12;//Periodo Media Movil Exponencial
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;


double         MACD_HistogramBuffer[];
double         MACD_HistogramColors[];

double MACD[];
double MEDIA[];

int macd_handle=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   SetIndexBuffer(0,MACD_HistogramBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,MACD_HistogramColors,INDICATOR_COLOR_INDEX);

   ArraySetAsSeries(MACD_HistogramBuffer,true);
   ArraySetAsSeries(MACD_HistogramColors,true);

   ArraySetAsSeries(MACD,true);
   ArraySetAsSeries(MEDIA,true);

   SetIndicatorPropiedades();

   if(!SetHandleMACD())
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
      MACD_HistogramBuffer[shift]=MACD[shift]-MEDIA[shift];
      SetColorBarMACD(shift,rates_total);
     }

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetHandleMACD()
  {
   macd_handle=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\MACDExponencial",Ema_Rapida,Ema_Lenta,MediaMovilExponencial,Applied_Price_MACD);
   if(INVALID_HANDLE==macd_handle)
     {
      Alert("ERROR en el indicador MACD ",GetLastError());
      return false;
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetIndicatorPropiedades()
  {
   IndicatorSetInteger(INDICATOR_DIGITS,Digits());

   IndicatorSetString(INDICATOR_SHORTNAME,"MACD colores ("+"Period="+IntegerToString(Ema_Rapida)+"  Slow="+IntegerToString(Ema_Lenta)+"  Signal="+IntegerToString(MediaMovilExponencial)+"  APPrice="+IntegerToString(Applied_Price_MACD)+")");

   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,MathMax(Ema_Rapida,Ema_Lenta)+1);
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
   if(BarsCalculated(macd_handle)<rates_total)
      return(false);
//--- we can copy not all data
//--- try to copy
   if(CopyBuffer(macd_handle,0,0,toCopy,MACD)<=0)
      return(false);
   if(CopyBuffer(macd_handle,2,0,toCopy,MEDIA)<=0)
      return(false);

   return true;
  }
//+------------------------------------------------------------------+
