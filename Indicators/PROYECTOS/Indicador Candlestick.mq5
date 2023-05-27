//+------------------------------------------------------------------+
//|                                        Indicador Candlestick.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"
#property description "Indicador que avisa mediante una alerta la formacion de un patron regresivo"
#property description "con vela recien formandose- en otras palabras te avisa cuando se esta formando"
#property description "el patron regresivo y no cuando ha terminado de formarse la vela"

#property indicator_separate_window

#property indicator_buffers 3
#property indicator_plots   3

input int x=260;
input int y=80;
input ENUM_BASE_CORNER CORNER_INDEX=CORNER_RIGHT_UPPER;

#property indicator_label1  "Nivel 1"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrRed
#property indicator_width1  1

#property indicator_label2  "Nivel 2"
#property indicator_type2   DRAW_LINE
#property indicator_color2  clrGreen,clrYellow
#property indicator_width2  1

#property indicator_label3  "Nivel 3"
#property indicator_type3   DRAW_LINE
#property indicator_color3  clrYellow
#property indicator_width3  1

#property indicator_maximum 90
#property indicator_minimum 50

double        LINE_1[];
double        LINE_2[];
double        LINE_3[];
double        LINE_30[];
double        LINE_50[];
double ATR[];

int DefinitionEMA;

string label_name="mainwindow_label";

int window=-1;

input double PorcentajeSignal=70;

input color ColorTexto=Aqua;

input bool Show_Alert=true; //ACTIVAR ALERTA

input bool VelasOpuestasEnVolumen=true;
input bool VelasOpuestasEnVolumen_Alert=true;

//Change it to true if you broker uses extra digit in quotes
input bool UseExtraDigit=false;


input string SeparadorRSI="----SEPARADOR ATR----";
input int PeriodATR=1;

int Text_VelasOpuestas=8;
int BajistaBase=0;
int BajistaCorreccion=0;
int AlcistaBase=0;
int AlcistaCorreccion=0;


string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
int VALORVELASOPUESTAS=0;

double Candle_WickBody_Percent=0;

int DefinitionATR;

color COLORVO=Aqua;

bool CUENTA=false;
bool ALERTAACTIVADA=false;
datetime TiempoPrevio=0;
int MAXIMO=0;
bool vez=true;
int PeriodoMaximo=0;
int DefinitionInteccion1=0;
int DefinitionInteccion2=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   PeriodoMaximo=PeriodATR;

   DefinitionATR=iATR(Symbol(),PERIOD_CURRENT,PeriodATR);
   DefinitionInteccion1=iMA(Symbol(),Period(),30,0,MODE_LWMA,PRICE_CLOSE);
   DefinitionInteccion2=iMA(Symbol(),Period(),50,0,MODE_LWMA,PRICE_CLOSE);
   DefinitionEMA=iCustom(Symbol(),Period(),"Emas Candlestick");

   CrearTexto();

   IndicatorSetString(INDICATOR_SHORTNAME,"PatronesCandlestick");

   SetIndexBuffer(0,LINE_1,INDICATOR_DATA);
   SetIndexBuffer(1,LINE_2,INDICATOR_DATA);
   SetIndexBuffer(2,LINE_3,INDICATOR_DATA);

   ArraySetAsSeries(LINE_30,false);
   ArraySetAsSeries(LINE_50,false);
   ArraySetAsSeries(ATR,true);
   ArraySetAsSeries(LINE_1,false);
   ArraySetAsSeries(LINE_2,false);
   ArraySetAsSeries(LINE_3,false);

   ArrayInitialize(LINE_30,EMPTY_VALUE);
   ArrayInitialize(LINE_50,EMPTY_VALUE);
   ArrayInitialize(ATR,EMPTY_VALUE);
   ArrayInitialize(LINE_1,EMPTY_VALUE);
   ArrayInitialize(LINE_2,EMPTY_VALUE);
   ArrayInitialize(LINE_3,EMPTY_VALUE);

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
   ObjectsDeleteAll(0,0,OBJ_LABEL);
   ObjectsDeleteAll(0,0,OBJ_RECTANGLE_LABEL);
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
   ArraySetAsSeries(Time,false);
   ArraySetAsSeries(High,false);
   ArraySetAsSeries(Low,false);
   ArraySetAsSeries(Close,false);
   ArraySetAsSeries(Open,false);

   if(BarsCalculated(DefinitionInteccion1)<rates_total) //BASTA CON UNO PARA HACER EL CALCULO
      return(0);
   if(BarsCalculated(DefinitionInteccion2)<rates_total) //BASTA CON UNO PARA HACER EL CALCULO
      return(0);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
////// o SIGNAL_LINE............
   if(CopyBuffer(DefinitionInteccion2,0,0,to_copy,LINE_50)<=0)
      return(0);
   if(CopyBuffer(DefinitionInteccion1,0,0,to_copy,LINE_30)<=0)
      return(0);


   static double Range,AvgRange;
   static datetime prevtime=0;
   static int counter,setalert;
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
   
   ///////////////////IGUALAR CUADRO//////////////////
   double  ABperc,ACperc,BNperc,BCperc;
   if(vez==true  && prev_calculated!=0){
   
   if(AlcistaBase==0 && AlcistaCorreccion==0){
   ABperc=0;
   ACperc=0;
   }
   else{
   ABperc=(AlcistaBase/double(AlcistaBase+AlcistaCorreccion))*100;
   ACperc=(AlcistaCorreccion/double(AlcistaBase+AlcistaCorreccion))*100;
   }
   if(BajistaBase==0 && BajistaCorreccion==0){
   BNperc=0;
   BCperc=0;
   }
   else{
   BNperc=(BajistaBase/double(BajistaBase+BajistaCorreccion))*100;
   BCperc=(BajistaCorreccion/double(BajistaBase+BajistaCorreccion))*100;
   }
   
   string name= "Label "+string(1)+" "+string(2);
   ObjectSetString(0,name,OBJPROP_TEXT,0,string(AlcistaBase));
   name= "Label "+string(2)+" "+string(2);
   ObjectSetString(0,name,OBJPROP_TEXT,0,string(AlcistaCorreccion));
   name= "Label "+string(3)+" "+string(2);
   ObjectSetString(0,name,OBJPROP_TEXT,0,string(BajistaBase));
   name= "Label "+string(4)+" "+string(2);
   ObjectSetString(0,name,OBJPROP_TEXT,0,string(BajistaCorreccion));
   
   name= "Label "+string(1)+" "+string(3);
   ObjectSetString(0,name,OBJPROP_TEXT,0,DoubleToString(ABperc,2));
   name= "Label "+string(2)+" "+string(3);
   ObjectSetString(0,name,OBJPROP_TEXT,0,DoubleToString(ACperc,2));
   name= "Label "+string(3)+" "+string(3);
   ObjectSetString(0,name,OBJPROP_TEXT,0,DoubleToString(BNperc,2));
   name= "Label "+string(4)+" "+string(3);
   ObjectSetString(0,name,OBJPROP_TEXT,0,DoubleToString(BCperc,2));
   vez=false;
   }
   ////////////////////////////////////////////////
   if(prevtime==Time[rates_total-1] && prev_calculated!=0)
     {
      return(rates_total);
     }
   AlcistaBase=0; AlcistaCorreccion=0;BajistaBase=0;BajistaCorreccion=0;
   
   vez=true;
   prevtime=Time[rates_total-1];
   
   static int a=0;
   a++;
   Comment(a);

   int start=12;
   if(prev_calculated!=0)
      start=rates_total-7;

   for(int shift=start; shift<rates_total; shift++)
     {
      CumOffset= 0;
      setalert = 0;
      counter=shift;
      Range=0;
      AvgRange=0;

      LINE_1[shift-1]=80;
      LINE_2[shift-1]=70;
      LINE_3[shift-1]=60;
      LINE_1[shift]=80;
      LINE_2[shift]=70;
      LINE_3[shift]=60;

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
         BB[i]=(BLa[i]/_Point)/10;//TAMAÑO DEL VALOR ABSOUTO DEL TAMAÑO DEL CUERPO EN PIPS NORMALES
        }

      CopyBuffer(DefinitionATR,0,shift,3,ATR);

      bool Condicion=false,Base=false,Correccion=false;
      bool Alcista=false;

      double Mayor=UW[1]>LW[1]?UW[1]:LW[1];
      
      
      ////////////////////////////CENTRADO////////////////////////////////////////////////
      if(Mayor<UW[1]+Point() && Mayor<LW[1]+Point() && (  (LINE_30[shift-2]<LINE_30[shift-1] && H[4]<H[1] && H[3]<H[1] && H[2]<H[1]) || (H[2]<H[1] && H[3]<H[1] && LINE_30[shift-2]>LINE_30[shift-1]) ||
       (LINE_30[shift-2]>LINE_30[shift-1] && L[4]>L[1] && L[3]>L[1] && L[2]>L[1]) || (L[2]>L[1] && L[3]>L[1] && LINE_30[shift-2]<LINE_30[shift-1]) ) )
        {
         if(LINE_30[shift-2]<LINE_30[shift-1] && H[4]<H[1] && H[3]<H[1] && H[2]<H[1]){  ///BAJISTA BASE
         Base=true; Alcista=false;
         }
         else if (H[2]<H[1] && H[3]<H[1] && LINE_30[shift-2]>LINE_30[shift-1]){ //BAJISTA CORRECION
         Base=false;Alcista=false;
         }
         else if (LINE_30[shift-2]>LINE_30[shift-1] && L[4]>L[1] && L[3]>L[1] && L[2]>L[1]){ //ALCISTA BASE
         Base=true; Alcista=true;
         }
         else                                                                          ////ALCISTA CORRECION
         Base=false; Alcista=true;
         
         int Desplazamiento=0;
        
         if((H[1]-L[1])<0.6*ATR[1])////////////////////TAMAÑO BARRA PEQUEÑO////////
           {
            if(BLa[1]<=(H[1]-L[1])/10)/////// CUERPO PEQUEÑO//////////
              {
               Condicion=true;
               MarkPattern(GetName("Dogi",Time[shift-1]), Time[shift-1], High[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"D", Text_VelasOpuestas, COLORVO);
               CumOffset = CumOffset+IncOffset;
               Desplazamiento=3;
              }
            else /////// CUERPO GRANDE//////////
              {
               Condicion=true;
               MarkPattern(GetName("Spining Top",Time[shift-1]), Time[shift-1], High[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"ST", Text_VelasOpuestas, COLORVO);
               CumOffset = CumOffset+IncOffset;
               Desplazamiento=5;
              }
           }

         else ////////////////////TAMAÑO BARRA GRANDE////////
           {
            if(BLa[1]<=(H[1]-L[1])/10) /////// CUERPO PEQUEÑO//////////
              {
               Condicion=true;
               MarkPattern(GetName("Long legged dogi",Time[shift-1]), Time[shift-1], High[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"LL", Text_VelasOpuestas, COLORVO);
               CumOffset = CumOffset+IncOffset;
               Desplazamiento=7;
              }
            else /////// CUERPO GRANDE//////////
              {
               Condicion=true;
               MarkPattern(GetName("High Wave",Time[shift-1]), Time[shift-1], High[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"HW", Text_VelasOpuestas, COLORVO);
               CumOffset = CumOffset+IncOffset;
               Desplazamiento=9;
              }
           }
           if(Condicion==true && shift>rates_total-8){
               if(Base==true && Alcista==true){
               AlcistaBase++;
               LINE_1[shift-1]=LINE_1[shift-1]+Desplazamiento;}
               else if(Base==false && Alcista==true){
               AlcistaCorreccion++;
               LINE_1[shift-1]=LINE_1[shift-1]+Desplazamiento;
               }
               else if(Base==true && BajistaBase==true){
               BajistaBase++;
               LINE_1[shift-1]=LINE_1[shift-1]-Desplazamiento;
               }
               else{
               BajistaCorreccion++;
               LINE_1[shift-1]=LINE_1[shift-1]-Desplazamiento;
               }
              }
        }

////////////////////////////////BAJISTAAAAAA///////////////////////////
      if((LINE_30[shift-2]<LINE_30[shift-1] && H[4]<H[1] && H[3]<H[1] && H[2]<H[1]) || (H[2]<H[1] && H[3]<H[1] && LINE_30[shift-2]>LINE_30[shift-1]))
        {
         if(LINE_30[shift-2]<LINE_30[shift-1] && H[4]<H[1] && H[3]<H[1] && H[2]<H[1])///BASE
            Base=true;
         if(H[2]<H[1] && H[3]<H[1] && LINE_30[shift-2]>LINE_30[shift-1])////CORRECCION
              Correccion=true;

               if(BLa[1]<=(H[1]-L[1])/10 &&  UW[1]>ATR[1]) /// PATRON GRAVESTONE
              {
               Condicion=true;
               MarkPattern(GetName("Gravestone",Time[shift-1]), Time[shift-1], High[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"GS", Text_VelasOpuestas, COLORVO);
                  CumOffset = CumOffset+IncOffset;
                  LINE_2[shift-1]=LINE_2[shift-1]-3;
                  
                  if(shift>rates_total-8){
                  if(Base==true )
                     BajistaBase++;
                  else
                     BajistaCorreccion++;}
                 }

               else
                  if(BLa[1]>(H[1]-L[1])/10 &&  UW[1]>ATR[1])/// PATRON LONG LOWER SHADOW
                 {
                  Condicion=true;
                  MarkPattern(GetName("Long Lower Shadow",Time[shift-1]), Time[shift-1], High[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"LLS", Text_VelasOpuestas, COLORVO);
                     CumOffset = CumOffset+IncOffset;
                     LINE_2[shift-1]=LINE_2[shift-1]-6;
                     if(shift>rates_total-8){
                     if(Base==true)
                        BajistaBase++;
                     else
                        BajistaCorreccion++;}
                    }
                  else
                     if(BLa[1]<=(H[1]-L[1])/2 && UW[1]>LW[1]*2)/// PATRON SHOOTING STAR
                    {
                     Condicion=true;
                     MarkPattern(GetName("Shooting Star",Time[shift-1]), Time[shift-1], High[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"SS", Text_VelasOpuestas, COLORVO);
                        CumOffset = CumOffset+IncOffset;
                        LINE_3[shift-1]=LINE_3[shift-1]-3;
                        if(shift>rates_total-8){
                        if(Base==true)
                           BajistaBase++;
                        else
                           BajistaCorreccion++;
                       }
                     }
        }



////////////////////////////////ALCISTA///////////////////////////
      if((LINE_30[shift-2]>LINE_30[shift-1] && L[4]>L[1] && L[3]>L[1] && L[2]>L[1]) || (L[2]>L[1] && L[3]>L[1] && LINE_30[shift-2]<LINE_30[shift-1]))
        {
         if(LINE_30[shift-2]>LINE_30[shift-1] && L[4]>L[1] && L[3]>L[1] && L[2]>L[1])///BASE
            Base=true;
         if(L[2]>L[1] && L[3]>L[1] && LINE_30[shift-2]<LINE_30[shift-1])/// CORRECCION
            Correccion=true;

         if(BLa[1]<=(H[1]-L[1])/10 &&  LW[1]>ATR[1]) /// PATRON DRAGFON FLY
           {
            Condicion=true;
            MarkPattern(GetName("Dragfon Fly",Time[shift-1]), Time[shift-1], Low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "DF", Text_VelasOpuestas, COLORVO);
            CumOffset = CumOffset+IncOffset;
            //ArrowSignalDN[shift-1] = Low[shift-1] - (Pointer_Offset*_Point);
            LINE_2[shift-1]=LINE_2[shift-1]+3;
            
            if(shift>rates_total-8){
            if(Base==true)
               AlcistaBase++;
            else
               AlcistaCorreccion++;}

           }

         else
            if(BLa[1]>(H[1]-L[1])/10 &&  LW[1]>ATR[1]) /// PATRON Long Upper Shadow
              {
               Condicion=true;
               MarkPattern(GetName("Long Upper Shadow",Time[shift-1]), Time[shift-1], Low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "LU", Text_VelasOpuestas, COLORVO);
               CumOffset = CumOffset+IncOffset;
               //ArrowSignalDN[shift-1] = Low[shift-1] - (Pointer_Offset*_Point);
               LINE_2[shift-1]=LINE_2[shift-1]+6;
               if(shift>rates_total-8){
               if(Base==true)
                  AlcistaBase++;
               else
                  AlcistaCorreccion++;}
              }
            else
               if(BLa[1]<=(H[1]-L[1])/2 && LW[1]>UW[1]*2) ///PATRON Hummer
                 {
                  Condicion=true;
                  MarkPattern(GetName("Hummer",Time[shift-1]), Time[shift-1], Low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "HU", Text_VelasOpuestas, COLORVO);
                  CumOffset = CumOffset+IncOffset;
                  LINE_3[shift-1]=LINE_3[shift-1]+3;
                  if(shift>rates_total-8){
                  if(Base==true)
                     AlcistaBase++;
                  else
                     AlcistaCorreccion++;}
                 }
        }

//////////////////////ALARMA/////////////////////////////
      if((setalert==1) && (shift==rates_total-1))
        {
         //Alert(Symbol()," ",period," ",pattern);
         setalert=0;
         //SendNotification("Formandose Patron en "+Symbol()+" Temporalidad: "+EnumToString(PERIOD_CURRENT));
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
   ObjectSetInteger(0,name,OBJPROP_BACK,true);
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
//|                                                                  |
//+------------------------------------------------------------------+
void CrearTexto()
  {

   string name="CuadradoNegro";
   ObjectCreate(0,name,OBJ_RECTANGLE_LABEL,0,0,0);
   int chart_ID=0;


   int DistanceX=0;
   if(CORNER_INDEX==CORNER_RIGHT_UPPER || CORNER_INDEX==CORNER_RIGHT_LOWER)
      DistanceX=x;

   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,DistanceX);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,0);
//--- establecemos las dimensiones de la etiqueta
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,x+2);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,y+2);
//--- establecemos el color del fondo
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,clrBlue);
//--- establecemos el tipo del borde
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_TYPE,2);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del punto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,CORNER_INDEX);
//--- establecemos el color del contorno plano (en modo Flat)
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clrBlack);
//--- establecemos el estilo de las líneas del contorno plano
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,STYLE_DASH);
//--- establecemos el grosor del contorno plano
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,2);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,false);

   for(int j=0; j<4; j++)
     {
      for(int i=0; i<5; i++)
        {
         DistanceX=0;
         if(CORNER_INDEX==CORNER_RIGHT_UPPER || CORNER_INDEX==CORNER_RIGHT_LOWER)
            DistanceX=x/6;

         string TEXT=GENERAR(i,j);
         int StrengTEXT=StringLen(TEXT);
         name="Label "+string(i)+" "+string(j); //j==filas i==columnas
         ObjectCreate(0,name,OBJ_LABEL,0,0,0);
         ObjectSetInteger(0,name,OBJPROP_CORNER,CORNER_INDEX);
         ObjectSetInteger(0,name,OBJPROP_COLOR,clrWhite);
         ObjectSetInteger(0,name,OBJPROP_XDISTANCE,(x/5)*(i)+(x/5)/StrengTEXT+DistanceX);
         ObjectSetInteger(0,name,OBJPROP_YDISTANCE,(y/4)*(j)+((y/4)/2)-4);
         ObjectSetString(0,name,OBJPROP_TEXT,0,TEXT);
         ObjectSetInteger(0,name,OBJPROP_BACK,false);
         ObjectSetInteger(0,name,OBJPROP_FONTSIZE,8);
        }
     }

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string GENERAR(int i,int j)
  {
   if(j==0)
     {
      if(i==0)
         return " ";
      if(i==1)
         return "Alcista";
      if(i==2)
         return "Alcista";
      if(i==3)
         return "Bajista";
      if(i==4)
         return "Bajista";
     }
   else
      if(j==1)
        {
         if(i==0)
            return " ";
         if(i==1)
            return "en base";
         if(i==2)
            return "en corr";
         if(i==3)
            return "en base";
         if(i==4)
            return "en corr";
        }
      else
         if(j==2 && i==0)
            return "Nro de Velas";
         else
            if(j==3 && i==0)
               return "%s/Alc/Baj";

   return "------";
  }
//+------------------------------------------------------------------+
