//+------------------------------------------------------------------+
//|                                       Panel_Tendencia_Fuerza.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#resource "\\Indicators\\Trend direction and force.ex5"

#include <PanelBuffers.mqh>
PanelBuffer Panel;

enum SW
  {
   SW_OFF=0,
   SW_ON=1,
  };

candle candle_signal=close;


input string S1="========== Trend direction and force ============";//====================================
input int    trendPeriod  = 20;      // Trend period
input double TriggerUp    =  0.05;   // Trigger up level
input double TriggerDown  = -0.05;   // Trigger down level
input double TriggerUpStrength1    =  0.3;   // Trigger up level Middle
input double TriggerDownStrength1  = -0.3;   // Trigger down level Middle
input double TriggerUpStrength2    =  0.6;   // Trigger up level Force
input double TriggerDownStrength2  = -0.6;   // Trigger down level Force
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
double Force[];

bool Funcion(int &handle,int columna,int fila,ENUM_TIMEFRAMES tf,string simbolo);




//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   Comment("NO CAMBIO");

//int handle=iCustom(Symbol(),PERIOD_CURRENT,location_indicator,UserSettings,Line_ON_OFF,Bars_for_fractals,Color_Line);
   int handle=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\Trend direction and force.ex5",trendPeriod,TriggerUp,TriggerDown);

   if(INVALID_HANDLE==handle)
     {
      Alert("Configure the location of the indicator correctly");
      return INIT_FAILED;
     }

   Panel.CrearPanel(handle,M1_,M2_,M3_,M4_,M5_,M6_,M10_,M12_,M15_,M20_,M30_,H1_,H2_,H3_,H4_,H6_,H8_,H12_,D1_,W1_,MN1_,10,10,CORNER_LEFT_UPPER,"PANEL SUP RES",0,0,150,20,Funcion,candle_signal);
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

   ArraySetAsSeries(Force,true);

   EventSetMillisecondTimer(1);
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Funcion(int &handle,int columna,int fila,ENUM_TIMEFRAMES tf,string simbolo)
  {
   if(CopyBuffer(handle,2,0,3,Force)<=0)
      return false;

   /* if(RES[0]<=iClose(simbolo,tf,0))
       Panel.Text(columna,fila,"Above Swing High");
    if(SUP[0]>=iClose(simbolo,tf,0))
       Panel.Text(columna,fila,"Below Swing low");
    if(RES[0]>iClose(simbolo,tf,0) && SUP[0]<iClose(simbolo,tf,0))
       Panel.Text(columna,fila,"Between Swing High and Low");
   */

   Panel.Text(columna,fila,"");
   if(Force[1]>=TriggerUp)
     {
      //Panel.Text(columna,fila,DoubleToString(Force[1],2));
      if(Force[1]>=TriggerUpStrength2)
         Panel.ColorBg(columna,fila, C'0,80,255');
      else
         if(Force[1]>=TriggerUpStrength1)
            Panel.ColorBg(columna,fila,C'0,140,255');
         else
            Panel.ColorBg(columna,fila,C'0,200,255');
      //if(RSI[2]>levelBuy)
      // Alertas(simbolo,tf,"BUY");
     }
   else
      if(Force[1]<=TriggerDown)
        {
         if(Force[1]>=TriggerDownStrength2)
            Panel.ColorBg(columna,fila,C'255,120,0');
         else
            if(Force[1]>=TriggerDownStrength1)
               Panel.ColorBg(columna,fila,C'255,60,0');
            else
               Panel.ColorBg(columna,fila,C'255,0,0');
        }
      else
        {
         //Panel.Text(columna,fila,DoubleToString(Force[1],2));
         Panel.ColorBg(columna,fila,(fila%2==0?clrBlack:C'31, 31, 31'));
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
