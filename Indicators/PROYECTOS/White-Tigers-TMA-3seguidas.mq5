//+------------------------------------------------------------------+
//|                                   White-Tigers-TMA-3seguidas.mq5 |
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
#property indicator_buffers 4
#property indicator_plots   4

#property indicator_color1  clrOrange
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_color2  clrOrange
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

#property indicator_label3  "BUY STAR"
#property indicator_color3  clrMagenta
#property indicator_type3   DRAW_ARROW
#property indicator_style3  STYLE_SOLID
#property indicator_width3  1

#property indicator_label4  "SELL STAR"
#property indicator_color4  clrMagenta
#property indicator_type4   DRAW_ARROW
#property indicator_style4  STYLE_SOLID
#property indicator_width4  1

string label_name="mainwindow_label";

int window=-1;

input double PorcentajeSignal=70;
input double PorcentajeAlerta=30;

input color ColorTexto=Aqua;

input bool Show_Alert=true; //ACTIVAR ALERTA

input bool VelasOpuestasEnVolumen=true;
input bool VelasOpuestasEnVolumen_Alert=true;

//Change it to true if you broker uses extra digit in quotes
input bool UseExtraDigit=false;

enum ENUM_TIPE_MA
  {
   MediaMovilSimple=0,//Media Movil Simple
   MediaMovilExponencial=1,// Media Movil Exponencial
   MediaMovilSuavizada=2,// Media Movil Suavizada
   MediaMovilPonderada=3,// Media Movil Ponderada
   TMA=4,
  };

enum enMaTypes
  {
   ma_sma,    // Simple moving average
   ma_ema,    // Exponential moving average
   ma_smma,   // Smoothed MA
   ma_lwma    // Linear weighted MA
  };

input string SeparadorWT="----SEPARADOR WHITE TIGER----";
input ENUM_TIMEFRAMES TimeFrameWT=PERIOD_CURRENT;
input ENUM_TIPE_MA TipoMA=MediaMovilSimple;
input ENUM_APPLIED_PRICE TipoPrecio=PRICE_CLOSE;
input int PeriodosMA=5;
input bool MostrarLineasATR=true;
input string SeparadorATR="--------------";
input int PeriodosATR=110;
input double MultiplicadorATR=1;
input string SeparadorMax="--------------------";
input int MaxVelasHistorico=1000;

int Text_VelasOpuestas=8;

int Text_VelasRSI=8;

double ArrowSignalDN[];
double ArrowSignalUP[];
double ArrowSignalDN3[];
double ArrowSignalUP3[];
double WTUP[];
double WTDN[];

string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
int VALORVELASOPUESTAS=0;

double Candle_WickBody_Percent=0;

int DefinitionWT;
color COLORVO=Aqua;

bool ALERTAACTIVADA=false;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   DefinitionWT=iCustom(Symbol(),PERIOD_CURRENT,"WT_SuperT-MA_v4.7",0,1,"-",TimeFrameWT,TipoMA,TipoPrecio,PeriodosMA," ",MostrarLineasATR,PeriodosATR,MultiplicadorATR," ",MaxVelasHistorico);
//DefinitionWT=iCustom(Symbol(),PERIOD_CURRENT,"WT_SuperT-MA_v4.7",0,1,"-",0,0,0,20," ",false,110,2.6," ",1000);
   if(DefinitionWT==INVALID_HANDLE)
     {
      return(INIT_FAILED);
     }

   IndicatorSetString(INDICATOR_SHORTNAME,"PatronesWhiteTigerPorcentajes");
//172, 115
   SetIndexBuffer(0,ArrowSignalUP,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalDN,INDICATOR_DATA);
   SetIndexBuffer(2,ArrowSignalUP3,INDICATOR_DATA);
   SetIndexBuffer(3,ArrowSignalDN3,INDICATOR_DATA);
   
   PlotIndexSetInteger(0,PLOT_ARROW,170);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);
   PlotIndexSetInteger(1,PLOT_ARROW,170);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,0);
   PlotIndexSetInteger(2,PLOT_ARROW,170);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,0);
   PlotIndexSetInteger(3,PLOT_ARROW,170);
   PlotIndexSetDouble(3,PLOT_EMPTY_VALUE,0);

   ArraySetAsSeries(ArrowSignalUP,false);
   ArraySetAsSeries(ArrowSignalDN,false);
   ArraySetAsSeries(ArrowSignalUP3,false);
   ArraySetAsSeries(ArrowSignalDN3,false);
   
   ArraySetAsSeries(WTDN,true);
   ArraySetAsSeries(WTUP,true);

   ArrayInitialize(ArrowSignalUP,0);
   ArrayInitialize(ArrowSignalDN,0);
    ArrayInitialize(ArrowSignalUP3,0);
   ArrayInitialize(ArrowSignalDN3,0);

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
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VALORVELASOPUESTAS=4;

         break;
      case PERIOD_M30:
         period="M30";
         Pointer_Offset=9;
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
   ArraySetAsSeries(Time,false);
   ArraySetAsSeries(High,false);
   ArraySetAsSeries(Low,false);
   ArraySetAsSeries(Close,false);
   ArraySetAsSeries(Open,false);

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

   if(prevtime==Time[0] && ALERTAACTIVADA==true)
     {
      if(ObjectFind(0,label_name)<0)
        {
         Print("Generating a label");
         ObjectCreate(0,label_name,OBJ_LABEL,0,0,0);
         ObjectSetInteger(0,label_name,OBJPROP_XDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_YDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_COLOR,ColorTexto);
         ObjectSetString(0,label_name,OBJPROP_TEXT,"Formandose Patron WhiteTigerATR");
         ObjectSetString(0,label_name,OBJPROP_FONT,"Comic Sans");
         ObjectSetInteger(0,label_name,OBJPROP_FONTSIZE,10);
         ObjectSetInteger(0,label_name,OBJPROP_SELECTABLE,false);
         ChartRedraw(0);
        }
      return(rates_total);
     }

   if(ObjectFind(0,label_name)>=0)
      ObjectDelete(0,label_name);

   prevtime=Time[0];

   int START=15;
   if(prev_calculated!=0)
     {
      START=rates_total-2;
     }

   for(shift=START; shift<rates_total; shift++)
     {
      ArrowSignalDN[shift]=0;
      ArrowSignalUP[shift]=0;
      ArrowSignalDN3[shift]=0;
      ArrowSignalUP3[shift]=0;
      
      CumOffset= 0;
      setalert = 0;
      counter=shift;
      Range=0;
      AvgRange=0;

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

      CopyBuffer(DefinitionWT,0,rates_total-1-shift,3,WTUP);
      CopyBuffer(DefinitionWT,1,rates_total-1-shift,3,WTDN);

      bool Condicion=false;
      ALERTAACTIVADA=false;

      if(BodyLow[0]+(PorcentajeSignal/100)*BLa[0]<WTDN[0] ||  BodyHigh[0]-(PorcentajeSignal/100)*BLa[0]>WTUP[0])
        {

         if(VelasOpuestasEnVolumen == true)
           {


            if(BodyHigh[0]-(PorcentajeSignal/100)*BLa[0]>WTUP[0])
              {
               if(ArrowSignalDN[shift-1]!=0 && ArrowSignalDN[shift-2]!=0){
               if(shift!=rates_total-1){
               MarkPattern(GetName("VelasOPV",Time[shift]), Time[shift], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"VO", Text_VelasOpuestas, COLORVO);
               ArrowSignalDN3[shift] = High[shift] + (Pointer_Offset*_Point);}
               Condicion=true;
               }
               else{
               if(shift!=rates_total-1)ArrowSignalDN[shift] = High[shift] + (Pointer_Offset*_Point);
               }
               CumOffset = CumOffset+IncOffset;

              }

            else
               if(BodyLow[0]+(PorcentajeSignal/100)*BLa[0]<WTDN[0])
                 {
                  if(ArrowSignalUP[shift-1]!=0 && ArrowSignalUP[shift-2]!=0){
                  Condicion=true;
                  if(shift!=rates_total-1){
                  MarkPattern(GetName("VelasOPV",Time[shift]), Time[shift], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "VO", Text_VelasOpuestas, COLORVO);
                  ArrowSignalUP3[shift] = Low[shift] - (Pointer_Offset*_Point);}
                  }
                  else{
                  if(shift==rates_total-1)ArrowSignalUP[shift] = Low[shift] - (Pointer_Offset*_Point);
                  }
                  CumOffset = CumOffset+IncOffset;
                  
                 }
           }
         if(VelasOpuestasEnVolumen_Alert == true)
           {

            if(shift==rates_total-1 && Condicion==true)
              {
               ALERTAACTIVADA=true;

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

//+------------------------------------------------------------------+
