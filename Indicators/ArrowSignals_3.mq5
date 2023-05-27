//+------------------------------------------------------------------+
//|                                               ArrowSignals_3.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window

#property indicator_buffers 2
#property indicator_plots   2

#property indicator_label1  "DN"
#property indicator_color1  clrBlack
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2  "UP"
#property indicator_color2  clrBlack
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
input int Gap_Arrow=50;
input int Size_Max_Level=100;//Size Max Level (Puntos)
input int Size_Min_Level=50;//Size Min Level (Puntos)
input int Number_Candle_Max=20;//Number Candle Max
input int Number_Candle_Min=10;//Number Candle Min
input string Settings_Alerts="-----------------------Settings ALERTAS-----------------------";
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;

double ArrowSignalUP[];
double ArrowSignalDN[];


//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,ArrowSignalUP);
   SetIndexBuffer(1,ArrowSignalDN);

   PlotIndexSetInteger(0,PLOT_ARROW,108);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(1,PLOT_ARROW,108);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   ArraySetAsSeries(ArrowSignalUP,true);
   ArraySetAsSeries(ArrowSignalDN,true);


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

   ArraySetAsSeries(open,true);
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(close,true);
   ArraySetAsSeries(time,true);

   if(prev_calculated==rates_total)
      return rates_total;

   if(prev_calculated==0)
     {
      ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
     }

   int end=MathMin(rates_total-prev_calculated,rates_total-4);

   double SizeBotton=0;
   double SizeTop=0;
   double SizeBody=0;

////////// RUPTURA DE SOP o RES
   for(int shift=0; shift<end; shift++)
     {
      double Low=low[shift+1];
      double High=high[shift+1];

      bool EntraH=false;
      bool EntraL=false;

      for(int i=2; i<Number_Candle_Max && shift+i<rates_total; i++)
        {
         int DistanciaL=int(MathAbs(low[shift+i]-Low)/Point());

         if(DistanciaL>Size_Max_Level && low[shift+i]<Low)
           {
            EntraL=false;
            break;
           }

         if(DistanciaL>=Size_Min_Level && DistanciaL<=Size_Max_Level)
           {
            EntraL=true;
            if(i<Number_Candle_Min)
               EntraL=false;
            break;
           }
        }

      for(int i=2; i<Number_Candle_Max && shift+i<rates_total; i++)
        {
         int DistanciaH=int(MathAbs(high[shift+i]-High)/Point());

         if(DistanciaH>Size_Max_Level && high[shift+i]>High)
           {
            EntraL=false;
            break;
           }

         if(DistanciaH>=Size_Min_Level && DistanciaH<=Size_Max_Level)
           {
            EntraH=true;
            if(i<Number_Candle_Min)
               EntraH=false;
            break;
           }
        }

      if(EntraH || EntraL)
        {
         if(EntraH)
            ArrowSignalUP[shift+1]=high[shift+1]+Gap_Arrow*Point();

         if(EntraL)
            ArrowSignalDN[shift+1]=low[shift+1]-Gap_Arrow*Point();

         if(shift==0)
           {
            if(EntraH)
               Alertas("Resistencia");
            if(EntraL)
               Alertas("Soporte");
           }

        }
     }
//---

//--- return value of prev_calculated for next call
   return(rates_total);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Alertas(string Frase)
  {

   if(AlertPC)
      Alert(Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
   if(AlertMovil)
      SendNotification(Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
   if(AlertMail)
      SendMail("Signal Personalizrd "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),Frase+" en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
  }
//+------------------------------------------------------------------+
