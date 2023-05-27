//+------------------------------------------------------------------+
//|                                                       Quitar.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#include <WinAPI\winapi.mqh>

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


#define GWL_STYLE         -16
#define WS_CAPTION        0x00C00000
#define WS_BORDER         0x00800000
#define WS_SIZEBOX        0x00040000
#define WS_DLGFRAME       0x00400000
#define SWP_NOSIZE        0x0001
#define SWP_NOMOVE        0x0002
#define SWP_NOZORDER      0x0004
#define SWP_NOACTIVATE    0x0010
#define SWP_FRAMECHANGED  0x0020
#define GW_CHILD          0x0005
#define GW_HWNDNEXT       0x0002

void OnStart()
  {
  
  ChartSetInteger(0,CHART_IS_DOCKED,false);
  
   long ThisChartID = ChartID();
   long ThisChartHandle, ThisChartParentHandle;
   ChartGetInteger(ThisChartID,CHART_WINDOW_HANDLE,0,ThisChartHandle);
   ThisChartParentHandle=GetParent(ThisChartHandle);
   SetParent(ThisChartHandle,NULL);
   SetWindowLongPtrW(ThisChartHandle,-16,GetWindowLongW(ThisChartParentHandle, GWL_STYLE) & (~(WS_BORDER | WS_DLGFRAME | WS_SIZEBOX)));
  }
//+------------------------------------------------------------------+
