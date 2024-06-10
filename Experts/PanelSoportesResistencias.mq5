//+------------------------------------------------------------------+
//|                                    PanelSoportesResistencias.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#resource "\\Indicators\\SUPRESFINAL PRUEBA 2.ex5"

#include <PanelBuffers.mqh>
PanelBuffer Panel;

enum SW
  {
   SW_OFF=0,
   SW_ON=1,
  };

candle candle_signal=close;


input string S1__="-----------------------   Configuracion SOP RES---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Ver_Linea_Historial=false;
input color Color_Linea=clrYellow;
input int BackLimit=500;
input string pus1="/////////////////////////////////////////////////";
input bool zone_show_weak=false;//Mostrar zonas débiles
input bool zone_show_untested = false;//Mostrar zonas no probadas
input bool zone_show_turncoat = false;//Mostrar zonas rotas
input double zone_fuzzfactor=0.75;
input int SeparacionTexto=10;
input string pus2="/////////////////////////////////////////////////";
input bool fractals_show=false;
input double fractal_fast_factor = 3.0;
input double fractal_slow_factor = 6.0;
input bool SetGlobals=true;
input string S2="========== Alerts ============";//====================================
input bool AlertPC=true;
input bool AlertMovil=true;
input string S3="========== TFs ============";//====================================
input bool M1_ = false;
input bool M2_ = false;
input bool M3_ = false;
input bool M4_ = false;
input bool M5_ = true;
input bool M6_ = false;
input bool M10_ = false;
input bool M12_ = false;
input bool M15_ = true;
input bool M20_ = false;
input bool M30_ = true;
input bool H1_ = true;
input bool H2_ = false;
input bool H3_ = false;
input bool H4_ = false;
input bool H6_ = false;
input bool H8_ = false;
input bool H12_ = false;
input bool D1_ = false;
input bool W1_ = false;
input bool MN1_ = false;


//double RES[];
//double SUP[];
bool Funcion(int &handle,int columna,int fila,ENUM_TIMEFRAMES tf,string simbolo);




//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   Comment("NO CAMBIO");

//int handle=iCustom(Symbol(),PERIOD_CURRENT,location_indicator,UserSettings,Line_ON_OFF,Bars_for_fractals,Color_Line);
   int handle=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\SUPRESFINAL PRUEBA 2.ex5",S1__,
                      Ver_Linea_Historial,
                      Color_Linea,
                      BackLimit,
                      pus1,
                      zone_show_weak,
                      zone_show_untested,
                      zone_show_turncoat,
                      zone_fuzzfactor,
                      SeparacionTexto,
                      pus2,
                      fractals_show,
                      fractal_fast_factor,
                      fractal_slow_factor,
                      SetGlobals);

   if(INVALID_HANDLE==handle)
     {
      Alert("Configure the location of the indicator correctly");
      return INIT_FAILED;
     }

   Panel.CrearPanel(handle,M1_,M2_,M3_,M4_,M5_,M6_,M10_,M12_,M15_,M20_,M30_,H1_,H2_,H3_,H4_,H6_,H8_,H12_,D1_,W1_,MN1_,10,10,CORNER_LEFT_UPPER,"PANEL SUP RES2",0,0,150,20,Funcion,candle_signal);
   for(int c=0; c<Panel.Ancho(); c++)
      for(int f=0; f<Panel.Largo(); f++)
        {
         if(f!=0)
            Panel.ColorBg(c,f,(f%2==0?clrBlack:C'31, 31, 31'));
         else
           {
            Panel.ColorBg(c,f,clrDarkOliveGreen);
            Panel.FontTexto(c,f,"Verdana");
            Panel.ColorTexto(c,f,clrGold);
           }
         if(c==0)
           {
            Panel.FontTexto(c,f,"Verdana");
            Panel.ColorTexto(c,f,clrGold);
           }

         /* if(f!=0 && c!=0)
            {
             Panel.ColorTexto(c,f,c%2==0?clrAqua:clrLime);
            }*/
        }



   EventSetMillisecondTimer(1);
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Funcion(int &handle,int columna,int fila,ENUM_TIMEFRAMES tf,string simbolo)
  {
   int atras=3;

   double UP1[];
   ArraySetAsSeries(UP1,true);
   double UP2[];
   ArraySetAsSeries(UP2,true);

   double DN1[];
   ArraySetAsSeries(DN1,true);
   double DN2[];
   ArraySetAsSeries(DN2,true);

   double ForceTipo1[];
   ArraySetAsSeries(ForceTipo1,true);
   double ForceTipo2[];
   ArraySetAsSeries(ForceTipo2,true);

   double high[];
   ArraySetAsSeries(high,true);

   double low[];
   ArraySetAsSeries(low,true);




   if(CopyBuffer(handle,4,0,atras,UP1)<=0)
      return false;

   if(CopyBuffer(handle,5,0,atras,UP2)<=0)
      return false;

   if(CopyBuffer(handle,6,0,atras,DN1)<=0)
      return false;

   if(CopyBuffer(handle,7,0,atras,DN2)<=0)
      return false;

   if(CopyBuffer(handle,8,0,atras,ForceTipo1)<=0)
      return false;

   if(CopyBuffer(handle,9,0,atras,ForceTipo2)<=0)
      return false;

   if(CopyHigh(simbolo,tf,0,atras,high)<=0)
      return false;

   if(CopyLow(simbolo,tf,0,atras,low)<=0)
      return false;
   /* if(RES[0]<=iClose(simbolo,tf,0))
       Panel.Text(columna,fila,"Above Swing High");
    if(SUP[0]>=iClose(simbolo,tf,0))
       Panel.Text(columna,fila,"Below Swing low");
    if(RES[0]>iClose(simbolo,tf,0) && SUP[0]<iClose(simbolo,tf,0))
       Panel.Text(columna,fila,"Between Swing High and Low");
   */
   Panel.Text(columna,fila,"");
   Panel.ColorBg(columna,fila,(fila%2==0?clrBlack:C'31, 31, 31'));

   bool sop=false;
   bool res=false;

   if(UP1[0]!=0 && UP2[0]!=0)
      if( (high[1]<=UP1[0] && high[1]>=UP2[0]) || (high[0]<=UP1[0] && high[0]>=UP2[0]) )
        {
         if(ForceTipo1[0]>=200)
           {
            Panel.ColorBg(columna,fila,clrGreen);
            Panel.Text(columna,fila,DoubleToString(ForceTipo1[0]-200,0));
           }
         else
           {
            Panel.ColorBg(columna,fila,clrRed);
            Panel.Text(columna,fila,DoubleToString(ForceTipo1[0]-100,0));
           }
         sop=true;
        }


   if(DN1[0]!=0 && DN2[0]!=0)
      if( (low[1]<=DN1[0] && low[1]>=DN2[0]) || (low[0]<=DN1[0] && low[0]>=DN2[0]) )
        {
         if(ForceTipo2[0]>=200)
           {
            Panel.ColorBg(columna,fila,clrGreen);
            Panel.Text(columna,fila,DoubleToString(ForceTipo2[0]-200,0));
           }
         else
           {
            Panel.ColorBg(columna,fila,clrRed);
            Panel.Text(columna,fila,DoubleToString(ForceTipo2[0]-100,0));
           }

         res=true;
         //  Panel.Text(columna,fila,"Sell "+IntegerToString(i));
        }

   if(sop && res)
     {
      // Panel.ColorBg(columna,fila,clrPurple);
     }

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Alertas(string simbolo,ENUM_TIMEFRAMES TF,string frase)
  {
   frase=simbolo+" "+StringSubstr(EnumToString(TF),7,-1)+" "+frase;
   if(AlertPC)
      Alert(frase);
   if(AlertMovil)
      SendNotification(simbolo+" "+StringSubstr(EnumToString(TF),7,-1)+" "+frase);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EventKillTimer();
   Panel.OnDeinit_();
   Comment(" ");
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   Panel.OnTimer_();
  }
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // identificador de evento
                  const long& lparam,   // parámetro de evento del tipo long
                  const double& dparam, // parámetro de evento del tipo double
                  const string& sparam  // parámetro de evento del tipo string
                 )
  {
Panel.OnChartEvent_(id,lparam,dparam,sparam);
  }
//+------------------------------------------------------------------+
