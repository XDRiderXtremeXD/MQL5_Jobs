//+------------------------------------------------------------------+
//|                                       Supply And Demand V3.0.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright © Propiedad de Luis Felipe Amasifuén"
#property description "Zonas de Oferta y Demanda - Bloque de Ordenes"
#property description "Indicador Multitimeframe para todos los mercados financieros"
#property description "- Forex"
#property description "- Indices"
#property description "- Futuros"
#property description "- Crypto"

#property indicator_chart_window
#property indicator_buffers 9
#property indicator_color1 clrRed
#property indicator_color2 clrRed
#property indicator_color3 clrDodgerBlue
#property indicator_color4 clrDodgerBlue
#property indicator_plots   8


input int BackLimit=3000;

input string pus1="/////////////////////////////////////////////////";
input bool zone_show_weak=true;//Mostrar zonas débiles
input bool zone_show_untested = true;//Mostrar zonas retesteadas
input bool zone_show_turncoat = true;//Mostrar zonas rotas
input double zone_fuzzfactor=0.75;

input string pus2="/////////////////////////////////////////////////";
input bool fractals_show=false;
input double fractal_fast_factor = 3.0;
input double fractal_slow_factor = 6.0;
input bool SetGlobals=true;

input string pus3="/////////////////////////////////////////////////";
input bool zone_solid=true;
input int zone_linewidth=1;
input int zone_style=0;
input bool zone_show_info=true;
input int zone_label_shift=0;
input bool zone_merge=true;
input bool zone_extend=true;

input string pus4="/////////////////////////////////////////////////";
input bool zone_show_alerts  = false;
input bool zone_alert_popups = true;
input bool zone_alert_sounds = true;
input int zone_alert_waitseconds=300;

input string pus5="/////////////////////////////////////////////////";
input int Text_size=8;
input string Text_font = "Courier New";
input color Text_color = clrWhite;
input string sup_name = "Soporte";
input string res_name = "Resistencia";
input string test_name= "Retesteado";


input color color_support_weak     = clrAquamarine;//Color de la zona de soporte débil:
input color color_support_untested = clrPowderBlue;//Color de la zona de soporte no probado:
input color color_support_verified = clrSkyBlue;//Color de la zona de soporte verificado:
input color color_support_proven   = clrTurquoise;//Color de la zona de soporte probado:
input color color_support_turncoat = clrDarkOrange;//Color de la zona de soporte roto:
input color color_resist_weak      = clrOrchid;//Color de la zona de resistencia débil:
input color color_resist_untested  = clrMediumOrchid;//Color de la zona de resistencia no probada:
input color color_resist_verified  = clrCrimson;//Color de la zona de resistencia verificada:
input color color_resist_proven    = clrRed;// Color de la zona de resistencia probada:
input color color_resist_turncoat  = clrDarkOrange;//Color de la zona de resistencia rota:
input int SeparacionTexto=10;

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
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {



   IndicatorSetString(INDICATOR_SHORTNAME,"Indicador Estrellas EMA");

   SetIndexBuffer(0,SlowDnPts,INDICATOR_DATA);
   SetIndexBuffer(1,SlowUpPts,INDICATOR_DATA);
   SetIndexBuffer(2,FastDnPts,INDICATOR_DATA);
   SetIndexBuffer(3,FastUpPts,INDICATOR_DATA);

   SetIndexBuffer(4,ner_hi_zone_P1,INDICATOR_DATA);
   SetIndexBuffer(5,ner_hi_zone_P2,INDICATOR_DATA);
   SetIndexBuffer(6,ner_lo_zone_P1,INDICATOR_DATA);
   SetIndexBuffer(7,ner_lo_zone_P2,INDICATOR_DATA);
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

      PlotIndexSetString(0,PLOT_LABEL,"FRACTAL");
      PlotIndexSetString(1,PLOT_LABEL,"FRACTAL");
      PlotIndexSetString(2,PLOT_LABEL,"FRACTAL");
      PlotIndexSetString(3,PLOT_LABEL,"FRACTAL");
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

   DefinitionATR=iATR(Symbol(),PERIOD_CURRENT,7);
   ArraySetAsSeries(ATR,true);


   return(INIT_SUCCEEDED);

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   DeleteZones();
   DeleteGlobalVars();
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
   /*if(password_status==-1)
     {
      if(TimeCurrent()>UNTIL)
        {
         Comment("TIEMPO DE PRUEBA TERMINADO EA DESHABILITADO");
         return (rates_total);
        }
     }
   */
   
   
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
      return rates_total;

   ArraySetAsSeries(Time,true);
   ArraySetAsSeries(High,true);
   ArraySetAsSeries(Low,true);
   ArraySetAsSeries(Close,true);
   if(NewBar()==true)
     {
      int old_zone_count=zone_count;

      FastFractals(High,Low);
      SlowFractals(High,Low);
      DeleteZones();
      FindZones(High,Close,Low);
      DrawZones(Time);
      if(zone_count<old_zone_count)
         DeleteOldGlobalVars(old_zone_count);
     }

   if(zone_show_info==true)
     {
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
         int k=Period()*60+(20+StringLen(lbl));

         if(wbpc<80)
            adjust_hpos=int(Time[0]+k*4);
         else
            if(wbpc<125)
               adjust_hpos=int(Time[0]+k*8);
            else
               if(wbpc<250)
                  adjust_hpos=int(Time[0]+k*15);
               else
                  if(wbpc<480)
                     adjust_hpos=int(Time[0]+k*29);
                  else
                     if(wbpc<950)
                        adjust_hpos=int(Time[0]+k*58);
                     else
                        adjust_hpos=int(Time[0]+k*115);

         //

         int shift=k*zone_label_shift;
         double vpos=zone_hi[i]-(zone_hi[i]-zone_lo[i])/2;

         if(zone_strength[i]==ZONE_WEAK && zone_show_weak==false)
            continue;
         if(zone_strength[i]==ZONE_UNTESTED && zone_show_untested==false)
            continue;
         if(zone_strength[i]==ZONE_TURNCOAT && zone_show_turncoat==false)
            continue;

         string s="SSSR#"+string(i)+"LBL";
         ObjectCreate(0,s,OBJ_TEXT,0,0,0);
         ObjectSetInteger(0,s,OBJPROP_TIME,0,TimeCurrent()+PeriodSeconds(Period())*SeparacionTexto);
         ObjectSetDouble(0,s,OBJPROP_PRICE,0,vpos);
         ObjectSetString(0,s,OBJPROP_TEXT,0,StringRightPad(lbl,36," "));
         ObjectSetInteger(0,s,OBJPROP_FONTSIZE,Text_size);
         ObjectSetString(0,s,OBJPROP_FONT,Text_font);
         ObjectSetInteger(0,s,OBJPROP_COLOR,Text_color);
        }
     }

   CheckAlerts(Time,Close);

   /*
      ArraySetAsSeries(Time,false);
      ArraySetAsSeries(High,false);
      ArraySetAsSeries(Low,false);
      ArraySetAsSeries(Close,false);
      ArraySetAsSeries(Open,false);

      static datetime prevTime=0;
      if(prevTime==Time[rates_total-1])
         return(rates_total);

      int Start=100;
      if(prev_calculated==0)
        {
         Start=100;
         ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
         ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
         ArrayInitialize(ArrowSignalDN_Confirmacion,EMPTY_VALUE);
         ArrayInitialize(ArrowSignalUP_Confirmacion,EMPTY_VALUE);
        }
      else
         Start=rates_total-1;

      for(int shift=Start; shift<rates_total; shift++)
        {
         ArrowSignalUP[shift]=EMPTY_VALUE;
         ArrowSignalDN[shift]=EMPTY_VALUE;
         ArrowSignalDN_Confirmacion[shift]=EMPTY_VALUE;
         ArrowSignalUP_Confirmacion[shift]=EMPTY_VALUE;

         if(shift!=rates_total-1)
            continue;

         if(!EvaluaHorario(Hora_Inicio,Hora_Final,Time[shift]))
            continue;


         int CumOffset=0;
         ArrayResize(Rates,10);
         int copied=CopyRates(Symbol(),PERIOD_CURRENT,rates_total-1-shift,8,Rates);

         CopyBuffer(Estocastico,0,rates_total-shift-1,3,Estocastico_Buffer);
         CopyBuffer(Estocastico,1,rates_total-shift-1,3,Estocastico_Signal_Buffer);
         CopyBuffer(Estocastico2,0,rates_total-shift-1,3,Estocastico2_Buffer);
         CopyBuffer(Estocastico2,1,rates_total-shift-1,3,Estocastico2_Signal_Buffer);
         CopyBuffer(Momentun,0,rates_total-shift-1,3,Momentun_Buffer);

         ResetLastError();

         double ImpulsoEnd=0,ImpulsoStart=0;

         if(EvaluarPatron(true,Low,High,Open,Close,shift,rates_total)) //&& (MathAbs(Momentun_Buffer[2]-100)>Nivel || MathAbs(Momentun_Buffer[1]-100)>Nivel) ) //&& iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+1)>iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+2) && (Nivel<MathAbs(100-Momentun_Buffer[1]) || Nivel<MathAbs(100-Momentun_Buffer[2])))//&& iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+1)>iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+2))
           {
            if(Close[shift-1]>(Close[shift-2]>Open[shift-2]?Close[shift-2]:Open[shift-2]))
              {
               if(FiltroSupRes(Low[shift-1],High[shift-1],true))
                 {
                  if(FiltroTraspaso(Close,High,Low,shift,true,0,Time,ImpulsoEnd,ImpulsoStart))
                    {
                     HigthBuy=High[shift-1];
                     //ShiftHigh=shift+Velas_Confirmacion;
                     ArrowSignalDN[shift-1] = Low[shift-1] - (Pointer_Offset*_Point);
                     if(shift==rates_total-1)
                       {
                        if(AlertPC)
                           Alert("Operacion Buy en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
                        if(AlertMovil)
                           SendNotification("Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
                        if(AlertMail)
                           SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
                       }
                    }
                 }
              }
            else
               ShiftEvaluaBuy=shift+1;
           }

         if(EvaluarPatron(false,Low,High,Open,Close,shift,rates_total)) //&& (MathAbs(Momentun_Buffer[2]-100)>Nivel || MathAbs(Momentun_Buffer[1]-100)>Nivel) ) //&& iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+1)>iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+2)  && (Nivel<MathAbs(100-Momentun_Buffer[1]) || Nivel<MathAbs(100-Momentun_Buffer[2])))  //&& iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+1)>iVolume(NULL,PERIOD_CURRENT,rates_total-1-shift+2))
           {
            if(Close[shift-1]<(Close[shift-2]<Open[shift-2]?Close[shift-2]:Open[shift-2]))
              {
               if(FiltroSupRes(Low[shift-1],High[shift-1],false))
                 {
                  if(FiltroTraspaso(Close,High,Low,shift,false,0,Time,ImpulsoEnd,ImpulsoStart))
                    {
                     LowSell=Low[shift-1];
                     //ShiftLow=shift+Velas_Confirmacion;
                     ArrowSignalUP[shift-1] = High[shift-1] + (Pointer_Offset*_Point);
                     if(shift==rates_total-1)
                       {
                        if(AlertPC)
                           Alert("Operacion Sell en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));
                        if(AlertMovil)
                           SendNotification("Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
                        if(AlertMail)
                           SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));
                       }
                    }
                 }
              }
            else
               ShiftEvaluaSell=shift+1;

           }
        }

   */
// prevTime=Time[rates_total-1];
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
void FindZones(const double &High[],const double &Close[],const double &Low[])
  {
   int i,j,shift,bustcount=0,testcount=0;
   double hival,loval;
   bool turned=false,hasturned=false;

   double temp_hi[1000],temp_lo[1000];
   int    temp_start[1000],temp_hits[1000],temp_strength[1000],temp_count=0;
   bool   temp_turn[1000],temp_merge[1000];
   int merge1[1000],merge2[1000],merge_count=0;

// iterate through zones from oldest to youngest (ignore recent 5 bars),
// finding those that have survived through to the present___
   for(shift=MathMin(Bars(Symbol(),PERIOD_CURRENT)-1,BackLimit); shift>5; shift--)
     {
      //double atr= iATR(NULL,0,7,shift);
      double atr=ATR[shift];
      double fu = atr/2 * zone_fuzzfactor;
      bool isWeak;
      bool touchOk= false;
      bool isBust = false;

      if(FastUpPts[shift]>0.001)
        {
         // a zigzag High point
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

         for(i=shift-1; i>=0; i--)
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

            for(i=shift-1; i>=0; i--)
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

// look for overlapping zones___
   if(zone_merge==true)
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

         if(zone_hi[zone_count]<Close[4])
            zone_type[zone_count]=ZONE_SUPPORT;
         else
            if(zone_lo[zone_count]>Close[4])
               zone_type[zone_count]=ZONE_RESIST;
            else
              {
               for(j=5; j<1000; j++)
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

               if(j==1000)
                  zone_type[zone_count]=ZONE_SUPPORT;
              }

         zone_count++;
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DrawZones(const datetime &Time[])
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
      //IMPRESION Print("Rectangle ",i," ",DoubleToString(zone_hi[i],Digits())," ",DoubleToString(zone_lo[i],Digits()));

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

      ObjectCreate(0,s,OBJ_RECTANGLE,0,0,0,0,0);
      ObjectSetInteger(0,s,OBJPROP_FILL,true);
      ObjectSetInteger(0,s,OBJPROP_TIME,0,Time[zone_start[i]]);
      ObjectSetInteger(0,s,OBJPROP_TIME,1,Time[0]);
      ObjectSetDouble(0,s,OBJPROP_PRICE,0,zone_hi[i]);
      ObjectSetDouble(0,s,OBJPROP_PRICE,1,zone_lo[i]);
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
bool Fractal(int M,int P,int shift,const double &High[],const double &Low[])
  {
   if(Period()>P)
      P=Period();

   P=int(P/Period()*2+MathCeil(P/Period()/2));

   if(shift<P)
      return(false);

   if(shift>Bars(Symbol(),PERIOD_CURRENT)-P)
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
void FastFractals(const double &High[],const double &Low[])
  {
   int shift;
   int limit=MathMin(Bars(Symbol(),PERIOD_CURRENT)-1,BackLimit);
   int P=int(Period()*fractal_fast_factor);

   FastUpPts[0] = 0.0;
   FastUpPts[1] = 0.0;
   FastDnPts[0] = 0.0;
   FastDnPts[1] = 0.0;

   for(shift=limit; shift>1; shift--)
     {
      if(Fractal(UP_POINT,P,shift,High,Low)==true)
         FastUpPts[shift]=High[shift];
      else
         FastUpPts[shift]=0.0;

      if(Fractal(DN_POINT,P,shift,High,Low)==true)
         FastDnPts[shift]=Low[shift];
      else
         FastDnPts[shift]=0.0;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SlowFractals(const double &High[],const double &Low[])
  {
   int shift;
   int limit=MathMin(Bars(Symbol(),PERIOD_CURRENT)-1,BackLimit);
   int P=int(Period()*fractal_slow_factor);

   SlowUpPts[0] = 0.0;
   SlowUpPts[1] = 0.0;
   SlowDnPts[0] = 0.0;
   SlowDnPts[1] = 0.0;

   for(shift=limit; shift>1; shift--)
     {
      if(Fractal(UP_POINT,P,shift,High,Low)==true)
         SlowUpPts[shift]=High[shift];
      else
         SlowUpPts[shift]=0.0;

      if(Fractal(DN_POINT,P,shift,High,Low)==true)
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
   static datetime LastTime=0;
   if(iTime(Symbol(),Period(),0)+time_offset!=LastTime)
     {
      LastTime=iTime(Symbol(),Period(),0)+time_offset;
      return (true);
     }
   else
      return (false);
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
