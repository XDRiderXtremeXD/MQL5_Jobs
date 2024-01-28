//+------------------------------------------------------------------+
//|                                          SUPERTREND_3_REBOTE.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 10
#property indicator_plots 3

//--- plot Intersection
#property indicator_label1  "DN Rebote"
#property indicator_color1  clrAqua
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2  "UP Rebote"
#property indicator_color2  clrAqua
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

#property indicator_label3  "Intersection"
#property indicator_type3   DRAW_FILLING
#property indicator_color3  clrRed,clrBlue
#property indicator_width3  1

input string S11_="-----------------------   ALERTAS ---------------------";//--------------------------------------------------------------
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=true;
input string S1_="-----------------------   SUPERTREND 1 ---------------------";//--------------------------------------------------------------
input bool Filtro_1=true;//Filtro;
input ENUM_TIMEFRAMES PeriodoIndicador1=PERIOD_H2;
input int Length1 = 10;//ATR Period
input double ATR_Multiplier1=3.0;//ATR Multiplier
input string S2_="-----------------------   SUPERTREND 2  ---------------------";//--------------------------------------------------------------
input bool Filtro_2=true;//Filtro;
input ENUM_TIMEFRAMES PeriodoIndicador2=PERIOD_H4;
input int Length2 = 10;//ATR Period
input double ATR_Multiplier2=3.0;//ATR Multiplier
input string S3_="-----------------------   SUPERTREND 3  ---------------------";//--------------------------------------------------------------
input bool Filtro_3=true;//Filtro;
input ENUM_TIMEFRAMES PeriodoIndicador3=PERIOD_H8;
input int Length3 = 10;//ATR Period
input double ATR_Multiplier3=3.0;//ATR Multiplier
input string S4_="----------------------- CONDICIONES SOP RES-----------------------";//--------------------------------------------------------------
input int VelasEvaluadas=5000;// Velas Historial
input int Testeado=1;
bool Repintado=false;
input int BackLimit=500;
input string pus1="/////////////////////////////////////////////////";
input bool zone_show_weak=true;//Mostrar zonas débiles
input bool zone_show_untested = true;//Mostrar zonas no probadas
input bool zone_show_turncoat = true;//Mostrar zonas rotas
input double zone_fuzzfactor=0.75;
input int SeparacionTexto=10;
input string pus2="/////////////////////////////////////////////////";
input double fractal_fast_factor = 3.0;
input double fractal_slow_factor = 6.0;
input string pus3="/////////////////////////////////////////////////";
input bool zone_merge=true;
input bool zone_extend=true;

double FastDnPts[],FastUpPts[];
double SlowDnPts[],SlowUpPts[];

double zone_hi[1000],zone_lo[1000];
int    zone_start[1000],zone_hits[1000],zone_type[1000],zone_strength[1000],zone_count=0;
bool   zone_turn[1000];

#define ZONE_SUPPORT 1
#define ZONE_RESIST  2

#define ZONE_WEAK      0
#define ZONE_TURNCOAT  1
#define ZONE_UNTESTED  2
#define ZONE_VERIFIED  3
#define ZONE_PROVEN    4

#define UP_POINT 1
#define DN_POINT -1



int handle_SUPERTREND1=0;
int handle_SUPERTREND2=0;
int handle_SUPERTREND3=0;

double STD_UP_1[];
double STD_DN_1[];
double STD_UP_2[];
double STD_DN_2[];
double STD_UP_3[];
double STD_DN_3[];

//BUFFERS
double ATR[];
double         IntersectionBuffer1[];
double         IntersectionBuffer2[];
double         ArrowSignalUP[];
double         ArrowSignalDN[];
double         Line[];

int P_Fast=0;
int P_Slow=0;
int DefinitionATR;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   SetearParametrosSOPRES();
//--- indicator buffers mapping
   handle_SUPERTREND1=iCustom(Symbol(),PeriodoIndicador1,"SuperTrendMQL5",PeriodoIndicador1,Length1,ATR_Multiplier1,S1_,clrGreen,clrRed);
   handle_SUPERTREND2=iCustom(Symbol(),PeriodoIndicador2,"SuperTrendMQL5",PeriodoIndicador2,Length2,ATR_Multiplier2,S2_,clrGreen,clrRed);
   handle_SUPERTREND3=iCustom(Symbol(),PeriodoIndicador3,"SuperTrendMQL5",PeriodoIndicador3,Length3,ATR_Multiplier3,S3_,clrGreen,clrRed);
//---
//--- indicator buffers mapping
   SetIndexBuffer(0,ArrowSignalUP,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalDN,INDICATOR_DATA);
   SetIndexBuffer(2,IntersectionBuffer1,INDICATOR_DATA);
   SetIndexBuffer(3,IntersectionBuffer2,INDICATOR_DATA);
   SetIndexBuffer(4,SlowDnPts,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,SlowUpPts,INDICATOR_CALCULATIONS);
   SetIndexBuffer(6,FastDnPts,INDICATOR_CALCULATIONS);
   SetIndexBuffer(7,FastUpPts,INDICATOR_CALCULATIONS);
   SetIndexBuffer(8,ATR,INDICATOR_CALCULATIONS);
   SetIndexBuffer(9,Line,INDICATOR_CALCULATIONS);

   ArraySetAsSeries(IntersectionBuffer1,true);
   ArraySetAsSeries(IntersectionBuffer2,true);
   ArraySetAsSeries(SlowDnPts,true);
   ArraySetAsSeries(SlowUpPts,true);
   ArraySetAsSeries(FastDnPts,true);
   ArraySetAsSeries(FastUpPts,true);
   ArraySetAsSeries(ATR,true);
   ArraySetAsSeries(ArrowSignalUP,true);
   ArraySetAsSeries(ArrowSignalDN,true);

   ArraySetAsSeries(STD_DN_1,true);
   ArraySetAsSeries(STD_UP_1,true);
   ArraySetAsSeries(STD_DN_2,true);
   ArraySetAsSeries(STD_UP_2,true);
   ArraySetAsSeries(STD_DN_3,true);
   ArraySetAsSeries(STD_UP_3,true);
   ArraySetAsSeries(Line,true);

   PlotIndexSetInteger(0,PLOT_ARROW,234);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetInteger(1,PLOT_ARROW,233);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

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
   ArraySetAsSeries(time,true);
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(close,true);
   ArraySetAsSeries(open,true);

   if(prev_calculated==rates_total)
      return rates_total;

   if(BarsCalculated(DefinitionATR)<rates_total)
      return(0);
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(DefinitionATR,0,0,to_copy,ATR)<=0)
      return 0;

   if(Filtro_1)
      if(!CopiarSuperTrend(PeriodoIndicador1,handle_SUPERTREND1,STD_UP_1,STD_DN_1,prev_calculated,rates_total))
         return 0;
   if(Filtro_2)
      if(!CopiarSuperTrend(PeriodoIndicador2,handle_SUPERTREND2,STD_UP_2,STD_DN_2,prev_calculated,rates_total))
         return 0;
   if(Filtro_3)
      if(!CopiarSuperTrend(PeriodoIndicador3,handle_SUPERTREND3,STD_UP_3,STD_DN_3,prev_calculated,rates_total))
         return 0;

   int end=(prev_calculated>0)?MathMin(to_copy,rates_total-4):MathMin(VelasEvaluadas,rates_total-4);
   if(prev_calculated==0)
     {
      ArrayInitialize(IntersectionBuffer1,EMPTY_VALUE);
      ArrayInitialize(IntersectionBuffer2,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
     }

   if(prev_calculated!=rates_total)
     {
      FastFractals(high,low,0,rates_total,rates_total-prev_calculated);
      SlowFractals(high,low,0,rates_total,rates_total-prev_calculated);
     }

   for(int shift=0; shift<end; shift++)
     {
      IntersectionBuffer1[0]=0;
      IntersectionBuffer2[0]=0;
      ArrowSignalUP[0]=EMPTY_VALUE;
      ArrowSignalDN[0]=EMPTY_VALUE;

      IntersectionBuffer1[shift+1]=0;
      IntersectionBuffer2[shift+1]=0;
      ArrowSignalUP[shift+1]=EMPTY_VALUE;
      ArrowSignalDN[shift+1]=EMPTY_VALUE;

      int barshift_1=0,barshift_2=0,barshift_3=0;

      if(shift>VelasEvaluadas)
         continue;

      if(Filtro_1)
         if((barshift_1=barshift(PeriodoIndicador1,time,shift,STD_DN_1,STD_UP_1))==-1)
            continue;
      if(Filtro_2)
         if((barshift_2=barshift(PeriodoIndicador2,time,shift,STD_DN_2,STD_UP_2))==-1)
            continue;
      if(Filtro_3)
         if((barshift_3=barshift(PeriodoIndicador3,time,shift,STD_DN_3,STD_UP_3))==-1)
            continue;
      if(!FindZones(high,close,low,shift+(Repintado?0:1)))
         continue;

      if(!Filtro_1 || STD_DN_1[barshift_1+1]!=EMPTY_VALUE)
         if(!Filtro_2 || STD_DN_2[barshift_2+1]!=EMPTY_VALUE)
            if(!Filtro_3 || STD_DN_3[barshift_3+1]!=EMPTY_VALUE)
              {
               for(int i=0; i<zone_count; i++)
                 {
                  if(zone_type[i]==ZONE_SUPPORT)
                     if(zone_hits[i]>Testeado)
                        if((IntersectionBuffer1[shift+1]==0 && IntersectionBuffer2[shift+1]==0) || (IntersectionBuffer2[shift+1]<zone_hi[i]))
                          {
                           Line[shift+1]=STD_DN_1[barshift_1+1];
                           IntersectionBuffer1[shift+1]=zone_lo[i];
                           IntersectionBuffer2[shift+1]=zone_hi[i];
                          }
                 }
              }

      if(!Filtro_1 || STD_UP_1[barshift_1+1]!=EMPTY_VALUE)
         if(!Filtro_2 || STD_UP_2[barshift_2+1]!=EMPTY_VALUE)
            if(!Filtro_3 || STD_UP_3[barshift_3+1]!=EMPTY_VALUE)
              {
               for(int i=0; i<zone_count; i++)
                 {
                  if(zone_type[i]==ZONE_RESIST)
                     if(zone_hits[i]>Testeado)
                        if((IntersectionBuffer1[shift+1]==0 && IntersectionBuffer2[shift+1]==0) || (IntersectionBuffer1[shift+1]>zone_hi[i]))
                          {
                           Line[shift+1]=STD_UP_1[barshift_1+1];
                           IntersectionBuffer1[shift+1]=zone_hi[i];
                           IntersectionBuffer2[shift+1]=zone_lo[i];
                          }
                 }
              }

      if(IntersectionBuffer1[shift+1]==0 && IntersectionBuffer2[shift+1]==0)
         continue;
         
      int tolerancia=30;   

      if(IntersectionBuffer1[shift+1]<IntersectionBuffer2[shift+1])
        {
         //if(Line[shift+1]>=IntersectionBuffer1[shift+1] && Line[shift+1]<=IntersectionBuffer2[shift+1]+tolerancia*Point())
            if(close[shift+1]>open[shift+1] && close[shift+1]>IntersectionBuffer2[shift+1] && low[shift+1]>=IntersectionBuffer1[shift+1] && low[shift+1]<=IntersectionBuffer2[shift+1])
               ArrowSignalDN[shift+1]=low[shift+1];
        }
      else
        {
         //if(Line[shift+1]<=IntersectionBuffer1[shift+1] && Line[shift+1]>=IntersectionBuffer2[shift+1]-tolerancia*Point())
            if(close[shift+1]<open[shift+1] && close[shift+1]<IntersectionBuffer2[shift+1] && high[shift+1]<=IntersectionBuffer1[shift+1] && high[shift+1]>=IntersectionBuffer2[shift+1])
               ArrowSignalUP[shift+1]=high[shift+1];
        }

      if(shift==0)
        {
         if(ArrowSignalUP[1]!=EMPTY_VALUE)
            Alertas("ST3 BUY");
         if(ArrowSignalDN[1]!=EMPTY_VALUE)
            Alertas("ST3 SELL");
        }
     }



   /* if(!EvaluaHorario(Hora_Inicio,Hora_Final,Time[shift]))
       continue;

    if(!EvaluaDias(Time[shift]))
       continue;
   */




   /* if(shift==0)
      {
       /*Print("-----------------------------------");
       for(int i=0; i<zone_count; i++)
         {
          if(zone_hits[i]>0)
             Print(zone_lo[i]," ",zone_hi[i]," ",zone_hits[i]);
         }*/
//}
   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CopiarSuperTrend(ENUM_TIMEFRAMES PeriodoIndicador,int &handle,double &STD_UP[],double &STD_DN[],int prev_calculated,int rates_total)
  {
   int bars=iBars(Symbol(),PeriodoIndicador);
   if(BarsCalculated(handle)<bars)
      return(false);
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=bars;
   else
     {
      to_copy= MathMax(3,MathMin(bars,(rates_total-prev_calculated)*int(PeriodSeconds(Period())/PeriodSeconds(PeriodoIndicador))));
      //--- last value is always copied
      to_copy++;
     }
   if(CopyBuffer(handle,0,0,to_copy,STD_UP)<=0)
      return(false);
   if(CopyBuffer(handle,1,0,to_copy,STD_DN)<=0)
      return(false);

   return true;
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
bool Fractal(int M,int P,int shift,const double &High[],const double &Low[],int Prueba,int rates_total)
  {

   if(shift-Prueba<P)
      return(false);

   if(shift>=rates_total-P)
      return(false);


   for(int i=1; i<=P; i++)
     {
      if(M==UP_POINT)
        {
         if(High[shift+i]>High[shift])
            return(false);
         if(High[shift-i]>=High[shift])
            return(false);
        }
      if(M==DN_POINT)
        {
         if(Low[shift+i]<Low[shift])
            return(false);
         if(Low[shift-i]<=Low[shift])
            return(false);
        }
     }
   return(true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FastFractals(const double &High[],const double &Low[],int Prueba,int rates_total,int limit)
  {
   int shift;

   if(limit>=1)
      limit=MathMin(rates_total-1,limit+P_Fast);

   FastUpPts[0] = 0.0;
   FastUpPts[1] = 0.0;
   FastDnPts[0] = 0.0;
   FastDnPts[1] = 0.0;

   for(shift=limit; shift>1+Prueba; shift--)
     {
      if(Fractal(UP_POINT,P_Fast,shift,High,Low,Prueba,rates_total)==true)
         FastUpPts[shift-Prueba]=High[shift];
      else
         FastUpPts[shift-Prueba]=0.0;

      if(Fractal(DN_POINT,P_Fast,shift,High,Low,Prueba,rates_total)==true)
         FastDnPts[shift-Prueba]=Low[shift];
      else
         FastDnPts[shift-Prueba]=0.0;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SlowFractals(const double &High[],const double &Low[],int Prueba,int rates_total,int limit)
  {
   int shift;

   if(limit>=1)
      limit=MathMin(rates_total-1,limit+P_Slow);

   SlowUpPts[0] = 0.0;
   SlowUpPts[1] = 0.0;
   SlowDnPts[0]= 0.0;
   SlowDnPts[1] = 0.0;

//if(limit>=1)
//  Print("Entra ,",rates_total);
   for(shift=limit; shift>1+Prueba; shift--)
     {
      if(Fractal(UP_POINT,P_Slow,shift,High,Low,Prueba,rates_total)==true)
         SlowUpPts[shift-Prueba]=High[shift];
      else
         SlowUpPts[shift-Prueba]=0.0;

      if(Fractal(DN_POINT,P_Slow,shift,High,Low,Prueba,rates_total)==true)
         SlowDnPts[shift-Prueba]=Low[shift];
      else
         SlowDnPts[shift-Prueba]=0.0;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TransformarP(int &P)
  {
   int PeriodoEva=(PeriodSeconds(Period())/60);

   if(PeriodoEva>P)
      P=PeriodoEva;
   P=int(P/PeriodoEva*2+MathCeil(P/PeriodoEva/2));
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetearParametrosSOPRES()
  {
   DefinitionATR=iATR(Symbol(),PERIOD_CURRENT,7);

   int P=int((PeriodSeconds(Period())/60)*fractal_fast_factor);
   TransformarP(P);
   P_Fast=P;
   P=int((PeriodSeconds(Period())/60)*fractal_slow_factor);
   TransformarP(P);
   P_Slow=P;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FindZones(const double &High[],const double &Close[],const double &Low[],int Prueba)
  {
   int i,j=0,shift,bustcount=0,testcount=0;
   double hival,loval;
   bool turned=false,hasturned=false;

   double temp_hi[],temp_lo[];
   ArrayResize(temp_hi,BackLimit+15);
   ArrayResize(temp_lo,BackLimit+15);
   int    temp_start[],temp_hits[],temp_strength[],temp_count=0;
   ArrayResize(temp_start,BackLimit+15);
   ArrayResize(temp_hits,BackLimit+15);
   ArrayResize(temp_strength,BackLimit+15);
   bool   temp_turn[],temp_merge[];
   ArrayResize(temp_turn,BackLimit+15);
   ArrayResize(temp_merge,BackLimit+15);
   int merge1[],merge2[],merge_count=0;
   ArrayResize(merge1,BackLimit+15);
   ArrayResize(merge2,BackLimit+15);


   for(shift=MathMin(Bars(Symbol(),PERIOD_CURRENT)-1,BackLimit+Prueba); shift>5+Prueba; shift--)
     {
      //double atr= iATR(NULL,0,7,shift);
      double atr=ATR[shift];
      double fu = atr/2 * zone_fuzzfactor;
      bool isWeak;
      bool touchOk= false;
      bool isBust = false;
      double FastUpPts_index=shift-Prueba>=P_Fast?FastUpPts[shift]:0;
      double FastDnPts_index=shift-Prueba>=P_Fast?FastDnPts[shift]:0;

      if(FastUpPts_index>0.001)
        {
         isWeak=true;
         if(SlowUpPts[shift]>0.001)
            isWeak=false;

         hival=High[shift];
         if(zone_extend==true)
            hival+=fu;

         loval=MathMax(MathMin(Close[shift],High[shift]-fu),High[shift]-fu*2);
         turned=false;
         hasturned=false;
         isBust=false;

         bustcount = 0;
         testcount = 0;


         for(i=shift-1; i>=Prueba; i--)
           {
            FastUpPts_index=i-Prueba>=P_Fast?FastUpPts[i]:0;
            FastDnPts_index=i-Prueba>=P_Fast?FastDnPts[i]:0;

            if((turned==false && FastUpPts_index>=loval && FastUpPts_index<=hival) ||
               (turned==true && FastDnPts_index<=hival && FastDnPts_index>=loval))
              {
               // Potential touch, just make sure its been 10+candles since the prev one
               touchOk=true;
               for(j=i+1; j<i+11; j++)
                 {
                  double FastUpPts_j=j-Prueba>=P_Fast?FastUpPts[j]:0;
                  double FastDnPts_j=j-Prueba>=P_Fast?FastDnPts[j]:0;

                  if((turned==false && FastUpPts_j>=loval && FastUpPts_j<=hival) ||
                     (turned==true && FastDnPts_j<=hival && FastDnPts_j>=loval))
                    {
                     touchOk=false;
                     break;
                    }
                 }

               if(touchOk==true)
                 {
                  // we have a touch_  If its been busted once, remove bustcount
                  // as we know this level is still valid & has just switched sides
                  bustcount=0;
                  testcount++;
                 }
              }

            if((turned==false && High[i]>hival) ||
               (turned==true && Low[i]<loval))
              {
               // this level has been busted at least once
               bustcount++;

               if(bustcount>1 || isWeak==true)
                 {
                  // busted twice or more
                  isBust=true;
                  break;
                 }

               if(turned == true)
                  turned = false;
               else
                  if(turned==false)
                     turned=true;

               hasturned=true;

               // forget previous hits
               testcount=0;
              }
           }

         if(isBust==false)
           {
            // level is still valid, add to our list
            temp_hi[temp_count] = NormalizeDouble(hival,Digits());
            temp_lo[temp_count] =  NormalizeDouble(loval,Digits());
            temp_turn[temp_count] = hasturned;
            temp_hits[temp_count] = testcount;
            temp_start[temp_count] = shift;
            temp_merge[temp_count] = false;

            if(testcount>3)
               temp_strength[temp_count]=ZONE_PROVEN;
            else
               if(testcount>0)
                  temp_strength[temp_count]=ZONE_VERIFIED;
               else
                  if(hasturned==true)
                     temp_strength[temp_count]=ZONE_TURNCOAT;
                  else
                     if(isWeak==false)
                        temp_strength[temp_count]=ZONE_UNTESTED;
                     else
                        temp_strength[temp_count]=ZONE_WEAK;

            temp_count++;
           }
        }
      else
         if(FastDnPts_index>0.001)
           {
            // a zigzag Low point
            double SlowDnPts_index=shift-Prueba>=P_Slow?SlowDnPts[shift]:0;

            isWeak=true;
            if(SlowDnPts_index>0.001)
               isWeak=false;

            loval=Low[shift];
            if(zone_extend==true)
               loval-=fu;

            hival=MathMin(MathMax(Close[shift],Low[shift]+fu),Low[shift]+fu*2);
            turned=false;
            hasturned=false;

            bustcount = 0;
            testcount = 0;
            isBust=false;

            for(i=shift-1; i>=Prueba; i--)
              {

               FastUpPts_index=i-Prueba>=P_Fast?FastUpPts[i]:0;
               FastDnPts_index=i-Prueba>=P_Fast?FastDnPts[i]:0;

               if((turned==true && FastUpPts_index>=loval && FastUpPts_index<=hival) ||
                  (turned==false && FastDnPts_index<=hival && FastDnPts_index>=loval))
                 {
                  // Potential touch, just make sure its been 10+candles since the prev one
                  touchOk=true;
                  for(j=i+1; j<i+11; j++)
                    {
                     double FastUpPts_j=j-Prueba>=P_Fast?FastUpPts[j]:0;
                     double FastDnPts_j=j-Prueba>=P_Fast?FastDnPts[j]:0;

                     if((turned==true && FastUpPts_j>=loval && FastUpPts_j<=hival) ||
                        (turned==false && FastDnPts_j<=hival && FastDnPts_j>=loval))
                       {
                        touchOk=false;
                        break;
                       }
                    }

                  if(touchOk==true)
                    {
                     // we have a touch_  If its been busted once, remove bustcount
                     // as we know this level is still valid & has just switched sides
                     bustcount=0;
                     testcount++;
                    }
                 }

               if((turned==true && High[i]>hival) ||
                  (turned==false && Low[i]<loval))
                 {
                  // this level has been busted at least once
                  bustcount++;

                  if(bustcount>1 || isWeak==true)
                    {
                     // busted twice or more
                     isBust=true;
                     break;
                    }

                  if(turned == true)
                     turned = false;
                  else
                     if(turned==false)
                        turned=true;

                  hasturned=true;

                  // forget previous hits
                  testcount=0;
                 }
              }

            if(isBust==false)
              {
               // level is still valid, add to our list
               temp_hi[temp_count] = hival;
               temp_lo[temp_count] = loval;
               temp_turn[temp_count] = hasturned;
               temp_hits[temp_count] = testcount;
               temp_start[temp_count] = shift;
               temp_merge[temp_count] = false;

               if(testcount>3)
                  temp_strength[temp_count]=ZONE_PROVEN;
               else
                  if(testcount>0)
                     temp_strength[temp_count]=ZONE_VERIFIED;
                  else
                     if(hasturned==true)
                        temp_strength[temp_count]=ZONE_TURNCOAT;
                     else
                        if(isWeak==false)
                           temp_strength[temp_count]=ZONE_UNTESTED;
                        else
                           temp_strength[temp_count]=ZONE_WEAK;

               temp_count++;
              }
           }
     }


// Print("j ",j);
   j=j-Prueba;
   if(zone_merge==true && j>0)
     {
      merge_count=1;
      int iterations=0;
      while(merge_count>0 && iterations<3)
        {
         merge_count=0;
         iterations++;

         for(i=0; i<temp_count; i++)
            temp_merge[i]=false;

         for(i=0; i<temp_count-1; i++)
           {
            if(temp_hits[i]==-1 || temp_merge[j]==true)
               continue;

            for(j=i+1; j<temp_count; j++)
              {
               if(temp_hits[j]==-1 || temp_merge[j]==true)
                  continue;

               if((temp_hi[i]>=temp_lo[j] && temp_hi[i]<=temp_hi[j]) ||
                  (temp_lo[i] <= temp_hi[j] && temp_lo[i] >= temp_lo[j]) ||
                  (temp_hi[j] >= temp_lo[i] && temp_hi[j] <= temp_hi[i]) ||
                  (temp_lo[j] <= temp_hi[i] && temp_lo[j] >= temp_lo[i]))
                 {
                  merge1[merge_count] = i;
                  merge2[merge_count] = j;
                  temp_merge[i] = true;
                  temp_merge[j] = true;
                  merge_count++;
                 }
              }
           }

         // ___ and merge them ___
         for(i=0; i<merge_count; i++)
           {
            int target = merge1[i];
            int source = merge2[i];

            temp_hi[target] = MathMax(temp_hi[target], temp_hi[source]);
            temp_lo[target] = MathMin(temp_lo[target], temp_lo[source]);
            temp_hits[target] += temp_hits[source];
            temp_start[target] = MathMax(temp_start[target], temp_start[source]);
            temp_strength[target]=MathMax(temp_strength[target],temp_strength[source]);
            if(temp_hits[target]>3)
               temp_strength[target]=ZONE_PROVEN;

            if(temp_hits[target]==0 && temp_turn[target]==false)
              {
               temp_hits[target]=1;
               if(temp_strength[target]<ZONE_VERIFIED)
                  temp_strength[target]=ZONE_VERIFIED;
              }

            if(temp_turn[target] == false || temp_turn[source] == false)
               temp_turn[target] = false;
            if(temp_turn[target] == true)
               temp_hits[target] = 0;

            temp_hits[source]=-1;
           }
        }
     }

// copy the remaining list into our official zones arrays
   zone_count=0;
   int Limite=MathMin(Bars(Symbol(),PERIOD_CURRENT)-1,500+Prueba);
   for(i=0; i<temp_count; i++)
     {
      if(temp_hits[i]>=0 && zone_count<1000)
        {
         zone_hi[zone_count]       = temp_hi[i];
         zone_lo[zone_count]       = temp_lo[i];
         zone_hits[zone_count]     = temp_hits[i];
         zone_turn[zone_count]     = temp_turn[i];
         zone_start[zone_count]    = temp_start[i];
         zone_strength[zone_count] = temp_strength[i];

         if(zone_hi[zone_count]<Close[4+Prueba])
            zone_type[zone_count]=ZONE_SUPPORT;
         else
            if(zone_lo[zone_count]>Close[4+Prueba])
               zone_type[zone_count]=ZONE_RESIST;
            else
              {
               for(j=5+Prueba; j<Limite; j++)
                 {
                  if(Close[j]<zone_lo[zone_count])
                    {
                     zone_type[zone_count]=ZONE_RESIST;
                     break;
                    }
                  else
                     if(Close[j]>zone_hi[zone_count])
                       {
                        zone_type[zone_count]=ZONE_SUPPORT;
                        break;
                       }
                 }

               if(j==Limite)
                  zone_type[zone_count]=ZONE_SUPPORT;
              }

         zone_count++;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+
int barshift(ENUM_TIMEFRAMES PeriodoIndicador,datetime const &time[],int shift,double &STD_DN[],double &STD_UP[])
  {
   int barshift=iBarShift(Symbol(),PeriodoIndicador,time[shift],false);
   if(barshift>ArraySize(STD_DN)-2 || barshift>ArraySize(STD_UP)-2)
      return -1;

   return barshift;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Alertas(string Frase)
  {
   if(AlertPC)
      Alert(Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));
   if(AlertMail)
      SendNotification(Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));
   if(AlertPC)
      SendMail(Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())),Frase+" en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period())));
  }
//+------------------------------------------------------------------+
