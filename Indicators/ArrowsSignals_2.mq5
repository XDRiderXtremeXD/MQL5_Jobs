//+------------------------------------------------------------------+
//|                                                ArrowsSignals.mq5 |
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

input int Gap_Arrow=50;
input int Size_Body_Max=500;
input int Size_Body_Min=200;
input int Size_Wick_Bottom_Max=500;
input int Size_Wick_Bottom_Min=50;
input double Ratio_Wick_Top_Down_Max=100;
input double Ratio_Wick_Top_Down_Min=50;
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

   int end=MathMin(rates_total-prev_calculated,rates_total-1);

   double SizeBotton=0;
   double SizeTop=0;
   double SizeBody=0;

////////// RUPTURA DE SOP o RES
   for(int shift=0; shift<end; shift++)
     {
      SizeBody=MathAbs(close[shift+1]-open[shift+1]);
      double A=close[shift+1]>open[shift+1]?close[shift+1]:open[shift+1];
      double B=close[shift+1]<open[shift+1]?close[shift+1]:open[shift+1];

      SizeTop=high[shift+1]-A;
      SizeBotton=B-low[shift+1];

      if(SizeBody>=Size_Body_Min*Point() && SizeBody<=Size_Body_Max*Point() && SizeBotton>=Size_Wick_Bottom_Min*Point() &&
         SizeBotton<=Size_Wick_Bottom_Max*Point() && (SizeTop<=((100.0+Ratio_Wick_Top_Down_Max)/100.0)*SizeBotton && SizeTop>=((100.0+Ratio_Wick_Top_Down_Min)/100.0)*SizeBotton))
        {
         //   if(!a)
         //  Comment((   ((100.0+Ratio_Wick_Top_Down)/100.0)*SizeBotton)/Point(),"  ",SizeBotton/Point()," ",time[shift+1]," ",SizeTop/Point());

         ArrowSignalDN[shift+1]
            =high[shift+1]+Gap_Arrow*Point();
         if(shift==0)
            Alertas("Alcista");
        }

      SizeBotton=high[shift+1]-A;
      SizeTop=B-low[shift+1];
      if(SizeBody>=Size_Body_Min*Point() && SizeBody<=Size_Body_Max*Point() && SizeBotton>=Size_Wick_Bottom_Min*Point() &&
         SizeBotton<=Size_Wick_Bottom_Max*Point()  && (SizeTop<=((100.0+Ratio_Wick_Top_Down_Max)/100.0)*SizeBotton && SizeTop>=((100.0+Ratio_Wick_Top_Down_Min)/100.0)*SizeBotton))
        {
         // if(!a)
         // Comment((   ((100.0+Ratio_Wick_Top_Down)/100.0)*SizeBotton)/Point(),"  ",SizeBotton/Point()," ",time[shift+1]," ",SizeTop/Point());

         ArrowSignalUP[shift+1]
            =high[shift+1]+Gap_Arrow*Point();
         if(shift==0)
            Alertas("Bajista");
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
