//+------------------------------------------------------------------+
//|                          Indicador Media Movil 3_Indicadores.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_plots   2

#property indicator_label1  "SELL"
#property indicator_color1  clrMagenta
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  7

#property indicator_label2  "BUY"
#property indicator_color2  clrAqua
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  7

int Alligator;
int Bollinger_1;
int Bollinger_2;
int SAR;
int ADX;
int Bollinger_ADX;
int EMA_Alligator;
int Divergencia_Puntos_1;
int Divergencia_Puntos_2;
int Divergencia_Puntos_3;
int Divergencia_Puntos_4;
int CCI;
int ADX_2;
int ADX_3;
int ADX_4;
int ADX_5;
int Klinger_Oscillator;
int Bollinger_Klinger;
int SMA_klinger;
int EMA_klinger;

input string Settings_Alligator="***Settings_Alligator***";
input int Jaw=13;
input int Jaw_Shift=8;
input int Teeth=8;
input int Teeth_Shift=5;
input int Lips=5;
input int Lips_Shift=3;
input ENUM_MA_METHOD Mode_Alligator=MODE_SMMA;
input ENUM_APPLIED_PRICE AppliedPrice_Alligator=PRICE_MEDIAN;
input string Settings_Bollinger_1="***Settings_Bollinger_1***";
input int Bollinger_1_Periodo=20;
input int Bollinger_1_Shift=0;
input int Bollinger_1_Desviation=7;
input string Settings_Bollinger_2="***Settings_Bollinger_2***";
input int Bollinger_2_Periodo=10;
input int Bollinger_2_Shift=0;
input int Bollinger_2_Desviation=9;

input string Settings_DivergenciaPuntos_1="***Settings_DivergenciaPuntos_1***";
input int PeriodoDivergenciaPuntos_1=7;
input int DesviacionDivergenciaPuntos_1=2;

input string Settings_DivergenciaPuntos_2="***Settings_DivergenciaPuntos_2***";
input int PeriodoDivergenciaPuntos_2=10;
input int DesviacionDivergenciaPuntos_2=0;

input string Settings_DivergenciaPuntos_3="***Settings_DivergenciaPuntos_3***";
input int PeriodoDivergenciaPuntos_3=20;
input int DesviacionDivergenciaPuntos_3=2;

input string Settings_DivergenciaPuntos_4="***Settings_DivergenciaPuntos_4***";
input int PeriodoDivergenciaPuntos_4=10;
input int DesviacionDivergenciaPuntos_4=2;

input string Settings_Bollinger_EMA_Alligator="***Settings_Bollinger_EMA_Alligator***";
input int Periodo_EMA=50;
input int Shift_EMA=0;
input ENUM_MA_METHOD Mode_EMA=MODE_EMA;
input string Settings_ADX="***Settings_ADX***";
input uint    PeriodoADX=25;
input string Settings_Bollinger_ADX="***Settings_Bollinger_ADX***";
input int Bollinger_ADX_Periodo=25;
input int Bollinger_ADX_Shift=0;
input int Bollinger_ADX_Desviation=2;

input string Settings_Parabolic_Sar="***Settings_Parabolic_SAR***";
input double SAR_Step=0.02;
input double SAR_Maximo=0.2;
input int MaximoVelasSar=6;

input string Settings_CCI="***Settings_CCI***";   ///*---
input uint    PeriodoCCI=28;
input ENUM_APPLIED_PRICE CCI_applied_price=PRICE_TYPICAL;



input string Settings_ADX_2="***Settings_ADX_2***";
input uint    PeriodoADX_2=44;

input string Settings_ADX_3="***Settings_ADX_3***";
input uint    PeriodoADX_3=88;

input string Settings_ADX_4="***Settings_ADX_4***";
input uint    PeriodoADX_4=120;


input string Settings_ADX_5="***Settings_ADX_5***";
input uint    PeriodoADX_5=14;

input string Settings_Klinger_Oscillator="***Settings_Klinger_Oscillator***";   ///*---
input uint     InpPeriodFast  =  34;   // Fast period
input uint     InpPeriodSlow  =  55;   // Slow period
input uint     InpPeriodSig   =  13;   // Signal period
input string Settings_Bollinger_Klinger="***Settings_Bollinger_Klinger***";  ///*---
input int Bollinger_Klinger_Periodo=20;
input int Bollinger_Klinger_Shift=0;
input int Bollinger_Klinger_Desviation=2;

input string Settings_Bollinger_SMA_klinger="***Settings_Bollinger_SMA_klinger***";
input int SMA_klinger_Periodo=19;
input int SMA_klinger_Shift=0;
input ENUM_MA_METHOD SMA_klinger_Mode=MODE_SMA;

input string Settings_Bollinger_EMA_klinger="***Settings_Bollinger_EMA_klinger***";
input int EMA_klinger_Periodo=13;
input int EMA_klinger_Shift=0;
input ENUM_MA_METHOD EMA_klinger_Mode=MODE_EMA;

input string Settings_Alerts="***Settings_Alerts***";
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=true;

double AlligatorBuffer[];
double ADXBuffer[];
double DI_plusBuffer[];
double DI_minusBuffer[];
double Bollinger_1_Buffer_UP[];
double Bollinger_1_Buffer_DN[];
double Bollinger_1_Buffer_Central[];
double Bollinger_2_Buffer_UP[];
double Bollinger_2_Buffer_DN[];
double Bollinger_2_Buffer_Central[];
double Bollinger_ADX_Buffer_DN[];
double Bollinger_ADX_Buffer_UP[];
double EMA_Buffer_Alligator[];
double Divergencia_Puntos_1_Buffer_UP[];
double Divergencia_Puntos_1_Buffer_DN[];
double Divergencia_Puntos_2_Buffer_UP[];
double Divergencia_Puntos_2_Buffer_DN[];
double Divergencia_Puntos_3_Buffer_UP[];
double Divergencia_Puntos_3_Buffer_DN[];
double Divergencia_Puntos_4_Buffer_UP[];
double Divergencia_Puntos_4_Buffer_DN[];
double SARBuffer[];
double CCIBuffer[];
double ADX_2_Buffer[];
double DI_2_plusBuffer[];
double DI_2_minusBuffer[];
double ADX_3_Buffer[];
double DI_3_plusBuffer[];
double DI_3_minusBuffer[];
double ADX_4_Buffer[];
double DI_4_plusBuffer[];
double DI_4_minusBuffer[];
double ADX_5_Buffer[];
double DI_5_plusBuffer[];
double DI_5_minusBuffer[];
double KlingerBuffer[];
double Bollinger_Klinger_Buffer_DN[];
double Bollinger_Klinger_Buffer_UP[];
double Bollinger_Klinger_Buffer_BASE[];
double EMA_Buffer_klinger[];
double SMA_Buffer_klinger[];


double ArrowSignalUP[];
double ArrowSignalDN[];

string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
int VALORVELASOPUESTAS=0;
bool UseExtraDigit=false;
int Text_VelasOpuestas=10;

datetime Buy_Tiempo=0;
datetime Sell_Tiempo=0;
color COLORVO=clrAqua;


MqlRates Rates[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   Alligator=iAlligator(Symbol(),PERIOD_CURRENT,Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator);
   Bollinger_1=iBands(Symbol(),PERIOD_CURRENT,Bollinger_1_Periodo,Bollinger_1_Shift,Bollinger_1_Desviation,Alligator);
   Bollinger_2=iBands(Symbol(),PERIOD_CURRENT,Bollinger_2_Periodo,Bollinger_2_Shift,Bollinger_2_Desviation,Alligator);
   EMA_Alligator=iMA(Symbol(),PERIOD_CURRENT,Periodo_EMA,Shift_EMA,Mode_EMA,Bollinger_1);
   ADX=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX);
   ADX_2=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_2);
   ADX_3=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_3);
   ADX_4=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_4);
   ADX_5=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_5);
   Bollinger_ADX=iBands(Symbol(),PERIOD_CURRENT,Bollinger_ADX_Periodo,Bollinger_ADX_Shift,Bollinger_ADX_Desviation,ADX);
   Divergencia_Puntos_1=iCustom(Symbol(),PERIOD_CURRENT,"Divergencia 3 Indicadores - Separate Window","***Settings_Alligator***",Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator,"***Settings_Bollinger_1***"
                                ,PeriodoDivergenciaPuntos_1,0,DesviacionDivergenciaPuntos_1);
   Divergencia_Puntos_2=iCustom(Symbol(),PERIOD_CURRENT,"Divergencia 3 Indicadores - Separate Window","***Settings_Alligator***",Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator,"***Settings_Bollinger_1***"
                                ,PeriodoDivergenciaPuntos_2,0,DesviacionDivergenciaPuntos_2);
   Divergencia_Puntos_3=iCustom(Symbol(),PERIOD_CURRENT,"Divergencia 3 Indicadores - Separate Window","***Settings_Alligator***",Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator,"***Settings_Bollinger_1***"
                                ,PeriodoDivergenciaPuntos_3,0,DesviacionDivergenciaPuntos_3);
   Divergencia_Puntos_4=iCustom(Symbol(),PERIOD_CURRENT,"Divergencia 3 Indicadores - Separate Window","***Settings_Alligator***",Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator,"***Settings_Bollinger_1***"
                                ,PeriodoDivergenciaPuntos_4,0,DesviacionDivergenciaPuntos_4);
   SAR=iSAR(Symbol(),PERIOD_CURRENT,SAR_Step,SAR_Maximo);
   CCI=iCCI(Symbol(),PERIOD_CURRENT,PeriodoCCI,CCI_applied_price);
   Klinger_Oscillator=iCustom(Symbol(),PERIOD_CURRENT,"Klinger_Oscillator",InpPeriodFast,InpPeriodSlow,InpPeriodSig);
   Bollinger_Klinger=iBands(Symbol(),PERIOD_CURRENT,Bollinger_Klinger_Periodo,Bollinger_Klinger_Shift,Bollinger_Klinger_Desviation,Klinger_Oscillator);
   EMA_klinger=iMA(Symbol(),PERIOD_CURRENT,EMA_klinger_Periodo,EMA_klinger_Shift,EMA_klinger_Mode,Klinger_Oscillator);
   SMA_klinger=iMA(Symbol(),PERIOD_CURRENT,SMA_klinger_Periodo,EMA_klinger_Shift,EMA_klinger_Mode,Klinger_Oscillator);



   IndicatorSetString(INDICATOR_SHORTNAME,"Indicador Estrellas EMA");
//172, 115
   SetIndexBuffer(0,ArrowSignalUP);
   SetIndexBuffer(1,ArrowSignalDN);

   PlotIndexSetInteger(0,PLOT_ARROW,118);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(1,PLOT_ARROW,118);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   ArraySetAsSeries(Rates,true);
   ArraySetAsSeries(AlligatorBuffer,true);
   ArraySetAsSeries(Bollinger_1_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_1_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_1_Buffer_Central,true);
   ArraySetAsSeries(Bollinger_2_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_2_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_2_Buffer_Central,true);
   ArraySetAsSeries(Bollinger_ADX_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_ADX_Buffer_UP,true);
   ArraySetAsSeries(EMA_Buffer_Alligator,true);
   ArraySetAsSeries(Divergencia_Puntos_1_Buffer_DN,true);
   ArraySetAsSeries(Divergencia_Puntos_1_Buffer_UP,true);
   ArraySetAsSeries(Divergencia_Puntos_2_Buffer_DN,true);
   ArraySetAsSeries(Divergencia_Puntos_2_Buffer_UP,true);
   ArraySetAsSeries(Divergencia_Puntos_3_Buffer_DN,true);
   ArraySetAsSeries(Divergencia_Puntos_3_Buffer_UP,true);
   ArraySetAsSeries(Divergencia_Puntos_4_Buffer_DN,true);
   ArraySetAsSeries(Divergencia_Puntos_4_Buffer_UP,true);
   ArraySetAsSeries(SARBuffer,true);
   ArraySetAsSeries(CCIBuffer,true);
   ArraySetAsSeries(DI_plusBuffer,true);
   ArraySetAsSeries(DI_minusBuffer,true);
   ArraySetAsSeries(DI_2_plusBuffer,true);
   ArraySetAsSeries(DI_2_minusBuffer,true);
   ArraySetAsSeries(DI_3_plusBuffer,true);
   ArraySetAsSeries(DI_3_minusBuffer,true);
   ArraySetAsSeries(DI_4_plusBuffer,true);
   ArraySetAsSeries(DI_4_minusBuffer,true);
   ArraySetAsSeries(DI_5_plusBuffer,true);
   ArraySetAsSeries(DI_5_minusBuffer,true);
   ArraySetAsSeries(KlingerBuffer,true);
   ArraySetAsSeries(Bollinger_Klinger_Buffer_BASE,true);
   ArraySetAsSeries(Bollinger_Klinger_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_Klinger_Buffer_UP,true);
   ArraySetAsSeries(SMA_Buffer_klinger,true);
   ArraySetAsSeries(EMA_Buffer_klinger,true);


   switch(_Period)
     {
      case PERIOD_M1:
         period="M1";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VALORVELASOPUESTAS=1;
         break;
      case PERIOD_M5:
         period="M5";

         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VALORVELASOPUESTAS=1;

         break;
      case PERIOD_M15:
         period="M15";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VALORVELASOPUESTAS=4;

         break;
      case PERIOD_M30:
         period="M30";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VALORVELASOPUESTAS=4;
         break;
      case PERIOD_H1:
         period="H1";
         Pointer_Offset=30;
         High_Offset=20;
         Offset_Subida_VelaOpuesta=10;
         Offset_Caida_VelaOpuesta=30;
         IncOffset=40;
         VALORVELASOPUESTAS=4;
         break;
      case PERIOD_H4:
         period="H4";
         Pointer_Offset=70;
         High_Offset=150;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=120;
         VALORVELASOPUESTAS=10;
         break;
      case PERIOD_D1:
         period="D1";
         Pointer_Offset=150;
         High_Offset=220;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=180;
         VALORVELASOPUESTAS=15;
         break;
      case PERIOD_W1:
         period="W1";
         Pointer_Offset=9;
         High_Offset=35;
         Offset_Subida_VelaOpuesta=80;
         Offset_Caida_VelaOpuesta=80;
         IncOffset=35;
         VALORVELASOPUESTAS=50;
         break;
      case PERIOD_MN1:
         period="MN";
         Pointer_Offset=9;
         High_Offset=45;
         Offset_Subida_VelaOpuesta=140;
         Offset_Caida_VelaOpuesta=140;
         IncOffset=45;
         VALORVELASOPUESTAS=50;
         break;
     }

   if(UseExtraDigit)
     {
      Pointer_Offset*=10;
      High_Offset*=10;
      Offset_Subida_VelaOpuesta*=10;
      Offset_Caida_VelaOpuesta*=10;
      IncOffset*=10;
      VALORVELASOPUESTAS=50;
     }

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
   static datetime prevTime=0;
   if(prevTime==time[rates_total-1])
      return(rates_total);

   int Start=100;
   if(prev_calculated==0)
     {
      Start=100;
      ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
     }
   else
      Start=rates_total-1;

   for(int shift=Start; shift<rates_total; shift++)
     {
      ArrowSignalUP[shift]=EMPTY_VALUE;
      ArrowSignalDN[shift]=EMPTY_VALUE;
      int CumOffset=0;
      ArrayResize(Rates,10);
      int copied=CopyRates(Symbol(),PERIOD_CURRENT,rates_total-1-shift,8,Rates);
      CopyBuffer(Bollinger_1,1,rates_total-1-shift,3,Bollinger_1_Buffer_UP);
      CopyBuffer(Bollinger_1,2,rates_total-1-shift,3,Bollinger_1_Buffer_DN);
      CopyBuffer(Bollinger_1,0,rates_total-1-shift,40,Bollinger_1_Buffer_Central);
      CopyBuffer(Bollinger_2,1,rates_total-1-shift,3,Bollinger_2_Buffer_UP);
      CopyBuffer(Bollinger_2,2,rates_total-1-shift,3,Bollinger_2_Buffer_DN);
      CopyBuffer(Bollinger_2,0,rates_total-1-shift,40,Bollinger_2_Buffer_Central);
      CopyBuffer(ADX,0,rates_total-1-shift,45,ADXBuffer);
      CopyBuffer(ADX,1,rates_total-shift-1,45,DI_plusBuffer);
      CopyBuffer(ADX,2,rates_total-shift-1,45,DI_minusBuffer);
      CopyBuffer(ADX_2,0,rates_total-1-shift,46,ADX_2_Buffer);
      CopyBuffer(ADX_2,1,rates_total-shift-1,46,DI_2_plusBuffer);
      CopyBuffer(ADX_2,2,rates_total-shift-1,46,DI_2_minusBuffer);
      CopyBuffer(ADX_3,0,rates_total-1-shift,47,ADX_3_Buffer);
      CopyBuffer(ADX_3,1,rates_total-shift-1,47,DI_3_plusBuffer);
      CopyBuffer(ADX_3,2,rates_total-shift-1,47,DI_3_minusBuffer);
      CopyBuffer(ADX_4,0,rates_total-1-shift,48,ADX_4_Buffer);
      CopyBuffer(ADX_4,1,rates_total-shift-1,48,DI_4_plusBuffer);
      CopyBuffer(ADX_4,2,rates_total-shift-1,48,DI_4_minusBuffer);
      CopyBuffer(Bollinger_ADX,1,rates_total-1-shift,45,Bollinger_ADX_Buffer_UP);
      CopyBuffer(ADX_5,1,rates_total-shift-1,48,DI_4_plusBuffer);
      CopyBuffer(ADX_5,2,rates_total-shift-1,48,DI_4_minusBuffer);
      CopyBuffer(EMA_Alligator,0,rates_total-1-shift,40,EMA_Buffer_Alligator);
      CopyBuffer(Divergencia_Puntos_1,0,rates_total-1-shift,7,Divergencia_Puntos_1_Buffer_UP);
      CopyBuffer(Divergencia_Puntos_1,1,rates_total-1-shift,7,Divergencia_Puntos_1_Buffer_DN);
      CopyBuffer(Divergencia_Puntos_2,0,rates_total-1-shift,7,Divergencia_Puntos_2_Buffer_UP);
      CopyBuffer(Divergencia_Puntos_2,1,rates_total-1-shift,7,Divergencia_Puntos_2_Buffer_DN);
      CopyBuffer(Divergencia_Puntos_3,0,rates_total-1-shift,7,Divergencia_Puntos_3_Buffer_UP);
      CopyBuffer(Divergencia_Puntos_3,1,rates_total-1-shift,7,Divergencia_Puntos_3_Buffer_DN);
      CopyBuffer(Divergencia_Puntos_4,0,rates_total-1-shift,7,Divergencia_Puntos_4_Buffer_UP);
      CopyBuffer(Divergencia_Puntos_4,1,rates_total-1-shift,7,Divergencia_Puntos_4_Buffer_DN);
      CopyBuffer(SAR,0,rates_total-1-shift,3,SARBuffer);
      CopyBuffer(CCI,0,rates_total-shift-1,4,CCIBuffer);
      CopyBuffer(Klinger_Oscillator,0,rates_total-shift-1,4,KlingerBuffer);
      CopyBuffer(Bollinger_Klinger,2,rates_total-shift-1,4,Bollinger_Klinger_Buffer_DN);
      CopyBuffer(Bollinger_Klinger,1,rates_total-shift-1,4,Bollinger_Klinger_Buffer_UP);
      CopyBuffer(Bollinger_Klinger,0,rates_total-shift-1,4,Bollinger_Klinger_Buffer_BASE);
      CopyBuffer(SMA_klinger,0,rates_total-1-shift,40,SMA_Buffer_klinger);
      CopyBuffer(EMA_klinger,0,rates_total-1-shift,40,EMA_Buffer_klinger);

      ResetLastError();


      if(DI_4_plusBuffer[0]>20 && DI_3_plusBuffer[0]>22 && DI_2_plusBuffer[0]>25 && DI_plusBuffer[0]>25 && KlingerBuffer[1]<EMA_Buffer_klinger[1] && KlingerBuffer[0]>EMA_Buffer_klinger[0] && KlingerBuffer[1]<SMA_Buffer_klinger[1] && KlingerBuffer[0]>SMA_Buffer_klinger[0])
        {
         bool AlertaCondicion1=true;
         for(int j=1; j<36; j++)
           {
            if((DI_4_plusBuffer[j]>20 && DI_3_plusBuffer[j]>22 && DI_2_plusBuffer[j]>25 && DI_plusBuffer[j]>25) && (DI_4_plusBuffer[j+1]>20 && DI_3_plusBuffer[j+1]>22 && DI_2_plusBuffer[j+1]>25 && DI_plusBuffer[j+1]>25)    && (DI_4_plusBuffer[j+2]>20 && DI_3_plusBuffer[j+2]>22 && DI_2_plusBuffer[j+2]>25 && DI_plusBuffer[j+2]>25)               && (DI_4_plusBuffer[j+3]>20 && DI_3_plusBuffer[j+3]>22 && DI_2_plusBuffer[j+3]>25 && DI_plusBuffer[j+3]>25))
              {
               AlertaCondicion1=false;
               break;

              }
           }

         if(AlertaCondicion1)
           {
            //MarkPattern(GetName("VelasOPV",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "VO", Text_VelasOpuestas, COLORVO);

            Buy_Tiempo=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasSar;
           }
        }

      if(DI_4_minusBuffer[0]>20 && DI_3_minusBuffer[0]>22 && DI_2_minusBuffer[0]>25 && DI_minusBuffer[0]>25 && KlingerBuffer[1]>EMA_Buffer_klinger[1] && KlingerBuffer[0]<EMA_Buffer_klinger[0] && KlingerBuffer[1]>SMA_Buffer_klinger[1] && KlingerBuffer[0]<SMA_Buffer_klinger[0])

        {
         bool AlertaCondicion1=true;
         for(int j=1; j<36; j++)
           {
            if((DI_4_minusBuffer[j]>20 && DI_3_minusBuffer[j]>22 && DI_2_minusBuffer[j]>25 && DI_minusBuffer[j]>27) && (DI_4_minusBuffer[j+1]>20 && DI_3_minusBuffer[j+1]>22 && DI_2_minusBuffer[j+1]>25 && DI_minusBuffer[j+1]>27)  && (DI_4_minusBuffer[j+2]>20 && DI_3_minusBuffer[j+2]>22 && DI_2_minusBuffer[j+2]>25 && DI_minusBuffer[j+2]>27)         && (DI_4_minusBuffer[j+3]>20 && DI_3_minusBuffer[j+3]>22 && DI_2_minusBuffer[j+3]>25 && DI_minusBuffer[j+3]>27))
              {
               AlertaCondicion1=false;
               break;

              }
           }


         if(AlertaCondicion1)
           {
            //MarkPattern(GetName("VelasOPV",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"VO", Text_VelasOpuestas, COLORVO);
            Sell_Tiempo=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasSar;
           }
        }

      if(Buy_Tiempo>time[shift]  && Buy_Tiempo!=0)
        {
         CumOffset = CumOffset+IncOffset;
         ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         if(shift==rates_total-1)
           {
            if(AlertPC)
               Alert("Operacion Buy en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
            if(AlertMovil)
               SendNotification("Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
            if(AlertMail)
               SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
           }
          Buy_Tiempo=0;
        }

      if(Sell_Tiempo>time[shift]  && Sell_Tiempo!=0)
        {
         CumOffset = CumOffset+IncOffset;
         ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         if(shift==rates_total-1)
           {
            if(AlertPC)
               Alert("Operacion Sell en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
            if(AlertMovil)
               SendNotification("Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
            if(AlertMail)
               SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
           }
         Sell_Tiempo=0;
        }
     }
   prevTime=time[rates_total-1];
//--- return value of prev_calculated for next call
   return(rates_total);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void MarkPattern(const string name,const datetime time,const double price,const string shortname,const int fontsize,const color patterncolor)
  {
   ObjectCreate(0,name,OBJ_TEXT,0,time,price);
   ObjectSetString(0,name,OBJPROP_TEXT,shortname);
   ObjectSetString(0,name,OBJPROP_FONT,"Times New Roman");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,fontsize);
   ObjectSetInteger(0,name,OBJPROP_COLOR,patterncolor);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string GetName(string aName,datetime timeshift)
  {
   return(aName + DoubleToString(timeshift, 0));
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,0,OBJ_TEXT);
   Comment("");
  }
//+------------------------------------------------------------------+
