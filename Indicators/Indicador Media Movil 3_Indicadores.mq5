//+------------------------------------------------------------------+
//|                          Indicador Media Movil 3_Indicadores.mq5 |
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
#property indicator_color1  clrPink
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2  "BUY"
#property indicator_color2  clrOrange
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

int Alligator;
int Bollinger_1;
int ADX;
int Bollinger_ADX;
int EMA_Alligator;
int Divergencia_Puntos_1;
int Divergencia_Puntos_2;

input string Settings_Alligator="***Settings_Alligator***";
input int Jaw=13;
input int Jaw_Shift=8;
input int Teeth=8;
input int Teeth_Shift=5;
input int Lips=5;
input int Lips_Shift=3;
input ENUM_MA_METHOD Mode_Alligator=MODE_SMMA;
input ENUM_APPLIED_PRICE AppliedPrice_Alligator=PRICE_MEDIAN;
input string Settings_Bollinger_1="***Settings_Bollinger_1***";
input int Bollinger_1_Periodo=20;
input int Bollinger_1_Shift=0;
input int Bollinger_1_Desviation=7;

input string Settings_DivergenciaPuntos_1="***Settings_DivergenciaPuntos_1***";
input int PeriodoDivergenciaPuntos_1=7;
input int DesviacionDivergenciaPuntos_1=2;

input string Settings_DivergenciaPuntos_2="***Settings_DivergenciaPuntos_2***";
input int PeriodoDivergenciaPuntos_2=10;
input int DesviacionDivergenciaPuntos_2=0;

input string Settings_Bollinger_EMA_Alligator="***Settings_Bollinger_EMA_Alligator***";
input int Periodo_EMA=50;
input int Shift_EMA=0;
input ENUM_MA_METHOD Mode_EMA=MODE_EMA;
input string Settings_ADX="***Settings_ADX***";
input uint    PeriodoADX=25;
input string Settings_Bollinger_ADX="***Settings_Bollinger_ADX***";
input int Bollinger_ADX_Periodo=20;
input int Bollinger_ADX_Shift=0;
input int Bollinger_ADX_Desviation=2;

input string Settings_Alerts="***Settings_Alerts***";
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=true;

double AlligatorBuffer[];
double ADXBuffer[];
double Bollinger_1_Buffer_UP[];
double Bollinger_1_Buffer_DN[];
double Bollinger_1_Buffer_Central[];
double Bollinger_ADX_Buffer_DN[];
double Bollinger_ADX_Buffer_UP[];
double EMA_Buffer_Alligator[];
double Divergencia_Puntos_1_Buffer_UP[];
double Divergencia_Puntos_1_Buffer_DN[];
double Divergencia_Puntos_2_Buffer_UP[];
double Divergencia_Puntos_2_Buffer_DN[];

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
bool UseExtraDigit=false;
int Text_VelasOpuestas=10;

color COLORVO=clrAqua;

MqlRates Rates[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   Alligator=iAlligator(Symbol(),PERIOD_CURRENT,Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator);
   Bollinger_1=iBands(Symbol(),PERIOD_CURRENT,Bollinger_1_Periodo,Bollinger_1_Shift,Bollinger_1_Desviation,Alligator);
   EMA_Alligator=iMA(Symbol(),PERIOD_CURRENT,Periodo_EMA,Shift_EMA,Mode_EMA,Bollinger_1);
   ADX=iADX(Symbol(),PERIOD_CURRENT,PeriodoADX);
   Bollinger_ADX=iBands(Symbol(),PERIOD_CURRENT,Bollinger_ADX_Periodo,Bollinger_ADX_Shift,Bollinger_ADX_Desviation,ADX);
   Divergencia_Puntos_1=iCustom(Symbol(),PERIOD_CURRENT,"Divergencia 3 Indicadores - Separate Window","***Settings_Alligator***",Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator,"***Settings_Bollinger_1***"
   ,PeriodoDivergenciaPuntos_1,0,DesviacionDivergenciaPuntos_1);
   Divergencia_Puntos_2=iCustom(Symbol(),PERIOD_CURRENT,"Divergencia 3 Indicadores - Separate Window","***Settings_Alligator***",Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator,"***Settings_Bollinger_1***"
   ,PeriodoDivergenciaPuntos_2,0,DesviacionDivergenciaPuntos_2);
   
   IndicatorSetString(INDICATOR_SHORTNAME,"Indicador Estrellas EMA");
//172, 115
   SetIndexBuffer(0,ArrowSignalUP);
   SetIndexBuffer(1,ArrowSignalDN);

   PlotIndexSetInteger(0,PLOT_ARROW,170);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
  
   PlotIndexSetInteger(1,PLOT_ARROW,170);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   ArraySetAsSeries(Rates,true);
   ArraySetAsSeries(AlligatorBuffer,true);
   ArraySetAsSeries(Bollinger_1_Buffer_UP,true);
   ArraySetAsSeries(Bollinger_1_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_1_Buffer_Central,true);
   ArraySetAsSeries(Bollinger_ADX_Buffer_DN,true);
   ArraySetAsSeries(Bollinger_ADX_Buffer_UP,true);
   ArraySetAsSeries(EMA_Buffer_Alligator,true);
   ArraySetAsSeries(Divergencia_Puntos_1_Buffer_DN,true);
   ArraySetAsSeries(Divergencia_Puntos_1_Buffer_UP,true);
   ArraySetAsSeries(Divergencia_Puntos_2_Buffer_DN,true);
   ArraySetAsSeries(Divergencia_Puntos_2_Buffer_UP,true);
   
   
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
   if(prev_calculated==0){
   Start=100;
   ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
   }
   else
   Start=rates_total-1;

   for(int shift=Start;shift<rates_total;shift++){
   ArrowSignalUP[shift]=EMPTY_VALUE;
   ArrowSignalDN[shift]=EMPTY_VALUE;
   int CumOffset=0;
   ArrayResize(Rates,10);
   int copied=CopyRates(Symbol(),PERIOD_CURRENT,rates_total-1-shift,8,Rates);
   CopyBuffer(Bollinger_1,1,rates_total-1-shift,3,Bollinger_1_Buffer_UP);
   CopyBuffer(Bollinger_1,2,rates_total-1-shift,3,Bollinger_1_Buffer_DN);
   CopyBuffer(Bollinger_1,0,rates_total-1-shift,40,Bollinger_1_Buffer_Central);
   CopyBuffer(ADX,0,rates_total-1-shift,45,ADXBuffer);
   CopyBuffer(Bollinger_ADX,1,rates_total-1-shift,45,Bollinger_ADX_Buffer_UP);
   CopyBuffer(EMA_Alligator,0,rates_total-1-shift,40,EMA_Buffer_Alligator);
   CopyBuffer(Divergencia_Puntos_1,0,rates_total-1-shift,7,Divergencia_Puntos_1_Buffer_UP);
   CopyBuffer(Divergencia_Puntos_1,1,rates_total-1-shift,7,Divergencia_Puntos_1_Buffer_DN);
   CopyBuffer(Divergencia_Puntos_2,0,rates_total-1-shift,7,Divergencia_Puntos_2_Buffer_UP);
   CopyBuffer(Divergencia_Puntos_2,1,rates_total-1-shift,7,Divergencia_Puntos_2_Buffer_DN);

   ResetLastError();

   if( Divergencia_Puntos_1_Buffer_DN[2]!=EMPTY_VALUE && Divergencia_Puntos_2_Buffer_DN[2]!=EMPTY_VALUE && Rates[5].low>EMA_Buffer_Alligator[5] &&  
      Rates[4].low>EMA_Buffer_Alligator[4] &&  Rates[3].low>EMA_Buffer_Alligator[3] &&  Rates[2].low>EMA_Buffer_Alligator[2] &&  Rates[1].low>EMA_Buffer_Alligator[1] && 
      Rates[1].close>Bollinger_1_Buffer_DN[1] && EMA_Buffer_Alligator[2]<Bollinger_1_Buffer_DN[2])
     {
      bool AlertaCondicion1=true;
      for(int j=1;j<36;j++){
      if(EMA_Buffer_Alligator[j]>Bollinger_1_Buffer_Central[j]){
      AlertaCondicion1=false; break;
      }
      }
      bool AlertaCondicion2=false;
      for(int j=3;j<40;j++){
      if(ADXBuffer[j]>Bollinger_ADX_Buffer_UP[j] && ADXBuffer[j+1]>Bollinger_ADX_Buffer_UP[j+1] && ADXBuffer[j+2]>Bollinger_ADX_Buffer_UP[j+2] )
      {AlertaCondicion2=true; break;}
      }
      
      if(AlertaCondicion1 && AlertaCondicion2){
         //MarkPattern(GetName("VelasOPV",time[shift-1]), time[shift-1], low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "VO", Text_VelasOpuestas, COLORVO);
         CumOffset = CumOffset+IncOffset;
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
     }

   if(Divergencia_Puntos_1_Buffer_UP[2]!=EMPTY_VALUE && Divergencia_Puntos_2_Buffer_UP[2]!=EMPTY_VALUE && Rates[5].high<EMA_Buffer_Alligator[5] &&  
      Rates[4].high<EMA_Buffer_Alligator[4] &&  Rates[3].high<EMA_Buffer_Alligator[3] &&  Rates[2].high<EMA_Buffer_Alligator[2] &&  Rates[1].high<EMA_Buffer_Alligator[1]
      && Rates[1].close<Bollinger_1_Buffer_UP[1] && EMA_Buffer_Alligator[2]>Bollinger_1_Buffer_UP[2])
     {
      bool AlertaCondicion1=true;
      for(int j=1;j<36;j++){
      if(EMA_Buffer_Alligator[j]<Bollinger_1_Buffer_Central[j]){
      AlertaCondicion1=false; break;
      }
      }
      bool AlertaCondicion2=false;
      for(int j=3;j<40;j++){
      if(ADXBuffer[j]>Bollinger_ADX_Buffer_UP[j] && ADXBuffer[j+1]>Bollinger_ADX_Buffer_UP[j+1] && ADXBuffer[j+2]>Bollinger_ADX_Buffer_UP[j+2] )
      {AlertaCondicion2=true; break;}
      }
     
      if(AlertaCondicion1 && AlertaCondicion2){  
         //MarkPattern(GetName("VelasOPV",time[shift-1]), time[shift-1], high[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"VO", Text_VelasOpuestas, COLORVO);
         CumOffset = CumOffset+IncOffset;
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
    }
    prevTime=time[rates_total-1];
//--- return value of prev_calculated for next call
   return(rates_total);
  }
  
void MarkPattern(const string name,const datetime time,const double price,const string shortname,const int fontsize,const color patterncolor)
  {
   ObjectCreate(0,name,OBJ_TEXT,0,time,price);
   ObjectSetString(0,name,OBJPROP_TEXT,shortname);
   ObjectSetString(0,name,OBJPROP_FONT,"Times New Roman");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,fontsize);
   ObjectSetInteger(0,name,OBJPROP_COLOR,patterncolor);
  }
  
 string GetName(string aName,datetime timeshift)
  {
   return(aName + DoubleToString(timeshift, 0));
  }

void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,0,OBJ_TEXT);
   Comment("");
  }
