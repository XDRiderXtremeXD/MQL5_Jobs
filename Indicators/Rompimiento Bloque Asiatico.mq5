//+------------------------------------------------------------------+
//|                           ADX_Indicador_3_con_Klinger_Prueba.mq5 |
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
#property indicator_width1  2

#property indicator_label2  "BUY"
#property indicator_color2  clrMagenta
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12am=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

input ENUM_Horas HoraInicio=_0am;
input ENUM_Horas HoraFinal=_10am;
input string Settings_Alerts="***Settings_Alerts***";
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;

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

int DIFERENCIA=0;

MqlRates Rates[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   DIFERENCIA=EvaluaHorario(HoraInicio,HoraFinal);
   
   IndicatorSetString(INDICATOR_SHORTNAME,"Indicador Rompimiento");
//172, 115
   SetIndexBuffer(0,ArrowSignalUP);
   SetIndexBuffer(1,ArrowSignalDN);

   PlotIndexSetInteger(0,PLOT_ARROW,233);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(1,PLOT_ARROW,234);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

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
      
     MqlDateTime TimeMql; 
     TimeToStruct(time[shift],TimeMql);
     if(TimeMql.hour!=HoraFinal)
     continue;
    
      
      int Indice=iBarShift(Symbol(),PERIOD_D1,time[shift],false)+1;
      if(Indice<=0)Indice=1;
      double DiaHigh= iHigh(Symbol(),PERIOD_D1,Indice);
      double DiaLow= iLow(Symbol(),PERIOD_D1,Indice);
      
      double DiaHigh_Anterior= iHigh(Symbol(),PERIOD_D1,Indice+1);
      double DiaLow_Anterior= iLow(Symbol(),PERIOD_D1,Indice+1);
      
      int IndiceHigh=iHighest(Symbol(),PERIOD_H1,MODE_HIGH,DIFERENCIA,rates_total-shift);
      int IndiceLow=iLowest(Symbol(),PERIOD_H1,MODE_LOW,DIFERENCIA,rates_total-shift);
      double HighHorario=iHigh(Symbol(),PERIOD_H1,IndiceHigh);
      double LowHorario=iLow(Symbol(),PERIOD_H1,IndiceLow);
      
     
      if(HighHorario>DiaHigh && DiaHigh_Anterior<DiaHigh && close[shift-1]>((HighHorario-LowHorario)/2.0)+LowHorario)
      ArrowSignalUP[shift-1]=low[shift-1];
      
      if(LowHorario<DiaLow && DiaLow_Anterior>DiaLow && close[shift-1]<((HighHorario-LowHorario)/2.0)+LowHorario)
      ArrowSignalDN[shift-1]=high[shift-1];

     }
   prevTime=time[rates_total-1];
//--- return value of prev_calculated for next call
   return(rates_total);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Alertas(string Frase)
  {
   if(AlertPC)
      Alert("Operacion"+Frase+" en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
   if(AlertMovil)
      SendNotification("Signal "+Frase+" en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
   if(AlertMail)
      SendMail("Signal "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion "+Frase+" en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
  }
//+------------------------------------------------------------------+

int EvaluaHorario(int Apertura,int Cierre)
  {
   int Diferencia=0;
   bool EntraHorario=false;
   if(Apertura>Cierre)
      Diferencia=Cierre+24-Apertura;
   else
      if(Apertura<Cierre)
      Diferencia=Cierre-Apertura;
   return Diferencia;
  }