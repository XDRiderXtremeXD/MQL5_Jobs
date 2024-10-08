//+------------------------------------------------------------------+
//|                                                FishIndicator.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"

#property indicator_chart_window
#property indicator_buffers 2
#property indicator_plots   2

#property indicator_label1  "SELL"
#property indicator_color1  clrAqua
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  3

#property indicator_label2  "BUY"
#property indicator_color2  clrAqua
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  3

string label_name="mainwindow_label";

enum Tipo_Signal{
VELA_ABIERTA=0,
VELA_CERRADA=1,
};

input double Nivel_UP=0.20;//Nivel Buy Absoluto
input double Nivel_DN=0.20;//Nivel Sell Absoluto
input uint period=10;//Periodo
input Tipo_Signal TipoSignal=VELA_ABIERTA;//Tipo Señal
input string S2="***Settings Alerts***";//----------------------------------
input bool Alert_PC=true;
input bool Alert_Movil=false;
input string S3="***Settings Indicator Extras***";//----------------------------------
input string NombrePatron="Fish Patron";
input color ColorTextoAlert=clrAqua;

int Fish;
double ArrowSignalUP[];
double ArrowSignalDN[];
double Fisher_Buffer[];
bool CRUCE=false;
bool ALERTAACTIVADA=true;


datetime UNTIL=D'2022.09.29 00:00'; 

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   Fish=iCustom(Symbol(),PERIOD_CURRENT,"fish",period);
   if(Fish==INVALID_HANDLE)
      return(INIT_FAILED);

   IndicatorSetString(INDICATOR_SHORTNAME,"FishPatron");
//172, 115
   PlotIndexSetInteger(0,PLOT_ARROW,234);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetInteger(1,PLOT_ARROW,233);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(0,ArrowSignalUP);
   SetIndexBuffer(1,ArrowSignalDN);

   ArraySetAsSeries(ArrowSignalDN,false);
   ArraySetAsSeries(ArrowSignalUP,false);
   ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);

   ArraySetAsSeries(Fisher_Buffer,true);
   
   if(UNTIL<TimeCurrent())
   {
   Alert("Tiempo de prueba finalizado el dia ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
   return (INIT_FAILED);
   }
   
   Comment("Tiempo de prueba hasta el dia ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));

   return (INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   if(ObjectFind(0,label_name)>=0)
      ObjectDelete(0,label_name);
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
  
  if(UNTIL<TimeCurrent())
   {
   Comment("Tiempo de prueba finalizado el dia ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
   return rates_total;
   }
   
  
  
   static datetime prevtime=0;
   static int shift;
   
   if(prevtime!=Time[rates_total-1])
     {
      if(ObjectFind(0,label_name)>=0)
         ObjectDelete(0,label_name);
      CRUCE=false;
     }

   if(prevtime==Time[rates_total-1] && ALERTAACTIVADA==true)
     {
      if(ObjectFind(0,label_name)<0)
        {
         Print("Generating a label");
         ObjectCreate(0,label_name,OBJ_LABEL,0,0,0);
         ObjectSetInteger(0,label_name,OBJPROP_XDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_YDISTANCE,30);
         ObjectSetInteger(0,label_name,OBJPROP_COLOR,ColorTextoAlert);
         ObjectSetString(0,label_name,OBJPROP_TEXT,"Formandose Patron WhiteTigerATR");
         ObjectSetString(0,label_name,OBJPROP_FONT,"Comic Sans");
         ObjectSetInteger(0,label_name,OBJPROP_FONTSIZE,10);
         ObjectSetInteger(0,label_name,OBJPROP_SELECTABLE,false);
         ChartRedraw(0);
        }
      //return(rates_total);
     }

   prevtime=Time[rates_total-1];

   int START=0;
   
   if(prev_calculated!=0)
      START=rates_total-1;
   else
     {
      START=12;
      ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
     }

   for(shift=START; shift<rates_total; shift++)
     {
      ArrowSignalUP[shift]=EMPTY_VALUE;
      ArrowSignalDN[shift]=EMPTY_VALUE;
      CopyBuffer(Fish,0,rates_total-1-shift,3,Fisher_Buffer);

      bool Condicion=false;
      ALERTAACTIVADA=false;

      if(Fisher_Buffer[TipoSignal]<((-1)*Nivel_DN) && Fisher_Buffer[1+TipoSignal]>0 && Fisher_Buffer[0+TipoSignal]<0)
        {
         Condicion=true;
         ArrowSignalUP[shift+TipoSignal] = High[shift+TipoSignal] ;
        }

      else
         if(Fisher_Buffer[TipoSignal]>Nivel_UP && Fisher_Buffer[1+TipoSignal]<0 && Fisher_Buffer[0+TipoSignal]>0)
           {
            Condicion=true;
            ArrowSignalDN[shift+TipoSignal] = Low[shift+TipoSignal] ;
           }
         else
            CRUCE=false;


      if((shift==rates_total-1) && CRUCE==false && Condicion==true)
        {
         CRUCE=true;
         ALERTAACTIVADA=true;
         if(Alert_PC)
            Alert(Symbol()," ",Period()," ",NombrePatron);
         if(Alert_Movil)
            SendNotification("Formandose Patron en "+NombrePatron+" "+Symbol()+" Temporalidad: "+EnumToString(PERIOD_CURRENT));
        }

     } // End of for loop

   return(rates_total);
  }