//+------------------------------------------------------------------+
//|                           Aviso Patrones posiciones abiertas.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"


input ENUM_TIMEFRAMES PeriodTimeFrames=PERIOD_M5;
int Tiempo, TiempoDivisible;
double iRSIBuffer[3];
int    handleRSI;
double RSIValor;

double iEstocasticoBuffer[3];
int    handleEstocastico;
double EstocasticoValor;

input uint PeriodoRSI=14;
input uint Kestocastico=5;
input uint Destocastico=3;
input uint SlowingEstocastico=3;

input uint NivelMayorEstocastico=80;
input uint NivelMenorEstocastico=20;
input uint NivelMayorRSI=70;
input uint NivelMenorRSI=30;


//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   int PeriodTimeFramesSeconds=PeriodSeconds(PeriodTimeFrames);
   do
     {
      MqlDateTime TiempoActual;
      TimeCurrent(TiempoActual);
      Comment(TimeCurrent());

      if(PeriodTimeFramesSeconds<PeriodSeconds(PERIOD_H1))
        {
         Tiempo=TiempoActual.min;
         TiempoDivisible=PeriodTimeFramesSeconds/60;
        }
      else
         if(PeriodTimeFramesSeconds<PeriodSeconds(PERIOD_D1))
           {
            Tiempo=TiempoActual.hour;
            TiempoDivisible=PeriodTimeFramesSeconds/3600;
           }
         else
            if(PeriodTimeFramesSeconds<PeriodSeconds(PERIOD_W1))
              {
               Tiempo=TiempoActual.day;
               TiempoDivisible=PeriodTimeFramesSeconds/86400;
              }
     }
   while(Tiempo%TiempoDivisible!=0);
   Print("SALIO");

   Sleep(2000);

   EventSetTimer(PeriodTimeFramesSeconds);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   EventKillTimer();

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
   int total=PositionsTotal(); // número de posiciones abiertas
   for(int i=0; i<total; i++)
     {
      string position_symbol=PositionGetString(POSITION_SYMBOL); // símbolo
      int    digits=(int)SymbolInfoInteger(position_symbol,SYMBOL_DIGITS); // número de dígitos tras la coma
      double bid=SymbolInfoDouble(position_symbol,SYMBOL_BID);
      double ask=SymbolInfoDouble(position_symbol,SYMBOL_ASK);
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

      CopiarRSI(position_symbol,digits);
      CopiarEstocastico(position_symbol,digits);
      
      
      
      double HighAnterior=iHigh(position_symbol,PeriodTimeFrames,1);
      double LowAnterior=iLow(position_symbol,PeriodTimeFrames,1);
      string comentario;

      /////////////////////////////////RSI/////////////////////////
      if(type==POSITION_TYPE_BUY)
        {
         if(iRSIBuffer[1]<NivelMayorRSI && iRSIBuffer[2]>=NivelMayorRSI)
           {
            comentario="RSI Detectado en "+position_symbol+" en Periods "+EnumToString(PeriodTimeFrames);
            bool Notificacion=SendNotification(comentario);
            Sleep(1000);
           }
        }
      else //(Type==POSITION_TYPE_SELL)
        {
         if(iRSIBuffer[1]>NivelMenorRSI && iRSIBuffer[2]<=NivelMenorRSI)
           {
            comentario="RSI Detectado en "+position_symbol+" en Periods "+EnumToString(PeriodTimeFrames);
            bool Notificacion=SendNotification(comentario);
            Sleep(1000);
           }
        }

      //////////////////////ESTOCASTICO/////////////////////
      if(type==POSITION_TYPE_BUY)
        {
         if(iEstocasticoBuffer[1]<NivelMayorEstocastico && iEstocasticoBuffer[2]>=NivelMayorEstocastico && (iRSIBuffer[2]>NivelMayorRSI || iRSIBuffer[1]>NivelMayorRSI))
           {
            comentario="Estocastico Detectado en "+position_symbol+" en Periods "+EnumToString(PeriodTimeFrames)+" RSI>80";
            bool Notificacion=SendNotification(comentario);
            Sleep(1000);
           }
        }
      else //(Type==POSITION_TYPE_SELL)
        {
         if(iEstocasticoBuffer[1]>NivelMenorEstocastico && iEstocasticoBuffer[2]<=NivelMenorEstocastico && (iRSIBuffer[2]<NivelMenorRSI || iRSIBuffer[1]<NivelMenorRSI))
           {
            comentario="Estocastico Detectado en "+position_symbol+" en Periods "+EnumToString(PeriodTimeFrames)+" RSI<30";
            bool Notificacion=SendNotification(comentario);
            Sleep(1000);
           }
        }
     }
    //////////////////////////VO////////////////////////////


//--- hora de la primera llamada de OnTimer()
   static datetime start_time=TimeCurrent();
//--- hora del servidor comercial en la primera llamada de OnTimer();
   static datetime start_tradeserver_time=0;
//--- hora calculada del servidor comercial
   static datetime calculated_server_time=0;
//--- hora local en la computadora
   datetime local_time=TimeLocal();
//--- hora calculada actual del servidor comercial
   datetime trade_server_time=TimeTradeServer();
//--- si por algún motivo se desconoce la hora del servidor, salimos antes de tiempo
   if(trade_server_time==0)
      return;
//--- si el valor inicial del servidor comercial no se ha establecido aún
   if(start_tradeserver_time==0)
     {
      start_tradeserver_time=trade_server_time;
      //--- establecemos el valor a calcular del servidor comercial
      Print(trade_server_time);
      calculated_server_time=trade_server_time;
     }
   else
     {
      //--- aumentamos la hora de la primera llamada de OnTimer()
      if(start_tradeserver_time!=0)
         calculated_server_time=calculated_server_time+1;;
     }
//---
   string com=StringFormat("                  Start time: %s\r\n",TimeToString(start_time,TIME_MINUTES|TIME_SECONDS));
   com=com+StringFormat("                  Local time: %s\r\n",TimeToString(local_time,TIME_MINUTES|TIME_SECONDS));
   com=com+StringFormat("TimeTradeServer time: %s\r\n",TimeToString(trade_server_time,TIME_MINUTES|TIME_SECONDS));
   com=com+StringFormat(" EstimatedServer time: %s\r\n",TimeToString(calculated_server_time,TIME_MINUTES|TIME_SECONDS));
//--- mostramos los valores de todos los contadores en el gráfico
   Comment(com);

  }
//+------------------------------------------------------------------+
//| TesterInit function                                              |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopiarRSI(string name,int digitos)
  {
   handleRSI=iRSI(name,PeriodTimeFrames,PeriodoRSI,PRICE_CLOSE);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleRSI,0,0,3,iRSIBuffer)<0)
     {
      Sleep(5);
     };
   ArrayReverse(iRSIBuffer,0,3);
   iRSIBuffer[0]=NormalizeDouble(iRSIBuffer[0],digitos);
   iRSIBuffer[1]=NormalizeDouble(iRSIBuffer[1],digitos);
   iRSIBuffer[2]=NormalizeDouble(iRSIBuffer[2],digitos);
  }


void CopiarEstocastico(string name,int digitos)
  {
   handleEstocastico=iStochastic(name,PeriodTimeFrames,Kestocastico,Destocastico,SlowingEstocastico,MODE_SMA,STO_LOWHIGH);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleEstocastico,0,0,3,iEstocasticoBuffer)<0)
     {
      Sleep(5);
     };
   ArrayReverse(iEstocasticoBuffer,0,3);
  }


