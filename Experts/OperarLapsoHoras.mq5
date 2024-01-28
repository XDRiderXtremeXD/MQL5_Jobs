//+------------------------------------------------------------------+
//|                                             OperarLapsoHoras.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

enum GMT_VALUES
  {
   minus_11=-11,//GMT -11:00
   minus_10=-10,//GMT -10:00
   minus_9=-9,//GMT -09:00
   minus_8=-8,//GMT -08:00
   minus_7=-7,//GMT -07:00
   minus_6=-6,//GMT -06:00
   minus_5=-5,//GMT -05:00
   minus_4=-4,//GMT -04:00
   minus_3=-3,//GMT -03:00
   minus_2=-2,//GMT -02:00
   minus_1=-1,//GMT -01:00
   central_0=-0,//GMT Coordinate Universal Time
   plus_1=1,//GMT 01:00
   plus_2=2,//GMT 02:00
   plus_3=3,//GMT 03:00
   plus_4=4,//GMT 04:00
   plus_5=5,//GMT 05:00
   plus_6=6,//GMT 06:00
   plus_7=7,//GMT 07:00
   plus_8=8,//GMT 08:00
   plus_9=9,//GMT 09:00
   plus_10=10,//GMT 10:00
   plus_11=11,//GMT 11:00
   plus_12=12,//GMT 12:00
   plus_13=13,//GMT 13:00
  };
enum ENUM_Horas
  {
   _0am = 0,   //:  0 am
   _1am = 1,   //:  1 am
   _2am = 2,   //:  2 am
   _3am = 3,   //:  3 am
   _4am = 4,   //:  4 am
   _5am = 5,   //:  5 am
   _6am = 6,   //:  6 am
   _7am = 7,   //:  7 am
   _8am = 8,   //:  8 am
   _9am = 9,   //:  9 am
   _10am = 10, //: 10 am
   _11am = 11, //: 11 am
   _12pm = 12, //: 12 pm
   _1pm = 13,  //:  1 pm
   _2pm = 14,  //:  2 pm
   _3pm = 15,  //:  3 pm
   _4pm = 16,  //:  4 pm
   _5pm = 17,  //:  5 pm
   _6pm = 18,  //:  6 pm
   _7pm = 19,  //:  7 pm
   _8pm = 20,  //:  8 pm
   _9pm = 21,  //:  9 pm
   _10pm = 22, //:  10 pm
   _11pm = 23, //:  11 pm
  };
enum Tipo_Operacion
  {
   BUY=0,
   SELL=1,
  };

#include<Trade\Trade.mqh>
CTrade trade;


input double Lote=0.1;
input int magicNumber=2222222;
input ENUM_TIMEFRAMES Periodo_Spike=PERIOD_M1;
input uint max_wait_spike=10;
input uint wait_after_spike=3;
input GMT_VALUES GMT_Time=minus_5;
input ENUM_Horas Hora_Inicio=_8am;
input ENUM_Horas Hora_Final=_6pm;

int hourLast;
bool IsCrash;
MqlRates rates[];
int maximoCopia=0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   hourLast=GetHourCurrent();
   maximoCopia=MathMax((int)max_wait_spike,(int)wait_after_spike)+3;
   if(!ControlCrashBoom(IsCrash))
      return INIT_FAILED;

   trade.SetExpertMagicNumber(magicNumber);
   ArraySetAsSeries(rates,true);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   int copied=CopyRates(NULL,Periodo_Spike,0,maximoCopia,rates);
   if(copied<=0)
      return;

   LogicaCierre(IsCrash);

   int hourCurrent=GetHourCurrent();

   if(hourLast!=hourCurrent)
     {
      if(Hora_Inicio<=hourCurrent && hourCurrent<Hora_Final)
         Operar(!IsCrash,"EXPERT HORA",Lote,0);
      hourLast=hourCurrent;
     }

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Operar(bool isBuy,string comentario,double lote,double stopLoss)
  {
   if(!isBuy)
     {
      if(!trade.Sell(lote,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_BID),stopLoss,0,comentario))
         Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
   else
      if(!trade.Buy(lote,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_ASK),stopLoss,0,comentario))
         Print("No opero buy error : ",GetLastError()," result error ",trade.ResultRetcode());
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetHourCurrent()
  {
   datetime tiempoGMT=TimeGMT()+GMT_Time*3600;
   MqlDateTime structTime;
   TimeToStruct(tiempoGMT,structTime);
   return structTime.hour;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ControlCrashBoom(bool &isCrash)
  {
   string Activo=Symbol();

   if(StringFind(Activo,"Boom",0)!=-1)
      isCrash=false;
   else
      if(StringFind(Activo,"Crash",0)!=-1)
         isCrash=true;
      else
        {
         Alert("El Activo debe ser un Boom o Crash");
         return false;
        }

   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void LogicaCierre(bool isCrash)
  {
   datetime timeCurrentSpike=rates[0].time;
   static datetime lastTimeSpike=timeCurrentSpike;

   if(timeCurrentSpike!=lastTimeSpike)
     {
      int totalPositions = PositionsTotal();

      for(int i = totalPositions-1; i>= 0; i--)
        {
         ulong ticket=PositionGetTicket(i);
         if(ticket!=0)
           {
            if(PositionGetInteger(POSITION_MAGIC)==magicNumber && PositionGetString(POSITION_SYMBOL)==Symbol())
              {
               int barShift=iBarShift(Symbol(),Periodo_Spike,PositionGetInteger(POSITION_TIME),false);
               if(barShift!=-1)
                 {
                  int haySpike=-1;
                  for(int i=1; i<=barShift && i<=(int)max_wait_spike; i++)
                    {
                     if(IsCrash?(rates[i].open>rates[i].close):(rates[i].open<rates[i].close))
                       {
                        haySpike=i;
                        break;
                       }
                    }

                  if(haySpike>=(int)wait_after_spike)
                     trade.PositionClose(ticket,-1);
                  else
                     if(barShift>=(int)max_wait_spike)
                        trade.PositionClose(ticket,-1);
                 }
              }
           }
        }
      lastTimeSpike=timeCurrentSpike;
     }
  }
//+------------------------------------------------------------------+
