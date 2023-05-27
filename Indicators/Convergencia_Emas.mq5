//+------------------------------------------------------------------+
//|                                            Convergencia_Emas.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.00"

#property description "Indicador para Dibujar RSI en Histograma"

#property indicator_separate_window
#property indicator_buffers 5
#property indicator_plots   1
#property indicator_label1  "Color_Histogram"
#property indicator_type1   DRAW_COLOR_HISTOGRAM
#property indicator_color1  clrRed,clrDarkGreen,clrPurple,clrNONE
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

//--- búfer para los índices de Histogram
double         Color_HistogramBuffer[];
//--- búfer para los índices de colores
double         Color_HistogramColors[];
//--- bufer para los indices RSI
double         MA_BUFFER_1[];
double         MA_BUFFER_2[];
double         MA_BUFFER_3[];

///////variable para alternar
int IndicatorValue;
///////////////////////

//--- Variables para el RSI
input int Tolerancia_Extrema=20;
input int Tolerancia_Distancia=200;
input string S1="-----------------------   MA_1  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_1=25;
input int Ma_Shift_1=0;
input ENUM_MA_METHOD Ma_Method_1=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_1=PRICE_CLOSE;
input string S2="-----------------------   MA_2  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_2=50;
input int Ma_Shift_2=0;
input ENUM_MA_METHOD Ma_Method_2=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_2=PRICE_CLOSE;
input string S3="-----------------------   MA_3  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_3=150;
input int Ma_Shift_3=0;
input ENUM_MA_METHOD Ma_Method_3=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_3=PRICE_CLOSE;

int EMA1;
int EMA2;
int EMA3;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {


   SetIndexBuffer(0,Color_HistogramBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,Color_HistogramColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,MA_BUFFER_1,INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,MA_BUFFER_2,INDICATOR_CALCULATIONS);
   SetIndexBuffer(4,MA_BUFFER_3,INDICATOR_CALCULATIONS);

   ArraySetAsSeries(Color_HistogramBuffer,true);
   ArraySetAsSeries(Color_HistogramColors,true);
   ArraySetAsSeries(MA_BUFFER_1,true);
   ArraySetAsSeries(MA_BUFFER_2,true);
   ArraySetAsSeries(MA_BUFFER_3,true);

//////---------------APLICAR RSI-------//////////
   EMA1=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo_1,Ma_Shift_1,Ma_Method_1,Ma_AppliedPrice_1);
   EMA2=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo_2,Ma_Shift_2,Ma_Method_2,Ma_AppliedPrice_2);
   EMA3=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo_3,Ma_Shift_3,Ma_Method_3,Ma_AppliedPrice_3);
///////////////////////////////////////////////////
   IndicatorSetString(INDICATOR_SHORTNAME,"Histogram Convergencia Emas("+IntegerToString(Ma_Periodo_1)+" , "+IntegerToString(Ma_Periodo_2)+" , "+IntegerToString(Ma_Periodo_3)+" , "+")");

   PlotIndexSetInteger(0,PLOT_SHOW_DATA,false);
   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,MathMax(MathMax(Ma_Periodo_1,Ma_Periodo_2),Ma_Periodo_3));
   IndicatorSetDouble(INDICATOR_MAXIMUM,1);
   IndicatorSetDouble(INDICATOR_MINIMUM,0);

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
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(high,true);

   if(BarsCalculated(EMA1)<rates_total)
      return(0);
   if(BarsCalculated(EMA2)<rates_total)
      return(0);
   if(BarsCalculated(EMA3)<rates_total)
      return(0);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(EMA1,0,0,to_copy,MA_BUFFER_1)<=0)
      return(0);
   if(CopyBuffer(EMA2,0,0,to_copy,MA_BUFFER_2)<=0)
      return(0);
   if(CopyBuffer(EMA3,0,0,to_copy,MA_BUFFER_3)<=0)
      return(0);


   for(int i=0; i<to_copy; i++)
     {
      double Valor1=MathAbs(MA_BUFFER_1[i]-MA_BUFFER_2[i]);
      double Valor2=MathAbs(MA_BUFFER_2[i]-MA_BUFFER_3[i]);
      double Valor3=MathAbs(MA_BUFFER_1[i]-MA_BUFFER_3[i]);

      double Distancia=MathMax(MathMax(Valor1,Valor2),Valor3);
      double ValorMaximo=MathMax(MathMax(MA_BUFFER_1[i],MA_BUFFER_2[i]),MA_BUFFER_3[i]);
      double ValorMinimo=MathMin(MathMin(MA_BUFFER_1[i],MA_BUFFER_2[i]),MA_BUFFER_3[i]);

      bool buy=false,sell=false;

      Color_HistogramBuffer[i]=1;

      if(Distancia<=Tolerancia_Distancia*Point())
        {
         if(ValorMaximo==MA_BUFFER_3[i])
            if(high[i]<=ValorMaximo && high[i]>=ValorMinimo-Tolerancia_Extrema*Point())
               sell=true;
               
         if(ValorMinimo==MA_BUFFER_3[i])
            if(low[i]>=ValorMinimo && low[i]<=ValorMaximo+Tolerancia_Extrema*Point())
               buy=true;

         if(sell && buy)
            Color_HistogramColors[i]=2;
         else
            if(sell && !buy)
               Color_HistogramColors[i]=0;
            else
               if(!sell && buy)
                  Color_HistogramColors[i]=1;
               else
                  Color_HistogramBuffer[i]=0;
        }
      else
         Color_HistogramBuffer[i]=0;
     }

   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
