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

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"
#property description "Indicador que avisa mediante una alerta la formacion de un patron regresivo"
#property description "con vela recien formandose- en otras palabras te avisa cuando se esta formando"
#property description "el patron regresivo y no cuando ha terminado de formarse la vela"

#property indicator_chart_window
#property indicator_buffers 3
#property indicator_plots   3

#property indicator_label1  "SELL"
#property indicator_color1  clrOrange
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2  "BUY"
#property indicator_color2  clrOrange
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

#property indicator_label3  "MA"
#property indicator_color3  clrAqua
#property indicator_type3   DRAW_LINE
#property indicator_style3  STYLE_SOLID
#property indicator_width3  1

input double DistanciaRSI=10;
input color ColorTexto=Aqua;
input bool Show_Alert=true; //ACTIVAR ALERTA

bool VelasOpuestasEnVolumen=true;
bool VelasOpuestasEnVolumen_Alert=true;

//Change it to true if you broker uses extra digit in quotes
input bool UseExtraDigit=false;

input int RSI_UPPER=80;
input int RSI_LOWER=80;
input string SeparadorWT="----SEPARADOR WHITE TIGER----";
input ENUM_TIMEFRAMES TimeFrame=PERIOD_CURRENT;
input int Periodos=6;
input int Diferencial=2;
input int Factor=3;
input double NivelSobreCompra=80;
input double NivelSobreVenta=20;
input int GrosorLineaDYPA=2;
input color ColoresNiveles=clrBlue;

input string SeparadorRSI="----SEPARADOR RSI----";
input int PeriodoRSI=2;
input ENUM_APPLIED_PRICE AplliedPriceRSI=PRICE_CLOSE;

input string Separador_MA="----SEPARADOR_MA----";
input int Periodo_MA=5;
input int Shift_MA=0;
input ENUM_MA_METHOD Mode_MA=MODE_SMA;
input ENUM_APPLIED_PRICE AppliedPrice_MA=PRICE_CLOSE;

int Text_VelasOpuestas=10;

//input bool VelasRSI=true;
//input bool VelasRSI_Alert=false;

//---- buffers
double ArrowSignalUP[];
double ArrowSignalDN[];
double ValorWT[];
double ColorWT[];
double RSI[];
double MA[];

string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
int VALORVELASOPUESTAS=0;

double Candle_WickBody_Percent=0;

int DefinitionWT;
int  DefinitionRSI;
int DefinitionMA;

color COLORVO=Aqua;

int paso=0;
bool CUENTA=false;
bool ALERTAACTIVADA=false;
datetime TiempoPrevio=0;
int MAXIMO=0;
int vez=1;

int PeriodoMaximo=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   PeriodoMaximo=PeriodoRSI>Periodos?PeriodoRSI:Periodos;
   PeriodoMaximo=PeriodoMaximo>11?PeriodoMaximo:11;

   DefinitionWT=iCustom(Symbol(),PERIOD_CURRENT,"WT_DYPA_v2.1",0," ",TimeFrame,Periodos,Diferencial,Factor,NivelSobreCompra,NivelSobreVenta,
                        GrosorLineaDYPA,ColoresNiveles);
//DefinitionWT=iCustom(Symbol(),PERIOD_CURRENT,"WT_SuperT-MA_v4.7",0,1,"-",0,0,0,20," ",false,110,2.6," ",1000);
   if(DefinitionWT==INVALID_HANDLE)
      return(INIT_FAILED);

   DefinitionRSI=iRSI(Symbol(),PERIOD_CURRENT,PeriodoRSI,AplliedPriceRSI);
   if(DefinitionRSI==INVALID_HANDLE)
      return(INIT_FAILED);
      
   DefinitionMA=iMA(Symbol(),PERIOD_CURRENT,Periodo_MA,Shift_MA,Mode_MA,AppliedPrice_MA);
   if(DefinitionMA==INVALID_HANDLE)
      return(INIT_FAILED);

   IndicatorSetString(INDICATOR_SHORTNAME,"PatronesWhiteTigerRSICruce");
//172, 115
   SetIndexBuffer(0,ArrowSignalUP);
   SetIndexBuffer(1,ArrowSignalDN);
   SetIndexBuffer(2,MA);

   PlotIndexSetInteger(0,PLOT_ARROW,170);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
  
   PlotIndexSetInteger(1,PLOT_ARROW,170);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   ArraySetAsSeries(ArrowSignalDN,false);
   ArraySetAsSeries(ArrowSignalUP,false);

   ArraySetAsSeries(ValorWT,true);
   ArraySetAsSeries(ColorWT,true);
   ArraySetAsSeries(RSI,true);
   ArraySetAsSeries(MA,true);

   ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
   ArrayInitialize(MA,EMPTY_VALUE);

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

   static double Range,AvgRange;
   static datetime prevtime=0;
   static int counter,setalert;
   static int shift;
   string pattern;
   int setPattern=0;
   int alert=0;
   
   if(BarsCalculated(DefinitionMA)<rates_total)
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
   if(CopyBuffer(DefinitionMA,0,0,to_copy,MA)<=0)
      return(0);
   
   
   
   static double O[10],C[10],L[10],H[10];
   static double CL[10],BL[10],BLa[10],BL90[10],UW[10],LW[10],BodyHigh[10],BodyLow[10],BB[10];
   for(int i=0; i<10; i++)
     {
      BodyHigh[i]=0;
      BodyLow[i]=0;
     }
   int CumOffset;
   int CumOffset2=0;
   
   static bool Primera_Vez=true;
   if((prevtime==Time[rates_total-1] && prev_calculated!=0 )|| rates_total<201 || (prev_calculated>=0 && prev_calculated<201))
     {
      return(rates_total);
     }
   prevtime=Time[rates_total-1];

   int START;
   if(Primera_Vez){
   START=200;
   Primera_Vez=false;
      }
   else
      START=rates_total-1;

     ArrayResize(ArrowSignalDN,rates_total);
     ArrayResize(ArrowSignalUP,rates_total);
     ArrayResize(ValorWT,101);
     ArrayResize(ColorWT,101);
     ArrayResize(RSI,101);

   for(shift=START; shift<rates_total; shift++)
     {
      CumOffset= 0;
      setalert = 0;
      counter=shift;
      Range=0;
      AvgRange=0;
      ArrowSignalUP[shift]=EMPTY_VALUE;
      ArrowSignalDN[shift]=EMPTY_VALUE;

      // for(counter = shift; counter <= shift + 9; counter++)
      //  AvgRange = AvgRange + MathAbs(High[counter] - Low[counter]);
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
    
      CopyBuffer(DefinitionWT,0,rates_total-1-shift,100,ValorWT);
      CopyBuffer(DefinitionWT,1,rates_total-1-shift,100,ColorWT);
      CopyBuffer(DefinitionRSI,0,rates_total-1-shift,100,RSI);


      bool Condicion=false;

      if(VelasOpuestasEnVolumen == true)
        {
         bool Entro=false;
         bool DrawArrow=true;
         if(ColorWT[1]==1 && RSI[1]<RSI[2] && H[1]<MA[rates_total-1-shift+1] && C[1]<O[1] && C[2]<O[2] && RSI[1]<RSI_LOWER )
           { 
             double Color=1;
             int j=2;
             while((ColorWT[j]==1 || RSI[j]>RSI[j+1] || RSI[j]>RSI[j-1]) && j<99) {
             if(ColorWT[j]==0)
           Entro=true;
           if(Entro==true && ColorWT[j]==1){
           DrawArrow=false;
           break;
           }
             j++;
             }
            if(MathAbs(RSI[j]-RSI[1])<=DistanciaRSI && DrawArrow==true && j<99){
            Condicion=true;
            MarkPattern(GetName("VelasOPV",Time[shift-1]), Time[shift-1], Low[shift-1] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffset)*_Point, "VO", Text_VelasOpuestas, COLORVO);
            CumOffset = CumOffset+IncOffset;
            ArrowSignalDN[shift-1] = Low[shift-1] - (Pointer_Offset*_Point);}
            
           }
          if(ColorWT[1]==0 && RSI[1]>RSI[2] && L[1]>MA[rates_total-1-shift+1] && C[1]>O[1] && C[2]>O[2] && RSI[1]>RSI_UPPER )
           { int j=2;
           while((ColorWT[j]==0 || RSI[j]<RSI[j+1] || RSI[j]<RSI[j-1]) && j<99 ){
           if(ColorWT[j]==1)
           Entro=true;
           if(Entro==true && ColorWT[j]==0){
           DrawArrow=false;
           break;
           }
           j++;
            }
             if(MathAbs(RSI[j]-RSI[1])<=DistanciaRSI && DrawArrow==true && j<99){
            Condicion=true;
            MarkPattern(GetName("VelasOPV",Time[shift-1]), Time[shift-1], High[shift-1] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffset)*_Point,"VO", Text_VelasOpuestas, COLORVO);
            CumOffset = CumOffset+IncOffset;
            ArrowSignalUP[shift-1] = High[shift-1] + (Pointer_Offset*_Point);
            }
               
            }
        }
      if(VelasOpuestasEnVolumen_Alert == true)
        {

         if(shift==rates_total-1 && Condicion==true)
           {

            if(Show_Alert == true)
              {
               setalert = 1;
              }
           }
        }



      if((setalert==1) && (shift==rates_total-1))
        {
         Alert(Symbol()," ",period," Cruce RSI WT");
         setalert=0;
         SendNotification("Se formo Patron Cruce RSI WT en en "+Symbol()+" Temporalidad: "+EnumToString(PERIOD_CURRENT));
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