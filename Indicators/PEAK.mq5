//+------------------------------------------------------------------+
//|                                                         PEAK.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window
#property indicator_levelcolor clrDimGray
#property indicator_buffers 2
#property indicator_color1 clrGreen
#property indicator_color2 clrRed
#property indicator_level1 25.0
#property indicator_level2 15.0

input int     Len = 150;
input int     HistoryBars = 230;
input ENUM_TIMEFRAMES     TF1 = PERIOD_CURRENT;
input ENUM_TIMEFRAMES     TF2 = PERIOD_CURRENT;
input bool    ModeHL = true;
input bool    ModeOnline = true;
input bool    ModeinFile = false;
input bool    ModeHistory = false;
input bool    alert = false;
input bool    sound = false;
input bool    email = false;
input bool    GV = false;
input double  UrovenSignal = 25.0; 

double g_ibuf_148[];
double g_ibuf_152[];
double gd_156;
double gd_164;
double gd_172;
int gi_188;
int g_shift_192;
int gi_196;
int g_shift_200;
int g_count_208;
double gd_212;
double gd_220;
double gd_228;
double gd_236;
double gd_244;
double gd_252;
double gda_260[][1000];
double gda_264[][1000];
double gda_268[][1000];
int g_timeframe_272;
int g_datetime_276;
int gi_280;
bool gi_284;
int g_file_288;
bool gi_292;

ENUM_TIMEFRAMES TF2_=TF2;
ENUM_TIMEFRAMES TF1_=TF1;
int HistoryBars_=HistoryBars;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   if (ModeinFile) FileDelete(Symbol() + "-SP-" + EnumToString((ENUM_TIMEFRAMES) Period()) + ".ini");
   if (TF2_ == 0) TF2_ = (ENUM_TIMEFRAMES) Period();
   HistoryBars_ = int(NormalizeDouble(HistoryBars_ / double(TF2_ / Period()), 0));
   SetIndexBuffer(0, g_ibuf_148);
   SetIndexBuffer(1, g_ibuf_152);
   PlotIndexGetInteger(0,PLOT_DRAW_TYPE,DRAW_LINE);
   PlotIndexGetInteger(1,PLOT_DRAW_TYPE,DRAW_LINE);
   //SetIndexStyle(1, DRAW_LINE, STYLE_SOLID, 2);
   ArrayResize(gda_260, HistoryBars_ + Len);
   ArrayResize(gda_264, HistoryBars_ + Len);
   ArrayResize(gda_268, HistoryBars_ + Len);
   g_timeframe_272 = Period();
   if (ModeinFile) g_file_288 = FileOpen(Symbol() + "-SP-" + EnumToString((ENUM_TIMEFRAMES)Period()) + ".ini", FILE_WRITE, " ");
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &Time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   ArraySetAsSeries(Time,true);
   int count_0;
   int li_4;
   int li_12;
   int li_20;
   int str2time_24;
   int str2int_28;
   int str2int_32;
   int file_36;
   int li_16=0;
   
   if (ModeOnline || ModeinFile) {
      if (iTime(NULL, TF2_, 0) == g_datetime_276) return (0);
      g_datetime_276 = int(iTime(NULL, TF2_, 0));
      gi_188 = HistoryBars_ + Len;
      Print(gi_188);
      ArrayResize(gda_260,gi_188*250);
      ArrayResize(gda_264,gi_188*250);
      ArrayResize(gda_268,gi_188*250);
      for (gi_188; gi_188 > 0; gi_188--) {
         g_shift_200 = iBarShift(NULL, TF1_, iTime(NULL, TF2_, gi_188),false);
         count_0 = 0;
         Print(g_shift_200);
         for (g_shift_192 = g_shift_200; g_shift_192 > g_shift_200 - TF2_; g_shift_192--) {
             Print(g_shift_192);
            gda_260[gi_188][count_0] = iClose(NULL, TF1_, g_shift_192);
            Print("ACA");
            if (ModeHL) gda_264[gi_188][count_0] = iHigh(NULL, TF1_, g_shift_192);
            else gda_264[gi_188][count_0] = MathMax(iOpen(NULL, TF1_, g_shift_192), iClose(NULL, TF1_, g_shift_192));
            if (ModeHL) gda_268[gi_188][count_0] = iLow(NULL, TF1_, g_shift_192);
            else gda_268[gi_188][count_0] = MathMin(iOpen(NULL, TF1_, g_shift_192), iClose(NULL, TF1_, g_shift_192));
            count_0++;
         }
      }
        
      li_4 = int(NormalizeDouble((Bars(Symbol(),PERIOD_CURRENT) - IndicatorCountedMQL4(prev_calculated)) / (TF2_ / Period()), 0));
      if (ModeOnline && (!MQLInfoInteger(MQL_TESTER))) li_4 = HistoryBars_;
      for (gi_188 = li_4; gi_188 > 0; gi_188--) {
         g_count_208 = 0;
         gd_228 = 0;
         gd_236 = 0;
         gd_212 = 0;
         gd_220 = 1000000;
         while (g_count_208 < Len) {
            gi_196 = gi_188 + g_count_208;
            gd_244 = 0;
            gd_252 = 0;
            for (int count_8 = 0; count_8 < TF2_; count_8++) {
               if (gda_260[gi_196][count_8] > 0.0) gd_156 = gda_260[gi_196][count_8];
               if (gda_264[gi_196][count_8] > 0.0) gd_164 = gda_264[gi_196][count_8];
               if (gda_268[gi_196][count_8] > 0.0) gd_172 = gda_268[gi_196][count_8];
               if (gd_164 > gd_212) {
                  gd_212 = gd_164;
                  gd_244 += gd_156;
               }
               if (gd_172 < gd_220) {
                  gd_220 = gd_172;
                  gd_252 += gd_156;
               }
            }
            if (gd_244 > 0.0) gd_228 += gd_244;
            if (gd_252 > 0.0) gd_236 += gd_252;
            g_count_208++;
         }
         if (gd_228 > 0.0 && gd_236 > 0.0) {
            if (ModeinFile && gi_280 != Time[gi_188]) {
               gi_280 = int( Time[gi_188]);
               string Tiempo=TimeToString(Time[gi_188],TIME_DATE);
               FileWrite(g_file_288, StringConcatenate( Tiempo, ";", DoubleToString(gd_228 / gd_236, 0), ";", DoubleToString(gd_236 / gd_228, 0)));
            }
            li_12 = iBarShift(NULL, 0, iTime(NULL, TF2_, gi_188));
            for (li_16 = li_12; li_16 > li_12 - TF2_ / Period(); li_16--) {
               g_ibuf_148[li_16] = gd_228 / gd_236;
               g_ibuf_152[li_16] = gd_236 / gd_228;
            }
         }
      }
   }
   if (ModeHistory && (!ModeOnline) && (!ModeinFile) && gi_284 == false) {
      gi_284 = true;
      file_36 = FileOpen(Symbol() + "-SP-" + EnumToString((ENUM_TIMEFRAMES) TF2_) + ".ini", FILE_READ);
      while (!FileIsEnding(file_36)) {
         str2time_24 =int( StringToTime(FileReadString(file_36,-1)));
         str2int_28 = int(StringToInteger(FileReadString(file_36,-1)));
         str2int_32 = int(StringToInteger(FileReadString(file_36,-1)));
         li_20 = iBarShift(NULL, 0, str2time_24, false);
         for (int li_40 = li_20; li_40 > li_20 - TF2_ / Period(); li_40--) {
            g_ibuf_148[li_40] = str2int_28;
            g_ibuf_152[li_40] = str2int_32;
         }
      }
      FileClose(file_36);
   }
   string ls_44 = "";
   if (sound || alert || email || GV) {
      if (g_ibuf_148[li_16 + 1] > UrovenSignal && g_ibuf_148[li_16 + 1] < 1000000.0) ls_44 = Symbol() + " Signal " + MQLInfoString(MQL_PROGRAM_NAME)+ " BUY ( " + DoubleToString(g_ibuf_148[li_16 + 1], 1) + " )";
      if (g_ibuf_152[li_16 + 1] > UrovenSignal && g_ibuf_152[li_16 + 1] < 1000000.0) ls_44 = Symbol() + " Signal " + MQLInfoString(MQL_PROGRAM_NAME) + " SELL ( " + DoubleToString(g_ibuf_152[li_16 + 1], 1) + " )";
      if (GV && (!MQLInfoInteger(MQL_TESTER))) GlobalVariableSet(Symbol() + MQLInfoString(MQL_PROGRAM_NAME), g_ibuf_148[li_16 + 1] - (g_ibuf_152[li_16 + 1]));
      if (ls_44 != "" && (!MQLInfoInteger(MQL_TESTER))) {
         if (sound && gi_292 == false) PlaySound("Wait.wav");
         if (alert && gi_292 == false) Alert(ls_44);
         if (email && gi_292 == false) f0_0(ls_44);
         gi_292 = true;
      } else gi_292 = false;
   }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
				 	 		  		   	  	  		  	 	 			 		 			  	 	 		 	  					 				 	 		   	 	  	  		 	 		 	  				     	 	  	     	 	 	 	 	   			    		 	  			 	 		   
void f0_0(string as_0) {
   if (MQLInfoInteger(MQL_TESTER) == false && MQLInfoInteger(MQL_OPTIMIZATION) == false && MQLInfoInteger(MQL_VISUAL_MODE) == false) SendMail(MQLInfoString(MQL_PROGRAM_NAME), as_0);
}
	 		 	  		 		  			 	  	  		 	 	 				 		  		 	 	     			 						    	   				 	  	    		 		  			  	 		 	    	   	     	 	 	  		   		  	  	 			 		 	 
void deinit() {
   if (ModeinFile) FileClose(g_file_288);
}

int IndicatorCountedMQL4(int prev_calculated)
  {
   if(prev_calculated>0) return(prev_calculated-1);
   if(prev_calculated==0) return(0);
   return(0);
  }