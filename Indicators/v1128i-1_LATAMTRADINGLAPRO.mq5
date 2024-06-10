//+------------------------------------------------------------------+
//|                                   v1128i-1_LATAMTRADINGLAPRO.mq5 |
//|                             Copyright © 2024, Andrey F. Zelinsky |
//|                                                       25/01.2024 |
//|                   Профиль: https://login.mql5.com/ru/users/abolk |
//|       email: abolk@yandex.ru | skype: abolk1 | telegram: @abolk1 |
//+------------------------------------------------------------------+
//#property copyright "Copyright © 2024, Andrey F. Zelinsky"
//#property link      "https://login.mql5.com/ru/users/abolk"
//#property description "email: abolk@yandex.ru | skype: abolk1 | telegram: @abolk1"

// Конвертация, оригинальный:
// "LATAMTRADINGLAPRO"

#property strict
//#include <D:\!_5MQL\Collection\OnBuffer_502.mqh>


//=++==============================================================++=
#property indicator_chart_window
//#property indicator_separate_window
//
#property indicator_buffers    8
#property indicator_plots      7
//
#property indicator_color1     clrGreen // up
#property indicator_color2     clrMagenta  // dn
//
#property indicator_color3     clrYellow // ema1
#property indicator_color4     clrLightGray  // ema2
#property indicator_color5     clrRed // ema3
//6-deltaMA23
#property indicator_type7      DRAW_FILLING
#property indicator_color7     C'236,245,236',C'254,236,235'
//
#property indicator_width1     1 // up
#property indicator_width2     1 // dn
//
#property indicator_width3     2 // ema1
#property indicator_width4     2 // ema2
#property indicator_width5     2 // ema3
//6-deltaMA23
#property indicator_width7     1
//
//
//=++==============================================================++=
//
input int    _MA1_Period                =     8; // MA1 averaging period
      int    _MA1_Shift                 =     0; // MA1 horizontal shift
input ENUM_MA_METHOD _MA1_Method                = MODE_EMA; // MA1 smoothing type: SMA, EMA, SMMA, LWMA
input ENUM_APPLIED_PRICE _MA1_Applied_Price         = PRICE_CLOSE; // MA1 type of price: close, open, high, low, Median HL/2, Typical HLC/3, Weighted HLCC/4
//
input int    _MA2_Period                =    18; // MA2 averaging period
      int    _MA2_Shift                 =     0; // MA2 horizontal shift
input ENUM_MA_METHOD _MA2_Method                = MODE_EMA; // MA2 smoothing type: SMA, EMA, SMMA, LWMA
input ENUM_APPLIED_PRICE _MA2_Applied_Price         = PRICE_CLOSE; // MA2 type of price: close, open, high, low, Median HL/2, Typical HLC/3, Weighted HLCC/4
//
input int    _MA3_Period                =    28; // MA3 averaging period
      int    _MA3_Shift                 =     0; // MA3 horizontal shift
input ENUM_MA_METHOD _MA3_Method                = MODE_EMA; // MA3 smoothing type: SMA, EMA, SMMA, LWMA
input ENUM_APPLIED_PRICE _MA3_Applied_Price         = PRICE_WEIGHTED; // MA3 type of price: close, open, high, low, Median HL/2, Typical HLC/3, Weighted HLCC/4
//
//
input double _MA23_minDelta             =     0; // for crossing: min deviation MA2 and MA3 (in points); off <=0
input bool   _IsSign_OffSet             =  true; // shift the arrows to the left by 1 candle
//
//
//=++==============================================================++=
 int    _codeUp                    =   233; // код 'стрелки Up'
 int    _codeDn                    =   234; // код 'стрелки Dn'
 int    _shiftUpDn                 =    10; // cмещение 'стрелки Up/Dn' по вертикали в пикселях 
//
//=++==============================================================++=
double Up_Buffer[];
double Dn_Buffer[];
//
double MA1_Buffer[];
double MA2_Buffer[];
double MA3_Buffer[];
double deltaMA23_Buffer[];
//
double FILLING_MA2_Buffer[];
double FILLING_MA3_Buffer[];
//
//=++==============================================================++=
int _MA1_handle;
int _MA2_handle;
int _MA3_handle;
//
//=++==============================================================++=
int _iPre;
//
struct SCross
{
   bool isUp[2]; // 0-cur; 1-pre
   bool isDn[2];
   void Init(void) { isUp[0] = false; isUp[1] = false; isDn[0] = false; isDn[1] = false; }
   void SavePre(void) { if(isUp[0]) { isUp[1] = true; isDn[1] = false; }
                        if(isDn[0]) { isDn[1] = true; isUp[1] = false; } }
   void Set(double value1, double value2, bool isAdd=true) { isUp[0] = (value1 > value2 && isAdd);
                                                             isDn[0] = (value1 < value2 && isAdd); }
   bool IsGetUp() { return(isUp[0] && isDn[1]); }
   bool IsGetDn() { return(isDn[0] && isUp[1]); }
};
SCross _sCross;
//
// ----------
int _maxPeriod;
int _minPeriod;
int _start0;
bool _isRightParameters;
//
//=++==============================================================++=
//SPrintError _sPrintError;
//


//=++==============================================================++=
void OnInit()
{
   SetIndexBuffer(0, Up_Buffer, INDICATOR_DATA);//, INDICATOR_CALCULATIONS);
   SetIndexBuffer(1, Dn_Buffer, INDICATOR_DATA);//, INDICATOR_CALCULATIONS);
   //
   SetIndexBuffer(2, MA1_Buffer, INDICATOR_DATA);//, INDICATOR_CALCULATIONS);
   SetIndexBuffer(3, MA2_Buffer, INDICATOR_DATA);//, INDICATOR_CALCULATIONS);
   SetIndexBuffer(4, MA3_Buffer, INDICATOR_DATA);//, INDICATOR_CALCULATIONS);
   SetIndexBuffer(5, deltaMA23_Buffer, INDICATOR_DATA);//, INDICATOR_CALCULATIONS);
   //
   SetIndexBuffer(6, FILLING_MA2_Buffer, INDICATOR_CALCULATIONS);
   SetIndexBuffer(7, FILLING_MA3_Buffer, INDICATOR_CALCULATIONS);
   //
   // ==========
   int period_MA1 = _MA1_Period + _MA1_Shift;
   int period_MA2 = _MA2_Period + _MA2_Shift;
   int period_MA3 = _MA3_Period + _MA3_Shift;
   int period_Sign = _IsSign_OffSet ? 2 : 1;
   //Print("period_MA1/2/3|Sign=",period_MA1,"/",period_MA2,"/",period_MA3,"|",period_Sign);
   //
   // ----------
   _minPeriod = MathMin(period_MA1, MathMin(period_MA2, period_MA3));
   _maxPeriod = MathMax(period_Sign,MathMax(period_MA1, MathMax(period_MA2, period_MA3)));
   _start0 = _maxPeriod-1;
   //
   // ==========
   PlotIndexSet(0, DRAW_ARROW, EMPTY_VALUE, "UpSignal");
   PlotIndexSet(1, DRAW_ARROW, EMPTY_VALUE, "DnSignal");
   //
   PlotIndexSet_add_ARROW(0, _codeUp, _shiftUpDn);
   PlotIndexSet_add_ARROW(1, _codeDn, -1*_shiftUpDn);
   //
   PlotIndexSet(2, DRAW_LINE, EMPTY_VALUE, "MA1", period_MA1-1);
   PlotIndexSet(3, DRAW_LINE, EMPTY_VALUE, "MA2", period_MA2-1);
   PlotIndexSet(4, DRAW_LINE, EMPTY_VALUE, "MA3", period_MA3-1);
   PlotIndexSet(5, DRAW_NONE, EMPTY_VALUE, "deltaMA23");
   //
   PlotIndexSet(6, DRAW_FILLING, EMPTY_VALUE, "FILLING: ma2;FILLING: ma3");
   //
   // ==========
   IndicatorSetInteger(INDICATOR_DIGITS, _Digits+1);
   //
   string shortname = "v1128i-1_LATAMTRADINGLAPRO ("+IntegerToString(_MA1_Period)+","+IntegerToString(_MA2_Period)+","+IntegerToString(_MA3_Period)+")";
   IndicatorSetString(INDICATOR_SHORTNAME, shortname);
   //
   // ==========
   _MA1_handle = iMA(NULL,0, _MA1_Period,_MA1_Shift,_MA1_Method,_MA1_Applied_Price);
   _MA2_handle = iMA(NULL,0, _MA2_Period,_MA2_Shift,_MA2_Method,_MA2_Applied_Price);
   _MA3_handle = iMA(NULL,0, _MA3_Period,_MA3_Shift,_MA3_Method,_MA3_Applied_Price);
   //
   // ==========
   Init_Variables();
   //
   // ----------
   //int bars = Bars(NULL,0);
   //Print(shortname, " > (^OnInit): bars(rates_total)=", bars, " _min/maxPeriod=", _minPeriod, "/", _maxPeriod, " _start0=", _start0);
   //
   int err = 0;
   _isRightParameters = true;
   if(_MA1_Period <= 0 || _MA2_Period <= 0 || _MA3_Period <= 0) { _isRightParameters = false; err = 1; }
   if(_MA1_handle == INVALID_HANDLE) { _isRightParameters = false; err = 2; }
   if(_MA2_handle == INVALID_HANDLE) { _isRightParameters = false; err = 3; }
   if(_MA3_handle == INVALID_HANDLE) { _isRightParameters = false; err = 4; }
   if(!_isRightParameters) Print(shortname, " > ERROR(OnInit): _isRightParameters=", _isRightParameters, "(#", err, ")");
   //_sPrintError.Init(shortname, -1);
}


//=++==============================================================++=
void PlotIndexSet(int plot_index, int prop_value_DRAW_TYPE,
                                  double prop_value_EMPTY_VALUE,
                                  string prop_value_LABEL,
                                  int prop_value_DRAW_BEGIN=-1)
{
   PlotIndexSetInteger(plot_index, PLOT_DRAW_TYPE,   prop_value_DRAW_TYPE);
   PlotIndexSetDouble (plot_index, PLOT_EMPTY_VALUE, prop_value_EMPTY_VALUE);
   PlotIndexSetString (plot_index, PLOT_LABEL,       prop_value_LABEL);
   if(prop_value_DRAW_BEGIN >= 0)
      PlotIndexSetInteger(plot_index, PLOT_DRAW_BEGIN, prop_value_DRAW_BEGIN);
}


//=++==============================================================++=
void PlotIndexSet_add_ARROW(int plot_index, int prop_value_ARROW,
                                            int prop_value_ARROW_SHIFT)
{
   PlotIndexSetInteger(plot_index, PLOT_ARROW,       prop_value_ARROW);
   PlotIndexSetInteger(plot_index, PLOT_ARROW_SHIFT, prop_value_ARROW_SHIFT);
}


//=++==============================================================++=
void Init_Variables()
{
   _iPre = -1;
   _sCross.Init();
}


//=++==============================================================++=
void OnDeinit(const int reason)
{
   if(_MA1_handle != INVALID_HANDLE) IndicatorRelease(_MA1_handle);
   if(_MA2_handle != INVALID_HANDLE) IndicatorRelease(_MA2_handle);
   if(_MA3_handle != INVALID_HANDLE) IndicatorRelease(_MA3_handle);
   //
   //Print(_sPrintError.m_shortname, " > (^OnDeinit): reason=", reason);
}


//=++==============================================================++=
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
   if(rates_total < _minPeriod || !_isRightParameters) { /*_sPrintError.PrintErr(11);*/ return(0); }
   if(BarsCalculated(_MA1_handle) < rates_total) { /*_sPrintError.PrintErr(12);*/ return(0); }
   if(BarsCalculated(_MA2_handle) < rates_total) { /*_sPrintError.PrintErr(13);*/ return(0); }
   if(BarsCalculated(_MA3_handle) < rates_total) { /*_sPrintError.PrintErr(14);*/ return(0); }
   //
   int i, i1, start, to_copy;
   //
   // ==========
   if(prev_calculated == 0)
   {
      start = 0;
      to_copy = rates_total;
   }
   else
   {
      start = prev_calculated - 1;
      to_copy = rates_total-prev_calculated+1;
   }
   //
   // ----------
   /*for(i = start; i < rates_total; i++)
   {
   }*/
   //
   // ----------
   if(CopyBuffer(_MA1_handle, 0, 0, to_copy, MA1_Buffer) <= 0) { /*_sPrintError.PrintErr(15);*/ return(0); }
   if(CopyBuffer(_MA2_handle, 0, 0, to_copy, MA2_Buffer) <= 0) { /*_sPrintError.PrintErr(16);*/ return(0); }
   if(CopyBuffer(_MA3_handle, 0, 0, to_copy, MA3_Buffer) <= 0) { /*_sPrintError.PrintErr(17);*/ return(0); }
   //
   // ==========
   if(rates_total < _maxPeriod) { /*_sPrintError.PrintErr(18);*/ return(rates_total); }
   //
   if(prev_calculated == 0)
   {
      start = _start0;
      //
      Init_Variables();
      //
      for(i = 0; i < start; i++)
      {
         Up_Buffer[i] = EMPTY_VALUE;
         Dn_Buffer[i] = EMPTY_VALUE;
         //
         deltaMA23_Buffer[i] = EMPTY_VALUE;
         //
         FILLING_MA2_Buffer[i] = EMPTY_VALUE;
         FILLING_MA3_Buffer[i] = EMPTY_VALUE;
      }
   }
   //
   for(i = start; i < rates_total; i++)
   {
      if(i != _iPre)
      {
         Up_Buffer[i] = EMPTY_VALUE;
         Dn_Buffer[i] = EMPTY_VALUE;
         //
         _sCross.SavePre();
         //
         _iPre = i;
      }
      //
      // ----------
      FILLING_MA2_Buffer[i] = MA2_Buffer[i];
      FILLING_MA3_Buffer[i] = MA3_Buffer[i];
      //
      // ----------
      deltaMA23_Buffer[i] = NormalizeDouble(MathAbs(MA2_Buffer[i] -  MA3_Buffer[i]) / _Point, 1);
      bool isDelta = (deltaMA23_Buffer[i] >= _MA23_minDelta);
      //
      _sCross.Set(MA2_Buffer[i], MA3_Buffer[i], isDelta);
      //
      // ----------
      i1 = _IsSign_OffSet ? i-1 : i;
      //
      bool isUp = _sCross.IsGetUp();
      bool isDn = _sCross.IsGetDn();
      //
      Up_Buffer[i1] = isUp ? low[i1]  : EMPTY_VALUE;
      Dn_Buffer[i1] = isDn ? high[i1] : EMPTY_VALUE;
   }
   //
   // ==========
   //_sPrintError.PrintErr(0);
   return(rates_total);
}


//=++==============================================================++=
double ND(double value) { return(NormalizeDouble(value, _Digits)); }
//string DTS(double value) { return((value != EMPTY_VALUE) ? DoubleToString(value, _Digits) : "-1"); }
//double ND1(double value) { return(NormalizeDouble(value, _Digits+1)); }
//string DTS1(double value) { return((value != EMPTY_VALUE) ? DoubleToString(value, _Digits+1) : "-1"); }


//=++==============================================================++=
//=++==============================================================++=
