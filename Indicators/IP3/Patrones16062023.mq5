//+------------------------------------------------------------------+
//|                                                ZeroLagTarzan.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#resource "\\Indicators\\IP3\\Spartan_Spears.ex5"

#property indicator_buffers 4
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



input string S1="---------- BANDA BOLLINGER ------------";
input int BB_Period=25;
input double BB_Deviation=2;
input int BB_Shift=0;
input ENUM_APPLIED_PRICE BB_AppliedPrice=PRICE_CLOSE;
input string S2="------------- SPARTAN ------------";
input bool aplicar_Filtro=false;
input int Periodo=14;
input string S3="---------- ALERTAS ------------";
input bool Alert_PC=true;
input bool Alert_Movil=false;
input bool Alert_Mail=false;


bool Patron1[7]= {true,true,false,false,false,true,false};
bool Patron2[6]= {true,true,false,false,true,false};
bool Patron3[5]= {true,true,false,true,false};

int BB;
double BB_Middle[];
int spartan;
double SPARTAN[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   BB=iBands(NULL,PERIOD_CURRENT,BB_Period,BB_Shift,BB_Deviation,BB_AppliedPrice);
   spartan=iCustom(NULL,PERIOD_CURRENT,"::Indicators\\IP3\\Spartan_Spears.ex5",Periodo);

   SetIndexBuffer(0,A_Sell,INDICATOR_DATA);
   SetIndexBuffer(1,A_Buy,INDICATOR_DATA);
   SetIndexBuffer(2,BB_Middle,INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,SPARTAN,INDICATOR_CALCULATIONS);

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
//--- check if all data calculated
   if(BarsCalculated(BB)<rates_total)
      return(0);

   if(BarsCalculated(spartan)<rates_total)
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
//--- try to copy
   if(CopyBuffer(BB,0,0,to_copy,BB_Middle)<=0)
      return(0);
   if(CopyBuffer(spartan,0,0,to_copy,SPARTAN)<=0)
      return(0);



   if(prev_calculated==0)
     {
      ArrayInitialize(A_Buy,EMPTY_VALUE);
      ArrayInitialize(A_Sell,EMPTY_VALUE);
     }


   int Start=MathMax(10,rates_total-(rates_total-prev_calculated));

   for(int shift=Start; shift<rates_total; shift++)
     {
      A_Sell[shift]=EMPTY_VALUE;
      A_Buy[shift]=EMPTY_VALUE;

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


      if(close[shift-1]<BB_Middle[shift-1])
         if(!aplicar_Filtro || (SPARTAN[shift-1]>0))
            if(Patron1_buy || Patron2_buy || Patron3_buy)
              {
               A_Buy[shift-1]=low[shift-1];
               if(shift==rates_total-1)
                  Alertas("BUY");
              }

      if(close[shift-1]>BB_Middle[shift-1])
         if(!aplicar_Filtro || (SPARTAN[shift-1]<0))
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
