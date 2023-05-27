//+------------------------------------------------------------------+
//|                                                    Conjuntos.mq5 |
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

int AwesomeOscilator;
int Alligator;
int Bollinger_1;
int Bollinger_2;
int SAR;
int ADX_2;
int Bollinger_ADX;
int EMA_Alligator;
int Divergencia_Puntos_1;
int Divergencia_Puntos_2;
int Divergencia_Puntos_3;
int Divergencia_Puntos_4;
int CCI;
int ADX;
int Bollinger_2_2;
int ForceIndex;
int Bollinger_ForceIndex;
int Klinger_Oscilator;
int Bollinger_Klinger;
int ADX_3;
int ADX_4;
int Bollinger_ADX_2;
int Bollinger_3_K;
int ADX_K;
int ADX_2_K;
int ADX_3_K;
int ADX_4_K;
int ADX_5_K;
int Bollinger_ADX_K;
int Gator_Oscilator;
int CCI_K;
int Bollinger_CCI_K;
int Bollinger_ADX_Diferentes;
int ADX_Dif;
int ADX_2_Dif;
int ADX_3_Dif;
int ADX_4_Dif;
int ADX_Simple4;
//int ADX_5_Dif;

int EMA_klinger;
int SMA_klinger;

int Estocastico;
int Bollinger_Estocastico;

datetime Buy_Tiempo_Confirmacion=0,Sell_Tiempo_Confirmacion=0;

// GLOBALES GLOBALES GLOBALES GLOBALES GLOBALES GLOBALES GLOBALES GLOBALES GLOBALES GLOBALES
input string Separador1="----------------------------------------";///*---
input string Settings_Global="---*** SETTINGS GLOBAL ***---";///*---
input string Separador2="----------------------------------------";
input bool Solo_Confirmacion=true;
input string Settings_Conf="***Settings_Patron_Confirmacion***";///*---
input color ColorConfirmacion=clrYellow;
input int TerminoMinuto1=2;
input int TerminoMinuto2=6;
input int MaximoVelasConf=10;
input string Settings_Lineas_Confirmacion="***------------------------***";///*---
input bool Ver_Lineas_Resultados=true;
input color ColorPerdida=clrRed;
input color ColorGanada=clrGreen;
input ENUM_LINE_STYLE EstiloLinea=STYLE_SOLID;
input string Settings_Alligator="***Settings_Alligator***";///*---
input int Jaw=13;
input int Jaw_Shift=8;
input int Teeth=8;
input int Teeth_Shift=5;
input int Lips=5;
input int Lips_Shift=3;
input ENUM_MA_METHOD Mode_Alligator=MODE_SMMA;
input ENUM_APPLIED_PRICE AppliedPrice_Alligator=PRICE_MEDIAN;
input string Settings_Bollinger_1="***Settings_Bollinger_1***";///*---
input int Bollinger_1_Periodo=20;
input int Bollinger_1_Shift=0;
input int Bollinger_1_Desviation=7;

input string Settings_DivergenciaPuntos_1="***Settings_DivergenciaPuntos_1***";///*---
input int PeriodoDivergenciaPuntos_1=7;
input int DesviacionDivergenciaPuntos_1=2;

input string Settings_DivergenciaPuntos_2="***Settings_DivergenciaPuntos_2***";///*---
input int PeriodoDivergenciaPuntos_2=10;
input int DesviacionDivergenciaPuntos_2=0;

input string Settings_DivergenciaPuntos_3="***Settings_DivergenciaPuntos_3***";///*---
input int PeriodoDivergenciaPuntos_3=20;
input int DesviacionDivergenciaPuntos_3=2;

input string Settings_DivergenciaPuntos_4="***Settings_DivergenciaPuntos_4***";///*---
input int PeriodoDivergenciaPuntos_4=10;
input int DesviacionDivergenciaPuntos_4=2;

input string Settings_Bollinger_EMA_Alligator="***Settings_Bollinger_EMA_Alligator***";///*---
input int Periodo_EMA=50;
input int Shift_EMA=0;
input ENUM_MA_METHOD Mode_EMA=MODE_EMA;

input string Settings_Bollinger_ADX="***Settings_Bollinger_ADX***";///*---
input int Bollinger_ADX_Periodo=20;
input int Bollinger_ADX_Shift=0;
input int Bollinger_ADX_Desviation=2;

input string Settings_Parabolic_Sar="***Settings_Parabolic_SAR***";///*---
input double SAR_Step=0.02;
input double SAR_Maximo=0.2;

input string Settings_CCI="***Settings_CCI***";   ///*---
input uint    PeriodoCCI=28;
input ENUM_APPLIED_PRICE CCI_applied_price=PRICE_TYPICAL;


input string Settings_Force_Index="***Settings_Force_Index***";  ///*---
input int Force_Periodo=30;
input ENUM_MA_METHOD Force_Mode=MODE_SMA;
input ENUM_APPLIED_VOLUME Force_Volume_Type=VOLUME_TICK;
input string Settings_Bollinger_ForceIndex="***Settings_Bollinger_ForceIndex***";  ///*---
input int Bollinger_ForceIndex_Periodo=20;
input int Bollinger_ForceIndex_Shift=0;
input int Bollinger_ForceIndex_Desviation=2;
input double DistanciaBollingerForce=0.0003;

input string Settings_Klinger_Oscillator="***Settings_Klinger_Oscillator***";   ///*---
input uint     InpPeriodFast  =  34;   // Fast period
input uint     InpPeriodSlow  =  55;   // Slow period
input uint     InpPeriodSig   =  13;   // Signal period
input string Settings_Bollinger_Klinger="***Settings_Bollinger_Klinger***";  ///*---
input int Bollinger_Klinger_Periodo=20;
input int Bollinger_Klinger_Shift=0;
input int Bollinger_Klinger_Desviation=2;

input string Settings_Gator_Oscilator="***Settings Gator Oscilator***";   ///*---
input int                InpJawsPeriod=13;               // Jaws period
input int                InpJawsShift=8;                 // Jaws shift
input int                InpTeethPeriod=8;               // Teeth period
input int                InpTeethShift=5;                // Teeth shift
input int                InpLipsPeriod=5;                // Lips period
input int                InpLipsShift=3;                 // Lips shift
input ENUM_MA_METHOD     InpMAMethod=MODE_SMMA;          // Moving average method
input ENUM_APPLIED_PRICE InpAppliedPrice=PRICE_MEDIAN;   // Applied price

input string Settings_Bollinger_SMA_klinger="***Settings_Bollinger_SMA_klinger***";
input int SMA_klinger_Periodo=19;
input int SMA_klinger_Shift=0;
input ENUM_MA_METHOD SMA_klinger_Mode=MODE_SMA;

input string Settings_Bollinger_EMA_klinger="***Settings_Bollinger_EMA_klinger***";
input int EMA_klinger_Periodo=13;
input int EMA_klinger_Shift=0;
input ENUM_MA_METHOD EMA_klinger_Mode=MODE_EMA;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
input string separador10_="|***SETTINGS ADX- (CRUCE 1 1 - ADX3 - SIMPLE 4)***|";  ///*---
///CRUCE ADX 3
input string Settings_ADX="***Settings_ADX***";///*---
input uint    PeriodoADX=25;
// ADX3
input string Settings_ADX_2="***Settings_ADX***";  ///*---
input uint    PeriodoADX_2=14;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
input string separador9_="|***Settings Bollinger 2(ADX 3 - ADX Rompimiento... - ADX 11 - ADX2 - ADX 3 en 2 - ADX 3 Inv)***|";  ///*---
//input string Settings_Bollinger_2_2="***Settings_Bollinger_2***";  ///*---
input int Bollinger_2_Periodo_2=30;
input int Bollinger_2_Shift_2=0;
input int Bollinger_2_Desviation_2=2;


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
input string separador11_="|***Settings Bollinger 2(Settings Cruce di 1 1 y Adx diferentes g k  pas 2)***|";///*---
input string Settings_Bollinger_2="***Settings_Bollinger_2***";///*---
input int Bollinger_2_Periodo=10;
input int Bollinger_2_Shift=0;
input int Bollinger_2_Desviation=9;
// CRUCE DI 1 1 CRUCE DI 1 1 CRUCE DI 1 1 CRUCE DI 1 1 CRUCE DI 1 1 CRUCE DI 1 1 CRUCE DI 1 1 CRUCE DI 1 1
input string Separador3="----------------------------------------";///*---
input string Settings_Cruce_DI_1_1="---***SETTINGS CRUCE DI 1 1 *---";
input string Separador4="----------------------------------------";///*---
input int MaximoVelasSar=6;

input string Separador5="---------------------------------------------------------------------------";///*---
input string Settings_Cruce_ADX_1_1="---***SETTINGS CRUCE ADX 1 1 && SETTINGS CRUCE ADX 2 && ADX 3 INV ***---";
input string Separador6="-----------------------------------------------------------------------------";///*---
//ADX 1 1 - ADX 2 - ADX 3 Inversa
input string Settings_ADX_3="***Settings_ADX_3***";  ///*---
input uint    PeriodoADX_3=14;

input string Settings_ADX_4="***Settings_ADX_4***";  ///*---
input uint    PeriodoADX_4=14;

input double DistanciaBollinger2=100;// DistanciaBollinger Solo para el(CRUCE ADX 1 1)

input string Separador7="----------------------------------------";///*---
input string Settings_Cruce_ADX_2="---*** SETTINGS CRUCE ADX 2  ***---";
input string Separador8="----------------------------------------";///*---
input int MaximoVelasKlinger=15;


input string Separador9="----------------------------------------------------------------";///*---
input string Settings_Cruce_Rompimiento="---*** SETTINGS CRUCE ADX ROMPIMIENTO KLINGER && CCI ROM O VELAS ***---";///*---
input string Separador10="----------------------------------------------------------------";///*---

input string Settings_ADX_K="***Settings_ADX***";  ///*---
input uint    PeriodoADX_K=14;

input string Settings_CCI_K="***Settings_CCI***";   ///*---
input uint    PeriodoCCI_K=56;
input ENUM_APPLIED_PRICE CCI_applied_price_K=PRICE_TYPICAL;

input string Settings_Bollinger_CCI="***Settings_Bollinger_CCI***";
input int Bollinger_CCI_Periodo=20;
input int Bollinger_CCI_Shift=0;
input int Bollinger_CCI_Desviation=2;

input string Separador11="----------------------------------------------------------------";///*---
input string Settings_ADX3_Inv="---*** SETTINGS ADX3 INV ***---";///*---
input string Separador12="----------------------------------------------------------------";///*---
input int MaximoVelasKlinger2=15;

input string Separador13="----------------------------------------------------------------";///*---
input string Settings_ADX_Diferentes_G_K_PAS="---*** SETTINGS ADX DIFERENTES G K PAS ***---";///*---
input string Separador14="----------------------------------------------------------------";///*---
input int MaximoVelasDif=6;

input string Settings_ADX_11="***Settings_ADX***";
input uint    PeriodoADX_11=25;

input string Settings_ADX_12="***Settings_ADX_2***";
input uint    PeriodoADX_12=44;

input string Settings_ADX_13="***Settings_ADX_3***";
input uint    PeriodoADX_13=88;

input string Settings_ADX_14="***Settings_ADX_4***";
input uint    PeriodoADX_14=120;


input string Separador15="----------------------------------------------------------------";///*---
input string Settings_Cruce_Simple_4="---*** SETTINGS CRUCE SIMPLE 4 ***---";///*---
input string Separador16="----------------------------------------------------------------";///*---
input bool DireccionArraySimple4=true;//SetArraySeries Direccion
input string Settings_Estocastico="***Settings_Estocastico***";
input uint PeriodK=8;
input uint PeriodD=6;
input uint PeriodSlowing=3;
input double LevelIndicatorDown=19;
input double LevelIndicatorUp=78;
input ENUM_MA_METHOD Mode_MA=MODE_SMMA;
input ENUM_STO_PRICE STO_MODE=STO_LOWHIGH;


input string Settings_Bollinger_Estocastico="***Settings_Bollinger_Estocastico***";  ///*---
input int Bollinger_Estocastico_Periodo=20;
input int Bollinger_Estocastico_Shift=0;
input int Bollinger_Estocastico_Desviation=2;

//input string Settings_ADX_15="***Settings_ADX_5***";
//input uint    PeriodoADX_15=14;

input string Separador17="----------------------------------------";///*---
input string Settings_Alerts="---***SETTINGS ALERTAS***---";///*---
input string Separador18="----------------------------------------";///*---
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=true;

double AlligatorBuffer[];
double ADX_Buffer[];
double Bollinger_1_Buffer_UP[];
double Bollinger_1_Buffer_DN[];
double Bollinger_1_Buffer_Central[];
double Bollinger_2_Buffer_UP[];
double Bollinger_2_Buffer_DN[];
double Bollinger_2_Buffer_Central[];
double Bollinger_ADX_2_Buffer_DN[];
double Bollinger_ADX_2_Buffer_UP[];
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
double DI_plusBuffer[];
double DI_minusBuffer[];
double Bollinger_Klinger_Buffer_BASE[];

double ForceIndexBuffer[];
double KlingerBuffer[];
double ADX_3_Buffer[];
double Bollinger_2_2_Buffer_DN[];
double Bollinger_2_2_Buffer_UP[];
double Bollinger_2_2_Buffer_BASE[];

double Bollinger_ForceIndex_Buffer_DN[];
double Bollinger_ForceIndex_Buffer_UP[];
double Bollinger_ForceIndex_Buffer_BASE[];
double Bollinger_Klinger_Buffer_DN[];
double Bollinger_Klinger_Buffer_UP[];

double Bollinger_ADX_Buffer_UP_2[];
double ADX_4_Buffer[];
double DI_6_plusBuffer[];
double DI_6_minusBuffer[];
double AwesomeOscilator_Buffer[];
double ADX_K_Buffer[];
double DI_plusBuffer_K[];
double DI_minusBuffer_K[];

double Bollinger_3_Buffer_UP[];
double Bollinger_3_Buffer_DN[];
double Bollinger_3_Buffer_BASE[];
double Bollinger_ADX_Buffer_UP_K[];
double Gator_Oscilator_Buffer_UP[];
double CCIBuffer_K[];
double Bollinger_CCI_Buffer_UP_K[];
double Bollinger_CCI_Buffer_DN_K[];
double Bollinger_CCI_Buffer_BASE_K[];
//double     ADXBuffer_Dif[];
double    DI_plusBuffer_Dif[];
double    DI_minusBuffer_Dif[];
//double    ADX_2_Buffer_Dif[];
double   DI_2_plusBuffer_Dif[];
double    DI_2_minusBuffer_Dif[];
//double    ADX_3_Buffer_Dif[];
double    DI_3_plusBuffer_Dif[];
double    DI_3_minusBuffer_Dif[];
//double    ADX_4_Buffer_Dif[];
double    DI_4_plusBuffer_Dif[];
double    DI_4_minusBuffer_Dif[];
//double    DI_5_plusBuffer_Dif[];
//double    DI_5_minusBuffer_Dif[];
double   Bollinger_ADX_Buffer_UP_Dif[];
double   ADX_Simple4_Buffer[];

double EstocasticoBuffer[];
double Bollinger_Estocastico_Buffer_BASE[];

double SMA_Buffer_klinger[];
double EMA_Buffer_klinger[];

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

datetime Buy_Tiempo=0,Sell_Tiempo=0,Buy_Tiempo_ADX2=0,Sell_Tiempo_ADX2=0,Sell_Tiempo_ADX3_Inv=0,Buy_Tiempo_ADX3_Inv=0,
         Buy_Tiempo_Simple4=0,Sell_Tiempo_Simple4=0,Tiempo_Dif_Buy=0,Tiempo_Dif_Sell=0;
color COLORVO=clrAqua;


datetime TiempoConfirmacionBuy=0,TiempoConfirmacionSell=0;
MqlRates Rates[];
MqlDateTime Tiempo;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   Alligator=iAlligator(Symbol(),PERIOD_CURRENT,Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator);
   Bollinger_1=iBands(Symbol(),PERIOD_CURRENT,Bollinger_1_Periodo,Bollinger_1_Shift,Bollinger_1_Desviation,Alligator);
   EMA_Alligator=iMA(Symbol(),PERIOD_CURRENT,Periodo_EMA,Shift_EMA,Mode_EMA,Bollinger_1);

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

   ForceIndex=iForce(Symbol(),PERIOD_CURRENT,Force_Periodo,Force_Mode,Force_Volume_Type);
   Bollinger_ForceIndex=iBands(Symbol(),PERIOD_CURRENT,Bollinger_ForceIndex_Periodo,Bollinger_ForceIndex_Shift,Bollinger_ForceIndex_Desviation,ForceIndex);
   Klinger_Oscilator=iCustom(Symbol(),PERIOD_CURRENT,"Klinger_Oscillator",InpPeriodFast,InpPeriodSlow,InpPeriodSig);
   Bollinger_Klinger=iBands(Symbol(),PERIOD_CURRENT,Bollinger_Klinger_Periodo,Bollinger_Klinger_Shift,Bollinger_Klinger_Desviation,Klinger_Oscilator);

//PRIMER INDICADOR CRUCE DI 1 1 && ADX 3
   ADX=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX);
   Bollinger_ADX=iBands(Symbol(),PERIOD_CURRENT,Bollinger_ADX_Periodo,Bollinger_ADX_Shift,Bollinger_ADX_Desviation,ADX);
   ADX_2=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_2);
   Bollinger_2=iBands(Symbol(),PERIOD_CURRENT,Bollinger_2_Periodo,Bollinger_2_Shift,Bollinger_2_Desviation,Alligator);
//SEGUNDO Y TERCER INDICADOR CRUCE DI ADX 1 1 && ADX 2
   Bollinger_2_2=iBands(Symbol(),PERIOD_CURRENT,Bollinger_2_Periodo_2,Bollinger_2_Shift_2,Bollinger_2_Desviation_2,Bollinger_1);
   ADX_3=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_3);
   ADX_4=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_4);
   Bollinger_ADX_2=iBands(Symbol(),PERIOD_CURRENT,Bollinger_ADX_Periodo,Bollinger_ADX_Shift,Bollinger_ADX_Desviation,ADX_3);
// INDICADOR ADX2
   AwesomeOscilator=iAO(Symbol(),PERIOD_CURRENT);
// INDICADOR CRUCE ROMPIMIENTO
   ADX_K=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_K);
   Bollinger_ADX_K=iBands(Symbol(),PERIOD_CURRENT,Bollinger_2_Periodo_2,Bollinger_2_Shift_2,Bollinger_2_Desviation_2,ADX_K);
   Gator_Oscilator=iGator(Symbol(),PERIOD_CURRENT,InpJawsPeriod,InpJawsShift,InpTeethPeriod,InpTeethShift,InpLipsPeriod,InpLipsShift
                          ,InpMAMethod,InpAppliedPrice);
   CCI_K=iCCI(Symbol(),PERIOD_CURRENT,PeriodoCCI_K,CCI_applied_price_K);
   Bollinger_CCI_K=iBands(Symbol(),PERIOD_CURRENT,Bollinger_CCI_Periodo,Bollinger_CCI_Shift,Bollinger_CCI_Desviation,CCI_K);

   ADX_Dif=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_11);
   ADX_2_Dif=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_12);
   ADX_3_Dif=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_13);
   ADX_4_Dif=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_14);
//ADX_5_Dif=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_15);
   Bollinger_ADX_Diferentes=iBands(Symbol(),PERIOD_CURRENT,Bollinger_ADX_Periodo,Bollinger_ADX_Shift,Bollinger_ADX_Desviation,ADX_Dif);

   EMA_klinger=iMA(Symbol(),PERIOD_CURRENT,EMA_klinger_Periodo,EMA_klinger_Shift,EMA_klinger_Mode,Klinger_Oscilator);
   SMA_klinger=iMA(Symbol(),PERIOD_CURRENT,SMA_klinger_Periodo,EMA_klinger_Shift,EMA_klinger_Mode,Klinger_Oscilator);

   Estocastico=iStochastic(Symbol(),PERIOD_CURRENT,PeriodK,PeriodD,PeriodSlowing,Mode_MA,STO_MODE);
   Bollinger_Estocastico=iBands(Symbol(),PERIOD_CURRENT,Bollinger_Estocastico_Periodo,Bollinger_Estocastico_Shift,Bollinger_Estocastico_Desviation,Estocastico);

   IndicatorSetString(INDICATOR_SHORTNAME,"Indicador Estrellas EMA");
//172, 115
   SetIndexBuffer(0,ArrowSignalUP);
   SetIndexBuffer(1,ArrowSignalDN);

   PlotIndexSetInteger(0,PLOT_ARROW,170);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(1,PLOT_ARROW,170);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   ArraySetAsSeries(Rates,true);

   ArraySetAsSeries(ADX_Simple4_Buffer,DireccionArraySimple4);//ACA BUFFER SIMPLE 4

   ArraySetAsSeries(AlligatorBuffer,true);
   ArraySetAsSeries(ADX_Buffer,true);
   ArraySetAsSeries(Bollinger_1_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_1_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_1_Buffer_Central,true);
   ArraySetAsSeries(Bollinger_2_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_2_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_2_Buffer_Central,true);
   ArraySetAsSeries(Bollinger_ADX_2_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_ADX_2_Buffer_UP,true);
   ArraySetAsSeries(EMA_Buffer_Alligator,true);
   ArraySetAsSeries(Divergencia_Puntos_1_Buffer_UP,true);
   ArraySetAsSeries(Divergencia_Puntos_1_Buffer_DN,true);
   ArraySetAsSeries(Divergencia_Puntos_2_Buffer_UP,true);
   ArraySetAsSeries(Divergencia_Puntos_2_Buffer_DN,true);
   ArraySetAsSeries(Divergencia_Puntos_3_Buffer_UP,true);
   ArraySetAsSeries(Divergencia_Puntos_3_Buffer_DN,true);
   ArraySetAsSeries(Divergencia_Puntos_4_Buffer_UP,true);
   ArraySetAsSeries(Divergencia_Puntos_4_Buffer_DN,true);
   ArraySetAsSeries(SARBuffer,true);
   ArraySetAsSeries(CCIBuffer,true);
   ArraySetAsSeries(ADX_2_Buffer,true);
   ArraySetAsSeries(DI_plusBuffer,true);
   ArraySetAsSeries(DI_minusBuffer,true);
   ArraySetAsSeries(Bollinger_Klinger_Buffer_BASE,true);

   ArraySetAsSeries(ForceIndexBuffer,true);
   ArraySetAsSeries(KlingerBuffer,true);
   ArraySetAsSeries(ADX_3_Buffer,true);
   ArraySetAsSeries(Bollinger_2_2_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_2_2_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_2_2_Buffer_BASE,true);

   ArraySetAsSeries(Bollinger_ForceIndex_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_ForceIndex_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_ForceIndex_Buffer_BASE,true);
   ArraySetAsSeries(Bollinger_Klinger_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_Klinger_Buffer_UP,true);

   ArraySetAsSeries(Bollinger_ADX_Buffer_UP_2,true);
   ArraySetAsSeries(ADX_4_Buffer,true);
   ArraySetAsSeries(DI_6_plusBuffer,true);
   ArraySetAsSeries(DI_6_minusBuffer,true);
   ArraySetAsSeries(AwesomeOscilator_Buffer,true);
   ArraySetAsSeries(ADX_K_Buffer,true);
   ArraySetAsSeries(DI_plusBuffer_K,true);
   ArraySetAsSeries(DI_minusBuffer_K,true);

   ArraySetAsSeries(Bollinger_3_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_3_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_3_Buffer_BASE,true);
   ArraySetAsSeries(Bollinger_ADX_Buffer_UP_K,true);
   ArraySetAsSeries(Gator_Oscilator_Buffer_UP,true);
   ArraySetAsSeries(CCIBuffer_K,true);
   ArraySetAsSeries(Bollinger_CCI_Buffer_UP_K,true);
   ArraySetAsSeries(Bollinger_CCI_Buffer_DN_K,true);
   ArraySetAsSeries(Bollinger_CCI_Buffer_BASE_K,true);

//ArraySetAsSeries(ADXBuffer_Dif,true);
   ArraySetAsSeries(DI_plusBuffer_Dif,true);
   ArraySetAsSeries(DI_minusBuffer_Dif,true);
//ArraySetAsSeries(ADX_2_Buffer_Dif,true);
   ArraySetAsSeries(DI_2_plusBuffer_Dif,true);
   ArraySetAsSeries(DI_2_minusBuffer_Dif,true);
//ArraySetAsSeries(ADX_3_Buffer_Dif,true);
   ArraySetAsSeries(DI_3_plusBuffer_Dif,true);
   ArraySetAsSeries(DI_3_minusBuffer_Dif,true);
//ArraySetAsSeries(ADX_4_Buffer_Dif,true);
   ArraySetAsSeries(DI_4_plusBuffer_Dif,true);
   ArraySetAsSeries(DI_4_minusBuffer_Dif,true);
//ArraySetAsSeries(DI_5_plusBuffer_Dif,true);
//ArraySetAsSeries(DI_5_minusBuffer_Dif,true);
   ArraySetAsSeries(Bollinger_ADX_Buffer_UP_Dif,true);

   ArraySetAsSeries(SMA_Buffer_klinger,true);
   ArraySetAsSeries(EMA_Buffer_klinger,true);

   ArraySetAsSeries(EstocasticoBuffer,true);
   ArraySetAsSeries(Bollinger_Estocastico_Buffer_BASE,true);

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
      bool Buy=false, Sell=false;
      ArrowSignalUP[shift]=EMPTY_VALUE;
      ArrowSignalDN[shift]=EMPTY_VALUE;
      int CumOffset=0;
      ArrayResize(Rates,10);
      int copied=CopyRates(Symbol(),PERIOD_CURRENT,rates_total-1-shift,8,Rates);
      CopyBuffer(Bollinger_1,1,rates_total-1-shift,6,Bollinger_1_Buffer_UP);
      CopyBuffer(Bollinger_1,2,rates_total-1-shift,6,Bollinger_1_Buffer_DN);
      CopyBuffer(Bollinger_1,0,rates_total-1-shift,40,Bollinger_1_Buffer_Central);
      CopyBuffer(Bollinger_2,1,rates_total-1-shift,3,Bollinger_2_Buffer_UP);
      CopyBuffer(Bollinger_2,2,rates_total-1-shift,3,Bollinger_2_Buffer_DN);
      CopyBuffer(Bollinger_2,0,rates_total-1-shift,40,Bollinger_2_Buffer_Central);
      CopyBuffer(ADX,0,rates_total-1-shift,45,ADX_Buffer);
      CopyBuffer(ADX,0,rates_total-1-shift,45,ADX_Simple4_Buffer);
      CopyBuffer(Bollinger_ADX,1,rates_total-1-shift,45,Bollinger_ADX_2_Buffer_UP);
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
      CopyBuffer(ADX_2,0,rates_total-shift-1,5,ADX_2_Buffer);
      CopyBuffer(ADX_2,1,rates_total-shift-1,5,DI_plusBuffer);
      CopyBuffer(ADX_2,2,rates_total-shift-1,5,DI_minusBuffer);
      CopyBuffer(Bollinger_2_2,1,rates_total-shift-1,4,Bollinger_2_2_Buffer_UP);
      CopyBuffer(Bollinger_2_2,2,rates_total-shift-1,4,Bollinger_2_2_Buffer_DN);
      CopyBuffer(Bollinger_2_2,0,rates_total-shift-1,4,Bollinger_2_2_Buffer_BASE);
      CopyBuffer(ForceIndex,0,rates_total-shift-1,4,ForceIndexBuffer);
      CopyBuffer(Bollinger_ForceIndex,2,rates_total-shift-1,4,Bollinger_ForceIndex_Buffer_DN);
      CopyBuffer(Bollinger_ForceIndex,1,rates_total-shift-1,4,Bollinger_ForceIndex_Buffer_UP);
      CopyBuffer(Klinger_Oscilator,0,rates_total-shift-1,4,KlingerBuffer);
      CopyBuffer(Bollinger_Klinger,2,rates_total-shift-1,4,Bollinger_Klinger_Buffer_DN);
      CopyBuffer(Bollinger_Klinger,1,rates_total-shift-1,4,Bollinger_Klinger_Buffer_UP);
      CopyBuffer(Bollinger_Klinger,0,rates_total-shift-1,4,Bollinger_Klinger_Buffer_BASE);
      CopyBuffer(ADX_3,0,rates_total-shift-1,4,ADX_3_Buffer);
      CopyBuffer(Bollinger_ADX_2,1,rates_total-shift-1,4,Bollinger_ADX_Buffer_UP_2);
      CopyBuffer(ADX_4,0,rates_total-shift-1,5,ADX_4_Buffer);
      CopyBuffer(ADX_4,1,rates_total-shift-1,5,DI_6_plusBuffer);
      CopyBuffer(ADX_4,2,rates_total-shift-1,5,DI_6_minusBuffer);
      CopyBuffer(AwesomeOscilator,0,rates_total-shift-1,4,AwesomeOscilator_Buffer);

      CopyBuffer(ADX_K,0,rates_total-shift-1,5,ADX_K_Buffer);
      CopyBuffer(ADX_K,1,rates_total-shift-1,5,DI_plusBuffer_K);
      CopyBuffer(ADX_K,2,rates_total-shift-1,5,DI_minusBuffer_K);
      CopyBuffer(Bollinger_ADX_K,1,rates_total-shift-1,5,Bollinger_ADX_Buffer_UP_K);
      CopyBuffer(Gator_Oscilator,0,rates_total-shift-1,4,Gator_Oscilator_Buffer_UP);
      CopyBuffer(CCI_K,0,rates_total-shift-1,4,CCIBuffer_K);
      CopyBuffer(Bollinger_CCI_K,1,rates_total-1-shift,3,Bollinger_CCI_Buffer_UP_K);
      CopyBuffer(Bollinger_CCI_K,2,rates_total-1-shift,3,Bollinger_CCI_Buffer_DN_K);

      CopyBuffer(SMA_klinger,0,rates_total-1-shift,40,SMA_Buffer_klinger);
      CopyBuffer(EMA_klinger,0,rates_total-1-shift,40,EMA_Buffer_klinger);

      //CopyBuffer(ADX_Dif,0,rates_total-1-shift,45,ADXBuffer_Dif);
      CopyBuffer(ADX_Dif,1,rates_total-shift-1,45,DI_plusBuffer_Dif);
      CopyBuffer(ADX_Dif,2,rates_total-shift-1,45,DI_minusBuffer_Dif);
      //CopyBuffer(ADX_2_Dif,0,rates_total-1-shift,46,ADX_2_Buffer_Dif);
      CopyBuffer(ADX_2_Dif,1,rates_total-shift-1,46,DI_2_plusBuffer_Dif);
      CopyBuffer(ADX_2_Dif,2,rates_total-shift-1,46,DI_2_minusBuffer_Dif);
      //CopyBuffer(ADX_3_Dif,0,rates_total-1-shift,47,ADX_3_Buffer_Dif);
      CopyBuffer(ADX_3_Dif,1,rates_total-shift-1,47,DI_3_plusBuffer_Dif);
      CopyBuffer(ADX_3_Dif,2,rates_total-shift-1,47,DI_3_minusBuffer_Dif);
      //CopyBuffer(ADX_4_Dif,0,rates_total-1-shift,48,ADX_4_Buffer_Dif);
      CopyBuffer(ADX_4_Dif,1,rates_total-shift-1,48,DI_4_plusBuffer_Dif);
      CopyBuffer(ADX_4_Dif,2,rates_total-shift-1,48,DI_4_minusBuffer_Dif);

      //CopyBuffer(ADX_5_Dif,1,rates_total-shift-1,48,DI_5_plusBuffer_Dif);
      //CopyBuffer(ADX_5_Dif,2,rates_total-shift-1,48,DI_5_minusBuffer_Dif);
      CopyBuffer(Bollinger_ADX_Diferentes,1,rates_total-1-shift,45,Bollinger_ADX_Buffer_UP_Dif);

      CopyBuffer(Estocastico,0,rates_total-1-shift,45,EstocasticoBuffer);
      CopyBuffer(Bollinger_Estocastico,1,rates_total-1-shift,40,Bollinger_Estocastico_Buffer_BASE);

      ResetLastError();
      bool AlertBuy=false;
      bool AlertSell=false;

    
      //// mhi

      if ((Rates[4].open<Rates[4].close && Rates[1].open<Rates[1].close) ||  (Rates[1].open<Rates[1].close && Rates[3].open<Rates[3].close)) 
        {
         if(Solo_Confirmacion==false)
           {
            MarkPattern(GetName("mhi3",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "mhi3", Text_VelasOpuestas, COLORVO);
            ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
            AlertBuy=true;
           }
         Buy_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
        }

      if ( (Rates[1].open>Rates[1].close && Rates[4].open>Rates[4].close) || (Rates[1].open>Rates[1].close && Rates[3].open>Rates[3].close))
        {
         if(Solo_Confirmacion==false)
           {
            MarkPattern(GetName("mhi3",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"mmhi3", Text_VelasOpuestas, COLORVO);
            ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
            AlertSell=true;
           }
         Sell_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
        }
 
      //CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION CONFIRMACION
      if(Buy_Tiempo_Confirmacion>time[shift] && Buy_Tiempo_Confirmacion!=0)
        {
         bool Confirmacion=false;
         TimeToStruct(time[shift-1],Tiempo);
         int MinutoEvaluacion=(Tiempo.min-((int(Tiempo.min/10))*10));

         if(shift==rates_total-1)
            EmitirAlerta("BUY");
         if(Rates[7].open<Rates[7].close && ( (Rates[5].open>Rates[5].close && Rates[4].open>Rates[4].close) || (Rates[5].open>Rates[5].close && Rates[3].open>Rates[3].close)) && (Rates[1].close<Rates[1].open)  && (MinutoEvaluacion==TerminoMinuto1 || MinutoEvaluacion==TerminoMinuto2))
           {
            ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
            MarkPattern(GetName("Confirmacion",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "Conf", Text_VelasOpuestas, ColorConfirmacion);
            Confirmacion=true;
            Buy_Tiempo_Confirmacion=0;
            AlertBuy=true;
            TiempoConfirmacionBuy=time[shift];
           }
        }

      if(Sell_Tiempo_Confirmacion>time[shift] && Sell_Tiempo_Confirmacion!=0)
        {
         TimeToStruct(time[shift-1],Tiempo);
         int MinutoEvaluacion=(Tiempo.min-((int(Tiempo.min/10))*10));
         if(Rates[7].open>Rates[7].close && ((Rates[4].open<Rates[4].close && Rates[5].open<Rates[5].close) ||  (Rates[5].open<Rates[5].close && Rates[3].open<Rates[3].close)) && (Rates[1].close>Rates[1].open)
            && (MinutoEvaluacion==TerminoMinuto1 || MinutoEvaluacion==TerminoMinuto2))
           {
            ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
            MarkPattern(GetName("Confirmacion",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"Conf", Text_VelasOpuestas, ColorConfirmacion);
            Sell_Tiempo_Confirmacion=0;
            AlertSell=true;
            TiempoConfirmacionSell=time[shift];
           }
        }
      // DIBUJAR VERTICALES CONFIRMACION
      if(Ver_Lineas_Resultados)
        {
         if(time[shift-1]==TiempoConfirmacionSell && TiempoConfirmacionSell!=0)
           {
            if(close[shift-1]>open[shift-1])
              {
               VLineCreate(0,GetName("PERIDA ",time[shift-1]),0,time[shift-1],ColorPerdida,EstiloLinea,1,false,false,true,true,0);
              }
            if(close[shift-1]<open[shift-1])
              {
               VLineCreate(0,GetName("GANADA ",time[shift-1]),0,time[shift-1],ColorGanada,EstiloLinea,1,false,false,true,true,0);
              }
           }

         if(time[shift-1]==TiempoConfirmacionBuy && TiempoConfirmacionBuy!=0)
           {
            if(close[shift-1]<open[shift-1])
              {
               VLineCreate(0,GetName("PERDIDA ",time[shift-1]),0,time[shift-1],ColorPerdida,EstiloLinea,1,false,false,true,true,0);
              }
            if(close[shift-1]>open[shift-1])
              {
               VLineCreate(0,GetName("GANADA ",time[shift-1]),0,time[shift-1],ColorGanada,EstiloLinea,1,false,false,true,true,0);
              }
           }
        }
      //ALERTAS

      if(AlertBuy && shift==rates_total-1)
         EmitirAlerta("BUY");
      if(AlertSell && shift==rates_total-1)
         EmitirAlerta("SELL");
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
   ObjectsDeleteAll(0,0,OBJ_VLINE);
   Comment("");
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EmitirAlerta(string Tipo)
  {
   if(AlertPC)
      Alert("Operacion ",Tipo," en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
   if(AlertMovil)
      SendNotification("Operacion "+Tipo+" en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
   if(AlertMail)
      SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion "+Tipo+" en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VLineCreate(const long            chart_ID=0,        // ID del gráfico
                 const string          name="VLine",      // nombre de la línea
                 const int             sub_window=0,      // índice de subventana
                 datetime              time=0,            // hora de la línea
                 const color           clr=clrRed,        // color de la línea
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de la línea
                 const int             width=1,           // grosor de la línea
                 const bool            back=false,        // al fondo
                 const bool            selection=true,    // seleccionar para mover
                 const bool            ray=true,          // continuación de la línea abajo
                 const bool            hidden=true,       // ocultar en la lista de objetos
                 const long            z_order=0)         // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la línea vertical
   if(!ObjectCreate(chart_ID,name,OBJ_VLINE,sub_window,time,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la línea vertical! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos el color de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el estilo de visualización de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- establecemos el grosor de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de desplazamiento de la línea con ratón
//--- cuando el objeto gráfico se crea usando la función ObjectCreate, por defecto el objeto
//--- no se puede seleccionar y mover. Mientras que dentro de este método el parámetro selection
//--- por defecto es igual a true, lo que permite seleccionar y mover este objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- activar (true) o desactivar (false) el modo de visualización de la línea en las subventanas del gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY,ray);
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- establecemos la prioridad para obtener el evento de cliquear sobre el gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- ejecución con éxito
   return(true);
  } 
//+------------------------------------------------------------------+
