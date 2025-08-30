//+------------------------------------------------------------------+
//|                                            ChartAddIndicator.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property description "Expert Advisor demonstrating the work with ChartIndicatorAdd() function."
#property description "After launching on the chart (and receiving the error in Journal), open"
#property description "the Expert Advisor's properties and specify correct <symbol> and <period> parameters."
#property description "MACD indicator will be added on the chart."

//--- input parameters
input int    fast_ema_period=12;          // fast MACD period
input int    slow_ema_period=26;          // slow MACD period
input int      signal_period=9;           // signal period
input ENUM_APPLIED_PRICE apr=PRICE_CLOSE; // price type for MACD calculation

int indicator_handle=INVALID_HANDLE;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   indicator_handle=iMACD(Symbol(),Period(),fast_ema_period,slow_ema_period,signal_period,apr);

   int Charts=(int)ChartGetInteger(0,CHART_WINDOWS_TOTAL,0);
   for(int i=Charts; i>=0; i--)
     {
      int IndicatorsTotal=ChartIndicatorsTotal(0,i);
      for(int j=IndicatorsTotal-1; j>=0; j--)
        {
         string Nombre=ChartIndicatorName(0,i,j);
         if(indicator_handle==ChartIndicatorGet(0,i,Nombre))
         return INIT_SUCCEEDED;
        }
     }


//---
//--- try to add the indicator on the chart
   if(!AddIndicator())
     {
      //--- AddIndicator() function refused to add the indicator on the chart
      int answer=MessageBox("Do you want to add MACD on the chart anyway?",
                            "Incorrect symbol and/or time frame for adding the indicator",
                            MB_YESNO // "Yes" and "No" selection buttons will be shown
                           );
      //--- if a user still insists on incorrect usage of ChartIndicatorAdd()
      if(answer==IDYES)
        {
         //--- first of all, a Journal entry will be made about that
         PrintFormat("Attention! %s: Trying to add MACD(%s/%s) indicator on %s/%s chart. Receiving error 4114",
                     __FUNCTION__,Symbol(),EnumToString(Period()),_Symbol,EnumToString(_Period));
         //--- receive the number of a new subwindow, to which we will try to add the indicator
         int subwindow=(int)ChartGetInteger(0,CHART_WINDOWS_TOTAL);
         //--- now make an attempt resulting in error
         if(!ChartIndicatorAdd(0,subwindow,indicator_handle))
            PrintFormat("Failed to add MACD indicator on %d chart window. Error code  %d",
                        subwindow,GetLastError());
        }
     }


//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
// Expert Advisor performs nothing
  }
//+------------------------------------------------------------------+
//| Function for checking and adding the indicator on the chart      |
//+------------------------------------------------------------------+
bool AddIndicator()
  {
//--- displayed message
//--- check if the indicator symbol and chart symbol match each other
//--- all checks completed, symbol and indicator time frame match the chart
   if(indicator_handle==INVALID_HANDLE)
     {
      Print(__FUNCTION__,"  Creating MACD indicator");
      indicator_handle=iMACD(Symbol(),Period(),fast_ema_period,slow_ema_period,signal_period,apr);
      if(indicator_handle==INVALID_HANDLE)
        {
         Print("Failed to create MACD indicator. Error code ",GetLastError());
        }
     }
//--- reset the error code
   ResetLastError();
//--- apply the indicator to the chart
   Print(__FUNCTION__,"  Adding MACD indicator on the chart");
   Print("MACD is generated on ",Symbol(),"/",EnumToString(Period()));
//--- receive the number of a new subwindow, to which MACD indicator is added
   int subwindow=(int)ChartGetInteger(0,CHART_WINDOWS_TOTAL);
   PrintFormat("Adding MACD indicator on %d chart window",subwindow);
   if(!ChartIndicatorAdd(0,subwindow,indicator_handle))
     {
      PrintFormat("Failed to add MACD indicator on %d chart window. Error code  %d",
                  subwindow,GetLastError());
     }
//--- Indicator added successfully
   return(true);
  }
//+------------------------------------------------------------------+
