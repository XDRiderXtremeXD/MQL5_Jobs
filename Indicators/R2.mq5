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
#property indicator_buffers 2
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
#resource "\\Indicators\\Q.ex5"

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
input string sC="=========================  Settings Size ============================================ ";//=================================================================
input int sizeCandle=250;


ENUM_TIMEFRAMES Periodos[];

double ArrowBuy[];
double ArrowSell[];
double MA[];

CIndicator* Referencia[];

int Bars_TF[];

////REGISTRO

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
   int               Barras;
  };

StructFilter FilterSopRes[];
int HandleAlligator=0;

double UP_[];
double Middle_[];
double DN_[];
int Tolerancia_Alligator=100;

int handle_Fast=0;
int handle_Slow=0;

double MA_Fast[];
double MA_Slow[];

double UP_Bollinger[];
double Middle_Bollinger[];
double DN_Bollinger[];

int handle_Bollinger=0;

double EST[];
int handle_EST=0;

string S5="-----------------------   Configuracion Medias Moviles  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
int Ma_Periodo_Fast=12;
int Ma_Periodo_Slow=26;
int Ma_Shift=0;
ENUM_MA_METHOD Ma_Method=MODE_EMA;
ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;
input string S6="-----------------------   Configuracion Bollinger  ---------------------";//--------------------------------------------------
input int BB_Period=20;
input double BB_Deviation=2.5;
input int BB_Shift=0;
input ENUM_APPLIED_PRICE BB_AppliedPrice=PRICE_CLOSE;
input int Percent_BB=45.0;
input string S7="-----------------------   Configuracion ESTOCASTICO  ---------------------";//--------------------------------------------------
input int K_Periodo=40;
input int D_Periodo=10;
input int Slowing=20;
input ENUM_MA_METHOD Ma_Method_EST=MODE_SMA;
input ENUM_STO_PRICE STO_EST=STO_LOWHIGH;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string Simbolo=Symbol();
ENUM_TIMEFRAMES PeriodoAcual=Period();
double Point_=0;
ENUM_TIMEFRAMES PeriodoMaximo=Period();
int PeriodoSuma=1;

bool FiltroSizeAtras=true;
bool FiltroMA_=true;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   PeriodoMaximo=Period();
   Simbolo=Symbol();
   PeriodoAcual=Period();
   Point_=Point();

   int Handle;
   IgualarPeriodos();

   PlotIndexSetInteger(0,PLOT_ARROW,234);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(1,PLOT_ARROW,233);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   handle_Fast=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo_Fast,Ma_Shift,Ma_Method,Ma_AppliedPrice);
   handle_Slow=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo_Slow,Ma_Shift,Ma_Method,Ma_AppliedPrice);
   handle_Bollinger=iBands(Symbol(),PERIOD_CURRENT,BB_Period,BB_Shift,BB_Deviation,BB_AppliedPrice);
   handle_EST=iStochastic(Symbol(),PERIOD_CURRENT,K_Periodo,D_Periodo,Slowing,Ma_Method_EST,STO_EST);


   Handle=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\Q.ex5",
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
                  Conector);

   HandleAlligator=iAlligator(Symbol(),PERIOD_CURRENT,13,8,8,5,5,3,MODE_SMMA,PRICE_MEDIAN);

   ArrayResize(Referencia,ArraySize(Periodos));
   ArrayResize(Bars_TF,ArraySize(Periodos));

   ArrayInitialize(Bars_TF,0);

   MqlParam parameters[];
   ArrayResize(parameters,1);
   ENUM_INDICATOR indicator_type;

   int params=IndicatorParameters(Handle,indicator_type,parameters);
// Print(ArraySize(parameters));
   parameters[0].string_value="::Indicators\\Q.ex5";
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


   ArraySetAsSeries(ArrowBuy,true);
   ArraySetAsSeries(ArrowSell,true);
   ArraySetAsSeries(UP_,true);
   ArraySetAsSeries(Middle_,true);
   ArraySetAsSeries(DN_,true);
   ArraySetAsSeries(MA_Fast,true);
   ArraySetAsSeries(MA_Slow,true);
   ArraySetAsSeries(UP_Bollinger,true);
   ArraySetAsSeries(Middle_Bollinger,true);
   ArraySetAsSeries(DN_Bollinger,true);
   ArraySetAsSeries(EST,true);

   ArrayInitialize(Bars_TF,0);

   ArrayInitialize(ArrowBuy,EMPTY_VALUE);
   ArrayInitialize(ArrowSell,EMPTY_VALUE);


   if(FiltroSopResCURRENTTIMEFRAMES)
      InicializarArrayFilterSupRes();
   else
      ArrayResize(FilterSopRes,0);

   PeriodoSuma=int(PeriodSeconds(PeriodoMaximo)/PeriodSeconds(Period()))+1;
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

   if(rates_total==prev_calculated)
      return rates_total;

   if(!CargaDatosFiltroSupRes())
      return 0;

   if(!CargaIndicadores(rates_total,prev_calculated))
      return 0;

//Print(DoubleToString(UP_[1],Digits()),"   ",DoubleToString(Middle_[1],Digits()),"   ",DoubleToString(DN_[1],Digits()));
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
      ArrayInitialize(Bars_TF,0);
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
      int BarsTF= iBars(Simbolo,Periodos[i]);
      if(BarsTF==0)
         return 0;

      if(BarsTF!=Bars_TF[i])
        {
         int BarsE=iBarShift(Simbolo,Periodos[i],iTime(Simbolo,PERIOD_CURRENT,VelasEvaluadas),false);

         if(BarsE!=-1)
           {
            ManejadoIndicadores.Refresh();

            int Evaluar=(Bars_TF[i]==0)?BarsE:(BarsTF-Bars_TF[i]+1);

            if(BarsCalculated(Referencia[i].Handle())!=BarsTF)
              {
               Print("Entra  1 "+Symbol());
               return 0;
              }
            if(Referencia[i].GetData(0,Evaluar,1,ArrayUP)<=0)
              {
               Print("Entra  2 "+Symbol());
               return 0;
              }
            if(Referencia[i].GetData(0,Evaluar,0,ArrayDN)<=0)
              {
               Print("Entra  3 "+Symbol());
               return 0;
              }

            for(int j=1; j<Evaluar; j++)
              {
               if(j<ArraySize(ArrayUP))
                  if(ArrayUP[j]!=EMPTY_VALUE)
                    {
                     datetime Tiempo=iTime(NULL,Periodos[i],j);
                     Tiempo=Tiempo+PeriodSeconds(Periodos[i])-1;
                     int Bar=iBarShift(Simbolo,PeriodoAcual,Tiempo,false);
                     double price=ArrayUP[j];

                     if(Bar<rates_total-1 && Bar>=0)
                       {
                        if(FiltroSizeCandle(Bar,true,close,open,rates_total))
                           if(FiltroTraspaso(Bar,price,true,close,open,high,low,rates_total))
                              if(FiltroAlligator(Bar,high,low))
                                 if(FiltroBollinger(Bar,true,high,low))
                                    if(FiltroEstocastico(Bar,true))
                                       if(FiltroMA(Bar,true,high,low))
                                          if(FiltroSUPRES(Tiempo,true))
                                            {
                                             double Precio=iHigh(NULL,Periodos[i],j);
                                             ArrowBuy[Bar]=Precio;
                                             if(Bar==1)
                                                Print("Entro BUY ",Simbolo);
                                            }
                       }
                    }
               if(j<ArraySize(ArrayDN))
                  if(ArrayDN[j]!=EMPTY_VALUE)
                    {
                     datetime Tiempo=iTime(NULL,Periodos[i],j);
                     Tiempo=Tiempo+PeriodSeconds(Periodos[i])-1;
                     int Bar=iBarShift(Simbolo,PeriodoAcual,Tiempo,false);
                     double price=ArrayDN[j];

                     if(Bar<rates_total-1 && Bar>=0)
                       {
                        if(FiltroSizeCandle(Bar,false,close,open,rates_total))
                           if(FiltroTraspaso(Bar,price,false,close,open,high,low,rates_total))
                              if(FiltroAlligator(Bar,high,low))
                                 if(FiltroBollinger(Bar,false,high,low))
                                    if(FiltroEstocastico(Bar,false))
                                       if(FiltroMA(Bar,false,high,low))
                                          if(FiltroSUPRES(Tiempo,false))
                                            {
                                             double Precio=iLow(NULL,Periodos[i],j);
                                             ArrowSell[Bar]=Precio;
                                             if(Bar==1)
                                                Print("Entro SELL ",Simbolo);
                                            }
                       }
                    }
              }
           }

         Bars_TF[i]=BarsTF;
        }
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

//ArrayResize(ArrowBuy,0);
//ArrayResize(ArrowSell,0);
   ArrayResize(UP_,0);
   ArrayResize(Middle_,0);
   ArrayResize(DN_,0);
   ArrayResize(MA_Fast,0);
   ArrayResize(MA_Slow,0);
   ArrayResize(UP_Bollinger,0);
   ArrayResize(Middle_Bollinger,0);
   ArrayResize(DN_Bollinger,0);
   ArrayResize(EST,0);


   Print("PrevCalculated: ",prev_calculated,"  Rates_total: ",rates_total);
   Print("Entra ",Symbol());
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
void IgualarPeriodos()
  {
   ArrayResize(Periodos,0);

   if(M5)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M5;
      PeriodoMaximo=PERIOD_M5;
     }
   if(M6)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M6;
      PeriodoMaximo=PERIOD_M6;
     }
   if(M10)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M10;
      PeriodoMaximo=PERIOD_M10;
     }
   if(M12)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M12;
      PeriodoMaximo=PERIOD_M12;
     }
   if(M15)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M15;
      PeriodoMaximo=PERIOD_M15;
     }
   if(M20)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M20;
      PeriodoMaximo=PERIOD_M20;
     }
   if(M30)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_M30;
      PeriodoMaximo=PERIOD_M30;
     }
   if(H1)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_H1;
      PeriodoMaximo=PERIOD_H1;
     }
   if(H2)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_H2;
      PeriodoMaximo=PERIOD_H2;
     }
   if(H3)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_H3;
      PeriodoMaximo=PERIOD_H3;
     }
   if(H4)
     {
      int Size=ArraySize(Periodos);
      ArrayResize(Periodos,Size+1);
      Periodos[Size]=PERIOD_H4;
      PeriodoMaximo=PERIOD_H4;
     }

  }
//+------------------------------------------------------------------+
bool FindZones(const double &High[],const double &Close[],const double &Low[],int Prueba,ENUM_TIMEFRAMES TimeFrame,int &DefinitionATR_,double ZoneFractor2,int blimit)
  {
   int i,j=0,shift,bustcount=0,testcount=0;
   double hival,loval;
   bool turned=false,hasturned=false;

   double temp_hi[],temp_lo[];
   ArrayResize(temp_hi,blimit+15);
   ArrayResize(temp_lo,blimit+15);
   int    temp_start[],temp_hits[],temp_strength[],temp_count=0;
   ArrayResize(temp_start,blimit+15);
   ArrayResize(temp_hits,blimit+15);
   ArrayResize(temp_strength,blimit+15);
   bool   temp_turn[],temp_merge[];
   ArrayResize(temp_turn,blimit+15);
   ArrayResize(temp_merge,blimit+15);
   int merge1[],merge2[],merge_count=0;
   ArrayResize(merge1,blimit+15);
   ArrayResize(merge2,blimit+15);
   int BarrasTimeFrame=Bars(Symbol(),TimeFrame);


   for(shift=MathMin(BarrasTimeFrame-1,blimit+Prueba); shift>5+Prueba; shift--)
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
      double fu = atr/2 * ZoneFractor2;
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
void FastFractals(const double &High[],const double &Low[],int shiftBar,ENUM_TIMEFRAMES TimeFrame,int bLimit)
  {
   int shift;
   int limit=MathMin(Bars(Symbol(),TimeFrame)-1,bLimit+shiftBar);
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
void SlowFractals(const double &High[],const double &Low[],int shiftBar,ENUM_TIMEFRAMES TimeFrame,int blimit)
  {
   int shift;
   int limit=MathMin(Bars(Symbol(),TimeFrame)-1,blimit+shiftBar);
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

   bool entraH1=false;
   bool entraH2=false;
   bool entraH3=false;
   bool entraH4=false;

   bool entraM5=false;
   bool entraM6=false;
//  if(shift==74)
//   Print(isBuy," ",Close[shift],"  ",Open[shift]);
   int CantidadEntra=0;


//Print("Size  ",ArraySize(FilterSopRes));
   for(int i=0; i<ArraySize(FilterSopRes); i++)
     {
      // Print(EnumToString(FilterSopRes[i].periodo));

      int Bar=iBarShift(Symbol(),FilterSopRes[i].periodo,Tiempo,false);
      //  Print(Bar);
      if(Bar!=-1)
        {
         if(Bar>=FilterSopRes[i].Barras-10)
            continue;

         int Fsop=FuerzaSop;
         double ZoneFractor=zone_fuzzfactor2;
         int blimit=BackLimit2;
         if(FilterSopRes[i].periodo==PERIOD_M5)
           {
            Fsop=2;
            ZoneFractor=2;
            blimit=200;
           }
         if(FilterSopRes[i].periodo==PERIOD_M6)
           {
            Fsop=2;
            ZoneFractor=2;
            blimit=200;
           }
         
        /*if(FilterSopRes[i].periodo==PERIOD_M30)
         {
          Fsop=1;
          ZoneFractor=2;
          blimit=350;
         }*/
        /*if(FilterSopRes[i].periodo==PERIOD_H1)
         {
          Fsop=1;
          ZoneFractor=2;
           blimit=300;
         }*/

         //if(!isBuy && FilterSopRes[i].Close[Bar]>FilterSopRes[i].Open[Bar])
         // return false;
         // if(isBuy && FilterSopRes[i].Close[Bar]<FilterSopRes[i].Open[Bar])
         //  return false;

         FastFractals(FilterSopRes[i].High,FilterSopRes[i].Low,Bar+(Repintado?0:1),FilterSopRes[i].periodo,blimit);
         SlowFractals(FilterSopRes[i].High,FilterSopRes[i].Low,Bar+(Repintado?0:1),FilterSopRes[i].periodo,blimit);

         if(!FindZones(FilterSopRes[i].High,FilterSopRes[i].Close,FilterSopRes[i].Low,Bar+(Repintado?0:1),FilterSopRes[i].periodo,FilterSopRes[i].handle_ATR,ZoneFractor,blimit))
            return false;

         if(FiltroSupRes(FilterSopRes[i].Low[Bar],FilterSopRes[i].High[Bar],FilterSopRes[i].Low[Bar+1],
                         FilterSopRes[i].High[Bar+1],FilterSopRes[i].Low[Bar+2],FilterSopRes[i].High[Bar+2],FilterSopRes[i].Close[Bar],isBuy,FilterSopRes[i].periodo,Bar,Fsop))
           {
            CantidadEntra++;
            if(FilterSopRes[i].periodo==PERIOD_M30)
               entraH1=true;
            if(FilterSopRes[i].periodo==PERIOD_H1)
               entraH1=true;
            if(FilterSopRes[i].periodo==PERIOD_H2)
               entraH2=true;
            if(FilterSopRes[i].periodo==PERIOD_H3)
               entraH3=true;
            if(FilterSopRes[i].periodo==PERIOD_H4)
               entraH4=true;

            if(FilterSopRes[i].periodo==PERIOD_M5)
               entraM5=true;
            if(FilterSopRes[i].periodo==PERIOD_M6)
               entraM6=true;
           }
        }
     }


   if(entraH1==false && entraH2==false && entraH3==false && entraH4==false)
      return false;

   if(entraM5==false || entraM6==false)
      return false;
   
   if(CantidadEntra>=Cantidad_Coincidencias)
      return true;

   return false;
  }
//+------------------------------------------------------------------+
bool FiltroSupRes(double Low,double High,double Low2,double High2,double Low3,double High3,double Close,bool isBuy,ENUM_TIMEFRAMES TimeFrame,int shift,int FSop)
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
            if(zone_hits[i]>FSop)
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
            if(zone_hits[i]>FSop)
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

   if(FiltroSopResCURRENTTIMEFRAMES)
      for(int i=0; i<ArraySize(FilterSopRes); i++)
        {
         ENUM_TIMEFRAMES Periodo=FilterSopRes[i].periodo;

         int BarrasPeriodo=iBars(Symbol(),Periodo);

         if(BarrasPeriodo==0)
            return false;

         if(BarrasPeriodo!=FilterSopRes[i].Barras)
           {
            if(BarsCalculated(FilterSopRes[i].handle_ATR)!=BarrasPeriodo)
               return false;

            int copied=CopyHigh(NULL,Periodo,0,BarrasPeriodo,FilterSopRes[i].High);
            if(copied<=0)
               return false;

            copied=CopyLow(NULL,Periodo,0,BarrasPeriodo,FilterSopRes[i].Low);
            if(copied<=0)
               return false;

            copied=CopyClose(NULL,Periodo,0,BarrasPeriodo,FilterSopRes[i].Close);
            if(copied<=0)
               return false;

            copied=CopyOpen(NULL,Periodo,0,BarrasPeriodo,FilterSopRes[i].Open);
            if(copied<=0)
               return false;

            FilterSopRes[i].Barras=BarrasPeriodo;
           }
        }

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
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
      FilterSopRes[i].Barras=0;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CargaIndicadores(int const rates_total, int const prev_calculated)
  {
// Verificar si todos los datos están calculados
   if(BarsCalculated(handle_Bollinger) < rates_total ||
      BarsCalculated(HandleAlligator) < rates_total ||
      BarsCalculated(handle_Fast) < rates_total ||
      BarsCalculated(handle_Slow) < rates_total ||
      BarsCalculated(handle_EST) < rates_total)
     {
      return false;
     }

// Determinar cuántos valores copiar
   int to_copy=0;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=MathMin(rates_total,VelasEvaluadas+20);
   else
     {
      to_copy=rates_total-prev_calculated;
      //--- last value is always copied
      to_copy=MathMin(3+PeriodoSuma+20,rates_total);
     }

// Copiar los valores necesarios de cada indicador
   if(CopyBuffer(HandleAlligator, 0, -16, to_copy, UP_) <= 0 ||
      CopyBuffer(HandleAlligator, 1, -10, to_copy, Middle_) <= 0 ||
      CopyBuffer(HandleAlligator, 2, -6, to_copy, DN_) <= 0 ||
      CopyBuffer(handle_Fast, 0, 0, to_copy, MA_Fast) <= 0 ||
      CopyBuffer(handle_Slow, 0, 0, to_copy, MA_Slow) <= 0 ||
      CopyBuffer(handle_Bollinger, 1, 0, to_copy, UP_Bollinger) <= 0 ||
      CopyBuffer(handle_Bollinger, 0, 0, to_copy, Middle_Bollinger) <= 0 ||
      CopyBuffer(handle_Bollinger, 2, 0, to_copy, DN_Bollinger) <= 0 ||
      CopyBuffer(handle_EST, 0, 0, to_copy, EST) <= 0)
     {
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroAlligator(int barra,double const &high[],double const &low[])
  {
// return true;
   double low_=low[barra]-Point()*Tolerancia_Alligator;
   double high_=high[barra]+Point()*Tolerancia_Alligator;

   if(low_<=UP_[barra] && high_>=UP_[barra])
      return true;
   if(low_<=Middle_[barra] && high_>=Middle_[barra])
      return true;
   if(low_<=DN_[barra] && high_>=DN_[barra])
      return true;

//  if(low[barra]>=DN_[barra] && high[barra]>=DN_[barra]);
// return true;

   return false;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroBollinger(int barra,bool IsBuy,double const &high[],double const &low[])
  {
   if(IsBuy)
     {
      double Size=MathAbs(Middle_Bollinger[barra]-UP_Bollinger[barra]);
      double Price= Middle_Bollinger[barra]+Size*Percent_BB/100.0;
      if(high[barra]>Price)
         return true;
     }
   else
     {
      double Size=MathAbs(Middle_Bollinger[barra]-DN_Bollinger[barra]);
      double Price= Middle_Bollinger[barra]-Size*Percent_BB/100.0;
      if(low[barra]<Price)
         return true;
     }
//  if(low[barra]>=DN_[barra] && high[barra]>=DN_[barra]);
// return true;

   return false;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroEstocastico(int barra,bool IsBuy)
  {
   if(IsBuy)
     {
      if(EST[barra]>=80)
         return false;
     }
   else
     {
      if(EST[barra]<=20)
         return false;
     }
//  if(low[barra]>=DN_[barra] && high[barra]>=DN_[barra]);
// return true;

   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroMA(int barra,bool IsBuy,double const &high[],double const &low[])
  {
   if(!FiltroMA_)
      return true;


   if(IsBuy)
     {
      if(MA_Fast[barra]>MA_Slow[barra])
         return true;
      else
         if(high[barra]>MA_Slow[barra])
            return true;
     }
   else
     {
      if(MA_Fast[barra]<MA_Slow[barra])
         return true;
      else
         if(low[barra]<MA_Slow[barra])
            return true;
     }

//  if(low[barra]>=DN_[barra] && high[barra]>=DN_[barra]);
// return true;

   return false;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroSizeCandle(int bar,bool IsBuy,double const &close[],double const &open[],int const rates_total)
  {
   if(IsBuy?(open[bar]>close[bar]):(open[bar]<close[bar]))
      return false;

   if(int(MathAbs(open[bar]-close[bar])/Point())>=sizeCandle)
      return false;

   if(!FiltroSizeAtras)
      return true;

   double size=0;
   double secondPoint=close[bar];
   double firstPoint=open[bar];
   for(int i=0; i<=10 && bar+i<rates_total-1; i++)
     {
      if(IsBuy?(open[bar+i+1]>close[bar+i]):(open[bar+i+1]<close[bar+i]))
         break;

      firstPoint=open[bar+i];
     }

   return (int(MathAbs(secondPoint-firstPoint)/Point())<=sizeCandle);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroTraspaso(int bar,double price,bool IsBuy,double const &close[],double const &open[],double const &high[],double const &low[],int const rates_total)
  {
   int traspaso=15;
   int tolerancia=30;

   double rango=MathAbs(close[bar]-open[bar]);

   /*if(IsBuy?(price<(open[bar]+rango*40/100.0)):(price>(open[bar]-rango*20/100.0)))
      return false;*/
   /*if(IsBuy?(high[bar]-close[bar]>close[bar]-low[bar]):(close[bar]-low[bar]>high[bar]-close[bar]))
         return false;*/

   for(int i=1; i<=traspaso && bar+i<rates_total; i++)
     {
      double up=close[bar+i]>open[bar+i]?close[bar+i]:open[bar+i];
      double dn=close[bar+i]<open[bar+i]?close[bar+i]:open[bar+i];

      if(IsBuy?(high[bar]+tolerancia*Point()<close[bar+i]):(low[bar]-tolerancia*Point()>close[bar+i]))
         return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
