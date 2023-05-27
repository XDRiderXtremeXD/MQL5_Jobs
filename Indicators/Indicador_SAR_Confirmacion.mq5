//+------------------------------------------------------------------+
//|                                   Indicador_SAR_Confirmacion.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+//+------------------------------------------------------------------+
//|                                                 Tres Moviles.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 6
#property indicator_plots   2

#property indicator_label1  "A"
#property indicator_color1  clrMagenta
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  5

#property indicator_label2  "B"
#property indicator_color2  clrMagenta
#property indicator_type2  DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  5

input int Cruce_Deshabilitar=3;
input string S1="*********************   Configuracion SAR *********************";//***************************************************************
input double SAR_Step=0.02;//Onda A
input double SAR_Maximun=0.2;//Onda B
input string S2_="********************* MACD *********************";//***************************************************************
input int Period_MACD=12;
input int Slow_Ema_MACD=26;
input int Signal_Period_MACD=9;
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;
input string S3_="********************* MA *********************";//***************************************************************
input int Ma_Periodo=14;
input int Ma_Shift=0;
input ENUM_MA_METHOD Ma_Method=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;
input string S4="*********************   Configuracion Color *********************";//***************************************************************
input color Color_Alcista=clrLime;
input color Color_Bajista=clrMagenta;


double         Arrow_UP[];
double         Arrow_DN[];
double         MACD_Value[];
double         MACD_Ma[];
double         SAR_Buffer[];
double         MA_Buffer[];

int Handle_MACD=0;
int Handle_SAR=0;
int Handle_MA=0;


int numCruces=0;

enum direccion
  {
   vacio=0,
   alcista=1,
   bajista=2,
  };

direccion dir;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   dir=vacio;
   Handle_MACD=iMACD(Symbol(),PERIOD_CURRENT,Period_MACD,Slow_Ema_MACD,Signal_Period_MACD,Applied_Price_MACD);
   Handle_SAR=iSAR(Symbol(),PERIOD_CURRENT,SAR_Step,SAR_Maximun);
   Handle_MA=iMA(Symbol(),PERIOD_CURRENT,Ma_Periodo,Ma_Shift,Ma_Method,Ma_AppliedPrice);
//--- vinculación del array con el búfer indicador

   SetIndexBuffer(0,Arrow_UP,INDICATOR_DATA);
   SetIndexBuffer(1,Arrow_DN,INDICATOR_DATA);
   SetIndexBuffer(2,MACD_Value,INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,MACD_Ma,INDICATOR_CALCULATIONS);
   SetIndexBuffer(4,SAR_Buffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,MA_Buffer,INDICATOR_CALCULATIONS);
//--- inicialización del generador de números pseudoaleatorios
   ArraySetAsSeries(Arrow_UP,false);
   ArraySetAsSeries(Arrow_DN,false);
   ArraySetAsSeries(MACD_Value,false);
   ArraySetAsSeries(MACD_Ma,false);
   ArraySetAsSeries(SAR_Buffer,false);
   ArraySetAsSeries(MA_Buffer,false);

   PlotIndexSetInteger(0,PLOT_ARROW,225);
   PlotIndexSetInteger(1,PLOT_ARROW,226);


   PlotIndexSetInteger(0,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       0,       //  índice del color donde escribiremos el color
                       Color_Alcista);

   PlotIndexSetInteger(1,                    //  número del estilo gráfico
                       PLOT_LINE_COLOR,      //  identificador de la propiedad
                       0,       //  índice del color donde escribiremos el color
                       Color_Bajista);

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

   ArraySetAsSeries(close,false);
   ArraySetAsSeries(time,false);
   ArraySetAsSeries(low,false);
   ArraySetAsSeries(high,false);

   if(BarsCalculated(Handle_MA)<rates_total)
      return(0);
   if(BarsCalculated(Handle_MACD)<rates_total)
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
   if(CopyBuffer(Handle_MACD,0,0,to_copy,MACD_Value)<=0)
      return(0);
   if(CopyBuffer(Handle_MACD,1,0,to_copy,MACD_Ma)<=0)
      return(0);
   if(CopyBuffer(Handle_SAR,0,0,to_copy,SAR_Buffer)<=0)
      return 0;
   if(CopyBuffer(Handle_MA,0,0,to_copy,MA_Buffer)<=0)
      return 0;


   if(prev_calculated==0)
     {
      ArrayInitialize(Arrow_UP,EMPTY_VALUE);
      ArrayInitialize(Arrow_DN,EMPTY_VALUE);
      numCruces=0;
     }

   if(prev_calculated==rates_total)
      return rates_total;

   int start=MathMax(rates_total-(rates_total-prev_calculated),4);
////////// RUPTURA DE SOP o RES
   for(int shift=start; shift<rates_total; shift++)
     {
      Arrow_UP[shift]=EMPTY_VALUE;
      Arrow_UP[shift-1]=EMPTY_VALUE;
      Arrow_DN[shift]=EMPTY_VALUE;
      Arrow_DN[shift-1]=EMPTY_VALUE;


      if(SAR_Buffer[shift-1]<low[shift-1] && MA_Buffer[shift-1]<SAR_Buffer[shift-1])
         for(int i=2; i<6 && shift-i>=1; i++)
           {
            if(SAR_Buffer[shift-i]>high[shift-i])
               break;

            if(SAR_Buffer[shift-i]<low[shift-i])
              {
               if(SAR_Buffer[shift-i]<MA_Buffer[shift-i])
                 {
                  numCruces++;

                  if(dir!=alcista)
                     numCruces=1;
                  dir=alcista;
                 }
               break;
              }
           }

      if(SAR_Buffer[shift-1]>high[shift-1] && MA_Buffer[shift-1]>SAR_Buffer[shift-1])
         for(int i=2; i<6 && shift-i>=1; i++)
           {
            if(SAR_Buffer[shift-i]<low[shift-i])
               break;

            if(SAR_Buffer[shift-i]>high[shift-i])
              {
               if(SAR_Buffer[shift-i]>MA_Buffer[shift-i])
                 {
                  numCruces++;

                  if(dir!=bajista)
                     numCruces=1;

                  dir=bajista;
                 }
               break;
              }
           }


      if(Cruce_Deshabilitar>numCruces)
        {
         if(MACD_Ma[shift-1]>MACD_Value[shift-1])
            if(SAR_Buffer[shift-1]>=close[shift-1] && SAR_Buffer[shift-2]<=close[shift-2])
              {
               bool Entra_Condicion=false;
               bool EncontroSarContraria=false;
               bool Condicion_MACD_Entrada=false;
               for(int i=2; i<200 && shift-i-1>=0; i++)
                 {
                  if(!EncontroSarContraria)
                    {
                     if(SAR_Buffer[shift-i-1]>close[shift-i-1])
                        EncontroSarContraria=true;
                    }
                  else
                    {
                     if(SAR_Buffer[shift-i-1]<close[shift-i-1])
                        break;

                     if(MACD_Ma[shift-i]>MACD_Value[shift-i] && MACD_Value[shift-i]>0)
                        Condicion_MACD_Entrada=true;

                     if(SAR_Buffer[shift-i-1]>low[shift-i-1] &&  SAR_Buffer[shift-i-1]<high[shift-i-1])
                        continue;

                     if(SAR_Buffer[shift-i]>low[shift-i] &&  SAR_Buffer[shift-i]<high[shift-i])
                        continue;

                     if(SAR_Buffer[shift-i]<MA_Buffer[shift-i] && SAR_Buffer[shift-i-1]>MA_Buffer[shift-i-1])
                       {
                        if(Condicion_MACD_Entrada)
                           Entra_Condicion=true;
                        break;
                       }
                    }
                 }

               if(Entra_Condicion)
                  Arrow_DN[shift-1]=SAR_Buffer[shift-1];
              }
         //AUDCHF
         // datetime tiempo=D'2023.01.16 02:00';
         if(MACD_Ma[shift-1]<MACD_Value[shift-1])
            if(SAR_Buffer[shift-1]<=close[shift-1] && SAR_Buffer[shift-2]>=close[shift-2])
              {
               bool Entra_Condicion=false;
               bool EncontroSarContraria=false;
               bool Condicion_MACD_Entrada=false;
               for(int i=2; i<200 && shift-i-1>=0; i++)
                 {
                  // if(time[shift-1]==tiempo)
                  //  Print(i);

                  if(!EncontroSarContraria)
                    {
                     if(SAR_Buffer[shift-i-1]<close[shift-i-1])
                        EncontroSarContraria=true;
                    }
                  else
                    {
                     if(SAR_Buffer[shift-i-1]>close[shift-i-1])
                        break;

                     if(MACD_Ma[shift-i]<MACD_Value[shift-i] && MACD_Value[shift-i]<0)
                        Condicion_MACD_Entrada=true;

                     if(SAR_Buffer[shift-i-1]>low[shift-i-1] &&  SAR_Buffer[shift-i-1]<high[shift-i-1])
                        continue;

                     if(SAR_Buffer[shift-i]>low[shift-i] &&  SAR_Buffer[shift-i]<high[shift-i])
                        continue;

                     if(SAR_Buffer[shift-i]>MA_Buffer[shift-i] && SAR_Buffer[shift-i-1]<MA_Buffer[shift-i-1])
                       {
                        if(Condicion_MACD_Entrada)
                           Entra_Condicion=true;
                        break;
                       }
                    }
                 }

               if(Entra_Condicion)
                  Arrow_UP[shift-1]=SAR_Buffer[shift-1];
              }
        }

      /*
            if(MACD_Ma[shift-1]<MACD_Value[shift-1])
               if(SAR_Buffer[shift-1]<=low[shift-1] && SAR_Buffer[shift-2]>=high[shift-2])
                 {
                  bool Entra_Condicion=false;
                  bool EncontroSarContraria=false;
                  for(int i=2; i<200 && shift-i-1>=0; i++)
                    {
                     if(!EncontroSarContraria)
                       {
                        if(SAR_Buffer[shift-i-1]<close[shift-i-1])
                           EncontroSarContraria=true;
                       }
                     else
                       {
                        if(SAR_Buffer[shift-i-1]>close[shift-i-1])
                           break;

                        if(SAR_Buffer[shift-i]>MA_Buffer[shift-i] && SAR_Buffer[shift-i-1]<MA_Buffer[shift-i-1])
                          {
                           if(MACD_Ma[shift-i]<MACD_Value[shift-i])
                              Entra_Condicion=true;
                           break;
                          }
                       }
                    }

                  if(Entra_Condicion)
                     Arrow_UP[shift-1]=low[shift-1];

                 }*/
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
