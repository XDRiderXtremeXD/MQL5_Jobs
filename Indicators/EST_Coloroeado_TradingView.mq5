//+------------------------------------------------------------------+
//|                                               EST_Coloreado.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2011, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
 
#property description "Indicador para demostrar DRAW_FILLING"
#property description "Dibuja en la ventana separada un canal entre dos medias móviles"
#property description "El color del relleno del canal se cambia de forma aleatoria"
#property description "dentro de cada N tics"
 
#property indicator_separate_window


//--- plot Intersection
#property indicator_label1  "SobreCompra/SobreVenta"
#property indicator_type1   DRAW_FILLING
#property indicator_color1  clrRed,clrDarkGreen
#property indicator_width1  4

#property indicator_label2  "Linea_MAIN_Estocastico"
#property indicator_type2   DRAW_LINE
#property indicator_color2  clrLightSeaGreen;
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

#property indicator_label3  "Linea_Signal_Estocastico"
#property indicator_type3   DRAW_LINE
#property indicator_color3  clrOrange;
#property indicator_style3  STYLE_DOT
#property indicator_width3  1

#property indicator_label4  "SobreCompra/SobreVenta"
#property indicator_type4   DRAW_FILLING
#property indicator_color4  clrGold,clrGold
#property indicator_width4  4


#property indicator_minimum 0
#property indicator_maximum 100
 

double         ESTBuffer[];
double         LineaSignalEstocastico[];
//--- búfers indicadores
double         IntersectionBuffer1[];
double         IntersectionBuffer2[];

double         IntersectionBuffer3[];
double         IntersectionBuffer4[];

int Estocastico;

//--- Variables para el EST
input uint PeriodK=5;
input uint PeriodD=3;
input uint PeriodSlowing=3;
input double LevelIndicatorDown=20;
input double LevelIndicatorUp=80;
input ENUM_MA_METHOD Mode_MA=MODE_SMA;
input ENUM_STO_PRICE STO_MODE=STO_LOWHIGH;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,IntersectionBuffer1,INDICATOR_DATA);
   SetIndexBuffer(1,IntersectionBuffer2,INDICATOR_DATA);
   SetIndexBuffer(2,ESTBuffer,INDICATOR_DATA);
   SetIndexBuffer(3,LineaSignalEstocastico,INDICATOR_DATA);
   SetIndexBuffer(4,IntersectionBuffer3,INDICATOR_DATA);
   SetIndexBuffer(5,IntersectionBuffer4,INDICATOR_DATA);
    PlotIndexSetDouble( 0,PLOT_EMPTY_VALUE,150);
    PlotIndexSetDouble( 1,PLOT_EMPTY_VALUE,150);
   
   IndicatorSetInteger(INDICATOR_LEVELS,2);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,0,LevelIndicatorDown);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,1,LevelIndicatorUp);
   
   IndicatorSetInteger(INDICATOR_DIGITS,2);
   
   IndicatorSetString(INDICATOR_SHORTNAME,"P2D RSI");
//---
   Estocastico=iStochastic(Symbol(),PERIOD_CURRENT,PeriodK,PeriodD,PeriodSlowing,Mode_MA,STO_MODE);
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
 
//--- hacemos el primer cálculo del indicador, o los datos han cambiado y se requiere el recálculo total
   if(prev_calculated==0)
     {
      //--- copiamos todos los valores de los indicadores a los búfers correspondientes
      int copied1=CopyBuffer(Estocastico,MAIN_LINE,0,rates_total,ESTBuffer);
      int copied2=CopyBuffer(Estocastico,SIGNAL_LINE,0,rates_total,LineaSignalEstocastico);
     }
   else // llenamos sólo aquellos datos que se han actualizado
     {
      //--- obtendremos la diferencia en barras entre el arranque actual y el anterior OnCalculate()
      int to_copy=rates_total-prev_calculated;
      //--- si no hay diferencia, igualmente copiaremos un valor - en la barra cero
      if(to_copy==0) to_copy=1;
      //--- copiamos to_copy valores al mismísimo final de los búfers indicadores
      int copied1=CopyBuffer(Estocastico,MAIN_LINE,0,to_copy,ESTBuffer);
      int copied2=CopyBuffer(Estocastico,SIGNAL_LINE,0,to_copy,LineaSignalEstocastico);
     }
     
   int start=5;
   if(prev_calculated>0) start=prev_calculated-1;
   for(int i=start; i<rates_total; i++)
     {
      int IndicatorTrend=(ESTBuffer[i]>=LevelIndicatorUp?1:ESTBuffer[i]<=LevelIndicatorDown?-1:0);
      
      if(IndicatorTrend>0)
        {
         IntersectionBuffer1[i]=100;
         IntersectionBuffer2[i]=0;
         IntersectionBuffer3[i]=0;
         IntersectionBuffer4[i]=0;
        }
      //---
      if(IndicatorTrend<0)
        {
         IntersectionBuffer1[i]=0;
         IntersectionBuffer2[i]=100;
         IntersectionBuffer3[i]=0;
         IntersectionBuffer4[i]=0;
        }
      if(IndicatorTrend==0)
        {
         IntersectionBuffer2[i]=0;
         IntersectionBuffer1[i]=0;
         if(ESTBuffer[i-1]<LevelIndicatorDown)  //SI EL INDICADOR RSI ESTA EN SOBRE COMPRA Y SALE DE ESA ZONA
           {
            IntersectionBuffer3[i]=100;
            IntersectionBuffer4[i]=0;
           }
         else if(ESTBuffer[i-1]>LevelIndicatorUp)  // SI EL INDICADOR RSI ESTAN SOBREVENTA Y SALE DE ESA ZONA
           {
            IntersectionBuffer3[i]=0;
            IntersectionBuffer4[i]=100;
           }
         else
           {
            IntersectionBuffer3[i]=0;
            IntersectionBuffer4[i]=0;
           }
        }
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| Cambia los colores del relleno del canal                         |
//+------------------------------------------------------------------+
