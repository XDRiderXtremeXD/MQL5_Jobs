//+------------------------------------------------------------------+
//|                                Indicador Klinger Divergencia.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 4
#property indicator_plots 2

#property indicator_label1   "FLECHA-BUY"
#property indicator_color1  clrPink
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2   "FLECHA-SELL"
#property indicator_color2  clrAqua
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

double ArrowSignalBuy[];
double ArrowSignalSell[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
input string Settings_Klinger_Oscillator="***Settings_Klinger_Oscillator***";
input uint     InpPeriodFast  =  34;   // Fast period
input uint     InpPeriodSlow  =  55;   // Slow period
input uint     InpPeriodSig   =  13;   // Signal period
input ENUM_APPLIED_VOLUME Force_Volume_Type=VOLUME_TICK;
input string Settings_Bollinger_1="***Settings_EMA***";
input int MA_Periodo=3;
input int MA_Shift=0;
input ENUM_MA_METHOD MA_Modo=MODE_SMMA;

int Klinger_Oscilator;
int MA;

double Klinger_OscilatorBuffer[];
double  MA_Buffer[];


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   PlotIndexSetInteger(0,PLOT_ARROW,172);
   PlotIndexSetInteger(1,PLOT_ARROW,172);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(0,ArrowSignalBuy,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalSell,INDICATOR_DATA);
   SetIndexBuffer(2,MA_Buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,Klinger_OscilatorBuffer,INDICATOR_CALCULATIONS);
   
   ArrayInitialize(ArrowSignalBuy,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalSell,EMPTY_VALUE);
   ArraySetAsSeries(MA_Buffer,false);
   ArraySetAsSeries(Klinger_OscilatorBuffer,false);

   Klinger_Oscilator=iCustom(Symbol(),PERIOD_CURRENT,"Klinger_Oscillator",InpPeriodFast,InpPeriodSlow,InpPeriodSig);
   MA=iMA(Symbol(),PERIOD_CURRENT,MA_Periodo,MA_Shift,MA_Modo,Klinger_Oscilator);

  /*long WindowsTotal= ChartGetInteger(0,CHART_WINDOWS_TOTAL,0); 
  for(int i=0;i<WindowsTotal;i++){
  for(int j=0;j<ChartIndicatorsTotal(0,i);j++)
  if("Indicador CT"==ChartIndicatorName(0,i,j))
  CharIndicator=i;
  }

   ChartIndicatorAdd(0,0,Bollinger_1);*/
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
   static datetime prev_time=0;

   if(BarsCalculated(Klinger_Oscilator)<rates_total)
      return(0);
   if(BarsCalculated(MA)<rates_total)
      return(0);
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(Klinger_Oscilator,0,0,to_copy,Klinger_OscilatorBuffer)<=0)
      return(0);
   if(CopyBuffer(MA,0,0,to_copy,MA_Buffer)<=0)
      return(0);


   if(prev_time==time[rates_total-1])
      return(rates_total);

   int Start=54;
   if(prev_calculated>0)
      Start=rates_total-1;


   for(int i=Start ; i<rates_total; i++)
     {
      ArrowSignalBuy[i]=EMPTY_VALUE;
      ArrowSignalSell[i]=EMPTY_VALUE;
      int IndiceHigh=-1;
      int IndiceLow=-1;
      double Mayor=0;
      double Menor=50000;
      for(int j=2; j<50; j++)
        { if(i==rates_total-1){
          }
         ArrowSignalBuy[i-j]=EMPTY_VALUE;
         if(Klinger_OscilatorBuffer[i-j]>MA_Buffer[i-j])
           { 
            if(Klinger_OscilatorBuffer[i-j+1]<Klinger_OscilatorBuffer[i-j] && Klinger_OscilatorBuffer[i-j]>Klinger_OscilatorBuffer[i-j-1])
              {
               if(Mayor<Klinger_OscilatorBuffer[i-j])
                 {
                  IndiceHigh=i-j;
                  Mayor=Klinger_OscilatorBuffer[i-j];
                 }
              }
           }
         else
            break;
        }
      for(int j=2; j<50; j++)
        {
         ArrowSignalSell[i-j]=EMPTY_VALUE;
         if(Klinger_OscilatorBuffer[i-j]<MA_Buffer[i-j])
           {
            if(Klinger_OscilatorBuffer[i-j+1]>Klinger_OscilatorBuffer[i-j] && Klinger_OscilatorBuffer[i-j]<Klinger_OscilatorBuffer[i-j-1])
              {
               if(Menor>Klinger_OscilatorBuffer[i-j])
                 {
                  IndiceLow=i-j;
                  Menor=Klinger_OscilatorBuffer[i-j];
                 }
              }
           }
         else
            break;
        }
     if(IndiceLow!=-1){
     ArrowSignalSell[IndiceLow]=Klinger_OscilatorBuffer[IndiceLow];
     } 
     
     if(IndiceHigh!=-1){
     ArrowSignalBuy[IndiceHigh]=Klinger_OscilatorBuffer[IndiceHigh];}
     }
   prev_time=time[rates_total-1];
   return(rates_total);
  }
//+------------------------------------------------------------------+
