//+------------------------------------------------------------------+
//|                                  bettervolume_1.5_alerts_nmc.mq5 |
//|                        Copyright 2019, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window

#property indicator_buffers 7
#property indicator_plots   7

#property indicator_label1  "Climax High "
#property indicator_type1   DRAW_HISTOGRAM
#property indicator_style1  STYLE_SOLID
#property indicator_color1  clrRed
#property indicator_width1  4

#property indicator_label2  "Neutral"
#property indicator_type2   DRAW_HISTOGRAM
#property indicator_style2  STYLE_SOLID
#property indicator_color2 clrDeepSkyBlue
#property indicator_width2 4

#property indicator_label3  "Low "
#property indicator_type3   DRAW_HISTOGRAM
#property indicator_style3  STYLE_SOLID
#property indicator_color3 clrYellow
#property indicator_width3 4

#property indicator_label4  "HighChurn "
#property indicator_type4   DRAW_HISTOGRAM
#property indicator_style4  STYLE_SOLID
#property indicator_color4 clrLime
#property indicator_width4 4

#property indicator_label5  "Climax Low "
#property indicator_type5   DRAW_HISTOGRAM
#property indicator_style5  STYLE_SOLID
#property indicator_color5 clrWhite
#property indicator_width5 4

#property indicator_label6  "ClimaxChurn "
#property indicator_type6   DRAW_HISTOGRAM
#property indicator_style6  STYLE_SOLID
#property indicator_color6 clrMagenta  // Climax Churn 
#property indicator_width6 4

#property indicator_label7  "Average()"
#property indicator_type7   DRAW_LINE
#property indicator_style7  STYLE_SOLID
#property indicator_color7 clrLightSeaGreen  // Ma       Maroon 




input int     NumberOfBars = 0 ; // 1500 ; 500;
input string  Note = "0 means Display all bars";
input int     MAPeriod = 14 ;
input int     LookBack = 50 ;
input int     width1 = 4 ;
input int     width2 = 4 ;

input bool UseVisualAlert = false;
input bool UseSoundAlert = false;
input bool UseEmailAlert = false;

input bool IgnoreLightSeaGreen = false;
input bool IgnoreWhite = false;
input bool IgnoreFireBrick = false;
input bool IgnoreDodgerBlue = false;
input bool IgnoreLightSalmon = false;
input bool IgnoreMagenta = false;

double red[],blue[],yellow[],green[],white[],magenta[],v4[];

// Variables for alerts:
color CurrentColor[3] = {White, White, White};
datetime LastAlertTime = D'1980.01.01';




//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

//--- indicator buffers mapping
   SetIndexBuffer(0,red,INDICATOR_DATA);
//PlotIndexSetInteger(0,PLOT_LINE_WIDTH,width2);
   SetIndexStyle(0,2,0,width2,clrRed);
//SetIndexLabel(0,"Climax High ");

   SetIndexBuffer(1,blue,INDICATOR_DATA);
//PlotIndexSetInteger(1,PLOT_LINE_WIDTH,width1);
   SetIndexStyle(1,2,0,width1,clrDeepSkyBlue);
//SetIndexLabel(1,"Neutral");

   SetIndexBuffer(2,yellow,INDICATOR_DATA);
//PlotIndexSetInteger(2,PLOT_LINE_WIDTH,width1);
   SetIndexStyle(2,2,0,width1,clrYellow);
//SetIndexLabel(2,"Low ");

   SetIndexBuffer(3,green,INDICATOR_DATA);
//PlotIndexSetInteger(3,PLOT_LINE_WIDTH,width1);
   SetIndexStyle(3,2,0,width1,clrLime);
//SetIndexLabel(3,"HighChurn ");

   SetIndexBuffer(4,white,INDICATOR_DATA);
//PlotIndexSetInteger(4,PLOT_LINE_WIDTH,width2);
   SetIndexStyle(4,2,0,width2,clrWhite);
//SetIndexLabel(4,"Climax Low ");

   SetIndexBuffer(5,magenta,INDICATOR_DATA);
//PlotIndexSetInteger(5,PLOT_LINE_WIDTH,width1);
   SetIndexStyle(5,2,0,width1,clrMagenta);
//SetIndexLabel(5,"ClimaxChurn ");

   SetIndexBuffer(6,v4,INDICATOR_DATA);
//PlotIndexSetInteger(6,PLOT_LINE_WIDTH,1);
   SetIndexStyle(6,DRAW_LINE,0,1,clrLightSeaGreen);
   PlotIndexSetString(6,PLOT_LABEL,"Average("+(string)MAPeriod+")");
//SetIndexLabel(6,"Average("+MAPeriod+")");
   IndicatorSetString(INDICATOR_SHORTNAME,"Better Volume 1.5");

   ArraySetAsSeries(red,true);
   ArraySetAsSeries(blue,true);
   ArraySetAsSeries(yellow,true);
   ArraySetAsSeries(green,true);
   ArraySetAsSeries(white,true);
   ArraySetAsSeries(magenta,true);
   ArraySetAsSeries(v4,true);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);



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



   int Bars=Bars(_Symbol,_Period);
   long Volume[];
   int count = Bars;        // сколько копируем
   ArraySetAsSeries(Volume,true);
   CopyTickVolume(_Symbol,_Period,0,count,Volume);

   datetime Time[];
   ArraySetAsSeries(Time,true);
   CopyTime(_Symbol,_Period,0,count,Time);

   double High[];
   ArraySetAsSeries(High,true);
   CopyHigh(_Symbol,_Period,0,count,High);

   double Close[];
   ArraySetAsSeries(Close,true);
   CopyClose(_Symbol,_Period,0,count,Close);

   double Low[];
   ArraySetAsSeries(Low,true);
   CopyLow(_Symbol,_Period,0,count,Low);



   if(rates_total<LookBack+2)
   return rates_total;



   double VolLowest,Range,Value2,Value3,HiValue2,HiValue3,LoValue3,tempv2,tempv3,tempv;
   int limit =0;
   int counted_bars=IndicatorCounted(prev_calculated);
//---- last counted bar will be recounted
   if(counted_bars>0)
      counted_bars--;

   /*
      if ( NumberOfBars == 0 )  //           0 = all - appalling resource hog if using anything but 0
         NumberOfBars = Bars-counted_bars;
      limit=NumberOfBars; //Bars-counted_bars;
   */
   if(NumberOfBars == 0)
      limit = rates_total-counted_bars;
   if(NumberOfBars > 0 && NumberOfBars < rates_total)     //
      limit = NumberOfBars - counted_bars;

   for(int i=0; i<limit && i<Bars-LookBack-1; i++)
     {
     //Print("i= ",i," Bars= ",Bars);
     
      red[i] = 0;
      blue[i] = (double)Volume[i];
      yellow[i] = 0;
      green[i] = 0;
      white[i] = 0;
      magenta[i] = 0;
      Value2=0;
      Value3=0;
      HiValue2=0;
      HiValue3=0;
      LoValue3=99999999;
      tempv2=0;
      tempv3=0;
      tempv=0;
      if(i <= 2)
         CurrentColor[i] = White;


      VolLowest = (double)Volume[iLowest(NULL,0,MODE_VOLUME,20,i)];
      if(Volume[i] == VolLowest)
        {
         yellow[i] = NormalizeDouble(Volume[i],0);
         blue[i]=0;
         if(i <= 2)
            CurrentColor[i] = FireBrick;
        }

      Range = (High[i]-Low[i]);
      Value2 = Volume[i]*Range;

      if(Range != 0)
         Value3 = Volume[i]/Range;

      for(int n=i; n<i+MAPeriod && n<Bars; n++)
        {
         tempv= Volume[n] + tempv;
        }
      v4[i] = NormalizeDouble(tempv/MAPeriod,0);

      for(int n=i; n<i+LookBack && n<Bars; n++)
        {
         tempv2 = Volume[n]*((High[n]-Low[n]));
         if(tempv2 >= HiValue2)
            HiValue2 = tempv2;

         if(Volume[n]*((High[n]-Low[n])) != 0)
           {
            tempv3 = Volume[n] / ((High[n]-Low[n]));
            if(tempv3 > HiValue3)
               HiValue3 = tempv3;
            if(tempv3 < LoValue3)
               LoValue3 = tempv3;
           }
        }

      if(Value2 == HiValue2  && Close[i] > (High[i] + Low[i]) / 2)
        {
         red[i] = NormalizeDouble(Volume[i],0);
         blue[i]=0;
         yellow[i]=0;
         if(i <= 2)
            CurrentColor[i] = LightSeaGreen;
        }

      if(Value3 == HiValue3)
        {
         green[i] = NormalizeDouble(Volume[i],0);
         blue[i] =0;
         yellow[i]=0;
         red[i]=0;
         if(i <= 2)
            CurrentColor[i] = DodgerBlue;
        }
      if(Value2 == HiValue2 && Value3 == HiValue3)
        {
         magenta[i] = NormalizeDouble(Volume[i],0);
         blue[i]=0;
         red[i]=0;
         green[i]=0;
         yellow[i]=0;
         if(i <= 2)
            CurrentColor[i] = Magenta;
        }
      if(Value2 == HiValue2  && Close[i] <= (High[i] + Low[i]) / 2)
        {
         white[i] = NormalizeDouble(Volume[i],0);
         magenta[i]=0;
         blue[i]=0;
         red[i]=0;
         green[i]=0;
         yellow[i]=0;
         if(i <= 2)
            CurrentColor[i] = LightSalmon;
        }
     }

//----

//----
   if((CurrentColor[1] != CurrentColor[2]) && (LastAlertTime != Time[1]))
     {
      if((CurrentColor[1] == LightSeaGreen) && (IgnoreLightSeaGreen))
         return(0);
      if((CurrentColor[1] == White) && (IgnoreWhite))
         return(0);
      if((CurrentColor[1] == FireBrick) && (IgnoreFireBrick))
         return(0);
      if((CurrentColor[1] == DodgerBlue) && (IgnoreDodgerBlue))
         return(0);
      if((CurrentColor[1] == LightSalmon) && (IgnoreLightSalmon))
         return(0);
      if((CurrentColor[1] == Magenta) && (IgnoreMagenta))
         return(0);

      if(UseVisualAlert)
         Alert("BetterVolume - Color changed from ", lColorToString(CurrentColor[2]), " to ", lColorToString(CurrentColor[1]), ".");
      if(UseSoundAlert)
         PlaySound("alert.wav");
      if(UseEmailAlert)
         SendMail("Better Volume Alert - " + lColorToString(CurrentColor[2]) + " -> " + lColorToString(CurrentColor[1]), TimeToString(Time[1],TIME_DATE|TIME_MINUTES|TIME_SECONDS) + " BetterVolume - Color changed from " + lColorToString(CurrentColor[2]) + " to " + lColorToString(CurrentColor[1]) + ".");
      LastAlertTime = Time[1];
     }
   return(rates_total);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string lColorToString(color Color)
  {
   switch(Color)
     {
      case LightSeaGreen:
         return("LightSeaGreen");
      case White:
         return("White");
      case FireBrick:
         return("FireBrick");
      case DodgerBlue:
         return("DodgerBlue");
      case LightSalmon:
         return("LightSalmon");
      case Magenta:
         return("Magenta");
      default:
         return("Unknown");
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int IndicatorCounted(int prev_calculated)
  {
   if(prev_calculated>0)
      return(prev_calculated-1);
   if(prev_calculated==0)
      return(0);
   return(0);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetIndexStyle(int index,
                   int type,
                   int style=0,
                   int width=1,
                   color clr=clrNONE)
  {
   if(width>-1)
      PlotIndexSetInteger(index,PLOT_LINE_WIDTH,width);
   if(clr!=clrNONE)
      PlotIndexSetInteger(index,PLOT_LINE_COLOR,clr);
  }  
//+------------------------------------------------------------------+
