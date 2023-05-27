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
#property indicator_buffers 1
#property indicator_plots   1

#property indicator_color1  Orange
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1



string label_name="mainwindow_label";

int window=-1;

input color ColorTexto=Aqua;

input bool Show_Alert=true; //ACTIVAR ALERTA

input bool VelasOpuestasEnVolumen=true;
input bool VelasOpuestasEnVolumen_Alert=true; 

//Change it to true if you broker uses extra digit in quotes
input bool UseExtraDigit=false;

input string Separador="----BANDS BOLLINGER---";
input int PeriodoBollinger=25;
input int ShiftBollinger=0;
input double DesviationBollinger=2;
input ENUM_APPLIED_PRICE AppliedPriceBollinger=PRICE_CLOSE;

input double PorcentajeVela1=40;
input double PorcentajeVela2=40;

int Text_VelasOpuestas=8;

//input bool VelasRSI=true;
//input bool VelasRSI_Alert=false;
int Text_VelasRSI=8;

//---- buffers
double ArrowSignal[];
double BollingerUp[];
double BollingerDn[];
double BollingerMid[];

string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;   
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
int VALORVELASOPUESTAS=0;

double Candle_WickBody_Percent=0;

//int DefinitionEstochastic;
//int DefinitionRSI;
int DefinitionBollinger;

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
int OnInit()
  {
   //DefinitionRSI=iRSI(NULL,PERIOD_CURRENT,RSI_Period,PRICE_CLOSE);
   DefinitionBollinger=iBands(Symbol(),PERIOD_CURRENT,PeriodoBollinger,ShiftBollinger,DesviationBollinger,AppliedPriceBollinger);
   if(DefinitionBollinger==INVALID_HANDLE) { return(INIT_FAILED); }
   
   IndicatorSetString(INDICATOR_SHORTNAME,"PRM");
//172, 115
   PlotIndexSetInteger(0,PLOT_ARROW,170);
   
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);

   SetIndexBuffer(0,ArrowSignal);

   ArraySetAsSeries(ArrowSignal,false);
   ArraySetAsSeries(BollingerUp,true);
   ArraySetAsSeries(BollingerDn,true);
   ArraySetAsSeries(BollingerMid,true);



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


   if(prevtime==Time[rates_total-1] && ALERTAACTIVADA==true)
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
      
   
   prevtime=Time[rates_total-1];
   
   int START=0;
   if(prev_calculated!=0)
     {
      START=rates_total-2;
     }
   else
     {
      START=12;
      ArrayInitialize(ArrowSignal,0);
     }

   for(shift=START; shift<rates_total; shift++)
     {
      CumOffset= 0;
      setalert = 0;
      counter=shift;
      Range=0;
      AvgRange=0;
      ArrowSignal[shift]=0;

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


      CopyBuffer(DefinitionBollinger,0,rates_total-1-shift,3,BollingerMid);
      CopyBuffer(DefinitionBollinger,1,rates_total-1-shift,3,BollingerUp);
      CopyBuffer(DefinitionBollinger,2,rates_total-1-shift,3,BollingerDn);



     bool Condicion=false;
     ALERTAACTIVADA=false;

      // Check for Velas opuestas en Volumen
      if( (C[2]<O[2] && C[1]>O[1] && C[0]>O[0] && BodyHigh[1]-(PorcentajeVela1/100)*BLa[1]>BollingerMid[1] && BodyHigh[1]>BodyHigh[2] && BodyHigh[0]-(PorcentajeVela2/100)*BLa[0]>BollingerUp[0]) || //SELL
          (C[2]>O[2] && C[1]<O[1] && C[0]<O[0] && BodyLow[1]+(PorcentajeVela1/100)*BLa[1]<BollingerMid[1] && BodyLow[1]<BodyLow[2] && BodyLow[0]+(PorcentajeVela2/100)*BLa[0]<BollingerDn[0] ) ) //BUY
        {
            if(VelasOpuestasEnVolumen == true )
              {
              
              if(O[0]<C[0]) ///SELL
                    {        
                           if(O[3]>C[3] && BodyHigh[1]<BodyHigh[3] ){
                            ;
                            }  
                           else{
                           Condicion=true;
                           if(shift!=rates_total-1)
                           MarkPattern(GetName("VelasOPV",Time[shift]), Time[shift+paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"VO", Text_VelasOpuestas, COLORVO);
                           CumOffset = CumOffset+IncOffset;
                           ArrowSignal[shift] = High[shift] + (Pointer_Offset*_Point);}
                 }

               else
                  if(O[0]>C[0])  ///BUY
                 {         if(O[3]<C[3] && BodyLow[1]>BodyLow[3]){
                            ;
                            } 
                            else{
                             Condicion=true;
                             if(shift!=rates_total-1)
                              MarkPattern(GetName("VelasOPV",Time[shift]), Time[shift+paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "VO", Text_VelasOpuestas, COLORVO);
                              CumOffset = CumOffset+IncOffset;
                              ArrowSignal[shift] = Low[shift] - (Pointer_Offset*_Point);}
                             
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