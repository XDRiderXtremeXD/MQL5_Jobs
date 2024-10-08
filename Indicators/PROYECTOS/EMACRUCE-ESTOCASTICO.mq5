//+------------------------------------------------------------------+
//|                                         EMACRUCE-ESTOCASTICO.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+//

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"
#property description "CRUCE EMAS CON ESTOCASTICO"

#property indicator_chart_window
#property indicator_buffers 2
#property indicator_plots   2

#property indicator_color1  clrOrange
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_color2  clrOrange
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

string label_name="mainwindow_label";

input color ColorTexto=clrAqua;

input bool Show_Alert=true; //ACTIVAR ALERTA

bool VelasOpuestasEnVolumen=true;
input bool Alerta_Cruce=true;

//Change it to true if you broker uses extra digit in quotes
bool UseExtraDigit=false;


int Text_VelasOpuestas=8;

//---- buffers
double ArrowSignalBuy[];
double ArrowSignalSell[];
double EMA_100[];
double EMA_300[];
double Estocastico_Buf[];



string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
int VALORVELASOPUESTAS=0;

double Candle_WickBody_Percent=0;

color COLORVO=clrAqua;

bool ALERTAACTIVADA=false;

int DefinitionEMA100,DefinitionEMA300, DefinitionEstocastico;


input string EMA1=" -------------EMA 1-----------";
input int PeriodEMA1=100;
input int ShiftEma1=0;
input ENUM_MA_METHOD ModeEma1=MODE_LWMA;
input ENUM_APPLIED_PRICE AppPriceEma1=PRICE_WEIGHTED;

input string EMA2=" -------------EMA 2-----------";
input int PeriodEMA2=100;
input int ShiftEma2=0;
input ENUM_MA_METHOD ModeEma2=MODE_LWMA;
input ENUM_APPLIED_PRICE AppPriceEma2=PRICE_WEIGHTED;

input string Estocastico=" -------------ESTOCASTICO-----------";
input int K_Period=1;
input int D_Period=1;
input int Slowing=1;
input ENUM_MA_METHOD Mode_Estocastico=MODE_SMA;
input ENUM_STO_PRICE STO_Mode=STO_LOWHIGH;
input int SobreCompra=80;
input int SobreVenta=20;


datetime UNTIL=D'2020.11.14 00:00'; 

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   
   IndicatorSetString(INDICATOR_SHORTNAME,"PCruce");
   
   SetIndexBuffer(0,ArrowSignalBuy);
   SetIndexBuffer(1,ArrowSignalSell);

   ArraySetAsSeries(ArrowSignalBuy,false);
   ArraySetAsSeries(ArrowSignalSell,false);
   
   ArraySetAsSeries(EMA_100,true);
   ArraySetAsSeries(EMA_300,true);
   ArraySetAsSeries(Estocastico_Buf,true);
   
   ArrayResize(EMA_100,3,0);
   ArrayResize(EMA_300,3,0);
   ArrayResize(Estocastico_Buf,3,0);
   
   PlotIndexSetInteger(0,PLOT_ARROW,170);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   
   PlotIndexSetInteger(1,PLOT_ARROW,170);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   
   DefinitionEMA100=iMA(Symbol(),PERIOD_CURRENT,PeriodEMA1,ShiftEma1,ModeEma1,AppPriceEma1);
   DefinitionEMA300=iMA(Symbol(),PERIOD_CURRENT,PeriodEMA2,ShiftEma2,ModeEma2,AppPriceEma2);
   DefinitionEstocastico=iStochastic(Symbol(),PERIOD_CURRENT,K_Period,D_Period,Slowing,Mode_Estocastico,STO_Mode);

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
   Comment("PeriodoPrueba: ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
   return (INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,0,OBJ_TEXT);
   ObjectsDeleteAll(0,0,OBJ_LABEL);
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
   ArraySetAsSeries(Time,false);
   ArraySetAsSeries(High,false);
   ArraySetAsSeries(Low,false);
   ArraySetAsSeries(Close,false);
   ArraySetAsSeries(Open,false);

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

   if(prevtime==Time[0] && ALERTAACTIVADA==true)
     {
      if(ObjectFind(0,label_name)<0)
        {
         Print("Generating a label");
         ObjectCreate(0,label_name,OBJ_LABEL,0,0,0);
         ObjectSetInteger(0,label_name,OBJPROP_XDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_YDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_COLOR,ColorTexto);
         ObjectSetString(0,label_name,OBJPROP_TEXT,"Formandose CRUCE EMAS");
         ObjectSetString(0,label_name,OBJPROP_FONT,"Comic Sans");
         ObjectSetInteger(0,label_name,OBJPROP_FONTSIZE,10);
         ObjectSetInteger(0,label_name,OBJPROP_SELECTABLE,false);
         ChartRedraw(0);
        }
      return(rates_total);
     }

   if(ObjectFind(0,label_name)>=0)
      ObjectDelete(0,label_name);

   prevtime=Time[0];

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
      ArrowSignalBuy[shift]=EMPTY_VALUE;
      ArrowSignalSell[shift]=EMPTY_VALUE;
      ArrowSignalBuy[rates_total-1]=EMPTY_VALUE;
      ArrowSignalSell[rates_total-1]=EMPTY_VALUE;
      
      CumOffset= 0;
      setalert = 0;
      counter=shift;
      Range=0;
      AvgRange=0;

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
      
      CopyBuffer(DefinitionEMA100,0,rates_total-1-shift,3,EMA_100);
      CopyBuffer(DefinitionEMA300,0,rates_total-1-shift,3,EMA_300);
      CopyBuffer(DefinitionEstocastico,0,rates_total-1-shift,3,Estocastico_Buf);
      
    
      bool Condicion=false;
      ALERTAACTIVADA=false;

      // Check for Velas opuestas en Volumen
      if( (EMA_100[0]>EMA_300[0] && EMA_100[1]<EMA_300[1] && (Estocastico_Buf[0]<SobreVenta || Estocastico_Buf[1]<SobreVenta || Estocastico_Buf[2]<SobreVenta) ) || (EMA_100[0]<EMA_300[0] && EMA_100[1]>EMA_300[1] && (Estocastico_Buf[0]>SobreCompra || Estocastico_Buf[1]>SobreCompra || Estocastico_Buf[2]>SobreCompra) ))
        {
         if(VelasOpuestasEnVolumen == true)
           {
            if(EMA_100[0]<EMA_300[0]) ///SELL
              {
                  Condicion=true;
                  if(shift!=rates_total-1){
                  MarkPattern(GetName("VelasOPV",Time[shift]), Time[shift], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"CRU", Text_VelasOpuestas, COLORVO);
                  CumOffset = CumOffset+IncOffset;
                  ArrowSignalSell[shift] = High[shift] + (Pointer_Offset*_Point);}
                 
              }

            else
               if(EMA_100[0]>=EMA_300[0])  ///BUY
                 {   Condicion=true;
                     if(shift!=rates_total-1){
                     MarkPattern(GetName("VelasOPV",Time[shift]), Time[shift], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "CRU", Text_VelasOpuestas, COLORVO);
                     CumOffset = CumOffset+IncOffset;
                     ArrowSignalBuy[shift] = Low[shift] - (Pointer_Offset*_Point);}
                 }
           }
         if(Alerta_Cruce == true)
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
