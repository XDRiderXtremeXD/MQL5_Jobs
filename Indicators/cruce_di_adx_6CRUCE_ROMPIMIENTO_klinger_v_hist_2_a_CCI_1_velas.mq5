//+------------------------------------------------------------------+
//|                           ADX_Indicador_3_con_Klinger_Prueba.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_plots   2

#property indicator_label1  "SELL"
#property indicator_color1  clrDeepPink
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2  "BUY"
#property indicator_color2  clrLime
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

int Alligator;
int Bollinger_1;
int Bollinger_2;
int Bollinger_3;
int ForceIndex;
int Bollinger_ForceIndex;
int Klinger_Oscilator;
int Bollinger_Klinger;
int ADX;
int ADX_2;
int ADX_3;
int ADX_4;
int ADX_5;


int Bollinger_ADX;
int Gator_Oscilator;
int CCI;
int Bollinger_CCI;

input int MaximoVelasKlinger=5;
input string Settings_Alligator="***Settings_Alligator***"; ///*---
input int Jaw=13;
input int Jaw_Shift=8;
input int Teeth=8;
input int Teeth_Shift=5;
input int Lips=5;
input int Lips_Shift=3;
input ENUM_MA_METHOD Mode_Alligator=MODE_SMMA;
input ENUM_APPLIED_PRICE AppliedPrice_Alligator=PRICE_MEDIAN;
input string Settings_Bollinger_1="***Settings_Bollinger_1***";  ///*---
input int Bollinger_1_Periodo=20;
input int Bollinger_1_Shift=0;
input int Bollinger_1_Desviation=7;
input string Settings_Bollinger_2="***Settings_Bollinger_2***";  ///*---
input int Bollinger_2_Periodo=30;
input int Bollinger_2_Shift=0;
input int Bollinger_2_Desviation=2;
input double DistanciaBollinger2=100;
input string Settings_Bollinger_3="***Settings_Bollinger_3***";  ///*---
input int Bollinger_3_Periodo=10;
input int Bollinger_3_Shift=0;
input int Bollinger_3_Desviation=9;
input string Settings_Force_Index="***Settings_Force_Index***";  ///*---
input int Force_Periodo=30;
input ENUM_MA_METHOD Force_Mode=MODE_SMA;
input ENUM_APPLIED_VOLUME Force_Volume_Type=VOLUME_TICK;
input string Settings_Bollinger_ForceIndex="***Settings_Bollinger_ForceIndex***";  ///*---
input int Bollinger_ForceIndex_Periodo=20;
input int Bollinger_ForceIndex_Shift=0;
input int Bollinger_ForceIndex_Desviation=2;
input double DistanciaBollingerForce=0.0003;
input string Settings_Klinger_Oscillator="***Settings_Klinger_Oscillator***";   ///*---
input uint     InpPeriodFast  =  34;   // Fast period
input uint     InpPeriodSlow  =  55;   // Slow period
input uint     InpPeriodSig   =  13;   // Signal period
input string Settings_Bollinger_Klinger="***Settings_Bollinger_Klinger***";  ///*---
input int Bollinger_Klinger_Periodo=20;
input int Bollinger_Klinger_Shift=0;
input int Bollinger_Klinger_Desviation=2;


input string Settings_ADX="***Settings_ADX***";  ///*---
input uint    PeriodoADX=14;
input string Settings_Bollinger_ADX="***Settings_Bollinger_ADX***";   ///*---
input int Bollinger_ADX_Periodo=20;
input int Bollinger_ADX_Shift=0;
input int Bollinger_ADX_Desviation=2;

input string Settings_ADX_2="***Settings_ADX_2***";
input uint    PeriodoADX_2=25;

input string Settings_ADX_3="***Settings_ADX_3***";
input uint    PeriodoADX_3=44;

input string Settings_ADX_4="***Settings_ADX_4***";
input uint    PeriodoADX_4=88;


input string Settings_ADX_5="***Settings_ADX_5***";
input uint    PeriodoADX_5=120;

input string Settings_Gator_Oscilator="***Settings Gator Oscilator***";   ///*---
input int                InpJawsPeriod=13;               // Jaws period
input int                InpJawsShift=8;                 // Jaws shift
input int                InpTeethPeriod=8;               // Teeth period
input int                InpTeethShift=5;                // Teeth shift
input int                InpLipsPeriod=5;                // Lips period
input int                InpLipsShift=3;                 // Lips shift
input ENUM_MA_METHOD     InpMAMethod=MODE_SMMA;          // Moving average method
input ENUM_APPLIED_PRICE InpAppliedPrice=PRICE_MEDIAN;   // Applied price

input string Settings_CCI="***Settings_CCI***";   ///*---
input uint    PeriodoCCI=56;
input ENUM_APPLIED_PRICE CCI_applied_price=PRICE_TYPICAL;
input string Settings_Bollinger_CCI="***Settings_Bollinger_CCI***";
input int Bollinger_CCI_Periodo=20;
input int Bollinger_CCI_Shift=0;
input int Bollinger_CCI_Desviation=2;

input string Settings_Alerts="***Settings_Alerts***";
input bool AlertPC=false;
input bool AlertMovil=false;
input bool AlertMail=false;

double ArrowSignalUP[];
double ArrowSignalDN[];

double AlligatorBuffer[];
double ForceIndexBuffer[];
double KlingerBuffer[];
double ADXBuffer[];
double ADX_2_Buffer[];
double DI_2_plusBuffer[];
double DI_2_minusBuffer[];
double ADX_3_Buffer[];
double DI_3_plusBuffer[];
double DI_3_minusBuffer[];
double ADX_4_Buffer[];
double DI_4_plusBuffer[];
double DI_4_minusBuffer[];
double ADX_5_Buffer[];
double DI_5_plusBuffer[];
double DI_5_minusBuffer[];
double DI_plusBuffer[];
double DI_minusBuffer[];
double Bollinger_1_Buffer_UP[];
double Bollinger_1_Buffer_DN[];
double Bollinger_1_Buffer_BASE[];
double Bollinger_2_Buffer_DN[];
double Bollinger_2_Buffer_UP[];
double Bollinger_2_Buffer_BASE[];
double Bollinger_3_Buffer_UP[];
double Bollinger_3_Buffer_DN[];
double Bollinger_3_Buffer_BASE[];
double Bollinger_ForceIndex_Buffer_DN[];
double Bollinger_ForceIndex_Buffer_UP[];
double Bollinger_ForceIndex_Buffer_BASE[];
double Bollinger_Klinger_Buffer_DN[];
double Bollinger_Klinger_Buffer_UP[];
double Bollinger_Klinger_Buffer_BASE[];
double Bollinger_ADX_Buffer_UP[];
double Gator_Oscilator_Buffer_UP[];
double CCIBuffer[];
double Bollinger_CCI_Buffer_UP[];
double Bollinger_CCI_Buffer_DN[];
double Bollinger_CCI_Buffer_BASE[];

string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
int VALORVELASOPUESTAS=0;
bool UseExtraDigit=false;
int Text_VelasOpuestas=10;

datetime Buy_Tiempo=0;
datetime Sell_Tiempo=0;
color COLORVO=clrAqua;

MqlRates Rates[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   Alligator=iAlligator(Symbol(),PERIOD_CURRENT,Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator);
   Bollinger_1=iBands(Symbol(),PERIOD_CURRENT,Bollinger_1_Periodo,Bollinger_1_Shift,Bollinger_1_Desviation,Alligator);
   Bollinger_2=iBands(Symbol(),PERIOD_CURRENT,Bollinger_2_Periodo,Bollinger_2_Shift,Bollinger_2_Desviation,Bollinger_1);
   ForceIndex=iForce(Symbol(),PERIOD_CURRENT,Force_Periodo,Force_Mode,Force_Volume_Type);
   Bollinger_ForceIndex=iBands(Symbol(),PERIOD_CURRENT,Bollinger_ForceIndex_Periodo,Bollinger_ForceIndex_Shift,Bollinger_ForceIndex_Desviation,ForceIndex);
   Klinger_Oscilator=iCustom(Symbol(),PERIOD_CURRENT,"Klinger_Oscillator",InpPeriodFast,InpPeriodSlow,InpPeriodSig);
   Bollinger_Klinger=iBands(Symbol(),PERIOD_CURRENT,Bollinger_Klinger_Periodo,Bollinger_Klinger_Shift,Bollinger_Klinger_Desviation,Klinger_Oscilator);
   ADX=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX);
    ADX_2=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_2);
   ADX_3=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_3);
   ADX_4=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_4);
    ADX_5=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX_5);
   Bollinger_ADX=iBands(Symbol(),PERIOD_CURRENT,Bollinger_ADX_Periodo,Bollinger_ADX_Shift,Bollinger_ADX_Desviation,ADX);
   Gator_Oscilator=iGator(Symbol(),PERIOD_CURRENT,InpJawsPeriod,InpJawsShift,InpTeethPeriod,InpTeethShift,InpLipsPeriod,InpLipsShift
   ,InpMAMethod,InpAppliedPrice);
    CCI=iCCI(Symbol(),PERIOD_CURRENT,PeriodoCCI,CCI_applied_price);
    Bollinger_CCI=iBands(Symbol(),PERIOD_CURRENT,Bollinger_CCI_Periodo,Bollinger_CCI_Shift,Bollinger_CCI_Desviation,CCI);
   
   ArraySetAsSeries(Rates,true);
   ArraySetAsSeries(AlligatorBuffer,true);
   ArraySetAsSeries(ForceIndexBuffer,true);
   ArraySetAsSeries(ADXBuffer,true);
    ArraySetAsSeries(DI_plusBuffer,true);
   ArraySetAsSeries(DI_minusBuffer,true);
   ArraySetAsSeries(KlingerBuffer,true);
   ArraySetAsSeries(Bollinger_1_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_1_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_1_Buffer_BASE,true);
   ArraySetAsSeries(Bollinger_2_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_2_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_2_Buffer_BASE,true);
   ArraySetAsSeries(Bollinger_3_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_3_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_3_Buffer_BASE,true);
   ArraySetAsSeries(Bollinger_ADX_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_Klinger_Buffer_BASE,true);
   ArraySetAsSeries(Bollinger_Klinger_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_Klinger_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_ForceIndex_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_ForceIndex_Buffer_UP,true);
   ArraySetAsSeries(Gator_Oscilator_Buffer_UP,true);
   ArraySetAsSeries(CCIBuffer,true);
   ArraySetAsSeries(Bollinger_CCI_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_CCI_Buffer_UP,true);
      ArraySetAsSeries(DI_2_plusBuffer,true);
   ArraySetAsSeries(DI_2_minusBuffer,true);
   ArraySetAsSeries(DI_3_plusBuffer,true);
   ArraySetAsSeries(DI_3_minusBuffer,true);
   ArraySetAsSeries(DI_4_plusBuffer,true);
   ArraySetAsSeries(DI_4_minusBuffer,true);
   ArraySetAsSeries(DI_5_plusBuffer,true);
   ArraySetAsSeries(DI_5_minusBuffer,true);

   IndicatorSetString(INDICATOR_SHORTNAME,"Indicador Estrellas EMA");
//172, 115
   SetIndexBuffer(0,ArrowSignalUP);
   SetIndexBuffer(1,ArrowSignalDN);

   PlotIndexSetInteger(0,PLOT_ARROW,81);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(1,PLOT_ARROW,81);
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

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
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
   static datetime prevTime=0;
   if(prevTime==time[rates_total-1])
      return(rates_total);

   int Start=100;
   if(prev_calculated==0)
     {
      Start=100;
      ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
     }
   else
      Start=rates_total-1;

   for(int shift=Start; shift<rates_total; shift++)
     {
      ArrowSignalUP[shift]=EMPTY_VALUE;
      ArrowSignalDN[shift]=EMPTY_VALUE;
      int CumOffset=0;
      ArrayResize(Rates,10);
      int copied=CopyRates(Symbol(),PERIOD_CURRENT,rates_total-1-shift,8,Rates);

      CopyBuffer(Bollinger_1,1,rates_total-shift-1,50,Bollinger_1_Buffer_UP);
      CopyBuffer(Bollinger_1,2,rates_total-shift-1,50,Bollinger_1_Buffer_DN);
      CopyBuffer(Bollinger_1,0,rates_total-shift-1,50,Bollinger_1_Buffer_BASE);
      CopyBuffer(Bollinger_2,1,rates_total-shift-1,4,Bollinger_2_Buffer_UP);
      CopyBuffer(Bollinger_2,2,rates_total-shift-1,4,Bollinger_2_Buffer_DN);
      CopyBuffer(Bollinger_2,0,rates_total-shift-1,4,Bollinger_2_Buffer_BASE);
      CopyBuffer(Bollinger_3,1,rates_total-shift-1,5,Bollinger_3_Buffer_UP);
      CopyBuffer(Bollinger_3,2,rates_total-shift-1,5,Bollinger_3_Buffer_DN);
      CopyBuffer(Bollinger_3,0,rates_total-shift-1,5,Bollinger_3_Buffer_BASE);
      CopyBuffer(ForceIndex,0,rates_total-shift-1,4,ForceIndexBuffer);
      CopyBuffer(Bollinger_ForceIndex,2,rates_total-shift-1,4,Bollinger_ForceIndex_Buffer_DN);
      CopyBuffer(Bollinger_ForceIndex,1,rates_total-shift-1,4,Bollinger_ForceIndex_Buffer_UP);
      CopyBuffer(Klinger_Oscilator,0,rates_total-shift-1,4,KlingerBuffer);
      CopyBuffer(Bollinger_Klinger,2,rates_total-shift-1,4,Bollinger_Klinger_Buffer_DN);
      CopyBuffer(Bollinger_Klinger,1,rates_total-shift-1,4,Bollinger_Klinger_Buffer_UP);
      CopyBuffer(Bollinger_Klinger,0,rates_total-shift-1,4,Bollinger_Klinger_Buffer_BASE);
      CopyBuffer(ADX,0,rates_total-shift-1,5,ADXBuffer);
      CopyBuffer(ADX,1,rates_total-shift-1,5,DI_plusBuffer);
      CopyBuffer(ADX,2,rates_total-shift-1,5,DI_minusBuffer);
      CopyBuffer(Bollinger_ADX,1,rates_total-shift-1,5,Bollinger_ADX_Buffer_UP);
      CopyBuffer(Gator_Oscilator,0,rates_total-shift-1,4,Gator_Oscilator_Buffer_UP);
       CopyBuffer(CCI,0,rates_total-shift-1,4,CCIBuffer);
      CopyBuffer(Bollinger_CCI,1,rates_total-1-shift,40,Bollinger_CCI_Buffer_UP);
     CopyBuffer(Bollinger_CCI,2,rates_total-1-shift,40,Bollinger_CCI_Buffer_DN);
          CopyBuffer(ADX_2,0,rates_total-1-shift,46,ADX_2_Buffer);
   CopyBuffer(ADX_2,1,rates_total-shift-1,46,DI_2_plusBuffer);
   CopyBuffer(ADX_2,2,rates_total-shift-1,46,DI_2_minusBuffer);
   CopyBuffer(ADX_3,0,rates_total-1-shift,47,ADX_3_Buffer);
   CopyBuffer(ADX_3,1,rates_total-shift-1,47,DI_3_plusBuffer);
   CopyBuffer(ADX_3,2,rates_total-shift-1,47,DI_3_minusBuffer);
   CopyBuffer(ADX_4,0,rates_total-1-shift,48,ADX_4_Buffer);
   CopyBuffer(ADX_4,1,rates_total-shift-1,48,DI_4_plusBuffer);
   CopyBuffer(ADX_4,2,rates_total-shift-1,48,DI_4_minusBuffer);
      CopyBuffer(ADX_5,1,rates_total-shift-1,50,DI_5_plusBuffer);
    CopyBuffer(ADX_5,2,rates_total-shift-1,50,DI_5_minusBuffer); 
      
      ResetLastError();
ResetLastError();

   if(   ((DI_plusBuffer[2]<DI_minusBuffer[2]  && DI_plusBuffer[1]>DI_minusBuffer[1]   )  ||     ( DI_plusBuffer[2]<ADXBuffer[2]  && DI_plusBuffer[1]>ADXBuffer[1] ) ||     ( (MathAbs(DI_plusBuffer[1]-DI_minusBuffer[1])>22)  && DI_plusBuffer[1]>ADXBuffer[1] && ADXBuffer[1]>23) ||     ( (MathAbs(DI_plusBuffer[1]-DI_minusBuffer[1])>23)  && ADXBuffer[1]>DI_plusBuffer[1]   && DI_plusBuffer[1]>DI_minusBuffer[1] && ADXBuffer[1]>DI_minusBuffer[1]  && ADXBuffer[1]>26 ) )       &&   Rates[1].high>Rates[2].high  && Rates[1].high>Rates[3].high && ((Bollinger_1_Buffer_UP[1])-(Bollinger_1_Buffer_DN[1]))<((Bollinger_1_Buffer_UP[2])-(Bollinger_1_Buffer_DN[2])) && ((Bollinger_1_Buffer_UP[2])-(Bollinger_1_Buffer_DN[2]))<((Bollinger_1_Buffer_UP[3])-(Bollinger_1_Buffer_DN[3]))  && ((Bollinger_1_Buffer_UP[3])-(Bollinger_1_Buffer_DN[3]))<((Bollinger_1_Buffer_UP[4])-(Bollinger_1_Buffer_DN[4]))  &&   KlingerBuffer[1]>Bollinger_Klinger_Buffer_UP[1] && KlingerBuffer[0]>Bollinger_Klinger_Buffer_UP[0] && (CCIBuffer[2]<Bollinger_CCI_Buffer_UP[2] && CCIBuffer[0]>Bollinger_CCI_Buffer_UP[0] ) 
                && Rates[2].close<Bollinger_1_Buffer_UP[2]  && Rates[1].close<Bollinger_1_Buffer_UP[1]
   
   
    ){
      ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
      if(shift==rates_total-1){
         if(AlertPC)
            Alert("Operacion Buy en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
         if(AlertMovil)
            SendNotification("Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
         if(AlertMail)
            SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
         }
     }

   if(    ((DI_plusBuffer[2]>DI_minusBuffer[2]  && DI_plusBuffer[1]<DI_minusBuffer[1] ) || ( DI_minusBuffer[2]>ADXBuffer[2]  && DI_minusBuffer[1]<ADXBuffer[1] )      ||     ( (MathAbs(DI_plusBuffer[1]-DI_minusBuffer[1])>22)  && DI_minusBuffer[1]>ADXBuffer[1] && ADXBuffer[1]>23 )  ||     ( (MathAbs(DI_plusBuffer[1]-DI_minusBuffer[1])>23)  && ADXBuffer[1]>DI_plusBuffer[1]   && DI_plusBuffer[1]<DI_minusBuffer[1] && ADXBuffer[1]>DI_minusBuffer[1]  && ADXBuffer[1]>26 )  )     &&   Rates[1].low<Rates[2].low  &&   Rates[1].low<Rates[3].low   && ((Bollinger_1_Buffer_UP[1])-(Bollinger_1_Buffer_DN[1]))<((Bollinger_1_Buffer_UP[2])-(Bollinger_1_Buffer_DN[2])) && ((Bollinger_1_Buffer_UP[2])-(Bollinger_1_Buffer_DN[2]))<((Bollinger_1_Buffer_UP[3])-(Bollinger_1_Buffer_DN[3]))  && ((Bollinger_1_Buffer_UP[3])-(Bollinger_1_Buffer_DN[3]))<((Bollinger_1_Buffer_UP[4])-(Bollinger_1_Buffer_DN[4]))  &&  KlingerBuffer[1]<Bollinger_Klinger_Buffer_DN[1] && KlingerBuffer[0]<Bollinger_Klinger_Buffer_DN[0] &&  (CCIBuffer[2]>Bollinger_CCI_Buffer_DN[2] && CCIBuffer[0]<Bollinger_CCI_Buffer_DN[0]) 
                && Rates[2].close>Bollinger_1_Buffer_DN[2]  && Rates[1].close>Bollinger_1_Buffer_DN[1]
   
    ) {
      ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
      if(shift==rates_total-1){
         if(AlertPC)
            Alert("Operacion Sell en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
         if(AlertMovil)
            SendNotification("Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
         if(AlertMail)
            SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
         }
       }  
    }
   prevTime=time[rates_total-1];
//--- return value of prev_calculated for next call
   return(rates_total);
  }

//+------------------------------------------------------------------+
//|                                                                  |
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
//|                                                                  |
//+------------------------------------------------------------------+
string GetName(string aName,datetime timeshift)
  {
   return(aName + DoubleToString(timeshift, 0));
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,0,OBJ_TEXT);
   Comment("");
  }
//+------------------------------------------------------------------+
