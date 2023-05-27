//+------------------------------------------------------------------+
//|                         MI PANEL ANGELO PRO CON PERZONALIZED.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

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

double ValorSopRes;
double VolumenVelasOPCM;
double VolumenMartillo;


#include<Trade\Trade.mqh>
CTrade trade;
int ArregloGestion[22];
string NombresCuadros[][22];
string NombresCuadrosTextos[][22];

string NombresCuadrosExpertos[][7];
string NombresCuadrosTextosExpertos[][7];

int Columnas=0;

string Array_Symbolos[];
string Botones_Symbolos[];
bool Botones_Symbolos_Bool[];
string Edit_Symbolos[];

#include<Trade\Trade.mqh>

struct Edits
  {
   string            Lotaje_String;
   double            Lotaje_Double;
  };

struct Tickets_NivelTS
  {
   ulong              Ticket;
   double            NivelTS;
   int               Puntos_Impulso;
  };

Edits Edit_Symbolos_Anteriores[];
Tickets_NivelTS Tickets_TS[];

#resource "\\Indicators\\Trend direction and force.ex5"
#resource "\\Indicators\\INDICADOR PATRONES PRO\\PATRONES FINAL ANTIGUO.ex5"
#resource "\\Indicators\\IndicatorPersonalized.ex5"
////MODIFICAR NOMBRE DEL INIDCADOR ARRIBA Y TAMBIEN EN LA LINEA 1016
#resource "\\Indicators\\INDICADOR PATRONES PRO\\EMA_COLOR.ex5"

bool Divergencias_Evalua;

string Nombres[21]= {"M1","M2","M3","M4","M5","M6","M10","M12","M15","M20","M30","H1","H2","H3","H4","H6","H8","H12","D1","W1","MN1"};
ENUM_TIMEFRAMES TIMEFRAMES[21]= {PERIOD_M1,PERIOD_M2,PERIOD_M3,PERIOD_M4,PERIOD_M5,PERIOD_M6,PERIOD_M10,PERIOD_M12,PERIOD_M15,PERIOD_M20,PERIOD_M30,PERIOD_H1,PERIOD_H2,PERIOD_H3,PERIOD_H4,PERIOD_H6,PERIOD_H8,PERIOD_H12,PERIOD_D1,PERIOD_W1,PERIOD_MN1};
datetime DateTime_Columna[][21];
double Close_Columna[][21];
bool Existen_Divergencias[][22];

enum Mostrar
  {
   MOSTRAR_TODO=0,
   MOSTRAR_LAS_ULTIMAS_X_VELAS=1,
  };

enum Tipo_SL
  {
   Arriba_de_flecha=0,// Arriba de la flecha
   SL_igual_Impulso=1,// SL Igual a Impulso
  };

enum Size_Linea_Cuadro
  {
   _1=1,//1
   _2=2,//2
   _3=3,//3
  };

enum Escala_Grafico
  {
   __1=1,//1
   __2=2,//2
   __3=3,//3
   __4=4,//4
   __5=5,//5
  };

enum Ver_Divergencias
  {
   MOSTRAR_TODAS=0,
   MOSTRAR_UNA_DIVERGENCIA=1,
  };

enum UsarDatos
  {
   Close_Close=0,
   High_Low=1,
  };

int SegundaVela=0;
int TerceraVela=0;
int CuartaVela=0;
int QuintaVela=0;
int Otras=0;


enum TP_Tipo
  {
   TP_NORMAL=0,
   TP_TRAILING=1,
   SIN_TP=2,
  };

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12pm=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

input int Espera=8;
input bool Repintado=false;
input bool Ver_Sop_Res_Historial=false;
input string S001="============================  CONFIGURACION CONFIRMACION PATRONES ============================";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Filter_Estocastico=true;//Patron con Estocastico
input bool Filter_MA=true;//Patron con EMA
input bool Filter_RSI=true;//Patron con RSI
//input bool TransparienciaDePatronesSinRSIoEST=true;
//input UsarDatos Tipo_de_Datos=High_Low;// Tipo de Datos
input string S0="=== Configuracion SOP RES =======================================================================================";//=======================================================================================
bool FiltroSupportRes=true;
input bool VerSopRes=true;
input int Testeado=0;// Sop o Res, Fuerza Mayor a...
input int Tolerancia_Puntos_Flecha=30;
input int BackLimit=500;
input string pus1="/////////////////////////////////////////////////";
input bool zone_show_weak=true;//Mostrar zonas débiles
input bool zone_show_untested = true;//Mostrar zonas retesteadas
input bool zone_show_turncoat = true;//Mostrar zonas rotas
input double zone_fuzzfactor=0.75;
input int SeparacionTexto=10;
//input string pus2="/////////////////////////////////////////////////";
//input bool fractals_show=false;
double fractal_fast_factor = 3.0;
double fractal_slow_factor = 6.0;
//input bool SetGlobals=true;
//input string pus3="/////////////////////////////////////////////////";
//input bool zone_solid=true;
//input int zone_linewidth=1;
//input int zone_style=0;
//input bool zone_show_info=true;
//input int zone_label_shift=0;
bool zone_merge=true;
bool zone_extend=true;
//input string pus4="/////////////////////////////////////////////////";
//input bool zone_show_alerts  = false;
//input bool zone_alert_popups = true;
//input bool zone_alert_sounds = true;
//input int zone_alert_waitseconds=300;
//input string pus5="/////////////////////////////////////////////////";
//input int Text_size=8;
//input string Text_font = "Courier New";
//input color Text_color = clrWhite;
//input string sup_name = "Soporte";
//input string res_name = "Resistencia";
//input string test_name= "Retesteado";
input string S00="=== Configuracion Grafico =======================================================================================";//=======================================================================================
input bool Ver_Lineas_Precio=true;// Ver Divergencias en el Precio
input bool Ver_Separadores=true;
input Escala_Grafico Escala=__2;// Escala de Grafico
input bool AplicarPlantilla=false;
input string Tu_Plantilla="PLANTILLA PRO 3000";
input string Horario="********************** Horario **********************";///******************************************************************************************************************************
input ENUM_Horas  Hora_Inicio=_0am;
input ENUM_Horas Hora_Final=_0am;
input string S0__="=== Configuracion Experto =======================================================================================";//=======================================================================================
input bool Modo_Experto=false;
input int Porcentaje=50;// Porcentaje para el Trailing
input TP_Tipo Tipo_TP=TP_TRAILING;// Tipo TP
input int PasoPorcentaje=10;// Porcentaje Trailing Stop (Si TP es Trailing)
input Tipo_SL SL_Type=SL_igual_Impulso;// Activar SL Inicial
input int Desplazamiento_SL=0;// Desplazamiento del SL en Puntos
input string S1_="================= CONFIGURACION RSI =======================================================================================";//=======================================================================================
input bool Ver_RSI=false;// Ver Divergencias RSI
input bool Ver_Indicador_RSI_Indicador=false;// Ver Indicador RSI
input int RSI_Periodo=14;
input ENUM_APPLIED_PRICE RSI_Applied_Price=PRICE_CLOSE;
//input int Filtro_Retroceso_RSI=6;
//input bool Filtro_SobreCompra_SobreVenta_RSI=false;// Filtro SobreCompra SobreVenta
input string S6_="=== CONFIGURACION MA =======================================================================================";//=======================================================================================
input bool Ver_Emas=true;
input int Tolerancia_Puntos=0;
input int Period_MA_SLOW=150;
input int Period_MA=50;
input int Shift_MA=0;
input ENUM_APPLIED_PRICE APP_MA=PRICE_CLOSE;
input ENUM_MA_METHOD MODE_MA=MODE_SMA;
input int Grosor_Fast=1;
input int Grosor_Slow=2;
input color Color_Fast=clrYellow;
input color Color_Slow=clrWhite;
input ENUM_LINE_STYLE Estilo_Fast=STYLE_SOLID;
input ENUM_LINE_STYLE Estilo_Slow=STYLE_SOLID;
input string S7="===  CONFIGURACION ESTOCASTICO =======================================================================================";//=======================================================================================
input bool Ver_ESTOCASTICO=false; // Ver Divergencias Estocastico
input bool Ver_Indicador_ESTOCASTICO_Indicador=false;// Ver Indicador Estocastico
input int K_Periodo=5;
input int D_Periodo=3;
input int Slowing=3;
input ENUM_MA_METHOD Ma_Method_EST=MODE_SMA;
input ENUM_STO_PRICE STO_EST=STO_LOWHIGH;
input string S8="===  CONFIGURACION TREND FORCE =======================================================================================";//=======================================================================================
input int    trendPeriod  = 4;      // Trend period
input double TriggerUp    =  0.4;   // Trigger up level
input double TriggerDown  = -0.4;   // Trigger down level
//input int Filtro_Retroceso_ESTOCASTICO=2;
//input bool Filtro_SobreCompra_SobreVenta_Est=false;// Filtro SobreCompra SobreVenta
input string S12_="============================================ CONFIGURACION TREND ============================================";//======================================================================
input int inpFastLength = 7; // Fast length
input int inpSlowLength = 15; // Slow length
//input int Tolerancia_Personalized=0;
input int EsperarConfirmacion=4;
input string s71= "=== Alertas =======================================================================================";//=======================================================================================
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;
input string S4="=== Configuracion Cuadros =======================================================================================";//=======================================================================================
int Anclaje_X=10;
int Anclaje_Y=10;
int EspacioCuadroHorizontal=0;
int EspacioCuadroVertical=0;
input int TamanoCuadroHorizontal_Simbolos=120;
input int TamanoCuadroHorizontal=40;
input int TamanoCuadroVertical=25;
input int TamanoCuadroHorizontal_PanelRegistro=80;
input int TamanoCuadroVertical_PanelRegistro=25;
input int TamanoCuadroHorizontal_Botones=50;
input int TamanoCuadroHorizontal_Edit=50;
input int TamanoCuadroHorizontalExperto=100;
input int TamanoLetrasTexto=8;
input Size_Linea_Cuadro Grosor_Linea_Cuadro=_1;
input color Color_Texto=clrWhite;
input color Color_Linea_Borde=clrOrange;
input color Color_Fondo_Default=clrBlack;
input color Instrumento_Divergencia=clrIndigo;
input color Color_Temporalidades=clrBlack;
input color ColorTitulo=clrBlack;
input color ColorSeleccion=clrRed;
input color Color_Cargando=clrBrown;
input color Color_Cargado=clrDarkGreen;
input color Color_Linea_Ayuda_Cuadricula=clrRosyBrown;
input color Color_Buy=clrDodgerBlue;
input color Color_Sell=clrFireBrick;
/*
input int Anclaje_X=10;
input int Anclaje_Y=10;
input int EspacioCuadroHorizontal=0;
input int EspacioCuadroVertical=0;
input int TamanoCuadroHorizontal=60;
input int TamanoCuadroVertical=25;
input int TamanoCuadroHorizontal_PanelRegistro=80;
input int TamanoCuadroVertical_PanelRegistro=25;
input color Color_Linea_Borde=clrGray;
input color Color_Fondo_Default=clrWhite;
input color Instrumento_Divergencia=clrYellow;
input color Color_Temporalidades=clrAqua;
input color ColorTitulo=clrAliceBlue;
input color ColorSeleccion=clrRed;*/

input string S5="=== Configuracion Temporalidades ==========================================================================================";//=======================================================================================
input bool M1=false;
input bool M2=false;
input bool M3=false;
input bool M4=false;
input bool M5=false;
input bool M6=false;
input bool M10=false;
input bool M12=false;
input bool M15=true;
input bool M20=true;
input bool M30=true;
input bool H1=true;
input bool H2=true;
input bool H3=true;
input bool H4=true;
input bool H6=false;
input bool H8=false;
input bool H12=false;
input bool D1=false;
input bool W1=false;
input bool MN1=false;

int InicioX=0;
int FinalX=0;
int InicioY=0;
int FinalY=0;


string Pantalla="001 Pantalla Negra";

string AlertaComentario=" ";

bool AlertasInicio=true;

int CharIndicator=0;


enum Indicator
  {
   RSI=0,
   MACD=1,
   ESTOCASTICO=2,
  };

int NumeroMuestreo=1;
int Filas_Totales=0;


int Handle_RSI=0;

int Handle_MA=0;
int Handle_MA_S=0;

int Handle_ESTOCASTICO=0;

int Sub_Window=0;

int Handle_Indicador=0;

int Fila_S=0;
int Columna_S=0;

long Open_CHARD=0;

string LineaVertical="001 Linea Vertical";
string LineaHorizontal="001 Linea Horizontal";

int Espacio_Texto=0;
string Autorizacion="CuentaAutorizacion";

datetime TiempoAlerta=0;
bool AlertaPersonalizada=false;



int ColumnaRSeleccionado=1;

int FilaRSeleccionado=2;

long CHARTCHANGE[];

string Bases[9]= {"USD","CAD","NZD","GBP","CHF","JPY","SGD","AUD","EUR"};

//datetime UNTIL=D'2022.03.01 00:00';
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   for(int i=0; i<SymbolsTotal(false); i++)
     {
      string Name=SymbolName(i,false);
       SymbolSelect(Name,false);
      if(StringLen(Name)==6)
        {
         bool Incorrecto1=false;
         bool Incorrecto2=false;
         string Par1=StringSubstr(Name,0,3);
         string Par2=StringSubstr(Name,3,3);
         Print(Par1," ",Par2);

         for(int j=0; j<9; j++)
           {
            if(Par1==Bases[j])
               Incorrecto1=true;
            if(Par2==Bases[j])
               Incorrecto2=true;
           }
         if(Incorrecto1 && Incorrecto2)
           {
            SymbolSelect(Name,true);
            Print(Name);
           }
        }
     }

   /* if(UNTIL<TimeCurrent())
      {
       Alert("Tiempo de Prueba finalizado");
       return INIT_FAILED;
      }*/

   ColumnaRSeleccionado=1;
   FilaRSeleccionado=2;

   TiempoAlerta=0;
   AlertaPersonalizada=false;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   if(ObjectFind(0,Pantalla)!=0)
      RectLabelCreate(0,Pantalla,0,0,0,10000,10000,clrBlack,BORDER_RAISED,0,clrBlack,STYLE_SOLID,2,false,false,true,0);

   ChartSetInteger(0,CHART_EVENT_MOUSE_MOVE,0,true);

   Fila_S=0;
   Columna_S=0;

   AlertasInicio=true;

   IndicatorSetString(INDICATOR_SHORTNAME,"PANELES DIVERGENCIAS");

   string iName="PANELES DIVERGENCIAS";

   Columnas=0;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   if(!RegistrarSimbolo(Array_Symbolos))
     {
      return(INIT_PARAMETERS_INCORRECT);
     }





//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   ArrayResize(Botones_Symbolos,ArraySize(Array_Symbolos));
   ArrayResize(Botones_Symbolos_Bool,ArraySize(Array_Symbolos));
   ArrayResize(Edit_Symbolos,ArraySize(Array_Symbolos));
   ArrayResize(Edit_Symbolos_Anteriores,ArraySize(Array_Symbolos));

//ActualizarDatos(Symbol(),PERIOD_CURRENT);

   Filas_Totales=ArraySize(Array_Symbolos)+2;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   ArrayResize(DateTime_Columna,Filas_Totales);
   ArrayResize(Close_Columna,Filas_Totales);
   ArrayResize(Existen_Divergencias,Filas_Totales);

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   ArrayInitialize(DateTime_Columna,0);
   ArrayInitialize(Close_Columna,0);
   ArrayInitialize(Existen_Divergencias,false);

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   GestionarColumnas();
/// DESCARGAR DATOS ///
   for(int f=2; f<Filas_Totales; f++)
      for(int c=Columnas-1; c>=1; c--)
        {
         string Symbolo=Array_Symbolos[f-2];

         // Print("CATEGORIA  ",SymbolInfoString(Symbolo,SYMBOL_SECTOR_NAME));
         ENUM_TIMEFRAMES TimeFrame=TIMEFRAMES[ArregloGestion[c-1]];

         datetime TiempoComprueba=TimeCurrent()-BackLimit*PeriodSeconds(TimeFrame);
         //Print("Fila= ",f," Columna=",c,"  Simbolo=",Symbolo," DateTime=  ",DateTime_Columna[f-2][ArregloGestion[c-1]]);

         Print("Start load",Symbolo+","+GetPeriodName(TimeFrame),"from",TiempoComprueba);
         //---
         int res=CheckLoadHistory(Symbolo,TimeFrame,TiempoComprueba);
         switch(res)
           {
            case -1 :
               Print("Unknown symbol ",Symbolo);
               break;
            case -2 :
               Print("Requested bars more than max bars in chart");
               break;
            case -3 :
               Print("Program was stopped");
               break;
            case -4 :
               Print("Indicator shouldn't load its own data");
               break;
            case -5 :
               Print("Load failed");
               break;
            case  0 :
               Print("Loaded OK");
               break;
            case  1 :
               Print("Loaded previously");
               break;
            case  2 :
               Print("Loaded previously and built");
               break;
            default :
               Print("Unknown result");
           }
         //---
         datetime first_date;
         SeriesInfoInteger(Symbolo,TimeFrame,SERIES_FIRSTDATE,first_date);
         int bars=Bars(Symbolo,TimeFrame);
         Print("First date",first_date,"-",bars,"bars");
        }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   InicioX=Anclaje_X+TamanoCuadroHorizontal+EspacioCuadroHorizontal+(TamanoCuadroHorizontal_Simbolos-TamanoCuadroHorizontal);
   FinalX=Anclaje_X+TamanoCuadroHorizontal*Columnas+EspacioCuadroHorizontal*Columnas+(TamanoCuadroHorizontal_Simbolos-TamanoCuadroHorizontal)-Grosor_Linea_Cuadro*(Columnas-1);
   InicioY=Anclaje_Y+2*TamanoCuadroVertical+EspacioCuadroVertical*2;
   FinalY=Anclaje_Y+TamanoCuadroVertical*Filas_Totales+EspacioCuadroVertical*Filas_Totales-Grosor_Linea_Cuadro*(Filas_Totales-1);

   CrearCuadros();

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   if(Modo_Experto)
      CrearCuadrosExperto();


   ArrayResize(Tickets_TS,30);

   for(int i=0; i<30; i++)
      Tickets_TS[i].Ticket=-1;

/// PANTALLA EN BLANCOOOO ///


   ChartSetInteger(0,CHART_SCALE,1);

   EventSetMillisecondTimer(1);

   /*MathSrand(GetTickCount());
   int Consejo=(MathRand()%10)+1;
   switch(Consejo)
     {
      case 1:
         PlaySound("CONSEJOS//Consejo1");
         break;
      case 2:
         PlaySound("CONSEJOS//Consejo2");
         break;
      case 3:
         PlaySound("CONSEJOS//Consejo3");
         break;
      case 4:
         PlaySound("CONSEJOS//Consejo4");
         break;
      case 5:
         PlaySound("CONSEJOS//Consejo5");
         break;
      case 6:
         PlaySound("CONSEJOS//Consejo6");
         break;
      case 7:
         PlaySound("CONSEJOS//Consejo7");
         break;
      case 8:
         PlaySound("CONSEJOS//Consejo8");
         break;
      case 9:
         PlaySound("CONSEJOS//Consejo9");
         break;
      case 10:
         PlaySound("CONSEJOS//Consejo10");
         break;
      default:
         PlaySound("CONSEJOS//Consejo1");
         break;
     }
   */
   ArrayResize(CHARTCHANGE,0);

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   long currChart,prevChart=ChartFirst();
   currChart=prevChart;
   int i_=0,limit2=100;
   while(i_<limit2 && !IsStopped())// We have certainly not more than 100 open charts
     {

      if(currChart!=ChartID() && ChartGetString(currChart,CHART_COMMENT)!="PATRONES PRO")
        {
         int Size=ArraySize(CHARTCHANGE);
         ArrayResize(CHARTCHANGE,Size+1);
         CHARTCHANGE[Size]=currChart;
        }

      currChart=ChartNext(prevChart); // Get the new chart ID by using the previous chart ID
      if(currChart<0)
         break;          // Have reached the end of the chart list
      //Print(i,ChartSymbol(currChart)," ID =",currChart);
      prevChart=currChart;// let's save the current chart ID for the ChartNext()
      i_++;// Do not forget to increase the counter
     };

//---
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,"Cuadro Panel 001",CharIndicator,OBJ_RECTANGLE_LABEL);
   ObjectsDeleteAll(0,"Cuadro Panel 001",CharIndicator,OBJ_LABEL);
   ObjectsDeleteAll(0,"Cuadro Panel 001",CharIndicator,OBJ_BUTTON);
   ObjectsDeleteAll(0,"Cuadro Panel 001",CharIndicator,OBJ_EDIT);

   ChartRedraw();

//if(ChartPeriod(Open_CHARD)!=0 && Open_CHARD!=0)
// ChartClose(Open_CHARD);

   if(ObjectFind(0,Pantalla)==0)
      ObjectDelete(0,Pantalla);

   ArrayFree(DateTime_Columna);
   ArrayFree(Close_Columna);

   if(ObjectFind(0,Autorizacion)==0)
      ObjectDelete(0,Autorizacion);

   if(ObjectFind(0,LineaHorizontal)==0)
      ObjectDelete(0,LineaHorizontal);
   if(ObjectFind(0,LineaVertical)==0)
      ObjectDelete(0,LineaVertical);

   EventKillTimer();

//--- destroy timer
// EventKillTimer();
  }//------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   /*if(UNTIL<TimeCurrent())
     {
      Alert("Tiempo de Prueba finalizado");
      ExpertRemove();
     }*/

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CrearCuadros()
  {
   int Filas=ArraySize(Array_Symbolos)+2;
   ArrayResize(NombresCuadros,Filas);
   ArrayResize(NombresCuadrosTextos,Filas);

   for(int c=0; c<Columnas; c++)
     {
      for(int f=0; f<Filas; f++)
        {
         NombresCuadros[f][c]="Cuadro Panel 001 c="+(string) c+" f="+(string)f;
         NombresCuadrosTextos[f][c]="Cuadro Panel 001 c="+(string) c+" f="+(string)f+" Texto";
         ///TITULO
         if(f==0)
           {
            if(c==0)
              {
               int Multiplicador_Ancho=1,Multiplicador_Largo=1;
               int Disminucion_per_Ancho_Line_X=0;
               int Disminucion_per_Ancho_Line_Y=0;
               if(!Diferente_Tamano(c,f,0,0,Multiplicador_Ancho,Columnas,true,Disminucion_per_Ancho_Line_X,Disminucion_per_Ancho_Line_Y))
                  continue;
               //if(!Diferente_Tamano(c,f,0,1,Multiplicador_Largo,4,false))
               //  continue;
               string Texto=Texto_Cuadro(c,f);
               color Color_Cuadro=ColorCuadro(c,f);
               int X=Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontal*c;
               int Y= Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f-f*Grosor_Linea_Cuadro;
               int Ancho_=TamanoCuadroHorizontal*Multiplicador_Ancho+(Multiplicador_Ancho-1)*EspacioCuadroHorizontal+(TamanoCuadroHorizontal_Simbolos-TamanoCuadroHorizontal)-Disminucion_per_Ancho_Line_X;//TamanoCuadroHorizontal
               int Largo_=TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical-Disminucion_per_Ancho_Line_Y;// TamanoCuadroVertical
               RectLabelCreate(0,NombresCuadros[f][c],CharIndicator,X,Y,Ancho_,Largo_,Color_Cuadro,BORDER_FLAT,0,Color_Linea_Borde,STYLE_SOLID,Grosor_Linea_Cuadro,false,false,true,0);

               X=Ancho_/2;
               Y=Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f+int((TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical)/2);
               LabelCreate(0,NombresCuadrosTextos[f][c],CharIndicator,X,Y,0,Texto,"Arial",TamanoLetrasTexto,Color_Texto,0,ANCHOR_CENTER,false,false,true,0);
              }
           }
         // COLUMNA SIMBOLOS
         else
            if(c==0)
              {
               int Multiplicador_Ancho=1,Multiplicador_Largo=1;
               string Texto=Texto_Cuadro(c,f);
               color Color_Cuadro=ColorCuadro(c,f);
               int X=Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontal*c-c*Grosor_Linea_Cuadro;
               int Y= Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f-f*Grosor_Linea_Cuadro;
               int Ancho_=TamanoCuadroHorizontal_Simbolos;//TamanoCuadroHorizontal
               int Largo_=TamanoCuadroVertical;// TamanoCuadroVertical
               RectLabelCreate(0,NombresCuadros[f][c],CharIndicator,X,Y,Ancho_,Largo_,Color_Cuadro,BORDER_FLAT,0,Color_Linea_Borde,STYLE_SOLID,Grosor_Linea_Cuadro,false,false,true,0);

               X=Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontal*c-c*Grosor_Linea_Cuadro+int((TamanoCuadroHorizontal_Simbolos*Multiplicador_Ancho+(Multiplicador_Ancho-1)*EspacioCuadroHorizontal)/2);
               Y=Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f-f*Grosor_Linea_Cuadro+int((TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical)/2);
               LabelCreate(0,NombresCuadrosTextos[f][c],CharIndicator,X,Y,0,Texto,"Arial",TamanoLetrasTexto,Color_Texto,0,ANCHOR_CENTER,false,false,true,0);
              }
            // CUADROS NORMALES
            else
              {
               int Multiplicador_Ancho=1,Multiplicador_Largo=1;
               //if(!Diferente_Tamano(c,f,0,0,Multiplicador_Ancho,Columnas,true))
               //continue;
               //if(!Diferente_Tamano(c,f,0,1,Multiplicador_Largo,4,false))
               //  continue;
               string Texto=Texto_Cuadro(c,f);
               color Color_Cuadro=ColorCuadro(c,f);
               int X=Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontal*c+(TamanoCuadroHorizontal_Simbolos-TamanoCuadroHorizontal)-c*Grosor_Linea_Cuadro;
               int Y= Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f-f*Grosor_Linea_Cuadro;
               int Ancho_=TamanoCuadroHorizontal*Multiplicador_Ancho+(Multiplicador_Ancho-1)*EspacioCuadroHorizontal;//TamanoCuadroHorizontal
               int Largo_=TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical;// TamanoCuadroVertical
               RectLabelCreate(0,NombresCuadros[f][c],CharIndicator,X,Y,Ancho_,Largo_,Color_Cuadro,BORDER_FLAT,0,Color_Linea_Borde,STYLE_SOLID,Grosor_Linea_Cuadro,false,false,true,0);

               /*if(Modo_Experto && c==Columnas-1 && f>=2)
                 {
                  Botones_Symbolos[f-2]="Cuadro Panel 001 Boton"+" c="+(string)c+" f="+(string)f;
                  ButtonCreate(0,Botones_Symbolos[f-2],0,X+TamanoCuadroHorizontal,Y,TamanoCuadroHorizontal_Botones,TamanoCuadroVertical,CORNER_LEFT_UPPER,"START","Arial",TamanoLetrasTexto,Color_Texto,clrRed,Color_Linea_Borde,false,false,false,true,0);
                  Edit_Symbolos[f-2]="Cuadro Panel 001 Edit"+" c="+(string)c+" f="+(string)f;
                  string Lotaje=DoubleToString(SymbolInfoDouble(Array_Symbolos[f-2],SYMBOL_VOLUME_MIN),2);
                  Edit_Symbolos_Anteriores[f-2].Lotaje_String=Lotaje;
                  Edit_Symbolos_Anteriores[f-2].Lotaje_Double=SymbolInfoDouble(Array_Symbolos[f-2],SYMBOL_VOLUME_MIN);
                  EditCreate(0,Edit_Symbolos[f-2],0,X+TamanoCuadroHorizontal+TamanoCuadroHorizontal_Botones,Y,TamanoCuadroHorizontal_Edit,TamanoCuadroVertical,Lotaje,"Arial",TamanoLetrasTexto,ALIGN_CENTER,false,CORNER_LEFT_UPPER,clrBlack,clrWhite,Color_Linea_Borde,false,false,true,0);
                 }*/

               X=Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontal*c-c*Grosor_Linea_Cuadro+int((TamanoCuadroHorizontal*Multiplicador_Ancho+(Multiplicador_Ancho-1)*EspacioCuadroHorizontal)/2)+(TamanoCuadroHorizontal_Simbolos-TamanoCuadroHorizontal);
               Y=Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f-f*Grosor_Linea_Cuadro+int((TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical)/2);
               LabelCreate(0,NombresCuadrosTextos[f][c],CharIndicator,X,Y,0,Texto,"Arial",TamanoLetrasTexto,Color_Texto,0,ANCHOR_CENTER,false,false,true,0);

              }
         ChartRedraw();
        }
      ChartRedraw();
     }

   ChartRedraw();
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CrearCuadrosExperto()
  {

   int Filas=ArraySize(Array_Symbolos)+2;
   ArrayResize(NombresCuadrosExpertos,Filas);
   ArrayResize(NombresCuadrosTextosExpertos,Filas);

   for(int c=0; c<7; c++)
     {
      for(int f=0; f<Filas; f++)
        {
         NombresCuadrosExpertos[f][c]="Cuadro Panel 001 Experto c="+(string) c+" f="+(string)f;
         NombresCuadrosTextosExpertos[f][c]="Cuadro Panel 001 Experto c="+(string) c+" f="+(string)f+" Texto";

         int Multiplicador_Ancho=1,Multiplicador_Largo=1;
         int Disminucion_per_Ancho_Line_X=0;
         int Disminucion_per_Ancho_Line_Y=0;
         if(!Diferente_Tamano(c,f,0,0,Multiplicador_Ancho,7,true,Disminucion_per_Ancho_Line_X,Disminucion_per_Ancho_Line_Y))
            continue;
         //if(!Diferente_Tamano(c,f,0,1,Multiplicador_Largo,4,false))
         //  continue;
         string Texto=Texto_Cuadro_Experto(c,f);
         color Color_Cuadro=ColorCuadro_Experto(c,f);
         int X=FinalX+Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontalExperto*c-c*Grosor_Linea_Cuadro;
         int Y= Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f-f*Grosor_Linea_Cuadro;
         int Ancho_=TamanoCuadroHorizontalExperto*Multiplicador_Ancho+(Multiplicador_Ancho-1)*EspacioCuadroHorizontal-Disminucion_per_Ancho_Line_X;//TamanoCuadroHorizontal
         int Largo_=TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical-Disminucion_per_Ancho_Line_Y;// TamanoCuadroVertical
         if(c==5 && f>=2)
           {
            Botones_Symbolos[f-2]="Cuadro Panel 001 Boton"+" c="+(string)c+" f="+(string)f;
            ButtonCreate(0,Botones_Symbolos[f-2],0,X,Y,TamanoCuadroHorizontalExperto,TamanoCuadroVertical,CORNER_LEFT_UPPER,"START","Arial",TamanoLetrasTexto,Color_Texto,clrRed,Color_Linea_Borde,false,false,false,true,0);
           }
         else
            if(c==6 && f>=2)
              {
               Edit_Symbolos[f-2]="Cuadro Panel 001 Edit"+" c="+(string)c+" f="+(string)f;
               string Lotaje=DoubleToString(SymbolInfoDouble(Array_Symbolos[f-2],SYMBOL_VOLUME_MIN),2);
               Edit_Symbolos_Anteriores[f-2].Lotaje_String=Lotaje;
               Edit_Symbolos_Anteriores[f-2].Lotaje_Double=SymbolInfoDouble(Array_Symbolos[f-2],SYMBOL_VOLUME_MIN);
               EditCreate(0,Edit_Symbolos[f-2],0,X,Y,TamanoCuadroHorizontalExperto,TamanoCuadroVertical,Lotaje,"Arial",TamanoLetrasTexto,ALIGN_CENTER,false,CORNER_LEFT_UPPER,Color_Texto,Color_Fondo_Default,Color_Linea_Borde,false,false,true,0);
              }
            else
              {
               color Color=Color_Cuadro;
               if(c==3 && f!=1)
                  Color=clrFireBrick;
               if(c==4 && f!=1)
                  Color=clrRoyalBlue;


               RectLabelCreate(0,NombresCuadrosExpertos[f][c],CharIndicator,X,Y,Ancho_,Largo_,Color,BORDER_FLAT,0,Color_Linea_Borde,STYLE_SOLID,Grosor_Linea_Cuadro,false,false,true,0);
               X=FinalX+Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontalExperto*c-c*Grosor_Linea_Cuadro+int((TamanoCuadroHorizontalExperto*Multiplicador_Ancho+(Multiplicador_Ancho-1)*EspacioCuadroHorizontal)/2);
               Y=Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f-f*Grosor_Linea_Cuadro+int((TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical)/2);
               LabelCreate(0,NombresCuadrosTextosExpertos[f][c],CharIndicator,X,Y,0,Texto,"Arial",TamanoLetrasTexto,Color_Texto,0,ANCHOR_CENTER,false,false,true,0);
              }

         /* if(c==1 && f>=2)
            {
             Botones_Symbolos[f-2]="Cuadro Panel 001 Boton"+" c="+(string)c+" f="+(string)f;
             ButtonCreate(0,Botones_Symbolos[f-2],0,X,Y,TamanoCuadroHorizontalExperto,TamanoCuadroVertical,CORNER_LEFT_UPPER,"START","Arial",TamanoLetrasTexto,Color_Texto,clrRed,Color_Linea_Borde,false,false,false,true,0);
             Edit_Symbolos[f-2]="Cuadro Panel 001 Edit"+" c="+(string)c+" f="+(string)f;
             string Lotaje=DoubleToString(SymbolInfoDouble(Array_Symbolos[f-2],SYMBOL_VOLUME_MIN),2);
             Edit_Symbolos_Anteriores[f-2].Lotaje_String=Lotaje;
             Edit_Symbolos_Anteriores[f-2].Lotaje_Double=SymbolInfoDouble(Array_Symbolos[f-2],SYMBOL_VOLUME_MIN);
             EditCreate(0,Edit_Symbolos[f-2],0,X+TamanoCuadroHorizontal+TamanoCuadroHorizontal_Botones,Y,TamanoCuadroHorizontal_Edit,TamanoCuadroVertical,Lotaje,"Arial",TamanoLetrasTexto,ALIGN_CENTER,false,CORNER_LEFT_UPPER,clrBlack,clrWhite,Color_Linea_Borde,false,false,true,0);
            }*/

         //}
         ChartRedraw();
        }
      ChartRedraw();
     }

   ChartRedraw();
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Diferente_Tamano(int c,int f,int Point_c,int Point_f,int &Multiplicador,int MultiplicadorCuadro,bool EsAncho,int &DisX,int &DisY)
  {
   if(EsAncho)
     {
      if(f==Point_f)
        {
         if(c>Point_c && c<Point_c+MultiplicadorCuadro)
            return false;
         if(c==Point_c && f==Point_f)
            Multiplicador=MultiplicadorCuadro;
         DisX=MultiplicadorCuadro-1;
        }
     }
   else
     {
      if(c==Point_c)
        {
         if(f>Point_f && f<Point_f+MultiplicadorCuadro)
            return false;
         if(c==Point_c && f==Point_f)
            Multiplicador=MultiplicadorCuadro;
         DisY=MultiplicadorCuadro-1;
        }
     }
   return true;
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RegistrarSimbolo(string &ArraySymbolos[])
  {
   int Conteo=0;
   for(int s=0; s<SymbolsTotal(true); s++)
     {
      string symbol = SymbolName(s,true);
      if(symbol==NULL)
         continue;
      Conteo++;
      ArrayResize(ArraySymbolos,Conteo);
      ArraySymbolos[Conteo-1]=symbol;
     }

   for(int i=0; i<Conteo; i++)
     {
      bool SymboloPersonalizado=true;
      if(!SymbolSelect(ArraySymbolos[i],SymboloPersonalizado))
        {
         Print("ERROR SYMBOLO ",ArraySymbolos[i]," NO ENCONTRADO");
         return(false);
        }
     }
   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string Texto_Cuadro(int c,int f)
  {
   if(f==0 && c==0)
      return("PANEL DE SIMBOLOS | TIMEFRAMES");

   if(f==1)
     {
      switch(c)
        {
         case 0:
            return "Cargando...";
         default:
            return Nombres[ArregloGestion[c-1]];
        }
     }

   if(c==0 && f>=2)
      return Array_Symbolos[f-2];

   return " ";
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
color ColorCuadro(int c,int f)
  {
   if(f==0)
      return ColorTitulo;
   else
      if(f==1 && c==0)
         return Color_Cargando;
      else
         if(f==1)
            return Color_Temporalidades;

   return Color_Fondo_Default;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string Texto_Cuadro_Experto(int c,int f)
  {
   if(f==0 && c==0)
      return("EA ADVISOR");

   if(f==1)
     {
      if(c==0)
         return "BID";
      if(c==1)
         return "ASK";
      if(c==2)
         return "SPREAD";
      if(c==3)
         return "SPR. NEGAT.";
      if(c==4)
         return "P.xPUNTO";
      if(c==5)
         return "EJECUCION";
      if(c==6)
         return "LOTE";
     }
   if(f>=2 && c==0)
     {
      int Digitos=(int)SymbolInfoInteger(Array_Symbolos[f-2],SYMBOL_DIGITS);
      string BID=DoubleToString(SymbolInfoDouble(Array_Symbolos[f-2],SYMBOL_BID),Digitos);
      return (BID);
     }
   if(f>=2 && c==1)
     {
      int Digitos=(int)SymbolInfoInteger(Array_Symbolos[f-2],SYMBOL_DIGITS);
      string ASK=DoubleToString(SymbolInfoDouble(Array_Symbolos[f-2],SYMBOL_ASK),Digitos);
      return ASK;
     }
   if(f>=2 && c==2)
     {
      int SPread=(int)SymbolInfoInteger(Array_Symbolos[f-2],SYMBOL_SPREAD);
      return IntegerToString(SPread);
     }

   return " ";
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
color ColorCuadro_Experto(int c,int f)
  {
   return Color_Fondo_Default;
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RectLabelCreate(const long             chart_ID=0,               // chart's ID
                     const string           name="RectLabel",         // label name
                     const int              sub_window=0,             // subwindow index
                     const int              x=0,                      // X coordinate
                     const int              y=0,                      // Y coordinate
                     const int              width=50,                 // width
                     const int              height=18,                // height
                     const color            back_clr=C'236,233,216',  // background color
                     const ENUM_BORDER_TYPE border=BORDER_SUNKEN,     // border type
                     const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                     const color            clr=clrRed,               // flat border color (Flat)
                     const ENUM_LINE_STYLE  style=STYLE_SOLID,        // flat border style
                     const int              line_width=1,             // flat border width
                     const bool             back=false,               // in the background
                     const bool             selection=false,          // highlight to move
                     const bool             hidden=true,              // hidden in the object list
                     const long             z_order=0)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create a rectangle label
   if(!ObjectCreate(chart_ID,name,OBJ_RECTANGLE_LABEL,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": failed to create a rectangle label! Error code = ",GetLastError());
      return(false);
     }
//--- set label coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set label size
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- set background color
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- set border type
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_TYPE,border);
//--- set the chart's corner, relative to which point coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set flat border color (in Flat mode)
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set flat border line style
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- set flat border width
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,line_width);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of moving the label by mouse
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
bool LabelCreate(const long              chart_ID=0,               // chart's ID
                 const string            name="Label",             // label name
                 const int               sub_window=0,             // subwindow index
                 const int               x=0,                      // X coordinate
                 const int               y=0,                      // Y coordinate
                 const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                 const string            text="Label",             // text
                 const string            font="Arial",             // font
                 const int               font_size=10,             // font size
                 const color             clr=clrRed,               // color
                 const double            angle=0.0,                // text slope
                 const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // anchor type
                 const bool              back=false,               // in the background
                 const bool              selection=false,          // highlight to move
                 const bool              hidden=true,              // hidden in the object list
                 const long              z_order=0)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create a text label
   if(!ObjectCreate(chart_ID,name,OBJ_LABEL,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": failed to create text label! Error code = ",GetLastError());
      return(false);
     }
//--- set label coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set the chart's corner, relative to which point coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set the text
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- set text font
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- set font size
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- set the slope angle of the text
   ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);
//--- set anchor type
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
//--- set color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of moving the label by mouse
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
void GestionarColumnas()
  {
   int i=0;
   if(M1)
     {
      ArregloGestion[i]=0;
      i++;
     }
   if(M2)
     {
      ArregloGestion[i]=1;
      i++;
     }
   if(M3)
     {
      ArregloGestion[i]=2;
      i++;
     }
   if(M4)
     {
      ArregloGestion[i]=3;
      i++;
     }
   if(M5)
     {
      ArregloGestion[i]=4;
      i++;
     }
   if(M6)
     {
      ArregloGestion[i]=5;
      i++;
     }
   if(M10)
     {
      ArregloGestion[i]=6;
      i++;
     }
   if(M12)
     {
      ArregloGestion[i]=7;
      i++;
     }

   if(M15)
     {
      ArregloGestion[i]=8;
      i++;
     }
   if(M20)
     {
      ArregloGestion[i]=9;
      i++;
     }
   if(M30)
     {
      ArregloGestion[i]=10;
      i++;
     }
   if(H1)
     {
      ArregloGestion[i]=11;
      i++;
     }
   if(H2)
     {
      ArregloGestion[i]=12;
      i++;;
     }
   if(H3)
     {
      ArregloGestion[i]=13;
      i++;
     }
   if(H4)
     {
      ArregloGestion[i]=14;
      i++;
     }
   if(H6)
     {
      ArregloGestion[i]=15;
      i++;
     }
   if(H8)
     {
      ArregloGestion[i]=16;
      i++;
     }
   if(H12)
     {
      ArregloGestion[i]=17;
      i++;
     }
   if(D1)
     {
      ArregloGestion[i]=18;
      i++;
     }
   if(W1)
     {
      ArregloGestion[i]=19;
      i++;
     }
   if(MN1)
     {
      ArregloGestion[i]=20;
      i++;
     }
   Columnas=i+1;

  }
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // Event ID
                  const long& lparam,   // Parameter of type long event
                  const double& dparam, // Parameter of type double event
                  const string& sparam  // Parameter of type string events
                 )
  {
   /* if(id==CHARTEVENT_OBJECT_CLICK && !AlertasInicio)
      {
       if(StringFind(sparam,"Cuadro Panel 001 c=",0)!=-1)
         {
          //  Print("ENTRA");
          //Print("Clic del ratón en el objeto con el nombre '"+sparam+"'");
          string Nombre=sparam+" ";
          int Indice=StringFind(Nombre,"c=",0);
          int IndiceFinal=StringFind(Nombre," ",Indice);
          string Columna=StringSubstr(Nombre,Indice+2,IndiceFinal-(Indice+2));
          Indice=StringFind(Nombre,"f=",0);
          IndiceFinal=StringFind(Nombre," ",Indice);
          string Fila=StringSubstr(Nombre,Indice+2,IndiceFinal-(Indice+2));

          if(StringToInteger(Columna)>=1 && StringToInteger(Fila)>=2)
            {
             PlaySound("alert2");
             // Print("Columna ",Columna," ArraySize ",ArraySize(Array_Symbolos));
             //Print("Fila ",Fila," ArraySize ",ArraySize(ArregloGestion));
             string Simbolo=Array_Symbolos[int(StringToInteger(Fila))-2];
             ENUM_TIMEFRAMES Periodo=TIMEFRAMES[ArregloGestion[int(StringToInteger(Columna))-1]];

             if(ChartPeriod(Open)==0 || Open==0)
               {
                Open=ChartOpen(Simbolo,Periodo);

                if(Open!=0)
                  {
                   ChartSetString(Open,CHART_COMMENT,"DIVERGENCIAS");
                   if(AplicarPlantilla)
                     {
                      ChartApplyTemplate(Open,Tu_Plantilla+".tpl");
                      ChartRedraw();
                      Sleep(5000);
                     }
                   else
                     {
                      ChartSetInteger(Open,CHART_COLOR_BACKGROUND,clrBlack);
                      ChartSetInteger(Open,CHART_COLOR_GRID,clrLightSlateGray);
                      ChartSetInteger(Open,CHART_COLOR_CHART_UP,clrLime);
                      ChartSetInteger(Open,CHART_COLOR_CHART_DOWN,clrRed);
                      ChartSetInteger(Open,CHART_COLOR_CANDLE_BULL,clrGreen);
                      ChartSetInteger(Open,CHART_COLOR_CANDLE_BEAR,clrOrangeRed);
                      ChartSetInteger(Open,CHART_COLOR_LAST,clrYellow);
                      ChartSetInteger(Open,CHART_COLOR_BID,clrLightSlateGray);
                      ChartSetInteger(Open,CHART_COLOR_ASK,clrRed);
                      ChartSetInteger(Open,CHART_SHIFT,true);
                      ChartSetInteger(Open,CHART_SCALE,1);
                      ChartRedraw();
                     }
                  }

                Handle_Indicador=iCustom(Simbolo,Periodo,Nombre_Indicador_MultiDivergencia,Tipo_de_Datos,Ver_Lineas_Precio,S1_,Ver_Indicador_RSI,Ver_Indicador_RSI_Indicador,RSI_Periodo, RSI_Applied_Price,Filtro_Retroceso_RSI,Filtro_SobreCompra_SobreVenta_RSI
                                         ,S6_,Ver_Indicador_MACD,Ver_Indicador_MACD_Indicador,Period_MACD,Slow_Ema_MACD,Signal_Period_MACD,Applied_Price_MACD,S7,Ver_Indicador_ESTOCASTICO,Ver_Indicador_ESTOCASTICO_Indicador,K_Periodo,D_Periodo,Slowing,Ma_Method_EST
                                         ,STO_EST,Filtro_Retroceso_ESTOCASTICO,Filtro_SobreCompra_SobreVenta_Est,s7,Filtro_Traspaso_50,Mostrar_Lineas,X_Velas,Ver_Divergencias_en_un_mismo_Punto,Ver_Divergencia_Oculta,Ver_Divergencia_Regular,ColorDivergenceOculta,ColorDivergenceRegular
                                         ,Estilo_Linea,Grosor_Linea,Crossing_Tolerance,Distancia_Maxima,Distancia_Minima,s74,ColorFlechaAlcista,ColorFlechaBajista,CodigoAlcista,CodigoBajista,AnchoFlecha,s71,false,false,false,Open);

                if(Open!=0 && Handle_Indicador!=INVALID_HANDLE)
                   ChartIndicatorAdd(Open,0,Handle_Indicador);

                if(Handle_Indicador==INVALID_HANDLE && Open!=0)
                   Alert("No se puede agregar el Indicador al Grafico... revise si esta escrito bien y que este en la carpeta Indicadores o subcarpeta");
               }
             else
                ChartSetSymbolPeriod(Open,Simbolo,Periodo);

             if(Open!=0)
               {
                if(Fila_S!=0 && Columna_S!=0)
                  {
                   ObjectSetInteger(0,NombresCuadros[Fila_S][Columna_S],OBJPROP_COLOR,Color_Linea_Borde);
                   ObjectSetInteger(0,NombresCuadros[Fila_S][0],OBJPROP_COLOR,Color_Linea_Borde);
                   ObjectSetInteger(0,NombresCuadros[1][Columna_S],OBJPROP_COLOR,Color_Linea_Borde);
                  }
                Fila_S=(int)StringToInteger(Fila);
                Columna_S=(int)StringToInteger(Columna);
                ObjectSetInteger(0,NombresCuadros[Fila_S][Columna_S],OBJPROP_COLOR,ColorSeleccion);
                ObjectSetInteger(0,NombresCuadros[Fila_S][0],OBJPROP_COLOR,ColorSeleccion);
                ObjectSetInteger(0,NombresCuadros[1][Columna_S],OBJPROP_COLOR,ColorSeleccion);
               }
            }

         }
       //  Print("SALE");
      }*/

   static datetime TiempoEspera=0;
   int Cambio=0;

   if(id==CHARTEVENT_KEYDOWN && !AlertasInicio)
     {
      if(ColumnaRSeleccionado>=1)
        {
         if(lparam==37)
           {
            Cambio=ColumnaRSeleccionado-1;
            if(Cambio>=1)
              {
               TiempoEspera=TimeLocal()+1;
               FuncionCambioGrafico(FilaRSeleccionado,Cambio,TiempoEspera);
              }
           }

         if(lparam==38)
           {
            Cambio=FilaRSeleccionado-1;
            if(Cambio>=2)
              {
               TiempoEspera=TimeLocal()+1;
               FuncionCambioGrafico(Cambio,ColumnaRSeleccionado,TiempoEspera);
               FuncionCambioGrafico2(Cambio,ColumnaRSeleccionado,TiempoEspera);
              }
           }

         if(lparam==40)
           {
            Cambio=FilaRSeleccionado+1;
            if(Cambio<Filas_Totales)
              {
               TiempoEspera=TimeLocal()+1;
               FuncionCambioGrafico(Cambio,ColumnaRSeleccionado,TiempoEspera);
               FuncionCambioGrafico2(Cambio,ColumnaRSeleccionado,TiempoEspera);
              }
           }

         if(lparam==39)
           {
            Cambio=ColumnaRSeleccionado+1;
            if(Cambio<Columnas)
              {
               TiempoEspera=TimeLocal()+1;
               FuncionCambioGrafico(FilaRSeleccionado,Cambio,TiempoEspera);
              }
           }
        }
      else
        {
         if(lparam==38)
           {
            Cambio=FilaRSeleccionado-1;
            if(Cambio>=2)
              {
               TiempoEspera=TimeLocal()+1;
               FuncionCambioGrafico2(Cambio,ColumnaRSeleccionado,TiempoEspera);
              }
           }

         if(lparam==40)
           {
            Cambio=FilaRSeleccionado+1;
            if(Cambio<Filas_Totales)
              {
               TiempoEspera=TimeLocal()+1;
               FuncionCambioGrafico2(Cambio,ColumnaRSeleccionado,TiempoEspera);
              }
           }
        }

     }

   if(id==CHARTEVENT_MOUSE_MOVE && !AlertasInicio)
     {

      int x=(int)lparam;
      int y=(int)dparam;

      if(x>=Anclaje_X && x<InicioX  && y>InicioY && y<FinalY)
        {


         if(sparam=="1" && TiempoEspera<TimeLocal())
           {
            TiempoEspera=TimeLocal()+1;
            int ColumnaR=0;

            int FilaR=2;
            int RastroY=InicioY+EspacioCuadroVertical+TamanoCuadroVertical;
            while(y>RastroY && !IsStopped() && RastroY<FinalY+1)
              {
               RastroY=RastroY+EspacioCuadroVertical+TamanoCuadroVertical-Grosor_Linea_Cuadro;
               FilaR++;
              }

            FuncionCambioGrafico2(FilaR,ColumnaR,TiempoEspera);


            // Print("Columna ",Columna," ArraySize ",ArraySize(Array_Symbolos));
            //Print("Fila ",Fila," ArraySize ",ArraySize(ArregloGestion));

            //  Print("C = ",ColumnaR," f = ",FilaR);
           }


        }

      if(x>=InicioX && x<FinalX  && y>InicioY && y<FinalY)
        {

         if(sparam=="1" && TiempoEspera<TimeLocal())
           {
            TiempoEspera=TimeLocal()+1;
            int ColumnaR=1;
            int RastroX=InicioX+EspacioCuadroHorizontal+TamanoCuadroHorizontal;


            while(x>RastroX && !IsStopped() && RastroX<FinalX+1)
              {
               RastroX=RastroX+EspacioCuadroHorizontal+TamanoCuadroHorizontal-Grosor_Linea_Cuadro;
               ColumnaR++;
              }

            int FilaR=2;
            int RastroY=InicioY+EspacioCuadroVertical+TamanoCuadroVertical;
            while(y>RastroY && !IsStopped() && RastroY<FinalY+1)
              {
               RastroY=RastroY+EspacioCuadroVertical+TamanoCuadroVertical-Grosor_Linea_Cuadro;
               FilaR++;
              }

            FuncionCambioGrafico(FilaR,ColumnaR,TiempoEspera);
            FuncionCambioGrafico2(FilaR,ColumnaR,TiempoEspera);

            // Print("Columna ",Columna," ArraySize ",ArraySize(Array_Symbolos));
            //Print("Fila ",Fila," ArraySize ",ArraySize(ArregloGestion));

            //  Print("C = ",ColumnaR," f = ",FilaR);
           }
         //     Print("x= ",x," y",y);
         int SubVentana=0;
         double PrecioInicio=0;
         datetime TimeInicio=0;
         ChartXYToTimePrice(0,x,y,SubVentana,TimeInicio,PrecioInicio);
         double PrecioFinalVertical=0;
         ChartXYToTimePrice(0,x,InicioY,SubVentana,TimeInicio,PrecioFinalVertical);
         datetime TiempoFinalHorizontal=0;
         ChartXYToTimePrice(0,InicioX,y,SubVentana,TiempoFinalHorizontal,PrecioInicio);

         //  Print("Tiempo Inicio ",TimeToString(TimeInicio,TIME_DATE|TIME_MINUTES)," PrecioInicio ",PrecioInicio," TiempoFinalHorizontal ",TimeToString(TiempoFinalHorizontal,TIME_DATE|TIME_MINUTES)," PrecioFinalVertical ",PrecioFinalVertical);
         if(ObjectFind(0,LineaHorizontal)!=0)
            TrendCreate(0,LineaHorizontal,0,TimeInicio,PrecioInicio,TiempoFinalHorizontal,PrecioInicio,Color_Linea_Ayuda_Cuadricula,STYLE_SOLID,2,false,false,false,false,true,0);
         else
           {
            ObjectMove(0,LineaHorizontal,0,TimeInicio,PrecioInicio);
            ObjectMove(0,LineaHorizontal,1,TiempoFinalHorizontal,PrecioInicio);
           }


         if(ObjectFind(0,LineaVertical)!=0)
            TrendCreate(0,LineaVertical,0,TimeInicio,PrecioInicio,TimeInicio,PrecioFinalVertical,Color_Linea_Ayuda_Cuadricula,STYLE_SOLID,2,false,false,false,false,true,0);
         else
           {
            ObjectMove(0,LineaVertical,0,TimeInicio,PrecioInicio);
            ObjectMove(0,LineaVertical,1,TimeInicio,PrecioFinalVertical);
           }
        }
      else
        {
         if(ObjectFind(0,LineaHorizontal)==0)
            ObjectDelete(0,LineaHorizontal);
         if(ObjectFind(0,LineaVertical)==0)
            ObjectDelete(0,LineaVertical);
        }
      ChartRedraw();
     }

  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime ActualizarDatos(string Simbolo,ENUM_TIMEFRAMES TimeFrames)
  {
   if(TimeFrames==PERIOD_CURRENT)
     {
      TimeFrames=ENUM_TIMEFRAMES(Period());
     }
//---
   MqlRates rates[];
   ArraySetAsSeries(rates,true);

   int copied=CopyRates(Simbolo,TimeFrames,0,50,rates);

   uchar Conteo=13;

   while(copied<0 && !IsStopped())
     {
      ResetLastError();
      Conteo--;
      Print("Cargando datos históricos para el símbolo ",Simbolo);
      Sleep(1000);
      copied=CopyRates(Simbolo,TimeFrames,0,100,rates);
      if(Conteo<10)
        {
         int Error=GetLastError();
         if(copied<0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE ",Simbolo," ",EnumToString(TimeFrames),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE ",Simbolo," ",EnumToString(TimeFrames),"  Cod ",Error);
            ExpertRemove();
           }
        }
     }

   return rates[1].time;
//Print("Z2");
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   if(AlertPC)
     {
      if(AlertaPersonalizada)
         if(TimeLocal()>=TiempoAlerta)
           {
            PlaySound("PATRON PRO");
            AlertaPersonalizada=false;
           }
     }

   Divergencias_Evalua();

   if(Modo_Experto)
     {
      if(Tipo_TP==TP_TRAILING)
         TS_();

      ComprobarEdits();
     }

  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Patrones(double &Close[],double&High[],double const &Low[],double &Open[],int RatesTotal,bool &IsSignalbuy,double &RSI_Array[],double &E_Array[],double &MA_Array[],double &MAS_Array[], double POINT,int Prueba,string &Frase,bool IsBuy,bool IsSell)
  {
// bool Fisher_Buy=true;
//bool Fisher_Sell=true;

   Frase="";

   static double O[10],C[10],L[10],H[10];
   static double CL[10],BL[10],BLa[10],BL90[10],UW[10],LW[10],BodyHigh[10],BodyLow[10],BB[10];
   for(int i=0; i<10; i++)
     {
      BodyHigh[i]=0;
      BodyLow[i]=0;
     }

   int j=Prueba;

   for(int i=0; i<4; i++)
     {
      O[i]=Open[i+j];
      H[i]=High[i+j];
      L[i]=Low[i+j];
      C[i]=Close[i+j];

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

      CL[i]=High[i+j]-Low[i+j];
      BL[i] = Open[i+j] - Close[i+j];
      UW[i] = High[i+j] - BodyHigh[i];
      LW[i] = BodyLow[i] - Low[i+j];
      BLa[i]= MathAbs(BL[i]);
      //BL90[i]=BLa[i]*Candle_WickBody_Percent;
      BB[i]=(BLa[i]/POINT)/10;//TAMAÑO DEL VAOR ABSOUTO DEL TAMAÑO DEL CUERPO EN PIPS NORMALES
     }

   bool CondicionSell=false;
   bool CondicionBuy=false;


   if(!CondicionSell || !CondicionBuy)
      if(Filter_RSI)
        {
         //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2<H[1]))
         if(RSI_Array[2+Prueba]<30  && MA_Array[1+Prueba]<MAS_Array[1+Prueba])
           {
            Frase+="R";
            CondicionBuy=true;
           }
         //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2>L[1]))
         if(RSI_Array[2+Prueba]>70  && MA_Array[1+Prueba]>MAS_Array[1+Prueba])
           {
            Frase+="R";
            CondicionSell=true;
           }
        }

   if(!CondicionSell || !CondicionBuy)
      if(Filter_Estocastico)
        {
         //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2<H[1]))
         if((E_Array[3+Prueba]<20 || E_Array[2+Prueba]<20) && E_Array[1+Prueba]>=20)
           {
            Frase+="E";
            CondicionBuy=true;
           }
         //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2>L[1]))
         if((E_Array[3+Prueba]>80 || E_Array[2+Prueba]>80) && E_Array[1+Prueba]<=80)
           {
            Frase+="E";
            CondicionSell=true;
           }
        }


   if(!CondicionSell || !CondicionBuy)
      if(Filter_MA)
        {
         //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2<H[1]))
         if(((H[1]+Tolerancia_Puntos*POINT>MA_Array[1+Prueba] && L[1]-Tolerancia_Puntos*POINT<MA_Array[1+Prueba]) || (H[1]+Tolerancia_Puntos*POINT>MAS_Array[1+Prueba] && L[1]-Tolerancia_Puntos*POINT<MAS_Array[1+Prueba]))
            && MAS_Array[1+Prueba]>MAS_Array[2+Prueba] && MAS_Array[2+Prueba]>MAS_Array[3] && MAS_Array[3+Prueba]>MAS_Array[4+Prueba] /*QUITAR ESTO SI ES NECESARIO-->*/ && MA_Array[1+Prueba]>MAS_Array[1+Prueba])
           {
            Frase+="M";
            CondicionBuy=true;
           }
         //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2>L[1]))
         if(((H[1]+Tolerancia_Puntos*POINT>MA_Array[1+Prueba] && L[1]-Tolerancia_Puntos*POINT<MA_Array[1+Prueba]) || (H[1]+Tolerancia_Puntos*POINT>MAS_Array[1+Prueba] && L[1]-Tolerancia_Puntos*POINT<MAS_Array[1+Prueba]))
            && MAS_Array[1+Prueba]<MAS_Array[2+Prueba] && MAS_Array[2+Prueba]<MAS_Array[3] && MAS_Array[3+Prueba]<MAS_Array[4+Prueba] /*QUITAR ESTO SI ES NECESARIO-->*/  && MA_Array[1+Prueba]<MAS_Array[1+Prueba])
           {
            Frase+="M";
            CondicionSell=true;
           }
        }
   CondicionBuy=true;
   CondicionSell=true;

   if(CondicionBuy && !IsBuy)
      CondicionBuy=false;

   if(CondicionSell && !IsSell)
      CondicionSell=false;

   /*if(CondicionBuy)
      if(!(C[1]>(C[2]>O[2]?C[2]:O[2])))
         CondicionBuy=false;

   if(CondicionSell)
      if(!(C[1]<(C[2]<O[2]?C[2]:O[2])))
         CondicionSell=false;
   */

   if(!CondicionBuy && !CondicionSell)
      return false;


// Check for Velas opuestas en Volumen
   if((O[1]>C[1] && O[2]<C[2])||(O[1]<C[1] && O[2]>C[2]))
     {

      if((BB[1]>(BB[2]/2))&& BB[2]>VALORVELASOPUESTAS)
        {

         if(O[1]>C[1] && O[2]<C[2] && (O[3]<C[3] || BB[3]<=BB[2]/2))
           {
            // Print("Entra 1, ");
            IsSignalbuy=false;
            if(CondicionSell)
               return true;
           }

         else
            if(O[1]<C[1] && O[2]>C[2] && (O[3]>C[3] || BB[3]<=BB[2]/2))
              {
               IsSignalbuy=true;
               if(CondicionBuy)
                  return true;
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


         if(O[1]>C[1] && O[2]>C[2] && O[3]<C[3])
           {
            //Print("Entra 2, ");
            IsSignalbuy=false;
            if(CondicionSell)
               return true;
           }

         else
            if(CondicionBuy)
              {
               IsSignalbuy=true;
               return true;
              }
         //  }

        }
     }

// Check for Velas opuestas en Volumen x2 v2

   if(((O[1]>C[1] && O[2]<C[2] && O[3]<C[3]) || (O[1]<C[1] && O[2]>C[2] && O[3]>C[3])) && (BB[2]<(BB[1]*3/4))) ///&& (BB[2]<(BB[1]/2))
     {
      if((BB[3]+BB[2]>(BB[1]/2))&& BB[1]>VALORVELASOPUESTAS)
        {


         //if(VelasOpuestasEnVolumenx2 == true)
         //{


         if(O[1]>C[1] && O[2]<C[2] && O[3]<C[3])
           {
            //  Print("Entra 3, ");
            IsSignalbuy=false;
            if(CondicionSell)
               return true;
           }
         else
            if(CondicionBuy)
              {
               IsSignalbuy=true;
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
            // Print("Entra 4, ");
            IsSignalbuy=false;
            if(CondicionSell)
               return true;
           }
         else
            if(O[3]>C[3] && C[1]>O[1])
              {
               IsSignalbuy=true;
               if(CondicionBuy)
                  return true;
              }
         //}

        }

     }
   return false;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Divergencias_Evalua()
  {

   AlertaComentario=" ";

   for(int f=2; f<Filas_Totales; f++)
     {
      Divergencias_Evalua=false;
      if(AlertasInicio)
         Print("Cargando Fila ",Array_Symbolos[f-2]," ...");
      for(int c=1; c<Columnas; c++)
         IgualarDiveregencias(c,f,TIMEFRAMES[ArregloGestion[c-1]],DateTime_Columna[f-2][c],Close_Columna[f-2][c]);

      if(Divergencias_Evalua)
        {
         // SendNotification("ACA HOSTING");
         bool HayDivergencia=false;
         for(int Columna=1; Columna<Columnas; Columna++)
           {
            HayDivergencia=Existen_Divergencias[f][Columna];
            if(HayDivergencia)
               break;
           }
         if(HayDivergencia)
            ObjectSetInteger(0,NombresCuadros[f][0],OBJPROP_BGCOLOR,Instrumento_Divergencia);
         else
            ObjectSetInteger(0,NombresCuadros[f][0],OBJPROP_BGCOLOR,Color_Fondo_Default);
        }
     }
     if(AlertasInicio)
         Print("Cargados Satisfactoriamente");
   /*
      for(int f=2; f<Filas_Totales; f++)
         for(int c=1; c<Columnas; c++)
           {
            string Symbolo=Array_Symbolos[f-2];
            DateTime_Columna[f-2][ArregloGestion[c-1]]=ActualizarDatos(Symbolo,TIMEFRAMES[ArregloGestion[c-1]]);
           }
   */
   if(AlertaComentario!=" " && !AlertasInicio)
     {
      if(AlertPC)
        {
         Alert(AlertaComentario);
         TiempoAlerta=TimeLocal()+5;
         AlertaPersonalizada=true;
         //  PlaySound("PATRON PRO");
        }
      if(AlertMovil)
         SendNotification(AlertaComentario);
      if(AlertMail)
         SendMail("DIVERGENCIAS",AlertaComentario);
     }

   if(AlertasInicio)
     {
      ObjectSetInteger(0,NombresCuadros[1][0],OBJPROP_BGCOLOR,Color_Cargado);
      ObjectSetString(0,NombresCuadrosTextos[1][0],OBJPROP_TEXT,"SIMBOLOS");

      for(int i=0; i<ArraySize(Botones_Symbolos); i++)
        {
         if(ObjectFind(0,Botones_Symbolos[i])==0)
            ObjectSetInteger(0,Botones_Symbolos[i],OBJPROP_STATE,false);

         Botones_Symbolos_Bool[i]=false;
        }

      ChartRedraw(0);
      AlertasInicio=false;
     }
// PrimeraVezAlerta=false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IgualarDiveregencias(int Columna,int Fila,ENUM_TIMEFRAMES TimeFrame,datetime &Tiempo_Evalua,double &Close_Evalua)
  {

//  Print("A1");
   string Symbolo=Array_Symbolos[Fila-2];

   datetime DATETIME=ActualizarDatos(Symbolo,TimeFrame);

//double CloseEva[3];
//ArraySetAsSeries(CloseEva,true);
//CopyClose(Symbolo,TimeFrame,0,3,CloseEva);
// Print("A3");

   if(DATETIME!=Tiempo_Evalua/* && (CloseEva[1]!=Close_Evalua && CloseEva[2]!=-1)*/)
     {
      // Print(Symbolo,"  ",DATETIME,"  ",EnumToString(TimeFrame));


      //  Close_Evalua=CloseEva[1];

      double Point_=SymbolInfoDouble(Symbolo,SYMBOL_POINT);
      Divergencias_Evalua=true;


      int Bars_=0;
      if(!ActualizarBarras(Symbolo,TimeFrame,Bars_))
         return false;


      int Maximo=MathMin(Bars_,BackLimit)+1;

      int MaximoBuffers=40;

      if(Maximo<MaximoBuffers)
         return false;

      double high[],low[],close[],open[];
      datetime time[];
      double RSI_BUFFER[],MA_BUFFER[],ESTOCASTICO_BUFFER[],MAS_BUFFER[],TREND_BUFFER[],Start_trend[],Fast_Trend[],Slow_Trend[],There_Trend[];

      /*int copied=CopyHigh(Symbolo,TimeFrame,0,Maximo,high);
      if(copied>-1 && index<copied)
         high=High[index];*/
      // Print(Maximo," ",Symbolo," ",TimeFrame);

      //Print("SALEEE      ",Symbolo,"  ",DATETIME,"  ",EnumToString(TimeFrame),"  ",Maximo);

      CopyHigh(Symbolo,TimeFrame,0,Maximo,high);
      CopyLow(Symbolo,TimeFrame,0,Maximo,low);
      CopyClose(Symbolo,TimeFrame,0,Maximo,close);
      CopyTime(Symbolo,TimeFrame,0,Maximo,time);
      CopyOpen(Symbolo,TimeFrame,0,Maximo,open);

      //   Print("SALEEE   2   ",Symbolo,"  ",DATETIME,"  ",EnumToString(TimeFrame));
      ArrayResize(FastDnPts,Maximo);
      ArrayResize(FastUpPts,Maximo);
      ArrayResize(SlowDnPts,Maximo);
      ArrayResize(SlowUpPts,Maximo);
      ArraySetAsSeries(SlowDnPts,true);
      ArraySetAsSeries(SlowUpPts,true);
      ArraySetAsSeries(FastDnPts,true);
      ArraySetAsSeries(FastUpPts,true);

      ArrayInitialize(SlowDnPts,0);
      ArrayInitialize(SlowUpPts,0);
      ArrayInitialize(FastDnPts,0);
      ArrayInitialize(FastUpPts,0);

      ArraySetAsSeries(high,true);
      ArraySetAsSeries(low,true);
      ArraySetAsSeries(time,true);
      ArraySetAsSeries(close,true);
      ArraySetAsSeries(open,true);

      /// Print("SALEEE   3   ",Symbolo,"  ",DATETIME,"  ",EnumToString(TimeFrame));

      ArrayResize(RSI_BUFFER,MaximoBuffers);
      ArrayResize(MAS_BUFFER,MaximoBuffers);
      ArrayResize(MA_BUFFER,MaximoBuffers);
      ArrayResize(ESTOCASTICO_BUFFER,MaximoBuffers);
      ArrayResize(TREND_BUFFER,MaximoBuffers);
      ArrayResize(Start_trend,MaximoBuffers);
      ArrayResize(Fast_Trend,MaximoBuffers);
      ArrayResize(Slow_Trend,MaximoBuffers);
      ArrayResize(There_Trend,MaximoBuffers);

      ArraySetAsSeries(RSI_BUFFER,true);
      ArraySetAsSeries(MAS_BUFFER,true);
      ArraySetAsSeries(MA_BUFFER,true);
      ArraySetAsSeries(ESTOCASTICO_BUFFER,true);
      ArraySetAsSeries(TREND_BUFFER,true);
      ArraySetAsSeries(Start_trend,true);
      ArraySetAsSeries(Fast_Trend,true);
      ArraySetAsSeries(Slow_Trend,true);
      ArraySetAsSeries(There_Trend,true);
      //Print("Entra");

      Handle_RSI=iRSI(Symbolo,TimeFrame,RSI_Periodo,RSI_Applied_Price);
      Handle_MA=iMA(Symbolo,TimeFrame,Period_MA,Shift_MA,MODE_MA,APP_MA);
      Handle_MA_S=iMA(Symbolo,TimeFrame,Period_MA_SLOW,Shift_MA,MODE_MA,APP_MA);
      Handle_ESTOCASTICO=iStochastic(Symbolo,TimeFrame,K_Periodo,D_Periodo,Slowing,Ma_Method_EST,STO_EST);

      int Handle_TREND=iCustom(Symbolo,TimeFrame,"::Indicators\\IndicatorPersonalized.ex5",inpFastLength,inpSlowLength); // Slow length);
      int Handle_Trend=iCustom(Symbolo,TimeFrame,"::Indicators\\Trend direction and force.ex5",trendPeriod,TriggerUp,TriggerDown);
      int Maximo2=0;

      if(Handle_TREND==INVALID_HANDLE)
         Print("THERE HANDLE INVALIDO");

      if(!ActualizarIndicador(RSI_Periodo+1,Bars_,Handle_RSI,MaximoBuffers,RSI_BUFFER,TimeFrame,Symbolo,"RSI",0))
         return false;
      if(!ActualizarIndicador(trendPeriod+1,Bars_,Handle_Trend,MaximoBuffers,TREND_BUFFER,TimeFrame,Symbolo,"TREND FORCE",2))
         return false;
      if(!ActualizarIndicador(K_Periodo + D_Periodo +Slowing+1,Bars_,Handle_ESTOCASTICO,MaximoBuffers,ESTOCASTICO_BUFFER,TimeFrame,Symbolo,"ESTOCASTICO",0))
         return false;
      if(!ActualizarIndicador(Period_MA+1,Bars_,Handle_MA,MaximoBuffers,MA_BUFFER,TimeFrame,Symbolo,"MA FAST",0))
         return false;
      if(!ActualizarIndicador(Period_MA_SLOW+1,Bars_,Handle_MA_S,MaximoBuffers,MAS_BUFFER,TimeFrame,Symbolo,"MA SLOW",0))
         return false;
      if(!ActualizarIndicador(MathMax(inpFastLength,inpSlowLength)+1,Bars_,Handle_TREND,MaximoBuffers,There_Trend,TimeFrame,Symbolo,"THERE TREND",3))
         return false;
      if(!ActualizarIndicador(MathMax(inpFastLength,inpSlowLength)+1,Bars_,Handle_TREND,MaximoBuffers,Fast_Trend,TimeFrame,Symbolo,"FAST TREND",6))
         return false;
      if(!ActualizarIndicador(MathMax(inpFastLength,inpSlowLength)+1,Bars_,Handle_TREND,MaximoBuffers,Slow_Trend,TimeFrame,Symbolo,"SLOW TREND",5))
         return false;
      if(!ActualizarIndicador(MathMax(inpFastLength,inpSlowLength)+1,Bars_,Handle_TREND,MaximoBuffers,Start_trend,TimeFrame,Symbolo,"START TREND",7))
         return false;



      string Frase=" ";
      string FraseS=" ";
      // Print("high  ",ArraySize(high)," low ",ArraySize(low)," close ",ArraySize(close)," time ",ArraySize(time)," RSI ",ArraySize(RSI_BUFFER)," MACD ",ArraySize(MACD_BUFFER)," ESTOCASTICO ",ArraySize(ESTOCASTICO_BUFFER));

      bool ISignalBuy=false;
      bool Is_Trend_Buy=false;
      bool Is_Trend_Sell=false;
      bool Signal=false;

      //bool Is_Trend_Buy=((Start_trend[1]!=EMPTY_VALUE && Start_trend[1]<=low[1])
      //                 || (There_Trend[2]==EMPTY_VALUE && There_Trend[1]!=EMPTY_VALUE  && Fast_Trend[1]<=low[1]));

      //bool Is_Trend_Sell=((Start_trend[1]!=EMPTY_VALUE && Start_trend[1]>=high[1])
      //                  || (There_Trend[2]==EMPTY_VALUE && There_Trend[1]!=EMPTY_VALUE && Fast_Trend[1]>=high[1]));



      /*int jkStart=-1;
      if(Is_Trend_Buy)
      for(int i=0; i<MathMin(EsperarConfirmacion+1,MaximoBuffers-1); i++)
        {
         if(TREND_BUFFER[1+i]>TriggerUp && TREND_BUFFER[2+i]<=TriggerUp)
           {
            jkStart=i;
            break;
           }
        }
      if(Is_Trend_Sell)
      for(int i=0; i<MathMin(EsperarConfirmacion+1,MaximoBuffers-1); i++)
        {
         if(TREND_BUFFER[1+i]<TriggerDown && TREND_BUFFER[2+i]>=TriggerDown)
           {
            jkStart=i;
            break;
           }
        }
      */
      if(TREND_BUFFER[1]>TriggerUp && TREND_BUFFER[2]<=TriggerUp)
        {
         Is_Trend_Buy=true;
        }
      if(TREND_BUFFER[1]<TriggerDown && TREND_BUFFER[2]>=TriggerDown)
        {
         Is_Trend_Sell=true;
        }


      // if(Is_Trend_Buy || Is_Trend_Sell) Print("Entra  " ,Symbolo,"  ",EnumToString(ENUM_TIMEFRAMES (TimeFrame)));

      Signal=false;

      IgualarValores(TimeFrame);

      if(Is_Trend_Buy || Is_Trend_Sell)
         for(int jk=0; jk<MathMin(Espera,MaximoBuffers-1); jk++)
           {
            if(jk>=0+1)
              {
               if(Is_Trend_Buy && TREND_BUFFER[jk+1]>TriggerUp)
                  break;
               if(Is_Trend_Sell && TREND_BUFFER[jk+1]<TriggerDown)
                  break;
              }

            int Prueba=jk;

            // if(Patrones(close,high,low,open,MaximoBuffers,ISignalBuy,RSI_BUFFER,ESTOCASTICO_BUFFER,MA_BUFFER,MAS_BUFFER,Point_,Prueba,FraseS,Is_Trend_Buy,Is_Trend_Sell))
            //{

            ISignalBuy=Is_Trend_Buy?true:false;

            if((ISignalBuy && close[Prueba+1]>open[Prueba+1]) || (!ISignalBuy && close[Prueba+1]<open[Prueba+1]))
               if(FiltroSupRes(low[Prueba+1],high[Prueba+1],ISignalBuy,high,low,close,TimeFrame,Symbolo,Maximo,Frase,Prueba))
                 {
                  Signal=true;
                  break;
                 }
            //   }
           }

      if(Signal)
        {
         //   Print(Symbolo,"  ",EnumToString(ENUM_TIMEFRAMES(TimeFrame)),"  ",close[1]," ",open[1]," ",high[1]," ",low[1]);
         Frase=FraseS+" "+Frase;
         if(ISignalBuy)
           {
            if(Existen_Divergencias[Fila][Columna]==false)
              {
               Tiempo_Evalua=DATETIME;
               AlertaComentario=AlertaComentario+" - "+Symbolo+" "+Nombres[ArregloGestion[Columna-1]]+" BUY "+Frase;
               Existen_Divergencias[Fila][Columna]=true;
               ObjectSetInteger(0,NombresCuadros[Fila][Columna],OBJPROP_BGCOLOR,Color_Buy);
               ObjectSetString(0,NombresCuadrosTextos[Fila][Columna],OBJPROP_TEXT,Frase);
               /*if(Modo_Experto && !AlertasInicio && !BuyAnterior && EvaluaHorario(Hora_Inicio,Hora_Final))
                  if(Botones_Symbolos_Bool[Fila-2])
                     Buy(Symbolo,ImpulsoBuyStart,ImpulsoBuyEnd,Fila);*/
              }
            return true;
           }
         else
           {
            if(Existen_Divergencias[Fila][Columna]==false)
              {
               Tiempo_Evalua=DATETIME;
               //  Print("Simbolo ",Symbolo," SellAnterior ",SellAnterior);
               AlertaComentario=AlertaComentario+" - "+Symbolo+" "+Nombres[ArregloGestion[Columna-1]]+" SELL "+Frase;
               Existen_Divergencias[Fila][Columna]=true;
               ObjectSetInteger(0,NombresCuadros[Fila][Columna],OBJPROP_BGCOLOR,Color_Sell);
               ObjectSetString(0,NombresCuadrosTextos[Fila][Columna],OBJPROP_TEXT,Frase);
               /* if(Modo_Experto && !AlertasInicio && !SellAnterior && EvaluaHorario(Hora_Inicio,Hora_Final))
                   if(Botones_Symbolos_Bool[Fila-2])
                      Sell(Symbolo,ImpulsoSellStart,ImpulsoSellEnd,Fila);*/
              }
            return true;
           }
        }

      ObjectSetInteger(0,NombresCuadros[Fila][Columna],OBJPROP_BGCOLOR,Color_Fondo_Default);
      ObjectSetString(0,NombresCuadrosTextos[Fila][Columna],OBJPROP_TEXT,Frase);
      Existen_Divergencias[Fila][Columna]=false;

      ChartRedraw();
     }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
int CheckLoadHistory(string symbol,ENUM_TIMEFRAMES period,datetime start_date)
  {
   datetime first_date=0;
   datetime times[100];
//--- check symbol & period
   if(symbol==NULL || symbol=="")
      symbol=Symbol();
   if(period==PERIOD_CURRENT)
      period=Period();
//--- check if symbol is selected in the MarketWatch
   if(!SymbolInfoInteger(symbol,SYMBOL_SELECT))
     {
      if(GetLastError()==ERR_MARKET_UNKNOWN_SYMBOL)
         return(-1);
      SymbolSelect(symbol,true);
     }
//--- check if data is present
   SeriesInfoInteger(symbol,period,SERIES_FIRSTDATE,first_date);
   if(first_date>0 && first_date<=start_date)
      return(1);
//--- don't ask for load of its own data if it is an indicator
//  if(MQL5InfoInteger(MQL5_PROGRAM_TYPE)==PROGRAM_INDICATOR && Period()==period && Symbol()==symbol)
   if(Period()==period && Symbol()==symbol)
      return(-4);
//--- second attempt
   if(SeriesInfoInteger(symbol,PERIOD_M1,SERIES_TERMINAL_FIRSTDATE,first_date))
     {
      //--- there is loaded data to build timeseries
      if(first_date>0)
        {
         //--- force timeseries build
         CopyTime(symbol,period,first_date+PeriodSeconds(period),1,times);
         //--- check date
         if(SeriesInfoInteger(symbol,period,SERIES_FIRSTDATE,first_date))
            if(first_date>0 && first_date<=start_date)
               return(2);
        }
     }
//--- max bars in chart from terminal options
   int max_bars=TerminalInfoInteger(TERMINAL_MAXBARS);
//--- load symbol history info
   datetime first_server_date=0;
   while(!SeriesInfoInteger(symbol,PERIOD_M1,SERIES_SERVER_FIRSTDATE,first_server_date) && !IsStopped())
      Sleep(5);
//--- fix start date for loading
   if(first_server_date>start_date)
      start_date=first_server_date;
   if(first_date>0 && first_date<first_server_date)
      Print("Warning: first server date ",first_server_date,
            " for ",symbol," does not match to first series date ",first_date);
//--- load data step by step
   int fail_cnt=0;
   while(!IsStopped())
     {
      //--- wait for timeseries build
      while(!SeriesInfoInteger(symbol,period,SERIES_SYNCHRONIZED) && !IsStopped())
         Sleep(5);
      //--- ask for built bars
      int bars=Bars(symbol,period);
      if(bars>0)
        {
         if(bars>=max_bars)
            return(-2);
         //--- ask for first date
         if(SeriesInfoInteger(symbol,period,SERIES_FIRSTDATE,first_date))
            if(first_date>0 && first_date<=start_date)
               return(0);
        }
      //--- copying of next part forces data loading
      int copied=CopyTime(symbol,period,bars,100,times);
      if(copied>0)
        {
         //--- check for data
         if(times[0]<=start_date)
            return(0);
         if(bars+copied>=max_bars)
            return(-2);
         fail_cnt=0;
        }
      else
        {
         //--- no more than 100 failed attempts
         fail_cnt++;
         if(fail_cnt>=100)
            return(-5);
         Sleep(10);
        }
     }
//--- stopped
   return(-3);
  }
//+------------------------------------------------------------------+
//| devuelve a la cadena valor del período                           |
//+------------------------------------------------------------------+
string GetPeriodName(ENUM_TIMEFRAMES period)
  {
   if(period==PERIOD_CURRENT)
      period=Period();
//---
   switch(period)
     {
      case PERIOD_M1:
         return("M1");
      case PERIOD_M2:
         return("M2");
      case PERIOD_M3:
         return("M3");
      case PERIOD_M4:
         return("M4");
      case PERIOD_M5:
         return("M5");
      case PERIOD_M6:
         return("M6");
      case PERIOD_M10:
         return("M10");
      case PERIOD_M12:
         return("M12");
      case PERIOD_M15:
         return("M15");
      case PERIOD_M20:
         return("M20");
      case PERIOD_M30:
         return("M30");
      case PERIOD_H1:
         return("H1");
      case PERIOD_H2:
         return("H2");
      case PERIOD_H3:
         return("H3");
      case PERIOD_H4:
         return("H4");
      case PERIOD_H6:
         return("H6");
      case PERIOD_H8:
         return("H8");
      case PERIOD_H12:
         return("H12");
      case PERIOD_D1:
         return("Daily");
      case PERIOD_W1:
         return("Weekly");
      case PERIOD_MN1:
         return("Monthly");
     }
//---
   return("unknown period");
  }
//+----------------------------------------------------------
//+------------------------------------------------------------------+
/*
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
            for(int i=1; i<100 && shift-i-1>1 ; i++)
              {
               if(close[shift-i]>close[shift-i-1])
                 {
                  double Rango=MathAbs(close[shift-i]-close[shift]);
                  if(Rango/2.0>=MathAbs(close[shift]-close[shift+1+j]))
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
            for(int i=1; i<100 && shift-i-1>1 ; i++)
              {
               if(high[shift-i]>high[shift-i-1])
                 {
                  double Rango=MathAbs(high[shift-i]-low[shift]);

                  if(Rango/2.0>=MathAbs(low[shift]-high[shift+1+j]))
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
            for(int i=1; i<100 && shift-i-1>1 ; i++)
              {
               if(close[shift-i]<close[shift-i-1])
                 {
                  double Rango=MathAbs(close[shift-i]-close[shift]);
                  if(Rango/2.0>=MathAbs(close[shift]-close[shift+1+j]))
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
            for(int i=1; i<100&& shift-i-1>1 ; i++)
              {
               if(low[shift-i]<low[shift-i-1])
                 {
                  double Rango=MathAbs(low[shift-i]-high[shift]);
                  if(Rango/2.0>=MathAbs(high[shift]-low[shift+1+j]))
                    {
                     ImpulsoStart=high[shift];
                     ImpulsoEnd=low[shift-i];
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

     }
   return false;
  }*/
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+


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


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ButtonCreate(const long              chart_ID=0,               // ID del gráfico
                  const string            name="Button",            // nombre del botón
                  const int               sub_window=0,             // número de subventana
                  const int               x=0,                      // coordenada por el eje X
                  const int               y=0,                      // coordenada por el eje Y
                  const int               width=50,                 // ancho del botón
                  const int               height=18,                // alto del botón
                  const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace
                  const string            text="Button",            // texto
                  const string            font="Arial",             // fuente
                  const int               font_size=10,             // tamaño de la fuente
                  const color             clr=clrBlack,             // color del texto
                  const color             back_clr=C'236,233,216',  // color del fondo
                  const color             border_clr=clrNONE,       // color del borde
                  const bool              state=false,              // pulsado/no pulsado
                  const bool              back=false,               // al fondo
                  const bool              selection=false,          // seleccionar para mover
                  const bool              hidden=true,              // ocultar en la lista de objetos
                  const long              z_order=0)                //prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos el botón
   if(!ObjectCreate(chart_ID,name,OBJ_BUTTON,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear el botón! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos las coordenadas del botón
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- establecemos el tamaño del botón
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del punto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- ponemos el texto
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- establecemos la fuente del texto
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- establecemos el tamaño del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- establecemos el color del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el color del fondo
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- establecemos el color del borde
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- set button state
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
//--- activar (true) o desactivar (false) el modo de desplazamiento del botón con ratón
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
bool EditCreate(const long             chart_ID=0,               // ID del gráfico
                const string           name="Edit",              // nombre del objeto
                const int              sub_window=0,             // número de subventana
                const int              x=0,                      // coordenada por el eje X
                const int              y=0,                      // coordenada por el eje Y
                const int              width=50,                 // ancho
                const int              height=18,                // alto
                const string           text="Text",              // texto
                const string           font="Arial",             // fuente
                const int              font_size=10,             // tamaño de la fuente
                const ENUM_ALIGN_MODE  align=ALIGN_CENTER,       // modo de alineación
                const bool             read_only=false,          // posibilidad de edición
                const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace
                const color            clr=clrBlack,             // color del texto
                const color            back_clr=clrWhite,        // color del fondo
                const color            border_clr=clrNONE,       // color del borde
                const bool             back=false,               // al fondo
                const bool             selection=false,          // seleccionar para mover
                const bool             hidden=true,              // ocultar en la lista de objetos
                const long             z_order=0)                // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos el campo de edición
   if(!ObjectCreate(chart_ID,name,OBJ_EDIT,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear el objeto \"Campo de edición\"! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos las coordenadas del objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- establecemos el tamaño del objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- ponemos el texto
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- establecemos la fuente del texto
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- establecemos el tamaño del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- establecemos el modo de alineación del texto dentro del objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_ALIGN,align);
//--- ponemos (true) o cancelamos (false) el modo sólo para lectura
   ObjectSetInteger(chart_ID,name,OBJPROP_READONLY,read_only);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- establecemos el color del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el color del fondo
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- establecemos el color del borde
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
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
bool ComprobarSub(string cadena,bool EsDouble)
  {
   ushort Digito=0;
   int Numero=0;
   int Punto=0;

   for(int i=0; i<StringLen(cadena); i++)
     {
      Digito=StringGetCharacter(cadena,i);
      if((Digito<'0' || Digito>'9') && Digito!='.')
         return false;

      if(Digito=='.')
         Punto++;

      if(Punto>=2)
         return false;

      if(Digito>='0' && Digito<='9')
         Numero++;
     }

   if(!EsDouble)
     {
      if(Punto!=0)
         return false;
     }

//Print(a);
   if(Numero==0)
      return false;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ComprobarEdits()
  {

   for(int i=0; i<Filas_Totales-2; i++)
     {
      bool State=ObjectGetInteger(0,Botones_Symbolos[i],OBJPROP_STATE,0);
      if(State)
        {
         ObjectSetInteger(0,Botones_Symbolos[i],OBJPROP_BGCOLOR,clrGreen);
         Botones_Symbolos_Bool[i]=true;
        }
      else
        {
         ObjectSetInteger(0,Botones_Symbolos[i],OBJPROP_BGCOLOR,clrRed);
         Botones_Symbolos_Bool[i]=false;
        }

      string Comentario_Edit=ObjectGetString(0,Edit_Symbolos[i],OBJPROP_TEXT,0);
      if(Comentario_Edit!=Edit_Symbolos_Anteriores[i].Lotaje_String)
        {
         if(ComprobarSub(Comentario_Edit,true))
           {
            double Lote=StringToDouble(Comentario_Edit);
            Lote=MathFloor(Lote*100);
            Lote=NormalizeDouble(Lote/100.0,2);

            double Lote_Step=Lote/SymbolInfoDouble(Array_Symbolos[i],SYMBOL_VOLUME_STEP);
            int Lote_Step_int=int(Lote/SymbolInfoDouble(Array_Symbolos[i],SYMBOL_VOLUME_STEP));

            if((Lote_Step-Lote_Step_int)>0)
              {
               Lote=Lote_Step_int*SymbolInfoDouble(Array_Symbolos[i],SYMBOL_VOLUME_STEP);
               Print("Lote no es compatible con el paso del Lote para el simbolo ",Array_Symbolos[i]);
               Print("Redondeando al Lote mas cercano permitido");
              }
            if(Lote>SymbolInfoDouble(Array_Symbolos[i],SYMBOL_VOLUME_MAX))
               Lote=SymbolInfoDouble(Array_Symbolos[i],SYMBOL_VOLUME_MAX);
            if(Lote<SymbolInfoDouble(Array_Symbolos[i],SYMBOL_VOLUME_MIN))
               Lote=SymbolInfoDouble(Array_Symbolos[i],SYMBOL_VOLUME_MIN);

            Edit_Symbolos_Anteriores[i].Lotaje_Double=Lote;
            Edit_Symbolos_Anteriores[i].Lotaje_String=DoubleToString(Lote,2);
            ObjectSetString(0,Edit_Symbolos[i],OBJPROP_TEXT,Edit_Symbolos_Anteriores[i].Lotaje_String);
           }

         else
            ObjectSetString(0,Edit_Symbolos[i],OBJPROP_TEXT,Edit_Symbolos_Anteriores[i].Lotaje_String);
        }

      if(ObjectFind(0,NombresCuadrosTextosExpertos[i+2][2])==0)
        {
         int Spread=(int)SymbolInfoInteger(Array_Symbolos[i],SYMBOL_SPREAD);
         string SpreadS=IntegerToString(Spread);
         ObjectSetString(0,NombresCuadrosTextosExpertos[i+2][2],OBJPROP_TEXT,SpreadS);
        }

      if(ObjectFind(0,NombresCuadrosTextosExpertos[i+2][0])==0)
        {
         int Digitos=(int)SymbolInfoInteger(Array_Symbolos[i],SYMBOL_DIGITS);
         string BID=DoubleToString(SymbolInfoDouble(Array_Symbolos[i],SYMBOL_BID),Digitos);
         ObjectSetString(0,NombresCuadrosTextosExpertos[i+2][0],OBJPROP_TEXT,BID);
        }

      if(ObjectFind(0,NombresCuadrosTextosExpertos[i+2][1])==0)
        {
         int Digitos=(int)SymbolInfoInteger(Array_Symbolos[i],SYMBOL_DIGITS);
         string ASK=DoubleToString(SymbolInfoDouble(Array_Symbolos[i],SYMBOL_ASK),Digitos);
         ObjectSetString(0,NombresCuadrosTextosExpertos[i+2][1],OBJPROP_TEXT,ASK);
        }


      if(ObjectFind(0,NombresCuadrosTextosExpertos[i+2][3])==0)
        {
         int Spread=(int)SymbolInfoInteger(Array_Symbolos[i],SYMBOL_SPREAD);
         double Calculo=Spread*SymbolInfoDouble(Array_Symbolos[i],SYMBOL_TRADE_TICK_VALUE)*Edit_Symbolos_Anteriores[i].Lotaje_Double;
         string Calculo_String="-"+DoubleToString(Calculo,2);
         ObjectSetString(0,NombresCuadrosTextosExpertos[i+2][3],OBJPROP_TEXT,Calculo_String);
        }

      if(ObjectFind(0,NombresCuadrosTextosExpertos[i+2][4])==0)
        {
         double Calculo=SymbolInfoDouble(Array_Symbolos[i],SYMBOL_TRADE_TICK_VALUE)*Edit_Symbolos_Anteriores[i].Lotaje_Double;
         string Calculo_String=DoubleToString(Calculo,4);
         ObjectSetString(0,NombresCuadrosTextosExpertos[i+2][4],OBJPROP_TEXT,Calculo_String);
        }

     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Buy(string Simbolo,double ImpulsoStart,double ImpulsoEnd,int Fila)
  {
   double Ask_=SymbolInfoDouble(Simbolo,SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Simbolo,SYMBOL_BID);
   double SL=0;
   double Point_=SymbolInfoDouble(Simbolo,SYMBOL_POINT);
   int Digitos_=(int)SymbolInfoInteger(Simbolo,SYMBOL_DIGITS);
   double TP=0;

   if(Tipo_TP==TP_NORMAL)
      TP=ImpulsoStart+MathAbs(ImpulsoStart-ImpulsoEnd)*Porcentaje/100.0;

   int Stops=(int)SymbolInfoInteger(PositionGetString(POSITION_SYMBOL),SYMBOL_TRADE_STOPS_LEVEL);

   if(SL_Type==Arriba_de_flecha)
     {
      SL=ImpulsoStart<Bid?NormalizeDouble(ImpulsoStart-Desplazamiento_SL*Point_,Digitos_):0;
      if(MathAbs(ImpulsoStart-Bid)/Point_<Stops)
         SL=Bid-(Stops+2)*Point_;
     }
   else
     {
      SL=ImpulsoStart-(MathAbs(ImpulsoStart-ImpulsoEnd))-Desplazamiento_SL*Point_;
      if(MathAbs(ImpulsoStart-ImpulsoEnd)/Point_<Stops)
         SL=Bid-(Stops+2)*Point_;
     }
   SL=NormalizeDouble(SL,Digitos_);

   if(ObjectFind(0,Edit_Symbolos[Fila-2])==0)
     {
      double Lote=StringToDouble(ObjectGetString(0,Edit_Symbolos[Fila-2],OBJPROP_TEXT,0));
      bool Ejecuto=trade.Buy(Lote,Simbolo,Ask_,SL,TP,"EXPERTO PANEL DIVERGENCIAS");

      if(Ejecuto==false)
         Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
      else
         if(Tipo_TP==TP_TRAILING)
           {
            ulong Resultado=trade.ResultOrder();
            RegistrarTicket(Resultado,ImpulsoStart,ImpulsoEnd,true);
           }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Sell(string Simbolo,double ImpulsoStart,double ImpulsoEnd,int Fila)
  {

   double Ask_=SymbolInfoDouble(Simbolo,SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Simbolo,SYMBOL_BID);
   double SL=0;
   double Point_=SymbolInfoDouble(Simbolo,SYMBOL_POINT);
   int Digitos_=(int)SymbolInfoInteger(Simbolo,SYMBOL_DIGITS);

   double TP=0;
   if(Tipo_TP==TP_NORMAL)
      TP=ImpulsoStart-MathAbs(ImpulsoStart-ImpulsoEnd)*Porcentaje/100.0;

   int Stops=(int)SymbolInfoInteger(PositionGetString(POSITION_SYMBOL),SYMBOL_TRADE_STOPS_LEVEL);

   if(SL_Type==Arriba_de_flecha)
     {
      SL=ImpulsoStart>Ask_?NormalizeDouble(ImpulsoStart+Desplazamiento_SL*Point_,Digitos_):0;
      if(MathAbs(ImpulsoStart-Ask_)/Point_<Stops)
         SL=Ask_+(Stops+2)*Point_;
     }
   else
     {
      SL=ImpulsoStart+(MathAbs(ImpulsoStart-ImpulsoEnd))+Desplazamiento_SL*Point_;
      if(MathAbs(ImpulsoStart-ImpulsoEnd)/Point_<Stops)
         SL=Ask_+(Stops+2)*Point_;
     }
   SL=NormalizeDouble(SL,Digitos_);

   if(ObjectFind(0,Edit_Symbolos[Fila-2])==0)
     {
      double Lote=StringToDouble(ObjectGetString(0,Edit_Symbolos[Fila-2],OBJPROP_TEXT,0));
      bool Ejecuto=trade.Sell(Lote,Simbolo,Bid,SL,TP,"EXPERTO PANEL DIVERGENCIAS");

      if(Ejecuto==false)
         Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
      else
         if(Tipo_TP==TP_TRAILING)
           {
            ulong Resultado=trade.ResultOrder();
            RegistrarTicket(Resultado,ImpulsoStart,ImpulsoEnd,false);
           }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void RegistrarTicket(ulong Orden,double ImpulsoStart,double ImpulsoEnd,bool isBuy)
  {
   bool Reconocio=false;
   bool Entro=false;
   int Total=PositionsTotal();
   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;
      if(PositionGetInteger(POSITION_IDENTIFIER)==Orden)
        {
         Reconocio=true;

         int Size=ArraySize(Tickets_TS);
         double Point_=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_POINT);

         for(int j=0; j<Size; j++)
           {
            if(Tickets_TS[j].Ticket==-1)
              {
               double Nivel=isBuy?(ImpulsoStart+(MathAbs(ImpulsoEnd-ImpulsoStart)*Porcentaje/100.0)):(ImpulsoStart-(MathAbs(ImpulsoStart-ImpulsoEnd)*Porcentaje/100.0));
               Entro=true;
               Tickets_TS[j].Ticket=Ticket;
               Tickets_TS[j].NivelTS=Nivel;
               Tickets_TS[j].Puntos_Impulso=int(MathAbs(ImpulsoEnd-ImpulsoStart)/Point_);
               Print("Nivel ",Tickets_TS[j].NivelTS," Ticket ",Tickets_TS[j].Ticket," Puntos ",Tickets_TS[j].Puntos_Impulso);
               break;
              }
           }
         if(!Entro)
           {
            double Nivel=isBuy?(ImpulsoStart+(MathAbs(ImpulsoEnd-ImpulsoStart)*Porcentaje/100.0)):(ImpulsoStart-(MathAbs(ImpulsoStart-ImpulsoEnd)*Porcentaje/100.0));
            ArrayResize(Tickets_TS,Size+10);
            for(int j=Size; j<Size+10; j++)
               Tickets_TS[j].Ticket=-1;
            Tickets_TS[Size].Ticket=Ticket;
            Tickets_TS[Size].NivelTS=Nivel;
            Tickets_TS[Size].Puntos_Impulso=int(MathAbs(ImpulsoEnd-ImpulsoStart)/Point_);
            Print("Nivel ",Tickets_TS[Size].NivelTS," Ticket ",Tickets_TS[Size].Ticket," Puntos ",Tickets_TS[Size].Puntos_Impulso);
           }
         break;
        }
     }
   if(Reconocio==false)
      Print("No Reconocio Orden....",Orden);
  }
//+------------------------------------------------------------------+






//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TS_() // FUNCION DEL TS Y BREAK VEN
  {
   int Size=ArraySize(Tickets_TS);

   for(int j=0; j<Size; j++)
     {
      if(Tickets_TS[j].Ticket==-1 || !PositionSelectByTicket(Tickets_TS[j].Ticket))
        {
         Tickets_TS[j].Ticket=-1;
         continue;
        }
      double Bid=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_BID);
      double Ask=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_ASK);
      double OrderOpen=PositionGetDouble(POSITION_PRICE_OPEN);
      double StopLoss=PositionGetDouble(POSITION_SL);
      double Point_=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_POINT);
      int Digitos_=(int)SymbolInfoInteger(PositionGetString(POSITION_SYMBOL),SYMBOL_DIGITS);
      ENUM_POSITION_TYPE Tipo=(ENUM_POSITION_TYPE) PositionGetInteger(POSITION_TYPE);

      int Stops=(int)SymbolInfoInteger(PositionGetString(POSITION_SYMBOL),SYMBOL_TRADE_STOPS_LEVEL);
      int PasoTrailing_Stop=int(Tickets_TS[j].Puntos_Impulso*(double (PasoPorcentaje)/100.0));
      if(PasoTrailing_Stop<Stops)
         PasoTrailing_Stop=Stops+1;

      //TS Funcion
      if(Tipo==POSITION_TYPE_BUY && Tickets_TS[j].NivelTS>0 /*&& NormalizeDouble(Bid-Trailing_Stop*Point__,Digitos_)>OrderOpen*/ && Bid>Tickets_TS[j].NivelTS &&
         (((Bid-StopLoss>=PasoTrailing_Stop*2* Point_  || StopLoss<OrderOpen) && StopLoss<NormalizeDouble(Bid-PasoTrailing_Stop*Point_,Digitos_)) || StopLoss==0))
         if(!trade.PositionModify(Tickets_TS[j].Ticket,NormalizeDouble(Bid-PasoTrailing_Stop*Point_,Digitos_),PositionGetDouble(POSITION_TP)))
           {
            Print("Puntos ",PasoTrailing_Stop);
            Print("ERROR NO MODIFICO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
           }

      if(Tipo==POSITION_TYPE_SELL && Tickets_TS[j].NivelTS>0 /*&& NormalizeDouble(Ask+Trailing_Stop*Point_,Digitos_)<OrderOpen*/  && Ask<Tickets_TS[j].NivelTS &&
         (((StopLoss-Ask>=PasoTrailing_Stop*2*Point_ || StopLoss>OrderOpen) && StopLoss>NormalizeDouble(Ask+PasoTrailing_Stop*Point_,Digitos_)) || StopLoss==0))
         if(!trade.PositionModify(Tickets_TS[j].Ticket,NormalizeDouble(Ask+PasoTrailing_Stop*Point_,Digitos_),PositionGetDouble(POSITION_TP)))
           {
            Print("Puntos ",PasoTrailing_Stop);
            Print("ERROR NO MODIFICO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
           }
     }
  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluaHorario(int Apertura,int Cierre)
  {
   MqlDateTime TiempoActual;
   TimeToStruct(TimeCurrent(),TiempoActual);

   if(Apertura==Cierre)
      return true;

   if(Apertura>Cierre && (TiempoActual.hour>=Apertura || TiempoActual.hour<Cierre))
      return true;
   else
      if(Apertura<Cierre && TiempoActual.hour>=Apertura && TiempoActual.hour<Cierre)
         return true;

   return false;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IgualarValores(ENUM_TIMEFRAMES Periodo)
  {

   switch(Periodo)
     {
      case PERIOD_M1:
      case PERIOD_M2:
      case PERIOD_M3:
      case PERIOD_M4:
         //period=EnumToString(ENUM_TIMEFRAMES(Period()));
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
         // period=EnumToString(ENUM_TIMEFRAMES(Period()));
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
         //  period=EnumToString(ENUM_TIMEFRAMES(Period()));
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
         //    period=EnumToString(ENUM_TIMEFRAMES(Period()));
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
         //   period=EnumToString(ENUM_TIMEFRAMES(Period()));
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
         //    period=EnumToString(ENUM_TIMEFRAMES(Period()));
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
         //    period=EnumToString(ENUM_TIMEFRAMES(Period()));
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
         //    period=EnumToString(ENUM_TIMEFRAMES(Period()));
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
         //   period=EnumToString(ENUM_TIMEFRAMES(Period()));
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
      default:
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
         break;
     }

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Fractal(int M,int P,int shift,const double &High[],const double &Low[],ENUM_TIMEFRAMES Periodo,string Symbolo,int Prueba)
  {
   int PeriodoEva=PeriodSeconds(Periodo)/60;

   if(PeriodoEva>P)
      P=PeriodoEva;

   P=int(P/PeriodoEva*2+MathCeil(P/PeriodoEva/2));

   if((shift-Prueba)<P)
      return(false);


   if(shift>=Bars(Symbolo,Periodo)-P)
      return(false);

   if(ArraySize(High)<=shift+P || ArraySize(Low)<=shift+P)
      return false;

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
void FastFractals(double &High[],double &Low[],double &Close[],ENUM_TIMEFRAMES Periodo,string Symbolo,int &Maximo,int Prueba)
  {

   int shift;
   int limit=MathMin(Bars(Symbolo,Periodo),BackLimit+Prueba);
   int P=int((PeriodSeconds(Periodo)/60)*fractal_fast_factor);

   if(Maximo<limit+1)
     {
      Maximo=limit+1;
      CopyHigh(Symbolo,Periodo,0,Maximo,High);
      CopyLow(Symbolo,Periodo,0,Maximo,Low);
      CopyClose(Symbolo,Periodo,0,Maximo,Close);

      ArrayResize(FastDnPts,Maximo);
      ArrayResize(FastUpPts,Maximo);
      ArrayResize(SlowDnPts,Maximo);
      ArrayResize(SlowUpPts,Maximo);
     }

   FastUpPts[0+Prueba] = 0.0;
   FastUpPts[1+Prueba] = 0.0;
   FastDnPts[0+Prueba] = 0.0;
   FastDnPts[1+Prueba] = 0.0;

   for(shift=limit; shift>1+Prueba; shift--)
     {
      if(Fractal(UP_POINT,P,shift,High,Low,Periodo,Symbolo,Prueba)==true)
         FastUpPts[shift]=High[shift];
      else
         FastUpPts[shift]=0.0;

      if(Fractal(DN_POINT,P,shift,High,Low,Periodo,Symbolo,Prueba)==true)
         FastDnPts[shift]=Low[shift];
      else
         FastDnPts[shift]=0.0;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SlowFractals(const double &High[],const double &Low[],ENUM_TIMEFRAMES Periodo,string Symbolo,int Prueba)
  {

   int shift;
   int limit=MathMin(Bars(Symbolo,Periodo),BackLimit+Prueba);
   int P=int((PeriodSeconds(Periodo)/60)*fractal_slow_factor);

   SlowUpPts[0+Prueba] = 0.0;
   SlowUpPts[1+Prueba] = 0.0;
   SlowDnPts[0+Prueba] = 0.0;
   SlowDnPts[1+Prueba] = 0.0;

   for(shift=limit; shift>1+Prueba; shift--)
     {
      if(Fractal(UP_POINT,P,shift,High,Low,Periodo,Symbolo,Prueba)==true)
         SlowUpPts[shift]=High[shift];
      else
         SlowUpPts[shift]=0.0;

      if(Fractal(DN_POINT,P,shift,High,Low,Periodo,Symbolo,Prueba)==true)
         SlowDnPts[shift]=Low[shift];
      else
         SlowDnPts[shift]=0.0;
     }
  }
//+------------------------------------------------------------------+
bool FindZones(const double &High[],const double &Close[],const double &Low[],ENUM_TIMEFRAMES Periodo,string Symbolo,int Prueba)
  {
   int i,j=0,shift,bustcount=0,testcount=0;
   double hival,loval;
   bool turned=false,hasturned=false;

   double temp_hi[2000],temp_lo[2000];
   int    temp_start[2000],temp_hits[2000],temp_strength[2000],temp_count=0;
   bool   temp_turn[2000],temp_merge[2000];
   int merge1[2000],merge2[2000],merge_count=0;

   DefinitionATR=iATR(Symbolo,Periodo,7);

// iterate through zones from oldest to youngest (ignore recent 5 bars),
// finding those that have survived through to the present___
   for(shift=MathMin(Bars(Symbolo,Periodo)-1,BackLimit+Prueba); shift>5+Prueba; shift--)
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

   if(j>=2000)
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
   int limit=MathMin(Bars(Symbolo,Periodo),BackLimit+Prueba);
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
               for(j=5+Prueba; j<limit; j++)
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

               if(j==limit)
                  zone_type[zone_count]=ZONE_SUPPORT;
              }

         zone_count++;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroSupRes(double Low,double High,bool isBuy,double &high[],double &low[],double &close[],ENUM_TIMEFRAMES TimeFrame,string Symbolo,int &Maximo,string &Frase,int Prueba)
  {

   Prueba=Prueba+(Repintado?0:1);

   if(!FiltroSupportRes)
      return true;

   FastFractals(high,low,close,TimeFrame,Symbolo,Maximo,Prueba);
   SlowFractals(high,low,TimeFrame,Symbolo,Prueba);
   if(!FindZones(high,close,low,TimeFrame,Symbolo,Prueba))
     {
      Print("Mala Ejecucion ",TimeFrame," ",Symbolo);
      return false;
     }

   double POINT=SymbolInfoDouble(Symbolo,SYMBOL_POINT);

   if(!isBuy)
     {
      for(int i=0; i<zone_count; i++)
        {
         if(zone_type[i]==ZONE_RESIST)
            if(zone_hits[i]>Testeado)
               if(zone_hi[i]>High && zone_lo[i]-Tolerancia_Puntos_Flecha*POINT<High && Low<zone_lo[i])
                 {
                  //  if(Symbolo=="USDCAD" && TimeFrame==PERIOD_M20)
                  //   Print("High  ",High,"   Low ",Low);

                  Frase=IntegerToString(zone_hits[i]);
                  return true;
                 }
        }
     }
   else
     {
      for(int i=0; i<zone_count; i++)
        {
         if(zone_type[i]==ZONE_SUPPORT)
            if(zone_hits[i]>Testeado)
               if(zone_hi[i]+Tolerancia_Puntos_Flecha*POINT>Low && zone_lo[i]<Low && High>zone_hi[i])
                 {
                  Frase=IntegerToString(zone_hits[i]);
                  return true;
                 }
        }
     }

   return false;
  }
//+-
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FuncionCambioGrafico(int FilaR,int ColumnaR,datetime &TiempoEspera)
  {

   PlaySound("transicion");

   ColumnaRSeleccionado=ColumnaR;
   FilaRSeleccionado=FilaR;

   string Simbolo=Array_Symbolos[FilaR-2];
   ENUM_TIMEFRAMES Periodo=TIMEFRAMES[ArregloGestion[ColumnaR-1]];

   if(ChartPeriod(Open_CHARD)==0 || Open_CHARD==0)
     {
      Open_CHARD=ChartOpen(Simbolo,Periodo);

      if(Open_CHARD!=0)
        {
         ChartSetString(Open_CHARD,CHART_COMMENT,"PATRONES PRO");
         if(AplicarPlantilla)
           {
            ChartApplyTemplate(Open_CHARD,Tu_Plantilla+".tpl");
            TiempoEspera=TimeLocal()+3;
           }
         else
           {
            ChartSetInteger(Open_CHARD,CHART_COLOR_BACKGROUND,clrBlack);
            ChartSetInteger(Open_CHARD,CHART_COLOR_GRID,clrLightSlateGray);
            ChartSetInteger(Open_CHARD,CHART_COLOR_CHART_UP,clrLime);
            ChartSetInteger(Open_CHARD,CHART_COLOR_CHART_DOWN,clrRed);
            ChartSetInteger(Open_CHARD,CHART_COLOR_CANDLE_BULL,clrGreen);
            ChartSetInteger(Open_CHARD,CHART_COLOR_CANDLE_BEAR,clrOrangeRed);
            ChartSetInteger(Open_CHARD,CHART_COLOR_LAST,clrYellow);
            ChartSetInteger(Open_CHARD,CHART_COLOR_BID,clrLightSlateGray);
            ChartSetInteger(Open_CHARD,CHART_COLOR_ASK,clrRed);
            ChartSetInteger(Open_CHARD,CHART_SHIFT,true);
            ChartSetInteger(Open_CHARD,CHART_SHOW_GRID,false);
            ChartSetInteger(Open_CHARD,CHART_SHOW_PERIOD_SEP,Ver_Separadores);
            ChartSetInteger(Open_CHARD,CHART_SHOW_ASK_LINE,true);
            ChartSetInteger(Open_CHARD,CHART_SCALE,Escala);
            ChartRedraw(Open_CHARD);
            TiempoEspera=TimeLocal()+2;
           }
         ChartRedraw(Open_CHARD);
        }

      if(ChartPeriod(Open_CHARD)!=0 && AplicarPlantilla==false)
         Handle_Indicador=iCustom(Simbolo,Periodo,"::Indicators\\INDICADOR PATRONES PRO\\PATRONES FINAL ANTIGUO.ex5",Espera,500,Testeado,Repintado,Ver_Sop_Res_Historial,Hora_Inicio,Hora_Final,Tolerancia_Puntos_Flecha," ",
                                  Filter_Estocastico,Filter_MA,Filter_RSI," ",K_Periodo,D_Periodo,Slowing,Ma_Method_EST," ",Tolerancia_Puntos,Period_MA_SLOW,Period_MA,
                                  Shift_MA,APP_MA,MODE_MA," ",RSI_Periodo,RSI_Applied_Price," ",false,false,"alert2",false,false,false," ",VerSopRes,BackLimit," ",trendPeriod,TriggerUp,TriggerDown," ",zone_show_weak,zone_show_untested,zone_show_turncoat,zone_fuzzfactor,SeparacionTexto,true);


      if(Open_CHARD!=0 && Handle_Indicador!=INVALID_HANDLE  && AplicarPlantilla==false)
         ChartIndicatorAdd(Open_CHARD,0,Handle_Indicador);


      if(Handle_Indicador==INVALID_HANDLE)
         Alert("No se puede agregar el Indicador al Grafico... revise si esta escrito bien y que este en la carpeta Indicadores o subcarpeta");

      if(Ver_Emas)
        {
         Handle_MA=iCustom(Simbolo,Periodo,"::Indicators\\INDICADOR PATRONES PRO\\EMA_COLOR.ex5",Period_MA,Shift_MA,APP_MA,MODE_MA,"EMA FAST",Grosor_Fast,Estilo_Fast,Color_Fast);

         Handle_MA_S=iCustom(Simbolo,Periodo,"::Indicators\\INDICADOR PATRONES PRO\\EMA_COLOR.ex5",Period_MA_SLOW,Shift_MA,APP_MA,MODE_MA,"EMA SLOW",Grosor_Slow,Estilo_Slow,Color_Slow);

         if(Open_CHARD!=0 && Handle_MA!=INVALID_HANDLE)
            ChartIndicatorAdd(Open_CHARD,0,Handle_MA);

         if(Handle_MA==INVALID_HANDLE)
            Alert("No se puede agregar el Indicador EMA FAST al Grafico... revise si esta escrito bien y que este en la carpeta Indicadores o subcarpeta");

         if(Open_CHARD!=0 && Handle_MA_S!=INVALID_HANDLE)
            ChartIndicatorAdd(Open_CHARD,0,Handle_MA_S);


         if(Handle_MA_S==INVALID_HANDLE)
            Alert("No se puede agregar el Indicador EMA SLOW al Grafico... revise si esta escrito bien y que este en la carpeta Indicadores o subcarpeta");

        }
      uint indice=1;
      if(Ver_RSI)
        {
         Handle_RSI=iRSI(Simbolo,Periodo,RSI_Periodo,RSI_Applied_Price);

         if(Open_CHARD!=0 && Handle_RSI!=INVALID_HANDLE)
           {
            ChartIndicatorAdd(Open_CHARD,indice,Handle_RSI);
            indice++;
           }

         if(Handle_RSI==INVALID_HANDLE)
            Alert("No se puede agregar el Indicador RSI al Grafico... revise si esta escrito bien y que este en la carpeta Indicadores o subcarpeta");
        }


      if(Ver_ESTOCASTICO)
        {
         Handle_ESTOCASTICO=iStochastic(Simbolo,Periodo,K_Periodo,D_Periodo,Slowing,Ma_Method_EST,STO_EST);;

         if(Open_CHARD!=0 && Handle_ESTOCASTICO!=INVALID_HANDLE)
            ChartIndicatorAdd(Open_CHARD,indice,Handle_ESTOCASTICO);

         if(Handle_ESTOCASTICO==INVALID_HANDLE)
            Alert("No se puede agregar el Indicador ESTOCASTICO al Grafico... revise si esta escrito bien y que este en la carpeta Indicadores o subcarpeta");
        }

     }
   else
     {
      if(ChartSymbol(Open_CHARD)!=Simbolo || ChartPeriod(Open_CHARD)!=Periodo)
         ChartSetSymbolPeriod(Open_CHARD,Simbolo,Periodo);
     }
   if(Open_CHARD!=0)
     {
      if(Fila_S!=0 && Columna_S!=0)
        {
         ObjectSetInteger(0,NombresCuadros[Fila_S][Columna_S],OBJPROP_COLOR,Color_Linea_Borde);
         ObjectSetInteger(0,NombresCuadros[Fila_S][0],OBJPROP_COLOR,Color_Linea_Borde);
         ObjectSetInteger(0,NombresCuadros[1][Columna_S],OBJPROP_COLOR,Color_Linea_Borde);
        }
      Fila_S=FilaR;
      Columna_S=ColumnaR;

      ObjectSetInteger(0,NombresCuadros[Fila_S][Columna_S],OBJPROP_COLOR,ColorSeleccion);
      ObjectSetInteger(0,NombresCuadros[Fila_S][0],OBJPROP_COLOR,ColorSeleccion);
      ObjectSetInteger(0,NombresCuadros[1][Columna_S],OBJPROP_COLOR,ColorSeleccion);
      ChartSetInteger(Open_CHARD,CHART_AUTOSCROLL,true);
      ChartRedraw(Open_CHARD);
     }
   ChartRedraw();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FuncionCambioGrafico2(int FilaR,int ColumnaR,datetime &TiempoEspera)
  {

   PlaySound("transicion");

   ColumnaRSeleccionado=ColumnaR;
   FilaRSeleccionado=FilaR;

   string Simbolo=Array_Symbolos[FilaR-2];

   for(int i=0; i<ArraySize(CHARTCHANGE); i++)
     {
      if(ChartPeriod(CHARTCHANGE[i])!=0)
        {
         if(ChartSymbol(CHARTCHANGE[i])!=Simbolo)
            ChartSetSymbolPeriod(CHARTCHANGE[i],Simbolo,ChartPeriod(CHARTCHANGE[i]));
        }
     }
   ChartRedraw();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ActualizarIndicador(int PeriodoIndicador,int Barras,int Handle,int MaximoBuffers,double &BUFFER[],ENUM_TIMEFRAMES TimeFrame,string Symbolo,string NombreIndicador,int IndiceBuffer)
  {
   if(Barras>PeriodoIndicador+1)
     {
      uchar Conteo=0;
      int Copy=CopyBuffer(Handle,IndiceBuffer,0,MaximoBuffers,BUFFER);
      while(Copy<=0 && !IsStopped())
        {
         if(Conteo==0)
           {
            Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE "+NombreIndicador+" EN ",Symbolo," ",EnumToString(TimeFrame));
            Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL "+NombreIndicador);
           }
         else
            Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL "+NombreIndicador);

         Conteo++;
         Sleep(1000);
         Copy=CopyBuffer(Handle,IndiceBuffer,0,MaximoBuffers,BUFFER);
         if(Conteo>3)
           {
            int Error=GetLastError();
            if(Copy<=0)
              {
               Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE "+NombreIndicador+" EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
               Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE "+NombreIndicador+" EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
               Print("NO EVALUARA "+NombreIndicador+" EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
               return false;
               break;
              }
           }
        }
      return true;
     }

   return false;
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ActualizarBarras(string Symbolo,ENUM_TIMEFRAMES TimeFrame,int &Bars_)
  {

   Bars_=Bars(Symbolo,TimeFrame);
   if(Bars_<=0)
     {
      //--- por lo visto, datos por el símbolo no están sincronizados con los datos del servidor
      bool synchronized=false;
      //--- contador del ciclo
      int attempts=0;
      // hagamos 5 intentos de esperar la sincronización
      while(attempts<5)
        {
         if(SeriesInfoInteger(Symbolo,TimeFrame,SERIES_SYNCHRONIZED))
           {
            //--- sincronización con éxito, salimos
            synchronized=true;
            break;
           }
         //--- aumentamos el contador
         attempts++;
         //--- esperaremos 10 milisegundos hasta la siguiente iteración
         Sleep(10);
        }
      //--- salimos del ciclo después de sincronización
      if(synchronized)
        {
         Print("Cantidad de barras en el historial del terminal para el ,",Symbolo," ",TimeFrame," en este momento = ",Bars_);
         Print("La primera fecha en el historial del terminal para el símbolo-período en este momento = ",
               (datetime)SeriesInfoInteger(Symbolo,TimeFrame,SERIES_FIRSTDATE));
         Print("La primera fecha en el historial del servidor para el símbolo = ",
               (datetime)SeriesInfoInteger(Symbolo,TimeFrame,SERIES_SERVER_FIRSTDATE));
        }
      //--- no se ha conseguido la sincronización de datos
      else
        {
         Print("No se ha podido obtener la cantidad de barras para ",Symbolo," ",TimeFrame);
         return false;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+
