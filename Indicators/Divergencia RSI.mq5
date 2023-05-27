//+------------------------------------------------------------------+
//|                                              Divergencia RSI.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property indicator_chart_window
#property  indicator_buffers 2
#property  indicator_plots 2


enum Mostrar
  {
   MOSTRAR_TODO=0,
   MOSTRAR_LAS_ULTIMAS_X_VELAS=1,
  };

input string s4 = "==================================ZigZag==================================";//==========
input string Nombre_ZigZag= "Examples/ZigZag";
input int InpDepth=12;     // Depth
input int InpDeviation=5;  // Deviation
input int InpBackstep=3;   // Backstep
input string S1_="============================================ MACD ============================================";//======================================================================
input int RSI_Periodo=14;
input ENUM_APPLIED_PRICE RSI_Applied_Price=PRICE_CLOSE;
input string s7 = "============================================ Divergence ============================================";//==========
input Mostrar Mostrar_Lineas=MOSTRAR_TODO;
input int X_Velas=10000;
input bool Ver_Divergencia_Oculta=true;
input bool Ver_Divergencia_Regular=true;
input color ColorDivergenceOculta=clrMagenta;
input color ColorDivergenceRegular=clrAqua;
input int Crossing_Tolerance=20;//Line Crossing Tolerance in Points
input int Period_Candle_Evaluation=1000;

datetime TimeLast=0;

bool Valido=false;
string ObjPrefix="Divergence_TVI_1234";

int IndiceStart=0;
int Indice=0;

double MACD_Buffer[];
int Handle_MACD=0;
double ZZ_Buffer[];
int Handle_ZZ=0;

datetime TiempoZigZag=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   SetIndexBuffer(0,MACD_Buffer,INDICATOR_DATA);
   SetIndexBuffer(1,ZZ_Buffer,INDICATOR_DATA);
   ArraySetAsSeries(MACD_Buffer,true);
   ArraySetAsSeries(ZZ_Buffer,true);

   Handle_MACD=iRSI(Symbol(),PERIOD_CURRENT,RSI_Periodo,RSI_Applied_Price);
   Handle_ZZ=iCustom(Symbol(),PERIOD_CURRENT,Nombre_ZigZag, InpDepth, InpDeviation, InpBackstep);
   if(Handle_MACD==INVALID_HANDLE)
     {
      Print("ERROR: MACD MAL CONFIGURADO");
      return(INIT_FAILED);
     }
   if(Handle_ZZ==INVALID_HANDLE)
     {
      Print("ERROR: ZigZag MAL CONFIGURADO");
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
   ArraySetAsSeries(time,false);

   if(BarsCalculated(Handle_MACD)<rates_total)
      return(0);
   if(BarsCalculated(Handle_ZZ)<rates_total)
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

      if(CopyBuffer(Handle_ZZ,0,0,rates_total,ZZ_Buffer)<=0)
         return(0);
      Tiempo=time[rates_total-1];
     }

   if(rates_total<Period_Candle_Evaluation+10)
      return rates_total;


   int START;
   if(prev_calculated==0)
     {
      START=Mostrar_Lineas==MOSTRAR_TODO?Period_Candle_Evaluation+5:(rates_total<X_Velas+3?Period_Candle_Evaluation+5:rates_total-X_Velas-1);
     }
   else
      START=IndiceStart;

//Comment(rates_total-1-IndiceStart,"  Indice ",rates_total-1-Indice);
   for(int shift = START; shift < rates_total ; shift++)
     {
      int PrefixTrend=0;
      double ZigZag = ZigZagValor(shift,rates_total);
      if(ZigZag>0 &&  ZigZag!=EMPTY_VALUE)
        {
         Valido=false;
         for(int i=shift+1; i<rates_total; i++)
           {
            double ZigZag2 = ZigZagValor(i,rates_total);
            if(ZigZag2>0 &&  ZigZag2!=EMPTY_VALUE)
              {
               Indice=i;
               Valido=true;
               break;
              }
           }
         if(Valido)
           {
            if(ZigZag>=high[shift])
               Divergencia(0,0,rates_total-1-shift,time[shift],PrefixTrend);
            if(ZigZag<=low[shift])
               Divergencia(1,rates_total-1-shift,0,time[shift],PrefixTrend);

            IndiceStart=shift+1;
           }
        }
     }
   Comment(time[IndiceStart]);

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
bool Divergencia(int zs,int IndiceLowZZ,int IndiceHighZZ,datetime TimeShift,int &Prefix)
  {
   bool FirstPoint=false;
   bool SecondPoint=false;
   double MACD_First_Point=0;
   int MACD_First_Indice=0;
   double MACD_Posterior,MACD_Anterior,MACD_Medio;
   int MACD_Second_Indice=0;


//Print(IndiceLowZZ,"  ",TimeToString(Time[IndiceLowZZ],TIME_DATE|TIME_MINUTES));
   if(zs==1)
     {
      for(int i=IndiceLowZZ-1; i<IndiceLowZZ+2 && i-1>=0; i++)
        {
         MACD_Posterior=MACD_Buffer[i-1];
         MACD_Medio=MACD_Buffer[i];
         MACD_Anterior=MACD_Buffer[i+1];
         //Print(i);
         if(MACD_Medio<MACD_Anterior && MACD_Medio<MACD_Posterior)
           {
            MACD_First_Point=MACD_Medio;
            MACD_First_Indice=i;
            FirstPoint=true;
            break;
           }
        }

      if(!FirstPoint)
         return false;

      for(int i=IndiceLowZZ+3; i<IndiceLowZZ+3+Period_Candle_Evaluation && i-1>=0; i++)
        {
         MACD_Posterior=MACD_Buffer[i-1];
         MACD_Medio=MACD_Buffer[i];
         MACD_Anterior=MACD_Buffer[i+1];

         if(MACD_Medio<MACD_Anterior && MACD_Medio<MACD_Posterior)
           {
            int IndiceLowZZ_2=0;
            if(Ver_Divergencia_Regular)
               if(ZigZag(i,IndiceLowZZ_2,false) && MACD_First_Point>MACD_Medio)
                 {
                  MACD_Second_Indice=i;
                  if(iLow(Symbol(),PERIOD_CURRENT,IndiceLowZZ)<iLow(Symbol(),PERIOD_CURRENT,IndiceLowZZ_2) && EvaPendiente(IndiceLowZZ,IndiceLowZZ_2,MACD_First_Indice,MACD_Second_Indice,false))
                    {
                     SecondPoint=true;
                     Prefix++;
                     string Nombre=ObjPrefix+"Divergence"+TimeToString(TimeShift,TIME_DATE|TIME_MINUTES)+(string) Prefix;
                     if(ObjectFind(0,Nombre)<0)
                       {
                        TrendCreate(0,Nombre,0,iTime(Symbol(),PERIOD_CURRENT,IndiceLowZZ_2),iLow(Symbol(),PERIOD_CURRENT,IndiceLowZZ_2),iTime(Symbol(),PERIOD_CURRENT,IndiceLowZZ),iLow(Symbol(),PERIOD_CURRENT,IndiceLowZZ),ColorDivergenceRegular,STYLE_SOLID,2,false,false,false,true,0);
                       }//TimeLast=Time[i];
                     // break;
                    }
                 }

            IndiceLowZZ_2=0;
            if(Ver_Divergencia_Oculta)
               if(ZigZag(i,IndiceLowZZ_2,false) && MACD_First_Point<MACD_Medio)
                 {
                  MACD_Second_Indice=i;
                  if(iLow(Symbol(),PERIOD_CURRENT,IndiceLowZZ)>iLow(Symbol(),PERIOD_CURRENT,IndiceLowZZ_2) && EvaPendiente(IndiceLowZZ,IndiceLowZZ_2,MACD_First_Indice,MACD_Second_Indice,false))
                    {
                     SecondPoint=true;
                     Prefix++;
                     string Nombre=ObjPrefix+"Divergence"+TimeToString(TimeShift,TIME_DATE|TIME_MINUTES)+(string) Prefix;
                     if(ObjectFind(0,Nombre)<0)
                       {
                        TrendCreate(0,Nombre,0,iTime(Symbol(),PERIOD_CURRENT,IndiceLowZZ_2),iLow(Symbol(),PERIOD_CURRENT,IndiceLowZZ_2),iTime(Symbol(),PERIOD_CURRENT,IndiceLowZZ),iLow(Symbol(),PERIOD_CURRENT,IndiceLowZZ),ColorDivergenceOculta,STYLE_SOLID,2,false,false,false,true,0);
                       }//TimeLast=Time[i];
                     // break;
                    }
                 }
           }
        }
       if(SecondPoint==false)
        return false;
     }

   if(zs==0)
     {
      for(int i=IndiceHighZZ-1; i<IndiceHighZZ+2 && i-1>=0; i++)
        {
         MACD_Posterior=MACD_Buffer[i-1];
         MACD_Medio=MACD_Buffer[i];
         MACD_Anterior=MACD_Buffer[i+1];
         if(MACD_Medio>MACD_Anterior && MACD_Medio>MACD_Posterior)
           {
            MACD_First_Point=MACD_Medio;
            MACD_First_Indice=i;
            FirstPoint=true;
            break;
           }
        }
      if(!FirstPoint)
        return false;

      for(int i=IndiceHighZZ+3; i<IndiceHighZZ+3+Period_Candle_Evaluation && i-1>=0; i++)
        {
         MACD_Posterior=MACD_Buffer[i-1];
         MACD_Medio=MACD_Buffer[i];
         MACD_Anterior=MACD_Buffer[i+1];
         if(MACD_Medio>MACD_Anterior && MACD_Medio>MACD_Posterior)
           {
            int IndiceHighZZ_2=0;
            if(Ver_Divergencia_Regular)
               if(ZigZag(i,IndiceHighZZ_2,true)  && MACD_First_Point<MACD_Medio)
                 {
                  MACD_Second_Indice=i;
                  if(iHigh(Symbol(),PERIOD_CURRENT,IndiceHighZZ)>iHigh(Symbol(),PERIOD_CURRENT,IndiceHighZZ_2) && EvaPendiente(IndiceHighZZ,IndiceHighZZ_2,MACD_First_Indice,MACD_Second_Indice,true))
                    {
                     SecondPoint=true;
                     Prefix++;
                     string Nombre=ObjPrefix+"Divergence"+TimeToString(TimeShift,TIME_DATE|TIME_MINUTES)+(string)Prefix;
                     if(ObjectFind(0,Nombre)<0)
                       {
                        TrendCreate(0,Nombre,0,iTime(Symbol(),PERIOD_CURRENT,IndiceHighZZ_2),iHigh(Symbol(),PERIOD_CURRENT,IndiceHighZZ_2),iTime(Symbol(),PERIOD_CURRENT,IndiceHighZZ),iHigh(Symbol(),PERIOD_CURRENT,IndiceHighZZ),ColorDivergenceRegular,STYLE_SOLID,2,false,false,false,true,0);
                       }//TimeLast=Time[i];
                     // break;
                    }
                 }

            IndiceHighZZ_2=0;
            if(Ver_Divergencia_Oculta)
               if(ZigZag(i,IndiceHighZZ_2,true)  && MACD_First_Point>MACD_Medio)
                 {
                  MACD_Second_Indice=i;
                  if(iHigh(Symbol(),PERIOD_CURRENT,IndiceHighZZ)<iHigh(Symbol(),PERIOD_CURRENT,IndiceHighZZ_2) && EvaPendiente(IndiceHighZZ,IndiceHighZZ_2,MACD_First_Indice,MACD_Second_Indice,true))
                    {
                     SecondPoint=true;
                     Prefix++;
                     string Nombre=ObjPrefix+"Divergence"+TimeToString(TimeShift,TIME_DATE|TIME_MINUTES)+(string)Prefix;
                     if(ObjectFind(0,Nombre)<0)
                       {
                        TrendCreate(0,Nombre,0,iTime(Symbol(),PERIOD_CURRENT,IndiceHighZZ_2),iHigh(Symbol(),PERIOD_CURRENT,IndiceHighZZ_2),iTime(Symbol(),PERIOD_CURRENT,IndiceHighZZ),iHigh(Symbol(),PERIOD_CURRENT,IndiceHighZZ),ColorDivergenceOculta,STYLE_SOLID,2,false,false,false,true,0);
                       }//TimeLast=Time[i];
                     // break;
                    }
                 }
           }
        }

       if(SecondPoint==false)
        return false;
     }


   return true;
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
         if(Valor_Inicial_TVI+PasoTVI*Pendiente_TVI<TVI && IsHigh)
            return false;

         if(Valor_Inicial_TVI+PasoTVI*Pendiente_TVI>TVI && IsHigh==false)
            return false;

         PasoTVI++;
        }

      if(i<IndiceSecond && i>IndiceFirst)
        {
         if(Valor_Inicial+PasoZZ*Pendiente<iHigh(Symbol(),PERIOD_CURRENT,i)-Point()*Crossing_Tolerance && IsHigh)
            return false;

         if(Valor_Inicial+PasoZZ*Pendiente>iLow(Symbol(),PERIOD_CURRENT,i)+Point()*Crossing_Tolerance && IsHigh==false)
            return false;
         PasoZZ++;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ZigZag(int i,int &IndiceZigZag,bool IsHigh)
  {
   for(int j=-1; j<3; j++)
     {
      double ZZ = ZZ_Buffer[i+j];
      //int Indice_Array_false=(rates_total-1)-(i+j);
      //if(ZZ!=0 && ((IsHigh && ZZ>=high[Indice_Array_false]) || (!IsHigh && ZZ<=low[Indice_Array_false])))  {
      if(ZZ!=0 && ((IsHigh && ZZ>=iHigh(Symbol(),PERIOD_CURRENT,i+j)) || (!IsHigh && ZZ<=iLow(Symbol(),PERIOD_CURRENT,i+j))))
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
//|                                                                  |
//+------------------------------------------------------------------+
double ZigZagValor(int Indice_ArraySeries_true,int rates_total)
  {
   double ZZ=ZZ_Buffer[rates_total-1-(Indice_ArraySeries_true)];
   return ZZ;
  }

//+------------------------------------------------------------------+
