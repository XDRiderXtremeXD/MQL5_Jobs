//+------------------------------------------------------------------+
//|                                                ALTOS Y BAJOS.mq5 |
//|                                                                  |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

input int PeriodoMA=15;
input ENUM_MA_METHOD Metodo_MA=MODE_LWMA;
input ENUM_APPLIED_PRICE APP_MA=PRICE_CLOSE;

input int xVelas=10;//Cantidad de Velas para calculo MIN/MAX

enum tipoDireccion
  {
   neutral=0,
   ascendente=1,
   descendente=2,
  };
tipoDireccion Direccion = neutral; //0 neutral,1 ascendente,2 descendente;
tipoDireccion EMA = neutral;//0 neutral,1 ascendente,2 descendente;

double Ema_signal_fast[];
int EMA_h;

double Ema_alto[3];
double Ema_bajo[3];

datetime LastCom;
datetime VelaCambio = 0;

int EMA_h_fast;
int UltimoCambio;

bool Semilla=false;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   Direccion = neutral;
   EMA = neutral;
   Semilla=false;

   EMA_h_fast = iMA(_Symbol,_Period,PeriodoMA,0,Metodo_MA,APP_MA);
   ArraySetAsSeries(Ema_signal_fast,true);

   if(!MQLInfoInteger(MQL_TESTER)){
   while((BarsCalculated(EMA_h_fast)!=Bars(Symbol(),PERIOD_CURRENT) || CopyBuffer(EMA_h_fast, 0, 0, 1005, Ema_signal_fast)<0) && !IsStopped());

   for(int i=ArraySize(Ema_signal_fast)-5; i>=0; i--)
      Funcionpendiente(i);}

   Comment("Ema_ALTO:  "+ DoubleToString(Ema_alto[0])+ " "+ DoubleToString(Ema_alto[1])+ " "+ DoubleToString(Ema_alto[2])+"\n"+
           "Ema_BAJO:  "+ DoubleToString(Ema_bajo[0])+ " "+ DoubleToString(Ema_bajo[1])+ " "+ DoubleToString(Ema_bajo[2])+"\n");

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

   if(BarsCalculated(EMA_h_fast)==Bars(Symbol(),PERIOD_CURRENT) && CopyBuffer(EMA_h_fast, 0, 0, 6, Ema_signal_fast)>0)
      Funcionpendiente(0);

   Comment("Ema_ALTO:  "+ DoubleToString(Ema_alto[0])+ " "+ DoubleToString(Ema_alto[1])+ " "+ DoubleToString(Ema_alto[2])+"\n"+
           "Ema_BAJO:  "+ DoubleToString(Ema_bajo[0])+ " "+ DoubleToString(Ema_bajo[1])+ " "+ DoubleToString(Ema_bajo[2])+"\n");
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Funcionpendiente(int Index)
  {
   if(LastCom != iTime(_Symbol, PERIOD_CURRENT, Index))
     {
      LastCom = iTime(_Symbol, PERIOD_CURRENT, Index);
      UltimoCambio = iBarShift(_Symbol, PERIOD_CURRENT, UltimaFechaCambio(Index));

      if((EMA == descendente || EMA == neutral)  && Direccion == ascendente)
        {
         for(int i = 2; i > 0; i--)
            Ema_bajo[i] = Ema_bajo[i - 1];

         if(Semilla)
            Ema_bajo[0] = ObtenerMinimoUltimasXVelas(xVelas,Index);

         EMA = ascendente;
         Semilla=true;
        }

      if((EMA == ascendente || EMA== neutral) && Direccion == descendente)
        {
         for(int i = 2; i > 0; i--)
            Ema_alto[i] = Ema_alto[i - 1];

         if(Semilla)
            Ema_alto[0]=ObtenerMaximoUltimasXVelas(xVelas,Index);

         EMA = descendente;
         Semilla=true;
        }

     }
  }

//---------------------------------------------------------------

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime UltimaFechaCambio(int Index)
  {
   datetime Time1 = iTime(_Symbol, PERIOD_CURRENT, 1+Index);

   if(VelaCambio <= 0)
      VelaCambio = iTime(_Symbol, PERIOD_CURRENT, 1+Index);

   if(Direccion == neutral || Direccion == ascendente)
     {
      if(Ema_signal_fast[1+Index] < Ema_signal_fast[2+Index])
        {
         Direccion = descendente;
         VelaCambio = Time1;
         return VelaCambio;
        }
     }
   if(Direccion == neutral || Direccion == descendente)
     {
      if(Ema_signal_fast[1+Index] > Ema_signal_fast[2+Index])
        {
         Direccion = ascendente;
         VelaCambio = Time1;
         return VelaCambio;
        }
     }
   return VelaCambio;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double ObtenerMaximoUltimasXVelas(int velas,int Index)
  {
   double maximo = iHigh(Symbol(),PERIOD_CURRENT,iHighest(Symbol(),PERIOD_CURRENT,MODE_HIGH,velas,Index+1));
   return maximo;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double ObtenerMinimoUltimasXVelas(int velas,int Index)
  {
   double minimo = iLow(Symbol(),PERIOD_CURRENT,iLowest(Symbol(),PERIOD_CURRENT,MODE_LOW,velas,Index+1));
   return minimo;
  }
//+------------------------------------------------------------------+
