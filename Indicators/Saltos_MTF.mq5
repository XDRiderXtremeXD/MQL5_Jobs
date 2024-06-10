//+------------------------------------------------------------------+
//|                                                   Saltos_MTF.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0

#resource "\\Indicators\\Saltos.ex5"

input string Salt="=============== SALTOS ===============";//===========================================================================
input ENUM_TIMEFRAMES Periodo_Saltos=PERIOD_M15;
input color Clr_Saltos=clrAqua;
input int Width_Saltos=1;
input ENUM_LINE_STYLE Style_Saltos=STYLE_SOLID;
input string Hist="=============== Historial ===============";//===========================================================================
input ENUM_TIMEFRAMES Periodo=PERIOD_H4;
input int Velas=200;

int handle_Saltos=0;

double S[];
string nombreLinea="LH 363023";
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   int Velas_=MathMin(iBars(Symbol(),Periodo)-1,Velas);
   datetime tiempoStart=iTime(Symbol(),Periodo,Velas_);
   int Barras=iBarShift(Symbol(),Periodo_Saltos,tiempoStart,false);

   handle_Saltos=iCustom(Symbol(),Periodo_Saltos,"::Indicators\\Saltos.ex5",Barras,Clr_Saltos,Width_Saltos,Style_Saltos,nombreLinea);
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

   if(BarsCalculated(handle_Saltos)!=iBars(Symbol(),Periodo_Saltos))
      return 0;

   CopyBuffer(handle_Saltos,0,0,1,S);
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,nombreLinea+EnumToString(ENUM_TIMEFRAMES(Periodo_Saltos))+"S ",0,OBJ_TREND);
   ChartRedraw();
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
