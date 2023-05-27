//+------------------------------------------------------------------+
//|                                                       RSIOMA.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.00"

#property description "Indicador para Dibujer EST en Histograma"

#property indicator_separate_window
#property indicator_buffers 3
#property indicator_plots   2
#property indicator_label1  "LINEA_RSI"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2
#property indicator_label2  "LINEA_OMA"
#property indicator_type2   DRAW_LINE
#property indicator_color2  clrBlue
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2
#property indicator_minimum 0
#property indicator_maximum 100

#property indicator_level1 20
#property indicator_level2 80

input int PeriodoRSI=7;
input int PeriodoEMA=14;


//--- búfer para los índices del Histograma
double         EMAClose[];
double         RSI[];
double         RSIOMA[];

int DefinitionEMAClose;
int DefinitionRSI;
int DefinitionRSIOMA;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {


   SetIndexBuffer(0,RSI,INDICATOR_DATA);
   SetIndexBuffer(1,RSIOMA,INDICATOR_DATA);
   SetIndexBuffer(2,EMAClose,INDICATOR_CALCULATIONS);
   IndicatorSetString(INDICATOR_SHORTNAME,"RSIOMA");
   DefinitionEMAClose=iMA(Symbol(),PERIOD_CURRENT,PeriodoRSI,0,MODE_EMA,PRICE_CLOSE);
   DefinitionRSI=iRSI(Symbol(),PERIOD_CURRENT,PeriodoRSI,DefinitionEMAClose);
   DefinitionRSIOMA=iMA(Symbol(),PERIOD_CURRENT,PeriodoEMA,0,MODE_EMA,DefinitionRSI);
   
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
     
    if(BarsCalculated(DefinitionEMAClose)<rates_total)
      return(0);
    if(BarsCalculated(DefinitionRSI)<rates_total)
      return(0);
    if(BarsCalculated(DefinitionRSIOMA)<rates_total)
      return(0);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
////// NAIN LINE............
   if(CopyBuffer(DefinitionEMAClose,MAIN_LINE,0,to_copy,EMAClose)<=0)
      return(0);
   if(CopyBuffer(DefinitionRSI,MAIN_LINE,0,to_copy,RSI)<=0)
      return(0);
   if(CopyBuffer(DefinitionRSIOMA,MAIN_LINE,0,to_copy,RSIOMA)<=0)
      return(0);
      

   return(rates_total);
  }
//+------------------------------------------------------------------+
