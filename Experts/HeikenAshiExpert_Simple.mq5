//+------------------------------------------------------------------+
//|                                      HeikenAshiExpert_Simple.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#resource "\\Indicators\\heiken_ashi.ex5"

#include<Trade\Trade.mqh>
CTrade trade;

input ENUM_TIMEFRAMES TF_Expert=PERIOD_CURRENT;
input int MagicNumber=242222222;
input string S2="=================  CONF LOTE  =================";//=====================================================================================
input double Lote_=0.01;//Lote
input string S6="=================  MA  =================";//======================================================================================================
input int Ma_Periodo=9;
input int Ma_Shift=0;
input ENUM_MA_METHOD Ma_Method=MODE_LWMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;

double HA_Open[];
double HA_High[];
double HA_Low[];
double HA_Close[];
MqlRates rates[];
double MA[];

int handle_ind;
int handle_ma;
int barsCopyIndicator=5;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   handle_ind=iCustom(Symbol(),TF_Expert,"::Indicators\\heiken_ashi.ex5");
   handle_ma=iMA(Symbol(),TF_Expert,Ma_Periodo,Ma_Shift,Ma_Method,Ma_AppliedPrice);

   ArraySetAsSeries(HA_Close,true);
   ArraySetAsSeries(HA_High,true);
   ArraySetAsSeries(HA_Low,true);
   ArraySetAsSeries(HA_Open,true);

   ArraySetAsSeries(MA,true);
   ArraySetAsSeries(rates,true);

   trade.SetExpertMagicNumber(MagicNumber);
   OcultarVelasNormales();
   AddIndicator();

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


//if(EvaluarHorario(Hora_Inicio,Hora_Final,Minuto_Inicio,Minuto_Final,TimeCurrent()))
   if(barsLast!=barsActuales)
     {
      if(CargarDatos(barsActuales))
        {
         CierrePorVelaContaria();
         bool IsBuy;
         if(CondicionInicialBars(IsBuy))
            Operar(IsBuy,"Experto",Lote_,0);

         barsLast=barsActuales;
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OcultarVelasNormales()
  {
   ChartSetInteger(0,CHART_COLOR_CHART_DOWN,clrNONE);
   ChartSetInteger(0,CHART_COLOR_CHART_UP,clrNONE);
   ChartSetInteger(0,CHART_COLOR_CANDLE_BEAR,clrNONE);
   ChartSetInteger(0,CHART_COLOR_CANDLE_BULL,clrNONE);
   ChartSetInteger(0,CHART_COLOR_CHART_LINE,clrNONE);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void AddIndicator()
  {
   if(!MQLInfoInteger(MQL_TESTER))
     {
      bool hayIndicador=false;
      int total=ChartIndicatorsTotal(0,0);
      for(int i=0; i<total; i++)
        {
         string name=ChartIndicatorName(0,0,i);
         if(name=="Heiken Ashi" || name=="heiken_ashi")
           {
            hayIndicador=true;
            break;
           }
        }
      if(!hayIndicador)
         ChartIndicatorAdd(0,0,handle_ind);
     }

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CierrePorVelaContaria()
  {
   int totalPositions=PositionsTotal();
   for(int i = totalPositions-1; i >=0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(PositionSelectByTicket(ticket))
        {
         long tipo=PositionGetInteger(POSITION_TYPE);
         if(PositionGetString(POSITION_SYMBOL)==Symbol() && PositionGetInteger(POSITION_MAGIC)==MagicNumber)
            if((HA_Close[1]>HA_Open[1])?tipo==POSITION_TYPE_SELL:tipo==POSITION_TYPE_BUY)
               if(!trade.PositionClose(ticket))
                  Print("Error no cerro posicion ",GetLastError()," ",trade.ResultRetcode());
        }
     }
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
bool CondicionInicialBars(bool &IsBuy)
  {
   if((MA[1]<HA_Close[1] && HA_Open[1]<HA_Close[1] && HA_Open[2]>HA_Close[2]) || (HA_Close[1]>MA[1] && HA_Close[2]<MA[2]))
     {
      IsBuy=true;
      return true;
     }
   if((MA[1]>HA_Close[1] && HA_Open[1]>HA_Close[1] && HA_Open[2]<HA_Close[2]) || (HA_Close[1]<MA[1] && HA_Close[2]>MA[2]))
     {
      IsBuy=false;
      return true;
     }
   return false;
  }
//+------------------------------------------------------------------+
