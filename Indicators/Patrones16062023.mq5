//+------------------------------------------------------------------+
//|                                                ZeroLagTarzan.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window

#property indicator_buffers 2
#property indicator_plots   2

#property indicator_label1  "SIGNAL SELL"
#property indicator_color1  clrAqua
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2  "SIGNAL BUY"
#property indicator_color2  clrAqua
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

double A_Sell[];
double A_Buy[];

input bool Alert_PC=true;
input bool Alert_Movil=false;
input bool Alert_Mail=false;


bool Patron1[7]= {true,true,false,false,false,true,false};
bool Patron2[6]= {true,true,false,false,true,false};
bool Patron3[5]= {true,true,false,true,false};

datetime TiempoPrueba=D'2023.06.20 00:00';
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   if(TiempoPrueba<TimeCurrent())
     {
      Alert("Tiempo prueba finalizo el dia ",TimeToString(TiempoPrueba,TIME_DATE|TIME_MINUTES));
      return INIT_FAILED;
     }
   Comment("Tiempo prueba hasta el dia ",TimeToString(TiempoPrueba,TIME_DATE|TIME_MINUTES));

   SetIndexBuffer(0,A_Sell,INDICATOR_DATA);
   SetIndexBuffer(1,A_Buy,INDICATOR_DATA);
   PlotIndexSetInteger(0,PLOT_ARROW,234);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetInteger(1,PLOT_ARROW,233);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);
//---
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Comment("");
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
      static bool alerta=true;
      ArrayInitialize(A_Buy,EMPTY_VALUE);
      ArrayInitialize(A_Sell,EMPTY_VALUE);
      if(alerta)
         Alert("Tiempo prueba finalizo el dia ",TimeToString(TiempoPrueba,TIME_DATE|TIME_MINUTES));
      Comment("Tiempo prueba finalizo el dia ",TimeToString(TiempoPrueba,TIME_DATE|TIME_MINUTES));
      alerta=false;
     }


   if(prev_calculated==0)
     {
      ArrayInitialize(A_Buy,EMPTY_VALUE);
      ArrayInitialize(A_Sell,EMPTY_VALUE);
     }


   int Start=MathMax(10,rates_total-(rates_total-prev_calculated));

   for(int shift=Start; shift<rates_total; shift++)
     {
      A_Sell[shift-1]=EMPTY_VALUE;
      A_Buy[shift-1]=EMPTY_VALUE;

      bool buy=false;
      bool sell=false;

      bool Patron1_buy=true;
      bool Patron2_buy=true;
      bool Patron3_buy=true;

      bool Patron1_sell=true;
      bool Patron2_sell=true;
      bool Patron3_sell=true;

      for(int i=0; i<7; i++)
        {
         bool IsBuy=close[shift-1-i]>open[shift-1-i];
         bool IsSell=!IsBuy;

         if(Patron1_buy && i<7 && Patron1[i]!=IsBuy)
            Patron1_buy=false;

         if(Patron2_buy && i<6 && Patron2[i]!=IsBuy)
            Patron2_buy=false;

         if(Patron3_buy && i<5 && Patron3[i]!=IsBuy)
            Patron3_buy=false;

         if(Patron1_sell && i<7 && Patron1[i]!=IsSell)
            Patron1_sell=false;

         if(Patron2_sell && i<6 && Patron2[i]!=IsSell)
            Patron2_sell=false;

         if(Patron3_sell && i<5 && Patron3[i]!=IsSell)
            Patron3_sell=false;
        }

      if(Patron1_buy || Patron2_buy || Patron3_buy)
        {
         A_Buy[shift-1]=low[shift-1];
         if(shift==rates_total-1)
            Alertas("BUY");
        }

      if(Patron1_sell || Patron2_sell || Patron3_sell)
        {
         A_Sell[shift-1]=high[shift-1];
         if(shift==rates_total-1)
            Alertas("SELL");
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
   if(Alert_PC)
      Alert(Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));

   if(Alert_Movil)
      SendNotification(Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));

   if(Alert_Mail)
      SendMail(Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())),Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));
  }
//+------------------------------------------------------------------+
