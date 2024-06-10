//+------------------------------------------------------------------+
//|                                              CandleCountDown.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
#property copyright "nicholishen"
#property link      "www.reddit.com/u/nicholishenFX"
#property version   "1.00"
#property strict
#property indicator_chart_window
#include <ChartObjects\ChartObjectsTxtControls.mqh>
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
CChartObjectLabel label;
CChartObjectText TextoReloj;
CChartObjectText VolumeData1;
CChartObjectText VolumeData2;
CChartObjectText VolumeData3;
CChartObjectText VolumeData4;


enum ENUM_Posicion
  {
   Arriba=0, //UPPER
   Abajo=1, //LOWER
  };

enum ENUM_Booleano
  {
   NO=0, //NO
   SI=1, //YES
  };

input string Separador0="************************************************";
input color ColorReloj=clrWhite;   // Color Reloj Default
input ENUM_Posicion PosicionReloj=Arriba; //Clock Position
input int PuntosAlejadoLinea=1;       // Points Away From Line (Vertical)
input int PuntosAlejadoPrecio=5;     // Points Away From Price (Horizontal)
input int PuntosAlejadosValores=16;   // Points Away From Price Value (Indi Volume)(Horizontal)
input int SizeLetra=15; //Font Size

int Segundos=0;
bool Iniciar=true;
int SegundoTimer=0;
int PeriodoVela;
int PeriodoVelaAlarma1;
int PeriodoVelaAlarma2;
int PeriodoVelaAlarma3;
int PeriodoVelaAlarma4;
int PeriodoVelaAlarma5;

int Objetos_Totales=0;

bool Actualizar=false;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   double Posicion;
   ENUM_ANCHOR_POINT AnchorTexto;
   AnchorTexto=PosicionReloj==Arriba?ANCHOR_LEFT_LOWER:ANCHOR_LEFT_UPPER;
   Posicion=PosicionReloj==Arriba?Ask+PuntosAlejadoLinea*Point():Bid-PuntosAlejadoLinea*Point();
//--- indicator buffers mapping
   if(ObjectFind(0,"Timer")==0)
     {
      ObjectDelete(0,"Timer");
     }
   TextoReloj.Create(0,"Timer",0,0,0);
   TextoReloj.Anchor(AnchorTexto);
   TextoReloj.Price(0,Posicion);
   TextoReloj.Time(0,TimeCurrent()+(PeriodSeconds((ENUM_TIMEFRAMES)Period())*PuntosAlejadoPrecio));
   TextoReloj.Color(ColorReloj);
   TextoReloj.FontSize(SizeLetra);
   Timer();
   EventSetMillisecondTimer(250);
   Objetos_Totales=ObjectsTotal(0,-1,-1);

//---
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
//---

   //if(MarketInfo(Symbol(),MODE_TRADEALLOWED))
    // {
      //--- return value of prev_calculated for next call
      double Posicion=PosicionReloj==Arriba?Ask+PuntosAlejadoLinea*Point():Bid-PuntosAlejadoLinea*Point();
      TextoReloj.Price(0,Posicion);
      TextoReloj.Time(0,TimeCurrent()+PeriodoVela*PuntosAlejadoPrecio);
     //}

   ChartRedraw();


   return(rates_total);
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {

   if(Objetos_Totales!=ObjectsTotal(0,-1,-1))
     {
      Actualizar=true;
      Objetos_Totales=ObjectsTotal(0,-1,-1);
     }

   if(Actualizar)
     {
      double Posicion;
      ENUM_ANCHOR_POINT AnchorTexto;
      AnchorTexto=PosicionReloj==Arriba?ANCHOR_LEFT_LOWER:ANCHOR_LEFT_UPPER;
      Posicion=PosicionReloj==Arriba?Ask+PuntosAlejadoLinea*Point():Bid-PuntosAlejadoLinea*Point();
      if(ObjectFind(0,"Timer")==0)
        {
         ObjectDelete(0,"Timer");
        }
      TextoReloj.Create(0,"Timer",0,0,0);
      TextoReloj.Anchor(AnchorTexto);
      TextoReloj.Price(0,Posicion);
      TextoReloj.Time(0,TimeCurrent()+(PeriodSeconds((ENUM_TIMEFRAMES)Period())*PuntosAlejadoPrecio));
      TextoReloj.Color(ColorReloj);
      TextoReloj.FontSize(SizeLetra);
      Actualizar=false;
     }

   if(MarketInfo(Symbol(),MODE_TRADEALLOWED))
      Timer();
   else
     {
      TextoReloj.Description("");
      if(VentanaVolumen && VentanaVolumenIndex!=-1)
        {
         VolumeData1.Description(" ");
         VolumeData2.Description(" ");
         VolumeData3.Description(" ");
         VolumeData4.Description(" ");
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime RemainingBarTime()
  {
   datetime time[];
   ArrayResize(time,1);
   if(CopyTime(Symbol(),Period(),0,1,time)==-1)
      Print("ERROR");
   datetime resultado=time[0]+PeriodoVela-TimeCurrent();
   return (resultado);
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime RemainingBarTimeAlarma(ENUM_TIMEFRAMES TimeFrame,int PeriodoVelaAlarma_)
  {
   datetime time1[];
   if(CopyTime(Symbol(),TimeFrame,0,1,time1)==-1)
      Print("ERROR");
   datetime resultado=time1[0]+PeriodoVelaAlarma_-TimeCurrent();
   return (resultado);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Timer()
  {
//Comment(Segundos," *** ", TimeToStr(TimeCurrent(),TIME_DATE|TIME_SECONDS));
////////////PRIMERA CARGA////////////////

   RefreshRates();
   MqlDateTime t;
   TimeToStruct(RemainingBarTime(),t);
   Segundos=t.hour*3600+t.min*60+t.sec;
   RefreshRates();

   MqlDateTime ti;
   TimeToStruct(RemainingBarTimeAlarma(TimeFrame1,PeriodoVelaAlarma1),ti);
   int SegundosAlarma1=ti.hour*3600+ti.min*60+ti.sec;

   TimeToStruct(RemainingBarTimeAlarma(TimeFrame2,PeriodoVelaAlarma2),ti);
   int SegundosAlarma2=ti.hour*3600+ti.min*60+ti.sec;

   TimeToStruct(RemainingBarTimeAlarma(TimeFrame3,PeriodoVelaAlarma3),ti);
   int SegundosAlarma3=ti.hour*3600+ti.min*60+ti.sec;

   TimeToStruct(RemainingBarTimeAlarma(TimeFrame4,PeriodoVelaAlarma4),ti);
   int SegundosAlarma4=ti.hour*3600+ti.min*60+ti.sec;

   TimeToStruct(RemainingBarTimeAlarma(TimeFrame5,PeriodoVelaAlarma5),ti);
   int SegundosAlarma5=ti.hour*3600+ti.min*60+ti.sec;

   if(Segundos>PeriodoVela || Segundos<0)
      Segundos=PeriodoVela;

   if(SegundosAlarma1>PeriodoVelaAlarma1 || SegundosAlarma1<0)
      SegundosAlarma1=PeriodoVelaAlarma1;

   if(SegundosAlarma2>PeriodoVelaAlarma2 || SegundosAlarma2<0)
      SegundosAlarma2=PeriodoVelaAlarma2;

   if(SegundosAlarma3>PeriodoVelaAlarma3 || SegundosAlarma3<0)
      SegundosAlarma3=PeriodoVelaAlarma3;

   if(SegundosAlarma4>PeriodoVelaAlarma4 || SegundosAlarma4<0)
      SegundosAlarma4=PeriodoVelaAlarma4;

   if(SegundosAlarma5>PeriodoVelaAlarma5 || SegundosAlarma5<0)
      SegundosAlarma5=PeriodoVelaAlarma5;

   string rem = "";
   rem += (int(Segundos/3600)==0) ? "" : (int(Segundos/3600) < 10 ? "0"+string(int(Segundos/3600)) : string(int(Segundos/3600)))+":";
   rem += (int((Segundos/60)%60) < 10 ? "0"+string((int(Segundos/60))%60) : string((int(Segundos/60))%60))+":";
   rem += (int(Segundos%60) < 10 ? "0"+string(int(Segundos%60)) : string(int(Segundos%60)));
   TextoReloj.Description("<"+rem);

   TextoReloj.Color(ColorReloj);
   VolumeData3.Color(ColorVolume);
////////////////////////////////////////////////////////////////
   long VolumenAnterior=iVolume(Symbol(),PeriodoVolumen,1);
   long VolumenActual=iVolume(Symbol(),PeriodoVolumen,0);
   long Diferencia=VolumenActual-VolumenAnterior;
   long Tamano_maximo=0;
   string Str1=string(VolumenActual),Str2=string(VolumenAnterior),Str3=string(Diferencia);
   Tamano_maximo=StringLen(Str1)>StringLen(Str2)?StringLen(Str1):StringLen(Str2);
   Tamano_maximo=StringLen(Str3)>Tamano_maximo?StringLen(Str3):Tamano_maximo;

   int SegundosActuales=PeriodSeconds((ENUM_TIMEFRAMES) Period());

   int Dividendo=SegundosActuales-Segundos;
   if(Dividendo==0)
      Dividendo=1;
   double Calculo= (SegundosActuales*VolumenActual)/((double)(Dividendo));
   if(VolumenAnterior==0)
      VolumenAnterior=1;
   Calculo=((Calculo/VolumenAnterior)*100)-100;

   int Len_A=StringLen((string) VolumenActual);
   int Len_B=StringLen((string) VolumenAnterior);
   int Len_C=StringLen((string)(VolumenActual-VolumenAnterior));
   int Len_D=StringLen((string) DoubleToString(((Calculo)),2));
   int Size=Len_A>=Len_B?Len_A:Len_B;
   Size=Size>=Len_C?Size:Len_C;
   Size=Size>=Len_D?Size:Len_D;
   string Agregar_A="",Agregar_B="",Agregar_C="",Agregar_D="";
   for(int i=0; i<Size-Len_A; i++)
      Agregar_A=Agregar_A+" ";
   for(int i=0; i<Size-Len_B; i++)
      Agregar_B=Agregar_B+" ";
   for(int i=0; i<Size-Len_C; i++)
      Agregar_C=Agregar_C+" ";
   for(int i=0; i<Size-Len_D; i++)
      Agregar_D=Agregar_D+" ";


   VolumeData1.Description("Vol. Current_: "+Agregar_A+  string(VolumenActual));
   VolumeData2.Description("Vol. Previous: "+Agregar_B+  string(VolumenAnterior));
   VolumeData3.Description("Difference   : "+Agregar_C+  string(VolumenActual-VolumenAnterior));
   VolumeData4.Description("Percentage   : "+Agregar_D+ DoubleToString(((Calculo)),2));

   if(Calculo>0){
      VolumeData4.Color(Color_Volume_Positivo_Porcentaje);
      TextoReloj.Color(ColorCambioPercent);
      }
   else{
      VolumeData4.Color(Color_Volume_Negativo_Porcentaje);}

   if(CambioColorSiVolumenSuperior && VolumenActual>VolumenAnterior)
     {
      TextoReloj.Color(ColorCambio);
      VolumeData3.Color(ColorCambio);
     }


/////////////////PARPADEO//////////////////////////////////
   if(Segundos<SegundosParaParpadeo  && ParpadeoAntesDelCierre)
     {
      if(Segundos%2==1)
         TextoReloj.Color(ColorParpadeo);
     }
///////////////////////////////////////////////////////////
/////////////////////////////////////////////////////
   static bool Sonido1=true;
   if(SegundosAlarma1>SegundosParaSonido1)
      Sonido1=false;

   if(SegundosAlarma1<=SegundosParaSonido1 && SonidoWavAntesDelCierre1 && Sonido1==false)
     {
      PlaySound(ArchivoWav1);
      Sonido1=true;
     }
///-------------------------------------------------------------------------
   static bool  Sonido2=true;
   if(SegundosAlarma2>SegundosParaSonido2)
      Sonido2=false;

   if(SegundosAlarma2<=SegundosParaSonido2 && SonidoWavAntesDelCierre2 && Sonido2==false)
     {
      PlaySound(ArchivoWav2);
      Sonido2=true;
     }
///-------------------------------------------------------------------------
   static bool  Sonido3=true;
   if(SegundosAlarma3>SegundosParaSonido3)
      Sonido3=false;

   if(SegundosAlarma3<=SegundosParaSonido3 && SonidoWavAntesDelCierre3 && Sonido3==false)
     {
      PlaySound(ArchivoWav3);
      Sonido3=true;
     }
///-------------------------------------------------------------------------
   static bool  Sonido4=true;
   if(SegundosAlarma4>SegundosParaSonido4)
      Sonido4=false;

   if(SegundosAlarma4<=SegundosParaSonido4 && SonidoWavAntesDelCierre4 && Sonido4==false)
     {
      PlaySound(ArchivoWav4);
      Sonido4=true;
     }
///-------------------------------------------------------------------------
   static bool  Sonido5=true;
   if(SegundosAlarma5>SegundosParaSonido5)
      Sonido5=false;

   if(SegundosAlarma5<=SegundosParaSonido5 && SonidoWavAntesDelCierre5 && Sonido5==false)
     {
      PlaySound(ArchivoWav5);
      Sonido5=true;
     }

   TextoReloj.Time(0,TimeCurrent()+PeriodoVela*PuntosAlejadoPrecio);
   ChartRedraw();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   TextoReloj.Delete();
   VolumeData1.Delete();
   VolumeData2.Delete();
   VolumeData3.Delete();
   VolumeData4.Delete();

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // Event identifier
                  const long& lparam,   // Event parameter of long type
                  const double& dparam, // Event parameter of double type
                  const string& sparam) // Event parameter of string type
  {
   if(id==CHARTEVENT_OBJECT_CHANGE)
     {
      //Print("El Objeto Con el Nombre ",sparam," ha cambiado sus propiedades");
      Actualizar=true;
     }
   if(id==CHARTEVENT_OBJECT_CREATE)
     {
      //Print("El Objeto con el nombre ",sparam," ha sido creado");
      Actualizar=true;
     }
  }
//+------------------------------------------------------------------+
