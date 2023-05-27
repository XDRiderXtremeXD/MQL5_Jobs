//+------------------------------------------------------------------+
//|                                                  BOT EXPERTO.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

#include<Trade\Trade.mqh>
CTrade trade;


input double VOLUME=0.01;//Lot
input double TP=30; //Take Profit(PIPS)
input double SL=30;//StopLoss(PIPS)

input double PorcentajeSignal=70;

input color ColorTexto=Aqua;

input bool Show_Alert=true; //ACTIVAR ALERTA

input bool VelasOpuestasEnVolumen=true;
input bool VelasOpuestasEnVolumen_Alert=true;

//Change it to true if you broker uses extra digit in quotes
input bool UseExtraDigit=false;

double BufferBuyWhite[3];
double BufferSellWhite[3];

enum ENUM_TIPE_MA
  {
   MediaMovilSimple=0,//Media Movil Simple
   MediaMovilExponencial=1,// Media Movil Exponencial
   MediaMovilSuavizada=2,// Media Movil Suavizada
   MediaMovilPonderada=3,// Media Movil Ponderada
   TMA=4,
  };

enum enMaTypes
  {
   ma_sma,    // Simple moving average
   ma_ema,    // Exponential moving average
   ma_smma,   // Smoothed MA
   ma_lwma    // Linear weighted MA
  };

input string SeparadorWT="----SEPARADOR WHITE TIGER----";
input ENUM_TIMEFRAMES TimeFrameWT=PERIOD_CURRENT;
input ENUM_TIPE_MA TipoMA=MediaMovilSimple;
input ENUM_APPLIED_PRICE TipoPrecio=PRICE_CLOSE;
input int PeriodosMA=5;
input bool MostrarLineasATR=true;
input string SeparadorATR="--------------";
input int PeriodosATR=110;
input double MultiplicadorATR=1;
input string SeparadorMax="--------------------";
input int MaxVelasHistorico=1000;

double StopLoss;
double TakeProfit;

enum enPrices
  {
   pr_close,      // Close
   pr_open,       // Open
   pr_high,       // High
   pr_low,        // Low
   pr_median,     // Median
   pr_typical,    // Typical
   pr_weighted,   // Weighted
   pr_average,    // Average (high+low+oprn+close)/4
   pr_haclose,    // Heiken ashi close
   pr_haopen,     // Heiken ashi open
   pr_hahigh,     // Heiken ashi high
   pr_halow,      // Heiken ashi low
   pr_hamedian,   // Heiken ashi median
   pr_hatypical,  // Heiken ashi typical
   pr_haweighted, // Heiken ashi weighted
   pr_haaverage   // Heiken ashi average
  };

//
//
//
//
//
input string SeparadorTMA="----TMA CENTERED BANDS ARR----";
input int       HalfLength    = 20;       // Centered TMA half period
input enPrices  Price         = pr_weighted; // Price to use
input int       AtrPeriod     = 100;      // Average true range period
input double    AtrMultiplier = 1;        // Average true range multiplier
// ** inserted code:
input int            TMAangle       = 4;           // Centered TMA angle caution. In pips
// **




//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   StopLoss=SL*Point()*10;
   TakeProfit=TP*Point()*10;

   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ArraySetAsSeries(BufferBuyWhite,true);
   ArraySetAsSeries(BufferSellWhite,true);

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   CopyWhiteBuffer(BufferBuyWhite,1);
   CopyWhiteBuffer(BufferSellWhite,0);

   double TAKEPROFIT;
   double STOPLOSS;
   static datetime prev_time=0;

   double bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   if(prev_time!=iTime(Symbol(),PERIOD_CURRENT,0))
     {
      if(BufferBuyWhite[1]!=EMPTY_VALUE)
        {
         TAKEPROFIT=TakeProfit!=0?bid+TakeProfit:0;
         STOPLOSS=StopLoss!=0?ask-StopLoss:0;
         trade.Buy(VOLUME,Symbol(),bid,STOPLOSS,TAKEPROFIT,"");
        }

      if(BufferSellWhite[1]!=EMPTY_VALUE)
        {
         TAKEPROFIT=TakeProfit!=0?ask-TakeProfit:0;
         STOPLOSS=StopLoss!=0?bid+StopLoss:0;
         trade.Sell(VOLUME,Symbol(),ask,STOPLOSS,TAKEPROFIT,"");
        }

      prev_time=iTime(Symbol(),PERIOD_CURRENT,0);
     }



  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopyWhiteBuffer(double &BufferIndicador[],int IndexBuffer)
  {
   int handleIndicador;
   handleIndicador=iCustom(Symbol(),PERIOD_CURRENT,"White Tigers TMA Porcentajes",
                           PorcentajeSignal,ColorTexto,Show_Alert,VelasOpuestasEnVolumen,VelasOpuestasEnVolumen_Alert,UseExtraDigit
                           ,SeparadorWT,TimeFrameWT,TipoMA,TipoPrecio,PeriodosMA,MostrarLineasATR,SeparadorATR,PeriodosATR,MultiplicadorATR
                           ,SeparadorMax,MaxVelasHistorico,SeparadorTMA,HalfLength,Price,AtrPeriod,AtrMultiplier,TMAangle
                          );
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleIndicador,IndexBuffer,0,3,BufferIndicador)<0)
     {
      Sleep(5);
     };
  }






//+------------------------------------------------------------------+
