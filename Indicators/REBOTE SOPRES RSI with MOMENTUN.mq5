//+------------------------------------------------------------------+
//|                                  INDICADOR ESTRATEGIA N1 RSI.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2011, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#property description "Indicador para Dibujer RSI en Histograma"

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
double         RSIBuffer[];
double         MomentunBuffer[];

///////variable para alternar
int IndicatorValue;
int IndicatorValue2;
///////////////////////
int TotalLineas;
///////////////////////
double PrecioLinea[100];

//--- Variables para el RSI
input uint PeriodIndicator=14;
input uint LevelIndicatorDown=30;
input uint LevelIndicatorUp=70;
input double LevelMomentunDown=99.50;
input double LevelMomentunUp=100.50;
input int PipsIntervalo=10;
int IndicatorTrend;

input bool IntervaloDeTiempo=true;
input int TiempoInicio=9;
input int TiempoFinal=24;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
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
   SetIndexBuffer(2,RSIBuffer,INDICATOR_DATA);
   SetIndexBuffer(3,MomentunBuffer,INDICATOR_CALCULATIONS);

   ArraySetAsSeries(Color_HistogramBuffer,true);
   ArraySetAsSeries(Color_HistogramColors,true);
   ArraySetAsSeries(RSIBuffer,true);
   ArraySetAsSeries(MomentunBuffer,true);
//////---------------APLICAR RSI-------//////////
   IndicatorValue=iRSI(Symbol(),PERIOD_CURRENT,PeriodIndicator,PRICE_CLOSE);
   IndicatorValue2=iMomentum(Symbol(),PERIOD_CURRENT,14,PRICE_CLOSE);
///////////////////////////////////////////////////
   IndicatorSetString(INDICATOR_SHORTNAME,"HHistogram_RSI_REBOTE_SOP_RES ("+IntegerToString(PeriodIndicator,0,' ')+")");

   PlotIndexSetInteger(0,PLOT_SHOW_DATA,false);

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
   if(CopyBuffer(IndicatorValue,0,0,to_copy,RSIBuffer)<=0)
      return(0);

   if(CopyBuffer(IndicatorValue2,0,0,to_copy,MomentunBuffer)<=0)
      return(0);

   int start=0;
   if(prev_calculated>0)
      start=prev_calculated-1;


   for(int i=start; i<rates_total-14; i++)
     {
      if(RSIBuffer[i]>LevelIndicatorUp)
        {
         IndicatorTrend=1;
        }
      if(RSIBuffer[i]<LevelIndicatorDown)
         IndicatorTrend=-1;
      if(RSIBuffer[i]>LevelIndicatorDown && RSIBuffer[i]<LevelIndicatorUp)
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
      } */

      if(IndicatorTrend==0)
        {
         if(RSIBuffer[i+1]<LevelIndicatorDown)  //SI EL INDICADOR RSI ESTA EN SOBRE COMPRA Y SALE DE ESE BUCLE
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
            if(RSIBuffer[i+1]>LevelIndicatorUp)  // SI EL INDICADOR RSI ESTAN SOBREVENTA Y SALE DE ESE BUCLE
              {
               for(int jk=0; jk<TotalLineas; jk++)
                 {
                  if(high[i]+PipsIntervalo*10*Point()>PrecioLinea[jk] && low[i]-PipsIntervalo*Point()*10<PrecioLinea[jk])
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
