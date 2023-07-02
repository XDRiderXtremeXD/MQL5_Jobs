//+------------------------------------------------------------------+
//|                                         MartingalaCRASH_BOOM.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"


#include<Trade\Trade.mqh>
CTrade trade;

string Activos_S[4]= {"Crash 500 Index","Crash 1000 Index","Boom 500 Index","Boom 1000 Index"};

enum activos
  {
   Crash_500_Index=0,//Crash 500 Index
   Crash_1000_Index=1,//Crash 1000 Index
   Boom_500_Index=2,//Boom 500 Index
   Boom_1000_Index=3,//Boom 1000 Index
  };

enum redondeoLote
  {
   HACIA_ARRIBA = 0,
   HACIA_ABAJO = 1,
   NORMAL = 2,
  };


input ENUM_TIMEFRAMES timeFrame=PERIOD_M1;
input string S1="================== INDICES =====================";//=======================================================
input activos Activo_1=Crash_500_Index;
input activos Activo_2=Crash_1000_Index;
input activos Activo_3=Boom_500_Index;
input activos Activo_4=Boom_1000_Index;
input string S2="================== TRADES =====================";//=======================================================
input double Lotaje_inicial=0.01;
input double Multiplicador=2;
input int TP=200;//TP en Puntos
input string S3="================== MAXIMOS TRADES =====================";//=======================================================
input int Maximo_Trade_Activo_1=4;//Maximo Trades ACTIVO 1
input int Maximo_Trade_Activo_2=4;//Maximo Trades ACTIVO 2
input int Maximo_Trade_Activo_3=4;//Maximo Trades ACTIVO 3
input int Maximo_Trade_Activo_4=4;//Maximo Trades ACTIVO 4
input string S4="================== GESTION =====================";//=======================================================
input double Meta_diaria=500;//Meta Diaria (en Divisa)
input double Riesgo_diario=500;//Riesgo Diario (en Divisa)
input string S5="================== IDENTIFICADOR EXPERTO =====================";//=======================================================
input int MagicNumber=22222;
input string CommentExpert="Expert Martingala";

activos Act[4]= {Activo_1,Activo_2,Activo_3,Activo_4};
int Maximos[4]= {Maximo_Trade_Activo_1,Maximo_Trade_Activo_2,Maximo_Trade_Activo_3,Maximo_Trade_Activo_4};
int Barras[4]= {0,0,0,0};
int Operaciones[4]= {0,0,0,0};

double close[];
double open[];
int dia=-1;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(!EstablecerActivos())
      return INIT_FAILED;

   if(!Activos_Diferentes())
      return INIT_FAILED;

   if(SymbolInfoDouble(Activos_S[Act[0]],SYMBOL_VOLUME_MIN)>Lotaje_inicial)
     {
      Alert("LOTE INICIAL ES MENOR AL LOTE INICIAL PERMITIDO POR ",Activos_S[Act[0]]);
      return INIT_FAILED;
     }

   if(!HayOperacionesAbiertas())
      return INIT_FAILED;

   EstablecerBarras();

   trade.SetExpertMagicNumber(MagicNumber);

   ArraySetAsSeries(close,true);
   ArraySetAsSeries(open,true);

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
   MqlDateTime datetime_current;
   TimeCurrent(datetime_current);
   int dia_actual=datetime_current.day_of_year;

   datetime_current.hour=0;
   datetime_current.min=0;
   datetime_current.sec=0;

   datetime tiempoStartDia;
   tiempoStartDia=StructToTime(datetime_current);
   double ProfitHistorico=HistoryProfit(tiempoStartDia);

   for(int i=0; i<4; i++)
      LoadBarsFromSymbol(Activos_S[Act[i]],timeFrame);

   long ultimaTicket=0;
   int indiceUltimo=0;
   long tickets[];

   double ProfitTotal=CalculateTotalProfit(ultimaTicket,indiceUltimo,tickets);
   ProfitTotal=ProfitHistorico+ProfitTotal;

   if(dia!=dia_actual)
      EvalucionCadaBarra(ultimaTicket,indiceUltimo);

   CierrePorTP(ultimaTicket,tickets);

   if(dia!=dia_actual)
     {
      Comment("PROFIT TOTAL DIARIO= ",DoubleToString(ProfitTotal,2));
      if(ProfitTotal>=Meta_diaria || ProfitTotal<=(Riesgo_diario*-1))
        {
         Comment("EA PAUSADO POR META O RIESGO DIARIO, PROFIT TOTAL DIARIO= ",DoubleToString(ProfitTotal,2));
         dia=dia_actual;
         CierreOperaciones(tickets);
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EstablecerActivos()
  {
   bool personalizado=false;
   for(int i=0; i<4; i++)
     {
      if(!SymbolExist(Activos_S[i],personalizado))
        {
         Alert("Simbolo "+Activos_S[i]+" no existe para este broker");
         return false;
        }
      else
        {
         if(!SymbolSelect(Activos_S[i],true))
           {
            Alert("Simbolo "+Activos_S[i]+" no fue seleccionado");
            return false;
           }
        }
     }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Activos_Diferentes()
  {
   for(int i=0; i<4; i++)
      for(int j=i+1; j<4; j++)
        {
         if(Act[i]==Act[j])
           {
            Alert("ACTIVO "+IntegerToString(i)+" debe ser diferente a ACTIVO "+IntegerToString(j));
            return false;
           }
        }
   return true;
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
void EstablecerBarras()
  {
   for(int i=0; i<4; i++)
     {
      LoadBarsFromSymbol(Activos_S[Act[i]],timeFrame);
      Barras[i]=iBars(Activos_S[Act[i]],timeFrame);
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CalculateTotalProfit(long &ultimaTicket,int &indiceUltimo,long &tickets[])
  {
   double totalProfit = 0.0;
   int totalPositions = PositionsTotal();

   Operaciones[0]=0;
   Operaciones[1]=0;
   Operaciones[2]=0;
   Operaciones[3]=0;

   ultimaTicket=0;
   indiceUltimo=0;
   datetime ultimoTiempo=0;
   ArrayResize(tickets,0);

// Iterar sobre cada posición abierta
   for(int i = 0; i < totalPositions; i++)
     {
      if(PositionSelectByTicket(PositionGetTicket(i)))
        {
         if(PositionGetInteger(POSITION_MAGIC)==MagicNumber)
           {
            for(int j=0; j<4; j++)
              {
               if(Activos_S[Act[j]]==PositionGetSymbol(i))
                 {
                  int size=ArraySize(tickets);
                  ArrayResize(tickets,size+1);
                  tickets[size]=(long)PositionGetInteger(POSITION_TICKET);

                  Operaciones[j]++;
                  if(ultimoTiempo<PositionGetInteger(POSITION_TIME) || ultimoTiempo==0)
                    {
                     ultimaTicket=PositionGetInteger(POSITION_TICKET);
                     ultimoTiempo=(datetime)PositionGetInteger(POSITION_TIME);
                     indiceUltimo=j;
                    }
                 }
              }
            totalProfit+=(PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP));
           }
        }
     }
     
   Comment(Operaciones[0],"  ",Operaciones[1],"  ",Operaciones[2],"  ",Operaciones[3]);
   return totalProfit;
  }




//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluarProxOperacion(long ultimaTicket,int indiceUltimo,int &indiceProxOperacion)
  {
   if(ultimaTicket==0 || (ultimaTicket!=0 && PositionSelectByTicket(ultimaTicket)))
     {
      if(ultimaTicket==0 || (ultimaTicket!=0 && PositionGetDouble(POSITION_PROFIT)<0))
        {
         if(Operaciones[indiceUltimo]<Maximos[indiceUltimo])
           {
            indiceProxOperacion=indiceUltimo;
            return true;
           }
         else
            if(indiceUltimo+1<4)
              {
               if(Operaciones[indiceUltimo+1]<Maximos[indiceUltimo+1])
                 {
                  indiceProxOperacion=indiceUltimo+1;
                  return true;
                 }
              }
        }
     }
   return false;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Operar(int indiceOperacion,long ultimaTicket)
  {
   string ActivoProxOperacion=Activos_S[Act[indiceOperacion]];
   bool IsBoom=(StringFind(ActivoProxOperacion,"Boom",0)!=-1);

   double Lotaje=GetLote(ultimaTicket);

   if(Lotaje!=-1)
     {
      if(IsBoom)
        {
         if(!trade.Sell(Lotaje_inicial,ActivoProxOperacion,SymbolInfoDouble(ActivoProxOperacion,SYMBOL_BID),0,0,CommentExpert))
            Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
        }
      else
         if(!trade.Buy(Lotaje_inicial,ActivoProxOperacion,SymbolInfoDouble(ActivoProxOperacion,SYMBOL_ASK),0,0,CommentExpert))
            Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
  }
//+------------------------------------------------------------------+
void EvalucionCadaBarra(long ultimaTicket,int indiceUltimo)
  {

   string ActivoActual=Activos_S[Act[indiceUltimo]];
   bool IsBoom=(StringFind(ActivoActual,"Boom",0)!=-1);

   int barras=iBars(ActivoActual,timeFrame);
   if(Barras[indiceUltimo]!=barras)
     {
      if(CopyClose(ActivoActual,timeFrame,0,3,close)>0 &&
         CopyOpen(ActivoActual,timeFrame,0,3,open)>0)
        {
         int indiceProxOperacion=0;
         if((IsBoom && close[1]>open[1]) || (!IsBoom && close[1]<open[1]) || ultimaTicket==0)
            if(EvaluarProxOperacion(ultimaTicket,indiceUltimo,indiceProxOperacion))
               Operar(indiceProxOperacion,ultimaTicket);

         Barras[indiceUltimo]=barras;
        }
     }
  }
//+------------------------------------------------------------------+
void CierrePorTP(long ultimoTicket,long &tickets[])
  {
   if(ultimoTicket!=0 && PositionSelectByTicket(ultimoTicket))
     {

      string Simbolo=PositionGetString(POSITION_SYMBOL);
      Print((MathAbs(PositionGetDouble(POSITION_PRICE_CURRENT)-PositionGetDouble(POSITION_PRICE_OPEN))/SymbolInfoDouble(Simbolo,SYMBOL_POINT)));

      if(PositionGetDouble(POSITION_PROFIT)>0 &&
         (MathAbs(PositionGetDouble(POSITION_PRICE_CURRENT)-PositionGetDouble(POSITION_PRICE_OPEN))/SymbolInfoDouble(Simbolo,SYMBOL_POINT))>TP)
         CierreOperaciones(tickets);
     }

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CierreOperaciones(long &tickets[])
  {
   int size=ArraySize(tickets);

   for(int i = size-1; i >=0 ; i--)
     {
      if(PositionSelectByTicket(tickets[i]))
         trade.PositionClose(tickets[i],-1);
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetLote(long ultimoTicket)
  {
   if(ultimoTicket==0)
      return Lotaje_inicial;

   if(PositionSelectByTicket(ultimoTicket))
     {
      double Lote=PositionGetDouble(POSITION_VOLUME);
      Lote=RoundDouble(Lote*Multiplicador,2,HACIA_ARRIBA);

      double Paso=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_VOLUME_STEP);
      double division=Lote/Paso;
      int divisionEntera=int(division);
      if((divisionEntera-division)>0)
        {
         Print("Redondeando al mas cercano");
         Lote=RoundDouble(divisionEntera*Paso,2,HACIA_ARRIBA);
        }

      if(Lote>SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_VOLUME_MAX))
        {
         Print("ERROR LOTE CALCULADO SUPERA EL LOTE MAXIMO");
         return -1;
        }
      if(Lote<SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_VOLUME_MIN))
        {
         Print("ERROR LOTE CALCULADO ES INFERIOR AL LOTE MINIMO");
         return -1;
        }
     }

   return Lotaje_inicial;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double RoundDouble(double value, int decimalDigits, redondeoLote roundingMethod)
  {
   double multiplier = MathPow(10, decimalDigits);
   double roundedValue = value * multiplier;

   if(roundingMethod == HACIA_ARRIBA)  // Redondeo hacia arriba
      roundedValue = MathCeil(roundedValue);
   else
      if(roundingMethod == HACIA_ABAJO)  // Redondeo hacia abajo
         roundedValue = MathFloor(roundedValue);
      else // Redondeo normal
         roundedValue = MathRound(roundedValue);

   return roundedValue / multiplier;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HayOperacionesAbiertas()
  {
   int totalPositions = PositionsTotal();
   bool hay=false;
   for(int i = 0; i < totalPositions; i++)
     {
      if(PositionSelectByTicket(PositionGetTicket(i)))
        {
         if(PositionGetInteger(POSITION_MAGIC)==MagicNumber)
           {
            hay=true;
            break;
           }
        }
     }

   if(hay)
     {
      if(MessageBox("Hay Operaciones, Deseas que el bot tome las Operaciones?","Hay operaciones Abiertas", MB_YESNO|MB_ICONSTOP)==IDNO)
        {
         if(MessageBox("Hay Operaciones, Deseas cerrar estas operaciones para que el bot gestione nuevamente?","Hay operaciones Abiertas", MB_YESNO|MB_ICONSTOP)==IDNO)
           {
            Alert("Debes de cerrar esta operaciones ante de que el bot trabaje nuevamente");
            return false;
           }
         else
            CierreOperaciones2();
        }

     }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CierreOperaciones2()
  {
   int totalPositions = PositionsTotal();
   for(int i = totalPositions-1; i>=0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(PositionSelectByTicket(ticket))
         if(PositionGetInteger(POSITION_MAGIC)==MagicNumber)
            trade.PositionClose(ticket,-1);
     }
  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double HistoryProfit(datetime timeStart)
  {
   HistorySelect(timeStart,TimeCurrent());
   double ProfitTotal=0;
   ulong ticket=0;
//--- create objects
   int     total=HistoryDealsTotal();
   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);

         double Profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);

         if(Magic==MagicNumber)
            if(entry==DEAL_ENTRY_OUT)
              {
               Profit=Profit+Comision+Swap;
               ProfitTotal=Profit+ProfitTotal;
              }
        }
     }
   return ProfitTotal;
  }
//+------------------------------------------------------------------+
