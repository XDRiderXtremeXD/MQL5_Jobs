//+------------------------------------------------------------------+
//|                                        ExpertoTrailingSupRes.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

input int Porcentaje_Puntos_BE_Start=100;
input int Porcentaje_Puntos_SL_Start=100;
input int Porcentaje_Puntos_TP_Start=100;
input int DesfaseTrailing=20;
input ENUM_TIMEFRAMES PeriodoTrailing=PERIOD_M1;
input bool Activar_Nivel_Profit=false;
input string S1__="=====================  Configuracion SOP RES ===========================================";//==========================================================================================
input int BackLimit=500;
input double zone_fuzzfactor=0.50;
bool Ver_Sop_Res=false;
bool zone_show_weak=true;//Mostrar zonas débiles
bool zone_show_untested = true;//Mostrar zonas no probadas
bool zone_show_turncoat = true;//Mostrar zonas rotas
int SeparacionTexto=10;

int Posiciones=0;

struct IDS_Posiciones
  {
   int               ID;
   ulong               Ticket;
   int               Puntos_SL;
   int               BarrasCargadas;
   double            Close[];
   double            High[];
   double            Low[];
   double            Open[];
   int               handle_ATR;
   ENUM_TIMEFRAMES   Periodo;
   string            Simbolo;
   double            NivelProfit;
  };

IDS_Posiciones ID_Pos[];


input string pus2="/////////////////////////////////////////////////";
bool fractals_show=false;
input double fractal_fast_factor = 3.0;
input double fractal_slow_factor = 7.0;
bool SetGlobals=false;

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

#include<Trade\Trade.mqh>
CTrade trade;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   /*
      int IDs=0;
      int TotalPosiciones=PositionsTotal();
      for(int i=TotalPosiciones-1; i>=0; i--)
        {
         ulong Ticket=PositionGetTicket(i);
         Print(PositionGetDouble(POSITION_PROFIT));
         IDs=(int)PositionGetInteger(POSITION_IDENTIFIER);
         Print(EnumToString(ENUM_POSITION_REASON(PositionGetInteger(POSITION_REASON)))," ID ",IDs);
        }

      Print("------------------------------------------------------");
   //--- request trade history
      HistorySelect(iTime(Symbol(),PERIOD_D1,0),TimeCurrent());
   //--- create objects
      int     total=HistoryDealsTotal();
      ulong    ticket=0;

      for(int i=total-1; i>=0; i--)
        {
         //--- try to get deals ticket
         if((ticket=HistoryDealGetTicket(i))>0)
           {
            int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
            int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
            int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
            double SL =HistoryDealGetDouble(ticket,DEAL_SL);
            double TP =HistoryDealGetDouble(ticket,DEAL_TP);
            double OP =HistoryDealGetDouble(ticket,DEAL_PRICE);

            Print("ID ",ID," MAGIG ",Magic," ENTRY ",EnumToString(ENUM_DEAL_ENTRY(entry)));
            Print("SL ",SL," TP ",TP," OP ",OP);
            //}
           }
        }
      Print("------------------------------------------------------");
   //--- request trade history
      HistorySelect(iTime(Symbol(),PERIOD_D1,0),TimeCurrent());
   //--- create objects
      total=HistoryOrdersTotal();
      ticket=0;

      for(int i=total-1; i>=0; i--)
        {
         //--- try to get deals ticket
         if((ticket=HistoryOrderGetTicket(i))>0)
           {
            int ID  =(int)HistoryOrderGetInteger(ticket,ORDER_POSITION_ID);
            int Magic=(int)HistoryOrderGetInteger(ticket,ORDER_MAGIC);
            int entry =(int)HistoryOrderGetInteger(ticket,ORDER_REASON);
            double SL =HistoryOrderGetDouble(ticket,ORDER_SL);
            double TP =HistoryOrderGetDouble(ticket,ORDER_TP);
            double OP =HistoryOrderGetDouble(ticket,ORDER_PRICE_OPEN);
            string Simbolo=HistoryOrderGetString(ticket,ORDER_SYMBOL);

            Print(Simbolo,"  ID ",ID," MAGIG ",Magic," REASON ",EnumToString(ENUM_ORDER_REASON(entry)));
            Print("SL ",SL," TP ",TP," OP ",OP);
            //}
           }
        }*/

   EventSetMillisecondTimer(1);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EventKillTimer();

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTimer()
  {
   Actualizar_Tickets();

   for(int j=ArraySize(ID_Pos)-1; j>=0; j--)
     {
      if(ID_Pos[j].Puntos_SL!=0)
        {
         ENUM_TIMEFRAMES Periodo=ID_Pos[j].Periodo;
         int Barras=iBars(ID_Pos[j].Simbolo,Periodo);
         if(Barras!=ID_Pos[j].BarrasCargadas)
           {
          //  Print(" SEPARACION ------------------------------------------");
            //Print("Entra ",Periodo," Simbolo ",ID_Pos[j].Simbolo,"  ",BarsCalculated(ID_Pos[j].handle_ATR)," ",Barras," Puntos ",ID_Pos[j].Puntos_SL);
            if(BarsCalculated(ID_Pos[j].handle_ATR)!=Barras)
               continue;

            int copied=CopyHigh(ID_Pos[j].Simbolo,Periodo,0,Barras,ID_Pos[j].High);
            if(copied<=0)
               continue;

            copied=CopyLow(ID_Pos[j].Simbolo,Periodo,0,Barras,ID_Pos[j].Low);
            if(copied<=0)
               continue;

            copied=CopyClose(ID_Pos[j].Simbolo,Periodo,0,Barras,ID_Pos[j].Close);
            if(copied<=0)
               continue;

            copied=CopyOpen(ID_Pos[j].Simbolo,Periodo,0,Barras,ID_Pos[j].Open);
            if(copied<=0)
               continue;


            FastFractals(ID_Pos[j].High,ID_Pos[j].Low,1,ID_Pos[j].Periodo,ID_Pos[j].Simbolo);
            SlowFractals(ID_Pos[j].High,ID_Pos[j].Low,1,ID_Pos[j].Periodo,ID_Pos[j].Simbolo);

            if(!FindZones(ID_Pos[j].High,ID_Pos[j].Close,ID_Pos[j].Low,1,ID_Pos[j].Periodo,ID_Pos[j].handle_ATR,ID_Pos[j].Simbolo))
               continue;

            if(PositionSelectByTicket(ID_Pos[j].Ticket))
              {
               int Puntos_Start=int(ID_Pos[j].Puntos_SL*(Porcentaje_Puntos_SL_Start/100.0));
               string Simbolo=PositionGetString(POSITION_SYMBOL);
               double Points=SymbolInfoDouble(Simbolo,SYMBOL_POINT);
               double current=PositionGetDouble(POSITION_PRICE_CURRENT);
               double open=PositionGetDouble(POSITION_PRICE_OPEN);
               double profit=PositionGetDouble(POSITION_PROFIT);
               double SL=PositionGetDouble(POSITION_SL);
               int digits=(int)SymbolInfoInteger(Simbolo,SYMBOL_DIGITS);

               //Print(profit," ",open," ",int(MathAbs(open-current)/Points));

               if(profit>0 && int(MathAbs(open-current)/Points)>Puntos_Start)
                 {
                  double NewSL=0;
                  double Nivel_Profit=0;
                  for(int i=0; i<zone_count; i++)
                    {
                     if(zone_strength[i]==ZONE_PROVEN || zone_strength[i]==ZONE_VERIFIED)
                       {
                        if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
                          {
                           double zone=zone_lo[i]-DesfaseTrailing*Points;
                           if(zone_type[i]==ZONE_SUPPORT)
                              if(zone>=open+Points*Puntos_Start)
                                 if(current>zone)
                                   {
                                    if(NewSL<zone || NewSL==0)
                                       NewSL=zone;
                                   }
                           if(zone_type[i]==ZONE_RESIST)
                              if(Nivel_Profit>zone_lo[i] || Nivel_Profit==0)
                                 Nivel_Profit=zone_lo[i];
                          }
                        else
                          {
                          double zone=zone_hi[i]+DesfaseTrailing*Points;
                           if(zone_type[i]==ZONE_RESIST)
                              if(zone<=open-Points*Puntos_Start)
                                 if(current<zone)
                                   {
                                    if(NewSL>zone|| NewSL==0)
                                       NewSL=zone;
                                   }

                           if(zone_type[i]==ZONE_SUPPORT)
                              if(Nivel_Profit<zone_hi[i] || Nivel_Profit==0)
                                 Nivel_Profit=zone_hi[i];
                          }
                        // Print(" HIGH: ",zone_hi[i]," LOW: ",zone_lo[i],"  ",PositionGetDouble(POSITION_PRICE_CURRENT),"  strengh ",zone_strength[i]," type ",zone_type[i]);
                       }
                    }
                  // Print(" NEW SL: ",NewSL);
                  // Print(" Nivel Profit: ",Nivel_Profit);
                  ID_Pos[j].NivelProfit=Nivel_Profit;

                  if(NewSL!=0)
                    {
                     NewSL=NormalizeDouble(NewSL,digits);

                     if(SL!=NewSL)
                       {
                        if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
                          {
                           if(SL==0 || NewSL>SL)
                             {
                              trade.PositionModify(ID_Pos[j].Ticket,NewSL,PositionGetDouble(POSITION_TP));
                              //   Print("Modifica SL al soporte cercano");
                             }
                          }
                        else
                          {
                           if(SL==0 || NewSL<SL)
                             {
                              trade.PositionModify(ID_Pos[j].Ticket,NewSL,PositionGetDouble(POSITION_TP));
                              //  Print("Modifica SL a la resistencia cercana");
                             }
                          }
                       }
                    }
                 }
              }

            ID_Pos[j].BarrasCargadas=Barras;
           }
        }
     }


   for(int j=ArraySize(ID_Pos)-1; j>=0; j--)
     {
      if(ID_Pos[j].Puntos_SL!=0)
         if(PositionSelectByTicket(ID_Pos[j].Ticket))
           {
            int Puntos_BE=int(ID_Pos[j].Puntos_SL*(Porcentaje_Puntos_BE_Start/100.0));
            int Puntos_TP=int(ID_Pos[j].Puntos_SL*(Porcentaje_Puntos_TP_Start/100.0));
            double Nivel_Profit=ID_Pos[j].NivelProfit;
            string Simbolo=PositionGetString(POSITION_SYMBOL);
            double Points=SymbolInfoDouble(Simbolo,SYMBOL_POINT);
            double current=PositionGetDouble(POSITION_PRICE_CURRENT);
            double open=PositionGetDouble(POSITION_PRICE_OPEN);
            double SL=PositionGetDouble(POSITION_SL);
            int digits=(int)SymbolInfoInteger(Simbolo,SYMBOL_DIGITS);

            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
              {
               if(open+Puntos_BE*Points<=current && (SL==0 || open>SL))
                 {
                  trade.PositionModify(ID_Pos[j].Ticket,open,PositionGetDouble(POSITION_TP));
                  // Print("Modifica el SL al BreakEven");
                 }

               if(Activar_Nivel_Profit && Nivel_Profit!=0)
                 {
                  if(open+Puntos_TP*Points<=current && (current>=Nivel_Profit))
                    {
                     trade.PositionClose(ID_Pos[j].Ticket,-1);
                     //  Print("Cierra por TP ",Simbolo);
                    }
                 }
              }
            else
              {
               if(open-Puntos_BE*Points>=current && (SL==0 || open<SL))
                 {
                  trade.PositionModify(ID_Pos[j].Ticket,open,PositionGetDouble(POSITION_TP));
                  //  Print("Modifica el SL al BreakEven");
                 }

               if(Activar_Nivel_Profit && Nivel_Profit!=0)
                 {
                  if(open-Puntos_TP*Points>=current && (current<=Nivel_Profit))
                    {
                     trade.PositionClose(ID_Pos[j].Ticket,-1);
                     //   Print("Cierra por TP ",Simbolo);
                    }
                 }
              }
           }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Actualizar_Tickets()
  {


   int TotalPosiciones=PositionsTotal();

   if(TotalPosiciones!=Posiciones)
     {
      for(int j=ArraySize(ID_Pos)-1; j>=0; j--)
         IndicatorRelease(ID_Pos[j].handle_ATR);

      //Print("------------------------------------------------------");
      ArrayResize(ID_Pos,0);
      for(int i=TotalPosiciones-1; i>=0; i--)
        {
         ulong Ticket=PositionGetTicket(i);
         int ID_=(int)PositionGetInteger(POSITION_IDENTIFIER);
         int Size=ArraySize(ID_Pos);
         ArrayResize(ID_Pos,Size+1);
         ID_Pos[Size].ID=ID_;
         ID_Pos[Size].Ticket=Ticket;
         ID_Pos[Size].Puntos_SL=0;
         ID_Pos[Size].Periodo=PeriodoTrailing;
         ID_Pos[Size].Simbolo=PositionGetSymbol(i);
         ID_Pos[Size].handle_ATR=iATR(PositionGetSymbol(i),PeriodoTrailing,7);
         ID_Pos[Size].BarrasCargadas=0;
         ArraySetAsSeries(ID_Pos[Size].Close,true);
         ArraySetAsSeries(ID_Pos[Size].Open,true);
         ArraySetAsSeries(ID_Pos[Size].High,true);
         ArraySetAsSeries(ID_Pos[Size].Low,true);
        }

      HistorySelect(TimeCurrent()-PeriodSeconds(PERIOD_MN1)*2,TimeCurrent());
      //--- create objects
      int     total=HistoryDealsTotal();
      ulong    ticket=0;

      for(int j=ArraySize(ID_Pos)-1; j>=0; j--)
         for(int i=total-1; i>=0; i--)
           {
            //--- try to get deals ticket
            if((ticket=HistoryDealGetTicket(i))>0)
              {
               int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
               int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
               int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
               double SL =HistoryDealGetDouble(ticket,DEAL_SL);
               double TP =HistoryDealGetDouble(ticket,DEAL_TP);
               double OP =HistoryDealGetDouble(ticket,DEAL_PRICE);
               string Symbolo =HistoryDealGetString(ticket,DEAL_SYMBOL);

               if(ID_Pos[j].ID==ID && entry==DEAL_ENTRY_IN)
                 {
                  ID_Pos[j].Puntos_SL=int(MathAbs(SL-OP)/(SymbolInfoDouble(Symbolo,SYMBOL_POINT)));
                  //Print("ID ",ID," MAGIG ",Magic," ENTRY ",EnumToString(ENUM_DEAL_ENTRY(entry)));
                  //Print("SL ",SL," TP ",TP," OP ",OP);

                  break;
                 }
               //}
              }
           }

     // Print("------------------------------------------------------");

     // for(int j=ArraySize(ID_Pos)-1; j>=0; j--)
       //  Print("ID ",ID_Pos[j].ID," TICKET ",ID_Pos[j].Ticket," PUNTOS_SL ",ID_Pos[j].Puntos_SL);

   //   Print("ACTUALIZO TICKETS");

      Posiciones=TotalPosiciones;
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FindZones(const double &High[],const double &Close[],const double &Low[],int Prueba,ENUM_TIMEFRAMES TimeFrame,int &DefinitionATR_,string Simbolo)
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
   int BarrasTimeFrame=Bars(Simbolo,TimeFrame);


   for(shift=MathMin(BarrasTimeFrame-1,BackLimit+Prueba); shift>5+Prueba; shift--)
     {
      bool carga=false;
      double atr=0;
      for(int I2=0; I2<5 && carga==false; I2++)
        {
         double ATRs[1];
         if(CopyBuffer(DefinitionATR_,0,shift,1,ATRs)>0)
            if(BarsCalculated(DefinitionATR_)==BarrasTimeFrame)
              {
               atr=ATRs[0];
               carga=true;
              }
        }
      if(!carga)
        {
         Print("NO CARGO ATR");
         return false;
        }

      //double atr= iATR(NULL,0,7,shift);
      //double atr=ATR[shift];
      double fu = atr/2 * zone_fuzzfactor;
      bool isWeak;
      bool touchOk= false;
      bool isBust = false;

      if(FastUpPts[shift-Prueba]>0.001)
        {
         isWeak=true;
         if(SlowUpPts[shift-Prueba]>0.001)
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

            if((turned==false && FastUpPts[i-Prueba]>=loval && FastUpPts[i-Prueba]<=hival) ||
               (turned==true && FastDnPts[i-Prueba]<=hival && FastDnPts[i-Prueba]>=loval))
              {
               // Potential touch, just make sure its been 10+candles since the prev one
               touchOk=true;
               for(j=i+1; j<i+11; j++)
                 {
                  if((turned==false && FastUpPts[j-Prueba]>=loval && FastUpPts[j-Prueba]<=hival) ||
                     (turned==true && FastDnPts[j-Prueba]<=hival && FastDnPts[j-Prueba]>=loval))
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
         if(FastDnPts[shift-Prueba]>0.001)
           {
            // a zigzag Low point
            isWeak=true;
            if(SlowDnPts[shift-Prueba]>0.001)
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
               if((turned==true && FastUpPts[i-Prueba]>=loval && FastUpPts[i-Prueba]<=hival) ||
                  (turned==false && FastDnPts[i-Prueba]<=hival && FastDnPts[i-Prueba]>=loval))
                 {
                  // Potential touch, just make sure its been 10+candles since the prev one
                  touchOk=true;
                  for(j=i+1; j<i+11; j++)
                    {
                     if((turned==true && FastUpPts[j-Prueba]>=loval && FastUpPts[j-Prueba]<=hival) ||
                        (turned==false && FastDnPts[j-Prueba]<=hival && FastDnPts[j-Prueba]>=loval))
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
   int Limite=MathMin(Bars(Simbolo,TimeFrame)-1,500+Prueba);
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
void FastFractals(const double &High[],const double &Low[],int shiftBar,ENUM_TIMEFRAMES TimeFrame,string Simbolo)
  {
   int shift;
   int limit=MathMin(Bars(Simbolo,TimeFrame)-1,BackLimit+shiftBar);
   int P=int((PeriodSeconds(TimeFrame)/60)*fractal_fast_factor);

   ArrayResize(FastDnPts,limit);
   ArrayResize(FastUpPts,limit);
   ArrayResize(SlowDnPts,limit);
   ArrayResize(SlowUpPts,limit);

   FastUpPts[0] = 0.0;
   FastUpPts[1] = 0.0;
   FastDnPts[0] = 0.0;
   FastDnPts[1] = 0.0;

   for(shift=limit; shift>1+shiftBar; shift--)
     {
      if(Fractal(UP_POINT,P,shift,High,Low,shiftBar,TimeFrame,Simbolo)==true)
         FastUpPts[shift-shiftBar]=High[shift];
      else
         FastUpPts[shift-shiftBar]=0.0;

      if(Fractal(DN_POINT,P,shift,High,Low,shiftBar,TimeFrame,Simbolo)==true)
         FastDnPts[shift-shiftBar]=Low[shift];
      else
         FastDnPts[shift-shiftBar]=0.0;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SlowFractals(const double &High[],const double &Low[],int shiftBar,ENUM_TIMEFRAMES TimeFrame,string Simbolo)
  {
   int shift;
   int limit=MathMin(Bars(Simbolo,TimeFrame)-1,BackLimit+shiftBar);
   int P=int((PeriodSeconds(TimeFrame)/60)*fractal_slow_factor);

   SlowUpPts[0] = 0.0;
   SlowUpPts[1] = 0.0;
   SlowDnPts[0]= 0.0;
   SlowDnPts[1] = 0.0;


   for(shift=limit; shift>1+shiftBar; shift--)
     {
      if(Fractal(UP_POINT,P,shift,High,Low,shiftBar,TimeFrame,Simbolo)==true)
         SlowUpPts[shift-shiftBar]=High[shift];
      else
         SlowUpPts[shift-shiftBar]=0.0;

      if(Fractal(DN_POINT,P,shift,High,Low,shiftBar,TimeFrame,Simbolo)==true)
         SlowDnPts[shift-shiftBar]=Low[shift];
      else
         SlowDnPts[shift-shiftBar]=0.0;
     }
  }
//+------------------------------------------------------------------+
bool Fractal(int M,int P,int shift,const double &High[],const double &Low[],int Prueba,ENUM_TIMEFRAMES TimeFrame,string Simbolo)
  {
   int PeriodoEva=(PeriodSeconds(TimeFrame)/60);

   if(PeriodoEva>P)
      P=PeriodoEva;

   P=int(P/PeriodoEva*2+MathCeil(P/PeriodoEva/2));

   if(shift-Prueba<P)
      return(false);

   if(shift>=Bars(Simbolo,TimeFrame)-P)
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

//+------------------------------------------------------------------+
