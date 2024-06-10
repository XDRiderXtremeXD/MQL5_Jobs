//+------------------------------------------------------------------+
//|                                                    Pivots_V1.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property version   "1.00"
#property link      "https://www.dominionforex.es"
#property copyright "Pivots v1 "
#property strict
#property indicator_chart_window

#property description "El indicador muestra puntos de pivote en el "
#property description "gráfico y admite muchos modos de cálculo para puntos de pivote y niveles de S/R."
#property description "Traza niveles históricos con fines de backtesting."
#property description "Le permite seleccionar el período de tiempo de referencia."
#property description "Implemente diferentes modos de cálculo de Pivot Point."
#property description "Implementa diferentes modos de cálculo de SR."
#property description "Implementa colores y tamaños personalizables."

#property indicator_buffers 0
#property indicator_plots 0

string Nombre_Carpeta_Pivots="DATOS_PIVOTS_V1";

enum CPP
  {
   H_L_C,//(H + L + C) / 3
   H_L_O,//(H + L + O) / 3
   H_L_C_O,//(H + L + C + O) / 4
   H_L_C_C,//(H + L + C + C) / 4
   H_L_O_O,//(H + L + O + O) / 4
   H_L,//(H + L) / 2
   H_C,//(H + C) / 2
   L_C,//(L + C) / 2
  };

enum CRS
  {
   Clasica,
   Woodie,
   Camarilla,
  };

int Conteo=0;

input int Semanas=1;// Semanas
input string SS1="------------------------------------------------";//--------- CONFIGURACION METODOS ---------
input CPP calculo_PP=H_L_C;
input CRS calculo_Soportes_Resistencias=Clasica;
input string SS2="------------------------------------------------";//--------- CONFIGURACION DIARIAS---------
input bool Ver_Max_Min_Diario=true;
input color ClrSoporte=clrRed;
input color ClrResistencia=clrGreen;
input color ClrPP=clrAqua;
input color ClrMaxD=clrMagenta;
input color ClrMinD=clrMagenta;
input ENUM_LINE_STYLE Estilo_Lineas_Diarias=STYLE_DASHDOT;
input int Grosor_Lineas_Diarias=1;
input string SS3="------------------------------------------------";//--------- CONFIGURACION SEMANALES---------
input bool Ver_Semanales=false;
input color ClrMax=clrBlue;
input color ClrMin=clrBlue;
input int Grosor_Lineas_Semanales=2;
input string SS4="------------------------------------------------";//--------- CONFIGURACION FIBO DIARIOS---------
input bool Ver_NivelesFibo_Diario=true;
input double Nivel1=0.382;
input double Nivel2=0.618;
input color clrNiveles=clrAliceBlue;
input ENUM_LINE_STYLE Estilo_Lineas_Fibo=STYLE_DASHDOT;
input int Grosor_Lineas_Fibo=2;



//bool  Alert_Max=false,Alert_Cierre=false,Alert_Apertura=false,Alert_Min=false;

double Valores[15]= {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
string NombresPanel[15]= {"Max S","Max D","R4","R3","R2","R1","P.P","S1","S2","S3","S4","Min D","Min S"," "," "};
string NombresPanelDescripcion[15]= {"Maximo Semanal","Maximo Diario","R4","R3","R2","R1","P.P","S1","S2","S3","S4","Minimo Diario","Minimo Semanal"," "," "};
color ColorLineas[15];

double TenkanBuffer[];

string BotonExportar="Boton Exportar Pivots";


datetime tiempoUntil=D'2024.04.05 00:00';
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   if(TimeCurrent()>tiempoUntil)
     {
      Alert("Tiempo Prueba Termino el dia ",TimeToString(tiempoUntil));
      return INIT_FAILED;
     }

   Comment("Tiempo Prueba hasta ",TimeToString(tiempoUntil));

   for(int i=0; i<15; i++)
     {
      if(i==0)
         ColorLineas[i]=ClrMax;
      else
         if(i==1)
            ColorLineas[i]=ClrMaxD;
         else
            if(i<6)
               ColorLineas[i]=ClrResistencia;
            else
               if(i<7)
                  ColorLineas[i]=ClrPP;
               else
                  if(i<11)
                     ColorLineas[i]=ClrSoporte;
                  else
                     if(i==11)
                        ColorLineas[i]=ClrMinD;
                     else
                        if(i==12)
                           ColorLineas[i]=ClrMin;
                        else
                           ColorLineas[i]=clrNiveles;
     }

   for(int i=0; i<15; i++)
      Valores[i]=0;

   NombresPanel[13]=DoubleToString(Nivel1*100,1)+" Fibo";
   NombresPanel[14]=DoubleToString(Nivel2*100,1)+" Fibo";
   NombresPanelDescripcion[13]=NombresPanel[13];
   NombresPanelDescripcion[14]=NombresPanel[14];

   ButtonCreate(0,BotonExportar,0,10,28,140,18,CORNER_LEFT_LOWER,"Cargando Pivots...","Arial",10,clrWhite,clrGray,clrWhite,false,false,false,true,0);
//---
   return(INIT_SUCCEEDED);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   for(int i=0; i<15; i++)
     {
      ObjectsDeleteAll(0,NombresPanel[i],0,OBJ_TREND);
      ObjectsDeleteAll(0,NombresPanel[i],0,OBJ_TEXT);
     }
   ObjectDelete(0,BotonExportar);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &Time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   double hm=iHigh(Symbol(),PERIOD_MN1,1);
   double lm=iLow(Symbol(),PERIOD_MN1,1);

   if(prev_calculated==0)
      return rates_total;

   if(Time[0]>tiempoUntil)
     {
      Comment("Tiempo Prueba Termino el dia ",TimeToString(tiempoUntil));
      return rates_total;
     }

   ArraySetAsSeries(Time,true);
   if(!DibujarSemanal(Time,rates_total))
      return 0;
   if(!DibujaDiario(Time,rates_total))
      return 0;

   return rates_total;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
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
//-----------------------------------------------------------+

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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool DibujarSemanal(datetime const &Time[],int const rates_total)
  {

   int Inicio2_=iBarShift(Symbol(),PERIOD_W1,Time[0],false)+1;
   datetime Tiempo2_=iTime(Symbol(),PERIOD_W1,Inicio2_);
   static datetime TiempoS_=0;

   if(TiempoS_!=Tiempo2_)
     {
      ObjectsDeleteAll(0,NombresPanel[1],0,OBJ_TREND);
      ObjectsDeleteAll(0,NombresPanel[9],0,OBJ_TREND);

      ObjectsDeleteAll(0,NombresPanel[1],0,OBJ_TEXT);
      ObjectsDeleteAll(0,NombresPanel[9],0,OBJ_TEXT);

      Conteo=0;
      int Evalua=rates_total-10;
      datetime Tiempo=iTime(Symbol(),PERIOD_W1,0);
      int Inicio=iBarShift(Symbol(),PERIOD_CURRENT,Tiempo,false)+1;

      //Tiempo=0;

      for(int i=Inicio; i<Evalua && Evalua>0; i++)
        {
         int Inicio2=iBarShift(Symbol(),PERIOD_W1,Time[i],false)+1;
         datetime Tiempo2=iTime(Symbol(),PERIOD_W1,Inicio2);

         if(Tiempo!=Tiempo2 && Conteo<Semanas-1)
           {
            //Print(TimeToString(Time[i],TIME_DATE|TIME_MINUTES));
            Tiempo=Tiempo2;
            double LowW=iLow(Symbol(),PERIOD_W1,Inicio2);
            double HighW=iHigh(Symbol(),PERIOD_W1,Inicio2);

            Valores[0]=HighW;
            Valores[12]=LowW;

            int Inicio3=iBarShift(Symbol(),PERIOD_W1,Time[i],false);
            datetime TiempoInicio=iTime(Symbol(),PERIOD_W1,Inicio3);
            int Inicio_Shift=iBarShift(Symbol(),PERIOD_CURRENT,TiempoInicio,false);
            TiempoInicio=iTime(Symbol(),PERIOD_W1,Inicio3-1);
            int Final_Shift=iBarShift(Symbol(),PERIOD_CURRENT,TiempoInicio,false);

            if(Inicio_Shift==-1)
               return false;

            if(Ver_Semanales)
               for(int j=0; j<13; j=j+12)
                 {
                  if(ObjectFind(0,NombresPanel[j]+TimeToString(Tiempo2,TIME_DATE))<0)
                     TrendCreate(0,NombresPanel[j]+TimeToString(Tiempo2,TIME_DATE),0,Time[Inicio_Shift],Valores[j],Time[Final_Shift],Valores[j],ColorLineas[j],0,Grosor_Lineas_Semanales,false,false,false,true,0);

                  if(ObjectFind(0,NombresPanel[j]+TimeToString(Tiempo2,TIME_DATE)+" text")<0)
                     TextCreate(0,NombresPanel[j]+TimeToString(Tiempo2,TIME_DATE)+" text",0,Time[Inicio_Shift],Valores[j], NombresPanel[j]+"[W1]","Arial",7,ColorLineas[j],0,ANCHOR_LEFT_LOWER,false,false,true,0);
                 }

            Conteo++;
           }
         if(Conteo>=Semanas)
            break;
        }

      Inicio2_=iBarShift(Symbol(),PERIOD_W1,Time[0],false)+1;
      Tiempo2_=iTime(Symbol(),PERIOD_W1,Inicio2_);

      TiempoS_=Tiempo2_;

      double LowW=NormalizeDouble(iLow(Symbol(),PERIOD_W1,Inicio2_),Digits());
      double HighW=NormalizeDouble(iHigh(Symbol(),PERIOD_W1,Inicio2_),Digits());


      Valores[0]=HighW;
      Valores[12]=LowW;

      int Inicio3=iBarShift(Symbol(),PERIOD_W1,Time[0],false);
      datetime TiempoInicio=iTime(Symbol(),PERIOD_W1,Inicio3);
      int Inicio_Shift=iBarShift(Symbol(),PERIOD_CURRENT,TiempoInicio,false);
      datetime TiempoFinal=iTime(Symbol(),PERIOD_D1,0)+PeriodSeconds(PERIOD_D1);

      if(Inicio_Shift==-1)
         return false;


      if(Ver_Semanales)
         for(int j=0; j<13; j=j+12)
           {
            if(ObjectFind(0,NombresPanel[j]+"Ultimo")<0)
               TrendCreate(0,NombresPanel[j]+"Ultimo",0,Time[Inicio_Shift],Valores[j],TiempoFinal,Valores[j],ColorLineas[j],0,Grosor_Lineas_Semanales,false,false,false,true,0);


            if(ObjectFind(0,NombresPanel[j]+"Ultimo"+" text")<0)
               TextCreate(0,NombresPanel[j]+"Ultimo"+" text",0,TiempoFinal+1*PeriodSeconds(Period()),Valores[j],NombresPanel[j]+"[W1] "+DoubleToString(Valores[j],Digits()),"Arial",9,ColorLineas[j],0,ANCHOR_LEFT_LOWER,false,false,true,0);
           }
     }

   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool DibujaDiario(datetime const &Time[],int const rates_total)
  {
   int Inicio2_=iBarShift(Symbol(),PERIOD_D1,Time[0],false)+1;
   datetime Tiempo2_=iTime(Symbol(),PERIOD_D1,Inicio2_);
   static datetime Tiempo_=0;

   if(Tiempo_!=Tiempo2_)
     {
      for(int i=2; i<9; i++)
        {
         ObjectsDeleteAll(0,NombresPanel[i],0,OBJ_TREND);
         ObjectsDeleteAll(0,NombresPanel[i],0,OBJ_TEXT);
        }

      Conteo=0;
      int Evalua=rates_total-10;
      datetime Tiempo=iTime(Symbol(),PERIOD_D1,0);

      int Inicio=iBarShift(Symbol(),PERIOD_CURRENT,Tiempo,false)+1;

      //Tiempo=0;

      for(int i=Inicio; i<Evalua && Evalua>0; i++)
        {
         int Inicio2=iBarShift(Symbol(),PERIOD_D1,Time[i],false)+1;
         datetime Tiempo2=iTime(Symbol(),PERIOD_D1,Inicio2);

         MqlDateTime tiempo2,tiempoI;
         TimeToStruct(Time[i],tiempoI);
         TimeToStruct(Tiempo2,tiempo2);

         if(Tiempo!=Tiempo2 && Conteo<Semanas*5-1 && tiempoI.day_of_week!=0)
           {
            if(tiempo2.day_of_week==0)
               Inicio2=Inicio2+1;

            //Print(TimeToString(Time[i],TIME_DATE|TIME_MINUTES));
            Tiempo=Tiempo2;
            double CloseD=iClose(Symbol(),PERIOD_D1,Inicio2);
            double OpenD=iOpen(Symbol(),PERIOD_D1,Inicio2);
            double LowD=iLow(Symbol(),PERIOD_D1,Inicio2);
            double HighD=iHigh(Symbol(),PERIOD_D1,Inicio2);

            double ValoresAnteriores[15];
            double PP = CalculoPP(CloseD,OpenD,LowD,HighD);
            double R1,R2,R3,R4,S1,S2,S3,S4,fibo1,fibo2;
            CalculoRS(PP,HighD,LowD,R1,R2,R3,R4,S1,S2,S3,S4);
            CalculoFibo(HighD,LowD,fibo1,fibo2);

            ValoresAnteriores[1]=NormalizeDouble(HighD,Digits());
            ValoresAnteriores[2]=NormalizeDouble(R4,Digits());
            ValoresAnteriores[3]=NormalizeDouble(R3,Digits());
            ValoresAnteriores[4]=NormalizeDouble(R2,Digits());
            ValoresAnteriores[5]=NormalizeDouble(R1,Digits());
            ValoresAnteriores[6]=NormalizeDouble(PP,Digits());
            ValoresAnteriores[7]=NormalizeDouble(S1,Digits());
            ValoresAnteriores[8]=NormalizeDouble(S2,Digits());
            ValoresAnteriores[9]=NormalizeDouble(S3,Digits());
            ValoresAnteriores[10]=NormalizeDouble(S4,Digits());
            ValoresAnteriores[11]=NormalizeDouble(LowD,Digits());

            ValoresAnteriores[13]=NormalizeDouble(fibo1,Digits());
            ValoresAnteriores[14]=NormalizeDouble(fibo2,Digits());

            int Inicio3=iBarShift(Symbol(),PERIOD_D1,Time[i],false);
            datetime TiempoInicio=iTime(Symbol(),PERIOD_D1,Inicio3);
            int Inicio_Shift=iBarShift(Symbol(),PERIOD_CURRENT,TiempoInicio,false);
            TiempoInicio=iTime(Symbol(),PERIOD_D1,Inicio3-1);
            int Final_Shift=iBarShift(Symbol(),PERIOD_CURRENT,TiempoInicio,false);


            if(Inicio_Shift==-1)
               return false;


            for(int j=1; j<15; j++)
              {
               if(j==12)
                  continue;

               if(!Ver_NivelesFibo_Diario)
                  if(j>12)
                     continue;

               if(!Ver_Max_Min_Diario)
                  if(j==1 || j==11)
                     continue;

               ENUM_LINE_STYLE estilo=j<12?Estilo_Lineas_Diarias:Estilo_Lineas_Fibo;
               int grosor=j<12?Grosor_Lineas_Diarias:Grosor_Lineas_Fibo;

               if(ObjectFind(0,NombresPanel[j]+TimeToString(Tiempo2,TIME_DATE))<0)
                  TrendCreate(0,NombresPanel[j]+TimeToString(Tiempo2,TIME_DATE),0,Time[Inicio_Shift],ValoresAnteriores[j],Time[Final_Shift],ValoresAnteriores[j],ColorLineas[j],estilo,grosor,false,false,false,true,0);

               if(ObjectFind(0,NombresPanel[j]+TimeToString(Tiempo2,TIME_DATE)+" text")<0)
                  TextCreate(0,NombresPanel[j]+TimeToString(Tiempo2,TIME_DATE)+" text",0,Time[Inicio_Shift],ValoresAnteriores[j],NombresPanel[j]+"[D1]","Arial",7,ColorLineas[j],0,ANCHOR_LEFT_LOWER,false,false,true,0);
              }
            Conteo++;
           }
         if(Conteo>=Semanas*5)
            break;
        }

      Inicio2_=iBarShift(Symbol(),PERIOD_D1,Time[0],false)+1;
      Tiempo2_=iTime(Symbol(),PERIOD_D1,Inicio2_);

      MqlDateTime tiempo0;
      TimeToStruct(Time[0],tiempo0);
      MqlDateTime tiempo2;
      TimeToStruct(Tiempo2_,tiempo2);

      if(tiempo0.day_of_week!=0)
        {
         if(tiempo2.day_of_week==0)
            Inicio2_=Inicio2_+1;

         Tiempo_=Tiempo2_;

         double CloseD=iClose(Symbol(),PERIOD_D1,Inicio2_);
         double OpenD=iOpen(Symbol(),PERIOD_D1,Inicio2_);
         double LowD=iLow(Symbol(),PERIOD_D1,Inicio2_);
         double HighD=iHigh(Symbol(),PERIOD_D1,Inicio2_);


         double PP = CalculoPP(CloseD,OpenD,LowD,HighD);
         double R1,R2,R3,R4,S1,S2,S3,S4,fibo1,fibo2;
         CalculoRS(PP,HighD,LowD,R1,R2,R3,R4,S1,S2,S3,S4);
         CalculoFibo(HighD,LowD,fibo1,fibo2);

         Valores[1]=NormalizeDouble(HighD,Digits());
         Valores[2]=NormalizeDouble(R4,Digits());
         Valores[3]=NormalizeDouble(R3,Digits());
         Valores[4]=NormalizeDouble(R2,Digits());
         Valores[5]=NormalizeDouble(R1,Digits());
         Valores[6]=NormalizeDouble(PP,Digits());
         Valores[7]=NormalizeDouble(S1,Digits());
         Valores[8]=NormalizeDouble(S2,Digits());
         Valores[9]=NormalizeDouble(S3,Digits());
         Valores[10]=NormalizeDouble(S4,Digits());
         Valores[11]=NormalizeDouble(LowD,Digits());

         Valores[13]=NormalizeDouble(fibo1,Digits());
         Valores[14]=NormalizeDouble(fibo2,Digits());

         int Inicio3=iBarShift(Symbol(),PERIOD_D1,Time[0],false);
         datetime TiempoInicio=iTime(Symbol(),PERIOD_D1,Inicio3);
         int Inicio_Shift=iBarShift(Symbol(),PERIOD_CURRENT,TiempoInicio,false);
         datetime TiempoFinal=TiempoInicio+PeriodSeconds(PERIOD_D1);

         if(Inicio_Shift==-1)
            return false;

         for(int j=1; j<15; j++)
           {
            if(j==12)
               continue;

            if(!Ver_NivelesFibo_Diario)
               if(j>12)
                  continue;

            if(!Ver_Max_Min_Diario)
               if(j==1 || j==11)
                  continue;


            ENUM_LINE_STYLE estilo=j<12?Estilo_Lineas_Diarias:Estilo_Lineas_Fibo;
            int grosor=j<12?Grosor_Lineas_Diarias:Grosor_Lineas_Fibo;

            if(ObjectFind(0,NombresPanel[j]+"Ultimo")<0)
               TrendCreate(0,NombresPanel[j]+"Ultimo",0,Time[Inicio_Shift],Valores[j],TiempoFinal,Valores[j],ColorLineas[j],estilo,grosor,false,false,false,true,0);

            if(ObjectFind(0,NombresPanel[j]+"Ultimo"+" text")<0)
               TextCreate(0,NombresPanel[j]+"Ultimo"+" text",0,TiempoFinal+1*PeriodSeconds(Period()),Valores[j],NombresPanel[j]+"[D1] "+DoubleToString(Valores[j],Digits()),"Arial",9,ColorLineas[j],0,ANCHOR_LEFT_LOWER,false,false,true,0);

           }

         ObjectSetInteger(0,BotonExportar,OBJPROP_BGCOLOR,clrMagenta);
         ObjectSetString(0,BotonExportar,OBJPROP_TEXT,"Exportar Pivots");
        }
      /*if(ObjectFind(0,"LABEL MA MI CI AP")==0)
         ObjectSetString(0,"LABEL MA MI CI AP",OBJPROP_TEXT,"Max= "+DoubleToString(HighD_,Digits())+"  Min="+DoubleToString(LowD_,Digits())+"  Cierre="+DoubleToString(CloseD_,Digits())+"  Apertura="+DoubleToString(OpenD_,Digits()));*/
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarDouble(string Texto)
  {
   int Punto=0;
   int Numero=0;
   for(int i=0; i<StringLen(Texto); i++)
     {
      ushort CHAR=StringGetCharacter(Texto,i);

      if(CHAR<='9' && CHAR>='0')
         Numero++;

      if((CHAR>'9' || CHAR<'0') && CHAR!='.' && CHAR!=' ')
         return false;

      if(CHAR=='.')
         Punto++;

      if(Punto>1)
         return false;
     }

   if(Numero==0)
      return false;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string ModificarTexto(string Texto)
  {

   string TextoS="";
   int Vacio=0;
   for(int i=0; i<StringLen(Texto); i++)
     {
      ushort CHAR=StringGetCharacter(Texto,i);
      if(CHAR!=' ')
         TextoS=TextoS+CharToString((char)CHAR);
     }
   return TextoS;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CalculoPP(double C,double O,double L,double H)
  {
   double valor=0;

   switch(calculo_PP)
     {
      case H_L_C:
         valor = (H + L + C) / 3;
         //Print("Calcular punto de pivote con (H + L + C) / 3: ", valor);
         break;
      case H_L_O:
         valor = (H + L + O) / 3;
         //Print("Calcular punto de pivote con (H + L + O) / 3: ", valor);
         break;
      case H_L_C_O:
         valor = (H + L + C + O) / 4;
         //Print("Calcular punto de pivote con (H + L + C + O) / 4: ", valor);
         break;
      case H_L_C_C:
         valor = (H + L + C + C) / 4;
         //Print("Calcular punto de pivote con (H + L + C + C) / 4: ", valor);
         break;
      case H_L_O_O:
         valor = (H + L + O + O) / 4;
         //Print("Calcular punto de pivote con (H + L + O + O) / 4: ", valor);
         break;
      case H_L:
         valor = (H + L) / 2;
         //Print("Calcular punto de pivote con (H + L) / 2: ", valor);
         break;
      case H_C:
         valor = (H + C) / 2;
         //Print("Calcular punto de pivote con (H + C) / 2: ", valor);
         break;
      case L_C:
         valor = (L + C) / 2;
         //Print("Calcular punto de pivote con (L + C) / 2: ", valor);
         break;
      default:
         //Print("Modo de cálculo de punto de pivote no reconocido");
         break;
     }

   return valor;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CalculoRS(double PP, double alto, double bajo, double &R1, double &R2, double &R3, double &R4, double &S1, double &S2, double &S3, double &S4)
  {

   switch(calculo_Soportes_Resistencias)
     {
      case Clasica:
         // Calcular R1 y S1
         R1 = (2 * PP) - bajo;
         S1 = (2 * PP) - alto;

         // Calcular R2 y S2
         R2 = PP + (alto - bajo);
         S2 = PP - (alto - bajo);

         // Calcular R3 y S3
         R3 = R2 + (alto - bajo);
         S3 = S2 - (alto - bajo);

         // Calcular R4 y S4
         R4 = R3 + (alto - bajo);
         S4 = S3 - (alto - bajo);
         break;

      case Woodie:
         // Calcular R1 y S1
         R1 = (2 * PP) - bajo;
         S1 = (2 * PP) - alto;

         // Calcular R2 y S2
         R2 = PP + (alto - bajo);
         S2 = PP - (alto - bajo);

         // Calcular R3 y S3
         R3 = alto + 2 * (PP - bajo);
         S3 = bajo - 2 * (alto - PP);

         // Calcular R4 y S4
         R4 = R3 + (alto - bajo);
         S4 = S3 - (alto - bajo);
         break;

      case Camarilla:
         // Calcular R1 y S1
         R1 = PP + (alto - bajo) * 1.1 / 12;
         S1 = PP - (alto - bajo) * 1.1 / 12;

         // Calcular R2 y S2
         R2 = PP + (alto - bajo) * 1.1 / 6;
         S2 = PP - (alto - bajo) * 1.1 / 6;

         // Calcular R3 y S3
         R3 = PP + (alto - bajo) * 1.1 / 4;
         S3 = PP - (alto - bajo) * 1.1 / 4;

         // Calcular R4 y S4
         R4 = PP + (alto - bajo) * 1.1 / 2;
         S4 = PP - (alto - bajo) * 1.1 / 2;
         break;

      default:
         // Manejar caso no válido
         Print("Modo de cálculo de soportes y resistencias no reconocido");
         break;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CalculoFibo(double alto, double bajo, double &F1, double &F2)
  {
   double Rango=alto-bajo;
   F1=alto-Rango*Nivel1;
   F2=alto-Rango*Nivel2;
  }


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
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//--- comprobamos el evento de apretar el botón del ratón
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      string clickedChartObject=sparam;
      //--- si hacemos clic en el objeto con el nombre buttonID
      if(clickedChartObject==BotonExportar)
        {
         //--- estado del botón - está apretado o no
         bool selected=ObjectGetInteger(0,BotonExportar,OBJPROP_STATE);

         if(selected)
           {
            ExportarFuncion();
            ObjectSetInteger(0,BotonExportar,OBJPROP_STATE,false);
           }
        }
      ChartRedraw();// volvemos a dibujar por vía forzada todos los objetos del gráfico
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ExportarFuncion()
  {
   if(Valores[0]==0)
     {
      Alert("Todavia esta cargando los pivots");
      return;
     }

   string InpFileName=Symbol()+" "+TimeToString(iTime(Symbol(),PERIOD_D1,0),TIME_DATE)+".txt"; // file name
   string File= Nombre_Carpeta_Pivots+"//"+InpFileName;

   if(FileIsExist(File,FILE_COMMON))
      FileDelete(File,FILE_COMMON);

   ResetLastError();
   int file_handle=FileOpen(File,FILE_READ|FILE_WRITE|FILE_TXT|FILE_COMMON);

   if(file_handle!=INVALID_HANDLE)
     {
      string comentario="";
      comentario+=("Maximo Mensual = "+DoubleToString(iHigh(Symbol(),PERIOD_MN1,1),Digits())+"\n");
      for(int i=0;i<15;i++)
        {
         if(i==13)
            comentario+=("Minimo Mensual = "+DoubleToString(iLow(Symbol(),PERIOD_MN1,1),Digits())+"\n");
         comentario+=(NombresPanelDescripcion[i]+(i>=13?" Fibo":"")+" = "+DoubleToString(Valores[i],Digits())+"\n");
        }


      //--- la cadena está formada, la escribimos en el archivo
      FileWriteString(file_handle,comentario);
      //--- cerramos el archivo
      FileClose(file_handle);
     }
   else
      PrintFormat("Fallo al abrir el archivo %s, Código del error = %d",File,GetLastError());

  }
//+------------------------------------------------------------------+
