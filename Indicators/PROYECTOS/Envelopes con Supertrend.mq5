//+------------------------------------------------------------------+
//|                                   SUPERTREND CON ENVELOPES       |
//|                                      Modifier: Claudio Chumpitaz |
//|                      https://www.mql5.com/es/users/claudioangelo |
//|                          Based on MT4 indicator by: Carl Sanders |
//+------------------------------------------------------------------+

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"
#property description "Experto Envelopes con Supertrend"

#property indicator_chart_window
#property indicator_buffers 6
#property indicator_plots   5

#property indicator_label1  "SELL"
#property indicator_color1  clrOrange
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2  "BUY"
#property indicator_color2  clrOrange
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

#property indicator_label3  "EnvelopeUP"
#property indicator_color3  clrMagenta
#property indicator_type3   DRAW_LINE
#property indicator_style3  STYLE_SOLID
#property indicator_width3  1

#property indicator_label4  "EnvelopeDN"
#property indicator_color4  clrAqua
#property indicator_type4   DRAW_LINE
#property indicator_style4  STYLE_SOLID
#property indicator_width4  1

#property indicator_label5  "SuperTrend" 
#property indicator_type5   DRAW_COLOR_LINE 
//--- estableceremos 5 colores para colorear cada barra (se almacenan en un array especial) 
#property indicator_color5  clrGreen,clrRed // (se puede especificar hasta 64 colores) 
#property indicator_style5  STYLE_SOLID 
#property indicator_width15  1 

input color ColorTexto=Aqua;

input bool Show_Alert=true; //ACTIVAR ALERTA

input bool VelasOpuestasEnVolumen=true;
input bool VelasOpuestasEnVolumen_Alert=true;

//Change it to true if you broker uses extra digit in quotes
input bool UseExtraDigit=false;


input string SeparadorST="----SUPERTREND----";
input int    Periode=14;
input double Multiplier=3;
bool   Show_Filling=false; // Show as DRAW_FILLING

input string SeparadorEnv="----ENVELOPES----";
input int    EnvPeriod=10;
input int ShiftEnv=0;
input ENUM_MA_METHOD  Mode_Ema_Env=MODE_SMA;
input ENUM_APPLIED_PRICE AppliedPriceEnve=PRICE_CLOSE;
input double DesviationEnv=0.10;


int Text_VelasOpuestas=10;

//input bool VelasRSI=true;
//input bool VelasRSI_Alert=false;

//---- buffers
double ArrowSignalUP[];
double ArrowSignalDN[];
double EnvelopesUP[];
double EnvelopesDN[];
double SuperTrendColor[];
double SuperTrend[];

string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
int VALORVELASOPUESTAS=0;

double Candle_WickBody_Percent=0;

int DefinitionEnvelopes;
int  DefinitionSupertrend;

color COLORVO=Aqua;

int paso=0;
bool CUENTA=false;
bool ALERTAACTIVADA=false;
datetime TiempoPrevio=0;
int MAXIMO=0;
int vez=1;

int PeriodoMaximo=0;

datetime UNTIL=D'2020.11.15 00:00';   
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   PeriodoMaximo=EnvPeriod>Periode?EnvPeriod:Periode;

   DefinitionEnvelopes=iEnvelopes(Symbol(),PERIOD_CURRENT,EnvPeriod,ShiftEnv,Mode_Ema_Env,AppliedPriceEnve,DesviationEnv);
   if(DefinitionEnvelopes==INVALID_HANDLE)
     {
      return(INIT_FAILED);
     }

   DefinitionSupertrend=iCustom(Symbol(),PERIOD_CURRENT,"PROYECTOS//supertrend",Periode,Multiplier,Show_Filling);
   if(DefinitionSupertrend==INVALID_HANDLE)
   return(INIT_FAILED);
   
   if(UNTIL<TimeCurrent())
   return(INIT_FAILED);

   IndicatorSetString(INDICATOR_SHORTNAME,"PatronesWhiteTigerRSICruce");

   SetIndexBuffer(0,ArrowSignalUP,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalDN,INDICATOR_DATA);
   SetIndexBuffer(2,EnvelopesUP,INDICATOR_DATA);
   SetIndexBuffer(3,EnvelopesDN,INDICATOR_DATA);
   SetIndexBuffer(4,SuperTrend,INDICATOR_DATA);
   SetIndexBuffer(5,SuperTrendColor,INDICATOR_COLOR_INDEX);

   PlotIndexSetInteger(0,PLOT_ARROW,170);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetInteger(1,PLOT_ARROW,170);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   ArraySetAsSeries(ArrowSignalDN,true);
   ArraySetAsSeries(ArrowSignalUP,true);

   ArraySetAsSeries(EnvelopesDN,true);
   ArraySetAsSeries(EnvelopesUP,true);
   ArraySetAsSeries(SuperTrend,true);
   ArraySetAsSeries(SuperTrendColor,true);

   ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);

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
     
   Comment("Periodo de Prueba hasta ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
   
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
  
   if(UNTIL>TimeCurrent()){
   ArraySetAsSeries(Time,true);
   ArraySetAsSeries(High,true);
   ArraySetAsSeries(Low,true);
   ArraySetAsSeries(Close,true);
   ArraySetAsSeries(Open,true);
   
   if(BarsCalculated(DefinitionEnvelopes)<rates_total)
      return(0);
   if(BarsCalculated(DefinitionSupertrend)<rates_total)
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
   if(CopyBuffer(DefinitionEnvelopes,0,0,to_copy,EnvelopesUP)<=0)
      return(0);
   if(CopyBuffer(DefinitionEnvelopes,1,0,to_copy,EnvelopesDN)<=0)
      return(0);
   if(CopyBuffer(DefinitionSupertrend,2,0,to_copy,SuperTrend)<=0)
      return(0);
   if(CopyBuffer(DefinitionSupertrend,3,0,to_copy,SuperTrendColor)<=0)
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

   if(prevtime==Time[0] && prev_calculated!=0)
     {
      return(rates_total);
     }
   prevtime=Time[0];


   for(shift=0; shift<rates_total-(100); shift++)
     {
      CumOffset= 0;
      setalert = 0;
      counter=shift;
      Range=0;
      AvgRange=0;
      ArrowSignalUP[shift+1]=EMPTY_VALUE;
      ArrowSignalDN[shift+1]=EMPTY_VALUE;
      ArrowSignalUP[0]=EMPTY_VALUE;
      ArrowSignalDN[0]=EMPTY_VALUE;

      for(counter = shift; counter <= shift + 9; counter++)
         AvgRange = AvgRange + MathAbs(High[counter] - Low[counter]);
      Range=AvgRange/10;

      for(int i=0; i<10; i++)
        {

         O[i]=Open[shift+i];
         H[i]=High[shift+i];
         L[i]=Low[shift+i];
         C[i]=Close[shift+i];

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

         CL[i]=High[shift+i]-Low[shift+i];
         BL[i] = Open[shift+i] - Close[shift+i];
         UW[i] = High[shift+i] - BodyHigh[i];
         LW[i] = BodyLow[i] - Low[shift+i];
         BLa[i]= MathAbs(BL[i]);
         BL90[i]=BLa[i]*Candle_WickBody_Percent;
         BB[i]=(BLa[i]/_Point)/10;//TAMAÑO DEL VAOR ABSOUTO DEL TAMAÑO DEL CUERPO EN PIPS NORMALES
        }

      

      bool Condicion=false;

      if(VelasOpuestasEnVolumen == true)
        {

         if(EnvelopesUP[shift+1]<C[1] && SuperTrendColor[shift+1]==1)
           {
            Condicion=true;

            CumOffset = CumOffset+IncOffset;
            ArrowSignalUP[shift+1] = High[shift+1] + (Pointer_Offset*_Point);
           }

         else
            if(EnvelopesDN[shift+1]>C[1] && SuperTrendColor[shift+1]==0)
              {
               Condicion=true;

               CumOffset = CumOffset+IncOffset;
               ArrowSignalDN[shift+1] = Low[shift+1] - (Pointer_Offset*_Point);
              }
        }
      if(VelasOpuestasEnVolumen_Alert == true)
        {

         if(shift==0 && Condicion==true)
           {

            if(Show_Alert == true)
              {
               setalert = 1;
              }
           }
        }



      if((setalert==1) && (shift==0))
        {
         Alert(Symbol()," ",period," ",pattern);
         setalert=0;
         SendNotification("Formandose Patron en "+Symbol()+" Temporalidad: "+EnumToString(PERIOD_CURRENT));
        }
      CumOffset=0;

     } // End of for loop
   vez=0;
   }
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
