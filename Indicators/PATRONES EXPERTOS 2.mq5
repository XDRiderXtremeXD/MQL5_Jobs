//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2020, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

////////////////////////ACA MODIFICAS EL TIEMPO LIMITADO PARA OTRA CUENTA QUE NO SEA TUYA/////////////////
/////////////////// AÑO.MES.DIA HORA:MINUTO///////////////////
datetime UNTIL=D'2025.10.30 00:00';
double CuentasCompartidas[1]= {2303919};
string NombrePersonaCompartida[1]= {" "};

////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

///LUEGO LO COMPILAS, UNA VEZ COMPILADO LE MANDAS SOLO EL ARCHIVO .ex5 No mandes el archivo .mq5

////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

/////////////////////////TU CUENTA///////////////////////////////
////////////////////////////////////////////////////////////////////////
double Cuentas[2]= {2303919,1974851};
string CuentasBroker= "Deriv Limited";
////////////////////////////////////////////////////////////////////////

double ValoresFibo[2]= {0.382,0.618};
int NumeroTrends=0;

enum ENUM_BOOL
  {
   NO=0,
   SI=2,
  };

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"
#property description "Indicador que avisa mediante una alerta la formacion de un patron regresivo"
#property description "con vela recien formandose- en otras palabras te avisa cuando se esta formando"
#property description "el patron regresivo y no cuando ha terminado de formarse la vela"

#property indicator_chart_window
#property indicator_buffers 7
#property indicator_plots   5

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

#property indicator_label3   "EMA-6"
#property indicator_color3  clrAqua
#property indicator_type3   DRAW_LINE
#property indicator_style3  STYLE_SOLID
#property indicator_width3  1

#property indicator_label4  "Patrones-EspecialBEAR"
#property indicator_color4  clrMagenta
#property indicator_type4   DRAW_ARROW
#property indicator_style4  STYLE_SOLID
#property indicator_width4  1

#property indicator_label5  "Patrones-EspecialesBULLISH"
#property indicator_color5  clrMagenta
#property indicator_type5   DRAW_ARROW
#property indicator_style5  STYLE_SOLID
#property indicator_width5  1

string pattern;

string label_name="Label_Indicador_Patron_Regresivo_ENTRE_EMAS";
string numero_redondos1="NumeroRedondos1";
string numero_redondos2="NumeroRedondos2";
string numero_redondos3="NumeroRedondos3";
string numero_redondos4="NumeroRedondos4";
string numero_redondos5="NumeroRedondos5";

input color ColorTextoAlarma=Aqua;
//bool PatronConEma=true;//ACTIVAR CONDICION EMA
input ENUM_BOOL EsIndice=SI;
input string SEPARADOR="------EMA---------";
input int PeriodoEma=6;
input int ShitfEma=0;
input ENUM_MA_METHOD Mode_Ema=MODE_EMA;
input ENUM_APPLIED_PRICE Price_Mode=PRICE_CLOSE;
input string SEPARADOR1="------------ALERTA------------";
input bool Show_Alert=true; //ACTIVAR ALERTA PC
input bool Show_Alert_Movil=false; //ACTIVAR ALERTA MOVIL
input string SEPARADOR2="------------HABILITAR PATRONES------------";
input bool VelasPatronZ=true;
input bool VelasPatron3Mecha=true;
input bool VelasPatron3Z=true;
input bool VelasPatron5x1=true;
input bool VelasPatron6x1=true;
input bool VelasPatron7x1=true;
input bool VelasPatron_Demand_and_Supply=true;
input bool VelasPatron_Sandwich= true;
input bool VerGap=true;
input bool VerFIBO=true;
input bool VerRedondo=true;
input bool SoportesYResistencias=true;
input string SEPARADOR3="------------COLORES PATRONES------------";
input color ColorZ=clrYellow;
input color Color3M=clrYellow;
input color Color3Z=clrYellow;
input color Color5x1=clrYellow;
input color Color6x1=clrYellow;
input color Color7x1=clrYellow;
input color ColorSandwich=clrYellow;
input color ColorGapUp=clrWhite;
input color ColorGapDn=clrPink;
input color ColorRedondo=clrAqua;
input color ColorRes=clrGreen;
input color ColorSop=clrRed;
input string SEPARADOR4="----------TAMAÑO TEXTO PATRONES----------";
input int Size_Z=8;
input int Size_3M=8;
input int Size_3Z=8;
input int Size_5x1=8;
input int Size_6x1=8;
input int Size_7x1=8;
input int Size_Sandwich=8;
input string SEPARADOR5="----------Parametros Especiales----------";
double MultiplicadorZonaVela=2;
input int Tolerancia3M=10;//Tolerancia Mechas 3M en Puntos
input string SEPARADOR6="----------Parametros SD (EN PUNTOS)----------";
input string PrimeraCondicion="***1era Condicion***";
input double VelaSizeImpulso=0; // Tamaño Vela Impulso (Cuerpo) (mayor o igual a)
input double TamanoMechaImpulsos=0; // Tamaño Mecha Impulso (menor o igual a)
input double TamanoVelaBase=0; // Tamaño Vela Base(Cuerpo+Mechas) (menor o igual a)
input string SegundaCondicion="***2da Condicion***";
input double VelaTamanoImpulso2daCondicion=0; //Si Vela (Cuerpo) De impulso es menor a
input double VelaTamanoContinuidad2daCondicion=0; //Entonces Vela (Cuerpo) Continuidad mayor a

input string SEPARADOR7="----------Distancia Texto----------";
input int  Pointer_Offset2=0;//Distancia entre la vela y la flecha
input int  Offset_Subida_VelaOpuesta2=0;//Distancia Entre el Texto y la Flecha(Abajo)
input int  Offset_Caida_VelaOpuesta2=0;//Distancia Entre el Texto y la Flecha(Arriba)
input int  DistanciaEntreTextos=0; //Distancia entre 2 Textos
input int  High_Offset2=0; //Ajustar Mas el texto de Arriba
input string SEPARADOR8="----------Estilizador del Fibo----------";
input color ColorFibo=clrAliceBlue;
input ENUM_LINE_STYLE EstiloFibo=STYLE_DOT;
input string SEPARADOR9="----------Soportes Resistencias----------";
input int VelasEvaluaResSop=100;

int RatesInicio=0;

int SopResPoint=0;

int password_status = -1;

color ColorGAP=clrNONE;
int Ultimo3M=0;
int Ultimo3Z=0;
int Ultimo5x1=0;
int Ultimo6x1=0;
int Ultimo7x1=0;
int UltimoSand=0;
bool VelasOpuestasEnVolumen_Alert=true;

//Change it to true if you broker uses extra digit in quotes
bool UseExtraDigit=false;

double EMA_BUFFER[];
double FRACTAL_UP[];
double FRACTAL_DOWN[];

int EMA;
int FRACTAL;
datetime VEZFAMILIA30=0;

bool FIBONACCI=false;
double FIBOPUNTO1=0;
double FIBOPUNTO2=0;

int NumeroFIBO=0;
datetime prevtimegap=0;



string SymbolosIndices[15]= {"US500","AUS200","CN50","EUSTX50","FRA40"
                             ,"GER30","US30","HK50","VIX","JPN225","NAS100","SPA35","UK100","US2000","SCI25"
                            };


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*
input double M1=0.5; //M1 Velas mayores a (pips)
input double M5=1;   //M5 Velas mayores a (pips)
input double M15=4;  //M15 Velas mayores a (pips)
input double M30=4;  //M30 Velas mayores a (pips)
input double H1=4;   //H1 Velas mayores a (pips)
input double H4=10;  //H4 Velas mayores a (pips)
input double D1=15;  //D1 Velas mayores a (pips)
input double W1=50;  //W1 Velas mayores a (pips)
input double MN1=50;  //MM1 Velas mayores a (pips)*/


//input bool VelasRSI=true;
//input bool VelasRSI_Alert=false;

//---- buffers
double ArrowSignalBuy[];
double ArrowSignalSell[];
double ArrowSignalStar[];
double ArrowSignalStar1[];


string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
double VALORVELASOPUESTAS=0;
double VelaTamanoImpulso=0;

double Candle_WickBody_Percent=0;
datetime TIMEFIBONACCI=0;
double TamanoMechaImpulso=0;
double VelaTamanoBase=0;
double TamanoVelaContinuidad=0;

//int DefinitionEstochastic;
//int DefinitionRSI;

color COLORVO=Aqua;

int paso=0;
bool CUENTA=false;
bool ALERTAACTIVADA=false;
datetime TiempoPrevio=0;
int MAXIMO=0;
int vez=1;
bool UPFRACTAL=false;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
//Indices=SymbolInfoInteger(Symbol(),SYMBOL_SECTOR_NAME)==SECTOR_INDEXES?true:false;
   TIMEFIBONACCI=0;
   string broker = AccountInfoString(ACCOUNT_COMPANY);
   long account = AccountInfoInteger(ACCOUNT_LOGIN);

   printf("The name of the broker = %s", broker);
   printf("Account number =  %d", account);

   if(broker == CuentasBroker)
      for(int i=0; i<ArraySize(Cuentas); i++)
         if(account == Cuentas[i])
           {
            password_status = 1;
            Print("EA account verified");
            break;
           }
///////////////////////Cuenta del desarrollador////////////////////
   if(broker=="Pepperstone Group Limited" && account==196637)//51055646
     {
      password_status=1;
      Comment("LICENCIA HABILITADA - ESPECIAL DESARROLLADOR");
     }
/////////////////////////////////////////////////////////////////

   string NombreCuentaCompartida=" ";
   if(password_status == -1)
     {
      int CuentasCompartidasEjecutar=0;

      for(int k=0; k<ArraySize(CuentasCompartidas); k++)
        {
         if(CuentasCompartidas[k]==account)
           {
            NombreCuentaCompartida=NombrePersonaCompartida[k];
            CuentasCompartidasEjecutar++;
            break;
           }
        }
      if(CuentasCompartidasEjecutar==0)
        {
         MessageBox("CUENTA NO HABLITADA",NULL,0);
         Print("Cuenta no habilitada");
         Comment("Cuenta no habilitada");
         return(INIT_FAILED);
        }
      else
        {
         MessageBox(NombreCuentaCompartida+" - Licencia provista por Biticks hasta "+TimeToString(UNTIL,TIME_MINUTES),NULL,0);
         Comment(NombreCuentaCompartida," - Licencia provista por Biticks hasta ",UNTIL);

        }
     }
   else
     {
      MessageBox("CUENTA VERIFICADA// TIEMPO ILIMITADO",NULL,0);
     }

   PlotIndexSetInteger(0,PLOT_ARROW,225);
   PlotIndexSetInteger(1,PLOT_ARROW,226);
   PlotIndexSetInteger(3,PLOT_ARROW,222);
   PlotIndexSetInteger(4,PLOT_ARROW,221);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(3,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(4,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(5,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(6,PLOT_EMPTY_VALUE,0);

   SetIndexBuffer(0,ArrowSignalBuy,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalSell,INDICATOR_DATA);
   SetIndexBuffer(2,EMA_BUFFER,INDICATOR_DATA);
   SetIndexBuffer(3,ArrowSignalStar,INDICATOR_DATA);
   SetIndexBuffer(4,ArrowSignalStar1,INDICATOR_DATA);
   SetIndexBuffer(5,FRACTAL_UP,INDICATOR_CALCULATIONS);
   SetIndexBuffer(6,FRACTAL_DOWN,INDICATOR_CALCULATIONS);

   ArraySetAsSeries(ArrowSignalBuy,false);
   ArraySetAsSeries(ArrowSignalSell,false);
   ArraySetAsSeries(EMA_BUFFER,false);
   ArraySetAsSeries(ArrowSignalStar,false);
   ArraySetAsSeries(ArrowSignalStar1,false);
   ArraySetAsSeries(FRACTAL_UP,false);
   ArraySetAsSeries(FRACTAL_DOWN,false);

   EMA=iMA(Symbol(),PERIOD_CURRENT,PeriodoEma,ShitfEma,Mode_Ema,PRICE_CLOSE);
   FRACTAL=iFractals(Symbol(),PERIOD_CURRENT);

   for(int k=ObjectsTotal(0,0,OBJ_TREND)-1; k>-1; k--)
     {
      string NameSymbol=ObjectName(0,k,0,OBJ_TREND);
      if(StringFind(NameSymbol,"TRENDPATRONES",0)!=-1)
        {
         ObjectDelete(0,NameSymbol);
        }

      if(StringFind(NameSymbol,"TRENDGAP",0)!=-1)
        {
         ObjectDelete(0,NameSymbol);
        }
     }
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
         Pointer_Offset=4;
         High_Offset=2;
         Offset_Subida_VelaOpuesta=2;
         Offset_Caida_VelaOpuesta=2;
         IncOffset=16;
         VelaTamanoImpulso=30;
         TamanoMechaImpulso=20;
         VelaTamanoBase=10;
         SopResPoint=3;
         //VALORVELASOPUESTAS=M1;
         break;
      case PERIOD_M5:
         period="M5";

         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VelaTamanoImpulso=40;
         TamanoMechaImpulso=20;
         VelaTamanoBase=20;
         SopResPoint=3;
         //VALORVELASOPUESTAS=M5;

         break;
      case PERIOD_M15:
         period="M15";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VelaTamanoImpulso=150;
         TamanoMechaImpulso=20;
         VelaTamanoBase=20;
         SopResPoint=5;
         //VALORVELASOPUESTAS=M15;

         break;
      case PERIOD_M30:
         period="M30";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VelaTamanoImpulso=150;
         TamanoMechaImpulso=20;
         VelaTamanoBase=20;
         SopResPoint=5;
         //VALORVELASOPUESTAS=M30;
         break;
      case PERIOD_H1:
         period="H1";
         Pointer_Offset=30;
         High_Offset=20;
         Offset_Subida_VelaOpuesta=10;
         Offset_Caida_VelaOpuesta=30;
         IncOffset=40;
         VelaTamanoImpulso=300;
         TamanoMechaImpulso=100;
         VelaTamanoBase=20;
         SopResPoint=8;
         //VALORVELASOPUESTAS=H1;
         break;
      case PERIOD_H4:
         period="H4";
         Pointer_Offset=70;
         High_Offset=150;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=120;
         VelaTamanoImpulso=300;
         TamanoMechaImpulso=100;
         VelaTamanoBase=20;
         SopResPoint=10;
         //VALORVELASOPUESTAS=H4;
         break;
      case PERIOD_D1:
         period="D1";
         Pointer_Offset=150;
         High_Offset=220;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=180;
         VelaTamanoImpulso=700;
         TamanoMechaImpulso=200;
         VelaTamanoBase=20;
         SopResPoint=15;
         //VALORVELASOPUESTAS=D1;
         break;
      case PERIOD_W1:
         period="W1";
         Pointer_Offset=9;
         High_Offset=35;
         Offset_Subida_VelaOpuesta=80;
         Offset_Caida_VelaOpuesta=80;
         IncOffset=35;
         VelaTamanoImpulso=700;
         TamanoMechaImpulso=200;
         VelaTamanoBase=20;
         SopResPoint=20;
         //VALORVELASOPUESTAS=W1;
         break;
      case PERIOD_MN1:
         period="MN";
         Pointer_Offset=9;
         High_Offset=45;
         Offset_Subida_VelaOpuesta=140;
         Offset_Caida_VelaOpuesta=140;
         IncOffset=45;
         VelaTamanoImpulso=1500;
         TamanoMechaImpulso=500;
         VelaTamanoBase=20;
         SopResPoint=20;
         //VALORVELASOPUESTAS=MN1;
         break;
     }
   if(EsIndice)SopResPoint=SopResPoint*10;
   Pointer_Offset=Pointer_Offset2>0?Pointer_Offset2:Pointer_Offset;
   Offset_Subida_VelaOpuesta=Offset_Subida_VelaOpuesta2>0?Offset_Subida_VelaOpuesta2:Offset_Subida_VelaOpuesta;
   Offset_Caida_VelaOpuesta=Offset_Caida_VelaOpuesta2>0?Offset_Caida_VelaOpuesta2:Offset_Caida_VelaOpuesta;
   High_Offset=High_Offset2>0?High_Offset2:High_Offset;
   IncOffset=DistanciaEntreTextos>0?DistanciaEntreTextos:IncOffset;
   VelaTamanoImpulso=VelaSizeImpulso>0?VelaSizeImpulso:VelaTamanoImpulso;
   TamanoMechaImpulso=TamanoMechaImpulsos>0?TamanoMechaImpulsos:TamanoMechaImpulso;
   VelaTamanoBase=TamanoVelaBase>0?TamanoVelaBase:VelaTamanoBase;

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
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,0,OBJ_TEXT);
   ObjectsDeleteAll(0,0,OBJ_FIBO);
   ObjectsDeleteAll(0,0,OBJ_RECTANGLE);
   ObjectsDeleteAll(0,0,OBJ_TREND);
   ObjectsDeleteAll(0,0,OBJ_HLINE);

   if(ObjectFind(0,label_name)>=0)
      ObjectDelete(0,label_name);

   if(ObjectFind(0,numero_redondos1)>=0)
      ObjectDelete(0,numero_redondos1);

   if(ObjectFind(0,numero_redondos2)>=0)
      ObjectDelete(0,numero_redondos2);

   if(ObjectFind(0,numero_redondos3)>=0)
      ObjectDelete(0,numero_redondos3);

   if(ObjectFind(0,numero_redondos4)>=0)
      ObjectDelete(0,numero_redondos4);

   if(ObjectFind(0,numero_redondos5)>=0)
      ObjectDelete(0,numero_redondos5);

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


   if(password_status==-1)
     {
      static bool aa=true;
      if(TimeCurrent()>UNTIL && aa)
        {
         if(aa){
         Alert("TIEMPO DE PRUEBA TERMINADO EA DESABILITADO");
         aa=false;}
         return (rates_total);
        }
     }


   ArraySetAsSeries(Time,false);
   ArraySetAsSeries(High,false);
   ArraySetAsSeries(Low,false);
   ArraySetAsSeries(Close,false);
   ArraySetAsSeries(Open,false);

//Comment(EnvelopesbufferDown[0]," ",EnvelopesbufferDown[1]," ",EnvelopesbufferDown[2]," ",EnvelopesbufferDown[3]);

   if(BarsCalculated(EMA)<rates_total)
      return(0);
   if(BarsCalculated(FRACTAL)<rates_total)
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

   if(CopyBuffer(FRACTAL,0,0,rates_total,FRACTAL_UP)<=0)
      return(0);
   if(CopyBuffer(FRACTAL,1,0,rates_total,FRACTAL_DOWN)<=0)
      return(0);


   static double Range,AvgRange;
   static datetime prevtime=0;
   static int counter,setalert;
   int setPattern=0;
   int alert=0;
   static double O[10],C[10],L[10],H[10];
   static double CL[10],BL[10],BLa[10],BL90[10],UW[10],LW[10],BodyHigh[10],BodyLow[10],BB[10];
   for(int i=0; i<10; i++)
     {
      BodyHigh[i]=0;
      BodyLow[i]=0;
     }
   int CumOffsetL;
   int CumOffsetH;

   if(prevtime==Time[rates_total-1] && ALERTAACTIVADA==true)
     {
      if(ObjectFind(0,label_name)<0)
        {
         double PrecioRedondo=Close[rates_total-1];
         Print("Generating a label");
         ObjectCreate(0,label_name,OBJ_LABEL,0,0,0);
         ObjectSetInteger(0,label_name,OBJPROP_XDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_YDISTANCE,60);
         ObjectSetInteger(0,label_name,OBJPROP_COLOR,ColorTextoAlarma);
         ObjectSetString(0,label_name,OBJPROP_TEXT,"Formandose Patron "+pattern);
         ObjectSetString(0,label_name,OBJPROP_FONT,"Comic Sans");
         ObjectSetInteger(0,label_name,OBJPROP_FONTSIZE,10);
         ObjectSetInteger(0,label_name,OBJPROP_SELECTABLE,false);
         ChartRedraw(0);
        }

      if(ObjectFind(0,numero_redondos1)<0 && VerRedondo)
        {
         string NameRes="Res";
         string NameSop="Sop";
         double PrecioRedondo=Close[rates_total-1];
         double PrecioRedondoMas=0;
         double PrecioRedondoMenos=0;
         double PrecioRedondoMas1=0;
         double PrecioRedondoMenos1=0;
         if(EsIndice==NO)
           {
            double CalculoPrecio=(PrecioRedondo*MathPow(10,Digits()));
            int Index=0;
            CalculoPrecio=int(CalculoPrecio-int(CalculoPrecio/10)*10);
            PrecioRedondo=PrecioRedondo-CalculoPrecio*Point();
            PrecioRedondoMenos=PrecioRedondo-Point()*10;
            PrecioRedondoMas=PrecioRedondo+Point()*10;
            PrecioRedondoMas1=PrecioRedondo+Point()*10*2;;
            PrecioRedondoMenos1=PrecioRedondo-Point()*10*2;;
           }
         else
           {
            PrecioRedondo=int (PrecioRedondo);
            PrecioRedondoMas=PrecioRedondo+1;
            PrecioRedondoMenos=PrecioRedondo-1;
            PrecioRedondoMas1=PrecioRedondo+2;
            PrecioRedondoMenos1=PrecioRedondo-2;
           }


         if(ObjectCreate(0,numero_redondos1,OBJ_HLINE,0,Time[rates_total-1],PrecioRedondo))
           {
            ObjectSetInteger(0,numero_redondos1,OBJPROP_COLOR,ColorRedondo);
            ObjectSetInteger(0,numero_redondos1,OBJPROP_STYLE,STYLE_DOT);
            ObjectSetInteger(0,numero_redondos1,OBJPROP_BACK,true);
           }

         if(ObjectCreate(0,numero_redondos2,OBJ_HLINE,0,Time[rates_total-1],PrecioRedondoMenos))
           {
            ObjectSetInteger(0,numero_redondos2,OBJPROP_COLOR,ColorRedondo);
            ObjectSetInteger(0,numero_redondos2,OBJPROP_STYLE,STYLE_DOT);
            ObjectSetInteger(0,numero_redondos2,OBJPROP_BACK,true);
           }

         if(ObjectCreate(0,numero_redondos3,OBJ_HLINE,0,Time[rates_total-1],PrecioRedondoMas))
           {
            ObjectSetInteger(0,numero_redondos3,OBJPROP_COLOR,ColorRedondo);
            ObjectSetInteger(0,numero_redondos3,OBJPROP_STYLE,STYLE_DOT);
            ObjectSetInteger(0,numero_redondos3,OBJPROP_BACK,true);
           }

         if(ObjectCreate(0,numero_redondos4,OBJ_HLINE,0,Time[rates_total-1],PrecioRedondoMas1))
           {
            ObjectSetInteger(0,numero_redondos4,OBJPROP_COLOR,ColorRedondo);
            ObjectSetInteger(0,numero_redondos4,OBJPROP_STYLE,STYLE_DOT);
            ObjectSetInteger(0,numero_redondos4,OBJPROP_BACK,true);
           }

         if(ObjectCreate(0,numero_redondos5,OBJ_HLINE,0,Time[rates_total-1],PrecioRedondoMenos1))
           {
            ObjectSetInteger(0,numero_redondos5,OBJPROP_COLOR,ColorRedondo);
            ObjectSetInteger(0,numero_redondos5,OBJPROP_STYLE,STYLE_DOT);
            ObjectSetInteger(0,numero_redondos5,OBJPROP_BACK,true);
           }

         int SoporteResistencia=0;
         if(SoportesYResistencias)
           {
            for(int i=1; i<VelasEvaluaResSop; i++)
              {
               double EvaluaFirstFractalDOWN=FRACTAL_DOWN[rates_total-1-i];
               if(EvaluaFirstFractalDOWN==0)
                  continue;
               SoporteResistencia=0;
               for(int j=i+1; j<VelasEvaluaResSop; j++)
                 {
                  double EvaluaSecondFractalDOWN=FRACTAL_DOWN[rates_total-1-j];
                  if(EvaluaSecondFractalDOWN==0)
                     continue;
                  if(EvaluaSecondFractalDOWN>EvaluaFirstFractalDOWN-Point()*SopResPoint && EvaluaSecondFractalDOWN<EvaluaFirstFractalDOWN+Point()*SopResPoint)
                    {
                     string NameSop_=NameSop+string(EvaluaFirstFractalDOWN);
                     //SoporteResistencia++;
                     //if(SoporteResistencia>1)
                       //{
                        if(ObjectCreate(0,NameSop_,OBJ_HLINE,0,Time[rates_total-1],EvaluaFirstFractalDOWN))
                          {
                           ObjectSetInteger(0,NameSop_,OBJPROP_COLOR,ColorSop);
                           ObjectSetInteger(0,NameSop_,OBJPROP_STYLE,STYLE_DASH);
                           ObjectSetInteger(0,NameSop_,OBJPROP_BACK,true);
                          }
                       //}
                    }
                 }
              }

            for(int i=1; i<VelasEvaluaResSop;i++)
              {
               double EvaluaFirstFractalUP=FRACTAL_UP[rates_total-1-i];
               if(EvaluaFirstFractalUP==0)
                  continue;
               SoporteResistencia=0;
               for(int j=i+1; j<VelasEvaluaResSop; j++)
                 {
                  double EvaluaSecondFractalUP=FRACTAL_UP[rates_total-1-j];
                  if(EvaluaSecondFractalUP==0)
                     continue;
                  if(EvaluaSecondFractalUP>EvaluaFirstFractalUP-Point()*SopResPoint && EvaluaSecondFractalUP<EvaluaFirstFractalUP+Point()*SopResPoint)
                    {
                     string NameRes_=NameRes+string(EvaluaFirstFractalUP);
                     //SoporteResistencia++;
                     //if(SoporteResistencia>1)
                       //{
                        if(ObjectCreate(0,NameRes_,OBJ_HLINE,0,Time[rates_total-1],EvaluaFirstFractalUP))
                          {
                           ObjectSetInteger(0,NameRes_,OBJPROP_COLOR,ColorRes);
                           ObjectSetInteger(0,NameRes_,OBJPROP_STYLE,STYLE_DASH);
                           ObjectSetInteger(0,NameRes_,OBJPROP_BACK,true);
                          }
                       //}
                    }
                 }
              }
           }
        }

      return(rates_total);
     }

   if(prevtime==0 || rates_total-prev_calculated!=0)
     {
      for(int i=rates_total-1; i>=0; i--)
        {
         ArrowSignalSell[i]=0;
         ArrowSignalBuy[i]=0;
         ArrowSignalStar[i]=0;
         ArrowSignalStar1[i]=0;
         //ObjectsDeleteAll(0,0,OBJ_TEXT);
        }
     }

   if(ObjectFind(0,label_name)>=0)
      ObjectDelete(0,label_name);

   for(int k=ObjectsTotal(0,0,OBJ_HLINE)-1; k>-1; k--)
     {
      string NameSymbol=ObjectName(0,k,0,OBJ_HLINE);
      if(StringFind(NameSymbol,"Sop",0)!=-1 || StringFind(NameSymbol,"Res",0)!=-1)
        {
         ObjectDelete(0,NameSymbol);
        }
     }

   if(ObjectFind(0,numero_redondos1)>=0)
      ObjectDelete(0,numero_redondos1);

   if(ObjectFind(0,numero_redondos2)>=0)
      ObjectDelete(0,numero_redondos2);

   if(ObjectFind(0,numero_redondos3)>=0)
      ObjectDelete(0,numero_redondos3);

   if(ObjectFind(0,numero_redondos4)>=0)
      ObjectDelete(0,numero_redondos4);

   if(ObjectFind(0,numero_redondos5)>=0)
      ObjectDelete(0,numero_redondos5
                  );

   if(prevtime!=Time[rates_total-1])
     {
      vez=1;
      ALERTAACTIVADA=false;
      CUENTA=false;
     }
   prevtime=Time[rates_total-1];


   int start=0;
   if(vez==1 || ArrowSignalStar[50]==0)
     {
      start=50;
      Ultimo3M=0;
      Ultimo3Z=0;
      Ultimo5x1=0;
      Ultimo6x1=0;
      Ultimo7x1=0;
      UltimoSand=0;
     }
   else
      if(vez==0)
        {
         start=rates_total-2;
        }

   for(int shift=start; shift<rates_total; shift++)
     {
      CumOffsetH= 0;
      CumOffsetL= 0;
      setalert = 0;
      counter=shift;
      Range=0;
      AvgRange=0;


      for(counter = shift; counter >= shift - 9; counter--)
         AvgRange = AvgRange + MathAbs(High[counter] - Low[counter]);
      Range=AvgRange/10;

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
      //Comment(EMAbuffer[0]," ",EMAbuffer[1]," ",EMAbuffer[2]," ",EMAbuffer[3]," ",EMAbuffer[4]," ",EMAbuffer[5]," ",EMAbuffer[6]);
      //Comment(RSIbuffer[0]-RSIbuffer[1]);
      pattern="";
      bool Condicion=false;


      if(shift==50)
        {
         ArrowSignalStar[start]=10;
         ArrowSignalStar1[start]=10;
        }

      else
        {
         if(shift<rates_total-5000)
           {
            FIBONACCI=false;
           }

         if(VerFIBO && FIBONACCI==true && shift>rates_total-5000  && shift!=rates_total-1)
           {
            for(int jk=RatesInicio; jk<rates_total-1 ; jk++)
              {
               if(FRACTAL_UP[jk]!=EMPTY_VALUE && UPFRACTAL==true)
                 {
                  FIBOPUNTO2=FRACTAL_UP[jk];
                  string NAMEFIBO="FIBOUP"+string(jk);
                  if(ObjectFind(0,NAMEFIBO)<0)
                    {
                     if(ObjectCreate(0,NAMEFIBO,OBJ_FIBO,0,Time[RatesInicio],FIBOPUNTO1,Time[shift]+PeriodSeconds(PERIOD_CURRENT)*15,FIBOPUNTO2))
                       {
                        FiboLevelsSet(2,ValoresFibo,EstiloFibo,0,NAMEFIBO);
                        ObjectSetInteger(0,NAMEFIBO,OBJPROP_SELECTABLE,true);
                        ObjectSetInteger(0,NAMEFIBO,OBJPROP_COLOR,clrRed);
                        ObjectSetInteger(0,NAMEFIBO,OBJPROP_STYLE,STYLE_DOT);
                        ObjectSetInteger(0,NAMEFIBO,OBJPROP_BACK,true);
                        FIBONACCI=false;
                       }
                    }
                  //Print(Time[shift-jk]," UP");
                  break;
                 }
               else
                  if(FRACTAL_DOWN[jk]!=EMPTY_VALUE && UPFRACTAL==false)
                    {
                     FIBOPUNTO2=FRACTAL_DOWN[jk];
                     string NAMEFIBO="FIBODN"+string(jk);
                     if(ObjectFind(0,NAMEFIBO)<0)
                       {
                        if(ObjectCreate(0,NAMEFIBO,OBJ_FIBO,0,Time[RatesInicio],FIBOPUNTO1,Time[shift]+PeriodSeconds(PERIOD_CURRENT)*15,FIBOPUNTO2))
                          {
                           FiboLevelsSet(2,ValoresFibo,EstiloFibo,0,NAMEFIBO);
                           ObjectSetInteger(0,NAMEFIBO,OBJPROP_SELECTABLE,true);
                           ObjectSetInteger(0,NAMEFIBO,OBJPROP_COLOR,clrRed);
                           ObjectSetInteger(0,NAMEFIBO,OBJPROP_STYLE,STYLE_DOT);
                           ObjectSetInteger(0,NAMEFIBO,OBJPROP_BACK,true);
                           FIBONACCI=false;
                          }
                       }
                     break;
                    }
              }
           }



         if(shift-Ultimo5x1>4)
           {
            if((O[0]<C[0] && O[1]<C[1] && O[2]<C[2] && O[3]<C[3] && O[4]<C[4])
               ||(O[0]>C[0] && O[1]>C[1] && O[2]>C[2] && O[3]>C[3] && O[4]>C[4]))
              {

               if(VelasPatron5x1== true)
                 {
                  if(O[0]<C[0])//VELAS REGRESIVAS SELL
                    {
                     pattern =pattern+" PatronVela 5-1";
                     Condicion=true;
                     if(shift!=rates_total-1)
                       {
                        MarkPattern(GetName("Patron_5-1",Time[shift]), Time[shift-paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"5x1", Size_5x1, Color5x1);
                        CumOffsetH = CumOffsetH+IncOffset;
                       }
                     ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                     Ultimo5x1=shift;
                    }

                  else //VELAS REGRESIVAS BUY
                     if(O[0]>C[0])
                       {
                        //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                        Condicion=true;
                        pattern =pattern+" PatronVela 5-1";
                        if(shift!=rates_total-1)
                          {
                           MarkPattern(GetName("Patron_5-1",Time[shift]), Time[shift-paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "5x1", Size_5x1, Color5x1);
                           CumOffsetL = CumOffsetL+IncOffset;
                          }
                        ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);
                        Ultimo5x1=shift;
                       }
                  if(VelasOpuestasEnVolumen_Alert == true)
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
              }

           }




         if(C[1]!=O[0] && prevtimegap!=Time[shift] && shift>rates_total-100 && VerGap)
           {
            NumeroTrends++;
            ColorGAP=C[1]>O[0]?ColorGapDn:ColorGapUp;
            if(ObjectCreate(0,"TRENDGAP"+IntegerToString(NumeroTrends,0,' '),OBJ_RECTANGLE,0,Time[shift-1],O[0],Time[shift],C[1]))
              {
               ObjectSetInteger(0,"TRENDGAP"+IntegerToString(NumeroTrends,0,' '),OBJPROP_COLOR,ColorGAP);
               ObjectSetInteger(0,"TRENDGAP"+IntegerToString(NumeroTrends,0,' '),OBJPROP_FILL,true);
              }
            prevtimegap=Time[shift];
           }



         if(((O[0]<C[0] && O[1]>C[1]) ||(O[0]>C[0] && O[1]<C[1])) && VelasPatron_Sandwich== true && shift-UltimoSand>2 && C[1]==O[0])
           {
            double SizeVelaMayor=BLa[1]>BLa[0]?BLa[1]:BLa[0];

            double Mayor=H[1]>H[0]?H[1]:H[0];

            double Menor=L[1]<L[0]?L[1]:L[0];

            if(H[0]>Mayor-Point()*10 && H[1]>Mayor-Point()*10 && L[0]<Menor+Point()*10 && L[1]<Menor+Point()*10 && (SizeVelaMayor*5)/6<BLa[1] && (SizeVelaMayor*5)/6<BLa[0]
               && UW[0]<Point()*2 && LW[0]<Point()*2)
              {

               if(O[0]<C[0])//VELAS REGRESIVAS SELL
                 {
                  pattern =pattern+" PatronVela Sandwich";
                  Condicion=true;
                  if(shift!=rates_total-1)
                    {
                     MarkPattern(GetName("Patron_Sandwich",Time[shift]), Time[shift-paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"SDW", Size_Sandwich, ColorSandwich);
                     CumOffsetH = CumOffsetH+IncOffset;
                    }
                  UltimoSand=shift;
                  ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                 }

               else //VELAS REGRESIVAS BUY
                  if(O[0]>C[0])
                    {
                     //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                     Condicion=true;
                     pattern =pattern+" PatronVela Sandwich";
                     if(shift!=rates_total-1)
                       {
                        MarkPattern(GetName("Patron_Sandwich",Time[shift]), Time[shift-paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "SDW", Size_Sandwich, ColorSandwich);
                        CumOffsetL = CumOffsetL+IncOffset;
                       }
                     ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);
                     UltimoSand=shift;
                    }
              }
            if(VelasOpuestasEnVolumen_Alert == true)
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




         if(shift-Ultimo3Z>2)
           {
            if((O[0]<C[0] && O[1]<C[1] && O[2]<C[2])
               ||(O[0]>C[0] && O[1]>C[1] && O[2]>C[2]))
              {

               if((BLa[0]>BLa[1] && BLa[1]>BLa[2])
                  || (BLa[0]<BLa[1] && BLa[1]<BLa[2]))
                 {

                  if(VelasPatron3Z == true)
                    {
                     if(O[0]<C[0])//VELAS REGRESIVAS SELL
                       {
                        //Condicion=EvaluaCondiciones(shift,false,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);
                        pattern =pattern+" PatronVela 3-Z";
                        Condicion=true;
                        if(shift!=rates_total-1)
                          {
                           MarkPattern(GetName("Patron_3_Z",Time[shift]), Time[shift-paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"3Z", Size_3Z, Color3Z);
                           CumOffsetH = CumOffsetH+IncOffset;
                          }
                        ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                        Ultimo3Z=shift;
                       }

                     else //VELAS REGRESIVAS BUY
                        if(O[0]>C[0])
                          {
                           //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                           Condicion=true;
                           pattern =pattern+" PatronVela 3-Z";
                           if(shift!=rates_total-1)
                             {
                              MarkPattern(GetName("Patron_3_Z",Time[shift]), Time[shift-paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "3Z", Size_3Z, Color3Z);
                              CumOffsetL = CumOffsetL+IncOffset;
                             }
                           ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);
                           Ultimo3Z=shift;
                          }
                    }
                  if(VelasOpuestasEnVolumen_Alert == true)
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
              }
           }

         if((O[0]<C[0] && O[1]<C[1]) || (O[0]>C[0] && O[1]>C[1]))
           {

            if(EMA_BUFFER[shift-1]< BodyHigh[1]-Point() &&  BodyLow[1]+Point()<EMA_BUFFER[shift-1])
              {
               if(VelasPatronZ == true)
                 {
                  bool Zbool=true;
                  if(EsIndice==SI && EMA_BUFFER[shift]<BodyHigh[0] && EMA_BUFFER[shift]>BodyLow[0])
                    {
                     Zbool=false;
                    }
                  if(EMA_BUFFER[shift-1]>BodyLow[1]+BLa[1]/2 && Zbool==true)//VELAS REGRESIVAS SELL
                    {
                     pattern = pattern+" PatronVela Z";
                     Condicion=true;
                     if(shift!=rates_total-1)
                       {
                        MarkPattern(GetName("Patron_Z",Time[shift]), Time[shift-paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"PZ", Size_Z, ColorZ);
                        CumOffsetH = CumOffsetH+IncOffset;
                       }
                     ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                    }

                  else //VELAS REGRESIVAS BUY
                     if(EMA_BUFFER[shift-1]<BodyLow[1]+BLa[1]/2 && Zbool==true)
                       {
                        //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                        Condicion=true;
                        pattern = pattern+" PatronVela Z";
                        if(shift!=rates_total-1)
                          {
                           MarkPattern(GetName("Patron_Z",Time[shift]), Time[shift-paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "PZ", Size_Z, ColorZ);
                           CumOffsetL = CumOffsetL+IncOffset;
                          }
                        ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);

                       }

                 }
               if(VelasOpuestasEnVolumen_Alert == true)
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
           }


         if(VelasPatron3Mecha== true && shift-Ultimo3M>2)
           {
            double Menor=L[0]<L[1]?L[0]:L[1];

            double Mayor=H[0]>H[1]?H[0]:H[1];

            if(LW[0]>0 && LW[1]>0 &&  Menor>=L[0]-Point()*Tolerancia3M && Menor>=L[1]-Point()*Tolerancia3M && LW[0]>BLa[0]&& LW[1]>BLa[1])//VELAS REGRESIVAS SELL
              {
               //Condicion=EvaluaCondiciones(shift,false,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);
               Condicion=true;
               pattern = pattern+" TRIPLE MECHA";
               if(shift!=rates_total-1)
                 {
                  MarkPattern(GetName("Triple Mecha",Time[shift]), Time[shift-paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "3M", Size_3M, Color3M);
                  CumOffsetL = CumOffsetL+IncOffset;
                 }
               ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);
               Ultimo3M=shift;
              }

            else //VELAS REGRESIVAS BUY
               if(UW[0]>0 && UW[1]>0  && Mayor<=H[0]+Point()*Tolerancia3M && Mayor<=H[1]+Point()*Tolerancia3M && UW[0]>BLa[0]&& UW[1]>BLa[1])
                 {
                  pattern = pattern+" TRIPLE MECHA";
                  Condicion=true;
                  if(shift!=rates_total-1)
                    {
                     MarkPattern(GetName("Triple Mecha",Time[shift]), Time[shift-paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"3M",Size_3M, Color3M);
                     CumOffsetH = CumOffsetH+IncOffset;
                    }
                  ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                  Ultimo3M=shift;
                 }

            if(VelasOpuestasEnVolumen_Alert == true)
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

         if(shift-Ultimo6x1>5)
           {
            if((O[0]<C[0] && O[1]<C[1] && O[2]<C[2] && O[3]<C[3] && O[4]<C[4] && O[5]<C[5])
               ||(O[0]>C[0] && O[1]>C[1] && O[2]>C[2] && O[3]>C[3] && O[4]>C[4] && O[5]>C[5]))
              {

               if(VelasPatron6x1== true)
                 {
                  if(O[0]<C[0])//VELAS REGRESIVAS SELL
                    {
                     pattern =pattern+" PatronVela 6-1 ";
                     Condicion=true;
                     if(shift!=rates_total-1)
                       {
                        MarkPattern(GetName("Patron_6-1 ",Time[shift]), Time[shift-paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"6x1", Size_6x1, Color6x1);
                        CumOffsetH = CumOffsetH+IncOffset;
                       }
                     ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                     Ultimo6x1=shift;
                    }

                  else //VELAS REGRESIVAS BUY
                     if(O[0]>C[0])
                       {
                        //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                        Condicion=true;
                        pattern =pattern+" PatronVela 6-1";
                        if(shift!=rates_total-1)
                          {
                           MarkPattern(GetName("Patron_6-1 ",Time[shift]), Time[shift-paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "6x1", Size_6x1, Color6x1);
                           CumOffsetL = CumOffsetL+IncOffset;
                          }
                        ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);
                        Ultimo6x1=shift;
                       }
                  if(VelasOpuestasEnVolumen_Alert == true)
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
              }

           }

         if(shift-Ultimo7x1>6)
           {
            if((O[0]<C[0] && O[1]<C[1] && O[2]<C[2] && O[3]<C[3] && O[4]<C[4] && O[5]<C[5] && O[6]<C[6])
               ||(O[0]>C[0] && O[1]>C[1] && O[2]>C[2] && O[3]>C[3] && O[4]>C[4] && O[5]>C[5] && O[6]>C[6]))
              {

               if(VelasPatron7x1== true)
                 {
                  if(O[0]<C[0])//VELAS REGRESIVAS SELL
                    {
                     pattern =pattern+" PatronVela 7-1 ";
                     Condicion=true;
                     if(shift!=rates_total-1)
                       {
                        MarkPattern(GetName("Patron_7-1 ",Time[shift]), Time[shift-paso], High[shift] + (Pointer_Offset+Offset_Caida_VelaOpuesta+High_Offset+CumOffsetH)*_Point,"7x1", Size_7x1, Color7x1);
                        CumOffsetH = CumOffsetH+IncOffset;
                       }
                     ArrowSignalStar[shift] = High[shift] + (Pointer_Offset*_Point);
                     Ultimo7x1=shift;
                    }

                  else //VELAS REGRESIVAS BUY
                     if(O[0]>C[0])
                       {
                        //Condicion=EvaluaCondiciones(shift,true,Low,High,RSIbuffer,EMAbuffer,EnvelopesbufferDown,EnvelopesbufferUp);

                        Condicion=true;
                        pattern =pattern+" PatronVela 7-1 ";
                        if(shift!=rates_total-1)
                          {
                           MarkPattern(GetName("Patron_7-1 ",Time[shift]), Time[shift-paso], Low[shift] - (Pointer_Offset+Offset_Subida_VelaOpuesta+CumOffsetL)*_Point, "7x1", Size_7x1, Color7x1);
                           CumOffsetL = CumOffsetL+IncOffset;
                          }
                        ArrowSignalStar1[shift] = Low[shift] - (Pointer_Offset*_Point);
                        Ultimo7x1=shift;
                       }
                  if(VelasOpuestasEnVolumen_Alert == true)
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
              }

           }
         if(VelasPatron_Demand_and_Supply== true && shift>rates_total-5000 && VEZFAMILIA30<Time[shift])
           {

            //if( CL[3]*MultiplicadorZonaVela<BLa[2] && BLa[3]>Point() && ((C[2]<O[2] && C[1]<O[1]) || (C[2]>O[2] && C[1]>O[1]))) //VELAS REGRESIVAS SELL

            if(UW[2]<=TamanoMechaImpulso*Point() && LW[2]<=TamanoMechaImpulso*Point() && CL[3]<=VelaTamanoBase*Point() && BLa[2]>=VelaTamanoImpulso*Point() && ((C[2]<O[2] && C[1]<O[1]) || (C[2]>O[2] && C[1]>O[1]))) //VELAS REGRESIVAS SELL
              {
               bool RealizarFibonacci=true;
               if(BLa[2]>VelaTamanoImpulso2daCondicion*Point()) {;}
               else
                  if(VelaTamanoContinuidad2daCondicion*Point()<BLa[1])
                    {
                     ;
                    }
                  else
                     RealizarFibonacci=false;

               if(RealizarFibonacci=true)
                 {
                  pattern =pattern+" PatronVela Demand and Supply";
                  //Condicion=true;

                  NumeroTrends++;
                  //MarkPattern(GetName("Patron_5-1",Time[shift]), Time[shift-2],BodyLow[0]+BLa[0]/2 ,"5-1", Size_5x1, Color5x1);

                  if(ObjectCreate(0,"Demand and Supply"+IntegerToString(NumeroTrends,0,' '),OBJ_TREND,0,Time[shift-3],H[3],Time[shift]+PeriodSeconds(PERIOD_CURRENT)*10,H[3]))
                    {
                     ObjectSetInteger(0,"Demand and Supply"+IntegerToString(NumeroTrends,0,' '),OBJPROP_COLOR,clrAqua);
                     ObjectSetInteger(0,"Demand and Supply"+IntegerToString(NumeroTrends,0,' '),OBJPROP_SELECTABLE,true);
                    }
                  NumeroTrends++;
                  if(ObjectCreate(0,"Demand and Supply"+IntegerToString(NumeroTrends,0,' '),OBJ_TREND,0,Time[shift-3],L[3],Time[shift]+PeriodSeconds(PERIOD_CURRENT)*10,L[3]))
                    {
                     ObjectSetInteger(0,"Demand and Supply"+IntegerToString(NumeroTrends,0,' '),OBJPROP_COLOR,clrAqua);
                     ObjectSetInteger(0,"Demand and Supply"+IntegerToString(NumeroTrends,0,' '),OBJPROP_SELECTABLE,true);
                    }
                  VEZFAMILIA30=Time[shift];


                  FIBONACCI=true;
                  if(C[1]>O[1])
                    {
                     FIBOPUNTO1=L[3];
                     UPFRACTAL=true;
                    }
                  else
                    {
                     FIBOPUNTO1=H[3];
                     UPFRACTAL=false;
                    }
                  RatesInicio=shift-2;
                 }
              }
           }
         // End of Bullish Patterns

         if((setalert==1) && (shift==rates_total-1))
           {
            Alert(Symbol()," ",period," ",pattern);
            setalert=0;
            if(Show_Alert_Movil)
               SendNotification("Formandose Patron "+pattern+ " en "+Symbol()+" Temporalidad: "+EnumToString(PERIOD_CURRENT));
           }
         CumOffsetL=0;
         CumOffsetH=0;
        }
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


/*
if(shift-Ultimo5x1>4){
if((O[0]<C[0] && O[1]<C[1] && O[2]<C[2] && O[3]<C[3] && O[4]<C[4])
   ||(O[0]>C[0] && O[1]>C[1] && O[2]>C[2] && O[3]>C[3] && O[4]>C[4]))
  {

   if((BB[4]<=BB[3] && BB[3]<=BB[2] && BB[2]<=BB[1] && BB[1]<=BB[0])
      || (BB[4]>=BB[3] &&BB[3]>=BB[2] && BB[2]>=BB[1] && BB[1]>=BB[0]))
     {

      if(VelasPatron5x1 == true)
        {
         NumeroTrends++;
         MarkPattern(GetName("Patron_5-1",Time[shift]), Time[shift-2],BodyLow[0]+BLa[0]/2,"5-1", Size_5x1, Color5x1);
         if(ObjectCreate(0,"TRENDPATRONES"+IntegerToString(NumeroTrends,0,' '),OBJ_TREND,0,Time[shift-2],BodyLow[0]+BLa[0]/2,Time[shift]+PeriodSeconds(PERIOD_CURRENT)*2,BodyLow[0]+BLa[0]/2))
           {
            ObjectSetInteger(0,"TRENDPATRONES"+IntegerToString(NumeroTrends,0,' '),OBJPROP_COLOR,clrAqua);
           }
         Condicion=true;
         pattern =pattern+" Patron Vela 5-1";
         ArrowSignalBuy[shift] = Low[shift] - (Pointer_Offset*_Point);
         ArrowSignalSell[shift] = High[shift] + (Pointer_Offset*_Point);
         Ultimo5x1=shift;
        }
      if(VelasOpuestasEnVolumen_Alert == true)
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
  }
}*/
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiboLevelsSet(int             levels,            // número de las líneas del nivel
                   double          &values[],         // valores de las líneas del nivel
                   ENUM_LINE_STYLE styles,         // estilo de las líneas del nivel
                   const long      chart_ID=0,        // ID del gráfico
                   const string    name="FiboLevels") // nombre del objeto
  {
//--- comprobamos los tamaños de los arrays
   if(levels!=ArraySize(values))
     {
      Print(__FUNCTION__,": ¡Error. La longitud del array no corresponde al número de los niveles!");
      return(false);
     }
//--- establecemos el número de los niveles
   ObjectSetInteger(chart_ID,name,OBJPROP_LEVELS,levels);
//--- establecemos las propiedades de los niveles en el ciclo
   for(int i=0; i<levels; i++)
     {
      //--- valor del nivel
      ObjectSetDouble(chart_ID,name,OBJPROP_LEVELVALUE,i,values[i]);
      //--- color del nivel
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELCOLOR,i,ColorFibo);
      //--- estilo del nivel
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELSTYLE,i,styles);
      //--- grosor del nivel
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELWIDTH,i,1);
      //--- descripción del nivel
      ObjectSetString(chart_ID,name,OBJPROP_LEVELTEXT,i,DoubleToString(100*values[i],1));
     }
//--- ejecución con éxito
   return(true);
  } 
//+------------------------------------------------------------------+
