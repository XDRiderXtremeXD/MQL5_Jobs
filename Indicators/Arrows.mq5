//+------------------------------------------------------------------+
//|                                                       Arrows.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                ARROWS_ALERTS.mq4 |
//|                                  CLAUDIO ANGELO CHUMPITAZ FLORES |
//+------------------------------------------------------------------+
#property copyright " Claudio Angelo Chumpitaz Flores"
#property version   "1.01"

#property indicator_chart_window
#property indicator_buffers 6
#property indicator_plots 4

#property indicator_label1   "FLECHA-BUY"
#property indicator_color1  clrAqua
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  4

#property indicator_label2   "FLECHA-SELL"
#property indicator_color2  clrAqua
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  4

#property indicator_label3   "FLECHA-BUY-BREAK"
#property indicator_color3  clrGold
#property indicator_type3  DRAW_ARROW
#property indicator_style3  STYLE_SOLID
#property indicator_width3  4

#property indicator_label4   "FLECHA-SELL-BREAK"
#property indicator_color4  clrGold
#property indicator_type4   DRAW_ARROW
#property indicator_style4  STYLE_SOLID
#property indicator_width4  4

double ArrowSignalBuy[];
double ArrowSignalSell[];
double ArrowSignalBuy_Break[];
double ArrowSignalSell_Break[];

datetime TimeEvaluacionUp=0;
datetime TimeEvaluacionDn=0;

double VALORDN=0;
double VALORUP=0;

enum ENUM_HoraFranja
  {
   _0am=0,//12am
   _1am=1,//1am
   _2am=2,//2am
   _3am=3,//3am
   _4am=4,//4am
   _5am=5,//5am
   _6am=6,//6am
   _7am=7,//7am
   _8am=8,//8am
   _9am=9,//9am
   _10am=10,//10am
   _11am=11,//11am
   _12pm=12,//12pm
   _1pm=13,//1pm
   _2pm=14,//2pm
   _3pm=15,//3pm
   _4pm=16,//4pm
   _5pm=17,//5pm
   _6pm=18,//6pm
   _7pm=19,//7pm
   _8pm=20,//8pm
   _9pm=21,//9pm
   _10pm=22,//10pm
   _11pm=23,//11pm
  };

bool AlarmaBO=false;

int vez=0;

double O[3],C[3], L[3], H[3];
double CL[3], BL[3], BLa[3], BL90[3], UW[3], LW[3], BodyHigh[3], BodyLow[3],BB[3];

input ENUM_TIMEFRAMES PeriodEntry=PERIOD_H1;

input double SizeCandle=0; // SizeCandle int Points

bool DrawGreenArrowUp=false;
bool DrawGreenArrowDn=false;

enum ENUM_VELAGREEN
  {
   Current=0,
   Closed=1,
  };

input ENUM_VELAGREEN CandleBOAlarm=Current;

input bool AlertPC=true;
input bool AlertAppMovil=true;
input bool AlertEmail=true;

int Pointer_Offset;

string MensajeAlert;
string MensajeEmail;
string MensajeNotificacion;

input ENUM_HoraFranja HourStart=_1am;
input ENUM_HoraFranja HourEnd=_1am;

double Buffer_Fractal_UP[];
double Buffer_Fractal_DN[];

int Fractal;

//+------------------------------------------------------------------+
//| script "send pending order with expiration data"                 |
//+------------------------------------------------------------------+
int OnInit(void)
  {
   
   PlotIndexSetInteger(0,PLOT_ARROW,226);
   PlotIndexSetInteger(1,PLOT_ARROW,225);
   PlotIndexSetInteger(2,PLOT_ARROW,226);
   PlotIndexSetInteger(3,PLOT_ARROW,225);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetDouble(3,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(0,ArrowSignalBuy,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalSell,INDICATOR_DATA);
   SetIndexBuffer(2,ArrowSignalBuy_Break,INDICATOR_DATA);
   SetIndexBuffer(3,ArrowSignalSell_Break,INDICATOR_DATA);
   SetIndexBuffer(4,Buffer_Fractal_DN,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,Buffer_Fractal_UP,INDICATOR_CALCULATIONS);
   
   ArrayInitialize(ArrowSignalBuy,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalSell,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalBuy_Break,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalSell_Break,EMPTY_VALUE);
   
   ArraySetAsSeries(Buffer_Fractal_DN,false);
   ArraySetAsSeries(Buffer_Fractal_UP,false);
   
   Fractal=iFractals(Symbol(),PERIOD_CURRENT);

   if(PeriodSeconds(Period())>PeriodSeconds(PeriodEntry))
     {
      Print("Current Period must be less than PeriodEntry");
      return(INIT_FAILED);
     }
   if(PeriodSeconds(PERIOD_D1)<PeriodSeconds(PeriodEntry))
     {
      Print("PeriodEntry must be less than or equal to Period_D1");
      return(INIT_FAILED);
     }
   if(PeriodSeconds(ENUM_TIMEFRAMES(Period()))==PeriodSeconds(ENUM_TIMEFRAMES(PeriodEntry)))
     {
      Print("TimeFrame must be different from PeriodEntry");
      return(INIT_FAILED);
     }
           switch(Period())
        {
         case PERIOD_M1:
            Pointer_Offset = 12;
            break;
         case PERIOD_M5:
            Pointer_Offset = 12;
            break;
         case PERIOD_M15:
            Pointer_Offset = 12;
            break;
         case PERIOD_M30:
            Pointer_Offset = 12;
            break;
         case PERIOD_H1:
            Pointer_Offset = 12;
            break;
         case PERIOD_H4:
            Pointer_Offset = 40;
            break;
         case PERIOD_D1:
            Pointer_Offset = 100;
            break;
         case PERIOD_W1:
            Pointer_Offset = 100;
            break;
         case PERIOD_MN1:
            Pointer_Offset = 100;
            break;
        }

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
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
     
     if(BarsCalculated(Fractal)<rates_total)
      return(0);
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(Fractal,0,0,to_copy,Buffer_Fractal_UP)<=0)
      return(0);
   if(CopyBuffer(Fractal,0,0,to_copy,Buffer_Fractal_DN)<=0)
      return(0);
  
  
      static datetime prevtime=0;
      
      if(CandleBOAlarm==1)
         AlarmaBO=true;

      if(prevtime == time[rates_total-1] && AlarmaBO==true)
        {
         return(rates_total);
        }
     
      int START;
      if(prev_calculated==0)
        {
         START=16;
         ArrayResize(ArrowSignalBuy,rates_total);
         ArrayResize(ArrowSignalSell,rates_total);
         ArrayInitialize(ArrowSignalBuy,EMPTY_VALUE);
         ArrayInitialize(ArrowSignalSell,EMPTY_VALUE);
         ArrayResize(ArrowSignalBuy_Break,rates_total);
         ArrayResize(ArrowSignalSell_Break,rates_total);
         ArrayInitialize(ArrowSignalBuy_Break,EMPTY_VALUE);
         ArrayInitialize(ArrowSignalSell_Break,EMPTY_VALUE);
        }
      else
         START=rates_total-2;

      if(prevtime==time[rates_total-1])
        {
         START=rates_total-1;
        }

      for(int shift = START; shift < rates_total ; shift++)
        {
         int setalert = 0;
         if(prevtime!=time[rates_total-1])
           {
            ArrowSignalBuy[shift-1]=EMPTY_VALUE;
            ArrowSignalSell[shift-1]=EMPTY_VALUE;
           }
         ArrowSignalBuy_Break[shift-CandleBOAlarm]=EMPTY_VALUE;
         ArrowSignalSell_Break[shift-CandleBOAlarm]=EMPTY_VALUE;
        
         for(int i=0; i<3; i++)
           {

            O[i] = open[shift-i];  //OPEN DE LA VELA
            H[i] = high[shift-i];    //HIGHT DE LA VELA
            L[i] = low[shift-i];   //LOW DE LA VELA (MECHA)
            C[i] = close[shift-i];  //CLOSE DE LA VELA
            if(O[i]>C[i])      //SI ES VELA BAJISTA
              {
               BodyHigh[i] = O[i];
               BodyLow[i] = C[i];
              }
            else    //SI ES VELA ALCISTA
              {
               BodyHigh[i] = C[i];
               BodyLow[i] = O[i];
              }
            CL[i] = high[shift-i]-low[shift-i]; // CL[1] TAMAÑO CONTANDO CON LA MECHA
            BL[i] = open[shift-i]-close[shift-i];  // BL[1] TAMAÑO OPEN A CLOSE
            UW[i] = high[shift-i]-BodyHigh[i];       // TAMAÑO DE LA MECHA ALCISTA
            LW[i] = BodyLow[i]-low[shift-i];         //TAMAÑO DE LA MECHA BAJISTA
            BLa[i] = MathAbs(BL[i]);              //VALOR ABSOLUTO DE BL[1]
            BB[i]=(BLa[i]/Point())/10;//TAMAÑO DEL VAOR ABSOUTO DEL TAMAÑO DEL CUERPO EN PIPS NORMALES

           }
         datetime TiempoEvaluar=time[shift];
         MqlDateTime MqlTime; 
         TimeToStruct(TiempoEvaluar,MqlTime);
         
         
         bool Horario=false;
         if(HourStart<HourEnd)
           {
            if(MqlTime.hour>=HourStart && MqlTime.hour<HourEnd)
               Horario=true;
           }
         else
           {
            if(MqlTime.hour>=HourStart || MqlTime.hour<HourEnd)
               Horario=true;
           }


         if(Horario==true)
           {
            int Divisor=DivisorTime(PeriodEntry,time[shift-1]);

            if(Divisor==0 && prevtime!=time[rates_total-1])
              {
               if(C[1]>O[1] && LW[1]==0 && BLa[1]>SizeCandle)
                 {
                  MensajeAlert="SIGNAL BUY IN:"+Symbol();
                  MensajeEmail="SIGNAL BUY IN:"+Symbol();
                  MensajeNotificacion="SIGNAL BUY IN"+Symbol();
                  setalert=1;
                  ArrowSignalSell[shift-1]=low[shift-1] - (Pointer_Offset*Point());
                  DrawGreenArrowUp=true;
                  TimeEvaluacionUp=time[shift-1];
                  VALORUP=low[shift-1];
                 }
               else
                 {
                  DrawGreenArrowUp=false;
                 }

               if(C[1]<O[1] && UW[1]==0 && BLa[1]>SizeCandle)
                 {

                  setalert=1;
                  MensajeAlert="SIGNAL SELL IN:"+Symbol();
                  MensajeEmail="SIGNAL SELL IN:"+Symbol();
                  MensajeNotificacion="SIGNAL SELL IN:"+Symbol();
                  setalert=1;
                  ArrowSignalBuy[shift-1]=high[shift-1] + (Pointer_Offset*Point());
                  DrawGreenArrowDn=true;
                  TimeEvaluacionDn=time[shift-1];
                  VALORDN=high[shift-1];
                 }
               else
                 {
                  DrawGreenArrowDn=false;
                 }
              }
            AlarmaBO=false;
            if(shift>PeriodEntry+1)
              {
               double BO_UP=0,BO_DN=0;
               bool There_BO_DN=false,There_BO_UP=false ;
               bool Boolean_BO_UP=false,Boolean_BO_DN=false;
               for(int k=0; time[shift-k]>=TimeEvaluacionUp && DrawGreenArrowUp==true && There_BO_UP==false ; k++)
                 {
                  double BO_UP_Eva=Buffer_Fractal_UP[shift-k];
                  
                  if(BO_UP_Eva!=EMPTY_VALUE && VALORUP<BO_UP_Eva)//EMPTY_VALUE
                    {
                     BO_UP=BO_UP_Eva;
                     Boolean_BO_UP=true;
                    }
                  if(ArrowSignalSell_Break[shift-k]!=EMPTY_VALUE)
                    {
                     There_BO_UP=true;
                    }
                 }
               for(int k=0; time[shift-k]>=TimeEvaluacionDn  && DrawGreenArrowDn==true && There_BO_DN==false ; k++)
                 {
                  double BO_DN_Eva=Buffer_Fractal_DN[shift-k];
                  
                  if(BO_DN_Eva!=EMPTY_VALUE && VALORDN>BO_DN_Eva)
                    { 
                     BO_DN=BO_DN_Eva;
                     Boolean_BO_DN=true;
                    }
                  if(ArrowSignalBuy_Break[shift-k]!=EMPTY_VALUE)
                    {
                     There_BO_DN=true;
                    }
                 }
            
               if(C[CandleBOAlarm]>O[CandleBOAlarm] && C[CandleBOAlarm]>BO_UP && L[CandleBOAlarm]<BO_UP && DrawGreenArrowUp==true && Boolean_BO_UP==true && There_BO_UP==false && time[shift]!=TimeEvaluacionUp+PeriodSeconds(PeriodEntry))
                 {
                  Print("Entra ",time[shift]);
                  MensajeAlert="SIGNAL BUY BREAK OUT IN "+Symbol();
                  MensajeEmail="SIGNAL BUY BREAK OUT IN "+Symbol();
                  MensajeNotificacion="SIGNAL BUY BREAK OUT IN "+Symbol();
                  setalert=1;
                  ArrowSignalSell_Break[shift-CandleBOAlarm]=low[shift-CandleBOAlarm] - (Pointer_Offset*Point());
                  if(rates_total-1==shift)
                    {
                     AlarmaBO=true;
                     Print("Entro");
                    }
                 }

               else
                  if(C[CandleBOAlarm]<O[CandleBOAlarm] && C[CandleBOAlarm]<BO_DN && H[CandleBOAlarm]>BO_DN && DrawGreenArrowDn==true && Boolean_BO_DN==true && There_BO_DN==false && time[shift]!=TimeEvaluacionDn+PeriodSeconds(PeriodEntry))
                    {
                     Print("Entra ",time[shift]);
                     setalert=1;
                     MensajeAlert="SIGNAL SELL BREAK OUT IN "+Symbol();
                     MensajeEmail="SIGNAL SELL BREAK OUT IN "+Symbol();
                     MensajeNotificacion="SIGNAL SELL BREAK OUT IN "+Symbol();
                     ArrowSignalBuy_Break[shift-CandleBOAlarm]=high[shift-CandleBOAlarm] + (Pointer_Offset*Point());
                     if(rates_total-1==shift)
                       {
                        AlarmaBO=true;
                       }
                    }

              }
           }

         if(DrawGreenArrowDn==false && DrawGreenArrowUp==false)
            AlarmaBO=true;

         if(setalert == 1 && shift == rates_total-1)
           {
            if(AlertPC)
               Alert(MensajeAlert);
            if(AlertAppMovil)
               SendNotification(MensajeNotificacion);
            if(AlertAppMovil)
               SendMail("Arrows Indicator",MensajeEmail);
           }
         setalert = 0;
        } // End of for loop
      prevtime = time[rates_total-1];
      
   return(rates_total);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int DivisorTime(ENUM_TIMEFRAMES TimeFrames,datetime time)
  {
   MqlDateTime TiempoMql;
   TimeToStruct(time,TiempoMql);
   
   switch(TimeFrames)
     {
      case PERIOD_M1:
         return TiempoMql.min%1;
         break;
      case PERIOD_M5:
         return TiempoMql.min%5;
         break;
      case PERIOD_M15:
         return TiempoMql.min%15;
         break;
      case PERIOD_M30:
         return TiempoMql.min%30;
         break;
      case PERIOD_H1:
         if(TiempoMql.hour%1==0 && TiempoMql.min==0)
            return 0;
         return 1;
         break;
      case PERIOD_H4:
         if(TiempoMql.hour%4==0  && TiempoMql.min==0)
            return 0;
         return 1;
         break;
      case PERIOD_D1:
         if(TiempoMql.hour==0 && TiempoMql.min==0)
            return 0;
         return 1;
         break;
     }

   return 1;

  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Comment("");
  }
//+------------------------------------------------------------------+
