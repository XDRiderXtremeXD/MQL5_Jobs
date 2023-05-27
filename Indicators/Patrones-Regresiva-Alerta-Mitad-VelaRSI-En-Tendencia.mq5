
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

#property indicator_color1  clrViolet
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_color2  clrViolet
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

#property indicator_type3   DRAW_NONE
#property indicator_type4   DRAW_NONE
#property indicator_type5   DRAW_NONE



string label_name="RSI_ESTRATEGIA";

bool PatronConEma=true;//ACTIVAR CONDICION EMA
bool PatronConRSI=true;//ACTIVAR CONDICION RSI

input string SEPARADOR = "-----ZERO-LAG--------";
input int InpPeriod=14; //Periodo ZERO_LAG
input   ENUM_APPLIED_PRICE   InpPrice=PRICE_MEDIAN; //Price ZERO_LAG
input string SEPARADOR2 = "-----RSI--------";
input int PeriodoRSI=2; //Periodo del RSI
input ENUM_APPLIED_PRICE  PriceRSI=PRICE_CLOSE; //Periodo del RSI
input int  NivelRSI_Bajista=50;
input int  NivelRSI_Alcista=50;
input string SEPARADOR3 = "-----EMA--------";
input int EMA_PERIOD=14;
input int ShiftEMA=0;
input ENUM_APPLIED_PRICE Price_Ema=PRICE_CLOSE;
input ENUM_MA_METHOD Mode_Line_EMA= MODE_SMA;
input string SEPARADOR4 = "-----ALERTA--------";
input bool Show_Alert=true; //ACTIVAR ALERTA
input bool VelasOpuestasEnVolumen=true;
input bool VelasOpuestasEnVolumen_Alert=true;

//Change it to true if you broker uses extra digit in quotes
input bool UseExtraDigit=false;


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Text_VelasOpuestas=8;

//input bool VelasRSI=true;
//input bool VelasRSI_Alert=false;
int Text_VelasRSI=8;

//---- buffers
double ArrowSignalUP[];
double ArrowSignalDOWN[];

double ZERO_LAG_buffer[];
double ZERO_LAG_buffer_Valor[];
double RSIbuffer[];
double EMAbuffer[];

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
int DefinitionZERO_LAG;
int DefinitionRSI;
int DefinitionEMA;

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
   DefinitionZERO_LAG=iCustom(Symbol(),PERIOD_CURRENT,"Zero-lag-MA",InpPrice,InpPeriod);
   DefinitionRSI=iRSI(Symbol(),PERIOD_CURRENT,PeriodoRSI,PriceRSI);
   DefinitionEMA=iMA(Symbol(),PERIOD_CURRENT,EMA_PERIOD,ShiftEMA, Mode_Line_EMA,Price_Ema);



   IndicatorSetString(INDICATOR_SHORTNAME,"RSI TENDENCIAL");
//172, 115
   PlotIndexSetInteger(0,PLOT_ARROW,225);
   PlotIndexSetInteger(1,PLOT_ARROW,226);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,0);

   SetIndexBuffer(0,ArrowSignalUP,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalDOWN,INDICATOR_DATA);
   SetIndexBuffer(2,ZERO_LAG_buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,RSIbuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(4,EMAbuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,ZERO_LAG_buffer_Valor,INDICATOR_CALCULATIONS);



   ArraySetAsSeries(ArrowSignalUP,true);
   ArraySetAsSeries(ArrowSignalDOWN,true);
   ArraySetAsSeries(ZERO_LAG_buffer,true);
   ArraySetAsSeries(RSIbuffer,true);
   ArraySetAsSeries(EMAbuffer,true);
   ArraySetAsSeries(ZERO_LAG_buffer_Valor,true);
   
   ArrayInitialize(ArrowSignalDOWN,0);
    ArrayInitialize(ArrowSignalUP,0);
    ArrayInitialize(EMAbuffer,0);
    ArrayInitialize(ZERO_LAG_buffer,0);
    ArrayInitialize(ZERO_LAG_buffer_Valor,0);



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
    

   if(BarsCalculated(DefinitionZERO_LAG)<rates_total)
      return(0);
   if(BarsCalculated(DefinitionRSI)<rates_total)
      return(0);
   if(BarsCalculated(DefinitionEMA)<rates_total)
      return(0);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(DefinitionZERO_LAG,1,0,to_copy,ZERO_LAG_buffer)<=0)
      return(0);
   if(CopyBuffer(DefinitionZERO_LAG,0,0,to_copy,ZERO_LAG_buffer_Valor)<=0)
      return(0);   
   if(CopyBuffer(DefinitionRSI,0,0,to_copy,RSIbuffer)<=0)
      return(0);
   if(CopyBuffer(DefinitionEMA,0,0,to_copy,EMAbuffer)<=0)
      return(0);
//Comment(EnvelopesbufferDown[0]," ",EnvelopesbufferDown[1]," ",EnvelopesbufferDown[2]," ",EnvelopesbufferDown[3]);
    Comment(ZERO_LAG_buffer[0]);
   static double Range,AvgRange;
   static datetime prevtime=0;
   static int counter,setalert;
   static int shift;
   string pattern;
   int setPattern=0;
   int alert=0;
   static double O[10],C[10],L[10],H[10];
   int CumOffset;

   if(prevtime==Time[0] && ALERTAACTIVADA==true)
     {
      if(ObjectFind(0,label_name)<0)
        {
         Print("Generating a label");
         ObjectCreate(0,label_name,OBJ_LABEL,0,0,0);
         ObjectSetInteger(0,label_name,OBJPROP_XDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_YDISTANCE,60);
         ObjectSetInteger(0,label_name,OBJPROP_COLOR,clrAqua);
         ObjectSetString(0,label_name,OBJPROP_TEXT,"RSI TENDENCIAL");
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
      MAXIMO=rates_total-1;
     }
     
   else
      if(vez==0)
        {
         MAXIMO = 1;
        }

   for(shift=0; shift<MAXIMO; shift++)
     {
      if(shift==0){
      ArrowSignalUP[shift]=0;
      ArrowSignalDOWN[shift]=0;
      }
     
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
        
        }

      //Comment(ZERO_LAG_buffer[0]," ",ZERO_LAG_buffer[1]," ",ZERO_LAG_buffer[2]," ",ZERO_LAG_buffer[3]," ",ZERO_LAG_buffer[4]," ",ZERO_LAG_buffer[5]," ",ZERO_LAG_buffer[6]);
      //Comment(RSIbuffer[0]-RSIbuffer[1]);

      bool Condicion=false;

      // Check for Velas opuestas en Volumen
      
      ArrowSignalUP[shift]=0;
      ArrowSignalDOWN[shift]=0;

      if(VelasOpuestasEnVolumen == true)
        {
         if(O[0]>C[0])//VELAS REGRESIVAS SELL
           {
            //Condicion=EvaluaCondiciones(shift,false,Low,High,RSIbuffer,ZERO_LAG_buffer,EnvelopesbufferDown,EnvelopesbufferUp);

            if(EvaluaCondicionRSI(shift,false,RSIbuffer,ZERO_LAG_buffer,EMAbuffer,High,Low,Open,Close,ZERO_LAG_buffer_Valor)&& PatronConRSI==true)
              {
              
                  pattern = "Vela Regresiva Bajista con Condicion RSI";
                  Condicion=true;
                  if(shift!=0)
                    {
                     MarkPattern(GetName("VelasRE_RSI",Time[shift]), Time[shift+paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point," ", Text_VelasOpuestas, COLORVO);
                     CumOffset = CumOffset+IncOffset;
                    }
                  ArrowSignalUP[shift] = Low[shift] - (Pointer_Offset*_Point);
               }
               
            }

         else //VELAS REGRESIVAS BUY
            if(O[0]<C[0])
              {
               if(EvaluaCondicionRSI(shift,true,RSIbuffer,ZERO_LAG_buffer,EMAbuffer,High,Low,Open,Close,ZERO_LAG_buffer_Valor)&& PatronConRSI==true)
                 {
                 Condicion=true;
               pattern = "Vela Regresiva Bajista con Condicion RSI";
               if(shift!=0)
                 {
                  MarkPattern(GetName("Velas_RE_RSI",Time[shift]), Time[shift+paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point," ", Text_VelasOpuestas, COLORVO);
                  CumOffset = CumOffset+IncOffset;
                 }
               ArrowSignalDOWN[shift] = High[shift] + (Pointer_Offset*_Point);
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
bool EvaluaCondicionRSI(int shift,bool UP,double &RSIbuffer2[],double &ZERO_LAG_buffer2[],
 double &EMAbuffer2[],double const &Hight[], double const &Low[],double const &Open[],double const &Close[], double &ZERO_LAG_buffer_Valor2[])
  {
   double Body1;
   double Body2;
   bool Condicion=false;

   if(UP==false)
     {
      Body1=Hight[shift+1]-Open[shift+1];
      Body2=Hight[shift+2]-Open[shift+2];
      double Nivel1=Open[shift+1]+(Body1*60/100);
      double Nivel2=Open[shift+2]+(Body2*60/100);
      
      if(ZERO_LAG_buffer2[shift]==1 && PatronConEma==true)
        {
         return false;
        }
      if(RSIbuffer2[shift+1]>NivelRSI_Bajista && RSIbuffer2[shift]<NivelRSI_Bajista  && PatronConRSI==true &&
        ((Nivel1>EMAbuffer2[shift+1])  || (Nivel2>EMAbuffer2[shift+2])) && ZERO_LAG_buffer_Valor2[shift]<EMAbuffer2[shift] )
      
        {
         return true;
        }
     }
   else
     {
      Body1=Open[shift+1]-Low[shift+1];
      Body2=Open[shift+2]-Low[shift+2];
      double Nivel1=Low[shift+1]+(Body1*40/100);
      double Nivel2=Low[shift+2]+(Body2*40/100);
      if(ZERO_LAG_buffer2[shift]==2 && PatronConEma==true)
        {
         return false;
        }
      if(RSIbuffer2[shift+1]<NivelRSI_Alcista && RSIbuffer2[shift]>NivelRSI_Alcista&& PatronConRSI==true &&
      ((Nivel1<EMAbuffer2[shift+1])|| (Nivel2<EMAbuffer2[shift+2])) && ZERO_LAG_buffer_Valor2[shift]>EMAbuffer2[shift] )
      
        {
         return true;
        }

     }

   return Condicion;
  }
//+------------------------------------------------------------------+
