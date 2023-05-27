//+------------------------------------------------------------------+
//|                               Conjuntos Señal Perdida Global.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0

MqlRates rates[]; 

input ENUM_TIMEFRAMES PeriodoSignal=PERIOD_CURRENT;
input uint PerdidasSignal=3;
input bool Alerta_PC=true;
input bool Alerta_Movil=true;
input bool Alerta_Mail=true;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
  
   ArraySetAsSeries(rates,true);
   ArrayResize(rates,2);
//--- indicator buffers mapping

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
   static datetime PrevTime=0;
   int copied=CopyRates(Symbol(),PeriodoSignal,0,2,rates); 
   if(copied<=0) 
      Print("Fallo al copiar los datos de precios ",GetLastError()); 
   
   if(PrevTime!=rates[0].time){
      if(GlobalVariableCheck("GLOBAL PERDIDAS"))
        {
         double GlobalVariable=GlobalVariableGet("GLOBAL PERDIDAS");
         if(GlobalVariable>=PerdidasSignal)
           {
            if(Alerta_PC)
               Alert("Alerta Señal Global Conjunto - Perdidas= ",DoubleToString(PerdidasSignal,0));
            if(Alerta_Movil)
               SendNotification("Alerta Señal Global Conjunto - Perdidas= "+DoubleToString(PerdidasSignal,0));
            if(Alerta_Mail)
               SendMail("Alerta Conjuntos Global Perdidas","Alerta Señal Global Conjunto - Perdidas= "+DoubleToString(PerdidasSignal,0));
           }

        }
      PrevTime=rates[0].time;
     }

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
