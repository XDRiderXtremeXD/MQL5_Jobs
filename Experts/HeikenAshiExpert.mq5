//+------------------------------------------------------------------+
//|                                             HeikenAshiExpert.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#resource "\\Indicators\\heiken_ashi.ex5"

#include<Trade\Trade.mqh>
CTrade trade;

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

input ENUM_TIMEFRAMES TF_Expert=PERIOD_CURRENT;
input int MagicNumber=242222222;
input string S1="=================  CONF ESTRATEGIA  =================";//=====================================================================================
input int MaxRetroceso=3;//Maximos Velas Retroceso (>=1)
input int MinimoConsecutivas=5;//Minimo Velas Consecutivas Direccion (>=1)
input string S2="=================  CONF LOTE  =================";//=====================================================================================
input double Cant_Lotes=0.01;//Cantidad Lotes...
input double Por_Cada=1000;//Por cada...
input string S3="=================  CONF SL y TP  =================";//=====================================================================================
input int VelasSL=3;//Velas Evaluacion StopLoss
input int Adicion_Puntos_SL=10;//Adicion Puntos StopLoss
input int Minimo_SL=150;//Minimo Puntos StopLoss
input double Ratio_TP=2.0;//Ratio TP:SL
input string S32="=================  CONF PORCENTAJE PERDIDA CUENTA MAXIMA =================";//=====================================================================================
input double Porcentaje_Cuenta_Perdida=10;//Porcentaje perdida maxima cuenta
input string S4="=================  CONF BE  =================";//=====================================================================================
input int BE_Puntos_Adicion=10;
input double BE_Porcentaje_TP=50;
input string S5="=================  CONF HORARIO  =================";//=====================================================================================
input ENUM_Horas  Hora_Inicio=_3pm;
input int  Minuto_Inicio=30;
input ENUM_Horas Hora_Final=_4pm;
input int Minuto_Final=0;
input string S6="=================  MA  =================";//======================================================================================================
input int Ma_Periodo=9;
input int Ma_Shift=0;
input ENUM_MA_METHOD Ma_Method=MODE_EMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;

double HA_Open[];
double HA_High[];
double HA_Low[];
double HA_Close[];

MqlRates rates[];

double MA[];

int handle_ind;
int handle_ma;
int barsCopyIndicator=0;

ulong TicketOperacionUnica=0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   if(MaxRetroceso<1)
     {
      Alert("Maximo velas retroceso tiene que ser mayor o igual a 1");
      return INIT_FAILED;
     }
   if(MinimoConsecutivas<1)
     {
      Alert("Minimo velas consecutivas tiene que ser mayor o igual a 1");
      return INIT_FAILED;
     }

   barsCopyIndicator=MathMax(MaxRetroceso+MinimoConsecutivas+2,VelasSL+2);
   barsCopyIndicator=MathMax(barsCopyIndicator,10);

   handle_ind=iCustom(Symbol(),TF_Expert,"::Indicators\\heiken_ashi.ex5");
   handle_ma=iMA(Symbol(),TF_Expert,Ma_Periodo,Ma_Shift,Ma_Method,Ma_AppliedPrice);

   ArraySetAsSeries(HA_Close,true);
   ArraySetAsSeries(HA_High,true);
   ArraySetAsSeries(HA_Low,true);
   ArraySetAsSeries(HA_Open,true);

   ArraySetAsSeries(MA,true);
   ArraySetAsSeries(rates,true);

   GetTicket(TicketOperacionUnica);

   trade.SetExpertMagicNumber(MagicNumber);

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
   int barsActuales=LoadBarsFromSymbol(Symbol(),TF_Expert);
   static int barsLast=barsActuales;


   if(EvaluarHorario(Hora_Inicio,Hora_Final,Minuto_Inicio,Minuto_Final,TimeCurrent()))
      if(barsLast!=barsActuales)
        {
         if(CargarDatos(barsActuales))
           {
            bool IsBuy;
            if(!PositionSelectByTicket(TicketOperacionUnica))
               if(CondicionPerdidaDiaria())
                 {
                  if(CondicionesOperacion(IsBuy))
                    {
                     double Lote_=0.02;
                     if(GetLote(Lote_))
                       {
                        Operar(IsBuy,"Experto",Lote_,GetStopLoss(IsBuy));
                        GetTicket(TicketOperacionUnica);
                        PonerTP(TicketOperacionUnica);
                       }
                    }
                 }
            barsLast=barsActuales;
           }
        }

   GestionBE_TP();
   GestionStopPorcentaje();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GestionBE_TP()
  {
   if(PositionSelectByTicket(TicketOperacionUnica))
     {
      double SL=PositionGetDouble(POSITION_SL);
      double OP=PositionGetDouble(POSITION_PRICE_OPEN);
      double TP=PositionGetDouble(POSITION_TP);
      double CURRENT=PositionGetDouble(POSITION_PRICE_CURRENT);

      if(TP!=0)
        {
         bool TipoBuy=(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY);
         int points=int((MathAbs(OP-TP)/Point())*BE_Porcentaje_TP/100.0);
         double BE_Start=TipoBuy?NormalizeDouble(OP+points*Point(),Digits()):NormalizeDouble(OP-points*Point(),Digits());
         double NewSL=TipoBuy?NormalizeDouble(OP+BE_Puntos_Adicion*Point(),Digits()):NormalizeDouble(OP-BE_Puntos_Adicion*Point(),Digits());

         if(TipoBuy?(BE_Start<=CURRENT):(BE_Start>=CURRENT))
            if(TipoBuy?(SL<NewSL):(SL>NewSL))
               trade.PositionModify(TicketOperacionUnica,NewSL,TP);
        }

     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GestionStopPorcentaje()
  {
   if(PositionSelectByTicket(TicketOperacionUnica))
     {
      double Profit=PositionGetDouble(POSITION_PROFIT);

      if(Profit<0 && MathAbs(Profit)>AccountInfoDouble(ACCOUNT_BALANCE)*Porcentaje_Cuenta_Perdida/100.0)
        {
         if(!trade.PositionClose(TicketOperacionUnica,-1))
            Print("ERROR AL TRATAR DE CERRAR POR PERDIDA MAXIMA % ",GetLastError()," ",trade.ResultRetcode());
         else
            Alert("Cierre de operacion por perdida porcentaje maximo de Cuenta");
        }

     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CondicionPerdidaDiaria()
  {
   MqlDateTime timeStart;
   TimeToStruct(TimeCurrent(),timeStart);
   timeStart.hour=0;
   timeStart.min=0;
   timeStart.sec=0;
   datetime TimeStart=StructToTime(timeStart);

   datetime from_date=TimeStart;          // desde el principio
   datetime to_date=TimeCurrent();// hasta el momento actual

   HistorySelect(from_date,to_date);
   int deals=HistoryDealsTotal();
   for(int i=0; i<deals; i++)
     {
      ulong deal_ticket=               HistoryDealGetTicket(i);
      ulong deal_entry=                 HistoryDealGetInteger(deal_ticket,DEAL_ENTRY);
      string symbol=                   HistoryDealGetString(deal_ticket,DEAL_SYMBOL);
      ulong magNumber=                 HistoryDealGetInteger(deal_ticket,DEAL_MAGIC);
      double profit=                 HistoryDealGetDouble(deal_ticket,DEAL_PROFIT);

      if(symbol==Symbol() && magNumber==MagicNumber && deal_entry==DEAL_ENTRY_OUT && profit<0)
         return false;
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool GetLote(double &lote)
  {
   int num=int(AccountInfoDouble(ACCOUNT_BALANCE)/Por_Cada);
   if(num==0)
     {
      Print("Error Cantidad insuficiente de balance para calcular el Lotaje");
      return false;
     }
   else
     {
      lote=NormalizeDouble(double(num)*Cant_Lotes,2);
      CorregirLote(lote);
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CorregirLote(double &lote)
  {
   double Paso=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);

   double Resultado=lote/Paso;

   if(Resultado-int(Resultado)>0.00)
      lote=NormalizeDouble(Paso*int(Resultado),2);

   if(lote<SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
      lote=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
   else
      if(lote>SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
         lote=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PonerTP(ulong ticket)
  {
   if(PositionSelectByTicket(ticket))
     {
      double SL=PositionGetDouble(POSITION_SL);
      double OP=PositionGetDouble(POSITION_PRICE_OPEN);
      double TP=PositionGetDouble(POSITION_TP);

      if(TP==0)
        {
         int points=int(MathAbs(SL-OP)/Point());
         double NewTP=(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)?NormalizeDouble(OP+points*Point()*Ratio_TP,Digits()):NormalizeDouble(OP-points*Point()*Ratio_TP,Digits());
         trade.PositionModify(ticket,SL,NewTP);
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetStopLoss(bool isBuy)
  {
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   double SL_Minimo_Maximo=isBuy?Ask-Minimo_SL*Point():Bid+Minimo_SL*Point();

   double SL=0;
   for(int i=1; i<=VelasSL && i<barsCopyIndicator; i++)
     {
      if(SL==0)
         SL=(isBuy?(HA_Low[i]-Adicion_Puntos_SL*Point()):(HA_High[i]+Adicion_Puntos_SL*Point()));
      else
         SL=(isBuy?MathMin(HA_Low[i]-Adicion_Puntos_SL*Point(),SL):MathMax(HA_High[i]+Adicion_Puntos_SL*Point(),SL));
     }
   if(SL==0)
      return 0;

   SL=(isBuy?MathMin(SL_Minimo_Maximo,SL):MathMax(SL_Minimo_Maximo,SL));

   return SL;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Operar(bool isBuy,string comentario,double lote,double stopLoss)
  {
   Print(lote);
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
int LoadBarsFromSymbol(string symbol, ENUM_TIMEFRAMES timeframe)
  {
   MqlTick tick;

   int bars = iBars(symbol, timeframe);

   bool tick_bool=SymbolInfoTick(symbol, tick);

   return bars;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CondicionesOperacion(bool &IsBuy)
  {
   IsBuy=false;

   if(CondicionInicialBars(IsBuy))
     {
      if(EvaluarReversaConsecutivas(IsBuy))
         return true;
     }
   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluarReversaConsecutivas(bool InicialIsBuy)
  {
   int velasReversa=1;
   int velasConsecutivas=0;

   bool velasReversaVerificacion=false;
   for(int i=3; i<barsCopyIndicator-1 && barsUntil(i); i++)
     {
      bool isUPCandle=HA_Close[i]>HA_Open[i];

      if(InicialIsBuy?(isUPCandle):(!isUPCandle))
        {
         velasReversaVerificacion=true;
         velasConsecutivas++;
        }

      if(InicialIsBuy?(!isUPCandle):(isUPCandle))
         if(!velasReversaVerificacion)
           {
            if(!(InicialIsBuy?(HA_Close[i+1]>MA[i] || HA_Open[i]>MA[i]):(HA_Close[i+1]<MA[i] && HA_Open[i]<MA[i])))
               return false;
            velasReversa++;
           }
         else
            break;

      if(velasConsecutivas>=MinimoConsecutivas)
         break;
     }
   if(velasConsecutivas>=MinimoConsecutivas && velasReversa<=MaxRetroceso)
      return true;

   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool barsUntil(int index)
  {
   datetime tiempo=rates[index].time;
   return EvaluarHorario(Hora_Inicio,Hora_Final,Minuto_Inicio,Minuto_Final,tiempo);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CondicionInicialBars(bool &IsBuy)
  {
   if(MA[1]<HA_Close[1] && MA[2]<HA_Open[2] && HA_Open[1]<HA_Close[1] && HA_Open[2]>HA_Close[2])
     {
      IsBuy=true;
      return true;
     }
   if(MA[1]>HA_Close[1] && MA[2]>HA_Open[2] && HA_Open[1]>HA_Close[1] && HA_Open[2]<HA_Close[2])
     {
      IsBuy=false;
      return true;
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CargarDatos(int barras_actuales)
  {
   if(BarsCalculated(handle_ind)!=barras_actuales || CopyBuffer(handle_ind,0,0,barsCopyIndicator,HA_Open)<=0 ||
      CopyBuffer(handle_ind,1,0,barsCopyIndicator,HA_High)<=0 || CopyBuffer(handle_ind,2,0,barsCopyIndicator,HA_Low)<=0 || CopyBuffer(handle_ind,3,0,barsCopyIndicator,HA_Close)<=0)
      return false;

   if(BarsCalculated(handle_ma)!=barras_actuales || CopyBuffer(handle_ma,0,0,barsCopyIndicator,MA)<=0)
      return false;

   if(CopyRates(Symbol(),TF_Expert,0,barras_actuales,rates)<=0)
      return false;

   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GetTicket(ulong &Ticket)
  {
   Ticket=-1;
   int totalPositions=PositionsTotal();

   for(int i = totalPositions-1; i >=0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(PositionSelectByTicket(ticket))
        {
         if(PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetString(POSITION_SYMBOL)==Symbol())
           {
            Ticket=ticket;
            return ;
           }
        }
     }
  }
//+------------------------------------------------------------------+
bool EvaluarHorario(int Inicio, int Final, int MInicio, int MFinal, datetime TimeEvalua)
  {
   if(Inicio==Final && MInicio==MFinal)
      return true;


   MqlDateTime timeEvalua;
   TimeToStruct(TimeEvalua,timeEvalua);

   int Minuto = timeEvalua.min;
   int Hora = timeEvalua.hour;

   if((Inicio < Final)?(!(Inicio <= Hora && Hora <= Final)):(!(Inicio <= Hora || Hora <= Final)))
      return false;

   if(Inicio!=Final)
     {
      if(Inicio == Hora)
         if(Minuto < MInicio)
            return false;

      if(Final == Hora)
         if(Minuto >= MFinal)
            return false;
     }
   else
     {
      if(MFinal > MInicio)
        {
         if(Hora != Inicio)
            return false;
        }
      else
         if(MFinal < MInicio)
           {
            if(Hora == Inicio)
               if(!(MInicio <= Minuto || Minuto < MFinal))
                  return false;
           }
     }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
