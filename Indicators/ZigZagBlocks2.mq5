//+------------------------------------------------------------------+
//|                                                ZigZagBlocks2.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright " Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property indicator_chart_window
#property indicator_plots 0

/////////////////// AÑO.MES.DIA HORA:MINUTO///////////////////
datetime UNTIL=D'2022.10.30 00:00';
double CuentasCompartidas[1]= {61107549};

////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

///LUEGO LO COMPILAS, UNA VEZ COMPILADO LE MANDAS SOLO EL ARCHIVO .ex5 No mandes el archivo .mq5

////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

/////////////////////////TU CUENTA///////////////////////////////
////////////////////////////////////////////////////////////////////////
double Cuentas[1]= {61107549};
////////////////////////////////////////////////////////////////////////

struct Nombre_Cuadros
  {
   string            Nombre;
   bool              isUP;
   datetime          TiempoInicial;
  };

struct Nombre_Cuadros_Delete
  {
   ENUM_TIMEFRAMES   Periodo;
   string            Nombre[];
  };

int password_status=-1;
datetime TiempoCarga=0;
bool TiempoExcedidoVerificacion=false;
bool VerificacionCuenta=false;


input int EsperaLineaBarras=4;//Espera para definir BOS CHOCH
input int SemanasMaximas=7;//Duracion Cuadros en Semanas
input string s0 = "==== ALERTAS ====";//==========
input bool AlertPC=false;     // Alert PC
input bool AlertMovil=false;  // Alert Movil
input bool AlertMail=false;   // Alert Mail
input string S12="==== CONFIGURACION TENDENCIAS ====";//==========
input bool M1_=true;
input bool M5_=false;
input bool M15_=true;
input bool M30_=false;
input bool H1_=false;
input bool H4_=false;
input bool D1_=false;
input bool W1_=false;
input bool MN1_=false;
input string s0_ = "==== TIPOS ALERTAS ====";//==========
input bool AlertaConfirmacion=false; // Alerta Confirmacion
input bool AlertaCambio=true;// Alerta Cambio
input string s1 = "====TEMPORALIDAD M1====";//==========
input int InpDepth_M1=4;     // Depth
input int InpDeviation_M1=5;  // Deviation
input int InpBackstep_M1=1;   // Backstep
input string s2 = "====TEMPORALIDAD M5====";//==========
input int InpDepth_M5=4;     // Depth
input int InpDeviation_M5=5;  // Deviation
input int InpBackstep_M5=3;   // Backstep
input string s2_ = "====TEMPORALIDAD M15====";//==========
input int InpDepth_M15=4;     // Depth
input int InpDeviation_M15=5;  // Deviation
input int InpBackstep_M15=3;   // Backstep
input string s3_ = "====TEMPORALIDAD M30====";//==========
input int InpDepth_M30=4;     // Depth
input int InpDeviation_M30=5;  // Deviation
input int InpBackstep_M30=3;   // Backstep
input string s3 = "====TEMPORALIDAD H1====";//==========
input int InpDepth_H1=4;     // Depth
input int InpDeviation_H1=5;  // Deviation
input int InpBackstep_H1=3;   // Backstep
input string s4 = "====TEMPORALIDAD H4====";//==========
input int InpDepth_H4=4;     // Depth
input int InpDeviation_H4=5;  // Deviation
input int InpBackstep_H4=3;   // Backstep
input string s4_ = "====TEMPORALIDAD D1====";//==========
input int InpDepth_D1=4;     // Depth
input int InpDeviation_D1=5;  // Deviation
input int InpBackstep_D1=3;   // Backstep
input string s5 = "====TEMPORALIDAD SEMANAL====";//==========
input int InpDepth_W1=4;     // Depth
input int InpDeviation_W1=5;  // Deviation
input int InpBackstep_W1=3;   // Backstep
input string s6 = "====TEMPORALIDAD MENSUAL====";//==========
input int InpDepth_MN1=4;     // Depth
input int InpDeviation_MN1=5;  // Deviation
input int InpBackstep_MN1=3;   // Backstep
input string S1="------------------ SETTING BUTTON ------------------";//-----------------------
input ENUM_BASE_CORNER CORNER_BOTON=CORNER_LEFT_UPPER;
input int Boton_Desplazamiento_X=40;//Position X
input int Boton_Desplazamiento_Y=40;//Position Y
input int Ancho_Botones=30;//Width Buttons Partial
input int Altura_Botones=20;//Height Buttons
input int Boton_Size_Text=8;//Font Size Button (Text)
input string S5="------------------ SETTING COLOR LINES ------------------";//-----------------------
input color Color_M1=clrAqua;
input color Color_M5=clrMagenta;
input color Color_M15=clrOrange;
input color Color_M30=clrDeepPink;
input color Color_H1=clrYellow;
input color Color_H4=clrAquamarine;
input color Color_D1=clrMidnightBlue;
input color Color_W1=clrMediumSpringGreen;
input color Color_MN1=clrRed;
input ENUM_LINE_STYLE EstiloLineasCHOCHBOS=STYLE_DASHDOT;
input int SizeTexto=10;
input string S6="------------------ SETTING AREA ------------------";//-----------------------
input bool Show_Areas=true;
input bool Extender_Cuadros=true;
input uint Grosor=2;
input bool ColorFondo=false;

bool Inicio[9];


string EDIT_NOMBRE[9]= {"EDIT NOMBRE 2021 M1","EDIT NOMBRE 2021 M5","EDIT NOMBRE 2021 M15","EDIT NOMBRE 2021 M30","EDIT NOMBRE 2021 H1","EDIT NOMBRE 2021 H4","EDIT NOMBRE 2021 D1","EDIT NOMBRE 2021 W1","EDIT NOMBRE 2021 MN1"};
string EDIT_NOMBRE_STRING[9]= {"M1","M5","M15","M30","H1","H4","D1","W1","MN1"};
bool Alertas_Bool_IsAlcista[9]= {false,false,false,false,false,false,false,false,false};
Nombre_Cuadros_Delete Cuadros_Delete[9];

int Espacio=5;
datetime TimeLast=0;
bool Valido=false;

string Identation="TREND 2021 MAX MIN ";
string Rectangulo_="RECTANGULO TREND 2021 MAX MIN ";


ENUM_TIMEFRAMES Periodos[9]= {PERIOD_M1,PERIOD_M5,PERIOD_M15,PERIOD_M30,PERIOD_H1,PERIOD_H4,PERIOD_D1,PERIOD_W1,PERIOD_MN1};
int IndiceStarts[9]= {0,0,0,0,0,0,0,0,0};
int InpDepths[9];
int InpDeviations[9];
int InpBacksteps[9];
double ValorHighs[9];
double ValorLows[9];
string Prefijo[9]= {"M1","M5","M15","M30","H1","H4","D1","W1","MN1"};
color Color[9];
Nombre_Cuadros CuadrosT[9];
int ArregloGestion[9];
int Tendencias=0;
bool InicioT=false;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
  
  if(TimeCurrent()>UNTIL){
  Alert("Tiempo prueba finalizo el dia ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
  return INIT_FAILED;  
  }
  
   Tendencias=0;
   GestionarColumnas();

   for(int i=0; i<Tendencias; i++)
      ArrayResize(Cuadros_Delete[ArregloGestion[i]].Nombre,0);

   int Carga=0;
   TiempoExcedidoVerificacion=false;
   VerificacionCuenta=false;
   TiempoCarga=TimeCurrent()+120;

   string broker = AccountInfoString(ACCOUNT_COMPANY);
   long account = AccountInfoInteger(ACCOUNT_LOGIN);

   /*
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
            Print("Cuenta no habilitada");
            Comment("Cuenta no habilitada");
           }
         else
           {
            Comment(" - Licencia provista por EAD hasta ",UNTIL);
           }
        }
      else
        {
         Comment("CUENTA VERIFICADA// TIEMPO ILIMITADO");
        }
   */

   int Low_=0;
   uchar Righ=0;
   int Righ_Desplazamiento=0;
   if(CORNER_BOTON==CORNER_LEFT_LOWER)
     {
      Low_=Altura_Botones; // Low_=4;
     }
   if(CORNER_BOTON==CORNER_RIGHT_UPPER)
     {
      Righ_Desplazamiento=Ancho_Botones;
      Righ=5;
     }
   if(CORNER_BOTON==CORNER_RIGHT_LOWER)
     {
      Righ_Desplazamiento=Ancho_Botones;
      Low_=Altura_Botones; // Low_=4;
      Righ=5;
     } //Desplace1 y Desplace tamaño de Ancho de Cada Boton

   for(int i=0; i<Tendencias; i++)
     {
      if(ObjectFind(0,EDIT_NOMBRE[ArregloGestion[i]])!=0)
         EditCreate(0,EDIT_NOMBRE[ArregloGestion[i]],0,Righ_Desplazamiento+Boton_Desplazamiento_X+(Espacio+Ancho_Botones)*(MathAbs(Righ-i)),Boton_Desplazamiento_Y+Low_,Ancho_Botones,Altura_Botones,EDIT_NOMBRE_STRING[ArregloGestion[i]],"Arial",Boton_Size_Text,ALIGN_CENTER,true,CORNER_BOTON,clrWhite,clrGray,clrNONE,false,false,true,0);

      if(!ActualizarDatos(Symbol(),Periodos[ArregloGestion[i]]))
         return INIT_FAILED;

     }

   IgualarValores();
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
//if(!ControlCuenta())
// return rates_total;

   if(UNTIL>TimeCurrent())
     {
      Comment("Tiempo prueba hasta ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
     }
   else
     {
      Comment("Tiempo prueba termino el dia ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
      return rates_total;
     }


   for(int i=0; i<Tendencias; i++)
     {
      if(!ActualizarDatos(Symbol(),Periodos[ArregloGestion[i]]))
         return rates_total;
     }

   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(time,true);
   ArraySetAsSeries(close,true);

   Control_Cuadros_Lineas_Text(rates_total,prev_calculated,close,time);

// static datetime prevtime=0;
   FuncionTendencias(time,high,low,close);

   InicioT=true;
//--- return value of prev_calculated for next call
   return(rates_total);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DibujarLinea(int IndiceHigh,double ValorHigh,int IndiceLow,double ValorLow,string Frase,color Color_Trend,ENUM_TIMEFRAMES Periodo)
  {
   int VelasSeparacionmin=0;
   int VelasSeparacionmax=0;

   string AgregadoMin="";
   string AgregadoMax="";

   int StringLen_=StringLen(Frase);
   uchar indice=StringLen_==27?2:3;
   string Temporalidad=StringSubstr(Frase,19,indice);

   bool TemporalidadesMin[8]= {false,false,false,false,false,false,false,false};
   bool TemporalidadesMax[8]= {false,false,false,false,false,false,false,false};

   for(int i=0; i<Tendencias-1; i++)
     {
      if(ValorLow==ValorLows[ArregloGestion[i]])
         TemporalidadesMin[ArregloGestion[i]]=true;

      if(ValorHigh==ValorHighs[ArregloGestion[i]])
         TemporalidadesMax[ArregloGestion[i]]=true;
     }

   for(int i=1; i<Tendencias; i++)
     {
      if(Temporalidad==Prefijo[ArregloGestion[i]])
        {
         for(int j=0; j<i; j++)
           {
            if(TemporalidadesMax[ArregloGestion[j]]==true)
               VelasSeparacionmax=VelasSeparacionmax+13+((ArregloGestion[j]==2 || ArregloGestion[j]==3)?1:0);
            if(TemporalidadesMin[ArregloGestion[j]]==true)
               VelasSeparacionmin=VelasSeparacionmin+13+((ArregloGestion[j]==2 || ArregloGestion[j]==3)?1:0);
           }
         break;
        }
     }

   for(int i=0; i<VelasSeparacionmin; i++)
      AgregadoMin=AgregadoMin+" ";

   for(int i=0; i<VelasSeparacionmax; i++)
      AgregadoMax=AgregadoMax+" ";


   if(ObjectFind(0,Frase+"MIN")!=0)
     {
      datetime TiempoLow=iTime(Symbol(),Periodo,IndiceLow);
      int Indice=iBarShift(Symbol(),Period(),TiempoLow,false);
      EncontrarIndice(Indice,ValorLow,false);
      TiempoLow=iTime(Symbol(),Period(),Indice);
      TrendCreate(0,Frase+"MIN",0,TiempoLow,ValorLow,TiempoLow+PeriodSeconds(Period())*1,ValorLow,Color_Trend,STYLE_SOLID,1,false,false,true,true,0);
     }
   else
     {
      datetime TiempoLow=iTime(Symbol(),Periodo,IndiceLow);
      int Indice=iBarShift(Symbol(),Period(),TiempoLow,false);
      EncontrarIndice(Indice,ValorLow,false);
      TiempoLow=iTime(Symbol(),Period(),Indice);
      ObjectMove(0,Frase+"MIN",0,TiempoLow,ValorLow);
      ObjectMove(0,Frase+"MIN",1,TiempoLow+PeriodSeconds(Period())*1,ValorLow);
     }

   if(ObjectFind(0,Frase+"MAX")!=0)
     {
      datetime TiempoHigh=iTime(Symbol(),Periodo,IndiceHigh);
      int Indice=iBarShift(Symbol(),Period(),TiempoHigh,false);
      EncontrarIndice(Indice,ValorHigh,true);
      TiempoHigh=iTime(Symbol(),Period(),Indice);
      TrendCreate(0,Frase+"MAX",0,TiempoHigh,ValorHigh,TiempoHigh+PeriodSeconds(Period())*1,ValorHigh,Color_Trend,STYLE_SOLID,1,false,false,true,true,0);
     }
   else
     {
      datetime TiempoHigh=iTime(Symbol(),Periodo,IndiceHigh);
      int Indice=iBarShift(Symbol(),Period(),TiempoHigh,false);
      EncontrarIndice(Indice,ValorHigh,true);
      TiempoHigh=iTime(Symbol(),Period(),Indice);
      ObjectMove(0,Frase+"MAX",0,TiempoHigh,ValorHigh);
      ObjectMove(0,Frase+"MAX",1,TiempoHigh+PeriodSeconds(Period())*1,ValorHigh);
     }


   if(ObjectFind(0,Frase+"MIN"+"TEXT")!=0)
     {
      datetime TiempoLow=iTime(Symbol(),Periodo,IndiceLow);
      int Indice=iBarShift(Symbol(),Period(),TiempoLow,false);
      EncontrarIndice(Indice,ValorLow,false);
      TiempoLow=iTime(Symbol(),Period(),Indice);
      TextCreate(0,Frase+"MIN"+"TEXT",0,TiempoLow,ValorLow,AgregadoMin+"MIN "+Temporalidad,"Arial",SizeTexto,Color_Trend,0,ANCHOR_LEFT_UPPER,false,false,true,0);
     }
   else
     {
      datetime TiempoLow=iTime(Symbol(),Periodo,IndiceLow);
      int Indice=iBarShift(Symbol(),Period(),TiempoLow,false);
      EncontrarIndice(Indice,ValorLow,false);
      TiempoLow=iTime(Symbol(),Period(),Indice);
      ObjectMove(0,Frase+"MIN"+"TEXT",0,TiempoLow,ValorLow);
      ObjectSetString(0,Frase+"MIN"+"TEXT",OBJPROP_TEXT,AgregadoMin+"MIN "+Temporalidad);
     }

   if(ObjectFind(0,Frase+"MAX"+"TEXT")!=0)
     {
      datetime TiempoHigh=iTime(Symbol(),PERIOD_M1,IndiceHigh);
      int Indice=iBarShift(Symbol(),Period(),TiempoHigh,false);
      EncontrarIndice(Indice,ValorHigh,true);
      TiempoHigh=iTime(Symbol(),Period(),Indice);
      TextCreate(0,Frase+"MAX"+"TEXT",0,TiempoHigh,ValorHigh,AgregadoMax+"MAX "+Temporalidad,"Arial",SizeTexto,Color_Trend,0,ANCHOR_LEFT_LOWER,false,false,true,0);
     }
   else
     {
      datetime TiempoHigh=iTime(Symbol(),Periodo,IndiceHigh);
      int Indice=iBarShift(Symbol(),Period(),TiempoHigh,false);
      EncontrarIndice(Indice,ValorHigh,true);
      TiempoHigh=iTime(Symbol(),Period(),Indice);
      ObjectMove(0,Frase+"MAX"+"TEXT",0,TiempoHigh,ValorHigh);
      ObjectSetString(0,Frase+"MAX"+"TEXT",OBJPROP_TEXT,AgregadoMax+"MAX "+Temporalidad);
     }
   ChartRedraw();
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Comment("");
   ObjectsDeleteAll(0,"EDIT NOMBRE 2021",0,OBJ_EDIT);
   ObjectsDeleteAll(0,Identation,0,OBJ_TREND);
   ObjectsDeleteAll(0,Identation,0,OBJ_TEXT);
   ObjectsDeleteAll(0,"L"+Identation,0,OBJ_TEXT);
   ObjectsDeleteAll(0,"L"+Identation,0,OBJ_TEXT);
   ObjectsDeleteAll(0,Rectangulo_,0,OBJ_RECTANGLE);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double ZigZagValor(int Indice_ArraySeries_true,int rates_total,int InpDepth,int InpDeviation,int InpBackstep,ENUM_TIMEFRAMES Periodo)
  {
   double ZZArray[];

   int Indicador=iCustom(Symbol(),Periodo,"Examples\\ZigZag",InpDepth,InpDeviation,InpBackstep);  // Registro del máximo del ZigZag

   if(CopyBuffer(Indicador,0,rates_total-1-(Indice_ArraySeries_true),1,ZZArray)<=0)
      return 0;

   double ZZ=ZZArray[0];

   return ZZ;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double BuscarZigZag(int Indice_ArraySeries_true,int rates_total,int InpDepth,int InpDeviation,int InpBackstep,int &Indice,ENUM_TIMEFRAMES Periodo)
  {
   for(int i=Indice_ArraySeries_true-1; i>0; i--)
     {

      double ZZArray[];

      int Indicador=iCustom(Symbol(),Periodo,"Examples\\ZigZag",InpDepth,InpDeviation,InpBackstep);  // Registro del máximo del ZigZag

      if(CopyBuffer(Indicador,0,rates_total-1-(i),1,ZZArray)<=0)
         return 0;

      double ZZ=ZZArray[0];


      if(ZZ!=EMPTY_VALUE && ZZ!=0)
        {
         Indice=rates_total-1-i;
         // Comment(iHigh(NULL,Periodo,rates_total-1-(i)),"     ",iLow(NULL,Periodo,rates_total-1-(i)));
         return ZZ;
        }
     }
   return 0;
  }


//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Objetivos(string Symbolo,ENUM_TIMEFRAMES TimeFrame,double &Minimo,double &Maximo,int Periodo_ZZ,int Deviation,int Backstep,int &IndiceStart)
  {
   int Bars_=iBars(Symbolo,TimeFrame);

   double ValorPrimero=0;
   double ValorSegundo=0;
   bool Valor=false;
   double ZZ[];
   ArraySetAsSeries(ZZ,true);

   int Indicador=iCustom(Symbolo,TimeFrame,"Examples\\ZigZag",Periodo_ZZ,Deviation,Backstep);  // Registro del máximo del ZigZag

   int MaximoZZ=MathMin(Bars_-3,1000);

   if(CopyBuffer(Indicador,0,0,MaximoZZ,ZZ)<=0)
      return false;

   for(int i=0; i<MaximoZZ; i++)
     {
      double Indicador_ZigZag=ZZ[i];

      if(Indicador_ZigZag!=EMPTY_VALUE && Indicador_ZigZag!=0)
        {
         if(Valor==false)
            Valor=true;
         else
            if(ValorPrimero==0)
              {
               IndiceStart=i;
               ValorPrimero=Indicador_ZigZag;
              }
            else
               if(ValorPrimero!=0)
                 {
                  ValorSegundo=Indicador_ZigZag;

                  if(ValorSegundo>ValorPrimero)
                    {
                     Maximo=ValorSegundo;
                     Minimo=ValorPrimero;
                    }
                  else
                    {
                     Minimo=ValorSegundo;
                     Maximo=ValorPrimero;
                    }
                  break;
                 }
        }

     }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
bool EditCreate(const long             chart_ID=0,               // chart's ID
                const string           name="Edit",              // object name
                const int              sub_window=0,             // subwindow index
                const int              x=0,                      // X coordinate
                const int              y=0,                      // Y coordinate
                const int              width=50,                 // width
                const int              height=18,                // height
                const string           text="Text",              // text
                const string           font="Arial",             // font
                const int              font_size=10,             // font size
                const ENUM_ALIGN_MODE  align=ALIGN_CENTER,       // alignment type
                const bool             read_only=false,          // ability to edit
                const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                const color            clr=clrBlack,             // text color
                const color            back_clr=clrWhite,        // background color
                const color            border_clr=clrNONE,       // border color
                const bool             back=false,               // in the background
                const bool             selection=false,          // highlight to move
                const bool             hidden=true,              // hidden in the object list
                const long             z_order=0)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create edit field
   if(!ObjectCreate(chart_ID,name,OBJ_EDIT,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": failed to create \"Edit\" object! Error code = Error",(GetLastError()));
      return(false);
     }
//--- set object coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set object size
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- set the text
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- set text font
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- set font size
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- set the type of text alignment in the object
   ObjectSetInteger(chart_ID,name,OBJPROP_ALIGN,align);
//--- enable (true) or cancel (false) read-only mode
   ObjectSetInteger(chart_ID,name,OBJPROP_READONLY,read_only);
//--- set the chart's corner, relative to which object coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set text color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set background color
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- set border color
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
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
bool ActualizarDatos(string Simbolo,ENUM_TIMEFRAMES TimeFrames)
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
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE ",Simbolo," ",EnumToString(TimeFrames),"  Cod ",Error);
            return false;
           }
        }
     }

   return true;
//Print("Z2");
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool TrendCreate(const long            chart_ID=0,        // chart's ID
                 const string          name="TrendLine",  // line name
                 const int             sub_window=0,      // subwindow index
                 datetime              time1=0,           // first point time
                 double                price1=0,          // first point price
                 datetime              time2=0,           // second point time
                 double                price2=0,          // second point price
                 const color           clr=clrRed,        // line color
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // line style
                 const int             width=1,           // line width
                 const bool            back=false,        // in the background
                 const bool            selection=true,    // highlight to move
                 const bool            ray_right=false,   // line's continuation to the right
                 const bool            hidden=true,       // hidden in the object list
                 const long            z_order=0)         // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create a trend line by the given coordinates
   if(!ObjectCreate(chart_ID,name,OBJ_TREND,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": failed to create a trend line! Error code = ",GetLastError());
      return(false);
     }
//--- set line color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set line display style
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- set line width
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of moving the line by mouse
//--- when creating a graphical object using ObjectCreate function, the object cannot be
//--- highlighted and moved by default. Inside this method, selection parameter
//--- is true by default making it possible to highlight and move the object
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- enable (true) or disable (false) the mode of continuation of the line's display to the right
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right);
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
bool TextCreate(const long              chart_ID=0,               // chart's ID
                const string            name="Text",              // object name
                const int               sub_window=0,             // subwindow index
                datetime                time=0,                   // anchor point time
                double                  price=0,                  // anchor point price
                const string            text="Text",              // the text itself
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
//--- set anchor point coordinates if they are not set
//--- reset the error value
   ResetLastError();
//--- create Text object
   if(!ObjectCreate(chart_ID,name,OBJ_TEXT,sub_window,time,price))
     {
      Print(__FUNCTION__,
            ": failed to create \"Text\" object! Error code = ",GetLastError());
      return(false);
     }
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
//--- enable (true) or disable (false) the mode of moving the object by mouse
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
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Alertas(string Periodo,string Tendencia,bool IsBuyAnterior)
  {

   string TipoTendencia=(IsBuyAnterior)?(Tendencia=="Alcista"?"Confirmacion":"Cambio"):(Tendencia=="Bajista"?"Confirmacion":"Cambio");

   if((TipoTendencia=="Confirmacion" && AlertaConfirmacion) || (TipoTendencia=="Cambio" && AlertaCambio))
      if(InicioT)
        {
         if(AlertPC)
            Alert(TipoTendencia," Tendencia "+Tendencia+" en "+Periodo+" en "+Symbol());
         if(AlertMovil)
            SendNotification(TipoTendencia+" Tendencia "+Tendencia+" en "+Periodo+" en "+Symbol());
         if(AlertMail)
            SendMail(TipoTendencia+" Tendencia "+Tendencia+" en "+Periodo+" en "+Symbol(),TipoTendencia+" Tendencia "+Tendencia+" en "+Periodo+" en "+Symbol());
        }
  }
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



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CrearRectangulo(datetime Tiempo,string Frase,color ColorA,ENUM_TIMEFRAMES Periodo,Nombre_Cuadros &Cuadros)
  {
   if(Show_Areas)
     {
      Cuadros.Nombre=Rectangulo_+Frase+" ";

      int Indice=iBarShift(Symbol(),Periodo,Tiempo,true);
      double High_=iHigh(Symbol(),Periodo,Indice);
      double Low_=iLow(Symbol(),Periodo,Indice);

      Indice=iBarShift(Symbol(),Period(),Tiempo,true);

      datetime TiempoIncial=iTime(Symbol(),Period(),Indice);


      //Print(TimeToString(Tiempo,TIME_DATE|TIME_MINUTES));
      //Print(Indice);

      if(ObjectFind(0,Rectangulo_+Frase)!=0)
        {
         RectangleCreate(0,Rectangulo_+Frase,0,TiempoIncial,High_,TimeCurrent(),Low_,ColorA,STYLE_SOLID,Grosor,ColorFondo,false,false,true,0,ColorA);
        }
      else
        {
         ObjectMove(0,Rectangulo_+Frase,0,TiempoIncial,High_);
         ObjectMove(0,Rectangulo_+Frase,1,TimeCurrent()+PeriodSeconds(Period())*1,Low_);
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CrearRectangulo2(datetime Tiempo,string Frase,color ColorA,ENUM_TIMEFRAMES Periodo,Nombre_Cuadros &Cuadros,string NOMBRECUADRO)
  {
   if(Show_Areas)
     {
      int Indice=iBarShift(Symbol(),Periodo,Tiempo,true);
      double High_=iHigh(Symbol(),Periodo,Indice);
      double Low_=iLow(Symbol(),Periodo,Indice);

      Indice=iBarShift(Symbol(),Period(),Tiempo,true);
      datetime TiempoIncial=iTime(Symbol(),Period(),Indice);


      if(TiempoIncial!=Cuadros.TiempoInicial)
        {
         Cuadros.TiempoInicial=TiempoIncial;
         Cuadros.Nombre=NOMBRECUADRO;
         //Print(TimeToString(Tiempo,TIME_DATE|TIME_MINUTES));
         //Print(Indice);

         if(ObjectFind(0,NOMBRECUADRO)!=0)
           {
            RectangleCreate(0,NOMBRECUADRO,0,TiempoIncial,High_,TimeCurrent(),Low_,ColorA,STYLE_SOLID,Grosor,ColorFondo,false,false,true,0,ColorA);
           }
         else
           {
            ObjectMove(0,NOMBRECUADRO,0,TiempoIncial,High_);
            ObjectMove(0,NOMBRECUADRO,1,TimeCurrent()+PeriodSeconds(Period())*1,Low_);
           }
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RectangleCreate(const long            chart_ID=0,        // chart's ID
                     const string          name="Rectangle",  // rectangle name
                     const int             sub_window=0,      // subwindow index
                     datetime              time1=0,           // first point time
                     double                price1=0,          // first point price
                     datetime              time2=0,           // second point time
                     double                price2=0,          // second point price
                     const color           clr=clrRed,        // rectangle color
                     const ENUM_LINE_STYLE style=STYLE_SOLID, // style of rectangle lines
                     const int             width=1,           // width of rectangle lines
                     const bool            fill=false,        // filling rectangle with color
                     const bool            back=false,        // in the background
                     const bool            selection=true,    // highlight to move
                     const bool            hidden=true,       // hidden in the object list
                     const long            z_order=0,        // priority for mouse click
                     const color            BGColor=clrRed)         // priority for mouse click
  {
//--- set anchor points' coordinates if they are not set
//--- reset the error value
   ResetLastError();
//--- create a rectangle by the given coordinates
   if(!ObjectCreate(chart_ID,name,OBJ_RECTANGLE,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": failed to create a rectangle! Error code = ",GetLastError());
      return(false);
     }
//--- set rectangle color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set the style of rectangle lines
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- set width of the rectangle lines
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- enable (true) or disable (false) the mode of filling the rectangle
   ObjectSetInteger(chart_ID,name,OBJPROP_FILL,fill);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of highlighting the rectangle for moving
//--- when creating a graphical object using ObjectCreate function, the object cannot be
//--- highlighted and moved by default. Inside this method, selection parameter
//--- is true by default making it possible to highlight and move the object
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- hide (true) or display (false) graphical object name in the object list
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- set the priority for receiving the event of a mouse click in the chart
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);

   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,BGColor);
//--- successful execution
   return(true);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EncontrarIndice(int &Indice,double Valor,bool isMax)
  {

   for(int i=Indice; i>=0; i--)
     {
      if(isMax)
        {
         if(iHigh(NULL,NULL,i)==Valor)
           {
            Indice=i;
            break;
           }
        }
      else
        {
         if(iLow(NULL,NULL,i)==Valor)
           {
            Indice=i;
            break;
           }
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FuncionTendencias(const datetime &Time[],const double &High[],const double &Low[],const double &Close[])
  {
   for(int i=0; i<Tendencias; i++)
     {
      int Indice2=0;
      string Frase=" ";

      int Barras=iBars(Symbol(),Periodos[ArregloGestion[i]]);
      Barras=MathMin(Barras-3,1000);
      int START=IndiceStarts[ArregloGestion[i]];
      bool InicioB=false;
      //Comment(Barras-1-IndiceStarts,"  Indice ",Barras-1-Indice);
      for(int shift = START; shift < Barras ; shift++)
        {
         int PrefixTrend=0;
         double ZigZag = ZigZagValor(shift,Barras,InpDepths[ArregloGestion[i]],InpDeviations[ArregloGestion[i]],InpBacksteps[ArregloGestion[i]],Periodos[ArregloGestion[i]]);
         if(ZigZag>0 &&  ZigZag!=EMPTY_VALUE)
           {
            if(ZigZag>ValorHighs[ArregloGestion[i]])
              {
               Frase=Identation+Prefijo[ArregloGestion[i]]+" TREND";
               ValorHighs[ArregloGestion[i]]=ZigZag;
               ValorLows[ArregloGestion[i]]=BuscarZigZag(shift,Barras,InpDepths[ArregloGestion[i]],InpDeviations[ArregloGestion[i]],InpBacksteps[ArregloGestion[i]],Indice2,Periodos[ArregloGestion[i]]);

               bool isChoch=false;
               if(ObjectGetInteger(0,EDIT_NOMBRE[ArregloGestion[i]],OBJPROP_BGCOLOR)==clrRed)
                  isChoch=true;

               if(ObjectFind(0,EDIT_NOMBRE[ArregloGestion[i]])==0)
                  ObjectSetInteger(0,EDIT_NOMBRE[ArregloGestion[i]],OBJPROP_BGCOLOR,clrGreen);

               if(!isChoch)
                 {
                  for(int j=0; j<ArraySize(Cuadros_Delete[ArregloGestion[i]].Nombre); j++)
                     if(ObjectFind(0,Cuadros_Delete[ArregloGestion[i]].Nombre[j])==0)
                        ObjectDelete(0,Cuadros_Delete[ArregloGestion[i]].Nombre[j]);
                  ArrayResize(Cuadros_Delete[ArregloGestion[i]].Nombre,0);
                 }
               ChartRedraw();

               if(Period()<=Periodos[ArregloGestion[i]])
                 {
                  if(Inicio[ArregloGestion[i]])
                    {
                     if(ObjectFind(0,Frase+"MAX")==0)
                       {
                        datetime Tiempo_Inicial=datetime(ObjectGetInteger(0,Frase+"MAX",OBJPROP_TIME,0));
                        if(Tiempo_Inicial+PeriodSeconds(Periodos[ArregloGestion[i]])*(isChoch?1:EsperaLineaBarras)<=Time[0])
                          {
                           Print("CREA");
                           double Precio=ObjectGetDouble(0,Frase+"MAX",OBJPROP_PRICE,0);
                           TrendCreate(0,"L"+Frase+"MAX"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES),0,Tiempo_Inicial,Precio,Time[0],Precio,Color[ArregloGestion[i]],EstiloLineasCHOCHBOS,1,false,false,false,true,0);
                           TextCreate(0,"L"+Frase+"MAX"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES)+"TEXT",0,Tiempo_Inicial,Precio,isChoch?"CHOCH":"BOS","Arial",10,Color[ArregloGestion[i]],0,ANCHOR_LEFT_UPPER,false,false,true,0);
                          }
                       }
                    }
                  DibujarLinea(Barras-shift-1,ValorHighs[ArregloGestion[i]],Indice2,ValorLows[ArregloGestion[i]],Frase,Color[ArregloGestion[i]],Periodos[ArregloGestion[i]]);
                 }
               Alertas(Prefijo[ArregloGestion[i]],"Alcista",Alertas_Bool_IsAlcista[ArregloGestion[i]]);
               Alertas_Bool_IsAlcista[ArregloGestion[i]]=true;

               if(Period()<=Periodos[ArregloGestion[i]])
                 {
                  if(!Inicio[ArregloGestion[i]])
                    {
                     CrearRectangulo(iTime(Symbol(),Periodos[ArregloGestion[i]],Indice2),Prefijo[ArregloGestion[i]],Color[ArregloGestion[i]],Periodos[ArregloGestion[i]],CuadrosT[ArregloGestion[i]]);
                     CuadrosT[ArregloGestion[i]].isUP=false;
                    }
                  else
                    {
                     //  if(Cuadros[ArregloGestion[i]].isUP!=false)
                     CrearRectangulo2(iTime(Symbol(),Periodos[ArregloGestion[i]],Indice2),Prefijo[ArregloGestion[i]],Color[ArregloGestion[i]],Periodos[ArregloGestion[i]],CuadrosT[ArregloGestion[i]],Rectangulo_+Prefijo[ArregloGestion[i]]+" "+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES));
                     //  else
                     //   CrearRectangulo2(iTime(Symbol(),Periodos[ArregloGestion[i]],Indice2),"M1",Color[ArregloGestion[i]],Periodos[ArregloGestion[i]],Cuadros[ArregloGestion[i]],Cuadros[ArregloGestion[i]].Nombre);
                     CuadrosT[ArregloGestion[i]].isUP=false;
                    }
                 }
              }
            if(ZigZag<ValorLows[ArregloGestion[i]])
              {
               Frase=Identation+Prefijo[ArregloGestion[i]]+" TREND";
               ValorLows[ArregloGestion[i]]=ZigZag;
               ValorHighs[ArregloGestion[i]]=BuscarZigZag(shift,Barras,InpDepths[ArregloGestion[i]],InpDeviations[ArregloGestion[i]],InpBacksteps[ArregloGestion[i]],Indice2,Periodos[ArregloGestion[i]]);

               bool isChoch=false;
               if(ObjectGetInteger(0,EDIT_NOMBRE[ArregloGestion[i]],OBJPROP_BGCOLOR)==clrGreen)
                  isChoch=true;

               if(ObjectFind(0,EDIT_NOMBRE[ArregloGestion[i]])==0)
                  ObjectSetInteger(0,EDIT_NOMBRE[ArregloGestion[i]],OBJPROP_BGCOLOR,clrRed);

               if(!isChoch)
                 {
                  for(int j=0; j<ArraySize(Cuadros_Delete[ArregloGestion[i]].Nombre); j++)
                     if(ObjectFind(0,Cuadros_Delete[ArregloGestion[i]].Nombre[j])==0)
                        ObjectDelete(0,Cuadros_Delete[ArregloGestion[i]].Nombre[j]);
                  ArrayResize(Cuadros_Delete[ArregloGestion[i]].Nombre,0);
                 }
               ChartRedraw();

               if(Period()<=Periodos[ArregloGestion[i]])
                 {
                  if(Inicio[ArregloGestion[i]])
                    {
                     if(ObjectFind(0,Frase+"MIN")==0)
                       {
                        datetime Tiempo_Inicial=datetime(ObjectGetInteger(0,Frase+"MIN",OBJPROP_TIME,0));
                        if(Tiempo_Inicial+PeriodSeconds(Periodos[ArregloGestion[i]])*(isChoch?1:EsperaLineaBarras)<=Time[0])
                          {
                           double Precio=ObjectGetDouble(0,Frase+"MIN",OBJPROP_PRICE,0);
                           TrendCreate(0,"L"+Frase+"MIN"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES),0,Tiempo_Inicial,Precio,Time[0],Precio,Color[ArregloGestion[i]],EstiloLineasCHOCHBOS,1,false,false,false,true,0);
                           TextCreate(0,"L"+Frase+"MIN"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES)+"TEXT",0,Tiempo_Inicial,Precio,isChoch?"CHOCH":"BOS","Arial",10,Color[ArregloGestion[i]],0,ANCHOR_LEFT_LOWER,false,false,true,0);
                          }
                       }
                    }
                  DibujarLinea(Indice2,ValorHighs[ArregloGestion[i]],Barras-shift-1,ValorLows[ArregloGestion[i]],Frase,Color[ArregloGestion[i]],Periodos[ArregloGestion[i]]);
                 }
               Alertas(Prefijo[ArregloGestion[i]],"Bajista",Alertas_Bool_IsAlcista[ArregloGestion[i]]);
               Alertas_Bool_IsAlcista[ArregloGestion[i]]=false;

               if(Period()<=Periodos[ArregloGestion[i]])
                 {
                  if(!Inicio[ArregloGestion[i]])
                    {
                     CrearRectangulo(iTime(Symbol(),Periodos[ArregloGestion[i]],Indice2),Prefijo[ArregloGestion[i]],Color[ArregloGestion[i]],Periodos[ArregloGestion[i]],CuadrosT[ArregloGestion[i]]);
                     CuadrosT[ArregloGestion[i]].isUP=true;
                    }
                  else
                    {
                     // if(Cuadros[ArregloGestion[i]].isUP!=true)
                     CrearRectangulo2(iTime(Symbol(),Periodos[ArregloGestion[i]],Indice2),Prefijo[ArregloGestion[i]],Color[ArregloGestion[i]],Periodos[ArregloGestion[i]],CuadrosT[ArregloGestion[i]],Rectangulo_+Prefijo[ArregloGestion[i]]+" "+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES));
                     // else
                     //  CrearRectangulo2(iTime(Symbol(),Periodos,Indice2),"M1",Color[ArregloGestion[i]],Periodos,Cuadros[ArregloGestion[i]],Cuadros[ArregloGestion[i]].Nombre);
                     CuadrosT[ArregloGestion[i]].isUP=true;
                    }
                 }
              }
            IndiceStarts[ArregloGestion[i]]=shift;
            InicioB=true;
           }
        }
      if(InicioB)
         Inicio[ArregloGestion[i]]=true;
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IgualarValores()
  {
   ArrayInitialize(IndiceStarts,0);
   ArrayInitialize(ValorHighs,0);
   ArrayInitialize(ValorLows,0);
   ArrayInitialize(Inicio,false);

   Color[0]=Color_M1;
   Color[1]=Color_M5;
   Color[2]=Color_M15;
   Color[3]=Color_M30;
   Color[4]=Color_H1;
   Color[5]=Color_H4;
   Color[6]=Color_D1;
   Color[7]=Color_W1;
   Color[8]=Color_MN1;

   InpDepths[0]=InpDepth_M1;
   InpDeviations[0]=InpDeviation_M1;
   InpBacksteps[0]=InpBackstep_M1;

   InpDepths[1]=InpDepth_M5;
   InpDeviations[1]=InpDeviation_M5;
   InpBacksteps[1]=InpBackstep_M5;

   InpDepths[2]=InpDepth_M15;
   InpDeviations[2]=InpDeviation_M15;
   InpBacksteps[2]=InpBackstep_M15;

   InpDepths[3]=InpDepth_M30;
   InpDeviations[3]=InpDeviation_M30;
   InpBacksteps[3]=InpBackstep_M30;

   InpDepths[4]=InpDepth_H1;
   InpDeviations[4]=InpDeviation_H1;
   InpBacksteps[4]=InpBackstep_H1;

   InpDepths[5]=InpDepth_H4;
   InpDeviations[5]=InpDeviation_H4;
   InpBacksteps[5]=InpBackstep_H4;

   InpDepths[6]=InpDepth_D1;
   InpDeviations[6]=InpDeviation_D1;
   InpBacksteps[6]=InpBackstep_D1;

   InpDepths[7]=InpDepth_W1;
   InpDeviations[7]=InpDeviation_W1;
   InpBacksteps[7]=InpBackstep_W1;

   InpDepths[8]=InpDepth_MN1;
   InpDeviations[8]=InpDeviation_MN1;
   InpBacksteps[8]=InpBackstep_MN1;


   for(int i=0; i<Tendencias; i++)
      Objetivos(Symbol(),Periodos[ArregloGestion[i]],ValorLows[ArregloGestion[i]],ValorHighs[ArregloGestion[i]],InpDepths[ArregloGestion[i]],
                InpDeviations[ArregloGestion[i]],InpBacksteps[ArregloGestion[i]],IndiceStarts[ArregloGestion[i]]);
  }
//+------------------------------------------------------------------+
void Control_Cuadros_Lineas_Text(int rates_total,int prev_calculated,const double &Close[],const datetime &Time[])
  {
   if(!Extender_Cuadros)
      if(rates_total-prev_calculated!=0)
        {
         for(int i=0; i<Tendencias; i++)
            if(ObjectFind(0,CuadrosT[ArregloGestion[i]].Nombre)==0)
               ObjectSetInteger(0,CuadrosT[ArregloGestion[i]].Nombre,OBJPROP_TIME,1,TimeCurrent()+PeriodSeconds(ENUM_TIMEFRAMES(Period()))*20);;
        }

   int Cuadros=ObjectsTotal(0,0,OBJ_RECTANGLE);

   for(int i=Cuadros-1; i>=0; i--)
     {
      string Nombre=ObjectName(0,i,0,OBJ_RECTANGLE);
      if(StringFind(Nombre,Rectangulo_,0)!=-1)
        {
         double Arriba=ObjectGetDouble(0,Nombre,OBJPROP_PRICE,0);
         double Abajo=ObjectGetDouble(0,Nombre,OBJPROP_PRICE,1);

         if(Close[0]<=Arriba && Close[0]>=Abajo)
           {
            bool Encontro=false;
            ENUM_TIMEFRAMES Periodo=PERIOD_CURRENT;
            int IndiceS=0;
            for(int j=0; j<Tendencias; j++)
              {
               if(StringFind(Nombre,Rectangulo_+Prefijo[ArregloGestion[j]]+" ",0)!=-1)
                 {
                  Periodo=Periodos[ArregloGestion[j]];
                  IndiceS=ArregloGestion[j];
                  break;
                 }
              }
            for(int j=0; j<ArraySize(Cuadros_Delete[IndiceS].Nombre); j++)
              {
               if(Nombre==Cuadros_Delete[IndiceS].Nombre[j])
                 {
                  Encontro=true;
                  break;
                 }
              }
            if(!Encontro)
              {
               int SIZE=ArraySize(Cuadros_Delete[IndiceS].Nombre);
               ArrayResize(Cuadros_Delete[IndiceS].Nombre,SIZE+1);
               Cuadros_Delete[IndiceS].Nombre[SIZE]=Nombre;
              }
            if(Extender_Cuadros)
               ObjectSetInteger(0,Nombre,OBJPROP_TIME,1,TimeCurrent()+PeriodSeconds(Period())*5);
           }
         else
            if(ObjectGetInteger(0,Nombre,OBJPROP_TIME,0)<=Time[0]-PeriodSeconds(PERIOD_W1)*SemanasMaximas)
               ObjectDelete(0,Nombre);
            else
               if(Extender_Cuadros)
                  ObjectSetInteger(0,Nombre,OBJPROP_TIME,1,TimeCurrent()+PeriodSeconds(Period())*5);

        }
     }


   Cuadros=ObjectsTotal(0,0,OBJ_TREND);

   for(int i=Cuadros-1; i>=0; i--)
     {
      string Nombre=ObjectName(0,i,0,OBJ_TREND);
      if(StringFind(Nombre,"L"+Identation,0)!=-1)
        {
         if(ObjectGetInteger(0,Nombre,OBJPROP_TIME,0)<=Time[0]-PeriodSeconds(PERIOD_W1)*SemanasMaximas)
            ObjectDelete(0,Nombre);
        }
     }



   Cuadros=ObjectsTotal(0,0,OBJ_TEXT);

   for(int i=Cuadros-1; i>=0; i--)
     {
      string Nombre=ObjectName(0,i,0,OBJ_TEXT);
      if(StringFind(Nombre,"L"+Identation,0)!=-1)
        {
         if(ObjectGetInteger(0,Nombre,OBJPROP_TIME,0)<=Time[0]-PeriodSeconds(PERIOD_W1)*SemanasMaximas)
            ObjectDelete(0,Nombre);
        }
     }


  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ControlCuenta()
  {

   static bool Calculo=false;
   if(TiempoExcedidoVerificacion)
      return false;

   if(VerificacionCuenta==false)
     {
      if(TimeCurrent()>TiempoCarga)
        {
         TiempoExcedidoVerificacion=true;
         Alert("Cuenta no habilitada - Comuniquese con el Desarrollador");
         return false;
        }
      VerificacionCuenta=Cuenta();
      Calculo=false;
      return false;
     }

   if(password_status==-1)
     {
      if(TimeCurrent()>UNTIL)
        {
         Comment("TIEMPO DE PRUEBA TERMINADO EA DESABILITADO");
         return (false);
        }
     }

   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GestionarColumnas()
  {

   int i=0;
   if(M1_)
     {
      ArregloGestion[i]=0;
      i++;
     }
   if(M5_)
     {
      ArregloGestion[i]=1;
      i++;
     }
   if(M15_)
     {
      ArregloGestion[i]=2;
      i++;
     }
   if(M30_)
     {
      ArregloGestion[i]=3;
      i++;
     }
   if(H1_)
     {
      ArregloGestion[i]=4;
      i++;
     }
   if(H4_)
     {
      ArregloGestion[i]=5;
      i++;
     }
   if(D1_)
     {
      ArregloGestion[i]=6;
      i++;
     }
   if(W1_)
     {
      ArregloGestion[i]=7;
      i++;
     }
   if(MN1_)
     {
      ArregloGestion[i]=8;
      i++;
     }
   Tendencias=i;
  }
//+------------------------------------------------------------------+
