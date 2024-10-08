//+------------------------------------------------------------------+
//|                                       Supply And Demand V3.0.mq5 |
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
#property indicator_buffers 12
#property indicator_color1 clrRed
#property indicator_color2 clrRed
#property indicator_color3 clrDodgerBlue
#property indicator_color4 clrDodgerBlue
#property indicator_plots   12

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

#property indicator_label3  "SELLCONFIRMACION"
#property indicator_color3  clrNONE
#property indicator_type3   DRAW_ARROW
#property indicator_style3  STYLE_SOLID
#property indicator_width3  2

#property indicator_label4  "BUYCONFIRMACION"
#property indicator_color4  clrNONE
#property indicator_type4   DRAW_ARROW
#property indicator_style4  STYLE_SOLID
#property indicator_width4  2



int Estocastico;
int Momentun;

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
input int VelasEvaluadas=1000;
input int Testeado=0;
input bool TransparienciaDePatronesSinRSIoEST=true;
//input Modos STO_Price=Ambos;
//input int Velas_Confirmacion=6;
input ENUM_Horas  Hora_Inicio=_8am;
input ENUM_Horas Hora_Final=_8am;
//input double Nivel=0.10;
//double Tolerancia=100;
input UsarDatos Tipo_de_Datos=High_Low;// Tipo de Datos
input bool Filtro_Traspaso_50=false;
input int Tolerancia_Puntos_Flecha=30;
input string S0="-----------------------   Configuracion Estocastico ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int K_Periodo=5;
input int D_Periodo=3;
input int Slowing=3;
input ENUM_MA_METHOD Ma_Method_EST=MODE_SMA;
input string S11="-----------------------   Configuracion MA---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Filter_MA=true;
input int Tolerancia_Puntos=0;
input int Period_MA_SLOW=150;
input int Period_MA=50;
input int Shift_MA=PRICE_CLOSE;
input ENUM_APPLIED_PRICE APP_MA=PRICE_CLOSE;
input ENUM_MA_METHOD MODE_MA=MODE_SMA;
input string S1="-----------------------   Configuracion Momentun ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Momentun_Periodo=7;
input ENUM_APPLIED_PRICE Momentun_Applied_Price=PRICE_CLOSE;
input string S1_="-----------------------   Configuracion RSI---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Condicion_Signal_Contrarias=true;
input int RSI_Period=14;
input ENUM_APPLIED_PRICE APP_RSI=PRICE_CLOSE;

input string Settings_Alerts="***Settings_Alerts***";
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;

double ArrowSignalUP[];
double ArrowSignalDN[];
double ArrowSignalUP_Confirmacion[];
double ArrowSignalDN_Confirmacion[];

double Estocastico_Buffer[];
double Estocastico_Signal_Buffer[];
double Estocastico2_Buffer[];
double Estocastico2_Signal_Buffer[];
double Momentun_Buffer[];

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

double HigthBuy=0;
double LowSell=0;

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

////////////////////////ACA MODIFICAS EL TIEMPO LIMITADO PARA OTRA CUENTA QUE NO SEA TUYA/////////////////
/////////////////// AÑO.MES.DIA HORA:MINUTO///////////////////
datetime UNTIL=D'2100.12.31 00:00';
double CuentasCompartidas[1]= {51055646};
string NombrePersonaCompartida[1]= {"Luis Felipe Amasifuen"};

////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

///LUEGO LO COMPILAS, UNA VEZ COMPILADO LE MANDAS SOLO EL ARCHIVO .ex5 No mandes el archivo .mq5

////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

/////////////////////////TU CUENTA///////////////////////////////
////////////////////////////////////////////////////////////////////////
double Cuentas[2]= {2192242,2907205};
int password_status = -1;
////////////////////////////////////////////////////////////////////////


input int BackLimit=3000;

input string pus1="/////////////////////////////////////////////////";
input bool zone_show_weak=true;//Mostrar zonas débiles
input bool zone_show_untested = true;//Mostrar zonas retesteadas
input bool zone_show_turncoat = true;//Mostrar zonas rotas
input double zone_fuzzfactor=0.75;

string pus2="/////////////////////////////////////////////////";
input bool fractals_show=true;
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


input color color_support_weak     = clrAquamarine;//Color de la zona de soporte débil:
input color color_support_untested = clrPowderBlue;//Color de la zona de soporte no probado:
input color color_support_verified = clrSkyBlue;//Color de la zona de soporte verificado:
input color color_support_proven   = clrTurquoise;//Color de la zona de soporte probado:
input color color_support_turncoat = clrDarkOrange;//Color de la zona de soporte roto:
input color color_resist_weak      = clrOrchid;//Color de la zona de resistencia débil:
input color color_resist_untested  = clrMediumOrchid;//Color de la zona de resistencia no probada:
input color color_resist_verified  = clrCrimson;//Color de la zona de resistencia verificada:
input color color_resist_proven    = clrRed;// Color de la zona de resistencia probada:
input color color_resist_turncoat  = clrDarkOrange;//Color de la zona de resistencia rota:
input int SeparacionTexto=10;

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
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
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
   Momentun=iMomentum(Symbol(),PERIOD_CURRENT,Momentun_Periodo,Momentun_Applied_Price);
   MA=iMA(NULL,PERIOD_CURRENT,Period_MA,Shift_MA,MODE_MA,APP_MA);
   MASLOW=iMA(NULL,PERIOD_CURRENT,Period_MA_SLOW,Shift_MA,MODE_MA,APP_MA);
   RSI=iRSI(NULL,PERIOD_CURRENT,RSI_Period,APP_RSI);

   ArraySetAsSeries(Estocastico_Buffer,true);
   ArraySetAsSeries(Estocastico_Signal_Buffer,true);
   ArraySetAsSeries(Estocastico2_Buffer,true);
   ArraySetAsSeries(Estocastico2_Signal_Buffer,true);
   ArraySetAsSeries(Momentun_Buffer,true);

   IndicatorSetString(INDICATOR_SHORTNAME,"Indicador Estrellas EMA");
//172, 115
   SetIndexBuffer(0,ArrowSignalUP);
   SetIndexBuffer(1,ArrowSignalDN);

   SetIndexBuffer(2,ArrowSignalUP_Confirmacion);
   SetIndexBuffer(3,ArrowSignalDN_Confirmacion);

   SetIndexBuffer(4,SlowDnPts,INDICATOR_DATA);
   SetIndexBuffer(5,SlowUpPts,INDICATOR_DATA);
   SetIndexBuffer(6,FastDnPts,INDICATOR_DATA);
   SetIndexBuffer(7,FastUpPts,INDICATOR_DATA);

   SetIndexBuffer(8,ner_hi_zone_P1,INDICATOR_DATA);
   SetIndexBuffer(9,ner_hi_zone_P2,INDICATOR_DATA);
   SetIndexBuffer(10,ner_lo_zone_P1,INDICATOR_DATA);
   SetIndexBuffer(11,ner_lo_zone_P2,INDICATOR_DATA);

   PlotIndexSetInteger(0,PLOT_ARROW,234);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(1,PLOT_ARROW,233);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(2,PLOT_ARROW,234);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(3,PLOT_ARROW,233);
   PlotIndexSetDouble(3,PLOT_EMPTY_VALUE,EMPTY_VALUE);


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
      PlotIndexSetString(5,PLOT_LABEL,"FRACTAL");
      PlotIndexSetString(6,PLOT_LABEL,"FRACTAL");
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
   /*if(password_status==-1)
     {
      if(TimeCurrent()>UNTIL)
        {
         Comment("TIEMPO DE PRUEBA TERMINADO EA DESHABILITADO");
         return (rates_total);
        }
     }
   */


    if(zone_show_info==true)
     {
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
         int wbpc=int(ChartGetInteger(0,CHART_VISIBLE_BARS));
         int k=Period()*60+(20+StringLen(lbl));

         if(wbpc<80)
            adjust_hpos=int(Time[0]+k*4);
         else
            if(wbpc<125)
               adjust_hpos=int(Time[0]+k*8);
            else
               if(wbpc<250)
                  adjust_hpos=int(Time[0]+k*15);
               else
                  if(wbpc<480)
                     adjust_hpos=int(Time[0]+k*29);
                  else
                     if(wbpc<950)
                        adjust_hpos=int(Time[0]+k*58);
                     else
                        adjust_hpos=int(Time[0]+k*115);

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
         ObjectCreate(0,s,OBJ_TEXT,0,0,0);
         ObjectSetInteger(0,s,OBJPROP_TIME,0,TimeCurrent()+PeriodSeconds(Period())*SeparacionTexto);
         ObjectSetDouble(0,s,OBJPROP_PRICE,0,vpos);
         ObjectSetString(0,s,OBJPROP_TEXT,0,StringRightPad(lbl,36," "));
         ObjectSetInteger(0,s,OBJPROP_FONTSIZE,Text_size);
         ObjectSetString(0,s,OBJPROP_FONT,Text_font);
         ObjectSetInteger(0,s,OBJPROP_COLOR,Text_color);
        }
     }
     
   CheckAlerts(Time,Close);


   ArraySetAsSeries(Time,false);
   ArraySetAsSeries(High,false);
   ArraySetAsSeries(Low,false);
   ArraySetAsSeries(Close,false);
   ArraySetAsSeries(Open,false);

   static datetime prevTime=0;
   if(prevTime==Time[rates_total-1])
      return(rates_total);

   int Start=100;
   if(prev_calculated==0)
     {
      Start=100;
      ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalDN_Confirmacion,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalUP_Confirmacion,EMPTY_VALUE);
     }
   else
      Start=rates_total-1;

   for(int shift=Start; shift<rates_total; shift++)
     {

      if(shift<rates_total-VelasEvaluadas)
         continue;

      // Print(rates_total-shift-1);

      ArraySetAsSeries(Time,true);
      ArraySetAsSeries(High,true);
      ArraySetAsSeries(Low,true);
      ArraySetAsSeries(Close,true);

      int old_zone_count=zone_count;

      FastFractals(High,Low);
      SlowFractals(High,Low);
      if(shift==rates_total-1)
         DeleteZones();
      if(!FindZones(High,Close,Low,rates_total-shift-1))
        {
         if(shift==rates_total-1)
            if(zone_count<old_zone_count)
               DeleteOldGlobalVars(old_zone_count);
         continue;
        }
      if(shift==rates_total-1)
         DrawZones(Time,rates_total-shift-1);
      if(shift==rates_total-1)
         if(zone_count<old_zone_count)
            DeleteOldGlobalVars(old_zone_count);

      ArraySetAsSeries(Time,false);
      ArraySetAsSeries(High,false);
      ArraySetAsSeries(Low,false);
      ArraySetAsSeries(Close,false);
      ArraySetAsSeries(Open,false);


      ArrowSignalUP[shift]=EMPTY_VALUE;
      ArrowSignalDN[shift]=EMPTY_VALUE;
      ArrowSignalDN_Confirmacion[shift]=EMPTY_VALUE;
      ArrowSignalUP_Confirmacion[shift]=EMPTY_VALUE;

      if(!EvaluaHorario(Hora_Inicio,Hora_Final,Time[shift]))
         continue;


      int CumOffset=0;
      ArrayResize(Rates,10);
      int copied=CopyRates(Symbol(),PERIOD_CURRENT,rates_total-1-shift,8,Rates);

      CopyBuffer(Estocastico,0,rates_total-shift-1,3,Estocastico_Buffer);
      CopyBuffer(Estocastico,1,rates_total-shift-1,3,Estocastico_Signal_Buffer);
      CopyBuffer(Estocastico2,0,rates_total-shift-1,3,Estocastico2_Buffer);
      CopyBuffer(Estocastico2,1,rates_total-shift-1,3,Estocastico2_Signal_Buffer);
      CopyBuffer(Momentun,0,rates_total-shift-1,3,Momentun_Buffer);

      ResetLastError();

      double ImpulsoEnd=0,ImpulsoStart=0;

      if(EvaluarPatron(true,Low,High,Open,Close,shift,rates_total)) //&& (MathAbs(Momentun_Buffer[2]-100)>Nivel || MathAbs(Momentun_Buffer[1]-100)>Nivel) ) //&& iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+1)>iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+2) && (Nivel<MathAbs(100-Momentun_Buffer[1]) || Nivel<MathAbs(100-Momentun_Buffer[2])))//&& iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+1)>iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+2))
        {
         if(Close[shift-1]>(Close[shift-2]>Open[shift-2]?Close[shift-2]:Open[shift-2]))
           {
            if(FiltroSupRes(Low[shift-1],High[shift-1],true))
              {
               if(FiltroTraspaso(Close,High,Low,shift,true,0,Time,ImpulsoEnd,ImpulsoStart))
                 {
                  HigthBuy=High[shift-1];
                  //ShiftHigh=shift+Velas_Confirmacion;
                  ArrowSignalDN[shift-1] = Low[shift-1] - (Pointer_Offset*_Point);
                  if(shift==rates_total-1)
                    {
                     if(AlertPC)
                        Alert("Operacion Buy en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
                     if(AlertMovil)
                        SendNotification("Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
                     if(AlertMail)
                        SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
                    }
                 }
              }
           }
         else
            ShiftEvaluaBuy=shift+1;
        }

      if(EvaluarPatron(false,Low,High,Open,Close,shift,rates_total)) //&& (MathAbs(Momentun_Buffer[2]-100)>Nivel || MathAbs(Momentun_Buffer[1]-100)>Nivel) ) //&& iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+1)>iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+2)  && (Nivel<MathAbs(100-Momentun_Buffer[1]) || Nivel<MathAbs(100-Momentun_Buffer[2])))  //&& iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+1)>iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+2))
        {
         if(Close[shift-1]<(Close[shift-2]<Open[shift-2]?Close[shift-2]:Open[shift-2]))
           {
            if(FiltroSupRes(Low[shift-1],High[shift-1],false))
              {
               if(FiltroTraspaso(Close,High,Low,shift,false,0,Time,ImpulsoEnd,ImpulsoStart))
                 {
                  LowSell=Low[shift-1];
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
                 }
              }
           }
         else
            ShiftEvaluaSell=shift+1;

        }
     }


   prevTime=Time[rates_total-1];
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
bool FindZones(const double &High[],const double &Close[],const double &Low[],int Prueba)
  {

   int i,j=0,shift,bustcount=0,testcount=0;
   double hival,loval;
   bool turned=false,hasturned=false;

   double temp_hi[1000],temp_lo[1000];
   int    temp_start[1000],temp_hits[1000],temp_strength[1000],temp_count=0;
   bool   temp_turn[1000],temp_merge[1000];
   int merge1[1000],merge2[1000],merge_count=0;

// iterate through zones from oldest to youngest (ignore recent 5 bars),
// finding those that have survived through to the present___
   for(shift=MathMin(Bars(Symbol(),PERIOD_CURRENT)-1,BackLimit); shift>5+Prueba; shift--)
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

   if(j>=1000)
      return false;

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

      ObjectCreate(0,s,OBJ_RECTANGLE,0,0,0,0,0);
      ObjectSetInteger(0,s,OBJPROP_FILL,true);
      ObjectSetInteger(0,s,OBJPROP_TIME,0,Time[zone_start[i]]);
      ObjectSetInteger(0,s,OBJPROP_TIME,1,Time[Indice]);
      ObjectSetDouble(0,s,OBJPROP_PRICE,0,zone_hi[i]);
      ObjectSetDouble(0,s,OBJPROP_PRICE,1,zone_lo[i]);
      ObjectSetInteger(0,s,OBJPROP_BACK,zone_solid);
      ObjectSetInteger(0,s,OBJPROP_WIDTH,zone_linewidth);
      ObjectSetInteger(0,s,OBJPROP_STYLE,zone_style);

      if(zone_type[i]==ZONE_SUPPORT)
        {
         // support zone
         if(zone_strength[i]==ZONE_TURNCOAT)
            ObjectSetInteger(0,s,OBJPROP_COLOR,color_support_turncoat);
         else
            if(zone_strength[i]==ZONE_PROVEN)
               ObjectSetInteger(0,s,OBJPROP_COLOR,color_support_proven);
            else
               if(zone_strength[i]==ZONE_VERIFIED)
                  ObjectSetInteger(0,s,OBJPROP_COLOR,color_support_verified);
               else
                  if(zone_strength[i]==ZONE_UNTESTED)
                     ObjectSetInteger(0,s,OBJPROP_COLOR,color_support_untested);
                  else
                     ObjectSetInteger(0,s,OBJPROP_COLOR,color_support_weak);
        }
      else
        {
         // resistance zone
         if(zone_strength[i]==ZONE_TURNCOAT)
            ObjectSetInteger(0,s,OBJPROP_COLOR,color_resist_turncoat);
         else
            if(zone_strength[i]==ZONE_PROVEN)
               ObjectSetInteger(0,s,OBJPROP_COLOR,color_resist_proven);
            else
               if(zone_strength[i]==ZONE_VERIFIED)
                  ObjectSetInteger(0,s,OBJPROP_COLOR,color_resist_verified);
               else
                  if(zone_strength[i]==ZONE_UNTESTED)
                     ObjectSetInteger(0,s,OBJPROP_COLOR,color_resist_untested);
                  else
                     ObjectSetInteger(0,s,OBJPROP_COLOR,color_resist_weak);
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
   if(Period()>P)
      P=Period();

   P=int(P/Period()*2+MathCeil(P/Period()/2));

   if(shift<P)
      return(false);

   if(shift>Bars(Symbol(),PERIOD_CURRENT)-P)
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
void FastFractals(const double &High[],const double &Low[])
  {
   int shift;
   int limit=MathMin(Bars(Symbol(),PERIOD_CURRENT)-1,BackLimit);
   int P=int(Period()*fractal_fast_factor);

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
void SlowFractals(const double &High[],const double &Low[])
  {
   int shift;
   int limit=MathMin(Bars(Symbol(),PERIOD_CURRENT)-1,BackLimit);
   int P=int(Period()*fractal_slow_factor);

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
   int len=5;
   int i=0;

   while(i<ObjectsTotal(0,0,-1))
     {
      string objName=ObjectName(0,i,0,-1);
      if(StringSubstr(objName,0,len)!="SSSR#")
        {
         i++;
         continue;
        }
      ObjectDelete(0,objName);
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
   ObjectCreate(0,name,OBJ_TEXT,0,Time,price);
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


   for(int j=0; j<1; j++)
     {
      CopyBuffer(Estocastico,0,RatesTotal-shift-1+j,3,KArray);
      ///// DEFINITIONESTOCHASTIC,0 <---- ESTO ES MAIN
      double ValorStocastico3=KArray[2];
      double ValorStocastico2=KArray[1];
      double ValorStocastico1=KArray[0];

      CopyBuffer(MA,0,RatesTotal-shift-1+j,3,MA_Array);
      ///// DEFINITIONESTOCHASTIC,0 <---- ESTO ES MAIN
      double ValorMA_1=MA_Array[0];
      double ValorMA_2=MA_Array[1];
      double ValorMA_3=MA_Array[2];


      CopyBuffer(MASLOW,0,RatesTotal-shift-1+j,3,MAS_Array);
      ///// DEFINITIONESTOCHASTIC,0 <---- ESTO ES MAIN
      double ValorMAS_1=MAS_Array[0];
      double ValorMAS_2=MAS_Array[1];
      double ValorMAS_3=MAS_Array[2];



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

      bool FilterMA=true;



      if(isBuy)
        {
         //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2<H[1]))
         if(!((ValorRSI_3<30 && ValorRSI_2>=30) || (H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2) || (H[1]+Tolerancia_Puntos*Point()>ValorMAS_2 && L[1]-Tolerancia_Puntos*Point()<ValorMAS_2)))
            FilterMA=false;
        }
      else
        {
         //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2>L[1]))
         if(!((ValorRSI_3>70 && ValorRSI_2<=70) || (H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2) || (H[1]+Tolerancia_Puntos*Point()>ValorMAS_2 && L[1]-Tolerancia_Puntos*Point()<ValorMAS_2)))
            FilterMA=false;
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

      if(FilterMA)
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
                     if(ValorStocastico1>80 || ValorStocastico2>80)
                       {
                        return true;
                       }

                     if(TransparienciaDePatronesSinRSIoEST==true)
                       {
                        return true;
                       }
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
                        if(ValorStocastico1<20 || ValorStocastico2<20)
                          {
                           return true;
                          }

                        else
                           if(TransparienciaDePatronesSinRSIoEST==true)
                             {
                              return true;
                             }
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
                     if(ValorStocastico2>80 || ValorStocastico3>80)
                       {
                        return true;
                       }
                     else
                        if(TransparienciaDePatronesSinRSIoEST==true)
                          {
                           return true;
                          }
                    }
                 }

               else
                  if(isBuy)
                    {
                     if(ValorStocastico2<20 || ValorStocastico3<20)
                       {
                        return true;
                       }
                     else
                        if(TransparienciaDePatronesSinRSIoEST==true)
                          {
                           return true;
                          }
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
                     if(ValorStocastico2>80 || ValorStocastico3>80)
                       {
                        return true;
                       }
                     else
                        if(TransparienciaDePatronesSinRSIoEST==true)
                          {
                           return true;
                          }
                    }
                 }
               else
                  if(isBuy)
                    {
                     if(ValorStocastico2<20 || ValorStocastico3<20)
                       {
                        return true;
                       }
                     else
                        if(TransparienciaDePatronesSinRSIoEST==true)
                          {
                           return true;
                          }
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
                     if(ValorStocastico2>80 || ValorStocastico3>80)
                       {
                        return true;
                       }
                     else
                        if(TransparienciaDePatronesSinRSIoEST==true)
                          {
                           return true;
                          }
                    }
                 }
               else
                  if(O[3]>C[3] && C[1]>O[1] && isBuy)
                    {
                     if(ValorStocastico2<20 || ValorStocastico3<20)
                       {
                        return true;
                       }
                     else
                        if(TransparienciaDePatronesSinRSIoEST==true)
                          {
                           return true;
                          }
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
            if(zone_hits[i]>Testeado && zone_strength[i]>ZONE_UNTESTED)
               if(zone_hi[i]>High && zone_lo[i]-Tolerancia_Puntos_Flecha*Point()<High)
                  return true;
        }
     }
   else
     {
      for(int i=0; i<zone_count; i++)
        {
         if(zone_type[i]==ZONE_SUPPORT)
            if(zone_hits[i]>Testeado && zone_strength[i]>ZONE_UNTESTED)
               if(zone_hi[i]+Tolerancia_Puntos_Flecha*Point()>Low && zone_lo[i]<Low)
                  return true;
        }
     }

   return false;
  }
//+------------------------------------------------------------------+


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
