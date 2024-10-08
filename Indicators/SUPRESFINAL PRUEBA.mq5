//+------------------------------------------------------------------+
//|                                           SUPRESFINAL PRUEBA.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                  SUPRESFINAL.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright © Propiedad de Claudio Angelo Chumpitaz Flores"
#property description "Patrones de (ruptura o rebote) de Zonas de Resistencia o Soportes"

#property indicator_chart_window
#property indicator_buffers 9
#property indicator_plots   4


input string S1__="-----------------------   Configuracion SOP RES---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Ver_Sop_Res=false;
input int BackLimit=500;
input string pus1="/////////////////////////////////////////////////";
input bool zone_show_weak=true;//Mostrar zonas débiles
input bool zone_show_untested = true;//Mostrar zonas no probadas
input bool zone_show_turncoat = true;//Mostrar zonas rotas
input double zone_fuzzfactor=0.75;
input int SeparacionTexto=10;

string pus2="/////////////////////////////////////////////////";
bool fractals_show=true;
double fractal_fast_factor = 3.0;
double fractal_slow_factor = 6.0;
bool SetGlobals=true;

string pus3="/////////////////////////////////////////////////";
bool zone_solid=true;
int zone_linewidth=1;
int zone_style=0;
bool zone_show_info=true;
int zone_label_shift=0;
bool zone_merge=true;
bool zone_extend=true;

string pus4="/////////////////////////////////////////////////";
bool zone_show_alerts  = false;
bool zone_alert_popups = true;
bool zone_alert_sounds = true;
int zone_alert_waitseconds=300;

string pus5="/////////////////////////////////////////////////";
int Text_size=10;
string Text_font = "Courier New";
color Text_color = clrWhite;
string sup_name = "Soporte";
string res_name = "Resistencia";
string test_name= "Retesteado";

color color_support_weak     = DarkSlateGray;
color color_support_untested = SeaGreen;
color color_support_verified = Green;
color color_support_proven   = LimeGreen;
color color_support_turncoat = OliveDrab;
color color_resist_weak      = Indigo;
color color_resist_untested  = Orchid;
color color_resist_verified  = Crimson;
color color_resist_proven    = Red;
color color_resist_turncoat  = DarkOrange;
/*
color color_support_weak     = clrAquamarine;//Color de la zona de soporte débil:
color color_support_untested = clrPowderBlue;//Color de la zona de soporte no probado:
color color_support_verified = clrSkyBlue;//Color de la zona de soporte verificado:
color color_support_proven   = clrTurquoise;//Color de la zona de soporte probado:
color color_support_turncoat = clrDarkOrange;//Color de la zona de soporte roto:
color color_resist_weak      = clrOrchid;//Color de la zona de resistencia débil:
color color_resist_untested  = clrMediumOrchid;//Color de la zona de resistencia no probada:
color color_resist_verified  = clrCrimson;//Color de la zona de resistencia verificada:
color color_resist_proven    = clrRed;// Color de la zona de resistencia probada:
color color_resist_turncoat  = clrDarkOrange;//Color de la zona de resistencia rota:*/

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

int time_offset=0;

double ner_lo_zone_P1[];
double ner_lo_zone_P2[];
double ner_hi_zone_P1[];
double ner_hi_zone_P2[];

double ATR[];

int DefinitionATR;

string LINE_V_SHIFT="Line Shift Vertical Prueba";
bool CargoDatos=false;
datetime TiempoLineShift=0;


datetime time[];
double high[];
double low[];
double close[];
double open[];

bool Shift_0=false;
bool ActivarMovimiento=false;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   TiempoLineShift=0;
   Shift_0=false;
   ActivarMovimiento=false;

   ArraySetAsSeries(time,true);
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(close,true);
   ArraySetAsSeries(open,true);


   CargoDatos=false;
   DefinitionATR=iATR(Symbol(),PERIOD_CURRENT,7);

   IndicatorSetString(INDICATOR_SHORTNAME,"Indicador SUPRES");

//172, 115

   if(fractals_show==true)
     {
      SetIndexBuffer(0,SlowDnPts,INDICATOR_DATA);
      SetIndexBuffer(1,SlowUpPts,INDICATOR_DATA);
      SetIndexBuffer(2,FastDnPts,INDICATOR_DATA);
      SetIndexBuffer(3,FastUpPts,INDICATOR_DATA);
     }
   else
     {
      SetIndexBuffer(0,SlowDnPts,INDICATOR_CALCULATIONS);
      SetIndexBuffer(1,SlowUpPts,INDICATOR_CALCULATIONS);
      SetIndexBuffer(2,FastDnPts,INDICATOR_CALCULATIONS);
      SetIndexBuffer(3,FastUpPts,INDICATOR_CALCULATIONS);
     }

   SetIndexBuffer(4,ner_hi_zone_P1,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,ner_hi_zone_P2,INDICATOR_CALCULATIONS);
   SetIndexBuffer(6,ner_lo_zone_P1,INDICATOR_CALCULATIONS);
   SetIndexBuffer(7,ner_lo_zone_P2,INDICATOR_CALCULATIONS);

   SetIndexBuffer(8,ATR,INDICATOR_CALCULATIONS);


   if(fractals_show==true)
     {
      PlotIndexSetInteger(0,PLOT_LINE_COLOR,clrYellow);
      PlotIndexSetInteger(1,PLOT_LINE_COLOR,clrYellow);
      PlotIndexSetInteger(2,PLOT_LINE_COLOR,clrYellow);
      PlotIndexSetInteger(3,PLOT_LINE_COLOR,clrYellow);

      PlotIndexSetInteger(0,PLOT_DRAW_TYPE,DRAW_ARROW);
      PlotIndexSetInteger(1,PLOT_DRAW_TYPE,DRAW_ARROW);
      PlotIndexSetInteger(2,PLOT_DRAW_TYPE,DRAW_ARROW);
      PlotIndexSetInteger(3,PLOT_DRAW_TYPE,DRAW_ARROW);

      PlotIndexSetInteger(0,PLOT_ARROW,218);
      PlotIndexSetInteger(1,PLOT_ARROW,217);
      PlotIndexSetInteger(2,PLOT_ARROW,218);
      PlotIndexSetInteger(3,PLOT_ARROW,217);

      PlotIndexSetString(0,PLOT_LABEL,"F SLOW_DN");
      PlotIndexSetString(1,PLOT_LABEL,"F SLOW_UP");
      PlotIndexSetString(2,PLOT_LABEL,"F FAST_DN");
      PlotIndexSetString(3,PLOT_LABEL,"F FAST_UP");
     }
   else
     {
      PlotIndexSetInteger(0,PLOT_DRAW_TYPE,DRAW_NONE);
      PlotIndexSetInteger(1,PLOT_DRAW_TYPE,DRAW_NONE);
      PlotIndexSetInteger(2,PLOT_ARROW,DRAW_NONE);
      PlotIndexSetInteger(3,PLOT_ARROW,DRAW_NONE);
     }

   PlotIndexSetInteger(4,PLOT_DRAW_TYPE,DRAW_NONE);
   PlotIndexSetInteger(5,PLOT_DRAW_TYPE,DRAW_NONE);
   PlotIndexSetInteger(6,PLOT_DRAW_TYPE,DRAW_NONE);
   PlotIndexSetInteger(7,PLOT_DRAW_TYPE,DRAW_NONE);

   PlotIndexSetString(4,PLOT_LABEL,"ner up zone P1");
   PlotIndexSetString(5,PLOT_LABEL,"ner up zone P2");
   PlotIndexSetString(6,PLOT_LABEL,"ner dn zone P1");
   PlotIndexSetString(7,PLOT_LABEL,"ner dn zone P2");


   ArraySetAsSeries(SlowDnPts,true);
   ArraySetAsSeries(SlowUpPts,true);
   ArraySetAsSeries(FastDnPts,true);
   ArraySetAsSeries(FastUpPts,true);

   ArraySetAsSeries(ner_hi_zone_P1,true);
   ArraySetAsSeries(ner_hi_zone_P2,true);
   ArraySetAsSeries(ner_lo_zone_P1,true);
   ArraySetAsSeries(ner_lo_zone_P2,true);

   ArraySetAsSeries(ATR,true);

   VLineCreate(0,LINE_V_SHIFT,0,TimeCurrent(),clrMagenta,STYLE_SOLID,1,false,true,false,true,1);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   DeleteZones();
   DeleteGlobalVars();
   ObjectDelete(0,LINE_V_SHIFT);
  }
//+------------------------------------------------------------------+
//|                                                                  |
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
  
   if(prev_calculated!=rates_total)
      CargoDatos=false;


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
////// o SIGNAL_LINE............
   if(CopyBuffer(DefinitionATR,0,0,to_copy,ATR)<=0)
      return 0;


   ArraySetAsSeries(Time,true);
   ArraySetAsSeries(High,true);
   ArraySetAsSeries(Low,true);
   ArraySetAsSeries(Close,true);
   ArraySetAsSeries(Open,true);

   if(prev_calculated!=rates_total)
     {
      if(prev_calculated==0 || Shift_0)
        {
         DibujarRectangulos(High,Low,Close,Time,0);
         ObjectSetInteger(0,LINE_V_SHIFT,OBJPROP_TIME,0,Time[0]);
         TiempoLineShift=Time[0];
         Shift_0=true;
        }
     }

   CargoDatos=true;
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CheckAlerts(const datetime &Time[],const double &Close[])
  {
   static int lastalert=0;

   if(zone_show_alerts==false)
      return;

   if(Time[0]-lastalert>zone_alert_waitseconds)
      if(CheckEntryAlerts(Close)==true)
         lastalert=int(Time[0]);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CheckEntryAlerts(const double &Close[])
  {
// check for entries
   for(int i=0; i<zone_count; i++)
     {
      if(Close[0]>=zone_lo[i] && Close[0]<zone_hi[i])
        {
         if(zone_show_alerts==true)
           {
            if(zone_alert_popups==true)
              {
               if(zone_type[i]==ZONE_SUPPORT)
                  Alert(Symbol()+TimeFrameToString(Period())+": Support Zone Entered");
               else
                  Alert(Symbol()+TimeFrameToString(Period())+": Resistance Zone Entered");
              }

            if(zone_alert_sounds==true)
               PlaySound("alert_wav");
           }

         return(true);
        }
     }

   return(false);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DeleteGlobalVars()
  {
   if(SetGlobals==false)
      return;

   GlobalVariableDel("SSSR_Count_"+Symbol()+string(Period()));
   GlobalVariableDel("SSSR_Updated_"+Symbol()+string(Period()));

   int old_count=zone_count;
   zone_count=0;
   DeleteOldGlobalVars(old_count);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DeleteOldGlobalVars(int old_count)
  {
   if(SetGlobals==false)
      return;

   for(int i=zone_count; i<old_count; i++)
     {
      GlobalVariableDel("SSSR_HI_"+Symbol()+string(Period()+i));
      GlobalVariableDel("SSSR_LO_"+Symbol()+string(Period()+i));
      GlobalVariableDel("SSSR_HITS_"+Symbol()+string(Period()+i));
      GlobalVariableDel("SSSR_STRENGTH_"+Symbol()+string(Period()+i));
      GlobalVariableDel("SSSR_AGE_"+Symbol()+string(Period()+i));
     }
  }
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

      if(FastUpPts[shift]>0.001)
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

            if((turned==false && FastUpPts[i]>=loval && FastUpPts[i]<=hival) ||
               (turned==true && FastDnPts[i]<=hival && FastDnPts[i]>=loval))
              {
               // Potential touch, just make sure its been 10+candles since the prev one
               touchOk=true;
               for(j=i+1; j<i+11; j++)
                 {
                  if((turned==false && FastUpPts[j]>=loval && FastUpPts[j]<=hival) ||
                     (turned==true && FastDnPts[j]<=hival && FastDnPts[j]>=loval))
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
         if(FastDnPts[shift]>0.001)
           {
            // a zigzag Low point
            isWeak=true;
            if(SlowDnPts[shift]>0.001)
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
               if((turned==true && FastUpPts[i]>=loval && FastUpPts[i]<=hival) ||
                  (turned==false && FastDnPts[i]<=hival && FastDnPts[i]>=loval))
                 {
                  // Potential touch, just make sure its been 10+candles since the prev one
                  touchOk=true;
                  for(j=i+1; j<i+11; j++)
                    {
                     if((turned==true && FastUpPts[j]>=loval && FastUpPts[j]<=hival) ||
                        (turned==false && FastDnPts[j]<=hival && FastDnPts[j]>=loval))
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
//|                                                                  |
//+------------------------------------------------------------------+
void DrawZones(const datetime &Time[],int Prueba)
  {
   double lower_nerest_zone_P1=0;
   double lower_nerest_zone_P2=0;
   double higher_nerest_zone_P1=EMPTY_VALUE;
   double higher_nerest_zone_P2=EMPTY_VALUE;

   if(SetGlobals==true)
     {
      GlobalVariableSet("SSSR_Count_"+Symbol()+string(Period()),zone_count);
      GlobalVariableSet("SSSR_Updated_"+Symbol()+string(Period()),TimeCurrent());
     }

   string s="";
   for(int i=0; i<zone_count; i++)
     {
      if(zone_strength[i]==ZONE_WEAK && zone_show_weak==false)
         continue;

      if(zone_strength[i]==ZONE_UNTESTED && zone_show_untested==false)
         continue;

      if(zone_strength[i]==ZONE_TURNCOAT && zone_show_turncoat==false)
         continue;

      //name sup
      if(zone_type[i]==ZONE_SUPPORT)
         s="SSSR#S"+string(i)+" Strength=";
      else
         //name res
         s="SSSR#R"+string(i)+" Strength=";

      if(zone_strength[i]==ZONE_PROVEN)
         s=s+"Proven, Test Count="+string(zone_hits[i]);
      else
         if(zone_strength[i]==ZONE_VERIFIED)
            s=s+"Verified, Test Count="+string(zone_hits[i]);
         else
            if(zone_strength[i]==ZONE_UNTESTED)
               s=s+"Untested";
            else
               if(zone_strength[i]==ZONE_TURNCOAT)
                  s=s+"Turncoat";
               else
                  s=s+"Weak";

      int Indice=MathMin(Bars(Symbol(),Period())-1,Prueba);

      if(ObjectFind(0,s)<0)
         ObjectCreate(0,s,OBJ_RECTANGLE,0,Time[zone_start[i]],zone_hi[i],Time[Indice],zone_lo[i]);

      ObjectSetInteger(0,s,OBJPROP_FILL,true);
      //ObjectSetInteger(0,s,OBJPROP_TIME,0,Time[zone_start[i]]);
      //ObjectSetInteger(0,s,OBJPROP_TIME,1,Time[Indice]);
      //ObjectSetDouble(0,s,OBJPROP_PRICE,0,zone_hi[i]);
      //ObjectSetDouble(0,s,OBJPROP_PRICE,1,zone_lo[i]);
      ObjectSetInteger(0,s,OBJPROP_BACK,zone_solid);
      ObjectSetInteger(0,s,OBJPROP_WIDTH,zone_linewidth);
      ObjectSetInteger(0,s,OBJPROP_STYLE,zone_style);

      if(zone_type[i]==ZONE_SUPPORT)
        {
         // support zone
         if(zone_strength[i]==ZONE_TURNCOAT)
            ObjectSetInteger(0,s,OBJPROP_COLOR,color_support_turncoat);
         else
            if(zone_strength[i]==ZONE_PROVEN)
               ObjectSetInteger(0,s,OBJPROP_COLOR,color_support_proven);
            else
               if(zone_strength[i]==ZONE_VERIFIED)
                  ObjectSetInteger(0,s,OBJPROP_COLOR,color_support_verified);
               else
                  if(zone_strength[i]==ZONE_UNTESTED)
                     ObjectSetInteger(0,s,OBJPROP_COLOR,color_support_untested);
                  else
                     ObjectSetInteger(0,s,OBJPROP_COLOR,color_support_weak);
        }
      else
        {
         // resistance zone
         if(zone_strength[i]==ZONE_TURNCOAT)
            ObjectSetInteger(0,s,OBJPROP_COLOR,color_resist_turncoat);
         else
            if(zone_strength[i]==ZONE_PROVEN)
               ObjectSetInteger(0,s,OBJPROP_COLOR,color_resist_proven);
            else
               if(zone_strength[i]==ZONE_VERIFIED)
                  ObjectSetInteger(0,s,OBJPROP_COLOR,color_resist_verified);
               else
                  if(zone_strength[i]==ZONE_UNTESTED)
                     ObjectSetInteger(0,s,OBJPROP_COLOR,color_resist_untested);
                  else
                     ObjectSetInteger(0,s,OBJPROP_COLOR,color_resist_weak);
        }


      if(SetGlobals==true)
        {
         GlobalVariableSet("SSSR_HI_"+Symbol()+string(Period())+string(i),zone_hi[i]);
         GlobalVariableSet("SSSR_LO_"+Symbol()+string(Period())+string(i),zone_lo[i]);
         GlobalVariableSet("SSSR_HITS_"+Symbol()+string(Period())+string(i),zone_hits[i]);
         GlobalVariableSet("SSSR_STRENGTH_"+Symbol()+string(Period())+string(i),zone_strength[i]);
         GlobalVariableSet("SSSR_AGE_"+Symbol()+string(Period())+string(i),zone_start[i]);
        }
      double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
      //nearest zones
      if(zone_lo[i]>lower_nerest_zone_P2 && Bid>zone_lo[i])
        {
         lower_nerest_zone_P1=zone_hi[i];
         lower_nerest_zone_P2=zone_lo[i];
        }
      if(zone_hi[i]<higher_nerest_zone_P1 && Bid<zone_hi[i])
        {
         higher_nerest_zone_P1=zone_hi[i];
         higher_nerest_zone_P2=zone_lo[i];
        }
     }

   ner_hi_zone_P1[0]=higher_nerest_zone_P1;
   ner_hi_zone_P2[0]=higher_nerest_zone_P2;
   ner_lo_zone_P1[0]=lower_nerest_zone_P1;
   ner_lo_zone_P2[0]=lower_nerest_zone_P2;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Fractal(int M,int P,int shift,const double &High[],const double &Low[],int Prueba)
  {
   int PeriodoEva=(PeriodSeconds(Period())/60);

   if(PeriodoEva>P)
      P=PeriodoEva;

   P=int(P/PeriodoEva*2+MathCeil(P/PeriodoEva/2));

   if(shift-Prueba<P)
      return(false);

   if(shift>=Bars(Symbol(),PERIOD_CURRENT)-P)
      return(false);

   Print(P);
   
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
void FastFractals(const double &High[],const double &Low[],int Prueba)
  {
   int shift;
   int limit=MathMin(Bars(Symbol(),PERIOD_CURRENT)-1,BackLimit+Prueba);
   int P=int((PeriodSeconds(Period())/60)*fractal_fast_factor);


   for(int i=1+Prueba; i>=0; i--)
     {
      FastUpPts[i] = 0.0;
      FastDnPts[i] = 0.0;
     }


   for(shift=limit; shift>1+Prueba; shift--)
     {
      if(Fractal(UP_POINT,P,shift,High,Low,Prueba)==true)
         FastUpPts[shift]=High[shift];
      else
         FastUpPts[shift]=0.0;

      if(Fractal(DN_POINT,P,shift,High,Low,Prueba)==true)
         FastDnPts[shift]=Low[shift];
      else
         FastDnPts[shift]=0.0;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SlowFractals(const double &High[],const double &Low[],int Prueba)
  {
   int shift;
   int limit=MathMin(Bars(Symbol(),PERIOD_CURRENT)-1,BackLimit+Prueba);
   int P=int((PeriodSeconds(Period())/60)*fractal_slow_factor);

   for(int i=1+Prueba; i>=0; i--)
     {
      SlowUpPts[i] = 0.0;
      SlowDnPts[i] = 0.0;
     }


   for(shift=limit; shift>1+Prueba; shift--)
     {
      if(Fractal(UP_POINT,P,shift,High,Low,Prueba)==true)
         SlowUpPts[shift]=High[shift];
      else
         SlowUpPts[shift]=0.0;

      if(Fractal(DN_POINT,P,shift,High,Low,Prueba)==true)
         SlowDnPts[shift]=Low[shift];
      else
         SlowDnPts[shift]=0.0;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool NewBar()
  {
   return true;

   static int BarsOnChart = 0;
   int Bars_=iBars(Symbol(),Period());
   if(Bars_== BarsOnChart)
      return (false);
   BarsOnChart = Bars_;
   return(true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DeleteZones()
  {
   int len=5;
   int i=0;

   while(i<ObjectsTotal(0,0,-1))
     {
      string objName=ObjectName(0,i,0,-1);
      if(StringSubstr(objName,0,len)!="SSSR#")
        {
         i++;
         continue;
        }
      ObjectDelete(0,objName);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string TimeFrameToString(int tf) //code by TRO
  {
   string tfs;

   switch(tf)
     {
      case PERIOD_M1:
         tfs="M1";
         break;
      case PERIOD_M5:
         tfs="M5";
         break;
      case PERIOD_M15:
         tfs="M15";
         break;
      case PERIOD_M30:
         tfs="M30";
         break;
      case PERIOD_H1:
         tfs="H1";
         break;
      case PERIOD_H4:
         tfs="H4";
         break;
      case PERIOD_D1:
         tfs="D1";
         break;
      case PERIOD_W1:
         tfs="W1";
         break;
      case PERIOD_MN1:
         tfs="MN";
     }

   return(tfs);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringRepeat(string str,int n=1)
  {
   string outstr="";
   for(int i=0; i<n; i++)
      outstr=outstr+str;
   return(outstr);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringRightPad(string str,int n=1,string str2=" ")
  {
   return(str + StringRepeat(str2,n-StringLen(str)));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void MarkPattern(const string name,const datetime Time,const double price,const string shortname,const int fontsize,const color patterncolor)
  {
   ObjectCreate(0,name,OBJ_TEXT,0,Time,price);
   ObjectSetString(0,name,OBJPROP_TEXT,shortname);
   ObjectSetString(0,name,OBJPROP_FONT,"Times New Roman");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,fontsize);
   ObjectSetInteger(0,name,OBJPROP_COLOR,patterncolor);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string GetName(string aName,datetime timeshift)
  {
   return(aName + DoubleToString(timeshift, 0));
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DibujarRectangulos(const double &High[],const double &Low[],const double &Close[],const datetime &Time[],int Prueba)
  {

   static uchar NewBarr=false;
   int CharActual=int(ChartGetInteger(0,CHART_VISIBLE_BARS));



//Print("Entra New Bar");
   int old_zone_count=zone_count;
   FastFractals(High,Low,Prueba);
   SlowFractals(High,Low,Prueba);
   DeleteZones();
   FindZones(High,Close,Low,Prueba);
   DrawZones(Time,Prueba);
   if(zone_count<old_zone_count)
      DeleteOldGlobalVars(old_zone_count);
   NewBarr=true;

   if(zone_show_info==true && NewBarr)
     {
      // Print("ENTRA");
      for(int i=0; i<zone_count; i++)
        {
         string lbl;
         if(zone_strength[i]==ZONE_PROVEN)
            lbl="Probado";
         else
            if(zone_strength[i]==ZONE_VERIFIED)
               lbl="Verificado";
            else
               if(zone_strength[i]==ZONE_UNTESTED)
                  lbl="No Probado";
               else
                  if(zone_strength[i]==ZONE_TURNCOAT)
                     lbl="Roto";
                  else
                     lbl="Debil";

         if(zone_type[i]==ZONE_SUPPORT)
            lbl=lbl+" "+sup_name;
         else
            lbl=lbl+" "+res_name;

         if(zone_hits[i]>0 && zone_strength[i]>ZONE_UNTESTED)
           {
            if(zone_hits[i]==1)
               lbl=lbl+", "+test_name+"="+string(zone_hits[i]);
            else
               lbl=lbl+", "+test_name+"="+string(zone_hits[i]);
           }

         int adjust_hpos;
         int wbpc=int(ChartGetInteger(0,CHART_VISIBLE_BARS));


         int Pixeles=0;
         int desfase=1;
         int X,Y;
         int PixelexWidth=int(ChartGetInteger(0,CHART_WIDTH_IN_PIXELS));
         int BarsWidth=int(ChartGetInteger(0,CHART_WIDTH_IN_BARS));

         if(ChartTimePriceToXY(0,0,iTime(Symbol(),PERIOD_CURRENT,0),iClose(Symbol(),PERIOD_CURRENT,0),X,Y))
           {
            int TextoSize=200;
            Pixeles=PixelexWidth-X;
            double BarsPixeles=PixelexWidth/double(BarsWidth);
            int PixelesQueda=Pixeles-TextoSize;
            desfase=int((BarsWidth-CharActual)-(TextoSize/BarsPixeles));
            desfase=PixelesQueda<=0?-1:desfase;
            desfase=desfase<=0?1:desfase;
           }

         adjust_hpos=int(Time[0]+PeriodSeconds(Period())*desfase);


         // int shift=k*zone_label_shift;
         double vpos=zone_hi[i]-(zone_hi[i]-zone_lo[i])/2;

         if(zone_strength[i]==ZONE_WEAK && zone_show_weak==false)
            continue;
         if(zone_strength[i]==ZONE_UNTESTED && zone_show_untested==false)
            continue;
         if(zone_strength[i]==ZONE_TURNCOAT && zone_show_turncoat==false)
            continue;

         color ColorText=Text_color;
         if(zone_type[i]==ZONE_SUPPORT)
           {
            // support zone
            if(zone_strength[i]==ZONE_TURNCOAT)
               ColorText=color_support_turncoat;
            else
               if(zone_strength[i]==ZONE_PROVEN)
                  ColorText=color_support_proven;
               else
                  if(zone_strength[i]==ZONE_VERIFIED)
                     ColorText=color_support_verified;
                  else
                     if(zone_strength[i]==ZONE_UNTESTED)
                        ColorText=color_support_untested;
                     else
                        ColorText=color_support_weak;
           }
         else
           {
            // resistance zone
            if(zone_strength[i]==ZONE_TURNCOAT)
               ColorText=color_resist_turncoat;
            else
               if(zone_strength[i]==ZONE_PROVEN)
                  ColorText=color_resist_proven;
               else
                  if(zone_strength[i]==ZONE_VERIFIED)
                     ColorText=color_resist_verified;
                  else
                     if(zone_strength[i]==ZONE_UNTESTED)
                        ColorText=color_resist_untested;
                     else
                        ColorText=color_resist_weak;
           }

         string s="SSSR#"+string(i)+"LBL";

         if(zone_strength[i]!=ZONE_VERIFIED && zone_strength[i]!=ZONE_PROVEN)
           {
            if(ObjectFind(0,s)<0)
               ObjectCreate(0,s,OBJ_TEXT,0,adjust_hpos/*+shift*/,vpos);

            //Print("VPOS ",vpos);
            ObjectSetInteger(0,s,OBJPROP_TIME,0,adjust_hpos/*+shift*/);
            ObjectSetDouble(0,s,OBJPROP_PRICE,0,vpos);
            ObjectSetString(0,s,OBJPROP_TEXT,0,StringRightPad(lbl,36," "));
            ObjectSetInteger(0,s,OBJPROP_FONTSIZE,Text_size);
            ObjectSetString(0,s,OBJPROP_FONT,Text_font);
            ObjectSetInteger(0,s,OBJPROP_COLOR,ColorText);

            ChartRedraw(0);
           }
         else
           {
            int code=zone_hits[i]>10?117:139+zone_hits[i];
            if(ObjectFind(0,s)<0)
               ObjectCreate(0,s,OBJ_ARROW,0,adjust_hpos/*+shift*/,vpos);
            ObjectSetInteger(0,s,OBJPROP_COLOR,ColorText);
            ObjectSetInteger(0,s,OBJPROP_ARROWCODE,code);
            ObjectSetInteger(0,s,OBJPROP_WIDTH,6);
            ObjectSetInteger(0,s,OBJPROP_ANCHOR,ANCHOR_TOP);
           }

        }
     }
   ChartRedraw();

   NewBarr=false;
   CheckAlerts(Time,Close);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VLineCreate(const long            chart_ID=0,        // ID del gráfico
                 const string          name="VLine",      // nombre de la línea
                 const int             sub_window=0,      // índice de subventana
                 datetime              time_l=0,            // hora de la línea
                 const color           clr=clrRed,        // color de la línea
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de la línea
                 const int             width=1,           // grosor de la línea
                 const bool            back=false,        // al fondo
                 const bool            selection=true,    // seleccionar para mover
                 const bool            ray=true,          // continuación de la línea abajo
                 const bool            hidden=true,       // ocultar en la lista de objetos
                 const long            z_order=0)         // prioridad para el clic del ratón
  {
//--- si la hora de la línea no está definida, la trazamos en la última barra
   if(!time_l)
      time_l=TimeCurrent();
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la línea vertical
   if(!ObjectCreate(chart_ID,name,OBJ_VLINE,sub_window,time_l,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la línea vertical! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos el color de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el estilo de visualización de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- establecemos el grosor de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de desplazamiento de la línea con ratón
//--- cuando el objeto gráfico se crea usando la función ObjectCreate, por defecto el objeto
//--- no se puede seleccionar y mover. Mientras que dentro de este método el parámetro selection
//--- por defecto es igual a true, lo que permite seleccionar y mover este objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- activar (true) o desactivar (false) el modo de visualización de la línea en las subventanas del gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY,ray);
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- establecemos la prioridad para obtener el evento de cliquear sobre el gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- ejecución con éxito
   return(true);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // identificador de evento
                  const long& lparam,   // parámetro de evento del tipo long
                  const double& dparam, // parámetro de evento del tipo double
                  const string& sparam  // parámetro de evento del tipo string
                 )
  {
   Print(id," ",lparam," ",dparam," ",sparam);
   static int BarrasAnteriores=0;

   if(id==0 && lparam==86)
     {
      ActivarMovimiento=!ActivarMovimiento;

      if(ActivarMovimiento)
         Print("Se activo Movimiento");
      else
         Print("Se desactivo Movimiento");
     }

   if(id==4 && ActivarMovimiento)
     {
      datetime tiempo=0;
      int subWindow=0;
      double precio=0;
      if(ChartXYToTimePrice(0,(int)lparam,(int)dparam,subWindow,tiempo,precio))
        {
         if(CargoDatos)
           {
            int Barra=iBarShift(Symbol(),PERIOD_CURRENT,tiempo,false);
            int Barras=Bars(Symbol(),PERIOD_CURRENT);

            if(Barras!=BarrasAnteriores)
              {
               bool bool_time=CopyTime(Symbol(),PERIOD_CURRENT,0,Barras,time);
               bool bool_high=CopyHigh(Symbol(),PERIOD_CURRENT,0,Barras,high);
               bool bool_low=CopyLow(Symbol(),PERIOD_CURRENT,0,Barras,low);
               bool bool_close=CopyClose(Symbol(),PERIOD_CURRENT,0,Barras,close);
               BarrasAnteriores=Barras;
              }

            DibujarRectangulos(high,low,close,time,Barra);
            if(Barra==0)
              {
               Shift_0=true;
               ObjectSetInteger(0,LINE_V_SHIFT,OBJPROP_TIME,0,time[0]);
              }
            else
              {
               ObjectSetInteger(0,LINE_V_SHIFT,OBJPROP_TIME,0,time[Barra]);
               Shift_0=false;
              }
           }

        }
     }

   static int CharAnterior=-1;
   int CharActual=int(ChartGetInteger(0,CHART_VISIBLE_BARS));

   if(CargoDatos)
      if(zone_show_info && CharActual!=CharAnterior)
        {
         int Pixeles=0;
         int desfase=1;
         int X,Y;
         int PixelexWidth=int(ChartGetInteger(0,CHART_WIDTH_IN_PIXELS));
         int BarsWidth=int(ChartGetInteger(0,CHART_WIDTH_IN_BARS));
         if(ChartTimePriceToXY(0,0,iTime(Symbol(),PERIOD_CURRENT,0),iClose(Symbol(),PERIOD_CURRENT,0),X,Y))
           {
            int TextoSize=200;
            Pixeles=PixelexWidth-X;
            double BarsPixeles=PixelexWidth/double(BarsWidth);
            int PixelesQueda=Pixeles-TextoSize;
            desfase=int((BarsWidth-CharActual)-(TextoSize/BarsPixeles));
            desfase=PixelesQueda<=0?-1:desfase;
            desfase=desfase<=0?1:desfase;
           }

         int i=0;
         while(i<ObjectsTotal(0,0,OBJ_TEXT))
           {
            string objName=ObjectName(0,i,0,OBJ_TEXT);
            string lblName=ObjectGetString(0,objName,OBJPROP_TEXT,0);
            if(StringSubstr(objName,0,5)!="SSSR#")
              {
               i++;
               continue;
              }
            int adjust_hpos;
            int wbpc=CharActual;
            int k=PeriodSeconds(Period());
            int shift=k*zone_label_shift;


            adjust_hpos=int(iTime(Symbol(),PERIOD_CURRENT,0)+k*desfase);

            ObjectSetInteger(0,objName,OBJPROP_TIME,0,adjust_hpos+shift);
            i++;
           }

         i=0;
         while(i<ObjectsTotal(0,0,OBJ_ARROW))
           {
            string objName=ObjectName(0,i,0,OBJ_ARROW);
            if(StringSubstr(objName,0,5)!="SSSR#")
              {
               i++;
               continue;
              }
            int adjust_hpos;
            int wbpc=CharActual;
            int k=PeriodSeconds(Period());
            int shift=k*zone_label_shift;


            adjust_hpos=int(iTime(Symbol(),PERIOD_CURRENT,0)+k*desfase);

            ObjectSetInteger(0,objName,OBJPROP_TIME,0,adjust_hpos+shift);
            i++;
           }

         CharAnterior=CharActual;
         ChartRedraw(0);
        }


   if(id==2 && sparam==LINE_V_SHIFT)
     {
      if(CargoDatos)
        {
         datetime Tiempo=(datetime)ObjectGetInteger(0,LINE_V_SHIFT,OBJPROP_TIME,0);
         int Barra=iBarShift(Symbol(),PERIOD_CURRENT,Tiempo,false);
         int Barras=Bars(Symbol(),PERIOD_CURRENT);

         if(Barras!=BarrasAnteriores)
           {
            bool bool_time=CopyTime(Symbol(),PERIOD_CURRENT,0,Barras,time);
            bool bool_high=CopyHigh(Symbol(),PERIOD_CURRENT,0,Barras,high);
            bool bool_low=CopyLow(Symbol(),PERIOD_CURRENT,0,Barras,low);
            bool bool_close=CopyClose(Symbol(),PERIOD_CURRENT,0,Barras,close);
            BarrasAnteriores=Barras;
           }

         DibujarRectangulos(high,low,close,time,Barra);
         if(Barra==0)
           {
            Shift_0=true;
            ObjectSetInteger(0,LINE_V_SHIFT,OBJPROP_TIME,0,time[0]);
           }
         else
            Shift_0=false;
        }
      else
         ObjectSetInteger(0,LINE_V_SHIFT,OBJPROP_TIME,0,time[0]);
     }
  }
//+------------------------------------------------------------------+
