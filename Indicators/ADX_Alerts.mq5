//+------------------------------------------------------------------+
//|                                                   ADX_Alerts.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots 1

#property indicator_label1  "ARROW"
#property indicator_color1  clrMagenta
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2



input double nivelADX=25;//Nivel absoluto ADX
input int ADX_Periodo=14;//ADX Periodo
input string flechas="================== FLECHAS ==================";//===========================================
input color colorFlecha=clrAqua;
input uint grosorFlecha=4;
input string Settings_Alerts="================== ALERTAS ==================";//===========================================
input bool Activar_Alertas=true;//Activar Alertas
input bool AlertPC=true;//Alert PC
input bool AlertMovil=true;//Alert Movil

int DefinitionADX;
double Arrows[];
double ADX_Main[];

datetime until=D'2024.08.05 00:00';
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   DefinitionADX=iADX(Symbol(),PERIOD_CURRENT,ADX_Periodo);
   IndicatorSetString(INDICATOR_SHORTNAME,"ADX Alertas");

//172, 115
   SetIndexBuffer(0,Arrows);

   PlotIndexSetInteger(0,PLOT_ARROW,181);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetInteger(0,PLOT_LINE_COLOR,colorFlecha);
   PlotIndexSetInteger(0,PLOT_LINE_WIDTH,grosorFlecha);

   ArrayInitialize(Arrows,EMPTY_VALUE);

   ArraySetAsSeries(ADX_Main,true);
   ArraySetAsSeries(Arrows,false);

   if(until<TimeCurrent())
     {
      Alert("El tiempo prueba termino");
      return INIT_FAILED;
     }

   return(INIT_SUCCEEDED);

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {

  }
//+------------------------------------------------------------------+
//|                                                                  |
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

   if(until<TimeCurrent())
      return rates_total;

   ArraySetAsSeries(Low,false);

   if(BarsCalculated(DefinitionADX)<rates_total)
      return(0);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }

   if(CopyBuffer(DefinitionADX,0,0,MathMax(to_copy,4),ADX_Main)<=0)
      return 0;

   if(prev_calculated==0)
      ArrayInitialize(Arrows,EMPTY_VALUE);


////////// RUPTURA DE SOP o RES
   int start=MathMax(4,rates_total-(to_copy));
   for(int shift=start; shift<rates_total; shift++)
     {
      if(ADX_Main[(rates_total-1)-shift]>=nivelADX && ADX_Main[(rates_total-1)-shift+1]<nivelADX)
        {
         if(shift==rates_total-1 && Arrows[shift]==EMPTY_VALUE)
            Alertas("Linea Main ADX paso el nivel "+DoubleToString(nivelADX));
         Arrows[shift]=Low[shift];
        }
      else
         Arrows[shift]=EMPTY_VALUE;
     }
   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Alertas(string Frase)
  {
   if(AlertPC)
      Alert(Frase," en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
   if(AlertMovil)
      SendNotification(Frase+" en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
