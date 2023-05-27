//+------------------------------------------------------------------+
//|                                                 ZigZagBlocks.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, Donatello Ceron"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property indicator_chart_window
#property indicator_plots 0

/////////////////// AÑO.MES.DIA HORA:MINUTO///////////////////
datetime UNTIL=D'2022.11.20 00:00';
double CuentasCompartidas[1]= {61107549};

////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

///LUEGO LO COMPILAS, UNA VEZ COMPILADO LE MANDAS SOLO EL ARCHIVO .ex5 No mandes el archivo .mq5

////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

/////////////////////////TU CUENTA///////////////////////////////
////////////////////////////////////////////////////////////////////////
double Cuentas[1]= {61107549};
string CuentasBroker= "Pepperstone Group Limited";
////////////////////////////////////////////////////////////////////////

struct Nombre_Cuadros
  {
   string            Nombre;
   bool              isUP;
   datetime          TiempoInicial;
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
input string s3 = "====TEMPORALIDAD H1====";//==========
input int InpDepth_H1=4;     // Depth
input int InpDeviation_H1=5;  // Deviation
input int InpBackstep_H1=3;   // Backstep
input string s4 = "====TEMPORALIDAD H4====";//==========
input int InpDepth_H4=4;     // Depth
input int InpDeviation_H4=5;  // Deviation
input int InpBackstep_H4=3;   // Backstep
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
input color Color_H1=clrYellow;
input color Color_H4=clrAquamarine;
input ENUM_LINE_STYLE EstiloLineasCHOCHBOS=STYLE_DASHDOT;
input int SizeTexto=10;
input string S6="------------------ SETTING AREA ------------------";//-----------------------
input bool Show_Areas=true;
input bool Extender_Cuadros=true;
input uint Grosor=2;
input bool ColorFondo=false;

bool Inicio=false;


string EDIT_NOMBRE[5]= {"EDIT NOMBRE 2021 M1","EDIT NOMBRE 2021 M5","EDIT NOMBRE 2021 M15","EDIT NOMBRE 2021 H1","EDIT NOMBRE 2021 H4"};
string EDIT_NOMBRE_STRING[5]= {"M1","M5","M15","H1","H4"};
bool Alertas_Bool_IsAlcista[5]= {false,false,false,false,false};

int Espacio=5;

datetime TimeLast=0;

bool Valido=false;

int IndiceStart_M1=0;
int IndiceStart_M5=0;
int IndiceStart_M15=0;
int IndiceStart_H1=0;
int IndiceStart_H4=0;

double ValorHigh_M1=0;
double ValorLow_M1=0;

double ValorHigh_M5=0;
double ValorLow_M5=0;

double ValorHigh_M15=0;
double ValorLow_M15=0;

double ValorHigh_H1=0;
double ValorLow_H1=0;

double ValorHigh_H4=0;
double ValorLow_H4=0;

string Identation="TREND 2021 MAX MIN ";
string Rectangulo_="RECTANGULO TREND 2021 MAX MIN ";

Nombre_Cuadros Cuadros_M1;
Nombre_Cuadros Cuadros_M5;
Nombre_Cuadros Cuadros_M15;
Nombre_Cuadros Cuadros_H1;
Nombre_Cuadros Cuadros_H4;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   Inicio=false;

   int Carga=0;
   TiempoExcedidoVerificacion=false;
   VerificacionCuenta=false;
   TiempoCarga=TimeCurrent()+120;

   string broker = AccountInfoString(ACCOUNT_COMPANY);
   long account = AccountInfoInteger(ACCOUNT_LOGIN);


   printf("The name of the broker = %s", broker);
   printf("Account number =  %d", account);

   if(broker == CuentasBroker)
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

   for(int i=0; i<5; i++)
     {
      if(ObjectFind(0,EDIT_NOMBRE[i])!=0)
         EditCreate(0,EDIT_NOMBRE[i],0,Righ_Desplazamiento+Boton_Desplazamiento_X+(Espacio+Ancho_Botones)*(MathAbs(Righ-i)),Boton_Desplazamiento_Y+Low_,Ancho_Botones,Altura_Botones,EDIT_NOMBRE_STRING[i],"Arial",Boton_Size_Text,ALIGN_CENTER,true,CORNER_BOTON,clrWhite,clrGray,clrNONE,false,false,true,0);
     }


   /*if(!ActualizarDatos(Symbol(),PERIOD_M1))
      return INIT_FAILED;
   */
   Objetivos(Symbol(),PERIOD_M1,ValorLow_M1,ValorHigh_M1,InpDepth_M1,InpDeviation_M1,InpBackstep_M1,IndiceStart_M1);
//Objetivos(Symbol(),PERIOD_M1,ValorLow_M5,ValorHigh_M5,InpDepth_M5,InpDeviation_M5,InpBackstep_M5,IndiceStart_M5);
//Objetivos(Symbol(),PERIOD_M1,ValorLow_M15,ValorHigh_M15,InpDepth_M15,InpDeviation_M15,InpBackstep_M15,IndiceStart_M15);
//Objetivos(Symbol(),PERIOD_M1,ValorLow_H1,ValorHigh_H1,InpDepth_H1,InpDeviation_H1,InpBackstep_H1,IndiceStart_H1);
//Objetivos(Symbol(),PERIOD_M1,ValorLow_H4,ValorHigh_H4,InpDepth_H4,InpDeviation_H4,InpBackstep_H4,IndiceStart_H4);


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

   ArraySetAsSeries(close,true);
   ArraySetAsSeries(time,true);

   if(!Extender_Cuadros)
      if(rates_total-prev_calculated!=0)
        {
         if(ObjectFind(0,Cuadros_M1.Nombre)==0)
            ObjectSetInteger(0,Cuadros_M1.Nombre,OBJPROP_TIME,1,TimeCurrent()+PeriodSeconds(ENUM_TIMEFRAMES(Period()))*20);
         if(ObjectFind(0,Cuadros_M5.Nombre)==0)
            ObjectSetInteger(0,Cuadros_M5.Nombre,OBJPROP_TIME,1,TimeCurrent()+PeriodSeconds(ENUM_TIMEFRAMES(Period()))*20);
         if(ObjectFind(0,Cuadros_M15.Nombre)==0)
            ObjectSetInteger(0,Cuadros_M15.Nombre,OBJPROP_TIME,1,TimeCurrent()+PeriodSeconds(ENUM_TIMEFRAMES(Period()))*20);
         if(ObjectFind(0,Cuadros_H1.Nombre) ==0)
            ObjectSetInteger(0,Cuadros_H1.Nombre,OBJPROP_TIME,1,TimeCurrent()+PeriodSeconds(ENUM_TIMEFRAMES(Period()))*20);
         if(ObjectFind(0,Cuadros_H4.Nombre)==0)
            ObjectSetInteger(0,Cuadros_H4.Nombre,OBJPROP_TIME,1,TimeCurrent()+PeriodSeconds(ENUM_TIMEFRAMES(Period()))*20);
        }

   int Cuadros=ObjectsTotal(0,0,OBJ_RECTANGLE);

   for(int i=Cuadros-1; i>=0; i--)
     {
      string Nombre=ObjectName(0,i,0,OBJ_RECTANGLE);
      if(StringFind(Nombre,Rectangulo_,0)!=-1)
        {
         double Arriba=ObjectGetDouble(0,Nombre,OBJPROP_PRICE,0);
         double Abajo=ObjectGetDouble(0,Nombre,OBJPROP_PRICE,1);

         if(close[0]<=Arriba && close[0]>=Abajo)
            ObjectDelete(0,Nombre);
         else
            if(ObjectGetInteger(0,Nombre,OBJPROP_TIME,0)<=time[0]-PeriodSeconds(PERIOD_W1)*SemanasMaximas)
              {
               ObjectDelete(0,Nombre);
              }
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
         if(ObjectGetInteger(0,Nombre,OBJPROP_TIME,0)<=time[0]-PeriodSeconds(PERIOD_W1)*SemanasMaximas)
            ObjectDelete(0,Nombre);
        }
     }



   Cuadros=ObjectsTotal(0,0,OBJ_TEXT);

   for(int i=Cuadros-1; i>=0; i--)
     {
      string Nombre=ObjectName(0,i,0,OBJ_TEXT);
      if(StringFind(Nombre,"L"+Identation,0)!=-1)
        {
         if(ObjectGetInteger(0,Nombre,OBJPROP_TIME,0)<=time[0]-PeriodSeconds(PERIOD_W1)*SemanasMaximas)
            ObjectDelete(0,Nombre);
        }
     }

   static bool Calculo=false;
   if(TiempoExcedidoVerificacion)
      return rates_total;

   if(VerificacionCuenta==false)
     {
      if(TimeCurrent()>TiempoCarga)
        {
         TiempoExcedidoVerificacion=true;
         Alert("Cuenta no habilitada - Comuniquese con el Desarrollador");
         return rates_total;
        }
      VerificacionCuenta=Cuenta();
      Calculo=false;
      return rates_total;
     }



   if(password_status==-1)
     {
      if(TimeCurrent()>UNTIL)
        {
         Comment("TIEMPO DE PRUEBA TERMINADO EA DESABILITADO");
         return (rates_total);
        }
     }

   if(!ActualizarDatos(Symbol(),PERIOD_M1))
      return rates_total;
   
   if(!ActualizarDatos(Symbol(),PERIOD_M5))
      return rates_total;

   if(!ActualizarDatos(Symbol(),PERIOD_M15))
      return rates_total;

   if(!ActualizarDatos(Symbol(),PERIOD_H1))
      return rates_total;

   if(!ActualizarDatos(Symbol(),PERIOD_H4))
      return rates_total;

   ArraySetAsSeries(high,false);
   ArraySetAsSeries(low,false);
   ArraySetAsSeries(time,false);

   static datetime prevtime=0;


   int START;

   int Indice2=0;
   string Frase=" ";


   int Barras=MathMin(iBars(Symbol(),PERIOD_M1),1000);
   START=IndiceStart_M1;

//Comment(Barras-1-IndiceStart,"  Indice ",Barras-1-Indice);
   for(int shift = START; shift < Barras ; shift++)
     {
      int PrefixTrend=0;
      double ZigZag = ZigZagValor(shift,Barras,InpDepth_M1,InpDeviation_M1,InpBackstep_M1,PERIOD_M1);
      if(ZigZag>0 &&  ZigZag!=EMPTY_VALUE)
        {
         if(ZigZag>ValorHigh_M1)
           {
            Frase=Identation+"M1 TREND";
            ValorHigh_M1=ZigZag;
            ValorLow_M1=BuscarZigZag(shift,Barras,InpDepth_M1,InpDeviation_M1,InpBackstep_M1,Indice2,PERIOD_M1);

            bool isChoch=false;
            if(ObjectGetInteger(0,EDIT_NOMBRE[0],OBJPROP_BGCOLOR)==clrRed)
               isChoch=true;

            if(ObjectFind(0,EDIT_NOMBRE[0])==0)
               ObjectSetInteger(0,EDIT_NOMBRE[0],OBJPROP_BGCOLOR,clrGreen);

            if(Period()<=PERIOD_M1)
              {
               if(Inicio)
                 {
                  if(ObjectFind(0,Frase+"MAX")==0)
                    {
                     datetime Tiempo_Inicial=datetime(ObjectGetInteger(0,Frase+"MAX",OBJPROP_TIME,0));
                     if(Tiempo_Inicial+PeriodSeconds(Period())*(isChoch?1:EsperaLineaBarras)<=time[0])
                       {
                        double Precio=ObjectGetDouble(0,Frase+"MAX",OBJPROP_PRICE,0);
                        TrendCreate(0,"L"+Frase+"MAX"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES),0,Tiempo_Inicial,Precio,time[0],Precio,Color_M1,EstiloLineasCHOCHBOS,1,false,false,false,true,0);
                        TextCreate(0,"L"+Frase+"MAX"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES)+"TEXT",0,Tiempo_Inicial,Precio,isChoch?"CHOCH":"BOS","Arial",10,Color_M1,0,ANCHOR_LEFT_UPPER,false,false,true,0);
                       }
                    }
                 }
               DibujarLinea(Barras-shift-1,ValorHigh_M1,Indice2,ValorLow_M1,Frase,Color_M1,PERIOD_M1);
              }
            Alertas("M1","Alcista",Alertas_Bool_IsAlcista[0]);
            Alertas_Bool_IsAlcista[0]=true;

            if(Period()<=PERIOD_M1)
              {
               if(!Inicio)
                 {
                  CrearRectangulo(iTime(Symbol(),PERIOD_M1,Indice2),"M1",Color_M1,PERIOD_M1,Cuadros_M1);
                  Cuadros_M1.isUP=false;
                 }
               else
                 {
                  //  if(Cuadros_M1.isUP!=false)
                  CrearRectangulo2(iTime(Symbol(),PERIOD_M1,Indice2),"M1",Color_M1,PERIOD_M1,Cuadros_M1,Rectangulo_+"M1"+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES));
                  //  else
                  //   CrearRectangulo2(iTime(Symbol(),PERIOD_M1,Indice2),"M1",Color_M1,PERIOD_M1,Cuadros_M1,Cuadros_M1.Nombre);
                  Cuadros_M1.isUP=false;
                 }
              }
           }
         if(ZigZag<ValorLow_M1)
           {
            Frase=Identation+"M1 TREND";
            ValorLow_M1=ZigZag;
            ValorHigh_M1=BuscarZigZag(shift,Barras,InpDepth_M1,InpDeviation_M1,InpBackstep_M1,Indice2,PERIOD_M1);

            bool isChoch=false;
            if(ObjectGetInteger(0,EDIT_NOMBRE[0],OBJPROP_BGCOLOR)==clrGreen)
               isChoch=true;

            if(ObjectFind(0,EDIT_NOMBRE[0])==0)
               ObjectSetInteger(0,EDIT_NOMBRE[0],OBJPROP_BGCOLOR,clrRed);
            if(Period()<=PERIOD_M1)
              {
               if(Inicio)
                 {
                  if(ObjectFind(0,Frase+"MIN")==0)
                    {
                     datetime Tiempo_Inicial=datetime(ObjectGetInteger(0,Frase+"MIN",OBJPROP_TIME,0));
                     if(Tiempo_Inicial+PeriodSeconds(Period())*(isChoch?1:EsperaLineaBarras)<=time[0])
                       {
                        double Precio=ObjectGetDouble(0,Frase+"MIN",OBJPROP_PRICE,0);
                        TrendCreate(0,"L"+Frase+"MIN"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES),0,Tiempo_Inicial,Precio,time[0],Precio,Color_M1,EstiloLineasCHOCHBOS,1,false,false,false,true,0);
                        TextCreate(0,"L"+Frase+"MIN"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES)+"TEXT",0,Tiempo_Inicial,Precio,isChoch?"CHOCH":"BOS","Arial",10,Color_M1,0,ANCHOR_LEFT_LOWER,false,false,true,0);
                       }
                    }
                 }
               DibujarLinea(Indice2,ValorHigh_M1,Barras-shift-1,ValorLow_M1,Frase,Color_M1,PERIOD_M1);
              }
            Alertas("M1","Bajista",Alertas_Bool_IsAlcista[0]);
            Alertas_Bool_IsAlcista[0]=false;

            if(Period()<=PERIOD_M1)
              {
               if(!Inicio)
                 {
                  CrearRectangulo(iTime(Symbol(),PERIOD_M1,Indice2),"M1",Color_M1,PERIOD_M1,Cuadros_M1);
                  Cuadros_M1.isUP=true;
                 }
               else
                 {
                  // if(Cuadros_M1.isUP!=true)
                  CrearRectangulo2(iTime(Symbol(),PERIOD_M1,Indice2),"M1",Color_M1,PERIOD_M1,Cuadros_M1,Rectangulo_+"M1"+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES));
                  // else
                  //  CrearRectangulo2(iTime(Symbol(),PERIOD_M1,Indice2),"M1",Color_M1,PERIOD_M1,Cuadros_M1,Cuadros_M1.Nombre);
                  Cuadros_M1.isUP=true;
                 }
              }
           }
         IndiceStart_M1=shift;
        }
     }


   START=IndiceStart_M5;
   Barras=MathMin(iBars(Symbol(),PERIOD_M5),1000);
//Comment(Barras-1-IndiceStart,"  Indice ",Barras-1-Indice);
   for(int shift = START; shift < Barras ; shift++)
     {
      int PrefixTrend=0;
      double ZigZag = ZigZagValor(shift,Barras,InpDepth_M5,InpDeviation_M5,InpBackstep_M5,PERIOD_M5);

      if(ZigZag>0 &&  ZigZag!=EMPTY_VALUE)
        {
         if(ZigZag>ValorHigh_M5)
           {
            Frase=Identation+"M5 TREND";
            ValorHigh_M5=ZigZag;
            ValorLow_M5=BuscarZigZag(shift,Barras,InpDepth_M5,InpDeviation_M5,InpBackstep_M5,Indice2,PERIOD_M5);

            bool isChoch=false;
            if(ObjectGetInteger(0,EDIT_NOMBRE[1],OBJPROP_BGCOLOR)==clrRed)
               isChoch=true;

            if(ObjectFind(0,EDIT_NOMBRE[1])==0)
               ObjectSetInteger(0,EDIT_NOMBRE[1],OBJPROP_BGCOLOR,clrGreen);
            if(Period()<=PERIOD_M5)
              {
               if(Inicio)
                 {
                  if(ObjectFind(0,Frase+"MAX")==0)
                    {
                     datetime Tiempo_Inicial=datetime(ObjectGetInteger(0,Frase+"MAX",OBJPROP_TIME,0));
                     if(Tiempo_Inicial+PeriodSeconds(Period())*(isChoch?1:EsperaLineaBarras)<=time[0])
                       {
                        double Precio=ObjectGetDouble(0,Frase+"MAX",OBJPROP_PRICE,0);
                        TrendCreate(0,"L"+Frase+"MAX"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES),0,Tiempo_Inicial,Precio,time[0],Precio,Color_M5,EstiloLineasCHOCHBOS,1,false,false,false,true,0);
                        TextCreate(0,"L"+Frase+"MAX"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES)+"TEXT",0,Tiempo_Inicial,Precio,isChoch?"CHOCH":"BOS","Arial",10,Color_M5,0,ANCHOR_LEFT_UPPER,false,false,true,0);
                       }
                    }
                 }
               DibujarLinea(Barras-shift-1,ValorHigh_M5,Indice2,ValorLow_M5,Frase,Color_M5,PERIOD_M5);
              }
            Alertas("M5","Alcista",Alertas_Bool_IsAlcista[1]);
            Alertas_Bool_IsAlcista[1]=true;

            if(Period()<=PERIOD_M5)
              {
               if(!Inicio)
                 {
                  CrearRectangulo(iTime(Symbol(),PERIOD_M5,Indice2),"M5",Color_M5,PERIOD_M5,Cuadros_M5);
                  Cuadros_M5.isUP=false;
                 }
               else
                 {
                  //  if(Cuadros_M5.isUP!=false)
                  CrearRectangulo2(iTime(Symbol(),PERIOD_M5,Indice2),"M5",Color_M5,PERIOD_M5,Cuadros_M5,Rectangulo_+"M5"+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES));
                  //else
                  // CrearRectangulo2(iTime(Symbol(),PERIOD_M5,Indice2),"M5",Color_M5,PERIOD_M5,Cuadros_M5,Cuadros_M5.Nombre);
                  Cuadros_M5.isUP=false;
                 }
              }
           }
         if(ZigZag<ValorLow_M5)
           {
            Frase=Identation+"M5 TREND";
            ValorLow_M5=ZigZag;
            ValorHigh_M5=BuscarZigZag(shift,Barras,InpDepth_M5,InpDeviation_M5,InpBackstep_M5,Indice2,PERIOD_M5);

            bool isChoch=false;
            if(ObjectGetInteger(0,EDIT_NOMBRE[1],OBJPROP_BGCOLOR)==clrGreen)
               isChoch=true;

            if(ObjectFind(0,EDIT_NOMBRE[1])==0)
               ObjectSetInteger(0,EDIT_NOMBRE[1],OBJPROP_BGCOLOR,clrRed);
            if(Period()<=PERIOD_M5)
              {
               if(Inicio)
                 {
                  if(ObjectFind(0,Frase+"MIN")==0)
                    {
                     datetime Tiempo_Inicial=datetime(ObjectGetInteger(0,Frase+"MIN",OBJPROP_TIME,0));
                     if(Tiempo_Inicial+PeriodSeconds(Period())*(isChoch?1:EsperaLineaBarras)<=time[0])
                       {
                        double Precio=ObjectGetDouble(0,Frase+"MIN",OBJPROP_PRICE,0);
                        TrendCreate(0,"L"+Frase+"MIN"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES),0,Tiempo_Inicial,Precio,time[0],Precio,Color_M5,EstiloLineasCHOCHBOS,1,false,false,false,true,0);
                        TextCreate(0,"L"+Frase+"MIN"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES)+"TEXT",0,Tiempo_Inicial,Precio,isChoch?"CHOCH":"BOS","Arial",10,Color_M5,0,ANCHOR_LEFT_LOWER,false,false,true,0);
                       }
                    }
                 }
               DibujarLinea(Indice2,ValorHigh_M5,Barras-shift-1,ValorLow_M5,Frase,Color_M5,PERIOD_M5);
              }
            Alertas("M5","Bajista",Alertas_Bool_IsAlcista[1]);
            Alertas_Bool_IsAlcista[1]=false;

            if(Period()<=PERIOD_M5)
              {
               if(!Inicio)
                 {
                  CrearRectangulo(iTime(Symbol(),PERIOD_M5,Indice2),"M5",Color_M5,PERIOD_M5,Cuadros_M5);
                  Cuadros_M5.isUP=true;
                 }
               else
                 {
                  //if(Cuadros_M5.isUP!=true)
                  CrearRectangulo2(iTime(Symbol(),PERIOD_M5,Indice2),"M5",Color_M5,PERIOD_M5,Cuadros_M5,Rectangulo_+"M5"+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES));
                  //else
                  // CrearRectangulo2(iTime(Symbol(),PERIOD_M5,Indice2),"M5",Color_M5,PERIOD_M5,Cuadros_M5,Cuadros_M5.Nombre);
                  Cuadros_M5.isUP=true;
                 }
              }
           }
         IndiceStart_M5=shift;
        }
     }

   START=IndiceStart_M15;

   Barras=MathMin(iBars(Symbol(),PERIOD_M15),1000);
//Comment(Barras-1-IndiceStart,"  Indice ",Barras-1-Indice);
   for(int shift = START; shift < Barras ; shift++)
     {
      int PrefixTrend=0;
      double ZigZag = ZigZagValor(shift,Barras,InpDepth_M15,InpDeviation_M15,InpBackstep_M15,PERIOD_M15);
      if(ZigZag>0 &&  ZigZag!=EMPTY_VALUE)
        {
         if(ZigZag>ValorHigh_M15)
           {
            Frase=Identation+"M15 TREND";
            ValorHigh_M15=ZigZag;
            ValorLow_M15=BuscarZigZag(shift,Barras,InpDepth_M15,InpDeviation_M15,InpBackstep_M15,Indice2,PERIOD_M15);

            bool isChoch=false;
            if(ObjectGetInteger(0,EDIT_NOMBRE[2],OBJPROP_BGCOLOR)==clrRed)
               isChoch=true;

            if(ObjectFind(0,EDIT_NOMBRE[2])==0)
               ObjectSetInteger(0,EDIT_NOMBRE[2],OBJPROP_BGCOLOR,clrGreen);
            if(Period()<=PERIOD_M15)
              {
               if(Inicio)
                 {
                  if(ObjectFind(0,Frase+"MAX")==0)
                    {
                     datetime Tiempo_Inicial=datetime(ObjectGetInteger(0,Frase+"MAX",OBJPROP_TIME,0));
                     if(Tiempo_Inicial+PeriodSeconds(Period())*(isChoch?1:EsperaLineaBarras)<=time[0])
                       {
                        double Precio=ObjectGetDouble(0,Frase+"MAX",OBJPROP_PRICE,0);
                        TrendCreate(0,"L"+Frase+"MAX"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES),0,Tiempo_Inicial,Precio,time[0],Precio,Color_M15,EstiloLineasCHOCHBOS,1,false,false,false,true,0);
                        TextCreate(0,"L"+Frase+"MAX"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES)+"TEXT",0,Tiempo_Inicial,Precio,isChoch?"CHOCH":"BOS","Arial",10,Color_M15,0,ANCHOR_LEFT_UPPER,false,false,true,0);
                       }
                    }
                 }
               DibujarLinea(Barras-shift-1,ValorHigh_M15,Indice2,ValorLow_M15,Frase,Color_M15,PERIOD_M15);
              }
            Alertas("M15","Alcista",Alertas_Bool_IsAlcista[2]);
            Alertas_Bool_IsAlcista[2]=true;

            if(Period()<=PERIOD_M15)
              {
               if(!Inicio)
                 {
                  CrearRectangulo(iTime(Symbol(),PERIOD_M15,Indice2),"M15",Color_M15,PERIOD_M15,Cuadros_M15);
                  Cuadros_M15.isUP=false;
                 }
               else
                 {
                  //   if(Cuadros_M15.isUP!=false)
                  CrearRectangulo2(iTime(Symbol(),PERIOD_M15,Indice2),"M15",Color_M15,PERIOD_M15,Cuadros_M15,Rectangulo_+"M15"+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES));



                  // else
                  //  CrearRectangulo2(iTime(Symbol(),PERIOD_M15,Indice2),"M15",Color_M15,PERIOD_M15,Cuadros_M15,Cuadros_M15.Nombre);
                  Cuadros_M15.isUP=false;
                 }
              }
           }
         if(ZigZag<ValorLow_M15)
           {
            Frase=Identation+"M15 TREND";
            ValorLow_M15=ZigZag;
            ValorHigh_M15=BuscarZigZag(shift,Barras,InpDepth_M15,InpDeviation_M15,InpBackstep_M15,Indice2,PERIOD_M15);

            bool isChoch=false;
            if(ObjectGetInteger(0,EDIT_NOMBRE[2],OBJPROP_BGCOLOR)==clrGreen)
               isChoch=true;

            if(ObjectFind(0,EDIT_NOMBRE[2])==0)
               ObjectSetInteger(0,EDIT_NOMBRE[2],OBJPROP_BGCOLOR,clrRed);
            if(Period()<=PERIOD_M15)
              {
               if(Inicio)
                 {
                  if(ObjectFind(0,Frase+"MIN")==0)
                    {
                     datetime Tiempo_Inicial=datetime(ObjectGetInteger(0,Frase+"MIN",OBJPROP_TIME,0));
                     if(Tiempo_Inicial+PeriodSeconds(Period())*(isChoch?1:EsperaLineaBarras)<=time[0])
                       {
                        double Precio=ObjectGetDouble(0,Frase+"MIN",OBJPROP_PRICE,0);
                        TrendCreate(0,"L"+Frase+"MIN"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES),0,Tiempo_Inicial,Precio,time[0],Precio,Color_M1,EstiloLineasCHOCHBOS,1,false,false,false,true,0);
                        TextCreate(0,"L"+Frase+"MIN"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES)+"TEXT",0,Tiempo_Inicial,Precio,isChoch?"CHOCH":"BOS","Arial",10,Color_M15,0,ANCHOR_LEFT_LOWER,false,false,true,0);
                       }
                    }
                 }
               DibujarLinea(Indice2,ValorHigh_M15,Barras-shift-1,ValorLow_M15,Frase,Color_M15,PERIOD_M15);
              }
            Alertas("M15","Bajista",Alertas_Bool_IsAlcista[2]);
            Alertas_Bool_IsAlcista[2]=false;

            if(Period()<=PERIOD_M15)
              {
               if(!Inicio)
                 {
                  CrearRectangulo(iTime(Symbol(),PERIOD_M15,Indice2),"M15",Color_M15,PERIOD_M15,Cuadros_M15);
                  Cuadros_M15.isUP=true;
                 }
               else
                 {
                  //if(Cuadros_M15.isUP!=true)
                  CrearRectangulo2(iTime(Symbol(),PERIOD_M15,Indice2),"M15",Color_M15,PERIOD_M15,Cuadros_M15,Rectangulo_+"M15"+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES));
                  //else
                  // CrearRectangulo2(iTime(Symbol(),PERIOD_M15,Indice2),"M15",Color_M15,PERIOD_M15,Cuadros_M15,Cuadros_M15.Nombre);
                  Cuadros_M15.isUP=true;
                 }
              }
           }

         IndiceStart_M15=shift;
        }
     }

   START=IndiceStart_H1;
   Barras=MathMin(iBars(Symbol(),PERIOD_H1),1000);
//Comment(Barras-1-IndiceStart,"  Indice ",Barras-1-Indice);
   for(int shift = START; shift < Barras ; shift++)
     {
      int PrefixTrend=0;
      double ZigZag = ZigZagValor(shift,Barras,InpDepth_H1,InpDeviation_H1,InpBackstep_H1,PERIOD_H1);
      if(ZigZag>0 &&  ZigZag!=EMPTY_VALUE)
        {
         if(ZigZag>ValorHigh_H1)
           {
            Frase=Identation+"H1 TREND";
            ValorHigh_H1=ZigZag;
            ValorLow_H1=BuscarZigZag(shift,Barras,InpDepth_H1,InpDeviation_H1,InpBackstep_H1,Indice2,PERIOD_H1);

            bool isChoch=false;
            if(ObjectGetInteger(0,EDIT_NOMBRE[3],OBJPROP_BGCOLOR)==clrRed)
               isChoch=true;

            if(ObjectFind(0,EDIT_NOMBRE[3])==0)
               ObjectSetInteger(0,EDIT_NOMBRE[3],OBJPROP_BGCOLOR,clrGreen);
            if(Period()<=PERIOD_H1)
              {
               if(Inicio)
                 {
                  if(ObjectFind(0,Frase+"MAX")==0)
                    {
                     datetime Tiempo_Inicial=datetime(ObjectGetInteger(0,Frase+"MAX",OBJPROP_TIME,0));
                     if(Tiempo_Inicial+PeriodSeconds(Period())*(isChoch?1:EsperaLineaBarras)<=time[0])
                       {
                        double Precio=ObjectGetDouble(0,Frase+"MAX",OBJPROP_PRICE,0);
                        TrendCreate(0,"L"+Frase+"MAX"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES),0,Tiempo_Inicial,Precio,time[0],Precio,Color_H1,EstiloLineasCHOCHBOS,1,false,false,false,true,0);
                        TextCreate(0,"L"+Frase+"MAX"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES)+"TEXT",0,Tiempo_Inicial,Precio,isChoch?"CHOCH":"BOS","Arial",10,Color_H1,0,ANCHOR_LEFT_UPPER,false,false,true,0);
                       }
                    }
                 }
               DibujarLinea(Barras-shift-1,ValorHigh_H1,Indice2,ValorLow_H1,Frase,Color_H1,PERIOD_H1);
              }
            Alertas("H1","Alcista",Alertas_Bool_IsAlcista[3]);
            Alertas_Bool_IsAlcista[3]=true;

            if(Period()<=PERIOD_H1)
              {
               if(!Inicio)
                 {
                  CrearRectangulo(iTime(Symbol(),PERIOD_H1,Indice2),"H1",Color_H1,PERIOD_H1,Cuadros_H1);
                  Cuadros_H1.isUP=false;
                 }
               else
                 {
                  //       if(Cuadros_H1.isUP!=false)
                  CrearRectangulo2(iTime(Symbol(),PERIOD_H1,Indice2),"H1",Color_H1,PERIOD_H1,Cuadros_H1,Rectangulo_+"H1"+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES));
                  //     else
                  //      CrearRectangulo2(iTime(Symbol(),PERIOD_H1,Indice2),"H1",Color_H1,PERIOD_H1,Cuadros_H1,Cuadros_H1.Nombre);
                  Cuadros_H1.isUP=false;
                 }
              }
           }
         if(ZigZag<ValorLow_H1)
           {
            Frase=Identation+"H1 TREND";
            ValorLow_H1=ZigZag;
            ValorHigh_H1=BuscarZigZag(shift,Barras,InpDepth_H1,InpDeviation_H1,InpBackstep_H1,Indice2,PERIOD_H1);

            bool isChoch=false;
            if(ObjectGetInteger(0,EDIT_NOMBRE[3],OBJPROP_BGCOLOR)==clrGreen)
               isChoch=true;

            if(ObjectFind(0,EDIT_NOMBRE[3])==0)
               ObjectSetInteger(0,EDIT_NOMBRE[3],OBJPROP_BGCOLOR,clrRed);
            if(Period()<=PERIOD_H1)
              {
               if(Inicio)
                 {
                  if(ObjectFind(0,Frase+"MIN")==0)
                    {
                     datetime Tiempo_Inicial=datetime(ObjectGetInteger(0,Frase+"MIN",OBJPROP_TIME,0));
                     if(Tiempo_Inicial+PeriodSeconds(Period())*(isChoch?1:EsperaLineaBarras)<=time[0])
                       {
                        double Precio=ObjectGetDouble(0,Frase+"MIN",OBJPROP_PRICE,0);
                        TrendCreate(0,"L"+Frase+"MIN"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES),0,Tiempo_Inicial,Precio,time[0],Precio,Color_H1,EstiloLineasCHOCHBOS,1,false,false,false,true,0);
                        TextCreate(0,"L"+Frase+"MIN"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES)+"TEXT",0,Tiempo_Inicial,Precio,isChoch?"CHOCH":"BOS","Arial",10,Color_H1,0,ANCHOR_LEFT_LOWER,false,false,true,0);
                       }
                    }
                 }
               DibujarLinea(Indice2,ValorHigh_H1,Barras-shift-1,ValorLow_H1,Frase,Color_H1,PERIOD_H1);
              }

            Alertas("H1","Bajista",Alertas_Bool_IsAlcista[3]);
            Alertas_Bool_IsAlcista[3]=false;
            if(Period()<=PERIOD_H1)
              {
               if(!Inicio)
                 {
                  CrearRectangulo(iTime(Symbol(),PERIOD_H1,Indice2),"H1",Color_H1,PERIOD_H1,Cuadros_H1);
                  Cuadros_H1.isUP=true;
                 }
               else
                 {
                  //         if(Cuadros_H1.isUP!=true)
                  CrearRectangulo2(iTime(Symbol(),PERIOD_H1,Indice2),"H1",Color_H1,PERIOD_H1,Cuadros_H1,Rectangulo_+"H1"+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES));
                  //       else
                  //        CrearRectangulo2(iTime(Symbol(),PERIOD_H1,Indice2),"H1",Color_H1,PERIOD_H1,Cuadros_H1,Cuadros_H1.Nombre);
                  Cuadros_H1.isUP=true;
                 }
              }
           }
         IndiceStart_H1=shift;
        }
     }

   START=IndiceStart_H4;
   Barras=MathMin(iBars(Symbol(),PERIOD_H4),1000);
//Comment(Barras-1-IndiceStart,"  Indice ",Barras-1-Indice);
   for(int shift = START; shift < Barras ; shift++)
     {
      int PrefixTrend=0;
      double ZigZag = ZigZagValor(shift,Barras,InpDepth_H4,InpDeviation_H4,InpBackstep_H4,PERIOD_H4);
      if(ZigZag>0 &&  ZigZag!=EMPTY_VALUE)
        {
         if(ZigZag>ValorHigh_H4)
           {
            Frase=Identation+"H4 TREND";
            ValorHigh_H4=ZigZag;
            ValorLow_H4=BuscarZigZag(shift,Barras,InpDepth_H4,InpDeviation_H4,InpBackstep_H4,Indice2,PERIOD_H4);

            bool isChoch=false;
            if(ObjectGetInteger(0,EDIT_NOMBRE[4],OBJPROP_BGCOLOR)==clrRed)
               isChoch=true;

            if(ObjectFind(0,EDIT_NOMBRE[4])==0)
               ObjectSetInteger(0,EDIT_NOMBRE[4],OBJPROP_BGCOLOR,clrGreen);
            if(Period()<=PERIOD_H4)
              {
               if(Inicio)
                 {
                  if(ObjectFind(0,Frase+"MAX")==0)
                    {
                     datetime Tiempo_Inicial=datetime(ObjectGetInteger(0,Frase+"MIN",OBJPROP_TIME,0));
                     if(Tiempo_Inicial+PeriodSeconds(Period())*(isChoch?1:EsperaLineaBarras)<=time[0])
                       {
                        double Precio=ObjectGetDouble(0,Frase+"MAX",OBJPROP_PRICE,0);
                        TrendCreate(0,"L"+Frase+"MAX"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES),0,Tiempo_Inicial,Precio,time[0],Precio,Color_H4,EstiloLineasCHOCHBOS,1,false,false,false,true,0);
                        TextCreate(0,"L"+Frase+"MAX"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES)+"TEXT",0,Tiempo_Inicial,Precio,isChoch?"CHOCH":"BOS","Arial",10,Color_H4,0,ANCHOR_LEFT_UPPER,false,false,true,0);
                       }
                    }
                 }
               DibujarLinea(Barras-shift-1,ValorHigh_H4,Indice2,ValorLow_H4,Frase,Color_H4,PERIOD_H4);
              }
            Alertas("H4","Alcista",Alertas_Bool_IsAlcista[4]);
            Alertas_Bool_IsAlcista[4]=true;

            if(Period()<=PERIOD_H4)
              {
               if(!Inicio)
                 {
                  CrearRectangulo(iTime(Symbol(),PERIOD_H4,Indice2),"H4",Color_H4,PERIOD_H4,Cuadros_H4);
                  Cuadros_H4.isUP=false;
                 }
               else
                 {
                  //        if(Cuadros_H4.isUP!=false)
                  CrearRectangulo2(iTime(Symbol(),PERIOD_H4,Indice2),"H4",Color_H4,PERIOD_H4,Cuadros_H4,Rectangulo_+"H4"+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES));
                  //      else
                  //       CrearRectangulo2(iTime(Symbol(),PERIOD_H4,Indice2),"H4",Color_H4,PERIOD_H4,Cuadros_H4,Cuadros_H4.Nombre);
                  Cuadros_H4.isUP=false;
                 }
              }
           }
         if(ZigZag<ValorLow_H4)
           {
            Frase=Identation+"H4 TREND";
            ValorLow_H4=ZigZag;
            ValorHigh_H4=BuscarZigZag(shift,Barras,InpDepth_H4,InpDeviation_H4,InpBackstep_H4,Indice2,PERIOD_H4);

            bool isChoch=false;
            if(ObjectGetInteger(0,EDIT_NOMBRE[4],OBJPROP_BGCOLOR)==clrGreen)
               isChoch=true;

            if(ObjectFind(0,EDIT_NOMBRE[4])==0)
               ObjectSetInteger(0,EDIT_NOMBRE[4],OBJPROP_BGCOLOR,clrRed);
            if(Period()<=PERIOD_H4)
              {
               if(Inicio)
                 {
                  if(ObjectFind(0,Frase+"MIN")==0)
                    {
                     datetime Tiempo_Inicial=datetime(ObjectGetInteger(0,Frase+"MIN",OBJPROP_TIME,0));
                     if(Tiempo_Inicial+PeriodSeconds(Period())*(isChoch?1:EsperaLineaBarras)<=time[0])
                       {
                        double Precio=ObjectGetDouble(0,Frase+"MIN",OBJPROP_PRICE,0);
                        TrendCreate(0,"L"+Frase+"MIN"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES),0,Tiempo_Inicial,Precio,time[0],Precio,Color_H4,EstiloLineasCHOCHBOS,1,false,false,false,true,0);
                        TextCreate(0,"L"+Frase+"MIN"+TimeToString(Tiempo_Inicial,TIME_DATE|TIME_MINUTES)+"TEXT",0,Tiempo_Inicial,Precio,isChoch?"CHOCH":"BOS","Arial",10,Color_H4,0,ANCHOR_LEFT_LOWER,false,false,true,0);
                       }
                    }
                 }
               DibujarLinea(Indice2,ValorHigh_H4,Barras-shift-1,ValorLow_H4,Frase,Color_H4,PERIOD_H4);
              }
            Alertas("H4","Bajista",Alertas_Bool_IsAlcista[4]);
            Alertas_Bool_IsAlcista[4]=false;

            if(Period()<=PERIOD_H4)
              {
               if(!Inicio)
                 {
                  CrearRectangulo(iTime(Symbol(),PERIOD_H4,Indice2),"H4",Color_H4,PERIOD_H4,Cuadros_H4);
                  Cuadros_H4.isUP=true;
                 }
               else
                 {
                  //        if(Cuadros_H4.isUP!=true)
                  CrearRectangulo2(iTime(Symbol(),PERIOD_H4,Indice2),"H4",Color_H4,PERIOD_H4,Cuadros_H4,Rectangulo_+"H4"+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES));
                  //      else
                  //       CrearRectangulo2(iTime(Symbol(),PERIOD_H4,Indice2),"H4",Color_H4,PERIOD_H4,Cuadros_H4,Cuadros_H4.Nombre);
                  Cuadros_H4.isUP=true;
                 }
              }

           }
         IndiceStart_H4=shift;
        }
     }
   Inicio=true;
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

   bool TemporalidadesMin[4]= {false,false,false,false};
   bool TemporalidadesMax[4]= {false,false,false,false};

   if(ValorLow==ValorLow_M1)
      TemporalidadesMin[0]=true;

   if(ValorLow==ValorLow_M5)
      TemporalidadesMin[1]=true;

   if(ValorLow==ValorLow_M15)
      TemporalidadesMin[2]=true;

   if(ValorLow==ValorLow_H1)
      TemporalidadesMin[3]=true;


   if(ValorHigh==ValorHigh_M1)
      TemporalidadesMax[0]=true;

   if(ValorHigh==ValorHigh_M5)
      TemporalidadesMax[1]=true;

   if(ValorHigh==ValorHigh_M15)
      TemporalidadesMax[2]=true;

   if(ValorHigh==ValorHigh_H1)
      TemporalidadesMax[3]=true;

   if(Temporalidad=="M5")
     {
      if(TemporalidadesMax[0]==true)
         VelasSeparacionmax=VelasSeparacionmax+13;
      if(TemporalidadesMin[0]==true)
         VelasSeparacionmin=VelasSeparacionmin+13;
     }
   else
      if(Temporalidad=="M15")
        {
         if(TemporalidadesMax[0]==true)
            VelasSeparacionmax=VelasSeparacionmax+13;
         if(TemporalidadesMin[0]==true)
            VelasSeparacionmin=VelasSeparacionmin+13;
         if(TemporalidadesMax[1]==true)
            VelasSeparacionmax=VelasSeparacionmax+13;
         if(TemporalidadesMin[1]==true)
            VelasSeparacionmin=VelasSeparacionmin+13;
        }
      else
         if(Temporalidad=="H1")
           {
            if(TemporalidadesMax[0]==true)
               VelasSeparacionmax=VelasSeparacionmax+13;
            if(TemporalidadesMin[0]==true)
               VelasSeparacionmin=VelasSeparacionmin+13;
            if(TemporalidadesMax[1]==true)
               VelasSeparacionmax=VelasSeparacionmax+13;
            if(TemporalidadesMin[1]==true)
               VelasSeparacionmin=VelasSeparacionmin+13;
            if(TemporalidadesMax[2]==true)
               VelasSeparacionmax=VelasSeparacionmax+13+1;
            if(TemporalidadesMin[2]==true)
               VelasSeparacionmin=VelasSeparacionmin+13+1;
           }
         else
            if(Temporalidad=="H4")
              {
               if(TemporalidadesMax[0]==true)
                  VelasSeparacionmax=VelasSeparacionmax+13;
               if(TemporalidadesMin[0]==true)
                  VelasSeparacionmin=VelasSeparacionmin+13;
               if(TemporalidadesMax[1]==true)
                  VelasSeparacionmax=VelasSeparacionmax+13;
               if(TemporalidadesMin[1]==true)
                  VelasSeparacionmin=VelasSeparacionmin+13;
               if(TemporalidadesMax[2]==true)
                  VelasSeparacionmax=VelasSeparacionmax+13+1;
               if(TemporalidadesMin[2]==true)
                  VelasSeparacionmin=VelasSeparacionmin+13+1;
               if(TemporalidadesMax[3]==true)
                  VelasSeparacionmax=VelasSeparacionmax+13;
               if(TemporalidadesMin[3]==true)
                  VelasSeparacionmin=VelasSeparacionmin+13;
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
      if(Inicio)
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

   if(broker == CuentasBroker)
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
      Cuadros.Nombre=Rectangulo_+Frase;

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
