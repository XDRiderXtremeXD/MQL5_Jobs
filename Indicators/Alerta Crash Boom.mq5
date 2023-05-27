//+------------------------------------------------------------------+
//|                                            Alerta Crash Boom.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property indicator_chart_window
#property  indicator_buffers 0
#property  indicator_plots 0

input string s71= "============================================ Alertas ============================================";//==========
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;


bool IsCrash=true;

int Tolerancia=0;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(StringFind(Symbol(),"Crash 500",0)!=-1)
     {
      IsCrash=true;
      Tolerancia=100;
     }
   else
      if(StringFind(Symbol(),"Crash 1000",0)!=-1)
        {
         IsCrash=true;
         Tolerancia=1000;
        }
      else
         if(StringFind(Symbol(),"Boom 500",0)!=-1)
           {
            IsCrash=false;
            Tolerancia=100;
           }
         else
            if(StringFind(Symbol(),"Boom 1000",0)!=-1)
              {
               IsCrash=false;
               Tolerancia=1000;
              }
            else
              {
               Alert("Simbolo no es Crash ni boom");
               return INIT_FAILED;
              }

   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
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
   ArraySetAsSeries(close,true);
   ArraySetAsSeries(open,true);
   ArraySetAsSeries(time,true);

   static datetime prev_time=0;

   if(prev_time!=time[0] && Period()==PERIOD_M1)
     {
      if(IsCrash)
        {
         if(close[0]<open[0] && MathAbs(close[0]-open[0])>=Tolerancia*Point())
           {
            Alertas();
            prev_time=time[0];
           }
        }
      else
        {
         if(close[0]>open[0] && MathAbs(close[0]-open[0])>=Tolerancia*Point())
           {
            Alertas();
            prev_time=time[0];
           }
        }
     }

   return rates_total;
  }
//+------------------------------------------------------------------+
void Alertas()
  {
   if(AlertPC)
      Alert("Spike en "+Symbol()+" Periodo "+EnumToString(ENUM_TIMEFRAMES(Period())));
   if(AlertMovil)
      SendNotification("Spike en "+Symbol()+" Periodo "+EnumToString(ENUM_TIMEFRAMES(Period())));
   if(AlertMail)
      SendMail("Spike en "+Symbol()+" Periodo "+EnumToString(ENUM_TIMEFRAMES(Period())),"Spike en "+Symbol()+" Periodo "+EnumToString(ENUM_TIMEFRAMES(Period())));
  }
//+------------------------------------------------------------------+
