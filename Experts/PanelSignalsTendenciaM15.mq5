//+------------------------------------------------------------------+
//|                                     PanelSignalsTendenciaM15.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#resource "\\Indicators\\Supertrend3.ex5"

#include <PanelBuffers.mqh>
PanelBuffer Panel;

enum SW
  {
   SW_OFF=0,
   SW_ON=1,
  };

candle candle_signal=close;


input string S1_="-----------------------   SUPERTREND 1 ---------------------";//--------------------------------------------------------------
input bool Filtro_1=true;//Filtro;
input ENUM_TIMEFRAMES PeriodoIndicador1=PERIOD_H2;
input int Length1 = 10;//ATR Period
input double ATR_Multiplier1=3.0;//ATR Multiplier
input string S2_="-----------------------   SUPERTREND 2  ---------------------";//--------------------------------------------------------------
input bool Filtro_2=true;//Filtro;
input ENUM_TIMEFRAMES PeriodoIndicador2=PERIOD_H4;
input int Length2 = 10;//ATR Period
input double ATR_Multiplier2=3.0;//ATR Multiplier
input string S3_="-----------------------   SUPERTREND 3  ---------------------";//--------------------------------------------------------------
input bool Filtro_3=true;//Filtro;
input ENUM_TIMEFRAMES PeriodoIndicador3=PERIOD_H8;
input int Length3 = 10;//ATR Period
input double ATR_Multiplier3=3.0;//ATR Multiplier
input string S11="-----------------------   Filtro MA---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Filter_MA=true;
input int Velas_MA=100;
input int puntos_tolerancia=0;
input int Period_MA=550;
input int Shift_MA=0;
input ENUM_APPLIED_PRICE APP_MA=PRICE_CLOSE;
input ENUM_MA_METHOD MODE_MA=MODE_SMA;
input string S12="-----------------------   Filtro Traspaso---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Filter_Traspaso=true;
input int Velas_sin_traspasar=100;
input int Tolerancia_traspaso=0;
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
   int handle=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\Supertrend3.ex5","",false,false,false,S1_, Filtro_1, PeriodoIndicador1, Length1, ATR_Multiplier1, S2_, Filtro_2, PeriodoIndicador2, Length2, ATR_Multiplier2, S3_, Filtro_3, PeriodoIndicador3, Length3, ATR_Multiplier3, S11, Filter_MA, Velas_MA, puntos_tolerancia, Period_MA, Shift_MA, APP_MA, MODE_MA, S12, Filter_Traspaso, Velas_sin_traspasar, Tolerancia_traspaso);


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
  int atras=25;
  
   double UP[];
   ArraySetAsSeries(UP,true);

   double DN[];
   ArraySetAsSeries(DN,true);

   if(CopyBuffer(handle,1,0,atras,UP)<=0)
      return false;

   if(CopyBuffer(handle,0,0,atras,DN)<=0)
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

   for(int i=1; i<atras; i++)
     {
      if(UP[i]!=EMPTY_VALUE)
        {
         Panel.ColorBg(columna,fila,clrDodgerBlue);
         Panel.Text(columna,fila,"Buy "+IntegerToString(i));
         if(i==1)
            Alertas(simbolo,tf,"Buy");
         break;
        }
      else
         if(DN[i]!=EMPTY_VALUE)
           {
            Panel.ColorBg(columna,fila,clrChocolate);
            Panel.Text(columna,fila,"Sell "+IntegerToString(i));
            if(i==1)
               Alertas(simbolo,tf,"Sell");
                 break;
           }
     }
   ChartRedraw();
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
