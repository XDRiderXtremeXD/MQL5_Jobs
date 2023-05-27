//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2020, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+

////////////////////////ACA MODIFICAS EL TIEMPO LIMITADO PARA OTRA CUENTA QUE NO SEA TUYA/////////////////
/////////////////// AÑO.MES.DIA HORA:MINUTO///////////////////
datetime UNTIL=D'2020.10.30 00:00';
double CuentasCompartidas[1]= {0};
string NombrePersonaCompartida[1]={" "};

////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

///LUEGO LO COMPILAS, UNA VEZ COMPILADO LE MANDAS SOLO EL ARCHIVO .ex5 No mandes el archivo .mq5

////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

/////////////////////////TU CUENTA///////////////////////////////
////////////////////////////////////////////////////////////////////////
double Cuentas[2]= {2192242,1974851};
string CuentasBroker= "Deriv Limited";
////////////////////////////////////////////////////////////////////////

double ValoresFibo[4]={0,0.382,0.618,1};
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
input bool VelasPatron_Tickmill=true;
input bool VelasPatron_Sandwich= true;
input bool VerGap=true;
input bool VerFIBO=true;
input bool VerRedondo=true;
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
input string SEPARADOR4="----------TAMAÑO TEXTO PATRONES----------";
input int Size_Z=8;
input int Size_3M=8;
input int Size_3Z=8;
input int Size_5x1=8;
input int Size_6x1=8;
input int Size_7x1=8;
input int Size_Sandwich=8;
input string SEPARADOR5="----------Parametros Especiales----------";
input double MultiplicadorZonaVela=2.5;
input int Tolerancia3M=10;//Tolerancia Mechas 3M en Puntos
double VelaSizeImpulsto=0;
double TamanoMechaImpulsos=0;
input string SEPARADOR6="----------Distancia Texto----------";
input int  Pointer_Offset2=0;//Distancia entre la vela y la flecha
input int  Offset_Subida_VelaOpuesta2=0;//Distancia Entre el Texto y la Flecha(Abajo)
input int  Offset_Caida_VelaOpuesta2=0;//Distancia Entre el Texto y la Flecha(Arriba)
input int  DistanciaEntreTextos=0; //Distancia entre 2 Textos
input int  High_Offset2=0; //Ajustar Mas el texto de Arriba
input string SEPARADOR7="----------Estilizador del Fibo----------";
input color ColorFibo=clrAliceBlue;
input ENUM_LINE_STYLE EstiloFibo=STYLE_DOT;
int RatesInicio=0;


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
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+



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
   if(broker=="Pepperstone Group Limited" && account==51055646)
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
       else{
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
         VelaTamanoImpulso=3;
         TamanoMechaImpulso=2;
         //VALORVELASOPUESTAS=M1;
         break;
      case PERIOD_M5:
         period="M5";

         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VelaTamanoImpulso=4;
         TamanoMechaImpulso=2;
         //VALORVELASOPUESTAS=M5;

         break;
      case PERIOD_M15:
         period="M15";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VelaTamanoImpulso=15;
         TamanoMechaImpulso=2;
         //VALORVELASOPUESTAS=M15;

         break;
      case PERIOD_M30:
         period="M30";
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Subida_VelaOpuesta=5;
         Offset_Caida_VelaOpuesta=5;
         IncOffset=16;
         VelaTamanoImpulso=15;
         TamanoMechaImpulso=2;
         //VALORVELASOPUESTAS=M30;
         break;
      case PERIOD_H1:
         period="H1";
         Pointer_Offset=30;
         High_Offset=20;
         Offset_Subida_VelaOpuesta=10;
         Offset_Caida_VelaOpuesta=30;
         IncOffset=40;
         VelaTamanoImpulso=30;
         TamanoMechaImpulso=10;
         //VALORVELASOPUESTAS=H1;
         break;
      case PERIOD_H4:
         period="H4";
         Pointer_Offset=70;
         High_Offset=150;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=120;
         VelaTamanoImpulso=30;
         TamanoMechaImpulso=10;
         //VALORVELASOPUESTAS=H4;
         break;
      case PERIOD_D1:
         period="D1";
         Pointer_Offset=150;
         High_Offset=220;
         Offset_Subida_VelaOpuesta=40;
         Offset_Caida_VelaOpuesta=40;
         IncOffset=180;
         VelaTamanoImpulso=70;
         TamanoMechaImpulso=20;
         //VALORVELASOPUESTAS=D1;
         break;
      case PERIOD_W1:
         period="W1";
         Pointer_Offset=9;
         High_Offset=35;
         Offset_Subida_VelaOpuesta=80;
         Offset_Caida_VelaOpuesta=80;
         IncOffset=35;
         VelaTamanoImpulso=70;
         TamanoMechaImpulso=20;
         //VALORVELASOPUESTAS=W1;
         break;
      case PERIOD_MN1:
         period="MN";
         Pointer_Offset=9;
         High_Offset=45;
         Offset_Subida_VelaOpuesta=140;
         Offset_Caida_VelaOpuesta=140;
         IncOffset=45;
         VelaTamanoImpulso=150;
         TamanoMechaImpulso=50;
         //VALORVELASOPUESTAS=MN1;
         break;
     }
   Pointer_Offset=Pointer_Offset2>0?Pointer_Offset2:Pointer_Offset;
   Offset_Subida_VelaOpuesta=Offset_Subida_VelaOpuesta2>0?Offset_Subida_VelaOpuesta2:Offset_Subida_VelaOpuesta;
   Offset_Caida_VelaOpuesta=Offset_Caida_VelaOpuesta2>0?Offset_Caida_VelaOpuesta2:Offset_Caida_VelaOpuesta;
   High_Offset=High_Offset2>0?High_Offset2:High_Offset;
   IncOffset=DistanciaEntreTextos>0?DistanciaEntreTextos:IncOffset;
   VelaTamanoImpulso=VelaSizeImpulsto>0?VelaSizeImpulsto:VelaTamanoImpulso;
   TamanoMechaImpulso=TamanoMechaImpulsos>0?TamanoMechaImpulsos:TamanoMechaImpulso;

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

   for(int k=ObjectsTotal(0,0,OBJ_TREND)-1; k>-1; k--)
     {
      string NameSymbol=ObjectName(0,k,0,OBJ_TREND);
      if(StringFind(NameSymbol,"TRENDPATRONES",0)!=-1)
        {
         ObjectDelete(0,NameSymbol);
        }
     }
     
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


   if(password_status==-1 )
     {
      if(TimeCurrent()>UNTIL)
        {
         Comment("TIEMPO DE PRUEBA TERMINADO EA DESABILITADO");
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
        
         double PrecioRedondo=Close[rates_total-1];
         double PrecioRedondoMas=0;
         double PrecioRedondoMenos=0;
         double PrecioRedondoMas1=0;
         double PrecioRedondoMenos1=0;
          if(EsIndice==NO){
         double CalculoPrecio=(PrecioRedondo*MathPow(10,Digits()));
         int Index=0;
         CalculoPrecio=int(CalculoPrecio-int(CalculoPrecio/10)*10);
         PrecioRedondo=PrecioRedondo-CalculoPrecio*Point();
         PrecioRedondoMenos=PrecioRedondo-Point()*10;
         PrecioRedondoMas=PrecioRedondo+Point()*10;
         PrecioRedondoMas1=PrecioRedondo+Point()*10*2;;
         PrecioRedondoMenos1=PrecioRedondo-Point()*10*2;;
         }
         else{
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


     } // End of for loop



   return(rates_total);
  }
//+------------------------------------------------------------------+
                           