//+------------------------------------------------------------------+
//|                                                          VMA.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "ionone"
#property link      "www.forex-station.com"

#property indicator_chart_window
#property indicator_buffers 3
#property indicator_plots 1

#property indicator_label1  "ColorLine" 
#property indicator_type1   DRAW_COLOR_LINE 
//--- estableceremos 5 colores para colorear cada barra (se almacenan en un array especial) 
#property indicator_color1  clrGreen,clrRed,clrBlue// (se puede especificar hasta 64 colores) 
#property indicator_style1  STYLE_SOLID 
#property indicator_width1  3 

input int VMA_Length = 14;

double         ColorLineBuffer[]; 
//--- búfer para almacenar el color del trazado de la línea en cada barra 
double         ColorLineColors[]; 

//double up[];
//double dn[];
//double flat[];
double vma[2];

datetime tim;
double pdmS;
double mdmS;
double pdiS;
double mdiS;
double iS[];

int trend = -1;

int OnInit()
{
   //SetIndexBuffer(0,up,INDICATOR_DATA);
   //SetIndexBuffer(1,dn,INDICATOR_DATA);
   //SetIndexBuffer(2,flat,INDICATOR_DATA);   
   SetIndexBuffer(0,ColorLineBuffer,INDICATOR_DATA); 
   SetIndexBuffer(1,ColorLineColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,iS,INDICATOR_CALCULATIONS); 
   
   ArraySetAsSeries(ColorLineBuffer,true);
   ArraySetAsSeries(ColorLineBuffer,true);
   //ArraySetAsSeries(flat,true);
   ArraySetAsSeries(iS,true);
   
   return(INIT_SUCCEEDED);
}
void OnDeinit(const int reason)
{
   
}


void Shift(double& d[])
{
   for (int i = 10000-1; i > 0; i--)
   {
      d[i] = d[i-1];
   }
}


int OnCalculate (const int rates_total,      // tamaño de series temporales de entrada
                 const int prev_calculated,  // procesado de barras en la anterior llamada
                 const datetime& time[],     // Time
                 const double& open[],       // Open
                 const double& high[],       // High
                 const double& low[],        // Low
                 const double& close[],      // Close
                 const long& tick_volume[],  // Tick Volume
                 const long& volume[],       // Real Volume
                 const int& spread[]         // Spread
   ){
   
 
   int i,counted_bars = prev_calculated;
   if(counted_bars<0) return(-1);
   if(counted_bars>0) counted_bars--;   
   int limit=MathMin(Bars(Symbol(),PERIOD_CURRENT)-counted_bars-1,Bars(Symbol(),PERIOD_CURRENT)-1);
         
   for(i=limit-1; i>0; i--)
   { 
      if (iTime(NULL,0,i+1) != tim)
      {
         tim = iTime(NULL,0,i+1);
         
         vma[1] = vma[0];
      }
      
      double k = 1.0/double(VMA_Length);
      double pdm = MathMax((iClose(NULL,0,i) - iClose(NULL,0,i+1)), 0);
      double mdm = MathMax((iClose(NULL,0,i+1) - iClose(NULL,0,i)), 0);
      pdmS = ((1 - k)*pdmS + k*pdm);
      mdmS = ((1 - k)*mdmS + k*mdm);
      double s = pdmS + mdmS;
      
      double pdi = 0;
      double mdi = 0;
      if (s != 0) 
      {
         pdi = pdmS/s;
         mdi = mdmS/s;
      }
      
      pdiS = (1 - k)*pdiS + k*pdi;
      mdiS = (1 - k)*mdiS + k*mdi;
      double d = fabs(pdiS - mdiS);
      double s1 = pdiS + mdiS;
            
      if (s1 != 0)         
         iS[i] = ((1 - k)*iS[i+1] + k*d/s1);
         
      double hhv = iS[ArrayMaximum(iS, VMA_Length, i)]; 
      double llv = iS[ArrayMinimum(iS, VMA_Length, i)]; 
      double d1 = hhv - llv;
      double vI = 0;
      if (d1 != 0) 
         vI = (iS[i] - llv)/d1;      
      
      vma[0] = (1 - k*vI)*vma[1] + k*vI*iClose(NULL,0,i);
             
      if (vma[0] > vma[1]) 
      {  
         ColorLineBuffer[i] = vma[0]; 
         ColorLineColors[i]=0;
      }
      else if (vma[0] < vma[1]) 
      {  
         ColorLineBuffer[i] = vma[0]; 
         ColorLineColors[i]=1;
      }
      else 
      {  
         ColorLineBuffer[i] = vma[0]; 
         ColorLineColors[i]=2;
      }
   }  
 
   return(rates_total);
         
}


//+-------------------------------------------------------------------
//|                                                                  
//+-------------------------------------------------------------------