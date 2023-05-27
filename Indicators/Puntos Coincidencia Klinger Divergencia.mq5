//+------------------------------------------------------------------+
//|                      Puntos Coincidencia Klinger Divergencia.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 6
#property indicator_plots 6

#property indicator_label1   "FLECHA-SELL"
#property indicator_color1  clrPink
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2   "FLECHA-BUY"
#property indicator_color2  clrAqua
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

#property indicator_label3   "Klinger-UP"
#property indicator_type3   DRAW_NONE

#property indicator_label4   "Klinger-DN"
#property indicator_type4   DRAW_NONE

#property indicator_label5   "Coincidencia-UP"
#property indicator_type5   DRAW_NONE

#property indicator_label6   "Coincidencia-DN"
#property indicator_type6   DRAW_NONE

double ArrowSignalBuy[];
double ArrowSignalSell[];

double CoincidenciaBUY[];
double CoincidenciaSELL[];

double Klinger_Puntos_UP[];
double Klinger_Puntos_DN[];
double Divergencia_Puntos_UP[];
double Divergencia_Puntos_DN[];

double Klinger_UP[];
double Klinger_DN[];
double Klinger_Oscilator_Buffer[];
double Signal_Klinger_Buffer[];

int Puntos_Klinger,Puntos_Divergencia,Klinger_Oscilator;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
input int PeriodoEvaluarVelas=100;
input int DistanciaMinimaKlinger=300;
input double CruceNivelUP=200; //CRUCE SELL POR DEBAJO DE
input double CruceNivelDN=-200; //CRUCE BUY POR ARRIBA DE
input int MaximoVelasEspera=10;
input string Settings_Klinger_Oscillator="***Settings_Klinger_Oscillator***";
input uint     InpPeriodFast  =  34;   // Fast period
input uint     InpPeriodSlow  =  55;   // Slow period
input uint     InpPeriodSig   =  13;   // Signal period
input ENUM_APPLIED_VOLUME Force_Volume_Type=VOLUME_TICK;
input string Settings_EMA="***Settings_EMA***";
input int MA_Periodo=3;
input int MA_Shift=0;
input ENUM_MA_METHOD MA_Modo=MODE_SMMA;

input string Settings_Alligator="***Settings_Alligator***";
input int Jaw=13;
input int Jaw_Shift=8;
input int Teeth=8;
input int Teeth_Shift=5;
input int Lips=5;
input int Lips_Shift=3;
input ENUM_MA_METHOD Mode_Alligator=MODE_SMMA;
input ENUM_APPLIED_PRICE AppliedPrice_Alligator=PRICE_MEDIAN;
input string Settings_Bollinger="***Settings_Bollinger_1***";
input int Bollinger_1_Periodo=20;
input int Bollinger_1_Shift=0;
input int Bollinger_1_Desviation=7;

datetime TiempoSell=0,TiempoBuy=0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   PlotIndexSetInteger(0,PLOT_ARROW,172);
   PlotIndexSetInteger(1,PLOT_ARROW,172);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(0,ArrowSignalSell,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalBuy,INDICATOR_DATA);
   SetIndexBuffer(2,Klinger_UP,INDICATOR_DATA);
   SetIndexBuffer(3,Klinger_DN,INDICATOR_DATA);
   SetIndexBuffer(4,CoincidenciaSELL,INDICATOR_DATA);
   SetIndexBuffer(5,CoincidenciaBUY,INDICATOR_DATA);

   ArrayInitialize(CoincidenciaBUY,EMPTY_VALUE);
   ArrayInitialize(CoincidenciaSELL,EMPTY_VALUE);
   ArrayInitialize(Klinger_UP,EMPTY_VALUE);
   ArrayInitialize(Klinger_DN,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalBuy,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalSell,EMPTY_VALUE);

   ArraySetAsSeries(Klinger_Puntos_DN,true);
   ArraySetAsSeries(Klinger_Puntos_UP,true);
   ArraySetAsSeries(Divergencia_Puntos_DN,true);
   ArraySetAsSeries(Divergencia_Puntos_UP,true);

   ArraySetAsSeries(Klinger_Oscilator_Buffer,true);
   ArraySetAsSeries(Signal_Klinger_Buffer,true);

   Puntos_Klinger=iCustom(Symbol(),PERIOD_CURRENT,"Indicador Klinger Divergencia",Settings_Klinger_Oscillator,
                          InpPeriodFast,InpPeriodSlow,InpPeriodSig,Force_Volume_Type,Settings_EMA,MA_Periodo,MA_Shift,MA_Modo);
   Puntos_Divergencia=iCustom(Symbol(),PERIOD_CURRENT,"Divergencia 3 Indicadores",Settings_Alligator
                              ,Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator,Settings_Bollinger
                              ,Bollinger_1_Periodo,Bollinger_1_Shift,Bollinger_1_Desviation);

   Klinger_Oscilator=iCustom(Symbol(),PERIOD_CURRENT,"Klinger_Oscillator",InpPeriodFast,InpPeriodSlow,InpPeriodSig);


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

   if(prev_time==time[rates_total-1])
      return(rates_total);

   int Start=PeriodoEvaluarVelas+1;
   if(prev_calculated>0)
      Start=rates_total-1-20;
   else
     {
      ArrayInitialize(CoincidenciaBUY,EMPTY_VALUE);
      ArrayInitialize(CoincidenciaSELL,EMPTY_VALUE);
      ArrayInitialize(Klinger_UP,EMPTY_VALUE);
      ArrayInitialize(Klinger_DN,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalSell,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalBuy,EMPTY_VALUE);
     }
   for(int shift=Start ; shift<rates_total; shift++)
     {
      if(CopyBuffer(Klinger_Oscilator,0,rates_total-1-shift,4,Klinger_Oscilator_Buffer)<=0)
         return(0);

      if(CopyBuffer(Klinger_Oscilator,1,rates_total-1-shift,4,Signal_Klinger_Buffer)<=0)
         return(0);

      ArrowSignalBuy[shift]=EMPTY_VALUE;
      ArrowSignalSell[shift]=EMPTY_VALUE;

      CoincidenciaBUY[shift-2]=EMPTY_VALUE;
      CoincidenciaSELL[shift-2]=EMPTY_VALUE;
      CoincidenciaBUY[shift]=EMPTY_VALUE;
      CoincidenciaSELL[shift]=EMPTY_VALUE;

      Klinger_UP[shift-2]=EMPTY_VALUE;
      Klinger_DN[shift-2]=EMPTY_VALUE;
      Klinger_UP[shift]=EMPTY_VALUE;
      Klinger_DN[shift]=EMPTY_VALUE;

      if(CopyBuffer(Puntos_Klinger,0,rates_total-1-shift,4,Klinger_Puntos_UP)<=0)
         return(0);
      if(CopyBuffer(Puntos_Klinger,1,rates_total-1-shift,4,Klinger_Puntos_DN)<=0)
         return(0);
      if(CopyBuffer(Puntos_Divergencia,0,rates_total-1-shift,4,Divergencia_Puntos_UP)<=0)
         return(0);
      if(CopyBuffer(Puntos_Divergencia,1,rates_total-1-shift,4,Divergencia_Puntos_DN)<=0)
         return(0);

      if((Klinger_Puntos_UP[2]!=EMPTY_VALUE && Divergencia_Puntos_UP[2]!=EMPTY_VALUE) ||
         (Klinger_Puntos_UP[2]!=EMPTY_VALUE && Divergencia_Puntos_UP[3]!=EMPTY_VALUE) ||
         (Klinger_Puntos_UP[2]!=EMPTY_VALUE && Divergencia_Puntos_UP[2]!=EMPTY_VALUE))
        {
         CoincidenciaSELL[shift-2]=high[shift-2];
         Klinger_UP[shift-2]=Klinger_Puntos_UP[2]!=EMPTY_VALUE?Klinger_Puntos_UP[2]:Klinger_Puntos_UP[3];
        }
      if((Klinger_Puntos_DN[2]!=EMPTY_VALUE && Divergencia_Puntos_DN[2]!=EMPTY_VALUE) ||
         (Klinger_Puntos_DN[2]!=EMPTY_VALUE && Divergencia_Puntos_DN[3]!=EMPTY_VALUE) ||
         (Klinger_Puntos_DN[2]!=EMPTY_VALUE && Divergencia_Puntos_DN[2]!=EMPTY_VALUE))
        {
         CoincidenciaBUY[shift-2]=low[shift-2];
         Klinger_DN[shift-2]=Klinger_Puntos_DN[2]!=EMPTY_VALUE?Klinger_Puntos_DN[2]:Klinger_Puntos_DN[3];
        }


      if(CoincidenciaBUY[shift-2]!=EMPTY_VALUE)
        {
         for(int i=PeriodoEvaluarVelas; i>=3; i--)
           {
            if(CoincidenciaBUY[shift-i]!=EMPTY_VALUE && CoincidenciaBUY[shift-2]<CoincidenciaBUY[shift-i]
               && Klinger_DN[shift-2]>Klinger_DN[shift-i] && MathAbs(Klinger_DN[shift-2]-Klinger_DN[shift-i])>=DistanciaMinimaKlinger)
              {
               TiempoBuy=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasEspera;
               //ArrowSignalBuy[shift-2]=low[shift-2];
               //Print(TimeToString(time[shift-2],TIME_DATE|TIME_MINUTES));
               break;
              }
           }
        }

      if(CoincidenciaSELL[shift-2]!=EMPTY_VALUE)
        {
         for(int i=PeriodoEvaluarVelas; i>=3; i--)
           {
            if(CoincidenciaSELL[shift-i]!=EMPTY_VALUE && CoincidenciaSELL[shift-2]>CoincidenciaSELL[shift-i]
               && Klinger_UP[shift-2]<Klinger_UP[shift-i] && MathAbs(Klinger_UP[shift-i]-Klinger_UP[shift-2])>=DistanciaMinimaKlinger)
              {
               //Print(MathAbs(Klinger_UP[shift-2]-Klinger_UP[shift-i]));
               TiempoSell=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasEspera;
               //ArrowSignalSell[shift-2]=high[shift-2];
               //Print(TimeToString(time[shift-2],TIME_DATE|TIME_MINUTES));
               break;
              }
           }
        }

      if(TiempoSell>=time[shift] && TiempoSell!=0 && Klinger_Oscilator_Buffer[2]>Signal_Klinger_Buffer[2]
         && Klinger_Oscilator_Buffer[1]<Signal_Klinger_Buffer[1] && Signal_Klinger_Buffer[1]<CruceNivelUP)
        {
         //Print(TimeToString(time[shift-1],TIME_DATE|TIME_MINUTES));
         ArrowSignalSell[shift-1]=high[shift-1];
         TiempoSell=0;
        }
      if(TiempoBuy>=time[shift] && TiempoBuy!=0 && Klinger_Oscilator_Buffer[2]<Signal_Klinger_Buffer[2]
         && Klinger_Oscilator_Buffer[1]>Signal_Klinger_Buffer[1] && Signal_Klinger_Buffer[1]>CruceNivelDN)
        {
         ArrowSignalBuy[shift-1]=low[shift-1];
         TiempoBuy=0;
        }
     }
   prev_time=time[rates_total-1];
   return(rates_total);
  }
//+------------------------------------------------------------------+
