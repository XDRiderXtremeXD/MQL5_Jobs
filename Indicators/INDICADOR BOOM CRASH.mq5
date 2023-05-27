//+------------------------------------------------------------------+
//|                                         INDICADOR CRASH BOOM.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 8
#property indicator_plots   8

#property indicator_label1  "SELL SEÑAL"
#property indicator_color1  clrRed
#property indicator_type1   DRAW_NONE
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2  "BUY SEÑAL"
#property indicator_color2  clrGreen
#property indicator_type2   DRAW_NONE
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

#property indicator_label3   "EMA-FAST"
#property indicator_color3  clrAqua
#property indicator_type3   DRAW_LINE
#property indicator_style3  STYLE_SOLID
#property indicator_width3  1

#property indicator_label4   "EMA-SLOW"
#property indicator_color4  clrAqua
#property indicator_type4   DRAW_LINE
#property indicator_style4  STYLE_SOLID
#property indicator_width4  1

#property indicator_label5  "SELL PRESEÑAL"
#property indicator_color5  clrRed
#property indicator_type5   DRAW_NONE
#property indicator_style5  STYLE_SOLID
#property indicator_width5  2

#property indicator_label6  "BUY PRESEÑAL"
#property indicator_color6  clrGreen
#property indicator_type6   DRAW_NONE
#property indicator_style6  STYLE_SOLID
#property indicator_width6  2

#property indicator_label7   "EMA-TOQUE 1"
#property indicator_color7  clrMagenta
#property indicator_type7   DRAW_LINE
#property indicator_style7  STYLE_SOLID
#property indicator_width7  1

#property indicator_label8   "EMA-TOQUE 2"
#property indicator_color8  clrMagenta
#property indicator_type8   DRAW_LINE
#property indicator_style8  STYLE_SOLID
#property indicator_width8  1




enum esquina
  {
   Arriba_Derecha=0,
   Arriba_Izquierda=1,
   Abajo_Derecha=2,
  };

enum MODO
  {
   UP=0,
   DOWN=1,
  };

MODO Modo_Operacion=UP; // Direccion Herramienta Financiera
input string Ind0="-------------------- CONFIGURACION SEÑALES ------------------------";//----------------------------------------
input bool Signal_Pattern_Arrow=true; // Cronex
input bool Cruce_de_Emas=true; //Cruce de Emas
input bool Sincronizacion=true;// Sincronizacion
input bool ToquesEmas_F=true; //  Toques Emas en Favor
bool ToquesEmas_C=false; // Toques Emas en Contra
input bool CruceWadath=true; // Cruce Volumen
input string Ind0__="-------------------- CONFIGURACION FLECHAS Y TEXTO ------------------------";//----------------------------------------
input int Size_Flecha=2;
input int ExpacioTexto=2000;
input int Size_Texto=8;
input int EspacioFlecha=1000;
input color ColorTexto=clrAqua;
input color ColorFlechasUP=clrGreen;
input color ColorFlechasDN=clrRed;
input string Ind0_="-------------------- CONFIGURACION ALERTAS ------------------------";//----------------------------------------
input bool AlertaPC=true;
input bool AlertaMovil=true;
input bool AlertaMail=true;
input string SonidoPre="alert2.wav";
input string SonidoSe="alert.wav";
//input bool PatronN=true;
//input string Ind01="-------------------- CONFIGURACION Patron N ------------------------";//----------------------------------------
//input int SizeVelaSpike=10;
input string Ind1="-------------------- CRONEX ------------------------";//----------------------------------------
input string Nombre_Indicador_1="PROYECTO LUIS/cronex_MACD_Trend Impulse (2)";
input int MACD_CRONEX=34;
input int CRONEX=9;
input string Ind2="-------------------- ARROWS ------------------------";//----------------------------------------
input string Nombre_Indicador_2="PROYECTO LUIS/Boom Crash - RSI-Strike - 2021 MT5 (1)";
input int tres_=2;//3
input int RSI_Period2=4;
input ENUM_APPLIED_PRICE RSI_Price1=PRICE_CLOSE;
input ENUM_APPLIED_PRICE RSI_Precie=PRICE_CLOSE;
input int cuatro_=3;//4
input int RSI_Period4=6;
input ENUM_APPLIED_PRICE RSI_Price3=PRICE_CLOSE;
input ENUM_APPLIED_PRICE RSI_Price4=PRICE_CLOSE;
input int cinco=4;//5
input int RSI_Period5=8;
input ENUM_APPLIED_PRICE RSI_Price5=PRICE_CLOSE;
input ENUM_APPLIED_PRICE RSI_Price6=PRICE_CLOSE;
input int nueve_=5;//9
input int RSI_Period8=10;
input ENUM_APPLIED_PRICE RSI_Price7=PRICE_CLOSE;
input ENUM_APPLIED_PRICE RSI_Price8=PRICE_CLOSE;
input string Ind3="-------------------- TREND TMA ------------------------";//----------------------------------------
input string Nombre_Indicador_3="PROYECTO LUIS/WT_SuperT-MA_v4.7(1) (1)";
input esquina EsquinaPublicidad=Arriba_Derecha;
input string S1="-----------------------------------------------";//--------------------------------
input ENUM_TIMEFRAMES TimeFrame=PERIOD_CURRENT;
input ENUM_MA_METHOD TipoMA=MODE_SMA;
input ENUM_APPLIED_PRICE Tipo_Precio=PRICE_CLOSE;// Tipo precio (sólo se tiene en cuenta cuando tipoMA<>TMA)
input int PeriodosMA=20;
input string S2="-------------------------------------------------------";//--------------------------------
input int PeriodosATR=110;
input double Multiplicador=2.6;
input string S3="-------------------------------------------------------";//--------------------------------
input int MaxVelasHistorico=1000;
input string S6="-----------------------   CONFIGURACION MEDIAS MOVILES (Cruce Emas)  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool VisualizarEma_Fast=true;
input bool VisualizarEma_Slow=true;
input int Fast_Periodo=14;
input int Fast_Shift=0;
input ENUM_MA_METHOD Fast_Ma_Method=MODE_EMA;
input ENUM_APPLIED_PRICE Fast_AppliedPrice=PRICE_CLOSE;
input int Slow_Periodo=50;
input int Slow_Shift=0;
input ENUM_MA_METHOD Slow_Ma_Method=MODE_EMA;
input ENUM_APPLIED_PRICE Slow_AppliedPrice=PRICE_CLOSE;
input string S6_="-----------------------   CONFIGURACION MEDIAS MOVILES (Toque Ema)  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int TraspasoMaximo=5000; //Traspaso Maximo en Puntos
input int MultiplicadorSizeSpikeMinimo=16;//Multiplicador Tamaño Minimo Spike
input int MultiplicadorSizeSpikeMinimoRompimiento=10; // Multiplicador Tamaño Minimo Rompimiento Spike
input bool VisualizarEma_Toque1=true; // Visualizar Ema Fast
input bool VisualizarEma_Toque2=true; // Visualizar Ema Slow
input int Periodo_Toque1=100; // Periodo Ema Fast
input int Shift_Toque1=0;  // Shift Ema Fast
input ENUM_MA_METHOD Ma_Method_Toque1=MODE_EMA; // Ma Methodo Fast
input ENUM_APPLIED_PRICE AppliedPrice_Toque1=PRICE_CLOSE; // Applied Price Fast
input int Periodo_Toque2=200; // Periodo Ema Slow
input int Shift_Toque2=0; // Shift Ema Slow
input ENUM_MA_METHOD Ma_Method_Toque2=MODE_EMA; // Ma Methodo Slow
input ENUM_APPLIED_PRICE AppliedPrice_Toque2=PRICE_CLOSE; // Applied Price Slow
input string S7="-----------------------   VOLUMEN M5  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input string Nombre_Indicador_4="waddah_attar_explosion";
input int Fast_MA = 20;       // Period of the fast MACD moving average
input int Slow_MA = 40;       // Period of the slow MACD moving average
input int BBPeriod=20;        // Bollinger period
input double BBDeviation=2.0; // Number of Bollinger deviations
input int  Sensetive=150;
input int  DeadZonePip=400;
input int  ExplosionPower=15;
input int  TrendPower=150;
input bool AlertWindow=false;
input int  AlertCount=2;
input bool AlertLong=false;
input bool AlertShort=false;
input bool AlertExitLong=false;
input bool AlertExitShort=false;
input double IndicatorLevel=20;
/*
input string S8="------------------ CONFIGURACION PEACE-----------------";///------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input string Nombre_Indicador_4="Peace";
input bool Filtro_Trend_1=false;
input string S9="------------------ CONFIGURACION VULTURE-----------------";///------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input string Nombre_Indicador_5="PROYECTO LUIS/Vulture S-K (1)";
input int Averaging_Period=14;
input int Number_Length=7;
input int Smothing_Factor=20;
input int Shift_Indicator=0;// The Shift Indicator int the horizontal bars*/

bool Tramo200C=false;

string label_name="mainwindow_label";

int window=-1;
input bool Show_Alert=true; //ACTIVAR ALERTA

bool VelasOpuestasEnVolumen=true;
bool VelasOpuestasEnVolumen_Alert=true;

//Change it to true if you broker uses extra digit in quotes
bool UseExtraDigit=false;

int Text_VelasOpuestas=10;

string Comentario=" ";

//input bool VelasRSI=true;
//input bool VelasRSI_Alert=false;

//---- buffers
double ArrowSignalUP[];
double ArrowSignalDN[];

double ArrowSignalUP_Presignal[];
double ArrowSignalDN_Presignal[];

string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
int VALORVELASOPUESTAS=0;

double Candle_WickBody_Percent=0;

//color COLORVO=Aqua;

int paso=0;
bool CUENTA=false;
bool ALERTAACTIVADA=false;
datetime TiempoPrevio=0;
int MAXIMO=0;
int vez=1;

int PeriodoMaximo=0;

bool CRUCE=false;

int Cronex_Handle,Arrows_Handle,Trend_Handle,EMA_Fast,EMA_Slow,Waddah;//,Peace_Handle,Vultur_Handle;
int EMA_Toque1,EMA_Toque2;
double Trend_Color[];
double RSI_Strike_1_Buy[],RSI_Strike_1_Sell[],RSI_Strike_2_Buy[],RSI_Strike_2_Sell[],RSI_Strike_3_Buy[],RSI_Strike_3_Sell[],RSI_Strike_4_Buy[],RSI_Strike_4_Sell[];
double MACD[],MACD_SIGNAL[],SLOW_EMA[],FAST_EMA[];
double Waddah_Color[];
double Waddah_Ema[];
double Waddah_MACD[];
double EMA_FAST[],EMA_SLOW[];
double EMA_TOQUE1[],EMA_TOQUE2[];
//double PEACE_BUY[],PEACE_SELL[];
//double VULTURE[],VULTURE_SIGNAL[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(StringFind(Symbol(),"Crash",0)!=-1)
      Modo_Operacion=UP;
   else
      if(StringFind(Symbol(),"Boom",0)!=-1)
         Modo_Operacion=DOWN;
      else
        {
         Alert("Simbolo no es Crash ni boom");
         return INIT_FAILED;
        }

   Cronex_Handle=iCustom(NULL,PERIOD_CURRENT,Nombre_Indicador_1,MACD_CRONEX,CRONEX);
   Arrows_Handle=iCustom(NULL,PERIOD_CURRENT,Nombre_Indicador_2,tres_,RSI_Period2,RSI_Price1,RSI_Precie,cuatro_,RSI_Period4,RSI_Price3,RSI_Price4,cinco,RSI_Period5,RSI_Price5,RSI_Price6,nueve_,RSI_Period8,RSI_Price7,RSI_Price8);
   Trend_Handle=iCustom(NULL,PERIOD_CURRENT,Nombre_Indicador_3,0,EsquinaPublicidad, S1,TimeFrame,TipoMA,Tipo_Precio,PeriodosMA,S2,false,PeriodosATR,Multiplicador,S3,MaxVelasHistorico);
//Vultur_Handle=iCustom(NULL,PERIOD_CURRENT,Nombre_Indicador_5,Averaging_Period,Number_Length,Smothing_Factor,Shift_Indicator);
//Peace_Handle=iCustom(Symbol(),PERIOD_CURRENT,Nombre_Indicador_4,false,false,false," ",false,clrNONE,clrNONE,16,"Impact",10,20);

   EMA_Fast=iMA(NULL,PERIOD_CURRENT,Fast_Periodo,Fast_Shift,Fast_Ma_Method,Fast_AppliedPrice);
   EMA_Slow=iMA(NULL,PERIOD_CURRENT,Slow_Periodo,Slow_Shift,Slow_Ma_Method,Slow_AppliedPrice);

   EMA_Toque1=iMA(NULL,PERIOD_CURRENT,Periodo_Toque1,Shift_Toque1,Ma_Method_Toque1,AppliedPrice_Toque1);
   EMA_Toque2=iMA(NULL,PERIOD_CURRENT,Periodo_Toque2,Shift_Toque2,Ma_Method_Toque2,AppliedPrice_Toque2);
   /*if(Vultur_Handle==INVALID_HANDLE)
     {
      Alert("Verifique los parametros del  VULTURE");
      return INIT_FAILED;
     }

   if(Peace_Handle==INVALID_HANDLE)
     {
      Alert("Verifique los parametros del  PEACE");
      return INIT_FAILED;
     }*/

   Waddah=iCustom(Symbol(),PERIOD_CURRENT,Nombre_Indicador_4,Fast_MA,Slow_MA,BBPeriod,BBDeviation,Sensetive,DeadZonePip,ExplosionPower,TrendPower,AlertWindow,AlertCount,AlertLong,AlertShort,AlertExitLong,AlertExitShort,IndicatorLevel);

   if(Waddah==INVALID_HANDLE)
     {
      return(INIT_FAILED);
     }

   if(Cronex_Handle==INVALID_HANDLE)
     {
      Print("Verifique los parametros del Cronex  ERROR");
      return(INIT_FAILED);
     }

   if(Arrows_Handle==INVALID_HANDLE)
     {
      Print("Verifique los parametros del Boom Crash - RSI-Strike - 2021 MT5 ERROR");
      return(INIT_FAILED);
     }

   if(Trend_Handle==INVALID_HANDLE)
     {
      Print("Verifique los parametros del WT_TMA  ERROR");
      return(INIT_FAILED);
     }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   IndicatorSetString(INDICATOR_SHORTNAME,"PatronesVolumen");
//172, 115


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   SetIndexBuffer(0,ArrowSignalUP,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalDN,INDICATOR_DATA);
   SetIndexBuffer(2,EMA_FAST,INDICATOR_DATA);
   SetIndexBuffer(3,EMA_SLOW,INDICATOR_DATA);
   SetIndexBuffer(4,ArrowSignalUP_Presignal,INDICATOR_DATA);
   SetIndexBuffer(5,ArrowSignalDN_Presignal,INDICATOR_DATA);
   SetIndexBuffer(6,EMA_TOQUE1,INDICATOR_DATA);
   SetIndexBuffer(7,EMA_TOQUE2,INDICATOR_DATA);

//PlotIndexSetInteger(1,PLOT_ARROW,221);
// PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);
//PlotIndexSetInteger(0,PLOT_ARROW,222);
// PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
//PlotIndexSetInteger(4,PLOT_ARROW,164);
//PlotIndexSetDouble(4,PLOT_EMPTY_VALUE,EMPTY_VALUE);
//PlotIndexSetInteger(5,PLOT_ARROW,164);
//PlotIndexSetDouble(5,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   if(!VisualizarEma_Fast || !Cruce_de_Emas)
      PlotIndexSetInteger(2,PLOT_DRAW_TYPE,DRAW_NONE);
   else
      PlotIndexSetInteger(2,PLOT_DRAW_TYPE,DRAW_LINE);
   if(!VisualizarEma_Slow  || !Cruce_de_Emas)
      PlotIndexSetInteger(3,PLOT_DRAW_TYPE,DRAW_NONE);
   else
      PlotIndexSetInteger(3,PLOT_DRAW_TYPE,DRAW_LINE);

   if(!VisualizarEma_Toque1 || (!ToquesEmas_C && !ToquesEmas_F))
      PlotIndexSetInteger(6,PLOT_DRAW_TYPE,DRAW_NONE);
   else
      PlotIndexSetInteger(6,PLOT_DRAW_TYPE,DRAW_LINE);
   if(!VisualizarEma_Toque2 || (!ToquesEmas_C && !ToquesEmas_F))
      PlotIndexSetInteger(7,PLOT_DRAW_TYPE,DRAW_NONE);
   else
      PlotIndexSetInteger(7,PLOT_DRAW_TYPE,DRAW_LINE);


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   ArraySetAsSeries(ArrowSignalDN,false);
   ArraySetAsSeries(ArrowSignalUP,false);
   ArraySetAsSeries(ArrowSignalDN_Presignal,false);
   ArraySetAsSeries(ArrowSignalUP_Presignal,false);

   ArraySetAsSeries(Trend_Color,true);
   ArraySetAsSeries(RSI_Strike_1_Buy,true);
   ArraySetAsSeries(RSI_Strike_1_Sell,true);
   ArraySetAsSeries(RSI_Strike_2_Buy,true);
   ArraySetAsSeries(RSI_Strike_2_Sell,true);
   ArraySetAsSeries(RSI_Strike_3_Buy,true);
   ArraySetAsSeries(RSI_Strike_3_Sell,true);
   ArraySetAsSeries(RSI_Strike_4_Buy,true);
   ArraySetAsSeries(RSI_Strike_4_Sell,true);
   ArraySetAsSeries(MACD,true);
   ArraySetAsSeries(MACD_SIGNAL,true);
   ArraySetAsSeries(SLOW_EMA,true);
   ArraySetAsSeries(FAST_EMA,true);
   ArraySetAsSeries(Waddah_Color,true);
   ArraySetAsSeries(EMA_TOQUE1,false);
   ArraySetAsSeries(EMA_TOQUE2,false);
   ArraySetAsSeries(Waddah_Ema,true);
   ArraySetAsSeries(Waddah_MACD,true);
//ArraySetAsSeries(PEACE_BUY,true);
//ArraySetAsSeries(PEACE_SELL,true);
//ArraySetAsSeries(VULTURE,true);
//ArraySetAsSeries(VULTURE_SIGNAL,true);

   ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);

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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   if(UseExtraDigit)
     {
      Pointer_Offset*=10;
      High_Offset*=10;
      Offset_Subida_VelaOpuesta*=10;
      Offset_Caida_VelaOpuesta*=10;
      IncOffset*=10;
      VALORVELASOPUESTAS=50;
     }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   return (INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,0,OBJ_TEXT);
   Comment("");
   if(ObjectFind(0,label_name)>=0)
      ObjectDelete(0,label_name);
   ObjectsDeleteAll(0,"Arrow Expert Crash Boom",0,OBJ_ARROW);
   ObjectsDeleteAll(0,"Patron 2021S",0,OBJ_TEXT);


  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
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

   if(BarsCalculated(EMA_Fast)<rates_total)
      return(rates_total);
   if(BarsCalculated(EMA_Slow)<rates_total)
      return(rates_total);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(EMA_Fast,0,0,to_copy,EMA_SLOW)<=0)
      return(rates_total);
   if(CopyBuffer(EMA_Slow,0,0,to_copy,EMA_FAST)<=0)
      return(rates_total);
   if(CopyBuffer(EMA_Toque1,0,0,to_copy,EMA_TOQUE1)<=0)
      return(rates_total);
   if(CopyBuffer(EMA_Toque2,0,0,to_copy,EMA_TOQUE2)<=0)
      return(rates_total);

   static double Range,AvgRange;
   static datetime prevtime=0;
   static int counter,setalert;
   static int shift;
   string pattern;
   int setPattern=0;
   int alert=0;
   static double O[10],C[10],L[10],H[10];
   static double CL[10],BL[10],BLa[10],BL90[10],UW[10],LW[10],BodyHigh[10],BodyLow[10],BB[10];
   for(int i=0; i<10; i++)
     {
      BodyHigh[i]=0;
      BodyLow[i]=0;
     }
   int CumOffset;
   int CumOffset2=0;

   if(prevtime!=Time[rates_total-1])
     {
      if(ObjectFind(0,label_name)>=0)
         ObjectDelete(0,label_name);
      CRUCE=false;
     }

   if(rates_total<50)
      return rates_total;

   if(prevtime==Time[rates_total-1] && ALERTAACTIVADA==true)
     {
      if(ObjectFind(0,label_name)<0)
        {
         Print("Generating a label");
         ObjectCreate(0,label_name,OBJ_LABEL,0,0,0);
         ObjectSetInteger(0,label_name,OBJPROP_XDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_YDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_COLOR,ColorTexto);
         ObjectSetString(0,label_name,OBJPROP_TEXT,"Pat "+Comentario);
         ObjectSetString(0,label_name,OBJPROP_FONT,"Comic Sans");
         ObjectSetInteger(0,label_name,OBJPROP_FONTSIZE,10);
         ObjectSetInteger(0,label_name,OBJPROP_SELECTABLE,false);
         ChartRedraw(0);
        }
      //return(rates_total);
     }

//if(ObjectFind(0,label_name)>=0)
// ObjectDelete(0,label_name);
   prevtime=Time[rates_total-1];

   int START=0;
   if(prev_calculated!=0)
     {
      START=rates_total-1;
     }
   else
     {
      START=51;
      ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
     }

   for(shift=START; shift<rates_total; shift++)
     {
      CumOffset= 0;
      setalert = 0;
      counter=shift;
      Range=0;
      AvgRange=0;
      ArrowSignalUP[shift]=EMPTY_VALUE;
      ArrowSignalDN[shift]=EMPTY_VALUE;

      for(int i=0; i<10; i++)
        {

         O[i]=Open[shift-i];
         H[i]=High[shift-i];
         L[i]=Low[shift-i];
         C[i]=Close[shift-i];

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

         CL[i]=High[shift-i]-Low[shift-i];
         BL[i] = Open[shift-i] - Close[shift-i];
         UW[i] = High[shift-i] - BodyHigh[i];
         LW[i] = BodyLow[i] - Low[shift-i];
         BLa[i]= MathAbs(BL[i]);
         BL90[i]=BLa[i]*Candle_WickBody_Percent;
         BB[i]=(BLa[i]/_Point)/10;//TAMAÑO DEL VAOR ABSOUTO DEL TAMAÑO DEL CUERPO EN PIPS NORMALES
        }

      CopyBuffer(Trend_Handle,3,rates_total-1-shift,3,Trend_Color);
      CopyBuffer(Cronex_Handle,0,rates_total-1-shift,3,MACD);
      CopyBuffer(Cronex_Handle,1,rates_total-1-shift,3,MACD_SIGNAL);
      CopyBuffer(Arrows_Handle,0,rates_total-1-shift,50,RSI_Strike_1_Buy);
      CopyBuffer(Arrows_Handle,1,rates_total-1-shift,50,RSI_Strike_1_Sell);
      CopyBuffer(Arrows_Handle,2,rates_total-1-shift,50,RSI_Strike_2_Buy);
      CopyBuffer(Arrows_Handle,3,rates_total-1-shift,50,RSI_Strike_2_Sell);
      CopyBuffer(Arrows_Handle,4,rates_total-1-shift,50,RSI_Strike_3_Buy);
      CopyBuffer(Arrows_Handle,5,rates_total-1-shift,50,RSI_Strike_3_Sell);
      CopyBuffer(Arrows_Handle,6,rates_total-1-shift,50,RSI_Strike_4_Buy);
      CopyBuffer(Arrows_Handle,7,rates_total-1-shift,50,RSI_Strike_4_Sell);
      CopyBuffer(EMA_Fast,0,rates_total-1-shift,6,FAST_EMA);
      CopyBuffer(EMA_Slow,0,rates_total-1-shift,6,SLOW_EMA);
      CopyBuffer(Waddah,1,rates_total-1-shift,3,Waddah_Color);
      CopyBuffer(Waddah,2,rates_total-1-shift,3,Waddah_Ema);
      CopyBuffer(Waddah,0,rates_total-1-shift,3,Waddah_MACD);
      //CopyBuffer(Peace_Handle,0,rates_total-1-shift,3,PEACE_BUY);
      //CopyBuffer(Peace_Handle,1,rates_total-1-shift,3,PEACE_SELL);
      //CopyBuffer(Vultur_Handle,0,rates_total-1-shift,3,VULTURE);
      //CopyBuffer(Vultur_Handle,1,rates_total-1-shift,3,VULTURE_SIGNAL);

      bool Condicion=false;
      ALERTAACTIVADA=false;

      Comentario=" ";
      bool AlertaPre=false;
      bool AlertaNormal=false;
      if(rates_total-1==shift)
        {
         if(ObjectFind(0,"Arrow Expert Crash Boom P B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))==0)
            ObjectDelete(0,"Arrow Expert Crash Boom P B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES));
         if(ObjectFind(0,"Arrow Expert Crash Boom P S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))==0)
            ObjectDelete(0,"Arrow Expert Crash Boom P S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES));
         if(ObjectFind(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))==0)
            ObjectDelete(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES));
         if(ObjectFind(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))==0)
            ObjectDelete(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES));
        }


      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      if(RSI_Strike_1_Buy[0]==0 && RSI_Strike_2_Buy[0]==0 && RSI_Strike_3_Buy[0]!=0 && RSI_Strike_4_Buy[0]==0 && MACD[0]>MACD_SIGNAL[0] && Trend_Color[0]==1 && Signal_Pattern_Arrow && Modo_Operacion==UP)
        {
         bool Entra=true;
         for(int i=1; i<50 && shift-i>0; i++)
           {
            if(Close[shift-i]<Open[shift-i])
               break;

            if(RSI_Strike_4_Buy[i]!=0)
              {
               Entra=false;
               break;
              }
           }


         if(Entra==true)
           {
            AlertaPre=true;
            Condicion=true;
            CumOffset = CumOffset+IncOffset;
            ArrowSignalDN_Presignal[shift] = Low[shift] - (Pointer_Offset*_Point);
            Comentario=ComentarioTexto(Comentario,"PS Cronex");


            if(ObjectFind(0,"Arrow Expert Crash Boom P B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
               ArrowCreate(0,"Arrow Expert Crash Boom P B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],Low[shift]-EspacioFlecha*Point(),164,ANCHOR_TOP,ColorFlechasUP,0,Size_Flecha,false,false,true,0);


            if(ObjectFind(0,GetName("Patron 2021S Cronex P",Time[shift]))!=0)
               MarkPattern(GetName("Patron 2021S Cronex P",Time[shift]), Time[shift], Low[shift] -EspacioFlecha*Point()-ExpacioTexto*Point(), "CRX-P", Size_Texto, ColorTexto,true);
            //ArrowCreate(0,"Arrow Expert Crash Boom"+TimeToString(Time[1],TIME_DATE|TIME_MINUTES),CharIndicator,Time[0],Momentun,221,ANCHOR_TOP,ColorFlechasTrue,0,Size_Flecha,false,false,true,0);
           }
        }
      if(RSI_Strike_1_Buy[0]==0 && RSI_Strike_2_Buy[0]==0  && RSI_Strike_3_Buy[0]==0 && RSI_Strike_4_Buy[0]!=0 && RSI_Strike_3_Buy[1]!=0 && MACD[0]>MACD_SIGNAL[0] && Trend_Color[0]==1  && Signal_Pattern_Arrow && Modo_Operacion==UP)
        {

         bool Entra=true;
         for(int i=1; i<50 && shift-i>0; i++)
           {
            if(Close[shift-i]<Open[shift-i])
               break;

            if(RSI_Strike_4_Buy[i]!=0)
              {
               Entra=false;
               break;
              }
           }
         if(Entra==true)
           {
            AlertaNormal=true;
            Condicion=true;
            CumOffset = CumOffset+IncOffset;
            ArrowSignalDN[shift] = Low[shift] - (Pointer_Offset*_Point);
            Comentario=ComentarioTexto(Comentario,"S Cronex");

            if(ObjectFind(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
               ArrowCreate(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],Low[shift]-EspacioFlecha*Point(),221,ANCHOR_TOP,ColorFlechasUP,0,Size_Flecha,false,false,true,0);


            if(ObjectFind(0,GetName("Patron 2021S Cronex S",Time[shift]))!=0)
               MarkPattern(GetName("Patron 2021S Cronex S",Time[shift]), Time[shift],Low[shift] -EspacioFlecha*Point()-ExpacioTexto*Point(), "CRX", Size_Texto, ColorTexto,true);
           }
        }

      if(RSI_Strike_1_Sell[0]==0 && RSI_Strike_2_Sell[0]==0 && RSI_Strike_3_Sell[0]!=0 && RSI_Strike_4_Sell[0]==0 && MACD[0]<MACD_SIGNAL[0] && Trend_Color[0]==0  && Signal_Pattern_Arrow && Modo_Operacion==DOWN)
        {

         bool Entra=true;
         for(int i=1; i<50 && shift-i>0; i++)
           {
            if(Open[shift-i]<Close[shift-i])
               break;

            if(RSI_Strike_4_Sell[i]!=0)
              {
               Entra=false;
               break;
              }
           }
         if(Entra==true)
           {
            AlertaPre=true;
            Condicion=true;
            CumOffset = CumOffset+IncOffset;
            ArrowSignalUP_Presignal[shift] = High[shift] + (Pointer_Offset*_Point);
            Comentario=ComentarioTexto(Comentario,"PS Cronex");

            if(ObjectFind(0,"Arrow Expert Crash Boom P S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
               ArrowCreate(0,"Arrow Expert Crash Boom P S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],High[shift]+EspacioFlecha*Point(),164,ANCHOR_BOTTOM,ColorFlechasDN,0,Size_Flecha,false,false,true,0);


            if(ObjectFind(0,GetName("Patron 2021S Cronex P",Time[shift]))!=0)
               MarkPattern(GetName("Patron 2021S Cronex P",Time[shift]), Time[shift], High[shift] + EspacioFlecha*Point()+ExpacioTexto*Point(), "CRX-P", Size_Texto, ColorTexto,false);
           }
        }
      if(RSI_Strike_1_Sell[0]==0 && RSI_Strike_2_Sell[0]==0  && RSI_Strike_3_Sell[0]==0 && RSI_Strike_4_Sell[0]!=0 && RSI_Strike_3_Sell[1]!=0 && MACD[0]<MACD_SIGNAL[0] && Trend_Color[0]==0  && Signal_Pattern_Arrow && Modo_Operacion==DOWN)
        {
         bool Entra=true;
         for(int i=1; i<50 && shift-i>0; i++)
           {
            if(Open[shift-i]<Close[shift-i])
               break;

            if(RSI_Strike_4_Sell[i]!=0)
              {
               Entra=false;
               break;
              }
           }
         if(Entra==true)
           {
            AlertaNormal=true;
            Condicion=true;
            CumOffset = CumOffset+IncOffset;
            ArrowSignalUP[shift] = High[shift] + (Pointer_Offset*_Point);
            Comentario=ComentarioTexto(Comentario,"S Cronex");

            if(ObjectFind(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
               ArrowCreate(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],High[shift]+EspacioFlecha*Point(),222,ANCHOR_BOTTOM,ColorFlechasDN,0,Size_Flecha,false,false,true,0);


            if(ObjectFind(0,GetName("Patron 2021S Cronex S",Time[shift]))!=0)
               MarkPattern(GetName("Patron 2021S Cronex S",Time[shift]), Time[shift], High[shift] + EspacioFlecha*Point()+ExpacioTexto*Point(), "CRX", Size_Texto, ColorTexto,false);
           }
        }


      if(MACD[0]>MACD_SIGNAL[0] && Trend_Color[0]==1 && FAST_EMA[2]>SLOW_EMA[2] && FAST_EMA[3]<SLOW_EMA[3] && Waddah_Color[0]==1  && Cruce_de_Emas && Modo_Operacion==UP)
        {
         Condicion=true;
         AlertaPre=true;
         CumOffset = CumOffset+IncOffset;
         ArrowSignalDN_Presignal[shift] = Low[shift] - (Pointer_Offset*_Point);
         Comentario=ComentarioTexto(Comentario,"PS CEmas");

         if(ObjectFind(0,"Arrow Expert Crash Boom P B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
            ArrowCreate(0,"Arrow Expert Crash Boom P B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],Low[shift]-EspacioFlecha*Point(),164,ANCHOR_TOP,ColorFlechasUP,0,Size_Flecha,false,false,true,0);


         if(ObjectFind(0,GetName("Patron 2021S CE P",Time[shift]))!=0)
            MarkPattern(GetName("Patron 2021S CE P",Time[shift]), Time[shift], Low[shift] -EspacioFlecha*Point()-ExpacioTexto*Point(), "CE-P", Size_Texto, ColorTexto,true);
        }

      if(MACD[0]>MACD_SIGNAL[0] && Trend_Color[0]==1 && FAST_EMA[3]>SLOW_EMA[3] && FAST_EMA[4]<SLOW_EMA[4] && Waddah_Color[0]==1  && Cruce_de_Emas && Modo_Operacion==UP)
        {
         AlertaNormal=true;
         Condicion=true;
         CumOffset = CumOffset+IncOffset;
         ArrowSignalDN[shift] = Low[shift] - (Pointer_Offset*_Point);
         Comentario=ComentarioTexto(Comentario,"S CEmas");

         if(ObjectFind(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
            ArrowCreate(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],Low[shift]-EspacioFlecha*Point(),221,ANCHOR_TOP,ColorFlechasUP,0,Size_Flecha,false,false,true,0);


         if(ObjectFind(0,GetName("Patron 2021S CE",Time[shift]))!=0)
            MarkPattern(GetName("Patron 2021S CE",Time[shift]), Time[shift],Low[shift] -EspacioFlecha*Point()-ExpacioTexto*Point(), "CE", Size_Texto, ColorTexto,true);
        }

      if(MACD[0]<MACD_SIGNAL[0] && Trend_Color[0]==0 && FAST_EMA[2]<SLOW_EMA[2] && FAST_EMA[3]>SLOW_EMA[3] && Waddah_Color[0]==2 && Cruce_de_Emas && Modo_Operacion==DOWN)
        {
         AlertaPre=true;
         Condicion=true;
         CumOffset = CumOffset+IncOffset;
         ArrowSignalUP_Presignal[shift] = High[shift] + (Pointer_Offset*_Point);
         Comentario=ComentarioTexto(Comentario,"PS CEmas");

         if(ObjectFind(0,"Arrow Expert Crash Boom P S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
            ArrowCreate(0,"Arrow Expert Crash Boom P S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],High[shift]+EspacioFlecha*Point(),164,ANCHOR_BOTTOM,ColorFlechasDN,0,Size_Flecha,false,false,true,0);


         if(ObjectFind(0,GetName("Patron 2021S CE P",Time[shift]))!=0)
            MarkPattern(GetName("Patron 2021S CE P",Time[shift]), Time[shift], High[shift] +EspacioFlecha*Point()+ExpacioTexto*Point(), "CE-P", Size_Texto, ColorTexto,false);
        }

      if(MACD[0]<MACD_SIGNAL[0] && Trend_Color[0]==0 && FAST_EMA[3]<SLOW_EMA[3] && FAST_EMA[4]>SLOW_EMA[4] && Waddah_Color[0]==2 && Cruce_de_Emas && Modo_Operacion==DOWN)
        {
         AlertaNormal=true;
         Condicion=true;
         CumOffset = CumOffset+IncOffset;
         ArrowSignalUP[shift] = High[shift] + (Pointer_Offset*_Point);
         Comentario=ComentarioTexto(Comentario,"S CEmas");

         if(ObjectFind(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
            ArrowCreate(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],High[shift]+EspacioFlecha*Point(),222,ANCHOR_BOTTOM,ColorFlechasDN,0,Size_Flecha,false,false,true,0);


         if(ObjectFind(0,GetName("Patron 2021S CE",Time[shift]))!=0)
            MarkPattern(GetName("Patron 2021S CE",Time[shift]), Time[shift], High[shift] +EspacioFlecha*Point()+ExpacioTexto*Point(), "CE", Size_Texto, ColorTexto,false);
        }

//////////////////////////// SINCRONIZAZCION ///////////////////
      if(MACD[0]>MACD_SIGNAL[0] && Trend_Color[0]==1 && Waddah_Color[0]==1 && (Waddah_Color[1]==2 || Trend_Color[1]==0 || MACD[1]<MACD_SIGNAL[1])  && Sincronizacion && Modo_Operacion==UP)
        {
         AlertaNormal=true;
         Condicion=true;
         CumOffset = CumOffset+IncOffset;
         ArrowSignalDN[shift] = Low[shift] - (Pointer_Offset*_Point);
         Comentario=ComentarioTexto(Comentario,"S Sincro");

         if(ObjectFind(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
            ArrowCreate(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],Low[shift]-EspacioFlecha*Point(),221,ANCHOR_TOP,ColorFlechasUP,0,Size_Flecha,false,false,true,0);


         if(ObjectFind(0,GetName("Patron 2021S SYN",Time[shift]))!=0)
            MarkPattern(GetName("Patron 2021S SYN",Time[shift]), Time[shift], Low[shift] -EspacioFlecha*Point()-ExpacioTexto*Point(), "SYN", Size_Texto, ColorTexto,true);
        }

      if(MACD[0]<MACD_SIGNAL[0] && Trend_Color[0]==0  && Waddah_Color[0]==2  && (Waddah_Color[1]==1 || Trend_Color[1]==1 || MACD[1]>MACD_SIGNAL[1]) && Sincronizacion && Modo_Operacion==DOWN)
        {
         AlertaNormal=true;
         Condicion=true;
         CumOffset = CumOffset+IncOffset;
         ArrowSignalUP[shift] = High[shift] + (Pointer_Offset*_Point);
         Comentario=ComentarioTexto(Comentario,"S Sincro");

         if(ObjectFind(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
            ArrowCreate(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],High[shift]+EspacioFlecha*Point(),222,ANCHOR_BOTTOM,ColorFlechasDN,0,Size_Flecha,false,false,true,0);


         if(ObjectFind(0,GetName("Patron 2021S SYN",Time[shift]))!=0)
            MarkPattern(GetName("Patron 2021S SYN",Time[shift]), Time[shift], High[shift] +EspacioFlecha*Point()+ExpacioTexto*Point(), "SYN", Size_Texto, ColorTexto,false);
        }



      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
     /* if(Open[shift]>Close[shift] && Modo_Operacion==UP)
         Tramo200C=false;
      if(Open[shift]<Close[shift] && Modo_Operacion==DOWN)
         Tramo200C=false;

      if(H[0]>EMA_TOQUE1[shift] && L[0]<EMA_TOQUE1[shift] && H[1]<EMA_TOQUE1[shift-1] && Modo_Operacion==UP && ToquesEmas_C  && EMA_TOQUE2[shift]>EMA_TOQUE1[shift])
        {
         double Size=0;
         double LowAnteror=0;
         for(int i=1; i<10000 && shift-i>0; i++)
           {
            LowAnteror=(LowAnteror==0 || LowAnteror>Low[shift-i])?Low[shift-i]:LowAnteror;
            if(Open[shift-i]>Close[shift-i] && Open[shift-i]>EMA_TOQUE1[shift-i] && EMA_TOQUE1[shift-i]>Close[shift-i])
              {
               Size=MathAbs(EMA_TOQUE1[shift-i]-LowAnteror);
               break;
              }
           }

         if(Size>MathAbs(Close[shift]-Open[shift])*MultiplicadorSizeSpikeMinimo)
           {
            Tramo200C=true;
            AlertaNormal=true;
            Condicion=true;
            CumOffset = CumOffset+IncOffset;
            ArrowSignalDN[shift] = Low[shift] - (Pointer_Offset*_Point);
            Comentario=ComentarioTexto(Comentario,"Toq Ema 1");

            if(ObjectFind(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
               ArrowCreate(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],High[shift]+EspacioFlecha*Point(),222,ANCHOR_BOTTOM,ColorFlechasDN,0,Size_Flecha,false,false,true,0);

            if(ObjectFind(0,GetName("Patron 2021S TQ-E",Time[shift]))!=0)
               MarkPattern(GetName("Patron 2021S TQ-E",Time[shift]), Time[shift], High[shift] +EspacioFlecha*Point()+ExpacioTexto*Point(), "TQ E", Size_Texto, ColorTexto,false);
           }
        }*/

      if(H[0]>EMA_TOQUE1[shift] && L[0]<EMA_TOQUE1[shift] && L[1]>EMA_TOQUE1[shift-1] && Modo_Operacion==UP && ToquesEmas_F  && EMA_TOQUE2[shift]<EMA_TOQUE1[shift] && MathAbs(EMA_TOQUE1[shift]-Close[shift])<TraspasoMaximo*Point())
        {
         double Size=0;
         double SizeEva=0;
         double HighAnteror=0;
         for(int i=1; i<10000 && shift-i>0; i++)
           {
            HighAnteror=(HighAnteror==0 || HighAnteror<High[shift-i])?High[shift-i]:HighAnteror;
            if(Open[shift-i]<Close[shift-i] && Open[shift-i]<EMA_TOQUE1[shift-i] && EMA_TOQUE1[shift-i]<Close[shift-i])
              {
               Size=MathAbs(HighAnteror-EMA_TOQUE1[shift-i]);
               SizeEva=MathAbs(Open[shift-i]-Close[shift-i]);
               break;
              }
           }

         if(Size>SizeEva*MultiplicadorSizeSpikeMinimo)
           {


            AlertaNormal=true;
            Condicion=true;
            CumOffset = CumOffset+IncOffset;
            ArrowSignalUP[shift] = High[shift] + (Pointer_Offset*_Point);
            Comentario=ComentarioTexto(Comentario,"Toq Ema 1");

            if(ObjectFind(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
               ArrowCreate(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],Low[shift]-EspacioFlecha*Point(),221,ANCHOR_TOP,ColorFlechasUP,0,Size_Flecha,false,false,true,0);

            if(ObjectFind(0,GetName("Patron 2021S TQ-E",Time[shift]))!=0)
               MarkPattern(GetName("Patron 2021S TQ-E",Time[shift]), Time[shift], Low[shift] -EspacioFlecha*Point()-ExpacioTexto*Point(), "TQ E", Size_Texto, ColorTexto,true);

           }
        }

/*
      if(H[0]>EMA_TOQUE1[shift] && L[0]<EMA_TOQUE1[shift] && L[1]>EMA_TOQUE1[shift-1]  && Modo_Operacion==DOWN && ToquesEmas_C && EMA_TOQUE2[shift]<EMA_TOQUE1[shift] )
        {
         double Size=0;
         double HighAnteror=0;
         for(int i=1; i<10000 && shift-i>0; i++)
           {
            HighAnteror=(HighAnteror==0 || HighAnteror<High[shift-i])?High[shift-i]:HighAnteror;
            if(Open[shift-i]<Close[shift-i] && Open[shift-i]<EMA_TOQUE1[shift-i] && EMA_TOQUE1[shift-i]<Close[shift-i])
              {
               Size=MathAbs(HighAnteror-EMA_TOQUE1[shift-i]);
               break;
              }
           }

         if(Size>MathAbs(Close[shift]-Open[shift])*MultiplicadorSizeSpikeMinimo)
           {
            Tramo200C=true;
            AlertaNormal=true;
            Condicion=true;
            CumOffset = CumOffset+IncOffset;
            ArrowSignalUP[shift] = High[shift] + (Pointer_Offset*_Point);
            Comentario=ComentarioTexto(Comentario,"Toq Ema 1");

            if(ObjectFind(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
               ArrowCreate(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],Low[shift]-EspacioFlecha*Point(),221,ANCHOR_TOP,ColorFlechasUP,0,Size_Flecha,false,false,true,0);

            if(ObjectFind(0,GetName("Patron 2021S TQ-E",Time[shift]))!=0)
               MarkPattern(GetName("Patron 2021S TQ-E",Time[shift]), Time[shift], Low[shift] -EspacioFlecha*Point()-ExpacioTexto*Point(), "TQ E", Size_Texto, ColorTexto,true);

           }
        }
*/
      if(H[0]>EMA_TOQUE1[shift] && L[0]<EMA_TOQUE1[shift] && H[1]<EMA_TOQUE1[shift-1]  && Modo_Operacion==DOWN && ToquesEmas_F && EMA_TOQUE2[shift]>EMA_TOQUE1[shift] && MathAbs(EMA_TOQUE1[shift]-Close[shift])<TraspasoMaximo*Point())
        {
         double Size=0;
         double LowAnteror=0;
         double SizeEva=0;
         for(int i=1; i<10000 && shift-i>0; i++)
           {
            LowAnteror=(LowAnteror==0 || LowAnteror>Low[shift-i])?Low[shift-i]:LowAnteror;
            if(Open[shift-i]>Close[shift-i] && Open[shift-i]>EMA_TOQUE1[shift-i] && EMA_TOQUE1[shift-i]>Close[shift-i])
              {
               Size=MathAbs(EMA_TOQUE1[shift-i]-LowAnteror);
               SizeEva=MathAbs(Open[shift-i]-Close[shift-i]);
               break;
              }
           }

         if(Size>SizeEva*MultiplicadorSizeSpikeMinimo)
           {
            AlertaNormal=true;
            Condicion=true;
            CumOffset = CumOffset+IncOffset;
            ArrowSignalDN[shift] = Low[shift] - (Pointer_Offset*_Point);
            Comentario=ComentarioTexto(Comentario,"Toq Ema 1");

            if(ObjectFind(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
               ArrowCreate(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],High[shift]+EspacioFlecha*Point(),222,ANCHOR_BOTTOM,ColorFlechasDN,0,Size_Flecha,false,false,true,0);

            if(ObjectFind(0,GetName("Patron 2021S TQ-E",Time[shift]))!=0)
               MarkPattern(GetName("Patron 2021S TQ-E",Time[shift]), Time[shift], High[shift] +EspacioFlecha*Point()+ExpacioTexto*Point(), "TQ E", Size_Texto, ColorTexto,false);
           }
        }


/*
      if(H[0]>EMA_TOQUE2[shift] && L[0]<EMA_TOQUE2[shift] && H[1]<EMA_TOQUE2[shift-1] && Modo_Operacion==UP && ToquesEmas_C && EMA_TOQUE2[shift]>EMA_TOQUE1[shift] && Tramo200C==false)
        {
         double Size=0;
         double LowAnteror=0;
         for(int i=1; i<10000 && shift-i>0; i++)
           {
            LowAnteror=(LowAnteror==0 || LowAnteror>Low[shift-i])?Low[shift-i]:LowAnteror;
            if(Open[shift-i]>Close[shift-i])
              {
               if(Open[shift-i]>EMA_TOQUE1[shift-i] && EMA_TOQUE1[shift-i]>Close[shift-i])
                  Size=MathAbs(EMA_TOQUE1[shift-i]-Close[shift-i]);
               break;
              }
           }

         if(Size<MathAbs(Close[shift]-Open[shift])*MultiplicadorSizeSpikeMinimoRompimiento && Size!=0)
           {
            AlertaNormal=true;
            Condicion=true;
            CumOffset = CumOffset+IncOffset;
            ArrowSignalDN[shift] = Low[shift] - (Pointer_Offset*_Point);
            Comentario=ComentarioTexto(Comentario,"Toq Ema 1");

            if(ObjectFind(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
               ArrowCreate(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],High[shift]+EspacioFlecha*Point(),222,ANCHOR_BOTTOM,ColorFlechasDN,0,Size_Flecha,false,false,true,0);

            if(ObjectFind(0,GetName("Patron 2021S TQ-E",Time[shift]))!=0)
               MarkPattern(GetName("Patron 2021S TQ-E",Time[shift]), Time[shift], High[shift] +EspacioFlecha*Point()+ExpacioTexto*Point(), "TQ E", Size_Texto, ColorTexto,false);
           }
        }



      if(H[0]>EMA_TOQUE2[shift] && L[0]<EMA_TOQUE2[shift] && L[1]>EMA_TOQUE2[shift-1]  && Modo_Operacion==DOWN && ToquesEmas_C  && EMA_TOQUE2[shift]>EMA_TOQUE1[shift] && Tramo200C==false)
        {
         double Size=0;
         double HighAnteror=0;
         for(int i=1; i<10000 && shift-i>0; i++)
           {
            HighAnteror=(HighAnteror==0 || HighAnteror<High[shift-i])?High[shift-i]:HighAnteror;
            if(Open[shift-i]<Close[shift-i])
              {
               if(Open[shift-i]<EMA_TOQUE1[shift-i] && EMA_TOQUE1[shift-i]<Close[shift-i])
                  Size=MathAbs(Close[shift-i]-EMA_TOQUE1[shift-i]);
               break;
              }
           }

         if(Size<MathAbs(Close[shift]-Open[shift])*MultiplicadorSizeSpikeMinimoRompimiento && Size!=0)
           {
            Tramo200C=true;
            AlertaNormal=true;
            Condicion=true;
            CumOffset = CumOffset+IncOffset;
            ArrowSignalUP[shift] = High[shift] + (Pointer_Offset*_Point);
            Comentario=ComentarioTexto(Comentario,"Toq Ema 1");

            if(ObjectFind(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
               ArrowCreate(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],Low[shift]-EspacioFlecha*Point(),221,ANCHOR_TOP,ColorFlechasUP,0,Size_Flecha,false,false,true,0);

            if(ObjectFind(0,GetName("Patron 2021S TQ-E",Time[shift]))!=0)
               MarkPattern(GetName("Patron 2021S TQ-E",Time[shift]), Time[shift], Low[shift] -EspacioFlecha*Point()-ExpacioTexto*Point(), "TQ E", Size_Texto, ColorTexto,true);

           }
        }*/

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      if(H[0]>EMA_TOQUE2[shift] && L[0]<EMA_TOQUE2[shift] && L[1]>EMA_TOQUE2[shift-1] && Modo_Operacion==UP && ToquesEmas_F  && EMA_TOQUE2[shift]<EMA_TOQUE1[shift] && MathAbs(EMA_TOQUE2[shift]-Close[shift])<TraspasoMaximo*Point())
        {
         double Size=0;
         double SizeEva=0;
         double HighAnteror=0;
         for(int i=1; i<10000 && shift-i>0; i++)
           {
            HighAnteror=(HighAnteror==0 || HighAnteror<High[shift-i])?High[shift-i]:HighAnteror;
            if(Open[shift-i]<Close[shift-i] && Open[shift-i]<EMA_TOQUE1[shift-i] && EMA_TOQUE1[shift-i]<Close[shift-i])
              {
               Size=MathAbs(HighAnteror-EMA_TOQUE1[shift-i]);
               SizeEva=MathAbs(Open[shift-i]-Close[shift-i]);
               break;
              }
           }

         if(Size<SizeEva*MultiplicadorSizeSpikeMinimoRompimiento)
           {
            AlertaNormal=true;
            Condicion=true;
            CumOffset = CumOffset+IncOffset;
            ArrowSignalUP[shift] = High[shift] + (Pointer_Offset*_Point);
            Comentario=ComentarioTexto(Comentario,"Toq Ema 1");

            if(ObjectFind(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
               ArrowCreate(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],Low[shift]-EspacioFlecha*Point(),221,ANCHOR_TOP,ColorFlechasUP,0,Size_Flecha,false,false,true,0);

            if(ObjectFind(0,GetName("Patron 2021S TQ-E",Time[shift]))!=0)
               MarkPattern(GetName("Patron 2021S TQ-E",Time[shift]), Time[shift], Low[shift] -EspacioFlecha*Point()-ExpacioTexto*Point(), "TQ E", Size_Texto, ColorTexto,true);

           }
        }


      if(H[0]>EMA_TOQUE2[shift] && L[0]<EMA_TOQUE2[shift] && H[1]<EMA_TOQUE2[shift-1]  && Modo_Operacion==DOWN && ToquesEmas_F && EMA_TOQUE2[shift]>EMA_TOQUE1[shift]  && MathAbs(EMA_TOQUE2[shift]-Close[shift])<TraspasoMaximo*Point())
        {
         double Size=0;
         double LowAnteror=0;
         double SizeEva=0;
         for(int i=1; i<10000 && shift-i>0; i++)
           {
            LowAnteror=(LowAnteror==0 || LowAnteror>Low[shift-i])?Low[shift-i]:LowAnteror;
            if(Open[shift-i]>Close[shift-i] && Open[shift-i]>EMA_TOQUE1[shift-i] && EMA_TOQUE1[shift-i]>Close[shift-i])
              {
               Size=MathAbs(EMA_TOQUE1[shift-i]-LowAnteror);
               SizeEva=MathAbs(Open[shift-i]-Close[shift-i]);
               break;
              }
           }

         if(Size<SizeEva*MultiplicadorSizeSpikeMinimoRompimiento)
           {
            AlertaNormal=true;
            Condicion=true;
            CumOffset = CumOffset+IncOffset;
            ArrowSignalDN[shift] = Low[shift] - (Pointer_Offset*_Point);
            Comentario=ComentarioTexto(Comentario,"Toq Ema 1");

            if(ObjectFind(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
               ArrowCreate(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],High[shift]+EspacioFlecha*Point(),222,ANCHOR_BOTTOM,ColorFlechasDN,0,Size_Flecha,false,false,true,0);

            if(ObjectFind(0,GetName("Patron 2021S TQ-E",Time[shift]))!=0)
               MarkPattern(GetName("Patron 2021S TQ-E",Time[shift]), Time[shift], High[shift] +EspacioFlecha*Point()+ExpacioTexto*Point(), "TQ E", Size_Texto, ColorTexto,false);
           }
        }


///////////////////////////////////////////////////////////////////////////////////////////



      if(Waddah_Color[1]==2 && Waddah_Ema[0]>Waddah_MACD[0] && Waddah_Ema[1]<Waddah_MACD[1] && CruceWadath && Modo_Operacion==UP)
        {
         AlertaNormal=true;
         Condicion=true;
         CumOffset = CumOffset+IncOffset;
         ArrowSignalDN[shift] = Low[shift] - (Pointer_Offset*_Point);
         Comentario=ComentarioTexto(Comentario,"Cruce Volumen");

         if(ObjectFind(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
            ArrowCreate(0,"Arrow Expert Crash Boom B"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],Low[shift]-EspacioFlecha*Point(),221,ANCHOR_TOP,ColorFlechasUP,0,Size_Flecha,false,false,true,0);


         if(ObjectFind(0,GetName("Patron 2021S CruceWaddath",Time[shift]))!=0)
            MarkPattern(GetName("Patron 2021S CruceWaddath",Time[shift]), Time[shift], Low[shift] -EspacioFlecha*Point()-ExpacioTexto*Point(), "CV", Size_Texto, ColorTexto,true);
        }

      if(Waddah_Color[1]==1 && Waddah_Ema[0]>Waddah_MACD[0] && Waddah_Ema[1]<Waddah_MACD[1] && CruceWadath && Modo_Operacion==DOWN)
        {
         AlertaNormal=true;
         Condicion=true;
         CumOffset = CumOffset+IncOffset;
         ArrowSignalUP[shift] = High[shift] + (Pointer_Offset*_Point);
         Comentario=ComentarioTexto(Comentario,"Cruce Volumen");

         if(ObjectFind(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
            ArrowCreate(0,"Arrow Expert Crash Boom S"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],High[shift]+EspacioFlecha*Point(),222,ANCHOR_BOTTOM,ColorFlechasDN,0,Size_Flecha,false,false,true,0);


         if(ObjectFind(0,GetName("Patron 2021S CruceWaddath",Time[shift]))!=0)
            MarkPattern(GetName("Patron 2021S CruceWaddath",Time[shift]), Time[shift], High[shift] +EspacioFlecha*Point()+ExpacioTexto*Point(), "CV", Size_Texto, ColorTexto,false);
        }



      /*

            if(Modo_Operacion==UP && PatronN)
              {
               double SizeVela=0;
               bool Entra=false;
               double HighVela=0;
               double LowVela=0;

               for(int i=1; i<50 && shift-i>0; i++)
                 {
                  if(Close[shift-i]<Open[shift-i])
                    {
                     SizeVela=MathAbs(Close[shift-i]-Open[shift-i]);
                     HighVela=Open[shift-i];
                     LowVela=Close[shift-i];
                     Entra=true;
                     break;
                    }
                 }

               if(Entra==true && SizeVela>SizeVelaSpike*Point())
                 {
                  if(rates_total-8==shift)
                     Comment(shift);

                  if(Close[shift]>HighVela-3*(MathAbs(Close[shift-1]<Open[shift-1]))  && Close[shift]<HighVela)
                    {
                     AlertaNormal=true;
                     Condicion=true;
                     CumOffset = CumOffset+IncOffset;
                     ArrowSignalDN[shift] = Low[shift] - (Pointer_Offset*_Point);
                     Comentario=ComentarioTexto(Comentario,"S-N");


                        if(ObjectFind(0,"Arrow Expert Crash Boom"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
                           ArrowCreate(0,"Arrow Expert Crash Boom"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],Low[shift]-EspacioFlecha*Point(),164,ANCHOR_TOP,ColorFlechasUP,0,Size_Flecha,false,false,true,0);


                        if(ObjectFind(0,GetName("Patron 2021S N P",Time[shift]))!=0)
                           MarkPattern(GetName("Patron 2021S N P",Time[shift]), Time[shift], Low[shift] -EspacioFlecha*Point()-ExpacioTexto*Point(), "N", Size_Texto, ColorTexto,true);
                     //ArrowCreate(0,"Arrow Expert Crash Boom"+TimeToString(Time[1],TIME_DATE|TIME_MINUTES),CharIndicator,Time[0],Momentun,221,ANCHOR_TOP,ColorFlechasTrue,0,Size_Flecha,false,false,true,0);
                    }
                 }
              }

            if(Modo_Operacion==DOWN && PatronN)
              {
               double SizeVela=0;
               bool Entra=false;
               double HighVela=0;
               double LowVela=0;
               for(int i=1; i<50 && shift-i>0; i++)
                 {
                  if(Close[shift-i]>Open[shift-i])
                    {
                     SizeVela=MathAbs(Close[shift-i]-Open[shift-i]);
                     HighVela=Close[shift-i];
                     LowVela=Open[shift-i];
                     Entra=true;
                     break;
                    }
                 }

               if(Entra==true && SizeVela>SizeVelaSpike*Point())
                 {
                  if(Close[shift]<LowVela+3*(MathAbs(Close[shift-1]<Open[shift-1]))  && Close[shift]>LowVela)
                    {
                     AlertaNormal=true;
                     Condicion=true;
                     CumOffset = CumOffset+IncOffset;
                     ArrowSignalUP[shift] = High[shift] + (Pointer_Offset*_Point);
                     Comentario=ComentarioTexto(Comentario,"S-N");


                        if(ObjectFind(0,"Arrow Expert Crash Boom"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
                           ArrowCreate(0,"Arrow Expert Crash Boom"+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],High[shift]+EspacioFlecha*Point(),164,ANCHOR_BOTTOM,ColorFlechasUP,0,Size_Flecha,false,false,true,0);


                        if(ObjectFind(0,GetName("Patron 2021S N P",Time[shift]))!=0)
                           MarkPattern(GetName("Patron 2021S N P",Time[shift]), Time[shift], High[shift] +EspacioFlecha*Point()+ExpacioTexto*Point(), "N", Size_Texto, ColorTexto,true);
                     //ArrowCreate(0,"Arrow Expert Crash Boom"+TimeToString(Time[1],TIME_DATE|TIME_MINUTES),CharIndicator,Time[0],Momentun,221,ANCHOR_TOP,ColorFlechasTrue,0,Size_Flecha,false,false,true,0);
                    }
                 }
              }

            */
      if(Condicion==false && rates_total-1==shift)
         CRUCE=false;

      if(CRUCE== false)
         if(ObjectFind(0,label_name)>=0)
            ObjectDelete(0,label_name);

      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      if(VelasOpuestasEnVolumen_Alert == true)
        {
         if(Show_Alert == true && Condicion==true)
           {
            pattern = "Patrones CRASH BOOM";
            setalert = 1;
           }
        }


      if((setalert==1) && (shift==rates_total-1) && CRUCE==false)
        {
         CRUCE=true;
         ALERTAACTIVADA=true;
         //  Alert(Symbol()," ",period," ",pattern);
         setalert=0;
         if(AlertaPre==true)
           {
            PlaySound(SonidoPre);
            Sleep(5000);
           }
         if(AlertaNormal==true)
           {
            PlaySound(SonidoSe);
            Sleep(5000);
           }
         Alertas();
        }
      CumOffset=0;

     } // End of for loop
   vez=0;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Concatenates string and time for a name.                         |
//+------------------------------------------------------------------+
string GetName(string aName,datetime timeshift)
  {
   return(aName + DoubleToString(timeshift, 0));
  }
//+------------------------------------------------------------------+
//| Creates an object to mark the pattern on the chart.              |
//+------------------------------------------------------------------+
void MarkPattern(const string name,const datetime time,const double price,const string shortname,const int fontsize,const color patterncolor,bool isBuy)
  {
   ObjectCreate(0,name,OBJ_TEXT,0,time,price);
   ObjectSetString(0,name,OBJPROP_TEXT,shortname);
   ObjectSetString(0,name,OBJPROP_FONT,"Times New Roman");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,fontsize);
   ObjectSetInteger(0,name,OBJPROP_COLOR,patterncolor);
   if(isBuy)
      ObjectSetInteger(0,name,OBJPROP_ANCHOR,ANCHOR_UPPER);
   else
      ObjectSetInteger(0,name,OBJPROP_ANCHOR,ANCHOR_LOWER);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int ChartScaleGet(const long chart_ID=0)
  {
//--- preparamos la variable para obtener el valor de la propiedad
   long result=-1;
//--- reseteamos el valor del error
   ResetLastError();
//--- obtenemos el valor de la propiedad
   if(!ChartGetInteger(chart_ID,CHART_SCALE,0,result))
     {
      //--- mostramos el mensaje del error en el diario "Asesores Expertos"
      Print(__FUNCTION__+", Error Code = ",GetLastError());
     }
//--- devolvemos el valor de la propiedad del gráfico
   return((int)result);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
bool ArrowCreate(const long              chart_ID=0,           // chart's ID
                 const string            name="Arrow",         // arrow name
                 const int               sub_window=0,         // subwindow index
                 datetime                time=0,               // anchor point time
                 double                  price=0,              // anchor point price
                 const uchar             arrow_code=252,       // arrow code
                 const ENUM_ARROW_ANCHOR anchor=ANCHOR_BOTTOM, // anchor point position
                 const color             clr=clrRed,           // arrow color
                 const ENUM_LINE_STYLE   style=STYLE_SOLID,    // border line style
                 const int               width=3,              // arrow size
                 const bool              back=false,           // in the background
                 const bool              selection=true,       // highlight to move
                 const bool              hidden=true,          // hidden in the object list
                 const long              z_order=0)            // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create an arrow
   if(!ObjectCreate(chart_ID,name,OBJ_ARROW,sub_window,time,price))
     {
      Print(__FUNCTION__,
            ": failed to create an arrow! Error code = ",GetLastError());
      return(false);
     }
//--- set the arrow code
   ObjectSetInteger(chart_ID,name,OBJPROP_ARROWCODE,arrow_code);
//--- set anchor type
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
//--- set the arrow color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set the border line style
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- set the arrow's size
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of moving the arrow by mouse
//--- when creating a graphical object using ObjectCreate function, the object cannot be
//--- highlighted and moved by default. Inside this method, selection parameter
//--- is true by default making it possible to highlight and move the object
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- hide (true) or display (false) graphical object name in the object list
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- set the priority for receiving the event of a mouse click in the chart
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- successful execution
   return(true);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string ComentarioTexto(string ComentarioS,string AComentario)
  {
   ComentarioS=ComentarioS==" "?(AComentario):(Comentario+" y "+AComentario);
   return ComentarioS;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Alertas()
  {
   if(AlertaPC)
      Alert("FORMANDOSE PATRONES "+Comentario,"Alertas",1);
   if(AlertaMovil)
      SendNotification("FORMANDOSE PATRONES "+Comentario+" en "+Symbol()+" "+period);
   if(AlertaMail)
      SendMail("PATRONES EXPERTOS EN "+Symbol(),"FORMANDOSE PATRONES "+Comentario+" en "+Symbol()+" "+period);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
