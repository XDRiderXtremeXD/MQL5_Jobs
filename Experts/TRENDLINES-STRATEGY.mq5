//+------------------------------------------------------------------+
//|                                          TRENDLINES-STRATEGY.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                               AutoTrendLines.mq5 |
//|                                            Copyright 2012, Rone. |
//|                                            rone.sergey@gmail.com |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Automatic trend lines.                                           |
//| Type 1. With two extremums.                                      |
//| 1) From the current bar "go" to the left and look for the first  |
//| (right) extremum point with the InpRightExmSide bars on both     |
//| sides.                                                           |
//| 2) From the first point again "go" to the left and look for the  |
//| second (left) extremum point with the InpLeftExmSide bars on     |
//| both sides.                                                      |
//| 3) Draw a trend lines.                                           |
//|                                                                  |
//| Type 2. With extremum and delta.                                 |
//| 1) From the current bar "go" to the left and look for the second |
//| (left) extremum point with the InpLeftExmSide bars on both sides.|
//| 2) Starting with the InpFromCurrent bar from the current bar and |
//| to the second extremum point find the bar with minimal delta.    |
//| 3) Draw a trend lines.                                           |
//|                                                                  |
//| NOTE:                                                            |
//| 1) The lines are recalculated only when a new bar appears        |
//| 2) The current unformed bar does not included in the calculations|
//| 3) The extremum means a bar, for which the left and right        |
//| N bars have minimums above and maximums                          |
//| below.                                                           |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, Rone."
#property link      "rone.sergey@gmail.com"
#property version   "1.00"
#property description "Automatic trend lines"
//---
#property indicator_chart_window

double Buffer[];



//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit() {
//---
   ArrayResize(Buffer,5);
//---
   return(0);
}
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason) {
//---
   
//---
}
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+

void OnTick()
  {
  CopiaKalman_filter_2(Buffer);

 }  


void CopiaKalman_filter_2(double &BufferIndicador[])
  {
   int handleIndicador;
   handleIndicador=iCustom(Symbol(),PERIOD_CURRENT,"autotrendlines",2,10,3, 3,false,2,clrRed,clrBlue);
   while(CopyBuffer(handleIndicador,0,0,3,BufferIndicador)<0)
     {
      Sleep(5);
     };
   ArrayReverse(BufferIndicador,0,3);
  }
  

