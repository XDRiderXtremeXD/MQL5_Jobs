//+------------------------------------------------------------------+
//|                                       Paneles Divergencias 2.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

int ArregloGestion[22];
string NombresCuadros[][22];
string NombresCuadrosTextos[][22];
int Columnas=0;

string Array_Symbolos[];
string Botones_Symbolos[];
bool Botones_Symbolos_Bool[];
string Edit_Symbolos[];


struct Edits
  {
   string            Lotaje_String;
   double            Lotaje_Double;
  };

Edits Edit_Symbolos_Anteriores[];

#resource "\\Indicators\\MULTIDIVERGENCIA Close.ex5"
////MODIFICAR NOMBRE DEL INIDCADOR ARRIBA Y TAMBIEN EN LA LINEA 973

bool Divergencias_Evalua;

string Nombres[21]= {"M1","M2","M3","M4","M5","M6","M10","M12","M15","M20","M30","H1","H2","H3","H4","H6","H8","H12","D1","W1","MN1"};
ENUM_TIMEFRAMES TIMEFRAMES[21]= {PERIOD_M1,PERIOD_M2,PERIOD_M3,PERIOD_M4,PERIOD_M5,PERIOD_M6,PERIOD_M10,PERIOD_M12,PERIOD_M15,PERIOD_M20,PERIOD_M30,PERIOD_H1,PERIOD_H2,PERIOD_H3,PERIOD_H4,PERIOD_H6,PERIOD_H8,PERIOD_H12,PERIOD_D1,PERIOD_W1,PERIOD_MN1};
datetime DateTime_Columna[][21];
bool Existen_Divergencias[][22];

enum Mostrar
  {
   MOSTRAR_TODO=0,
   MOSTRAR_LAS_ULTIMAS_X_VELAS=1,
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

input UsarDatos Tipo_de_Datos=High_Low;// Tipo de Datos
// OJO --------------> SI ESTA EN UNA SUBCARPETA PONER "(Nombre Sub Carpeta)/(Nombre del Indicador Pantalla Blanco)";
input bool Modo_Experto=true;
input string S0="============================================ Configuracion Grafico Divergencia ============================================";//*--
input bool Ver_Lineas_Precio=true;// Ver Divergencias en el Precio
input bool Ver_Separadores=false;
input Escala_Grafico Escala=__2;// Escala de Grafico
bool AplicarPlantilla=false;
string Tu_Plantilla="BASICA";
input string S1_="============================================ CONFIGURACION RSI ============================================";//======================================================================
input bool Ver_Indicador_RSI=true;// Ver Divergencias RSI
input bool Ver_Indicador_RSI_Indicador=false;// Ver Indicador RSI
input int RSI_Periodo=14;
input ENUM_APPLIED_PRICE RSI_Applied_Price=PRICE_CLOSE;
input int Filtro_Retroceso_RSI=6;
input bool Filtro_SobreCompra_SobreVenta_RSI=false;// Filtro SobreCompra SobreVenta
input string S6_="============================================ CONFIGURACION MACD ============================================";//*--
input bool Ver_Indicador_MACD=true; // Ver Divergencias MACD
input bool Ver_Indicador_MACD_Indicador=false; // Ver Indicador MACD
input int Period_MACD=12;
input int Slow_Ema_MACD=26;
input int Signal_Period_MACD=9;
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;
input string S7="============================================  CONFIGURACION ESTOCASTICO ============================================";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Ver_Indicador_ESTOCASTICO=true; // Ver Divergencias Estocastico
input bool Ver_Indicador_ESTOCASTICO_Indicador=false;// Ver Indicador Estocastico
input int K_Periodo=10;
input int D_Periodo=3;
input int Slowing=5;
input ENUM_MA_METHOD Ma_Method_EST=MODE_SMA;
input ENUM_STO_PRICE STO_EST=STO_LOWHIGH;
input int Filtro_Retroceso_ESTOCASTICO=2;
input bool Filtro_SobreCompra_SobreVenta_Est=false;// Filtro SobreCompra SobreVenta
input string s7 = "============================================ Divergence ============================================";//==========
input bool Filtro_Traspaso_50=true;// Filtro traspaso 50%
input Mostrar Mostrar_Lineas=MOSTRAR_LAS_ULTIMAS_X_VELAS;
input int X_Velas=300;
input Ver_Divergencias Ver_Divergencias_en_un_mismo_Punto=MOSTRAR_UNA_DIVERGENCIA;// Ver Divergencias en un mismo punto
input bool Ver_Divergencia_Oculta=true;
input bool Ver_Divergencia_Regular=true;
input color ColorDivergenceOculta=clrMagenta;
input color ColorDivergenceRegular=clrAqua;
input ENUM_LINE_STYLE Estilo_Linea=STYLE_SOLID;
input int Grosor_Linea=1;
input int Crossing_Tolerance=20;//Line Crossing Tolerance in Points
input int Distancia_Maxima=1000;// Distancia Minima  (Filtro por Distancia maxima de la diveregencia)
input int Distancia_Minima=5;//Distancia Minima (Filtro por Distancia minima de la diveregencia)
input string s74= "============================================ Flechas ============================================";//==========
input color ColorFlechaAlcista=clrSpringGreen;
input color ColorFlechaBajista=clrOrange;
input uchar CodigoAlcista=221; // Codigo Alcista (32 - 255)
input uchar CodigoBajista=222; // Codigo Bajista (32 - 255)
input uchar AnchoFlecha=1;
input string s71= "============================================ Alertas ============================================";//==========
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;
input string S4="============================================ Configuracion Cuadros ============================================";//*--
input int Anclaje_X=10;
input int Anclaje_Y=10;
input int EspacioCuadroHorizontal=0;
input int EspacioCuadroVertical=0;
input int TamanoCuadroHorizontal_Simbolos=120;
input int TamanoCuadroHorizontal=40;
input int TamanoCuadroVertical=25;
input int TamanoCuadroHorizontal_PanelRegistro=80;
input int TamanoCuadroVertical_PanelRegistro=25;
input int TamanoCuadroHorizontal_Botones=50;
input int TamanoCuadroHorizontal_Edit=50;
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
input bool H6=true;
input bool H8=true;
input bool H12=true;
input bool D1=true;
input bool W1=true;
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

int Handle_MACD=0;

int Handle_ESTOCASTICO=0;

int Sub_Window=0;

int Handle_Indicador=0;

int Fila_S=0;
int Columna_S=0;

long Open=0;

string LineaVertical="001 Linea Vertical";
string LineaHorizontal="001 Linea Horizontal";
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

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

   ArrayResize(Botones_Symbolos,ArraySize(Array_Symbolos));
   ArrayResize(Botones_Symbolos_Bool,ArraySize(Array_Symbolos));
   ArrayResize(Edit_Symbolos,ArraySize(Array_Symbolos));
   ArrayResize(Edit_Symbolos_Anteriores,ArraySize(Array_Symbolos));

//ActualizarDatos(Symbol(),PERIOD_CURRENT);

   Filas_Totales=ArraySize(Array_Symbolos)+2;

   ArrayResize(DateTime_Columna,Filas_Totales);
   ArrayResize(Existen_Divergencias,Filas_Totales);

   ArrayInitialize(DateTime_Columna,0);
   ArrayInitialize(Existen_Divergencias,false);

   GestionarColumnas();
/// DESCARGAR DATOS ///
   for(int f=2; f<Filas_Totales; f++)
      for(int c=Columnas-1; c>=1; c--)
        {
         string Symbolo=Array_Symbolos[f-2];

         // Print("CATEGORIA  ",SymbolInfoString(Symbolo,SYMBOL_SECTOR_NAME));
         ENUM_TIMEFRAMES TimeFrame=TIMEFRAMES[ArregloGestion[c-1]];

         datetime TiempoComprueba=TimeCurrent()-Distancia_Maxima*PeriodSeconds(TimeFrame);
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


   long currChart,prevChart=ChartFirst();
   int i_=0,limit2=100;
//Print("ChartFirst =",ChartSymbol(prevChart)," ID =",prevChart);
   while(i_<limit2)// We have certainly not more than 100 open charts
     {
      if(ChartGetString(prevChart,CHART_COMMENT)=="DIVERGENCIAS")
        {
         Open=prevChart;
         break;
        }

      currChart=ChartNext(prevChart); // Get the new chart ID by using the previous chart ID
      if(currChart<0)
         break;          // Have reached the end of the chart list
      //Print(i,ChartSymbol(currChart)," ID =",currChart);
      prevChart=currChart;// let's save the current chart ID for the ChartNext()
      i_++;// Do not forget to increase the counter

     }

   CrearCuadros();


   InicioX=Anclaje_X+TamanoCuadroHorizontal+EspacioCuadroHorizontal+(TamanoCuadroHorizontal_Simbolos-TamanoCuadroHorizontal);
   FinalX=Anclaje_X+TamanoCuadroHorizontal*Columnas+EspacioCuadroHorizontal*Columnas+(TamanoCuadroHorizontal_Simbolos-TamanoCuadroHorizontal)-Grosor_Linea_Cuadro*(Columnas-1);
   InicioY=Anclaje_Y+2*TamanoCuadroVertical+EspacioCuadroVertical*2;
   FinalY=Anclaje_Y+TamanoCuadroVertical*Filas_Totales+EspacioCuadroVertical*Filas_Totales-Grosor_Linea_Cuadro*(Filas_Totales-1);

/// PANTALLA EN BLANCOOOO ///

   ChartSetInteger(0,CHART_SCALE,1);

   EventSetTimer(1);
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

   if(ChartPeriod(Open)!=0 && Open!=0)
      ChartClose(Open);

   if(ObjectFind(0,Pantalla)==0)
      ObjectDelete(0,Pantalla);

   ArrayFree(DateTime_Columna);

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
void CrearCuadros()
  {
   if(ObjectFind(0,Pantalla)!=0)
      RectLabelCreate(0,Pantalla,0,0,0,10000,10000,clrBlack,BORDER_RAISED,0,clrBlack,STYLE_SOLID,2,false,false,true,0);

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
               if(!Diferente_Tamano(c,f,0,0,Multiplicador_Ancho,Columnas,true))
                  continue;
               //if(!Diferente_Tamano(c,f,0,1,Multiplicador_Largo,4,false))
               //  continue;
               string Texto=Texto_Cuadro(c,f);
               color Color_Cuadro=ColorCuadro(c,f);
               int X=Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontal*c;
               int Y= Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f-f*Grosor_Linea_Cuadro;
               int Ancho_=TamanoCuadroHorizontal*Multiplicador_Ancho+(Multiplicador_Ancho-1)*EspacioCuadroHorizontal+(TamanoCuadroHorizontal_Simbolos-TamanoCuadroHorizontal)-(Columnas-1)*Grosor_Linea_Cuadro;;//TamanoCuadroHorizontal
               int Largo_=TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical;// TamanoCuadroVertical
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
               if(!Diferente_Tamano(c,f,0,0,Multiplicador_Ancho,Columnas,true))
                  continue;
               //if(!Diferente_Tamano(c,f,0,1,Multiplicador_Largo,4,false))
               //  continue;
               string Texto=Texto_Cuadro(c,f);
               color Color_Cuadro=ColorCuadro(c,f);
               int X=Anclaje_X+EspacioCuadroHorizontal*(c+1)+TamanoCuadroHorizontal*c+(TamanoCuadroHorizontal_Simbolos-TamanoCuadroHorizontal)-c*Grosor_Linea_Cuadro;
               int Y= Anclaje_Y+EspacioCuadroVertical*(f+1)+TamanoCuadroVertical*f-f*Grosor_Linea_Cuadro;
               int Ancho_=TamanoCuadroHorizontal*Multiplicador_Ancho+(Multiplicador_Ancho-1)*EspacioCuadroHorizontal;//TamanoCuadroHorizontal
               int Largo_=TamanoCuadroVertical*Multiplicador_Largo+(Multiplicador_Largo-1)*EspacioCuadroVertical;// TamanoCuadroVertical
               RectLabelCreate(0,NombresCuadros[f][c],CharIndicator,X,Y,Ancho_,Largo_,Color_Cuadro,BORDER_FLAT,0,Color_Linea_Borde,STYLE_SOLID,Grosor_Linea_Cuadro,false,false,true,0);

               if(Modo_Experto && c==Columnas-1 && f>=2)
                 {
                  Botones_Symbolos[f-2]="Cuadro Panel 001 Boton"+" c="+(string)c+" f="+(string)f;
                  ButtonCreate(0,Botones_Symbolos[f-2],0,X+TamanoCuadroHorizontal,Y,TamanoCuadroHorizontal_Botones,TamanoCuadroVertical,CORNER_LEFT_UPPER,"START","Arial",TamanoLetrasTexto,Color_Texto,clrRed,clrNONE,false,false,false,true,0);
                  Edit_Symbolos[f-2]="Cuadro Panel 001 Edit"+" c="+(string)c+" f="+(string)f;
                  string Lotaje=DoubleToString(SymbolInfoDouble(Array_Symbolos[f-2],SYMBOL_VOLUME_MIN),2);
                  Edit_Symbolos_Anteriores[f-2].Lotaje_String=Lotaje;
                  Edit_Symbolos_Anteriores[f-2].Lotaje_Double=SymbolInfoDouble(Array_Symbolos[f-2],SYMBOL_VOLUME_MIN);
                  EditCreate(0,Edit_Symbolos[f-2],0,X+TamanoCuadroHorizontal+TamanoCuadroHorizontal_Botones,Y,TamanoCuadroHorizontal_Edit,TamanoCuadroVertical,Lotaje,"Arial",TamanoLetrasTexto,ALIGN_CENTER,false,CORNER_LEFT_UPPER,clrBlack,clrWhite,clrNONE,false,false,true,0);
                 }

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


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Diferente_Tamano(int c,int f,int Point_c,int Point_f,int &Multiplicador,int MultiplicadorCuadro,bool EsAncho)
  {
   if(EsAncho)
     {
      if(f==Point_f)
        {
         if(c>Point_c && c<Point_c+MultiplicadorCuadro)
            return false;
         if(c==Point_c && f==Point_f)
            Multiplicador=MultiplicadorCuadro;
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

   if(id==CHARTEVENT_MOUSE_MOVE && !AlertasInicio)
     {

      int x=(int)lparam;
      int y=(int)dparam;
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

            PlaySound("alert2");
            // Print("Columna ",Columna," ArraySize ",ArraySize(Array_Symbolos));
            //Print("Fila ",Fila," ArraySize ",ArraySize(ArregloGestion));
            string Simbolo=Array_Symbolos[FilaR-2];
            ENUM_TIMEFRAMES Periodo=TIMEFRAMES[ArregloGestion[ColumnaR-1]];

            if(ChartPeriod(Open)==0 || Open==0)
              {
               Open=ChartOpen(Simbolo,Periodo);

               if(Open!=0)
                 {
                  ChartSetString(Open,CHART_COMMENT,"DIVERGENCIAS");
                  if(AplicarPlantilla)
                    {
                     ChartApplyTemplate(Open,Tu_Plantilla+".tpl");
                     TiempoEspera=TimeLocal()+3;
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
                     ChartSetInteger(Open,CHART_SHOW_GRID,false);
                     ChartSetInteger(Open,CHART_SHOW_PERIOD_SEP,Ver_Separadores);
                     ChartRedraw(Open);
                     TiempoEspera=TimeLocal()+2;
                    }
                  ChartRedraw(Open);
                 }

               if(ChartPeriod(Open)!=0)
                  Handle_Indicador=iCustom(Simbolo,Periodo,"::Indicators\\MULTIDIVERGENCIA Close.ex5",Tipo_de_Datos,Ver_Lineas_Precio,S1_,Ver_Indicador_RSI,Ver_Indicador_RSI_Indicador,RSI_Periodo, RSI_Applied_Price,Filtro_Retroceso_RSI,Filtro_SobreCompra_SobreVenta_RSI
                                           ,S6_,Ver_Indicador_MACD,Ver_Indicador_MACD_Indicador,Period_MACD,Slow_Ema_MACD,Signal_Period_MACD,Applied_Price_MACD,S7,Ver_Indicador_ESTOCASTICO,Ver_Indicador_ESTOCASTICO_Indicador,K_Periodo,D_Periodo,Slowing,Ma_Method_EST
                                           ,STO_EST,Filtro_Retroceso_ESTOCASTICO,Filtro_SobreCompra_SobreVenta_Est,s7,Filtro_Traspaso_50,Mostrar_Lineas,X_Velas,Ver_Divergencias_en_un_mismo_Punto,Ver_Divergencia_Oculta,Ver_Divergencia_Regular,ColorDivergenceOculta,ColorDivergenceRegular
                                           ,Estilo_Linea,Grosor_Linea,Crossing_Tolerance,Distancia_Maxima,Distancia_Minima,s74,ColorFlechaAlcista,ColorFlechaBajista,CodigoAlcista,CodigoBajista,AnchoFlecha,s71,false,false,false,true);

               if(Open!=0 && Handle_Indicador!=INVALID_HANDLE)
                  ChartIndicatorAdd(Open,0,Handle_Indicador);


               if(Handle_Indicador==INVALID_HANDLE && Open!=0)
                  Alert("No se puede agregar el Indicador al Grafico... revise si esta escrito bien y que este en la carpeta Indicadores o subcarpeta");

               ChartRedraw(Open);

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
               Fila_S=FilaR;
               Columna_S=ColumnaR;

               ObjectSetInteger(0,NombresCuadros[Fila_S][Columna_S],OBJPROP_COLOR,ColorSeleccion);
               ObjectSetInteger(0,NombresCuadros[Fila_S][0],OBJPROP_COLOR,ColorSeleccion);
               ObjectSetInteger(0,NombresCuadros[1][Columna_S],OBJPROP_COLOR,ColorSeleccion);
               ChartSetInteger(Open,CHART_AUTOSCROLL,true);
               ChartSetInteger(Open,CHART_SCALE,Escala);
               ChartRedraw(Open);
              }
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
   Divergencias_Evalua();
   if(Modo_Experto)
      ComprobarEdits();

  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Divergencia(int zs,int IndiceLowZZ,int IndiceHighZZ,int &Prefix,double &MACD_Buffer[],int ChartIndicator,string INDI,double &close[],double&high[],double const &low[],int RatesTotal,datetime &time[],Indicator Indicador,bool VerIndicador,int Distancia_Maxima_,string &TipoDivergencia,string Simbolo,ENUM_TIMEFRAMES TimeFrame)
  {
   bool FirstPoint=false;
   bool SecondPoint=false;
   double MACD_First_Point=0;
   int MACD_First_Indice=0;
   double MACD_Posterior,MACD_Anterior,MACD_Medio;
   int MACD_Second_Indice=0;
   bool EncontroOculta=false;
   bool EncontroRegular=false;
   double Flecha=0;
   bool Filtro_MACD=false;


   static bool Impresion=true;

   if(zs==1)
     {
      //    Print("A1");
      for(int i=IndiceLowZZ-NumeroMuestreo; i<=IndiceLowZZ+NumeroMuestreo; i++)
        {

         if(i-1<1)
            continue;

         MACD_Posterior=MACD_Buffer[i-1];
         MACD_Medio=MACD_Buffer[i];
         MACD_Anterior=MACD_Buffer[i+1];

         Flecha=MACD_Buffer[i];
         //Print(i);
         bool Filtro=true;
         if(Indicador==RSI)
           {
            Filtro=(MACD_Medio<(MACD_Anterior-Filtro_Retroceso_RSI));
            Filtro=(Filtro_SobreCompra_SobreVenta_RSI)?(30>MACD_Medio):Filtro;// Filtro SobreCompra SobreVenta
           }
         else
            if(Indicador==ESTOCASTICO)
              {
               Filtro=(MACD_Medio<(MACD_Anterior-Filtro_Retroceso_ESTOCASTICO));
               Filtro=(Filtro_SobreCompra_SobreVenta_Est)?(20>MACD_Medio):Filtro;// Filtro SobreCompra SobreVenta
              }
            else
               if(Indicador==MACD)
                  Filtro=(MACD_Medio<0);


         if(MACD_Medio<MACD_Anterior && MACD_Medio<MACD_Posterior && Filtro)
           {
            MACD_First_Point=MACD_Medio;
            MACD_First_Indice=i;
            FirstPoint=true;
            break;
           }
        }
      if(!FirstPoint)
         return false;

      // Print("Distancia Maxima ",Distancia_Maxima_," IndiceLowzz+3 ",IndiceLowZZ+3);
      for(int i=IndiceLowZZ+3+((Distancia_Minima>3)?Distancia_Minima-3:0); i<Distancia_Maxima_; i++)
        {

         if(i-1<1)
            continue;
         //  Print(i);
         MACD_Posterior=MACD_Buffer[i-1];
         MACD_Medio=MACD_Buffer[i];
         MACD_Anterior=MACD_Buffer[i+1];

         bool Filtro=true;

         if(Indicador==RSI)
           {
            Filtro=(MACD_Medio<(MACD_Anterior-Filtro_Retroceso_RSI));
           }
         else
            if(Indicador==ESTOCASTICO)
              {
               Filtro=(MACD_Medio<(MACD_Anterior-Filtro_Retroceso_ESTOCASTICO));
              }
            else
               if(Indicador==MACD)
                 {
                  if(MACD_Medio>0)
                     Filtro_MACD=true;
                  Filtro=(MACD_Medio<0 && Filtro_MACD);
                 }
         if(MACD_Medio<MACD_Anterior && MACD_Medio<MACD_Posterior && Filtro)
           {
            int IndiceLowZZ_2=0;
            if(Ver_Divergencia_Regular && !EncontroRegular)
               if(ZigZag(i,IndiceLowZZ_2,false,close,high,low,RatesTotal) && MACD_First_Point>MACD_Medio)
                 {
                  MACD_Second_Indice=i;

                  double Low_1=0;
                  double Low_2=0;
                  if(Tipo_de_Datos==Close_Close)
                    {
                     Low_1=close[RatesTotal-1-IndiceLowZZ_2];
                     Low_2=close[RatesTotal-1-IndiceLowZZ];
                    }
                  else
                    {
                     Low_1=low[RatesTotal-1-IndiceLowZZ_2];
                     Low_2=low[RatesTotal-1-IndiceLowZZ];
                    }

                  if(Low_2<Low_1 && EvaPendiente(IndiceLowZZ,IndiceLowZZ_2,MACD_First_Indice,MACD_Second_Indice,false,MACD_Buffer,close,high,low,RatesTotal,Simbolo))
                    {
                     SecondPoint=true;
                     
                      if(TimeFrame==PERIOD_H4)
                          {
                           Print("Second  i ",IndiceLowZZ_2," First second ",IndiceLowZZ);


                           if(Indicador==RSI)
                              Print("RSI");
                           else
                              if(Indicador==ESTOCASTICO)
                                 Print("ESTOCASTICO");
                              else
                                 if(Indicador==MACD)
                                    Print("MACD");
                           }

                     if(Ver_Divergencias_en_un_mismo_Punto)
                        EncontroRegular=true;
                     TipoDivergencia="RE";
                    }
                 }

            IndiceLowZZ_2=0;
            if(Ver_Divergencia_Oculta && !EncontroOculta)
               if(ZigZag(i,IndiceLowZZ_2,false,close,high,low,RatesTotal) && MACD_First_Point<MACD_Medio)
                 {
                  MACD_Second_Indice=i;
                  double Low_1=0;
                  double Low_2=0;

                  if(Tipo_de_Datos==Close_Close)
                    {
                     Low_1=close[RatesTotal-1-IndiceLowZZ_2];
                     Low_2=close[RatesTotal-1-IndiceLowZZ];
                    }
                  else
                    {
                     Low_1=low[RatesTotal-1-IndiceLowZZ_2];
                     Low_2=low[RatesTotal-1-IndiceLowZZ];
                    }

                  if(Low_2>Low_1 && EvaPendiente(IndiceLowZZ,IndiceLowZZ_2,MACD_First_Indice,MACD_Second_Indice,false,MACD_Buffer,close,high,low,RatesTotal,Simbolo))
                    {
                     SecondPoint=true;

                     if(TimeFrame==PERIOD_H4)
                       {
                        Print("Second  i ",IndiceLowZZ_2," First second ",IndiceLowZZ);
                        if(Indicador==RSI)
                           Print("RSI");
                        else
                           if(Indicador==ESTOCASTICO)
                              Print("ESTOCASTICO");
                           else
                              if(Indicador==MACD)
                                 Print("MACD");
                       }
                     if(Ver_Divergencias_en_un_mismo_Punto)
                        EncontroOculta=true;
                     TipoDivergencia="OC";
                    }
                 }
            //     Print("BB4");
           }
        }
      Impresion=false;
      // Print("C1");
      if(SecondPoint==false)
         return false;
     }

   if(zs==0)
     {
      //    Print("A2");
      for(int i=IndiceHighZZ-NumeroMuestreo; i<=IndiceHighZZ+NumeroMuestreo ; i++)
        {
         if(i-1<1)
            continue;

         MACD_Posterior=MACD_Buffer[i-1];
         MACD_Medio=MACD_Buffer[i];
         MACD_Anterior=MACD_Buffer[i+1];
         Flecha=MACD_Buffer[i];

         bool Filtro=true;
         if(Indicador==RSI)
           {
            Filtro=(MACD_Medio>(MACD_Anterior+Filtro_Retroceso_RSI));
            Filtro=(Filtro_SobreCompra_SobreVenta_RSI)?(70<MACD_Medio):Filtro;// Filtro SobreCompra SobreVenta}
           }
         else
            if(Indicador==ESTOCASTICO)
              {
               Filtro=(MACD_Medio>(MACD_Anterior+ Filtro_Retroceso_ESTOCASTICO));
               Filtro=(Filtro_SobreCompra_SobreVenta_Est)?(80<MACD_Medio):Filtro;
              }// Filtro SobreCompra SobreVenta}
            else
               if(Indicador==MACD)
                  Filtro=(MACD_Medio>0);

         if(MACD_Medio>MACD_Anterior && MACD_Medio>MACD_Posterior && Filtro)
           {
             if(Simbolo=="AUDSGD" && TimeFrame==PERIOD_M10)
               {
                Print("MACD MEDIO ",MACD_Medio," MACD ANTERIOR ",MACD_Anterior," MACD POSTERIOR ",MACD_Posterior);
                if(Indicador==RSI)
                  {
                   Print("RSI");
                  }
                else
                   if(Indicador==ESTOCASTICO)
                     {
                      Print("ESTOCASTICO");
                     }// Filtro SobreCompra SobreVenta}
                   else
                      if(Indicador==MACD)
                         Print("MACD");
                Print("i ",i);
               }

            MACD_First_Point=MACD_Medio;
            MACD_First_Indice=i;
            FirstPoint=true;
            break;
           }
        }
      //  Print("B2");
      if(!FirstPoint)
         return false;

      for(int i=IndiceHighZZ+3+((Distancia_Minima>3)?Distancia_Minima-3:0); i<Distancia_Maxima_; i++)
        {
         if(i-1<1)
            continue;

         // Print(i);
         MACD_Posterior=MACD_Buffer[i-1];
         MACD_Medio=MACD_Buffer[i];
         MACD_Anterior=MACD_Buffer[i+1];

         bool Filtro=true;
         if(Indicador==RSI)
            Filtro=(MACD_Medio>(MACD_Anterior+Filtro_Retroceso_RSI));
         else
            if(Indicador==ESTOCASTICO)
               Filtro=(MACD_Medio>(MACD_Anterior+ Filtro_Retroceso_ESTOCASTICO));
            else
               if(Indicador==MACD)
                 {
                  if(MACD_Medio<0)
                     Filtro_MACD=true;
                  Filtro=(MACD_Medio>0 && Filtro_MACD);
                 }

         if(MACD_Medio>MACD_Anterior && MACD_Medio>MACD_Posterior && Filtro)
           {
            int IndiceHighZZ_2=0;
            if(Ver_Divergencia_Regular && !EncontroRegular)
               if(ZigZag(i,IndiceHighZZ_2,true,close,high,low,RatesTotal)  && MACD_First_Point<MACD_Medio)
                 {
                  MACD_Second_Indice=i;
                  double High_1=0;
                  double High_2=0;

                  if(Tipo_de_Datos==Close_Close)
                    {
                     High_1=close[RatesTotal-1-IndiceHighZZ_2];
                     High_2=close[RatesTotal-1-IndiceHighZZ];
                    }
                  else
                    {
                     High_1=high[RatesTotal-1-IndiceHighZZ_2];
                     High_2=high[RatesTotal-1-IndiceHighZZ];
                    }

                  if(High_2>High_1 && EvaPendiente(IndiceHighZZ,IndiceHighZZ_2,MACD_First_Indice,MACD_Second_Indice,true,MACD_Buffer,close,high,low,RatesTotal,Simbolo))
                    {
                     SecondPoint=true;

                     if(TimeFrame==PERIOD_H4)
                        {
                         Print("Second  i ",IndiceHighZZ_2," First second ",IndiceHighZZ);
                         if(Indicador==RSI)
                            Print("RSI");
                         else
                            if(Indicador==ESTOCASTICO)
                               Print("ESTOCASTICO");
                            else
                               if(Indicador==MACD)
                                  Print("MACD");
                        }

                     if(Ver_Divergencias_en_un_mismo_Punto)
                        EncontroRegular=true;

                     TipoDivergencia="RE";

                    }
                 }

            IndiceHighZZ_2=0;
            if(Ver_Divergencia_Oculta && !EncontroOculta)
               if(ZigZag(i,IndiceHighZZ_2,true,close,high,low,RatesTotal)  && MACD_First_Point>MACD_Medio)
                 {
                  MACD_Second_Indice=i;

                  double High_1=0;
                  double High_2=0;

                  if(Tipo_de_Datos==Close_Close)
                    {
                     High_1=close[RatesTotal-1-IndiceHighZZ_2];
                     High_2=close[RatesTotal-1-IndiceHighZZ];
                    }
                  else
                    {
                     High_1=high[RatesTotal-1-IndiceHighZZ_2];
                     High_2=high[RatesTotal-1-IndiceHighZZ];
                    }

                  if(High_2<High_1 && EvaPendiente(IndiceHighZZ,IndiceHighZZ_2,MACD_First_Indice,MACD_Second_Indice,true,MACD_Buffer,close,high,low,RatesTotal,Simbolo))
                    {
                    SecondPoint=true;

                     if(TimeFrame==PERIOD_H4)
                          {
                           Print("Second  i ",IndiceHighZZ_2," First second ",IndiceHighZZ);
                           Print("Second i ",MACD_Medio," First seconmd ",MACD_First_Point);
                           Print("First i MACD ",MACD_First_Indice);
                           if(Indicador==RSI)
                              Print("RSI");
                           else
                              if(Indicador==ESTOCASTICO)
                                 Print("ESTOCASTICO");
                              else
                                 if(Indicador==MACD)
                                    Print("MACD");
                          }
                     // Print(IndiceHighZZ_2);

                     if(Ver_Divergencias_en_un_mismo_Punto)
                        EncontroOculta=true;

                     TipoDivergencia="OC";
                    }
                 }
           }
        }

      //   Print("C2");
      if(SecondPoint==false)
         return false;
     }

// Print(time[RatesTotal-1]);
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaPendiente(int IndiceFirst,int IndiceSecond,int IndiceFirst_TVI,int IndiceSecond_TVI,bool IsHigh,double &MACD_Buffer[],double const &close[],double const &high[],double const &low[],int const RatesTotal,string Simbolo)
  {

   double Points=SymbolInfoDouble(Simbolo,SYMBOL_POINT);
   double DiferenciaX=IndiceSecond-IndiceFirst;
   double DiferenciaY=IsHigh?(Tipo_de_Datos==High_Low?(high[RatesTotal-1-IndiceFirst]-high[RatesTotal-1-IndiceSecond]):(close[RatesTotal-1-IndiceFirst]-close[RatesTotal-1-IndiceSecond])):(Tipo_de_Datos==High_Low?(low[RatesTotal-1-IndiceFirst]-low[RatesTotal-1-IndiceSecond]):(close[RatesTotal-1-IndiceFirst]-close[RatesTotal-1-IndiceSecond]));
   double Pendiente=DiferenciaY/DiferenciaX;

   DiferenciaX=IndiceSecond_TVI-IndiceFirst_TVI;
   double valor_1=MACD_Buffer[IndiceFirst_TVI];
   double valor_2=MACD_Buffer[IndiceSecond_TVI];
   DiferenciaY=valor_1-valor_2;
   double Pendiente_TVI=DiferenciaY/DiferenciaX;


   double Valor_Inicial_TVI=MACD_Buffer[IndiceSecond];
   double Valor_Inicial=IsHigh?(Tipo_de_Datos==High_Low?(high[RatesTotal-1-IndiceSecond]):(close[RatesTotal-1-IndiceSecond])):(Tipo_de_Datos==High_Low?(low[RatesTotal-1-IndiceSecond]):(close[RatesTotal-1-IndiceSecond]));
   int PasoTVI=1, PasoZZ=1;

   int Inicial=IndiceSecond>IndiceSecond_TVI?IndiceSecond:IndiceSecond_TVI;
   int Final=IndiceFirst<IndiceFirst_TVI?IndiceFirst:IndiceFirst_TVI;

   for(int i=Inicial-1; i>Final; i--)
     {
      double TVI=MACD_Buffer[i];

      if(i<IndiceSecond_TVI && i>IndiceFirst_TVI)
        {
         if(Valor_Inicial_TVI+PasoTVI*Pendiente_TVI<TVI && IsHigh)
            return false;

         if(Valor_Inicial_TVI+PasoTVI*Pendiente_TVI>TVI && IsHigh==false)
            return false;

         PasoTVI++;
        }

      if(i<IndiceSecond && i>IndiceFirst)
        {
         if(Valor_Inicial+PasoZZ*Pendiente<(Tipo_de_Datos==High_Low?(high[RatesTotal-1-i]):(close[RatesTotal-1-i]))-Points*Crossing_Tolerance && IsHigh)
            return false;

         if(Valor_Inicial+PasoZZ*Pendiente>(Tipo_de_Datos==High_Low?(low[RatesTotal-1-i]):(close[RatesTotal-1-i]))+Points*Crossing_Tolerance && IsHigh==false)
            return false;
         PasoZZ++;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ZigZag(int i,int &IndiceZigZag,bool IsHigh,double const &close[],double const &high[],double const &low[],int const RatesTotal)
  {

   for(int j=NumeroMuestreo*-1; j<=NumeroMuestreo; j++)
     {
      if(Tipo_de_Datos==Close_Close)
        {
         if((IsHigh && close[RatesTotal-1-(i+j)]>close[RatesTotal-1-(i+j+1)] &&  close[RatesTotal-1-(i+j)]>close[RatesTotal-1-(i+j-1)]) || (!IsHigh && close[RatesTotal-1-(i+j)]<close[RatesTotal-1-(i+j+1)] &&  close[RatesTotal-1-(i+j)]<close[RatesTotal-1-(i+j-1)]))
           {
            IndiceZigZag=i+j;
            return true;
           }
        }
      else
         if((IsHigh && high[RatesTotal-1-(i+j)]>high[RatesTotal-1-(i+j+1)] &&  high[RatesTotal-1-(i+j)]>high[RatesTotal-1-(i+j-1)]) || (!IsHigh && low[RatesTotal-1-(i+j)]<low[RatesTotal-1-(i+j+1)] &&  low[RatesTotal-1-(i+j)]<low[RatesTotal-1-(i+j-1)]))
           {
            IndiceZigZag=i+j;
            return true;
           }
     }
   return false;
  }
//+------------------------------------------------------------------+





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
         IgualarDiveregencias(c,f,TIMEFRAMES[ArregloGestion[c-1]],DateTime_Columna[f-2][ArregloGestion[c-1]]);

      if(Divergencias_Evalua)
        {
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

   for(int f=2; f<Filas_Totales; f++)
      for(int c=1; c<Columnas; c++)
        {
         string Symbolo=Array_Symbolos[f-2];
         DateTime_Columna[f-2][ArregloGestion[c-1]]=ActualizarDatos(Symbolo,TIMEFRAMES[ArregloGestion[c-1]]);
        }

   if(AlertaComentario!=" " && !AlertasInicio)
     {
      if(AlertPC)
         Alert(AlertaComentario);
      if(AlertMovil)
         SendNotification(AlertaComentario);
      if(AlertMail)
         SendMail("DIVERGENCIAS",AlertaComentario);
     }

   if(AlertasInicio)
     {
      ObjectSetInteger(0,NombresCuadros[1][0],OBJPROP_BGCOLOR,Color_Cargado);
      ObjectSetString(0,NombresCuadrosTextos[1][0],OBJPROP_TEXT,"Divisas");

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
void IgualarDiveregencias(int Columna,int Fila,ENUM_TIMEFRAMES TimeFrame,datetime Tiempo_Evalua)
  {

//  Print("A1");
   string Symbolo=Array_Symbolos[Fila-2];

   datetime DATETIME=ActualizarDatos(Symbolo,TimeFrame);
// Print("A3");

   if(DATETIME!=Tiempo_Evalua)
     {
      /*  if(TimeFrame==PERIOD_M1)
          {
           Print("ENTRA");
           Print(Symbolo,"  ",TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES));
          }*/

      Divergencias_Evalua=true;
      Existen_Divergencias[Fila][Columna]=false;
      ObjectSetInteger(0,NombresCuadros[Fila][Columna],OBJPROP_BGCOLOR,Color_Fondo_Default);
      int Bars_=iBars(Symbolo,TimeFrame);
      int Maximo=Distancia_Maxima+1;
      if(Bars_<Maximo)
         Maximo=Bars_;

      double high[],low[],close[];
      datetime time[];
      double RSI_BUFFER[],MACD_BUFFER[],ESTOCASTICO_BUFFER[];


      /*int copied=CopyHigh(Symbolo,TimeFrame,0,Maximo,high);
      if(copied>-1 && index<copied)
         high=High[index];*/

      CopyHigh(Symbolo,TimeFrame,0,Maximo,high);
      CopyLow(Symbolo,TimeFrame,0,Maximo,low);
      CopyClose(Symbolo,TimeFrame,0,Maximo,close);
      CopyTime(Symbolo,TimeFrame,0,Maximo,time);

      ArraySetAsSeries(high,false);
      ArraySetAsSeries(low,false);
      ArraySetAsSeries(time,false);
      ArraySetAsSeries(close,false);

      ArrayResize(RSI_BUFFER,Maximo);
      ArrayResize(MACD_BUFFER,Maximo);
      ArrayResize(ESTOCASTICO_BUFFER,Maximo);

      ArraySetAsSeries(RSI_BUFFER,true);
      ArraySetAsSeries(MACD_BUFFER,true);
      ArraySetAsSeries(ESTOCASTICO_BUFFER,true);

      Handle_RSI=iRSI(Symbolo,TimeFrame,RSI_Periodo,RSI_Applied_Price);
      Handle_MACD=iMACD(Symbolo,TimeFrame,Period_MACD,Slow_Ema_MACD,Signal_Period_MACD,Applied_Price_MACD);
      Handle_ESTOCASTICO=iStochastic(Symbolo,TimeFrame,K_Periodo,D_Periodo,Slowing,Ma_Method_EST,STO_EST);

      int Maximo2=0;
      int Copy=0;

      if(Ver_Indicador_ESTOCASTICO && Bars_>K_Periodo + D_Periodo +Slowing+1 && Maximo<Bars_-(K_Periodo + D_Periodo +Slowing+1))
        {
         uchar Conteo=0;
         Copy=CopyBuffer(Handle_ESTOCASTICO,0,0,Maximo,ESTOCASTICO_BUFFER);
         while(Copy<=0 && !IsStopped())
           {
            if(Conteo==0)
              {
               Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE ESTOCASTICO EN ",Symbolo," ",EnumToString(TimeFrame));
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL ESTOCASTICO");
              }
            else
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL ESTOCASTICO");

            Conteo++;
            Sleep(1000);
            Copy=CopyBuffer(Handle_ESTOCASTICO,0,0,Maximo,ESTOCASTICO_BUFFER);
            if(Conteo>3)
              {
               int Error=GetLastError();
               if(Copy<=0)
                 {
                  Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE ESTOCASTICO EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE ESTOCASTICO EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  ExpertRemove();
                 }
              }
           }
        }

      if(Ver_Indicador_RSI && Bars_>RSI_Periodo+1 && Maximo<Bars_-(RSI_Periodo+1))
        {
         uchar Conteo=0;

         Copy=CopyBuffer(Handle_RSI,0,0,Maximo,RSI_BUFFER);
         while(Copy<=0 && !IsStopped())
           {
            if(Conteo==0)
              {
               Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE RSI EN ",Symbolo," ",EnumToString(TimeFrame));
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL RSI");
              }
            else
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL RSI");

            Conteo++;
            Sleep(1000);
            Copy=CopyBuffer(Handle_RSI,0,0,Maximo,RSI_BUFFER);
            if(Conteo>3)
              {
               int Error=GetLastError();
               if(Copy<=0)
                 {
                  Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE RSI EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE RSI EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  ExpertRemove();
                 }
              }
           }
        }

      if(Ver_Indicador_MACD  && Bars_>Slow_Ema_MACD+Period_MACD+Signal_Period_MACD+1 && Maximo<Bars_-(Slow_Ema_MACD+Period_MACD+Signal_Period_MACD+1))
        {
         uchar Conteo=0;
         Copy=CopyBuffer(Handle_MACD,0,0,Maximo,MACD_BUFFER);
         while(Copy<=0 && !IsStopped())
           {
            if(Conteo==0)
              {
               Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE MACD EN ",Symbolo," ",EnumToString(TimeFrame));
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL MACD");
              }
            else
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL MACD");

            Conteo++;
            Sleep(1000);
            Copy=CopyBuffer(Handle_MACD,0,0,Maximo,MACD_BUFFER);
            if(Conteo>3)
              {
               int Error=GetLastError();
               if(Copy<=0)
                 {
                  Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE MACD EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE MACD EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  ExpertRemove();
                 }
              }
           }
        }


      /*    for(int i=1; i<3; i++)
            {
             if(Columna==17 && Fila==2)
               {
                Print("i ",i," ",Symbolo,"  ",EnumToString(TimeFrame)," ",close[Maximo-1-i],"  RSI ",RSI_BUFFER[i],
                      " EST "" ",ESTOCASTICO_BUFFER[i],"  MACD ",MACD_BUFFER[i]);
               }
            }*/

      //Print(Maximo,"  ",Symbolo,"  ",TimeFrame);
      //Print(RSI_BUFFER[1],"  ",RSI_BUFFER[2],"  ",RSI_BUFFER[3]);


      /*if(TimeFrame==PERIOD_M3 && Symbolo=="NZDUSD")
        {
         Print(Symbolo," high penultimo ",high[Maximo-2]);
         Print(Columna,"  ",Fila);
        }*/
      //if(TimeFrame==PERIOD_H1 && Symbolo=="EURUSD")
      //  Print(Symbolo," RSI penultimo ",RSI_BUFFER[1]);

      string Frase=" ";
      ObjectSetString(0,NombresCuadrosTextos[Fila][Columna],OBJPROP_TEXT,Frase);
      // Print("high  ",ArraySize(high)," low ",ArraySize(low)," close ",ArraySize(close)," time ",ArraySize(time)," RSI ",ArraySize(RSI_BUFFER)," MACD ",ArraySize(MACD_BUFFER)," ESTOCASTICO ",ArraySize(ESTOCASTICO_BUFFER));
      int PrefixTrend=0;

      if(((Tipo_de_Datos==Close_Close && close[Maximo-3]>close[Maximo-2] && close[Maximo-3]>close[Maximo-4]) || (Tipo_de_Datos==High_Low && high[Maximo-3]>high[Maximo-2] && high[Maximo-3]>high[Maximo-4])))
        {
         if(FiltroTraspaso(close,high,low,Maximo-3,false))
           {
            if(Ver_Indicador_RSI && Bars_>RSI_Periodo+1)
               if(Divergencia(0,0,2,PrefixTrend,RSI_BUFFER,0,"RSI",close,high,low,Maximo,time,RSI,Ver_Indicador_RSI_Indicador,Maximo-2,Frase,Symbolo,TimeFrame))
                 {
                  AlertaComentario=AlertaComentario+" - "+Symbolo+" "+Nombres[ArregloGestion[Columna-1]]+" SELL DIVERGENCIA";
                  ObjectSetInteger(0,NombresCuadros[Fila][Columna],OBJPROP_BGCOLOR,Color_Sell);
                  Existen_Divergencias[Fila][Columna]=true;
                  ObjectSetString(0,NombresCuadrosTextos[Fila][Columna],OBJPROP_TEXT,Frase);
                 }
            if(Ver_Indicador_MACD  && Bars_>Slow_Ema_MACD+Period_MACD+Signal_Period_MACD+1)
               if(Divergencia(0,0,2,PrefixTrend,MACD_BUFFER,0,"MACD",close,high,low,Maximo,time,MACD,Ver_Indicador_MACD_Indicador,Maximo-2,Frase,Symbolo,TimeFrame))
                 {
                  AlertaComentario=AlertaComentario+" - "+Symbolo+" "+Nombres[ArregloGestion[Columna-1]]+" SELL DIVERGENCIA";
                  Existen_Divergencias[Fila][Columna]=true;
                  ObjectSetInteger(0,NombresCuadros[Fila][Columna],OBJPROP_BGCOLOR,Color_Sell);
                  ObjectSetString(0,NombresCuadrosTextos[Fila][Columna],OBJPROP_TEXT,Frase);
                 }
            if(Ver_Indicador_ESTOCASTICO && Bars_>K_Periodo+D_Periodo+Slowing+1)
               if(Divergencia(0,0,2,PrefixTrend,ESTOCASTICO_BUFFER,0,"EST",close,high,low,Maximo,time,ESTOCASTICO,Ver_Indicador_ESTOCASTICO_Indicador,Maximo-2,Frase,Symbolo,TimeFrame))
                 {
                  AlertaComentario=AlertaComentario+" - "+Symbolo+" "+Nombres[ArregloGestion[Columna-1]]+" SELL DIVERGENCIA";
                  Existen_Divergencias[Fila][Columna]=true;
                  ObjectSetInteger(0,NombresCuadros[Fila][Columna],OBJPROP_BGCOLOR,Color_Sell);
                  ObjectSetString(0,NombresCuadrosTextos[Fila][Columna],OBJPROP_TEXT,Frase);
                 }
           }

        }
      if(((Tipo_de_Datos==Close_Close && close[Maximo-3]<close[Maximo-2] && close[Maximo-3]<close[Maximo-4]) || (Tipo_de_Datos==High_Low && low[Maximo-3]<low[Maximo-2] && low[Maximo-3]<low[Maximo-4])))
        {
         //Print("Entra");
         if(FiltroTraspaso(close,high,low,Maximo-3,true))
           {
            if(Ver_Indicador_RSI && Bars_>RSI_Periodo)
               if(Divergencia(1,2,0,PrefixTrend,RSI_BUFFER,0,"RSI",close,high,low,Maximo,time,RSI,Ver_Indicador_RSI_Indicador,Maximo-2,Frase,Symbolo,TimeFrame))
                 {
                  AlertaComentario=AlertaComentario+" - "+Symbolo+" "+Nombres[ArregloGestion[Columna-1]]+" BUY DIVERGENCIA";
                  Existen_Divergencias[Fila][Columna]=true;
                  ObjectSetInteger(0,NombresCuadros[Fila][Columna],OBJPROP_BGCOLOR,Color_Buy);
                  ObjectSetString(0,NombresCuadrosTextos[Fila][Columna],OBJPROP_TEXT,Frase);
                 }

            if(Ver_Indicador_MACD && Bars_>Period_MACD)
               if(Divergencia(1,2,0,PrefixTrend,MACD_BUFFER,0,"MACD",close,high,low,Maximo,time,MACD,Ver_Indicador_MACD_Indicador,Maximo-2,Frase,Symbolo,TimeFrame))
                 {
                  AlertaComentario=AlertaComentario+" - "+Symbolo+" "+Nombres[ArregloGestion[Columna-1]]+" BUY DIVERGENCIA";
                  Existen_Divergencias[Fila][Columna]=true;
                  ObjectSetInteger(0,NombresCuadros[Fila][Columna],OBJPROP_BGCOLOR,Color_Buy);
                  ObjectSetString(0,NombresCuadrosTextos[Fila][Columna],OBJPROP_TEXT,Frase);
                 }

            if(Ver_Indicador_ESTOCASTICO && Bars_>K_Periodo)
               if(Divergencia(1,2,0,PrefixTrend,ESTOCASTICO_BUFFER,0,"EST",close,high,low,Maximo,time,ESTOCASTICO,Ver_Indicador_ESTOCASTICO_Indicador,Maximo-2,Frase,Symbolo,TimeFrame))
                 {
                  AlertaComentario=AlertaComentario+" - "+Symbolo+" "+Nombres[ArregloGestion[Columna-1]]+" BUY DIVERGENCIA";
                  Existen_Divergencias[Fila][Columna]=true;
                  ObjectSetInteger(0,NombresCuadros[Fila][Columna],OBJPROP_BGCOLOR,Color_Buy);
                  ObjectSetString(0,NombresCuadrosTextos[Fila][Columna],OBJPROP_TEXT,Frase);
                 }
           }
        }
      ChartRedraw();
     }
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
bool FiltroTraspaso(double const &close[],double const &high[],double const &low[],int shift,bool isBuy)
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
            for(int i=1; i<100 && shift-2>1 ; i++)
              {
               if(close[shift-i]>close[shift-i-1])
                 {
                  double Rango=MathAbs(close[shift-i]-close[shift]);
                  if(Rango/2.0>=MathAbs(close[shift]-close[shift+1]))
                     return true;
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
            for(int i=1; i<100 && shift-2>1 ; i++)
              {
               if(high[shift-i]>high[shift-i-1])
                 {
                  double Rango=MathAbs(high[shift-i]-low[shift]);
                  if(Rango/2.0>=MathAbs(low[shift]-high[shift+1]))
                     return true;
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
            for(int i=1; i<100 && shift-2>1 ; i++)
              {
               if(close[shift-i]<close[shift-i-1])
                 {
                  double Rango=MathAbs(close[shift-i]-close[shift]);
                  if(Rango/2.0>=MathAbs(close[shift]-close[shift+1]))
                     return true;
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
            for(int i=1; i<100 && shift-2>1 ; i++)
              {
               if(low[shift-i]<low[shift-i-1])
                 {
                  double Rango=MathAbs(low[shift-i]-high[shift]);
                  if(Rango/2.0>=MathAbs(high[shift]-low[shift+1]))
                     return true;
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
  }
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
     }



  }
//+------------------------------------------------------------------+
