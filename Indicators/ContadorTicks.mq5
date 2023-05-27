//+------------------------------------------------------------------+
//|                                            TickSmoother_v1.1.mq5 |
//|                             Copyright © 2007-08, TrendLaboratory |
//|                                   E-mail: rideralucar@gmail.com  |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2007-08, TrendLaboratory"
#property link      "https://www.mql5.com/es/users/claudioangelo"


#property indicator_separate_window
#property indicator_buffers 4
#property indicator_plots 4
#property indicator_color1 clrLime
#property indicator_color2 clrDodgerBlue
#property indicator_color3 clrTomato
#property indicator_color4 clrRed
//---- buffers
input int     Fast_MABid      =     5; //Fast MA Length(Period)
input int     Slow_MABid      =    14; //Slow MA Length(Period)
input int     Slowest_MABid   = 200;
input int     MA_Mode     =     0; //MA Mode: 0-SMA,1-EMA,2-Wilder(SMMA),3-LWMA
input int     UseDelimiter=     1;
input color   DelimColor  =  clrGray; //Color of Bars Delimiter
input int     MaxTicks    =   200; //Max Number of ticks

double Ticks[];
double Fast_Bid[];
double Slow_Bid[];
double Slowest_Bid[];

int      tickCounter=0;
int      delimeterCounter;
datetime pTime;
string   short_name, setup;


datetime until=D'2023.05.20 00:00';
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//---- indicators

   SetIndexBuffer(0, Ticks,INDICATOR_DATA);
   PlotIndexSetInteger(0,PLOT_DRAW_TYPE,DRAW_LINE);
   SetIndexBuffer(1, Fast_Bid,INDICATOR_DATA);
   PlotIndexSetInteger(1,PLOT_DRAW_TYPE,DRAW_LINE);
   SetIndexBuffer(2, Slow_Bid,INDICATOR_DATA);
   PlotIndexSetInteger(2,PLOT_DRAW_TYPE,DRAW_LINE);
   SetIndexBuffer(3, Slowest_Bid,INDICATOR_DATA);
   PlotIndexSetInteger(3,PLOT_DRAW_TYPE,DRAW_LINE);


   IndicatorSetInteger(INDICATOR_DIGITS,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS)+2);
   short_name="TickSmoother_v1.1("+IntegerToString(Fast_MABid)+","+IntegerToString(Slow_MABid)+","+IntegerToString(MA_Mode)+","+IntegerToString(UseDelimiter)+")";
   IndicatorSetString(INDICATOR_SHORTNAME,short_name);
   PlotIndexSetString(0,PLOT_LABEL,"Bid");
   PlotIndexSetString(1,PLOT_LABEL,"Fast_Bid");
   PlotIndexSetString(2,PLOT_LABEL,"Slow_Bid");
   PlotIndexSetString(3,PLOT_LABEL,"Slowest_Bid");

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(3,PLOT_EMPTY_VALUE,0);

   ArraySetAsSeries(Ticks,true);
   ArraySetAsSeries(Fast_Bid,true);
   ArraySetAsSeries(Slow_Bid,true);
   ArraySetAsSeries(Slowest_Bid,true);

   setup = short_name+": ";
   pTime = iTime(Symbol(),PERIOD_CURRENT,0);

   if(TimeCurrent()>until)
     {
      Alert("Tiempo prueba termino el dia ",TimeToString(until,TIME_DATE|TIME_MINUTES));
      return INIT_FAILED;
     }

   Comment("Tiempo prueba hasta el dia ",TimeToString(until,TIME_DATE|TIME_MINUTES));
//----
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Comment(" ");
//----
   ObjDel(setup);
//----
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetDelimeter(datetime const &Time[])
  {
//----
   string delimeterName = setup + TimeToString(Time[0]);

   int handle=ChartWindowFind(0,short_name);

   if(!ObjectCreate(0,delimeterName,OBJ_VLINE,handle,Time[0],0))
     {
      Print("Error delimiter:",GetLastError());
     }
   else
     {
      ObjectSetInteger(0,delimeterName,OBJPROP_COLOR,DelimColor);
      ObjectSetInteger(0,delimeterName,OBJPROP_STYLE,STYLE_DOT);
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ShiftArray(datetime const &Time[])
  {

   for(int cnt=tickCounter-1; cnt > 0; cnt--)
     {
      Ticks[cnt] = Ticks[cnt-1];
      Fast_Bid [cnt] = Fast_Bid[cnt-1];
      Slow_Bid [cnt] = Slow_Bid[cnt-1];
      Slowest_Bid[cnt] = Slowest_Bid[cnt-1];
     }

   if(UseDelimiter!=0)
     {
      for(int j=0; j<ObjectsTotal(0,-1,-1); j++)
        {
         int NumStr = StringFind(ObjectName(0,j,-1,-1),setup,0);

         if(NumStr == 0)
           {
            string Name=ObjectName(0,j,-1,-1);

            datetime Time1=(datetime)ObjectGetInteger(0,Name,OBJPROP_TIME,0);
            int BarTime1=iBarShift(NULL,0,Time1);
            Time1 = Time[BarTime1+1];
            ObjectSetInteger(0,Name,OBJPROP_TIME,Time1);
            if(BarTime1+1 > MaxTicks)
              {
               if(!ObjectDelete(0,Name))
                 {
                  int _GetLastError = GetLastError();
                  Print("ObjectDelete: ",Name," Error #", _GetLastError);
                 }
              }
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool isNewBar(datetime const &Time[])
  {
   bool res=false;
   if(Time[0]!=pTime)
     {
      res=true;
      pTime=Time[0];
     }

   return(res);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ObjDel(string name)
  {
   int _GetLastError = 0;

   while(ObjFind(name,0,0) > 0)
     {
      int obtotal = ObjectsTotal(0,-1,-1);
      for(int i = 0; i < obtotal; i++)
        {
         string nameObj=ObjectName(0,i,-1,-1);
         if(StringFind(nameObj,name,0) >= 0)
           {
            if(!ObjectDelete(0,nameObj))
              {
               _GetLastError = GetLastError();
               Print("ObjectDelete( \"",nameObj,"\" ) - Error #", _GetLastError);
              }
           }
        }
     }
   if(_GetLastError > 0)
      return(false);
   else
      return (true);
  }
//-----
int ObjFind(string name,int start, int num)
  {
   int cnt = 0;

   for(int i = 0; i < ObjectsTotal(0,-1,-1); i++)
      if(StringFind(ObjectName(0,i,-1,-1),name,start) == num)
         cnt+=1;

   return(cnt);
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
   ArraySetAsSeries(time,true);
   ArraySetAsSeries(close,true);

   static bool Alerta=false;
   if(TimeCurrent()>until)
     {
      if(!Alerta)
         Alert("Tiempo prueba termino el dia ",TimeToString(until,TIME_DATE|TIME_MINUTES));
      Alerta=true;
      return rates_total;
     }


   if(rates_total>0)
     {
      if(tickCounter == 0)
        {
         ArrayInitialize(Ticks,0);
         ArrayInitialize(Fast_Bid,0);
         ArrayInitialize(Slow_Bid,0);
         ArrayInitialize(Slowest_Bid,0);
        }

      tickCounter++;

      if(tickCounter >= MaxTicks)
        {
         tickCounter = MaxTicks;
         Ticks[tickCounter]=0.0;
         Fast_Bid[tickCounter]=0.0;
         Slow_Bid[tickCounter]=0.0;
         Slowest_Bid[tickCounter]=0.0;
        }

      if(isNewBar(time))
        {
         if(UseDelimiter == 1)
            SetDelimeter(time);
        }
      else
         ShiftArray(time);

      Ticks[0]=close[0];

      if(MA_Mode == 0)
        {
         if(tickCounter>=Fast_MABid)
            Fast_Bid[0] = TickSMA(Ticks,Fast_MABid);
         if(tickCounter>=Slow_MABid)
            Slow_Bid[0] = TickSMA(Ticks,Slow_MABid);
         if(tickCounter>Slowest_MABid)
            Slowest_Bid[0] = TickSMA(Ticks,Slowest_MABid);
        }
      else
         if(MA_Mode == 1)
           {
            if(tickCounter == Fast_MABid)
               Fast_Bid[0] = TickSMA(Ticks,Fast_MABid);
            else
               if(tickCounter > Fast_MABid)
                  Fast_Bid[0] = TickEMA(Ticks,Fast_Bid,Fast_MABid);
            if(tickCounter == Slow_MABid)
               Slow_Bid[0] = TickSMA(Ticks,Slow_MABid);
            else
               if(tickCounter > Slow_MABid)
                  Slow_Bid[0] = TickEMA(Ticks,Slow_Bid,Slow_MABid);

            if(tickCounter == Slowest_MABid)
               Slowest_Bid[0] = TickSMA(Ticks,Slowest_MABid);
            else
               if(tickCounter > Slowest_MABid)
                  Slowest_Bid[0] = TickEMA(Ticks,Slowest_Bid,Slowest_MABid);
           }
         else
            if(MA_Mode == 2)
              {
               if(tickCounter == 2*Fast_MABid-1)
                  Fast_Bid[0] = TickSMA(Ticks,2*Fast_MABid-1);
               else
                  if(tickCounter > 2*Fast_MABid-1)
                     Fast_Bid[0] = TickEMA(Ticks,Fast_Bid,2*Fast_MABid-1);
               if(tickCounter == 2*Slow_MABid-1)
                  Slow_Bid[0] = TickSMA(Ticks,2*Slow_MABid-1);
               else
                  if(tickCounter > 2*Slow_MABid-1)
                     Slow_Bid[0] = TickEMA(Ticks,Slow_Bid,2*Slow_MABid-1);

               if(tickCounter == 2*Slowest_MABid-1)
                  Slowest_Bid[0] = TickSMA(Ticks,2*Slowest_MABid-1);
               else
                  if(tickCounter > 2*Slowest_MABid-1)
                     Slowest_Bid[0] = TickEMA(Ticks,Slowest_Bid,2*Slowest_MABid-1);
              }
      if(MA_Mode == 3)
        {
         if(tickCounter>=Fast_MABid)
            Fast_Bid[0] = TickLWMA(Ticks,Fast_MABid);
         if(tickCounter>=Slow_MABid)
            Slow_Bid[0] = TickLWMA(Ticks,Slow_MABid);
         if(tickCounter>=Slowest_MABid)
            Slowest_Bid[0] = TickLWMA(Ticks,Slowest_MABid);
        }
     }

//----
   return(rates_total);
  }
//+------------------------------------------------------------------+
double TickSMA(double &array[],int per)
  {
   double Sum = 0;
   for(int i = 0; i < per; i++)
      Sum += array[i];
   return(Sum/per);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double TickEMA(double &array1[],double &array2[],int per)
  {
   return(array2[1] + 2.0/(1+per)*(array1[0] - array2[1]));
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double TickLWMA(double &array[],int per)
  {
   double Sum = 0;
   double Weight = 0;
   double lwma=0;

   for(int i = 0; i < per; i++)
     {
      Weight+= (per - i);
      Sum += array[i]*(per - i);
     }
   if(Weight>0)
      lwma = Sum/Weight;

   return(lwma);
  }
//+------------------------------------------------------------------+
