//+------------------------------------------------------------------+
//|                                                 MI PANEL PRO.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
#resource "\\Indicators\\PATRONES ANTIGUO PERSONALIZED V4.ex5"


enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12am=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

input ENUM_TIMEFRAMES TimeFrameSignal=PERIOD_H2;
input int Filas=10;
input int TamanoCuadroVertical=40;
input int TamanoCuadroHorizontal=80;
input int TamanoLetrasTexto=10;
input color colorFondo=clrBlack;
input color colorTexto=clrWhite;
input color colorBorde=clrWhite;
input color colorTextoResaltado=clrMagenta;
input color colorBuy=clrGreen;
input color colorSell=clrRed;
input string Settings_Condiciones_Patron="======= Settings CONDICIONES PATRON ===========================================";//==========================================================================================
input int VelasEvaluadas=3;// Velas Historial
input int Testeado=1;// Sop o Res, Fuerza Mayor a...
input bool Repintado=false;
input int Tolerancia_Puntos_Flecha=0;
input string S1__="=====================  Configuracion SOP RES ===========================================";//==========================================================================================
input int BackLimit=200;
input double zone_fuzzfactor=0.75;
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
input bool Viernes=false;
input string S113__="==== CONFIGURACION PERIODOS ============================================";//===============================================================================================
input bool M5=true;
input bool M6=true;
input bool M10=true;
input bool M12=true;
input bool M15=true;
input bool M20=true;
input bool M30=true;
input bool H1=true;
input bool H2=false;
input bool H3=false;
input bool H4=false;
input string S16_="================ CONFIGURACION FILTRO SOP RES CURRENT TIMEFRAME ============================================";//======================================================================
input bool FiltroSopResCURRENTTIMEFRAMES=true;
input double zone_fuzzfactor2=0.50;
input int BackLimit2=100;
input int FuerzaSop=0;
input int Cantidad_Coincidencias=2;
input bool Period_M5=false;//M5
input bool Period_M6=false;//M6
input bool Period_M10=false;//M10
input bool Period_M12=false;//M12
input bool Period_M15=true;//M15
input bool Period_M20=false;//M20
input bool Period_M30=true;//M30
input bool Period_H1=true;//H1
input bool Period_H2=true;//H2
input bool Period_H3=false;//H3
input bool Period_H4=false;//H4
input bool Period_H6=false;//H6
input bool Period_H8=false;//H8
input string Settings_Alerts="======================  Settings ALERTAS ============================================ ";//=================================================================
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;
input string conectors="=========================  Settings Conector ============================================ ";//=================================================================
input bool Conector=false;


string Bases[10]= {"USD","CAD","NZD","GBP","CHF","JPY","XAU","AUD","EUR","XAG"};

string Simbolos[];
int Handles[];
int Barras[];
string NombresCuadros[];
int SizeGlobal;
string NombreCuadro="CUADROS 2000 ";
string NombreCuadroAnterior="";

#resource "\\Indicators\\PROBANDO INDICADOR.ex5"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   NombreCuadroAnterior="";

   if(!RegistrarSimbolo(Simbolos))
      return INIT_FAILED;
   SizeGlobal=ArraySize(Simbolos);

   ArrayResize(Handles,SizeGlobal);
   ArrayResize(Barras,SizeGlobal);
   ArrayResize(NombresCuadros,SizeGlobal);

   ArrayInitialize(Barras,0);
   ArrayInitialize(Handles,0);

   InicializarHandles(Handles);

   CrearCuadros();


//---
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // identificador de evento
                  const long& lparam,   // parámetro de evento del tipo long
                  const double& dparam, // parámetro de evento del tipo double
                  const string& sparam  // parámetro de evento del tipo string
                 )
  {


   if(id==1)
     {
      if(StringFind(sparam,NombreCuadro,0)!=-1)
        {
         string Subs=StringSubstr(sparam,13,-1);

         if(Subs!=NombreCuadroAnterior)
           {
            if(ObjectFind(0,NombreCuadroAnterior)==0)
               ObjectSetInteger(0,NombreCuadroAnterior,OBJPROP_COLOR,colorTexto);

            NombreCuadroAnterior=sparam;

            ObjectSetInteger(0,NombreCuadroAnterior,OBJPROP_COLOR,colorTextoResaltado);

            long currChart=ChartFirst();
            int i=0,limit=100;
            while(i<limit)// seguramente no tenemos más de 100 gráficos abiertos
              {
               if(currChart<0)
                  break;          // hemos llegado al final de la lista de gráficos

               if(ChartID()!=currChart)
                  ChartSetSymbolPeriod(currChart,Subs,ChartPeriod(currChart));

               currChart=ChartNext(currChart);
               i++;// no olvidemos aumentar el contador
              }
           }
        }
     }



  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   for(int i=0; i<SizeGlobal; i++)
      IndicatorRelease(Handles[i]);

   ObjectsDeleteAll(0,NombreCuadro,0,OBJ_EDIT);

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {


   string messageAlerta="";

   for(int i=0; i<SizeGlobal; i++)
     {
      int Bar=iBars(Simbolos[i],TimeFrameSignal);

      if(Bar!=Barras[i])
        {
         double UP[];
         double DN[];

         if(BarsCalculated(Handles[i])!=Bar)
            continue;

         if(CopyBuffer(Handles[i],1,0,3,UP)<=0)
            continue;

         if(CopyBuffer(Handles[i],0,0,3,DN)<=0)
            continue;

         if(UP[1]!=EMPTY_VALUE)
           {
            ObjectSetInteger(0,NombresCuadros[i],OBJPROP_BGCOLOR,colorBuy);
            if(Barras[i]!=0)
               messageAlerta+=Simbolos[i]+" BUY - ";
               
             //  Print(UP[0]," BUY ",Simbolos[i]);
              // Print(UP[1]," BUY ",Simbolos[i]);
              // Print(UP[2]," BUY ",Simbolos[i]);
           }
         else
            if(DN[1]!=EMPTY_VALUE)
              {
               ObjectSetInteger(0,NombresCuadros[i],OBJPROP_BGCOLOR,colorSell);
               if(Barras[i]!=0)
                  messageAlerta+=Simbolos[i]+" SELL - ";
                //   Print(DN[0]," SELL ",Simbolos[i]);
                 //  Print(DN[1]," SELL ",Simbolos[i]);
                 //  Print(DN[2]," SELL ",Simbolos[i]);
              }
            else
              {
               ObjectSetInteger(0,NombresCuadros[i],OBJPROP_BGCOLOR,colorFondo);
              }
         Barras[i]=Bar;
        }
     }

   if(messageAlerta!="")
      Alertas(messageAlerta);

  }
//+------------------------------------------------------------------+
bool RegistrarSimbolo(string &ArraySymbolos[])
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
        // Print(Par1," ",Par2);

         for(int j=0; j<10; j++)
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
void InicializarHandles(int &handels[])
  {

   for(int i=0; i<SizeGlobal; i++)
     {
      handels[i]=iCustom(Simbolos[i],TimeFrameSignal,"::Indicators\\PROBANDO INDICADOR.ex5",
                         Settings_Condiciones_Patron,
                         VelasEvaluadas,
                         Testeado,
                         Repintado,
                         Tolerancia_Puntos_Flecha,
                         S1__,
                         BackLimit,
                         zone_fuzzfactor,
                         S111__,
                         trendPeriod,
                         TriggerUp,
                         TriggerDown,
                         Settings_Horario,
                         Hora_Inicio,
                         Hora_Final,
                         Domingo,
                         Lunes,
                         Martes,
                         Miercoles,
                         Jueves,
                         Viernes,
                         S113__,
                         M5,
                         M6,
                         M10,
                         M12,
                         M15,
                         M20,
                         M30,
                         H1,
                         H2,
                         H3,
                         H4,
                         S16_,
                         FiltroSopResCURRENTTIMEFRAMES,
                         zone_fuzzfactor2,
                         BackLimit2,
                         FuerzaSop,
                         Cantidad_Coincidencias,
                         Period_M5,
                         Period_M6,
                         Period_M10,
                         Period_M12,
                         Period_M15,
                         Period_M20,
                         Period_M30,
                         Period_H1,
                         Period_H2,
                         Period_H3,
                         Period_H4,
                         Period_H6,
                         Period_H8,
                         Settings_Alerts,
                         false,
                         false,
                         false,
                         conectors,
                         Conector);

     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CrearCuadros()
  {

   for(int i=0; i<SizeGlobal; i++)
     {
      NombresCuadros[i]=NombreCuadro+Simbolos[i];
      int X=10+int(i/Filas)*TamanoCuadroHorizontal-int(i/Filas);
      int Y=10+(i%Filas)*TamanoCuadroVertical-int(i%Filas);
      EditCreate(0,NombresCuadros[i],0,X,Y,TamanoCuadroHorizontal,TamanoCuadroVertical,Simbolos[i],"Arial",TamanoLetrasTexto,ALIGN_CENTER,true,CORNER_LEFT_UPPER,colorTexto,colorFondo,colorBorde,false,false,true,0);
     }

   ChartRedraw();
  }

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
void Alertas(string Frase)
  {

   if(AlertPC)
      Alert(Frase," en ",EnumToString((ENUM_TIMEFRAMES)TimeFrameSignal));
   if(AlertMovil)
      SendNotification(Frase+" en "+EnumToString((ENUM_TIMEFRAMES)TimeFrameSignal));
   if(AlertMail)
      SendMail("Signal Personalizrd "+EnumToString((ENUM_TIMEFRAMES)TimeFrameSignal),Frase+" en "+EnumToString((ENUM_TIMEFRAMES)TimeFrameSignal));
  }
//+------------------------------------------------------------------+
