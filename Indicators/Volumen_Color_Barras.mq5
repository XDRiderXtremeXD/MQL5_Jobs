//+------------------------------------------------------------------+
//|                                         Volumen_Color_Barras.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window

#property indicator_buffers 10
#property indicator_plots   2

#property indicator_label1  "Candle Mayor"
#property indicator_type1   DRAW_COLOR_CANDLES
//--- estableceremos 8 colores para colorear los segmentos (se guardan en un array especial)
#property indicator_color1  clrRed,clrGreen,clrBlue,clrYellow,clrMagenta,clrCyan,clrMediumSeaGreen,clrGold
#property indicator_style1  STYLE_SOLID
#property indicator_width1  3

#property indicator_label2  "Candle Menor"
#property indicator_type2   DRAW_COLOR_CANDLES
//--- estableceremos 8 colores para colorear los segmentos (se guardan en un array especial)
#property indicator_color2  clrRed,clrGreen,clrBlue,clrYellow,clrMagenta,clrCyan,clrMediumSeaGreen,clrGold
#property indicator_style2  STYLE_SOLID
#property indicator_width2  3
//--- búfer de valores
double         Color_HistogramBuffer_Mayor1[];
double         Color_HistogramBuffer_Mayor2[];
double         Color_HistogramBuffer_Mayor3[];
double         Color_HistogramBuffer_Mayor4[];
double         Color_HistogramColors_Mayor[];

double         Color_HistogramBuffer_Menor1[];
double         Color_HistogramBuffer_Menor2[];
double         Color_HistogramBuffer_Menor3[];
double         Color_HistogramBuffer_Menor4[];
double         Color_HistogramColors_Menor[];


enum tipo
  {
   tick=0,
   real=1,
  };

input tipo Tipo_Volumen=tick;
input string colores_mayor="--------------------- COLORES MAYOR---------------------";//---------------------
input bool activar_mayor_0=true;
input int mayor_cantidad_0=1;//Cantidad de barras que supera
input color mayor_color_cantidad_0=clrBlue;
input bool activar_mayor_1=true;
input int mayor_cantidad_1=2;//Cantidad de barras que supera
input color mayor_color_cantidad_1=clrGreen;
input bool activar_mayor_2=true;
input int mayor_cantidad_2=3;//Cantidad de barras que supera
input color mayor_color_cantidad_2=clrMagenta;
input bool activar_mayor_3=true;
input int mayor_cantidad_3=4;//Cantidad de barras que supera
input color mayor_color_cantidad_3=clrYellow;
input bool activar_mayor_4=true;
input int mayor_cantidad_4=5;//Cantidad de barras que supera
input color mayor_color_cantidad_4=clrAqua;
input bool activar_mayor_5=true;
input int mayor_cantidad_5=6;//Cantidad de barras que supera
input color mayor_color_cantidad_5=clrOrange;
input bool activar_mayor_6=true;
input int mayor_cantidad_6=7;//Cantidad de barras que supera
input color mayor_color_cantidad_6=clrRed;
input bool activar_mayor_7=true;
input int mayor_cantidad_7=8;//Cantidad de barras que supera
input color mayor_color_cantidad_7=clrViolet;
input string colores_menor="--------------------- COLORES MENOR---------------------";//---------------------
input bool activar_menor_0=true;
input int menor_cantidad_0=1;//Cantidad de barras que supera
input color menor_color_cantidad_0=clrWhite;
input bool activar_menor_1=true;
input int menor_cantidad_1=2;//Cantidad de barras que supera
input color menor_color_cantidad_1=clrGreenYellow;
input bool activar_menor_2=true;
input int menor_cantidad_2=3;//Cantidad de barras que supera
input color menor_color_cantidad_2=clrBrown;
input bool activar_menor_3=true;
input int menor_cantidad_3=4;//Cantidad de barras que supera
input color menor_color_cantidad_3=clrAquamarine;
input bool activar_menor_4=true;
input int menor_cantidad_4=5;//Cantidad de barras que supera
input color menor_color_cantidad_4=clrAzure;
input bool activar_menor_5=true;
input int menor_cantidad_5=6;//Cantidad de barras que supera
input color menor_color_cantidad_5=clrBisque;
input bool activar_menor_6=true;
input int menor_cantidad_6=7;//Cantidad de barras que supera
input color menor_color_cantidad_6=clrChartreuse;
input bool activar_menor_7=true;
input int menor_cantidad_7=8;//Cantidad de barras que supera
input color menor_color_cantidad_7=clrChocolate;


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   string frase="";
   if(!Comprobar(frase))
     {
      Alert("Las cantidades ",frase," deben de estar en orden ascendente");
      return INIT_PARAMETERS_INCORRECT;
     }


   SetIndexBuffer(0,Color_HistogramBuffer_Mayor1,INDICATOR_DATA);
   SetIndexBuffer(1,Color_HistogramBuffer_Mayor2,INDICATOR_DATA);
   SetIndexBuffer(2,Color_HistogramBuffer_Mayor3,INDICATOR_DATA);
   SetIndexBuffer(3,Color_HistogramBuffer_Mayor4,INDICATOR_DATA);
   SetIndexBuffer(4,Color_HistogramColors_Mayor,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(5,Color_HistogramBuffer_Menor1,INDICATOR_DATA);
   SetIndexBuffer(6,Color_HistogramBuffer_Menor2,INDICATOR_DATA);
   SetIndexBuffer(7,Color_HistogramBuffer_Menor3,INDICATOR_DATA);
   SetIndexBuffer(8,Color_HistogramBuffer_Menor4,INDICATOR_DATA);
   SetIndexBuffer(9,Color_HistogramColors_Menor,INDICATOR_COLOR_INDEX);
//--- indicator buffers mapping
   ArraySetAsSeries(Color_HistogramBuffer_Mayor1,true);
   ArraySetAsSeries(Color_HistogramBuffer_Mayor2,true);
   ArraySetAsSeries(Color_HistogramBuffer_Mayor3,true);
   ArraySetAsSeries(Color_HistogramBuffer_Mayor4,true);
   ArraySetAsSeries(Color_HistogramColors_Mayor,true);
   ArraySetAsSeries(Color_HistogramBuffer_Menor1,true);
   ArraySetAsSeries(Color_HistogramBuffer_Menor2,true);
   ArraySetAsSeries(Color_HistogramBuffer_Menor3,true);
   ArraySetAsSeries(Color_HistogramBuffer_Menor4,true);
   ArraySetAsSeries(Color_HistogramColors_Menor,true);

   for(int i=0; i<18; i++)
     {
      color Color=ObtenerColor(true,i);
      PlotIndexSetInteger(0,                    //  número del estilo gráfico
                          PLOT_LINE_COLOR,      //  identificador de la propiedad
                          i,       //  índice del color donde escribiremos el color
                          Color);

      Color=ObtenerColor(false,i);
      PlotIndexSetInteger(1,                    //  número del estilo gráfico
                          PLOT_LINE_COLOR,      //  identificador de la propiedad
                          i,       //  índice del color donde escribiremos el color
                          Color);
     }

   PlotIndexSetInteger(0,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       8,       //  índice del color donde escribiremos el color
                       clrBlack);

   PlotIndexSetInteger(1,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       8,       //  índice del color donde escribiremos el color
                       clrBlack);
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
   ArraySetAsSeries(tick_volume,true);
   ArraySetAsSeries(time,true);
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(open,true);
   ArraySetAsSeries(close,true);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }

   for(int i=0; i<to_copy; i++)
     {
      Color_HistogramBuffer_Mayor1[i]=EMPTY_VALUE;
      Color_HistogramBuffer_Mayor2[i]=EMPTY_VALUE;
      Color_HistogramBuffer_Mayor3[i]=EMPTY_VALUE;
      Color_HistogramBuffer_Mayor4[i]=EMPTY_VALUE;
      Color_HistogramBuffer_Menor1[i]=EMPTY_VALUE;
      Color_HistogramBuffer_Menor2[i]=EMPTY_VALUE;
      Color_HistogramBuffer_Menor3[i]=EMPTY_VALUE;
      Color_HistogramBuffer_Menor4[i]=EMPTY_VALUE;
      long volumen_actual=Tipo_Volumen==tick?tick_volume[i]:volume[i];

      int menor=0;
      for(int j=1; j<=menor_cantidad_7 && i+j<rates_total; j++)
        {
         long volumen_evaluacion=Tipo_Volumen==tick?tick_volume[i+j]:volume[i+j];
         if(volumen_evaluacion>volumen_actual)
            menor++;
         else
            break;
        }
      int mayor=0;
      for(int j=1; j<=mayor_cantidad_7 && i+j<rates_total; j++)
        {
         long volumen_evaluacion=Tipo_Volumen==tick?tick_volume[i+j]:volume[i+j];
         if(volumen_evaluacion<volumen_actual)
            mayor++;
         else
            break;
        }

      if(mayor>0)
        {
         Color_HistogramBuffer_Mayor1[i]=open[i];
         Color_HistogramBuffer_Mayor2[i]=high[i];
         Color_HistogramBuffer_Mayor3[i]=low[i];
         Color_HistogramBuffer_Mayor4[i]=close[i];
         Color_HistogramColors_Mayor[i]=RetornarIndiceColor(true,mayor);
        }
      if(menor>0)
        {
         Color_HistogramBuffer_Menor1[i]=open[i];
         Color_HistogramBuffer_Menor2[i]=high[i];
         Color_HistogramBuffer_Menor3[i]=low[i];
         Color_HistogramBuffer_Menor4[i]=close[i];
         Color_HistogramColors_Menor[i]=RetornarIndiceColor(false,menor);
        }
      if(mayor>0 && menor>0)
        {
         Print("Entra aca ",time[i]," mayor: ",mayor," menor: ",menor);
        }
     }

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
color ObtenerColor(bool IsMayor,int i)
  {
   if(IsMayor)
     {
      if(i==0)
         return mayor_color_cantidad_0;
      if(i==1)
         return mayor_color_cantidad_1;
      if(i==2)
         return mayor_color_cantidad_2;
      if(i==3)
         return mayor_color_cantidad_3;
      if(i==4)
         return mayor_color_cantidad_4;
      if(i==5)
         return mayor_color_cantidad_5;
      if(i==6)
         return mayor_color_cantidad_6;
      if(i==7)
         return mayor_color_cantidad_7;
     }
   else
     {
      if(i==0)
         return menor_color_cantidad_0;
      if(i==1)
         return menor_color_cantidad_1;
      if(i==2)
         return menor_color_cantidad_2;
      if(i==3)
         return menor_color_cantidad_3;
      if(i==4)
         return menor_color_cantidad_4;
      if(i==5)
         return menor_color_cantidad_5;
      if(i==6)
         return menor_color_cantidad_6;
      if(i==7)
         return menor_color_cantidad_7;
     }
   return clrRed;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int RetornarIndiceColor(int IsMayor,int cantidad)
  {
   int Indice=8;
   if(IsMayor)
     {
      if(activar_mayor_0)
         if(cantidad>=mayor_cantidad_0)
            Indice=0;
      if(activar_mayor_1)
         if(cantidad>=mayor_cantidad_1)
            Indice=1;
      if(activar_mayor_2)
         if(cantidad>=mayor_cantidad_2)
            Indice=2;
      if(activar_mayor_3)
         if(cantidad>=mayor_cantidad_3)
            Indice=3;
      if(activar_mayor_4)
         if(cantidad>=mayor_cantidad_4)
            Indice=4;
      if(activar_mayor_5)
         if(cantidad>=mayor_cantidad_5)
            Indice=5;
      if(activar_mayor_6)
         if(cantidad>=mayor_cantidad_6)
            Indice=6;
      if(activar_mayor_7)
         if(cantidad>=mayor_cantidad_7)
            Indice=7;
     }
   else
     {
      if(activar_menor_0)
         if(cantidad>=menor_cantidad_0)
            Indice=0;
      if(activar_menor_1)
         if(cantidad>=menor_cantidad_1)
            Indice=1;
      if(activar_menor_2)
         if(cantidad>=menor_cantidad_2)
            Indice=2;
      if(activar_menor_3)
         if(cantidad>=menor_cantidad_3)
            Indice=3;
      if(activar_menor_4)
         if(cantidad>=menor_cantidad_4)
            Indice=4;
      if(activar_menor_5)
         if(cantidad>=menor_cantidad_5)
            Indice=5;
      if(activar_menor_6)
         if(cantidad>=menor_cantidad_6)
            Indice=6;
      if(activar_menor_7)
         if(cantidad>=menor_cantidad_7)
            Indice=7;
     }

   if(Indice==8)
      Print("No pinta");
   return Indice;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Comprobar(string Frase)
  {
   int mayores[8]= {mayor_cantidad_0,mayor_cantidad_1,mayor_cantidad_2,mayor_cantidad_3,mayor_cantidad_4,mayor_cantidad_5,mayor_cantidad_6,mayor_cantidad_7};
   int menores[8]= {menor_cantidad_0,menor_cantidad_1,menor_cantidad_2,menor_cantidad_3,menor_cantidad_4,menor_cantidad_5,menor_cantidad_6,menor_cantidad_7};

   bool bool_mayores[8]= {activar_mayor_0,activar_mayor_1,activar_mayor_2,activar_mayor_3,activar_mayor_4,activar_mayor_5,activar_mayor_6,activar_mayor_7};
   bool bool_menores[8]= {activar_menor_0,activar_menor_1,activar_menor_2,activar_menor_3,activar_menor_4,activar_menor_5,activar_menor_6,activar_menor_7};

   int mayor_ultimo=-1;
   int menor_ultimo=-1;

   for(int i=7; i>=0; i--)
     {
      if(mayor_ultimo==-1)
        {
         if(bool_mayores[i])
            mayor_ultimo=mayores[i];
        }
      else
        {
         if(bool_mayores[i])
            if(mayor_ultimo<mayores[i])
              {
               Frase="mayor";
               return false;
              }
        }

      if(menor_ultimo==-1)
        {
         if(bool_menores[i])
            menor_ultimo=menores[i];
        }
      else
        {
         if(bool_menores[i])
            if(menor_ultimo<menores[i])
              {
               Frase="menor";
               return false;
              }
        }
     }

   return true;
  }
//+------------------------------------------------------------------+
