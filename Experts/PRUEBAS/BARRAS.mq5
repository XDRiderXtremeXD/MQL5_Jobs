//+------------------------------------------------------------------+
//|                                                       BARRAS.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
double iEstocasticoBuffer[3];
double iEstocastiComparacion=0;
int a=0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
  
  static int handleEstocastico=iStochastic("USDJPY",PERIOD_M1,5,3,3,MODE_SMA,STO_LOWHIGH);
   while(CopyBuffer(handleEstocastico,0,0,3,iEstocasticoBuffer)<0)
     {Print("Actualizando");
      Sleep(5);
     };
   if(iEstocastiComparacion!=iEstocasticoBuffer[1]){
   if(a==0){
   Comment(a);
   a=1;}
   else if(a==1){
   Comment(a);
   a=0;}
   }  
     
   iEstocastiComparacion=iEstocasticoBuffer[1];
   //int barras=Bars("USDJPY",PERIOD_M1);
   //Comment(barras ," ", iEstocasticoBuffer[1]);
   
   
//---
   
  }
//+------------------------------------------------------------------+
