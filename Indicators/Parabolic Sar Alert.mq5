//+------------------------------------------------------------------+
//|                                          Parabolic Sar Alert.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window

#property indicator_buffers 1
#property indicator_plots   1
//---- plot MA
#property indicator_label1  "SAR"
#property indicator_type1   DRAW_ARROW
#property indicator_color1  clrLime
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1



enum Modo_Vela
  {
   Vela_Actual=0,
   Vela_Cerrada=1,
  };


input string    S1="--------- CONFIGURACION SAR ----------";
input double     Step=0.02;
input double     Maximum=0.2;
input string    S2="--------- CONFIGURACION Alertas ----------";
input Modo_Vela Modo=Vela_Cerrada;
input bool Alert_PC=true;
input bool Alert_Movil=true;
input bool Alert_Mail=false;

double                   SAR[];
int                      sar_handle;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+

datetime UNTIL=D'2023.02.15 00:00';


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   if(TimeCurrent()>UNTIL)
     {
      Alert("Tiempo prueba finalizado el dia ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
      return INIT_FAILED;
     }

   Comment("Tiempo prueba hasta el dia ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));

   sar_handle=iSAR(Symbol(),PERIOD_CURRENT,Step,Maximum);

   SetIndexBuffer(0,SAR,INDICATOR_DATA);
   ArraySetAsSeries(SAR,true);

   PlotIndexSetInteger(0,PLOT_ARROW,159);

   IndicatorSetString(INDICATOR_SHORTNAME,"SAR("+DoubleToString(Step,4)+" "+DoubleToString(Maximum,4)+")");

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
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);

   if(TimeCurrent()>UNTIL)
     {
      static bool Borra=false;
      Comment("Tiempo prueba finalizado el dia ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
      if(!Borra)
        {
         Alert("Tiempo prueba finalizado el dia ",TimeToString(UNTIL,TIME_DATE|TIME_MINUTES));
         ArrayInitialize(SAR,EMPTY_VALUE);
         Borra=true;
        }
      return rates_total;
     }

//--- check if all data calculated
   if(BarsCalculated(sar_handle)<rates_total)
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
   if(CopyBuffer(sar_handle,0,0,to_copy,SAR)<=0)
      return(0);


   if(Modo==Vela_Cerrada)
     {
      if(prev_calculated<rates_total)
        {
         if(SAR[Modo]>=high[Modo] && SAR[Modo+1]<=low[Modo+1])
            Alertas("Bajista");
         else
            if(SAR[Modo]<=low[Modo] && SAR[Modo+1]>=high[Modo+1])
               Alertas("Alcista");
        }
     }
   else
     {
      static bool Alerta_Sonada=false;
      static datetime TiempoAlerta=0;

      if(prev_calculated<rates_total)
         Alerta_Sonada=false;

      if(TimeLocal()>=TiempoAlerta)
        {
         if(SAR[Modo]>=high[Modo] && SAR[Modo+1]<=low[Modo+1])
           {
            if(!Alerta_Sonada)
               Alertas("Bajista");
            Alerta_Sonada=true;
            TiempoAlerta=TimeLocal()+PeriodSeconds(PERIOD_M1);
           }
         else
            if(SAR[Modo]<=low[Modo] && SAR[Modo+1]>=high[Modo+1])
              {
               if(!Alerta_Sonada)
                  Alertas("Alcista");
               Alerta_Sonada=true;
               TiempoAlerta=TimeLocal()+PeriodSeconds(PERIOD_M1);
              }
            else
               Alerta_Sonada=false;
        }
     }

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Comment(" ");
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Alertas(string Frase)
  {
   if(Alert_PC)
      Alert("Cambio de Tendencia SAR "+Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));
   if(Alert_Movil)
      SendNotification("Cambio de Tendencia SAR "+Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));
   if(Alert_Mail)
      SendMail("CT_SAR"+Frase+"_"+Symbol()+"_"+EnumToString(ENUM_TIMEFRAMES(Period())),"Cambio de Tendencia SAR "+Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));
  }
//+------------------------------------------------------------------+
