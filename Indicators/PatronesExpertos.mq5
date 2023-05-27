//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2020, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                      Patrones Regresiva Alerta Mitad Vela        |
//|                                      Modifier: Claudio Chumpitaz |
//|                      https://www.mql5.com/es/users/claudioangelo |
//|                          Based on MT4 indicator by: Carl Sanders |
//+------------------------------------------------------------------+

//double KArray[];
//double RSIMAIN[];
//input uint RSI_Period=14;
int NumeroTrends=0;

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"
#property description "Indicador que avisa mediante una alerta la formacion de un patron regresivo"
#property description "con vela recien formandose- en otras palabras te avisa cuando se esta formando"
#property description "el patron regresivo y no cuando ha terminado de formarse la vela"

#property indicator_chart_window
#property indicator_buffers 7
#property indicator_plots   5

#property indicator_label1   "FLECHA-BUY"
#property indicator_color1  clrPink
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2   "FLECHA-SELL"
#property indicator_color2  clrPink
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

#property indicator_label3   "EMA-6"
#property indicator_color3  clrAqua
#property indicator_type3   DRAW_LINE
#property indicator_style3  STYLE_SOLID
#property indicator_width3  1

#property indicator_label4  "Patrones-EspecialBULLISH"
#property indicator_color4  clrMagenta
#property indicator_type4   DRAW_ARROW
#property indicator_style4  STYLE_SOLID
#property indicator_width4  1

#property indicator_label5  "Patrones-EspecialesBEAR"
#property indicator_color5  clrMagenta
#property indicator_type5   DRAW_ARROW
#property indicator_style5  STYLE_SOLID
#property indicator_width5  1

string pattern;

string label_name="Label_Indicador_Patron_Regresivo_ENTRE_EMAS";

input color ColorTextoAlarma=Aqua;
//bool PatronConEma=true;//ACTIVAR CONDICION EMA

input string SEPARADOR="------EMA---------";
input int PeriodoEma=6;
input int ShitfEma=0;
input ENUM_MA_METHOD Mode_Ema=MODE_EMA;
input ENUM_APPLIED_PRICE Price_Mode=PRICE_CLOSE;
input string SEPARADOR1="------------ALERTA------------";
input bool Show_Alert=true; //ACTIVAR ALERTA PC
input bool Show_Alert_Movil=false; //ACTIVAR ALERTA MOVIL
input string SEPARADOR2="------------HABILITAR PATRONES------------";
input bool VelasPatronZ=true;
input bool VelasPatron3Mecha=true;
input bool VelasPatron3Z=true;
input bool VelasPatron6x1_Escalonada=true;
input bool VelasPatron5x1=true;
input bool VelasPatronReversion=true;
input bool VelasPatron6x1_NoEscalonada=true;
input bool VelasPatron_Familia30=true;
input string SEPARADOR3="------------COLORES PATRONES------------";
input color ColorZ=clrYellow;
input color Color3M=clrYellow;
input color Color3Z=clrYellow;
input color Color6E=clrYellow;
input color Color5x1=clrYellow;
input color ColorRev=clrYellow;
input color Color6x1=clrYellow;
input string SEPARADOR4="----------TAMAÑO TEXTO PATRONES----------";
input int Size_Z=8;
input int Size_3M=8;
input int Size_3Z=8;
input int Size_6E=8;
input int Size_5x1=8;
input int Size_Rev=8;
input int Size_6x1=8;

input string SEPARADOR5="----------Distancia Texto----------";
input int  Pointer_Offset2=0;//Distancia entre la vela y la flecha
input int  Offset_Subida_VelaOpuesta2=0;//Distancia Entre el Texto y la Flecha(Arriba)
input int  Offset_Caida_VelaOpuesta2=0;//Distancia Entre el Texto y la Flecha(Abajo)
input int  High_Offset2=0; //Ajustar Mas el texto de Arriba

bool VelasOpuestasEnVolumen_Alert=true;

//Change it to true if you broker uses extra digit in quotes
bool UseExtraDigit=false;

double EMA_BUFFER[];
double FRACTAL_UP[];
double FRACTAL_DOWN[];

int EMA;
int FRACTAL;
datetime VEZFAMILIA30=0;

bool FIBONACCI=false;
double FIBOPUNTO1=0;
double FIBOPUNTO2=0;

int NumeroFIBO=0;


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*
input double M1=0.5; //M1 Velas mayores a (pips)
input double M5=1;   //M5 Velas mayores a (pips)
input double M15=4;  //M15 Velas mayores a (pips)
input double M30=4;  //M30 Velas mayores a (pips)
input double H1=4;   //H1 Velas mayores a (pips)
input double H4=10;  //H4 Velas mayores a (pips)
input double D1=15;  //D1 Velas mayores a (pips)
input double W1=50;  //W1 Velas mayores a (pips)
input double MN1=50;  //MM1 Velas mayores a (pips)*/


//input bool VelasRSI=true;
//input bool VelasRSI_Alert=false;

//---- buffers
double ArrowSignalBuy[];
double ArrowSignalSell[];
double ArrowSignalStar[];
double ArrowSignalStar1[];


string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
double VALORVELASOPUESTAS=0;

double Candle_WickBody_Percent=0;
datetime TIMEFIBONACCI=0;

//int DefinitionEstochastic;
//int DefinitionRSI;

color COLORVO=Aqua;

int paso=0;
bool CUENTA=false;
bool ALERTAACTIVADA=false;
datetime TiempoPrevio=0;
int MAXIMO=0;
int vez=1;
bool UPFRACTAL=false;
bool FIBO_61=true;




//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnInit()
  {

   IndicatorSetString(INDICATOR_SHORTNAME,"Patron Experto");
//172, 115
   PlotIndexSetInteger(0,PLOT_ARROW,225);
   PlotIndexSetInteger(1,PLOT_ARROW,226);
   PlotIndexSetInteger(3,PLOT_ARROW,222);
   PlotIndexSetInteger(4,PLOT_ARROW,221);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(3,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(4,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(5,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(6,PLOT_EMPTY_VALUE,0);

   SetIndexBuffer(0,ArrowSignalBuy,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalSell,INDICATOR_DATA);
   SetIndexBuffer(2,EMA_BUFFER,INDICATOR_DATA);
   SetIndexBuffer(3,ArrowSignalStar,INDICATOR_DATA);
   SetIndexBuffer(4,ArrowSignalStar1,INDICATOR_DATA);
   SetIndexBuffer(5,FRACTAL_UP,INDICATOR_CALCULATIONS);
   SetIndexBuffer(6,FRACTAL_DOWN,INDICATOR_CALCULATIONS);

   ArraySetAsSeries(ArrowSignalBuy,true);
   ArraySetAsSeries(ArrowSignalSell,true);
   ArraySetAsSeries(EMA_BUFFER,true);
   ArraySetAsSeries(ArrowSignalStar,true);
   ArraySetAsSeries(ArrowSignalStar1,true);
   ArraySetAsSeries(FRACTAL_UP,true);
   ArraySetAsSeries(FRACTAL_DOWN,true);

   EMA=iMA(Symbol(),PERIOD_CURRENT,PeriodoEma,ShitfEma,Mode_Ema,PRICE_CLOSE);
   FRACTAL=iFractals(Symbol(),PERIOD_CURRENT);

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
         Pointer_Offset=4;
         High_Offset=2;
         Offset_Subida_VelaOpuesta=2;
         Offset_Caida_VelaOpuesta=2;
         IncOffset=16;
         //VALORVELASOPUESTAS=M1;
         break;
      case PERIOD_M5:
         period="M5";

         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         //VALORVELASOPUESTAS=M5;

         break;
      case PERIOD_M15:
         period="M15";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         //VALORVELASOPUESTAS=M15;

         break;
      case PERIOD_M30:
         period="M30";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         //VALORVELASOPUESTAS=M30;
         break;
      case PERIOD_H1:
         period="H1";
         Pointer_Offset=30;
         High_Offset=20;
         Offset_Subida_VelaOpuesta=10;
         Offset_Caida_VelaOpuesta=30;
         IncOffset=40;
         //VALORVELASOPUESTAS=H1;
         break;
      case PERIOD_H4:
         period="H4";
         Pointer_Offset=70;
         High_Offset=150;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=120;
         //VALORVELASOPUESTAS=H4;
         break;
      case PERIOD_D1:
         period="D1";
         Pointer_Offset=150;
         High_Offset=220;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=180;
         //VALORVELASOPUESTAS=D1;
         break;
      case PERIOD_W1:
         period="W1";
         Pointer_Offset=9;
         High_Offset=35;
         Offset_Subida_VelaOpuesta=80;
         Offset_Caida_VelaOpuesta=80;
         IncOffset=35;
         //VALORVELASOPUESTAS=W1;
         break;
      case PERIOD_MN1:
         period="MN";
         Pointer_Offset=9;
         High_Offset=45;
         Offset_Subida_VelaOpuesta=140;
         Offset_Caida_VelaOpuesta=140;
         IncOffset=45;
         //VALORVELASOPUESTAS=MN1;
         break;
     }
   Pointer_Offset=Pointer_Offset2>0?Pointer_Offset2:Pointer_Offset;
   Offset_Subida_VelaOpuesta=Offset_Subida_VelaOpuesta2>0?Offset_Subida_VelaOpuesta2:Offset_Subida_VelaOpuesta;
   Offset_Caida_VelaOpuesta=Offset_Caida_VelaOpuesta2>0?Offset_Caida_VelaOpuesta2:Offset_Caida_VelaOpuesta;
   High_Offset=High_Offset2>0?High_Offset2:High_Offset;

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
   ObjectsDeleteAll(0,0,OBJ_FIBO);

   for(int k=ObjectsTotal(0,0,OBJ_TREND)-1; k>-1; k--)
     {
      string NameSymbol=ObjectName(0,k,0,OBJ_TREND);
      if(StringFind(NameSymbol,"TRENDPATRONES",0)!=-1)
        {
         ObjectDelete(0,NameSymbol);
        }
     }

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

//Comment(EnvelopesbufferDown[0]," ",EnvelopesbufferDown[1]," ",EnvelopesbufferDown[2]," ",EnvelopesbufferDown[3]);

   if(BarsCalculated(EMA)<rates_total)
      if(BarsCalculated(FRACTAL)<rates_total)
         return(0);
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(EMA,0,0,to_copy,EMA_BUFFER)<=0)
      return(0);
   if(CopyBuffer(FRACTAL,0,0,to_copy,FRACTAL_UP)<=0)
      return(0);
   if(CopyBuffer(FRACTAL,1,0,to_copy,FRACTAL_DOWN)<=0)
      return(0);


   static double Range,AvgRange;
   static datetime prevtime=0;
   static int counter,setalert;
   static int shift;
   int setPattern=0;
   int alert=0;
   static double O[10],C[10],L[10],H[10];
   static double CL[10],BL[10],BLa[10],BL90[10],UW[10],LW[10],BodyHigh[10],BodyLow[10],BB[10];
   for(int i=0; i<10; i++)
     {
      BodyHigh[i]=0;
      BodyLow[i]=0;
     }
   int CumOffsetL;
   int CumOffsetH;

   if(prevtime==Time[0] && ALERTAACTIVADA==true)
     {
      if(ObjectFind(0,label_name)<0)
        {
         Print("Generating a label");
         ObjectCreate(0,label_name,OBJ_LABEL,0,0,0);
         ObjectSetInteger(0,label_name,OBJPROP_XDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_YDISTANCE,60);
         ObjectSetInteger(0,label_name,OBJPROP_COLOR,ColorTextoAlarma);
         ObjectSetString(0,label_name,OBJPROP_TEXT,"Formandose Patron "+pattern);
         ObjectSetString(0,label_name,OBJPROP_FONT,"Comic Sans");
         ObjectSetInteger(0,label_name,OBJPROP_FONTSIZE,10);
         ObjectSetInteger(0,label_name,OBJPROP_SELECTABLE,false);
         ChartRedraw(0);
        }
      return(rates_total);
     }

   if(prevtime==0 || rates_total-prev_calculated!=0)
     {
      for(int i=rates_total-1; i>=0; i--)
        {
         ArrowSignalSell[i]=0;
         ArrowSignalBuy[i]=0;
         ArrowSignalStar[i]=0;
         ArrowSignalStar1[i]=0;
        }
     }

   if(ObjectFind(0,label_name)>=0)
      ObjectDelete(0,label_name);

   if(prevtime!=Time[0])
     {
      vez=1;
      ALERTAACTIVADA=false;
      CUENTA=false;
     }
   prevtime=Time[0];
   
   
   if(vez==1)
     {
      MAXIMO=rates_total-50;
     }
   else
      if(vez==0)
        {
         MAXIMO = 1;
        }

   for(shift=0; shift<MAXIMO; shift++)
     {
      CumOffsetH= 0;
      CumOffsetL= 0;
      setalert = 0;
      counter=shift;
      Range=0;
      AvgRange=0;


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
      //Comment(EMAbuffer[0]," ",EMAbuffer[1]," ",EMAbuffer[2]," ",EMAbuffer[3]," ",EMAbuffer[4]," ",EMAbuffer[5]," ",EMAbuffer[6]);
      //Comment(RSIbuffer[0]-RSIbuffer[1]);
      pattern="";
      bool Condicion=false;

      Comment(FIBONACCI);
      
      

      // Check for Velas opuestas en Volumen
      if((O[0]<C[0] && O[1]<C[1] && O[2]<C[2] && O[3]<C[3] && O[4]<C[4] && O[5]<C[5])
         ||(O[0]>C[0] && O[1]>C[1] && O[2]>C[2] && O[3]>C[3] && O[4]>C[4] && O[5]>C[5]))
        {

         if((BB[5]<BB[4] && BB[4]<BB[3] && BB[3]<BB[2] && BB[2]<BB[1] && BB[1]<BB[0])
            || (BB[5]>BB[4] && BB[4]>BB[3] &&BB[3]>BB[2] && BB[2]>BB[1] && BB[1]>BB[0]))
           {

            if(VelasPatron6x1_Escalonada== true)
              {
               if(O[0]<C[0])//VELAS REGRESIVAS SELL
                 {
                  pattern =pattern+" PatronVela 6-1 Escalera";
                  Condicion=true;
                  if(shift!=0)
                    {
                     MarkPattern(GetName("Patron_6-1E",Time[shift]), Time[shift+paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"6E", Size_6E, Color6E);
                     CumOffsetH = CumOffsetH+IncOffset;
                    }
                  ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                 }

               else //VELAS REGRESIVAS BUY
                  if(O[0]>C[0])
                    {
                     //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                     Condicion=true;
                     pattern =pattern+" PatronVela 6-1 Escalera";
                     if(shift!=0)
                       {
                        MarkPattern(GetName("Patron_6-1E",Time[shift]), Time[shift+paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "6E", Size_6E, Color6E);
                        CumOffsetL = CumOffsetL+IncOffset;
                       }
                     ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);

                    }
              }
            if(VelasOpuestasEnVolumen_Alert == true)
              {

               if(shift==0 && Condicion==true)
                 {
                  ALERTAACTIVADA=true;

                  if(setalert == 0 && Show_Alert == true)
                    {
                     setalert = 1;
                    }
                 }
              }
           }
        }


      if((O[0]<C[0] && O[1]<C[1] && O[2]<C[2] && O[3]<C[3] && O[4]<C[4])
         ||(O[0]>C[0] && O[1]>C[1] && O[2]>C[2] && O[3]>C[3] && O[4]>C[4]))
        {

         if((BB[4]<=BB[3] && BB[3]<=BB[2] && BB[2]<=BB[1] && BB[1]<=BB[0])
            || (BB[4]>=BB[3] &&BB[3]>=BB[2] && BB[2]>=BB[1] && BB[1]>=BB[0]))
           {

            if(VelasPatron5x1 == true)
              {
               NumeroTrends++;
               MarkPattern(GetName("Patron_5-1",Time[shift]), Time[shift+2],BodyLow[0]+BLa[0]/2,"5-1", Size_5x1, Color5x1);
               if(ObjectCreate(0,"TRENDPATRONES"+IntegerToString(NumeroTrends,0,' '),OBJ_TREND,0,Time[shift+2],BodyLow[0]+BLa[0]/2,Time[shift]+PeriodSeconds(PERIOD_CURRENT)*2,BodyLow[0]+BLa[0]/2))
                 {
                  ObjectSetInteger(0,"TRENDPATRONES"+IntegerToString(NumeroTrends,0,' '),OBJPROP_COLOR,clrAqua);
                 }
               Condicion=true;
               pattern =pattern+" Patron Vela 5-1";
               ArrowSignalBuy[shift] = Low[shift] - (Pointer_Offset*_Point);
               ArrowSignalSell[shift] = High[shift] + (Pointer_Offset*_Point);
              }
            if(VelasOpuestasEnVolumen_Alert == true)
              {

               if(shift==0 && Condicion==true)
                 {
                  ALERTAACTIVADA=true;

                  if(setalert == 0 && Show_Alert == true)
                    {
                     setalert = 1;
                    }
                 }
              }
           }
        }

      if((O[0]<C[0] && O[1]<C[1] && O[2]<C[2] && O[3]<C[3] && O[4]<C[4] && O[5]<C[5])
         ||(O[0]>C[0] && O[1]>C[1] && O[2]>C[2] && O[3]>C[3] && O[4]>C[4] && O[5]>C[5]))
        {

         if((O[0]<C[0] && O[1]<C[1] && UW[2]>0 && H[0]<H[2]+Point()*2 && H[0]<H[3]+Point()*2 && H[0]<H[4]+Point()*2 && H[0]<H[5]+Point()*2
             && H[1]<H[2] && H[1]<H[3] && H[1]<H[4] && H[1]<H[5]) || (
               O[0]>C[0] && O[1]>C[1] && LW[2]>0 && L[0]>L[2]-Point()*2 && L[0]>L[3]-Point()*2 && L[0]>L[4]-Point()*2 && L[0]>L[5]-Point()*2
               && L[1]>L[2] && L[1]>L[3] && L[1]>L[4] && L[1]>L[5]))
           {

            if(VelasPatronReversion == true)
              {
               if(O[0]<C[0])//VELAS REGRESIVAS SELL
                 {
                  //Condicion=EvaluaCondiciones(shift,false,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                  pattern =pattern+" PatronVela Reversion";
                  Condicion=true;
                  if(shift!=0)
                    {
                     MarkPattern(GetName("Patron_Reversion",Time[shift]), Time[shift+paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"Rev", Size_Rev, ColorRev);
                     CumOffsetH = CumOffsetH+IncOffset;
                    }
                  ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                 }

               else //VELAS REGRESIVAS BUY
                  if(O[0]>C[0])
                    {
                     //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                     Condicion=true;
                     pattern =pattern+" PatronVela Reversion";
                     if(shift!=0)
                       {
                        MarkPattern(GetName("Patron_Reversion",Time[shift]), Time[shift+paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "Rev", Size_Rev, ColorRev);
                        CumOffsetL = CumOffsetL+IncOffset;
                       }
                     ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);

                    }
              }
            if(VelasOpuestasEnVolumen_Alert == true)
              {

               if(shift==0 && Condicion==true)
                 {
                  ALERTAACTIVADA=true;

                  if(setalert == 0 && Show_Alert == true)
                    {
                     setalert = 1;
                    }
                 }
              }
           }
        }


      if((O[0]<C[0] && O[1]<C[1] && O[2]<C[2])
         ||(O[0]>C[0] && O[1]>C[1] && O[2]>C[2]))
        {

         if((BLa[0]>BLa[1]*2 && BLa[1]>BLa[2]*2)
            || (BLa[0]*2<BLa[1] && BLa[1]*2<BLa[2]))
           {

            if(VelasPatron3Z == true)
              {
               if(O[0]<C[0])//VELAS REGRESIVAS SELL
                 {
                  //Condicion=EvaluaCondiciones(shift,false,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);
                  pattern =pattern+" PatronVela 3-Z";
                  Condicion=true;
                  if(shift!=0)
                    {
                     MarkPattern(GetName("Patron_3_Z",Time[shift]), Time[shift+paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"3Z", Size_3Z, Color3Z);
                     CumOffsetH = CumOffsetH+IncOffset;
                    }
                  ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                 }

               else //VELAS REGRESIVAS BUY
                  if(O[0]>C[0])
                    {
                     //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                     Condicion=true;
                     pattern =pattern+" PatronVela 3-Z";
                     if(shift!=0)
                       {
                        MarkPattern(GetName("Patron_3_Z",Time[shift]), Time[shift+paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "3Z", Size_3Z, Color3Z);
                        CumOffsetL = CumOffsetL+IncOffset;
                       }
                     ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);

                    }
              }
            if(VelasOpuestasEnVolumen_Alert == true)
              {

               if(shift==0 && Condicion==true)
                 {
                  ALERTAACTIVADA=true;

                  if(setalert == 0 && Show_Alert == true)
                    {
                     setalert = 1;
                    }
                 }
              }
           }
        }

      if((O[0]<C[0] && O[1]<C[1]) || (O[0]>C[0] && O[1]>C[1]))
        {

         if(EMA_BUFFER[shift+1]< BodyHigh[1] &&  BodyLow[1]<EMA_BUFFER[shift+1])
           {
            if(VelasPatronZ == true)
              {
               if(EMA_BUFFER[shift+1]>BodyLow[1]+BLa[1]/2)//VELAS REGRESIVAS SELL
                 {
                  pattern = pattern+" PatronVela Z";
                  Condicion=true;
                  if(shift!=0)
                    {
                     MarkPattern(GetName("Patron_Z",Time[shift]), Time[shift+paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"PZ", Size_Z, ColorZ);
                     CumOffsetH = CumOffsetH+IncOffset;
                    }
                  ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                 }

               else //VELAS REGRESIVAS BUY
                  if(EMA_BUFFER[shift+1]<BodyLow[1]+BLa[1]/2)
                    {
                     //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                     Condicion=true;
                     pattern = pattern+" PatronVela Z";
                     if(shift!=0)
                       {
                        MarkPattern(GetName("Patron_Z",Time[shift]), Time[shift+paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "PZ", Size_Z, ColorZ);
                        CumOffsetL = CumOffsetL+IncOffset;
                       }
                     ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);

                    }
              }
            if(VelasOpuestasEnVolumen_Alert == true)
              {

               if(shift==0 && Condicion==true)
                 {
                  ALERTAACTIVADA=true;

                  if(setalert == 0 && Show_Alert == true)
                    {
                     setalert = 1;
                    }
                 }
              }
           }
        }


      if(VelasPatron3Mecha== true)
        {
         if(LW[0]>0 && LW[1]>0 && LW[2]>0 && L[1]<L[2]+Point()*2 && L[1]>L[2]-Point()*2
            && L[0]<L[2]+Point()*2 && L[0]>L[2]-Point()*2  && LW[1]>BLa[1]&& LW[2]>BLa[2])//VELAS REGRESIVAS SELL
           {
            //Condicion=EvaluaCondiciones(shift,false,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);
            Condicion=true;
            pattern = pattern+" TRIPLE MECHA";
            if(shift!=0)
              {
               MarkPattern(GetName("Triple Mecha",Time[shift]), Time[shift+paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "3M", Size_3M, Color3M);
               CumOffsetL = CumOffsetL+IncOffset;
              }
            ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);
           }

         else //VELAS REGRESIVAS BUY
            if(UW[0]>0 &&  UW[1]>0 && UW[2]>0  && H[1]<H[2]+Point()*2 && H[1]>H[2]-Point()*2
               && H[0]<H[2]+Point()*2 && H[0]>H[2]-Point()*2 && UW[1]>BLa[1]&& UW[2]>BLa[2])
              {
               pattern = pattern+" TRIPLE MECHA";
               Condicion=true;
               if(shift!=0)
                 {
                  MarkPattern(GetName("Triple Mecha",Time[shift]), Time[shift+paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"3M",Size_3M, Color3M);
                  CumOffsetH = CumOffsetH+IncOffset;
                 }
               ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);

              }

         if(VelasOpuestasEnVolumen_Alert == true)
           {

            if(shift==0 && Condicion==true)
              {
               ALERTAACTIVADA=true;

               if(setalert == 0 && Show_Alert == true)
                 {
                  setalert = 1;
                 }
              }
           }
        }

      if((O[0]<C[0] && O[1]<C[1] && O[2]<C[2] && O[3]<C[3] && O[4]<C[4] && O[5]<C[5])
         ||(O[0]>C[0] && O[1]>C[1] && O[2]>C[2] && O[3]>C[3] && O[4]>C[4] && O[5]>C[5]))
        {

         if(VelasPatron6x1_NoEscalonada== true)
           {
            if(O[0]<C[0])//VELAS REGRESIVAS SELL
              {
               pattern =pattern+" PatronVela 6-1 No Escalonada";
               Condicion=true;
               if(shift!=0)
                 {
                  MarkPattern(GetName("Patron_6-1 No Escalonada",Time[shift]), Time[shift+paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"6x1", Size_6x1, Color6x1);
                  CumOffsetH = CumOffsetH+IncOffset;
                 }
               ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
              }

            else //VELAS REGRESIVAS BUY
               if(O[0]>C[0])
                 {
                  //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                  Condicion=true;
                  pattern =pattern+" PatronVela 6-1 No Escalonada";
                  if(shift!=0)
                    {
                     MarkPattern(GetName("Patron_6-1 No Escalonada",Time[shift]), Time[shift+paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "6x1", Size_6x1, Color6x1);
                     CumOffsetL = CumOffsetL+IncOffset;
                    }
                  ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);
                 }
            if(VelasOpuestasEnVolumen_Alert == true)
              {

               if(shift==0 && Condicion==true)
                 {
                  ALERTAACTIVADA=true;

                  if(setalert == 0 && Show_Alert == true)
                    {
                     setalert = 1;
                    }
                 }
              }

           }
        }



      if(VelasPatron_Familia30== true && shift<500 && VEZFAMILIA30!=Time[shift])
        {
         if(CL[2]*4<BLa[1] && BLa[2]>Point() && ((C[1]<O[1] && C[0]<O[0]) || (C[1]>O[1] && C[0]>O[0]) ))//VELAS REGRESIVAS SELL
           {
            pattern =pattern+" PatronVela Familia 30";
            //Condicion=true;

            NumeroTrends++;
            //MarkPattern(GetName("Patron_5-1",Time[shift]), Time[shift+2],BodyLow[0]+BLa[0]/2 ,"5-1", Size_5x1, Color5x1);

            if(ObjectCreate(0,"TRENDPATRONESFAMILIA"+IntegerToString(NumeroTrends,0,' '),OBJ_TREND,0,Time[shift+2],H[2],Time[shift]+PeriodSeconds(PERIOD_CURRENT)*10,H[2]))
              {
               ObjectSetInteger(0,"TRENDPATRONESFAMILIA"+IntegerToString(NumeroTrends,0,' '),OBJPROP_COLOR,clrAqua);
              }
            NumeroTrends++;
            if(ObjectCreate(0,"TRENDPATRONESFAMILIA1"+IntegerToString(NumeroTrends,0,' '),OBJ_TREND,0,Time[shift+2],L[2],Time[shift]+PeriodSeconds(PERIOD_CURRENT)*10,L[2]))
              {
               ObjectSetInteger(0,"TRENDPATRONESFAMILIA1"+IntegerToString(NumeroTrends,0,' '),OBJPROP_COLOR,clrAqua);
              }
            VEZFAMILIA30=Time[shift];
            
            
            /*
            FIBONACCI=true;
            if(C[1]>O[1])
              {
               FIBOPUNTO1=L[1];
               UPFRACTAL=true;
              }
            else
              {
               FIBOPUNTO1=H[1];
               UPFRACTAL=false;
              }*/
            //TIMEFIBONACCI=Time[shift+1];
            //if(shift!=0){
            //MarkPattern(GetName("Patron_6-1E",Time[shift]), Time[shift+paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"6E", Size_6E, Color6E);
            //CumOffsetH = CumOffsetH+IncOffset;}
            // ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
           }
        }
        
        /*
        if(FIBO_61 && FIBONACCI==true)
        {
         for(int jk=0; jk<10; jk++)
           {
            if(FRACTAL_UP[shift+jk]!=0 && UPFRACTAL==true)
              {
               FIBOPUNTO2=FRACTAL_UP[shift+jk];
               jk=13;
               FIBONACCI=false;
               NumeroFIBO++;
               ObjectCreate(0,"FIBO222"+NumeroFIBO,OBJ_FIBO,0,TIMEFIBONACCI,FIBOPUNTO1,Time[shift]+PeriodSeconds(PERIOD_CURRENT)*15,FIBOPUNTO2);
              }
            else
               if(FRACTAL_DOWN[shift+jk]!=0 && UPFRACTAL==false)
                 {
                  FIBOPUNTO2=FRACTAL_DOWN[shift+jk];
                  jk=13;
                  FIBONACCI=false;
                  NumeroFIBO++;
                  ObjectCreate(0,"FIBO111"+NumeroFIBO,OBJ_FIBO,0,TIMEFIBONACCI,FIBOPUNTO1,Time[shift]+PeriodSeconds(PERIOD_CURRENT)*15,FIBOPUNTO2);
                 }
            if(Time[shift+jk+1]<TIMEFIBONACCI)
              {
               jk=12;
              }
           }
        }*/
        
        
        
        



      // End of Bullish Patterns

      if((setalert==1) && (shift==0))
        {
         Alert(Symbol()," ",period," ",pattern);
         setalert=0;
         if(Show_Alert_Movil)
            SendNotification("Formandose Patron "+pattern+ " en "+Symbol()+" Temporalidad: "+EnumToString(PERIOD_CURRENT));
        }
      CumOffsetL=0;
      CumOffsetH=0;

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
