//+------------------------------------------------------------------+
//|                              Patron con Estrategia Bollinger.mq5 |
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
#property indicator_buffers 8
#property indicator_plots   5

#property indicator_color1  Orange
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_color2  Orange
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

#property indicator_label3  "ColorLine1" 
#property indicator_type3   DRAW_COLOR_LINE 
//--- estableceremos 5 colores para colorear cada barra (se almacenan en un array especial) 
#property indicator_color3  clrGreen,clrOrange // (se puede especificar hasta 64 colores) 
#property indicator_style3  STYLE_SOLID 
#property indicator_width3  1 

#property indicator_label4  "ColorLine2" 
#property indicator_type4   DRAW_COLOR_LINE 
//--- estableceremos 5 colores para colorear cada barra (se almacenan en un array especial) 
#property indicator_color4  clrRed,clrBlue // (se puede especificar hasta 64 colores) 
#property indicator_style4  STYLE_SOLID 
#property indicator_width4  1 

#property indicator_label5  "ColorLine3" 
#property indicator_type5   DRAW_COLOR_LINE 
//--- estableceremos 5 colores para colorear cada barra (se almacenan en un array especial) 
#property indicator_color5  clrViolet,clrDeepPink // (se puede especificar hasta 64 colores) 
#property indicator_style5  STYLE_SOLID 
#property indicator_width5  1 

string label_name="mainwindow_label";

color ColorTexto=Aqua;

bool Show_Alert=true; //ACTIVAR ALERTA

bool VelasOpuestasEnVolumen=true;
bool VelasOpuestasEnVolumen_Alert=false;

//Change it to true if you broker uses extra digit in quotes
bool UseExtraDigit=false;

int EMA_Rapida;
int EMA_Media;
int EMA_Lenta;

int Text_VelasOpuestas=8;
int Text_VelasRSI=8;

//---- buffers
double ArrowSignalBUY[];
double ArrowSignalSELL[];
double EMA_Rapida_Buffer[];
double EMA_Media_Buffer[];
double EMA_Lenta_Buffer[];

double EMA_Rapida_Colors[];
double EMA_Media_Colors[];
double EMA_Lenta_Colors[];

string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
int VALORVELASOPUESTAS=0;

double Candle_WickBody_Percent=0;

int DefinitionBollinger;

color COLORVO=clrAqua;

input string Parameter_EMA_1="*** Parameter_EMA_1***";
input int Period_EMA1=10;
input int Shift_EMA1=0;
input ENUM_MA_METHOD Mode_EMA1=MODE_SMA;
input ENUM_APPLIED_PRICE AppliedPrice_EMA1=PRICE_CLOSE;
input string Parameter_EMA_2="*** Parameter_EMA_2***";
input int Period_EMA2=20;
input int Shift_EMA2=0;
input ENUM_MA_METHOD Mode_EMA2=MODE_SMA;
input ENUM_APPLIED_PRICE AppliedPrice_EMA2=PRICE_CLOSE;
input string Parameter_EMA_3="*** Parameter_EMA_3***";
input int Period_EMA3=30;
input int Shift_EMA3=0;
input ENUM_MA_METHOD Mode_EMA3=MODE_SMA;
input ENUM_APPLIED_PRICE AppliedPrice_EMA3=PRICE_CLOSE;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+


datetime UNTIL=D'2020.12.09 00:00'; 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
//DefinitionRSI=iRSI(NULL,PERIOD_CURRENT,RSI_Period,PRICE_CLOSE);
   EMA_Lenta=iMA(Symbol(),PERIOD_CURRENT,Period_EMA1,Shift_EMA1,Mode_EMA1,AppliedPrice_EMA1);
   if(EMA_Lenta==INVALID_HANDLE)
      return(INIT_FAILED);
    EMA_Media=iMA(Symbol(),PERIOD_CURRENT,Period_EMA2,Shift_EMA2,Mode_EMA2,AppliedPrice_EMA2);
   if(EMA_Media==INVALID_HANDLE)
      return(INIT_FAILED);
    EMA_Rapida=iMA(Symbol(),PERIOD_CURRENT,Period_EMA3,Shift_EMA3,Mode_EMA3,AppliedPrice_EMA3);
   if(EMA_Rapida==INVALID_HANDLE)
      return(INIT_FAILED);   
      
   ObjectsDeleteAll(0,0,OBJ_TEXT);
   
   ArraySetAsSeries(ArrowSignalBUY,false);
   ArraySetAsSeries(ArrowSignalSELL,false);
   ArraySetAsSeries(EMA_Lenta_Buffer,false);
   ArraySetAsSeries(EMA_Media_Buffer,false);
   ArraySetAsSeries(EMA_Rapida_Buffer,false);
   ArraySetAsSeries(EMA_Lenta_Colors,false);
   ArraySetAsSeries(EMA_Media_Colors,false);
   ArraySetAsSeries(EMA_Rapida_Colors,false);

   IndicatorSetString(INDICATOR_SHORTNAME,"PRM");
   PlotIndexSetInteger(0,PLOT_ARROW,225);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);
   SetIndexBuffer(0,ArrowSignalBUY);
   PlotIndexSetInteger(1,PLOT_ARROW,226);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,0);
   SetIndexBuffer(1,ArrowSignalSELL);
   
   SetIndexBuffer(2,EMA_Lenta_Buffer,INDICATOR_DATA); 
   SetIndexBuffer(3,EMA_Lenta_Colors,INDICATOR_COLOR_INDEX); 
   
   SetIndexBuffer(4,EMA_Media_Buffer,INDICATOR_DATA); 
   SetIndexBuffer(5,EMA_Media_Colors,INDICATOR_COLOR_INDEX); 
   
   SetIndexBuffer(6,EMA_Rapida_Buffer,INDICATOR_DATA); 
   SetIndexBuffer(7,EMA_Rapida_Colors,INDICATOR_COLOR_INDEX); 

   switch(_Period)
     {
      case PERIOD_M1:
         period="M1";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VALORVELASOPUESTAS=1;
         break;
      case PERIOD_M5:
         period="M5";

         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VALORVELASOPUESTAS=1;

         break;
      case PERIOD_M15:
         period="M15";
         Pointer_Offset=20;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VALORVELASOPUESTAS=4;

         break;
      case PERIOD_M30:
         period="M30";
         Pointer_Offset=20;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VALORVELASOPUESTAS=4;
         break;
      case PERIOD_H1:
         period="H1";
         Pointer_Offset=30;
         High_Offset=20;
         Offset_Subida_VelaOpuesta=10;
         Offset_Caida_VelaOpuesta=30;
         IncOffset=40;
         VALORVELASOPUESTAS=4;
         break;
      case PERIOD_H4:
         period="H4";
         Pointer_Offset=70;
         High_Offset=150;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=120;
         VALORVELASOPUESTAS=10;
         break;
      case PERIOD_D1:
         period="D1";
         Pointer_Offset=150;
         High_Offset=220;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=180;
         VALORVELASOPUESTAS=15;
         break;
      case PERIOD_W1:
         period="W1";
         Pointer_Offset=9;
         High_Offset=35;
         Offset_Subida_VelaOpuesta=80;
         Offset_Caida_VelaOpuesta=80;
         IncOffset=35;
         VALORVELASOPUESTAS=50;
         break;
      case PERIOD_MN1:
         period="MN";
         Pointer_Offset=9;
         High_Offset=45;
         Offset_Subida_VelaOpuesta=140;
         Offset_Caida_VelaOpuesta=140;
         IncOffset=45;
         VALORVELASOPUESTAS=50;
         break;
     }

   if(UseExtraDigit)
     {
      Pointer_Offset*=10;
      High_Offset*=10;
      Offset_Subida_VelaOpuesta*=10;
      Offset_Caida_VelaOpuesta*=10;
      IncOffset*=10;
      VALORVELASOPUESTAS=50;
     }
   Comment("TEST UNTIL:",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
   return (INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,0,OBJ_TEXT);
   Comment("");
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
   if(UNTIL<TimeCurrent())
   return(rates_total);
   
   ArraySetAsSeries(Time,false);
   ArraySetAsSeries(High,false);
   ArraySetAsSeries(Low,false);
   ArraySetAsSeries(Close,false);
   ArraySetAsSeries(Open,false);
   
    if(BarsCalculated(EMA_Lenta)<rates_total)
    return(0);
    if(BarsCalculated(EMA_Media)<rates_total)
    return(0);
    if(BarsCalculated(EMA_Rapida)<rates_total)
    return(0);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
////// NAIN LINE............
   if(CopyBuffer(EMA_Lenta,MAIN_LINE,0,to_copy,EMA_Lenta_Buffer)<=0)
      return(0);
   if(CopyBuffer(EMA_Media,MAIN_LINE,0,to_copy,EMA_Media_Buffer)<=0)
      return(0);
   if(CopyBuffer(EMA_Rapida,MAIN_LINE,0,to_copy,EMA_Rapida_Buffer)<=0)
      return(0);

   static double Range,AvgRange;
   static datetime prevtime=0;
   static int counter,setalert;
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

   if(prevtime==Time[rates_total-1])
      return(rates_total);

   prevtime=Time[rates_total-1];
   
   int START=0;
   
   if(prev_calculated!=0)
      START=rates_total-1;
   else
     {
      START=12;
      ArrayInitialize(ArrowSignalBUY,0);
      ArrayInitialize(ArrowSignalSELL,0);
      ArrayInitialize(EMA_Lenta_Colors,0);
      ArrayInitialize(EMA_Media_Colors,0);
      ArrayInitialize(EMA_Rapida_Colors,0);
     }

   
   for(shift=START; shift<rates_total; shift++)
     {
      
      CumOffset= 0;
      setalert = 0;
      counter=shift;
      Range=0;
      AvgRange=0;
      
      if(EMA_Lenta_Buffer[shift-1]>EMA_Lenta_Buffer[shift])
      EMA_Lenta_Colors[shift]=0;
      else
      EMA_Lenta_Colors[shift]=1;
      
      if(EMA_Media_Buffer[shift-1]>EMA_Media_Buffer[shift])
      EMA_Media_Colors[shift]=0;
      else
      EMA_Media_Colors[shift]=1;
      
      if(EMA_Rapida_Buffer[shift-1]>EMA_Rapida_Buffer[shift])
      EMA_Rapida_Colors[shift]=0;
      else
      EMA_Rapida_Colors[shift]=1;

      //for(counter = shift; counter <= shift + 9; counter++)
        // AvgRange = AvgRange + MathAbs(High[counter] - Low[counter]);
      //Range=AvgRange/10;

      for(int i=0; i<10; i++)
        {
         O[i]=Open[shift-i];
         H[i]=High[shift-i];
         L[i]=Low[shift-i];
         C[i]=Close[shift-i];

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
         CL[i]=High[shift-i]-Low[shift-i];
         BL[i] = Open[shift-i] - Close[shift-i];
         UW[i] = High[shift-i] - BodyHigh[i];
         LW[i] = BodyLow[i] - Low[shift-i];
         BLa[i]= MathAbs(BL[i]);
         BL90[i]=BLa[i]*Candle_WickBody_Percent;
         BB[i]=(BLa[i]/_Point)/10;//TAMAÑO DEL VAOR ABSOUTO DEL TAMAÑO DEL CUERPO EN PIPS NORMALES
        }
     
      bool Condicion=false;

      // Check for Velas opuestas en Volumen
      if( (C[1]>O[1] && LW[1]==0) || (C[1]<O[1] && UW[1]==0)  )
        {
         if(VelasOpuestasEnVolumen == true)
           {
            if(O[1]>C[1]) ///BUY
              {
                  Condicion=true;
                  CumOffset = CumOffset+IncOffset;
                 ArrowSignalSELL[shift-1] = High[shift-1] + (Pointer_Offset*_Point);
              }

            else
               if(O[1]<C[1])  ///SELLL
                 {
                     Condicion=true;
                     ArrowSignalBUY[shift-1] = Low[shift-1] - (Pointer_Offset*_Point);

                 }
           }
         if(VelasOpuestasEnVolumen_Alert == true)
           {

            if(shift==rates_total-1 && Condicion==true)
              {
               if(setalert == 0 && Show_Alert == true)
                 {
                  setalert = 1;
                 }
              }
           }

        }

      if((setalert==1) && (shift==rates_total-1))
        {
         Alert(Symbol()," ",period," ",pattern);
         setalert=0;
         SendNotification("Formandose Patron en "+Symbol()+" Temporalidad: "+EnumToString(PERIOD_CURRENT));
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
