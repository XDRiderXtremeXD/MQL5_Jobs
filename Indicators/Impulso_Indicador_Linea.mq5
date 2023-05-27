//+------------------------------------------------------------------+
//|                                      Cambio_Distancia_Barras.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                         Volumen_Color_Barras.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window

#property indicator_buffers 5
#property indicator_plots   3

#property indicator_label1  "Candle Mayor"
#property indicator_type1   DRAW_COLOR_LINE
//--- estableceremos 8 colores para colorear los segmentos (se guardan en un array especial)
#property indicator_color1  clrRed,clrGreen
#property indicator_style1  STYLE_SOLID
#property indicator_width1  3

//--- búfer de valores
double         ColorLineBuffer[];
//--- búfer para almacenar el color del trazado de la línea en cada barra
double         ColorLineColors[];
double         Distancia[];
double         Arrow_UP[];
double         Arrow_DN[];
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
input string S1="========= IMPULSO ========";//=========================================
input int Impulso_Minimo_Velas=2;//Impulso Minimo Velas (minimo 2)
input int Impulso_Maximo_Velas=50;//Impulso Maximo Velas
input double Impulso_Altura_Minima=300;//Impulso Altura Minima (Puntos)
input double Impulso_Altura_Maxima=100000;//Impulso Altura Maxima (Puntos)
input double ToleranciaDesviacion=2.5;//Maxima Desviacion
input string S2="========= CORRECCION ========";//=========================================
input double Correccion_Altura_Minima=0;//Correccion Altura Minima (Puntos)
input double Correccion_Altura_Maxima=200;//Correccion Altura Maxima (Puntos)
input string S3="========= COLOR ========";//=========================================
input color Flecha_UP=clrAqua;
input color Flecha_DN=clrMagenta;

int Barras_Evalua;

int Multiplicador=0;
double ToleranciaDes=0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   int Close=(int)iClose(Symbol(),PERIOD_CURRENT,0);
//Print(Close);
   for(int i=0; i<10; i++)
     {
      Close=int(Close/10.0);
      if(Close==0)
         break;
      Multiplicador++;
     }
//Print(Multiplicador);
   Multiplicador=(int)MathPow(10,Multiplicador);
//Print(Multiplicador);
   ToleranciaDes=ToleranciaDesviacion*Multiplicador;
//Print(ToleranciaDes*Multiplicador);

   Barras_Evalua=Impulso_Minimo_Velas;
   if(Barras_Evalua<2)
      Barras_Evalua=2;

   SetIndexBuffer(0,ColorLineBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,ColorLineColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,Arrow_UP,INDICATOR_DATA);
   SetIndexBuffer(3,Arrow_DN,INDICATOR_DATA);
   SetIndexBuffer(4,Distancia,INDICATOR_CALCULATIONS);
//--- indicator buffers mapping
   ArraySetAsSeries(ColorLineBuffer,false);
   ArraySetAsSeries(ColorLineColors,false);
   ArraySetAsSeries(Distancia,false);
   ArraySetAsSeries(Arrow_UP,false);
   ArraySetAsSeries(Arrow_DN,false);

   PlotIndexSetInteger(1,PLOT_DRAW_TYPE,DRAW_ARROW);
   PlotIndexSetInteger(2,PLOT_DRAW_TYPE,DRAW_ARROW);

   PlotIndexSetInteger(1,PLOT_ARROW,233);
   PlotIndexSetInteger(2,PLOT_ARROW,234);

   PlotIndexSetString(1,PLOT_LABEL,"BUY");
   PlotIndexSetString(2,PLOT_LABEL,"SELL");

   PlotIndexSetInteger(1,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       0,       //  índice del color donde escribiremos el color
                       Flecha_UP);

   PlotIndexSetInteger(2,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       0,       //  índice del color donde escribiremos el color
                       Flecha_DN);

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
   ArraySetAsSeries(high,false);
   ArraySetAsSeries(low,false);
   ArraySetAsSeries(open,false);
   ArraySetAsSeries(close,false);


   for(int i=MathMax(prev_calculated,1); i<rates_total; i++)
     {
      Distancia[i]=MathAbs(close[i]-close[i-1]);
      ColorLineBuffer[i]=EMPTY_VALUE;
      Arrow_UP[i]=EMPTY_VALUE;
      Arrow_DN[i]=EMPTY_VALUE;

      if(close[i]>close[i-1])
         ColorLineColors[i]=1;
      else
         ColorLineColors[i]=0;

      ColorLineBuffer[i]=EMPTY_VALUE;

      if(ColorLineColors[i]!=ColorLineColors[i-1])
        {
         int Barras=1;
         for(int j=i-1; j>=1; j--)
           {
            if(ColorLineColors[i-1]!=ColorLineColors[j])
               break;
            Barras++;
           }


         if(Barras>=Barras_Evalua && Barras<=Impulso_Maximo_Velas)
           {

            double y2=close[i-1];
            double y1=close[i-Barras];
            int Impulso_Distancia=int(MathAbs(y2-y1)/Point());

            if(Impulso_Altura_Maxima>=Impulso_Distancia && Impulso_Distancia>=Impulso_Altura_Minima)
              {

               double m=(y2-y1)/(Barras-1);
               bool dibuja=true;
               int Paso=1;

               if(Barras>2)
                  for(int b=2; b<Barras; b++)
                    {
                     double valor=y1+m*(Paso);
                     double distanciaValor=Paso-valor;

                     ////////////
                     if(MathAbs(distanciaValor)>ToleranciaDes)
                       {
                        dibuja=false;
                        break;
                       }
                     //////////
                     Paso++;
                    }


               if(dibuja)
                 {
                  for(int b=1; b<=Barras; b++)
                     ColorLineBuffer[i-b]=close[i-b];

                  int Retroceso=int(MathAbs(close[i]-open[i])/Point());

                  if(Retroceso>=Correccion_Altura_Minima && Retroceso<=Correccion_Altura_Maxima)
                    {
                     if(ColorLineColors[i]==0)
                        Arrow_DN[i]=high[i];
                     else
                        Arrow_UP[i]=low[i];
                    }
                  //  Comment(y1," ",y2);
                 }
              }
           }

        }

     }
   /*
            Color_HistogramBuffer_Mayor1[i]=open[i];
            Color_HistogramBuffer_Mayor2[i]=high[i];
            Color_HistogramBuffer_Mayor3[i]=low[i];
            Color_HistogramBuffer_Mayor4[i]=close[i];
            Color_HistogramColors_Mayor[i]=RetornarIndiceColor(true,mayor);*/
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
