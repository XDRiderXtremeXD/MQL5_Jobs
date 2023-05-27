//+------------------------------------------------------------------+
//|                                                ZigZag Angulo.mq5 |
//|                                                                  |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright ""
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window
#property  indicator_buffers 2
#property  indicator_plots 1


#property indicator_label1  "Angulo"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+

input string s4 = "==================================ZigZag==================================";//==========
input string Nombre_ZigZag= "Examples/ZigZag";
input int InpDepth=12;     // Depth
input int InpDeviation=5;  // Deviation
input int InpBackstep=3;   // Backstep

double ZZ_Buffer[];
double Valor[];
int Handle_ZZ;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   SetIndexBuffer(0,Valor,INDICATOR_DATA);
   SetIndexBuffer(1,ZZ_Buffer,INDICATOR_DATA);
   ArraySetAsSeries(ZZ_Buffer,false);

   Handle_ZZ=iCustom(Symbol(),PERIOD_CURRENT,Nombre_ZigZag, InpDepth, InpDeviation, InpBackstep);

   if(Handle_ZZ==INVALID_HANDLE)
     {
      Print("ERROR: ZigZag MAL CONFIGURADO");
      return(INIT_FAILED);
     }
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
   ArraySetAsSeries(high,false);
   ArraySetAsSeries(low,false);
   ArraySetAsSeries(time,false);


   if(BarsCalculated(Handle_ZZ)<rates_total)
      return(0);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
////// NAIN LINE............

   static datetime Tiempo=0;
   if(Tiempo!=time[rates_total-1])
     {
      if(CopyBuffer(Handle_ZZ,0,0,rates_total,ZZ_Buffer)<=0)
         return(0);

      Tiempo=time[rates_total-1];
     }

   int START;
   if(prev_calculated==0)
     {
      START=InpDepth+InpDeviation+InpBackstep+1;
     }
   else
      START=rates_total-2;

//Comment(rates_total-1-IndiceStart,"  Indice ",rates_total-1-Indice);
   for(int shift = START; shift < rates_total ; shift++)
     {
      bool Valido=true;
      Valor[shift]=Valor[shift-1];
      double ZigZag = ZZ_Buffer[shift];
      
      if(ZigZag>0 &&  ZigZag!=EMPTY_VALUE)
        {
         Valido=false;
         int Indice=0;
         double ZigZag2=0;
         for(int i=shift-1; i>0; i--)
           {
            ZigZag2 = ZZ_Buffer[i];
            if(ZigZag2>0 &&  ZigZag2!=EMPTY_VALUE)
              {
               Indice=i;
               Valido=true;
               break;
              }
           }
         if(Valido && Indice!=0)
           {
            double X=shift-Indice+1;
            double Y_H=(MathAbs(ZigZag-ZigZag2))/Point();
            double Angulo_H=MathArctan(Y_H/X)*(180.0/M_PI);
            Valor[shift]=Angulo_H;
           }
        }
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
