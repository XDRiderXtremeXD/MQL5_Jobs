//+------------------------------------------------------------------+
//|                                               Prueba Grafica.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0
input int x=500;
input int y=200;

#include <SmoothAlgorithms.mqh> 

input string NombresSimbolos="-----NombresSimbolos------";
input string NombresDeLosSimbolosAnalizar="EURUSD USDJPY XAUUSD AUDUSD";

input string _Separador_="HABILITACION DE ALERTAS";
input bool AlertaPC=true;
input bool AlertaAppMovil=true;
input bool AlertaEmail=true;

input string Separador="------TIMEFRAMES----";
input ENUM_TIMEFRAMES TimeFrame1=PERIOD_H1; 
input ENUM_TIMEFRAMES TimeFrame2=PERIOD_H4;
input ENUM_TIMEFRAMES TimeFrame3=PERIOD_D1; 
input string Separador1="----TIMEFRAME-ADX--";
input ENUM_TIMEFRAMES TimeFrameADX=PERIOD_D1; 

input string Separador2="------ADX------";
input int ADXPeriodo=14;
input int PeriodoIMF=20;
input ENUM_MA_METHOD MetodoEMA_IMF=MODE_EMA;

input string Separador3="----RSIOMA---------------";
input int PeriodoRSI=7;
input int PeriodoEMA=14;



double ADX[];
double ADXDplus[];
double ADXDminus[];
double IVP[];
double IVN[];
double RSI[];
double OMA[];

enum TipeColor{
SELL=0,
BUY=1,
NEUTRAL=2,
};


TipeColor Cuadros[100][9];
TipeColor AlarmaRSI[100][9];

string ArraySymbolos[100];
int Conteo=0;

datetime TimePrueba=0;
int DefinitionADX;
int DefinitionRSIOMA;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//---   
   ArrayInitialize(Cuadros,false);
   ArraySetAsSeries(ADX,true);
   ArrayResize(ADX,3,0);
   ArraySetAsSeries(ADXDminus,true);
   ArrayResize(ADXDminus,3,0);
   ArraySetAsSeries(ADXDplus,true);
   ArrayResize(ADXDplus,3,0);
   ArraySetAsSeries(IVN,true);
   ArrayResize(IVN,3,0);
   ArraySetAsSeries(IVP,true);
   ArrayResize(IVP,3,0);
   ArraySetAsSeries(RSI,true);
   ArrayResize(RSI,3,0);
   ArraySetAsSeries(OMA,true);
   ArrayResize(OMA,3,0);

   string NombresDeLosSimbolos=NombresDeLosSimbolosAnalizar+" ";
   int PosicionEncontradoAnterior=0;
   int PosicionEncontrado=0;
   while(PosicionEncontrado<StringBufferLen(NombresDeLosSimbolos) && PosicionEncontrado!=-1)
     {
      PosicionEncontrado=StringFind(NombresDeLosSimbolos," ",PosicionEncontrado+1);
      
      if(PosicionEncontrado!=-1)
        {
         int Sustraccion=PosicionEncontrado-PosicionEncontradoAnterior;
         ArraySymbolos[Conteo]=StringSubstr(NombresDeLosSimbolos,PosicionEncontradoAnterior,Sustraccion);
         PosicionEncontradoAnterior=PosicionEncontrado+1;
         Conteo++;
        }

     }
   bool SymboloPersonalizado;
   for(int i=0; i<Conteo; i++)
     {
      if(!SymbolExist(ArraySymbolos[i],SymboloPersonalizado))
        {
         Print("ERROR SYMBOLO ",ArraySymbolos[i]," NO ENCONTRADO");
         return(INIT_PARAMETERS_INCORRECT);
        }
     }

//DefinitionADX=iADX(Symbol(),PERIOD_CURRENT,14);
   IniciarGraficos();
   ChartRedraw(0);

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
  
  
   if(PeriodSeconds(PERIOD_CURRENT)!=PeriodSeconds(TimeFrame1))
   ChartSetSymbolPeriod(0,Symbol(),TimeFrame1);
   
   static datetime PrevTime=time[rates_total-1];
   
   bool CargaCompleta=true;
   for(int i=2; i<Conteo+2; i++)
     {
      string name="Label "+string(1)+" "+string(i);
      string NameCuadro="CuadradoBlanco "+string(1)+" "+string(i);
      if(CopiaADX(ArraySymbolos[i-2],TimeFrameADX,ADXPeriodo,ADX,0)==false)
      CargaCompleta=false;
      if(CopiaADX(ArraySymbolos[i-2],TimeFrameADX,ADXPeriodo,ADXDminus,2)==false)
      CargaCompleta=false;
      if(CopiaADX(ArraySymbolos[i-2],TimeFrameADX,ADXPeriodo,ADXDplus,1)==false)
      CargaCompleta=false;
      string TEXT=DoubleToString(ADX[0],2);
      ObjectSetString(0,name,OBJPROP_TEXT,0,TEXT);
      Cuadros[i][1]=NEUTRAL;
      if(ADXDplus[0]>ADXDminus[0] && ADX[0]>=20)
        {Cuadros[i][1]=BUY;
        ObjectSetInteger(0,NameCuadro,OBJPROP_BGCOLOR,clrGreen);
        }
      else if(ADXDplus[0]>ADXDminus[0] && ADX[0]<20)
        {Cuadros[i][1]=NEUTRAL;
        ObjectSetInteger(0,NameCuadro,OBJPROP_BGCOLOR,clrLime);
        }
      else if(ADXDplus[0]<ADXDminus[0] && ADX[0]>=20)
        {Cuadros[i][1]=SELL;
        ObjectSetInteger(0,NameCuadro,OBJPROP_BGCOLOR,clrRed);
        }
      else if(ADXDplus[0]<ADXDminus[0] && ADX[0]<20)
        {Cuadros[i][1]=NEUTRAL;
        ObjectSetInteger(0,NameCuadro,OBJPROP_BGCOLOR,clrFuchsia);
        }
     }
     
      for(int i=2; i<Conteo+2 && CargaCompleta==true; i++)
     {
      for(int j=5;j<8;j++){
      ENUM_TIMEFRAMES PERIODO=PERIOD_H1;
      if(j==5){
      PERIODO=TimeFrame1;
      }
      if(j==6){
      PERIODO=TimeFrame2;
      }
      if(j==7){
      PERIODO=TimeFrame3;
      }
      
      string name="Label "+string(j)+" "+string(i);
      string NameCuadro="CuadradoBlanco "+string(j)+" "+string(i);
      if(CopiaIMF(ArraySymbolos[i-2],PERIODO,PeriodoIMF,MetodoEMA_IMF,IVP,0)==false)
      CargaCompleta=false;
      if(CopiaIMF(ArraySymbolos[i-2],PERIODO,PeriodoIMF,MetodoEMA_IMF,IVN,2)==false)
      CargaCompleta=false;
      Cuadros[i][j]=NEUTRAL;
      if(IVP[0]>0 && IVN[0]>0)
        {Cuadros[i][j]=BUY;
        ObjectSetInteger(0,NameCuadro,OBJPROP_BGCOLOR,clrGreen);
        ObjectSetString(0,name,OBJPROP_TEXT,0,"BUY");
        }
      else if(IVP[0]<0 && IVN[0]>0)
        {Cuadros[i][j]=NEUTRAL;
        ObjectSetInteger(0,NameCuadro,OBJPROP_BGCOLOR,clrAqua);
        ObjectSetString(0,name,OBJPROP_TEXT,0,"NEUTRAL");
        }
      else if(IVP[0]<0 && IVN[0]<0)
        {Cuadros[i][j]=SELL;
        ObjectSetInteger(0,NameCuadro,OBJPROP_BGCOLOR,clrRed);
        ObjectSetString(0,name,OBJPROP_TEXT,0,"SELL");
        }
      else if(IVP[0]>0 && IVN[0]<20)
        {Cuadros[i][j]=NEUTRAL;
        ObjectSetInteger(0,NameCuadro,OBJPROP_BGCOLOR,clrAqua);
        ObjectSetString(0,name,OBJPROP_TEXT,0,"NEUTRAL");
        }
       }
     }
     
     if(CargaCompleta==true){
     for(int i=2; i<Conteo+2 && CargaCompleta==true; i++)
     {
      for(int j=2;j<5 ;j++){
      ENUM_TIMEFRAMES PERIODO=PERIOD_H1;
      if(j==2){
      PERIODO=TimeFrame1;
      }
      if(j==3){
      PERIODO=TimeFrame2;
      }
      if(j==4){
      PERIODO=TimeFrame3;
      }
     
      string name="Label "+string(j)+" "+string(i);
      string NameCuadro="CuadradoBlanco "+string(j)+" "+string(i);
      if(CopiaRSIOMA(ArraySymbolos[i-2],PERIODO,RSI,0)==false)
      CargaCompleta=false;
      if(CopiaRSIOMA(ArraySymbolos[i-2],PERIODO,OMA,1)==false)
      CargaCompleta=false;
      ResetLastError();
      Cuadros[i][j]=NEUTRAL;
      AlarmaRSI[i][j]=NEUTRAL;
      
      if(RSI[0]>OMA[0]){
      if(j==5 || j==7)AlarmaRSI[i][j]=BUY;
      }
      else{
      if(j==5 || j==7)AlarmaRSI[i][j]=SELL;
      }
      
      if(RSI[0]>OMA[0] && RSI[0]<80)
        {if(j==6)AlarmaRSI[i][j]=BUY;
        Cuadros[i][j]=BUY;
        if(!ObjectSetInteger(0,NameCuadro,OBJPROP_BGCOLOR,clrGreen))
        Print(GetLastError()," ",NameCuadro);
        ResetLastError();
        ObjectSetString(0,name,OBJPROP_TEXT,0,"BUY");
        }
      else if(RSI[0]>OMA[0] && RSI[0]>80)
        {Cuadros[i][j]=NEUTRAL;
        if(!ObjectSetInteger(0,NameCuadro,OBJPROP_BGCOLOR,clrLime))
        Print(GetLastError()," ",NameCuadro);
        ResetLastError();
        ObjectSetString(0,name,OBJPROP_TEXT,0,"NEUTRAL");
        }
      else if(RSI[0]<OMA[0] && RSI[0]>20 )
        {if(j==6)AlarmaRSI[i][j]=SELL;
        Cuadros[i][j]=SELL;
        if(!ObjectSetInteger(0,NameCuadro,OBJPROP_BGCOLOR,clrRed))
        Print(GetLastError()," ",NameCuadro);
        ResetLastError();
        ObjectSetString(0,name,OBJPROP_TEXT,0,"SELL");
        }
      else if(RSI[0]<OMA[0] && RSI[0]<20)
        {Cuadros[i][j]=NEUTRAL;
        if(!ObjectSetInteger(0,NameCuadro,OBJPROP_BGCOLOR,clrFuchsia))
        Print(GetLastError()," ",NameCuadro);
        ResetLastError();
        ObjectSetString(0,name,OBJPROP_TEXT,0,"NEUTRAL");
        }
       }
     }
     }
     
     if(CargaCompleta==false){
     string name="Label "+string(8)+" "+string(1);
      ObjectSetString(0,name,OBJPROP_TEXT,0,"Cargando");
     }
     else{
     string name="Label "+string(8)+" "+string(1);
      ObjectSetString(0,name,OBJPROP_TEXT,0,"---------");
     }
     
     
      string ComentarioAlerta=" ";
      for(int i=2; i<Conteo+2 && CargaCompleta==true; i++)
     {
      string name="Label "+string(8)+" "+string(i);
      string NameCuadro="CuadradoBlanco "+string(8)+" "+string(i);
      
      if(Cuadros[i][1]==BUY && Cuadros[i][2]==BUY && Cuadros[i][3]==BUY && Cuadros[i][4]==BUY && Cuadros[i][5]==BUY && Cuadros[i][6]==BUY &&
       Cuadros[i][7]==BUY ){
       ObjectSetInteger(0,NameCuadro,OBJPROP_BGCOLOR,clrGreen);
        ObjectSetString(0,name,OBJPROP_TEXT,0,"BUY");
        if(PeriodSeconds(PERIOD_CURRENT)==PeriodSeconds(TimeFrame1) && AlarmaRSI[i][5]==BUY && AlarmaRSI[i][6]==BUY && AlarmaRSI[i][7]==BUY)
        ComentarioAlerta=ComentarioAlerta+"BUY in "+ArraySymbolos[i-2]+"\n";
        
       }
      
      else if (Cuadros[i][1]==SELL && Cuadros[i][2]==SELL && Cuadros[i][3]==SELL && Cuadros[i][4]==SELL && Cuadros[i][5]==SELL && Cuadros[i][6]==SELL &&
       Cuadros[i][7]==SELL  ){
       ObjectSetInteger(0,NameCuadro,OBJPROP_BGCOLOR,clrRed);
        ObjectSetString(0,name,OBJPROP_TEXT,0,"SELL");
        if(PeriodSeconds(PERIOD_CURRENT)==PeriodSeconds(TimeFrame1) && AlarmaRSI[i][5]==SELL && AlarmaRSI[i][6]==SELL && AlarmaRSI[i][7]==SELL)
        ComentarioAlerta=ComentarioAlerta+"SELL in "+ArraySymbolos[i-2]+"\n";
       }
      else{
       ObjectSetInteger(0,NameCuadro,OBJPROP_BGCOLOR,clrGray);
        ObjectSetString(0,name,OBJPROP_TEXT,0,"NEUTRAL");
       }
      
     }
   
   if(ComentarioAlerta!=" " && PrevTime!=time[rates_total-1] && PeriodSeconds(PERIOD_CURRENT)==PeriodSeconds(TimeFrame1)){
   if(AlertaPC)Alert(ComentarioAlerta);
   if(AlertaAppMovil)SendNotification(ComentarioAlerta);
   if(AlertaEmail)SendMail("ALERTAS PANEL",ComentarioAlerta);
   PrevTime=time[rates_total-1];
   }
  
  
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |


//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,0,OBJ_RECTANGLE_LABEL);
   ObjectsDeleteAll(0,0,OBJ_LABEL);

  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IniciarGraficos()
  {
   int chart_ID=0;
   string name="CuadradoNegro";
   ObjectCreate(0,name,OBJ_RECTANGLE_LABEL,0,0,0);

   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,0);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,0);
//--- establecemos las dimensiones de la etiqueta
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,x+2);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,y+3);
//--- establecemos el color del fondo
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,clrBlack);
//--- establecemos el tipo del borde
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_TYPE,2);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del punto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,0);
//--- establecemos el color del contorno plano (en modo Flat)
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clrBlack);
//--- establecemos el estilo de las líneas del contorno plano
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,STYLE_DASH);
//--- establecemos el grosor del contorno plano
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,2);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,false);

   int Ycuadros=2+Conteo;

   for(int j=0; j<Ycuadros; j++)
     {
      for(int i=0; i<9; i++)
        {
         int DistanceX=(x/9);
         chart_ID=0;
         if(j==0 && (i==3 || i==4 || i==6 || i==7))
         continue;
         if(j==0 && (i==2 || i==5))
         DistanceX=DistanceX*3;
         
         name="CuadradoBlanco "+string(i)+" "+string(j);
         ObjectCreate(0,name,OBJ_RECTANGLE_LABEL,0,0,0);

         ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,(x/9)*i+3);
         ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,(y/Ycuadros)*j);
         //--- establecemos las dimensiones de la etiqueta
         ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,DistanceX);
         ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,(y/Ycuadros));
         //--- establecemos el color del fondo
         ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,clrWhite);
         //--- establecemos el tipo del borde
         ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_TYPE,2);
         //--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del punto
         ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,0);
         //--- establecemos el color del contorno plano (en modo Flat)
         ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clrRed);
         //--- establecemos el estilo de las líneas del contorno plano
         ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,STYLE_DASH);
         //--- establecemos el grosor del contorno plano
         ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,2);
         //--- mostramos en el primer plano (false) o al fondo (true)
         ObjectSetInteger(chart_ID,name,OBJPROP_BACK,false);


         string TEXT=GENERAR(i,j);
         if(i==8 && j==1){
         TEXT="Cargando";
         }
         int StrengTEXT=StringLen(TEXT);
         TimePrueba=iTime(NULL,PERIOD_CURRENT,0);
         name="Label "+string(i)+" "+string(j);
         ObjectCreate(0,name,OBJ_LABEL,0,0,0);
         ObjectSetInteger(0,name,OBJPROP_CORNER,0);
         ObjectSetInteger(0,name,OBJPROP_COLOR,clrBlack);
         ObjectSetInteger(0,name,OBJPROP_XDISTANCE,(x/9)*i+(x/9)/StrengTEXT);
         ObjectSetInteger(0,name,OBJPROP_YDISTANCE,(y/Ycuadros)*j+((y/Ycuadros)/2)-4);
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
   if(i==0 && j>1)
     {
      return ArraySymbolos[j-2];
     }
   if(i==0 && j==1)
      return "TF";
   if(i==1 && j==1)
     return  ConversionTextoTimeFrame(TimeFrameADX);
   if(i==2 && j==1)
      return ConversionTextoTimeFrame(TimeFrame1);
   if(i==3 && j==1)
      return ConversionTextoTimeFrame(TimeFrame2);
   if(i==4 && j==1)
      return ConversionTextoTimeFrame(TimeFrame3);
   if(i==5 && j==1)
      return ConversionTextoTimeFrame(TimeFrame1);
   if(i==6 && j==1)
      return ConversionTextoTimeFrame(TimeFrame2);
   if(i==7 && j==1)
      return ConversionTextoTimeFrame(TimeFrame3);
   if(i==8 && j==1)
      return "--";
    if(i==0 && j==0){
      return "SIMBOLO";
    }
    if(i==1 && j==0){
      return "ADX";
    }
    if(i==2 && j==0){
      return "RSI-OMA";
    }
    if(i==5 && j==0){
      return "IMF-MTF";
    }
    if(i==8 && j==0){
      return "SEÑAL";
    }
   
   if(i==1)
   return "-----";
   
   return "------";
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CopiaADX(string Simbolo,ENUM_TIMEFRAMES PeriodoTimeFrame,int PeriodoIndicador,double &BufferIndicador[],int Index)
  {
   int handleIndicador;
   handleIndicador=iCustom(Simbolo,PeriodoTimeFrame,"ADXW",PeriodoIndicador);
//ArraySetAsSeries(iMABuffer,true);
   if(CopyBuffer(handleIndicador,Index,0,3,BufferIndicador)<0)
   return false;
   return true;
  }


bool CopiaIMF(string Simbolo,ENUM_TIMEFRAMES PeriodoTimeFrame,int PeriodoIndicador,ENUM_MA_METHOD Metodo,double &BufferIndicador[],int Index)
  {
   int handleIndicador;
   handleIndicador=iCustom(Simbolo,PeriodoTimeFrame,"IMF",PeriodoIndicador,Metodo);
//ArraySetAsSeries(iMABuffer,true);
   if(CopyBuffer(handleIndicador,Index,0,3,BufferIndicador)<0)
   return false;
   return true;
  }
  
  
  
bool CopiaRSIOMA(string Simbolo,ENUM_TIMEFRAMES PeriodoTimeFrame,double &BufferIndicador[],int Index)
  {
   int handleIndicador;
   handleIndicador=iCustom(Simbolo,PeriodoTimeFrame,"RSIOMA",PeriodoRSI,PeriodoEMA); 
//ArraySetAsSeries(iMABuffer,true);
   if(CopyBuffer(handleIndicador,Index,0,3,BufferIndicador)<0)
   return false;
   return true;
  }


string ConversionTextoTimeFrame(ENUM_TIMEFRAMES PeriodoTimeFrame){
switch(PeriodoTimeFrame) 
  { 
   case PERIOD_M1: 
   return("1 MINUTO"); 
   case PERIOD_M2: 
   return("2 MINUTOS"); 
   case PERIOD_M3: 
   return("3 MINUTOS"); 
   case PERIOD_M4: 
   return("4 MINUTOS"); 
   case PERIOD_M5: 
   return("5 MINUTOS"); 
   case PERIOD_M6: 
   return("6 MINUTOS"); 
   case PERIOD_M10: 
   return("10 MINUTOS"); 
   case PERIOD_M12: 
   return("12 MINUTOS"); 
   case PERIOD_M15: 
   return("15 MINUTOS"); 
   case PERIOD_M20: 
   return("20 MINUTOS"); 
   case PERIOD_M30: 
   return("30 MINUTOS"); 
   case PERIOD_H1:
   return("1 HORA"); 
   case PERIOD_H2: 
   return("2 HORAS"); 
   case PERIOD_H3: 
   return("3 HORAS"); 
   case PERIOD_H4:
   return("4 HORAS"); 
   case PERIOD_H6: 
   return("6 HORAS"); 
   case PERIOD_H8: 
   return("8 HORAS"); 
   case PERIOD_H12: 
   return("12 HORAS"); 
   case PERIOD_D1: 
   return("DIARIO"); 
   case PERIOD_W1: 
   return("SEMANAL"); 
   case PERIOD_MN1: 
   return("MENSUAL"); 
   }
   
   return("-----"); 
}


/*
enum Applied_price_      // type of constant
  {
   PRICE_CLOSE_ = 1,     // Close
   PRICE_OPEN_,          // Open
   PRICE_HIGH_,          // High
   PRICE_LOW_,           // Low
   PRICE_MEDIAN_,        // Median Price (HL/2)
   PRICE_TYPICAL_,       // Typical Price (HLC/3)
   PRICE_WEIGHTED_,      // Weighted Close (HLCC/4)
   PRICE_SIMPLE_,        // Simple Price (OC/2)
   PRICE_QUARTER_,       // Quarted Price (HLOC/4) 
   PRICE_TRENDFOLLOW0_,  // TrendFollow_1 Price 
   PRICE_TRENDFOLLOW1_,  // TrendFollow_2 Price
   PRICE_DEMARK_         // Demark Price
  };
//+----------------------------------------------+
//| Indicator input parameters                   |
//+----------------------------------------------+
input Smooth_Method RSIOMA_Method=MODE_EMA_;   // RSIOMA averaging method
input uint RSIOMA=14;                         // Depth of averaging of RSIOMA                    
input int RSIOMAPhase=15;                     // RSIOMA averaging parameter
//--- RSIOMAPhase: for JJMA it varies within the range -100 ... +100 and influences the quality of the transient period;
//--- RSIOMAPhase: For VIDIA it is a CMO period, for AMA it is a slow average period
input Smooth_Method MARSIOMA_Method=MODE_EMA_; // MARSIOMA averaging method
input uint MARSIOMA=21;                       // RSIOMA averaging depth                    
input int MARSIOMAPhase=15;                   // RSIOMA averaging parameter
//--- MARSIOMAPhase: for JJMA it varies within the range -100 ... +100 and influences the quality of the transient period;
//--- MARSIOMAPhase: For VIDIA it is a CMO period, for AMA it is a slow average period
input uint MomPeriod=1;                       // Period of Momentum
input Applied_price_ IPC=PRICE_CLOSE_;         // Price constant
input int Shift=0;                          // Horizontal shift of the indicator in bars */