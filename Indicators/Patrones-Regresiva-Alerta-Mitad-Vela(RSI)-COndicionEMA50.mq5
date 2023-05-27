
//+------------------------------------------------------------------+
//|                      Patrones Regresiva Alerta Mitad Vela        |
//|                                      Modifier: Claudio Chumpitaz |
//|                      https://www.mql5.com/es/users/claudioangelo |
//|                          Based on MT4 indicator by: Carl Sanders |
//+------------------------------------------------------------------+

//double KArray[];
//double RSIMAIN[];
//input uint RSI_Period=14;

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"
#property description "Indicador que avisa mediante una alerta la formacion de un patron regresivo"
#property description "con vela recien formandose- en otras palabras te avisa cuando se esta formando"
#property description "el patron regresivo y no cuando ha terminado de formarse la vela"

#property indicator_chart_window
#property indicator_buffers 6
#property indicator_plots   2

#property indicator_color1  clrOrange
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_color2  clrAqua
#property indicator_type2   DRAW_LINE
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

#property indicator_type3   DRAW_NONE
#property indicator_type4   DRAW_NONE
#property indicator_type5   DRAW_NONE
#property indicator_type6   DRAW_NONE



string label_name="Label_Indicador_Patron_Regresivo";

int window=-1;

input color ColorTexto=Aqua;
bool PatronConEma=true;//ACTIVAR CONDICION EMA
input string SEPARADOR="-------SWICTH ESTRATEGIAS--------";
input bool PatronConRSI=true;//ACTIVAR CONDICION RSI
input bool PatronConEnvelopes=true;//ACTIVAR CONDICION Envelopes

input string SEPARADOR2="-------CONDICIONES ESTRATEGIAS--------";
input double ValorRecorridoRSI=50;
input int VelasAEvaluarEnvelopesAnteriores=4;
input string SEPARADOR3="-------ZERO-LAG--------";
input int InpPeriod=10; //Periodo ZERO_LAG
input   ENUM_APPLIED_PRICE   InpPrice=PRICE_MEDIAN; //Price ZERO_LAG
input string SEPARADOR4="------------RSI------------";
input int PeriodoRSI=2; //Periodo del RSI
input ENUM_APPLIED_PRICE  PriceRSI=PRICE_CLOSE; //Periodo del RSI
input string SEPARADOR5="------------ENVELOPES------------";
input int PeriodoEnvelopes=5; //Periodo de Envelopes
input int ShiftEnvelopes=0; //Desplazamiento Envelopes
input ENUM_MA_METHOD MA_Envelopes=MODE_SMA;
input ENUM_APPLIED_PRICE AppliedPriceEnvelopes=PRICE_CLOSE; //Price Envelopes
input double DesviationEnvelopes=0.100; //Deslizamiento Envelopes
input string SEPARADOR6="------------EMA------------";
input int PeriodoEMA=50;
input int ShiftEma=0;
input ENUM_MA_METHOD MODE_LINE=MODE_SMA;
input ENUM_APPLIED_PRICE AppliedPriceEMA=PRICE_CLOSE;
input string SEPARADOR7="------------ALERTA------------";
input bool Show_Alert=true; //ACTIVAR ALERTA
bool VelasOpuestasEnVolumen=true;
bool VelasOpuestasEnVolumen_Alert=true;

//Change it to true if you broker uses extra digit in quotes
bool UseExtraDigit=false;


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
input double M1=0.5; //M1 Velas mayores a (pips)
input double M5=1;   //M5 Velas mayores a (pips)
input double M15=4;  //M15 Velas mayores a (pips)
input double M30=4;  //M30 Velas mayores a (pips)
input double H1=4;   //H1 Velas mayores a (pips)
input double H4=10;  //H4 Velas mayores a (pips)
input double D1=15;  //D1 Velas mayores a (pips)
input double W1=50;  //W1 Velas mayores a (pips)
input double MN1=50;  //MM1 Velas mayores a (pips)

int Text_VelasOpuestas=8;

//input bool VelasRSI=true;
//input bool VelasRSI_Alert=false;
int Text_VelasRSI=8;

//---- buffers
double ArrowSignal[];

double EMAbuffer[];
double EMAbuffer2[];
double RSIbuffer[];
double EnvelopesbufferUp[];
double EnvelopesbufferDown[];

string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
double VALORVELASOPUESTAS=0;

double Candle_WickBody_Percent=0;

//int DefinitionEstochastic;
//int DefinitionRSI;
int DefinitionEMA;
int DefinitionEMA2;
int DefinitionRSI;
int DefinitionEnvelopes;

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
void OnInit()
  {
   if(ChartScaleGet()<2)
      paso=0;
   else
      paso=1;
//DefinitionRSI=iRSI(NULL,PERIOD_CURRENT,RSI_Period,PRICE_CLOSE);
   DefinitionEMA=iCustom(Symbol(),PERIOD_CURRENT,"Zero-lag-MA",InpPrice,InpPeriod);
   DefinitionEMA2=iMA(Symbol(),PERIOD_CURRENT,PeriodoEMA,ShiftEma,MODE_LINE,AppliedPriceEMA); 
   DefinitionRSI=iRSI(Symbol(),PERIOD_CURRENT,PeriodoRSI,PriceRSI);
   DefinitionEnvelopes=iEnvelopes(Symbol(),PERIOD_CURRENT,PeriodoEnvelopes,ShiftEnvelopes,MA_Envelopes,AppliedPriceEnvelopes,DesviationEnvelopes);


   IndicatorSetString(INDICATOR_SHORTNAME,"Patron Regresivo");
//172, 115
   PlotIndexSetInteger(0,PLOT_ARROW,170);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);

   SetIndexBuffer(0,ArrowSignal,INDICATOR_DATA);
   SetIndexBuffer(1,EMAbuffer2,INDICATOR_DATA);
   SetIndexBuffer(2,EMAbuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,RSIbuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(4,EnvelopesbufferDown,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,EnvelopesbufferUp,INDICATOR_CALCULATIONS);
   ArraySetAsSeries(ArrowSignal,true);
   ArraySetAsSeries(EMAbuffer,true);
   ArraySetAsSeries(RSIbuffer,true);
   ArraySetAsSeries(EnvelopesbufferDown,true);
   ArraySetAsSeries(EnvelopesbufferUp,true);
   ArraySetAsSeries(EMAbuffer2,true);


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
         VALORVELASOPUESTAS=M1;
         break;
      case PERIOD_M5:
         period="M5";

         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VALORVELASOPUESTAS=M5;

         break;
      case PERIOD_M15:
         period="M15";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VALORVELASOPUESTAS=M15;

         break;
      case PERIOD_M30:
         period="M30";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VALORVELASOPUESTAS=M30;
         break;
      case PERIOD_H1:
         period="H1";
         Pointer_Offset=30;
         High_Offset=20;
         Offset_Subida_VelaOpuesta=10;
         Offset_Caida_VelaOpuesta=30;
         IncOffset=40;
         VALORVELASOPUESTAS=H1;
         break;
      case PERIOD_H4:
         period="H4";
         Pointer_Offset=70;
         High_Offset=150;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=120;
         VALORVELASOPUESTAS=H4;
         break;
      case PERIOD_D1:
         period="D1";
         Pointer_Offset=150;
         High_Offset=220;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=180;
         VALORVELASOPUESTAS=D1;
         break;
      case PERIOD_W1:
         period="W1";
         Pointer_Offset=9;
         High_Offset=35;
         Offset_Subida_VelaOpuesta=80;
         Offset_Caida_VelaOpuesta=80;
         IncOffset=35;
         VALORVELASOPUESTAS=W1;
         break;
      case PERIOD_MN1:
         period="MN";
         Pointer_Offset=9;
         High_Offset=45;
         Offset_Subida_VelaOpuesta=140;
         Offset_Caida_VelaOpuesta=140;
         IncOffset=45;
         VALORVELASOPUESTAS=MN1;
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


   if(BarsCalculated(DefinitionEMA)<rates_total)
      return(0);
      if(BarsCalculated(DefinitionEMA2)<rates_total)
      return(0);
   if(BarsCalculated(DefinitionRSI)<rates_total)
      return(0);
   if(BarsCalculated(DefinitionEnvelopes)<rates_total)
      return(0);
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(DefinitionEMA,1,0,to_copy,EMAbuffer)<=0)
      return(0);
   if(CopyBuffer(DefinitionRSI,0,0,to_copy,RSIbuffer)<=0)
      return(0);
   if(CopyBuffer(DefinitionEnvelopes,0,0,to_copy,EnvelopesbufferUp)<=0)
      return(0);
   if(CopyBuffer(DefinitionEnvelopes,1,0,to_copy,EnvelopesbufferDown)<=0)
      return(0);
   if(CopyBuffer(DefinitionEMA2,0,0,to_copy,EMAbuffer2)<=0)
      return(0);

   //Comment(EnvelopesbufferDown[0]," ",EnvelopesbufferDown[1]," ",EnvelopesbufferDown[2]," ",EnvelopesbufferDown[3]);

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

   if(prevtime==0 || rates_total-prev_calculated!=0)
     {
      for(int i=rates_total-1; i>=0; i--)
        {
         ArrowSignal[i]=0;
        }
     }



   if(prevtime==Time[0] && ALERTAACTIVADA==true)
     {
      if(ObjectFind(0,label_name)<0)
        {
         Print("Generating a label");
         ObjectCreate(0,label_name,OBJ_LABEL,0,0,0);
         ObjectSetInteger(0,label_name,OBJPROP_XDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_YDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_COLOR,ColorTexto);
         ObjectSetString(0,label_name,OBJPROP_TEXT,"Formandose Patron Reversiva");
         ObjectSetString(0,label_name,OBJPROP_FONT,"Comic Sans");
         ObjectSetInteger(0,label_name,OBJPROP_FONTSIZE,10);
         ObjectSetInteger(0,label_name,OBJPROP_SELECTABLE,false);
         ChartRedraw(0);
        }
      return(rates_total);
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
      CumOffset= 0;
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

      bool Condicion=false;

      // Check for Velas opuestas en Volumen
      if((O[0]>C[0] && O[1]<C[1] && O[2]<C[2])||(O[0]<C[0] && O[1]>C[1] && O[2]>C[2]))
        {

         if((BB[0]>(BB[1]/2))&& BB[1]>VALORVELASOPUESTAS)
           {

            if(VelasOpuestasEnVolumen == true)
              {
               if(O[0]>C[0] && O[1]<C[1] && O[2]<C[2])//VELAS REGRESIVAS SELL
                 {
                  //Condicion=EvaluaCondiciones(shift,false,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);
                  
                     if(EvaluaCondicionRSI(shift,false,RSIbuffer,EMAbuffer)&& PatronConRSI==true && C[0]<EMAbuffer2[shift])
                       {
                        pattern = "Vela Regresiva Bajista con Condicion RSI";
                        Condicion=true;
                        if(shift!=0){
                        MarkPattern(GetName("Velas_RE_RSI",Time[shift]), Time[shift+paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"RSI", Text_VelasOpuestas, COLORVO);
                        CumOffset = CumOffset+IncOffset;}
                        ArrowSignal[shift] = High[shift] + (Pointer_Offset*_Point);
                       }

                     if(EvaluaCondicionEnvelopes(shift,false,Low,High,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp) && PatronConEnvelopes==true && C[0]<EMAbuffer2[shift])
                       {
                        pattern = "Vela Regresiva Bajista con Condicion Envelopes";
                        Condicion=true;
                        if(shift!=0){
                        MarkPattern(GetName("Velas_RE_Env",Time[shift]), Time[shift+paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"ENV", Text_VelasOpuestas, COLORVO);
                        CumOffset = CumOffset+IncOffset;}
                        ArrowSignal[shift] = High[shift] + (Pointer_Offset*_Point);
                       }

                 }

               else //VELAS REGRESIVAS BUY
                  if(O[0]<C[0] && O[1]>C[1] && O[2]>C[2])
                    {
                     //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);
                     
                        if(EvaluaCondicionRSI(shift,true,RSIbuffer,EMAbuffer)&& PatronConRSI==true && C[0]>EMAbuffer2[shift])
                          {
                           Condicion=true;
                           pattern = "Vela Regresiva Bajista con Condicion RSI";
                           if(shift!=0){
                           MarkPattern(GetName("VelasRE_RSI",Time[shift]), Time[shift+paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "RSI", Text_VelasOpuestas, COLORVO);
                           CumOffset = CumOffset+IncOffset;}
                           ArrowSignal[shift] = Low[shift] - (Pointer_Offset*_Point);
                          }

                        if(EvaluaCondicionEnvelopes(shift,true,Low,High,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp) && PatronConEnvelopes==true && C[0]>EMAbuffer2[shift])
                          {
                           Condicion=true;
                           pattern = "Vela Regresiva Bajista con Condicion Envelopes";
                           if(shift!=0){
                           MarkPattern(GetName("VelasRE_ENV",Time[shift]), Time[shift+paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "ENV", Text_VelasOpuestas, COLORVO);
                           CumOffset = CumOffset+IncOffset;}
                           ArrowSignal[shift] = Low[shift] - (Pointer_Offset*_Point);
                          }
                       
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


      // End of Bullish Patterns

      if((setalert==1) && (shift==0))
        {
         Alert(Symbol()," ",period," ",pattern);
         setalert=0;
         SendNotification("Formandose Patron "+pattern+ " en "+Symbol()+" Temporalidad: "+EnumToString(PERIOD_CURRENT));
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
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluaCondicionRSI(int shift,bool UP,double &RSIbuffer2[],double &EMAbuffer3[])
  {
   bool Condicion=true;

   if(UP==false)
     {
      if(EMAbuffer3[shift]==2 && PatronConEma==true)
        {
         return false;
        }
      if(((RSIbuffer2[shift+1]-RSIbuffer2[shift+2])<ValorRecorridoRSI)  && PatronConRSI==true)
        {
         return false;
        }
     }
   else
     {
      if(EMAbuffer3[shift]==1 && PatronConEma==true)
        {
         return false;
        }
      if(((RSIbuffer2[shift+2]-RSIbuffer2[shift+1])<ValorRecorridoRSI)  && PatronConRSI==true)
        {
         return false;
        }

     }

   return Condicion;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluaCondicionEnvelopes(int shift,bool UP, const double &LOW[],const double &HIGHT [],double &EMAbuffer3[], double &EnvelopesbufferDown2[], double &EnvelopesbufferUp2[])
  {
   bool Condicion=true;

   if(UP==false)
     {
      if(EMAbuffer3[shift]==2 && PatronConEma==true)
        {
         return false;
        }
      if(PatronConEnvelopes==true)
        {
         bool CondicionEnvelopes=false;
         for(int i=1; i<VelasAEvaluarEnvelopesAnteriores+1 && CondicionEnvelopes==false; i++)
           {
            CondicionEnvelopes=EnvelopesbufferUp[shift+i]>HIGHT[shift+i] && CondicionEnvelopes!=true?false:true;
           }
         Condicion=CondicionEnvelopes;
        }

     }
   else
     {
      if(EMAbuffer3[shift]==1 && PatronConEma==true)
        {
         return false;
        }

      if(PatronConEnvelopes==true)
        {
         bool CondicionEnvelopes=false;
         for(int i=1; i<VelasAEvaluarEnvelopesAnteriores+1 && CondicionEnvelopes==false; i++)
           {
            CondicionEnvelopes=EnvelopesbufferDown[shift+i]<LOW[shift+i] && CondicionEnvelopes!=true?false:true;
           }
         Condicion=CondicionEnvelopes;
        }

     }

   return Condicion;
  }
//+------------------------------------------------------------------+
