//+------------------------------------------------------------------+
//|                                            Lineas TimeFrames.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0

input ENUM_TIMEFRAMES TimeFrames_Linea=PERIOD_CURRENT;
input color ColorTrend=clrAqua; // Color Trend
input ENUM_LINE_STYLE EstiloTrend=STYLE_SOLID; //Estilo Trend
input int TamanoTrend=1;// Tamaño Trend
MqlRates Rates[];

int Enumeracion=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
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
//---

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
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {

   if(id==CHARTEVENT_KEYDOWN && (TimeFrames_Linea==ENUM_TIMEFRAMES(Period()) || TimeFrames_Linea==PERIOD_CURRENT) )
     {
      if(lparam==108 || lparam==76)
        {
         ArraySetAsSeries(Rates,true);
         ArrayResize(Rates,100);
         int copied=CopyRates(NULL,0,0,100,Rates);
         if(copied<=0)
            Print("Error copying price data ",GetLastError());

         double Maximo=ChartGetDouble(0,CHART_PRICE_MAX,0);
         double Minimo=ChartGetDouble(0,CHART_PRICE_MIN,0);
         double Precio=((Maximo-Minimo)/2)+Minimo;

         int PrimeraBarra=(int)ChartGetInteger(0,CHART_FIRST_VISIBLE_BAR,0);
         int Size=ArraySize(Rates);
         
         while(PrimeraBarra>Size){
         ArrayResize(Rates,Size+100);
         copied=CopyRates(NULL,0,0,Size+100,Rates);
         if(copied<=0)
            Print("Error copying price data ",GetLastError());
         Size=ArraySize(Rates);
         }
         
         int Width_Barras=(int)ChartGetInteger(0,CHART_WIDTH_IN_BARS,0);
         int UltimaBarra=PrimeraBarra-Width_Barras+1;
         PrimeraBarra=PrimeraBarra-(Width_Barras/4)+1;
         UltimaBarra=UltimaBarra+((Width_Barras/4));
        
         long Visibilidad_Trend=Visibilidad(TimeFrames_Linea);
         string Name_TrendLine="TrendLine "+TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES|TIME_SECONDS)+" N°:"+(string)Enumeracion;
         if(TrendCreate(0,Name_TrendLine,0,Rates[PrimeraBarra].time,Precio,Rates[UltimaBarra].time,Precio,ColorTrend,EstiloTrend,TamanoTrend,false,true,false,true,0,Visibilidad_Trend))
         Enumeracion++;
         
         ChartRedraw();
         Sleep(100);
        }
     }

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
                 const long            z_order=0,         // priority for mouse click
                 const long           TimeFrames_Flags=OBJ_ALL_PERIODS) // TimeFrame Draw
  {

//--- set anchor points' coordinates if they are not set
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

   ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,TimeFrames_Flags);
//--- successful execution
   return(true);
  } 
//+------------------------------------------------------------------+


long Visibilidad(ENUM_TIMEFRAMES TimeFrames){

if(TimeFrames==PERIOD_CURRENT){
TimeFrames=(ENUM_TIMEFRAMES)(Period());
}

if(TimeFrames==PERIOD_M1)
return OBJ_PERIOD_M1;
else if(TimeFrames==PERIOD_M5)
return OBJ_PERIOD_M5;
else if(TimeFrames==PERIOD_M15)
return OBJ_PERIOD_M15;
else if(TimeFrames==PERIOD_M30)
return OBJ_PERIOD_M30;
else if(TimeFrames==PERIOD_H1)
return OBJ_PERIOD_H1;
else if(TimeFrames==PERIOD_H4)
return OBJ_PERIOD_H4;
else if(TimeFrames==PERIOD_D1)
return OBJ_PERIOD_D1;
else if(TimeFrames==PERIOD_W1)
return OBJ_PERIOD_W1;
else if(TimeFrames==PERIOD_MN1)
return OBJ_PERIOD_MN1;

return OBJ_ALL_PERIODS;
}