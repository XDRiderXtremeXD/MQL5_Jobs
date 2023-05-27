//+------------------------------------------------------------------+
//|                                          Mi Indicador Angelo.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 9
#property indicator_plots   6

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

#property indicator_label5  "ENTRADA SELL"
#property indicator_color5  clrAqua
#property indicator_type5  DRAW_ARROW
#property indicator_style5  STYLE_SOLID
#property indicator_width5  2

#property indicator_label6  "ENTRADA BUY"
#property indicator_color6  clrAqua
#property indicator_type6   DRAW_ARROW
#property indicator_style6  STYLE_SOLID
#property indicator_width6  2

int Estocastico;
int Momentun;

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12am=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

enum Modos
  {
   Solo_High_Low=0,
   Solo_Close_Close=1,
   Ambos=2,
  };


input bool TransparienciaDePatronesSinRSIoEST=false;
input Modos STO_Price=Ambos;
input int Velas_Confirmacion=6;
input ENUM_Horas  Hora_Inicio=_8am;
input ENUM_Horas Hora_Final=_10pm;
input double Nivel=0.10;
double Tolerancia=100;
input string S0="-----------------------   Configuracion Estocastico ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int K_Periodo=5;
input int D_Periodo=3;
input int Slowing=3;
input ENUM_MA_METHOD Ma_Method_EST=MODE_SMA;
input string S11="-----------------------   Configuracion MA---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Filter_MA=true;
input int Tolerancia_Puntos=0;
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
input string S12_="============================================ CONFIGURACION TREND ============================================";//======================================================================
input bool FiltroTrend=true;
input int inpFastLength = 3; // Fast length
input int inpSlowLength = 7; // Slow length
input int EsperaMaxima=5;
//input int AumentoP=50;

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

int ShiftHigh=0;
int ShiftLow=0;

MqlRates Rates[];

double HigthBuy=0;
double LowSell=0;

int Estocastico2=0;
int RSI=0;

string period;
double Doji_Star_Ratio= 0;
double Doji_MinLength = 0;
double Star_MinLength = 0;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
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
double RSI_Array[];
double Nivel_Minimo=100.0;
double Nivel_Maximo=100.0;

int MA=0;


double Close_Trend[];
double Start_trend[];
double Slow_Trend[];
int HandleTrend=0;

double A_UP[];
double A_DN[];

double High_Diver_UP=0;
double Low_Diver_UP=0;

double High_Diver_DN=0;
double Low_Diver_DN=0;
bool Diver_UP=false;
bool Diver_DN=false;
int ConteoUP=0;
int ConteoDN=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   Nivel_Minimo=Nivel_Minimo-Nivel;
   Nivel_Maximo=Nivel_Maximo+Nivel;

   ArraySetAsSeries(KArray,true);
   ArraySetAsSeries(MA_Array,true);
   ArraySetAsSeries(RSI_Array,true);

   MA=iMA(NULL,PERIOD_CURRENT,Period_MA,Shift_MA,MODE_MA,APP_MA);
   RSI=iRSI(NULL,PERIOD_CURRENT,RSI_Period,APP_RSI);



   Estocastico=iStochastic(Symbol(),PERIOD_CURRENT,K_Periodo,D_Periodo,Slowing,Ma_Method_EST,STO_LOWHIGH);
   Estocastico2=iStochastic(Symbol(),PERIOD_CURRENT,K_Periodo,D_Periodo,Slowing,Ma_Method_EST,STO_CLOSECLOSE);
   Momentun=iMomentum(Symbol(),PERIOD_CURRENT,Momentun_Periodo,Momentun_Applied_Price);

   HandleTrend=iCustom(Symbol(),PERIOD_CURRENT,"IndicatorPersonalized",inpFastLength,inpSlowLength); // Slow length);

   if(HandleTrend==INVALID_HANDLE && FiltroTrend)
     {
      Print("ERROR: FILTRO TREND MAL CONFIGURADO");
      return(INIT_FAILED);
     }

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
   SetIndexBuffer(4,A_UP,INDICATOR_DATA);
   SetIndexBuffer(5,A_DN,INDICATOR_DATA);
   SetIndexBuffer(6,Close_Trend,INDICATOR_DATA);
   SetIndexBuffer(7,Start_trend,INDICATOR_DATA);
   SetIndexBuffer(8,Slow_Trend,INDICATOR_DATA);

   PlotIndexSetInteger(4,PLOT_DRAW_TYPE,DRAW_ARROW);
   PlotIndexSetInteger(5,PLOT_DRAW_TYPE,DRAW_ARROW);

   PlotIndexSetInteger(0,PLOT_ARROW,234);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(1,PLOT_ARROW,233);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);


   PlotIndexSetInteger(2,PLOT_ARROW,234);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(3,PLOT_ARROW,233);
   PlotIndexSetDouble(3,PLOT_EMPTY_VALUE,EMPTY_VALUE);


   PlotIndexSetInteger(5,PLOT_ARROW,234);
   PlotIndexSetDouble(5,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(4,PLOT_ARROW,233);
   PlotIndexSetDouble(4,PLOT_EMPTY_VALUE,EMPTY_VALUE);



   switch(_Period)
     {
      case PERIOD_M1:
         period="M1";
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
         period="M5";
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
         period="M15";
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
         period="M30";
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
         period="H1";
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
         period="H4";
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
      case PERIOD_D1:
         period="D1";
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
         period="W1";
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
         period="MN";
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

   int Start=100;
   if(prev_calculated==0)
     {
      Start=100;
      ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalDN_Confirmacion,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalUP_Confirmacion,EMPTY_VALUE);
      ArrayInitialize(A_UP,EMPTY_VALUE);
      ArrayInitialize(A_DN,EMPTY_VALUE);
     }
   else
      Start=rates_total-1;

   for(int shift=Start; shift<rates_total; shift++)
     {

      if(!EvaluaHorario(Hora_Inicio,Hora_Final,time[shift]))
         continue;
      ArrowSignalUP[shift]=EMPTY_VALUE;
      ArrowSignalDN[shift]=EMPTY_VALUE;
      ArrowSignalDN_Confirmacion[shift]=EMPTY_VALUE;
      ArrowSignalUP_Confirmacion[shift]=EMPTY_VALUE;
      A_UP[shift]=EMPTY_VALUE;
      A_DN[shift]=EMPTY_VALUE;

      if(shift<ShiftLow && ShiftLow!=0 && LowSell!=0 && close[shift-1]<LowSell)
        {
         ArrowSignalUP_Confirmacion[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         if(shift==rates_total-1)
           {
            if(AlertPC)
               Alert("Operacion Sell Confirmacion en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
            if(AlertMovil)
               SendNotification("Operacion Sell Confirmacion en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
            if(AlertMail)
               SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Sell Confirmacion en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
           }
         High_Diver_UP=high[shift];
         Low_Diver_UP=low[shift];
         Diver_UP=true;
         LowSell=0;
         ShiftLow=0;
         ConteoUP=0;
        }
      if(shift<ShiftHigh && ShiftHigh!=0 && HigthBuy!=0 && close[shift-1]>HigthBuy)
        {
         ArrowSignalDN_Confirmacion[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         if(shift==rates_total-1)
           {
            if(AlertPC)
               Alert("Operacion Buy Confirmacion en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
            if(AlertMovil)
               SendNotification("Operacion Buy Confirmacion en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
            if(AlertMail)
               SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Buy Confirmacion en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
           }
         High_Diver_DN=high[shift-1];
         Low_Diver_DN=low[shift-1];
         Diver_DN=true;
         HigthBuy=0;
         ShiftHigh=0;
         ConteoDN=0;
        }
      //////////////***********************************************************************
      if(FiltroTrend)
        {
         if(Close_Trend[shift]!=EMPTY_VALUE)
           {
            if(Diver_UP)
              {
               ConteoUP++;
               if(ConteoUP>EsperaMaxima)
                 {
                  Diver_UP=false;
                  ConteoUP=0;
                 }
               //  Comment(High_Diver_UP,"  ",Low_Diver_UP);
               if(Start_trend[shift]>=open[shift] && Start_trend[shift]!=EMPTY_VALUE)
                 {
                  // if(High_Diver_UP+AumentoN*Point()>open[shift] && Low_Diver_UP-AumentoP*Point()<open[shift])
                  if(open[shift]<=High_Diver_UP)
                    {
                    // Print(TimeToString(time[shift],TIME_DATE|TIME_MINUTES),"  SELL");
                     A_DN[shift]=high[shift];
                     //DiverSELL_PIPS=true;
                     //OPEN_SELL=Slow_Trend[shift-1];
                     //HighSL=Start_trend[shift];
                    }
                  Diver_UP=false;
                 }
              }

            if(Diver_DN)
              {
               ConteoDN++;
               if(ConteoDN>EsperaMaxima)
                 {
                  Diver_DN=false;
                  ConteoDN=0;
                 }
               if(Start_trend[shift]<=open[shift] && Start_trend[shift]!=EMPTY_VALUE)
                 {
                  //if(High_Diver_DN+AumentoP*Point()>open[shift] && Low_Diver_DN-AumentoN*Point()<open[shift])
                  if(open[shift]>=Low_Diver_DN)
                    {
                    // Print(TimeToString(time[shift],TIME_DATE|TIME_MINUTES),"  BUY");
                     A_UP[shift]=low[shift];
                     //DiverBUY_PIPS=true;
                     //OPEN_BUY=Slow_Trend[shift-1];
                     //LowSL=Start_trend[shift];
                    }
                  Diver_DN=false;
                 }
              }
           }
        }
      //////////////***********************************************************************


      int CumOffset=0;
      ArrayResize(Rates,10);
      int copied=CopyRates(Symbol(),PERIOD_CURRENT,rates_total-1-shift,8,Rates);

      CopyBuffer(Estocastico,0,rates_total-shift-1,3,Estocastico_Buffer);
      CopyBuffer(Estocastico,1,rates_total-shift-1,3,Estocastico_Signal_Buffer);
      CopyBuffer(Estocastico2,0,rates_total-shift-1,3,Estocastico2_Buffer);
      CopyBuffer(Estocastico2,1,rates_total-shift-1,3,Estocastico2_Signal_Buffer);
      CopyBuffer(Momentun,0,rates_total-shift-1,3,Momentun_Buffer);

      ResetLastError();



      if(((Momentun_Buffer[1]<Nivel_Minimo && Momentun_Buffer[1]>=Nivel_Minimo-Tolerancia) || (Momentun_Buffer[2]<Nivel_Minimo && Momentun_Buffer[2]>=Nivel_Minimo-Tolerancia))
         && (((STO_Price==Solo_High_Low || STO_Price==Ambos) && Estocastico_Buffer[2]<Estocastico_Signal_Buffer[2] && Estocastico_Buffer[1]>Estocastico_Signal_Buffer[1]) ||
             (((STO_Price==Solo_Close_Close || STO_Price==Ambos) && Estocastico2_Buffer[2]<Estocastico2_Signal_Buffer[2] && Estocastico2_Buffer[1]>Estocastico2_Signal_Buffer[1])))
         && close[shift-1]>open[shift-1] && EvaluarPatron(true,low,high,open,close,shift,rates_total) && iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+1)>iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+2))
        {
         if(close[shift-1]>(close[shift-2]>open[shift-2]?close[shift-2]:open[shift-2]))
           {

            HigthBuy=high[shift-1];
            ShiftHigh=shift+Velas_Confirmacion;
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

           }
         else
            ShiftEvaluaBuy=shift+1;
        }

      if(((Momentun_Buffer[1]>Nivel_Maximo && Momentun_Buffer[1]<=Nivel_Maximo+Tolerancia) || (Momentun_Buffer[2]>Nivel_Maximo && Momentun_Buffer[2]<=Nivel_Maximo+Tolerancia))
         && (((STO_Price==Solo_High_Low || STO_Price==Ambos) && Estocastico_Buffer[2]>Estocastico_Signal_Buffer[2] && Estocastico_Buffer[1]<Estocastico_Signal_Buffer[1]) ||
             (((STO_Price==Solo_Close_Close || STO_Price==Ambos) && Estocastico2_Buffer[2]>Estocastico2_Signal_Buffer[2] && Estocastico2_Buffer[1]<Estocastico2_Signal_Buffer[1])))
         && close[shift-1]<open[shift-1] && EvaluarPatron(false,low,high,open,close,shift,rates_total)  && iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+1)>iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+2))
        {
         if(close[shift-1]<(close[shift-2]<open[shift-2]?close[shift-2]:open[shift-2]))
           {
            LowSell=low[shift-1];
            ShiftLow=shift+Velas_Confirmacion;
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
           }
         else
            ShiftEvaluaSell=shift+1;
        }

      if(ShiftEvaluaBuy!=0 && shift==ShiftEvaluaBuy)
        {
         if(close[shift-1]>(close[shift-3]>open[shift-3]?close[shift-3]:open[shift-3]))
           {
            HigthBuy=high[shift-1];
            ShiftHigh=shift+Velas_Confirmacion;
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
           }
         ShiftEvaluaBuy=0;
        }
      if(ShiftEvaluaSell!=0 && shift==ShiftEvaluaSell)
        {
         if(close[shift-1]<(close[shift-3]<open[shift-3]?close[shift-3]:open[shift-3]))
           {
            LowSell=low[shift-1];
            ShiftLow=shift+Velas_Confirmacion;
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
           }
         ShiftEvaluaSell=0;
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


   for(int j=0; j<2; j++)
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

      if(Filter_MA)
        {
         if(isBuy)
           {
            if(H[1]+Tolerancia_Puntos*Point()<ValorMA_2)
               FilterMA=false;
           }
         else
           {
            if(L[1]-Tolerancia_Puntos*Point()>ValorMA_2)
               FilterMA=false;
           }
        }
      else
        {
         if(Condicion_Signal_Contrarias)
           {
            if(isBuy)
              {
               if(H[1]+Tolerancia_Puntos*Point()<ValorMA_2)
                  if(FilterMA && !(ValorRSI_2>ValorRSI_3 && ValorRSI_2>30 && ValorRSI_3<=30))
                     FilterMA=false;
              }
            else
              {
               if(L[1]-Tolerancia_Puntos*Point()>ValorMA_2)
                  if(FilterMA && !(ValorRSI_2<ValorRSI_3 && ValorRSI_2<70 && ValorRSI_3>=70))
                     FilterMA=false;

              }
           }
        }





      if(FilterMA)
        {

         // Check for Velas opuestas en Volumen
         if((O[1]>C[1] && O[2]<C[2])||(O[1]<C[1] && O[2]>C[2]))
           {

            if((BB[1]>(BB[2]/2))&& BB[2]>VALORVELASOPUESTAS)
              {

               if(O[1]>C[1] && O[2]<C[2] && O[3]<C[3] && !isBuy)
                 {

                  if(ValorStocastico1>80 || ValorStocastico2>80)
                    {
                     return true;
                    }

                  else
                     if(TransparienciaDePatronesSinRSIoEST==true)
                       {
                        return true;
                       }
                 }

               else
                  if(O[1]<C[1] && O[2]>C[2] && O[3]>C[3] && isBuy)
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




         // Check for Velas opuestas en Volumen x2

         if(((O[1]>C[1] && O[2]>C[2] && O[3]<C[3]) || (O[1]<C[1] && O[2]<C[2] && O[3]>C[3])) && (BB[2]<(BB[3]/2)))
           {
            if((BB[1]+BB[2]>(BB[3]/2))&& BB[3]>VALORVELASOPUESTAS)
              {


               //if(VelasOpuestasEnVolumenx2 == true)
               //{


               if(O[1]>C[1] && O[2]>C[2] && O[3]<C[3] && !isBuy)
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
               //  }

              }
           }

         // Check for Velas opuestas en Volumen x2 v2

         if(((O[1]>C[1] && O[2]<C[2] && O[3]<C[3]) || (O[1]<C[1] && O[2]>C[2] && O[3]>C[3])) && (BB[2]<(BB[1]/2)))
           {
            if((BB[3]+BB[2]>(BB[1]/2))&& BB[1]>VALORVELASOPUESTAS)
              {


               //if(VelasOpuestasEnVolumenx2 == true)
               //{


               if(O[1]>C[1] && O[2]<C[2] && O[3]<C[3] && !isBuy)
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

               if(O[3]<C[3] && C[1]<O[1] && !isBuy)
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
