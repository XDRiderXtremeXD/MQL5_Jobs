//+------------------------------------------------------------------+
//|                                      Indicador SopRes Rachan.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"

#property indicator_chart_window
#property indicator_buffers 6
#property indicator_plots   2

#property indicator_label1  "SELL"
#property indicator_color1  Orange
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2  "BUY"
#property indicator_color2  Orange
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

string label_name="mainwindow_label";

int window=-1;

input int delayAlert=10; //Delay Alert in Seconds
//input int DistanciaRecorrido=5;

input color ColorTexto=clrAqua;

input bool Show_Alert=true; //ACTIVAR ALERTA

//Change it to true if you broker uses extra digit in quotes
bool UseExtraDigit=false;


input string NombreIndicadorSopRes="Proyecto Felix//Support_and_Resistance";
input double Valor_1_Porciento=1000;
input double Porcentaje_Aproximacion=0.02;
input double Porcentaje_Rompimiento_Maximo=0.015;

input string NombreIndicadorRachan="Proyecto Felix//Rachan Levis25030";
input double sobrecompra = 75;
input double periodo = 2;
input double sobreventa = 25; 
input bool Audible_Alerts =false;


//---- buffers
double ArrowSignalUP[];
double ArrowSignalDN[];
double SOP[];
double RES[];
double BUY_RACHAN[];
double SELL_RACHAN[];

string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.

double Candle_WickBody_Percent=0;

int DefinitionSopRes;
int DefinitionRACHAN;

//color COLORVO=Aqua;

int paso=0;
bool CUENTA=false;
bool ALERTAACTIVADA=false;
datetime TiempoPrevio=0;
int MAXIMO=0;
int vez=1;

int PeriodoMaximo=0;

datetime TimeAlert=0;

bool CRUCE=false;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   DefinitionSopRes=iCustom(Symbol(),PERIOD_CURRENT,NombreIndicadorSopRes);
   DefinitionRACHAN=iCustom(Symbol(),PERIOD_CURRENT,NombreIndicadorRachan,sobrecompra,periodo,sobreventa,Audible_Alerts);

   IndicatorSetString(INDICATOR_SHORTNAME,"SOP_RES_RACHAN");
//172, 115

   SetIndexBuffer(0,ArrowSignalUP,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalDN,INDICATOR_DATA);
   SetIndexBuffer(2,SOP,INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,RES,INDICATOR_CALCULATIONS);
   SetIndexBuffer(4,BUY_RACHAN,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,SELL_RACHAN,INDICATOR_CALCULATIONS);

   PlotIndexSetInteger(0,PLOT_ARROW,181);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(1,PLOT_ARROW,181);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   ArraySetAsSeries(ArrowSignalDN,false);
   ArraySetAsSeries(ArrowSignalUP,false);

   ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);

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

   if(BarsCalculated(DefinitionSopRes)<rates_total)
      return(0);
   if(BarsCalculated(DefinitionRACHAN)<rates_total)
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
   if(CopyBuffer(DefinitionSopRes,0,0,to_copy,SOP)<=0)
      return(0);
   if(CopyBuffer(DefinitionSopRes,1,0,to_copy,RES)<=0)
      return(0);
   if(CopyBuffer(DefinitionRACHAN,0,0,to_copy,BUY_RACHAN)<=0)
      return(0);
   if(CopyBuffer(DefinitionRACHAN,1,0,to_copy,SELL_RACHAN)<=0)
      return(0);


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

   if(prevtime!=Time[rates_total-1])
     {
      if(ObjectFind(0,label_name)>=0)
         ObjectDelete(0,label_name);
      CRUCE=false;
      TimeAlert=0;
     }

   if(prevtime==Time[rates_total-1] && ALERTAACTIVADA==true)
     {
      if(ObjectFind(0,label_name)<0)
        {
         Print("Generating a label");
         ObjectCreate(0,label_name,OBJ_LABEL,0,0,0);
         ObjectSetInteger(0,label_name,OBJPROP_XDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_YDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_COLOR,ColorTexto);
         ObjectSetString(0,label_name,OBJPROP_TEXT,"Formandose Señal Sop Res");
         ObjectSetString(0,label_name,OBJPROP_FONT,"Comic Sans");
         ObjectSetInteger(0,label_name,OBJPROP_FONTSIZE,10);
         ObjectSetInteger(0,label_name,OBJPROP_SELECTABLE,false);
         ChartRedraw(0);
        }
      //return(rates_total);
     }
   
   prevtime=Time[rates_total-1];

   int START=0;
   if(prev_calculated!=0)
     {
      START=rates_total-1;
     }
   else
     {
      START=12;
      ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
     }

   for(shift=START; shift<rates_total; shift++)
     {
      
      CumOffset= 0;
      setalert = 0;
      counter=shift;
      Range=0;
      AvgRange=0;
      ArrowSignalUP[shift]=EMPTY_VALUE;
      ArrowSignalDN[shift]=EMPTY_VALUE;

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

      bool Condicion=false;
      ALERTAACTIVADA=false;
      bool CondicionBuy=false;
      bool CondicionSell=false;
     
      double AnteriorHigh=0;
      int j=1;
      
      while(RES[shift]==RES[shift-j] && shift-j>1 ){
      double AnteriorHighEva=(Close[shift-j]>Open[shift-j] && RES[shift-j]>Close[shift-j])?Close[shift-j]:0;
      if( (AnteriorHighEva>AnteriorHigh || AnteriorHigh==0) && AnteriorHighEva!=0)
      AnteriorHigh=AnteriorHighEva;
        j++;}
      CondicionSell=(Close[shift-j+1]>Open[shift-j+1])?true:false;
      
      double AnteriorLow=0;
      
      j=1;
      while(SOP[shift]==SOP[shift-j] && shift-j>1 ){
      double AnteriorLowEva=(Close[shift-j]<Open[shift-j] && SOP[shift-j]<Close[shift-j])?Close[shift-j]:0;
      if((AnteriorLowEva<AnteriorLow || AnteriorLow==0) && AnteriorLowEva!=0)
      AnteriorLow=AnteriorLowEva;
         j++;}
         
      CondicionBuy=Close[shift-j+1]<Open[shift-j+1]?true:false;

      if(AnteriorHigh-(Porcentaje_Aproximacion)*Valor_1_Porciento*Point()<Close[shift] &&
         AnteriorHigh+(Porcentaje_Rompimiento_Maximo)*Valor_1_Porciento*Point()>Close[shift]
         && SELL_RACHAN[shift]!=EMPTY_VALUE && C[0]>O[0] && C[1]<O[1] && AnteriorHigh!=0 && CondicionSell)
        {
         Condicion=true;
         CumOffset = CumOffset+IncOffset;
         ArrowSignalUP[shift] = High[shift] + (Pointer_Offset*_Point);
        }

      else
         if(AnteriorLow+(Porcentaje_Aproximacion)*Valor_1_Porciento*Point()>Close[shift] &&
            AnteriorLow-(Porcentaje_Rompimiento_Maximo)*Valor_1_Porciento*Point()<Close[shift] &&
            BUY_RACHAN[shift]!=EMPTY_VALUE && C[0]<O[0] && C[1]>O[1] && AnteriorLow!=0 && CondicionBuy)
           {
            Condicion=true;
            CumOffset = CumOffset+IncOffset;
            ArrowSignalDN[shift] = Low[shift] - (Pointer_Offset*_Point);
           }
      double AproximacionUP=AnteriorHigh-(Porcentaje_Aproximacion)*Valor_1_Porciento*Point();  
      double AlcanceUP=AnteriorHigh+(Porcentaje_Rompimiento_Maximo)*Valor_1_Porciento*Point(); 
      double AproximacionDN=AnteriorLow+(Porcentaje_Aproximacion)*Valor_1_Porciento*Point(); 
      double AlcanceDN=AnteriorLow-(Porcentaje_Rompimiento_Maximo)*Valor_1_Porciento*Point(); 

      if(Condicion==false)
         CRUCE=false;


      if(Show_Alert == true && Condicion==true)
        {
         pattern = "Cruce RSI";
         setalert = 1;
        }

      if((setalert==1) && (shift==rates_total-1) && CRUCE==false)
        {
         CRUCE=true;
         ALERTAACTIVADA=true;
         setalert=0;
         if(TimeAlert<TimeCurrent() || TimeAlert==0)
           {
            Alert(Symbol()," ",period," ",pattern);
            SendNotification("Formandose Patron en "+Symbol()+" Temporalidad: "+EnumToString(PERIOD_CURRENT));
            TimeAlert=TimeCurrent()+delayAlert;
           }
        }
      CumOffset=0;

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

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+