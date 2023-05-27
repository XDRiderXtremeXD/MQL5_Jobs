//+------------------------------------------------------------------+
//|                                                 QuitarBordes.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window


#property description "THIS IS A FREE INDICATOR"
#property description "                                                      "
#property description "Welcome to the World of Forex"
#property description "Let light shine out of darkness and illuminate your world"
#property description "and with this freedom leave behind your cave of denial"
#property indicator_chart_window
#property indicator_buffers 0
#property indicator_plots   0
#define _name "Borders_ON/Off"
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
  return INIT_FAILED;
//--- indicator buffers mapping
   if(ObjectFind(0,_name)<0)
      ObjectCreate(0,_name,OBJ_BUTTON,0,0,0);
   ObjectSetInteger(0,_name,OBJPROP_XDISTANCE,5);
   ObjectSetInteger(0,_name,OBJPROP_YDISTANCE,30+23);
   ObjectSetInteger(0,_name,OBJPROP_XSIZE,39);
   ObjectSetInteger(0,_name,OBJPROP_YSIZE,24);
   ObjectSetInteger(0,_name,OBJPROP_CORNER,CORNER_LEFT_LOWER);
   ObjectSetInteger(0,_name,OBJPROP_ANCHOR,ANCHOR_LEFT_LOWER);
   ObjectSetInteger(0,_name,OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0,_name,OBJPROP_BGCOLOR,C'40,40,40');
   ObjectSetInteger(0,_name,OBJPROP_BORDER_COLOR,C'120,120,120');
   ObjectSetString(0,_name,OBJPROP_TEXT,ObjectGetInteger(0,_name,OBJPROP_STATE)?"ON":"OFF");
   manageWindows(ObjectGetInteger(0,_name,OBJPROP_STATE));
   return(INIT_SUCCEEDED);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason) {if(reason==REASON_REMOVE) ObjectDelete(0,_name); return;}
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
   return(rates_total);
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------------------------------------------------------+
void OnChartEvent(const int id, const long& lparam, const double& dparam, const string& sparam)
  {
   if(id==CHARTEVENT_OBJECT_CLICK && sparam==_name)
     {
      ObjectSetString(0,_name,OBJPROP_TEXT,ObjectGetInteger(0,_name,OBJPROP_STATE)?"ON":"OFF");
      manageWindows(ObjectGetInteger(0,_name,OBJPROP_STATE));
     }
   return;
  }
//+------------------------------------------------------------------------------------------------------------------+
#include <WinAPI\winapi.mqh>
/*
  int SetWindowLongPtrW(int hWnd,int nIndex, int dwNewLong);
  int GetWindowLongPtrW(int hWnd,int nIndex);
  int SetWindowPos(int hWnd, int hWndInsertAfter,int X, int Y, int cx, int cy, int uFlags);
  int GetParent(int hWnd);
  int GetTopWindow(int hWnd);
  int GetWindow(int hWnd, int wCmd);*/
#import
//+------------------------------------------------------------------------------------------------------------------+
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
//+------------------------------------------------------------------------------------------------------------------+
void manageWindows(bool state)
  {
   Print(state);
   long hChartParent = GetParent((int)ChartGetInteger(ChartID(),CHART_WINDOW_HANDLE));
   long hMDIClient   = GetParent(hChartParent);
   long hChildWindow = GetTopWindow(hMDIClient);

   while(hChildWindow>0)
     {
      Print(hChartParent,"  ",hMDIClient," ",hChildWindow);
      ManageBorderByWindowHandle(hChildWindow,state);
      hChildWindow=GetWindow(hChildWindow,GW_HWNDNEXT);
     }
  }
//+------------------------------------------------------------------------------------------------------------------+
void ManageBorderByWindowHandle(int hWindow,bool state)
  {
   long iNewStyle;
   if(state)
      iNewStyle = GetWindowLongA(iChartParent, GWL_STYLE) & (~(WS_BORDER | WS_DLGFRAME | WS_SIZEBOX));
   else
      iNewStyle = GetWindowLongA(iChartParent, GWL_STYLE) | ((WS_BORDER | WS_DLGFRAME | WS_SIZEBOX));

  long ThisChartID = ChartWindowFind();
  
   if(hWindow>0 && iNewStyle>0)
     {
      SetWindowLongW(hWindow,GWL_STYLE,iNewStyle);
      SetWindowPos(hWindow,0,0,0,0,0,SWP_NOZORDER | SWP_NOMOVE | SWP_NOSIZE | SWP_NOACTIVATE | SWP_FRAMECHANGED);
     }
  }
//+------------------------------------------------------------------------------------------------------------------+
//+------------------------------------------------------------------+
