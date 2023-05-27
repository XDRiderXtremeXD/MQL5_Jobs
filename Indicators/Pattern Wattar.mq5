//+------------------------------------------------------------------+
//|                                     White Tiggers con Wattar.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"
#property description "Indicador que avisa mediante una alerta la formacion de un patron regresivo"
#property description "con vela recien formandose- en otras palabras te avisa cuando se esta formando"
#property description "el patron regresivo y no cuando ha terminado de formarse la vela"

#property indicator_chart_window
#property indicator_buffers 2
#property indicator_plots   2

#property indicator_label1  "SELL"
#property indicator_color1  Orange
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2  "BUY"
#property indicator_color2  Orange
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

string label_name="mainwindow_label";

int window=-1;

enum MODO_DIRECCION
  {
   BOOM=0,     // BOOM
   CRASH=1,  // CRASH
  };


input int PorcentajeVELA1=60;
input int PorcentajeVELA2=60;
input MODO_DIRECCION Modo=BOOM;
input color ColorTextoAlert=clrAqua;
input string NombrePatron="Waddath Patron";
input string Settings_Alert="***Settings Alerts***";
input bool Show_Alert=true; //ACTIVAR ALERTA
input bool Alert_PC=true;
input bool Alert_Movil=false;
input string Settings_Waddah_Attar_Explosion="***Settings Waddah Atta _Explosion***";
input int Fast_MA = 20;       // Period of the fast MACD moving average
input int Slow_MA = 40;       // Period of the slow MACD moving average
input int BBPeriod=20;        // Bollinger period
input double BBDeviation=2.0; // Number of Bollinger deviations
input int  Sensetive=150;
input int  DeadZonePip=400;
input int  ExplosionPower=15;
input int  TrendPower=150;
input bool AlertWindow=false;
input int  AlertCount=2;
input bool AlertLong=false;
input bool AlertShort=false;
input bool AlertExitLong=false;
input bool AlertExitShort=false;
input double IndicatorLevel=20;



int Waddah;
double ArrowSignalUP[];
double ArrowSignalDN[];
double Waddah_Color_Buffer[];
double Waddah_Color_Buffer_Color[];
double Waddah_Color_Signal[];

double Candle_WickBody_Percent=0;

int DefinitionWT;
int  DefinitionRSI;

bool CRUCE=false;
bool isBoom=true;
string Porcentajes="Label Porcentaje 2022";
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+

bool ALERTAACTIVADA=true;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   isBoom=true;

   Waddah=iCustom(Symbol(),PERIOD_CURRENT,"waddah_attar_explosion",Fast_MA,Slow_MA,BBPeriod,BBDeviation,Sensetive,
                  DeadZonePip,ExplosionPower,TrendPower,AlertWindow,AlertCount,AlertLong,AlertShort,AlertExitLong,AlertExitShort,IndicatorLevel);
   if(Waddah==INVALID_HANDLE)
     {
      return(INIT_FAILED);
     }
   if(Modo!=BOOM)
      isBoom=false;

   IndicatorSetString(INDICATOR_SHORTNAME,"PatronesWhiteTigerRSICruce");
//172, 115
   PlotIndexSetInteger(0,PLOT_ARROW,181);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(0,ArrowSignalUP);
   SetIndexBuffer(1,ArrowSignalDN);

   PlotIndexSetInteger(1,PLOT_ARROW,181);

   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   ArraySetAsSeries(ArrowSignalDN,false);
   ArraySetAsSeries(ArrowSignalUP,false);

   ArraySetAsSeries(Waddah_Color_Buffer,true);
   ArraySetAsSeries(Waddah_Color_Buffer_Color,true);
   ArraySetAsSeries(Waddah_Color_Signal,true);


   ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);

   return (INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,0,OBJ_TEXT);
   Comment("");
   if(ObjectFind(0,label_name)>=0)
      ObjectDelete(0,label_name);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
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
   static datetime prevtime=0;
   static int setalert;
   static int shift;
   string pattern;
   int setPattern=0;
   int alert=0;
   static double O[10],C[10],L[10],H[10];
   static double CL[10],BL[10],BLa[10],BL90[10],UW[10],LW[10],BodyHigh[10],BodyLow[10],BB[10];
   for(int i=0; i<10; i++)
     {
      BodyHigh[i]=0;
      BodyLow[i]=0;
     }
   int CumOffset;
   int CumOffset2=0;

   if(prevtime!=Time[rates_total-1])
     {
      if(ObjectFind(0,label_name)>=0)
         ObjectDelete(0,label_name);
      CRUCE=false;
     }

   if(prevtime==Time[rates_total-1] && ALERTAACTIVADA==true)
     {
      if(ObjectFind(0,label_name)<0)
        {
         Print("Generating a label");
         ObjectCreate(0,label_name,OBJ_LABEL,0,0,0);
         ObjectSetInteger(0,label_name,OBJPROP_XDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_YDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_COLOR,ColorTextoAlert);
         ObjectSetString(0,label_name,OBJPROP_TEXT,"Formandose Patron WhiteTigerATR");
         ObjectSetString(0,label_name,OBJPROP_FONT,"Comic Sans");
         ObjectSetInteger(0,label_name,OBJPROP_FONTSIZE,10);
         ObjectSetInteger(0,label_name,OBJPROP_SELECTABLE,false);
         ChartRedraw(0);
        }
      //return(rates_total);
     }

//if(ObjectFind(0,label_name)>=0)
// ObjectDelete(0,label_name);


   prevtime=Time[rates_total-1];

   int START=0;
   if(prev_calculated!=0)
     {
      START=rates_total-1;
     }
   else
     {
      START=12;
      ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
     }

   for(shift=START; shift<rates_total; shift++)
     {
      CumOffset= 0;
      setalert = 0;
      ArrowSignalUP[shift]=EMPTY_VALUE;
      ArrowSignalDN[shift]=EMPTY_VALUE;
      CopyBuffer(Waddah,0,rates_total-1-shift,3,Waddah_Color_Buffer);
      CopyBuffer(Waddah,1,rates_total-1-shift,3,Waddah_Color_Buffer_Color);
      CopyBuffer(Waddah,2,rates_total-1-shift,3,Waddah_Color_Signal);

      bool Condicion=false;
      ALERTAACTIVADA=false;



      if(isBoom && Waddah_Color_Buffer[1]>Waddah_Color_Signal[1] && Waddah_Color_Buffer[1]>Waddah_Color_Buffer[0] && Waddah_Color_Buffer_Color[2]==1 && Waddah_Color_Buffer_Color[1]==2 && Waddah_Color_Buffer_Color[0]==2)
        {
         double resultado=Waddah_Color_Buffer[1]-Waddah_Color_Signal[1];
         double Porcentaje=NormalizeDouble(resultado*100/Waddah_Color_Buffer[1],0);

         double resultado2=Waddah_Color_Buffer[0]-Waddah_Color_Signal[0];
         double Porcentaje2=NormalizeDouble(resultado2*100/Waddah_Color_Buffer[0],0);
         if(Porcentaje<=PorcentajeVELA1 && Porcentaje2<=PorcentajeVELA2)
           {
             if(ObjectFind(0,Porcentajes+TimeToString(Time[shift-1],TIME_DATE|TIME_MINUTES))!=0)
             TextCreate(0,Porcentajes+TimeToString(Time[shift-1],TIME_DATE|TIME_MINUTES),0,Time[shift-1], High[shift-1] ,DoubleToString(Porcentaje,0)+"%","Arial",12,clrAqua,0,ANCHOR_LOWER,false,
             false,true,0);
             
             if(ObjectFind(0,Porcentajes+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
             TextCreate(0,Porcentajes+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift], High[shift],DoubleToString(Porcentaje2,0)+"%","Arial",12,clrAqua,0,ANCHOR_LOWER,false,
             false,true,0);
              else
             ObjectMove(0,Porcentajes+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],Low[shift]);
           
            Condicion=true;
            ArrowSignalUP[shift] = High[shift] ;
           }
         //}
        }

      else
         if(!isBoom && Waddah_Color_Buffer[1]>Waddah_Color_Signal[1] && Waddah_Color_Buffer[1]>Waddah_Color_Buffer[0] && Waddah_Color_Buffer_Color[2]==2 && Waddah_Color_Buffer_Color[1]==1 && Waddah_Color_Buffer_Color[0]==1)
           {
            double resultado=Waddah_Color_Buffer[1]-Waddah_Color_Signal[1];
            double Porcentaje=NormalizeDouble(resultado*100/Waddah_Color_Buffer[1],0);

            double resultado2=Waddah_Color_Buffer[0]-Waddah_Color_Signal[0];
            double Porcentaje2=NormalizeDouble(resultado2*100/Waddah_Color_Buffer[0],0);
            if(Porcentaje<=PorcentajeVELA1 && Porcentaje2<=PorcentajeVELA2)
              {
              if(ObjectFind(0,Porcentajes+TimeToString(Time[shift-1],TIME_DATE|TIME_MINUTES))!=0)
             TextCreate(0,Porcentajes+TimeToString(Time[shift-1],TIME_DATE|TIME_MINUTES),0,Time[shift-1], Low[shift-1] ,DoubleToString(Porcentaje,0)+"%","Arial",12,clrAqua,0,ANCHOR_UPPER,false,
             false,true,0);
             
             if(ObjectFind(0,Porcentajes+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES))!=0)
             TextCreate(0,Porcentajes+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift], Low[shift],DoubleToString(Porcentaje2,0)+"%","Arial",12,clrAqua,0,ANCHOR_UPPER,false,
             false,true,0);
             else
             ObjectMove(0,Porcentajes+TimeToString(Time[shift],TIME_DATE|TIME_MINUTES),0,Time[shift],Low[shift]);
              
               Condicion=true;
               ArrowSignalDN[shift] = Low[shift] ;
              }
           }
         else
           {
            CRUCE=false;
           }

      if(Show_Alert == true && Condicion==true)
        {
         pattern = NombrePatron;
         setalert = 1;
        }


      if((setalert==1) && (shift==rates_total-1) && CRUCE==false)
        {
         CRUCE=true;
         ALERTAACTIVADA=true;
         if(Alert_PC)
            Alert(Symbol()," ",Period()," ",pattern);
         if(Alert_Movil)
            SendNotification("Formandose Patron en "+pattern+" "+Symbol()+" Temporalidad: "+EnumToString(PERIOD_CURRENT));
         setalert=0;
        }
      CumOffset=0;

     } // End of for loop

   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Concatenates string and time for a name.                         |
//+------------------------------------------------------------------+
string GetName(string aName,datetime timeshift)
  {
   return(aName + DoubleToString(timeshift, 0));
  }
//+------------------------------------------------------------------+
//| Creates an object to mark the pattern on the chart.              |
//+------------------------------------------------------------------+
void MarkPattern(const string name,const datetime time,const double price,const string shortname,const int fontsize,const color patterncolor)
  {
   ObjectCreate(0,name,OBJ_TEXT,0,time,price);
   ObjectSetString(0,name,OBJPROP_TEXT,shortname);
   ObjectSetString(0,name,OBJPROP_FONT,"Times New Roman");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,fontsize);
   ObjectSetInteger(0,name,OBJPROP_COLOR,patterncolor);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int ChartScaleGet(const long chart_ID=0)
  {
//--- preparamos la variable para obtener el valor de la propiedad
   long result=-1;
//--- reseteamos el valor del error
   ResetLastError();
//--- obtenemos el valor de la propiedad
   if(!ChartGetInteger(chart_ID,CHART_SCALE,0,result))
     {
      //--- mostramos el mensaje del error en el diario "Asesores Expertos"
      Print(__FUNCTION__+", Error Code = ",GetLastError());
     }
//--- devolvemos el valor de la propiedad del gráfico
   return((int)result);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

bool TextCreate(const long              chart_ID=0,               // ID del gráfico 
                const string            name="Text",              // nombre del objeto 
                const int               sub_window=0,             // número de subventana 
                datetime                time=0,                   // hora del punto de anclaje 
                double                  price=0,                  // precio del punto de anclaje 
                const string            text="Text",              // el texto 
                const string            font="Arial",             // fuente 
                const int               font_size=10,             // tamaño de la fuente 
                const color             clr=clrRed,               // color 
                const double            angle=0.0,                // inclinación del texto 
                const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // modo de anclaje 
                const bool              back=false,               // al fondo 
                const bool              selection=false,          // seleccionar para mover 
                const bool              hidden=true,              // ocultar en la lista de objetos 
                const long              z_order=0)                // prioridad para el clic del ratón 
  { 
//--- establecemos las coordenadas del punto de anclaje si todavía no han sido establecidas  
//--- anulamos el valor del error 
   ResetLastError(); 
//--- creamos el objeto "Texto" 
   if(!ObjectCreate(chart_ID,name,OBJ_TEXT,sub_window,time,price)) 
     { 
      Print(__FUNCTION__, 
            ": ¡Fallo al crear el objeto \"Texto\"! Código del error = ",GetLastError()); 
      return(false); 
     } 
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
//--- activar (true) o desactivar (false) el modo de desplazamiento del texto con ratón 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection); 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection); 
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos 
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden); 
//--- establecemos la prioridad para obtener el evento de cliquear sobre el gráfico 
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order); 
//--- ejecución con éxito 
   return(true); 
  } 