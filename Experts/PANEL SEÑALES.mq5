//+------------------------------------------------------------------+
//|                                                PANEL SEÑALES.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <PanelSignalsmqh.mqh>
#include<Trade\Trade.mqh>


CTrade Trade;

/////////////////// AÑO.MES.DIA HORA:MINUTO///////////////////
datetime UNTIL=D'2024.11.25 00:00';
double CuentasCompartidas[1]= {51055646};

////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

///LUEGO LO COMPILAS, UNA VEZ COMPILADO LE MANDAS SOLO EL ARCHIVO .ex5 No mandes el archivo .mq5

////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

/////////////////////////TU CUENTA///////////////////////////////
////////////////////////////////////////////////////////////////////////
double Cuentas[1]= {61122248};
////////////////////////////////////////////////////////////////////////
int password_status=-1;
datetime TiempoCarga=0;
bool TiempoExcedidoVerificacion=false;
bool VerificacionCuenta=false;


CControlsDialog ExtDialog;

int ArregloGestion[22];
string NombresCuadros[][22];
string NombresCuadrosTextos[][22];

string NombresCuadrosExpertos[][22];
string NombresCuadrosTextosExpertos[][22];

string Botones_Symbolos[];
bool Botones_Symbolos_Bool[];

string Botones_IsBuy[];
bool Botones_IsBuy_Bool[];

string Edit_Symbolos[];
struct Edits
  {
   string            Lotaje_String;
   double            Lotaje_Double;
  };
Edits Edit_Symbolos_Anteriores[];


int TimeFramesFilas=0;

string Array_Symbolos[];
string NombresIndicadores[22]= {"Medias","MACD","ADX","Bollinguer","RSI"};
string Nombres[21]= {"M1","M2","M3","M4","M5","M6","M10","M12","M15","M20","M30","H1","H2","H3","H4","H6","H8","H12","D1","W1","MN1"};
ENUM_TIMEFRAMES TIMEFRAMES[21]= {PERIOD_M1,PERIOD_M2,PERIOD_M3,PERIOD_M4,PERIOD_M5,PERIOD_M6,PERIOD_M10,PERIOD_M12,PERIOD_M15,PERIOD_M20,PERIOD_M30,PERIOD_H1,PERIOD_H2,PERIOD_H3,PERIOD_H4,PERIOD_H6,PERIOD_H8,PERIOD_H12,PERIOD_D1,PERIOD_W1,PERIOD_MN1};
datetime DateTime_Columna[][22];
double Close_Columna[][22];
bool Existen_Divergencias[][22];
datetime Time_Symbolos_Signals[];
bool Time_Symbolos_Bool[];

enum Size_Linea_Cuadro
  {
   _1=1,//1
   _2=2,//2
   _3=3,//3
  };
enum Modo_Simbolos
  {
   Simbolos_Mercado,
   Simbolos_Seleccionados,
  };


input string SA_="=================  Simbolos =======================================================================================";//====================================================
input Modo_Simbolos Simbolos_Modo=Simbolos_Mercado;
input string Simbolos="USDJPY,USDCAD,EURUSD";//Simbolos (Simbolos_Modo=Simbolos_Seleccionados)
input string S0_="=================  TP SL TRAILING BE =======================================================================================";//==================================================================
input int SL=200;
input int TP=400;
input int Trailing=100;//Trailing (No TS=0)
input int BreakEven=50;//BreakEven (No BE=0)
input int MagicNumber=22222;
input string S1_="=================  RSI =======================================================================================";//=======================================================================================
input int Signal_Buy=10;// Señal Buy (Menor que)
input int Signal_Sell=90;// Señal Sell (Mayor que)
input string S8="==============================   Configuracion ADX ==============================";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int ADX_Mayor=20;
input string s71= "=== Alertas =======================================================================================";//=======================================================================================
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;
input string S4="=== Configuracion Cuadros =======================================================================================";//=======================================================================================
int Anclaje_X=10;
int Anclaje_Y=40;
int EspacioCuadroHorizontal=0;
int EspacioCuadroVertical=0;
input int TamanoCuadroHorizontal_Simbolos=75;
input int TamanoCuadroHorizontalExperto=50;//Tamaño cuadro Horizontal Experto
input int TamanoCuadroHorizontal=30;
input int TamanoCuadroVertical=16;
input int TamanoLetrasTexto=8;
input Size_Linea_Cuadro Grosor_Linea_Cuadro=_1;
input color Color_Texto=clrWhite;
input color Color_Linea_Borde=clrOrange;
input color Color_Fondo_Default= C'49,26,15';
input color Color_Contraste=clrDarkSlateGray;
input color Color_Indicadores=clrMaroon;
input color Color_Simbolo_Signal=clrIndigo;
input color ColorTitulo=clrNavy;
input color ColorSeleccion=clrRed;
input color Color_Cargando=clrBrown;
input color Color_Cargado=clrDarkGreen;
input color Color_Linea_Ayuda_Cuadricula=clrYellow;
input color Color_Buy=clrDodgerBlue;
input color Color_Sell=clrFireBrick;
input color Color_Select_Start=clrGreen;
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
input bool M30=false;
input bool H1=false;
input bool H2=false;
input bool H3=false;
input bool H4=false;
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
int Filas_Totales=0;
int Fila_S=0;
int Columna_S=0;

string LineaVertical="001 Linea Vertical";
string LineaHorizontal="001 Linea Horizontal";

int ColumnaRSeleccionado=1;
int FilaRSeleccionado=2;
bool Divergencias_Evalua=false;
int BackLimit=100;

struct ParametrosHandlesGlobal
  {
   ENUM_INDICATOR    Tipo_Indicador;
   MqlParam          parameters_Handle[];
  };

ParametrosHandlesGlobal  ParametrosHandle[];


string Texto_De_Objetos;

void Funcion();

string Musica="  ";

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   TiempoExcedidoVerificacion=false;
   VerificacionCuenta=false;
   TiempoCarga=TimeCurrent()+120;

   string broker = AccountInfoString(ACCOUNT_COMPANY);
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
   if(broker=="Pepperstone Group Limited" && account==8349664)//51055646
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
            CuentasCompartidasEjecutar++;
            break;
           }
        }
      if(CuentasCompartidasEjecutar==0)
        {
         Alert("Cuenta no habilitada");
         return INIT_FAILED;
        }
      else
        {
         Alert(" - Licencia hasta ",UNTIL);
         Comment(" - Licencia hasta ",UNTIL);
        }
     }



   Trade.SetExpertMagicNumber(MagicNumber);

   ChartSetInteger(0,CHART_SHOW_ONE_CLICK,false);

   ArrayResize(ParametrosHandle,0);

   ColumnaRSeleccionado=1;
   FilaRSeleccionado=2;

   if(ObjectFind(0,Pantalla)!=0)
      RectLabelCreate(0,Pantalla,0,0,0,10000,10000,clrBlack,BORDER_RAISED,0,clrBlack,STYLE_SOLID,2,false,false,true,0);

   ChartSetInteger(0,CHART_EVENT_MOUSE_MOVE,0,true);

   Fila_S=0;
   Columna_S=0;

   AlertasInicio=true;

   string iName="PANELES DIVERGENCIAS";

   TimeFramesFilas=0;

   if(Simbolos_Modo==Simbolos_Mercado)
     {
      if(!RegistrarSimbolo(Array_Symbolos))
         return(INIT_PARAMETERS_INCORRECT);
     }
   else
     {
      if(!RegistrarSimbolo2(Simbolos,Array_Symbolos))
         return(INIT_PARAMETERS_INCORRECT);
     }

//ActualizarDatos(Symbol(),PERIOD_CURRENT);

   GestionarColumnas();

   Filas_Totales=ArraySize(Array_Symbolos)*TimeFramesFilas+2;

   ArrayResize(DateTime_Columna,Filas_Totales);
   ArrayResize(Close_Columna,Filas_Totales);
   ArrayResize(Existen_Divergencias,Filas_Totales);
   ArrayResize(Time_Symbolos_Signals,Filas_Totales);
   ArrayResize(Time_Symbolos_Bool,Filas_Totales);



   ArrayInitialize(DateTime_Columna,0);
   ArrayInitialize(Close_Columna,0);
   ArrayInitialize(Existen_Divergencias,false);
   ArrayInitialize(Time_Symbolos_Bool,false);

/// DESCARGAR DATOS ///
   for(int f=2; f<Filas_Totales; f++)
      for(int c=TimeFramesFilas-1; c>=1; c--)
        {
         string Symbolo=Array_Symbolos[int((f-2)/TimeFramesFilas)];

         // Print("CATEGORIA  ",SymbolInfoString(Symbolo,SYMBOL_SECTOR_NAME));
         ENUM_TIMEFRAMES TimeFrame=TIMEFRAMES[ArregloGestion[(f-2)%TimeFramesFilas]];

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
   FinalX=Anclaje_X+TamanoCuadroHorizontal*(ArraySize(ParametrosHandle)+1)+EspacioCuadroHorizontal*(ArraySize(ParametrosHandle)+1)+(TamanoCuadroHorizontal_Simbolos-TamanoCuadroHorizontal)-Grosor_Linea_Cuadro*(6-1);
   InicioY=Anclaje_Y+2*TamanoCuadroVertical+EspacioCuadroVertical*2;
   FinalY=Anclaje_Y+TamanoCuadroVertical*Filas_Totales+EspacioCuadroVertical*Filas_Totales-Grosor_Linea_Cuadro*(Filas_Totales-1);

   int X;
   CrearCuadros(X);

   EventSetMillisecondTimer(1);
   ChartSetInteger(0,CHART_EVENT_MOUSE_MOVE,0,true);

//--- create application dialog
   if(!ExtDialog.Create(0,"Matrix",0,10,10,700+X,820,Funcion))
      return(INIT_FAILED);
//--- run application
   ExtDialog.Run();


   Print("Entra");
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Funcion()
  {
   ObjectsDeleteAll(0,"Cuadro Panel 001",CharIndicator,OBJ_RECTANGLE_LABEL);
   ObjectsDeleteAll(0,"Cuadro Panel 001",CharIndicator,OBJ_LABEL);
   ObjectsDeleteAll(0,"Cuadro Panel 001",CharIndicator,OBJ_BUTTON);
   ObjectsDeleteAll(0,"Cuadro Panel 001",CharIndicator,OBJ_EDIT);


   ArrayResize(ParametrosHandle,ExtDialog.MaxIndicadores);
   for(int i=0; i<int(ExtDialog.MaxIndicadores); i++)
     {
      ParametrosHandle[i].Tipo_Indicador=ExtDialog.ParametrosHandle[i].Tipo_Indicador;
      ArrayResize(ParametrosHandle[i].parameters_Handle,ArraySize(ExtDialog.ParametrosHandle[i].parameters_Handle));
      for(int j=0; j<ArraySize(ExtDialog.ParametrosHandle[i].parameters_Handle); j++)
        {
         string par_info="";
         ParametrosHandle[i].parameters_Handle[j]=ExtDialog.ParametrosHandle[i].parameters_Handle[j];
         /*par_info+=StringFormat("parameter %d: type=%s, long_value=%d, double_value=%G,string_value=%s\r\n",
                                i,
                                EnumToString((ENUM_DATATYPE)ParametrosHandle[i].parameters_Handle[j].type),
                                ParametrosHandle[i].parameters_Handle[j].integer_value,
                                ParametrosHandle[i].parameters_Handle[j].double_value,
                                ParametrosHandle[i].parameters_Handle[j].string_value
                               );
         Print(par_info);*/
        }

      NombresIndicadores[i]=EnumToString(ENUM_INDICATOR(ParametrosHandle[i].Tipo_Indicador));



     }
   FinalX=Anclaje_X+TamanoCuadroHorizontal*(ArraySize(ParametrosHandle)+1)+EspacioCuadroHorizontal*(ArraySize(ParametrosHandle)+1)+(TamanoCuadroHorizontal_Simbolos-TamanoCuadroHorizontal)-Grosor_Linea_Cuadro*(6-1);

   ArrayInitialize(DateTime_Columna,0);
   ArrayInitialize(Close_Columna,0);
   ArrayInitialize(Existen_Divergencias,false);


   int X2;
   CrearCuadros(X2);
   AlertasInicio=true;
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
         return "SL";
      if(c==1)
         return "TP";
      if(c==2)
         return "Trailing";
      if(c==3)
         return "BreakEven.";
      if(c==4)
         return "Condiciones";
      if(c==5)
         return "Tipo de Op";
      if(c==6)
         return "Programar";
      if(c==7)
         return "Lote";
     }
   if(f>=2)
     {
      if(c==0)
         return IntegerToString(SL);
      if(c==1)
         return IntegerToString(TP);
      if(c==2)
         return IntegerToString(Trailing);
      if(c==3)
         return IntegerToString(BreakEven);
      if(c==4)
         return IntegerToString(1);
     }

   /*  if(f>=2 && c==0)
        {
         int Digitos=(int)SymbolInfoInteger(Array_Symbolos[int((f-2)/TimeFramesFilas)],SYMBOL_DIGITS);
         string BID=DoubleToString(SymbolInfoDouble(Array_Symbolos[int((f-2)/TimeFramesFilas)],SYMBOL_BID),Digitos);
         return (BID);
        }
      if(f>=2 && c==1)
        {
         int Digitos=(int)SymbolInfoInteger(Array_Symbolos[int((f-2)/TimeFramesFilas)],SYMBOL_DIGITS);
         string ASK=DoubleToString(SymbolInfoDouble(Array_Symbolos[int((f-2)/TimeFramesFilas)],SYMBOL_ASK),Digitos);
         return ASK;
        }
      if(f>=2 && c==2)
        {
         int SPread=(int)SymbolInfoInteger(Array_Symbolos[int((f-2)/TimeFramesFilas)],SYMBOL_SPREAD);
         return IntegerToString(SPread);
        }
   */
   return " ";
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ExtDialog.Destroy(reason);
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

   if(!ControlCuenta())
     {
      ExpertRemove();
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CrearCuadros(int &X2)
  {
   int Filas=ArraySize(Array_Symbolos)*TimeFramesFilas+2;
   ArrayResize(NombresCuadros,Filas);
   ArrayResize(NombresCuadrosTextos,Filas);

   for(int c=0; c<ArraySize(ParametrosHandle)+1; c++)
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
               if(!Diferente_Tamano(c,f,0,0,Multiplicador_Ancho,ArraySize(ParametrosHandle)+1,true,Disminucion_per_Ancho_Line_X,Disminucion_per_Ancho_Line_Y))
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

               X2=X+Ancho_;
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
               //if(!Diferente_Tamano(c,f,0,0,Multiplicador_Ancho,TimeFramesFilas,true))
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

               /*if(Modo_Experto && c==TimeFramesFilas-1 && f>=2)
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
   int Filas=ArraySize(Array_Symbolos)*TimeFramesFilas+2;
   ArrayResize(NombresCuadrosExpertos,Filas);
   ArrayResize(NombresCuadrosTextosExpertos,Filas);

   ArrayResize(Botones_Symbolos,Filas-2);
   ArrayResize(Botones_Symbolos_Bool,Filas-2);
   ArrayResize(Edit_Symbolos,Filas-2);
   ArrayResize(Edit_Symbolos_Anteriores,Filas-2);
   ArrayResize(Botones_IsBuy,Filas-2);
   ArrayResize(Botones_IsBuy_Bool,Filas-2);

   for(int c=0; c<8; c++)
     {
      for(int f=0; f<Filas; f++)
        {
         NombresCuadrosExpertos[f][c]="Cuadro Panel 001 Experto c="+(string) c+" f="+(string)f;
         NombresCuadrosTextosExpertos[f][c]="Cuadro Panel 001 Experto c="+(string) c+" f="+(string)f+" Texto";

         int Multiplicador_Ancho=1,Multiplicador_Largo=1;
         int Disminucion_per_Ancho_Line_X=0;
         int Disminucion_per_Ancho_Line_Y=0;
         if(!Diferente_Tamano(c,f,0,0,Multiplicador_Ancho,8,true,Disminucion_per_Ancho_Line_X,Disminucion_per_Ancho_Line_Y))
            continue;

         if(f>=2 && (c<4 || c==7))
           {
            if(f%TimeFramesFilas==0)
              {
               if(!Diferente_Tamano(c,f,c,f,Multiplicador_Largo,TimeFramesFilas,false,Disminucion_per_Ancho_Line_X,Disminucion_per_Ancho_Line_Y))
                  continue;
              }
            else
               continue;
           }

         string Texto=Texto_Cuadro_Experto(c,f);
         color Color_Cuadro=clrBlack; //ColorCuadro_Experto(c,f);
         int X=FinalX+Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontalExperto*c-c*Grosor_Linea_Cuadro;
         int Y= Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f-f*Grosor_Linea_Cuadro;
         int Ancho_=TamanoCuadroHorizontalExperto*Multiplicador_Ancho+(Multiplicador_Ancho-1)*EspacioCuadroHorizontal-Disminucion_per_Ancho_Line_X;//TamanoCuadroHorizontal
         int Largo_=TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical-Disminucion_per_Ancho_Line_Y;// TamanoCuadroVertical
         if(((c==6 || c==5) && f>=2) || (c==6 && f==1))
           {
            Texto=(c==6)?"START":"BUY";
            Color_Cuadro=(c==6)?clrRed:Color_Buy;

            if(c==6 && f==1)
              {
               Texto="Programar";
               Color_Cuadro=clrMidnightBlue;
              }

            ButtonCreate(0,NombresCuadrosTextosExpertos[f][c],0,X,Y,TamanoCuadroHorizontalExperto,TamanoCuadroVertical,CORNER_LEFT_UPPER,Texto,"Arial",TamanoLetrasTexto,Color_Texto,Color_Cuadro,Color_Linea_Borde,false,false,false,true,0);
           }
         else
            if(c==7 && f>=2)
              {
               Edit_Symbolos[f-2]="Cuadro Panel 001 Edit"+" c="+(string)c+" f="+(string)f;
               string Lotaje=DoubleToString(SymbolInfoDouble(Array_Symbolos[int((f-2)/TimeFramesFilas)],SYMBOL_VOLUME_MIN),2);
               Edit_Symbolos_Anteriores[f-2].Lotaje_String=Lotaje;
               Edit_Symbolos_Anteriores[f-2].Lotaje_Double=SymbolInfoDouble(Array_Symbolos[int((f-2)/TimeFramesFilas)],SYMBOL_VOLUME_MIN);
               EditCreate(0,Edit_Symbolos[f-2],0,X,Y,Ancho_,Largo_,Lotaje,"Arial",TamanoLetrasTexto,ALIGN_CENTER,false,CORNER_LEFT_UPPER,Color_Texto,Color_Fondo_Default,Color_Linea_Borde,false,false,true,0);
              }
            else
              {
               color Color=Color_Cuadro;
               bool Read=false;
               if(f<2)
                  Read=true;
               EditCreate(0,NombresCuadrosTextosExpertos[f][c],0,X,Y,Ancho_,Largo_,Texto,"Arial",TamanoLetrasTexto,ALIGN_CENTER,Read,CORNER_LEFT_UPPER,Color_Texto,clrBlack,Color_Linea_Borde,false,false,true,0);
              }
         ChartRedraw();
        }
      ChartRedraw();
     }
   FinalX=FinalX+TamanoCuadroHorizontalExperto*8+Anclaje_X;
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
      return("PANEL SEÑALES");

   if(f==1)
     {
      switch(c)
        {
         case 0:
            return "Cargando...";
         default:
           {
            string Nombre=NombresIndicadores[c-1];
            string Subs=StringSubstr(NombresIndicadores[c-1],0,4);
            if(Subs=="IND_")
               Nombre=StringSubstr(NombresIndicadores[c-1],4,-1);
            return Nombre;
           }
        }
     }

   if(c==0 && f>=2)
      return Array_Symbolos[int((f-2)/TimeFramesFilas)]+" "+Nombres[ArregloGestion[(f-2)%TimeFramesFilas]];

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
            return Color_Indicadores;

   if(f>1)
     {
      color Color=((int((f-2)/TimeFramesFilas))%2)==0?Color_Fondo_Default : Color_Contraste;
      return Color;
     }

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
   TimeFramesFilas=i;

  }

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
      Sleep(25);
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


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   if(ArraySize(ParametrosHandle)>0)
      Trailing_Stop();

   Divergencias_Evalua();

   int Size=ArraySize(NombresCuadrosTextosExpertos)/22;

   for(int f=2; f<Size; f++)
     {
      if(ObjectFind(0,NombresCuadrosTextosExpertos[f][6])==0)
        {
         if(ObjectGetInteger(0,NombresCuadrosTextosExpertos[f][6],OBJPROP_TYPE,0)==OBJ_BUTTON)
           {
            if(ObjectGetInteger(0,NombresCuadrosTextosExpertos[f][6],OBJPROP_STATE,0))
              {
               Tradear(f);
              }
           }

        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Tradear(int f)
  {
   if(Time_Symbolos_Bool[f]==true)
     {
      bool IsBuy=ObjectGetString(0,NombresCuadrosTextosExpertos[f][5],OBJPROP_TEXT,0)=="BUY"?true:false;
      long Condiciones=StringToInteger(ObjectGetString(0,NombresCuadrosTextosExpertos[f][4],OBJPROP_TEXT,0));



      Print(Array_Symbolos[int((f-2)/TimeFramesFilas)]);

      int SumaCondiciones=0;

      for(int c=1; c<ArraySize(ParametrosHandle)+1; c++)
        {
         if(IsBuy)
           {
            if(ObjectGetInteger(0,NombresCuadros[f][c],OBJPROP_BGCOLOR,0)==Color_Buy)
               SumaCondiciones++;
           }
         if(!IsBuy)
           {
            if(ObjectGetInteger(0,NombresCuadros[f][c],OBJPROP_BGCOLOR,0)==Color_Sell)
               SumaCondiciones++;
           }
        }

      if(SumaCondiciones>=Condiciones)
        {
         bool Confirmacion=true;
         if(Time_Symbolos_Signals[f]+30>TimeCurrent())
           {
            ObjectSetInteger(0,NombresCuadrosTextosExpertos[f][6],OBJPROP_BGCOLOR,clrGreen);
            string Nombre=ObjectGetString(0,NombresCuadrosTextos[f][0],OBJPROP_TEXT,0);
            ObjectSetInteger(0,NombresCuadros[f][0],OBJPROP_BGCOLOR,clrYellow);
            ChartRedraw();
            int ID=MessageBox(Nombre+" ya esta en condicion Deseas operar?",Nombre+" ya esta en condicion Deseas operar?",MB_YESNO|MB_ICONQUESTION);
            if(ID!=6)
              {
               Confirmacion=false;
               ObjectSetInteger(0,NombresCuadrosTextosExpertos[f][6],OBJPROP_STATE,false);
               ObjectSetInteger(0,NombresCuadrosTextosExpertos[f][6],OBJPROP_BGCOLOR,clrRed);
               ObjectSetInteger(0,NombresCuadros[f][0],OBJPROP_BGCOLOR,Color_Simbolo_Signal);
               Time_Symbolos_Bool[f]=false;
              }
            else
              {
               ObjectSetInteger(0,NombresCuadros[f][0],OBJPROP_BGCOLOR,clrGreen);
              }
           }


         if(Confirmacion)
           {
            string Simbolo=Array_Symbolos[int((f-2)/TimeFramesFilas)];
            double SL_=StringToDouble(ObjectGetString(0,NombresCuadrosTextosExpertos[2+(int((f-2)/TimeFramesFilas))*TimeFramesFilas][0],OBJPROP_TEXT,0))*SymbolInfoDouble(Simbolo,SYMBOL_POINT);
            double TP_=StringToDouble(ObjectGetString(0,NombresCuadrosTextosExpertos[2+(int((f-2)/TimeFramesFilas))*TimeFramesFilas][1],OBJPROP_TEXT,0))*SymbolInfoDouble(Simbolo,SYMBOL_POINT);
            double Lote_=StringToDouble(ObjectGetString(0,Edit_Symbolos[(int((f-2)/TimeFramesFilas))*TimeFramesFilas],OBJPROP_TEXT,0));
            double Ask=SymbolInfoDouble(Simbolo,SYMBOL_ASK);
            double Bid=SymbolInfoDouble(Simbolo,SYMBOL_BID);

            if(!IsBuy)
              {
               if(!Trade.Sell(Lote_,Simbolo,Lote_,Bid+SL_,Bid-TP_,NULL))
                  Print("Error ",Trade.ResultRetcode());
              }
            else
              {
               if(!Trade.Buy(Lote_,Simbolo,Lote_,Ask-SL_,Ask+TP_,NULL))
                  Print("Error ",Trade.ResultRetcode());
              }

            if(ObjectGetInteger(0,NombresCuadrosTextosExpertos[f][6],OBJPROP_STATE,0))
              {
               ObjectSetInteger(0,NombresCuadrosTextosExpertos[f][6],OBJPROP_BGCOLOR,clrRed);
               ObjectSetInteger(0,NombresCuadrosTextosExpertos[f][6],OBJPROP_STATE,false);
               ObjectSetInteger(0,NombresCuadros[f][0],OBJPROP_BGCOLOR,Color_Simbolo_Signal);
              }
            Time_Symbolos_Bool[f]=false;
           }
        }
     }
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
         Print("Cargando Fila ",Array_Symbolos[int((f-2)/TimeFramesFilas)]," ...");
      for(int c=1; c<ArraySize(ParametrosHandle)+1; c++)
        {
         IgualarSignals(c,f,TIMEFRAMES[ArregloGestion[(f-2)%TimeFramesFilas]],DateTime_Columna[f-2][c],Close_Columna[f-2][c]);
        }

      if(Divergencias_Evalua)
        {
         bool HayDivergencia=false;
         for(int Columna=1; Columna<ArraySize(ParametrosHandle)+1; Columna++)
           {
            HayDivergencia=Existen_Divergencias[f][Columna];
            if(HayDivergencia)
               break;
           }
         if(HayDivergencia)
            ObjectSetInteger(0,NombresCuadros[f][0],OBJPROP_BGCOLOR,Color_Simbolo_Signal);
         else
           {
            color Color=((int((f-2)/TimeFramesFilas))%2)==0?Color_Fondo_Default : Color_Contraste;
            ObjectSetInteger(0,NombresCuadros[f][0],OBJPROP_BGCOLOR,Color);
           }
        }
     }
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
         Alert(AlertaComentario);
      if(AlertMovil)
         SendNotification(AlertaComentario);
      if(AlertMail)
         SendMail("SIGNAL",AlertaComentario);
     }

   if(AlertasInicio)
     {
      ObjectSetInteger(0,NombresCuadros[1][0],OBJPROP_BGCOLOR,Color_Cargado);
      ObjectSetString(0,NombresCuadrosTextos[1][0],OBJPROP_TEXT,"SIMBOLOS");

      ChartRedraw(0);
      if(ArraySize(ParametrosHandle)>0)
         CrearCuadrosExperto();
      AlertasInicio=false;
     }
// PrimeraVezAlerta=false;
  }
//|                                                                  |
//+------------------------------------------------------------------+
bool IgualarSignals(int Columna,int Fila,ENUM_TIMEFRAMES TimeFrame,datetime &Tiempo_Evalua,double &Close_Evalua)
  {
//  Print("A1");
   string Symbolo=Array_Symbolos[int((Fila-2)/TimeFramesFilas)];

   datetime DATETIME=ActualizarDatos(Symbolo,TimeFrame);

   double CloseEva[3];
   CopyClose(Symbolo,TimeFrame,0,3,CloseEva);
// Print("A3");

   if(DATETIME!=Tiempo_Evalua && (CloseEva[1]!=Close_Evalua && CloseEva[2]!=-1))
     {
      Tiempo_Evalua=DATETIME;
      Close_Evalua=CloseEva[1];
      Divergencias_Evalua=true;

      double Point_=SymbolInfoDouble(Symbolo,SYMBOL_POINT);
      Existen_Divergencias[Fila][Columna]=false;
      color Color=((int((Fila-2)/TimeFramesFilas))%2)==0?Color_Fondo_Default : Color_Contraste;
      ObjectSetInteger(0,NombresCuadros[Fila][Columna],OBJPROP_BGCOLOR,Color);

      int Bars_=0;
      if(ActualizarBarras(Symbolo,TimeFrame,Bars_)==false)
         return false;

      int Maximo=MathMin(Bars_,5)+1;

      int MaximoBuffers=20;
      MaximoBuffers+=5;

      if(MaximoBuffers>Bars_-1 || Maximo>Bars_-1)
         return false;

      double high[],low[],close[],open[];
      datetime time[];
      double BUFFER1[],BUFFER2[],BUFFER3[];

      CopyHigh(Symbolo,TimeFrame,0,Maximo,high);
      CopyLow(Symbolo,TimeFrame,0,Maximo,low);
      CopyClose(Symbolo,TimeFrame,0,Maximo,close);
      CopyTime(Symbolo,TimeFrame,0,Maximo,time);
      CopyOpen(Symbolo,TimeFrame,0,Maximo,open);

      ArraySetAsSeries(high,true);
      ArraySetAsSeries(low,true);
      ArraySetAsSeries(time,true);
      ArraySetAsSeries(close,true);
      ArraySetAsSeries(open,true);

      ArrayResize(BUFFER1,MaximoBuffers);
      ArrayResize(BUFFER2,MaximoBuffers);
      ArrayResize(BUFFER3,MaximoBuffers);

      ArraySetAsSeries(BUFFER1,true);
      ArraySetAsSeries(BUFFER2,true);
      ArraySetAsSeries(BUFFER3,true);

      int Handle=IndicatorCreate(Symbolo,TimeFrame,ParametrosHandle[Columna-1].Tipo_Indicador,ArraySize(ParametrosHandle[Columna-1].parameters_Handle),ParametrosHandle[Columna-1].parameters_Handle);

      int Maximo2=0;
      int Copy=0;

      if(ENUM_INDICATOR(ParametrosHandle[Columna-1].Tipo_Indicador)==IND_MA)
         if(!ActualizarIndicador(ParametrosHandle[Columna-1].parameters_Handle[0].integer_value,Bars_,Handle,MaximoBuffers,BUFFER1,TimeFrame,Symbolo,"MEDIA MOVIL",0))
            return false;
      if(ENUM_INDICATOR(ParametrosHandle[Columna-1].Tipo_Indicador)==IND_MACD)
        {
         if(!ActualizarIndicador(MathMax(MathMax(ParametrosHandle[Columna-1].parameters_Handle[0].integer_value,ParametrosHandle[Columna-1].parameters_Handle[1].integer_value),ParametrosHandle[Columna-1].parameters_Handle[3].integer_value),Bars_,Handle,MaximoBuffers,BUFFER1,TimeFrame,Symbolo,"MACD",0))
            return false;
         if(!ActualizarIndicador(MathMax(MathMax(ParametrosHandle[Columna-1].parameters_Handle[0].integer_value,ParametrosHandle[Columna-1].parameters_Handle[1].integer_value),ParametrosHandle[Columna-1].parameters_Handle[3].integer_value),Bars_,Handle,MaximoBuffers,BUFFER2,TimeFrame,Symbolo,"MACD",1))
            return false;
        }
      if(ENUM_INDICATOR(ParametrosHandle[Columna-1].Tipo_Indicador)==IND_ADX)
         if(!ActualizarIndicador(ParametrosHandle[Columna-1].parameters_Handle[0].integer_value,Bars_,Handle,MaximoBuffers,BUFFER1,TimeFrame,Symbolo,"ADX",0))
            return false;
      if(ENUM_INDICATOR(ParametrosHandle[Columna-1].Tipo_Indicador)==IND_BANDS)
         if(!ActualizarIndicador(ParametrosHandle[Columna-1].parameters_Handle[0].integer_value,Bars_,Handle,MaximoBuffers,BUFFER1,TimeFrame,Symbolo,"BOLLINGER BANDS",0))
            return false;
      if(ENUM_INDICATOR(ParametrosHandle[Columna-1].Tipo_Indicador)==IND_RSI)
         if(!ActualizarIndicador(ParametrosHandle[Columna-1].parameters_Handle[0].integer_value,Bars_,Handle,MaximoBuffers,BUFFER1,TimeFrame,Symbolo,"RSI",0))
            return false;

      string Frase=" ";
      string FraseS=" ";
      ObjectSetString(0,NombresCuadrosTextos[Fila][Columna],OBJPROP_TEXT,Frase);
      // Print("high  ",ArraySize(high)," low ",ArraySize(low)," close ",ArraySize(close)," time ",ArraySize(time)," RSI ",ArraySize(RSI_BUFFER)," MACD ",ArraySize(MACD_BUFFER)," ESTOCASTICO ",ArraySize(ESTOCASTICO_BUFFER));

      bool ISignalBuy=false;
      bool Signal=false;

      Signal=Estrategias(Columna,BUFFER1,BUFFER2,BUFFER3,close,ISignalBuy,ENUM_INDICATOR(ParametrosHandle[Columna-1].Tipo_Indicador));

      if(Signal)
        {
         Frase=FraseS+" "+Frase;
         if(ISignalBuy)
           {
            //AlertaComentario=AlertaComentario+" - "+Symbolo+" "+Nombres[ArregloGestion[Columna-1]]+" BUY "+Frase;
            Existen_Divergencias[Fila][Columna]=true;
            ObjectSetInteger(0,NombresCuadros[Fila][Columna],OBJPROP_BGCOLOR,Color_Buy);
            ObjectSetString(0,NombresCuadrosTextos[Fila][Columna],OBJPROP_TEXT,Frase);
            /*if(Modo_Experto && !AlertasInicio && !BuyAnterior && EvaluaHorario(Hora_Inicio,Hora_Final))
               if(Botones_Symbolos_Bool[Fila-2])
                  Buy(Symbolo,ImpulsoBuyStart,ImpulsoBuyEnd,Fila);*/
           }
         else
           {
            //AlertaComentario=AlertaComentario+" - "+Symbolo+" "+Nombres[ArregloGestion[Columna-1]]+" SELL "+Frase;
            Existen_Divergencias[Fila][Columna]=true;
            ObjectSetInteger(0,NombresCuadros[Fila][Columna],OBJPROP_BGCOLOR,Color_Sell);
            ObjectSetString(0,NombresCuadrosTextos[Fila][Columna],OBJPROP_TEXT,Frase);
            /*if(Modo_Experto && !AlertasInicio && !SellAnterior && EvaluaHorario(Hora_Inicio,Hora_Final))
               if(Botones_Symbolos_Bool[Fila-2])
                  Sell(Symbolo,ImpulsoSellStart,ImpulsoSellEnd,Fila);*/
           }
        }

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


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // Event ID
                  const long& lparam,   // Parameter of type long event
                  const double& dparam, // Parameter of type double event
                  const string& sparam  // Parameter of type string events
                 )
  {

   ExtDialog.ChartEvent(id,lparam,dparam,sparam);
//--- objeto eliminado
   if(id==CHARTEVENT_OBJECT_ENDEDIT && ArraySize(ParametrosHandle)>0)
     {
      int Filas=ArraySize(Array_Symbolos)*TimeFramesFilas+2;
      Print("FILAS ",Filas);

      for(int i=2; i<Filas; i++)
        {
         for(int j=0; j<5; j++)
           {
            string Nombre=NombresCuadrosTextosExpertos[i][j];
            if(sparam==Nombre)
              {
               string TextoValor=ObjectGetString(0,sparam,OBJPROP_TEXT,0);
               if(!ComprobarSub(TextoValor,false))
                  ObjectSetString(0,NombresCuadrosTextosExpertos[i][j],OBJPROP_TEXT,Texto_De_Objetos);
               break;
              }
           }

         string Nombre=Edit_Symbolos[i-2];
         if(sparam==Nombre)
           {
            string TextoValor=ObjectGetString(0,sparam,OBJPROP_TEXT,0);
            if(!ComprobarSub(TextoValor,true))
               ObjectSetString(0,Edit_Symbolos[i-2],OBJPROP_TEXT,Texto_De_Objetos);
            string Simbolo=Array_Symbolos[int((i-2)/TimeFramesFilas)];
            double Lote=StringToDouble(TextoValor);
            if(!ComprobarLote(Simbolo,Lote))
               ObjectSetString(0,Edit_Symbolos[i-2],OBJPROP_TEXT,DoubleToString(Lote));

            break;
           }
        }
     }

   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      if(ObjectGetInteger(0,sparam,OBJPROP_TYPE,0)==OBJ_EDIT)
         Texto_De_Objetos=ObjectGetString(0,sparam,OBJPROP_TEXT,0);
      if(ObjectGetInteger(0,sparam,OBJPROP_TYPE,0)==OBJ_BUTTON)
        {
         if(StringFind(sparam,"Cuadro Panel 001 Experto c="+IntegerToString(5))!=-1)
           {

            if(ObjectGetInteger(0,sparam,OBJPROP_STATE,0))
              {
               ObjectSetInteger(0,sparam,OBJPROP_BGCOLOR,Color_Sell);
               ObjectSetString(0,sparam,OBJPROP_TEXT,"SELL");
              }
            else
              {
               ObjectSetInteger(0,sparam,OBJPROP_BGCOLOR,Color_Buy);
               ObjectSetString(0,sparam,OBJPROP_TEXT,"BUY");
              }
           }
         if(StringFind(sparam,"Cuadro Panel 001 Experto c="+IntegerToString(6))!=-1 && sparam!="Cuadro Panel 001 Experto c=6 f=1 Texto")
           {
            string f=(string)(StringSubstr(sparam,31,1));
            string f2=(string)(StringSubstr(sparam,32,1));
            string f3=(string)(StringSubstr(sparam,33,1));
            int Numero=(int)StringToInteger(f+(((int)f2)==0?"":f2)+(((int)f3)==0?"":f3));

            Time_Symbolos_Signals[Numero]=TimeCurrent();
            Time_Symbolos_Bool[Numero]=true;

            if(ObjectGetInteger(0,sparam,OBJPROP_STATE,0))
              {
               ObjectSetInteger(0,sparam,OBJPROP_BGCOLOR,clrGreen);
               ObjectSetInteger(0,NombresCuadros[Numero][0],OBJPROP_BGCOLOR,Color_Select_Start);
              }
            else
              {
               ObjectSetInteger(0,sparam,OBJPROP_BGCOLOR,clrRed);
               ObjectSetInteger(0,NombresCuadros[Numero][0],OBJPROP_BGCOLOR,Color_Simbolo_Signal);
              }
            ChartRedraw();
           }
         if(sparam=="Cuadro Panel 001 Experto c=6 f=1 Texto")
           {
            int Filas=ArraySize(Array_Symbolos)*TimeFramesFilas+2;
            if(ObjectGetInteger(0,sparam,OBJPROP_STATE,0))
              {
               ObjectSetInteger(0,sparam,OBJPROP_BGCOLOR,clrGreen);
               ChartRedraw();

               int ID=MessageBox("Deseas activar todos los Simbolos?","Deseas activar todos los Simbolos?",MB_YESNO|MB_ICONQUESTION);

               if(ID==6)
                  for(int i=2; i<Filas; i++)
                    {
                     Time_Symbolos_Signals[i]=TimeCurrent();
                     Time_Symbolos_Bool[i]=true;
                     ObjectSetInteger(0,NombresCuadrosTextosExpertos[i][6],OBJPROP_STATE,true);
                     ObjectSetInteger(0,NombresCuadrosTextosExpertos[i][6],OBJPROP_BGCOLOR,clrGreen);
                     ObjectSetInteger(0,NombresCuadros[i][0],OBJPROP_BGCOLOR,Color_Select_Start);
                     ChartRedraw();
                    }

               ObjectSetInteger(0,sparam,OBJPROP_STATE,false);
               ObjectSetInteger(0,sparam,OBJPROP_BGCOLOR,clrMidnightBlue);
              }
           }
        }
     }



   static datetime TiempoEspera=0;
   int Cambio=0;

   if(id==CHARTEVENT_MOUSE_MOVE && !AlertasInicio)
     {
      int x=(int)lparam;
      int y=(int)dparam;

      if(x>=InicioX && x<FinalX  && y>InicioY && y<FinalY)
        {
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
//|                                                                  |
//+------------------------------------------------------------------+
bool ActualizarIndicador(long PeriodoIndicador,int Barras,int Handle,int MaximoBuffers,double &BUFFER[],ENUM_TIMEFRAMES TimeFrame,string Symbolo,string NombreIndicador,int IndiceBuffer)
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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Estrategias(int c,double &BUFFER[],double &BUFFER2[],double &BUFFER3[],double &Close[],bool &IsBuy,ENUM_INDICATOR Estrategia)
  {
   if(Estrategia==IND_MA)
     {
      if(BUFFER[1]>Close[1]) //&& BUFFER[2]<Close[2])
        {
         IsBuy=false;
         return true;
        }
      else
         if(BUFFER[1]<Close[1]) //&& BUFFER[2]>Close[2])
           {
            IsBuy=true;
            return true;
           }
     }
   else
      if(Estrategia==IND_MACD)
        {
         if(BUFFER[1]>BUFFER2[1]) //&& BUFFER[2]<BUFFER2[2])
           {
            IsBuy=true;
            return true;
           }
         else
            if(BUFFER[1]<BUFFER2[1]) //&& BUFFER[2]>BUFFER2[2])
              {
               IsBuy=false;
               return true;
              }
        }
      else
         if(Estrategia==IND_ADX)
           {
            if(BUFFER[1]>ADX_Mayor) //&& BUFFER[2]>BUFFER2[2])
              {
               IsBuy=true;
               return true;
              }
           }
         else
            if(Estrategia==IND_BANDS)
              {
               if(BUFFER[1]>Close[1]) //&& BUFFER[2]<Close[2])
                 {
                  IsBuy=false;
                  return true;
                 }
               else
                  if(BUFFER[1]<Close[1]) //&& BUFFER[2]>Close[2])
                    {
                     IsBuy=true;
                     return true;
                    }
              }
            else
               if(Estrategia==IND_RSI)
                 {
                  Print("Entra RSI ",BUFFER[1]);
                  if(BUFFER[1]<Signal_Buy) //&& BUFFER[2]<Close[2])
                    {
                     IsBuy=true;
                     return true;
                    }
                  else
                     if(BUFFER[1]>Signal_Sell) //&& BUFFER[2]>Close[2])
                       {
                        IsBuy=false;
                        return true;
                       }
                 }


   return false;
  }
//+------------------------------------------------------------------+
bool ComprobarLote(string Simbolo,double &Lote)
  {

   double Minimo=SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_MIN);
   double Maximo=SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_MAX);

   if(Minimo>Lote)
     {
      Lote=Minimo;
      return false;
     }
   if(Maximo<Lote)
     {
      Lote=Maximo;
      return false;
     }

   return true;
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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Trailing_Stop()
  {

   int TotalPosiciones=PositionsTotal();
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      long Tipo=PositionGetInteger(POSITION_TYPE);
      double StopLoss=PositionGetDouble(POSITION_SL);
      double TakeProfit=PositionGetDouble(POSITION_TP);
      double OpenPrice=PositionGetDouble(POSITION_PRICE_OPEN);
      string Symbolo=PositionGetString(POSITION_SYMBOL);
      double Bid=SymbolInfoDouble(Symbolo,SYMBOL_BID);
      double Ask=SymbolInfoDouble(Symbolo,SYMBOL_ASK);
      double Point_=SymbolInfoDouble(Symbolo,SYMBOL_POINT);
      int Digitos=(int)SymbolInfoInteger(Symbolo,SYMBOL_DIGITS);

      if(PositionGetInteger(POSITION_MAGIC)!=MagicNumber)
         continue;

      double Trailing_,BreakEven_;
      if(!ObtenerSLTP(Symbolo,Trailing_,BreakEven_))
         continue;

      if(Tipo==POSITION_TYPE_BUY && Trailing_>0 && (NormalizeDouble(Bid-Trailing_*Point_,Digitos)>StopLoss
            || StopLoss==0) && NormalizeDouble(Bid-Trailing_*Point_,Digitos)>OpenPrice)
         if(!Trade.PositionModify(Ticket,Bid-Trailing_*Point_,TakeProfit))
            Print("Error ",Trade.ResultRetcode());

      if(Tipo==POSITION_TYPE_SELL && Trailing_>0 && (NormalizeDouble(Ask+Trailing_*Point_,Digitos)<StopLoss
            || StopLoss==0) && NormalizeDouble(Ask+Trailing_*Point_,Digitos)<OpenPrice)
         if(!Trade.PositionModify(Ticket,Ask+Trailing_*Point_,TakeProfit))
            Print("Error ",Trade.ResultRetcode());

      if(Tipo==POSITION_TYPE_BUY && BreakEven_>0 && (StopLoss<OpenPrice || StopLoss==0)
         && Bid-BreakEven_*Point_>OpenPrice)  //Si Operacion es un BUY y Breakeven>0 y StopLoss No esta en Precio de Entrada y El precio supera el Precio establecido para el BE
         if(!Trade.PositionModify(Ticket,OpenPrice,TakeProfit))
            Print("Error ",Trade.ResultRetcode());

      if(Tipo==POSITION_TYPE_SELL && BreakEven_>0 && (StopLoss>OpenPrice || StopLoss==0) //Si Operacion es un SELL y Breakeven>0 y StopLoss No esta en Precio de Entrada y El precio supera el Precio establecido para el BE
         && Ask+BreakEven_*Point_<OpenPrice)
         if(!Trade.PositionModify(Ticket,OpenPrice,TakeProfit))
            Print("Error ",Trade.ResultRetcode());
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ObtenerSLTP(string Symbolo,double &Trailing_,double &BreakEven_)
  {
   for(int i=0; i<ArraySize(Array_Symbolos); i++)
     {
      if(ArraySize(NombresCuadrosTextosExpertos)>=(2+i)*TimeFramesFilas*22)
         if(Symbolo==Array_Symbolos[i])
           {
            Trailing_=StringToDouble(ObjectGetString(0,NombresCuadrosTextosExpertos[2+i*TimeFramesFilas][2],OBJPROP_TEXT));
            BreakEven_=StringToDouble(ObjectGetString(0,NombresCuadrosTextosExpertos[2+i*TimeFramesFilas][3],OBJPROP_TEXT));
            return true;
           }
     }
   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RegistrarSimbolo2(string Simbolos_,string &ArraySymbolos[])
  {
   if(Simbolos_=="")
     {
      return true;
     }
   int Conteo=0;
   string NombresDeLosSimbolos=Simbolos_+",";
   int PosicionEncontradoAnterior=0;
   int PosicionEncontrado=0;
   while(PosicionEncontrado<(int)StringBufferLen(NombresDeLosSimbolos) && PosicionEncontrado!=-1)
     {
      PosicionEncontrado=StringFind(NombresDeLosSimbolos,",",PosicionEncontrado+1);

      if(PosicionEncontrado!=-1)
        {
         ArrayResize(ArraySymbolos,Conteo+1);
         int Sustraccion=PosicionEncontrado-PosicionEncontradoAnterior;
         ArraySymbolos[Conteo]=StringSubstr(NombresDeLosSimbolos,PosicionEncontradoAnterior,Sustraccion);
         PosicionEncontradoAnterior=PosicionEncontrado+1;
         Conteo++;
        }
     }
   bool SymboloPersonalizado=true;
   for(int i=0; i<Conteo; i++)
     {
      if(!SymbolSelect(ArraySymbolos[i],SymboloPersonalizado))
        {
         Print("ERROR SYMBOLO ",ArraySymbolos[i]," NO ENCONTRADO");
         return(false);
        }
     }
   return true;
  }
//+------------------------------------------------------------------+
bool ControlCuenta()
  {

   static bool Calculo=false;
   if(TiempoExcedidoVerificacion)
     {
      return false;
     }

   if(VerificacionCuenta==false)
     {
      if(TimeCurrent()>TiempoCarga)
        {
         TiempoExcedidoVerificacion=true;
         Alert("Cuenta no habilitada - Comuniquese con el Desarrollador");
         return false;
        }
      VerificacionCuenta=Cuenta();
      return true;
     }

   if(password_status==-1)
     {
      if(TimeCurrent()>UNTIL)
        {
         Alert("TIEMPO DE PRUEBA TERMINADO EA DESABILITADO");
         return (false);
        }
     }

   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cuenta()
  {
   string broker = AccountInfoString(ACCOUNT_COMPANY);
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
   if(broker=="Pepperstone Group Limited" && account==8349664)//51055646
     {
      password_status=1;
      Comment("LICENCIA HABILITADA - ESPECIAL DESARROLLADOR");
      return true;
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
            CuentasCompartidasEjecutar++;
            break;
           }
        }
      if(CuentasCompartidasEjecutar==0)
        {
         Print("Cuenta no habilitada");
         Comment("Cuenta no habilitada");
         return false;
        }
      else
        {
         Comment(" - Licencia provista por EAD hasta ",UNTIL);
         return true;
        }
     }
   else
     {
      Comment("CUENTA VERIFICADA// TIEMPO ILIMITADO");
      return true;
     }
   return false;
  }
//+------------------------------------------------------------------+
