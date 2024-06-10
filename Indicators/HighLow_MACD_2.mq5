//+------------------------------------------------------------------+
//|                                               HighLow_MACD_2.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 4
#property indicator_plots   4

#property indicator_label1  "BUY"
#property indicator_type1   DRAW_ARROW
#property indicator_color1  clrMagenta
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2  "SELL"
#property indicator_type2   DRAW_ARROW
#property indicator_color2  clrMagenta
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

#property indicator_label3  "SALIDA BUY"
#property indicator_type3   DRAW_ARROW
#property indicator_color3  clrMagenta
#property indicator_style3  STYLE_SOLID
#property indicator_width3  1

#property indicator_label4  "SALIDA SELL"
#property indicator_type4   DRAW_ARROW
#property indicator_color4  clrMagenta
#property indicator_style4  STYLE_SOLID
#property indicator_width4  1

#resource "\\Indicators\\MACD_colores.ex5"
#resource "\\Indicators\\High_Low_Diario.ex5"

enum ENUM_Horas
  {
   _0am = 0,   //:  0 am
   _1am = 1,   //:  1 am
   _2am = 2,   //:  2 am
   _3am = 3,   //:  3 am
   _4am = 4,   //:  4 am
   _5am = 5,   //:  5 am
   _6am = 6,   //:  6 am
   _7am = 7,   //:  7 am
   _8am = 8,   //:  8 am
   _9am = 9,   //:  9 am
   _10am = 10, //: 10 am
   _11am = 11, //: 11 am
   _12pm = 12, //: 12 pm
   _1pm = 13,  //:  1 pm
   _2pm = 14,  //:  2 pm
   _3pm = 15,  //:  3 pm
   _4pm = 16,  //:  4 pm
   _5pm = 17,  //:  5 pm
   _6pm = 18,  //:  6 pm
   _7pm = 19,  //:  7 pm
   _8pm = 20,  //:  8 pm
   _9pm = 21,  //:  9 pm
   _10pm = 22, //:  10 pm
   _11pm = 23, //:  11 pm
  };


input int Barras_Evaluacion=20;
input string S1="========== Configuracion High Low Line ==========";//==========================================================================================
input ENUM_Horas HoraStart=16;
input string S2="========== Configuracion MACD ==========";//==========================================================================================
input int Ema_Rapida=120;//EMA Rapida
input int Ema_Lenta=240;//EMA Lenta
input int MediaMovilExponencial=18;//Periodo Media Movil Exponencial
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;

int macd_handle=0;
int HL_handle=0;
//BUFFERS
double MACD_VALOR[];
double MACD_COLOR[];

double HIGH[];
double LOW[];

double SALIDA_BUY[];
double SALIDA_SELL[];

double BUY[];
double SELL[];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(!SetHandleMACD())
      return INIT_PARAMETERS_INCORRECT;
   if(!SetHandleHIGHLOWLINE())
      return INIT_PARAMETERS_INCORRECT;
//--- indicator buffers mapping

   SetIndexBuffer(0,BUY,INDICATOR_DATA);
   SetIndexBuffer(1,SELL,INDICATOR_DATA);
   SetIndexBuffer(2,SALIDA_BUY,INDICATOR_DATA);
   SetIndexBuffer(3,SALIDA_SELL,INDICATOR_DATA);

   ArraySetAsSeries(BUY,true);
   ArraySetAsSeries(SELL,true);

   PlotIndexSetInteger(0,PLOT_ARROW,233);
   PlotIndexSetInteger(1,PLOT_ARROW,234);
   PlotIndexSetInteger(2,PLOT_ARROW,169);
   PlotIndexSetInteger(3,PLOT_ARROW,169);

   ArraySetAsSeries(MACD_VALOR,true);
   ArraySetAsSeries(MACD_COLOR,true);
   ArraySetAsSeries(SALIDA_BUY,true);
   ArraySetAsSeries(SALIDA_SELL,true);


   ArraySetAsSeries(HIGH,true);
   ArraySetAsSeries(LOW,true);
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
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(time,true);
//---
   if(prev_calculated>rates_total || prev_calculated<=0)
     {
      ArrayInitialize(SELL,EMPTY_VALUE);
      ArrayInitialize(BUY,EMPTY_VALUE);
     }

   int to_copy=BarrasFaltanIterar(prev_calculated,rates_total);

   if(!SetValuesIndicatorsAuxiliares(to_copy,rates_total))
      return 0;

   for(int shift=MathMin(rates_total-Barras_Evaluacion-2,to_copy-1); shift>=0; shift--)
     {
      SELL[shift]=EMPTY_VALUE;
      BUY[shift]=EMPTY_VALUE;

      bool EsCompra=false;
      if(CondicionEntrada(EsCompra,shift,high,low))
        {
         if(EsCompra)
            BUY[shift]=low[shift];
         else
            SELL[shift]=high[shift];
        }

      if(CondicionSalida(EsCompra,shift,high,low))
        {
         if(EsCompra)
            BUY[shift]=low[shift];
         else
            SELL[shift]=high[shift];
        }
     }

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
bool SetHandleMACD()
  {
   macd_handle=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\MACD_colores","",Ema_Rapida,Ema_Lenta,MediaMovilExponencial,Applied_Price_MACD);
   if(INVALID_HANDLE==macd_handle)
     {
      Alert("ERROR en el indicador MACD ",GetLastError());
      return false;
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetHandleHIGHLOWLINE()
  {
   HL_handle=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\High_Low_Diario",HoraStart);
   if(INVALID_HANDLE==HL_handle)
     {
      Alert("ERROR en el indicador High Low ",GetLastError());
      return false;
     }
   return true;
  }
//+------------------------------------------------------------------+
int BarrasFaltanIterar(int prev_calculated,int rates_total)
  {
   int to_copy=0;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
      //--- last value is always copied
     }
   return to_copy;
  }
//+------------------------------------------------------------------+
bool SetValuesIndicatorsAuxiliares(int toCopy,int rates_total)
  {
   toCopy=MathMin(rates_total,toCopy+3);

   int toCopy2=MathMin(rates_total,toCopy+Barras_Evaluacion+1);
//--- check if all data calculated
   if(BarsCalculated(macd_handle)<rates_total)
      return(false);
//--- we can copy not all data
//--- try to copy
   if(CopyBuffer(macd_handle,0,0,toCopy,MACD_VALOR)<=0)
      return(false);
   if(CopyBuffer(macd_handle,1,0,toCopy,MACD_COLOR)<=0)
      return(false);
   if(CopyBuffer(HL_handle,0,0,toCopy2,HIGH)<=0)
      return(false);
   if(CopyBuffer(HL_handle,1,0,toCopy2,LOW)<=0)
      return(false);

   return true;
  }
//+------------------------------------------------------------------+
bool CondicionEntrada(bool &EsCompra,int shift,double const &High[],double const &Low[])
  {
   if(MACD_COLOR[shift+1]==0 && MACD_COLOR[shift+2]==1)
     {
      for(int i=2;i<Barras_Evaluacion;i++)
         if(HIGH[shift+i]>HIGH[shift+i+1])
           {
            EsCompra=false;
            return true;
           }
     }
   if(MACD_COLOR[shift+1]==1 && MACD_COLOR[shift+2]==0)
     {
      for(int i=2;i<Barras_Evaluacion;i++)
         if(LOW[shift+i]<LOW[shift+i+1])
           {
            EsCompra=true;
            return true;
           }
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CondicionEntrada(bool &EsCompra,int shift,double const &High[],double const &Low[])
  {
   if(MACD_COLOR[shift+1]==0 && MACD_COLOR[shift+2]==1)
     {
      for(int i=2;i<Barras_Evaluacion;i++)
         if(HIGH[shift+i]>HIGH[shift+i+1])
           {
            EsCompra=false;
            return true;
           }
     }
   if(MACD_COLOR[shift+1]==1 && MACD_COLOR[shift+2]==0)
     {
      for(int i=2;i<Barras_Evaluacion;i++)
         if(LOW[shift+i]<LOW[shift+i+1])
           {
            EsCompra=true;
            return true;
           }
     }
   return false;
  }
//+------------------------------------------------------------------+
