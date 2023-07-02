//+------------------------------------------------------------------+
//|                                               Desbalance_MTF.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0

#resource "\\Indicators\\Desbalance.ex5" 

input string Des="=============== DESBALANCE ===============";//===========================================================================
input ENUM_TIMEFRAMES Periodo_Desbalance=PERIOD_H4;
input int Velas_Desvalance=10;
input double Multiplo_Desvalance=5;
input color Clr_Desbalance=clrOrange;
input int Width_Desbalance=1;
input ENUM_LINE_STYLE Style_Desbalance=STYLE_SOLID;
int handle_Desbalance=0;
input string Hist="=============== Historial ===============";//===========================================================================
input ENUM_TIMEFRAMES Periodo=PERIOD_H4;
input int Velas=200;

double D[];
string nombreLinea="LH 363023";
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   int Velas_=MathMin(iBars(Symbol(),Periodo)-1,Velas);
   datetime tiempoStart=iTime(Symbol(),Periodo,Velas_);
   int Barras=iBarShift(Symbol(),Periodo_Desbalance,tiempoStart,false);
   handle_Desbalance=iCustom(Symbol(),Periodo_Desbalance,"::Indicators\\Desbalance.ex5",Barras,Velas_Desvalance,Multiplo_Desvalance,Clr_Desbalance,Width_Desbalance,Style_Desbalance,nombreLinea,false);
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

   if(BarsCalculated(handle_Desbalance)!=iBars(Symbol(),Periodo_Desbalance))
      return 0;

   CopyBuffer(handle_Desbalance,0,0,1,D);
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,nombreLinea+EnumToString(ENUM_TIMEFRAMES(Periodo_Desbalance))+"D ",0,OBJ_TREND);
    ChartRedraw();
  }
//+------------------------------------------------------------------+
