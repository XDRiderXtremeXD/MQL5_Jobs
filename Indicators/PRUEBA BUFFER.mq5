
//+------------------------------------------------------------------+
//|                      Patrones Regresiva Alerta Mitad Vela        |
//|                                      Modifier: Claudio Chumpitaz |
//|                      https://www.mql5.com/es/users/claudioangelo |
//|                          Based on MT4 indicator by: Carl Sanders |
//+------------------------------------------------------------------+

//double KArray[];
//double RSIMAIN[];
//input uint RSI_Period=14;

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"
#property description "Indicador que avisa mediante una alerta la formacion de un patron regresivo"
#property description "con vela recien formandose- en otras palabras te avisa cuando se esta formando"
#property description "el patron regresivo y no cuando ha terminado de formarse la vela"

#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots   1

#property indicator_label1   "FLECHA-BUY"
#property indicator_color1  clrPink
#property indicator_type1   DRAW_NONE
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1


double EMA_BUFFER[];
int EMA;

enum enMaTypes
{
   ma_sma,    // Simple moving average
   ma_ema,    // Exponential moving average
   ma_smma,   // Smoothed MA
   ma_lwma    // Linear weighted MA
};



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnInit()
  {
   EMA=iCustom(Symbol(),PERIOD_CURRENT,"dsl_-_dmi_oscillator",32,ma_smma,0,ma_ema,9);

   SetIndexBuffer(0,EMA_BUFFER,INDICATOR_DATA);
   
   
   ArraySetAsSeries(EMA_BUFFER,true);


  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
  
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &Time[],
                const double &Open[],
                const double &High[],
                const double &Low[],
                const double &Close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   if(BarsCalculated(EMA)<rates_total)
      return(0);
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(EMA,2,0,to_copy,EMA_BUFFER)<=0)
      return(0);
      
  Comment(EMA_BUFFER[0]);
  

   return(rates_total);
  }
//+------------------------------------------------------------------+

