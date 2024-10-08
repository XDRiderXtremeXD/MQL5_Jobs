//+------------------------------------------------------------------+
//|                                          Mi Indicador Angelo.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 4
#property indicator_plots   4

#property indicator_label1  "SELL"
#property indicator_color1  clrRed
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2  "BUY"
#property indicator_color2  clrGreen
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

#property indicator_label3  "SELLCONFIRMACION"
#property indicator_color3  clrMagenta
#property indicator_type3   DRAW_ARROW
#property indicator_style3  STYLE_SOLID
#property indicator_width3  2

#property indicator_label4  "BUYCONFIRMACION"
#property indicator_color4  clrAqua
#property indicator_type4   DRAW_ARROW
#property indicator_style4  STYLE_SOLID
#property indicator_width4  2

int Estocastico;
int Momentun;

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12am=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

enum Modos
  {
   Solo_High_Low=0,
   Solo_Close_Close=1,
   Ambos=2,
  };


input Modos STO_Price=Ambos;
input int Velas_Confirmacion=6;
input ENUM_Horas  Hora_Inicio=_8am;
input ENUM_Horas Hora_Final=_10pm;
input double Nivel_Maximo=100.10;
input double Nivel_Minimo=99.90;
double Tolerancia=100;
input string S0="-----------------------   Configuracion Estocastico ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int K_Periodo=5;
input int D_Periodo=3;
input int Slowing=3;
input ENUM_MA_METHOD Ma_Method_EST=MODE_SMA;
input string S1="-----------------------   Configuracion Momentun ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Momentun_Periodo=7;
input ENUM_APPLIED_PRICE Momentun_Applied_Price=PRICE_CLOSE;

input string Settings_Alerts="***Settings_Alerts***";
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;

double ArrowSignalUP[];
double ArrowSignalDN[];
double ArrowSignalUP_Confirmacion[];
double ArrowSignalDN_Confirmacion[];

double Estocastico_Buffer[];
double Estocastico_Signal_Buffer[];
double Estocastico2_Buffer[];
double Estocastico2_Signal_Buffer[];
double Momentun_Buffer[];

string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
int VALORVELASOPUESTAS=0;
bool UseExtraDigit=false;
int Text_VelasOpuestas=10;

datetime Buy_Tiempo=0;
datetime Sell_Tiempo=0;
color COLORVO=clrAqua;

int ShiftEvaluaBuy=0;
int ShiftEvaluaSell=0;

int ShiftHigh=0;
int ShiftLow=0;

MqlRates Rates[];

double HigthBuy=0;
double LowSell=0;

int Estocastico2=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   Estocastico=iStochastic(Symbol(),PERIOD_CURRENT,K_Periodo,D_Periodo,Slowing,Ma_Method_EST,STO_LOWHIGH);
   Estocastico2=iStochastic(Symbol(),PERIOD_CURRENT,K_Periodo,D_Periodo,Slowing,Ma_Method_EST,STO_CLOSECLOSE);
   Momentun=iMomentum(Symbol(),PERIOD_CURRENT,Momentun_Periodo,Momentun_Applied_Price);

   ArraySetAsSeries(Estocastico_Buffer,true);
   ArraySetAsSeries(Estocastico_Signal_Buffer,true);
   ArraySetAsSeries(Estocastico2_Buffer,true);
   ArraySetAsSeries(Estocastico2_Signal_Buffer,true);
   ArraySetAsSeries(Momentun_Buffer,true);

   IndicatorSetString(INDICATOR_SHORTNAME,"Indicador Estrellas EMA");
//172, 115
   SetIndexBuffer(0,ArrowSignalUP);
   SetIndexBuffer(1,ArrowSignalDN);

   PlotIndexSetInteger(0,PLOT_ARROW,108);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(1,PLOT_ARROW,108);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(2,ArrowSignalUP_Confirmacion);
   SetIndexBuffer(3,ArrowSignalDN_Confirmacion);

   PlotIndexSetInteger(2,PLOT_ARROW,234);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(3,PLOT_ARROW,233);
   PlotIndexSetDouble(3,PLOT_EMPTY_VALUE,EMPTY_VALUE);

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
   static datetime prevTime=0;
   if(prevTime==time[rates_total-1])
      return(rates_total);

   int Start=100;
   if(prev_calculated==0)
     {
      Start=100;
      ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalDN_Confirmacion,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalUP_Confirmacion,EMPTY_VALUE);
     }
   else
      Start=rates_total-1;

   for(int shift=Start; shift<rates_total; shift++)
     {

      if(!EvaluaHorario(Hora_Inicio,Hora_Final,time[shift]))
         continue;
      ArrowSignalUP[shift]=EMPTY_VALUE;
      ArrowSignalDN[shift]=EMPTY_VALUE;
      ArrowSignalDN_Confirmacion[shift]=EMPTY_VALUE;
      ArrowSignalUP_Confirmacion[shift]=EMPTY_VALUE;

      if(shift<ShiftLow && ShiftLow!=0 && LowSell!=0 && close[shift-1]<LowSell)
        {
         ArrowSignalUP_Confirmacion[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
         if(shift==rates_total-1)
           {
            if(AlertPC)
               Alert("Operacion Sell Confirmacion en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
            if(AlertMovil)
               SendNotification("Operacion Sell Confirmacion en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
            if(AlertMail)
               SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Sell Confirmacion en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
           }
         LowSell=0;
         ShiftLow=0;
        }
      if(shift<ShiftHigh && ShiftHigh!=0 && HigthBuy!=0 && close[shift-1]>HigthBuy)
        {
         ArrowSignalDN_Confirmacion[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
         if(shift==rates_total-1)
           {
            if(AlertPC)
               Alert("Operacion Buy Confirmacion en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
            if(AlertMovil)
               SendNotification("Operacion Buy Confirmacion en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
            if(AlertMail)
               SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Buy Confirmacion en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
           }
         HigthBuy=0;
         ShiftHigh=0;
        }


      int CumOffset=0;
      ArrayResize(Rates,10);
      int copied=CopyRates(Symbol(),PERIOD_CURRENT,rates_total-1-shift,8,Rates);

      CopyBuffer(Estocastico,0,rates_total-shift-1,3,Estocastico_Buffer);
      CopyBuffer(Estocastico,1,rates_total-shift-1,3,Estocastico_Signal_Buffer);
      CopyBuffer(Estocastico2,0,rates_total-shift-1,3,Estocastico2_Buffer);
      CopyBuffer(Estocastico2,1,rates_total-shift-1,3,Estocastico2_Signal_Buffer);
      CopyBuffer(Momentun,0,rates_total-shift-1,3,Momentun_Buffer);

      ResetLastError();

      if(((Momentun_Buffer[1]<Nivel_Minimo && Momentun_Buffer[1]>=Nivel_Minimo-Tolerancia) || (Momentun_Buffer[2]<Nivel_Minimo && Momentun_Buffer[2]>=Nivel_Minimo-Tolerancia)) 
       &&  (((STO_Price==Solo_High_Low || STO_Price==Ambos) && Estocastico_Buffer[2]<Estocastico_Signal_Buffer[2] && Estocastico_Buffer[1]>Estocastico_Signal_Buffer[1]) || 
       (((STO_Price==Solo_Close_Close || STO_Price==Ambos) && Estocastico2_Buffer[2]<Estocastico2_Signal_Buffer[2] && Estocastico2_Buffer[1]>Estocastico2_Signal_Buffer[1])))
         && close[shift-1]>open[shift-1])
        {
         if(close[shift-1]>(close[shift-2]>open[shift-2]?close[shift-2]:open[shift-2]))
           {
            HigthBuy=high[shift-1];
            ShiftHigh=shift+Velas_Confirmacion;
            ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
            if(shift==rates_total-1)
              {
               if(AlertPC)
                  Alert("Operacion Buy en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
               if(AlertMovil)
                  SendNotification("Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
               if(AlertMail)
                  SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
              }
           }
         else
            ShiftEvaluaBuy=shift+1;
        }

      if(((Momentun_Buffer[1]>Nivel_Maximo && Momentun_Buffer[1]<=Nivel_Maximo+Tolerancia) || (Momentun_Buffer[2]>Nivel_Maximo && Momentun_Buffer[2]<=Nivel_Maximo+Tolerancia)) 
       &&  (((STO_Price==Solo_High_Low || STO_Price==Ambos) && Estocastico_Buffer[2]>Estocastico_Signal_Buffer[2] && Estocastico_Buffer[1]<Estocastico_Signal_Buffer[1]) || 
       (((STO_Price==Solo_Close_Close || STO_Price==Ambos) && Estocastico2_Buffer[2]>Estocastico2_Signal_Buffer[2] && Estocastico2_Buffer[1]<Estocastico2_Signal_Buffer[1])))
         && close[shift-1]<open[shift-1])
        {
         if(close[shift-1]<(close[shift-2]<open[shift-2]?close[shift-2]:open[shift-2]))
           {
            LowSell=low[shift-1];
            ShiftLow=shift+Velas_Confirmacion;
            ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
            if(shift==rates_total-1)
              {
               if(AlertPC)
                  Alert("Operacion Sell en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
               if(AlertMovil)
                  SendNotification("Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
               if(AlertMail)
                  SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
              }
           }
         else
            ShiftEvaluaSell=shift+1;
        }

      if(ShiftEvaluaBuy!=0 && shift==ShiftEvaluaBuy)
        {
         if(close[shift-1]>(close[shift-3]>open[shift-3]?close[shift-3]:open[shift-3]))
           {
            HigthBuy=high[shift-1];
            ShiftHigh=shift+Velas_Confirmacion;
            ArrowSignalDN[shift-1] = low[shift-1] - (Pointer_Offset*_Point);
            if(shift==rates_total-1)
              {
               if(AlertPC)
                  Alert("Operacion Buy en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
               if(AlertMovil)
                  SendNotification("Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
               if(AlertMail)
                  SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
              }
           }
         ShiftEvaluaBuy=0;
        }
      if(ShiftEvaluaSell!=0 && shift==ShiftEvaluaSell)
        {
         if(close[shift-1]<(close[shift-3]<open[shift-3]?close[shift-3]:open[shift-3]))
           {
            LowSell=low[shift-1];
            ShiftLow=shift+Velas_Confirmacion;
            ArrowSignalUP[shift-1] = high[shift-1] + (Pointer_Offset*_Point);
            if(shift==rates_total-1)
              {
               if(AlertPC)
                  Alert("Operacion Sell en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
               if(AlertMovil)
                  SendNotification("Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
               if(AlertMail)
                  SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
              }
           }
         ShiftEvaluaSell=0;
        }
     }


   prevTime=time[rates_total-1];
//--- return value of prev_calculated for next call
   return(rates_total);
  }

//+------------------------------------------------------------------+
//|                                                                  |
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
//|                                                                  |
//+------------------------------------------------------------------+
string GetName(string aName,datetime timeshift)
  {
   return(aName + DoubleToString(timeshift, 0));
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,0,OBJ_TEXT);
   Comment("");
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluaHorario(int Apertura,int Cierre,datetime Tiempo)
  {
   MqlDateTime TiempoMql;
   TimeToStruct(Tiempo,TiempoMql);

   bool EntraHorario=false;
   if(Apertura>Cierre && (TiempoMql.hour>=Apertura || TiempoMql.hour<Cierre))
      EntraHorario=true;
   else
      if(Apertura<Cierre && TiempoMql.hour>=Apertura && TiempoMql.hour<Cierre)
         EntraHorario=true;

   return EntraHorario;
  }
//+------------------------------------------------------------------+
