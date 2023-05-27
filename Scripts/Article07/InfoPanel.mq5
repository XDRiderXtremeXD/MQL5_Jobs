//+------------------------------------------------------------------+
//|                                                    InfoPanel.mq5 |
//|                        Copyright 2016, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2016, MetaQuotes Software Corp."
#property link      "http://www.mql5.com"
#property version   "1.0"
//--- Including the trading panel class
#include "Program.mqh"
CProgram program;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart(void)
  {
//--- Set the information panel
   if(!program.CreateInfoPanel())
     {
      ::Print(__FUNCTION__," > Failed to create graphical interface!");
      return;
     }
//--- The script will be working until deleted
   while(!::IsStopped())
     {
      //--- Generate an event every 250 milliseconds
      program.OnEvent(250);
     }
  }
//+------------------------------------------------------------------+
