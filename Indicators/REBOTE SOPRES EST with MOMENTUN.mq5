//+------------------------------------------------------------------+
//|                                      INDICADOR ESTRATEGIA N1.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Copyright 2011, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#property description "Indicador para Dibujer EST en Histograma"

#property indicator_separate_window
#property indicator_buffers 4
#property indicator_plots   1
//--- parámetros input
//--- plot Color_Histogram
#property indicator_label1  "Color_Histogram"
#property indicator_type1   DRAW_COLOR_HISTOGRAM
//--- estableceremos 8 colores para colorear los segmentos (se guardan en un array especial)
#property indicator_color1  clrMagenta,clrDarkTurquoise,clrOrange,clrLimeGreen
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

double         Color_HistogramBuffer[];
//--- búfer para los índices de colores
double         Color_HistogramColors[];
//--- bufer para los indices RSI
double         ESTBuffer[];
double         MomentunBuffer[];

int TotalLineas;

///////variable para alternar
int IndicatorValue;
int IndicatorValue2;
///////////////////////
double PrecioLinea[100];

//--- Variables para el RSI
input uint PeriodK=5;
input uint PeriodD=3;
input uint PeriodSlowing=3;
input uint LevelIndicatorDown=20;
input uint LevelIndicatorUp=80;
input double LevelMomentunDown=99.50;
input double LevelMomentunUp=100.50;

input int PipsIntervalo=10;
int IndicatorTrend;

int TiempoInicio=9;
int TiempoFinal=24;

input bool IntervaloDeTiempo=true;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   if(PeriodSeconds(PERIOD_CURRENT)>PeriodSeconds(PERIOD_H1))
     {
      return(0);
     }

   ArrayInitialize(PrecioLinea,0);

   for(int k=0; k<ObjectsTotal(0,0,OBJ_HLINE); k++)
     {
      string NameSymbol=ObjectName(0,k,0,OBJ_HLINE);
      ObjectGetDouble(0,NameSymbol,OBJPROP_PRICE,0,PrecioLinea[k]);
      Print("Precio [",k,"]= ",PrecioLinea[k]);
      TotalLineas=k+1;
      //if(StringFind(NameSymbol,"TABULADOR ",0)!=-1)
      //{
      // ObjectDelete(0,NameSymbol);
      //}
     }

   Print(TotalLineas);


   SetIndexBuffer(0,Color_HistogramBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,Color_HistogramColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,ESTBuffer,INDICATOR_DATA);
   SetIndexBuffer(3,MomentunBuffer,INDICATOR_CALCULATIONS);

   ArraySetAsSeries(Color_HistogramBuffer,true);
   ArraySetAsSeries(Color_HistogramColors,true);
   ArraySetAsSeries(ESTBuffer,true);
   ArraySetAsSeries(MomentunBuffer,true);
//////---------------APLICAR RSI-------//////////
   IndicatorValue=iStochastic(Symbol(),PERIOD_CURRENT,PeriodK,PeriodD,PeriodSlowing,MODE_SMA,STO_LOWHIGH);
   IndicatorValue2=iMomentum(Symbol(),PERIOD_CURRENT,14,PRICE_CLOSE);
///////////////////////////////////////////////////
   IndicatorSetString(INDICATOR_SHORTNAME,"Histogram_EST_REBOTE_SOP_RES ("+IntegerToString(PeriodK,0,' ')+" "+
                      IntegerToString(PeriodD,0,' ')+" "+
                      IntegerToString(PeriodSlowing,0,' ')+")"
                     );

   PlotIndexSetInteger(0,PLOT_SHOW_DATA,false);
//IndicatorSetString(INDICATOR_SHORTNAME," ");

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
   ArraySetAsSeries(time,true);
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);

   MqlDateTime TIME;

   if(BarsCalculated(IndicatorValue)<rates_total)
      return(0);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
////// o SIGNAL_LINE............
   if(CopyBuffer(IndicatorValue,MAIN_LINE,0,to_copy,ESTBuffer)<=0)
      return(0);
   if(CopyBuffer(IndicatorValue2,0,0,to_copy,MomentunBuffer)<=0)
      return(0);

   int start=0;
   if(prev_calculated>0)
      start=prev_calculated-1;

   for(int i=start; i<rates_total-14; i++)
     {
      if(ESTBuffer[i]>LevelIndicatorUp)
        {
         IndicatorTrend=1;
        }
      if(ESTBuffer[i]<LevelIndicatorDown)
         IndicatorTrend=-1;
      if(ESTBuffer[i]>LevelIndicatorDown && ESTBuffer[i]<LevelIndicatorUp)
         IndicatorTrend=0;
      //---
      if(IndicatorTrend>0)
        {
         Color_HistogramBuffer[i]=0;
         Color_HistogramColors[i]=0;
        }
      //---
      if(IndicatorTrend<0)
        {
         Color_HistogramBuffer[i]=0;
         Color_HistogramColors[i]=0;
        }

      /*
       TimeToStruct(time[i],TIME);

       bool TIMEBOOL=false;

       if(TiempoFinal<TiempoInicio){
       if(TIME.hour>=TiempoInicio || TIME.hour<=TiempoFinal)
       TIMEBOOL=true;
       }
       else{
       if(TIME.hour>=TiempoInicio && TIME.hour<=TiempoFinal)
       TIMEBOOL=true;
       }

       if(TIMEBOOL==true && IntervaloDeTiempo==true){
         Color_HistogramBuffer[i]=0;
         Color_HistogramColors[i]=0;
       }*/

      if(IndicatorTrend==0)
        {
         if(ESTBuffer[i+1]<LevelIndicatorDown)  //SI EL INDICADOR RSI ESTA EN SOBRE COMPRA Y SALE DE ESE BUCLE
           {
            for(int jk=0; jk<TotalLineas; jk++)
              {
               if(high[i]+PipsIntervalo*10*Point()>PrecioLinea[jk] && low[i]-PipsIntervalo*Point()*10<PrecioLinea[jk])
                 {
                  if(MomentunBuffer[i]<LevelMomentunDown|| MomentunBuffer[i+1]<LevelMomentunDown ||MomentunBuffer[i+2]<LevelMomentunDown)
                    {
                     Color_HistogramBuffer[i]=1;
                     Color_HistogramColors[i]=1;
                    }
                  else
                    {
                     Color_HistogramBuffer[i]=1;
                     Color_HistogramColors[i]=3;
                    }

                 }
              }


           }
         else
            if(ESTBuffer[i+1]>LevelIndicatorUp)  // SI EL INDICADOR RSI ESTAN SOBREVENTA Y SALE DE ESE BUCLE
              {
               for(int jk=0; jk<TotalLineas; jk++)
                 {
                  if(high[i]+PipsIntervalo*Point()*10>PrecioLinea[jk] && low[i]-PipsIntervalo*Point()*10<PrecioLinea[jk])
                    {
                     if(MomentunBuffer[i]>LevelMomentunUp|| MomentunBuffer[i+1]>LevelMomentunUp ||MomentunBuffer[i+2]>LevelMomentunUp)
                       {
                        Color_HistogramBuffer[i]=1;
                        Color_HistogramColors[i]=0;
                       }
                     else
                       {
                        Color_HistogramBuffer[i]=1;
                        Color_HistogramColors[i]=2;
                       }
                    }
                 }

              }
            else
              {
               Color_HistogramBuffer[i]=0;
              }
        }
     }
   return(rates_total);
  }
//+------------------------------------------------------------------+
