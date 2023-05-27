//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2020, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                       Patterns on Chart          |
//|                                      Modifier:Ronnie Mansolillo  |
//|                          https://login.mql5.com/en/users/rosiman |
//|                          Based on MT4 indicator by: Carl Sanders |
//+------------------------------------------------------------------+

int paso=0;
#resource "\\Indicators\\Trend direction and force.ex5"
#resource "\\Indicators\\alligator.ex5"

input int Desfase=20;
input string S1="===  CONFIGURACION Alligator =======================================================================================";//=======
input int                InpJawsPeriod=13;               // Jaws period
input int                InpJawsShift=8;                 // Jaws shift
input int                InpTeethPeriod=8;               // Teeth period
input int                InpTeethShift=5;                // Teeth shift
input int                InpLipsPeriod=5;                // Lips period
input int                InpLipsShift=3;                 // Lips shift
input ENUM_MA_METHOD     InpMAMethod=MODE_SMMA;          // Moving average method
input ENUM_APPLIED_PRICE InpAppliedPrice=PRICE_MEDIAN;   // Applied price
input string S8="===  CONFIGURACION TREND FORCE =======================================================================================";//=======================================================================================
input bool FiltroTrend=true;
input double MayorFilter=0.5;
input int    trendPeriod  = 3;      // Trend period
input double TriggerUp    =  0.4;   // Trigger up level
input double TriggerDown  = -0.4;   // Trigger down level
//input int Filtro_Retroceso_ESTOCASTICO=2;
//input bool Filtro_SobreCompra_SobreVenta_Est=false;// Filtro SobreCompra SobreVenta
input string S8_="===  CONFIGURACION =======================================================================================";//========================
input bool TransparienciaDePatronesSinRSIoEST=false;
input color COLORTRANSPARIENCIA=White;
input bool VerResSop3=false;

double KArray[];
double RSIMAIN[];
input uint K_Estocastico=5;
input uint D_Estocastico=3;
input uint Ralentizacion_Estocastico=3;
input uint RSI_Period=14;

#property copyright "Ronnie Mansolillo"
#property link      "https://login.mql5.com/en/users/rosiman"
#property version   "1.01"
#property description "Recognizes Japanese candlestick patterns."

#property indicator_chart_window
#property indicator_buffers 6
#property indicator_plots   4

#property indicator_color1  Orange
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_color2  DodgerBlue
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

#property indicator_color3  Purple
#property indicator_type3   DRAW_ARROW
#property indicator_style3  STYLE_SOLID
#property indicator_width3  1

#property indicator_color4  Orange
#property indicator_type4   DRAW_ARROW
#property indicator_style4  STYLE_SOLID
#property indicator_width4  1





//Change it to true if you broker uses extra digit in quotes
input bool UseExtraDigit=false;

input bool Show_Alert=true;

input bool Display_ShootStar_2=false;
input bool Show_ShootStar_Alert_2=false;
input bool Display_ShootStar_3=false;
input bool Show_ShootStar_Alert_3=false;
input bool Display_ShootStar_4=false;
input bool Show_ShootStar_Alert_4=false;
input color Color_ShootStar=DeepPink;
int Text_ShootStar=10;

input bool Display_Hammer_2=false;
input bool Show_Hammer_Alert_2=false;
input bool Display_Hammer_3=false;
input bool Show_Hammer_Alert_3=false;
input bool Display_Hammer_4=false;
input bool Show_Hammer_Alert_4=false;
input color Color_Hammer=Blue;
int Text_Hammer=10;

input bool Display_Doji=false;
input bool Show_Doji_Alert=false;
input color Color_Doji=SpringGreen;
int Text_Doji=10;

input bool Display_Stars=false;
input bool Show_Stars_Alert = false;
input int  Star_Body_Length = 5;
input color Color_Star=Aqua;
int Text_Star=10;

input bool Display_Dark_Cloud_Cover=false;
input bool Show_DarkCC_Alert=false;
input color Color_DarkCC=Brown;
int Text_DarkCC=10;

input bool Display_Piercing_Line=false;
input bool Show_Piercing_Line_Alert=false;
input color Color_Piercing_Line=Blue;
int Text_Piercing_Line=10;

input bool Display_Bearish_Engulfing=false;
input bool Show_Bearish_Engulfing_Alert=false;
input color Color_Bearish_Engulfing=Red;
int Text_Bearish_Engulfing=8;

input bool Display_Bullish_Engulfing=false;
input bool Show_Bullish_Engulfing_Alert=false;
input color Color_Bullish_Engulfing=Blue;
int Text_Bullish_Engulfing=8;

input bool VelasOpuestasEnVolumen=true;
input bool VelasOpuestasEnVolumen_Alert=false;
int Text_VelasOpuestas=8;

input bool VelasOpuestasEnVolumenx2=true;
input bool VelasOpuestasEnVolumenx2_Alert=false;
int Text_VelasOpuestasx2=8;

input bool VelasOpuestasEnVolumenConMartillo=true;
input bool VelasOpuestasEnVolumenConMartillo_Alert=false;
int Text_VelasOpuestasConMartillo=8;

input bool VelasRSI=true;
input bool VelasRSI_Alert=false;
int Text_VelasRSI=8;

input bool VelasEST=true;
input bool VelasEST_Alert=false;
int Text_VelasEST=8;

int Base[3];//Bas
//---- buffers
double ArrowStar[];
double CansancioArrow[];
double SoporteResistencia[];
double ArrowEarth[];

string period;
double Doji_Star_Ratio= 0;
double Doji_MinLength = 0;
double Star_MinLength = 0;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_ShootStar = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Hammer = 0;          // The offset value of the hammer above or below the pointer arrow.
int  Offset_Doji = 0;            // The offset value of the doji above or below the pointer arrow.
int  Offset_Star = 0;            // The offset value of the star above or below the pointer arrow.
int  Offset_Piercing_Line = 0;   // The offset value of the piercing line above or below the pointer arrow.
int  Offset_DarkCC = 0;          // The offset value of the dark cloud cover above or below the pointer arrow.
int  Offset_Bullish_Engulfing = 0;
int  Offset_Bearish_Engulfing = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
double VALORVELASOPUESTAS=0;
int IncOffset2=0;
double VELASLARGAS=0;
int MultAnt=0;
double MAYOR,MENOR;

double Piercing_Line_Ratio = 0;
double Piercing_Candle_Length = 0;
double Engulfing_Length=0;
double Candle_WickBody_Percent=0;
int CandleLength=0;

int DefinitionEstochastic;
int DefinitionRSI;
color COLORVO=DimGray;
color COLORDESOPRES=Gold;
double ValorSopRes;
double VolumenVelasOPCM;
double VolumenMartillo;

datetime prevtime=0;

double TREND_BUFFER[];
double AL_SLOW[];
double AL_FAST[];

int Handle_Trend;
int Handle_Alligator;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnInit()
  {
   ArraySetAsSeries(TREND_BUFFER,true);
   Handle_Trend=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\Trend direction and force.ex5",trendPeriod,TriggerUp,TriggerDown);
   Handle_Alligator=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\alligator.ex5",
                            InpJawsPeriod,
                            InpJawsShift,
                            InpTeethPeriod,
                            InpTeethShift,
                            InpLipsPeriod,
                            InpLipsShift,
                            InpMAMethod,
                            InpAppliedPrice
                           );


   prevtime=0;
   if(ChartScaleGet()<2)
      paso=1;
   else
      paso=2;

   DefinitionEstochastic=iStochastic(NULL,PERIOD_CURRENT,K_Estocastico,D_Estocastico,Ralentizacion_Estocastico,MODE_SMA,STO_LOWHIGH);
   DefinitionRSI=iRSI(NULL,PERIOD_CURRENT,RSI_Period,PRICE_CLOSE);

   IndicatorSetString(INDICATOR_SHORTNAME,"PRM");
//172, 115
   PlotIndexSetInteger(0,PLOT_ARROW,170);
   PlotIndexSetInteger(1,PLOT_ARROW,115);
   PlotIndexSetInteger(2,PLOT_ARROW,104);// 159
   PlotIndexSetInteger(3,PLOT_ARROW,170);// 159
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(3,PLOT_EMPTY_VALUE,0);

   SetIndexBuffer(0,ArrowStar);
   SetIndexBuffer(1,CansancioArrow);
   SetIndexBuffer(2,SoporteResistencia);
   SetIndexBuffer(3,ArrowEarth);
   SetIndexBuffer(4,AL_FAST);
   SetIndexBuffer(5,AL_SLOW);

   ArraySetAsSeries(ArrowStar,true);
   ArraySetAsSeries(CansancioArrow,true);
   ArraySetAsSeries(SoporteResistencia,true);
   ArraySetAsSeries(ArrowEarth,true);
   ArraySetAsSeries(AL_FAST,true);
   ArraySetAsSeries(AL_SLOW,true);

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
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=10;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Hammer=5;
         Offset_ShootStar=5;
         Offset_Doji = 5;
         Offset_Star = 5;
         Offset_Piercing_Line=5;
         Offset_DarkCC=5;
         Offset_Bearish_Engulfing = 5;
         Offset_Bullish_Engulfing = 5;
         Text_ShootStar=8;
         Text_Hammer=8;
         Text_Star=8;
         Text_DarkCC=8;
         Text_Piercing_Line=8;
         Text_Bearish_Engulfing = 8;
         Text_Bullish_Engulfing = 8;
         IncOffset=16;
         VALORVELASOPUESTAS=4;
         IncOffset2=4;
         VELASLARGAS=5;
         ValorSopRes=0.2;
         VolumenVelasOPCM=1;
         VolumenMartillo=0.5;
         break;
      case PERIOD_M5:
         period="M5";
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=10;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Hammer=5;
         Offset_ShootStar=5;
         Offset_Doji = 5;
         Offset_Star = 5;
         Offset_Piercing_Line=5;
         Offset_DarkCC=5;
         Offset_Bearish_Engulfing = 5;
         Offset_Bullish_Engulfing = 5;
         Text_ShootStar=8;
         Text_Hammer=8;
         Text_Star=8;
         Text_DarkCC=8;
         Text_Piercing_Line=8;
         Text_Bearish_Engulfing = 8;
         Text_Bullish_Engulfing = 8;
         IncOffset=16;
         VALORVELASOPUESTAS=4;
         IncOffset2=4;
         VELASLARGAS=5;
         ValorSopRes=0.5;
         VolumenVelasOPCM=1;
         VolumenMartillo=0.5;
         break;
      case PERIOD_M15:
         period="M15";
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=0;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Hammer=5;
         Offset_ShootStar=5;
         Offset_Doji = 5;
         Offset_Star = 5;
         Offset_Piercing_Line=5;
         Offset_DarkCC=5;
         Offset_Bearish_Engulfing = 5;
         Offset_Bullish_Engulfing = 5;
         Text_ShootStar=8;
         Text_Hammer=8;
         Text_Star=8;
         Text_DarkCC=8;
         Text_Piercing_Line=8;
         Text_Bearish_Engulfing = 8;
         Text_Bullish_Engulfing = 8;
         IncOffset=16;
         VALORVELASOPUESTAS=4;
         IncOffset2=4;
         VELASLARGAS=7;
         ValorSopRes=0.5;
         VolumenVelasOPCM=1;
         VolumenMartillo=0.5;
         break;
      case PERIOD_M30:
         period="M30";
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=15;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Hammer=5;
         Offset_ShootStar=5;
         Offset_Doji = 5;
         Offset_Star = 5;
         Offset_Piercing_Line=5;
         Offset_DarkCC=5;
         Offset_Bearish_Engulfing = 5;
         Offset_Bullish_Engulfing = 5;
         Text_ShootStar=8;
         Text_Hammer=8;
         Text_Star=8;
         Text_DarkCC=8;
         Text_Piercing_Line=8;
         Text_Bearish_Engulfing = 8;
         Text_Bullish_Engulfing = 8;
         IncOffset=16;
         VALORVELASOPUESTAS=4;
         IncOffset2=4;
         VELASLARGAS=10;
         ValorSopRes=1;
         VolumenVelasOPCM=3;
         VolumenMartillo=1;
         break;
      case PERIOD_H1:
         period="H1";
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=25;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=30;
         High_Offset=20;
         Offset_Hammer=10;
         Offset_ShootStar=30;
         Offset_Doji = 8;
         Offset_Star = 8;
         Offset_Piercing_Line=8;
         Offset_DarkCC=8;
         Offset_Bearish_Engulfing = 8;
         Offset_Bullish_Engulfing = 8;
         Text_ShootStar=8;
         Text_Hammer=8;
         Text_Star=8;
         Text_DarkCC=8;
         Text_Piercing_Line=8;
         Text_Bearish_Engulfing = 8;
         Text_Bullish_Engulfing = 8;
         IncOffset=40;
         VALORVELASOPUESTAS=4;
         IncOffset2=100;
         VELASLARGAS=10;
         ValorSopRes=1;
         VolumenVelasOPCM=5;
         VolumenMartillo=2;
         break;
      case PERIOD_H4:
         period="H4";
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=20;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=70;
         High_Offset=150;
         Offset_Hammer=40;
         Offset_ShootStar=40;
         Offset_Doji = 10;
         Offset_Star = 10;
         Offset_Piercing_Line=10;
         Offset_DarkCC=10;
         Offset_Bearish_Engulfing = 10;
         Offset_Bullish_Engulfing = 10;
         Text_ShootStar=8;
         Text_Hammer=8;
         Text_Star=8;
         Text_DarkCC=8;
         Text_Piercing_Line=8;
         Text_Bearish_Engulfing = 8;
         Text_Bullish_Engulfing = 8;
         IncOffset=120;
         VALORVELASOPUESTAS=10;
         IncOffset2=120;
         VELASLARGAS=20;
         ValorSopRes=3;
         VolumenVelasOPCM=5;
         VolumenMartillo=2;
         break;
      case PERIOD_D1:
         period="D1";
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=30;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=150;
         High_Offset=220;
         Offset_Hammer=40;
         Offset_ShootStar=40;
         Offset_Doji = 15;
         Offset_Star = 15;
         Offset_Piercing_Line=15;
         Offset_DarkCC=15;
         Offset_Bearish_Engulfing = 15;
         Offset_Bullish_Engulfing = 15;
         Text_ShootStar=8;
         Text_Hammer=8;
         Text_Star=8;
         Text_DarkCC=8;
         Text_Piercing_Line=8;
         Text_Bearish_Engulfing = 8;
         Text_Bullish_Engulfing = 8;
         IncOffset=180;
         VALORVELASOPUESTAS=15;
         IncOffset2=180;
         VELASLARGAS=40;
         ValorSopRes=3;
         VolumenVelasOPCM=5;
         VolumenMartillo=2;
         break;
      case PERIOD_W1:
         period="W1";
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=40;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=35;
         Offset_Hammer=80;
         Offset_ShootStar=80;
         Offset_Doji = 20;
         Offset_Star = 20;
         Offset_Piercing_Line=20;
         Offset_DarkCC=20;
         Offset_Bearish_Engulfing = 20;
         Offset_Bullish_Engulfing = 20;
         Text_ShootStar=8;
         Text_Hammer=8;
         Text_Star=8;
         Text_DarkCC=8;
         Text_Piercing_Line=8;
         Text_Bearish_Engulfing = 8;
         Text_Bullish_Engulfing = 8;
         IncOffset=35;
         VALORVELASOPUESTAS=50;
         IncOffset2=40;
         VELASLARGAS=30;
         ValorSopRes=5;
         VolumenVelasOPCM=5;
         VolumenMartillo=2;
         break;
      case PERIOD_MN1:
         period="MN";
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=50;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=45;
         Offset_Hammer=140;
         Offset_ShootStar=140;
         Offset_Doji = 30;
         Offset_Star = 30;
         Offset_Piercing_Line=30;
         Offset_DarkCC=30;
         Offset_Bearish_Engulfing = 30;
         Offset_Bullish_Engulfing = 30;
         Text_ShootStar=8;
         Text_Hammer=8;
         Text_Star=8;
         Text_DarkCC=8;
         Text_Piercing_Line=8;
         Text_Bearish_Engulfing = 8;
         Text_Bullish_Engulfing = 8;
         IncOffset=45;
         VALORVELASOPUESTAS=50;
         IncOffset2=50;
         VELASLARGAS=30;
         ValorSopRes=5;
         VolumenVelasOPCM=5;
         VolumenMartillo=2;
         break;
     }

   if(UseExtraDigit)
     {
      Piercing_Candle_Length*=10;
      Engulfing_Length*=10;
      Candle_WickBody_Percent*=10;
      CandleLength*=10;
      Pointer_Offset*=10;
      High_Offset*=10;
      Offset_Hammer*=10;
      Offset_ShootStar*=10;
      Offset_Doji *= 10;
      Offset_Star *= 10;
      Offset_Piercing_Line*=10;
      Offset_DarkCC=10;
      Offset_Bearish_Engulfing *= 10;
      Offset_Bullish_Engulfing *= 10;
      IncOffset*=10;
      VELASLARGAS=30;
      ValorSopRes=5;
      VolumenVelasOPCM=5;
      VolumenMartillo=2;
     }
   double Calculo1=1/(SymbolInfoDouble(NULL,SYMBOL_TRADE_TICK_VALUE));

   Doji_Star_Ratio*=Calculo1;
   Piercing_Line_Ratio*=Calculo1;
   Piercing_Candle_Length*=Calculo1;
   Engulfing_Length*=Calculo1;
   Candle_WickBody_Percent*=Calculo1;
//CandleLength*=Calculo1;
//Pointer_Offset*=Calculo1;
//High_Offset*=Calculo1;
//Offset_Hammer*=Calculo1;
//Offset_ShootStar*=Calculo1;
//Offset_Doji *=Calculo1;
//Offset_Star *=Calculo1;
//Offset_Piercing_Line*=Calculo1;
//Offset_DarkCC*=Calculo1;
//Offset_Bearish_Engulfing *=Calculo1;
//Offset_Bullish_Engulfing *=Calculo1;
//Text_ShootStar*=Calculo1;
//Text_Hammer*=Calculo1;
//Text_Star*=Calculo1;
//Text_DarkCC*=Calculo1;
//Text_Piercing_Line*=Calculo1;
//Text_Bearish_Engulfing *=Calculo1;
//Text_Bullish_Engulfing*=Calculo1;
//IncOffset*=Calculo1;
   VALORVELASOPUESTAS*=Calculo1;
//IncOffset2*=Calculo1;
   VELASLARGAS*=Calculo1;
   ValorSopRes*=Calculo1;
   VolumenVelasOPCM*=Calculo1;
   VolumenMartillo*=Calculo1;
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

   if(BarsCalculated(Handle_Alligator)<rates_total)
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
   if(CopyBuffer(Handle_Alligator,0,0,to_copy,AL_SLOW)<=0)
      return(0);
   if(CopyBuffer(Handle_Alligator,2,0,to_copy,AL_FAST)<=0)
      return(0);

   Comment(AL_FAST[1],"  ",AL_SLOW[rates_total-5]);

   static double Range,AvgRange;
   static int counter,setalert;
   static int shift;
   static int shift1;
   static int shift2;
   static int shift3;
   static int shift4;
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
         ArrowStar[i]=0;
         CansancioArrow[i]=0;
         SoporteResistencia[i]=0;
         ArrowEarth[i]=0;
        }
     }


   if(prev_calculated!=0)
     {
      if(prevtime==Time[0])
        {
         return(rates_total);
        }
      prevtime=Time[0];
     }

   if(prev_calculated!=0)
      for(shift=0; shift<rates_total-9; shift++)
        {
         CumOffset= 0;
         setalert = 0;
         counter=shift;
         Range=0;
         AvgRange=0;


         for(counter = shift; counter <= shift + 9; counter++)
            AvgRange = AvgRange + MathAbs(High[counter] - Low[counter]);
         Range=AvgRange/10;

         shift1 = shift + 1;
         shift2 = shift + 2;
         shift3 = shift + 3;
         shift4 = shift + 4;


         for(int i=1; i<10; i++)
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


         bool Copy=CopyBuffer(Handle_Trend,2,shift,5,TREND_BUFFER);
         int Conteo=0;
         bool Trend_bool=true;
         while(Copy<=0 && !IsStopped())
           {
            if(Conteo==0)
              {
               Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE TREND FORCE EN ",Symbol()," ",EnumToString(Period()));
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL TREND FORCE");
              }
            else
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL TREND FORCE");

            Conteo++;
            Sleep(1000);
            CopyBuffer(Handle_Trend,2,shift,5,TREND_BUFFER);
            if(Conteo>3)
              {
               int Error=GetLastError();
               if(Copy<=0)
                 {
                  Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE TREND FORCE EN ",Symbol()," ",EnumToString(Period()),"  Cod ",Error);
                  Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE TREND FORCE EN ",Symbol()," ",EnumToString(Period()),"  Cod ",Error);
                  Print("NO EVALUARA TREND FORCE EN ",Symbol()," ",EnumToString(Period()),"  Cod ",Error);
                  Trend_bool=false;
                  break;
                 }
              }
           }
         if(!Trend_bool)
            continue;

         //if(shift==0)
         // Comment(TREND_BUFFER[3],"  ",TREND_BUFFER[2],"   ",TREND_BUFFER[1]);
         if(FiltroTrend)
           {
            if(MathAbs(TREND_BUFFER[1])<MayorFilter && MathAbs(TREND_BUFFER[2])<MayorFilter)
               continue;
            if(!(MathAbs(TREND_BUFFER[1])<MathAbs(TREND_BUFFER[3])) && !(MathAbs(TREND_BUFFER[1])<MathAbs(TREND_BUFFER[4])))
               continue;
           }

         bool SELL=(High[shift+1]<AL_SLOW[shift+1]+Desfase*Point() && High[shift+1]>AL_FAST[shift+1]);
         bool BUY=(Low[shift+1]>AL_SLOW[shift+1]-Desfase*Point() && Low[shift+1]<AL_FAST[shift+1]);
         //
         CopyBuffer(DefinitionEstochastic,0,shift1,3,KArray);
         ///// DEFINITIONESTOCHASTIC,0 <---- ESTO ES MAIN
         double ValorStocastico3=KArray[0];
         double ValorStocastico2=KArray[1];
         double ValorStocastico1=KArray[2];

         CopyBuffer(DefinitionRSI,0,shift1,3,RSIMAIN);
         ///// DEFINITIONESTOCHASTIC,0 <---- ESTO ES MAIN
         double ValorRSI3=RSIMAIN[0];
         double ValorRSI2=RSIMAIN[1];
         double ValorRSI1=RSIMAIN[2];

         //Print(ValorStocastico1," ",ValorStocastico2," ",ValorStocastico3);

         // Bearish Patterns
         ////////////

         //ESTOCASTICO
         if(VelasEST==true)
           {
            if(ValorStocastico1>20 && ValorStocastico2<20)
              {
               if(BUY)
                 {
                  MarkPattern(GetName("VelasEST",Time[shift]), Time[shift+paso], Low[shift+1] - (Pointer_Offset+Offset_Hammer+CumOffset)*_Point,"EST", Text_VelasEST, Aqua);
                  CumOffset = CumOffset+IncOffset;
                  ArrowStar[shift+1] = Low[shift+1]- (Pointer_Offset*_Point);
                  MultAnt++;
                  if(VelasEST_Alert == true)
                    {
                     if(setalert == 0 && Show_Alert == true)
                       {
                        pattern = "Velas EST";
                        setalert = 1;
                       }
                    }
                 }
              }
            else
               if(ValorStocastico1<80 && ValorStocastico2>80)
                 {
                  if(SELL)
                    {
                     MarkPattern(GetName("VelasEST",Time[shift]), Time[shift+paso], High[shift+1] + (Pointer_Offset+Offset_ShootStar+High_Offset+CumOffset)*_Point,"EST", Text_VelasEST, Aqua);
                     CumOffset = CumOffset+IncOffset;
                     ArrowEarth[shift+1] = High[shift+1] + (Pointer_Offset*_Point);
                     MultAnt++;
                     if(VelasEST_Alert == true)
                       {
                        if(setalert == 0 && Show_Alert == true)
                          {
                           pattern = "Velas EST";
                           setalert = 1;
                          }
                       }
                    }
                 }
           }
         //RSI
         if(VelasRSI==true)
           {
            if(ValorRSI1>30 && ValorRSI2<30)
              {
               if(BUY)
                 {
                  MarkPattern(GetName("VelasRSI",Time[shift]), Time[shift+paso], Low[shift+1] - (Pointer_Offset+Offset_Hammer+CumOffset)*_Point,"RSI", Text_VelasRSI, Aqua);
                  CumOffset = CumOffset+IncOffset;
                  ArrowStar[shift+1] = Low[shift+1] - (Pointer_Offset*_Point);
                  MultAnt++;
                  if(VelasRSI_Alert == true)
                    {
                     if(setalert == 0 && Show_Alert == true)
                       {
                        pattern = "Velas RSI";
                        setalert = 1;
                       }
                    }
                 }
              }
            else
               if(ValorRSI1<70 && ValorRSI2>70)
                 {
                  if(SELL)
                    {
                     MarkPattern(GetName("VelasRSI",Time[shift]), Time[shift+paso], High[shift+1] + (Pointer_Offset+Offset_ShootStar+High_Offset+CumOffset)*_Point,"RSI", Text_VelasRSI, Aqua);
                     CumOffset = CumOffset+IncOffset;

                     ArrowEarth[shift+1] = High[shift+1] + (Pointer_Offset*_Point);
                     MultAnt++;
                     if(VelasRSI_Alert == true)
                       {
                        if(setalert == 0 && Show_Alert == true)
                          {
                           pattern = "Velas RSI";
                           setalert = 1;
                          }
                       }
                    }
                 }
           }


         // Check for Velas opuestas en Volumen
         if((O[1]>C[1] && O[2]<C[2])||(O[1]<C[1] && O[2]>C[2]))
           {

            if((BB[1]>(BB[2]/2))&& BB[2]>VALORVELASOPUESTAS)
              {

               if(VelasOpuestasEnVolumen == true)
                 {
                  COLORVO=COLORTRANSPARIENCIA;
                  if(Period()==PERIOD_D1)
                    {
                     COLORVO=White;
                    }


                  if(O[1]>C[1] && O[2]<C[2] && (O[3]<C[3] || BB[3]<=BB[2]/2))
                    {
                     if(ValorStocastico1>80 || ValorStocastico2>80)
                       {
                        if(SELL)
                          {
                           COLORVO=IndianRed;
                           MarkPattern(GetName("VelasOPV",Time[shift]), Time[shift+paso], High[shift+1] + (Pointer_Offset+Offset_ShootStar+High_Offset+CumOffset)*_Point,"VO", Text_VelasOpuestas, COLORVO);
                           CumOffset = CumOffset+IncOffset;
                           if(SELL)
                              ArrowEarth[shift+1] = High[shift+1] + (Pointer_Offset*_Point);
                           MultAnt++;
                          }
                       }

                     else
                        if(TransparienciaDePatronesSinRSIoEST==true)
                          {
                           if(SELL)
                             {
                              COLORVO=COLORTRANSPARIENCIA;
                              MarkPattern(GetName("VelasOPV",Time[shift]), Time[shift+paso], High[shift+1] + (Pointer_Offset+Offset_ShootStar+High_Offset+CumOffset)*_Point,"VO", Text_VelasOpuestas, COLORVO);
                              CumOffset = CumOffset+IncOffset;
                              if(SELL)
                                 ArrowEarth[shift+1] = High[shift+1] + (Pointer_Offset*_Point);
                              MultAnt++;
                             }
                          }
                    }

                  else
                     if(O[1]<C[1] && O[2]>C[2] && (O[3]>C[3] || BB[3]<=BB[2]/2))
                       {

                        if(ValorStocastico1<20 || ValorStocastico2<20)
                          {
                           if(BUY)
                             {
                              COLORVO=RoyalBlue;
                              MarkPattern(GetName("VelasOPV",Time[shift]), Time[shift+paso], Low[shift+1] - (Pointer_Offset+Offset_Hammer+CumOffset)*_Point, "VO", Text_VelasOpuestas, COLORVO);
                              CumOffset = CumOffset+IncOffset;
                              if(BUY)
                                 ArrowStar[shift+1] = Low[shift+1] - (Pointer_Offset*_Point);
                              MultAnt++;
                             }
                          }

                        else
                           if(TransparienciaDePatronesSinRSIoEST==true)
                             {
                              if(BUY)
                                {
                                 COLORVO=COLORTRANSPARIENCIA;
                                 MarkPattern(GetName("VelasOPV",Time[shift]), Time[shift+paso], Low[shift+1] - (Pointer_Offset+Offset_Hammer+CumOffset)*_Point, "VO", Text_VelasOpuestas, COLORVO);
                                 CumOffset = CumOffset+IncOffset;
                                 if(BUY)
                                    ArrowStar[shift+1] = Low[shift+1] - (Pointer_Offset*_Point);
                                 MultAnt++;
                                }
                             }
                       }
                 }
               if(VelasOpuestasEnVolumen_Alert == true)
                 {
                  if(ValorStocastico1>80 || ValorStocastico2>80 || ValorStocastico1<20 || ValorStocastico2<20)
                    {
                     if(setalert == 0 && Show_Alert == true)
                       {
                        pattern = "Velas Opuestas";
                        setalert = 1;
                       }
                    }
                 }
              }
           }



         // Check for Velas opuestas en Volumen x2

         if(((O[1]>C[1] && O[2]>C[2] && O[3]<C[3]) || (O[1]<C[1] && O[2]<C[2] && O[3]>C[3])) && (BB[2]<(BB[3]/2)))
           {
            if((BB[1]+BB[2]>(BB[3]/2))&& BB[3]>VALORVELASOPUESTAS)
              {


               if(VelasOpuestasEnVolumenx2 == true)
                 {


                  if(O[1]>C[1] && O[2]>C[2] && O[3]<C[3])
                    {
                     if(ValorStocastico2>80)
                       {
                        if(SELL)
                          {
                           COLORVO=IndianRed;
                           MarkPattern(GetName("VelasOPV2",Time[shift]), Time[shift+3], High[shift+2] + (Pointer_Offset+Offset_ShootStar+High_Offset+CumOffset2)*_Point,"VOx2", Text_VelasOpuestasx2, COLORVO);
                           CumOffset2=CumOffset2+IncOffset2;
                           if(SELL)
                              ArrowEarth[shift+2] = High[shift+2] + (Pointer_Offset*_Point);
                          }
                       }
                     else
                        if(TransparienciaDePatronesSinRSIoEST==true)
                          {
                           if(SELL)
                             {
                              COLORVO=COLORTRANSPARIENCIA;
                              MarkPattern(GetName("VelasOPV2",Time[shift]), Time[shift+3], High[shift+2] + (Pointer_Offset+Offset_ShootStar+High_Offset+CumOffset2)*_Point,"VOx2", Text_VelasOpuestasx2, COLORVO);
                              CumOffset2=CumOffset2+IncOffset2;
                              if(SELL)
                                 ArrowEarth[shift+2] = High[shift+2] + (Pointer_Offset*_Point);
                             }
                          }
                    }

                  else
                    {
                     if(ValorStocastico2<20)
                       {
                        if(BUY)
                          {
                           COLORVO=RoyalBlue;
                           MarkPattern(GetName("VelasOPV2",Time[shift]), Time[shift+3], Low[shift+2] - (Pointer_Offset+Offset_Hammer+CumOffset2)*_Point, "VOx2", Text_VelasOpuestasx2, COLORVO);
                           CumOffset2=CumOffset2+IncOffset2;
                           if(BUY)
                              ArrowStar[shift+2] = Low[shift+2] - (Pointer_Offset*_Point);
                          }
                       }
                     else
                        if(TransparienciaDePatronesSinRSIoEST==true)
                          {
                           if(BUY)
                             {
                              COLORVO=COLORTRANSPARIENCIA;
                              MarkPattern(GetName("VelasOPV2",Time[shift]), Time[shift+3], Low[shift+2] - (Pointer_Offset+Offset_Hammer+CumOffset2)*_Point, "VOx2", Text_VelasOpuestasx2, COLORVO);
                              CumOffset2=CumOffset2+IncOffset2;
                              if(BUY)
                                 ArrowStar[shift+2] = Low[shift+2] - (Pointer_Offset*_Point);
                             }
                          }
                    }
                 }

               if(VelasOpuestasEnVolumenx2_Alert == true)
                 {
                  if(ValorStocastico2>80 || ValorStocastico2<20)
                    {
                     if(setalert == 0 && Show_Alert == true)
                       {
                        pattern = "Velas Opuestas x2";
                        setalert = 1;
                       }
                    }
                 }
              }
           }

         // Check for Velas opuestas en Volumen x2 v2

         if(((O[1]>C[1] && O[2]<C[2] && O[3]<C[3]) || (O[1]<C[1] && O[2]>C[2] && O[3]>C[3])) && (BB[2]<(BB[1]*3/4)))           ///&& (BB[2]<(BB[1]/2))
           {
            if((BB[3]+BB[2]>(BB[1]/2))&& BB[1]>VALORVELASOPUESTAS)
              {


               if(VelasOpuestasEnVolumenx2 == true)
                 {


                  if(O[1]>C[1] && O[2]<C[2] && O[3]<C[3])
                    {
                     if(ValorStocastico2>80)
                       {
                        if(SELL)
                          {
                           COLORVO=IndianRed;
                           MarkPattern(GetName("VelasOPV2",Time[shift]), Time[shift+3], High[shift+2] + (Pointer_Offset+Offset_ShootStar+High_Offset+CumOffset2)*_Point,"VOx2", Text_VelasOpuestasx2, COLORVO);
                           CumOffset2=CumOffset2+IncOffset2;
                           if(SELL)
                              ArrowEarth[shift+2] = High[shift+2] + (Pointer_Offset*_Point);
                          }
                       }
                     else
                        if(TransparienciaDePatronesSinRSIoEST==true)
                          {
                           if(SELL)
                             {
                              COLORVO=COLORTRANSPARIENCIA;
                              MarkPattern(GetName("VelasOPV2",Time[shift]), Time[shift+3], High[shift+2] + (Pointer_Offset+Offset_ShootStar+High_Offset+CumOffset2)*_Point,"VOx2", Text_VelasOpuestasx2, COLORVO);
                              CumOffset2=CumOffset2+IncOffset2;
                              if(SELL)
                                 ArrowEarth[shift+2] = High[shift+2] + (Pointer_Offset*_Point);
                             }
                          }
                    }

                  else
                    {
                     if(ValorStocastico2<20)
                       {
                        if(BUY)
                          {
                           COLORVO=RoyalBlue;
                           MarkPattern(GetName("VelasOPV2",Time[shift]), Time[shift+3], Low[shift+2] - (Pointer_Offset+Offset_Hammer+CumOffset2)*_Point, "VOx2", Text_VelasOpuestasx2, COLORVO);
                           CumOffset2=CumOffset2+IncOffset2;
                           if(BUY)
                              ArrowStar[shift+2] = Low[shift+2] - (Pointer_Offset*_Point);
                          }
                       }
                     else
                        if(TransparienciaDePatronesSinRSIoEST==true)
                          {
                           if(BUY)
                             {
                              COLORVO=COLORTRANSPARIENCIA;
                              MarkPattern(GetName("VelasOPV2",Time[shift]), Time[shift+3], Low[shift+2] - (Pointer_Offset+Offset_Hammer+CumOffset2)*_Point, "VOx2", Text_VelasOpuestasx2, COLORVO);
                              CumOffset2=CumOffset2+IncOffset2;
                              if(BUY)
                                 ArrowStar[shift+2] = Low[shift+2] - (Pointer_Offset*_Point);
                             }
                          }
                    }
                 }

               if(VelasOpuestasEnVolumenx2_Alert == true)
                 {
                  if(ValorStocastico2>80 || ValorStocastico2<20)
                    {
                     if(setalert == 0 && Show_Alert == true)
                       {
                        pattern = "Velas Opuestas x2";
                        setalert = 1;
                       }
                    }
                 }
              }
           }


         ////////////////////////////////////////////////////////////////////////////////////////////

         ////////////////////////////////////////////////////////////////////////////////////////////
         /// VELAS CON MARTILLO
         if(BB[3]>VolumenVelasOPCM && BB[1]>VolumenVelasOPCM && BB[2]<VolumenMartillo)
           {
            if((O[3]<C[3] && C[1]<O[1]) || (O[3]>C[3] && C[1]>O[1]))
              {
               if(VelasOpuestasEnVolumenConMartillo == true)
                 {

                  if(O[3]<C[3] && C[1]<O[1])
                    {
                     if(ValorStocastico2>80)
                       {
                        if(SELL)
                          {
                           COLORVO=IndianRed;
                           MarkPattern(GetName("VelasOPCM",Time[shift]), Time[shift+3], High[shift+2] + (Pointer_Offset+Offset_ShootStar+High_Offset+CumOffset2)*_Point, "VOCM", Text_VelasOpuestasConMartillo, COLORVO);
                           if(SELL)
                              ArrowEarth[shift+2] = High[shift+2] + (Pointer_Offset*_Point);
                           CumOffset2=CumOffset2+IncOffset2;
                          }
                       }
                     else
                        if(TransparienciaDePatronesSinRSIoEST==true)
                          {
                           if(SELL)
                             {
                              COLORVO=COLORTRANSPARIENCIA;
                              MarkPattern(GetName("VelasOPCM",Time[shift]), Time[shift+3], High[shift+2] + (Pointer_Offset+Offset_ShootStar+High_Offset+CumOffset2)*_Point, "VOCM", Text_VelasOpuestasConMartillo, COLORVO);
                              if(SELL)
                                 ArrowEarth[shift+2] = High[shift+2] + (Pointer_Offset*_Point);
                              CumOffset2=CumOffset2+IncOffset2;
                             }
                          }
                    }
                  else
                     if(O[3]>C[3] && C[1]>O[1])
                       {
                        if(ValorStocastico2<20)
                          {
                           if(BUY)
                             {
                              COLORVO=RoyalBlue;
                              MarkPattern(GetName("VelasOPCM",Time[shift]), Time[shift+3], Low[shift+2] - (Pointer_Offset+Offset_Hammer+CumOffset2)*_Point, "VOCM", Text_VelasOpuestasConMartillo, COLORVO);
                              CumOffset2=CumOffset2+IncOffset2;
                              if(BUY)
                                 ArrowStar[shift+2] = Low[shift+2] - (Pointer_Offset*_Point);
                             }
                          }
                        else
                           if(TransparienciaDePatronesSinRSIoEST==true)
                             {
                              if(BUY)
                                {
                                 COLORVO=COLORTRANSPARIENCIA;
                                 MarkPattern(GetName("VelasOPCM",Time[shift]), Time[shift+3], Low[shift+2] - (Pointer_Offset+Offset_Hammer+CumOffset2)*_Point, "VOCM", Text_VelasOpuestasConMartillo, COLORVO);
                                 CumOffset2=CumOffset2+IncOffset2;
                                 if(BUY)
                                    ArrowStar[shift+2] = Low[shift+2] - (Pointer_Offset*_Point);
                                }
                             }
                       }
                  if(VelasOpuestasEnVolumenConMartillo_Alert == true)
                    {
                     if(ValorStocastico2>80 || ValorStocastico2<20)
                       {
                        if(setalert == 0 && Show_Alert == true)
                          {
                           pattern = "Velas Opuestas Con Martillo";
                           setalert = 1;
                          }
                       }
                    }
                 }

              }

           }

         ////////////////////////////////////////////////////////////////////////////////////////////////////////////
         /// DETECTOR DE VELAS LARGAS

         /*if((C[1]<O[1]) && (BB[1] >VELASLARGAS)     ){
                CumOffset = CumOffset+IncOffset;
                CansancioArrow[shift+1] = Low[shift+1] - (Pointer_Offset*_Point);
         }
         if((O[1]<C[1]) && (BB[1] >VELASLARGAS)     ){
                CumOffset = CumOffset+IncOffset;
                CansancioArrow[shift+1] = High[shift+1] + (Pointer_Offset*_Point);
         }*/
         ///////////////////////////////////////////////////////////////////////////////////////////////////////////
         //////////////// SOPORTE Y RESISTENCIAS CON 3 VELAS SEGUIDAS///////////////////////////////////////////////

         if(VerResSop3==true)
           {
            for(int k=1; k<4; k++)
              {
               if(k==1)
                 {
                  MAYOR=0;
                  MENOR=1000;
                 }

               if(O[k]<C[k])
                 {
                  if(MENOR>O[k])
                    {
                     MENOR=O[k];
                    }
                  if(O[k]>MAYOR)
                    {
                     MAYOR=O[k];
                    }
                 }
               else
                 {
                  if(MENOR>C[k])
                    {
                     MENOR=C[k];
                    }
                  if(C[k]>MAYOR)
                    {
                     MAYOR=C[k];
                    }
                 }
              }
            if((((MAYOR-MENOR)/_Point)/10)<ValorSopRes)
              {

               //MarkPattern(GetName("SOPORTE",Time[shift]), Time[shift+1], Low[shift+1] - (Pointer_Offset+Offset_Hammer+CumOffset)*_Point, "", Text_VelasOpuestasx2, Purple);
               //CumOffset = CumOffset+IncOffset;
               if(ValorStocastico1<20)
                 {
                  SoporteResistencia[shift+1] =  MENOR - 20*_Point -(Pointer_Offset*_Point);
                  SoporteResistencia[shift+2] = MENOR - 20*_Point -(Pointer_Offset*_Point);
                  SoporteResistencia[shift+3] = MENOR-20*_Point - (Pointer_Offset*_Point);
                 }
               else
                 {
                  SoporteResistencia[shift+1] =  MENOR - 20*_Point -(Pointer_Offset*_Point);
                  SoporteResistencia[shift+2] = MENOR - 20*_Point -(Pointer_Offset*_Point);
                  SoporteResistencia[shift+3] = MENOR-20*_Point - (Pointer_Offset*_Point);
                 }

              }

            for(int l=1; l<4; l++)
              {
               if(l==1)
                 {
                  MAYOR=0;
                  MENOR=1000;
                 }

               if(C[l]<O[l])
                 {
                  if(MENOR>O[l])
                    {
                     MENOR=O[l];
                    }
                  if(O[l]>MAYOR)
                    {
                     MAYOR=O[l];
                    }
                 }
               else
                 {
                  if(MENOR>C[l])
                    {
                     MENOR=C[l];
                    }
                  if(C[l]>MAYOR)
                    {
                     MAYOR=C[l];
                    }
                 }
              }
            if((((MAYOR-MENOR)/_Point)/10)<ValorSopRes)
              {
               COLORDESOPRES=Gold;
               if(ValorStocastico1>80)
                 {
                  COLORDESOPRES=Aqua;
                 }

               // MarkPattern(GetName("RESISTENCIA",Time[shift]), Time[shift+1], High[shift+1] + (Pointer_Offset+Offset_ShootStar+High_Offset+CumOffset)*_Point, "", Text_VelasOpuestas, COLORDESOPRES);
               //CumOffset = CumOffset+IncOffset;
               if(ValorStocastico1>80)
                 {
                  SoporteResistencia[shift+1] = MAYOR+20*_Point + (Pointer_Offset*_Point);
                  SoporteResistencia[shift+2] = MAYOR +20*_Point +(Pointer_Offset*_Point);
                  SoporteResistencia[shift+3] = MAYOR +20*_Point +(Pointer_Offset*_Point);
                 }
               else
                 {
                  SoporteResistencia[shift+1] = MAYOR+20*_Point + (Pointer_Offset*_Point);
                  SoporteResistencia[shift+2] = MAYOR +20*_Point +(Pointer_Offset*_Point);
                  SoporteResistencia[shift+3] = MAYOR +20*_Point +(Pointer_Offset*_Point);
                 }
              }
           }
         /////////////////////////////////////////////////////////////////////////////////////////////




         // Check for Bearish Shooting ShootStar
         if((H[1]>=H[2]) && (H[1]>H[3]) && (H[1]>H[4]))
           {
            if(((UW[1]/2)>LW[1]) && (UW[1]>(2*BL90[1])) && (CL[1]>=(CandleLength*_Point)) && (O[1]!=C[1]) && ((UW[1]/3)<=LW[1]) && ((UW[1]/4)<=LW[1]))
              {
               if(Display_ShootStar_2)
                 {
                  if(SELL)
                    {
                     MarkPattern(GetName("SS 2",Time[shift]),Time[shift1],High[shift1]+(Pointer_Offset+Offset_ShootStar+High_Offset+CumOffset)*_Point,"SS 2",Text_ShootStar,Color_ShootStar);
                     CumOffset=CumOffset+IncOffset;
                     if(SELL)
                        ArrowStar[shift1]=High[shift1]+(Pointer_Offset*_Point);
                    }
                 }
               if(Show_ShootStar_Alert_2)
                 {
                  if((setalert==0) && (Show_Alert))
                    {
                     pattern="Shooting ShootStar 2";
                     setalert=1;
                    }
                 }
              }
           }

         // Check for Bearish Shooting ShootStar
         if((H[1]>=H[2]) && (H[1]>H[3]) && (H[1]>H[4]))
           {
            if(((UW[1]/3)>LW[1]) && (UW[1]>(2*BL90[1])) && (CL[1]>=(CandleLength*_Point)) && (O[1]!=C[1]) && ((UW[1]/4)<=LW[1]))
              {
               if(Display_ShootStar_3)
                 {
                  if(SELL)
                    {
                     MarkPattern(GetName("SS 3",Time[shift]),Time[shift1],High[shift1]+(Pointer_Offset+Offset_ShootStar+High_Offset+CumOffset)*_Point,"SS 3",Text_ShootStar,Color_ShootStar);
                     CumOffset=CumOffset+IncOffset;
                     if(SELL)
                        ArrowStar[shift1]=High[shift1]+(Pointer_Offset*_Point);
                    }
                 }
               if(Show_ShootStar_Alert_3)
                 {
                  if((setalert==0) && (Show_Alert))
                    {
                     pattern="Shooting ShootStar 3";
                     setalert=1;
                    }
                 }
              }
           }

         // Check for Bearish Shooting ShootStar
         if((H[1]>=H[2]) && (H[1]>H[3]) && (H[1]>H[4]))
           {
            if(((UW[1]/4)>LW[1]) && (UW[1]>(2*BL90[1])) && (CL[1]>=(CandleLength*_Point)) && (O[1]!=C[1]))
              {
               if(Display_ShootStar_4)
                 {
                  if(SELL)
                    {
                     MarkPattern(GetName("SS 4",Time[shift]),Time[shift1],High[shift1]+(Pointer_Offset+Offset_ShootStar+High_Offset+CumOffset)*_Point,"SS 4",Text_ShootStar,Color_ShootStar);
                     CumOffset=CumOffset+IncOffset;
                     if(SELL)
                        ArrowStar[shift1]=High[shift1]+(Pointer_Offset*_Point);
                    }
                 }
               if(Show_ShootStar_Alert_4)
                 {
                  if((setalert==0) && (Show_Alert))
                    {
                     pattern="Shooting ShootStar 4";
                     setalert=1;
                    }
                 }
              }
           }

         // Check for Evening Star pattern
         if((H[1]>=H[2]) && (H[2]>H[3]) && (H[2]>H[4]))
           {
            if((BLa[1]<(Star_Body_Length*_Point)) && (C[3]>O[3]) && (!O[1]==C[1]) && ((C[3]-O[3])/(H[3]-L[3])>Doji_Star_Ratio) && (C[2]>O[2]) && (O[1]>C[1]) && (CL[1]>=(Star_MinLength*_Point)))
              {
               if(Display_Stars)
                 {
                  if(SELL)
                    {
                     MarkPattern(GetName("Star",Time[shift]),Time[shift1],High[shift1]+(Pointer_Offset+Offset_Star+High_Offset+CumOffset)*_Point,"E_Star",Text_Star,Color_Star);
                     CumOffset=CumOffset+IncOffset;
                     if(SELL)
                        ArrowStar[shift1]=High[shift1]+(Pointer_Offset*_Point);
                    }
                 }
               if(Show_Stars_Alert)
                 {
                  if((setalert==0) && (Show_Alert))
                    {
                     pattern="Evening Star Pattern";
                     setalert=1;
                    }
                 }
              }
           }

         // Check for Evening Doji Star pattern
         if((H[1]>=H[2]) && (H[2]>H[3]) && (H[2]>H[4]))
           {
            if((O[1]==C[1]) && ((C[3]>O[3]) && (C[3]-O[3])/(H[3]-L[3])>Doji_Star_Ratio) && (C[2]>O[2]) && (CL[1]>=(Doji_MinLength*_Point)))
              {
               if(Display_Doji)
                 {
                  if(SELL)
                    {
                     MarkPattern(GetName("Doji",Time[shift]),Time[shift1],High[shift1]+(Pointer_Offset+Offset_Doji+High_Offset+CumOffset)*_Point,"E_Doji",Text_Doji,Color_Doji);
                     CumOffset=CumOffset+IncOffset;
                     if(SELL)
                        ArrowStar[shift1]=High[shift1]+(Pointer_Offset*_Point);
                    }
                 }
               if(SELL)
                  if(Show_Doji_Alert)
                    {
                     if((setalert==0) && (Show_Alert))
                       {
                        pattern="Evening Doji Star Pattern";
                        setalert=1;
                       }
                    }
              }
           }

         // Check for a Dark Cloud Cover pattern
         if((C[2]>O[2]) && (((C[2]+O[2])/2)>C[1]) && (O[1]>C[1]) && (C[1]>O[2]) && ((O[1]-C[1])/((H[1]-L[1]))>Piercing_Line_Ratio) && ((CL[1]>=Piercing_Candle_Length*_Point)))
           {
            if(Display_Dark_Cloud_Cover)
              {
               if(SELL)
                 {
                  MarkPattern(GetName("DCC",Time[shift]),Time[shift1],High[shift1]+(Pointer_Offset+Offset_DarkCC+High_Offset+CumOffset)*_Point,"DCC",Text_DarkCC,Color_DarkCC);
                  CumOffset=CumOffset+IncOffset;
                  if(SELL)
                     ArrowStar[shift1]=High[shift1]+(Pointer_Offset*_Point);
                 }
              }
            if(Show_DarkCC_Alert)
              {
               if((setalert==0) && (Show_Alert))
                 {
                  pattern = "Dark Cloud Cover Pattern";
                  setalert = 1;
                 }
              }
           }

         // Check for Bearish Engulfing pattern
         if((C[2]>O[2]) && (O[1]>C[1]) && (O[1]>=C[2]) && (O[2]>=C[1]) && ((O[1]-C[1])>(C[2]-O[2])) && (CL[1]>=(Engulfing_Length*_Point)))
           {
            if(Display_Bearish_Engulfing)
              {
               if(SELL)
                 {
                  MarkPattern(GetName("S_E",Time[shift]),Time[shift1],High[shift1]+(Pointer_Offset+Offset_Bearish_Engulfing+High_Offset+CumOffset)*_Point,"S_E",Text_Bearish_Engulfing,Color_Bearish_Engulfing);
                  CumOffset=CumOffset+IncOffset;
                  if(SELL)
                     ArrowStar[shift1]=High[shift1]+(Pointer_Offset*_Point);
                 }
              }
            if(Show_Bearish_Engulfing_Alert)
              {
               if((setalert==0) && (Show_Alert))
                 {
                  pattern="Bearish Engulfing Pattern";
                  setalert=1;
                 }
              }
           }
         // End of Bearish Patterns

         // Bullish Patterns
         // Check for Bullish Hammer
         if((L[1]<=L[2]) && (L[1]<L[3]) && (L[1]<L[4]))
           {
            if(((LW[1]/2)>UW[1]) && (LW[1]>BL90[1]) && (CL[1]>=(CandleLength*_Point)) && (O[1]!=C[1]) && ((LW[1]/3)<=UW[1]) && ((LW[1]/4)<=UW[1]))
              {
               if(Display_Hammer_2)
                 {
                  if(BUY)
                    {
                     MarkPattern(GetName("HMR 2",Time[shift]),Time[shift1],Low[shift1]-(Pointer_Offset+Offset_Hammer+CumOffset)*_Point,"HMR 2",Text_Hammer,Color_Hammer);
                     CumOffset=CumOffset+IncOffset;
                     if(BUY)
                        ArrowStar[shift1]=Low[shift1]-(Pointer_Offset*_Point);
                    }
                 }
               if(Show_Hammer_Alert_2)
                 {
                  if((setalert==0) && (Show_Alert))
                    {
                     pattern="Bullish Hammer 2";
                     setalert=1;
                    }
                 }
              }
           }

         // Check for Bullish Hammer
         if((L[1]<=L[2]) && (L[1]<L[3]) && (L[1]<L[4]))
           {
            if(((LW[1]/3)>UW[1]) && (LW[1]>BL90[1]) && (CL[1]>=(CandleLength*_Point)) && (O[1]!=C[1]) && ((LW[1]/4)<=UW[1]))
              {
               if(Display_Hammer_3)
                 {
                  if(BUY)
                    {
                     MarkPattern(GetName("HMR 3",Time[shift]),Time[shift1],Low[shift1]-(Pointer_Offset+Offset_Hammer+CumOffset)*_Point,"HMR 3",Text_Hammer,Color_Hammer);
                     CumOffset=CumOffset+IncOffset;
                     if(BUY)
                        ArrowStar[shift1]=Low[shift1]-(Pointer_Offset*_Point);
                    }
                 }
               if(Show_Hammer_Alert_3)
                 {
                  if((setalert==0) && (Show_Alert))
                    {
                     pattern="Bullish Hammer 3";
                     setalert=1;
                    }
                 }
              }
           }

         // Check for Bullish Hammer
         if((L[1]<=L[2]) && (L[1]<L[3]) && (L[1]<L[4]))
           {
            if(((LW[1]/4)>UW[1]) && (LW[1]>BL90[1]) && (CL[1]>=(CandleLength*_Point)) && (O[1]!=C[1]))
              {
               if(Display_Hammer_4)
                 {
                  if(BUY)
                    {
                     MarkPattern(GetName("HMR 4",Time[shift]),Time[shift1],Low[shift1]-(Pointer_Offset+Offset_Hammer+CumOffset)*_Point,"HMR 4",Text_Hammer,Color_Hammer);
                     CumOffset=CumOffset+IncOffset;
                     if(BUY)
                        ArrowStar[shift1]=Low[shift1]-(Pointer_Offset*_Point);
                    }
                 }
               if(Show_Hammer_Alert_4)
                 {
                  if((setalert==0) && (Show_Alert))
                    {
                     pattern="Bullish Hammer 4";
                     setalert=1;
                    }
                 }
              }
           }

         // Check for Morning Star
         if((L[1]<=L[2]) && (L[2]<L[3]) && (L[2]<L[4]))
           {
            if((BLa[1]<(Star_Body_Length*_Point)) && (!O[1]==C[1]) && ((O[3]>C[3]) && ((O[3]-C[3])/(H[3]-L[3])>Doji_Star_Ratio)) && (O[2]>C[2]) && (C[1]>O[1]) && (CL[1]>=(Star_MinLength*_Point)))
              {
               if(Display_Stars)
                 {
                  if(BUY)
                    {
                     MarkPattern(GetName("Star",Time[shift]),Time[shift1],Low[shift1]-(Pointer_Offset+Offset_Star+CumOffset)*_Point,"Star",Text_Star,Color_Hammer);
                     CumOffset=CumOffset+IncOffset;
                     if(BUY)
                        ArrowStar[shift1]=Low[shift1]-(Pointer_Offset*_Point);
                    }
                 }
               if(Show_Stars_Alert)
                 {
                  if((setalert==0) && (Show_Alert))
                    {
                     pattern="Morning Star Pattern";
                     setalert=1;
                    }
                 }
              }
           }

         // Check for Morning Doji Star
         if((L[1]<=L[2]) && (L[2]<L[3]) && (L[2]<L[4]))
           {
            if((O[1]==C[1]) && ((O[3]>C[3]) && ((O[3]-C[3])/(H[3]-L[3])>Doji_Star_Ratio)) && (O[2]>C[2]) && (CL[1]>=(Doji_MinLength*_Point)))
              {
               if(Display_Doji)
                 {
                  if(BUY)
                    {
                     MarkPattern(GetName("Doji",Time[shift]),Time[shift1],Low[shift1]-(Pointer_Offset+Offset_Doji+CumOffset)*_Point,"Doji",Text_Doji,Color_Doji);
                     CumOffset=CumOffset+IncOffset;
                     if(BUY)
                        ArrowStar[shift1]=Low[shift1]-(Pointer_Offset*_Point);
                    }
                 }
               if(Show_Doji_Alert)
                 {
                  if((shift==0) && (Show_Alert))
                    {
                     pattern="Morning Doji Pattern";
                     setalert=1;
                    }
                 }
              }
           }

         // Check for Piercing Line pattern
         if((C[2]<O[2]) && (((O[2]+C[2])/2)<C[1]) && (O[1]<C[1]) && ((C[1]-O[1])/((H[1]-L[1]))>Piercing_Line_Ratio) && (CL[1]>=(Piercing_Candle_Length*_Point)))
           {
            if(Display_Piercing_Line)
              {
               if(BUY)
                 {
                  MarkPattern(GetName("PrcLn",Time[shift]),Time[shift1],Low[shift1]-(Pointer_Offset+Offset_Piercing_Line+CumOffset)*_Point,"PrcLn",Text_Piercing_Line,Color_Piercing_Line);
                  CumOffset=CumOffset+IncOffset;
                  if(BUY)
                     ArrowStar[shift1]=Low[shift1]-(Pointer_Offset*_Point);
                 }
              }
            if(Show_Piercing_Line_Alert)
              {
               if((shift==0) && (Show_Alert))
                 {
                  pattern="Piercing Line Pattern";
                  setalert=1;
                 }
              }
           }

         // Check for Bullish Engulfing pattern
         if((O[2]>C[2]) && (C[1]>O[1]) && (C[1]>=O[2]) && (C[2]>=O[1]) && ((C[1]-O[1])>(O[2]-C[2])) && (CL[1]>=(Engulfing_Length*_Point)))
           {
            if(Display_Bullish_Engulfing)
              {
               if(BUY)
                 {
                  MarkPattern(GetName("L_E",Time[shift]),Time[shift1],Low[shift1]-(Pointer_Offset+Offset_Bullish_Engulfing+CumOffset)*_Point,"L_E",Text_Bullish_Engulfing,Color_Bullish_Engulfing);
                  CumOffset=CumOffset+IncOffset;
                  if(BUY)
                     ArrowStar[shift1]=Low[shift1]-(Pointer_Offset*_Point);
                 }
              }
            if(Show_Bullish_Engulfing_Alert)
              {
               if((shift==0) && (Show_Alert))
                 {
                  pattern="Bullish Engulfing Pattern";
                  setalert=1;
                 }
              }
           }
         // End of Bullish Patterns

         if((setalert==1) && (shift==0))
           {
            Alert(Symbol()," ",period," ",pattern);
            setalert=0;
           }
         CumOffset=0;
         CumOffset2=0;
         Base[2]=Base[1];
         Base[1]=Base[0];
         Base[0]=IncOffset2*MultAnt;
         MultAnt=0;

        } // End of for loop



   ChartRedraw();
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
   if(ObjectFind(0,name)!=0)
     {
      ObjectCreate(0,name,OBJ_TEXT,0,time,price);
      ObjectSetString(0,name,OBJPROP_TEXT,shortname);
      ObjectSetString(0,name,OBJPROP_FONT,"Times New Roman");
      ObjectSetInteger(0,name,OBJPROP_FONTSIZE,fontsize);
      ObjectSetInteger(0,name,OBJPROP_COLOR,patterncolor);
     }
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

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
