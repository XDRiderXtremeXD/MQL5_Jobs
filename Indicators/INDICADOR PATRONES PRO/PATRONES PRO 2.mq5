//+------------------------------------------------------------------+
//|                                               PATRONES PRO 2.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright © Propiedad de Luis Felipe Amasifuén"
#property description "Zonas de Oferta y Demanda - Bloque de Ordenes"
#property description "Indicador Multitimeframe para todos los mercados financieros"
#property description "- Forex"
#property description "- Indices"
#property description "- Futuros"
#property description "- Crypto"

#property indicator_chart_window
#property indicator_buffers 15
#property indicator_color1 clrRed
#property indicator_color2 clrRed
#property indicator_color3 clrDodgerBlue
#property indicator_color4 clrDodgerBlue
#property indicator_plots   8
#property indicator_label1  "SELL"
#property indicator_color1  clrMagenta
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2  "BUY"
#property indicator_color2  clrMagenta
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

#property indicator_label3  "SELL CONFIRMACION"
#property indicator_color3  clrYellow
#property indicator_type3   DRAW_ARROW
#property indicator_style3  STYLE_SOLID
#property indicator_width3  2

#property indicator_label4  "BUY CONFIRMACION"
#property indicator_color4  clrYellow
#property indicator_type4   DRAW_ARROW
#property indicator_style4  STYLE_SOLID
#property indicator_width4  2


int Estocastico;
//int Momentun;

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12am=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

/*enum Modos
  {
   Solo_High_Low=0,
   Solo_Close_Close=1,
   Ambos=2,
  };
*/
//input int Desfase=20;
enum UsarDatos
  {
   Close_Close=0,
   High_Low=1,
  };

double ArrowSignalUP[];
double ArrowSignalDN[];

double ArrowSignalUPConfirmacion[];
double ArrowSignalDNConfirmacion[];

// additional candle patterns that are also met, the label will print above the previous label.
bool UseExtraDigit=false;
int Text_VelasOpuestas=10;

datetime Buy_Tiempo=0;
datetime Sell_Tiempo=0;
color COLORVO=clrAqua;

int ShiftEvaluaBuy=0;
int ShiftEvaluaSell=0;

//int ShiftHigh=0;
//int ShiftLow=0;

MqlRates Rates[];

int Estocastico2=0;
int RSI=0;

string period;
double Doji_Star_Ratio= 0;
double Doji_MinLength = 0;
double Star_MinLength = 0;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle High or Low point.
int  High_Offset = 0;            // The offset value added to the High arrow pointer for correct plotting of the pattern label.
int  Offset_ShootStar = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Hammer = 0;          // The offset value of the hammer above or below the pointer arrow.
int  Offset_Doji = 0;            // The offset value of the doji above or below the pointer arrow.
int  Offset_Star = 0;            // The offset value of the star above or below the pointer arrow.
int  Offset_Piercing_Line = 0;   // The offset value of the piercing line above or below the pointer arrow.
int  Offset_DarkCC = 0;          // The offset value of the dark cloud cover above or below the pointer arrow.
int  Offset_Bullish_Engulfing = 0;
int  Offset_Bearish_Engulfing = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
int VALORVELASOPUESTAS=0;
int IncOffset2=0;
int VELASLARGAS=0;
int MultAnt=0;
double MAYOR,MENOR;

double Piercing_Line_Ratio = 0;
int Piercing_Candle_Length = 0;
int Engulfing_Length=0;
double Candle_WickBody_Percent=0;
int CandleLength=0;

int DefinitionEstochastic;
int DefinitionRSI;
color COLORDESOPRES=Gold;
double ValorSopRes;
double VolumenVelasOPCM;
double VolumenMartillo;

double KArray[];
double MA_Array[];
double MAS_Array[];
double RSI_Array[];
double Nivel_Minimo=100.0;
double Nivel_Maximo=100.0;

int MASLOW=0;
int MA=0;


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

input int MaximoEsperaBarras=20;
input int MaximoSizePatron=500;
input int PuntosMaximos=200;
input int VelasEvaluadas=1000;// Velas Historial
input int Testeado=1;// Sop o Res, Fuerza Mayor a...
input bool Repintado=false;
//input Modos STO_Price=Ambos;
//input int Velas_Confirmacion=6;
input ENUM_Horas  Hora_Inicio=_8am;
input ENUM_Horas Hora_Final=_8am;
//input double Nivel=0.10;
//double Tolerancia=100;
//input UsarDatos Tipo_de_Datos=High_Low;// Tipo de Datos
//input bool Filtro_Traspaso_50=false;
input int Tolerancia_Puntos_Flecha=30;
input string S00="-----------------------   Configuracion Confirmaciones para Patrones ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Filter_Estocastico=true;//Patron con Estocastico
input bool Filter_MA=true;//Patron con EMA
input bool Filter_RSI=true;//Patron con RSI
input string S0="-----------------------   Configuracion Estocastico ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int K_Periodo=5;
input int D_Periodo=3;
input int Slowing=3;
input ENUM_MA_METHOD Ma_Method_EST=MODE_SMA;
// otra configuracion buena 10, 3, 5
input string S11="-----------------------   Configuracion MA---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Tolerancia_Puntos=0;
input int Period_MA_SLOW=150;
input int Period_MA=50;
input int Shift_MA=0;
input ENUM_APPLIED_PRICE APP_MA=PRICE_CLOSE;
input ENUM_MA_METHOD MODE_MA=MODE_SMA;
input string S1_="-----------------------   Configuracion RSI---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int RSI_Period=14;
input ENUM_APPLIED_PRICE APP_RSI=PRICE_CLOSE;
input string Settings_Alerts="-----------------------Settings_Alerts-----------------------";
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;
input string S1__="-----------------------   Configuracion SOP RES---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Ver_Sop_Res=false;
input int BackLimit=3000;
input string pus1="/////////////////////////////////////////////////";
input bool zone_show_weak=true;//Mostrar zonas débiles
input bool zone_show_untested = true;//Mostrar zonas no probadas
input bool zone_show_turncoat = true;//Mostrar zonas rotas
input double zone_fuzzfactor=0.75;
input int SeparacionTexto=10;
input bool Conector=false;
long CHART_ID=0;
input string S12_="============================================ CONFIGURACION TREND ============================================";//======================================================================
input bool FiltroTrend=true;
input int inpFastLength = 3; // Fast length
input int inpSlowLength = 7; // Slow length

string pus2="/////////////////////////////////////////////////";
bool fractals_show=false;
double fractal_fast_factor = 3.0;
double fractal_slow_factor = 6.0;
bool SetGlobals=true;

string pus3="/////////////////////////////////////////////////";
bool zone_solid=true;
int zone_linewidth=1;
int zone_style=0;
bool zone_show_info=true;
int zone_label_shift=0;
bool zone_merge=true;
bool zone_extend=true;

string pus4="/////////////////////////////////////////////////";
bool zone_show_alerts  = false;
bool zone_alert_popups = true;
bool zone_alert_sounds = true;
int zone_alert_waitseconds=300;

string pus5="/////////////////////////////////////////////////";
int Text_size=8;
string Text_font = "Courier New";
color Text_color = clrWhite;
string sup_name = "Soporte";
string res_name = "Resistencia";
string test_name= "Retesteado";


color color_support_weak     = clrAquamarine;//Color de la zona de soporte débil:
color color_support_untested = clrPowderBlue;//Color de la zona de soporte no probado:
color color_support_verified = clrSkyBlue;//Color de la zona de soporte verificado:
color color_support_proven   = clrTurquoise;//Color de la zona de soporte probado:
color color_support_turncoat = clrDarkOrange;//Color de la zona de soporte roto:
color color_resist_weak      = clrOrchid;//Color de la zona de resistencia débil:
color color_resist_untested  = clrMediumOrchid;//Color de la zona de resistencia no probada:
color color_resist_verified  = clrCrimson;//Color de la zona de resistencia verificada:
color color_resist_proven    = clrRed;// Color de la zona de resistencia probada:
color color_resist_turncoat  = clrDarkOrange;//Color de la zona de resistencia rota:

double FastDnPts[],FastUpPts[];
double SlowDnPts[],SlowUpPts[];

double zone_hi[1000],zone_lo[1000];
int    zone_start[1000],zone_hits[1000],zone_type[1000],zone_strength[1000],zone_count=0;
bool   zone_turn[1000];

#define ZONE_SUPPORT 1
#define ZONE_RESIST  2

#define ZONE_WEAK      0
#define ZONE_TURNCOAT  1
#define ZONE_UNTESTED  2
#define ZONE_VERIFIED  3
#define ZONE_PROVEN    4

#define UP_POINT 1
#define DN_POINT -1

int time_offset=0;

double ner_lo_zone_P1[];
double ner_lo_zone_P2[];
double ner_hi_zone_P1[];
double ner_hi_zone_P2[];

double ATR[1];

int DefinitionATR;

int CharAnterior=-1;

string NAME_CARGANDO="cod 002 CARGANDO";
string Identificacion="LINEAS 2021";

int HandleTrend=0;
double Close_Trend[];
double Start_trend[];
double Slow_Trend[];


struct Rango
  {
   double            High;
   double            Low;
   int               Indice;
  };

Rango B;
Rango S;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   CharAnterior=-1;

   if(Conector)
     {
      long currChart,prevChart=ChartFirst();
      int i_=0,limit2=100;
      while(i_<limit2 && !IsStopped())// We have certainly not more than 100 open charts
        {
         if(ChartGetString(prevChart,CHART_COMMENT)=="PATRONES PRO")
           {
            CHART_ID=prevChart;
            break;
           }

         currChart=ChartNext(prevChart); // Get the new chart ID by using the previous chart ID
         if(currChart<0)
            break;          // Have reached the end of the chart list
         //Print(i,ChartSymbol(currChart)," ID =",currChart);
         prevChart=currChart;// let's save the current chart ID for the ChartNext()
         i_++;// Do not forget to increase the counter
        }
     }



// Nivel_Minimo=Nivel_Minimo-Nivel;
//Nivel_Maximo=Nivel_Maximo+Nivel;
   /*
    double Margen=0;
    if(OrderCalcMargin(ORDER_TYPE_SELL,Symbol(),0.1,SymbolInfoDouble(Symbol(),SYMBOL_ASK),Margen))
    Comment(Margen);
    else{
    Print(GetLastError());
    Comment(Margen);}
   */

   ArraySetAsSeries(KArray,true);
   ArraySetAsSeries(MA_Array,true);
   ArraySetAsSeries(MAS_Array,true);
   ArraySetAsSeries(RSI_Array,true);

   Estocastico=iStochastic(Symbol(),PERIOD_CURRENT,K_Periodo,D_Periodo,Slowing,Ma_Method_EST,STO_LOWHIGH);
   Estocastico2=iStochastic(Symbol(),PERIOD_CURRENT,K_Periodo,D_Periodo,Slowing,Ma_Method_EST,STO_CLOSECLOSE);
// Momentun=iMomentum(Symbol(),PERIOD_CURRENT,Momentun_Periodo,Momentun_Applied_Price);
   MA=iMA(NULL,PERIOD_CURRENT,Period_MA,Shift_MA,MODE_MA,APP_MA);
   MASLOW=iMA(NULL,PERIOD_CURRENT,Period_MA_SLOW,Shift_MA,MODE_MA,APP_MA);
   RSI=iRSI(NULL,PERIOD_CURRENT,RSI_Period,APP_RSI);
   HandleTrend=iCustom(Symbol(),PERIOD_CURRENT,"IndicatorPersonalized",inpFastLength,inpSlowLength); // Slow length);

   if(HandleTrend==INVALID_HANDLE && FiltroTrend)
     {
      Print("ERROR: FILTRO TREND MAL CONFIGURADO");
      return(INIT_FAILED);
     }

   IndicatorSetString(INDICATOR_SHORTNAME,"Indicador Estrellas EMA");
//172, 115
   SetIndexBuffer(0,ArrowSignalUP);
   SetIndexBuffer(1,ArrowSignalDN);
   SetIndexBuffer(2,ArrowSignalUPConfirmacion);
   SetIndexBuffer(3,ArrowSignalDNConfirmacion);

   if(fractals_show==true)
     {
      SetIndexBuffer(4,SlowDnPts,INDICATOR_DATA);
      SetIndexBuffer(5,SlowUpPts,INDICATOR_DATA);
      SetIndexBuffer(6,FastDnPts,INDICATOR_DATA);
      SetIndexBuffer(7,FastUpPts,INDICATOR_DATA);
     }
   else
     {
      SetIndexBuffer(4,SlowDnPts,INDICATOR_CALCULATIONS);
      SetIndexBuffer(5,SlowUpPts,INDICATOR_CALCULATIONS);
      SetIndexBuffer(6,FastDnPts,INDICATOR_CALCULATIONS);
      SetIndexBuffer(7,FastUpPts,INDICATOR_CALCULATIONS);
     }

   SetIndexBuffer(8,ner_hi_zone_P1,INDICATOR_DATA);
   SetIndexBuffer(9,ner_hi_zone_P2,INDICATOR_DATA);
   SetIndexBuffer(10,ner_lo_zone_P1,INDICATOR_DATA);
   SetIndexBuffer(11,ner_lo_zone_P2,INDICATOR_DATA);
   SetIndexBuffer(12,Close_Trend,INDICATOR_DATA);
   SetIndexBuffer(13,Start_trend,INDICATOR_DATA);
   SetIndexBuffer(14,Slow_Trend,INDICATOR_DATA);

   PlotIndexSetInteger(0,PLOT_ARROW,234);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(1,PLOT_ARROW,233);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(2,PLOT_ARROW,234);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(3,PLOT_ARROW,233);
   PlotIndexSetDouble(3,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalDNConfirmacion,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalUPConfirmacion,EMPTY_VALUE);

   if(fractals_show==true)
     {
      PlotIndexSetInteger(4,PLOT_LINE_COLOR,clrYellow);
      PlotIndexSetInteger(5,PLOT_LINE_COLOR,clrYellow);
      PlotIndexSetInteger(6,PLOT_LINE_COLOR,clrYellow);
      PlotIndexSetInteger(7,PLOT_LINE_COLOR,clrYellow);

      PlotIndexSetInteger(4,PLOT_DRAW_TYPE,DRAW_ARROW);
      PlotIndexSetInteger(5,PLOT_DRAW_TYPE,DRAW_ARROW);
      PlotIndexSetInteger(6,PLOT_DRAW_TYPE,DRAW_ARROW);
      PlotIndexSetInteger(7,PLOT_DRAW_TYPE,DRAW_ARROW);

      PlotIndexSetInteger(4,PLOT_ARROW,218);
      PlotIndexSetInteger(5,PLOT_ARROW,217);
      PlotIndexSetInteger(6,PLOT_ARROW,218);
      PlotIndexSetInteger(7,PLOT_ARROW,217);

      PlotIndexSetString(4,PLOT_LABEL,"FRACTAL");
      PlotIndexSetString(6,PLOT_LABEL,"FRACTAL");
      PlotIndexSetString(7,PLOT_LABEL,"FRACTAL");
      PlotIndexSetString(7,PLOT_LABEL,"FRACTAL");
     }
   else
     {
      PlotIndexSetInteger(4,PLOT_DRAW_TYPE,DRAW_NONE);
      PlotIndexSetInteger(5,PLOT_DRAW_TYPE,DRAW_NONE);
      PlotIndexSetInteger(6,PLOT_ARROW,DRAW_NONE);
      PlotIndexSetInteger(7,PLOT_ARROW,DRAW_NONE);
     }

   PlotIndexSetInteger(8,PLOT_DRAW_TYPE,DRAW_NONE);
   PlotIndexSetInteger(9,PLOT_DRAW_TYPE,DRAW_NONE);
   PlotIndexSetInteger(10,PLOT_DRAW_TYPE,DRAW_NONE);
   PlotIndexSetInteger(11,PLOT_DRAW_TYPE,DRAW_NONE);

   PlotIndexSetString(8,PLOT_LABEL,"ner up zone P1");
   PlotIndexSetString(9,PLOT_LABEL,"ner up zone P2");
   PlotIndexSetString(10,PLOT_LABEL,"ner dn zone P1");
   PlotIndexSetString(11,PLOT_LABEL,"ner dn zone P2");

   ArraySetAsSeries(SlowDnPts,true);
   ArraySetAsSeries(SlowUpPts,true);
   ArraySetAsSeries(FastDnPts,true);
   ArraySetAsSeries(FastUpPts,true);

   ArraySetAsSeries(ner_hi_zone_P1,true);
   ArraySetAsSeries(ner_hi_zone_P2,true);
   ArraySetAsSeries(ner_lo_zone_P1,true);
   ArraySetAsSeries(ner_lo_zone_P2,true);

   switch(_Period)
     {
      case PERIOD_M1:
      case PERIOD_M2:
      case PERIOD_M3:
      case PERIOD_M4:
         period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=10;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Hammer=5;
         Offset_ShootStar=5;
         Offset_Doji = 5;
         Offset_Star = 5;
         Offset_Piercing_Line=5;
         Offset_DarkCC=5;
         Offset_Bearish_Engulfing = 5;
         Offset_Bullish_Engulfing = 5;
         IncOffset=16;
         VALORVELASOPUESTAS=4;
         IncOffset2=4;
         VELASLARGAS=5;
         ValorSopRes=0.2;
         VolumenVelasOPCM=1;
         VolumenMartillo=0.5;
         break;
      case PERIOD_M5:
      case PERIOD_M6:
      case PERIOD_M10:
      case PERIOD_M12:
         period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=10;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Hammer=5;
         Offset_ShootStar=5;
         Offset_Doji = 5;
         Offset_Star = 5;
         Offset_Piercing_Line=5;
         Offset_DarkCC=5;
         Offset_Bearish_Engulfing = 5;
         Offset_Bullish_Engulfing = 5;
         IncOffset=16;
         VALORVELASOPUESTAS=4;
         IncOffset2=4;
         VELASLARGAS=5;
         ValorSopRes=0.5;
         VolumenVelasOPCM=1;
         VolumenMartillo=0.5;
         break;
      case PERIOD_M15:
      case PERIOD_M20:
         period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=0;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Hammer=5;
         Offset_ShootStar=5;
         Offset_Doji = 5;
         Offset_Star = 5;
         Offset_Piercing_Line=5;
         Offset_DarkCC=5;
         Offset_Bearish_Engulfing = 5;
         Offset_Bullish_Engulfing = 5;
         IncOffset=16;
         VALORVELASOPUESTAS=4;
         IncOffset2=4;
         VELASLARGAS=7;
         ValorSopRes=0.5;
         VolumenVelasOPCM=1;
         VolumenMartillo=0.5;
         break;
      case PERIOD_M30:
         period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=15;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Hammer=5;
         Offset_ShootStar=5;
         Offset_Doji = 5;
         Offset_Star = 5;
         Offset_Piercing_Line=5;
         Offset_DarkCC=5;
         Offset_Bearish_Engulfing = 5;
         Offset_Bullish_Engulfing = 5;
         IncOffset=16;
         VALORVELASOPUESTAS=4;
         IncOffset2=4;
         VELASLARGAS=10;
         ValorSopRes=1;
         VolumenVelasOPCM=3;
         VolumenMartillo=1;
         break;
      case PERIOD_H1:
      case PERIOD_H2:
      case PERIOD_H3:
         period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=25;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=30;
         High_Offset=20;
         Offset_Hammer=10;
         Offset_ShootStar=30;
         Offset_Doji = 8;
         Offset_Star = 8;
         Offset_Piercing_Line=8;
         Offset_DarkCC=8;
         Offset_Bearish_Engulfing = 8;
         Offset_Bullish_Engulfing = 8;
         IncOffset=40;
         VALORVELASOPUESTAS=4;
         IncOffset2=100;
         VELASLARGAS=10;
         ValorSopRes=1;
         VolumenVelasOPCM=5;
         VolumenMartillo=2;
         break;
      case PERIOD_H4:
      case PERIOD_H6:
      case PERIOD_H8:
         period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=20;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=70;
         High_Offset=150;
         Offset_Hammer=40;
         Offset_ShootStar=40;
         Offset_Doji = 10;
         Offset_Star = 10;
         Offset_Piercing_Line=10;
         Offset_DarkCC=10;
         Offset_Bearish_Engulfing = 10;
         Offset_Bullish_Engulfing = 10;
         IncOffset=120;
         VALORVELASOPUESTAS=10;
         IncOffset2=120;
         VELASLARGAS=20;
         ValorSopRes=3;
         VolumenVelasOPCM=5;
         VolumenMartillo=2;
         break;
      case PERIOD_H12:
      case PERIOD_D1:
         period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=30;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=150;
         High_Offset=220;
         Offset_Hammer=40;
         Offset_ShootStar=40;
         Offset_Doji = 15;
         Offset_Star = 15;
         Offset_Piercing_Line=15;
         Offset_DarkCC=15;
         Offset_Bearish_Engulfing = 15;
         Offset_Bullish_Engulfing = 15;
         IncOffset=180;
         VALORVELASOPUESTAS=15;
         IncOffset2=180;
         VELASLARGAS=40;
         ValorSopRes=3;
         VolumenVelasOPCM=5;
         VolumenMartillo=2;
         break;
      case PERIOD_W1:
         period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=40;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=35;
         Offset_Hammer=80;
         Offset_ShootStar=80;
         Offset_Doji = 20;
         Offset_Star = 20;
         Offset_Piercing_Line=20;
         Offset_DarkCC=20;
         Offset_Bearish_Engulfing = 20;
         Offset_Bullish_Engulfing = 20;
         IncOffset=35;
         VALORVELASOPUESTAS=50;
         IncOffset2=40;
         VELASLARGAS=30;
         ValorSopRes=5;
         VolumenVelasOPCM=5;
         VolumenMartillo=2;
         break;
      case PERIOD_MN1:
         period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=50;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=45;
         Offset_Hammer=140;
         Offset_ShootStar=140;
         Offset_Doji = 30;
         Offset_Star = 30;
         Offset_Piercing_Line=30;
         Offset_DarkCC=30;
         Offset_Bearish_Engulfing = 30;
         Offset_Bullish_Engulfing = 30;
         IncOffset=45;
         VALORVELASOPUESTAS=50;
         IncOffset2=50;
         VELASLARGAS=30;
         ValorSopRes=5;
         VolumenVelasOPCM=5;
         VolumenMartillo=2;
         break;
     }

   if(UseExtraDigit)
     {
      Piercing_Candle_Length*=10;
      Engulfing_Length*=10;
      Candle_WickBody_Percent*=10;
      CandleLength*=10;
      Pointer_Offset*=10;
      High_Offset*=10;
      Offset_Hammer*=10;
      Offset_ShootStar*=10;
      Offset_Doji *= 10;
      Offset_Star *= 10;
      Offset_Piercing_Line*=10;
      Offset_DarkCC=10;
      Offset_Bearish_Engulfing *= 10;
      Offset_Bullish_Engulfing *= 10;
      IncOffset*=10;
      VELASLARGAS=30;
      ValorSopRes=5;
      VolumenVelasOPCM=5;
      VolumenMartillo=2;
     }


   /* string broker = AccountInfoString(ACCOUNT_COMPANY);
    long account = AccountInfoInteger(ACCOUNT_LOGIN);

    printf("The name of the broker = %s", broker);
    printf("Account number =  %d", account);

    for(int i=0; i<ArraySize(Cuentas); i++)
       if(account == Cuentas[i])
         {
          password_status = 1;
          Print("EA account verified");
          break;
         }
   ///////////////////////Cuenta del desarrollador////////////////////
    if(broker=="Pepperstone Group Limited" && account==51055646)
      {
       password_status=1;
       Comment("LICENCIA HABILITADA - ESPECIAL DESARROLLADOR");
      }
   /////////////////////////////////////////////////////////////////

    string NombreCuentaCompartida=" ";
    if(password_status == -1)
      {
       int CuentasCompartidasEjecutar=0;

       for(int k=0; k<ArraySize(CuentasCompartidas); k++)
         {
          if(CuentasCompartidas[k]==account)
            {
             NombreCuentaCompartida=NombrePersonaCompartida[k];
             CuentasCompartidasEjecutar++;
             break;
            }
         }
       if(CuentasCompartidasEjecutar==0)
         {
          MessageBox("CUENTA NO HABLITADA",NULL,0);
          Print("Cuenta no habilitada");
          Comment("Cuenta no habilitada");
          return(INIT_FAILED);
         }
       else
         {
          MessageBox(NombreCuentaCompartida+" - Licencia provista por Luis Felipe Amasifuen hasta "+TimeToString(UNTIL,TIME_MINUTES),NULL,0);
          Comment(NombreCuentaCompartida," - Licencia provista por Luis Felipe Amasifuen hasta ",UNTIL);

         }
      }
    else
      {
       MessageBox("CUENTA VERIFICADA// TIEMPO ILIMITADO",NULL,0);
      }
   */
   if(ObjectFind(CHART_ID,NAME_CARGANDO)<0)
      LabelCreate(CHART_ID,NAME_CARGANDO,0,50,50,CORNER_RIGHT_UPPER,"Cargando...","Arial",18,clrAqua,0,ANCHOR_RIGHT_UPPER,false,false,true,0);

   DefinitionATR=iATR(Symbol(),PERIOD_CURRENT,7);


   return(INIT_SUCCEEDED);

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   DeleteZones();
   DeleteGlobalVars();
   if(ObjectFind(CHART_ID,NAME_CARGANDO)>=0)
      ObjectDelete(CHART_ID,NAME_CARGANDO);

   ObjectsDeleteAll(CHART_ID,Identificacion,0,OBJ_TREND);
   Comment("");
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &Time[],
                const double &Open[],
                const double &High[],
                const double &Low[],
                const double &Close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {

   if(ChartPeriod(CHART_ID)!=Period() || ChartSymbol(CHART_ID)!=Symbol())
      return rates_total;

   /*if(password_status==-1)
     {
      if(TimeCurrent()>UNTIL)
        {
         Comment("TIEMPO DE PRUEBA TERMINADO EA DESHABILITADO");
         return (rates_total);
        }
     }
   */


   if(FiltroTrend)
      if(BarsCalculated(HandleTrend)<rates_total)
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

   if(FiltroTrend)
      if(CopyBuffer(HandleTrend,3,0,to_copy,Close_Trend)<=0)
         return(0);
   if(FiltroTrend)
      if(CopyBuffer(HandleTrend,5,0,to_copy,Slow_Trend)<=0)
         return(0);
   if(FiltroTrend)
      if(CopyBuffer(HandleTrend,7,0,to_copy,Start_trend)<=0)
         return(0);



   ArraySetAsSeries(Time,true);
   ArraySetAsSeries(High,true);
   ArraySetAsSeries(Low,true);
   ArraySetAsSeries(Close,true);
   ArraySetAsSeries(Open,true);


   if(Ver_Sop_Res)
     {
      static bool NewBarr=false;
      if(NewBar()==true)
        {
         int old_zone_count=zone_count;

         FastFractals(High,Low,0);
         SlowFractals(High,Low,0);
         DeleteZones();
         FindZones(High,Close,Low,0,true);
         DrawZones(Time,0);
         if(zone_count<old_zone_count)
            DeleteOldGlobalVars(old_zone_count);
         NewBarr=true;
        }

      int CharActual=int(ChartGetInteger(CHART_ID,CHART_VISIBLE_BARS));
      if(zone_show_info==true && (CharActual!=CharAnterior || NewBarr))
        {

         //Print("Entra 2222",TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES),"   ",Period()," ",Symbol()," ",CHART_ID," ",ChartPeriod(CHART_ID)," ",ChartSymbol(CHART_ID));
         for(int i=0; i<zone_count; i++)
           {
            string lbl;
            if(zone_strength[i]==ZONE_PROVEN)
               lbl="Probado";
            else
               if(zone_strength[i]==ZONE_VERIFIED)
                  lbl="Verificado";
               else
                  if(zone_strength[i]==ZONE_UNTESTED)
                     lbl="No Probado";
                  else
                     if(zone_strength[i]==ZONE_TURNCOAT)
                        lbl="Roto";
                     else
                        lbl="Debil";

            if(zone_type[i]==ZONE_SUPPORT)
               lbl=lbl+" "+sup_name;
            else
               lbl=lbl+" "+res_name;

            if(zone_hits[i]>0 && zone_strength[i]>ZONE_UNTESTED)
              {
               if(zone_hits[i]==1)
                  lbl=lbl+", "+test_name+"="+string(zone_hits[i]);
               else
                  lbl=lbl+", "+test_name+"="+string(zone_hits[i]);
              }

            int adjust_hpos;
            int wbpc=int(ChartGetInteger(CHART_ID,CHART_VISIBLE_BARS));
            int k=PeriodSeconds(Period())+(20+StringLen(lbl));

            if(wbpc<80)
               adjust_hpos=int(Time[0]+k*3);
            else
               if(wbpc<125)
                  adjust_hpos=int(Time[0]+k*5);
               else
                  if(wbpc<250)
                     adjust_hpos=int(Time[0]+k*7);
                  else
                     if(wbpc<480)
                        adjust_hpos=int(Time[0]+k*15);
                     else
                        if(wbpc<950)
                           adjust_hpos=int(Time[0]+k*30);
                        else
                           adjust_hpos=int(Time[0]+k*60);

            //

            int shift=k*zone_label_shift;
            double vpos=zone_hi[i]-(zone_hi[i]-zone_lo[i])/2;

            if(zone_strength[i]==ZONE_WEAK && zone_show_weak==false)
               continue;
            if(zone_strength[i]==ZONE_UNTESTED && zone_show_untested==false)
               continue;
            if(zone_strength[i]==ZONE_TURNCOAT && zone_show_turncoat==false)
               continue;

            string s="SSSR#"+string(i)+"LBL";
            if(ObjectFind(CHART_ID,s)<0)
               ObjectCreate(CHART_ID,s,OBJ_TEXT,0,adjust_hpos+shift,vpos);

            ObjectSetInteger(CHART_ID,s,OBJPROP_TIME,0,adjust_hpos+shift);
            ObjectSetDouble(CHART_ID,s,OBJPROP_PRICE,0,vpos);
            ObjectSetString(CHART_ID,s,OBJPROP_TEXT,0,StringRightPad(lbl,36," "));
            ObjectSetInteger(CHART_ID,s,OBJPROP_FONTSIZE,Text_size);
            ObjectSetString(CHART_ID,s,OBJPROP_FONT,Text_font);
            ObjectSetInteger(CHART_ID,s,OBJPROP_COLOR,Text_color);

            ChartRedraw(CHART_ID);

           }
         CharAnterior=CharActual;
        }
      NewBarr=false;
      CheckAlerts(Time,Close);
     }

   static bool Borrado=false;
   static datetime prevTime=0;
   if(prevTime==Time[0])
     {
      if(!Borrado)
        {
         if(ObjectFind(CHART_ID,NAME_CARGANDO)>=0)
            ObjectDelete(CHART_ID,NAME_CARGANDO);
         Borrado=true;
        }
      return(rates_total);
     }

   prevTime=Time[0];

   int Start=100;
   if(prev_calculated==0)
     {
      Start=100;
      ObjectsDeleteAll(0,Identificacion,0,OBJ_TREND);
      ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalDNConfirmacion,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalUPConfirmacion,EMPTY_VALUE);
     }
   else
      Start=rates_total-1;

   for(int shift=Start; shift<rates_total; shift++)
     {

      ArrowSignalUP[shift]=EMPTY_VALUE;
      ArrowSignalDN[shift]=EMPTY_VALUE;
      ArrowSignalUPConfirmacion[shift]=EMPTY_VALUE;
      ArrowSignalDNConfirmacion[shift]=EMPTY_VALUE;


      if(shift<rates_total-VelasEvaluadas)
         continue;


      // Print(rates_total-shift-1);

      ArraySetAsSeries(Time,true);
      ArraySetAsSeries(High,true);
      ArraySetAsSeries(Low,true);
      ArraySetAsSeries(Close,true);

      FastFractals(High,Low,rates_total-shift-1);
      SlowFractals(High,Low,rates_total-shift-1);


      if(!FindZones(High,Close,Low,rates_total-shift-1,false))
        {
         continue;
        }


      ArraySetAsSeries(Time,false);
      ArraySetAsSeries(High,false);
      ArraySetAsSeries(Low,false);
      ArraySetAsSeries(Close,false);
      ArraySetAsSeries(Open,false);

      ArrowSignalUP[shift]=EMPTY_VALUE;
      ArrowSignalDN[shift]=EMPTY_VALUE;


      int CumOffset=0;
      ArrayResize(Rates,10);
      int copied=CopyRates(Symbol(),PERIOD_CURRENT,rates_total-1-shift,8,Rates);

      // CopyBuffer(Momentun,0,rates_total-shift-1,3,Momentun_Buffer);


      if(EvaluarPatron(true,Low,High,Open,Close,shift,rates_total)) //&& (MathAbs(Momentun_Buffer[2]-100)>Nivel || MathAbs(Momentun_Buffer[1]-100)>Nivel) ) //&& iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+1)>iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+2) && (Nivel<MathAbs(100-Momentun_Buffer[1]) || Nivel<MathAbs(100-Momentun_Buffer[2])))//&& iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+1)>iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+2))
        {
         //if(Close[shift-1]>(Close[shift-2]>Open[shift-2]?Close[shift-2]:Open[shift-2]))
         //{
         if(FiltroSupRes(Low[shift-1],High[shift-1],true))
           {
            if(MathAbs(Open[shift-1]-High[shift-1])/Point()<=MaximoSizePatron)
              {
               B.High=High[shift-1]+PuntosMaximos*Point();
               B.Low=Low[shift-1];
               B.Indice=shift;
              }
            else
              {
               B.High=0;
               B.Low=0;
              }


            //if(FiltroTraspaso(Close,High,Low,shift,true,0,Time,ImpulsoEnd,ImpulsoStart))
            //{
            //ShiftHigh=shift+Velas_Confirmacion;
            ArrowSignalDN[shift-1] = Low[shift-1] - (Pointer_Offset*_Point);

            color ColorLinea=clrYellow;
            double ArrayPrecios[];
            if(!Buscar(High[shift-1],true,ArrayPrecios))
              {
               double Precio_TP=High[shift-1]+200*Point();
               ColorLinea=clrMagenta;
               TrendCreate(CHART_ID,Identificacion+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift-1],Precio_TP,Time[shift]+PeriodSeconds(Period()),Precio_TP,ColorLinea,STYLE_SOLID,3,false,false,false,false,true,0);
              }
            else
              {
               for(int i=0; i<ArraySize(ArrayPrecios) ; i++)
                 {
                  TrendCreate(CHART_ID,Identificacion+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES)+string(i),0,Time[shift-1],ArrayPrecios[i],Time[shift]+PeriodSeconds(Period()),ArrayPrecios[i],ColorLinea,STYLE_SOLID,3,false,false,false,false,true,0);
                 }
              }

            if(shift==rates_total-1)
              {
               if(AlertPC)
                  Alert("Operacion Buy en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
               if(AlertMovil)
                  SendNotification("Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
               if(AlertMail)
                  SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
              }
            //}
            // }
           }
        }

      if(EvaluarPatron(false,Low,High,Open,Close,shift,rates_total)) //&& (MathAbs(Momentun_Buffer[2]-100)>Nivel || MathAbs(Momentun_Buffer[1]-100)>Nivel) ) //&& iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+1)>iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+2)  && (Nivel<MathAbs(100-Momentun_Buffer[1]) || Nivel<MathAbs(100-Momentun_Buffer[2])))  //&& iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+1)>iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+2))
        {
         //if(Close[shift-1]<(Close[shift-2]<Open[shift-2]?Close[shift-2]:Open[shift-2]))
         //{
         if(FiltroSupRes(Low[shift-1],High[shift-1],false))
           {
            //if(FiltroTraspaso(Close,High,Low,shift,false,0,Time,ImpulsoEnd,ImpulsoStart))
            // {
            if(MathAbs(Open[shift-1]-Low[shift-1])/Point()<=MaximoSizePatron)
              {
               S.High=High[shift-1];
               S.Low=Low[shift-1]-PuntosMaximos*Point();
               S.Indice=shift;
              }
            else
              {
               S.High=0;
               S.Low=0;
              }

            color ColorLinea=clrYellow;

            double ArrayPrecios[];
            if(!Buscar(Low[shift-1],false,ArrayPrecios))
              {
               double Precio_TP=Low[shift-1]-200*Point();
               ColorLinea=clrMagenta;
               TrendCreate(CHART_ID,Identificacion+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift-1],Precio_TP,Time[shift]+PeriodSeconds(Period()),Precio_TP,ColorLinea,STYLE_SOLID,3,false,false,false,false,true,0);
              }
            else
              {
               for(int i=0; i<ArraySize(ArrayPrecios) ; i++)
                 {
                  TrendCreate(CHART_ID,Identificacion+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES)+string(i),0,Time[shift-1],ArrayPrecios[i],Time[shift]+PeriodSeconds(Period()),ArrayPrecios[i],ColorLinea,STYLE_SOLID,3,false,false,false,false,true,0);
                 }
              }
            //ShiftLow=shift+Velas_Confirmacion;
            ArrowSignalUP[shift-1] = High[shift-1] + (Pointer_Offset*_Point);
            if(shift==rates_total-1)
              {
               if(AlertPC)
                  Alert("Operacion Sell en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
               if(AlertMovil)
                  SendNotification("Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
               if(AlertMail)
                  SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
              }
            //}
            //   }
           }
        }
      if(S.High!=0 && S.Low!=0)
        {
         if(shift-S.Indice>=MaximoEsperaBarras)
           {
            S.High=0;
            S.Low=0;
           }
        }


      if(B.High!=0 && B.Low!=0)
        {
         if(shift-B.Indice>=MaximoEsperaBarras)
           {
            B.High=0;
            B.Low=0;
           }
        }


      if(!EvaluaHorario(Hora_Inicio,Hora_Final,Time[shift-1]))
        {
         continue;
        }


      if(S.High!=0 && S.Low!=0)
         if((Start_trend[shift-1]!=EMPTY_VALUE && Start_trend[shift-1]>High[shift-1]) || (Start_trend[shift-2]!=EMPTY_VALUE && Start_trend[shift-2]>High[shift-2]))
           {
            if((Low[shift-1]>S.Low && Low[shift-1]<S.High)  || (Start_trend[shift-2]!=EMPTY_VALUE && Start_trend[shift-2]>High[shift-2]))
               ArrowSignalUPConfirmacion[shift-1]=High[shift-1];
            S.High=0;
            S.Low=0;
           }
      if(B.High!=0 && B.Low!=0)
         if((Start_trend[shift-1]!=EMPTY_VALUE && Start_trend[shift-1]<Low[shift-1]) || (Start_trend[shift-2]!=EMPTY_VALUE && Start_trend[shift-2]<Low[shift-2]))
           {
            if((High[shift-1]>B.Low && High[shift-1]<B.High)   || (Start_trend[shift-2]!=EMPTY_VALUE && Start_trend[shift-2]<Low[shift-2]))
               ArrowSignalDNConfirmacion[shift-1]=Low[shift-1];
            B.High=0;
            B.Low=0;
           }


     }



//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CheckAlerts(const datetime &Time[],const double &Close[])
  {
   static int lastalert=0;

   if(zone_show_alerts==false)
      return;

   if(Time[0]-lastalert>zone_alert_waitseconds)
      if(CheckEntryAlerts(Close)==true)
         lastalert=int(Time[0]);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CheckEntryAlerts(const double &Close[])
  {
// check for entries
   for(int i=0; i<zone_count; i++)
     {
      if(Close[0]>=zone_lo[i] && Close[0]<zone_hi[i])
        {
         if(zone_show_alerts==true)
           {
            if(zone_alert_popups==true)
              {
               if(zone_type[i]==ZONE_SUPPORT)
                  Alert(Symbol()+TimeFrameToString(Period())+": Support Zone Entered");
               else
                  Alert(Symbol()+TimeFrameToString(Period())+": Resistance Zone Entered");
              }

            if(zone_alert_sounds==true)
               PlaySound("alert_wav");
           }

         return(true);
        }
     }

   return(false);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DeleteGlobalVars()
  {
   if(SetGlobals==false)
      return;

   GlobalVariableDel("SSSR_Count_"+Symbol()+string(Period()));
   GlobalVariableDel("SSSR_Updated_"+Symbol()+string(Period()));

   int old_count=zone_count;
   zone_count=0;
   DeleteOldGlobalVars(old_count);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DeleteOldGlobalVars(int old_count)
  {
   if(SetGlobals==false)
      return;

   for(int i=zone_count; i<old_count; i++)
     {
      GlobalVariableDel("SSSR_HI_"+Symbol()+string(Period()+i));
      GlobalVariableDel("SSSR_LO_"+Symbol()+string(Period()+i));
      GlobalVariableDel("SSSR_HITS_"+Symbol()+string(Period()+i));
      GlobalVariableDel("SSSR_STRENGTH_"+Symbol()+string(Period()+i));
      GlobalVariableDel("SSSR_AGE_"+Symbol()+string(Period()+i));
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FindZones(const double &High[],const double &Close[],const double &Low[],int Prueba,bool Draw)
  {
   if(!Draw)
     {
      Prueba=Prueba+(Repintado?0:1);
     }
//Prueba=Prueba+1;
   int i,j=0,shift,bustcount=0,testcount=0;
   double hival,loval;
   bool turned=false,hasturned=false;

   double temp_hi[],temp_lo[];
   ArrayResize(temp_hi,VelasEvaluadas+1000);
   ArrayResize(temp_lo,VelasEvaluadas+1000);
   int    temp_start[],temp_hits[],temp_strength[],temp_count=0;
   ArrayResize(temp_start,VelasEvaluadas+1000);
   ArrayResize(temp_hits,VelasEvaluadas+1000);
   ArrayResize(temp_strength,VelasEvaluadas+1000);
   bool   temp_turn[],temp_merge[];
   ArrayResize(temp_turn,VelasEvaluadas+1000);
   ArrayResize(temp_merge,VelasEvaluadas+1000);
   int merge1[],merge2[],merge_count=0;
   ArrayResize(merge1,VelasEvaluadas+1000);
   ArrayResize(merge2,VelasEvaluadas+1000);

// iterate through zones from oldest to youngest (ignore recent 5 bars),
// finding those that have survived through to the present___
   for(shift=MathMin(Bars(Symbol(),PERIOD_CURRENT)-1,BackLimit+Prueba); shift>5+Prueba; shift--)
     {
      //double atr= iATR(NULL,0,7,shift);
      CopyBuffer(DefinitionATR,0,shift,1,ATR);
      double atr=ATR[0];
      double fu = atr/2 * zone_fuzzfactor;
      bool isWeak;
      bool touchOk= false;
      bool isBust = false;

      if(FastUpPts[shift]>0.001)
        {
         // a zigzag High point
         isWeak=true;
         if(SlowUpPts[shift]>0.001)
            isWeak=false;

         hival=High[shift];
         if(zone_extend==true)
            hival+=fu;

         loval=MathMax(MathMin(Close[shift],High[shift]-fu),High[shift]-fu*2);
         turned=false;
         hasturned=false;
         isBust=false;

         bustcount = 0;
         testcount = 0;

         for(i=shift-1; i>=Prueba; i--)
           {
            if((turned==false && FastUpPts[i]>=loval && FastUpPts[i]<=hival) ||
               (turned==true && FastDnPts[i]<=hival && FastDnPts[i]>=loval))
              {
               // Potential touch, just make sure its been 10+candles since the prev one
               touchOk=true;
               for(j=i+1; j<i+11; j++)
                 {
                  if((turned==false && FastUpPts[j]>=loval && FastUpPts[j]<=hival) ||
                     (turned==true && FastDnPts[j]<=hival && FastDnPts[j]>=loval))
                    {
                     touchOk=false;
                     break;
                    }
                 }

               if(touchOk==true)
                 {
                  // we have a touch_  If its been busted once, remove bustcount
                  // as we know this level is still valid & has just switched sides
                  bustcount=0;
                  testcount++;
                 }
              }

            if((turned==false && High[i]>hival) ||
               (turned==true && Low[i]<loval))
              {
               // this level has been busted at least once
               bustcount++;

               if(bustcount>1 || isWeak==true)
                 {
                  // busted twice or more
                  isBust=true;
                  break;
                 }

               if(turned == true)
                  turned = false;
               else
                  if(turned==false)
                     turned=true;

               hasturned=true;

               // forget previous hits
               testcount=0;
              }
           }

         if(isBust==false)
           {
            // level is still valid, add to our list
            temp_hi[temp_count] = hival;
            temp_lo[temp_count] = loval;
            temp_turn[temp_count] = hasturned;
            temp_hits[temp_count] = testcount;
            temp_start[temp_count] = shift;
            temp_merge[temp_count] = false;

            if(testcount>3)
               temp_strength[temp_count]=ZONE_PROVEN;
            else
               if(testcount>0)
                  temp_strength[temp_count]=ZONE_VERIFIED;
               else
                  if(hasturned==true)
                     temp_strength[temp_count]=ZONE_TURNCOAT;
                  else
                     if(isWeak==false)
                        temp_strength[temp_count]=ZONE_UNTESTED;
                     else
                        temp_strength[temp_count]=ZONE_WEAK;

            temp_count++;
           }
        }
      else
         if(FastDnPts[shift]>0.001)
           {
            // a zigzag Low point
            isWeak=true;
            if(SlowDnPts[shift]>0.001)
               isWeak=false;

            loval=Low[shift];
            if(zone_extend==true)
               loval-=fu;

            hival=MathMin(MathMax(Close[shift],Low[shift]+fu),Low[shift]+fu*2);
            turned=false;
            hasturned=false;

            bustcount = 0;
            testcount = 0;
            isBust=false;

            for(i=shift-1; i>=Prueba; i--)
              {
               if((turned==true && FastUpPts[i]>=loval && FastUpPts[i]<=hival) ||
                  (turned==false && FastDnPts[i]<=hival && FastDnPts[i]>=loval))
                 {
                  // Potential touch, just make sure its been 10+candles since the prev one
                  touchOk=true;
                  for(j=i+1; j<i+11; j++)
                    {
                     if((turned==true && FastUpPts[j]>=loval && FastUpPts[j]<=hival) ||
                        (turned==false && FastDnPts[j]<=hival && FastDnPts[j]>=loval))
                       {
                        touchOk=false;
                        break;
                       }
                    }

                  if(touchOk==true)
                    {
                     // we have a touch_  If its been busted once, remove bustcount
                     // as we know this level is still valid & has just switched sides
                     bustcount=0;
                     testcount++;
                    }
                 }

               if((turned==true && High[i]>hival) ||
                  (turned==false && Low[i]<loval))
                 {
                  // this level has been busted at least once
                  bustcount++;

                  if(bustcount>1 || isWeak==true)
                    {
                     // busted twice or more
                     isBust=true;
                     break;
                    }

                  if(turned == true)
                     turned = false;
                  else
                     if(turned==false)
                        turned=true;

                  hasturned=true;

                  // forget previous hits
                  testcount=0;
                 }
              }

            if(isBust==false)
              {
               // level is still valid, add to our list
               temp_hi[temp_count] = hival;
               temp_lo[temp_count] = loval;
               temp_turn[temp_count] = hasturned;
               temp_hits[temp_count] = testcount;
               temp_start[temp_count] = shift;
               temp_merge[temp_count] = false;

               if(testcount>3)
                  temp_strength[temp_count]=ZONE_PROVEN;
               else
                  if(testcount>0)
                     temp_strength[temp_count]=ZONE_VERIFIED;
                  else
                     if(hasturned==true)
                        temp_strength[temp_count]=ZONE_TURNCOAT;
                     else
                        if(isWeak==false)
                           temp_strength[temp_count]=ZONE_UNTESTED;
                        else
                           temp_strength[temp_count]=ZONE_WEAK;

               temp_count++;
              }
           }
     }


//  Print("B");
// look for overlapping zones___

   if(j>=VelasEvaluadas+1000)
     {
      Print(Prueba);
      Print("Mala Ejecucion ",Period()," ",Symbol());
      return false;
     }

   if(zone_merge==true)
     {
      merge_count=1;
      int iterations=0;
      while(merge_count>0 && iterations<3)
        {
         merge_count=0;
         iterations++;

         for(i=0; i<temp_count; i++)
            temp_merge[i]=false;

         for(i=0; i<temp_count-1; i++)
           {
            if(temp_hits[i]==-1 || temp_merge[j]==true)
               continue;

            for(j=i+1; j<temp_count; j++)
              {
               if(temp_hits[j]==-1 || temp_merge[j]==true)
                  continue;

               if((temp_hi[i]>=temp_lo[j] && temp_hi[i]<=temp_hi[j]) ||
                  (temp_lo[i] <= temp_hi[j] && temp_lo[i] >= temp_lo[j]) ||
                  (temp_hi[j] >= temp_lo[i] && temp_hi[j] <= temp_hi[i]) ||
                  (temp_lo[j] <= temp_hi[i] && temp_lo[j] >= temp_lo[i]))
                 {
                  merge1[merge_count] = i;
                  merge2[merge_count] = j;
                  temp_merge[i] = true;
                  temp_merge[j] = true;
                  merge_count++;
                 }
              }
           }

         // ___ and merge them ___
         for(i=0; i<merge_count; i++)
           {
            int target = merge1[i];
            int source = merge2[i];

            temp_hi[target] = MathMax(temp_hi[target], temp_hi[source]);
            temp_lo[target] = MathMin(temp_lo[target], temp_lo[source]);
            temp_hits[target] += temp_hits[source];
            temp_start[target] = MathMax(temp_start[target], temp_start[source]);
            temp_strength[target]=MathMax(temp_strength[target],temp_strength[source]);
            if(temp_hits[target]>3)
               temp_strength[target]=ZONE_PROVEN;

            if(temp_hits[target]==0 && temp_turn[target]==false)
              {
               temp_hits[target]=1;
               if(temp_strength[target]<ZONE_VERIFIED)
                  temp_strength[target]=ZONE_VERIFIED;
              }

            if(temp_turn[target] == false || temp_turn[source] == false)
               temp_turn[target] = false;
            if(temp_turn[target] == true)
               temp_hits[target] = 0;

            temp_hits[source]=-1;
           }
        }
     }


// Print("C");
// copy the remaining list into our official zones arrays
   zone_count=0;
   for(i=0; i<temp_count; i++)
     {
      if(temp_hits[i]>=0 && zone_count<1000)
        {
         zone_hi[zone_count]       = temp_hi[i];
         zone_lo[zone_count]       = temp_lo[i];
         zone_hits[zone_count]     = temp_hits[i];
         zone_turn[zone_count]     = temp_turn[i];
         zone_start[zone_count]    = temp_start[i];
         zone_strength[zone_count] = temp_strength[i];

         if(zone_hi[zone_count]<Close[4+Prueba])
            zone_type[zone_count]=ZONE_SUPPORT;
         else
            if(zone_lo[zone_count]>Close[4+Prueba])
               zone_type[zone_count]=ZONE_RESIST;
            else
              {
               for(j=5+Prueba; j<1000; j++)
                 {
                  if(Close[j]<zone_lo[zone_count])
                    {
                     zone_type[zone_count]=ZONE_RESIST;
                     break;
                    }
                  else
                     if(Close[j]>zone_hi[zone_count])
                       {
                        zone_type[zone_count]=ZONE_SUPPORT;
                        break;
                       }
                 }

               if(j==1000)
                  zone_type[zone_count]=ZONE_SUPPORT;
              }

         zone_count++;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DrawZones(const datetime &Time[],int Prueba)
  {
   double lower_nerest_zone_P1=0;
   double lower_nerest_zone_P2=0;
   double higher_nerest_zone_P1=EMPTY_VALUE;
   double higher_nerest_zone_P2=EMPTY_VALUE;

   if(SetGlobals==true)
     {
      GlobalVariableSet("SSSR_Count_"+Symbol()+string(Period()),zone_count);
      GlobalVariableSet("SSSR_Updated_"+Symbol()+string(Period()),TimeCurrent());
     }

   string s="";
   for(int i=0; i<zone_count; i++)
     {
      //IMPRESION Print("Rectangle ",i," ",DoubleToString(zone_hi[i],Digits())," ",DoubleToString(zone_lo[i],Digits()));

      if(zone_strength[i]==ZONE_WEAK && zone_show_weak==false)
         continue;

      if(zone_strength[i]==ZONE_UNTESTED && zone_show_untested==false)
         continue;

      if(zone_strength[i]==ZONE_TURNCOAT && zone_show_turncoat==false)
         continue;

      //name sup
      if(zone_type[i]==ZONE_SUPPORT)
         s="SSSR#S"+string(i)+" Strength=";
      else
         //name res
         s="SSSR#R"+string(i)+" Strength=";

      if(zone_strength[i]==ZONE_PROVEN)
         s=s+"Proven, Test Count="+string(zone_hits[i]);
      else
         if(zone_strength[i]==ZONE_VERIFIED)
            s=s+"Verified, Test Count="+string(zone_hits[i]);
         else
            if(zone_strength[i]==ZONE_UNTESTED)
               s=s+"Untested";
            else
               if(zone_strength[i]==ZONE_TURNCOAT)
                  s=s+"Turncoat";
               else
                  s=s+"Weak";

      int Indice=MathMin(Bars(Symbol(),Period())-1,Prueba);

      ObjectCreate(CHART_ID,s,OBJ_RECTANGLE,0,Time[zone_start[i]],zone_hi[i],Time[Indice],zone_lo[i]);
      ObjectSetInteger(CHART_ID,s,OBJPROP_FILL,true);
      //ObjectSetInteger(CHART_ID,s,OBJPROP_TIME,0,Time[zone_start[i]]);
      //ObjectSetInteger(CHART_ID,s,OBJPROP_TIME,1,Time[Indice]);
      //ObjectSetDouble(CHART_ID,s,OBJPROP_PRICE,0,zone_hi[i]);
      //ObjectSetDouble(CHART_ID,s,OBJPROP_PRICE,1,zone_lo[i]);
      ObjectSetInteger(CHART_ID,s,OBJPROP_BACK,zone_solid);
      ObjectSetInteger(CHART_ID,s,OBJPROP_WIDTH,zone_linewidth);
      ObjectSetInteger(CHART_ID,s,OBJPROP_STYLE,zone_style);

      if(zone_type[i]==ZONE_SUPPORT)
        {
         // support zone
         if(zone_strength[i]==ZONE_TURNCOAT)
            ObjectSetInteger(CHART_ID,s,OBJPROP_COLOR,color_support_turncoat);
         else
            if(zone_strength[i]==ZONE_PROVEN)
               ObjectSetInteger(CHART_ID,s,OBJPROP_COLOR,color_support_proven);
            else
               if(zone_strength[i]==ZONE_VERIFIED)
                  ObjectSetInteger(CHART_ID,s,OBJPROP_COLOR,color_support_verified);
               else
                  if(zone_strength[i]==ZONE_UNTESTED)
                     ObjectSetInteger(CHART_ID,s,OBJPROP_COLOR,color_support_untested);
                  else
                     ObjectSetInteger(CHART_ID,s,OBJPROP_COLOR,color_support_weak);
        }
      else
        {
         // resistance zone
         if(zone_strength[i]==ZONE_TURNCOAT)
            ObjectSetInteger(CHART_ID,s,OBJPROP_COLOR,color_resist_turncoat);
         else
            if(zone_strength[i]==ZONE_PROVEN)
               ObjectSetInteger(CHART_ID,s,OBJPROP_COLOR,color_resist_proven);
            else
               if(zone_strength[i]==ZONE_VERIFIED)
                  ObjectSetInteger(CHART_ID,s,OBJPROP_COLOR,color_resist_verified);
               else
                  if(zone_strength[i]==ZONE_UNTESTED)
                     ObjectSetInteger(CHART_ID,s,OBJPROP_COLOR,color_resist_untested);
                  else
                     ObjectSetInteger(CHART_ID,s,OBJPROP_COLOR,color_resist_weak);
        }


      if(SetGlobals==true)
        {
         GlobalVariableSet("SSSR_HI_"+Symbol()+string(Period())+string(i),zone_hi[i]);
         GlobalVariableSet("SSSR_LO_"+Symbol()+string(Period())+string(i),zone_lo[i]);
         GlobalVariableSet("SSSR_HITS_"+Symbol()+string(Period())+string(i),zone_hits[i]);
         GlobalVariableSet("SSSR_STRENGTH_"+Symbol()+string(Period())+string(i),zone_strength[i]);
         GlobalVariableSet("SSSR_AGE_"+Symbol()+string(Period())+string(i),zone_start[i]);
        }
      double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
      //nearest zones
      if(zone_lo[i]>lower_nerest_zone_P2 && Bid>zone_lo[i])
        {
         lower_nerest_zone_P1=zone_hi[i];
         lower_nerest_zone_P2=zone_lo[i];
        }
      if(zone_hi[i]<higher_nerest_zone_P1 && Bid<zone_hi[i])
        {
         higher_nerest_zone_P1=zone_hi[i];
         higher_nerest_zone_P2=zone_lo[i];
        }
     }

   ner_hi_zone_P1[0]=higher_nerest_zone_P1;
   ner_hi_zone_P2[0]=higher_nerest_zone_P2;
   ner_lo_zone_P1[0]=lower_nerest_zone_P1;
   ner_lo_zone_P2[0]=lower_nerest_zone_P2;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Fractal(int M,int P,int shift,const double &High[],const double &Low[])
  {
   int PeriodoEva=(PeriodSeconds(Period())/60);

   if(PeriodoEva>P)
      P=PeriodoEva;

   P=int(P/PeriodoEva*2+MathCeil(P/PeriodoEva/2));

   if(shift<P)
      return(false);

   if(shift>=Bars(Symbol(),PERIOD_CURRENT)-P)
      return(false);


   for(int i=1; i<=P; i++)
     {
      if(M==UP_POINT)
        {
         if(High[shift+i]>High[shift])
            return(false);
         if(High[shift-i]>=High[shift])
            return(false);
        }
      if(M==DN_POINT)
        {
         if(Low[shift+i]<Low[shift])
            return(false);
         if(Low[shift-i]<=Low[shift])
            return(false);
        }
     }
   return(true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FastFractals(const double &High[],const double &Low[],int Prueba)
  {
   int shift;
   int limit=MathMin(Bars(Symbol(),PERIOD_CURRENT)-1,BackLimit+Prueba);
   int P=int((PeriodSeconds(Period())/60)*fractal_fast_factor);

   FastUpPts[0] = 0.0;
   FastUpPts[1] = 0.0;
   FastDnPts[0] = 0.0;
   FastDnPts[1] = 0.0;

   for(shift=limit; shift>1; shift--)
     {
      if(Fractal(UP_POINT,P,shift,High,Low)==true)
         FastUpPts[shift]=High[shift];
      else
         FastUpPts[shift]=0.0;

      if(Fractal(DN_POINT,P,shift,High,Low)==true)
         FastDnPts[shift]=Low[shift];
      else
         FastDnPts[shift]=0.0;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SlowFractals(const double &High[],const double &Low[],int Prueba)
  {
   int shift;
   int limit=MathMin(Bars(Symbol(),PERIOD_CURRENT)-1,BackLimit+Prueba);
   int P=int((PeriodSeconds(Period())/60)*fractal_slow_factor);

   SlowUpPts[0] = 0.0;
   SlowUpPts[1] = 0.0;
   SlowDnPts[0] = 0.0;
   SlowDnPts[1] = 0.0;

   for(shift=limit; shift>1; shift--)
     {
      if(Fractal(UP_POINT,P,shift,High,Low)==true)
         SlowUpPts[shift]=High[shift];
      else
         SlowUpPts[shift]=0.0;

      if(Fractal(DN_POINT,P,shift,High,Low)==true)
         SlowDnPts[shift]=Low[shift];
      else
         SlowDnPts[shift]=0.0;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool NewBar()
  {
   static datetime LastTime=0;
   if(iTime(Symbol(),Period(),0)+time_offset!=LastTime)
     {
      LastTime=iTime(Symbol(),Period(),0)+time_offset;
      return (true);
     }
   else
      return (false);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DeleteZones()
  {
//  Print("Entra ",TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES),"   ",Period()," ",Symbol());
   int len=5;
   int i=0;

   while(i<ObjectsTotal(CHART_ID,0,-1))
     {
      string objName=ObjectName(CHART_ID,i,0,-1);
      if(StringSubstr(objName,0,len)!="SSSR#")
        {
         i++;
         continue;
        }
      ObjectDelete(CHART_ID,objName);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string TimeFrameToString(int tf) //code by TRO
  {
   string tfs;

   switch(tf)
     {
      case PERIOD_M1:
         tfs="M1";
         break;
      case PERIOD_M5:
         tfs="M5";
         break;
      case PERIOD_M15:
         tfs="M15";
         break;
      case PERIOD_M30:
         tfs="M30";
         break;
      case PERIOD_H1:
         tfs="H1";
         break;
      case PERIOD_H4:
         tfs="H4";
         break;
      case PERIOD_D1:
         tfs="D1";
         break;
      case PERIOD_W1:
         tfs="W1";
         break;
      case PERIOD_MN1:
         tfs="MN";
     }

   return(tfs);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringRepeat(string str,int n=1)
  {
   string outstr="";
   for(int i=0; i<n; i++)
      outstr=outstr+str;
   return(outstr);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringRightPad(string str,int n=1,string str2=" ")
  {
   return(str + StringRepeat(str2,n-StringLen(str)));
  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void MarkPattern(const string name,const datetime Time,const double price,const string shortname,const int fontsize,const color patterncolor)
  {
   ObjectCreate(CHART_ID,name,OBJ_TEXT,0,Time,price);
   ObjectSetString(CHART_ID,name,OBJPROP_TEXT,shortname);
   ObjectSetString(CHART_ID,name,OBJPROP_FONT,"Times New Roman");
   ObjectSetInteger(CHART_ID,name,OBJPROP_FONTSIZE,fontsize);
   ObjectSetInteger(CHART_ID,name,OBJPROP_COLOR,patterncolor);
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
bool EvaluaHorario(int Apertura,int Cierre,datetime Tiempo)
  {
   MqlDateTime TiempoMql;
   TimeToStruct(Tiempo,TiempoMql);

   if(Apertura==Cierre)
      return true;

   if(Apertura>Cierre && (TiempoMql.hour>=Apertura || TiempoMql.hour<Cierre))
      return true;
   else
      if(Apertura<Cierre && TiempoMql.hour>=Apertura && TiempoMql.hour<Cierre)
         return true;

   return false;
  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluarPatron(bool isBuy,double const &Low[],double const&High[],double const&Open[],double const&Close[],int shift,int RatesTotal)
  {

   static double O[10],C[10],L[10],H[10];
   static double CL[10],BL[10],BLa[10],BL90[10],UW[10],LW[10],BodyHigh[10],BodyLow[10],BB[10];
   for(int i=0; i<10; i++)
     {
      BodyHigh[i]=0;
      BodyLow[i]=0;
     }

   /* if(RatesTotal-shift-1==20){
   Print(ValorRSI_1," ",ValorRSI_2," ",ValorRSI_3);
   }*/



   for(int j=0; j<1; j++)
     {
      CopyBuffer(Estocastico,0,RatesTotal-shift-1+j,4,KArray);
      ///// DEFINITIONESTOCHASTIC,0 <---- ESTO ES MAIN
      double ValorStocastico4=KArray[3];
      double ValorStocastico3=KArray[2];
      double ValorStocastico2=KArray[1];
      double ValorStocastico1=KArray[0];

      CopyBuffer(MA,0,RatesTotal-shift-1+j,6,MA_Array);

      CopyBuffer(MASLOW,0,RatesTotal-shift-1+j,6,MAS_Array);


      CopyBuffer(RSI,0,RatesTotal-shift-1,3,RSI_Array);
      ///// DEFINITIONESTOCHASTIC,0 <---- ESTO ES MAIN
      double ValorRSI_1=RSI_Array[0];
      double ValorRSI_2=RSI_Array[1];
      double ValorRSI_3=RSI_Array[2];


      for(int i=1; i<4; i++)
        {
         O[i]=Open[shift-i-j];
         H[i]=High[shift-i-j];
         L[i]=Low[shift-i-j];
         C[i]=Close[shift-i-j];

         if(O[i]>C[i])
           {
            BodyHigh[i]= O[i];
            BodyLow[i] = C[i];
           }
         else
           {
            BodyHigh[i]= C[i];
            BodyLow[i] = O[i];
           }

         CL[i]=High[shift-i-j]-Low[shift-i-j];
         BL[i] = Open[shift-i-j] - Close[shift-i-j];
         UW[i] = High[shift-i-j] - BodyHigh[i];
         LW[i] = BodyLow[i] - Low[shift-i-j];
         BLa[i]= MathAbs(BL[i]);
         //BL90[i]=BLa[i]*Candle_WickBody_Percent;
         BB[i]=(BLa[i]/_Point)/10;//TAMAÑO DEL VAOR ABSOUTO DEL TAMAÑO DEL CUERPO EN PIPS NORMALES
        }


      bool Filtro=false;

      bool Condicion_RSI=false;
      bool Condicion_EMas=false;
      bool Condicion_Estocastico=false;

      if(!Filtro)
         if(Filter_RSI)
           {
            if(isBuy)
              {
               //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2<H[1]))
               if((ValorRSI_3<30))
                  Filtro=true;
              }
            else
              {
               //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2>L[1]))
               if((ValorRSI_3>70))
                  Filtro=true;
              }
           }

      if(!Filtro)
         if(Filter_Estocastico)
           {
            if(isBuy)
              {
               //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2<H[1]))
               if((ValorStocastico3<20 || ValorStocastico4<20) && ValorStocastico2>=20)
                  Filtro=true;
              }
            else
              {
               //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2>L[1]))
               if((ValorStocastico3>80 || ValorStocastico4>80) && ValorStocastico2<=80)
                  Filtro=true;
              }
           }

      if(!Filtro)
         if(Filter_MA)
           {
            if(isBuy)
              {
               //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2<H[1]))
               if((((H[1]+Tolerancia_Puntos*Point()>MA_Array[1] && L[1]-Tolerancia_Puntos*Point()<MA_Array[1]) || (H[1]+Tolerancia_Puntos*Point()>MAS_Array[1] && L[1]-Tolerancia_Puntos*Point()<MAS_Array[1]))) //|| (H[1]+Tolerancia_Puntos*Point()>MAS_Array[1] && L[1]-Tolerancia_Puntos*Point()<MAS_Array[1]))) //&& C[1]>MAS_Array[1] && C[1]>MA_Array[1]
                  && MAS_Array[1]>MAS_Array[2] && MAS_Array[2]>MAS_Array[3] && MAS_Array[3]>MAS_Array[4]) //&& MA_Array[1]>MA_Array[2] && MA_Array[2]>MA_Array[3] && MA_Array[3]>MA_Array[4] )
                  Filtro=true;
              }
            else
              {
               //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2>L[1]))
               if((((H[1]+Tolerancia_Puntos*Point()>MA_Array[1] && L[1]-Tolerancia_Puntos*Point()<MA_Array[1]) || (H[1]+Tolerancia_Puntos*Point()>MAS_Array[1] && L[1]-Tolerancia_Puntos*Point()<MAS_Array[1])))  //|| (H[1]+Tolerancia_Puntos*Point()>MAS_Array[1] && L[1]-Tolerancia_Puntos*Point()<MAS_Array[1]))) // && C[1]<MAS_Array[1] && C[1]<MA_Array[1]
                  && MAS_Array[1]<MAS_Array[2] && MAS_Array[2]<MAS_Array[3] && MAS_Array[3]<MAS_Array[4]) //&& MA_Array[1]<MA_Array[2] && MA_Array[2]<MA_Array[3] && MA_Array[3]<MA_Array[4])
                  Filtro=true;
              }
           }


      /*
            if(isBuy)
              {
               if(shift==RatesTotal-4)
                 {
                  Print("VALOR ",Low[RatesTotal-4]);
                  Print(FilterMA);

                  Print(H[1]," ",L[1]," ",ValorMAS_2);
                 }
              }

      */

      if(Filtro)
        {

         // Check for Velas opuestas en Volumen
         if((O[1]>C[1] && O[2]<C[2])||(O[1]<C[1] && O[2]>C[2]))
           {
            if((BB[1]>(BB[2]/2))&& BB[2]>VALORVELASOPUESTAS)
              {

               /*if(shift==RatesTotal-3)
                  if(isBuy)
                     Comment(O[1]<C[1]," ",O[2]>C[2]," ", O[3]>C[3]);*/

               if(O[1]>C[1] && O[2]<C[2] && O[3]<C[3])
                 {

                  /*if(isBuy)
                     Comment("ENTRA");*/

                  if(!isBuy)
                    {
                     return true;
                    }
                 }

               else
                  if(O[1]<C[1] && O[2]>C[2] && O[3]>C[3])
                    {

                     /*  if(isBuy)
                         {
                          if(shift==RatesTotal-3)
                            {
                             Print("ENTRA");
                            }
                         }
                     */

                     if(isBuy)
                       {
                        return true;
                       }
                    }
              }
           }




         // Check for Velas opuestas en Volumen x2

         if(((O[1]>C[1] && O[2]>C[2] && O[3]<C[3]) || (O[1]<C[1] && O[2]<C[2] && O[3]>C[3])) && (BB[2]<(BB[3]/2)))
           {
            if((BB[1]+BB[2]>(BB[3]/2))&& BB[3]>VALORVELASOPUESTAS)
              {

               if(O[1]>C[1] && O[2]>C[2] && O[3]<C[3])
                 {
                  if(!isBuy)
                    {
                     return true;
                    }
                 }

               else
                  if(isBuy)
                    {
                     return true;
                    }
              }
           }

         // Check for Velas opuestas en Volumen x2 v2

         if(((O[1]>C[1] && O[2]<C[2] && O[3]<C[3]) || (O[1]<C[1] && O[2]>C[2] && O[3]>C[3])) && (BB[2]<(BB[1]*3/4))) ///&& (BB[2]<(BB[1]/2))
           {
            if((BB[3]+BB[2]>(BB[1]/2))&& BB[1]>VALORVELASOPUESTAS)
              {


               if(O[1]>C[1] && O[2]<C[2] && O[3]<C[3])
                 {
                  if(!isBuy)
                    {
                     return true;
                    }
                 }
               else
                  if(isBuy)
                    {
                     return true;
                    }
               //   }

              }
           }


         ////////////////////////////////////////////////////////////////////////////////////////////

         ////////////////////////////////////////////////////////////////////////////////////////////
         /// VELAS CON MARTILLO
         if(BB[3]>VolumenVelasOPCM && BB[1]>VolumenVelasOPCM && BB[2]<VolumenMartillo)
           {
            if((O[3]<C[3] && C[1]<O[1]) || (O[3]>C[3] && C[1]>O[1]))
              {
               //if(VelasOpuestasEnVolumenConMartillo == true)
               //{

               if(O[3]<C[3] && C[1]<O[1])
                 {
                  if(!isBuy)
                    {
                     return true;
                    }
                 }
               else
                  if(O[3]>C[3] && C[1]>O[1] && isBuy)
                    {
                     return true;
                    }
               //}

              }

           }
        }
     }
   return false;

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroSupRes(double Low,double High,bool isBuy)
  {

   if(!isBuy)
     {
      for(int i=0; i<zone_count; i++)
        {
         if(zone_type[i]==ZONE_RESIST)
            if(zone_hits[i]>Testeado)
               if(zone_hi[i]>High && zone_lo[i]-Tolerancia_Puntos_Flecha*Point()<High && Low<zone_lo[i])
                  return true;
        }
     }
   else
     {
      for(int i=0; i<zone_count; i++)
        {
         if(zone_type[i]==ZONE_SUPPORT)
            if(zone_hits[i]>Testeado)
               if(zone_hi[i]+Tolerancia_Puntos_Flecha*Point()>Low && zone_lo[i]<Low && High>zone_hi[i])
                  return true;
        }
     }
   /*



   input bool Ver_Sop_Res=true;
   input bool Filtro_Cercania=true;

      double High_=0;
      double Low_=0;
      bool Entra=false;

      if(!isBuy)
        {
         for(int i=0; i<zone_count; i++)
           {
            if(zone_type[i]==ZONE_RESIST)
               if(zone_hits[i]>Testeado && zone_strength[i]>ZONE_UNTESTED)
                  if(zone_hi[i]>High && zone_lo[i]-Tolerancia_Puntos_Flecha*Point()<High)
                    {
                     //if(zone_strength[i]>3)
                     //return true;

                     Entra=true;
                     High_=zone_hi[i];
                     Low_=zone_lo[i];
                     break;
                    }
           }

         if(!Filtro_Cercania)
           {
            if(Entra)
               return true;
           }
         else
           {
            if(Entra)
              {
               for(int i=0; i<zone_count; i++)
                 {
                  // if(zone_type[i]==ZONE_RESIST)
                  //  if(zone_hits[i]>Testeado && zone_strength[i]>ZONE_UNTESTED)
                  if(zone_hi[i]<Low_ && (MathAbs(zone_hi[i]-Low)/Point())<Puntos_Minimo_Cercania)
                     return false;
                 }
               return true;
              }
           }
        }
      else
        {
         for(int i=0; i<zone_count; i++)
           {
            if(zone_type[i]==ZONE_SUPPORT)
               if(zone_hits[i]>Testeado && zone_strength[i]>ZONE_UNTESTED)
                  if(zone_hi[i]+Tolerancia_Puntos_Flecha*Point()>Low && zone_lo[i]<Low)
                    {
                   // if(zone_strength[i]>3)
                     //return true;

                     Entra=true;
                     High_=zone_hi[i];
                     Low_=zone_lo[i];
                     break;
                    }
           }

         if(!Filtro_Cercania)
           {
            if(Entra)
               return true;
           }
         else
           {
            if(Entra)
              {
               for(int i=0; i<zone_count; i++)
                 {
                  // if(zone_type[i]==ZONE_RESIST)
                  //  if(zone_hits[i]>Testeado && zone_strength[i]>ZONE_UNTESTED)
                  if(zone_lo[i]>High_ && (MathAbs(zone_lo[i]-High)/Point())<Puntos_Minimo_Cercania)
                     return false;
                 }
               return true;
              }
           }

        }
   */



   return false;
  }
//+------------------------------------------------------------------+

/*
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroTraspaso(double const &close[],double const &high[],double const &low[],int shift,bool isBuy,uchar j,datetime const &time[],double &ImpulsoEnd,double &ImpulsoStart)
  {

   if(!Filtro_Traspaso_50)
     {
      return true;
     }
   else
     {
      if(isBuy)
        {
         if(Tipo_de_Datos==Close_Close)
           {
            for(int i=1; i<100 && shift-i-1>2 ; i++)
              {
               if(close[shift-i]>close[shift-i-1])
                 {
                  double Rango=MathAbs(close[shift-i]-close[shift]);
                  if(Rango/2.0>=MathAbs(close[shift]-close[shift]))
                    {
                     ImpulsoStart=close[shift];
                     ImpulsoEnd=close[shift-i];
                     return true;
                    }
                  else
                     return false;
                  break;
                 }
               if(i==99)
                  return false;
              }
           }
         else
           {
            for(int i=1; i<100 && shift-i-1>2 ; i++)
              {
               Print("i ",i);
               Print(high[shift-i]);
               if(high[shift-i]>high[shift-i-1])
                 {
                  double Rango=MathAbs(high[shift-i]-low[shift]);

                  if(Rango/2.0>=MathAbs(low[shift]-high[shift]))
                    {
                     ImpulsoStart=low[shift];
                     ImpulsoEnd=high[shift-i];
                     return true;
                    }
                  else
                     return false;
                  break;
                 }
               if(i==99)
                  return false;
              }
           }
        }
      else
        {
         if(Tipo_de_Datos==Close_Close)
           {
            for(int i=1; i<100 && shift-i-1>2 ; i++)
              {
               if(close[shift-i]<close[shift-i-1])
                 {
                  double Rango=MathAbs(close[shift-i]-close[shift]);
                  if(Rango/2.0>=MathAbs(close[shift]-close[shift]))
                    {
                     ImpulsoStart=close[shift];
                     ImpulsoEnd=close[shift-i];
                     return true;
                    }
                  else
                     return false;
                  break;
                 }
               if(i==99)
                  return false;
              }
           }
         else
           {
            for(int i=1; i<100&& shift-i-1>2 ; i++)
              {
               Print("i ",i);
               Print(low[shift-i]);
               Print(low[shift-i-1]);
               if(low[shift-i]<low[shift-i-1])
                 {
                  double Rango=MathAbs(low[shift-i]-high[shift]);
                  if(Rango/2.0>=MathAbs(high[shift]-low[shift]))
                    {
                     ImpulsoStart=high[shift];
                     ImpulsoEnd=low[shift-i];
                     return true;
                    }
                  else
                     return false;
                  break;
                 }
               Print("TERMINA");
               if(i==99)
                  return false;
              }
           }
        }

     }
   return false;
  }
//+------------------------------------------------------------------+
*/


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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool TrendCreate(const long            chart_ID=0,        // ID del gráfico
                 const string          name="TrendLine",  // Nombre de la línea
                 const int             sub_window=0,      // índice de subventana
                 datetime              time1=0,           // hora del primer punto
                 double                price1=0,          // precio del primer punto
                 datetime              time2=0,           // hora del segundo punto
                 double                price2=0,          // precio del segundo punto
                 const color           clr=clrRed,        // color de la línea
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de la línea
                 const int             width=1,           // grosor de la línea
                 const bool            back=false,        // al fondo
                 const bool            selection=true,    // seleccionar para mover
                 const bool            ray_left=false,    // continuación de la línea a la izquierda
                 const bool            ray_right=false,   // continuación de la línea a la derecha
                 const bool            hidden=true,       // ocultar en la lista de objetos
                 const long            z_order=0)         // prioridad para el clic del ratón
  {
//--- establecemos las coordenadas de los puntos de anclaje si todavía no han sido establecidas
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la línea de tendencia según las coordenadas establecidas
   if(!ObjectCreate(chart_ID,name,OBJ_TREND,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la línea de tendencia! Código del error = ",GetLastError());
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
//--- activamos (true) o desactivamos (false) el modo de continuación de la línea a la izquierda
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_LEFT,ray_left);
//--- activamos (true) o desactivamos (false) el modo de continuación de la línea a la derecha
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right);
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
bool Buscar(double Precio,bool isBuy,double &ArrayPrecios[])
  {

   ArraySetAsSeries(ArrayPrecios,false);
   ArrayResize(ArrayPrecios,0);

   if(!isBuy)
     {
      for(int i=0; i<zone_count; i++)
        {
         if(zone_hits[i]>=1)
            if(zone_hi[i]<Precio)
              {
               int Size=ArraySize(ArrayPrecios);
               ArrayResize(ArrayPrecios,Size+1);
               ArrayPrecios[Size]=zone_hi[i];
              }
        }
      ArraySort(ArrayPrecios);
      ArrayReverse(ArrayPrecios,0,WHOLE_ARRAY);
     }
   else
     {
      for(int i=0; i<zone_count; i++)
        {
         if(zone_hits[i]>=1)
            if(zone_lo[i]>Precio)
              {
               int Size=ArraySize(ArrayPrecios);
               ArrayResize(ArrayPrecios,Size+1);
               ArrayPrecios[Size]=zone_lo[i];
              }
        }
      ArraySort(ArrayPrecios);
     }

   if(ArraySize(ArrayPrecios)!=0)
      return true;

   return false;
  }
//+------------------------------------------------------------------+
