//+------------------------------------------------------------------+
//|                                      Paton Oso Toro Oso Toro.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"

#property indicator_chart_window
#property indicator_buffers 2
#property indicator_plots   2

#property indicator_color1  clrOrange
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1
#property indicator_label1  "SIGNAL BUY"

#property indicator_color2  clrOrange
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1
#property indicator_label2  "SIGNAL SELL"


input bool Show_Alert=true; //ACTIVAR ALERTA
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;

//Change it to true if you broker uses extra digit in quotes
bool UseExtraDigit=false;

int Text_VelasOpuestas=8;

//---- buffers
double ArrowSignalBuy[];
double ArrowSignalSell[];

string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.

double Candle_WickBody_Percent=0;

datetime Until=D'2021.01.24 00:00'; 

//+------------------------------------------------------------------+
int OnInit()
  {

   IndicatorSetString(INDICATOR_SHORTNAME,"Patron O-T-O-T");
//172, 115
   SetIndexBuffer(0,ArrowSignalBuy,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalSell,INDICATOR_DATA);
   PlotIndexSetInteger(0,PLOT_ARROW,170);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetInteger(1,PLOT_ARROW,170);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);


   switch(_Period)
     {
      case PERIOD_M1:
         period="M1";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         break;
      case PERIOD_M5:
         period="M5";

         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;

         break;
      case PERIOD_M15:
         period="M15";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;

         break;
      case PERIOD_M30:
         period="M30";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         break;
      case PERIOD_H1:
         period="H1";
         Pointer_Offset=30;
         High_Offset=20;
         Offset_Subida_VelaOpuesta=10;
         Offset_Caida_VelaOpuesta=30;
         IncOffset=40;
         break;
      case PERIOD_H4:
         period="H4";
         Pointer_Offset=70;
         High_Offset=150;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=120;
         break;
      case PERIOD_D1:
         period="D1";
         Pointer_Offset=150;
         High_Offset=220;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=180;
         break;
      case PERIOD_W1:
         period="W1";
         Pointer_Offset=9;
         High_Offset=35;
         Offset_Subida_VelaOpuesta=80;
         Offset_Caida_VelaOpuesta=80;
         IncOffset=35;
         break;
      case PERIOD_MN1:
         period="MN";
         Pointer_Offset=9;
         High_Offset=45;
         Offset_Subida_VelaOpuesta=140;
         Offset_Caida_VelaOpuesta=140;
         IncOffset=45;
         break;
     }

   if(UseExtraDigit)
     {
      Pointer_Offset*=10;
      High_Offset*=10;
      Offset_Subida_VelaOpuesta*=10;
      Offset_Caida_VelaOpuesta*=10;
      IncOffset*=10;
     }
   Comment("Tiempo Prueba hasta:",TimeToString(Until,TIME_DATE|TIME_MINUTES));
   return (INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
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
   if(TimeCurrent()>Until){
   Comment("Periodo Prueba Expirado");
   return rates_total;
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


   if(prevtime==Time[rates_total-1])
      return(rates_total);

   prevtime=Time[rates_total-1];

   int START=0;
   if(prev_calculated!=0)
     {
      START=rates_total-2;
     }
   else
     {
      START=12;
      ArrayInitialize(ArrowSignalBuy,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalSell,EMPTY_VALUE);
     }

   for(shift=START; shift<rates_total; shift++)
     {
      CumOffset= 0;
      setalert = 0;
      counter=shift;
      Range=0;
      AvgRange=0;
      
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


      // Check for Velas opuestas en Volumen
      if((C[4]>O[4] && C[3]<O[3] && C[2]>O[2] && C[1]<O[1]) || (C[4]<O[4] && C[3]>O[3] && C[2]<O[2] && C[1]>O[1]))    //BUY
        {

         if(C[4]>O[4]) ///SELL
           {
            CumOffset = CumOffset+IncOffset;
            ArrowSignalSell[shift-1] = High[shift-1] + (Pointer_Offset*_Point);
            pattern="T-O-T-O";
           }

         else
            if(C[4]<O[4])  ///BUY
              {
               CumOffset = CumOffset+IncOffset;
               ArrowSignalBuy[shift-1] = Low[shift-1] - (Pointer_Offset*_Point);
               pattern="O-T-O-T";
              }

         if(shift==rates_total-1)
           {
            if(setalert == 0 && Show_Alert == true)
              {
               setalert = 1;
              }
           }
        }

      if((setalert==1) && (shift==rates_total-1))
        {
         if(AlertPC)Alert(Symbol()," ",period," Patron:",pattern);
         if(AlertMovil)SendNotification(Symbol()+" "+period+" Patron:"+pattern);
         if(AlertMail)Alert(Symbol()+" "+period+" Patron:"+pattern,Symbol()+" "+period+" Patron:"+pattern);
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
