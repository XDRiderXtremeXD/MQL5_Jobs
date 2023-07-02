//+------------------------------------------------------------------+
//|                                               Detector_Spike.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property description "Este indicador detecta el Spike a traves del traspaso del RSI en los extremos (OB,OS)"
#property description "Para cambiar el codigo del simbolo debe de entrar a la siguiente pagina:"
#property description "(https://www.mql5.com/en/docs/constants/objectconstants/wingdings)"

#property indicator_buffers 3
#property indicator_plots   2

#property indicator_label1  "SELL"
#property indicator_color1  clrAqua
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2  "BUY"
#property indicator_color2  clrAqua
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

input int RSI_Period=8;
input ENUM_APPLIED_PRICE PriceMode=PRICE_CLOSE;
input int NumberoftAlerts=2;
input int OB=70;
input int OS=30;
input int Code_Buy=233;
input int Code_Sell=234;
input color Color_Simbolo=clrYellow;
input string S1="=============== ALERTAS ===================";//===========================
input bool PC=true;
input bool Movil=true;
input bool Mail=false;


int Handle_RSI=0;

double SELL[];
double BUY[];
double RSI[];


bool IsCrash=true;
datetime TiempoPrueba=D'2023.06.10 00:00';
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   if(TiempoPrueba<TimeCurrent())
     {
      Alert("Tiempo prueba finalizado el dia ",TimeToString(TiempoPrueba,TIME_DATE|TIME_MINUTES));
      return INIT_FAILED;
     }
   else
      Comment("Tiempo prueba hasta el dia ",TimeToString(TiempoPrueba,TIME_DATE|TIME_MINUTES));

   Handle_RSI=iRSI(Symbol(),PERIOD_CURRENT,RSI_Period,PriceMode);

   SetIndexBuffer(0,SELL,INDICATOR_DATA);
   PlotIndexSetInteger(0,PLOT_ARROW,Code_Sell);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(1,BUY,INDICATOR_DATA);
   PlotIndexSetInteger(1,PLOT_ARROW,Code_Buy);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(2,RSI,INDICATOR_DATA);

   PlotIndexSetInteger(0,PLOT_LINE_COLOR,Color_Simbolo);
   PlotIndexSetInteger(1,PLOT_LINE_COLOR,Color_Simbolo);

   string Activo=Symbol();

   if(StringFind(Activo,"Boom",0)!=-1)
      IsCrash=false;
   else
      if(StringFind(Activo,"Crash",0)!=-1)
         IsCrash=true;
      else
        {
         Alert("El Activo debe ser un Boom o Crash");
         return INIT_FAILED;
        }

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
   if(TiempoPrueba<TimeCurrent())
     {
      Comment("Tiempo prueba finalizado el dia ",TimeToString(TiempoPrueba,TIME_DATE|TIME_MINUTES));
      ArrayInitialize(BUY,EMPTY_VALUE);
      ArrayInitialize(SELL,EMPTY_VALUE);
      return rates_total;
     }

//--- check if all data calculated
   if(BarsCalculated(Handle_RSI)<rates_total)
      return(0);
//--- we can copy not all data
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      //--- last value is always copied
      to_copy++;
     }

   if(prev_calculated==0)
     {
      ArrayInitialize(BUY,EMPTY_VALUE);
      ArrayInitialize(SELL,EMPTY_VALUE);
     }
//--- try to copy
   if(CopyBuffer(Handle_RSI,0,0,to_copy,RSI)<=0)
      return 0;

   int Start=MathMax(4,rates_total-(rates_total-prev_calculated));

   for(int shift=Start; shift<rates_total; shift++)
     {
      BUY[shift-1]=EMPTY_VALUE;
      SELL[shift-1]=EMPTY_VALUE;

      if(!IsCrash)
        {
         if(RSI[shift-1]<=OS && OS<RSI[shift-2])
           {
            BUY[shift-1]=low[shift-1];
            if(shift==rates_total-1)
               Alertas("Compra");
           }
        }
      else
        {
         if(RSI[shift-1]>=OB && OB>RSI[shift-2])
           {
            SELL[shift-1]=high[shift-1];

            if(shift==rates_total-1)
               Alertas("Venta");
           }
        }
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Alertas(string Frase)
  {
   if(PC)
      Alert(Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));
   if(Movil)
      SendNotification(Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));
   if(Mail)
      SendMail(Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())),Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Comment("");
  }
//+------------------------------------------------------------------+
