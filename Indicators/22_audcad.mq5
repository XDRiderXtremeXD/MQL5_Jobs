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

int ADX_V;
int Bollinger_ADX_V;
int ADX_W;
int ADX_X;
int ADX_Y;
int ADX_Z;

int MediaFast;
int MediaSlow;

int ROC;
int Bollinger_ROC;

int keltner_channel;


int volumenes;
int ma_vol;
int bol_ma_vol;

int ad;
int bol_ad;

int bol;

int ma_1;
int ma_20;

int Bollinger_6;
int Bollinger_7;

int Alligator2;




datetime Buy_Tiempo_Confirmacion=0,Sell_Tiempo_Confirmacion=0;
int Perdidas=0;
int Ganadas=0;

struct Array_Cuadros
  {
   int               Valor;
   color             Color;
  };
Array_Cuadros ArrayCuadro[600];
string NameLabel[30][20];

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6apm=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12pm=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

//
//
//
//
//

enum enPrices
  {
   pr_close,      // Close
   pr_open,       // Open
   pr_high,       // High
   pr_low,        // Low
   pr_median,     // Median
   pr_typical,    // Typical
   pr_weighted,   // Weighted
   pr_haclose,    // Heiken ashi close
   pr_haopen,     // Heiken ashi open
   pr_hahigh,     // Heiken ashi high
   pr_halow,      // Heiken ashi low
   pr_hamedian,   // Heiken ashi median
   pr_hatypical,  // Heiken ashi typical
   pr_haweighted, // Heiken ashi weighted
   pr_haaverage   // Heiken ashi average
  };

enum enMaModes
  {
   ma_Simple,  // Simple moving average
   ma_Expo     // Exponential moving average
  };
enum enMaVisble
  {
   mv_Visible,    // Middle line visible
   mv_NotVisible  // Middle line not visible
  };

//
//
//
//
//

enum enCandleMode
  {
   cm_None,   // Do not draw candles nor bars
   cm_Bars,   // Draw as bars
   cm_Candles // Draw as candles
  };

enum enAtrMode
  {
   atr_Rng,   // Calculate using range
   atr_Atr    // Calculate using ATR
  };

//
//
//
//
//

// GLOBALES GLOBALES GLOBALES GLOBALES GLOBALES GLOBALES GLOBALES GLOBALES GLOBALES GLOBALES
input string Separador1="----------------------------------------";///*---
input string Settings_Global="---*** SETTINGS GLOBAL ***---";///*---
input string Separador2="----------------------------------------";
input string Settings_Horario="***Settings_Horario***";///*---
input ENUM_Horas  Hora_Inicio=_0am;
input ENUM_Horas Hora_Final=_11pm;
input string Settings_Conf_Cuadros="***Settings_Cuadros_Confirmacion***";///*---
input int AnchoCuadro=15;
input int AlturaCuadro=10;
input ENUM_BASE_CORNER CornerPosicion=CORNER_LEFT_UPPER;
input string Settings_Conf="***Settings_Patron_Confirmacion***";///*---
input bool Solo_Confirmacion=true;
input ushort PerdidasAtras=0;
input color ColorConfirmacion=clrYellow;
//input int TerminoMinuto1=2;
//input int TerminoMinuto2=6;
input int MaximoVelasConf=10;
input string Settings_Lineas_Confirmacion="***------------------------***";///*---
input bool Ver_Lineas_y_Estadisticas=true;
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

input string Settings_ADX_V="***Settings_ADX_V***";
input uint    PeriodoADX_V=25;
input string Settings_Bollinger_ADX_V="***Settings_Bollinger_ADX_V***";
input int Bollinger_ADX_V_Periodo=20;
input int Bollinger_ADX_V_Shift=0;
input int Bollinger_ADX_V_Desviation=2;

input string Settings_ADX_W="***Settings_ADX_W***";
input uint    PeriodoADX_W=44;

input string Settings_ADX_X="***Settings_ADX_X***";
input uint    PeriodoADX_X=88;

input string Settings_ADX_Y="***Settings_ADX_Y***";
input uint    PeriodoADX_Y=120;


input string Settings_ADX_Z="***Settings_ADX_Z***";  ///*---
input uint    PeriodoADX_Z=14;

input string Settings_ROC="***Settings_ROC***";///*---
input int ROC_Period=12;
input string Settings_Bollinger_ROC="***Settings_Bollinger_ROC***";  ///*---
input int Bollinger_ROC_Periodo=20;
input int Bollinger_ROC_Shift=0;
input int Bollinger_ROC_Desviation=2;
input int MaximoVelasKlinger_3=15;

input string Settings_Media_Movil_Slow="***Settings Media Movil Slow***"; ///*---
input int Periodo_Media_Slow=20;
input int Shift_Media_Slow=0;
input ENUM_MA_METHOD Mode_Media_Slow=MODE_SMA;
input ENUM_APPLIED_PRICE AppliedPrice_Media_Slow=PRICE_CLOSE;
input string Settings_Media_Movil_Fast="***Settings Media Movil Fast***"; ///*---
input int Periodo_Media_Fast=37;
input int Shift_Media_Fast=0;
input ENUM_MA_METHOD Mode_Media_Fast=MODE_EMA;
input ENUM_APPLIED_PRICE AppliedPrice_Media_Fast=PRICE_CLOSE;

input string Settings_keltner_channel="***Settings_keltner channel***";   ///*---
input ENUM_TIMEFRAMES    TimeFrame       = PERIOD_CURRENT; // Time frame
input int                MAPeriod        = 20;             // Moving average period
input enMaModes          MAMethod        = ma_Simple;      // Moving average type
input enMaVisble         MAVisible       = mv_Visible;     // Midlle line visible ?
input enPrices           Price           = pr_typical;     // Moving average price
input color              MaColorUp       = clrDeepSkyBlue; // Color for slope up
input color              MaColorDown     = clrPaleVioletRed; // Color for slope down
input int                AtrPeriod       = 20;             // Range period
input double             AtrMultiplier   = 2.0;            // Range multiplier
input enAtrMode          AtrMode         = atr_Rng;        // Range calculating mode
input enCandleMode       ViewBars        = cm_None;        // View bars as :
input bool               Interpolate     = true;           // Interpolate mtf data

input string  Settings_volumenes="***Settings_volumenes***";   ///*---
input ENUM_APPLIED_VOLUME  applied_volume_volumenes=VOLUME_TICK;   // tipo de volumen
input ENUM_TIMEFRAMES      period_volumenes=PERIOD_CURRENT;        // timeframe

input string Settings_ma_vol="***Settings_ma_vol***";
input int ma_vol_Periodo=3;
input int ma_vol_Shift=0;
input ENUM_MA_METHOD ma_vol_Mode=MODE_SMA;

input string Settings_bol_ma_vol="***Settings_bol_ma_vol***";  ///*---
input int bol_ma_vol_Periodo=20;
input int bol_ma_vol_Shift=0;
input int bol_ma_vol_Desviation=2;

input string  Settings_ad="***Settings_ad***";   ///*---
input ENUM_APPLIED_VOLUME  volumes;                // volumen que se utiliza
input ENUM_TIMEFRAMES      period_ad=PERIOD_CURRENT;  // período de tiempo

input string Settings_bol_ad="***Settings_bol_ad***";  ///*---
input int bol_ad_Periodo=20;
input int bol_ad_Shift=0;
input int bol_ad_Desviation=2;

input string Settings_ma_1="***Settings_ma_1***";
input int Periodo_ma_1=1;
input int Shift_ma_1=0;
input ENUM_MA_METHOD Mode_ma_1=MODE_SMA;
input ENUM_APPLIED_PRICE AppliedPrice_ma_1=PRICE_CLOSE;

input string Settings_bol="***Settings_bol***";///*---
input int bol_Periodo=13;
input int bol_Shift=0;
input int bol_Desviation=2;

input string Settings_ma_20="***Settings_ma_20***";
input int Periodo_ma_20=20;
input int Shift_ma_20=0;
input ENUM_MA_METHOD Mode_ma_20=MODE_SMA;
input ENUM_APPLIED_PRICE AppliedPrice_ma_20=PRICE_CLOSE;

input string Settings_Bollinger_7="***Settings_Bollinger_7***";///*---
input int Bollinger_7_Periodo=20;
input int Bollinger_7_Shift=0;
input int Bollinger_7_Desviation=7;


input string Settings_Bollinger_6="***Settings_Bollinger_6***";///*---
input int Bollinger_6_Periodo=20;
input int Bollinger_6_Shift=0;
input int Bollinger_6_Desviation=2;


input string Settings_Alligator2="***Settings_Alligator2***";///*---
input int Jaw2=13;
input int Jaw2_Shift=8;
input int Teeth2=5;
input int Teeth2_Shift=5;
input int Lips2=5;
input int Lips2_Shift=3;
input ENUM_MA_METHOD Mode_Alligator2=MODE_SMMA;
input ENUM_APPLIED_PRICE AppliedPrice_Alligator2=PRICE_MEDIAN;

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

double ADX_V_Buffer[];
double DI_V_plusBuffer[];
double DI_V_minusBuffer[];
double ADX_W_Buffer[];
double DI_W_plusBuffer[];
double DI_W_minusBuffer[];
double ADX_X_Buffer[];
double DI_X_plusBuffer[];
double DI_X_minusBuffer[];
double ADX_Y_Buffer[];
double DI_Y_plusBuffer[];
double DI_Y_minusBuffer[];
double ADX_Z_Buffer[];
double DI_Z_plusBuffer[];
double DI_Z_minusBuffer[];
double Bollinger_ADX_V_Buffer_DN[];
double Bollinger_ADX_V_Buffer_UP[];

double Media_Slow_Buffer[];
double Media_Fast_Buffer[];


double ROC_Buffer[];
double Bollinger_ROC_Buffer_DN[];
double Bollinger_ROC_Buffer_UP[];
double Bollinger_ROC_Buffer_BASE[];

double keltner_channel_Buffer_Up[];
double keltner_channel_Buffer_Dn[];

double volumenes_Buffer[];
double ma_vol_Buffer[];
double bol_ma_vol_Buffer_DN[];
double bol_ma_vol_Buffer_UP[];
double bol_ma_vol_Buffer_BASE[];

double ad_Buffer[];
double bol_ad_Buffer_DN[];
double bol_ad_Buffer_UP[];
double bol_ad_Buffer_BASE[];

double bol_Buffer[];
double bol_Buffer_DN[];
double bol_Buffer_UP[];
double bol_Buffer_BASE[];

double ma_1_Buffer[];
double ma_20_Buffer[];

double Bollinger_7_Buffer_UP[];
double Bollinger_7_Buffer_DN[];
double Bollinger_7_Buffer_Central[];

double Bollinger_6_Buffer_UP[];
double Bollinger_6_Buffer_DN[];
double Bollinger_6_Buffer_Central[];

double Alligator2Buffer[];




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
         Buy_Tiempo_Simple4=0,Sell_Tiempo_Simple4=0,Tiempo_Dif_Buy=0,Tiempo_Dif_Sell=0,Buy_Tiempo_ROC=0,Sell_Tiempo_ROC=0;
color COLORVO=clrAqua;


datetime TiempoConfirmacionBuy=0,TiempoConfirmacionSell=0,TiempoConfirmacionBuy1=0,TiempoConfirmacionSell1=0,TiempoConfirmacionBuy2=0,TiempoConfirmacionSell2=0,
         TiempoConfirmacionBuy3=0,TiempoConfirmacionSell3=0, TiempoConfirmacionBuy4=0,TiempoConfirmacionSell4=0, TiempoConfirmacionBuy5=0,TiempoConfirmacionSell5=0,
         TiempoConfirmacionBuy6=0,TiempoConfirmacionSell6=0, TiempoConfirmacionBuy7=0,TiempoConfirmacionSell7=0, TiempoConfirmacionBuy8=0,TiempoConfirmacionSell8=0,
         TiempoConfirmacionBuy9=0,TiempoConfirmacionSell9=0, TiempoConfirmacionBuy10=0,TiempoConfirmacionSell10=0, TiempoConfirmacionBuy11=0,TiempoConfirmacionSell11=0,
         TiempoConfirmacionBuy12=0,TiempoConfirmacionSell12=0, TiempoConfirmacionBuy13=0,TiempoConfirmacionSell13=0, TiempoConfirmacionBuy14=0,TiempoConfirmacionSell14=0,
         TiempoConfirmacionBuy15=0,TiempoConfirmacionSell15=0, TiempoConfirmacionBuy16=0,TiempoConfirmacionSell16=0, TiempoConfirmacionBuy17=0,TiempoConfirmacionSell17=0;
MqlRates Rates[];
MqlDateTime Tiempo;


ENUM_ANCHOR_POINT Anclaje=ANCHOR_LEFT_UPPER;
int CharIndicator=-2;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   Funcion_Iniciar();

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

      if(shift!=rates_total-1)
         continue;

      bool Horario=EvaluaHorario(Hora_Inicio,Hora_Final,time[shift]);

      if(Horario==false)
         continue;

      bool Buy=false, Sell=false;
      ArrowSignalUP[shift]=EMPTY_VALUE;
      ArrowSignalDN[shift]=EMPTY_VALUE;
      int CumOffset=0;

      IgualarBuffers(rates_total,shift);

      ResetLastError();
      bool AlertBuy=false;
      bool AlertSell=false;

      ///////1
      Patron_1(time,shift,CumOffset,low,high,AlertBuy,AlertSell,rates_total);
      //////2
      Patron_2(time,shift,CumOffset,low,high,AlertBuy,AlertSell,rates_total);
      ///////3
      Patron_3(time,shift,CumOffset,low,high,AlertBuy,AlertSell,rates_total);
      ///////4
      Patron_4(time,shift,CumOffset,low,high,AlertBuy,AlertSell,rates_total);
      ////////5
      Patron_5(time,shift,CumOffset,low,high,AlertBuy,AlertSell,rates_total);
      ////////6
      Patron_6(time,shift,CumOffset,low,high,AlertBuy,AlertSell,rates_total);
      ////////7
      Patron_7(time,shift,CumOffset,low,high,AlertBuy,AlertSell,rates_total);
      ////////8
      Patron_8(time,shift,CumOffset,low,high,AlertBuy,AlertSell,rates_total);
      ////////9
      Patron_9(time,shift,CumOffset,low,high,AlertBuy,AlertSell,rates_total);
      ////////10
      Patron_10(time,shift,CumOffset,low,high,AlertBuy,AlertSell,rates_total);
      ////////11
      Patron_11(time,shift,CumOffset,low,high,AlertBuy,AlertSell,rates_total);
      ////////12
      Patron_12(time,shift,CumOffset,low,high,AlertBuy,AlertSell,rates_total);
      ////////14
      Patron_14(time,shift,CumOffset,low,high,AlertBuy,AlertSell,rates_total);
      ////////16
      Patron_16(time,shift,CumOffset,low,high,AlertBuy,AlertSell,rates_total);
      ////////17
      Patron_17(time,shift,CumOffset,low,high,AlertBuy,AlertSell,rates_total);



      // DIBUJAR VERTICALES CONFIRMACION
      Funcion_Lineas(time,close,open,shift,rates_total);
      //ALERTAS

      if(AlertBuy && shift==rates_total-1)
         EmitirAlerta("BUY");
      if(AlertSell && shift==rates_total-1)
         EmitirAlerta("SELL");
     }
   ChartRedraw();
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
   ObjectsDeleteAll(0,"Patron Conjuntos ",0,OBJ_TEXT);
   ObjectsDeleteAll(0,"PERDIDA ",0,OBJ_VLINE);
   ObjectsDeleteAll(0,"GANADA ",0,OBJ_VLINE);
   ObjectsDeleteAll(0,"CuadroTEXTi",0,OBJ_LABEL);

   Comment("");
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EmitirAlerta(string Tipo)
  {
   if(AlertPC)
      Alert("Operacion ",Tipo," en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
   if(AlertMovil)
      SendNotification("Operacion "+Tipo+" en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));

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


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DibujarCuadros()
  {
   for(int i=0; i<30; i++)
     {
      for(int j=0; j<20; j++)
        {
         NameLabel[i][j]="CuadroTEXTi="+string(i)+"j="+string(j);
         if(ObjectFind(0,NameLabel[i][j])!=0)
            LabelCreate(0,NameLabel[i][j],0,AnchoCuadro*i+4*i+3+(AnchoCuadro/2),j*AlturaCuadro+5*j+3+12,0,"--","Comic Sans",8,clrGhostWhite,0,0,false,false,false,1);
         bool ModificarTexto=ObjectSetString(0,NameLabel[i][j],OBJPROP_TEXT,string("0"));
        }
     }
   string NameLabel_Percent="CuadroTEXTi= Porcentaje";
   if(ObjectFind(0,NameLabel_Percent)!=0)
      LabelCreate(0,NameLabel_Percent,0,AnchoCuadro*0+4*0+3+(AnchoCuadro/2),20*AlturaCuadro+5*20+3+12,0,"--","Comic Sans",8,clrGhostWhite,0,0,false,false,false,1);
   bool ModificarTexto=ObjectSetString(0,NameLabel_Percent,OBJPROP_TEXT,string("Porcentaje Ganadas =  --- Porcentaje Perdidas = --- Total= -----"));

   NameLabel_Percent="CuadroTEXTi= Total";
   if(ObjectFind(0,NameLabel_Percent)!=0)
      LabelCreate(0,NameLabel_Percent,0,AnchoCuadro*0+4*0+3+(AnchoCuadro/2),21*AlturaCuadro+5*21+3+12,0,"--","Comic Sans",8,clrGhostWhite,0,0,false,false,false,1);
   ModificarTexto=ObjectSetString(0,NameLabel_Percent,OBJPROP_TEXT,string("Total= -----"));

   NameLabel_Percent="CuadroTEXTi= Porcentaje Veces";
   if(ObjectFind(0,NameLabel_Percent)!=0)
      LabelCreate(0,NameLabel_Percent,0,AnchoCuadro*0+4*0+3+(AnchoCuadro/2),22*AlturaCuadro+5*22+3+12,0,"--","Comic Sans",8,clrGhostWhite,0,0,false,false,false,1);
   ModificarTexto=ObjectSetString(0,NameLabel_Percent,OBJPROP_TEXT,string("Veces= -----"));

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IgualarArray()
  {

   if((Ganadas==0 && Perdidas==1) || (Perdidas==0 && Ganadas==1))
     {
      for(int j=0; j<599; j++)
        {
         ArrayCuadro[j].Valor=ArrayCuadro[j+1].Valor;
         ArrayCuadro[j].Color=ArrayCuadro[j+1].Color;
        }
     }

   if(Ganadas>0)
     {
      ArrayCuadro[599].Valor=Ganadas;
      ArrayCuadro[599].Color=ColorGanada;
     }

   if(Perdidas>0)
     {
      ArrayCuadro[599].Valor=Perdidas;
      ArrayCuadro[599].Color=ColorPerdida;
     }

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IgualarCuadros()
  {
   int veces_3=0, veces_4=0, veces_5=0;
   int Total=0;
   int IndiceArray=599;
   int GanadasT=0;
   int PerdidasT=0;
   for(int j=19; j>=0; j--)
     {
      for(int i=29; i>=0; i--)
        {
         int Valor=ArrayCuadro[IndiceArray].Valor;
         string ValorModificar=(string)Valor;
         Total=Total+ArrayCuadro[IndiceArray].Valor;
         bool ModificarTexto=ObjectSetString(0,NameLabel[i][j],OBJPROP_TEXT,(string)ValorModificar);
         if(!ModificarTexto)
            Print("No modifico Texto");
         color ColorModificar=ArrayCuadro[IndiceArray].Color;

         if(IndiceArray<599)
           {
            if(Valor==3 && ColorPerdida==ColorModificar)
            veces_3++;
            if(Valor==4 && ColorPerdida==ColorModificar)
            veces_4++;
            if(Valor==5 && ColorPerdida==ColorModificar)
            veces_5++;
           }

      if(ColorModificar==ColorPerdida)
            PerdidasT=PerdidasT+Valor;
         if(ColorModificar==ColorGanada)
            GanadasT=GanadasT+Valor;

         bool ModificarColor=ObjectSetInteger(0,NameLabel[i][j],OBJPROP_COLOR,ColorModificar);
         if(!ModificarColor)
            Print("No modifico Color");
         IndiceArray--;
        }
     }
   bool ModificarTexto;
   if(Total>0)
     {
      ModificarTexto=ObjectSetString(0,"CuadroTEXTi= Porcentaje",OBJPROP_TEXT,"Porcentaje Ganadas = "
                                     +DoubleToString((double(GanadasT)/double(Total))*100,2)+" %     Porcentaje Perdidas = "+
                                     DoubleToString((double(PerdidasT)/double(Total))*100,2)+" % ");
     }

   ModificarTexto=ObjectSetString(0,"CuadroTEXTi= Total",OBJPROP_TEXT,"Total = "+(string)Total);
    
   Total=veces_3+veces_4+veces_5; 
   if(Total==0)Total=1;
   string veces="3 veces= "+DoubleToString(veces_3/(double(Total))*100,2)+"%  4 veces= "+ DoubleToString(veces_4/(double(Total))*100,2)+"%  5 veces= "+ DoubleToString(veces_5/(double(Total))*100,2)+"%";
   ModificarTexto=ObjectSetString(0,"CuadroTEXTi= Porcentaje Veces",OBJPROP_TEXT,veces);

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool LabelCreate(const long              chart_ID=0,               // ID del gráfico
                 const string            name="Label",             // nombre de la etiqueta
                 const int               sub_window=0,             // número de subventana
                 const int               x=0,                      // coordenada por el eje X
                 const int               y=0,                      // coordenada por el eje Y
                 const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace
                 const string            text="Label",             // texto
                 const string            font="Arial",             // fuente
                 const int               font_size=10,             // tamaño de la fuente
                 const color             clr=clrRed,               // color
                 const double            angle=0.0,                // inclinación del texto
                 const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // modo de anclaje
                 const bool              back=false,               // al fondo
                 const bool              selection=false,          // seleccionar para mover
                 const bool              hidden=true,              // ocultar en la lista de objetos
                 const long              z_order=0)                //prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la etiqueta de texto
   if(!ObjectCreate(chart_ID,name,OBJ_LABEL,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la etiqueta de texto! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos las coordenadas de la etiqueta
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del punto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- ponemos el texto
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- establecemos la fuente del texto
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- establecemos el tamaño del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- establecemos el ángulo de inclinación del texto
   ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);
//--- establecemos el modo de anclaje
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
//--- establecemos el color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de desplazamiento de la etiqueta con ratón
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- establecemos la prioridad para obtener el evento de cliquear sobre el gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- ejecución con éxito
   return(true);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RectLabelCreate(const long             chart_ID=0,               // ID del gráfico
                     const string           name="RectLabel",         // nombre de la etiqueta
                     const int              sub_window=0,             // número de subventana
                     const int              x=0,                      // coordenada por el eje X
                     const int              y=0,                      // coordenada por el eje Y
                     const int              width=50,                 // ancho
                     const int              height=18,                // alto
                     const color            back_clr=C'236,233,216',  // color del fondo
                     const ENUM_BORDER_TYPE border=BORDER_SUNKEN,     // tipo del borde
                     const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace
                     const color            clr=clrRed,               // color del contorno plano (Flat)
                     const ENUM_LINE_STYLE  style=STYLE_SOLID,        // estilo del contorno plano
                     const int              line_width=1,             // grosor del contorno plano
                     const bool             back=false,               // al fondo
                     const bool             selection=false,          // seleccionar para mover
                     const bool             hidden=true,              // ocultar en la lista de objetos
                     const long             z_order=0)                // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la etiqueta rectangular
   if(!ObjectCreate(chart_ID,name,OBJ_RECTANGLE_LABEL,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la etiqueta rectangular! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos las coordenadas de la etiqueta
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- establecemos las dimensiones de la etiqueta
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- establecemos el color del fondo
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- establecemos el tipo del borde
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_TYPE,border);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del punto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- establecemos el color del contorno plano (en modo Flat)
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el estilo de las líneas del contorno plano
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- establecemos el grosor del contorno plano
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,line_width);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de desplazamiento de la etiqueta con ratón
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- establecemos la prioridad para obtener el evento de cliquear sobre el gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- ejecución con éxito
   return(true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluaHorario(int Apertura,int Cierre,datetime TiempoEvalua)
  {
   MqlDateTime TiempoEvaluacion;
   TimeToStruct(TiempoEvalua,TiempoEvaluacion);

   bool EntraHorario=false;
   if(Apertura>Cierre && (TiempoEvaluacion.hour>=Apertura || TiempoEvaluacion.hour<Cierre))
      EntraHorario=true;
   else
      if(Apertura<Cierre && (TiempoEvaluacion.hour>=Apertura && TiempoEvaluacion.hour<Cierre))
         EntraHorario=true;

   return EntraHorario;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Evalua_Confirmacion(datetime &Tiempo_Confirmacion,int shift,int const &rates_total,string frase,bool isBuy,datetime &Tiempo_Confirmacion_Eva
                         ,bool &Alerta,int CumOffset)
  {


   if(isBuy)
     {
      if(Tiempo_Confirmacion>Rates[0].time && Tiempo_Confirmacion!=0)
        {
         if(shift==rates_total-1)
            EmitirAlerta("BUY");
         if(((Rates[1].close<Rates[1].open) || (Rates[1].close>Rates[1].open)))
           {
            if(ArrayCuadro[599].Valor>=PerdidasAtras && ArrayCuadro[599].Color==ColorPerdida)
              {
               ArrowSignalDN[shift-1] = Rates[1].low - (Pointer_Offset*_Point);
               Alerta=true;
              }
            MarkPattern(GetName("Patron Conjuntos Confirmacion",Rates[1].time), Rates[1].time, Rates[1].low - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, frase, Text_VelasOpuestas, ColorConfirmacion);
            Tiempo_Confirmacion=0;
            Tiempo_Confirmacion_Eva=Rates[0].time;
           }
        }
     }

   else
     {
      if(Tiempo_Confirmacion>Rates[0].time && Tiempo_Confirmacion!=0)
        {
         // TimeToStruct(time[shift-1],Tiempo);
         //int MinutoEvaluacion=(Tiempo.min-((int(Tiempo.min/10))*10));

         if((Rates[1].close<Rates[1].open) || (Rates[1].close>Rates[1].open))
           {
            if(ArrayCuadro[599].Valor>=PerdidasAtras && ArrayCuadro[599].Color==ColorPerdida)
              {
               ArrowSignalUP[shift-1] = Rates[1].high + (Pointer_Offset*_Point);
               Alerta=true;
              }
            Tiempo_Confirmacion=0;
            Tiempo_Confirmacion_Eva=Rates[0].time;
            MarkPattern(GetName("Patron Conjuntos Confirmacion",Rates[1].time), Rates[1].time, Rates[1].high  + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,frase, Text_VelasOpuestas, ColorConfirmacion);
           }
        }


     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Patron_1(datetime const &time[],int shift,int &CumOffset,double const &low[], double const &high[],bool &AlertBuy,bool &AlertSell,int const rates_total)
  {

   if(Divergencia_Puntos_1_Buffer_DN[2]!=EMPTY_VALUE && Divergencia_Puntos_2_Buffer_DN[2]!=EMPTY_VALUE
      && Divergencia_Puntos_3_Buffer_DN[2]!=EMPTY_VALUE && Divergencia_Puntos_4_Buffer_DN[2]!=EMPTY_VALUE
      && Bollinger_2_Buffer_DN[2]<Bollinger_1_Buffer_DN[2] &&  Rates[1].close>Rates[2].close
      && Rates[2].close>Rates[3].close &&  CCIBuffer[0]>CCIBuffer[1] && CCIBuffer[1]>CCIBuffer[2])
     {
      bool AlertaCondicion1=true;
      for(int j=1; j<36; j++)
        {
         if(EMA_Buffer_Alligator[j]>Bollinger_1_Buffer_Central[j])
           {
            AlertaCondicion1=false;
            break;
           }
        }
      bool AlertaCondicion2=false;
      for(int j=3; j<40; j++)
        {
         if(ADX_Buffer[j]>Bollinger_ADX_2_Buffer_UP[j] && ADX_Buffer[j+1]>Bollinger_ADX_2_Buffer_UP[j+1] && ADX_Buffer[j+2]>Bollinger_ADX_2_Buffer_UP[j+2])
           {AlertaCondicion2=true; break;}
        }

      if(AlertaCondicion1 && AlertaCondicion2)
        {
         Buy_Tiempo=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasSar;
        }
     }

   if(Divergencia_Puntos_1_Buffer_UP[2]!=EMPTY_VALUE && Divergencia_Puntos_2_Buffer_UP[2]!=EMPTY_VALUE &&
      Divergencia_Puntos_3_Buffer_UP[2]!=EMPTY_VALUE && Divergencia_Puntos_4_Buffer_UP[2]!=EMPTY_VALUE &&
      Bollinger_2_Buffer_UP[2]>Bollinger_1_Buffer_UP[2] &&  Rates[1].close<Rates[2].close
      && Rates[2].close<Rates[3].close &&  CCIBuffer[0]<CCIBuffer[1] && CCIBuffer[1]<CCIBuffer[2])
     {
      bool AlertaCondicion1=true;
      for(int j=1; j<36; j++)
        {
         if(EMA_Buffer_Alligator[j]<Bollinger_1_Buffer_Central[j])
           {
            AlertaCondicion1=false;
            break;
           }
        }
      bool AlertaCondicion2=false;
      for(int j=3; j<40; j++)
        {
         if(ADX_Buffer[j]>Bollinger_ADX_2_Buffer_UP[j] && ADX_Buffer[j+1]>Bollinger_ADX_2_Buffer_UP[j+1] && ADX_Buffer[j+2]>Bollinger_ADX_2_Buffer_UP[j+2])
           {AlertaCondicion2=true; break;}
        }

      if(AlertaCondicion1 && AlertaCondicion2)
        {
         Sell_Tiempo=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasSar;
        }
     }

   if(Buy_Tiempo>time[shift] && SARBuffer[2]>=Rates[2].high && SARBuffer[1]<=Rates[1].low && Buy_Tiempo!=0     && ((DI_plusBuffer[2]<DI_minusBuffer[2]  && DI_plusBuffer[1]>DI_minusBuffer[1])   || (DI_plusBuffer[2]<ADX_2_Buffer[2]  && DI_plusBuffer[1]>ADX_2_Buffer[1]) || ((MathAbs(DI_plusBuffer[1]-DI_minusBuffer[1])>22)  && DI_plusBuffer[1]>ADX_2_Buffer[1]) || ((MathAbs(DI_plusBuffer[1]-DI_minusBuffer[1])>23)  && ADX_2_Buffer[1]>DI_plusBuffer[1]   && DI_plusBuffer[1]>DI_minusBuffer[1] && ADX_2_Buffer[1]>DI_minusBuffer[1]  && ADX_2_Buffer[1]>26)))
     {
      if(Solo_Confirmacion==false)
        {
         CumOffset = CumOffset+IncOffset;
         ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         MarkPattern(GetName("Patron Conjuntos CRUCE DI 1 1",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "C_D_1", Text_VelasOpuestas, COLORVO);
         AlertBuy=true;
        }
      Buy_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Buy_Tiempo_Confirmacion,shift,rates_total,"C_D_1",true,TiempoConfirmacionBuy1,AlertBuy,CumOffset);


   if(Sell_Tiempo>time[shift] && SARBuffer[1]>=Rates[1].high && SARBuffer[2]<=Rates[2].low && Sell_Tiempo!=0  && ((DI_plusBuffer[2]>DI_minusBuffer[2]  && DI_plusBuffer[1]<DI_minusBuffer[1])  || (DI_minusBuffer[2]>ADX_2_Buffer[2]  && DI_minusBuffer[1]<ADX_2_Buffer[1])      || ((MathAbs(DI_plusBuffer[1]-DI_minusBuffer[1])>22)  && DI_minusBuffer[1]>ADX_2_Buffer[1])  || ((MathAbs(DI_plusBuffer[1]-DI_minusBuffer[1])>23)  && ADX_2_Buffer[1]>DI_plusBuffer[1]   && DI_plusBuffer[1]<DI_minusBuffer[1] && ADX_2_Buffer[1]>DI_minusBuffer[1]  && ADX_2_Buffer[1]>26)))
     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos CRUCE DI 1 1",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"C_D_1", Text_VelasOpuestas, COLORVO);
         CumOffset = CumOffset+IncOffset;
         ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         AlertSell=true;
        }
      Sell_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Sell_Tiempo_Confirmacion,shift,rates_total,"C_D_1",false,TiempoConfirmacionSell1,AlertSell,CumOffset);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Patron_2(datetime const &time[],int shift,int &CumOffset,double const &low[], double const &high[],bool &AlertBuy,bool &AlertSell,int const rates_total)
  {

   if(Rates[1].open>Bollinger_1_Buffer_DN[1] && Rates[1].close<Bollinger_1_Buffer_DN[1] && Rates[1].close<Bollinger_2_2_Buffer_DN[1]
      && Rates[0].open<Bollinger_1_Buffer_DN[1] && (Bollinger_2_2_Buffer_UP[0]-Bollinger_2_2_Buffer_DN[0]<=DistanciaBollinger2 || (
               Bollinger_2_2_Buffer_BASE[3]<Bollinger_2_2_Buffer_BASE[2] && Bollinger_2_2_Buffer_BASE[2]<Bollinger_2_2_Buffer_BASE[1] &&
               Bollinger_2_2_Buffer_UP[3]<Bollinger_2_2_Buffer_UP[2] && Bollinger_2_2_Buffer_UP[2]<Bollinger_2_2_Buffer_UP[1] &&
               Bollinger_2_2_Buffer_DN[3]<Bollinger_2_2_Buffer_DN[2] && Bollinger_2_2_Buffer_DN[2]<Bollinger_2_2_Buffer_DN[1])) &&
      ADX_3_Buffer[0]>Bollinger_ADX_Buffer_UP_2[0] && ADX_3_Buffer[1]>Bollinger_ADX_Buffer_UP_2[1] && ADX_3_Buffer[2]<Bollinger_ADX_Buffer_UP_2[2]
      && Bollinger_Klinger_Buffer_DN[0]<Bollinger_Klinger_Buffer_DN[1] && Bollinger_Klinger_Buffer_DN[1]<Bollinger_Klinger_Buffer_DN[2]
      && Bollinger_ForceIndex_Buffer_DN[0]<Bollinger_ForceIndex_Buffer_DN[1] && Bollinger_ForceIndex_Buffer_UP[0]-Bollinger_ForceIndex_Buffer_DN[0]>=DistanciaBollingerForce
      &&  ADX_3_Buffer[0]>ADX_3_Buffer[1] && ADX_3_Buffer[0]>ADX_3_Buffer[2] && ADX_3_Buffer[0]>ADX_3_Buffer[3] && Rates[1].close<Rates[1].open && KlingerBuffer[0]<0 && KlingerBuffer[1]<0 && KlingerBuffer[2]<0 && KlingerBuffer[3]<0 && KlingerBuffer[0]<KlingerBuffer[1] && KlingerBuffer[1]<KlingerBuffer[2] && KlingerBuffer[2]<KlingerBuffer[3] && CCIBuffer[0]<CCIBuffer[1] && CCIBuffer[1]<CCIBuffer[2] && CCIBuffer[0]<-190
      && ((DI_6_plusBuffer[2]>DI_6_minusBuffer[2]  && DI_6_plusBuffer[1]<DI_6_minusBuffer[1])  || (DI_6_minusBuffer[2]>ADX_4_Buffer[2]  && DI_6_minusBuffer[1]<ADX_4_Buffer[1])      || ((MathAbs(DI_6_plusBuffer[1]-DI_6_minusBuffer[1])>22)  && DI_6_minusBuffer[1]>ADX_4_Buffer[1])  || ((MathAbs(DI_6_plusBuffer[1]-DI_6_minusBuffer[1])>23)  && ADX_4_Buffer[1]>DI_6_plusBuffer[1]   && DI_6_plusBuffer[1]<DI_6_minusBuffer[1] && ADX_4_Buffer[1]>DI_6_minusBuffer[1]  && ADX_4_Buffer[1]>26))


     )
     {
      if(Solo_Confirmacion==false)
        {
         ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         MarkPattern(GetName("Patron Conjuntos CRUCE DI ADX 1 1",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "C_D_A1", Text_VelasOpuestas, COLORVO);
         AlertBuy=true;
        }
      Buy_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }
   Evalua_Confirmacion(Buy_Tiempo_Confirmacion,shift,rates_total,"C_D_A1",true,TiempoConfirmacionBuy2,AlertBuy,CumOffset);

   if(Rates[1].open<Bollinger_1_Buffer_UP[2] && Rates[1].close>Bollinger_1_Buffer_UP[2] && Rates[1].close>Bollinger_2_2_Buffer_UP[2]
      && Rates[0].open>Bollinger_1_Buffer_UP[1] && (Bollinger_2_2_Buffer_UP[0]-Bollinger_2_2_Buffer_DN[0]<=DistanciaBollinger2 || (
               Bollinger_2_2_Buffer_BASE[3]>Bollinger_2_2_Buffer_BASE[2] && Bollinger_2_2_Buffer_BASE[2]>Bollinger_2_2_Buffer_BASE[1] &&
               Bollinger_2_2_Buffer_UP[3]>Bollinger_2_2_Buffer_UP[2] && Bollinger_2_2_Buffer_UP[2]>Bollinger_2_2_Buffer_UP[1] &&
               Bollinger_2_2_Buffer_DN[3]>Bollinger_2_2_Buffer_DN[2] && Bollinger_2_2_Buffer_DN[2]>Bollinger_2_2_Buffer_DN[1])) &&
      ADX_3_Buffer[0]>Bollinger_ADX_Buffer_UP_2[0] && ADX_3_Buffer[1]>Bollinger_ADX_Buffer_UP_2[1] && ADX_3_Buffer[2]<Bollinger_ADX_Buffer_UP_2[2]
      && Bollinger_Klinger_Buffer_UP[0]>Bollinger_Klinger_Buffer_UP[1] && Bollinger_Klinger_Buffer_UP[1]>Bollinger_Klinger_Buffer_UP[2]
      && Bollinger_ForceIndex_Buffer_UP[0]>Bollinger_ForceIndex_Buffer_UP[1]  && Bollinger_ForceIndex_Buffer_UP[0]-Bollinger_ForceIndex_Buffer_DN[0]>=DistanciaBollingerForce
      &&  ADX_3_Buffer[0]>ADX_3_Buffer[1] && ADX_3_Buffer[0]>ADX_3_Buffer[2] && ADX_3_Buffer[0]>ADX_3_Buffer[3] && Rates[1].close>Rates[1].open && KlingerBuffer[0]>0 && KlingerBuffer[1]>0 && KlingerBuffer[2]>0 && KlingerBuffer[3]>0 && KlingerBuffer[0]>KlingerBuffer[1] && KlingerBuffer[1]>KlingerBuffer[2] && KlingerBuffer[2]>KlingerBuffer[3] &&  CCIBuffer[0]>CCIBuffer[1] && CCIBuffer[1]>CCIBuffer[2]   &&  CCIBuffer[0]>190
      && ((DI_6_plusBuffer[2]<DI_6_minusBuffer[2]  && DI_6_plusBuffer[1]>DI_6_minusBuffer[1])   || (DI_6_plusBuffer[2]<ADX_4_Buffer[2]  && DI_6_plusBuffer[1]>ADX_4_Buffer[1]) || ((MathAbs(DI_6_plusBuffer[1]-DI_6_minusBuffer[1])>22)  && DI_6_plusBuffer[1]>ADX_4_Buffer[1]) || ((MathAbs(DI_6_plusBuffer[1]-DI_6_minusBuffer[1])>23)  && ADX_4_Buffer[1]>DI_6_plusBuffer[1]   && DI_6_plusBuffer[1]>DI_6_minusBuffer[1] && ADX_4_Buffer[1]>DI_6_minusBuffer[1]  && ADX_4_Buffer[1]>26))


     )
     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos CRUCE DI ADX 1 1",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"C_D_A1", Text_VelasOpuestas, COLORVO);
         ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         AlertSell=true;
        }
      Sell_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }


   Evalua_Confirmacion(Sell_Tiempo_Confirmacion,shift,rates_total,"C_D_A1",false,TiempoConfirmacionSell2,AlertSell,CumOffset);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Patron_3(datetime const &time[],int shift,int &CumOffset,double const &low[], double const &high[],bool &AlertBuy,bool &AlertSell,int const rates_total)
  {
   if(Rates[1].open>Bollinger_1_Buffer_DN[1] && Rates[1].close<Bollinger_1_Buffer_DN[1] && Rates[1].close<Bollinger_2_2_Buffer_DN[1]
      && Rates[0].open<Bollinger_1_Buffer_DN[1] && (Bollinger_2_2_Buffer_UP[0]-Bollinger_2_2_Buffer_DN[0]<=DistanciaBollinger2 || (
               Bollinger_2_2_Buffer_BASE[3]<Bollinger_2_2_Buffer_BASE[2] && Bollinger_2_2_Buffer_BASE[2]<Bollinger_2_2_Buffer_BASE[1] &&
               Bollinger_2_2_Buffer_UP[3]<Bollinger_2_2_Buffer_UP[2] && Bollinger_2_2_Buffer_UP[2]<Bollinger_2_2_Buffer_UP[1] &&
               Bollinger_2_2_Buffer_DN[3]<Bollinger_2_2_Buffer_DN[2] && Bollinger_2_2_Buffer_DN[2]<Bollinger_2_2_Buffer_DN[1])) &&
      ADX_3_Buffer[0]>Bollinger_ADX_Buffer_UP_2[0] && ADX_3_Buffer[1]>Bollinger_ADX_Buffer_UP_2[1] && ADX_3_Buffer[2]<Bollinger_ADX_Buffer_UP_2[2]
      && Bollinger_Klinger_Buffer_DN[0]<Bollinger_Klinger_Buffer_DN[1] && Bollinger_Klinger_Buffer_DN[1]<Bollinger_Klinger_Buffer_DN[2]
      && Bollinger_ForceIndex_Buffer_DN[0]<Bollinger_ForceIndex_Buffer_DN[1] && Bollinger_ForceIndex_Buffer_UP[0]-Bollinger_ForceIndex_Buffer_DN[0]>=DistanciaBollingerForce
      &&  ADX_3_Buffer[0]>ADX_3_Buffer[1] && ADX_3_Buffer[0]>ADX_3_Buffer[2] && ADX_3_Buffer[0]>ADX_3_Buffer[3] &&  Rates[1].close<Rates[1].open)
     {
      Buy_Tiempo_ADX2=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasKlinger;
     }

   if(Rates[1].open<Bollinger_1_Buffer_UP[2] && Rates[1].close>Bollinger_1_Buffer_UP[2] && Rates[1].close>Bollinger_2_2_Buffer_UP[2]
      && Rates[0].open>Bollinger_1_Buffer_UP[1] && (Bollinger_2_2_Buffer_UP[0]-Bollinger_2_2_Buffer_DN[0]<=DistanciaBollinger2 || (
               Bollinger_2_2_Buffer_BASE[3]>Bollinger_2_2_Buffer_BASE[2] && Bollinger_2_2_Buffer_BASE[2]>Bollinger_2_2_Buffer_BASE[1] &&
               Bollinger_2_2_Buffer_UP[3]>Bollinger_2_2_Buffer_UP[2] && Bollinger_2_2_Buffer_UP[2]>Bollinger_2_2_Buffer_UP[1] &&
               Bollinger_2_2_Buffer_DN[3]>Bollinger_2_2_Buffer_DN[2] && Bollinger_2_2_Buffer_DN[2]>Bollinger_2_2_Buffer_DN[1])) &&
      ADX_3_Buffer[0]>Bollinger_ADX_Buffer_UP_2[0] && ADX_3_Buffer[1]>Bollinger_ADX_Buffer_UP_2[1] && ADX_3_Buffer[2]<Bollinger_ADX_Buffer_UP_2[2]
      && Bollinger_Klinger_Buffer_UP[0]>Bollinger_Klinger_Buffer_UP[1] && Bollinger_Klinger_Buffer_UP[1]>Bollinger_Klinger_Buffer_UP[2]
      && Bollinger_ForceIndex_Buffer_UP[0]>Bollinger_ForceIndex_Buffer_UP[1]  && Bollinger_ForceIndex_Buffer_UP[0]-Bollinger_ForceIndex_Buffer_DN[0]>=DistanciaBollingerForce
      &&  ADX_3_Buffer[0]>ADX_3_Buffer[1] && ADX_3_Buffer[0]>ADX_3_Buffer[2] && ADX_3_Buffer[0]>ADX_3_Buffer[3] && Rates[1].close>Rates[1].open)
     {
      Sell_Tiempo_ADX2=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasKlinger;
     }


   if(Sell_Tiempo_ADX2>time[shift] && Sell_Tiempo_ADX2!=0 && KlingerBuffer[2]>Bollinger_Klinger_Buffer_BASE[2] && KlingerBuffer[3]<Bollinger_Klinger_Buffer_BASE[3]
      && AwesomeOscilator_Buffer[1]>AwesomeOscilator_Buffer[2]  && AwesomeOscilator_Buffer[0]>AwesomeOscilator_Buffer[1] && KlingerBuffer[0]>KlingerBuffer[1]
      && ((DI_6_plusBuffer[2]<DI_6_minusBuffer[2]  && DI_6_plusBuffer[1]>DI_6_minusBuffer[1]) || (DI_6_plusBuffer[2]<ADX_4_Buffer[2]  && DI_6_plusBuffer[1]>ADX_4_Buffer[1]) || ((MathAbs(DI_6_plusBuffer[1]-DI_6_minusBuffer[1])>22)  && DI_6_plusBuffer[1]>ADX_4_Buffer[1]) || ((MathAbs(DI_6_plusBuffer[1]-DI_6_minusBuffer[1])>23)  && ADX_4_Buffer[1]>DI_6_plusBuffer[1]   && DI_6_plusBuffer[1]>DI_6_minusBuffer[1] && ADX_4_Buffer[1]>DI_6_minusBuffer[1]  && ADX_4_Buffer[1]>26))
     )

     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos CRUCE DI ADX 2",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"C_D_ADX 2", Text_VelasOpuestas, COLORVO);
         CumOffset = CumOffset+IncOffset;
         ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         AlertSell=true;
        }
      Sell_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Sell_Tiempo_Confirmacion,shift,rates_total,"C_D_ADX 2",false,TiempoConfirmacionSell3,AlertSell,CumOffset);

   if(Buy_Tiempo_ADX2>time[shift] && Buy_Tiempo_ADX2!=0 && KlingerBuffer[2]<Bollinger_Klinger_Buffer_BASE[2] && KlingerBuffer[3]>Bollinger_Klinger_Buffer_BASE[3]
      && AwesomeOscilator_Buffer[1]<AwesomeOscilator_Buffer[2] && AwesomeOscilator_Buffer[0]<AwesomeOscilator_Buffer[1] && KlingerBuffer[0]<KlingerBuffer[1]
      && ((DI_6_plusBuffer[2]>DI_6_minusBuffer[2]  && DI_6_plusBuffer[1]<DI_6_minusBuffer[1])  || (DI_6_minusBuffer[2]>ADX_4_Buffer[2]  && DI_6_minusBuffer[1]<ADX_4_Buffer[1])
          || ((MathAbs(DI_6_plusBuffer[1]-DI_6_minusBuffer[1])>22)  && DI_6_minusBuffer[1]>ADX_4_Buffer[1])  || ((MathAbs(DI_6_plusBuffer[1]-DI_6_minusBuffer[1])>23)  && ADX_4_Buffer[1]>DI_6_plusBuffer[1]
                && DI_6_plusBuffer[1]<DI_6_minusBuffer[1] && ADX_4_Buffer[1]>DI_6_minusBuffer[1]  && ADX_4_Buffer[1]>26))
     )
     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos CRUCE DI ADX 2",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "C_D_ADX 2", Text_VelasOpuestas, COLORVO);
         CumOffset = CumOffset+IncOffset;
         ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         AlertBuy=true;
        }
      Buy_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Buy_Tiempo_Confirmacion,shift,rates_total,"C_D_ADX 2",true,TiempoConfirmacionBuy3,AlertBuy,CumOffset);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Patron_4(datetime const &time[],int shift,int &CumOffset,double const &low[], double const &high[],bool &AlertBuy,bool &AlertSell,int const rates_total)
  {
   if(((DI_plusBuffer_K[2]>DI_minusBuffer_K[2]  && DI_plusBuffer_K[1]<DI_minusBuffer_K[1]) || (DI_minusBuffer_K[2]>ADX_K_Buffer[2]
         && DI_minusBuffer_K[1]<ADX_K_Buffer[1])      || ((MathAbs(DI_plusBuffer_K[1]-DI_minusBuffer_K[1])>22)  && DI_minusBuffer_K[1]>ADX_K_Buffer[1]
               && ADX_K_Buffer[1]>23)  || ((MathAbs(DI_plusBuffer_K[1]-DI_minusBuffer_K[1])>23)  && ADX_K_Buffer[1]>DI_plusBuffer_K[1]
                                           && DI_plusBuffer_K[1]<DI_minusBuffer_K[1] && ADX_K_Buffer[1]>DI_minusBuffer_K[1]  && ADX_K_Buffer[1]>26))
      &&   Rates[1].low<Rates[2].low  &&   Rates[1].low<Rates[3].low   && ((Bollinger_1_Buffer_UP[1])-(Bollinger_1_Buffer_DN[1]))<((Bollinger_1_Buffer_UP[2])-(Bollinger_1_Buffer_DN[2]))
      && ((Bollinger_1_Buffer_UP[2])-(Bollinger_1_Buffer_DN[2]))<((Bollinger_1_Buffer_UP[3])-(Bollinger_1_Buffer_DN[3]))  && ((Bollinger_1_Buffer_UP[3])-(Bollinger_1_Buffer_DN[3]))<((Bollinger_1_Buffer_UP[4])-(Bollinger_1_Buffer_DN[4]))
      &&  KlingerBuffer[1]<Bollinger_Klinger_Buffer_DN[1] && KlingerBuffer[0]<Bollinger_Klinger_Buffer_DN[0] && (CCIBuffer_K[2]>Bollinger_CCI_Buffer_DN_K[2] && CCIBuffer_K[0]<Bollinger_CCI_Buffer_DN_K[0])
      && Rates[2].close>Bollinger_1_Buffer_DN[2]  && Rates[1].close>Bollinger_1_Buffer_DN[1])
     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos CRUCE Romp.",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "C_D_Romp", Text_VelasOpuestas, COLORVO);
         ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         AlertBuy=true;
        }
      Buy_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Buy_Tiempo_Confirmacion,shift,rates_total,"C_D_Romp",true,TiempoConfirmacionBuy4,AlertBuy,CumOffset);

   if(((DI_plusBuffer_K[2]<DI_minusBuffer[2]  && DI_plusBuffer_K[1]>DI_minusBuffer[1])  || (DI_plusBuffer_K[2]<ADX_K_Buffer[2]
         && DI_plusBuffer_K[1]>ADX_K_Buffer[1]) || ((MathAbs(DI_plusBuffer_K[1]-DI_minusBuffer[1])>22)  && DI_plusBuffer_K[1]>ADX_K_Buffer[1]
               && ADX_K_Buffer[1]>23) || ((MathAbs(DI_plusBuffer_K[1]-DI_minusBuffer[1])>23)  && ADX_K_Buffer[1]>DI_plusBuffer_K[1]
                                          && DI_plusBuffer_K[1]>DI_minusBuffer[1] && ADX_K_Buffer[1]>DI_minusBuffer[1]  && ADX_K_Buffer[1]>26))
      &&   Rates[1].high>Rates[2].high  && Rates[1].high>Rates[3].high && ((Bollinger_1_Buffer_UP[1])-(Bollinger_1_Buffer_DN[1]))<((Bollinger_1_Buffer_UP[2])-(Bollinger_1_Buffer_DN[2]))
      && ((Bollinger_1_Buffer_UP[2])-(Bollinger_1_Buffer_DN[2]))<((Bollinger_1_Buffer_UP[3])-(Bollinger_1_Buffer_DN[3]))  && ((Bollinger_1_Buffer_UP[3])-(Bollinger_1_Buffer_DN[3]))<((Bollinger_1_Buffer_UP[4])-(Bollinger_1_Buffer_DN[4]))
      &&   KlingerBuffer[1]>Bollinger_Klinger_Buffer_UP[1] && KlingerBuffer[0]>Bollinger_Klinger_Buffer_UP[0] && (CCIBuffer_K[2]<Bollinger_CCI_Buffer_UP_K[2] && CCIBuffer_K[0]>Bollinger_CCI_Buffer_UP_K[0])
      && Rates[2].close<Bollinger_1_Buffer_UP[2]  && Rates[1].close<Bollinger_1_Buffer_UP[1])

     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos CRUCE Romp.",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"C_D_Romp.   ", Text_VelasOpuestas, COLORVO);
         ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         AlertSell=true;
        }
      Sell_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Sell_Tiempo_Confirmacion,shift,rates_total,"C_D_Romp",false,TiempoConfirmacionSell4,AlertSell,CumOffset);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Patron_5(datetime const &time[],int shift,int &CumOffset,double const &low[], double const &high[],bool &AlertBuy,bool &AlertSell,int const rates_total)
  {
   if(Rates[2].open<Bollinger_1_Buffer_UP[2] && Rates[2].close>Bollinger_1_Buffer_UP[2] && Rates[2].close>Bollinger_2_2_Buffer_UP[2]
      && Rates[1].open>Bollinger_1_Buffer_UP[1] && (Bollinger_2_2_Buffer_UP[0]-Bollinger_2_2_Buffer_DN[0]<=DistanciaBollinger2 || (
               Bollinger_2_2_Buffer_BASE[3]>Bollinger_2_2_Buffer_BASE[2] && Bollinger_2_2_Buffer_BASE[2]>Bollinger_2_2_Buffer_BASE[1] &&
               Bollinger_2_2_Buffer_DN[3]>Bollinger_2_2_Buffer_DN[2] && Bollinger_2_2_Buffer_DN[2]>Bollinger_2_2_Buffer_DN[1]))
      && Rates[1].close>Rates[1].open && KlingerBuffer[0]>0 && KlingerBuffer[1]>0 && KlingerBuffer[2]>0 && KlingerBuffer[3]>0 && KlingerBuffer[0]>KlingerBuffer[1] && KlingerBuffer[1]>KlingerBuffer[2] && KlingerBuffer[2]>KlingerBuffer[3] &&  CCIBuffer[0]>CCIBuffer[1] && CCIBuffer[1]>CCIBuffer[2]   &&  CCIBuffer[0]>190
      &&  DI_Y_plusBuffer[0]>20 && DI_X_plusBuffer[0]>22 && DI_W_plusBuffer[0]>25 && DI_V_plusBuffer[0]>25
      && ((DI_Z_plusBuffer[2]<DI_Z_minusBuffer[2]  && DI_Z_plusBuffer[1]>DI_Z_minusBuffer[1])   || (DI_Z_plusBuffer[2]<ADX_Z_Buffer[2]  && DI_Z_plusBuffer[1]>ADX_Z_Buffer[1]) || ((MathAbs(DI_Z_plusBuffer[1]-DI_Z_minusBuffer[1])>22)  && DI_Z_plusBuffer[1]>ADX_Z_Buffer[1]) || ((MathAbs(DI_Z_plusBuffer[1]-DI_Z_minusBuffer[1])>23)  && ADX_Z_Buffer[1]>DI_Z_plusBuffer[1]   && DI_Z_plusBuffer[1]>DI_Z_minusBuffer[1] && ADX_Z_Buffer[1]>DI_Z_minusBuffer[1]  && ((ADX_Z_Buffer[1]>26) || (DI_Z_plusBuffer[1]>DI_Z_plusBuffer[2]  && DI_Z_plusBuffer[2]>DI_Z_plusBuffer[3] && DI_Z_plusBuffer[0]>DI_Z_plusBuffer[1] && ADX_Z_Buffer[1]>ADX_Z_Buffer[0] && ADX_Z_Buffer[2]>ADX_Z_Buffer[1] && DI_Z_plusBuffer[1]>25  && DI_Z_plusBuffer[0]>25))))

     )


     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos adx 11 4",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"adx 11 4   ", Text_VelasOpuestas, COLORVO);
         ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         AlertSell=true;
        }
      Sell_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Sell_Tiempo_Confirmacion,shift,rates_total,"adx 11 4",false,TiempoConfirmacionSell5,AlertSell,CumOffset);



   if(Rates[2].open>Bollinger_1_Buffer_DN[2] && Rates[2].close<Bollinger_1_Buffer_DN[2] && Rates[2].close<Bollinger_2_2_Buffer_DN[2]
      && Rates[1].open<Bollinger_1_Buffer_DN[1] && (Bollinger_2_2_Buffer_UP[0]-Bollinger_2_2_Buffer_DN[0]<=DistanciaBollinger2 || (
               Bollinger_2_2_Buffer_BASE[3]<Bollinger_2_2_Buffer_BASE[2] && Bollinger_2_2_Buffer_BASE[2]<Bollinger_2_2_Buffer_BASE[1] &&
               Bollinger_2_2_Buffer_UP[3]<Bollinger_2_2_Buffer_UP[2] && Bollinger_2_2_Buffer_UP[2]<Bollinger_2_2_Buffer_UP[1]))
      &&  Rates[1].close<Rates[1].open && KlingerBuffer[0]<0 && KlingerBuffer[1]<0 && KlingerBuffer[2]<0 && KlingerBuffer[3]<0 && KlingerBuffer[0]<KlingerBuffer[1] && KlingerBuffer[1]<KlingerBuffer[2] && KlingerBuffer[2]<KlingerBuffer[3] && CCIBuffer[0]<CCIBuffer[1] && CCIBuffer[1]<CCIBuffer[2] && CCIBuffer[0]<-190
      && DI_Y_minusBuffer[0]>20 && DI_X_minusBuffer[0]>22 && DI_W_minusBuffer[0]>25 && DI_V_minusBuffer[0]>25
      && ((DI_Z_plusBuffer[2]>DI_Z_minusBuffer[2]  && DI_Z_plusBuffer[1]<DI_Z_minusBuffer[1])  || (DI_Z_minusBuffer[2]>ADX_Z_Buffer[2]  && DI_Z_minusBuffer[1]<ADX_Z_Buffer[1])      || ((MathAbs(DI_Z_plusBuffer[1]-DI_Z_minusBuffer[1])>22)  && DI_Z_minusBuffer[1]>ADX_Z_Buffer[1])  || ((MathAbs(DI_Z_plusBuffer[1]-DI_Z_minusBuffer[1])>23)  && ADX_Z_Buffer[1]>DI_Z_plusBuffer[1]   && DI_Z_plusBuffer[1]<DI_Z_minusBuffer[1] && ADX_Z_Buffer[1]>DI_Z_minusBuffer[1]  && ((ADX_Z_Buffer[1]>26) || (DI_Z_minusBuffer[1]>DI_Z_minusBuffer[2]  && DI_Z_minusBuffer[2]>DI_Z_minusBuffer[3] && DI_Z_minusBuffer[0]>DI_Z_minusBuffer[1] && ADX_Z_Buffer[1]>ADX_Z_Buffer[0] && ADX_Z_Buffer[2]>ADX_Z_Buffer[1] && DI_Z_minusBuffer[1]>25  && DI_Z_minusBuffer[0]>25))))


     )

     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos adx 11 4",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "adx 11 4", Text_VelasOpuestas, COLORVO);
         ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         AlertBuy=true;
        }
      Buy_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Buy_Tiempo_Confirmacion,shift,rates_total,"adx 11 4",true,TiempoConfirmacionBuy5,AlertBuy,CumOffset);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Patron_6(datetime const &time[],int shift,int &CumOffset,double const &low[], double const &high[],bool &AlertBuy,bool &AlertSell,int const rates_total)
  {
   if(KlingerBuffer[1]<Bollinger_Klinger_Buffer_BASE[1] && ForceIndexBuffer[1]<Bollinger_ForceIndex_Buffer_DN[1]  && Rates[1].close<Bollinger_1_Buffer_DN[1] &&
      ADX_Buffer[0]>Bollinger_ADX_2_Buffer_UP[0] && Bollinger_ADX_2_Buffer_UP[0]<=Bollinger_ADX_2_Buffer_UP[1] && Bollinger_ADX_2_Buffer_UP[1]<Bollinger_ADX_2_Buffer_UP[2] && Bollinger_ADX_2_Buffer_UP[2]<Bollinger_ADX_2_Buffer_UP[3] && KlingerBuffer[0]<KlingerBuffer[1] && KlingerBuffer[1]<KlingerBuffer[2] && KlingerBuffer[2]<KlingerBuffer[3]
      && ((DI_plusBuffer[2]>DI_minusBuffer[2]  && DI_plusBuffer[1]<DI_minusBuffer[1])  || (DI_minusBuffer[2]>ADX_2_Buffer[2]  && DI_minusBuffer[1]<ADX_2_Buffer[1])      || ((MathAbs(DI_plusBuffer[1]-DI_minusBuffer[1])>22)  && DI_minusBuffer[1]>ADX_2_Buffer[1])  || ((MathAbs(DI_plusBuffer[1]-DI_minusBuffer[1])>23)  && ADX_2_Buffer[1]>DI_plusBuffer[1]   && DI_plusBuffer[1]<DI_minusBuffer[1] && ADX_2_Buffer[1]>DI_minusBuffer[1]  && ADX_2_Buffer[1]>26)))



     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos adx 11 4",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"adx 11 4   ", Text_VelasOpuestas, COLORVO);
         ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         AlertSell=true;
        }
      Sell_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Sell_Tiempo_Confirmacion,shift,rates_total,"adx 11 4",false,TiempoConfirmacionSell6,AlertSell,CumOffset);



   if(KlingerBuffer[1]>Bollinger_Klinger_Buffer_BASE[1] && ForceIndexBuffer[1]>Bollinger_ForceIndex_Buffer_UP[1] && Rates[1].close>Bollinger_1_Buffer_UP[1]  &&
      ADX_Buffer[0]>Bollinger_ADX_2_Buffer_UP[0] && Bollinger_ADX_2_Buffer_UP[0]<=Bollinger_ADX_2_Buffer_UP[1] && Bollinger_ADX_2_Buffer_UP[1]<Bollinger_ADX_2_Buffer_UP[2] && Bollinger_ADX_2_Buffer_UP[2]<Bollinger_ADX_2_Buffer_UP[3] && KlingerBuffer[0]>KlingerBuffer[1] && KlingerBuffer[1]>KlingerBuffer[2] && KlingerBuffer[2]>KlingerBuffer[3]
      && ((DI_plusBuffer[2]<DI_minusBuffer[2]  && DI_plusBuffer[1]>DI_minusBuffer[1])   || (DI_plusBuffer[2]<ADX_2_Buffer[2]  && DI_plusBuffer[1]>ADX_2_Buffer[1]) || ((MathAbs(DI_plusBuffer[1]-DI_minusBuffer[1])>22)  && DI_plusBuffer[1]>ADX_2_Buffer[1]) || ((MathAbs(DI_plusBuffer[1]-DI_minusBuffer[1])>23)  && ADX_2_Buffer[1]>DI_plusBuffer[1]   && DI_plusBuffer[1]>DI_minusBuffer[1] && ADX_2_Buffer[1]>DI_minusBuffer[1]  && ADX_2_Buffer[1]>26))
     )

     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos adx 11 4",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "adx 11 4", Text_VelasOpuestas, COLORVO);
         ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         AlertBuy=true;
        }
      Buy_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }
   Evalua_Confirmacion(Buy_Tiempo_Confirmacion,shift,rates_total,"adx 11 4",true,TiempoConfirmacionBuy6,AlertBuy,CumOffset);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Patron_7(datetime const &time[],int shift,int &CumOffset,double const &low[], double const &high[],bool &AlertBuy,bool &AlertSell,int const rates_total)
  {
   if(Rates[1].close>Bollinger_1_Buffer_UP[1]  &&
      ADX_3_Buffer[0]>Bollinger_ADX_Buffer_UP_2[0] && Bollinger_ADX_Buffer_UP_2[0]<=Bollinger_ADX_Buffer_UP_2[1] &&
      Bollinger_ADX_Buffer_UP_2[1]<Bollinger_ADX_Buffer_UP_2[2] && Bollinger_ADX_Buffer_UP_2[2]<Bollinger_ADX_Buffer_UP_2[3] &&
      KlingerBuffer[0]>KlingerBuffer[1] && KlingerBuffer[1]>KlingerBuffer[2] && KlingerBuffer[2]>KlingerBuffer[3])

     {
      Buy_Tiempo_ADX3_Inv=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasKlinger2;
     }



   if(Rates[1].close<Bollinger_1_Buffer_DN[1] &&
      ADX_3_Buffer[0]>Bollinger_ADX_Buffer_UP_2[0] && Bollinger_ADX_Buffer_UP_2[0]<=Bollinger_ADX_Buffer_UP_2[1]
      && Bollinger_ADX_Buffer_UP_2[1]<Bollinger_ADX_Buffer_UP_2[2] && Bollinger_ADX_Buffer_UP_2[2]<Bollinger_ADX_Buffer_UP_2[3]
      && KlingerBuffer[0]<KlingerBuffer[1] && KlingerBuffer[1]<KlingerBuffer[2] && KlingerBuffer[2]<KlingerBuffer[3])

     {
      Sell_Tiempo_ADX3_Inv=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasKlinger2;
     }


   if(Sell_Tiempo_ADX3_Inv>time[shift] && Sell_Tiempo_ADX3_Inv!=0 && KlingerBuffer[2]>Bollinger_Klinger_Buffer_BASE[2] && KlingerBuffer[3]<Bollinger_Klinger_Buffer_BASE[3]
      && KlingerBuffer[0]>KlingerBuffer[1]
      && ((DI_6_plusBuffer[2]<DI_6_minusBuffer[2]  && DI_6_plusBuffer[1]>DI_6_minusBuffer[1])   || (DI_6_plusBuffer[2]<ADX_4_Buffer[2]  && DI_6_plusBuffer[1]>ADX_4_Buffer[1])
          || ((MathAbs(DI_6_plusBuffer[1]-DI_6_minusBuffer[1])>22)  && DI_6_plusBuffer[1]>ADX_4_Buffer[1]) || ((MathAbs(DI_6_plusBuffer[1]-DI_6_minusBuffer[1])>23)
                && ADX_4_Buffer[1]>DI_6_plusBuffer[1]   && DI_6_plusBuffer[1]>DI_6_minusBuffer[1] && ADX_4_Buffer[1]>DI_6_minusBuffer[1]  && ADX_4_Buffer[1]>26)))

     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos CRUCE ADX3 Inv",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"C_ADX3 Inv", Text_VelasOpuestas, COLORVO);
         CumOffset = CumOffset+IncOffset;
         ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         AlertSell=true;
        }
      Sell_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Sell_Tiempo_Confirmacion,shift,rates_total,"C_ADX3-Inv",false,TiempoConfirmacionSell7,AlertSell,CumOffset);


   if(Buy_Tiempo_ADX3_Inv>time[shift] && Buy_Tiempo_ADX3_Inv!=0 && KlingerBuffer[2]<Bollinger_Klinger_Buffer_BASE[2] && KlingerBuffer[3]>Bollinger_Klinger_Buffer_BASE[3]
      &&  KlingerBuffer[0]<KlingerBuffer[1]
      && ((DI_6_plusBuffer[2]>DI_6_minusBuffer[2]  && DI_6_plusBuffer[1]<DI_6_minusBuffer[1])  || (DI_6_minusBuffer[2]>ADX_4_Buffer[2]  && DI_6_minusBuffer[1]<ADX_4_Buffer[1])
          || ((MathAbs(DI_6_plusBuffer[1]-DI_6_minusBuffer[1])>22)  && DI_6_minusBuffer[1]>ADX_4_Buffer[1])  || ((MathAbs(DI_6_plusBuffer[1]-DI_6_minusBuffer[1])>23)  && ADX_4_Buffer[1]>DI_6_plusBuffer[1]   && DI_6_plusBuffer[1]<DI_6_minusBuffer[1] && ADX_4_Buffer[1]>DI_6_minusBuffer[1]  && ADX_4_Buffer[1]>26))

     )

     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos CRUCE ADX3 Inv",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "C_ADX3-Inv", Text_VelasOpuestas, COLORVO);
         CumOffset = CumOffset+IncOffset;
         ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         AlertBuy=true;
        }
      Buy_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Buy_Tiempo_Confirmacion,shift,rates_total,"C_ADX3-Inv",true,TiempoConfirmacionBuy7,AlertBuy,CumOffset);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Patron_8(datetime const &time[],int shift,int &CumOffset,double const &low[], double const &high[],bool &AlertBuy,bool &AlertSell,int const rates_total)
  {
   if(DI_4_minusBuffer_Dif[0]>20 && DI_3_minusBuffer_Dif[0]>22 && DI_2_minusBuffer_Dif[0]>25 && DI_minusBuffer_Dif[0]>25 && KlingerBuffer[1]>EMA_Buffer_klinger[1] && KlingerBuffer[0]<EMA_Buffer_klinger[0] && KlingerBuffer[1]>SMA_Buffer_klinger[1] && KlingerBuffer[0]<SMA_Buffer_klinger[0])

     {
      bool AlertaCondicion1=true;
      for(int j=1; j<36; j++)
        {
         if((DI_4_minusBuffer_Dif[j]>20 && DI_3_minusBuffer_Dif[j]>22 && DI_2_minusBuffer_Dif[j]>25 && DI_minusBuffer_Dif[j]>27) && (DI_4_minusBuffer_Dif[j+1]>20 && DI_3_minusBuffer_Dif[j+1]>22 && DI_2_minusBuffer_Dif[j+1]>25 && DI_minusBuffer_Dif[j+1]>27)  && (DI_4_minusBuffer_Dif[j+2]>20 && DI_3_minusBuffer_Dif[j+2]>22 && DI_2_minusBuffer_Dif[j+2]>25 && DI_minusBuffer_Dif[j+2]>27)         && (DI_4_minusBuffer_Dif[j+3]>20 && DI_3_minusBuffer_Dif[j+3]>22 && DI_2_minusBuffer_Dif[j+3]>25 && DI_minusBuffer_Dif[j+3]>27))
           {
            AlertaCondicion1=false;
            break;

           }
        }


      if(AlertaCondicion1)
        {
         if(Tiempo_Dif_Buy<time[shift] || Tiempo_Dif_Buy==0)
           {
            if(Solo_Confirmacion==false)
              {
               MarkPattern(GetName("Patron Conjuntos CRUCE ADX Diferentes G K Pas",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "C ADX Dif", Text_VelasOpuestas, COLORVO);
               CumOffset = CumOffset+IncOffset;
               ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
               AlertBuy=true;
              }
            Buy_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
            Tiempo_Dif_Buy=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasDif;
           }
        }
     }
   Evalua_Confirmacion(Buy_Tiempo_Confirmacion,shift,rates_total,"C ADX Dif",true,TiempoConfirmacionBuy8,AlertBuy,CumOffset);

   if(DI_4_plusBuffer_Dif[0]>20 && DI_3_plusBuffer_Dif[0]>22 && DI_2_plusBuffer_Dif[0]>25 && DI_plusBuffer_Dif[0]>25 && KlingerBuffer[1]<EMA_Buffer_klinger[1] && KlingerBuffer[0]>EMA_Buffer_klinger[0] && KlingerBuffer[1]<SMA_Buffer_klinger[1] && KlingerBuffer[0]>SMA_Buffer_klinger[0])
     {
      bool AlertaCondicion1=true;
      for(int j=1; j<36; j++)
        {
         if((DI_4_plusBuffer_Dif[j]>20 && DI_3_plusBuffer_Dif[j]>22 && DI_2_plusBuffer_Dif[j]>25 && DI_plusBuffer_Dif[j]>25) && (DI_4_plusBuffer_Dif[j+1]>20 && DI_3_plusBuffer_Dif[j+1]>22 && DI_2_plusBuffer_Dif[j+1]>25 && DI_plusBuffer_Dif[j+1]>25)    && (DI_4_plusBuffer_Dif[j+2]>20 && DI_3_plusBuffer_Dif[j+2]>22 && DI_2_plusBuffer_Dif[j+2]>25 && DI_plusBuffer_Dif[j+2]>25)               && (DI_4_plusBuffer_Dif[j+3]>20 && DI_3_plusBuffer_Dif[j+3]>22 && DI_2_plusBuffer_Dif[j+3]>25 && DI_plusBuffer_Dif[j+3]>25))
           {
            AlertaCondicion1=false;
            break;

           }
        }

      if(AlertaCondicion1)
        {
         if(Tiempo_Dif_Sell<time[shift] || Tiempo_Dif_Sell==0)
           {
            if(Solo_Confirmacion==false)
              {
               MarkPattern(GetName("Patron Conjuntos CRUCE ADX Diferentes G K Pas",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"C ADX Dif", Text_VelasOpuestas, COLORVO);
               CumOffset = CumOffset+IncOffset;
               ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
               AlertSell=true;
              }
            Sell_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
            Tiempo_Dif_Sell=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasDif;
           }
        }
     }
   Evalua_Confirmacion(Sell_Tiempo_Confirmacion,shift,rates_total,"C ADX Dif",false,TiempoConfirmacionSell8,AlertSell,CumOffset);
  }

////  9    CCI ROMP O VELAS CCI ROMP O VELAS  CCI ROMP O VELAS  CCI ROMP O VELAS  CCI ROMP O VELAS  CCI ROMP O VELAS  CCI ROMP O VELAS  CCI ROMP O VELAS  CCI ROMP O VELAS  CCI ROMP O VELAS  CCI ROMP O VELAS  CCI ROMP O VELAS  CCI ROMP O VELAS  CCI ROMP O VELAS  CCI ROMP O VELAS  CCI ROMP O VELAS  CCI ROMP O VELAS  CCI ROMP O VELAS
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Patron_9(datetime const &time[],int shift,int &CumOffset,double const &low[], double const &high[],bool &AlertBuy,bool &AlertSell,int const rates_total)
  {
   if(((CCIBuffer_K[2]>Bollinger_CCI_Buffer_DN_K[2] || CCIBuffer_K[3]>Bollinger_CCI_Buffer_DN_K[3]) && CCIBuffer_K[1]<Bollinger_CCI_Buffer_DN_K[1])
      && (MathAbs(Rates[1].close-Rates[1].open))>((MathAbs(Rates[2].low-Rates[2].high))+(MathAbs(Rates[3].low-Rates[3].high)))
      && (Rates[1].close<Rates[2].low && Rates[1].close<Rates[3].low && Rates[1].close<Rates[4].low)
      && (((MathAbs(Bollinger_1_Buffer_UP[1]-Bollinger_1_Buffer_DN[1]))>(MathAbs(Bollinger_1_Buffer_UP[2]-Bollinger_1_Buffer_DN[2]))
           && (MathAbs(Bollinger_1_Buffer_UP[2]-Bollinger_1_Buffer_DN[2]))>(MathAbs(Bollinger_1_Buffer_UP[3]-Bollinger_1_Buffer_DN[3]))
           && (MathAbs(Bollinger_1_Buffer_UP[3]-Bollinger_1_Buffer_DN[3]))>(MathAbs(Bollinger_1_Buffer_UP[4]-Bollinger_1_Buffer_DN[4]))
           && (MathAbs(Bollinger_1_Buffer_UP[4]-Bollinger_1_Buffer_DN[4]))>(MathAbs(Bollinger_1_Buffer_UP[5]-Bollinger_1_Buffer_DN[5])))
          || ((MathAbs(Bollinger_1_Buffer_UP[1]-Bollinger_1_Buffer_DN[1]))<(MathAbs(Bollinger_1_Buffer_UP[2]-Bollinger_1_Buffer_DN[2]))
              && (MathAbs(Bollinger_1_Buffer_UP[2]-Bollinger_1_Buffer_DN[2]))<(MathAbs(Bollinger_1_Buffer_UP[3]-Bollinger_1_Buffer_DN[3]))
              && (MathAbs(Bollinger_1_Buffer_UP[3]-Bollinger_1_Buffer_DN[3]))<(MathAbs(Bollinger_1_Buffer_UP[4]-Bollinger_1_Buffer_DN[4]))
              && (MathAbs(Bollinger_1_Buffer_UP[4]-Bollinger_1_Buffer_DN[4]))<(MathAbs(Bollinger_1_Buffer_UP[5]-Bollinger_1_Buffer_DN[5]))))
      && Rates[2].close>Bollinger_1_Buffer_DN[2]  && Rates[1].close>Bollinger_1_Buffer_DN[1]

     )
     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos CCI ROMP VELAS",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "CCI Romp V", Text_VelasOpuestas, COLORVO);
         ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         AlertBuy=true;
        }
      Buy_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }
   Evalua_Confirmacion(Buy_Tiempo_Confirmacion,shift,rates_total,"CCI Romp V",true,TiempoConfirmacionBuy9,AlertBuy,CumOffset);

   if(((CCIBuffer_K[3]<Bollinger_CCI_Buffer_UP_K[3] || CCIBuffer_K[2]<Bollinger_CCI_Buffer_UP_K[2]) && CCIBuffer_K[1]>Bollinger_CCI_Buffer_UP_K[1])
      && (MathAbs(Rates[1].close-Rates[1].open))>((MathAbs(Rates[2].low-Rates[2].high))+(MathAbs(Rates[3].low-Rates[3].high)))
      && (Rates[1].close>Rates[2].high && Rates[1].close>Rates[3].high && Rates[1].close>Rates[4].high)
      && (((MathAbs(Bollinger_1_Buffer_UP[1]-Bollinger_1_Buffer_DN[1]))>(MathAbs(Bollinger_1_Buffer_UP[2]-Bollinger_1_Buffer_DN[2]))
           && (MathAbs(Bollinger_1_Buffer_UP[2]-Bollinger_1_Buffer_DN[2]))>(MathAbs(Bollinger_1_Buffer_UP[3]-Bollinger_1_Buffer_DN[3]))
           && (MathAbs(Bollinger_1_Buffer_UP[3]-Bollinger_1_Buffer_DN[3]))>(MathAbs(Bollinger_1_Buffer_UP[4]-Bollinger_1_Buffer_DN[4]))
           && (MathAbs(Bollinger_1_Buffer_UP[4]-Bollinger_1_Buffer_DN[4]))>(MathAbs(Bollinger_1_Buffer_UP[5]-Bollinger_1_Buffer_DN[5])))
          || ((MathAbs(Bollinger_1_Buffer_UP[1]-Bollinger_1_Buffer_DN[1]))<(MathAbs(Bollinger_1_Buffer_UP[2]-Bollinger_1_Buffer_DN[2]))
              && (MathAbs(Bollinger_1_Buffer_UP[2]-Bollinger_1_Buffer_DN[2]))<(MathAbs(Bollinger_1_Buffer_UP[3]-Bollinger_1_Buffer_DN[3]))
              && (MathAbs(Bollinger_1_Buffer_UP[3]-Bollinger_1_Buffer_DN[3]))<(MathAbs(Bollinger_1_Buffer_UP[4]-Bollinger_1_Buffer_DN[4]))
              && (MathAbs(Bollinger_1_Buffer_UP[4]-Bollinger_1_Buffer_DN[4]))<(MathAbs(Bollinger_1_Buffer_UP[5]-Bollinger_1_Buffer_DN[5]))))
      && Rates[2].close<Bollinger_1_Buffer_UP[2]  && Rates[1].close<Bollinger_1_Buffer_UP[1]


     )





     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos CCI ROMP VELAS",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"CCI Romp V", Text_VelasOpuestas, COLORVO);
         ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         AlertSell=true;
        }
      Sell_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Sell_Tiempo_Confirmacion,shift,rates_total,"CCI Romp V",false,TiempoConfirmacionSell9,AlertSell,CumOffset);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Patron_10(datetime const &time[],int shift,int &CumOffset,double const &low[], double const &high[],bool &AlertBuy,bool &AlertSell,int const rates_total)
  {
   if(Rates[1].close>Bollinger_1_Buffer_UP[1] &&KlingerBuffer[1]>Bollinger_Klinger_Buffer_UP[1] && KlingerBuffer[1]>KlingerBuffer[2] && KlingerBuffer[2]>KlingerBuffer[3])
     {
      bool AlertaCondicion1=true;
      for(int j=1; j<36; j++)
        {
         if(EstocasticoBuffer[j+1]<Bollinger_Estocastico_Buffer_BASE[j+1] && EstocasticoBuffer[j]>Bollinger_Estocastico_Buffer_BASE[j])
           {
            AlertaCondicion1=false;
            break;
           }
        }
      bool AlertaCondicion2=false;
      for(int j=3; j<40; j++)
        {
         if(ADX_Simple4_Buffer[j]>Bollinger_ADX_2_Buffer_UP[j] && ADX_Simple4_Buffer[j+1]>Bollinger_ADX_2_Buffer_UP[j+1] && ADX_Simple4_Buffer[j+2]>Bollinger_ADX_2_Buffer_UP[j+2])
           {AlertaCondicion2=true; break;}
        }


      if(AlertaCondicion1 && AlertaCondicion2)
         Sell_Tiempo_Simple4=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasSar;

     }

   if(Rates[1].close<Bollinger_1_Buffer_DN[1] &&  KlingerBuffer[1]<Bollinger_Klinger_Buffer_DN[1] && KlingerBuffer[1]<KlingerBuffer[2] && KlingerBuffer[2]<KlingerBuffer[3])
     {
      bool AlertaCondicion1=true;
      for(int j=1; j<36; j++)
        {
         if(EstocasticoBuffer[j+1]>Bollinger_Estocastico_Buffer_BASE[j+1] && EstocasticoBuffer[j]<Bollinger_Estocastico_Buffer_BASE[j])
           {
            AlertaCondicion1=false;
            break;
           }
        }
      bool AlertaCondicion2=false;
      for(int j=3; j<40; j++)
        {
         if(ADX_Simple4_Buffer[j]>Bollinger_ADX_2_Buffer_UP[j] && ADX_Simple4_Buffer[j+1]>Bollinger_ADX_2_Buffer_UP[j+1] && ADX_Simple4_Buffer[j+2]>Bollinger_ADX_2_Buffer_UP[j+2])
           {AlertaCondicion2=true; break;}
        }

      if(AlertaCondicion1 && AlertaCondicion2)
         Buy_Tiempo_Simple4=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasSar;

     }

   if(Sell_Tiempo_Simple4>time[shift] && Sell_Tiempo_Simple4!=0 && SARBuffer[2]>=Rates[2].high && SARBuffer[1]<=Rates[1].low
      && ((DI_plusBuffer[2]<DI_minusBuffer[2]  && DI_plusBuffer[1]>DI_minusBuffer[1])   || (DI_plusBuffer[2]<ADX_2_Buffer[2]  && DI_plusBuffer[1]>ADX_2_Buffer[1]) || ((MathAbs(DI_plusBuffer[1]-DI_minusBuffer[1])>22)  && DI_plusBuffer[1]>ADX_2_Buffer[1]) || ((MathAbs(DI_plusBuffer[1]-DI_minusBuffer[1])>23)  && ADX_2_Buffer[1]>DI_plusBuffer[1]   && DI_plusBuffer[1]>DI_minusBuffer[1] && ADX_2_Buffer[1]>DI_minusBuffer[1]  && ADX_2_Buffer[1]>26))

     )

     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos CRUCE Simple4",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"C Simple 4", Text_VelasOpuestas, COLORVO);
         CumOffset = CumOffset+IncOffset;
         ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         AlertSell=true;
        }
      Sell_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Sell_Tiempo_Confirmacion,shift,rates_total,"C Simple 4",false,TiempoConfirmacionSell10,AlertSell,CumOffset);

   if(Buy_Tiempo_Simple4>time[shift] && Buy_Tiempo_Simple4!=0 && SARBuffer[1]>=Rates[1].high && SARBuffer[2]<=Rates[2].low
      && ((DI_plusBuffer[2]>DI_minusBuffer[2]  && DI_plusBuffer[1]<DI_minusBuffer[1])  || (DI_minusBuffer[2]>ADX_2_Buffer[2]  && DI_minusBuffer[1]<ADX_2_Buffer[1])      || ((MathAbs(DI_plusBuffer[1]-DI_minusBuffer[1])>22)  && DI_minusBuffer[1]>ADX_2_Buffer[1])  || ((MathAbs(DI_plusBuffer[1]-DI_minusBuffer[1])>23)  && ADX_2_Buffer[1]>DI_plusBuffer[1]   && DI_plusBuffer[1]<DI_minusBuffer[1] && ADX_2_Buffer[1]>DI_minusBuffer[1]  && ADX_2_Buffer[1]>26))

     )

     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos CRUCE Simple4",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "C Simple 4", Text_VelasOpuestas, COLORVO);
         CumOffset = CumOffset+IncOffset;
         ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         AlertBuy=true;
        }
      Buy_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }
   Evalua_Confirmacion(Buy_Tiempo_Confirmacion,shift,rates_total,"C Simple 4",true,TiempoConfirmacionBuy10,AlertBuy,CumOffset);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Patron_11(datetime const &time[],int shift,int &CumOffset,double const &low[], double const &high[],bool &AlertBuy,bool &AlertSell,int const rates_total)
  {
   if(
      ad_Buffer[2]<bol_ad_Buffer_BASE[2] && ad_Buffer[1]>bol_ad_Buffer_BASE[1]
      && (ma_vol_Buffer[2]<bol_ma_vol_Buffer_BASE[2]) && ma_vol_Buffer[1]>bol_ma_vol_Buffer_BASE[1]  && ma_vol_Buffer[1]>ma_vol_Buffer[2]
      && bol_ad_Buffer_BASE[1]>bol_ad_Buffer_BASE[2] && bol_ad_Buffer_BASE[2]>bol_ad_Buffer_BASE[3] && bol_ad_Buffer_BASE[3]>bol_ad_Buffer_BASE[4]
      && (Rates[1].low<bol_Buffer_DN[1] || Rates[2].low<bol_Buffer_DN[2])

   )

     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos VOL.",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"VOL.   ", Text_VelasOpuestas, COLORVO);
         ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         AlertSell=true;
        }
      Sell_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Sell_Tiempo_Confirmacion,shift,rates_total,"VOL",false,TiempoConfirmacionSell11,AlertSell,CumOffset);

   if(
      ad_Buffer[2]>bol_ad_Buffer_BASE[2] && ad_Buffer[1]<bol_ad_Buffer_BASE[1]
      && (ma_vol_Buffer[2]<bol_ma_vol_Buffer_BASE[2]) && ma_vol_Buffer[1]>bol_ma_vol_Buffer_BASE[1] && ma_vol_Buffer[1]>ma_vol_Buffer[2]
      && bol_ad_Buffer_BASE[1]<bol_ad_Buffer_BASE[2] && bol_ad_Buffer_BASE[2]<bol_ad_Buffer_BASE[3] && bol_ad_Buffer_BASE[3]<bol_ad_Buffer_BASE[4]
      && (Rates[1].high>bol_Buffer_UP[1] || Rates[2].high>bol_Buffer_UP[2])

   )

     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos VOL.",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "VOL", Text_VelasOpuestas, COLORVO);
         ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         AlertBuy=true;
        }
      Buy_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Buy_Tiempo_Confirmacion,shift,rates_total,"VOL",true,TiempoConfirmacionBuy11,AlertBuy,CumOffset);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Patron_12(datetime const &time[],int shift,int &CumOffset,double const &low[], double const &high[],bool &AlertBuy,bool &AlertSell,int const rates_total)
  {
   if(
      (ROC_Buffer[2]<Bollinger_ROC_Buffer_BASE[2]) && (ROC_Buffer[1]>Bollinger_ROC_Buffer_BASE[1])
      && (MathAbs(Media_Fast_Buffer[5]-Media_Slow_Buffer[5]))<(MathAbs(Media_Fast_Buffer[4]-Media_Slow_Buffer[4]))
      && (MathAbs(Media_Fast_Buffer[4]-Media_Slow_Buffer[4]))<(MathAbs(Media_Fast_Buffer[3]-Media_Slow_Buffer[3]))
      && (MathAbs(Media_Fast_Buffer[6]-Media_Slow_Buffer[6]))<(MathAbs(Media_Fast_Buffer[5]-Media_Slow_Buffer[5]))
   )


     {

      Sell_Tiempo_ROC=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasKlinger;
     }

   if(Sell_Tiempo_ROC>time[shift]  && Sell_Tiempo_ROC!=0 &&  ROC_Buffer[2]<Bollinger_ROC_Buffer_BASE[2] && ROC_Buffer[1]>Bollinger_ROC_Buffer_BASE[1] && SARBuffer[2]>=Rates[2].high && SARBuffer[1]<=Rates[1].low  && ROC_Buffer[1]<0 && ROC_Buffer[0]>=0

     )

     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos VOL.",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"VOL.   ", Text_VelasOpuestas, COLORVO);
         ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         AlertSell=true;
        }
      Sell_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Sell_Tiempo_Confirmacion,shift,rates_total,"VOL",false,TiempoConfirmacionSell12,AlertSell,CumOffset);

   if(
      (ROC_Buffer[2]>Bollinger_ROC_Buffer_BASE[2]) && (ROC_Buffer[1]<Bollinger_ROC_Buffer_BASE[1])
      && (MathAbs(Media_Fast_Buffer[5]-Media_Slow_Buffer[5]))<(MathAbs(Media_Fast_Buffer[4]-Media_Slow_Buffer[4]))
      && (MathAbs(Media_Fast_Buffer[4]-Media_Slow_Buffer[4]))<(MathAbs(Media_Fast_Buffer[3]-Media_Slow_Buffer[3]))
      && (MathAbs(Media_Fast_Buffer[6]-Media_Slow_Buffer[6]))<(MathAbs(Media_Fast_Buffer[5]-Media_Slow_Buffer[5]))
   )

     {
      Buy_Tiempo_ROC=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasKlinger;
     }

   if(Buy_Tiempo_ROC>time[shift] &&  Buy_Tiempo_ROC!=0 &&  ROC_Buffer[2]>Bollinger_ROC_Buffer_BASE[2] && ROC_Buffer[1]<Bollinger_ROC_Buffer_BASE[1] && SARBuffer[1]>=Rates[1].high && SARBuffer[2]<=Rates[2].low  && ROC_Buffer[1]>0 && ROC_Buffer[0]<=0

     )
     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos VOL.",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "VOL", Text_VelasOpuestas, COLORVO);
         ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         AlertBuy=true;
        }
      Buy_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Buy_Tiempo_Confirmacion,shift,rates_total,"VOL",true,TiempoConfirmacionBuy12,AlertBuy,CumOffset);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Patron_14(datetime const &time[],int shift,int &CumOffset,double const &low[], double const &high[],bool &AlertBuy,bool &AlertSell,int const rates_total)
  {



   if


   (Rates[1].close<Bollinger_7_Buffer_DN[1] && Rates[1].close<Bollinger_6_Buffer_DN[1]
    && Rates[1].open>Bollinger_7_Buffer_DN[1] && Rates[1].open>Bollinger_6_Buffer_DN[1]
    && Bollinger_6_Buffer_DN[1]<Bollinger_7_Buffer_DN[1]
    && Rates[2].open>Rates[2].close
    && (MathAbs(Rates[2].open-Rates[2].close))>MathAbs(((Rates[2].open-Rates[2].close)*(0.5)))

   )



     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos 2bb",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "2 bb", Text_VelasOpuestas, COLORVO);
         ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         AlertBuy=true;
        }
      Buy_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }
   Evalua_Confirmacion(Buy_Tiempo_Confirmacion,shift,rates_total,"2 bb",true,TiempoConfirmacionBuy14,AlertBuy,CumOffset);



   if

   (Rates[1].close>Bollinger_7_Buffer_UP[1] && Rates[1].close>Bollinger_6_Buffer_UP[1]
    && Rates[1].open<Bollinger_7_Buffer_UP[1] && Rates[1].open<Bollinger_6_Buffer_UP[1]
    && Bollinger_6_Buffer_UP[1]>Bollinger_7_Buffer_UP[1]
    && Rates[2].open<Rates[2].close
    && (MathAbs(Rates[2].open-Rates[2].close))>MathAbs(((Rates[2].open-Rates[2].close)*(0.5)))


   )

     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos 2 bb",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"2 bb", Text_VelasOpuestas, COLORVO);
         ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         AlertSell=true;
        }
      Sell_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Sell_Tiempo_Confirmacion,shift,rates_total,"2 bb",false,TiempoConfirmacionSell14,AlertSell,CumOffset);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Patron_16(datetime const &time[],int shift,int &CumOffset,double const &low[], double const &high[],bool &AlertBuy,bool &AlertSell,int const rates_total)
  {
   if
   (
      ma_vol_Buffer[1]>bol_ma_vol_Buffer_UP[1] && Rates[1].open>Bollinger_7_Buffer_UP[1] && Rates[1].close<Rates[1].open
      && (MathAbs(Rates[1].open-Rates[1].close))>((MathAbs(Rates[2].open-Rates[2].close))*(0.5))
      && CCIBuffer_K[1]>190

   )

     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos 16",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "16", Text_VelasOpuestas, COLORVO);
         ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         AlertBuy=true;
        }
      Buy_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }
   Evalua_Confirmacion(Buy_Tiempo_Confirmacion,shift,rates_total,"16",true,TiempoConfirmacionBuy16,AlertBuy,CumOffset);




   if(
      ma_vol_Buffer[1]>bol_ma_vol_Buffer_UP[1] && Rates[1].open<Bollinger_7_Buffer_DN[1] && Rates[1].close>Rates[1].open
      && (MathAbs(Rates[1].open-Rates[1].close))>((MathAbs(Rates[2].open-Rates[2].close))*(0.5))
      && CCIBuffer_K[1]<-190
   )




     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos 16",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"vol 16", Text_VelasOpuestas, COLORVO);
         ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         AlertSell=true;
        }
      Sell_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Sell_Tiempo_Confirmacion,shift,rates_total,"16",false,TiempoConfirmacionSell16,AlertSell,CumOffset);

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Patron_17(datetime const &time[],int shift,int &CumOffset,double const &low[], double const &high[],bool &AlertBuy,bool &AlertSell,int const rates_total)
  {
   if(((CCIBuffer_K[3]>Bollinger_CCI_Buffer_DN_K[3] || CCIBuffer_K[4]>Bollinger_CCI_Buffer_DN_K[4]) && CCIBuffer_K[2]<Bollinger_CCI_Buffer_DN_K[2])
      && (MathAbs(Rates[2].close-Rates[2].open))>((MathAbs(Rates[3].low-Rates[3].high))+(MathAbs(Rates[4].low-Rates[4].high)))
      && (Rates[2].close<Rates[3].low && Rates[2].close<Rates[4].low && Rates[2].close<Rates[5].low)
      && (((MathAbs(Bollinger_7_Buffer_UP[1]-Bollinger_1_Buffer_DN[1]))>(MathAbs(Bollinger_7_Buffer_UP[2]-Bollinger_7_Buffer_DN[2]))
           && (MathAbs(Bollinger_7_Buffer_UP[2]-Bollinger_7_Buffer_DN[2]))>(MathAbs(Bollinger_7_Buffer_UP[3]-Bollinger_7_Buffer_DN[3]))
           && (MathAbs(Bollinger_7_Buffer_UP[3]-Bollinger_7_Buffer_DN[3]))>(MathAbs(Bollinger_7_Buffer_UP[4]-Bollinger_7_Buffer_DN[4]))
           && (MathAbs(Bollinger_7_Buffer_UP[4]-Bollinger_7_Buffer_DN[4]))>(MathAbs(Bollinger_7_Buffer_UP[5]-Bollinger_7_Buffer_DN[5])))
          || ((MathAbs(Bollinger_7_Buffer_UP[1]-Bollinger_7_Buffer_DN[1]))<(MathAbs(Bollinger_7_Buffer_UP[2]-Bollinger_7_Buffer_DN[2]))
              && (MathAbs(Bollinger_7_Buffer_UP[2]-Bollinger_7_Buffer_DN[2]))<(MathAbs(Bollinger_7_Buffer_UP[3]-Bollinger_7_Buffer_DN[3]))
              && (MathAbs(Bollinger_7_Buffer_UP[3]-Bollinger_7_Buffer_DN[3]))<(MathAbs(Bollinger_7_Buffer_UP[4]-Bollinger_7_Buffer_DN[4]))
              && (MathAbs(Bollinger_7_Buffer_UP[4]-Bollinger_7_Buffer_DN[4]))<(MathAbs(Bollinger_7_Buffer_UP[5]-Bollinger_7_Buffer_DN[5]))))

      && Rates[3].close<Bollinger_7_Buffer_DN[3]  && Rates[2].close<Bollinger_7_Buffer_DN[2]
      && Rates[1].close>Rates[1].open


     )


     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos CCI ROMP VELAS",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "CCI Romp V", Text_VelasOpuestas, COLORVO);
         ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         AlertBuy=true;
        }
      Buy_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Buy_Tiempo_Confirmacion,shift,rates_total,"CCI Romp V",true,TiempoConfirmacionBuy17,AlertBuy,CumOffset);




   if(((CCIBuffer_K[4]<Bollinger_CCI_Buffer_UP_K[4] || CCIBuffer_K[3]<Bollinger_CCI_Buffer_UP_K[3]) && CCIBuffer_K[2]>Bollinger_CCI_Buffer_UP_K[2])
      && (MathAbs(Rates[2].close-Rates[2].open))>((MathAbs(Rates[3].low-Rates[3].high))+(MathAbs(Rates[4].low-Rates[4].high)))
      && (Rates[2].close>Rates[3].high && Rates[2].close>Rates[4].high && Rates[2].close>Rates[5].high)
      && (((MathAbs(Bollinger_7_Buffer_UP[1]-Bollinger_1_Buffer_DN[1]))>(MathAbs(Bollinger_7_Buffer_UP[2]-Bollinger_7_Buffer_DN[2]))
           && (MathAbs(Bollinger_7_Buffer_UP[2]-Bollinger_7_Buffer_DN[2]))>(MathAbs(Bollinger_7_Buffer_UP[3]-Bollinger_7_Buffer_DN[3]))
           && (MathAbs(Bollinger_7_Buffer_UP[3]-Bollinger_7_Buffer_DN[3]))>(MathAbs(Bollinger_7_Buffer_UP[4]-Bollinger_7_Buffer_DN[4]))
           && (MathAbs(Bollinger_7_Buffer_UP[4]-Bollinger_7_Buffer_DN[4]))>(MathAbs(Bollinger_7_Buffer_UP[5]-Bollinger_7_Buffer_DN[5])))
          || ((MathAbs(Bollinger_7_Buffer_UP[1]-Bollinger_7_Buffer_DN[1]))<(MathAbs(Bollinger_7_Buffer_UP[2]-Bollinger_7_Buffer_DN[2]))
              && (MathAbs(Bollinger_7_Buffer_UP[2]-Bollinger_7_Buffer_DN[2]))<(MathAbs(Bollinger_7_Buffer_UP[3]-Bollinger_7_Buffer_DN[3]))
              && (MathAbs(Bollinger_7_Buffer_UP[3]-Bollinger_7_Buffer_DN[3]))<(MathAbs(Bollinger_7_Buffer_UP[4]-Bollinger_7_Buffer_DN[4]))
              && (MathAbs(Bollinger_7_Buffer_UP[4]-Bollinger_7_Buffer_DN[4]))<(MathAbs(Bollinger_7_Buffer_UP[5]-Bollinger_7_Buffer_DN[5]))))

      && Rates[3].close>Bollinger_7_Buffer_UP[3]  && Rates[2].close>Bollinger_7_Buffer_UP[2]
      && Rates[1].close<Rates[1].open



     )

     {
      if(Solo_Confirmacion==false)
        {
         MarkPattern(GetName("Patron Conjuntos CCI ROMP VELAS",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"CCI Romp V", Text_VelasOpuestas, COLORVO);
         ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         AlertSell=true;
        }
      Sell_Tiempo_Confirmacion=time[shift]+PeriodSeconds((ENUM_TIMEFRAMES)Period())*MaximoVelasConf;
     }

   Evalua_Confirmacion(Sell_Tiempo_Confirmacion,shift,rates_total,"CCI Romp V",false,TiempoConfirmacionSell17,AlertSell,CumOffset);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Funcion_Lineas(datetime const &time[],double const &close[],double const &open[],int shift,int const &rates_total)
  {
   if(Ver_Lineas_y_Estadisticas)
     {
      if((time[shift-1]==TiempoConfirmacionSell && TiempoConfirmacionSell!=0) || (time[shift-1]==TiempoConfirmacionSell1 && TiempoConfirmacionSell1!=0) || (time[shift-1]==TiempoConfirmacionSell2 && TiempoConfirmacionSell2!=0)
         || (time[shift-1]==TiempoConfirmacionSell3 && TiempoConfirmacionSell3!=0) || (time[shift-1]==TiempoConfirmacionSell4 && TiempoConfirmacionSell4!=0) || (time[shift-1]==TiempoConfirmacionSell5 && TiempoConfirmacionSell5!=0)
         || (time[shift-1]==TiempoConfirmacionSell6 && TiempoConfirmacionSell6!=0) || (time[shift-1]==TiempoConfirmacionSell7 && TiempoConfirmacionSell7!=0) || (time[shift-1]==TiempoConfirmacionSell8 && TiempoConfirmacionSell8!=0)
         || (time[shift-1]==TiempoConfirmacionSell9 && TiempoConfirmacionSell9!=0) || (time[shift-1]==TiempoConfirmacionSell10 && TiempoConfirmacionSell10!=0) || (time[shift-1]==TiempoConfirmacionSell11 && TiempoConfirmacionSell11!=0)
         || (time[shift-1]==TiempoConfirmacionSell12 && TiempoConfirmacionSell12!=0) || (time[shift-1]==TiempoConfirmacionSell13 && TiempoConfirmacionSell13!=0) || (time[shift-1]==TiempoConfirmacionSell14 && TiempoConfirmacionSell14!=0)
         || (time[shift-1]==TiempoConfirmacionSell15 && TiempoConfirmacionSell15!=0) || (time[shift-1]==TiempoConfirmacionSell16 && TiempoConfirmacionSell16!=0) || (time[shift-1]==TiempoConfirmacionSell17 && TiempoConfirmacionSell17!=0))

        {
         if(close[shift-1]>=open[shift-1])
           {
            Perdidas++;
            Ganadas=0;
            IgualarArray();
            VLineCreate(0,GetName("PERDIDA ",time[shift-1]),0,time[shift-1],ColorPerdida,EstiloLinea,1,true,false,true,true,0);
           }
         if(close[shift-1]<open[shift-1])
           {
            Perdidas=0;
            Ganadas++;
            IgualarArray();
            VLineCreate(0,GetName("GANADA ",time[shift-1]),0,time[shift-1],ColorGanada,EstiloLinea,1,true,false,true,true,0);
           }
        }

      if((time[shift-1]==TiempoConfirmacionBuy && TiempoConfirmacionBuy!=0) || (time[shift-1]==TiempoConfirmacionBuy1 && TiempoConfirmacionBuy1!=0) || (time[shift-1]==TiempoConfirmacionBuy2 && TiempoConfirmacionBuy2!=0)
         || (time[shift-1]==TiempoConfirmacionBuy3 && TiempoConfirmacionBuy3!=0) || (time[shift-1]==TiempoConfirmacionBuy4 && TiempoConfirmacionBuy4!=0) || (time[shift-1]==TiempoConfirmacionBuy5 && TiempoConfirmacionBuy5!=0)
         || (time[shift-1]==TiempoConfirmacionBuy6 && TiempoConfirmacionBuy6!=0) || (time[shift-1]==TiempoConfirmacionBuy7 && TiempoConfirmacionBuy7!=0) || (time[shift-1]==TiempoConfirmacionBuy8 && TiempoConfirmacionBuy8!=0)
         || (time[shift-1]==TiempoConfirmacionBuy9 && TiempoConfirmacionBuy9!=0) || (time[shift-1]==TiempoConfirmacionBuy10 && TiempoConfirmacionBuy10!=0) || (time[shift-1]==TiempoConfirmacionBuy11 && TiempoConfirmacionBuy11!=0)
         || (time[shift-1]==TiempoConfirmacionBuy12 && TiempoConfirmacionBuy12!=0) || (time[shift-1]==TiempoConfirmacionBuy13 && TiempoConfirmacionBuy13!=0) || (time[shift-1]==TiempoConfirmacionBuy14 && TiempoConfirmacionBuy14!=0)
         || (time[shift-1]==TiempoConfirmacionBuy15 && TiempoConfirmacionBuy15!=0) || (time[shift-1]==TiempoConfirmacionBuy16 && TiempoConfirmacionBuy16!=0) || (time[shift-1]==TiempoConfirmacionBuy17 && TiempoConfirmacionBuy17!=0))


        {
         if(close[shift-1]<=open[shift-1])
           {
            Perdidas++;
            Ganadas=0;
            IgualarArray();
            VLineCreate(0,GetName("PERDIDA ",time[shift-1]),0,time[shift-1],ColorPerdida,EstiloLinea,1,true,false,true,true,0);
           }
         if(close[shift-1]>open[shift-1])
           {
            Perdidas=0;
            Ganadas++;
            IgualarArray();
            VLineCreate(0,GetName("GANADA ",time[shift-1]),0,time[shift-1],ColorGanada,EstiloLinea,1,true,false,true,true,0);
           }
        }

      if(shift==rates_total-1 && Ver_Lineas_y_Estadisticas)
        {
         IgualarCuadros();
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Funcion_Iniciar()
  {
   if(Ver_Lineas_y_Estadisticas)
      DibujarCuadros();

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


   ADX_V=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_V);
   ADX_W=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_W);
   ADX_X=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_X);
   ADX_Y=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_Y);
   ADX_Z=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_Z);

   Bollinger_ADX_V=iBands(Symbol(),PERIOD_CURRENT,Bollinger_ADX_V_Periodo,Bollinger_ADX_V_Shift,Bollinger_ADX_V_Desviation,ADX_V);

   ROC=iCustom(Symbol(),PERIOD_CURRENT,"ROC",ROC_Period);
   Bollinger_ROC=iBands(Symbol(),PERIOD_CURRENT,Bollinger_ROC_Periodo,Bollinger_ROC_Shift,Bollinger_ROC_Desviation,ROC);

   MediaFast=iMA(Symbol(),PERIOD_CURRENT,Periodo_Media_Fast,Shift_Media_Fast,Mode_Media_Fast,AppliedPrice_Media_Fast);
   MediaSlow=iMA(Symbol(),PERIOD_CURRENT,Periodo_Media_Slow,Shift_Media_Slow,Mode_Media_Slow,AppliedPrice_Media_Slow);

   keltner_channel=iCustom(Symbol(),PERIOD_CURRENT,"keltner channel",TimeFrame,MAPeriod,MAMethod,MAVisible,Price,MaColorUp,MaColorDown,AtrPeriod,AtrMultiplier,AtrMode,ViewBars,Interpolate);

   volumenes=iVolumes(Symbol(),PERIOD_CURRENT,applied_volume_volumenes);
   ma_vol=iMA(Symbol(),PERIOD_CURRENT,ma_vol_Periodo,ma_vol_Shift,ma_vol_Mode,volumenes);
   bol_ma_vol=iBands(Symbol(),PERIOD_CURRENT,bol_ma_vol_Periodo,bol_ma_vol_Shift,bol_ma_vol_Desviation,ma_vol);

   ad=iAD(Symbol(),PERIOD_CURRENT,volumes);
   bol_ad=iBands(Symbol(),PERIOD_CURRENT,bol_ad_Periodo,bol_ad_Shift,bol_ad_Desviation,ad);

   ma_1=iMA(Symbol(),PERIOD_CURRENT,Periodo_ma_1,Shift_ma_1,Mode_ma_1,AppliedPrice_ma_1);
   bol=iBands(Symbol(),PERIOD_CURRENT,bol_Periodo,bol_Shift,bol_Desviation,ma_1);

   ma_20=iMA(Symbol(),PERIOD_CURRENT,Periodo_ma_20,Shift_ma_20,Mode_ma_20,AppliedPrice_ma_20);

   Alligator2=iAlligator(Symbol(),PERIOD_CURRENT,Jaw2,Jaw2_Shift,Teeth2,Teeth2_Shift,Lips2,Lips2_Shift,Mode_Alligator2,AppliedPrice_Alligator2);

   Bollinger_7=iBands(Symbol(),PERIOD_CURRENT,Bollinger_7_Periodo,Bollinger_7_Shift,Bollinger_7_Desviation,Alligator2);
   Bollinger_6=iBands(Symbol(),PERIOD_CURRENT,Bollinger_6_Periodo,Bollinger_6_Shift,Bollinger_6_Desviation,Bollinger_7);
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


   ArraySetAsSeries(Bollinger_ADX_V_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_ADX_V_Buffer_UP,true);

   ArraySetAsSeries(DI_V_plusBuffer,true);
   ArraySetAsSeries(DI_V_minusBuffer,true);
   ArraySetAsSeries(DI_W_plusBuffer,true);
   ArraySetAsSeries(DI_W_minusBuffer,true);
   ArraySetAsSeries(DI_X_plusBuffer,true);
   ArraySetAsSeries(DI_X_minusBuffer,true);
   ArraySetAsSeries(DI_Y_plusBuffer,true);
   ArraySetAsSeries(DI_Y_minusBuffer,true);
   ArraySetAsSeries(ADX_Z_Buffer,true);
   ArraySetAsSeries(DI_Z_plusBuffer,true);
   ArraySetAsSeries(DI_Z_minusBuffer,true);

   ArraySetAsSeries(Media_Fast_Buffer,true);
   ArraySetAsSeries(Media_Slow_Buffer,true);
   ArraySetAsSeries(ROC_Buffer,true);
   ArraySetAsSeries(Bollinger_ROC_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_ROC_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_ROC_Buffer_BASE,true);

   ArraySetAsSeries(keltner_channel_Buffer_Up,true);
   ArraySetAsSeries(keltner_channel_Buffer_Dn,true);

   ArraySetAsSeries(volumenes_Buffer,true);
   ArraySetAsSeries(ma_vol_Buffer,true);
   ArraySetAsSeries(bol_ma_vol_Buffer_DN,true);
   ArraySetAsSeries(bol_ma_vol_Buffer_UP,true);
   ArraySetAsSeries(bol_ma_vol_Buffer_BASE,true);

   ArraySetAsSeries(ad_Buffer,true);
   ArraySetAsSeries(bol_ad_Buffer_DN,true);
   ArraySetAsSeries(bol_ad_Buffer_UP,true);
   ArraySetAsSeries(bol_ad_Buffer_BASE,true);

   ArraySetAsSeries(bol_Buffer,true);
   ArraySetAsSeries(bol_Buffer_DN,true);
   ArraySetAsSeries(bol_Buffer_UP,true);
   ArraySetAsSeries(bol_Buffer_BASE,true);

   ArraySetAsSeries(ma_1_Buffer,true);
   ArraySetAsSeries(ma_20_Buffer,true);

   ArraySetAsSeries(Bollinger_6_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_6_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_6_Buffer_Central,true);

   ArraySetAsSeries(Bollinger_7_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_7_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_7_Buffer_Central,true);

   ArraySetAsSeries(Alligator2Buffer,true);


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
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IgualarBuffers(int const rates_total,int shift)
  {

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
   CopyBuffer(CCI_K,0,rates_total-shift-1,40,CCIBuffer_K);
   CopyBuffer(Bollinger_CCI_K,1,rates_total-1-shift,30,Bollinger_CCI_Buffer_UP_K);
   CopyBuffer(Bollinger_CCI_K,2,rates_total-1-shift,30,Bollinger_CCI_Buffer_DN_K);

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


   CopyBuffer(ADX_V,0,rates_total-1-shift,45,ADX_V_Buffer);
   CopyBuffer(ADX_V,1,rates_total-shift-1,45,DI_V_plusBuffer);
   CopyBuffer(ADX_V,2,rates_total-shift-1,45,DI_V_minusBuffer);
   CopyBuffer(ADX_W,0,rates_total-1-shift,46,ADX_W_Buffer);
   CopyBuffer(ADX_W,1,rates_total-shift-1,46,DI_W_plusBuffer);
   CopyBuffer(ADX_W,2,rates_total-shift-1,46,DI_W_minusBuffer);
   CopyBuffer(ADX_X,0,rates_total-1-shift,47,ADX_X_Buffer);
   CopyBuffer(ADX_X,1,rates_total-shift-1,47,DI_X_plusBuffer);
   CopyBuffer(ADX_X,2,rates_total-shift-1,47,DI_X_minusBuffer);
   CopyBuffer(ADX_Y,0,rates_total-1-shift,48,ADX_Y_Buffer);
   CopyBuffer(ADX_Y,1,rates_total-shift-1,48,DI_Y_plusBuffer);
   CopyBuffer(ADX_Y,2,rates_total-shift-1,48,DI_Y_minusBuffer);
   CopyBuffer(ADX_Z,0,rates_total-shift-1,5,ADX_Z_Buffer);
   CopyBuffer(ADX_Z,1,rates_total-shift-1,5,DI_Z_plusBuffer);
   CopyBuffer(ADX_Z,2,rates_total-shift-1,5,DI_Z_minusBuffer);

   CopyBuffer(MediaFast,0,rates_total-shift-1,40,Media_Fast_Buffer);
   CopyBuffer(MediaSlow,0,rates_total-shift-1,40,Media_Slow_Buffer);
   CopyBuffer(ROC,0,rates_total-shift-1,20,ROC_Buffer);
   CopyBuffer(Bollinger_ROC,2,rates_total-shift-1,4,Bollinger_ROC_Buffer_DN);
   CopyBuffer(Bollinger_ROC,1,rates_total-shift-1,4,Bollinger_ROC_Buffer_UP);
   CopyBuffer(Bollinger_ROC,0,rates_total-shift-1,40,Bollinger_ROC_Buffer_BASE);

   CopyBuffer(keltner_channel,2,rates_total-shift-1,40,keltner_channel_Buffer_Up);
   CopyBuffer(keltner_channel,3,rates_total-shift-1,40,keltner_channel_Buffer_Dn);

   CopyBuffer(volumenes,0,rates_total-1-shift,30,volumenes_Buffer);
   CopyBuffer(ma_vol,0,rates_total-shift-1,40,ma_vol_Buffer);
   CopyBuffer(bol_ma_vol,2,rates_total-shift-1,4,bol_ma_vol_Buffer_DN);
   CopyBuffer(bol_ma_vol,1,rates_total-shift-1,4,bol_ma_vol_Buffer_UP);
   CopyBuffer(bol_ma_vol,0,rates_total-shift-1,40,bol_ma_vol_Buffer_BASE);

   CopyBuffer(ad,0,rates_total-1-shift,30,ad_Buffer);

   CopyBuffer(bol_ad,2,rates_total-shift-1,4,bol_ad_Buffer_DN);
   CopyBuffer(bol_ad,1,rates_total-shift-1,4,bol_ad_Buffer_UP);
   CopyBuffer(bol_ad,0,rates_total-shift-1,40,bol_ad_Buffer_BASE);

   CopyBuffer(bol,2,rates_total-shift-1,4,bol_Buffer_DN);
   CopyBuffer(bol,1,rates_total-shift-1,4,bol_Buffer_UP);
   CopyBuffer(bol,0,rates_total-shift-1,40,bol_Buffer_BASE);

   CopyBuffer(ma_20,0,rates_total-shift-1,40,ma_20_Buffer);
   CopyBuffer(ma_1,0,rates_total-shift-1,40,ma_1_Buffer);

   CopyBuffer(Bollinger_6,1,rates_total-1-shift,10,Bollinger_6_Buffer_UP);
   CopyBuffer(Bollinger_6,2,rates_total-1-shift,10,Bollinger_6_Buffer_DN);



   CopyBuffer(Bollinger_7,1,rates_total-1-shift,10,Bollinger_7_Buffer_UP);
   CopyBuffer(Bollinger_7,2,rates_total-1-shift,10,Bollinger_7_Buffer_DN);
  }
//+------------------------------------------------------------------+
