//+------------------------------------------------------------------+
//|                                           PROBANDO INDICADOR.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright © Propiedad de Claudio Angelo Chumpitaz Flores"
#property description "Patrones de (ruptura o rebote) de Zonas de Resistencia o Soportes EN UN TIMEFRAME"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 4
#property indicator_plots   2

#property indicator_label1  "DN Rebote"
#property indicator_color1  clrMagenta
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2  "UP Rebote"
#property indicator_color2  clrMagenta
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

#resource "\\Indicators\\Trend direction and force.ex5"
#resource "\\Indicators\\PATRONES ANTIGUO PERSONALIZED V4.ex5"

#include <Indicators\Indicators.mqh>
CIndicators ManejadoIndicadores;


enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12am=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

input string Settings_Condiciones_Patron="======= Settings CONDICIONES PATRON ===========================================";//==========================================================================================
input int VelasEvaluadas=1000;// Velas Historial
input int Testeado=0;// Sop o Res, Fuerza Mayor a...
input bool Repintado=false;
input int Tolerancia_Puntos_Flecha=30;
input string S1__="=====================  Configuracion SOP RES ===========================================";//==========================================================================================
input int BackLimit=500;
input double zone_fuzzfactor=0.75;
bool Ver_Sop_Res=false;
bool zone_show_weak=true;//Mostrar zonas débiles
bool zone_show_untested = true;//Mostrar zonas no probadas
bool zone_show_turncoat = true;//Mostrar zonas rotas
int SeparacionTexto=10;
input string S111__="=============   Configuracion TREND FORCE =========================";//==========================================================================================
input int    trendPeriod  = 4;      // Trend period
input double TriggerUp    =  0.4;   // Trigger up level
input double TriggerDown  = -0.4;   // Trigger down level
string pus1="-------------------------------";
input string Settings_Horario="========== Settings HORARIO ====================";//==========================================================================================
input ENUM_Horas  Hora_Inicio=_8am;
input ENUM_Horas Hora_Final=_8am;
input bool Domingo=true;
input bool Lunes=true;
input bool Martes=true;
input bool Miercoles=true;
input bool Jueves=true;
input bool Viernes=true;
input string S113__="==== CONFIGURACION PERIODOS ============================================";//===============================================================================================
input bool M1=true;
input bool M2=true;
input bool M3=true;
input bool M4=true;
input bool M5=true;
input bool M6=true;
input bool M10=true;
input bool M12=true;
input bool M15=true;
input bool M20=true;
input bool M30=true;
input bool H1=true;
input bool H2=true;
input bool H3=true;
input bool H4=true;
input string S16_="================ CONFIGURACION FILTRO SOP RES CURRENT TIMEFRAME ============================================";//======================================================================
input bool FiltroSopResCURRENTTIMEFRAMES=true;
input double zone_fuzzfactor2=0.75;
input int BackLimit2=500;
input int FuerzaSop=1;
input int Cantidad_Coincidencias=2;
input bool Period_M5=false;//M5
input bool Period_M6=false;//M6
input bool Period_M10=false;//M10
input bool Period_M12=false;//M12
input bool Period_M15=false;//M15
input bool Period_M20=false;//M20
input bool Period_M30=true;//M30
input bool Period_H1=true;//H1
input bool Period_H2=true;//H2
input bool Period_H3=true;//H3
input bool Period_H4=false;//H4
input bool Period_H6=false;//H6
input bool Period_H8=false;//H8
input string Settings_Alerts="======================  Settings ALERTAS ============================================ ";//=================================================================
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;
input string conectors="=========================  Settings Conector ============================================ ";//=================================================================
input bool Conector=false;
input string S112__="=========================   Configuracion MACD   =========================";//===========================================================================
input int Fast_Period=20;
input int Slow_Period=50;
input int Signal_Period=20;
input ENUM_APPLIED_PRICE Applied_Price=PRICE_CLOSE;
input int Distancia=5;
input int Barras_Tendencia=10;
input string pus3="/////////////////////////////////////////////////";
input bool fractals_show3=false;
input double fractal_fast_factor3 = 3.0;
input double fractal_slow_factor3 = 6.0;
input bool SetGlobals3=true;



ENUM_TIMEFRAMES Periodos[];

double ArrowBuy[];
double ArrowSell[];
//double There_Trend[];
//double Fast_Trend[];
//double Start_trend[];
//double Slow_Trend[];
//double Force_Trend[];
double MA[];

CIndicator* Referencia[];

int Bars_TF[];
int  BarrasCargadas[];

//int HandleTrendP;
//int IndicatorTrend;

////REGISTRO
struct TiempoDireccion
  {
   datetime          Tiempo;
   bool              IsBuy;
   double            PrecioApertura;
  };

TiempoDireccion TiemposSignals[];

//int DefinitionMA;

input string pus2="/////////////////////////////////////////////////";
input bool fractals_show=false;
input double fractal_fast_factor = 3.0;
input double fractal_slow_factor = 6.0;
input bool SetGlobals=true;

string pus34="/////////////////////////////////////////////////";
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
int Text_size=10;
string Text_font = "Courier New";
color Text_color = clrWhite;
string sup_name = "Soporte";
string res_name = "Resistencia";
string test_name= "Retesteado";

color color_support_weak     = DarkSlateGray;
color color_support_untested = SeaGreen;
color color_support_verified = Green;
color color_support_proven   = LimeGreen;
color color_support_turncoat = OliveDrab;
color color_resist_weak      = Indigo;
color color_resist_untested  = Orchid;
color color_resist_verified  = Crimson;
color color_resist_proven    = Red;
color color_resist_turncoat  = DarkOrange;
/*
color color_support_weak     = clrAquamarine;//Color de la zona de soporte débil:
color color_support_untested = clrPowderBlue;//Color de la zona de soporte no probado:
color color_support_verified = clrSkyBlue;//Color de la zona de soporte verificado:
color color_support_proven   = clrTurquoise;//Color de la zona de soporte probado:
color color_support_turncoat = clrDarkOrange;//Color de la zona de soporte roto:
color color_resist_weak      = clrOrchid;//Color de la zona de resistencia débil:
color color_resist_untested  = clrMediumOrchid;//Color de la zona de resistencia no probada:
color color_resist_verified  = clrCrimson;//Color de la zona de resistencia verificada:
color color_resist_proven    = clrRed;// Color de la zona de resistencia probada:
color color_resist_turncoat  = clrDarkOrange;//Color de la zona de resistencia rota:*/

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


struct StructFilter
  {
   double            Close[];
   double            High[];
   double            Low[];
   double            Open[];
   int               handle_ATR;
   ENUM_TIMEFRAMES   periodo;
  };


StructFilter FilterSopRes[];

double MACD[];
double MACD_MA[];
int DefinitionMACD;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   int Handle;
   IgualarPeriodos();

   PlotIndexSetInteger(0,PLOT_ARROW,234);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(1,PLOT_ARROW,233);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   DefinitionMACD=iMACD(Symbol(),PERIOD_CURRENT,Fast_Period,Slow_Period,Signal_Period,Applied_Price);

   Handle=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\PATRONES ANTIGUO PERSONALIZED V4.ex5",
                  Settings_Condiciones_Patron,
                  VelasEvaluadas,
                  Testeado,
                  Repintado,
                  Tolerancia_Puntos_Flecha,
                  Settings_Horario,
                  Hora_Inicio,
                  Hora_Final,
                  Domingo,
                  Lunes,
                  Martes,
                  Miercoles,
                  Jueves,
                  Viernes,
                  Settings_Alerts,
                  false,
                  false,
                  false,
                  S1__,
                  false,
                  BackLimit,
                  S111__,
                  trendPeriod,
                  TriggerUp,
                  TriggerDown,
                  pus1,
                  zone_show_weak,
                  zone_show_untested,
                  zone_show_turncoat,
                  zone_fuzzfactor,
                  SeparacionTexto,
                  Conector,pus3,
                  fractals_show3,
                  fractal_fast_factor3,
                  fractal_slow_factor3,
                  SetGlobals3
                 );

//HandleTrendP=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\IndicatorPersonalized.ex5",inpFastLengthP,inpSlowLengthP); // Slow length);
//IndicatorTrend=iCustom(NULL,PERIOD_CURRENT,"::Indicators\\Trend direction and force.ex5",trendPeriodP,TriggerUpP,TriggerDownP);
//DefinitionMA=iMA(Symbol(),PERIOD_CURRENT,MA_Period,MA_Shift,MA_MODE,MA_APPLIED_PRICE);

   ArrayResize(Referencia,ArraySize(Periodos));
   ArrayResize(Bars_TF,ArraySize(Periodos));

   ArrayInitialize(Bars_TF,0);

   MqlParam parameters[];
   ArrayResize(parameters,1);
   ENUM_INDICATOR indicator_type;

   int params=IndicatorParameters(Handle,indicator_type,parameters);
// Print(ArraySize(parameters));
   parameters[0].string_value="::Indicators\\PATRONES ANTIGUO PERSONALIZED V4.ex5";
// Print(GetLastError());


   for(int i=0; i<ArraySize(Periodos); i++)
     {
      int Bar=iBarShift(Symbol(),Periodos[i],iTime(Symbol(),PERIOD_CURRENT,VelasEvaluadas),false);
      if(Bar==-1)
         Bar=VelasEvaluadas;
      parameters[2].integer_value=Bar;
      Referencia[i] =ManejadoIndicadores.Create(Symbol(),Periodos[i],indicator_type,ArraySize(parameters),parameters);
     }

   ManejadoIndicadores.Refresh();

   SetIndexBuffer(0,ArrowSell);
   SetIndexBuffer(1,ArrowBuy);
   SetIndexBuffer(2,MACD);
   SetIndexBuffer(3,MACD_MA);
//SetIndexBuffer(2,Fast_Trend,INDICATOR_CALCULATIONS);
//SetIndexBuffer(3,Start_trend,INDICATOR_CALCULATIONS);
//SetIndexBuffer(4,Slow_Trend,INDICATOR_CALCULATIONS);
//SetIndexBuffer(5,There_Trend,INDICATOR_CALCULATIONS);
//SetIndexBuffer(6,Force_Trend,INDICATOR_CALCULATIONS);
//SetIndexBuffer(7,MA,INDICATOR_CALCULATIONS);

   ArraySetAsSeries(ArrowBuy,true);
   ArraySetAsSeries(ArrowSell,true);
   ArraySetAsSeries(MACD,true);
   ArraySetAsSeries(MACD_MA,true);

//   ArraySetAsSeries(There_Trend,true);
//  ArraySetAsSeries(Fast_Trend,true);
// ArraySetAsSeries(Slow_Trend,true);
// ArraySetAsSeries(Start_trend,true);
// ArraySetAsSeries(Force_Trend,true);
//ArraySetAsSeries(MA,true);

   ArrayResize(TiemposSignals,0);
   ArrayInitialize(Bars_TF,0);

   ArrayInitialize(ArrowBuy,EMPTY_VALUE);
   ArrayInitialize(ArrowSell,EMPTY_VALUE);



   InicializarArrayFilterSupRes();
   ArrayResize(BarrasCargadas,ArraySize(FilterSopRes));
   ArrayInitialize(BarrasCargadas,0);

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

   if(BarsCalculated(DefinitionMACD)<rates_total)
      return(0);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
////// o SIGNAL_LINE............
   if(CopyBuffer(DefinitionMACD,0,0,to_copy,MACD)<=0)
      return 0;
   if(CopyBuffer(DefinitionMACD,1,0,to_copy,MACD_MA)<=0)
      return 0;



   if(rates_total==prev_calculated)
      return rates_total;

//if(BarsCalculated(HandleTrendP)<rates_total)
// return(0);
//  if(BarsCalculated(DefinitionMA)<rates_total)
//   return(0);

   /* int to_copy;
    if(prev_calculated>rates_total || prev_calculated<=0)
       to_copy=rates_total;
    else
      {
       to_copy=rates_total-prev_calculated;
       to_copy++;
      }*/
////// o SIGNAL_LINE............
// if(CopyBuffer(HandleTrendP,3,0,to_copy,There_Trend)<=0)
//  return(0);
// if(CopyBuffer(HandleTrendP,6,0,to_copy,Fast_Trend)<=0)
//  return(0);
// if(CopyBuffer(HandleTrendP,5,0,to_copy,Slow_Trend)<=0)
//  return(0);
//if(CopyBuffer(HandleTrendP,7,0,to_copy,Start_trend)<=0)
// return(0);
//if(CopyBuffer(IndicatorTrend,2,0,to_copy,Force_Trend)<=0)
// return(0);
   /*if(CopyBuffer(DefinitionMA,0,0,to_copy,MA)<=0)
      return 0;*/

   if(!CargaDatosFiltroSupRes())
      return 0;
// static int prevCalculatedAnterior=0;

   ArraySetAsSeries(time,true);
   ArraySetAsSeries(open,true);
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(close,true);

   double ArrayUP[];
   double ArrayDN[];

   if(prev_calculated==0)
     {
      ArrayResize(TiemposSignals,0);
      ArrayInitialize(Bars_TF,0);
      ArrayInitialize(BarrasCargadas,0);
      ArrayInitialize(ArrowBuy,EMPTY_VALUE);
      ArrayInitialize(ArrowSell,EMPTY_VALUE);
      //prevCalculatedAnterior=prev_calculated;
      ManejadoIndicadores.Refresh();
     }
////////// RUPTURA DE SOP o RES


   ArraySetAsSeries(ArrayUP,true);
   ArraySetAsSeries(ArrayDN,true);

   if(prev_calculated!=rates_total)
     {
      ArrowBuy[0]=EMPTY_VALUE;
      ArrowSell[0]=EMPTY_VALUE;
     }

   bool Alerta=false;
   for(int i=0; i<ArraySize(Periodos); i++)
     {
      int BarsTF= iBars(Symbol(),Periodos[i]);

      if(BarsTF!=Bars_TF[i])
        {
         int BarsE=iBarShift(Symbol(),Periodos[i],iTime(Symbol(),PERIOD_CURRENT,VelasEvaluadas),false);
         if(BarsE!=-1)
           {
            ManejadoIndicadores.Refresh();
            // if(BarsCalculated(Referencia[i].Handle())!=BarsTF)
            // return 0;
            int Evaluar=MathMin((Bars_TF[i]==0)?BarsE:(BarsTF-Bars_TF[i]+1),BarsTF-1);

            if(Referencia[i].GetData(0,Evaluar,1,ArrayUP)<=0)
               return 0;
            if(Referencia[i].GetData(0,Evaluar,0,ArrayDN)<=0)
               return 0;

            for(int j=1; j<Evaluar; j++)
              {
               if(j<ArraySize(ArrayUP))
                  if(ArrayUP[j]!=EMPTY_VALUE)
                    {
                     datetime Tiempo=iTime(NULL,Periodos[i],j);
                     Tiempo=Tiempo+PeriodSeconds(Periodos[i])-1;
                     int Bar=iBarShift(Symbol(),Period(),Tiempo,false);
                     if(Bar<rates_total-1 && Bar>=0)
                       {
                        // if(!Habilitar_Trend_Filter || (Slow_Trend[Bar]<=Fast_Trend[Bar]  && close[Bar]>Fast_Trend[Bar]  && There_Trend[Bar]!=EMPTY_VALUE))
                        // {
                        //  if(!Habilitar_TrendForce_Filter || (Force_Trend[Bar]>TriggerUpP))
                        //  {
                        //if(Filtro_MA_FUNCTION(MA,true,Bar,rates_total))
                        //{

                        if(FiltroMACD(rates_total,Bar-1,true))
                           if(FiltroSUPRES(Tiempo,true))
                             {
                              double Precio=iHigh(NULL,Periodos[i],j);
                              ArrayPush(TiemposSignals,time[Bar],true,Precio);
                              ArrowBuy[Bar]=Precio;
                             }
                        //}
                       }
                     //}
                     //}
                    }
               if(j<ArraySize(ArrayDN))
                  if(ArrayDN[j]!=EMPTY_VALUE)
                    {
                     datetime Tiempo=iTime(NULL,Periodos[i],j);
                     Tiempo=Tiempo+PeriodSeconds(Periodos[i])-1;
                     int Bar=iBarShift(Symbol(),Period(),Tiempo,false);
                     if(Bar<rates_total-1 && Bar>=0)
                       {
                        // if(!Habilitar_Trend_Filter || (Slow_Trend[Bar]>=Fast_Trend[Bar] && close[Bar]<Fast_Trend[Bar]  && There_Trend[Bar]!=EMPTY_VALUE))
                        // {
                        //if(!Habilitar_TrendForce_Filter || (Force_Trend[Bar]<TriggerDownP))
                        //{
                        // if(Filtro_MA_FUNCTION(MA,false,Bar,rates_total))
                        // {
                        if(FiltroMACD(rates_total,Bar-1,false))
                           if(FiltroSUPRES(Tiempo,false))
                             {
                              double Precio=iLow(NULL,Periodos[i],j);
                              ArrayPush(TiemposSignals,time[Bar],false,Precio);
                              ArrowSell[Bar]=Precio;
                             }
                        //}
                        // }
                        //}
                       }
                    }
              }
           }
         Bars_TF[i]=BarsTF;
        }

      /*int Cantidad=Referencia[i].GetData(0,VelasEvaluadas,5,Array);
      if(Cantidad<=0)
         return rates_total;
      */
     }

   if(ArrowSell[1]!=EMPTY_VALUE)
      Alertas("Señal SELL");

   if(ArrowBuy[1]!=EMPTY_VALUE)
      Alertas("Señal BUY");

   ChartRedraw();
   static bool Entra=false;
   if(!Entra)
     {
      Print("CARGO INDICADOR ",Symbol()," ",EnumToString(ENUM_TIMEFRAMES(Period())));
      Entra=true;
     }
   /*for(int shift=0; shift<end; shift++)
     {
      ArrowSignalUP[0]=EMPTY_VALUE;
      ArrowSignalDN[0]=EMPTY_VALUE;

      //---
      /*
         static bool X=false;
         static bool Conteo=false;
         static int ConteoS=0;

         double Array[];

         if(!X)
            Print(BarsCalculated(Referencia[10].Handle()));

         Referencia[10].BufferResize(400);

         Referencia[10].Refresh(OBJ_ALL_PERIODS);

         int Cantidad=Referencia[10].GetData(0,300,1,Array);
         if(Cantidad<=0)
            return rates_total;

         ArraySetAsSeries(Array,true);

         string S="";
         for(int i=0; i<ArraySize(Array); i++)
           {
            if(EMPTY_VALUE!=Array[i])
               S=S+"  "+string(i)+"  "+DoubleToString(Array[i]);
           }

         if(!X)
           {
            Print(BarsCalculated(Handles[7]), "  ",Array[0]);
            Print("Entra  C: ",Cantidad,"  ",S);
            X=true;
            S="";
            for(int i=0; i<ArraySize(Array); i++)
              {
               if(EMPTY_VALUE!=Array[i])
                  S=S+"  "+string(i)+"  "+DoubleToString(Array[i]);
              }
            Print("Entra  C: ",Cantidad,"  ",S);

            Print(Referencia[10].Status());
           }


         if(!Conteo)
           {
            if(S!="")
              {
               Print("Conteo ",ConteoS);
               Print(S);
               Conteo=true;
              }
            else
               ConteoS++;
           }
         Comment(S);*/



//--- return value of prev_calculated for next call*/
   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {

   for(int i=0; i<ArraySize(Periodos); i++)
     {
      Referencia[i].FullRelease(true);
      IndicatorRelease(Referencia[i].Handle());
     }

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
void ArrayPush(TiempoDireccion &Tiempos[],datetime TiempoPush,bool DIsBuy,double Precio)
  {
   int Size=ArraySize(Tiempos);
   ArrayResize(Tiempos,Size+1);
   Tiempos[Size].Tiempo=TiempoPush;
   Tiempos[Size].IsBuy=DIsBuy;
   Tiempos[Size].PrecioApertura=Precio;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // Event ID
                  const long& lparam,   // Parameter of type long event
                  const double& dparam, // Parameter of type double event
                  const string& sparam  // Parameter of type string events
                 )
  {
   static int Ultimo=0;


   if(id==CHARTEVENT_KEYDOWN)
     {
      int Size=(ArraySize(TiemposSignals));

      if(lparam==68)
        {
         if(Size==1)
           {
            int Shift=iBarShift(NULL,PERIOD_CURRENT,TiemposSignals[0].Tiempo,false);
            ChartNavigate(0,CHART_END,-Shift);
           }
         else
            if(Ultimo>0)
              {
               Ultimo--;
               int Shift=iBarShift(NULL,PERIOD_CURRENT,TiemposSignals[Ultimo].Tiempo,false);
               ChartNavigate(0,CHART_END,-Shift);

              }
        }

      if(lparam==65)
        {
         if(Size==1)
           {
            int Shift=iBarShift(NULL,PERIOD_CURRENT,TiemposSignals[0].Tiempo,false);
            ChartNavigate(0,CHART_END,-Shift);
           }
         else
            if(Ultimo<(ArraySize(TiemposSignals)-1))
              {
               Ultimo++;
               int Shift=iBarShift(NULL,PERIOD_CURRENT,TiemposSignals[Ultimo].Tiempo,false);
               ChartNavigate(0,CHART_END,-Shift);

              }
        }
     }
  }
//+------------------------------------------------------------------+
void IgualarPeriodos()
  {
   ArrayResize(Periodos,0);

   if(M1)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M1;
     }
   if(M2)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M2;
     }
   if(M3)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M3;
     }
   if(M4)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M4;
     }
   if(M5)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M5;
     }
   if(M6)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M6;
     }
   if(M10)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M10;
     }
   if(M12)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M12;
     }
   if(M15)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M15;
     }
   if(M20)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M20;
     }
   if(M30)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M30;
     }
   if(H1)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_H1;
     }
   if(H2)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_H2;
     }
   if(H3)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_H3;
     }
   if(H4)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_H4;
     }

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*bool Filtro_MA_FUNCTION(double &Array_MA[],bool isBuy,int shift,const int rates_total)
  {

   if(!Filtro_MA)
      return true;

   double T=Array_MA[shift+1]+(isBuy?ToleranciaEMA*Point():(-1)*ToleranciaEMA*Point());
   for(int i=2; i<EvaluacionEMA && shift+i<rates_total; i++)
     {
      if(isBuy)
        {
         if(Array_MA[shift+i]>T)
            return false;
        }
      else
        {
         if(Array_MA[shift+i]<T)
            return false;
        }
     }
   return true;
  }*/
//+------------------------------------------------------------------+
bool FindZones(const double &High[],const double &Close[],const double &Low[],int Prueba,ENUM_TIMEFRAMES TimeFrame,int &DefinitionATR_)
  {
   int i,j=0,shift,bustcount=0,testcount=0;
   double hival,loval;
   bool turned=false,hasturned=false;

   double temp_hi[],temp_lo[];
   ArrayResize(temp_hi,BackLimit2+15);
   ArrayResize(temp_lo,BackLimit2+15);
   int    temp_start[],temp_hits[],temp_strength[],temp_count=0;
   ArrayResize(temp_start,BackLimit2+15);
   ArrayResize(temp_hits,BackLimit2+15);
   ArrayResize(temp_strength,BackLimit2+15);
   bool   temp_turn[],temp_merge[];
   ArrayResize(temp_turn,BackLimit2+15);
   ArrayResize(temp_merge,BackLimit2+15);
   int merge1[],merge2[],merge_count=0;
   ArrayResize(merge1,BackLimit2+15);
   ArrayResize(merge2,BackLimit2+15);
   int BarrasTimeFrame=Bars(Symbol(),TimeFrame);


   for(shift=MathMin(BarrasTimeFrame-1,BackLimit2+Prueba); shift>5+Prueba; shift--)
     {
      bool carga=false;
      double atr=0;
      for(int I2=0; I2<5 && carga==false; I2++)
        {
         double ATRs[1];
         if(CopyBuffer(DefinitionATR_,0,shift,1,ATRs)>0)
            if(BarsCalculated(DefinitionATR_)==BarrasTimeFrame)
              {
               atr=ATRs[0];
               carga=true;
              }
        }
      if(!carga)
        {
         Print("NO CARGO ATR");
         return false;
        }

      //double atr= iATR(NULL,0,7,shift);
      //double atr=ATR[shift];
      double fu = atr/2 * zone_fuzzfactor2;
      bool isWeak;
      bool touchOk= false;
      bool isBust = false;

      if(FastUpPts[shift-Prueba]>0.001)
        {
         isWeak=true;
         if(SlowUpPts[shift-Prueba]>0.001)
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

            if((turned==false && FastUpPts[i-Prueba]>=loval && FastUpPts[i-Prueba]<=hival) ||
               (turned==true && FastDnPts[i-Prueba]<=hival && FastDnPts[i-Prueba]>=loval))
              {
               // Potential touch, just make sure its been 10+candles since the prev one
               touchOk=true;
               for(j=i+1; j<i+11; j++)
                 {
                  if((turned==false && FastUpPts[j-Prueba]>=loval && FastUpPts[j-Prueba]<=hival) ||
                     (turned==true && FastDnPts[j-Prueba]<=hival && FastDnPts[j-Prueba]>=loval))
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
            temp_hi[temp_count] = NormalizeDouble(hival,Digits());
            temp_lo[temp_count] =  NormalizeDouble(loval,Digits());
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
         if(FastDnPts[shift-Prueba]>0.001)
           {
            // a zigzag Low point
            isWeak=true;
            if(SlowDnPts[shift-Prueba]>0.001)
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
               if((turned==true && FastUpPts[i-Prueba]>=loval && FastUpPts[i-Prueba]<=hival) ||
                  (turned==false && FastDnPts[i-Prueba]<=hival && FastDnPts[i-Prueba]>=loval))
                 {
                  // Potential touch, just make sure its been 10+candles since the prev one
                  touchOk=true;
                  for(j=i+1; j<i+11; j++)
                    {
                     if((turned==true && FastUpPts[j-Prueba]>=loval && FastUpPts[j-Prueba]<=hival) ||
                        (turned==false && FastDnPts[j-Prueba]<=hival && FastDnPts[j-Prueba]>=loval))
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

   j=j-Prueba;
   if(zone_merge==true && j>0)
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

// copy the remaining list into our official zones arrays
   zone_count=0;
   int Limite=MathMin(Bars(Symbol(),TimeFrame)-1,500+Prueba);
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
               for(j=5+Prueba; j<Limite; j++)
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

               if(j==Limite)
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
void FastFractals(const double &High[],const double &Low[],int shiftBar,ENUM_TIMEFRAMES TimeFrame)
  {
   int shift;
   int limit=MathMin(Bars(Symbol(),TimeFrame)-1,BackLimit2+shiftBar);
   int P=int((PeriodSeconds(TimeFrame)/60)*fractal_fast_factor);

   ArrayResize(FastDnPts,limit);
   ArrayResize(FastUpPts,limit);
   ArrayResize(SlowDnPts,limit);
   ArrayResize(SlowUpPts,limit);

   FastUpPts[0] = 0.0;
   FastUpPts[1] = 0.0;
   FastDnPts[0] = 0.0;
   FastDnPts[1] = 0.0;

   for(shift=limit; shift>1+shiftBar; shift--)
     {
      if(Fractal(UP_POINT,P,shift,High,Low,shiftBar,TimeFrame)==true)
         FastUpPts[shift-shiftBar]=High[shift];
      else
         FastUpPts[shift-shiftBar]=0.0;

      if(Fractal(DN_POINT,P,shift,High,Low,shiftBar,TimeFrame)==true)
         FastDnPts[shift-shiftBar]=Low[shift];
      else
         FastDnPts[shift-shiftBar]=0.0;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SlowFractals(const double &High[],const double &Low[],int shiftBar,ENUM_TIMEFRAMES TimeFrame)
  {
   int shift;
   int limit=MathMin(Bars(Symbol(),TimeFrame)-1,BackLimit2+shiftBar);
   int P=int((PeriodSeconds(TimeFrame)/60)*fractal_slow_factor);

   SlowUpPts[0] = 0.0;
   SlowUpPts[1] = 0.0;
   SlowDnPts[0]= 0.0;
   SlowDnPts[1] = 0.0;


   for(shift=limit; shift>1+shiftBar; shift--)
     {
      if(Fractal(UP_POINT,P,shift,High,Low,shiftBar,TimeFrame)==true)
         SlowUpPts[shift-shiftBar]=High[shift];
      else
         SlowUpPts[shift-shiftBar]=0.0;

      if(Fractal(DN_POINT,P,shift,High,Low,shiftBar,TimeFrame)==true)
         SlowDnPts[shift-shiftBar]=Low[shift];
      else
         SlowDnPts[shift-shiftBar]=0.0;
     }
  }
//+------------------------------------------------------------------+
bool Fractal(int M,int P,int shift,const double &High[],const double &Low[],int Prueba,ENUM_TIMEFRAMES TimeFrame)
  {
   int PeriodoEva=(PeriodSeconds(TimeFrame)/60);

   if(PeriodoEva>P)
      P=PeriodoEva;

   P=int(P/PeriodoEva*2+MathCeil(P/PeriodoEva/2));

   if(shift-Prueba<P)
      return(false);

   if(shift>=Bars(Symbol(),TimeFrame)-P)
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
bool FiltroSUPRES(datetime Tiempo,bool isBuy)
  {
   if(!FiltroSopResCURRENTTIMEFRAMES)
      return true;


//  if(shift==74)
//   Print(isBuy," ",Close[shift],"  ",Open[shift]);
   int CantidadEntra=0;
   for(int i=0; i<ArraySize(FilterSopRes); i++)
     {
      int Bar=iBarShift(Symbol(),FilterSopRes[i].periodo,Tiempo,false);

      if(Bar!=-1)
        {
         if(!isBuy && FilterSopRes[i].Close[Bar]>FilterSopRes[i].Open[Bar])
            return false;
         if(isBuy && FilterSopRes[i].Close[Bar]<FilterSopRes[i].Open[Bar])
            return false;

         FastFractals(FilterSopRes[i].High,FilterSopRes[i].Low,Bar+(Repintado?0:1),FilterSopRes[i].periodo);
         SlowFractals(FilterSopRes[i].High,FilterSopRes[i].Low,Bar+(Repintado?0:1),FilterSopRes[i].periodo);

         if(!FindZones(FilterSopRes[i].High,FilterSopRes[i].Close,FilterSopRes[i].Low,Bar+(Repintado?0:1),FilterSopRes[i].periodo,FilterSopRes[i].handle_ATR))
            return false;

         if(FiltroSupRes(FilterSopRes[i].Low[Bar],FilterSopRes[i].High[Bar],FilterSopRes[i].Low[Bar+1],
                         FilterSopRes[i].High[Bar+1],FilterSopRes[i].Low[Bar+2],FilterSopRes[i].High[Bar+2],FilterSopRes[i].Close[Bar],isBuy,FilterSopRes[i].periodo,Bar))
            CantidadEntra++;

         if(CantidadEntra>=Cantidad_Coincidencias)
            return true;
        }
     }

   return false;
  }
//+------------------------------------------------------------------+
bool FiltroSupRes(double Low,double High,double Low2,double High2,double Low3,double High3,double Close,bool isBuy,ENUM_TIMEFRAMES TimeFrame,int shift)
  {
   bool entra=false;

   if(!isBuy)
     {
      for(int i=0; i<zone_count; i++)
        {
         // if(zone_type[i]==ZONE_SUPPORT)
         //if(zone_hits[i]>1)
         //       if((zone_hi[i]+Tolerancia_Puntos_Flecha*Point()>Low && zone_lo[i]<Low))
         //        return false;

         if(zone_type[i]==ZONE_RESIST)
            if(zone_hits[i]>FuerzaSop)
               if((zone_lo[i]-Tolerancia_Puntos_Flecha*Point()<High && zone_hi[i]>High) ||
                  (zone_lo[i]-Tolerancia_Puntos_Flecha*Point()<High2 && zone_hi[i]>High2) ||
                  (zone_lo[i]-Tolerancia_Puntos_Flecha*Point()<High3 && zone_hi[i]>High3)
                 )
                  entra= true;
        }
     }
   else
     {
      for(int i=0; i<zone_count; i++)
        {
         //  if(zone_type[i]==ZONE_RESIST)
         //if(zone_hits[i]>1)
         //   if((zone_lo[i]-Tolerancia_Puntos_Flecha*Point()<High && zone_hi[i]>High))
         //    return false;

         if(zone_type[i]==ZONE_SUPPORT)
            if(zone_hits[i]>FuerzaSop)
               if((zone_hi[i]+Tolerancia_Puntos_Flecha*Point()>Low && zone_lo[i]<Low)||
                  (zone_hi[i]+Tolerancia_Puntos_Flecha*Point()>Low2 && zone_lo[i]<Low2)||
                  (zone_hi[i]+Tolerancia_Puntos_Flecha*Point()>Low3 && zone_lo[i]<Low3)
                 )
                  entra=true;
        }
     }


   return entra;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CargaDatosFiltroSupRes()
  {
   for(int i=0; i<ArraySize(FilterSopRes); i++)
     {
      ENUM_TIMEFRAMES Periodo=FilterSopRes[i].periodo;
      int Barras=iBars(Symbol(),Periodo);

      if(Barras!=BarrasCargadas[i])
        {
         if(BarsCalculated(FilterSopRes[i].handle_ATR)!=Barras)
            return false;

         int copied=CopyHigh(NULL,Periodo,0,Barras,FilterSopRes[i].High);
         if(copied<=0)
            return false;

         copied=CopyLow(NULL,Periodo,0,Barras,FilterSopRes[i].Low);
         if(copied<=0)
            return false;

         copied=CopyClose(NULL,Periodo,0,Barras,FilterSopRes[i].Close);
         if(copied<=0)
            return false;

         copied=CopyOpen(NULL,Periodo,0,Barras,FilterSopRes[i].Open);
         if(copied<=0)
            return false;

         BarrasCargadas[i]=Barras;
        }
     }

   return true;
  }
//+------------------------------------------------------------------+
void Alertas(string Frase)
  {

   if(AlertPC)
      Alert(Frase," en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
   if(AlertMovil)
      SendNotification(Frase+" en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
   if(AlertMail)
      SendMail("Signal Personalizrd "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),Frase+" en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void InicializarArrayFilterSupRes()
  {

   if(Period_M5)
     {
      int Size=ArraySize(FilterSopRes);
      ArrayResize(FilterSopRes,Size+1);
      FilterSopRes[Size].periodo=PERIOD_M5;
     }
   if(Period_M6)
     {
      int Size=ArraySize(FilterSopRes);
      ArrayResize(FilterSopRes,Size+1);
      FilterSopRes[Size].periodo=PERIOD_M6;
     }
   if(Period_M10)
     {
      int Size=ArraySize(FilterSopRes);
      ArrayResize(FilterSopRes,Size+1);
      FilterSopRes[Size].periodo=PERIOD_M10;
     }
   if(Period_M12)
     {
      int Size=ArraySize(FilterSopRes);
      ArrayResize(FilterSopRes,Size+1);
      FilterSopRes[Size].periodo=PERIOD_M12;
     }
   if(Period_M15)
     {
      int Size=ArraySize(FilterSopRes);
      ArrayResize(FilterSopRes,Size+1);
      FilterSopRes[Size].periodo=PERIOD_M15;
     }
   if(Period_M20)
     {
      int Size=ArraySize(FilterSopRes);
      ArrayResize(FilterSopRes,Size+1);
      FilterSopRes[Size].periodo=PERIOD_M20;
     }
   if(Period_M30)
     {
      int Size=ArraySize(FilterSopRes);
      ArrayResize(FilterSopRes,Size+1);
      FilterSopRes[Size].periodo=PERIOD_M30;
     }
   if(Period_H1)
     {
      int Size=ArraySize(FilterSopRes);
      ArrayResize(FilterSopRes,Size+1);
      FilterSopRes[Size].periodo=PERIOD_H1;
     }
   if(Period_H2)
     {
      int Size=ArraySize(FilterSopRes);
      ArrayResize(FilterSopRes,Size+1);
      FilterSopRes[Size].periodo=PERIOD_H2;
     }
   if(Period_H3)
     {
      int Size=ArraySize(FilterSopRes);
      ArrayResize(FilterSopRes,Size+1);
      FilterSopRes[Size].periodo=PERIOD_H3;
     }
   if(Period_H4)
     {
      int Size=ArraySize(FilterSopRes);
      ArrayResize(FilterSopRes,Size+1);
      FilterSopRes[Size].periodo=PERIOD_H4;
     }
   if(Period_H6)
     {
      int Size=ArraySize(FilterSopRes);
      ArrayResize(FilterSopRes,Size+1);
      FilterSopRes[Size].periodo=PERIOD_H6;
     }
   if(Period_H8)
     {
      int Size=ArraySize(FilterSopRes);
      ArrayResize(FilterSopRes,Size+1);
      FilterSopRes[Size].periodo=PERIOD_H8;
     }


   for(int i=0; i<ArraySize(FilterSopRes); i++)
     {
      FilterSopRes[i].handle_ATR=iATR(Symbol(),FilterSopRes[i].periodo,7);
      ArraySetAsSeries(FilterSopRes[i].Close,true);
      ArraySetAsSeries(FilterSopRes[i].Open,true);
      ArraySetAsSeries(FilterSopRes[i].High,true);
      ArraySetAsSeries(FilterSopRes[i].Low,true);
     }
  }
//+------------------------------------------------------------------+
bool FiltroMACD(int rates,int shift,bool IsBuy)
  {
   return true;

   double Punto[2];
   uint indice=0;
   int dist=-1;
   if(IsBuy)
     {
      if(MACD[shift+1]<0)
        {
         for(int i=1; i<=Barras_Tendencia && shift+i<rates; i++)
           {
            if(MACD[shift+i]<MACD_MA[shift+i])
               return false;
           }

         for(int i=2; shift+i<rates-3; i++)
           {
            if(MACD[shift+i+1]>0)
               return false;

            if(dist>=0)
               dist++;

            if(MACD[shift+i+1]>MACD[shift+i] && MACD[shift+i-1]>MACD[shift+i])
              {
               Punto[indice]=MACD[shift+i];
               if(indice==0)
                 {
                  indice=1;
                  dist=0;
                 }
               else
                 {
                  if(dist>=Distancia)
                     if(Punto[1]<Punto[0])
                        return true;
                 }
              }
           }
        }
     }
   else
     {
      if(MACD[shift+1]>0)
        {
         for(int i=1; i<=Barras_Tendencia && shift+i<rates; i++)
           {
            if(MACD[shift+i]>MACD_MA[shift+i])
               return false;
           }


         for(int i=2; shift+i<rates-3; i++)
           {
            if(MACD[shift+i+1]<0)
               return false;

            if(dist>=0)
               dist++;

            if(MACD[shift+i+1]<MACD[shift+i] && MACD[shift+i-1]<MACD[shift+i])
              {
               Punto[indice]=MACD[shift+i];
               if(indice==0)
                 {
                  indice=1;
                  dist=0;
                 }
               else
                 {
                  if(dist>=Distancia)
                     if(Punto[1]>Punto[0])
                        return true;
                 }
              }
           }
        }
     }
   return false;
  }
//+------------------------------------------------------------------+
