//+------------------------------------------------------------------+
//|                                            Desbalance_Saltos.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0

#resource "\\Indicators\\Saltos.ex5" 
#resource "\\Indicators\\Desbalance.ex5" 

input string Des="=============== DESBALANCE ===============";//===========================================================================
input ENUM_TIMEFRAMES Periodo_Desbalance=PERIOD_H4;
input int Evaluacion_Historial_Desbalance=200;
input int Velas_Desvalance=10;
input double Multiplo_Desvalance=5;
input color Clr_Desbalance=clrOrange;
input int Width_Desbalance=1;
input ENUM_LINE_STYLE Style_Desbalance=STYLE_SOLID;
input string Salt="=============== SALTOS ===============";//===========================================================================
input ENUM_TIMEFRAMES Periodo_Saltos=PERIOD_M15;
input int Evaluacion_Historial_Saltos=200;
input color Clr_Saltos=clrAqua;
input int Width_Saltos=1;
input ENUM_LINE_STYLE Style_Saltos=STYLE_SOLID;

int handle_Desbalance=0;
int handle_Saltos=0;

double D[];
double S[];
string nombreLinea="Linea Horizontal 363023";
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   handle_Desbalance=iCustom(Symbol(),Periodo_Desbalance,"::Indicators\\Desbalance.ex5",Evaluacion_Historial_Desbalance,Velas_Desvalance,Multiplo_Desvalance,Clr_Desbalance,Width_Desbalance,Style_Desbalance,nombreLinea,false);
   handle_Saltos=iCustom(Symbol(),Periodo_Saltos,"::Indicators\\Saltos.ex5",Evaluacion_Historial_Saltos,Clr_Saltos,Width_Saltos,Style_Saltos,nombreLinea,false);
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

   if(BarsCalculated(handle_Saltos)!=iBars(Symbol(),Periodo_Saltos))
      return 0;

   CopyBuffer(handle_Desbalance,0,0,1,D);
   CopyBuffer(handle_Saltos,0,0,1,S);
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,nombreLinea,0,OBJ_TREND);
  }
//+------------------------------------------------------------------+
