//+------------------------------------------------------------------+
//|                                                 Tres Moviles.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 7
#property indicator_plots   1
//--- plot ColorLine
#property indicator_label1  "Line Promedio"
#property indicator_type1   DRAW_COLOR_SECTION
//--- estableceremos 5 colores para colorear cada barra (se almacenan en un array especial)
#property indicator_color1  clrLime,clrMagenta,clrNONE // (se puede especificar hasta 64 colores) 
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1


input int Cercania_Traspaso=0;//Puntos cercania de Traspaso
input double Desfase=100;//Divisor (Suma Resta)
input bool VerSalto=true;//Ver Salto
input string S5="-----------------------   Configuracion Medias Moviles  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo=21;//Base_Periodo
input int Ma_Shift=0;//Base_Shift
input ENUM_MA_METHOD Ma_Method=MODE_EMA;//Base Method
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;//Base Applied Prive
input string S8="-----------------------   Configuracion SAR ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input double SAR_Step=0.02;//Onda A
input double SAR_Maximun=0.2;//Onda B
input string S9="-----------------------   Configuracion Color ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input color Color_Promedio_Alcista=clrLime;
input color Color_Promedio_Bajista=clrMagenta;

double         Promedio_Buffer[];
double         Promedio_Buffer_Color[];
double         UP_Buffer[];
double         MIDDLE_Buffer[];
double         DOWN_Buffer[];
double         SAR_Buffer[];
double         MA_Buffer[];


int Handle_MA=0;
int Handle_SAR=0;

bool Alcista=true;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   Alcista=true;

   Handle_MA=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo,Ma_Shift,Ma_Method,Ma_AppliedPrice);
   Handle_SAR=iSAR(Symbol(),PERIOD_CURRENT,SAR_Step,SAR_Maximun);
//--- vinculación del array con el búfer indicador
   SetIndexBuffer(0,Promedio_Buffer,INDICATOR_DATA);
   SetIndexBuffer(1,Promedio_Buffer_Color,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,UP_Buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,MIDDLE_Buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(4,DOWN_Buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,SAR_Buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(6,MA_Buffer,INDICATOR_CALCULATIONS);
//--- inicialización del generador de números pseudoaleatorios
   ArraySetAsSeries(Promedio_Buffer,false);
   ArraySetAsSeries(Promedio_Buffer_Color,false);
   ArraySetAsSeries(UP_Buffer,false);
   ArraySetAsSeries(MIDDLE_Buffer,false);
   ArraySetAsSeries(DOWN_Buffer,false);
   ArraySetAsSeries(SAR_Buffer,false);
   ArraySetAsSeries(MA_Buffer,false);


   PlotIndexSetInteger(0,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       0,       //  índice del color donde escribiremos el color
                       Color_Promedio_Alcista);
   PlotIndexSetInteger(0,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       1,       //  índice del color donde escribiremos el color
                       Color_Promedio_Bajista);

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

   ArraySetAsSeries(close,false);

   if(BarsCalculated(Handle_MA)<rates_total)
      return(0);

   if(BarsCalculated(Handle_SAR)<rates_total)
      return(0);

   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
////// o SIGNAL_LINE............
   if(CopyBuffer(Handle_MA,0,0,to_copy,MA_Buffer)<=0)
      return(0);
   if(CopyBuffer(Handle_SAR,0,0,to_copy,SAR_Buffer)<=0)
      return 0;

   ArraySetAsSeries(time,false);
   ArraySetAsSeries(high,false);
   ArraySetAsSeries(low,false);
   ArraySetAsSeries(close,false);
   ArraySetAsSeries(open,false);

   if(prev_calculated==0)
     {
      ArrayInitialize(UP_Buffer,EMPTY_VALUE);
      ArrayInitialize(MIDDLE_Buffer,EMPTY_VALUE);
      ArrayInitialize(DOWN_Buffer,EMPTY_VALUE);
      ArrayInitialize(Promedio_Buffer,EMPTY_VALUE);
     }

   if(prev_calculated==rates_total)
      return rates_total;


   int start=MathMax(rates_total-to_copy,4);

////////// RUPTURA DE SOP o RES
   for(int shift=start; shift<rates_total; shift++)
     {
      UP_Buffer[shift]=EMPTY_VALUE;
      UP_Buffer[shift-1]=EMPTY_VALUE;
      MIDDLE_Buffer[shift]=EMPTY_VALUE;
      MIDDLE_Buffer[shift-1]=EMPTY_VALUE;
      DOWN_Buffer[shift]=EMPTY_VALUE;
      DOWN_Buffer[shift-1]=EMPTY_VALUE;
      Promedio_Buffer[shift]=EMPTY_VALUE;
      Promedio_Buffer[shift-1]=EMPTY_VALUE;


      if(SAR_Buffer[shift-1]>=high[shift-1] && SAR_Buffer[shift-2]>=high[shift-2])
         if((SAR_Buffer[shift-1]-Cercania_Traspaso*Point())<MA_Buffer[shift-1] && SAR_Buffer[shift-2]>=MA_Buffer[shift-2])
            Alcista=false;

      if(SAR_Buffer[shift-1]<=low[shift-1] && SAR_Buffer[shift-2]<=low[shift-2])
         if((SAR_Buffer[shift-1]+Cercania_Traspaso*Point())>MA_Buffer[shift-1] && SAR_Buffer[shift-2]<=MA_Buffer[shift-2])
            Alcista=true;


      if(SAR_Buffer[shift-1]>=high[shift-1] && SAR_Buffer[shift-2]<=low[shift-2])
        {
         bool IsA=false;
         int IndiceUltimo=0;
         for(int i=2; i<100 && shift-i-1>=0; i++)
           {
            if(SAR_Buffer[shift-i-1]>=high[shift-i-1])
              {
               IndiceUltimo=i;
               break;
              }

            if(SAR_Buffer[shift-i]>=MA_Buffer[shift-i] && SAR_Buffer[shift-i-1]<=MA_Buffer[shift-i-1])
              {
               IsA=true;
               break;
              }
           }

         if(!IsA)
            if(!Alcista)
              {
               MIDDLE_Buffer[shift-1]=NormalizeDouble(MathMin(SAR_Buffer[shift-IndiceUltimo],MA_Buffer[shift-IndiceUltimo])+(MathAbs(SAR_Buffer[shift-IndiceUltimo]-MA_Buffer[shift-IndiceUltimo])/2.0),Digits());
               double desf=MIDDLE_Buffer[shift-1]/Desfase;
               UP_Buffer[shift-1]=NormalizeDouble(MIDDLE_Buffer[shift-1]+desf,Digits());
               DOWN_Buffer[shift-1]=NormalizeDouble(MIDDLE_Buffer[shift-1]-desf,Digits());
               double Close=close[shift-1];
               double ema=MA_Buffer[shift-1];
               Promedio_Buffer[shift-1]=(NormalizeDouble((ema+Close+DOWN_Buffer[shift-1]+UP_Buffer[shift-1]+MIDDLE_Buffer[shift-1])/5.0,Digits()));

               IgualarBuffer(shift,1);
              }
        }
      else
         if(SAR_Buffer[shift-1]<=low[shift-1] && SAR_Buffer[shift-2]>=high[shift-2])
           {

            bool IsA=false;
            int IndiceUltimo=0;
            for(int i=2; i<100 && shift-i-1>=0; i++)
              {
               if(SAR_Buffer[shift-i-1]<=low[shift-i-1])
                 {
                  IndiceUltimo=i;
                  break;
                 }

               if(SAR_Buffer[shift-i]<=MA_Buffer[shift-i] && SAR_Buffer[shift-i-1]>=MA_Buffer[shift-i-1])
                 {
                  IsA=true;
                  break;
                 }
              }

            if(!IsA)
               if(Alcista)
                 {
                  MIDDLE_Buffer[shift-1]=NormalizeDouble(MathMin(SAR_Buffer[shift-IndiceUltimo],MA_Buffer[shift-IndiceUltimo])+(MathAbs(SAR_Buffer[shift-IndiceUltimo]-MA_Buffer[shift-IndiceUltimo])/2.0),Digits());
                  double desf=MIDDLE_Buffer[shift-1]/Desfase;
                  UP_Buffer[shift-1]=NormalizeDouble(MIDDLE_Buffer[shift-1]+desf,Digits());
                  DOWN_Buffer[shift-1]=NormalizeDouble(MIDDLE_Buffer[shift-1]-desf,Digits());
                  double Close=close[shift-1];
                  double ema=MA_Buffer[shift-1];
                  Promedio_Buffer[shift-1]=(NormalizeDouble((ema+Close+DOWN_Buffer[shift-1]+UP_Buffer[shift-1]+MIDDLE_Buffer[shift-1])/5.0,Digits()));

                  IgualarBuffer(shift,0);
                 }
           }


      if(UP_Buffer[shift-1]==EMPTY_VALUE)
        {
         UP_Buffer[shift-1]=UP_Buffer[shift-2];
         MIDDLE_Buffer[shift-1]=MIDDLE_Buffer[shift-2];
         DOWN_Buffer[shift-1]=DOWN_Buffer[shift-2];
         double Close=close[shift-1];
         double ema=MA_Buffer[shift-1];
         Promedio_Buffer[shift-1]=(NormalizeDouble((ema+Close+DOWN_Buffer[shift-1]+UP_Buffer[shift-1]+MIDDLE_Buffer[shift-1])/5.0,Digits()));

         Promedio_Buffer_Color[shift-1]=Promedio_Buffer_Color[shift-2];
        }

     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }

//+-----------------------------------------------------
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IgualarBuffer(int shift,int IndiceCambio)
  {
   Promedio_Buffer_Color[shift-1]=IndiceCambio;

   if(!VerSalto)
     {
      Promedio_Buffer_Color[shift-3]=2;
      Promedio_Buffer_Color[shift-2]=2;
      Promedio_Buffer[shift-2]=Promedio_Buffer[shift-1];
     }
   else
     {
      Promedio_Buffer[shift-2]=EMPTY_VALUE;
      Promedio_Buffer[shift-3]=EMPTY_VALUE;
     }
  }
//+------------------------------------------------------------------+
