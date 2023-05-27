#property version   "1.00"
#property description "Rachan Levis 29030"

//--- indicator settings
#property indicator_chart_window
#property indicator_buffers 4
#property indicator_plots 4

#property indicator_type1 DRAW_ARROW
#property indicator_width1 1
#property indicator_color1 clrWhite
#property indicator_label1 "Buy"

#property indicator_type2 DRAW_ARROW
#property indicator_width2 1
#property indicator_color2 clrWhite
#property indicator_label2 "Sell"

#property indicator_type3 DRAW_ARROW
#property indicator_width3 1
#property indicator_color3 clrGreen
#property indicator_label3 "Buy"

#property indicator_type4 DRAW_ARROW
#property indicator_width4 1
#property indicator_color4 clrRed
#property indicator_label4 "Sell"

//--- indicator buffers
double Buffer1[];
double Buffer2[];
double Buffer3[];
double Buffer4[];

input double sobrecompra = 90;
input double periodo = 2;
input double sobreventa = 30; 
input bool Audible_Alerts = true;
datetime time_alert;
double myPoint; 
int RSI_handle;
double RSI[];
double Close[];
double Open[];
double Low[];
int ATR_handle;
double ATR[];
double High[];

void myAlert(string type, string message)
  {
   if(type == "print")
      Print(message);
   else if(type == "error")
     {
      Print(type+" | Rachan Levis @ "+Symbol()+","+IntegerToString(Period())+" | "+message);
     }
   else if(type == "order")
     {
     }
   else if(type == "modify")
     {
     }
   else if(type == "indicator")
     {
      Print(type+" | Rachan Levis @ "+Symbol()+","+IntegerToString(Period())+" | "+message);
      if(Audible_Alerts) Alert(type+" | Rachan Levis @ "+Symbol()+","+IntegerToString(Period())+" | "+message);
     }
  }

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {   
   SetIndexBuffer(0, Buffer1);
   PlotIndexSetDouble(0, PLOT_EMPTY_VALUE, EMPTY_VALUE);
   PlotIndexSetInteger(0, PLOT_ARROW, 159);
   SetIndexBuffer(1, Buffer2);
   PlotIndexSetDouble(1, PLOT_EMPTY_VALUE, EMPTY_VALUE);
   PlotIndexSetInteger(1, PLOT_ARROW, 159);
   SetIndexBuffer(2, Buffer3);
   PlotIndexSetDouble(2, PLOT_EMPTY_VALUE, EMPTY_VALUE);
   PlotIndexSetInteger(2, PLOT_ARROW, 225);
   SetIndexBuffer(3, Buffer4);
   PlotIndexSetDouble(3, PLOT_EMPTY_VALUE, EMPTY_VALUE);
   PlotIndexSetInteger(3, PLOT_ARROW, 226);
   //initialize myPoint
   myPoint = Point();
   if(Digits() == 5 || Digits() == 3)
     {
      myPoint *= 10;
     }
   RSI_handle = iRSI(NULL, PERIOD_CURRENT,(int)periodo, PRICE_CLOSE);
   if(RSI_handle < 0)
     {
      Print("The creation of iRSI has failed: RSI_handle=", INVALID_HANDLE);
      Print("Runtime error = ", GetLastError());
      return(INIT_FAILED);
     }
   
   ATR_handle = iATR(NULL, PERIOD_CURRENT,(int)periodo);
   if(ATR_handle < 0)
     {
      Print("The creation of iATR has failed: ATR_handle=", INVALID_HANDLE);
      Print("Runtime error = ", GetLastError());
      return(INIT_FAILED);
     }
   
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime& time[],
                const double& open[],
                const double& high[],
                const double& low[],
                const double& close[],
                const long& tick_volume[],
                const long& volume[],
                const int& spread[])
  {
   int limit = rates_total - prev_calculated;
   //--- counting from 0 to rates_total
   ArraySetAsSeries(Buffer1, true);
   ArraySetAsSeries(Buffer2, true);
   ArraySetAsSeries(Buffer3, true);
   ArraySetAsSeries(Buffer4, true);
   //--- initial zero
   if(prev_calculated < 1)
     {
      ArrayInitialize(Buffer1, EMPTY_VALUE);
      ArrayInitialize(Buffer2, EMPTY_VALUE);
      ArrayInitialize(Buffer3, EMPTY_VALUE);
      ArrayInitialize(Buffer4, EMPTY_VALUE);
     }
   else
      limit++;
   datetime Time[];
   
   if(BarsCalculated(RSI_handle) <= 0) 
      return(0);
   if(CopyBuffer(RSI_handle, 0, 0, rates_total, RSI) <= 0) return(rates_total);
   ArraySetAsSeries(RSI, true);
   if(CopyClose(Symbol(), PERIOD_CURRENT, 0, rates_total, Close) <= 0) return(rates_total);
   ArraySetAsSeries(Close, true);
   if(CopyOpen(Symbol(), PERIOD_CURRENT, 0, rates_total, Open) <= 0) return(rates_total);
   ArraySetAsSeries(Open, true);
   if(CopyLow(Symbol(), PERIOD_CURRENT, 0, rates_total, Low) <= 0) return(rates_total);
   ArraySetAsSeries(Low, true);
   if(BarsCalculated(ATR_handle) <= 0) 
      return(0);
   if(CopyBuffer(ATR_handle, 0, 0, rates_total, ATR) <= 0) return(rates_total);
   ArraySetAsSeries(ATR, true);
   if(CopyHigh(Symbol(), PERIOD_CURRENT, 0, rates_total, High) <= 0) return(rates_total);
   ArraySetAsSeries(High, true);
   if(CopyTime(Symbol(), Period(), 0, rates_total, Time) <= 0) return(rates_total);
   ArraySetAsSeries(Time, true);
   //--- main loop
   for(int i = limit-1; i >= 0; i--)
     {
      if (i >= MathMin(5000-1, rates_total-1-50)) continue;   
      
      //Indicator Buffer 1
      if(RSI[i] < sobreventa
      && RSI[i+1] > sobreventa 
      && Close[i] < Open[i] 
      )
        {
         Buffer1[i] = Low[i] - ATR[i]; 
         if(i == 0 && Time[0] != time_alert) { myAlert("indicator", "Buy"); time_alert = Time[0]; } 
        }
      else
        {
         Buffer1[i] = EMPTY_VALUE;
        }
      //Indicator Buffer 2
      if(RSI[i] > sobrecompra
      && RSI[i+1] < sobrecompra 
      && Close[i] > Open[i] 
      )
        {
         Buffer2[i] = High[i] + ATR[i]; 
         if(i == 0 && Time[0] != time_alert) { myAlert("indicator", "Sell"); time_alert = Time[0]; }
        }
      else
        {
         Buffer2[i] = EMPTY_VALUE;
        }
      //Indicator Buffer 3
      if(RSI[1+i] < sobreventa
      && RSI[1+i+1] > sobreventa 
      && Close[1+i] < Open[1+i] 
      )
        {
         Buffer3[i] = Low[1+i] - ATR[i]; 
        }
      else
        {
         Buffer3[i] = EMPTY_VALUE;
        }
      //Indicator Buffer 4
      if(RSI[1+i] > sobrecompra
      && RSI[1+i+1] < sobrecompra 
      && Close[1+i] > Open[1+i] 
      )
        {
         Buffer4[i] = High[1+i] + ATR[i]; 
        }
      else
        {
         Buffer4[i] = EMPTY_VALUE;
        }
     }
   return(rates_total);
  }
//+------------------------------------------------------------------+