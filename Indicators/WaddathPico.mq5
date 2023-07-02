//+------------------------------------------------------------------+
//|                                                  WaddathPico.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window

#property indicator_buffers 6
#property indicator_plots   2

#property indicator_label1  "SIGNAL"
#property indicator_type1   DRAW_COLOR_ARROW
//--- estableceremos 8 colores para colorear el histograma por días de la semana (se almacenan en un array especial)
#property indicator_color1  clrRed,clrBlue,clrSeaGreen,clrGold,clrDarkOrange,clrMagenta,clrYellowGreen,clrChocolate
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#resource "\\Indicators\\waddah_attar_explosion.ex5" 
#resource "\\Indicators\\Rachan Levis25030.ex5" 

input double NivelTraspaso=0.01;
input bool traspaso=true;
input string S0="=============== WADDATH ===================";//===========================
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
input string S1="=============== RACHAN ===================";//===========================
input double sobrecompra = 90;
input double periodo = 2;
input double sobreventa = 30;
input bool Audible_Alerts = false;
input string S2="=============== COLORES ===================";//===========================
input color color1=clrAqua;
input color color2=clrLime;
input color color3=clrYellow;
input color color4=clrRed;
input color color5=clrBlue;
input color color6=clrMagenta;
input color color7=clrOrange;
input color color8=clrCoral;
input string S3="=============== ALERTAS ===================";//===========================
input bool PC=true;
input bool Movil=true;
input bool Mail=false;


int Handle_WADDATH=0;
int Handle_RACHAN=0;

double SIGNAL[];
double SIGNAL_color[];

double rachan_BUY[];
double rachan_SELL[];

double MACD[];
double MACD_Color[];

bool IsCrash=false;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   SetIndexBuffer(0,SIGNAL,INDICATOR_DATA);
   SetIndexBuffer(1,SIGNAL_color,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(2,rachan_BUY,INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,rachan_SELL,INDICATOR_CALCULATIONS);
   SetIndexBuffer(4,MACD,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,MACD_Color,INDICATOR_CALCULATIONS);

   PlotIndexSetInteger(0,PLOT_ARROW,163);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   Handle_WADDATH=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\waddah_attar_explosion.ex5",
                          Fast_MA,
                          Slow_MA,
                          BBPeriod,
                          BBDeviation,
                          Sensetive,
                          DeadZonePip,
                          ExplosionPower,
                          TrendPower,
                          AlertWindow,
                          AlertCount,
                          AlertLong,
                          AlertShort,
                          AlertExitLong,
                          AlertExitShort,
                          IndicatorLevel
                         );

   Handle_RACHAN=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\Rachan Levis25030.ex5",
                         sobrecompra,
                         periodo,
                         sobreventa,
                         Audible_Alerts
                        );

   PlotIndexSetInteger(0,PLOT_LINE_COLOR,0,color1);
   PlotIndexSetInteger(0,PLOT_LINE_COLOR,1,color2);
   PlotIndexSetInteger(0,PLOT_LINE_COLOR,2,color3);
   PlotIndexSetInteger(0,PLOT_LINE_COLOR,3,color4);
   PlotIndexSetInteger(0,PLOT_LINE_COLOR,4,color5);
   PlotIndexSetInteger(0,PLOT_LINE_COLOR,5,color6);
   PlotIndexSetInteger(0,PLOT_LINE_COLOR,6,color7);
   PlotIndexSetInteger(0,PLOT_LINE_COLOR,7,color8);

   /*
      string Activo=Symbol();

      if(StringFind(Activo,"Boom",0)!=-1)
         IsCrash=false;
      else
         if(StringFind(Activo,"Crash",0)!=-1)
            IsCrash=true;
         else
           {
            Alert("El Activo debe ser un Boom o Crash");
            return INIT_FAILED;
           }
   */
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

   if(BarsCalculated(Handle_RACHAN)<rates_total)
      return(0);

   if(BarsCalculated(Handle_WADDATH)<rates_total)
      return(0);
//--- we can copy not all data
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      //--- last value is always copied
      to_copy++;
     }

   if(CopyBuffer(Handle_RACHAN,0,0,to_copy,rachan_BUY)<=0)
      return 0;

   if(CopyBuffer(Handle_RACHAN,1,0,to_copy,rachan_SELL)<=0)
      return 0;

   if(CopyBuffer(Handle_WADDATH,0,0,to_copy,MACD)<=0)
      return 0;

   if(CopyBuffer(Handle_WADDATH,1,0,to_copy,MACD_Color)<=0)
      return 0;


   if(prev_calculated==0)
      ArrayInitialize(SIGNAL,EMPTY_VALUE);

   int Start=MathMax(4,rates_total-(rates_total-prev_calculated));



   for(int shift=Start; shift<rates_total; shift++)
     {
      SIGNAL[shift-1]=EMPTY_VALUE;

      if(IsCrash)
        {
         if(rachan_BUY[shift-2]!=EMPTY_VALUE && MACD_Color[shift-2]==2 && MACD[shift-2]>MACD[shift-1] && MACD[shift-2]>MACD[shift-3])
           {
            if(traspaso)
               if(!(MACD[shift-2]>NivelTraspaso))
                  continue;

            int DetectarColor=FuncionDetectarColor(shift,true);

            SIGNAL[shift-2]=low[shift-2];
            SIGNAL_color[shift-2]=DetectarColor;

            if(shift==rates_total-1)
               Alertas("PICO "+IntegerToString(DetectarColor+1));
           }
        }
      else
        {
         if(rachan_SELL[shift-2]!=EMPTY_VALUE && MACD_Color[shift-2]==1 && MACD[shift-2]>MACD[shift-1] && MACD[shift-2]>MACD[shift-3])
           {
            if(traspaso)
               if(!(MACD[shift-2]>NivelTraspaso))
                  continue;

            // Print(time[shift-2]);
            int DetectarColor=FuncionDetectarColor(shift,false);

            SIGNAL[shift-2]=high[shift-2];
            SIGNAL_color[shift-2]=DetectarColor;

            if(shift==rates_total-1)
               Alertas("PICO "+IntegerToString(DetectarColor+1));
           }
        }
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Alertas(string Frase)
  {
   if(PC)
      Alert(Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));
   if(Movil)
      SendNotification(Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));
   if(Mail)
      SendMail(Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())),Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int FuncionDetectarColor(int shift,bool IsBuy)
  {

   int color_Arrow=0;

   for(int i=shift-3; i>4; i--)
     {
      if(MACD_Color[i]!=(IsBuy?2:1))
         break;

      if(SIGNAL[i]!=EMPTY_VALUE)
        {
         color_Arrow=int(SIGNAL_color[i]);
         color_Arrow++;
         break;
        }
     }

   return color_Arrow;
  }
//+------------------------------------------------------------------+
