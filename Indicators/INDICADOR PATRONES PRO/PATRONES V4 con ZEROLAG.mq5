//+------------------------------------------------------------------+
//|                                      PATRONES V4 con ZEROLAG.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+//+------------------------------------------------------------------+
//|                             PATRONES ANTIGUO PERSONALIZED V4.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright © Propiedad de Claudio Angelo Chumpitaz Flores"
#property description "Patrones de (ruptura o rebote) de Zonas de Resistencia o Soportes"

#property indicator_chart_window
#property indicator_buffers 13
#property indicator_plots   6

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

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12am=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

long CHART_ID=0;

string NAME_CARGANDO="cod 002 CARGANDO";
string Identificacion="LINEAS 2021";

input string Settings_Condiciones_Patron="-----------------------Settings CONDICIONES PATRON-----------------------";
input int VelasEvaluadas=1000;// Velas Historial
input int Testeado=0;// Sop o Res, Fuerza Mayor a...
input bool Repintado=false;
input int Tolerancia_Puntos_Flecha=0;
input string Settings_Horario="-----------------------Settings HORARIO-----------------------";
input ENUM_Horas  Hora_Inicio=_8am;
input ENUM_Horas Hora_Final=_8am;
input bool Domingo=true;
input bool Lunes=true;
input bool Martes=true;
input bool Miercoles=true;
input bool Jueves=true;
input bool Viernes=true;
input string Settings_Alerts="-----------------------Settings ALERTAS-----------------------";
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;
input string S1__="-----------------------   Configuracion SOP RES---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Ver_Sop_Res=false;
input int BackLimit=500;
input string S112__="-----------------------   Configuracion ZERO LAG --------------------";//----------------------------------------------------------------------------------------------
input bool Filtro_ZL=true;
input ENUM_APPLIED_PRICE inpPrice  = PRICE_MEDIAN; // Price
input double             inpPeriod = 100;           // Period
input uint VelasEvaluaZeroLag=3;
input string S111__="-----------------------   Configuracion TREND FORCE--------------------";//----------------------------------------------------------------------------------------------------------------
input int    trendPeriod  = 4;      // Trend period
input double TriggerUp    =  0.8;   // Trigger up level
input double TriggerDown  = -0.8;   // Trigger down level
input string pus1="/////////////////////////////////////////////////";
input bool zone_show_weak=true;//Mostrar zonas débiles
input bool zone_show_untested = true;//Mostrar zonas no probadas
input bool zone_show_turncoat = true;//Mostrar zonas rotas
input double zone_fuzzfactor=0.75;
input int SeparacionTexto=10;
input bool Conector=false;

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

///HANDLES Y BUFFERS
int IndicatorTrend;
double ArrowSignalUP[];
double ArrowSignalDN[];
double BufferTrend[];
double ATR[];
double Color_ZeroLag[];


////REGISTRO
struct TiempoDireccion
  {
   datetime          Tiempo;
   bool              IsBuy;
   double            PrecioApertura;
  };

TiempoDireccion TiemposSignals[];

int P_Fast=0;
int P_Slow=0;

int DefinitionATR;
int HandleZeroLag;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   DefinitionATR=iATR(Symbol(),PERIOD_CURRENT,7);
   HandleZeroLag=iCustom(Symbol(),PERIOD_CURRENT,"Zero-lag-MA",inpPrice,inpPeriod);

   int P=int((PeriodSeconds(Period())/60)*fractal_fast_factor);
   TransformarP(P);
   P_Fast=P;
   P=int((PeriodSeconds(Period())/60)*fractal_slow_factor);
   TransformarP(P);
   P_Slow=P;

   ArrayResize(TiemposSignals,0);

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
         prevChart=currChart;// let's save the current chart ID for the ChartNext()
         i_++;// Do not forget to increase the counter
        }
     }


   IndicatorTrend=iCustom(NULL,PERIOD_CURRENT,"::Indicators\\Trend direction and force.ex5",trendPeriod,TriggerUp,TriggerDown);

   IndicatorSetString(INDICATOR_SHORTNAME,"Indicador Patrones Rompimiento Tendencia");

//172, 115
   SetIndexBuffer(0,ArrowSignalUP);
   SetIndexBuffer(1,ArrowSignalDN);

   PlotIndexSetInteger(0,PLOT_ARROW,234);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(1,PLOT_ARROW,233);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);


   if(fractals_show==true)
     {
      SetIndexBuffer(2,SlowDnPts,INDICATOR_DATA);
      SetIndexBuffer(3,SlowUpPts,INDICATOR_DATA);
      SetIndexBuffer(4,FastDnPts,INDICATOR_DATA);
      SetIndexBuffer(5,FastUpPts,INDICATOR_DATA);
     }
   else
     {
      SetIndexBuffer(2,SlowDnPts,INDICATOR_CALCULATIONS);
      SetIndexBuffer(3,SlowUpPts,INDICATOR_CALCULATIONS);
      SetIndexBuffer(4,FastDnPts,INDICATOR_CALCULATIONS);
      SetIndexBuffer(5,FastUpPts,INDICATOR_CALCULATIONS);
     }

   SetIndexBuffer(6,ner_hi_zone_P1,INDICATOR_CALCULATIONS);
   SetIndexBuffer(7,ner_hi_zone_P2,INDICATOR_CALCULATIONS);
   SetIndexBuffer(8,ner_lo_zone_P1,INDICATOR_CALCULATIONS);
   SetIndexBuffer(9,ner_lo_zone_P2,INDICATOR_CALCULATIONS);

   SetIndexBuffer(10,BufferTrend,INDICATOR_CALCULATIONS);
   SetIndexBuffer(11,ATR,INDICATOR_CALCULATIONS);
   SetIndexBuffer(12,Color_ZeroLag,INDICATOR_CALCULATIONS);

   ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);

   if(fractals_show==true)
     {
      PlotIndexSetInteger(2,PLOT_LINE_COLOR,clrYellow);
      PlotIndexSetInteger(3,PLOT_LINE_COLOR,clrYellow);
      PlotIndexSetInteger(4,PLOT_LINE_COLOR,clrYellow);
      PlotIndexSetInteger(5,PLOT_LINE_COLOR,clrYellow);

      PlotIndexSetInteger(2,PLOT_DRAW_TYPE,DRAW_ARROW);
      PlotIndexSetInteger(3,PLOT_DRAW_TYPE,DRAW_ARROW);
      PlotIndexSetInteger(4,PLOT_DRAW_TYPE,DRAW_ARROW);
      PlotIndexSetInteger(5,PLOT_DRAW_TYPE,DRAW_ARROW);

      PlotIndexSetInteger(2,PLOT_ARROW,218);
      PlotIndexSetInteger(3,PLOT_ARROW,217);
      PlotIndexSetInteger(4,PLOT_ARROW,218);
      PlotIndexSetInteger(5,PLOT_ARROW,217);

      PlotIndexSetString(2,PLOT_LABEL,"FRACTAL");
      PlotIndexSetString(3,PLOT_LABEL,"FRACTAL");
      PlotIndexSetString(4,PLOT_LABEL,"FRACTAL");
      PlotIndexSetString(5,PLOT_LABEL,"FRACTAL");
     }
   else
     {
      PlotIndexSetInteger(2,PLOT_DRAW_TYPE,DRAW_NONE);
      PlotIndexSetInteger(3,PLOT_DRAW_TYPE,DRAW_NONE);
      PlotIndexSetInteger(4,PLOT_ARROW,DRAW_NONE);
      PlotIndexSetInteger(5,PLOT_ARROW,DRAW_NONE);
     }

   PlotIndexSetInteger(6,PLOT_DRAW_TYPE,DRAW_NONE);
   PlotIndexSetInteger(7,PLOT_DRAW_TYPE,DRAW_NONE);
   PlotIndexSetInteger(8,PLOT_DRAW_TYPE,DRAW_NONE);
   PlotIndexSetInteger(9,PLOT_DRAW_TYPE,DRAW_NONE);

   PlotIndexSetString(6,PLOT_LABEL,"ner up zone P1");
   PlotIndexSetString(7,PLOT_LABEL,"ner up zone P2");
   PlotIndexSetString(8,PLOT_LABEL,"ner dn zone P1");
   PlotIndexSetString(9,PLOT_LABEL,"ner dn zone P2");


   ArraySetAsSeries(SlowDnPts,true);
   ArraySetAsSeries(SlowUpPts,true);
   ArraySetAsSeries(FastDnPts,true);
   ArraySetAsSeries(FastUpPts,true);

   ArraySetAsSeries(ner_hi_zone_P1,true);
   ArraySetAsSeries(ner_hi_zone_P2,true);
   ArraySetAsSeries(ner_lo_zone_P1,true);
   ArraySetAsSeries(ner_lo_zone_P2,true);

   ArraySetAsSeries(BufferTrend,true);
   ArraySetAsSeries(ArrowSignalUP,true);
   ArraySetAsSeries(ArrowSignalDN,true);
   ArraySetAsSeries(ATR,true);
   ArraySetAsSeries(Color_ZeroLag,true);

   return(INIT_SUCCEEDED);

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   if(Ver_Sop_Res)
     {
      DeleteZones();
      DeleteGlobalVars();
      ChartRedraw();
     }
   if(ObjectFind(CHART_ID,NAME_CARGANDO)>=0)
      ObjectDelete(CHART_ID,NAME_CARGANDO);

   ObjectsDeleteAll(CHART_ID,Identificacion,0,OBJ_TREND);
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

   if(BarsCalculated(DefinitionATR)<rates_total)
      return(0);

   if(BarsCalculated(HandleZeroLag)<rates_total)
      return(0);

   if(ChartPeriod(CHART_ID)!=Period() || ChartSymbol(CHART_ID)!=Symbol())
      return 0;

   if(BarsCalculated(IndicatorTrend)<rates_total)
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
   if(CopyBuffer(IndicatorTrend,2,0,to_copy,BufferTrend)<=0)
      return(0);
   if(CopyBuffer(DefinitionATR,0,0,to_copy,ATR)<=0)
      return 0;
   if(CopyBuffer(HandleZeroLag,1,0,to_copy,Color_ZeroLag)<=0)
      return 0;



   ArraySetAsSeries(Time,true);
   ArraySetAsSeries(High,true);
   ArraySetAsSeries(Low,true);
   ArraySetAsSeries(Close,true);
   ArraySetAsSeries(Open,true);

   if(prev_calculated==0)
     {
      ArrayResize(TiemposSignals,0);
      ObjectsDeleteAll(0,Identificacion,0,OBJ_TREND);
      ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);

      if(ObjectFind(CHART_ID,NAME_CARGANDO)<0)
         LabelCreate(CHART_ID,NAME_CARGANDO,0,50,50,CORNER_RIGHT_UPPER,"Cargando...","Arial",18,clrAqua,0,ANCHOR_RIGHT_UPPER,false,false,true,0);
     }

   if(prev_calculated==rates_total)
      return rates_total;

   int end=(prev_calculated>0)?MathMin(to_copy,rates_total-4):MathMin(VelasEvaluadas,rates_total-4);

   if(prev_calculated!=rates_total)
     {
      FastFractals(High,Low,0,rates_total,rates_total-prev_calculated);
      SlowFractals(High,Low,0,rates_total,rates_total-prev_calculated);
      DibujarRectangulos(High,Low,Close,Time,0);
     }

////////// RUPTURA DE SOP o RES
   for(int shift=0; shift<end; shift++)
     {

      ArrowSignalUP[0]=EMPTY_VALUE;
      ArrowSignalDN[0]=EMPTY_VALUE;
      ArrowSignalUP[shift+1]=EMPTY_VALUE;
      ArrowSignalDN[shift+1]=EMPTY_VALUE;

      if(shift>VelasEvaluadas)
         continue;

      if(!EvaluaHorario(Hora_Inicio,Hora_Final,Time[shift]))
         continue;

      if(!EvaluaDias(Time[shift]))
         continue;

      if(!FindZones(High,Close,Low,shift+(Repintado?0:1)))
         continue;

      if(Close[shift+1]>Open[shift+1])
        {
         if(BufferTrend[shift+1]>=TriggerUp)
            if(FiltroSupRes2(Low[shift+1],High[shift+1],Low[shift+2],High[shift+2],Low[shift+3],High[shift+3],Close[shift+1],true))
              {
               if(FiltroZeroLag(true,shift,rates_total))
                 {
                  ArrowSignalDN[shift+1] = Low[shift+1];

                  if(shift==0)
                     Alertas("Operacion Buy",false,"");
                 }
              }
        }
      else
        {
         if(BufferTrend[shift+1]<=TriggerDown)
            if(FiltroSupRes2(Low[shift+1],High[shift+1],Low[shift+2],High[shift+2],Low[shift+3],High[shift+3],Close[shift+1],false))
              {
               if(FiltroZeroLag(false,shift,rates_total))
                 {
                  ArrowSignalUP[shift+1] = High[shift+1];

                  if(shift==0)
                     Alertas("Operacion Sell",false,"");
                 }
              }
        }
     }

   if(ObjectFind(CHART_ID,NAME_CARGANDO)>=0)
      ObjectDelete(CHART_ID,NAME_CARGANDO);

// if(prevCalculatedAnterior==0)


//--- return value of prev_calculated for next call
   return(rates_total);
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

      color clrBuy=clrAqua;
      color clrSell=clrMagenta;
      string PrefijoLineas="V09072022";
      if(lparam==70)
        {
         for(int i=0; i<ArraySize(TiemposSignals); i++)
           {
            if(ObjectFind(0,PrefijoLineas+EnumToString(ENUM_TIMEFRAMES(Period()))+TimeToString(TiemposSignals[i].Tiempo))<0)
              {
               VLineCreate(0,PrefijoLineas+EnumToString(ENUM_TIMEFRAMES(Period()))+TimeToString(TiemposSignals[i].Tiempo),0,TiemposSignals[i].Tiempo,TiemposSignals[i].IsBuy?clrBuy:clrSell,STYLE_DASH,2,false,false,false,true,0);
              }
           }
         ChartRedraw();
        }
      if(lparam==66)
        {
         ObjectsDeleteAll(0,PrefijoLineas,0,OBJ_VLINE);
         ChartRedraw();
        }
     }
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

   double temp_hi[],temp_lo[];
   ArrayResize(temp_hi,BackLimit+15);
   ArrayResize(temp_lo,BackLimit+15);
   int    temp_start[],temp_hits[],temp_strength[],temp_count=0;
   ArrayResize(temp_start,BackLimit+15);
   ArrayResize(temp_hits,BackLimit+15);
   ArrayResize(temp_strength,BackLimit+15);
   bool   temp_turn[],temp_merge[];
   ArrayResize(temp_turn,BackLimit+15);
   ArrayResize(temp_merge,BackLimit+15);
   int merge1[],merge2[],merge_count=0;
   ArrayResize(merge1,BackLimit+15);
   ArrayResize(merge2,BackLimit+15);


   for(shift=MathMin(Bars(Symbol(),PERIOD_CURRENT)-1,BackLimit+Prueba); shift>5+Prueba; shift--)
     {
      //double atr= iATR(NULL,0,7,shift);
      double atr=ATR[shift];
      double fu = atr/2 * zone_fuzzfactor;
      bool isWeak;
      bool touchOk= false;
      bool isBust = false;
      double FastUpPts_index=shift-Prueba>=P_Fast?FastUpPts[shift]:0;
      double FastDnPts_index=shift-Prueba>=P_Fast?FastDnPts[shift]:0;

      if(FastUpPts_index>0.001)
        {
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
            FastUpPts_index=i-Prueba>=P_Fast?FastUpPts[i]:0;
            FastDnPts_index=i-Prueba>=P_Fast?FastDnPts[i]:0;

            if((turned==false && FastUpPts_index>=loval && FastUpPts_index<=hival) ||
               (turned==true && FastDnPts_index<=hival && FastDnPts_index>=loval))
              {
               // Potential touch, just make sure its been 10+candles since the prev one
               touchOk=true;
               for(j=i+1; j<i+11; j++)
                 {
                  double FastUpPts_j=j-Prueba>=P_Fast?FastUpPts[j]:0;
                  double FastDnPts_j=j-Prueba>=P_Fast?FastDnPts[j]:0;

                  if((turned==false && FastUpPts_j>=loval && FastUpPts_j<=hival) ||
                     (turned==true && FastDnPts_j<=hival && FastDnPts_j>=loval))
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
         if(FastDnPts_index>0.001)
           {
            // a zigzag Low point
            double SlowDnPts_index=shift-Prueba>=P_Slow?SlowDnPts[shift]:0;

            isWeak=true;
            if(SlowDnPts_index>0.001)
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

               FastUpPts_index=i-Prueba>=P_Fast?FastUpPts[i]:0;
               FastDnPts_index=i-Prueba>=P_Fast?FastDnPts[i]:0;

               if((turned==true && FastUpPts_index>=loval && FastUpPts_index<=hival) ||
                  (turned==false && FastDnPts_index<=hival && FastDnPts_index>=loval))
                 {
                  // Potential touch, just make sure its been 10+candles since the prev one
                  touchOk=true;
                  for(j=i+1; j<i+11; j++)
                    {
                     double FastUpPts_j=j-Prueba>=P_Fast?FastUpPts[j]:0;
                     double FastDnPts_j=j-Prueba>=P_Fast?FastDnPts[j]:0;

                     if((turned==true && FastUpPts_j>=loval && FastUpPts_j<=hival) ||
                        (turned==false && FastDnPts_j<=hival && FastDnPts_j>=loval))
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


// Print("j ",j);
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
   int Limite=MathMin(Bars(Symbol(),PERIOD_CURRENT)-1,500+Prueba);
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

      if(ObjectFind(CHART_ID,s)<0)
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
bool Fractal(int M,int P,int shift,const double &High[],const double &Low[],int Prueba,int rates_total)
  {

   if(shift-Prueba<P)
      return(false);

   if(shift>=rates_total-P)
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
void FastFractals(const double &High[],const double &Low[],int Prueba,int rates_total,int limit)
  {
   int shift;

   if(limit>=1)
      limit=MathMin(rates_total-1,limit+P_Fast);

   FastUpPts[0] = 0.0;
   FastUpPts[1] = 0.0;
   FastDnPts[0] = 0.0;
   FastDnPts[1] = 0.0;

   for(shift=limit; shift>1+Prueba; shift--)
     {
      if(Fractal(UP_POINT,P_Fast,shift,High,Low,Prueba,rates_total)==true)
         FastUpPts[shift-Prueba]=High[shift];
      else
         FastUpPts[shift-Prueba]=0.0;

      if(Fractal(DN_POINT,P_Fast,shift,High,Low,Prueba,rates_total)==true)
         FastDnPts[shift-Prueba]=Low[shift];
      else
         FastDnPts[shift-Prueba]=0.0;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SlowFractals(const double &High[],const double &Low[],int Prueba,int rates_total,int limit)
  {
   int shift;

   if(limit>=1)
      limit=MathMin(rates_total-1,limit+P_Slow);

   SlowUpPts[0] = 0.0;
   SlowUpPts[1] = 0.0;
   SlowDnPts[0]= 0.0;
   SlowDnPts[1] = 0.0;

//if(limit>=1)
//  Print("Entra ,",rates_total);
   for(shift=limit; shift>1+Prueba; shift--)
     {
      if(Fractal(UP_POINT,P_Slow,shift,High,Low,Prueba,rates_total)==true)
         SlowUpPts[shift-Prueba]=High[shift];
      else
         SlowUpPts[shift-Prueba]=0.0;

      if(Fractal(DN_POINT,P_Slow,shift,High,Low,Prueba,rates_total)==true)
         SlowDnPts[shift-Prueba]=Low[shift];
      else
         SlowDnPts[shift-Prueba]=0.0;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TransformarP(int &P)
  {
   int PeriodoEva=(PeriodSeconds(Period())/60);

   if(PeriodoEva>P)
      P=PeriodoEva;
   P=int(P/PeriodoEva*2+MathCeil(P/PeriodoEva/2));
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
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroSupRes(double Low,double High,double Close,bool isBuy)
  {
   if(!isBuy)
     {
      for(int i=0; i<zone_count; i++)
        {
         if(zone_type[i]==ZONE_RESIST)
            if(zone_hits[i]>Testeado)
               if(zone_lo[i]-Tolerancia_Puntos_Flecha*Point()<High && zone_hi[i]>High && Low<zone_lo[i])
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
                 {
                  return true;
                 }
        }
     }
   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroSupRes2(double Low,double High,double Low2,double High2,double Low3,double High3,double Close,bool isBuy)
  {
   if(!isBuy)
     {
      for(int i=0; i<zone_count; i++)
        {
         if(zone_type[i]==ZONE_RESIST)
            if(zone_hits[i]>Testeado)
               if(((zone_lo[i]-Tolerancia_Puntos_Flecha*Point()<High && zone_hi[i]>High) ||
                   (zone_lo[i]-Tolerancia_Puntos_Flecha*Point()<High2 && zone_hi[i]>High2)) && Low<zone_lo[i])
                  return true;
        }
     }
   else
     {
      for(int i=0; i<zone_count; i++)
        {
         if(zone_type[i]==ZONE_SUPPORT)
            if(zone_hits[i]>Testeado)
               if(((zone_hi[i]+Tolerancia_Puntos_Flecha*Point()>Low && zone_lo[i]<Low) ||
                   (zone_hi[i]+Tolerancia_Puntos_Flecha*Point()>Low2 && zone_lo[i]<Low2))  && High>zone_hi[i])
                 {
                  return true;
                 }
        }
     }
   return false;
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
void DibujarRectangulos(const double &High[],const double &Low[],const double &Close[],const datetime &Time[],int Prueba)
  {
   int CharActual=int(ChartGetInteger(0,CHART_VISIBLE_BARS));


   if(Ver_Sop_Res)
     {
      //Print("Entra New Bar");
      int old_zone_count=zone_count;
      DeleteZones();
      FindZones(High,Close,Low,Prueba);
      DrawZones(Time,Prueba);
      if(zone_count<old_zone_count)
         DeleteOldGlobalVars(old_zone_count);

      if(zone_show_info==true)
        {
         // Print("ENTRA");
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


            int Pixeles=0;
            int desfase=1;
            int X,Y;
            int PixelexWidth=int(ChartGetInteger(0,CHART_WIDTH_IN_PIXELS));
            int BarsWidth=int(ChartGetInteger(0,CHART_WIDTH_IN_BARS));

            if(ChartTimePriceToXY(0,0,iTime(Symbol(),PERIOD_CURRENT,0),iClose(Symbol(),PERIOD_CURRENT,0),X,Y))
              {
               int TextoSize=200;
               Pixeles=PixelexWidth-X;
               double BarsPixeles=PixelexWidth/double(BarsWidth);
               int PixelesQueda=Pixeles-TextoSize;
               desfase=int((BarsWidth-CharActual)-(TextoSize/BarsPixeles));
               desfase=PixelesQueda<=0?-1:desfase;
               desfase=desfase<=0?1:desfase;
              }

            adjust_hpos=int(Time[0]+PeriodSeconds(Period())*desfase);
            if(Prueba>0)
               adjust_hpos=int(Time[Prueba]+PeriodSeconds(Period())*10);


            // int shift=k*zone_label_shift;
            double vpos=zone_hi[i]-(zone_hi[i]-zone_lo[i])/2;

            if(zone_strength[i]==ZONE_WEAK && zone_show_weak==false)
               continue;
            if(zone_strength[i]==ZONE_UNTESTED && zone_show_untested==false)
               continue;
            if(zone_strength[i]==ZONE_TURNCOAT && zone_show_turncoat==false)
               continue;

            color ColorText=Text_color;
            if(zone_type[i]==ZONE_SUPPORT)
              {
               // support zone
               if(zone_strength[i]==ZONE_TURNCOAT)
                  ColorText=color_support_turncoat;
               else
                  if(zone_strength[i]==ZONE_PROVEN)
                     ColorText=color_support_proven;
                  else
                     if(zone_strength[i]==ZONE_VERIFIED)
                        ColorText=color_support_verified;
                     else
                        if(zone_strength[i]==ZONE_UNTESTED)
                           ColorText=color_support_untested;
                        else
                           ColorText=color_support_weak;
              }
            else
              {
               // resistance zone
               if(zone_strength[i]==ZONE_TURNCOAT)
                  ColorText=color_resist_turncoat;
               else
                  if(zone_strength[i]==ZONE_PROVEN)
                     ColorText=color_resist_proven;
                  else
                     if(zone_strength[i]==ZONE_VERIFIED)
                        ColorText=color_resist_verified;
                     else
                        if(zone_strength[i]==ZONE_UNTESTED)
                           ColorText=color_resist_untested;
                        else
                           ColorText=color_resist_weak;
              }

            string s="SSSR#"+string(i)+"LBL";

            if(zone_strength[i]!=ZONE_VERIFIED && zone_strength[i]!=ZONE_PROVEN)
              {
               if(ObjectFind(0,s)<0)
                  ObjectCreate(0,s,OBJ_TEXT,0,adjust_hpos/*+shift*/,vpos);

               //Print("VPOS ",vpos);
               ObjectSetInteger(0,s,OBJPROP_TIME,0,adjust_hpos/*+shift*/);
               ObjectSetDouble(0,s,OBJPROP_PRICE,0,vpos);
               ObjectSetString(0,s,OBJPROP_TEXT,0,StringRightPad(lbl,36," "));
               ObjectSetInteger(0,s,OBJPROP_FONTSIZE,Text_size);
               ObjectSetString(0,s,OBJPROP_FONT,Text_font);
               ObjectSetInteger(0,s,OBJPROP_COLOR,ColorText);

               ChartRedraw(0);
              }
            else
              {
               int code=zone_hits[i]>10?117:139+zone_hits[i];
               if(ObjectFind(0,s)<0)
                  ObjectCreate(0,s,OBJ_ARROW,0,adjust_hpos/*+shift*/,vpos);
               ObjectSetInteger(0,s,OBJPROP_COLOR,ColorText);
               ObjectSetInteger(0,s,OBJPROP_ARROWCODE,code);
               ObjectSetInteger(0,s,OBJPROP_WIDTH,6);
               ObjectSetInteger(0,s,OBJPROP_ANCHOR,ANCHOR_TOP);
              }

           }
        }
      ChartRedraw();
      CheckAlerts(Time,Close);
     }
  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
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
//--- si la hora de la línea no está definida, la trazamos en la última barra
   if(!time)
      time=TimeCurrent();
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
void Alertas(string Frase,bool Personalizada,string AudioPersonalizada)
  {

   if(AlertPC)
     {
      if(!Personalizada)
         Alert(Frase," en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
      else
         PlaySound(AudioPersonalizada);
     }
   if(AlertMovil)
      SendNotification(Frase+" en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
   if(AlertMail)
      SendMail("Signal Personalizrd "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),Frase+" en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluaDias(datetime TiempoEvalua)
  {

   MqlDateTime TiempoMql;
   TimeToStruct(TiempoEvalua,TiempoMql);

   uint Dia=TiempoMql.day_of_week;

   if(Dia==0 && Domingo)
      return true;
   else
      if(Dia==1 && Lunes)
         return true;
      else
         if(Dia==2 && Martes)
            return true;
         else
            if(Dia==3 && Miercoles)
               return true;
            else
               if(Dia==4 && Jueves)
                  return true;
               else
                  if(Dia==5 && Viernes)
                     return true;

   return false;

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroZeroLag(bool IsBuy,int shift,int rates_total)
  {
   if(!Filtro_ZL)
      return true;

   for(uint i=1; i<=VelasEvaluaZeroLag && shift+i<(uint)rates_total; i++)
     {
      if(Color_ZeroLag[shift+i]==(IsBuy?1:2))
         return false;
     }
   return true;
  }
//+------------------------------------------------------------------+
