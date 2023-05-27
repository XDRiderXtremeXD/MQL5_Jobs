//+------------------------------------------------------------------+
//|                      Puntos Coincidencia Klinger Divergencia.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 8
#property indicator_plots 6

#property indicator_label1   "FLECHA-SELL"
#property indicator_color1  clrAqua
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2   "FLECHA-BUY"
#property indicator_color2  clrAqua
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

#property indicator_label3   "Klinger-UP"
#property indicator_type3   DRAW_NONE

#property indicator_label4   "Klinger-DN"
#property indicator_type4   DRAW_NONE

#property indicator_label5   "Coincidencia-UP"
#property indicator_type5   DRAW_NONE

#property indicator_label6   "Coincidencia-DN"
#property indicator_type6   DRAW_NONE

double ArrowSignalBuy[];
double ArrowSignalSell[];

double CoincidenciaBUY[];
double CoincidenciaSELL[];

double Klinger_Puntos_UP[];
double Klinger_Puntos_DN[];
double Divergencia_Puntos_UP[];
double Divergencia_Puntos_DN[];

double Klinger_UP[];
double Klinger_DN[];

int Puntos_Klinger,Puntos_Divergencia;



input string Settings_Indicator="***Settings Indicator***";
input int Distancia_Maxima_Trend=100;
input int Distancia_Minima_Trend=10;
input double Valor_Tolerancia_Traspaso_Precio=10; // Valor Tolerancia Traspaso Precio(Puntos)
input double Valor_Tolerancia_Traspaso_Klinger=100; // Valor Tolerancia Traspaso Precio(Puntos)
input bool DibujarDivergencias=true;
input color ColorTrend=clrAqua;
input int GrosorTrend=1;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
input string Settings_Klinger_Oscillator="***Settings_Klinger_Oscillator***";
input uint     InpPeriodFast  =  34;   // Fast period
input uint     InpPeriodSlow  =  55;   // Slow period
input uint     InpPeriodSig   =  13;   // Signal period
input ENUM_APPLIED_VOLUME Force_Volume_Type=VOLUME_TICK;
input string Settings_EMA="***Settings_EMA***";
input int MA_Periodo=3;
input int MA_Shift=0;
input ENUM_MA_METHOD MA_Modo=MODE_SMMA;

input string Settings_Alligator="***Settings_Alligator***";
input int Jaw=13;
input int Jaw_Shift=8;
input int Teeth=8;
input int Teeth_Shift=5;
input int Lips=5;
input int Lips_Shift=3;
input ENUM_MA_METHOD Mode_Alligator=MODE_SMMA;
input ENUM_APPLIED_PRICE AppliedPrice_Alligator=PRICE_MEDIAN;
input string Settings_Bollinger="***Settings_Bollinger_1***";
input int Bollinger_1_Periodo=20;
input int Bollinger_1_Shift=0;
input int Bollinger_1_Desviation=7;

int  CharIndicatorKlinger=-1;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(Distancia_Maxima_Trend<Distancia_Minima_Trend){
   Print("Parametro Distancia Maxima debe ser mayor a Distancia Minima");
   return (INIT_PARAMETERS_INCORRECT);}
   
   PlotIndexSetInteger(0,PLOT_ARROW,164);
   PlotIndexSetInteger(1,PLOT_ARROW,164);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(0,ArrowSignalSell,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalBuy,INDICATOR_DATA);
   SetIndexBuffer(2,Klinger_UP,INDICATOR_DATA);
   SetIndexBuffer(3,Klinger_DN,INDICATOR_DATA);
   SetIndexBuffer(4,CoincidenciaSELL,INDICATOR_DATA);
   SetIndexBuffer(5,CoincidenciaBUY,INDICATOR_DATA);
   SetIndexBuffer(6,Klinger_Puntos_UP,INDICATOR_CALCULATIONS);
   SetIndexBuffer(7,Klinger_Puntos_DN,INDICATOR_CALCULATIONS);

   ArrayInitialize(CoincidenciaBUY,EMPTY_VALUE);
   ArrayInitialize(CoincidenciaSELL,EMPTY_VALUE);
   ArrayInitialize(Klinger_UP,EMPTY_VALUE);
   ArrayInitialize(Klinger_DN,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalBuy,EMPTY_VALUE);
   ArrayInitialize(ArrowSignalSell,EMPTY_VALUE);

   //ArraySetAsSeries(Klinger_Puntos_DN,true);
   //ArraySetAsSeries(Klinger_Puntos_UP,true);
   ArraySetAsSeries(Divergencia_Puntos_DN,true);
   ArraySetAsSeries(Divergencia_Puntos_UP,true);

   Puntos_Klinger=iCustom(Symbol(),PERIOD_CURRENT,"Indicador Klinger Divergencia",Settings_Klinger_Oscillator,
                          InpPeriodFast,InpPeriodSlow,InpPeriodSig,Force_Volume_Type,Settings_EMA,MA_Periodo,MA_Shift,MA_Modo);
   Puntos_Divergencia=iCustom(Symbol(),PERIOD_CURRENT,"Divergencia 3 Indicadores",Settings_Alligator
                              ,Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator,Settings_Bollinger
                              ,Bollinger_1_Periodo,Bollinger_1_Shift,Bollinger_1_Desviation);

   int WindowsTotal=(int)ChartGetInteger(0,CHART_WINDOWS_TOTAL,0);
//Print(WindowsTotal);
   for(int i=0; i<WindowsTotal; i++)
     {
      for(int j=0; j<ChartIndicatorsTotal(0,i); j++)
        {
         string NameIndicator=ChartIndicatorName(0,i,j);
         if(StringFind(NameIndicator,"Klinger_Oscillator",0)!=-1 || StringFind(NameIndicator,"Klinger Oscillator",0)!=-1)
           {
            CharIndicatorKlinger=i;
            break;
           }
        }
     }
     
    PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,Distancia_Maxima_Trend+4);
    PlotIndexSetInteger(1,PLOT_DRAW_BEGIN,Distancia_Maxima_Trend+4);
   /*long WindowsTotal= ChartGetInteger(0,CHART_WINDOWS_TOTAL,0);
   for(int i=0;i<WindowsTotal;i++){
   for(int j=0;j<ChartIndicatorsTotal(0,i);j++)
   if("Indicador CT"==ChartIndicatorName(0,i,j))
   CharIndicator=i;
   }



    ChartIndicatorAdd(0,0,Bollinger_1);*/
//--- indicator buffers mapping

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
   if(BarsCalculated(Puntos_Klinger)<rates_total)
     return(0);
     
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
////// NAIN LINE............
   if(CopyBuffer(Puntos_Klinger,0,0,to_copy,Klinger_Puntos_UP)<=0)
      return(0);
   if(CopyBuffer(Puntos_Klinger,1,0,to_copy,Klinger_Puntos_DN)<=0)
      return(0);
  
  
   static datetime prev_time=0;

   if(prev_time==time[rates_total-1])
      return(rates_total);

   int Start=Distancia_Maxima_Trend+4;
   if(prev_calculated>0)
      Start=rates_total-1-20;
   else
     {
      ArrayInitialize(CoincidenciaBUY,EMPTY_VALUE);
      ArrayInitialize(CoincidenciaSELL,EMPTY_VALUE);
      ArrayInitialize(Klinger_UP,EMPTY_VALUE);
      ArrayInitialize(Klinger_DN,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalSell,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalBuy,EMPTY_VALUE);
     }
   for(int shift=Start ; shift<rates_total; shift++)
     {
      ArrowSignalBuy[shift-1]=EMPTY_VALUE;
      ArrowSignalSell[shift-1]=EMPTY_VALUE;
      ArrowSignalBuy[shift]=EMPTY_VALUE;
      ArrowSignalSell[shift]=EMPTY_VALUE;

      CoincidenciaBUY[shift-2]=EMPTY_VALUE;
      CoincidenciaSELL[shift-2]=EMPTY_VALUE;
      CoincidenciaBUY[shift]=EMPTY_VALUE;
      CoincidenciaSELL[shift]=EMPTY_VALUE;

      Klinger_UP[shift-2]=EMPTY_VALUE;
      Klinger_DN[shift-2]=EMPTY_VALUE;
      Klinger_UP[shift]=EMPTY_VALUE;
      Klinger_DN[shift]=EMPTY_VALUE;
      
      if(CopyBuffer(Puntos_Divergencia,0,rates_total-1-shift,4,Divergencia_Puntos_UP)<=0)
         return(0);
      if(CopyBuffer(Puntos_Divergencia,1,rates_total-1-shift,4,Divergencia_Puntos_DN)<=0)
         return(0);

      if((Klinger_Puntos_UP[shift-2]!=EMPTY_VALUE && Divergencia_Puntos_UP[2]!=EMPTY_VALUE) ||
         (Klinger_Puntos_UP[shift-2]!=EMPTY_VALUE && Divergencia_Puntos_UP[3]!=EMPTY_VALUE) ||
         (Klinger_Puntos_UP[shift-3]!=EMPTY_VALUE && Divergencia_Puntos_UP[2]!=EMPTY_VALUE))
        {
         CoincidenciaSELL[shift-2]=high[shift-2];
         Klinger_UP[shift-2]=Klinger_Puntos_UP[shift-2]!=EMPTY_VALUE?Klinger_Puntos_UP[shift-2]:Klinger_Puntos_UP[shift-3];
        }
      if((Klinger_Puntos_DN[shift-2]!=EMPTY_VALUE && Divergencia_Puntos_DN[2]!=EMPTY_VALUE) ||
         (Klinger_Puntos_DN[shift-2]!=EMPTY_VALUE && Divergencia_Puntos_DN[3]!=EMPTY_VALUE) ||
         (Klinger_Puntos_DN[shift-3]!=EMPTY_VALUE && Divergencia_Puntos_DN[2]!=EMPTY_VALUE))
        {
         CoincidenciaBUY[shift-2]=low[shift-2];
         Klinger_DN[shift-2]=Klinger_Puntos_DN[shift-2]!=EMPTY_VALUE?Klinger_Puntos_DN[shift-2]:Klinger_Puntos_DN[shift-3];
        }


      if(CoincidenciaBUY[shift-2]!=EMPTY_VALUE)
        {
         for(int i=Distancia_Maxima_Trend+3; i>=3+Distancia_Minima_Trend; i--)
           {
            if(CoincidenciaBUY[shift-i]!=EMPTY_VALUE && CoincidenciaBUY[shift-2]<CoincidenciaBUY[shift-i]
               && Klinger_DN[shift-2]>Klinger_DN[shift-i])
              {
               bool Condicion=true;
               double DiferenciaX=i-2;
               double DiferenciaY=low[shift-2]-low[shift-i];
               double Pendiente=DiferenciaY/DiferenciaX;
               int Maximo=i-2-1;

               for(int Indice=1; Indice<=Maximo; Indice++)
                 {
                  double Valor=NormalizeDouble(low[shift-i]+Pendiente*Indice,Digits());
                  if(Valor-Valor_Tolerancia_Traspaso_Precio*Point()>low[shift-i+Indice])
                    {
                     Condicion=false;
                     break;
                    }
                 }
                
               DiferenciaY=Klinger_DN[shift-2]-Klinger_DN[shift-i];
               Pendiente=DiferenciaY/DiferenciaX;
                
                for(int Indice=1; Indice<=Maximo && Condicion==true; Indice++)
                 {
                  double Valor=NormalizeDouble(Klinger_DN[shift-i]+Pendiente*Indice,Digits());
                  if(Valor-Valor_Tolerancia_Traspaso_Klinger*Point()>Klinger_Puntos_DN[shift-i+Indice] && Klinger_Puntos_DN[shift-i+Indice]!=EMPTY_VALUE)
                    {
                     Condicion=false;
                     break;
                    }
                 }

               if(Condicion)
                 {
                  if(DibujarDivergencias==true)
                    {
                     string NombreTrenDivSop="DivSop"+TimeToString(time[shift],TIME_DATE|TIME_MINUTES);
                     if(!ObjectCreate(0,NombreTrenDivSop,OBJ_TREND,0,time[shift-i],low[shift-i],time[shift-2],low[shift-2]))
                        Print("No se creo");
                     else
                       {
                        ObjectSetInteger(0,NombreTrenDivSop,OBJPROP_COLOR,ColorTrend);
                        ObjectSetInteger(0,NombreTrenDivSop,OBJPROP_WIDTH,GrosorTrend);
                       }

                     if(CharIndicatorKlinger!=-1)
                       {
                        string NombreTrenDivSopKlinger="DivSopK"+TimeToString(time[shift],TIME_DATE|TIME_MINUTES);
                        if(!ObjectCreate(0,NombreTrenDivSopKlinger,OBJ_TREND,CharIndicatorKlinger,time[shift-i],Klinger_DN[shift-i],time[shift-2],Klinger_DN[shift-2]))
                           Print("No se creo");
                        else
                          {
                           ObjectSetInteger(0,NombreTrenDivSopKlinger,OBJPROP_COLOR,ColorTrend);
                           ObjectSetInteger(0,NombreTrenDivSopKlinger,OBJPROP_WIDTH,GrosorTrend);
                          }
                       }
                    }
                  ArrowSignalBuy[shift-1]=low[shift-1];
                  break;
                 }
               //Print(TimeToString(time[shift-2],TIME_DATE|TIME_MINUTES));
               //break;
              }
           }
        }

      if(CoincidenciaSELL[shift-2]!=EMPTY_VALUE)
        {
         for(int i=Distancia_Maxima_Trend+3; i>=3+Distancia_Minima_Trend; i--)
           {
            if(CoincidenciaSELL[shift-i]!=EMPTY_VALUE && CoincidenciaSELL[shift-2]>CoincidenciaSELL[shift-i]
               && Klinger_UP[shift-2]<Klinger_UP[shift-i])
              {

               bool Condicion=true;
               double DiferenciaX=i-2;
               double DiferenciaY=high[shift-2]-high[shift-i];
               double Pendiente=DiferenciaY/DiferenciaX;
               int Maximo=i-2-1;
               for(int Indice=1; Indice<=Maximo; Indice++)
                 {
                  double Valor=NormalizeDouble(high[shift-i]+Pendiente*Indice,Digits());
                  if(Valor+Valor_Tolerancia_Traspaso_Precio*Point()<high[shift-i+Indice])
                    {
                     Condicion=false;
                     break;
                    }
                 }
               
               DiferenciaY=Klinger_UP[shift-2]-Klinger_UP[shift-i];
               Pendiente=DiferenciaY/DiferenciaX;
                
                for(int Indice=1; Indice<=Maximo && Condicion==true; Indice++)
                 {
                  double Valor=NormalizeDouble(Klinger_UP[shift-i]+Pendiente*Indice,Digits());
                  if(Valor+Valor_Tolerancia_Traspaso_Klinger*Point()<Klinger_Puntos_UP[shift-i+Indice] && Klinger_Puntos_UP[shift-i+Indice]!=EMPTY_VALUE)
                    {
                     Condicion=false;
                     break;
                    }
                 }
 
               if(Condicion)
                 {
                  if(DibujarDivergencias==true)
                    {
                     string NombreTrenDivRes="DivRes"+TimeToString(time[shift],TIME_DATE|TIME_MINUTES);
                     if(!ObjectCreate(0,NombreTrenDivRes,OBJ_TREND,0,time[shift-i],high[shift-i],time[shift-2],high[shift-2]))
                        Print("No se creo");
                     else
                       {
                        ObjectSetInteger(0,NombreTrenDivRes,OBJPROP_COLOR,ColorTrend);
                        ObjectSetInteger(0,NombreTrenDivRes,OBJPROP_WIDTH,GrosorTrend);
                       }

                     if(CharIndicatorKlinger!=-1)
                       {
                        string NombreTrenDivResKlinger="DivResK"+TimeToString(time[shift],TIME_DATE|TIME_MINUTES);
                        if(!ObjectCreate(0,NombreTrenDivResKlinger,OBJ_TREND,CharIndicatorKlinger,time[shift-i],Klinger_UP[shift-i],time[shift-2],Klinger_UP[shift-2]))
                           Print("No se creo");
                        else
                          {
                           ObjectSetInteger(0,NombreTrenDivResKlinger,OBJPROP_COLOR,ColorTrend);
                           ObjectSetInteger(0,NombreTrenDivResKlinger,OBJPROP_WIDTH,GrosorTrend);
                          }
                       }
                    }
                  /* else
                     {
                      Print("Se creo");
                     }*/
                  ArrowSignalSell[shift-1]=high[shift-1];
                  //Print(TimeToString(time[shift-2],TIME_DATE|TIME_MINUTES));
                  break;
                 }
              }
           }
        }
     }
   prev_time=time[rates_total-1];
   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,-1,OBJ_TREND);
   if(CharIndicatorKlinger!=-1)
      ObjectsDeleteAll(0,CharIndicatorKlinger,OBJ_TREND);
  }
//+------------------------------------------------------------------+
