
//+------------------------------------------------------------------+
//|                      Patrones Regresiva Alerta Mitad Vela        |
//|                                      Modifier: Claudio Chumpitaz |
//|                      https://www.mql5.com/es/users/claudioangelo |
//|                          Based on MT4 indicator by: Carl Sanders |
//+------------------------------------------------------------------+

//double KArray[];
//double RSIMAIN[];
//input uint RSI_Period=14;

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"
#property description "Indicador que avisa mediante una alerta la formacion de un patron regresivo"
#property description "con vela recien formandose- en otras palabras te avisa cuando se esta formando"
#property description "el patron regresivo y no cuando ha terminado de formarse la vela"

#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots   1

#property indicator_color1  Orange
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1



string label_name="mainwindow_label";

int window=-1;

input color ColorTexto=Aqua;
input bool PatronConEma=true;//ACTIVAR CONDICION EMA
input int EMA_Period=20;     // Periodo del EMA
input int EMA_Shift=0;        // Desplazamiento horizontal del indicador del EMA
input ENUM_MA_METHOD       EMA_Method=MODE_SMA;         // Tipo de suavizado del EMA
input   ENUM_APPLIED_PRICE   EMA_Applied_Price=PRICE_CLOSE;      // Tipo de precio o manejador del EMA

input bool Show_Alert=true; //ACTIVAR ALERTA
input int TiempoDeEspera_segundos=30; 

input bool VelasOpuestasEnVolumen=true;
input bool VelasOpuestasEnVolumen_Alert=true; 

//Change it to true if you broker uses extra digit in quotes
input bool UseExtraDigit=false;


input double M1=0.5; //M1 Velas mayores a (pips)
input double M5=1;   //M5 Velas mayores a (pips)
input double M15=4;  //M15 Velas mayores a (pips)
input double M30=4;  //M30 Velas mayores a (pips)
input double H1=4;   //H1 Velas mayores a (pips)
input double H4=10;  //H4 Velas mayores a (pips)
input double D1=15;  //D1 Velas mayores a (pips)
input double W1=50;  //W1 Velas mayores a (pips)
input double MN1=50;  //MM1 Velas mayores a (pips)

int Text_VelasOpuestas=8;

//input bool VelasRSI=true;
//input bool VelasRSI_Alert=false;
int Text_VelasRSI=8;

//---- buffers
double ArrowSignal[];

double EMAbuffer[];

string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;   
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
double VALORVELASOPUESTAS=0;

double Candle_WickBody_Percent=0;

//int DefinitionEstochastic;
//int DefinitionRSI;
int DefinitionEMA;
color COLORVO=Aqua;

int paso=0;
bool CUENTA=false;
bool ALERTAACTIVADA=false;
datetime TiempoPrevio=0;
int MAXIMO=0;
int vez=1;


//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnInit()
  {
   if(ChartScaleGet()<2)
      paso=0;
   else
      paso=1;
   //DefinitionRSI=iRSI(NULL,PERIOD_CURRENT,RSI_Period,PRICE_CLOSE);
   DefinitionEMA=iMA(NULL,PERIOD_CURRENT,EMA_Period,EMA_Shift,EMA_Method,EMA_Applied_Price);


   IndicatorSetString(INDICATOR_SHORTNAME,"PRM");
//172, 115
   PlotIndexSetInteger(0,PLOT_ARROW,170);
   
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);

   SetIndexBuffer(0,ArrowSignal);

   ArraySetAsSeries(ArrowSignal,true);


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
         VALORVELASOPUESTAS=M1;
         break;
      case PERIOD_M5:
         period="M5";
        
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VALORVELASOPUESTAS=M5;
         
         break;
      case PERIOD_M15:
         period="M15";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VALORVELASOPUESTAS=M15;
         
         break;
      case PERIOD_M30:
         period="M30";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VALORVELASOPUESTAS=M30;
         break;
      case PERIOD_H1:
         period="H1";
         Pointer_Offset=30;
         High_Offset=20;
         Offset_Subida_VelaOpuesta=10;
         Offset_Caida_VelaOpuesta=30;
         IncOffset=40;
         VALORVELASOPUESTAS=H1;
         break;
      case PERIOD_H4:
         period="H4";
         Pointer_Offset=70;
         High_Offset=150;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=120;
         VALORVELASOPUESTAS=H4;
         break;
      case PERIOD_D1:
         period="D1";
         Pointer_Offset=150;
         High_Offset=220;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=180;
         VALORVELASOPUESTAS=D1;
         break;
      case PERIOD_W1:
         period="W1";
         Pointer_Offset=9;
         High_Offset=35;
         Offset_Subida_VelaOpuesta=80;
         Offset_Caida_VelaOpuesta=80;
         IncOffset=35;
         VALORVELASOPUESTAS=W1;
         break;
      case PERIOD_MN1:
         period="MN";
         Pointer_Offset=9;
         High_Offset=45;
         Offset_Subida_VelaOpuesta=140;
         Offset_Caida_VelaOpuesta=140;
         IncOffset=45;
         VALORVELASOPUESTAS=MN1;
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
   ArraySetAsSeries(Time,true);
   ArraySetAsSeries(High,true);
   ArraySetAsSeries(Low,true);
   ArraySetAsSeries(Close,true);
   ArraySetAsSeries(Open,true);
   
   while(CopyBuffer(DefinitionEMA,0,0,3,EMAbuffer)<0)
     {return(rates_total);
     }
     

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

   if(prevtime==0 || rates_total-prev_calculated!=0)
     {
      for(int i=rates_total-1; i>=0; i--)
        {
         ArrowSignal[i]=0;
        }
     }



   if(prevtime==Time[0] && ALERTAACTIVADA==true)
     {
     if(ObjectFind(0,label_name)<0)
     {
      Print("Generating a label");
      ObjectCreate(0,label_name,OBJ_LABEL,0,0,0);           
      ObjectSetInteger(0,label_name,OBJPROP_XDISTANCE,30);
      ObjectSetInteger(0,label_name,OBJPROP_YDISTANCE,30);
      ObjectSetInteger(0,label_name,OBJPROP_COLOR,ColorTexto);
      ObjectSetString(0,label_name,OBJPROP_TEXT,"Formandose Patron Reversiva");
      ObjectSetString(0,label_name,OBJPROP_FONT,"Comic Sans");
      ObjectSetInteger(0,label_name,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,label_name,OBJPROP_SELECTABLE,false);
      ChartRedraw(0);                                      
     }
      return(rates_total);
     }
     
     if(ObjectFind(0,label_name)>=0)
      ObjectDelete(0,label_name);
   
   if(prevtime!=Time[0]){
   vez=1;
   ALERTAACTIVADA=false;
   CUENTA=false;
   }
   prevtime=Time[0];

   for(shift=100; shift<MAXIMO; shift++)
     {
      ArrowSignal[shift] = Low[shift] - (Pointer_Offset*_Point);
              
     } // End of for loop
     vez=0;

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
