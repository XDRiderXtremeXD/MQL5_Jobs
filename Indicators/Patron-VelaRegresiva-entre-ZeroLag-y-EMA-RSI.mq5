
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
#property indicator_plots   4

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

#property indicator_color3  clrAqua
#property indicator_type3   DRAW_LINE
#property indicator_style3  STYLE_SOLID
#property indicator_width3  2

#property indicator_label4  "ZERO-LAG" 
#property indicator_type4   DRAW_COLOR_LINE 
//--- estableceremos 5 colores para colorear cada barra (se almacenan en un array especial) 
#property indicator_color4  clrDarkGray,clrDeepPink,clrLimeGreen
#property indicator_style4  STYLE_SOLID 
#property indicator_width4  2 



string label_name="Label_Indicador_Patron_Regresivo_ENTRE_EMAS";

input color ColorTexto=Aqua;
bool PatronConEma=true;//ACTIVAR CONDICION EMA
input string SEPARADOR1="-------ZERO-LAG--------";
input int InpPeriod=10; //Periodo ZERO_LAG
input   ENUM_APPLIED_PRICE   InpPrice=PRICE_MEDIAN; //Price ZERO_LAG
input string SEPARADOR2="------------EMA------------";
input int PeriodoEMA=14;
input int ShiftEma=0;
input ENUM_MA_METHOD MODE_LINE=MODE_SMA;
input ENUM_APPLIED_PRICE AppliedPriceEMA=PRICE_CLOSE;
input string SEPARADOR3="------------RSI------------";
input int PeriodoRSI=2;
input ENUM_APPLIED_PRICE AppliedPriceRSI=PRICE_CLOSE;
input int NivelRSIConditionBuy=25;//NivelRSIConditionBuy(FLECHA UP)
input int NivelRSIConditionSell=75;//NivelRSIConditionBuy(FLECHA DOWN)
input string SEPARADOR4="------------ALERTA------------";
input bool Show_Alert=true; //ACTIVAR ALERTA
bool VelasOpuestasEnVolumen=true;
bool VelasOpuestasEnVolumen_Alert=true;

//Change it to true if you broker uses extra digit in quotes
bool UseExtraDigit=false;


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

int Text_VelasOpuestas=8;

//input bool VelasRSI=true;
//input bool VelasRSI_Alert=false;
int Text_VelasRSI=8;

//---- buffers
double ArrowSignalBuy[];
double ArrowSignalSell[];

double ZERO_LAG_VALOR[];
double ZERO_LAG_COLOR[];
double EMA_BUFFER[];
double RSI_BUFFER[];

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
int ZERO_LAG;
int EMA;
int RSI;

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
   ZERO_LAG=iCustom(Symbol(),PERIOD_CURRENT,"Zero-lag-MA",InpPrice,InpPeriod);
   EMA=iMA(Symbol(),PERIOD_CURRENT,PeriodoEMA,ShiftEma,MODE_LINE,AppliedPriceEMA); 
   RSI=iRSI(Symbol(),PERIOD_CURRENT,PeriodoRSI,AppliedPriceRSI);
   


   IndicatorSetString(INDICATOR_SHORTNAME,"Patron Regresivo");
//172, 115
   PlotIndexSetInteger(0,PLOT_ARROW,233);
   PlotIndexSetInteger(1,PLOT_ARROW,234);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);
    PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,0);

   SetIndexBuffer(0,ArrowSignalBuy,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalSell,INDICATOR_DATA);
   SetIndexBuffer(2,EMA_BUFFER,INDICATOR_DATA);
   SetIndexBuffer(3,ZERO_LAG_VALOR,INDICATOR_DATA);
   SetIndexBuffer(4,ZERO_LAG_COLOR,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(5,RSI_BUFFER,INDICATOR_CALCULATIONS);
   
   
   ArraySetAsSeries(ArrowSignalBuy,true);
   ArraySetAsSeries(ArrowSignalSell,true);
   ArraySetAsSeries(EMA_BUFFER,true);
   ArraySetAsSeries(ZERO_LAG_VALOR,true);
   ArraySetAsSeries(ZERO_LAG_COLOR,true);
   ArraySetAsSeries(RSI_BUFFER,true);


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


   if(BarsCalculated(EMA)<rates_total)
      return(0);
   if(BarsCalculated(ZERO_LAG)<rates_total)
      return(0);
   if(BarsCalculated(RSI)<rates_total)
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
   if(CopyBuffer(ZERO_LAG,1,0,to_copy,ZERO_LAG_COLOR)<=0)
      return(0);
   if(CopyBuffer(ZERO_LAG,0,0,to_copy,ZERO_LAG_VALOR)<=0)
      return(0);
   if(CopyBuffer(RSI,0,0,to_copy,RSI_BUFFER)<=0)
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
         ArrowSignalSell[i]=0;
          ArrowSignalBuy[i]=0;
        }
     }



   if(prevtime==Time[0] && ALERTAACTIVADA==true)
     {
      if(ObjectFind(0,label_name)<0)
        {
         Print("Generating a label");
         ObjectCreate(0,label_name,OBJ_LABEL,0,0,0);
         ObjectSetInteger(0,label_name,OBJPROP_XDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_YDISTANCE,60);
         ObjectSetInteger(0,label_name,OBJPROP_COLOR,ColorTexto);
         ObjectSetString(0,label_name,OBJPROP_TEXT,"Formandose Patron Reversiva entre ZERO-LAG Y EMA-RSI");
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

            if(VelasOpuestasEnVolumen == true)
              {
               if(O[0]>C[0] && O[1]<C[1])//VELAS REGRESIVAS SELL
                 {
                  //Condicion=EvaluaCondiciones(shift,false,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);
                  if(ZERO_LAG_VALOR[shift]<EMA_BUFFER[shift] && ZERO_LAG_COLOR[shift]==2 && RSI_BUFFER[shift]<NivelRSIConditionBuy && (RSI_BUFFER[shift+1]>NivelRSIConditionBuy || RSI_BUFFER[shift+2]>NivelRSIConditionBuy)){
                        Condicion=true;
                        pattern = "Vela Regresiva entre EMAS";
                        if(shift!=0){
                        //MarkPattern(GetName("VelasRE_RSI",Time[shift]), Time[shift+paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "RSI", Text_VelasOpuestas, COLORVO);
                        CumOffset = CumOffset+IncOffset;}
                        ArrowSignalBuy[shift] = Low[shift] - (Pointer_Offset*_Point);
                  }

                 }

               else //VELAS REGRESIVAS BUY
                  if(O[0]<C[0] && O[1]>C[1] )
                    {
                     //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);
                     
                     if(ZERO_LAG_VALOR[shift]>EMA_BUFFER[shift] && ZERO_LAG_COLOR[shift]==1 && RSI_BUFFER[shift]>NivelRSIConditionSell && (RSI_BUFFER[shift+1]<NivelRSIConditionSell || RSI_BUFFER[shift+2]<NivelRSIConditionSell)){
                        pattern = "Vela Regresiva entre EMAS";
                        Condicion=true;
                        if(shift!=0){
                        //MarkPattern(GetName("Velas_RE_RSI",Time[shift]), Time[shift+paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"RSI", Text_VelasOpuestas, COLORVO);
                        CumOffset = CumOffset+IncOffset;}
                        ArrowSignalSell[shift] = High[shift] + (Pointer_Offset*_Point);
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
