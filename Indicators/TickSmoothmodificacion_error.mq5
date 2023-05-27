//+------------------------------------------------------------------+
//|                                            TickBidmoother_v1.1.mq4 |
//|                             Copyright © 2007-08, TrendLaboratory |
//|                          Many Thanks to Rosh for TickBid indicator |
//|            http://finance.groups.yahoo.com/group/TrendLaboratory |
//|                                   E-mail: igorad2003@yahoo.co.uk |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2007-08, TrendLaboratory"
#property link      "http://finance.groups.yahoo.com/group/TrendLaboratory"
#property strict//Incorporado

#property indicator_separate_window
#property indicator_buffers 8
#property indicator_plots 8
#property indicator_type1  DRAW_LINE
#property indicator_style1 STYLE_SOLID
#property indicator_color1 clrLime
#property indicator_width1 1
#property indicator_label1 "Bid"
#property indicator_type2  DRAW_LINE
#property indicator_style2 STYLE_SOLID
#property indicator_color2 clrDodgerBlue
#property indicator_width2 1
#property indicator_label2 "FastBid"
#property indicator_type3  DRAW_LINE
#property indicator_style3 STYLE_SOLID
#property indicator_color3 clrTomato
#property indicator_width3 1
#property indicator_label3 "SlowBid"
#property indicator_type4  DRAW_LINE
#property indicator_style4 STYLE_SOLID
#property indicator_color4 clrMagenta
#property indicator_width4 1
#property indicator_label4 "SlowestBid"


#property indicator_type5  DRAW_LINE
#property indicator_style5 STYLE_SOLID
#property indicator_color5 clrOlive
#property indicator_width5 1
#property indicator_label5 "Ask"
#property indicator_type6  DRAW_LINE
#property indicator_style6 STYLE_SOLID
#property indicator_color6 clrDodgerBlue
#property indicator_width6 1
#property indicator_label6 "FastAsk"
#property indicator_type7  DRAW_LINE
#property indicator_style7 STYLE_SOLID
#property indicator_color7 clrTomato
#property indicator_width7 1
#property indicator_label7 "SlowAsk"
#property indicator_type8  DRAW_LINE
#property indicator_style8 STYLE_SOLID
#property indicator_color8 clrMagenta
#property indicator_width8 1
#property indicator_label8 "SlowestAsk"


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
input int     FastBidMA      = 20; //Fast MA Length(Period)
input int     SlowBidMA      = 30; //Slow MA Length(Period)
input int     SlowestBidMA   = 200;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
input int     FastAskMA      = 20; //Fast MA Length(Period)
input int     SlowAskMA      = 30; //Slow MA Length(Period)
input int     SlowestAskMA   = 200;




//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
input int     MA_Mode     = 0; //MA Mode: 0-SMA,1-EMA,2-Wilder(SMMA),3-LWMA
input int     UseDelimiter= 1;
input color   DelimColor  = clrGray; //Color of Bars Delimiter
input int     MaxTicks    = 1000; //Max Number of TickBid

double TickBid[];
double FastBid[];
double SlowBid[];
double SlowestBid[];

double TickAsk[];
double FastAsk[];
double SlowAsk[];
double SlowestAsk[];


int      TickCounter=0;
int      delimeterCounter;
string   short_name, setup;
int      handle=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
  Comment("");
//---- indicators
  SetIndexBuffer(0, TickBid);
  SetIndexBuffer(1, FastBid);
  SetIndexBuffer(2, SlowBid);
  SetIndexBuffer(3, SlowestBid);

  SetIndexBuffer(4, TickAsk);
  SetIndexBuffer(5, FastAsk);
  SetIndexBuffer(6, SlowAsk);
  SetIndexBuffer(7, SlowestAsk);

  IndicatorSetInteger(INDICATOR_DIGITS,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
  short_name="TickBidmoother_v1.1 ("+(string)FastBidMA+","+(string)SlowBidMA+","+(string)SlowestBidMA+","+(string)MA_Mode+","+(string)UseDelimiter+")";
  IndicatorSetString(INDICATOR_SHORTNAME,short_name);
  handle=ChartWindowFind(0,short_name);
  /*
    PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
    PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);
    PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,EMPTY_VALUE);
    PlotIndexSetDouble(3,PLOT_EMPTY_VALUE,EMPTY_VALUE);
    PlotIndexSetDouble(4,PLOT_EMPTY_VALUE,EMPTY_VALUE);
    PlotIndexSetDouble(5,PLOT_EMPTY_VALUE,EMPTY_VALUE);
    PlotIndexSetDouble(6,PLOT_EMPTY_VALUE,EMPTY_VALUE);
    PlotIndexSetDouble(7,PLOT_EMPTY_VALUE,EMPTY_VALUE);
  */
  ArraySetAsSeries(TickBid,true);
  ArraySetAsSeries(FastBid,true);
  ArraySetAsSeries(SlowBid,true);
  ArraySetAsSeries(SlowestBid,true);

  ArraySetAsSeries(TickAsk,true);
  ArraySetAsSeries(FastAsk,true);
  ArraySetAsSeries(SlowAsk,true);
  ArraySetAsSeries(SlowestAsk,true);

  setup = short_name+": ";
//----
  return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
  ObjDel(setup);
  Comment("");
  ChartRedraw();
  return;
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
                const long &Tick_volume[],
                const long &volume[],
                const int &spread[])
{
  if(TickCounter == 0) {
    ArrayInitialize(TickBid,EMPTY_VALUE);
    ArrayInitialize(FastBid,EMPTY_VALUE);
    ArrayInitialize(SlowBid,EMPTY_VALUE);
    ArrayInitialize(SlowestBid,EMPTY_VALUE);

    ArrayInitialize(TickAsk,EMPTY_VALUE);
    ArrayInitialize(FastAsk,EMPTY_VALUE);
    ArrayInitialize(SlowAsk,EMPTY_VALUE);
    ArrayInitialize(SlowestAsk,EMPTY_VALUE);
  }

  TickCounter++;

  if(TickCounter >= MaxTicks) {
    TickCounter = MaxTicks;
    TickBid[TickCounter]=EMPTY_VALUE;
    FastBid[TickCounter]=EMPTY_VALUE;
    SlowBid[TickCounter]=EMPTY_VALUE;
    SlowestBid[TickCounter]=EMPTY_VALUE;

    TickAsk[TickCounter]=EMPTY_VALUE;
    FastAsk[TickCounter]=EMPTY_VALUE;
    SlowAsk[TickCounter]=EMPTY_VALUE;
    SlowestAsk[TickCounter]=EMPTY_VALUE;
  }

  if(isNewBar()) {
    if(UseDelimiter>0) SetDelimeter();
  } else
    ShiftArray();

  TickBid[0]=SymbolInfoDouble(Symbol(),SYMBOL_BID);
  TickAsk[0]=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

  if(MA_Mode == 0) {
    if(TickCounter>FastBidMA) FastBid[0] = Tick_SMA(TickBid,FastBidMA);
    if(TickCounter>SlowBidMA) SlowBid[0] = Tick_SMA(TickBid,SlowBidMA);
    if(TickCounter>SlowestBidMA) SlowestBid[0] = Tick_SMA(TickBid,SlowestBidMA);

    if(TickCounter>FastAskMA) FastAsk[0] = Tick_SMA(TickAsk,FastAskMA);
    if(TickCounter>SlowAskMA) SlowAsk[0] = Tick_SMA(TickAsk,SlowAskMA);
    if(TickCounter>SlowestAskMA) SlowestAsk[0] = Tick_SMA(TickAsk,SlowestAskMA);

  } else if(MA_Mode == 1) {
    if(TickCounter == FastBidMA) FastBid[0] = Tick_SMA(TickBid,FastBidMA);
    else if(TickCounter > FastBidMA) FastBid[0] = Tick_EMA(TickBid,FastBid,FastBidMA);
    if(TickCounter == SlowBidMA) SlowBid[0] = Tick_SMA(TickBid,SlowBidMA);
    else if(TickCounter > SlowBidMA) SlowBid[0] = Tick_EMA(TickBid,SlowBid,SlowBidMA);
    if(TickCounter == SlowestBidMA) SlowestBid[0] = Tick_SMA(TickBid,SlowestBidMA);
    else if(TickCounter > SlowestBidMA) SlowestBid[0] = Tick_EMA(TickBid,SlowestBid,SlowestBidMA);

  } else if(MA_Mode == 2) {
    if(TickCounter == 2*FastBidMA-1) FastBid[0] = Tick_SMA(TickBid,2*FastBidMA-1);
    else if(TickCounter > 2*FastBidMA-1) FastBid[0] = Tick_EMA(TickBid,FastBid,2*FastBidMA-1);
    if(TickCounter == 2*SlowBidMA-1) SlowBid[0] = Tick_SMA(TickBid,2*SlowBidMA-1);
    else if(TickCounter > 2*SlowBidMA-1) SlowBid[0] = Tick_EMA(TickBid,SlowBid,2*SlowBidMA-1);
    if(TickCounter == 2*SlowestBidMA-1) SlowestBid[0] = Tick_SMA(TickBid,2*SlowestBidMA-1);
    else if(TickCounter > 2*SlowestBidMA-1) SlowestBid[0] = Tick_EMA(TickBid,SlowestBid,2*SlowestBidMA-1);

  }
  if(MA_Mode == 3) {
    if(TickCounter>=FastBidMA) FastBid[0] = Tick_LWMA(TickBid,FastBidMA);
    if(TickCounter>=SlowBidMA) SlowBid[0] = Tick_LWMA(TickBid,SlowBidMA);
    if(TickCounter>=SlowestBidMA) SlowestBid[0] = Tick_LWMA(TickBid,SlowestBidMA);
  }
  Comment(TickCounter);
//----
  return(rates_total);
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetDelimeter()
{
//----
  string delimeterName = setup + TimeToString(iTime(Symbol(),0,0));
  if(ObjectFind(0,delimeterName)<0) {
    ObjectCreate(0,delimeterName,OBJ_VLINE,handle,iTime(Symbol(),0,0),0);
    ObjectSetInteger(0,delimeterName,OBJPROP_COLOR,DelimColor);
    ObjectSetInteger(0,delimeterName,OBJPROP_STYLE,STYLE_DOT);
    ObjectSetInteger(0,delimeterName,OBJPROP_RAY,false);
  }
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ShiftArray()
{
  for(int cnt=TickCounter-1; cnt > 0; cnt--) {
    TickBid[cnt] = TickBid[cnt-1];
    FastBid[cnt] = FastBid[cnt-1];
    SlowBid[cnt] = SlowBid[cnt-1];
    SlowestBid[cnt] = SlowestBid[cnt-1];

    TickAsk[cnt] = TickAsk[cnt-1];
    FastAsk[cnt] = FastAsk[cnt-1];
    SlowAsk[cnt] = SlowAsk[cnt-1];
    SlowestAsk[cnt] = SlowestAsk[cnt-1];
  }

  if (UseDelimiter>0) {
    for (int j=0; j<ObjectsTotal(0,handle); j++) {
      int NumStr = StringFind(ObjectName(0,j,handle),setup,0);

      if (NumStr == 0) {
        datetime Time1=(datetime)ObjectGetInteger(0,ObjectName(0,j,handle),OBJPROP_TIME);
        int BarTime1=iBarShift(NULL,0,Time1);
        Time1 = iTime(Symbol(),0,BarTime1+1);
        ObjectSetInteger(0,ObjectName(0,j,handle),OBJPROP_TIME,Time1);
        if(BarTime1+1 > MaxTicks) {
          if(!ObjectDelete(0,ObjectName(0,j,handle))) {
            int _GetLastError = GetLastError();
            Print("ObjectDelete: ",ObjectName(0,j,handle)," Error #", _GetLastError );
          }
        }
      }
    }
  }
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool isNewBar()
{
  bool res=false;
  static datetime pTime = iTime(Symbol(),0,0);
  if (iTime(Symbol(),0,0)!=pTime) {
    res=true;
    pTime=iTime(Symbol(),0,0);
  }
  return(res);
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ObjDel(string name)
{
  int _GetLastError = 0;

  while(ObjFind(name,0,0) > 0) {
    int obtotal = ObjectsTotal(0,handle);
    for (int i = 0; i < obtotal; i++) {
      if (StringFind(ObjectName(0,i,handle),name,0) >= 0) {
        if (!ObjectDelete(0,ObjectName(0,i,handle))) {
          _GetLastError = GetLastError();
          Print( "ObjectDelete( \"",ObjectName(0,i,handle),"\" ) - Error #", _GetLastError );
        }
      }
    }
  }
  if(_GetLastError > 0) return(false);
  else
    return(true);
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int ObjFind(string name,int start, int num)
{
  int cnt = 0;

  for (int i = 0; i < ObjectsTotal(0,handle); i++)
    if (StringFind(ObjectName(0,i,handle),name,start) == num) cnt+=1;

  return(cnt);
}

//+------------------------------------------------------------------+
double Tick_SMA(double &array[],int per)
{
  double Sum = 0;
  for(int i = 0; i < per; i++) {
    if(array[i]!=EMPTY_VALUE) {
      Sum += array[i];
    }
  }
  double s=Sum/per;
  if(s==0) return(EMPTY_VALUE);
  return(s);
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Tick_EMA(double &array1[],double &array2[],int per)
{
  return(array2[1] + 2.0/(1+per)*(array1[0] - array2[1]));
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Tick_LWMA(double &array[],int per)
{
  double Sum = 0;
  double Weight = 0;
  double lwma = 0;
  for(int i = 0; i < per; i++) {
    Weight+= (per - i);
    if(array[i]!=EMPTY_VALUE)
      Sum += array[i]*(per - i);
    // else Sum += 0;
  }
  if(Weight>0) lwma = Sum/Weight;
  else lwma = 0;
  return(lwma);
}
//+------------------------------------------------------------------+
