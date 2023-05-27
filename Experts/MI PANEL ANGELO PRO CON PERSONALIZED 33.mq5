//+------------------------------------------------------------------+
//|                      MI PANEL ANGELO PRO CON PERSONALIZED 33.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#resource "\\Indicators\\INDICADOR PATRONES PRO\\Ind SupRes.ex5"

int ArregloGestion[22];
string NombresCuadros[][22];
string NombresCuadrosTextos[][22];

string NombresCuadrosExpertos[][7];
string NombresCuadrosTextosExpertos[][7];
int Columnas=0;
string Array_Symbolos[];

bool Divergencias_Evalua;

string Nombres[21]= {"M1","M2","M3","M4","M5","M6","M10","M12","M15","M20","M30","H1","H2","H3","H4","H6","H8","H12","D1","W1","MN1"};
ENUM_TIMEFRAMES TIMEFRAMES[21]= {PERIOD_M1,PERIOD_M2,PERIOD_M3,PERIOD_M4,PERIOD_M5,PERIOD_M6,PERIOD_M10,PERIOD_M12,PERIOD_M15,PERIOD_M20,PERIOD_M30,PERIOD_H1,PERIOD_H2,PERIOD_H3,PERIOD_H4,PERIOD_H6,PERIOD_H8,PERIOD_H12,PERIOD_D1,PERIOD_W1,PERIOD_MN1};
datetime DateTime_Columna[][21];
double Close_Columna[][21];
bool Existen_Divergencias[][22];

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


#include <Indicators\Indicators.mqh>
CIndicators ManejadoIndicadores;

CIndicator* Referencia[][22];


enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12am=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

input string Settings_Condiciones_Patron="-----------------------Settings CONDICIONES PATRON-----------------------";
input int VelasEvaluadas=500;// Velas Historial
input int Testeado=0;// Sop o Res, Fuerza Mayor a...
input bool Repintado=false;
input int Tolerancia_Puntos_Flecha=30;
input int Espera=8;//Esperar Confirmacion
input int EsperarConfirmacion=3; // Esperar Confirmacion Tendencia
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
input bool Activar_Alerta=false;// Activar Alerta Señal
input bool Activar_Alerta_Confirmacion=false;//Activar Alerta Confirmacion
input string Audio_Alerta_Confirmacion="alert2";
input bool Activar_Alerta_Confirmacion_Tendencia=true;//Activar Alerta Confirmacion Tendencia
bool AlertPC_=false;
bool AlertMovil_=false;
bool AlertMail_=false;
input string S1__="-----------------------   Configuracion SOP RES---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Ver_Sop_Res=true;
input int BackLimit=500;
input string S111__="-----------------------   Configuracion TREND FORCE--------------------";//----------------------------------------------------------------------------------------------------------------
input int    trendPeriod  = 4;      // Trend period
input double TriggerUp    =  0.4;   // Trigger up level
input double TriggerDown  = -0.4;   // Trigger down level
input string pus1="/////////////////////////////////////////////////";
input bool zone_show_weak=true;//Mostrar zonas débiles
input bool zone_show_untested = true;//Mostrar zonas no probadas
input bool zone_show_turncoat = true;//Mostrar zonas rotas
input double zone_fuzzfactor=0.75;
input int SeparacionTexto=10;
bool Conector=false;
input string S12_="============================================ CONFIGURACION TREND COLOR ============================================";//======================================================================
input int inpFastLength = 3; // Fast length
input int inpSlowLength = 7; // Slow length
input int Tolerancia_Personalized=0;
input string S00="=== Configuracion Grafico =======================================================================================";//=======================================================================================
input bool Ver_Lineas_Precio=true;// Ver Divergencias en el Precio
input bool Ver_Separadores=true;
input Escala_Grafico Escala=__2;// Escala de Grafico
input bool AplicarPlantilla=false;
input string Tu_Plantilla="PLANTILLA PRO 3000";
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

int NumeroMuestreo=1;
int Filas_Totales=0;

int Sub_Window=0;

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

//datetime UNTIL=D'2022.03.01 00:00';
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   /* if(UNTIL<TimeCurrent())
      {
       Alert("Tiempo de Prueba finalizado");
       return INIT_FAILED;
      }*/

   ColumnaRSeleccionado=1;
   FilaRSeleccionado=2;

   TiempoAlerta=0;
   AlertaPersonalizada=false;

   if(ObjectFind(0,Pantalla)!=0)
      RectLabelCreate(0,Pantalla,0,0,0,10000,10000,clrBlack,BORDER_RAISED,0,clrBlack,STYLE_SOLID,2,false,false,true,0);

   ChartSetInteger(0,CHART_EVENT_MOUSE_MOVE,0,true);

   Fila_S=0;
   Columna_S=0;

   AlertasInicio=true;

   IndicatorSetString(INDICATOR_SHORTNAME,"PANELES DIVERGENCIAS");

   string iName="PANELES DIVERGENCIAS";

   Columnas=0;

   if(!RegistrarSimbolo(Array_Symbolos))
     {
      return(INIT_PARAMETERS_INCORRECT);
     }




//ActualizarDatos(Symbol(),PERIOD_CURRENT);

   Filas_Totales=ArraySize(Array_Symbolos)+2;

   ArrayResize(DateTime_Columna,Filas_Totales);
   ArrayResize(Close_Columna,Filas_Totales);
   ArrayResize(Existen_Divergencias,Filas_Totales);
   ArrayResize(Referencia,Filas_Totales);

   ArrayInitialize(DateTime_Columna,0);
   ArrayInitialize(Close_Columna,0);
   ArrayInitialize(Existen_Divergencias,false);

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

   InicioX=Anclaje_X+TamanoCuadroHorizontal+EspacioCuadroHorizontal+(TamanoCuadroHorizontal_Simbolos-TamanoCuadroHorizontal);
   FinalX=Anclaje_X+TamanoCuadroHorizontal*Columnas+EspacioCuadroHorizontal*Columnas+(TamanoCuadroHorizontal_Simbolos-TamanoCuadroHorizontal)-Grosor_Linea_Cuadro*(Columnas-1);
   InicioY=Anclaje_Y+2*TamanoCuadroVertical+EspacioCuadroVertical*2;
   FinalY=Anclaje_Y+TamanoCuadroVertical*Filas_Totales+EspacioCuadroVertical*Filas_Totales-Grosor_Linea_Cuadro*(Filas_Totales-1);

   CrearCuadros();


   int Handle=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\INDICADOR PATRONES PRO\\Ind SupRes.ex5",
                      Settings_Condiciones_Patron,
                      VelasEvaluadas,
                      Testeado,
                      Repintado,
                      Tolerancia_Puntos_Flecha,
                      Espera,
                      EsperarConfirmacion,
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
                      Activar_Alerta,
                      Activar_Alerta_Confirmacion,
                      Audio_Alerta_Confirmacion,
                      Activar_Alerta_Confirmacion_Tendencia,
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
                      Conector,
                      S12_,
                      inpFastLength,
                      inpSlowLength,
                      Tolerancia_Personalized);

   if(Handle==INVALID_HANDLE)
     {
      Alert("CONFIGURACION INDICADOR ESTA MAL");
      return INIT_FAILED;
     }

   MqlParam parameters[];
   ArrayResize(parameters,1);
   ENUM_INDICATOR indicator_type;

   int params=IndicatorParameters(Handle,indicator_type,parameters);

   parameters[0].string_value="INDICADOR PATRONES PRO\\Ind SupRes";


   for(int f=2; f<Filas_Totales; f++)
      for(int c=Columnas-1; c>=1; c--)
        {
         parameters[2].integer_value=10;
         Referencia[f][c] =ManejadoIndicadores.Create(Array_Symbolos[f-2],TIMEFRAMES[ArregloGestion[c-1]],indicator_type,ArraySize(parameters),parameters);
        }

   ManejadoIndicadores.Refresh();

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

   for(int f=2; f<Filas_Totales; f++)
      for(int c=Columnas-1; c>=1; c--)
        {
         Referencia[f][c].FullRelease(true);
        }

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
      TimeFrames=ENUM_TIMEFRAMES(Period());
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


   ManejadoIndicadores.Refresh();

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

   if(DATETIME!=Tiempo_Evalua)
     {
      Divergencias_Evalua=true;

      double ArrayUP[],ArrayDN[],Force[];
      ArraySetAsSeries(ArrayUP,true);
      ArraySetAsSeries(ArrayDN,true);
      ArraySetAsSeries(Force,true);

      if(Referencia[Fila][Columna].GetData(0,3,3,ArrayUP)<=0)
         return false;
      if(Referencia[Fila][Columna].GetData(0,3,2,ArrayDN)<=0)
         return false;
      if(Referencia[Fila][Columna].GetData(0,3,6,Force)<=0)
         return false;


      string Frase=" ";
      if(ArrayUP[1]!=EMPTY_VALUE)
        {
         if(Existen_Divergencias[Fila][Columna]==false)
           {
            Frase=IntegerToString(int(Force[1]));
            AlertaComentario=AlertaComentario+" - "+Symbolo+" "+Nombres[ArregloGestion[Columna-1]]+" BUY "+Frase;
            Existen_Divergencias[Fila][Columna]=true;
            ObjectSetInteger(0,NombresCuadros[Fila][Columna],OBJPROP_BGCOLOR,Color_Buy);
            ObjectSetString(0,NombresCuadrosTextos[Fila][Columna],OBJPROP_TEXT,Frase);
            Tiempo_Evalua=DATETIME;
           }
         return true;
        }
      else
         if(ArrayDN[1]!=EMPTY_VALUE)
           {
            if(Existen_Divergencias[Fila][Columna]==false)
              {
               Frase=IntegerToString(int(Force[1]));
               AlertaComentario=AlertaComentario+" - "+Symbolo+" "+Nombres[ArregloGestion[Columna-1]]+" SELL "+Frase;
               Existen_Divergencias[Fila][Columna]=true;
               ObjectSetInteger(0,NombresCuadros[Fila][Columna],OBJPROP_BGCOLOR,Color_Sell);
               ObjectSetString(0,NombresCuadrosTextos[Fila][Columna],OBJPROP_TEXT,Frase);
               Tiempo_Evalua=DATETIME;
              }
            return true;
           }

      ObjectSetString(0,NombresCuadrosTextos[Fila][Columna],OBJPROP_TEXT," ");
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
      int Handle_Indicador=-1;

      if(ChartPeriod(Open_CHARD)!=0)
         Handle_Indicador=iCustom(Simbolo,Periodo,"::Indicators\\INDICADOR PATRONES PRO\\Ind SupRes.ex5",
                                  Settings_Condiciones_Patron,
                                  VelasEvaluadas,
                                  Testeado,
                                  Repintado,
                                  Tolerancia_Puntos_Flecha,
                                  Espera,
                                  EsperarConfirmacion,
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
                                  Activar_Alerta,
                                  Activar_Alerta_Confirmacion,
                                  Audio_Alerta_Confirmacion,
                                  Activar_Alerta_Confirmacion_Tendencia,
                                  false,
                                  false,
                                  false,
                                  S1__,
                                  Ver_Sop_Res,
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
                                  true,
                                  S12_,
                                  inpFastLength,
                                  inpSlowLength,
                                  Tolerancia_Personalized);

      if(Handle_Indicador==INVALID_HANDLE)
         Alert("No se puede agregar el Indicador al Grafico... revise si esta escrito bien y que este en la carpeta Indicadores o subcarpeta");
      else
         if(Open_CHARD!=0)
           {
            if(!ChartIndicatorAdd(Open_CHARD,0,Handle_Indicador))
               Print("No se pudo añadir el idni al grafico ",GetLastError());
           }

      uint indice=1;
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
