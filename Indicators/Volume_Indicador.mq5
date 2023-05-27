//+------------------------------------------------------------------+
//|                                             Volume_Indicador.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"
#property description "Indicador Volumen"

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

input color ColorTexto=clrAqua;

input bool Show_Alert=true; //ACTIVAR ALERTA

bool VelasOpuestasEnVolumen=true;
bool VelasOpuestasEnVolumen_Alert=true;

//Change it to true if you broker uses extra digit in quotes
bool UseExtraDigit=false;

int Text_VelasOpuestas=10;

input string Settings_Original_Indi="---------------Settings Original Indi---------------";//---------------------------------------------
input double CruceBanda=5; // CruceBanda (Porcentaje)
input double CruceSopRes=10; // CruceSopRes (Porcentaje)
input int Multiplo_Mayor_Volume=3;
input string Settings_Waddah_Attar_Explosion="---------------Settings Waddah Atta Explosion---------------";//---------------------------------------------
input string NombreWaddah="waddah_attar_explosion";
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
input string Settings_Rachan="---------------Settings Rachan---------------";//---------------------------------------------
input string NombreRachan="Rachan Levis25030";
input double SobreCompra = 95;
input double Periodo_Rachan = 2;//Periodo
input double SobreVenta = 5;
input string Settings_RSI="---------------Settings RSI---------------";//---------------------------------------------
input int Period_RSI=2;
input ENUM_APPLIED_PRICE AppliedPrice_RSI=PRICE_CLOSE;
input string Settings_Sup_Res="---------------Settings Sup Res---------------";//---------------------------------------------
input string Nombre_Sup_Res="Support_and_Resistance";
input string Settings_Bands="---------------Settings Bands---------------";//---------------------------------------------
input int Period_Band=85;
input int Shift_Band=0;
input double Deviation_Band=2;
input ENUM_APPLIED_PRICE AppliedPrice_Band=PRICE_CLOSE;

//input bool VelasRSI=true;
//input bool VelasRSI_Alert=false;

//---- buffers
double ArrowSignalUP[];
double ArrowSignalDN[];

string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
int VALORVELASOPUESTAS=0;

double Candle_WickBody_Percent=0;

//color COLORVO=Aqua;

int paso=0;
bool CUENTA=false;
bool ALERTAACTIVADA=false;
datetime TiempoPrevio=0;
int MAXIMO=0;
int vez=1;

int PeriodoMaximo=0;

bool CRUCE=false;

int Volume,Bands,Sop_Res,RSI,Rachan;
double Volume_Buffer[];
double Volume_Color_Buffer[];
double Volume_Linea_Buffer[];
double RSI_Buffer[];
double Bands_UP_Buffer[];
double Bands_DN_Buffer[];
double SOP[],RES[];
double R_Sell[],R_Buy[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   Volume=iCustom(Symbol(),PERIOD_CURRENT,NombreWaddah,Fast_MA,Slow_MA,BBPeriod,BBDeviation,Sensetive,
                  DeadZonePip,ExplosionPower,TrendPower,AlertWindow,AlertCount,AlertLong,AlertShort,AlertExitLong,AlertExitShort,IndicatorLevel);

   Bands=iBands(Symbol(),PERIOD_CURRENT,Period_Band,Shift_Band,Deviation_Band,AppliedPrice_Band);

   Sop_Res=iCustom(Symbol(),PERIOD_CURRENT,Nombre_Sup_Res);

   RSI=iRSI(Symbol(),PERIOD_CURRENT,Period_RSI,AppliedPrice_RSI);

   Rachan=iCustom(Symbol(),PERIOD_CURRENT,NombreRachan,SobreCompra,Periodo_Rachan,SobreVenta,false);

   IndicatorSetString(INDICATOR_SHORTNAME,"PatronesVolumen");
//172, 115
   PlotIndexSetInteger(0,PLOT_ARROW,181);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(0,ArrowSignalUP);
   SetIndexBuffer(1,ArrowSignalDN);

   PlotIndexSetInteger(1,PLOT_ARROW,181);

   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   ArraySetAsSeries(ArrowSignalDN,false);
   ArraySetAsSeries(ArrowSignalUP,false);


   ArraySetAsSeries(Volume_Buffer,true);
   ArraySetAsSeries(Volume_Color_Buffer,true);
   ArraySetAsSeries(Volume_Linea_Buffer,true);

   ArraySetAsSeries(RSI_Buffer,true);
   ArraySetAsSeries(Bands_DN_Buffer,true);
   ArraySetAsSeries(Bands_UP_Buffer,true);
   ArraySetAsSeries(SOP,true);
   ArraySetAsSeries(RES,true);
   ArraySetAsSeries(R_Sell,true);
   ArraySetAsSeries(R_Buy,true);

   ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);

   /*
      Comment("\n","\n","Bearish",
              "\n","SS 2,3,4 - Shooting Star",
              "\n","E_Star   - Evening Star",
              "\n","E_Doji   - Evening Doji Star",
              "\n","DCC      - Dark Cloud Pattern",
              "\n","S_E      - Bearish Engulfing Pattern",
              "\n","\n","Bullish",
              "\n","HMR 2,3,4 - Bullish Hammer",
              "\n","M_Star    - Morning Star",
              "\n","M_Doji    - Morning Doji Star",
              "\n","P_L       - Piercing Line Pattern",
              "\n","L_E       - Bullish Engulfing Pattern");
   */
//Defining the pip and ratio dependencies based on the timeframe
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
         ObjectSetInteger(0,label_name,OBJPROP_COLOR,ColorTexto);
         ObjectSetString(0,label_name,OBJPROP_TEXT,"Formandose Patron Waddath_Attar_Explosion");
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
      counter=shift;
      Range=0;
      AvgRange=0;
      ArrowSignalUP[shift]=EMPTY_VALUE;
      ArrowSignalDN[shift]=EMPTY_VALUE;

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

      CopyBuffer(Volume,0,rates_total-1-shift,3,Volume_Buffer);
      CopyBuffer(Volume,1,rates_total-1-shift,3,Volume_Color_Buffer);
      CopyBuffer(Volume,2,rates_total-1-shift,3,Volume_Linea_Buffer);
      CopyBuffer(RSI,0,rates_total-1-shift,3,RSI_Buffer);
      CopyBuffer(Bands,1,rates_total-1-shift,3,Bands_UP_Buffer);
      CopyBuffer(Bands,2,rates_total-1-shift,3,Bands_DN_Buffer);
      CopyBuffer(Sop_Res,0,rates_total-1-shift,3,SOP);
      CopyBuffer(Sop_Res,1,rates_total-1-shift,3,RES);
      CopyBuffer(Rachan,0,rates_total-1-shift,3,R_Buy);
      CopyBuffer(Rachan,1,rates_total-1-shift,3,R_Sell);

      bool Condicion=false;
      ALERTAACTIVADA=false;
      
     if(Time[shift]== D'2021.05.29 23:33')
      Comment("MACD ", Volume_Buffer[0],"   SEÑAL ",Volume_Linea_Buffer[0],"  RSI ",RSI_Buffer[0]);

      if(VelasOpuestasEnVolumen == true)
        {

         if(RSI_Buffer[1]>=50 && RSI_Buffer[2]<50 && RES[2]<BodyHigh[1]-((BLa[1]*CruceSopRes)/100.0) && ( (C[3]<O[3] && C[2]<O[2]) || (C[2]>O[2])) 
            && Bands_UP_Buffer[1]<BodyHigh[1]-((BLa[0]*CruceBanda)/100.0) && (R_Sell[1]>0 && R_Sell[1]!=EMPTY_VALUE)
            && Volume_Linea_Buffer[1]*(Multiplo_Mayor_Volume+1)<=Volume_Buffer[1]  && C[0]<O[0] && C[1]>O[1] )
           {
            Condicion=true;
            CumOffset = CumOffset+IncOffset;
            ArrowSignalUP[shift] = High[shift] + (Pointer_Offset*_Point);
           }

         else
            if(RSI_Buffer[1]<=50 && RSI_Buffer[2]>50 && SOP[2]>BodyLow[1]+((BLa[1]*CruceSopRes)/100.0) && ( (C[3]>O[3] && C[2]>O[2]) || (C[2]<O[2])) 
               && Bands_DN_Buffer[1]>BodyLow[1]+((BLa[1]*CruceBanda)/100.0) && (R_Buy[1]>0 && R_Buy[1]!=EMPTY_VALUE)
               && Volume_Linea_Buffer[1]*(Multiplo_Mayor_Volume+1)<=Volume_Buffer[1] && C[0]>O[0] && C[1]<O[1] )
              {
               Condicion=true;
               CumOffset = CumOffset+IncOffset;
               ArrowSignalDN[shift] = Low[shift] - (Pointer_Offset*_Point);
              }
            else
              {
               CRUCE=false;
              }
        }

      if(VelasOpuestasEnVolumen_Alert == true)
        {
         if(Show_Alert == true && Condicion==true)
           {
            pattern = "Cruce RSI";
            setalert = 1;
           }
        }


      if((setalert==1) && (shift==rates_total-1) && CRUCE==false)
        {
         CRUCE=true;
         ALERTAACTIVADA=true;
         Alert(Symbol()," ",period," ",pattern);
         setalert=0;
         SendNotification("Formandose Patron en "+Symbol()+" Temporalidad: "+EnumToString(PERIOD_CURRENT));
        }
      CumOffset=0;

     } // End of for loop
   vez=0;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
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
