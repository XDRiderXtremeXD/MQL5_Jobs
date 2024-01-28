//+------------------------------------------------------------------+
//|                                                 Authorized...mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, SSBO Team"
#property link      "http://www.forexfactory.com/showthread.php?t=302007"

#property indicator_chart_window
#property indicator_buffers 8

#define  OP_BUY 0
#define  OP_SELL 1
#define  SYMBOL_RIGHTPRICE 6

extern int       BoxLength                        = 21;
extern double    BoxRange                         = 28;
extern string    BoxTimeFrame                     = "0";
extern double    BoxBufferPips                    = 1;
extern int       MinBarsClosedOutsideBO           = 0;
extern int       MaxBreakoutTradesPerBox          = 4;
extern bool      InitialBreakoutDirectionOnly     = false;
extern bool      LongTrades                       = true;
extern bool      ShortTrades                      = true;
extern double    QuickTakeProfit                  = 20;
extern double    StopLossOverride                 = 0;
extern double    EmergencyStopLoss                = 100;
extern bool      BoxMartingale                    = true;
extern bool      AutoReduceBoxSize                = true;
extern int       DaysBack                         = 100;
extern bool      SignalMail                       = false;
extern bool      SignalAlert                      = false;
// cosmetics inputs
extern bool      ShowFibs                         = false;
extern string    FibSequence                      = "0.618,1.382,2.618,4.236,5.854,7.472,9.090,11.708,14.326";
extern int       FibsFontSize                     = 9;
extern color     FibsLinesColor                   = LightGray;
extern int       FibsLinesWidth                   = 1;
extern bool      ShowSwings                       = false;
extern int       SwingsFontSize                   = 9;
extern color     SwingsLinesColor                 = Wheat;
extern int       SwingsLinesWidth                 = 1;
extern int       BoxFontSize                      = 9;
extern color     BoxColor                         = 11184640;
extern color     ContBoxColor                     = DarkSlateGray;
extern bool      ContBoxFullColored               = true;
extern color     BoxBufferLinesColor              = 11184640;
extern int       BoxBufferLinesWidth              = 2;
extern color     ContBoxBufferLinesColor          = DarkSlateGray;
extern int       ContBoxBufferLinesWidth          = 1;
extern color     BreakoutPriceColor               = 11184640;
extern int       BreakoutPriceWidth               = 2;
extern color     ContBoxPriceColor                = DarkSlateGray;
extern int       ChartDisplay                     = 3;
extern int       DisplayPanelFontSize             = 11;
extern color     StatsColor                       = Black;
extern color     StatsBGColor                     = DarkSalmon;
extern color     PipsProfitColor                  = DarkGreen;
extern color     PipsLossColor                    = MediumVioletRed;
extern int       StatsCorner                      = 0;
extern bool      BoxVerticalLineDelimiter         = false;
extern color     BoxVerticalLineColor             = DarkSlateGray;
extern int       SwingLabelsFontSize              = 9;
extern color     SwingLabelsColor                 = Yellow;
extern int       BuySignalArrowCode               = 2;
extern color     BuySignalArrowColor              = 11193702;
extern int       BuySignalArrowWidth              = 3;
extern int       SellSignalArrowCode              = 2;
extern color     SellSignalArrowColor             = 5275647;
extern int       SellSignalArrowWidth             = 3;
extern string    Fonts                            = "Calibri";

// AuthorizedSSBODynamicBreakoutBox by Squalou, fxspin and xux99

//---- buffers
double highBO[],lowBO[],highBOcont[],lowBOcont[],BoxStart[],BoxEnd[],BuySignal[],SellSignal[];

bool open_new_box,FirstStart;
int _bounce_counts[],wins_bounce_counts[],_consecutive_losses, _curr_consecutive_losses,_consecutive_wins, _curr_consecutive_wins;
int tf,btf,InitialBreakoutDirection,space_font_size,num_long_boxes,num_short_boxes,LastTradeCloseTime,trigger_direction,LastTakeProfitTime;
int _period,_minP,_maxP,_prevP,BarsBack,lasttime,_trade_win_set, _trade_loss_set,last_trigger_direction,num_total_longs,num_total_shorts,num_boxes;
int num_wins,num_losses,win_set,loss_set,_box_curr_trade_dir, _box_total_trades, _box_profit_trades,counted_bars,num_closed_longs,num_closed_shorts;
int i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,e1,e2,z0,z1,z2,z3,k1,k2;
int TF[]= {0,1,5,15,30,60,240,1440,10080,43200};
ENUM_TIMEFRAMES TF2[]= {PERIOD_CURRENT,PERIOD_M1,PERIOD_M5,PERIOD_M15,PERIOD_M30,PERIOD_H1,PERIOD_H4,PERIOD_D1,PERIOD_W1,PERIOD_MN1};
double CZone[10000][6],TakeProfit,StopLoss,WinRatio,LblDst,BPips,closed_longs_profit,closed_shorts_profit,upper,lower,best_buy,best_sell;
double mult,SL_pips,total_losses,trade_set_win_ratio,closed_longs_loss,closed_shorts_loss,Tdist,LongBO,ShortBO,loss;
double Temp[200][200],d[500],Fib[20],tp_val,trigger_price,num_weeks,avgBuys,avgSells,_Range,upperBox,lowerBox;
double d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,g0,g1,g2,g3,g4,g5,g6,g7,g8,g9,f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,y0,m0,m1,m2,m3,m4,m5,m6,m7,m8,m9;
string Vs[50][450],prefix,s0,s1,s2,s3,s4,s5,s6,s7,s8,s9;
string bg_box_length,Empty;
string TimeFrame[]= {"0","M1","M5","M15","M30","H1","H4","D1","W1","MN"};
string op_str[6]= {"BUY","SELL","BUYLIMIT","SELLLIMIT","BUYSTOP","SELLSTOP"};
datetime _box_time,_box_curr_trade;
bool hola=false;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   mult=MathPow(10,(MathRound(Digits()*0.5)!=Digits()*0.5));
   TF[0]=Period();
   tf=(Period()==1)+(Period()==5)*2+(Period()==15)*3+(Period()==30)*4+(Period()==60)*5+(Period()==240)*6+(Period()==1440)*7+(Period()==10080)*8+(Period()==43200)*9;
   i2=0;
   i1=0;
   while(i1<=9 && i2==0)
     {
      i2=(BoxTimeFrame==TimeFrame[i1])*TF[i1];
      i1++;
     }
   i2+=(i2==0)*TF[0];
   btf=(i2==1)+(i2==5)*2+(i2==15)*3+(i2==30)*4+(i2==60)*5+(i2==240)*6+(i2==1440)*7+(i2==10080)*8+(i2==43200)*9;
   _Range=BoxRange*mult*Point();
   BPips=BoxBufferPips*mult*Point();
   bg_box_length=StringSubstr("ggggggggggggggggggggggggg",0,11);
   Empty="                                                                                                                                     ";
   i5=StringLen(FibSequence);
   i3=1;
   i1=0;
   while(i1<=i5-1)
     {
      i2=i1;
      while(i2<=i5-1 && StringSubstr(FibSequence,i2,1)!=",")
        {
         i2++;
        }
      s1=StringSubstr(FibSequence,i1,i2-i1);
      Fib[i3]=StringToDouble(s1);
      i3+=(i2-i1>0);
      i1=i2+1;
     }

   ArrayResize(_bounce_counts,MaxBreakoutTradesPerBox+1);
   ArrayResize(wins_bounce_counts,MaxBreakoutTradesPerBox+1);
   Tdist=4*mult*Point();
   LblDst=1;
   space_font_size=(int)MathMax(MathRound(DisplayPanelFontSize*1.4),15);
   last_trigger_direction=-1;
   closed_longs_profit=0;
   closed_shorts_profit=0;
   closed_longs_loss=0;
   closed_shorts_loss=0;
   num_total_longs=0;
   num_total_shorts=0;
   num_closed_longs=0;
   num_closed_shorts=0;
   num_boxes=0;
   total_losses =0;
   num_wins=0;
   num_losses=0;
   win_set=0;
   loss_set=0;
   _period=BoxLength*TF[btf]/TF[0];
   _minP=_period;
   _prevP=_period;
   lasttime=0;
   FirstStart=true;
   LongBO=0;
   ShortBO=0;
   num_long_boxes=0;
   num_short_boxes=0;
   LastTradeCloseTime=0;
   LastTakeProfitTime=0;
   DaysBack+=(DaysBack==0)*9999;
   BarsBack=MathMax(0,MathMin(iBars(Symbol(),0),iBarShift(Symbol(),0,iTime(Symbol(),PERIOD_D1,0)-DaysBack*PERIOD_D1*60)));

   Vs[30][2]="SSBO ";
   prefix=Vs[30][2];
   s1=Vs[30][2];
   Vs[32][21]=StringConcatenate_(s1,"Box ");
   Vs[32][22]=StringConcatenate_(s1,"High line ");
   Vs[32][23]=StringConcatenate_(s1,"Low line ");
   Vs[32][24]=StringConcatenate_(s1,"High box label  ");
   Vs[32][25]=StringConcatenate_(s1,"Low box label  ");
   Vs[32][40]=StringConcatenate_(s1,"Box info ");
   Vs[32][31]=StringConcatenate_(s1,"Cont box ");
   Vs[32][32]=StringConcatenate_(s1,"High cont line ");
   Vs[32][33]=StringConcatenate_(s1,"Low cont line ");
   Vs[32][34]= StringConcatenate_(s1,"High breakout label ");
   Vs[32][35]=StringConcatenate_(s1,"Low breakout label ");

   i1=1;
   while(i1<=2)
     {
      i2=1;
      while(i2<=19 && Fib[i2]>0)
        {
         Vs[32][i1*20+i2+20]=StringConcatenate_(s1,CharToString(43+(i1==2)*2),Fib[i2]," Fib ");
         i2++;
        }
      i1++;
     }

   IndicatorSetString(INDICATOR_SHORTNAME,StringConcatenate_(MQLInfoString(MQL_PROGRAM_NAME)," (",BoxRange,"p x ",BoxLength,"b)"));

   i1=-1;
   i1++;
   SetIndexBuffer(i1,highBO,INDICATOR_DATA);
   PlotIndexSetInteger(i1,PLOT_DRAW_TYPE,DRAW_NONE);
   i1++;
   SetIndexBuffer(i1,lowBO,INDICATOR_DATA);
   PlotIndexSetInteger(i1,PLOT_DRAW_TYPE,DRAW_NONE);
   i1++;
   SetIndexBuffer(i1,highBOcont,INDICATOR_DATA);
   PlotIndexSetInteger(i1,PLOT_DRAW_TYPE,DRAW_NONE);
   i1++;
   SetIndexBuffer(i1,lowBOcont,INDICATOR_DATA);
   PlotIndexSetInteger(i1,PLOT_DRAW_TYPE,DRAW_NONE);
   i1++;
   SetIndexBuffer(i1,BoxStart,INDICATOR_DATA);
   PlotIndexSetInteger(i1,PLOT_DRAW_TYPE,DRAW_NONE);
   i1++;
   SetIndexBuffer(i1,BoxEnd,INDICATOR_DATA);
   PlotIndexSetInteger(i1,PLOT_DRAW_TYPE,DRAW_NONE);
   i1++;
   SetIndexBuffer(i1,BuySignal,INDICATOR_DATA);
   PlotIndexSetInteger(i1,PLOT_DRAW_TYPE,DRAW_NONE);
   i1++;
   SetIndexBuffer(i1,SellSignal,INDICATOR_DATA);
   PlotIndexSetInteger(i1,PLOT_DRAW_TYPE,DRAW_NONE);

   Print(i2);
   return INIT_SUCCEEDED;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {RemoveObjects(prefix);}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,       // tamaño de series temporales de entrada
                const int prev_calculated,  // procesado de barras en la anterior llamada
                const datetime& Time[],     // Time
                const double& Open[],       // Open
                const double& High[],       // High
                const double& Low[],        // Low
                const double& Close[],      // Close
                const long& Tick_volume[],  // Tick Volume
                const long& Volume[],       // Real Volume
                const int& Spread[]         // Spread
               )
  {


   ArraySetAsSeries(Time,true);
   ArraySetAsSeries(Open,true);
   ArraySetAsSeries(High,true);
   ArraySetAsSeries(Low,true);
   ArraySetAsSeries(Close,true);
   ArraySetAsSeries(Tick_volume,true);
   ArraySetAsSeries(Volume,true);
   ArraySetAsSeries(Spread,true);

   if(FirstStart)
     {
      FirstStart=false;
      RemoveObjects(prefix);
      ArrayInitialize(highBO,EMPTY_VALUE);
      ArrayInitialize(lowBO,EMPTY_VALUE);
      ArrayInitialize(highBOcont,EMPTY_VALUE);
      ArrayInitialize(lowBOcont,EMPTY_VALUE);
      ArrayInitialize(BoxStart,0);
      ArrayInitialize(BoxEnd,0);
      ArrayInitialize(BuySignal,0);
      ArrayInitialize(SellSignal,0);
      ArrayInitialize(_bounce_counts,0);
      ArrayInitialize(wins_bounce_counts,0);
     }

   if(lasttime!=Time[0])
     {
      lasttime=Time[0];
      counted_bars=prev_calculated;
      k2=MathMax(MathMin(BarsBack,rates_total-counted_bars-2),1);
      k1=k2;
      while(k1>0 && k1<=rates_total-2)
        {
         // get the period over which PA Range remained below BoxRange
         i2=_period;

         if(hola==false)
           {
            Print(k1," ",_minP," ",_Range," ",i2," ",_period," ",_minP);
           }

         _period=GetPeriodForMinRange(k1,_minP,999,_Range,i2,High,Low);
         upper = High[iHighest(Symbol(),TF2[0], MODE_HIGH, _period, k1)];
         lower = Low [iLowest(Symbol(),TF2[0], MODE_LOW,  _period, k1)];

         // continue the previous Box high/low lines
         highBOcont[k1]=highBOcont[k1+1];
         lowBOcont[k1]=lowBOcont[k1+1];
         BoxStart[k1]=BoxStart[k1+1];
         BoxEnd[k1]=BoxEnd[k1+1];

         if(hola==false)
           {
            Print(k1," ",_minP," ",_Range," ",i2," ",_period," ",_minP);
           }
         hola=true;
         //draw a Dynamic Breakout Box when Price Range remains below BoxRange during more than BoxLength
         if(_period > _minP && k1+_minP<rates_total-2)    // Price range remained below BoxRange longer than BoxLength:
           {
            // draw a new Breakout Box, or extend the Box if one is already drawing
            open_new_box =(_box_total_trades ==0 || (_box_total_trades >= MaxBreakoutTradesPerBox && !has_open_trade()));
            if(highBO[k1+1]==EMPTY_VALUE && lowBO[k1+1]==EMPTY_VALUE && open_new_box)    // no Box was forming:
              {
               // start a new Box ONLY if a the previous Box is older than BoxLength
               if(highBO[k1+_minP]==EMPTY_VALUE && lowBO[k1+_minP]==EMPTY_VALUE)
                 {
                  if(BoxEnd[k1+1]>0 && _box_total_trades>0)
                    {
                     i3=iBarShift(Symbol(),TF2[0],BoxEnd[k1+1]);
                     d1=iHigh(Symbol(),TF2[0],iHighest(Symbol(),TF2[0],MODE_HIGH,i3-k1-1,k1+1))-highBOcont[k1+1]+BPips;
                     d1*=(d1>0);
                     LongBO+=d1;
                     num_long_boxes+=(d1>0);
                     d1=lowBOcont[k1+1]+BPips-iLow(Symbol(),TF2[0],iLowest(Symbol(),TF2[0],MODE_LOW,i3-k1-1,k1+1));
                     d1*=(d1>0);
                     ShortBO+=d1;
                     num_short_boxes+=(d1>0);
                    }
                  // we can draw a new Box now
                  // limit the Box Range to BoxRange;
                  // snap the Box to the extreme that is opposite of the first(oldest) candle of the Box
                  if(High[k1+_period-1]==upper)
                    {
                     upper = NormalizeDouble(lower+_Range,Digits());
                    }
                  if(Low[k1+_period-1]==lower)
                    {
                     lower = NormalizeDouble(upper-_Range,Digits());
                    }
                  upperBox=upper;
                  lowerBox=lower;
                  _box_total_trades =0;
                  TakeProfit=QuickTakeProfit;
                  // draw High and Low lines starting from the beginning of the Box
                  i2=k1+_minP-1;
                  while(i2>=k1)
                    {
                     highBO[i2]=upperBox+BPips;
                     lowBO[i2]=lowerBox-BPips;
                     i2--;
                    }
                  last_trigger_direction=-1;
                  num_boxes+=1;
                  highBOcont[k1]=highBO[k1];
                  lowBOcont[k1]=lowBO[k1];
                  BoxStart[k1]=iTime(Symbol(),TF2[0],k1+_minP-1);
                  BoxEnd[k1]=iTime(Symbol(),TF2[0],k1);
                  if(BoxVerticalLineDelimiter)
                    {
                     Print("ACA");
                     drawVLine(StringConcatenate_(prefix,"V",TimeToString(BoxStart[k1])),BoxEnd[k1],BoxVerticalLineColor,STYLE_SOLID,1,0);
                    }
                 }
              }
            else     // a Box was already forming:
              {
               // extend it ONLY IF price did not break out already
               if(Low[k1]>=lowBO[k1+1] && High[k1]<=highBO[k1+1])
                 {
                  i3=iBarShift(Symbol(),TF2[0],BoxStart[k1]);
                  if(AutoReduceBoxSize)
                    {
                     upperBox=MathMin(upperBox,iHigh(Symbol(),TF2[0],iHighest(Symbol(),TF2[0],MODE_HIGH,i3-k1+1,k1)));
                     lowerBox=MathMax(lowerBox,iLow(Symbol(),TF2[0],iLowest(Symbol(),TF2[0],MODE_LOW,i3-k1+1,k1)));
                    }
                  // price is still inside the Box limits: extend the forming Box
                  // draw High and Low Yellow lines starting from the beginning of the Box
                  i2=i3;
                  while(i2>=k1)
                    {
                     highBO[i2]=upperBox+BPips;
                     lowBO[i2]=lowerBox-BPips;
                     i2--;
                    }
                  highBOcont[k1]=highBO[k1];
                  lowBOcont[k1]=lowBO[k1];
                  BoxEnd[k1]=iTime(Symbol(),TF2[0],k1);

                  if(BoxVerticalLineDelimiter)
                    {
                     Print("ACA");
                     drawVLine(StringConcatenate_(prefix,"V",TimeToString(BoxStart[k1])),BoxEnd[k1], BoxVerticalLineColor,STYLE_SOLID,1,0);
                    }
                 }
               else
                 {
                  // Price has broken out of the forming Box: stop the forming Box
                  highBO[k1]=EMPTY_VALUE;
                  lowBO[k1]=EMPTY_VALUE;
                 }
              }
           }
         CZone[num_boxes][1]=BoxStart[k1];
         CZone[num_boxes][2]=BoxEnd[k1];
         CZone[num_boxes][3]=iTime(Symbol(),TF2[0],k1);
         CZone[num_boxes][4]=highBOcont[k1];
         CZone[num_boxes][5]=lowBOcont[k1];
         calc_tp_sl(k1,best_buy,best_sell,Time,Close,Open,Low,High);
         manage_signals(k1,Close,Time,Open,High,Low);
         DrawGraphics(BPips,k1,TF2[0]);
         k1--;
        }
      highBOcont[k1]=highBOcont[k1+1];
      lowBOcont[k1]=lowBOcont[k1+1];
      BoxStart[k1]=BoxStart[k1+1];
      BoxEnd[k1]=BoxEnd[k1+1];
     }

   calc_tp_sl(0,best_buy,best_sell,Time,Close,Open,Low,High);
   manage_signals(0,Close,Time,Open,High,Low);
   display_stats(Time);
   return rates_total;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void calc_tp_sl(int t8, double &best_buy, double &best_sell,const datetime &Time[],const double &Close[],const double &Open[],const double&Low[],const double&High[])
  {

   double ATR[];
   ArrayResize(ATR,1);

   if(!has_open_trade())
     {
      return;
     }
   int highest_bar,lowest_bar;
   double highest_price,lowest_price,trade_open_price,trade_SL;
   int trade_type,trade_open_bar,num_trades;
   int trade_size = 1;

   if(BoxMartingale)
     {
      trade_size=MathPow(2,_box_total_trades-1);
     }

   int box_forming_shift = iBarShift(Symbol(),0,BoxStart[t8]);
   if(t8>box_forming_shift)
     {
      return;
     }
   trade_open_bar = iBarShift(Symbol(), 0, _box_curr_trade);
   trade_open_price = Open[trade_open_bar];
   trade_type = -1;
   num_trades = 0;
   tp_val = TakeProfit;

   int lowIndex, highIndex;
   string end_swing = prefix+"EndSwing"+TimeToString(_box_curr_trade);
   if(ObjectFind(0,end_swing)!=-1)
     {
      return;
     }

   double tp;
   switch(_box_curr_trade_dir)
     {

      case 0: // a BUY trade is open: check if it hit the SL = opposite CZ side
         if(MinBarsClosedOutsideBO==0)
           {
            trade_open_price=highBOcont[t8]+Point();
           }
         lowest_bar=0;
         highest_bar=0;
         tp=trade_open_price+tp_val*mult*Point();

         if(StopLossOverride==0)
           {
            trade_SL=lowBOcont[t8]+BPips;
           }
         if(StopLossOverride>0)
           {
            trade_SL=trade_open_price-StopLossOverride*mult*Point();
           }

         if(Low[t8] <= trade_SL)
           {
            lowest_bar = t8;
           }
         if(High[t8] >= tp)
           {
            highest_bar = t8;
           }

         highest_price = High[highest_bar];

         if(tp < highest_price)
           {
            highest_price = tp;
           }

         lowest_price  = Low[lowest_bar];
         best_buy = (highest_price - trade_open_price)/(mult*Point());

         if(lowest_price<=trade_SL && lowest_bar>=0)   // SL was hit at opposite CZ side: "close" the trade
           {
            _bounce_counts[_box_total_trades]+=1;
            num_closed_longs=num_total_longs;
            trade_type = -1;
            loss = -(trade_open_price-trade_SL)/(mult*Point());
            LastTradeCloseTime=iTime(Symbol(),TF2[0],t8);
            if(_box_total_trades==1)
              {
               TakeProfit=MathAbs(loss);
              }
            loss*=trade_size;
            int atr=iATR(Symbol(),TF2[0],7);
            CopyBuffer(atr,0,lowest_bar,1,ATR);

            drawLbl(prefix+"SwingHigh"+TimeToString(Time[trade_open_bar]),DoubleToString(loss,(MathRound(loss*10)!=MathRound(loss)*10))+"p", Time[lowest_bar],lowest_price-LblDst*ATR[0], SwingLabelsFontSize, Fonts, SwingLabelsColor, 3);
            drawTrendLine(prefix+"TLSwing"+TimeToString(Time[trade_open_bar]), Time[trade_open_bar], trade_open_price, Time[lowest_bar], trade_SL, SwingLabelsColor, STYLE_DOT, 0);
            drawOrderArrow(prefix+"EndSwing"+TimeToString(Time[trade_open_bar]), Time[lowest_bar], trade_SL, 3, SwingLabelsColor, 2);

            closed_longs_loss+=loss;
            total_losses+=loss;
            num_losses+=1;
            if(_box_total_trades>=MaxBreakoutTradesPerBox)
              {
               _trade_loss_set+=1;
              }
            _curr_consecutive_losses+=1;
            _curr_consecutive_wins=0;
           }

         if(highest_bar >= 0)
           {
            _bounce_counts[_box_total_trades]+=1;
            wins_bounce_counts[_box_total_trades]+=1; // TP
            num_closed_longs=num_total_longs;
            best_buy*=trade_size;
            LastTradeCloseTime=iTime(Symbol(),TF2[0],t8);
            LastTakeProfitTime=iTime(Symbol(),TF2[0],t8);
            int atr=iATR(Symbol(),TF2[0],7);
            CopyBuffer(atr,0,highest_bar,1,ATR);
            drawLbl(prefix+"SwingHigh"+TimeToString(Time[trade_open_bar]), DoubleToString(best_buy,(MathRound(best_buy*10)!=MathRound(best_buy)*10))+"p", Time[highest_bar], highest_price+LblDst*ATR[0], SwingLabelsFontSize, Fonts, SwingLabelsColor, 3);
            drawTrendLine(prefix+"TLSwing"+TimeToString(Time[trade_open_bar]), Time[trade_open_bar], trade_open_price, Time[highest_bar], highest_price, SwingLabelsColor, STYLE_DOT, 0);
            drawOrderArrow(prefix+"EndSwing"+TimeToString(Time[trade_open_bar]), Time[highest_bar], highest_price, 3, SwingLabelsColor, 2);
            num_wins+=1;
            closed_longs_profit+=best_buy;
            _trade_win_set +=1;
            _curr_consecutive_losses = 0;
            _curr_consecutive_wins += 1;
           }
         break;

      case 1: // a SELL trade is open: check if it hit the SL = opposite CZ side
         if(MinBarsClosedOutsideBO==0)
           {
            trade_open_price=lowBOcont[t8]-Point();
           }
         lowest_bar = 0;
         highest_bar = 0;
         tp = trade_open_price - (tp_val*mult*Point()) ;
         if(StopLossOverride==0)
           {
            trade_SL=highBOcont[t8]-BPips;
           }
         if(StopLossOverride>0)
           {
            trade_SL=trade_open_price+StopLossOverride*mult*Point();
           }

         if(High[t8] >= trade_SL)
           {
            highest_bar = t8;
           }
         if(Low[t8] <= tp)
           {
            lowest_bar = t8;
           }

         highest_price = High[highest_bar];
         lowest_price  = Low[lowest_bar];

         if(tp > lowest_price)
           {
            lowest_price = tp;
           }
         best_sell = (trade_open_price - lowest_price)/(mult*Point());

         if(highest_price >= trade_SL && highest_bar >= 0)   // SL was hit at opposite CZ side: "close" the trade
           {
            _bounce_counts[_box_total_trades]+=1;
            num_closed_shorts=num_total_shorts;
            trade_type = -1;
            loss = (trade_open_price-trade_SL)/(mult*Point());
            LastTradeCloseTime=iTime(Symbol(),TF2[0],t8);
            if(_box_total_trades==1)
              {
               TakeProfit=MathAbs(loss);
              }
            loss*=trade_size;
            int atr=iATR(Symbol(),TF2[0],7);
            CopyBuffer(atr,0,highest_bar,1,ATR);
            drawLbl(prefix+"SwingLow"+TimeToString(Time[trade_open_bar]), DoubleToString(loss,(MathRound(loss*10)!=MathRound(loss)*10))+"p", Time[highest_bar],trade_SL+LblDst*ATR[0], SwingLabelsFontSize, Fonts, SwingLabelsColor, 3); //High[highest_bar]
            drawTrendLine(prefix+"TLSwing"+TimeToString(Time[trade_open_bar]), Time[trade_open_bar], trade_open_price, Time[highest_bar], trade_SL, SwingLabelsColor, STYLE_DOT, 0);
            drawOrderArrow(prefix+"EndSwing"+TimeToString(Time[trade_open_bar]), Time[highest_bar], trade_SL, 3, SwingLabelsColor, 2);

            _curr_consecutive_losses += 1;
            _curr_consecutive_wins = 0;
            closed_shorts_loss+=loss;
            total_losses+=loss;
            num_losses+=1;
            if(_box_total_trades >= MaxBreakoutTradesPerBox)
              {
               _trade_loss_set += 1;
              }

           }
         if(lowest_bar>=0)
           {
            _bounce_counts[_box_total_trades]+=1;
            wins_bounce_counts[_box_total_trades]+=1; // TP
            num_closed_shorts=num_total_shorts;
            best_sell*=trade_size;
            LastTradeCloseTime=iTime(Symbol(),TF2[0],t8);
            LastTakeProfitTime=iTime(Symbol(),TF2[0],t8);
            int atr=iATR(Symbol(),TF2[0],7);
            CopyBuffer(atr,0,lowest_bar,1,ATR);
            drawLbl(prefix+"SwingLow"+TimeToString(Time[trade_open_bar]), DoubleToString(best_sell,(MathRound(best_sell*10)!=MathRound(best_sell)*10))+"p", Time[lowest_bar], lowest_price-LblDst*ATR[0], SwingLabelsFontSize, Fonts, SwingLabelsColor, 3); //q
            drawTrendLine(prefix+"TLSwing"+TimeToString(Time[trade_open_bar]), Time[trade_open_bar], trade_open_price, Time[lowest_bar], lowest_price, SwingLabelsColor, STYLE_DOT, 0);
            drawOrderArrow(prefix+"EndSwing"+TimeToString(Time[trade_open_bar]), Time[lowest_bar], lowest_price, 3, SwingLabelsColor, 2);
            num_wins+=1;
            closed_shorts_profit+=best_sell;
            _trade_win_set+=1;
            _curr_consecutive_losses = 0;
            _curr_consecutive_wins +=1;
           }
         break;

     }

   if(_curr_consecutive_losses > _consecutive_losses)
     {
      _consecutive_losses = _curr_consecutive_losses;
     }
   if(_curr_consecutive_wins > _consecutive_wins)
     {
      _consecutive_wins = _curr_consecutive_wins;
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void manage_signals(int t8,const double &Close[],const datetime &Time[],const double &Open[],const double &High[],const double &Low[])
  {
   trigger_direction =-1;
   if(BoxStart[t8]!=_box_time)
     {_box_time=BoxStart[t8]; _box_curr_trade=0; _box_curr_trade_dir=-1; _box_total_trades=0; _box_profit_trades=0;}

   if(LastTakeProfitTime==iTime(Symbol(),TF2[0],t8))
     {
      _box_total_trades=MaxBreakoutTradesPerBox+2;
     }
   if(_box_total_trades>=MaxBreakoutTradesPerBox)
     {
      return;
     }
   if(BoxStart[t8]==0 || has_open_trade() || (LastTradeCloseTime==iTime(Symbol(),TF2[0],t8) && MinBarsClosedOutsideBO>0))
     {
      return;
     }

// Trading Signal Alerts: a minimum number of bars should have closed outside of the BO area
// MinBarsClosedOutsideBO set to 0 means we can start the sequence as soon as the breakout occurs
   if(MinBarsClosedOutsideBO==0)
     {
      // special case: we want to trigger the trade as soon as price break out of the CZ Box
      if(Close[t8+1]<=highBOcont[t8] && High[t8]>highBOcont[t8])
        {
         trigger_direction=OP_BUY;
         trigger_price=highBOcont[t8]+Point();
        }
      if(Close[t8+1]>=lowBOcont[t8] && Low[t8]<lowBOcont[t8])
        {
         trigger_direction=OP_SELL;
         trigger_price=lowBOcont[t8]+Point();
        }
     }
   if(MinBarsClosedOutsideBO>=1)
     {
      CopyClose(Symbol(),TF2[0],0,500,d);
      // ArrayCopySeries(d,MODE_CLOSE,Symbol(),TF[0]);
      d1=iClose(Symbol(),TF2[0],t8+MinBarsClosedOutsideBO+1);
      Temp[0][1]=d[ArrayMinimum(d,MinBarsClosedOutsideBO,t8+1)];
      Temp[0][2]=d[ArrayMaximum(d,MinBarsClosedOutsideBO,t8+1)];
      Temp[0][3]=highBOcont[t8];
      Temp[0][4]=lowBOcont[t8];
      t4=0;
      t1=1;
      while(t1<=2 && t4==0)
        {
         t5=(3-t1*2);
         t4=(t5*(Temp[0][t1]-Temp[0][t1+2])>0 && t5*(Temp[0][t1+2]-d1)>=0 && d1>0 && Temp[0][t1]>0 && Temp[0][t1+2]>0)*t1;
         t1++;
        }
      if(t4==1)
        {
         trigger_direction=OP_BUY;
         trigger_price=Open[t8];
        }
      if(t4==2)
        {
         trigger_direction=OP_SELL;
         trigger_price=Open[t8];
        }
     }

   if(trigger_direction==OP_BUY && LongTrades && (InitialBreakoutDirection==OP_BUY || !InitialBreakoutDirectionOnly || _box_total_trades==0))
     {
      BuySignal[t8]=trigger_price; // make the arrow point to the trade open price
      last_trigger_direction=OP_BUY;
      _box_curr_trade=Time[t8];
      _box_curr_trade_dir=OP_BUY;
      _box_total_trades+=1;
      if(_box_total_trades==1)
        {
         InitialBreakoutDirection=OP_BUY;
        }
      num_total_longs+=1;
      s1=StringConcatenate_(prefix,"BUY",TimeToString(Time[t8]));
      drawOrderArrow(s1,Time[t8],trigger_price,BuySignalArrowCode,BuySignalArrowColor, 2);
      if(t8==0)
        {
         send_trading_signal(OP_BUY,SymbolInfoDouble(Symbol(),SYMBOL_ASK));
        }
     }

   if(trigger_direction==OP_SELL && ShortTrades && (InitialBreakoutDirection==OP_SELL || !InitialBreakoutDirectionOnly || _box_total_trades==0))
     {
      SellSignal[t8] = trigger_price; // make the arrow point to the trade open price
      last_trigger_direction=OP_SELL;
      _box_curr_trade=Time[t8];
      _box_curr_trade_dir=OP_SELL;
      _box_total_trades+=1;
      if(_box_total_trades==1)
        {
         InitialBreakoutDirection=OP_SELL;
        }
      num_total_shorts +=1;
      s1=StringConcatenate_(prefix,"SELL",TimeToString(Time[t8]));
      drawOrderArrow(s1, Time[t8], trigger_price, SellSignalArrowCode, SellSignalArrowColor, 2);
      if(t8==0)
        {
         send_trading_signal(OP_SELL,SymbolInfoDouble(Symbol(),SYMBOL_BID));
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void send_trading_signal(int type, double price)
  {
   s1=StringConcatenate_(MQLInfoString(MQL_PROGRAM_NAME),":",StringSubstr(Symbol(),0,6)," ",op_str[type]," Signal");
   if(SignalMail)
     {
      SendMail(s1,StringConcatenate_(StringSubstr(Symbol(),0,6),":",op_str[type]," @ ",DoubleToString(price,Digits())));
     }
   if(SignalAlert)
     {
      Alert(s1);
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool has_open_trade()
  {return(num_total_longs>num_closed_longs || num_total_shorts>num_closed_shorts);}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetPeriodForMinRange(int shift, int MinP, int MaxP, double MinRange, int prevP,double const &High[],double const &Low[])
  {
   int P;
   double range;
// calc P so that the Price Range (=Hi-Lo) remains in a "reasonably large value" over the P
   P=prevP; // start with previous P
   if(P<MinP)
      P=MinP;
   if(P>MaxP)
      P=MaxP;
      
      if(hola==false)
      Print(_get_range(P,shift,High,Low));

   if(_get_range(P,shift,High,Low) > MinRange)   //range is OK for this P value: try shorter P values
     {
      for(; P>=MinP; P--)
        {
         if(_get_range(P,shift,High,Low) <= MinRange)
            return(P+1);//previous P value was the limit
        }
      if(hola==false)
         Print("Aca");
      return(P);
     }
//try higher P values
   for(P=prevP+1; P<MaxP; P++)
     {
      if(_get_range(P,shift,High,Low) > MinRange)
        {
         if(hola==false)
            Print("Aca2");
         return(P);
        }
     }
   return(MaxP);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double _get_range(int period, int shift,double const &High[],double const &Low[])
  {return(High[iHighest(Symbol(),0,MODE_HIGH,period,shift)] - Low[iLowest(Symbol(),0,MODE_LOW,period,shift)]);}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void display_stats(datetime const &Time[])
  {
// Compute the average BestBuy and BestSell expectation per Session
   num_weeks=(Time[0]-Time[BarsBack])/(3600*24*7);
   num_weeks+=(num_weeks==0);

// Display the total number of Buys and Sells, total maximum pips, and average pips per session
   if(ChartDisplay>0)
     {
      int y=0,dy=20,x=10;
      int space_y=5;

      d1=NormalizeDouble(BoxRange,1);
      y+=dy;
      drawFixedLbl(prefix+"infoBox", "CZ Box="+DoubleToString(d1,(mult==10 && MathFloor(d1)!=d1))+" pips x "+BoxLength+" bars on "+TimeFrame[btf], StatsCorner, x, y,  DisplayPanelFontSize, Fonts, StatsColor, false);
      drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);

      d1=NormalizeDouble(num_boxes/num_weeks,1);
      y+=dy;
      drawFixedLbl(prefix+"numBox", DoubleToString(num_boxes,0)+" CZ's ("+DoubleToString(d1,(MathFloor(d1)!=d1))+" per Week)", StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
      drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);

      y+=dy;
      drawFixedLbl(prefix+"boBars", "MinClosedBars="+MinBarsClosedOutsideBO, StatsCorner, x, y,  DisplayPanelFontSize, Fonts, StatsColor, false);
      drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);

      y+=dy;
      drawFixedLbl(prefix+"MaxTradesPerSet", "MaxTradesPerSet="+MaxBreakoutTradesPerBox, StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
      drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);

      d1=NormalizeDouble(TakeProfit,1);
      s2="";
      if(_box_total_trades==0 || (_box_total_trades==1 && has_open_trade()))
        {
         s2="Quick";
        }
      y+=dy;
      drawFixedLbl(prefix+"TakeProfit",s2+"TakeProfit="+DoubleToString(d1,(mult==10 && MathFloor(d1)!=d1))+" pips", StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
      drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);

      StopLoss=(StopLossOverride==0)*((highBOcont[1]-lowBOcont[1]-BPips+Point())/(mult*Point()))+StopLossOverride;
      d1=NormalizeDouble(StopLoss,1);
      y+=dy;
      drawFixedLbl(prefix+"StopLoss", "StopLoss="+DoubleToString(d1,(mult==10 && MathFloor(d1)!=d1))+" pips", StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
      drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);

      d1=NormalizeDouble(double(SymbolInfoInteger(Symbol(),SYMBOL_SPREAD))/mult,1);
      y+=dy;
      drawFixedLbl(prefix+"spread", "Spread="+DoubleToString(d1,(mult==10 && MathFloor(d1)!=d1))+" pips", StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
      drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);


      if(ChartDisplay>1)
        {

         y+=dy;
         drawFixedLbl(prefix+"space" + y, " ", StatsCorner, x, y,  DisplayPanelFontSize, Fonts, StatsColor, false);
         drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);

         if(num_long_boxes>0)
           {
            d1=NormalizeDouble((LongBO/num_long_boxes)/(mult*Point()),1);
            s1=StringConcatenate_("Longs=",num_long_boxes,"=Avg ",DoubleToString(d1,(MathFloor(d1)!=d1)),"p");
            y+=dy;
            drawFixedLbl(prefix+"ttB",s1, StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
            drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);
            avgBuys=closed_longs_profit/num_closed_longs;
           }

         if(num_short_boxes>0)
           {
            d1=NormalizeDouble((ShortBO/num_short_boxes)/(mult*Point()),1);
            s1=StringConcatenate_("Shorts=",num_short_boxes,"=Avg ",DoubleToString(d1,(MathFloor(d1)!=d1)),"p");
            y+=dy;
            drawFixedLbl(prefix+"ttS",s1, StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
            drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);
            avgSells = closed_shorts_profit/num_closed_shorts;
           }

         t1=1;
         while(t1<=MaxBreakoutTradesPerBox)
           {
            s6=StringConcatenate_("Closed trade ",t1," = ",_bounce_counts[t1]);
            if(_bounce_counts[t1]>0)
              {
               d2=wins_bounce_counts[t1];
               d1=NormalizeDouble((d2/_bounce_counts[t1])*100,1);
               s6=StringConcatenate_(s6,", Wins=",DoubleToString(d1,(MathFloor(d1)!=d1)),"%");
              }
            y+=dy;
            drawFixedLbl(prefix+"ttBounce" +t1, s6, StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
            drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);
            t1++;
           }

         if(num_total_longs+num_total_shorts+num_losses>0)
           {double wins=num_total_longs+num_total_shorts; double total_trades = num_total_longs+num_total_shorts+num_losses; WinRatio=wins/total_trades;}
        }
      if(ChartDisplay>=3)
        {

         y+=dy;
         drawFixedLbl(prefix+"space" + y, " ", StatsCorner, x, y,  DisplayPanelFontSize, Fonts, StatsColor, false);
         drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);
         y+=dy;
         drawFixedLbl(prefix+"tsWins", "Trade Set Wins=" + _trade_win_set, StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
         drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);
         y+=dy;
         drawFixedLbl(prefix+"tsLoss", "Trade Set Losses="+_trade_loss_set, StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
         drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);
         y+=dy;
         drawFixedLbl(prefix+"ttIndiWins", "Individual Trades Won="+DoubleToString(num_wins,0), StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
         drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);
         y+=dy;
         drawFixedLbl(prefix+"ttIndiLoss", "Individual Trades Lost="+DoubleToString(num_losses,0), StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
         drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);
         y+=dy;
         drawFixedLbl(prefix+"tsCLoss", "Consecutive Trade Losses="+_consecutive_losses, StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
         drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);
         y+=dy;
         drawFixedLbl(prefix+"tsCWins", "Consecutive Trade Wins="+_consecutive_wins, StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
         drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);

         trade_set_win_ratio=0;
         d2=_trade_win_set+_trade_loss_set;
         if(d2>0)
           {
            trade_set_win_ratio=(_trade_win_set/(d2))*100;
           }
         d1=NormalizeDouble(trade_set_win_ratio,1);
         y+=dy;
         drawFixedLbl(prefix+"tsWinsRatio", "Trade Set Win Ratio=" +DoubleToString(d1,(MathFloor(d1)!=d1))+"%", StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
         drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);
         d1=0;
         d2=num_wins+num_losses;
         if(d2>0)
           {
            d1=NormalizeDouble((num_wins/d2)*100,1);
           }
         y+=dy;
         drawFixedLbl(prefix+"ttWinRatio","Individual Trades Win Ratio="+DoubleToString(d1,(MathFloor(d1)!=d1))+"%", StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
         drawFixedLbl(prefix+"numBoxbg"+y, bg_box_length, StatsCorner, x-5, y-space_y, space_font_size, "Webdings", StatsBGColor, true);
         d1=NormalizeDouble(closed_longs_profit+closed_shorts_profit+total_losses,1);
         t1=(d1>=0)*PipsProfitColor+(d1<0)*PipsLossColor;
         y+=dy;
         if(StatsCorner==0 || StatsCorner==2)
           {
            drawFixedLbl(prefix+"ttLoss","Net Pips=", StatsCorner, x, y, DisplayPanelFontSize, Fonts, StatsColor, false);
            drawFixedLbl(prefix+"Pips","Net Pips="+DoubleToString(MathAbs(d1),(MathFloor(d1)!=d1)),StatsCorner,x,y,DisplayPanelFontSize,Fonts,t1,false);
           }
         if(StatsCorner==1 || StatsCorner==3)
           {
            drawFixedLbl(prefix+"ttLoss",DoubleToString(MathAbs(d1),(MathFloor(d1)!=d1)), StatsCorner, x, y, DisplayPanelFontSize, Fonts,t1,false);
            drawFixedLbl(prefix+"Pips","Net Pips="+DoubleToString(MathAbs(d1),(MathFloor(d1)!=d1)),StatsCorner,x,y,DisplayPanelFontSize,Fonts,StatsColor,false);
           }
         drawFixedLbl(prefix+"numBoxbg"+y,bg_box_length,StatsCorner,x-5,y-space_y, space_font_size, "Webdings", StatsBGColor, true);
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void drawFixedLbl(string objname, string s, int Corner, int DX, int DY, int FSize, string Font, color c, bool bg)
  {
   if(ObjectFind(0,objname) < 0)
     {
      ObjectCreate(0,objname, OBJ_LABEL, 0, 0, 0);
     }

   ObjectSetInteger(0,objname, OBJPROP_CORNER, Corner);
   ObjectSetInteger(0,objname, OBJPROP_XDISTANCE, DX);
   ObjectSetInteger(0,objname, OBJPROP_YDISTANCE, DY);
   ObjectSetInteger(0,objname,OBJPROP_BACK, bg);
   ObjectSetString(0,objname,OBJPROP_TEXT,s);
   ObjectSetInteger(0,objname,OBJPROP_FONTSIZE, FSize);
   ObjectSetString(0,objname,OBJPROP_FONT, Font);
   ObjectSetInteger(0,objname,OBJPROP_COLOR, c);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void drawLbl(string objname, string s, int LTime, double LPrice, int FSize, string Font, color c, int width)
  {
   if(ObjectFind(0,objname) < 0)
     {
      ObjectCreate(0,objname, OBJ_TEXT, 0, LTime, LPrice);
     }
   else
     {
      if(ObjectGetInteger(0,objname,OBJPROP_TYPE,0) == OBJ_TEXT)
        {
         ObjectSetInteger(0,objname, OBJPROP_TIME,0, LTime);
         ObjectSetDouble(0,objname, OBJPROP_PRICE,0, LPrice);
        }
     }

   ObjectSetInteger(0,objname, OBJPROP_FONTSIZE, FSize);
   ObjectSetString(0,objname,OBJPROP_TEXT,s);
   ObjectSetInteger(0,objname,OBJPROP_FONTSIZE, FSize);
   ObjectSetString(0,objname,OBJPROP_FONT, Font);
   ObjectSetInteger(0,objname,OBJPROP_COLOR, c);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void drawOrderArrow(string name, datetime t, double price, int arrowcode, color c, int width=1)
  {

   if(ObjectFind(0,name) < 0)
      ObjectCreate(0,name, OBJ_ARROW, 0, t, price);
   else
      ObjectMove(0,name, 0, t, price);

   ObjectSetInteger(0,name, OBJPROP_ARROWCODE,  arrowcode);
   ObjectSetInteger(0,name, OBJPROP_COLOR, c);
   ObjectSetInteger(0,name, OBJPROP_WIDTH, width);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void drawVLine(string objname, int time, color c, int style, int width, int win)
  {
   if(ObjectFind(0,objname)==-1)
     {
      ObjectCreate(0,objname,OBJ_VLINE,win,time,0);
     }
   ObjectSetInteger(0,objname, OBJPROP_TIME,0, time);
   ObjectSetInteger(0,objname, OBJPROP_COLOR, c);
   ObjectSetInteger(0,objname, OBJPROP_STYLE, style);
   ObjectSetInteger(0,objname, OBJPROP_WIDTH, width);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void drawTrendLine(string objname, int t6, double d6, int t7, double d7, color c, int style, int width)
  {
   if(ObjectFind(0,objname)==-1)
     {
      ObjectCreate(0,objname,OBJ_TREND,0,0,0,0,0);
      ObjectSetInteger(0,objname, OBJPROP_RAY, false);
     }
   ObjectSetInteger(0,objname, OBJPROP_TIME,0, t6);
   ObjectSetInteger(0,objname, OBJPROP_TIME,1, t7);
   ObjectSetDouble(0,objname, OBJPROP_PRICE,0, d6);
   ObjectSetDouble(0,objname, OBJPROP_PRICE,1, d7);
   ObjectSetInteger(0,objname, OBJPROP_COLOR, c);
   ObjectSetInteger(0,objname, OBJPROP_STYLE, style);
   ObjectSetInteger(0,objname, OBJPROP_WIDTH, width);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Swing(int x7,int x8)
  {
   x5=0;
   x1=x8+1;
   while(x5==0 && ((x7==1 && iHigh(Symbol(),TF2[0],x8)>iHigh(Symbol(),TF2[0],x8-1)) || (x7==2 && iLow(Symbol(),TF2[0],x8)<iLow(Symbol(),TF2[0],x8-1)) || x8==0))
     {x5=((x7==1 && iHigh(Symbol(),TF2[0],x8)>iHigh(Symbol(),TF2[0],x1)) || (x7==2 && iLow(Symbol(),TF2[0],x8)<iLow(Symbol(),TF2[0],x1)))-((x7==1 && iHigh(Symbol(),TF2[0],x8)<iHigh(Symbol(),TF2[0],x1)) || (x7==2 && iLow(Symbol(),TF2[0],x8)>iLow(Symbol(),TF2[0],x1))); x1++;}
   f5=(x5>0)*((x7==1)*iHigh(Symbol(),TF2[0],x8)+(x7==2)*iLow(Symbol(),TF2[0],x8));
   return(f5);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DrawGraphics(double m5,int q8,ENUM_TIMEFRAMES q9)
  {
   if(BoxStart[q8]>0 && highBO[q8]!=EMPTY_VALUE && lowBO[q8]!=EMPTY_VALUE)
     {
      s8=StringConcatenate_(Vs[32][21],TimeToString(BoxStart[q8],3));
      if(ObjectFind(0,s8)==-1)
        {
         ObjectCreate(0,s8,16,0,0,0,0,0);
         ObjectSetInteger(0,s8,OBJPROP_COLOR,BoxColor);
         ObjectSetInteger(0,s8,OBJPROP_BACK,true);
         ObjectSetInteger(0,s8,OBJPROP_WIDTH,0);
         ObjectSetInteger(0,s8,OBJPROP_STYLE,STYLE_SOLID);
        }
      ObjectSetInteger(0,s8,OBJPROP_TIME,0,BoxStart[q8]);
      ObjectSetInteger(0,s8,OBJPROP_TIME,1,BoxEnd[q8]);
      ObjectSetDouble(0,s8,OBJPROP_PRICE,0,highBO[q8]-m5);
      ObjectSetDouble(0,s8,OBJPROP_PRICE,1,lowBO[q8]+m5);

      s6=StringConcatenate_(Vs[32][22],TimeToString(BoxStart[q8],3));
      if(ObjectFind(0,s6)==-1)
        {
         ObjectCreate(0,s6,2,0,0,0,0,0);
         ObjectSetInteger(0,s6,OBJPROP_RAY,false);
         ObjectSetInteger(0,s6,OBJPROP_COLOR,BoxBufferLinesColor);
         ObjectSetInteger(0,s6,OBJPROP_WIDTH,BoxBufferLinesWidth);
         ObjectSetInteger(0,s6,OBJPROP_STYLE,STYLE_SOLID);
        }
      ObjectSetInteger(0,s6,OBJPROP_TIME,0,BoxStart[q8]);
      ObjectSetInteger(0,s6,OBJPROP_TIME,1,BoxEnd[q8]);
      ObjectSetDouble(0,s6,OBJPROP_PRICE,0,highBO[q8]);
      ObjectSetDouble(0,s6,OBJPROP_PRICE,1,highBO[q8]);

      s7=StringConcatenate_(Vs[32][23],TimeToString(BoxStart[q8],3));
      if(ObjectFind(0,s7)==-1)
        {
         ObjectCreate(0,s7,2,0,0,0,0,0);
         ObjectSetInteger(0,s7,OBJPROP_RAY,false);
         ObjectSetInteger(0,s7,OBJPROP_COLOR,BoxBufferLinesColor);
         ObjectSetInteger(0,s7,OBJPROP_WIDTH,BoxBufferLinesWidth);
         ObjectSetInteger(0,s7,OBJPROP_STYLE,STYLE_SOLID);
        }
      ObjectSetInteger(0,s7,OBJPROP_TIME,0,BoxStart[q8]);
      ObjectSetInteger(0,s7,OBJPROP_TIME,1,BoxEnd[q8]);
      ObjectSetDouble(0,s7,OBJPROP_PRICE,0,lowBO[q8]);
      ObjectSetDouble(0,s7,OBJPROP_PRICE,1,lowBO[q8]);

      s7=StringConcatenate_(Vs[32][40],TimeToString(BoxStart[q8],3));
      if(ObjectFind(0,s7)==-1)
        {
         ObjectCreate(0,s7,OBJ_TEXT,0,0,0);
        }
      m1=NormalizeDouble((highBO[q8]-lowBO[q8]-m5*2)/(mult*Point()),1);
      s1=StringConcatenate_(DoubleToString(m1,(mult==10 && MathFloor(m1)!=m1))," pips x ",DoubleToString(iBarShift(Symbol(),Period(),BoxStart[q8])-iBarShift(Symbol(),Period(),BoxEnd[q8])+1,0)," bars");
      ObjectSetString(0,s7,OBJPROP_TEXT,s1);
      ObjectSetInteger(0,s7,OBJPROP_FONTSIZE, BoxFontSize);
      ObjectSetString(0,s7,OBJPROP_FONT, Fonts);
      ObjectSetInteger(0,s7,OBJPROP_COLOR, BoxColor);
      ObjectSetInteger(0,s7,OBJPROP_TIME,0,BoxStart[q8]+(BoxEnd[q8]-BoxStart[q8])*0.5);
      ObjectSetDouble(0,s7,OBJPROP_PRICE,0,lowBO[q8]);
     }

   if(BoxEnd[q8]>0 && BoxEnd[q8]<=iTime(Symbol(),q9,q8) && highBOcont[q8]!=EMPTY_VALUE && lowBOcont[q8]!=EMPTY_VALUE)
     {
      s8=StringConcatenate_(Vs[32][31],TimeToString(BoxStart[q8],3));
      if(ObjectFind(0,s8)==-1)
        {
         ObjectCreate(0,s8,16,0,0,0,0,0);
        }
      ObjectSetInteger(0,s8,OBJPROP_TIME,0,BoxEnd[q8]);
      ObjectSetInteger(0,s8,OBJPROP_TIME,1,iTime(Symbol(),q9,q8));
      ObjectSetDouble(0,s8,OBJPROP_PRICE,0,highBOcont[q8]-m5);
      ObjectSetDouble(0,s8,OBJPROP_PRICE,1,lowBOcont[q8]+m5);
      ObjectSetInteger(0,s8,OBJPROP_COLOR,ContBoxColor);
      ObjectSetInteger(0,s8,OBJPROP_BACK,ContBoxFullColored);
      ObjectSetInteger(0,s8,OBJPROP_WIDTH,0);
      ObjectSetInteger(0,s8,OBJPROP_STYLE,STYLE_SOLID);

      s6=StringConcatenate_(Vs[32][32],TimeToString(BoxStart[q8],3));
      if(ObjectFind(0,s6)==-1)
        {
         ObjectCreate(0,s6,2,0,0,0,0,0);
         ObjectSetInteger(0,s6,OBJPROP_RAY,false);
         ObjectSetInteger(0,s6,OBJPROP_COLOR,ContBoxBufferLinesColor);
         ObjectSetInteger(0,s6,OBJPROP_WIDTH,ContBoxBufferLinesWidth);
         ObjectSetInteger(0,s6,OBJPROP_STYLE,STYLE_SOLID);
        }
      ObjectSetInteger(0,s6,OBJPROP_TIME,0,BoxEnd[q8]);
      ObjectSetInteger(0,s6,OBJPROP_TIME,1,iTime(Symbol(),q9,q8));
      ObjectSetDouble(0,s6,OBJPROP_PRICE,0,highBOcont[q8]);
      ObjectSetDouble(0,s6,OBJPROP_PRICE,1,highBOcont[q8]);

      s7=StringConcatenate_(Vs[32][33],TimeToString(BoxStart[q8],3));
      if(ObjectFind(0,s7)==-1)
        {
         ObjectCreate(0,s7,2,0,0,0,0,0);
         ObjectSetInteger(0,s7,OBJPROP_RAY,false);
         ObjectSetInteger(0,s7,OBJPROP_COLOR,ContBoxBufferLinesColor);
         ObjectSetInteger(0,s7,OBJPROP_WIDTH,ContBoxBufferLinesWidth);
         ObjectSetInteger(0,s7,OBJPROP_STYLE,STYLE_SOLID);
        }
      ObjectSetInteger(0,s7,OBJPROP_TIME,0,BoxEnd[q8]);
      ObjectSetInteger(0,s7,OBJPROP_TIME,1,iTime(Symbol(),q9,q8));
      ObjectSetDouble(0,s7,OBJPROP_PRICE,0,lowBOcont[q8]);
      ObjectSetDouble(0,s7,OBJPROP_PRICE,1,lowBOcont[q8]);

      q1=1+(m5==0);
      while(q1<=2)
        {
         q2=1;
         while(q2<=2)
           {
            s5=Vs[32][q1*10+q2+13];
            if(ObjectFind(0,s5)==-1)
              {
               ObjectCreate(0,s5,22,0,0,0);
               q3=(q1==1)*ContBoxPriceColor+(q1==2)*BreakoutPriceColor;
               ObjectSetInteger(0,s5,OBJPROP_ARROWCODE,SYMBOL_RIGHTPRICE);
               ObjectSetInteger(0,s5,OBJPROP_COLOR,q3);
               ObjectSetInteger(0,s5,OBJPROP_WIDTH,BreakoutPriceWidth);
              }
            m1=(q1==1 && q2==1)*(highBOcont[q8]-m5)+(q1==1 && q2==2)*(lowBOcont[q8]+m5)+(q1==2 && q2==1)*highBOcont[q8]+(q1==2 && q2==2)*lowBOcont[q8];
            ObjectMove(0,s5,0,iTime(Symbol(),Period(),0),m1);
            q2++;
           }
         q1++;
        }

      if(ShowFibs && q8==1)
        {
         RemoveObjects(StringConcatenate_(" Fib ",TimeToString(CZone[num_boxes-1][1],3)));
         d[1]=highBOcont[q8]-m5;
         d[2]=lowBOcont[q8]+m5;
         m4=d[1]-d[2];
         q1=1;
         while(q1<=2)
           {
            q2=1;
            while(q2<=19 && Fib[q2]>0)
              {
               s7=StringConcatenate_(Vs[32][q1*20+q2+20],TimeToString(BoxStart[q8],3));
               if(ObjectFind(0,s7)==-1)
                 {
                  ObjectCreate(0,s7,2,0,0,0,0,0);
                  ObjectSetInteger(0,s7,OBJPROP_RAY,false);
                  ObjectSetInteger(0,s7,OBJPROP_COLOR,FibsLinesColor);
                  ObjectSetInteger(0,s7,OBJPROP_WIDTH,FibsLinesWidth);
                  ObjectSetInteger(0,s7,OBJPROP_STYLE,STYLE_SOLID);
                 }
               q4=iBarShift(Symbol(),Period(),BoxStart[q8])-iBarShift(Symbol(),Period(),BoxEnd[q8]);
               ObjectSetInteger(0,s7,OBJPROP_TIME,0,iTime(Symbol(),TF2[0],q8+q4));
               ObjectSetInteger(0,s7,OBJPROP_TIME,1,iTime(Symbol(),TF2[0],q8));
               m3=d[q1]+(3-q1*2)*m4*Fib[q2];
               ObjectSetDouble(0,s7,OBJPROP_PRICE,0,m3);
               ObjectSetDouble(0,s7,OBJPROP_PRICE,1,m3);

               s7=StringConcatenate_(Vs[32][q1*20+q2+20],TimeToString(BoxStart[q8],3)," ");
               if(ObjectFind(0,s7)==-1)
                 {
                  ObjectCreate(0,s7,OBJ_TEXT,0,0,0);
                 }
               m2=NormalizeDouble((m4*Fib[q2])/(mult*Point()),1);
               s1=StringConcatenate_(DoubleToString(m2,(mult==10 && MathFloor(m2)!=m2))," pips, ",DoubleToString(m3,Digits()));
               q3=int(StringLen(s1)*1.7);
               s1=StringConcatenate_(s1,StringSubstr(Empty,0,q3));

               ObjectSetString(0,s7,OBJPROP_TEXT,s1);
               ObjectSetInteger(0,s7,OBJPROP_FONTSIZE, FibsFontSize);
               ObjectSetString(0,s7,OBJPROP_FONT, Fonts);
               ObjectSetInteger(0,s7,OBJPROP_COLOR, FibsLinesColor);

               ObjectSetInteger(0,s7,OBJPROP_TIME,0,iTime(Symbol(),TF2[0],q8));
               ObjectSetDouble(0,s7,OBJPROP_PRICE,0,m3+(q1==1)*Tdist);
               q2++;
              }
            q1++;
           }
        }

      if(ShowSwings && q8==1)
        {
         RemoveObjects(StringConcatenate_(Vs[30][2],"Swing ",TimeToString(CZone[num_boxes-2][1],3)));
         q0=num_boxes-1;
         while(q0<=num_boxes)
           {
            d[1]=CZone[q0][4]-m5;
            d[2]=CZone[q0][5]+m5;
            q1=1;
            while(q1<=2)
              {
               q3=0;
               q6=iBarShift(Symbol(),TF2[0],CZone[q0][3]);
               q2=iBarShift(Symbol(),TF2[0],CZone[q0][2])-1;
               while(q2>=q6+(q6==1))
                 {
                  m1=Swing(q1,q2);
                  m3=((3-q1*2)*(m1-d[q1])>0 && ((3-q1*2)*(m1-Temp[q1][q3])>0 || q3==0))*m1;
                  if(m3>0)
                    {
                     q3++;
                     Temp[q1][q3]=m3;
                     q5=q2;
                    }
                  q2--;
                 }
               if(Temp[q1][q3]>0 && q3>0)
                 {
                  m3=Temp[q1][q3];
                  s7=StringConcatenate_(Vs[30][2],"Swing ",TimeToString(CZone[q0][1],3)," ",q1," ",q3-1);
                  ObjectDelete(0,s7);
                  s7=StringConcatenate_(Vs[30][2],"Swing ",TimeToString(CZone[q0][1],3)," ",q1," ",q3);
                  if(ObjectFind(0,s7)==-1)
                    {
                     ObjectCreate(0,s7,2,0,0,0,0,0);
                     ObjectSetInteger(0,s7,OBJPROP_RAY,false);
                     ObjectSetInteger(0,s7,OBJPROP_COLOR,SwingsLinesColor);
                     ObjectSetInteger(0,s7,OBJPROP_WIDTH,SwingsLinesWidth);
                     ObjectSetInteger(0,s7,OBJPROP_STYLE,STYLE_SOLID);
                     ObjectSetInteger(0,s7,OBJPROP_TIME,0,iTime(Symbol(),TF2[0],q5+13));
                     ObjectSetInteger(0,s7,OBJPROP_TIME,1,iTime(Symbol(),TF2[0],q5));
                     ObjectSetDouble(0,s7,OBJPROP_PRICE,0,m3);
                     ObjectSetDouble(0,s7,OBJPROP_PRICE,1,m3);
                    }

                  s7=StringConcatenate_(Vs[30][2],"Swing ",TimeToString(CZone[q0][1],3)," ",q1," ",q3-1," ");
                  ObjectDelete(0,s7);
                  s7=StringConcatenate_(Vs[30][2],"Swing ",TimeToString(CZone[q0][1],3)," ",q1," ",q3," ");
                  if(ObjectFind(0,s7)==-1)
                    {
                     ObjectCreate(0,s7,OBJ_TEXT,0,0,0);
                     m2=NormalizeDouble((3-q1*2)*(Temp[q1][q3]-d[q1])/(mult*Point()),1);
                     s1=StringConcatenate_(DoubleToString(m2,(mult==10 && MathFloor(m2)!=m2))," pips, ",DoubleToString(m3,Digits()));
                     q2=(int)(StringLen(s1)*1.7);
                     s1=StringConcatenate_(s1,StringSubstr(Empty,0,q2));

                     ObjectSetString(0,s7,OBJPROP_TEXT,s1);
                     ObjectSetInteger(0,s7,OBJPROP_FONTSIZE, SwingsFontSize);
                     ObjectSetString(0,s7,OBJPROP_FONT, Fonts);
                     ObjectSetInteger(0,s7,OBJPROP_COLOR, SwingsLinesColor);

                     ObjectSetInteger(0,s7,OBJPROP_TIME,0,iTime(Symbol(),TF2[0],q5));
                     ObjectSetDouble(0,s7,OBJPROP_PRICE,0,long(m3+(q1==1)*Tdist));
                    }
                 }
               q1++;
              }
            q0++;
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void RemoveObjects(string s8_)
  {t1=ObjectsTotal(0,-1,-1); while(t1>=0) {if(StringFind(ObjectName(0,t1,-1,-1),s8_,0)>-1) {ObjectDelete(0,ObjectName(0,t1,-1,-1));} t1--;}}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringConcatenate_(string s)
  {
   return s;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringConcatenate_(string s1_,string s2_)
  {
   return s1_+s2_;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringConcatenate_(string s1_,string s2_,string s3_)
  {
   return s1_+s2_+s3_;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringConcatenate_(string s1_,string s2_,string s3_,string s4_)
  {
   return s1_+s2_+s3_+s4_;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringConcatenate_(string s1_,string s2_,string s3_,string s4_,string s5_)
  {
   return s1_+s2_+s3_+s4_+s5_;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringConcatenate_(string s1_,string s2_,string s3_,string s4_,string s5_,string s6_)
  {
   return s1_+s2_+s3_+s4_+s5_+s6_;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringConcatenate_(string s1_,string s2_,string s3_,string s4_,string s5_,string s6_,string s7_)
  {
   return s1_+s2_+s3_+s4_+s5_+s6_+s7_;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringConcatenate_(string s1_, string s2_, string s3_, string s4_, string s5_, string s6_, string s7_, string s8_)
  {
   return s1_ + s2_ + s3_ + s4_ + s5_ + s6_ + s7_ + s8_;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringConcatenate_(string s1_, string s2_, string s3_, string s4_, string s5_, string s6_, string s7_, string s8_, string s9_)
  {
   return s1_ + s2_ + s3_ + s4_ + s5_ + s6_ + s7_ + s8_ + s9_;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringConcatenate_(string s1_, string s2_, string s3_, string s4_, string s5_, string s6_, string s7_, string s8_, string s9_, string s10_)
  {
   return s1_ + s2_ + s3_ + s4_ + s5_ + s6_ + s7_ + s8_ + s9_ + s10_;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringConcatenate_(string s1_, string s2_, string s3_, string s4_, string s5_, string s6_, string s7_, string s8_, string s9_, string s10_, string s11_)
  {
   return s1_ + s2_ + s3_ + s4_ + s5_ + s6_ + s7_ + s8_ + s9_ + s10_ + s11_;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringConcatenate_(string s1_, string s2_, string s3_, string s4_, string s5_, string s6_, string s7_, string s8_, string s9_, string s10_, string s11_, string s12_)
  {
   return s1_ + s2_ + s3_ + s4_ + s5_ + s6_ + s7_ + s8_ + s9_ + s10_ + s11_ + s12_;
  }


//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
