//+------------------------------------------------------------------+
//|                                     Prueba Texto En pantalla.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property indicator_separate_window
#property indicator_buffers 1
#property indicator_plots   1
#property indicator_minimum 0
#property indicator_maximum 100


string label_name="mainwindow_label";
string label2_name="indicator_label";
int window=-1;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
//---
    
   return(0);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime& time[],
                const double& open[],
                const double& high[],
                const double& low[],
                const double& close[],
                const long& tick_volume[],
                const long& volume[],
                const int& spread[])
{
//---
//--- return value of prev_calculated for next call
   
   if(ObjectFind(0,label_name)<0)
     {
      Print("Generating a label");
      ObjectCreate(0,label_name,OBJ_LABEL,0,0,0);           
      ObjectSetInteger(0,label_name,OBJPROP_XDISTANCE,30);
      ObjectSetInteger(0,label_name,OBJPROP_YDISTANCE,30);
      ObjectSetInteger(0,label_name,OBJPROP_COLOR,YellowGreen);
      ObjectSetString(0,label_name,OBJPROP_TEXT,"Formandose Patron");
      ObjectSetString(0,label_name,OBJPROP_FONT,"Arial");
      ObjectSetInteger(0,label_name,OBJPROP_FONTSIZE,14);
      ObjectSetInteger(0,label_name,OBJPROP_SELECTABLE,false);
      ChartRedraw(0);                                      
     }
     
   
 
   if((ENUM_PROGRAM_TYPE)MQL5InfoInteger(MQL5_PROGRAM_TYPE)==PROGRAM_INDICATOR)
     {
      window=ChartWindowFind();
      Print(window);
     }
     
     if(ObjectFind(window,label2_name)<0)
     {
      Print("Generating a label2");
      ObjectCreate(window,label2_name,OBJ_LABEL,0,0,0);       
      Print(GetLastError());    
      ObjectSetInteger(window,label2_name,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(window,label2_name,OBJPROP_YDISTANCE,10);
      ObjectSetInteger(window,label2_name,OBJPROP_COLOR,YellowGreen);
      ObjectSetString(window,label2_name,OBJPROP_TEXT,"This is an example text inside indicator, cool, huh?");
      ObjectSetString(window,label2_name,OBJPROP_FONT,"Arial");
      ObjectSetInteger(window,label2_name,OBJPROP_FONTSIZE,14);
      ObjectSetInteger(window,label2_name,OBJPROP_SELECTABLE,false);
      ChartRedraw(window);                                      
     }
     
   IndicatorSetString(INDICATOR_SHORTNAME,"Hello "+label2_name+"...");
   
   return(rates_total);
}
  
void OnDeinit(const int reason)
{
   if(ObjectFind(0,label_name)>=0)
      ObjectDelete(0,label_name);
   if(ObjectFind(window,label2_name)>=0)
      ObjectDelete(window,label2_name);
      
}