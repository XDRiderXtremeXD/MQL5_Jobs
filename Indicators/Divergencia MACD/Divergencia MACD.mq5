//+------------------------------------------------------------------+
//|                                             Divergencia MACD.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property indicator_chart_window
#property  indicator_buffers 3
#property  indicator_plots 3

enum Mostrar
  {
   MOSTRAR_TODO=0,
   MOSTRAR_LAS_ULTIMAS_X_VELAS=1,
  };

enum UsarDatos
  {
   Close_Close=0,
   High_Low=1,
  };

input int Minimo_Distancia=50;
input int Maximo_Distancia=1000;
input UsarDatos Tipo_de_Datos=High_Low;// Tipo de Datos
input string s4 = "==================================ZigZag==================================";//==========
input string Nombre_ZigZag= "Examples/ZigZag";
input int InpDepth=12;     // Depth
input int InpDeviation=5;  // Deviation
input int InpBackstep=3;   // Backstep
input string S1_="============================================ MACD ============================================";//======================================================================
input int Period_MACD=12;
input int Slow_Ema_MACD=26;
input int Signal_Period_MACD=9;
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;
input string s7 = "============================================ Divergence ============================================";//==========
input Mostrar Mostrar_Lineas=MOSTRAR_TODO;
input int X_Velas=10000;
input color ColorDivergence=clrAqua;
input int Crossing_Tolerance=20;//Line Crossing Tolerance in Points

datetime TimeLast=0;

bool Valido=false;
string ObjPrefix="Divergence_TVI_1234";

int IndiceStart=0;
int Indice=0;

double MACD_Buffer[];
double Buy_Buffer[];
double Sell_Buffer[];

int Handle_MACD=0;

datetime TiempoZigZag=0;
int NumeroMuestreo=1;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   SetIndexBuffer(0,MACD_Buffer,INDICATOR_DATA);
   SetIndexBuffer(1,Buy_Buffer,INDICATOR_DATA);
   SetIndexBuffer(2,Sell_Buffer,INDICATOR_DATA);

   PlotIndexSetInteger(1,PLOT_DRAW_TYPE,DRAW_ARROW);
   PlotIndexSetInteger(2,PLOT_DRAW_TYPE,DRAW_ARROW);

   PlotIndexSetInteger(1,PLOT_ARROW,233);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(2,PLOT_ARROW,234);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   ArraySetAsSeries(MACD_Buffer,true);
   ArraySetAsSeries(Buy_Buffer,false);
   ArraySetAsSeries(Sell_Buffer,false);

   ArrayInitialize(Sell_Buffer,EMPTY_VALUE);
   ArrayInitialize(Buy_Buffer,EMPTY_VALUE);

   Handle_MACD=iMACD(Symbol(),PERIOD_CURRENT,Period_MACD,Slow_Ema_MACD,Signal_Period_MACD,Applied_Price_MACD);

   if(Handle_MACD==INVALID_HANDLE)
     {
      Print("ERROR: MACD MAL CONFIGURADO");
      return(INIT_FAILED);
     }
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
   ArraySetAsSeries(high,false);
   ArraySetAsSeries(low,false);
   ArraySetAsSeries(close,false);
   ArraySetAsSeries(time,false);

   if(BarsCalculated(Handle_MACD)<rates_total)
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
   if(CopyBuffer(Handle_MACD,0,0,to_copy,MACD_Buffer)<=0)
      return(0);

   if(prev_calculated==0)
     {
      ArrayInitialize(Sell_Buffer,EMPTY_VALUE);
      ArrayInitialize(Buy_Buffer,EMPTY_VALUE);
      ObjectsDeleteAll(0,ObjPrefix,0,OBJ_TREND);
     }

   static datetime Tiempo=0;
   if(Tiempo!=time[rates_total-1])
     {
      if(Mostrar_Lineas==MOSTRAR_LAS_ULTIMAS_X_VELAS && rates_total>X_Velas+3)
        {
         int Lineas=ObjectsTotal(0,0,OBJ_TREND);
         for(int i=0; i<Lineas; i++)
           {
            string Nombre_Linea=ObjectName(0,i,0,OBJ_TREND);
            if(StringFind(Nombre_Linea,ObjPrefix,0)!=-1 && ObjectGetInteger(0,Nombre_Linea,OBJPROP_TIME,0)<(time[rates_total-X_Velas-1]))
               ObjectDelete(0,Nombre_Linea);
           }
        }
      Tiempo=time[rates_total-1];
     }


   int START;
   if(prev_calculated==0)
      START=Mostrar_Lineas==MOSTRAR_TODO?(10):(rates_total<X_Velas+5?10:X_Velas);
   else
      START=rates_total-3;

//Comment(rates_total-1-IndiceStart,"  Indice ",rates_total-1-Indice);
   for(int shift = START; shift < rates_total-2 ; shift++)
     {
      int PrefixTrend=0;

      bool IsSell=false;
      if(Divergencia(rates_total-1-shift,time[shift],PrefixTrend,close,high,low,rates_total,shift,IsSell))
        {
         if(!IsSell)
            Buy_Buffer[shift+1] = low[shift+1];
         else
            Sell_Buffer[shift+1] = high[shift+1];
        }
     }
   ChartRedraw();

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,ObjPrefix,0,OBJ_TREND);
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Divergencia(int IndiceZZ,datetime TimeShift,int &Prefix,double const &close[],double const &high[],double const &low[],int const RatesTotal,int shift,bool &IsSell)
  {
   IsSell=false;
   bool FirstPoint=false;
   bool SecondPoint=false;
   double MACD_First_Point=0;
   int MACD_First_Indice=0;
   double MACD_Posterior,MACD_Anterior,MACD_Medio;
   bool CondicionesBUY[2]= {false,false};
   bool CondicionesSELL[2]= {false,false};


// for(int i=IndiceZZ; i<=IndiceZZ+(NumeroMuestreo) && i+1<RatesTotal; i++)
   for(int i=0; i<=NumeroMuestreo  && IndiceZZ+i+1<RatesTotal; i++)
     {
      if(!CondicionesSELL[0])
         if(((Tipo_de_Datos==Close_Close && close[shift-i]>close[shift+1-i] && close[shift-i]>close[shift-1-i]) || (Tipo_de_Datos==High_Low && high[shift-i]>high[shift+1-i] && high[shift-i]>high[shift-1-i])))//SELL
            CondicionesSELL[0]=true;
      if(!CondicionesBUY[0])
         if(((Tipo_de_Datos==Close_Close && close[shift-i]<close[shift+1-i] && close[shift-i]<close[shift-1-i]) || (Tipo_de_Datos==High_Low && low[shift-i]<low[shift+1-i] && low[shift-i]<low[shift-1-i])))//BUY
            CondicionesBUY[0]=true;

      MACD_Posterior=MACD_Buffer[IndiceZZ+i-1];
      MACD_Medio=MACD_Buffer[IndiceZZ+i];
      MACD_Anterior=MACD_Buffer[IndiceZZ+i+1];
      //Print(i);
      if(!CondicionesSELL[1])
         CondicionesSELL[1]=(MACD_Medio>MACD_Anterior && MACD_Medio>MACD_Posterior);
      if(!CondicionesBUY[1])
         CondicionesBUY[1]=(MACD_Medio<MACD_Anterior && MACD_Medio<MACD_Posterior);

      if(MACD_First_Point==0)
         if(CondicionesSELL[1] || CondicionesBUY[1])
           {
            MACD_First_Point=MACD_Medio;
            MACD_First_Indice=IndiceZZ+i;
           }

      if(!(CondicionesBUY[0] || CondicionesSELL[0] || CondicionesBUY[1] || CondicionesSELL[1]))
         return false;
      else
         if((CondicionesBUY[0] && CondicionesBUY[1]) || (CondicionesSELL[0] && CondicionesSELL[1]))
           {
            FirstPoint=true;
            IsSell=(CondicionesSELL[0] && CondicionesSELL[1])?true:false;
            break;
           }
     }

   if(!FirstPoint)
      return false;


   for(int i=IndiceZZ+3+Minimo_Distancia; i<IndiceZZ+3+Maximo_Distancia && i+1<RatesTotal; i++)
     {
      MACD_Posterior=MACD_Buffer[i-1];
      MACD_Medio=MACD_Buffer[i];
      MACD_Anterior=MACD_Buffer[i+1];

      if(IsSell?(MACD_Medio>MACD_Anterior && MACD_Medio>MACD_Posterior):(MACD_Medio<MACD_Anterior && MACD_Medio<MACD_Posterior))
        {
         int IndiceZZ_2=0;
         if(ZigZag(i,IndiceZZ_2,IsSell,close,high,low,RatesTotal) && (IsSell?(MACD_First_Point<MACD_Medio):(MACD_First_Point>MACD_Medio)))
           {
            if(!EvaPendiente(IndiceZZ,IndiceZZ_2,MACD_First_Indice,i,IsSell))
               continue;
            double PrimerPunto=IsSell?(iHigh(Symbol(),PERIOD_CURRENT,IndiceZZ)):(iLow(Symbol(),PERIOD_CURRENT,IndiceZZ));
            double SegundoPunto=IsSell?(iHigh(Symbol(),PERIOD_CURRENT,IndiceZZ_2)):(iLow(Symbol(),PERIOD_CURRENT,IndiceZZ_2));
            if(!(IsSell?(PrimerPunto>SegundoPunto):(PrimerPunto<SegundoPunto)))
               continue;

            SecondPoint=true;
            Prefix++;
            string Nombre=ObjPrefix+"Divergence"+TimeToString(TimeShift,TIME_DATE|TIME_MINUTES)+(string) Prefix;
            if(ObjectFind(0,Nombre)<0)
               TrendCreate(0,Nombre,0,iTime(Symbol(),PERIOD_CURRENT,IndiceZZ_2),SegundoPunto,iTime(Symbol(),PERIOD_CURRENT,IndiceZZ),PrimerPunto,ColorDivergence,STYLE_SOLID,2,false,false,false,true,0);
            // break;
           }
        }
     }

   return SecondPoint;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaPendiente(int IndiceFirst,int IndiceSecond,int IndiceFirst_TVI,int IndiceSecond_TVI,bool IsHigh)
  {
   double DiferenciaX=IndiceSecond-IndiceFirst;
   double DiferenciaY=IsHigh?(iHigh(Symbol(),PERIOD_CURRENT,IndiceFirst)-iHigh(Symbol(),PERIOD_CURRENT,IndiceSecond)):(iLow(Symbol(),PERIOD_CURRENT,IndiceFirst)-iLow(Symbol(),PERIOD_CURRENT,IndiceSecond));
   double Pendiente=DiferenciaY/DiferenciaX;

   DiferenciaX=IndiceSecond_TVI-IndiceFirst_TVI;
   double valor_1=MACD_Buffer[IndiceFirst_TVI];
   double valor_2=MACD_Buffer[IndiceSecond_TVI];
   DiferenciaY=valor_1-valor_2;
   double Pendiente_TVI=DiferenciaY/DiferenciaX;


   double Valor_Inicial_TVI=MACD_Buffer[IndiceSecond];
   double Valor_Inicial=IsHigh?iHigh(Symbol(),PERIOD_CURRENT,IndiceSecond):iLow(Symbol(),PERIOD_CURRENT,IndiceSecond);
   int PasoTVI=1, PasoZZ=1;

   int Inicial=IndiceSecond>IndiceSecond_TVI?IndiceSecond:IndiceSecond_TVI;
   int Final=IndiceFirst<IndiceFirst_TVI?IndiceFirst:IndiceFirst_TVI;

   for(int i=Inicial-1; i>Final; i--)
     {
      double TVI=MACD_Buffer[i];

      if(i<IndiceSecond_TVI && i>IndiceFirst_TVI)
        {
         if(IsHigh?(Valor_Inicial_TVI+PasoTVI*Pendiente_TVI<TVI):(Valor_Inicial_TVI+PasoTVI*Pendiente_TVI>TVI))
            return false;
         PasoTVI++;
        }

      if(i<IndiceSecond && i>IndiceFirst)
        {
         if(IsHigh?(Valor_Inicial+PasoZZ*Pendiente<iHigh(Symbol(),PERIOD_CURRENT,i)-Point()*Crossing_Tolerance):
            (Valor_Inicial+PasoZZ*Pendiente>iLow(Symbol(),PERIOD_CURRENT,i)+Point()*Crossing_Tolerance))
            return false;
         PasoZZ++;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ZigZag(int i,int &IndiceZigZag,bool IsSell,double const &close[],double const &high[],double const &low[],int const RatesTotal)
  {
   for(int j=NumeroMuestreo*-1; j<=NumeroMuestreo; j++)
     {
      if(Tipo_de_Datos==Close_Close)
        {
         if((IsSell && close[RatesTotal-1-(i+j)]>close[RatesTotal-1-(i+j+1)] &&  close[RatesTotal-1-(i+j)]>close[RatesTotal-1-(i+j-1)]) || (!IsSell && close[RatesTotal-1-(i+j)]<close[RatesTotal-1-(i+j+1)] &&  close[RatesTotal-1-(i+j)]<close[RatesTotal-1-(i+j-1)]))
           {
            IndiceZigZag=i+j;
            return true;
           }
        }
      else
         if((IsSell && high[RatesTotal-1-(i+j)]>high[RatesTotal-1-(i+j+1)] &&  high[RatesTotal-1-(i+j)]>high[RatesTotal-1-(i+j-1)]) || (!IsSell && low[RatesTotal-1-(i+j)]<low[RatesTotal-1-(i+j+1)] &&  low[RatesTotal-1-(i+j)]<low[RatesTotal-1-(i+j-1)]))
           {
            IndiceZigZag=i+j;
            return true;
           }
     }
   return false;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool TrendCreate(const long            chart_ID=0,        // chart's ID
                 const string          name="TrendLine",  // line name
                 const int             sub_window=0,      // subwindow index
                 datetime              time1=0,           // first point time
                 double                price1=0,          // first point price
                 datetime              time2=0,           // second point time
                 double                price2=0,          // second point price
                 const color           clr=clrRed,        // line color
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // line style
                 const int             width=1,           // line width
                 const bool            back=false,        // in the background
                 const bool            selection=true,    // highlight to move
                 const bool            ray_right=false,   // line's continuation to the right
                 const bool            hidden=true,       // hidden in the object list
                 const long            z_order=0)         // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create a trend line by the given coordinates
   if(!ObjectCreate(chart_ID,name,OBJ_TREND,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": failed to create a trend line! Error code = ",GetLastError());
      return(false);
     }
//--- set line color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set line display style
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- set line width
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of moving the line by mouse
//--- when creating a graphical object using ObjectCreate function, the object cannot be
//--- highlighted and moved by default. Inside this method, selection parameter
//--- is true by default making it possible to highlight and move the object
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- enable (true) or disable (false) the mode of continuation of the line's display to the right
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right);
//--- hide (true) or display (false) graphical object name in the object list
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- set the priority for receiving the event of a mouse click in the chart
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- successful execution
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
