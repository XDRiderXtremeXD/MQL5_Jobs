//+------------------------------------------------------------------+
//|                                                   2Aperturas.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;
enum tipoTiempo
  {
   LOCAL=0,
   BROKER=1,
  };


input ENUM_TIMEFRAMES PeriodoOperaciones=PERIOD_H1;
input tipoTiempo Tipo_Tiempo=BROKER;
input int NumeroMagico=222222;//Numero Magico
input string Comentario="Expert 2 Aperturas";
input string S1="==== CONF ACTIVO 1 ====";//=============================
input bool Activar1=1;//Activar
input string Activo1="UK100";
input double Lotaje1=0.1;//Lotaje
input int tp_puntos1=200; //TP en puntos
input int sl_puntos1=400; //SL en puntos
input string timeStart1="00:00";//Tiempo Inicio
input string timeEnd1="01:00";//Tiempo Final
input int Espera_Horas1=5;
input bool reentrada1=true;//Habilitar Reentrada
input int reentrada_puntos1=200;//Reentrada puntos
input string S2="==== CONF ACTIVO 2 ====";//=============================
input bool Activar2=1;//Activar
input string Activo2="NASDAQ";
input double Lotaje2=0.1;//Lotaje
input int tp_puntos2=200; //TP en puntos
input int sl_puntos2=400; //SL en puntos
input string timeStart2="04:00";//Tiempo Inicio
input string timeEnd2="05:00";//Tiempo Final
input int Espera_Horas2=5;
input bool reentrada2=true;//Habilitar Reentrada
input int reentrada_puntos2=200;//Reentrada puntos
input string S3="==== CONF RSI ====";//=============================
input int RSI_Periodo=14;
input ENUM_APPLIED_PRICE RSI_Applied_Price=PRICE_CLOSE;
input double level_buy=20;
input double level_sell=80;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
struct activoGestion
  {
   string            activo;
   double            lotaje;
   int               tpPoints;
   int               slPoints;
   int               horaInicio;
   int               horaFinal;
   int               minutoInicio;
   int               minutoFinal;
   int               ticketInicial;
   int               handle;
   int               barras;
   bool              reentrada;
   int               stop2op;
   datetime          tiempo;
   int               horasEspera;
  };

activoGestion gestion[];
double RSI[];
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(!SetearGestion())
      return INIT_PARAMETERS_INCORRECT;

   LogicaBorradoSecundarias();

   trade.SetExpertMagicNumber(NumeroMagico);

   ArraySetAsSeries(RSI,true);
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
void OnTick()
  {
   bool Testing=(MQLInfoInteger(MQL_TESTER));
   if(Testing)
      OnTimer();

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTrade()
  {

   LogicaBorradoSecundarias();
   LogicaAbrioSecundaria();

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   MqlDateTime timeEvalua;
   TimeToStruct(TimeCurrent(),timeEvalua);
   
   int size=ArraySize(gestion);
   for(int i=0; i<size; i++)
     {
      // datetime from,to;
      //if(SymbolInfoSessionTrade(activoGestion,ENUM_DAY_OF_WEEK (timeEvalua.day_of_week),)
      if(EvaluarHorario(gestion[i].horaInicio,gestion[i].horaFinal,gestion[i].minutoInicio,gestion[i].minutoFinal,(Tipo_Tiempo==BROKER?TimeCurrent():TimeLocal())))
        {
         int barsActuales=LoadBarsFromSymbol(gestion[i].activo,PeriodoOperaciones);
         if(gestion[i].barras!=barsActuales)
            if(BarsCalculated(gestion[i].handle)==barsActuales && CopyBuffer(gestion[i].handle,0,0,3,RSI))
              {
               if(gestion[i].barras!=0)
                  LogicaOperacion(i);
               gestion[i].barras=barsActuales;
              }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void LogicaOperacion(int indexGestion)
  {
   if(VerificarOperacionAbierta())
      return;

   if(TimeCurrent()<gestion[indexGestion].tiempo)
      return;

   if(RSI[1]>=level_sell)
      PonerOperacion(indexGestion,false);

   if(RSI[1]<=level_buy)
      PonerOperacion(indexGestion,true);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PonerOperacion(int indexGestion,bool isBuy)
  {
   if(isBuy)
     {
      double ask=SymbolInfoDouble(gestion[indexGestion].activo,SYMBOL_ASK);
      double points=SymbolInfoDouble(gestion[indexGestion].activo,SYMBOL_POINT);
      double sl=ask-points*gestion[indexGestion].slPoints;
      double tp=ask+points*gestion[indexGestion].tpPoints;

      if(!trade.Buy(gestion[indexGestion].lotaje,gestion[indexGestion].activo,ask,sl,tp,"principal"))
         Print("No abrio buy error : ",GetLastError()," result error ",trade.ResultRetcode());
      else
        {
         AumentarTiempo(gestion[indexGestion].activo);
         if(gestion[indexGestion].reentrada && PositionGetTicket(PositionsTotal()-1)!=0)
           {
            int digitos=(int)SymbolInfoInteger(gestion[indexGestion].activo,SYMBOL_DIGITS);
            double OP=NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)-gestion[indexGestion].stop2op*points,digitos);
            if(!trade.BuyLimit(PositionGetDouble(POSITION_VOLUME),OP,gestion[indexGestion].activo,PositionGetDouble(POSITION_SL),PositionGetDouble(POSITION_PRICE_OPEN),ORDER_TIME_GTC,0,"secundaria"))
               Print("No puso buy limit error : ",GetLastError()," result error ",trade.ResultRetcode());
           }
        }
     }

   if(!isBuy)
     {
      double bid=SymbolInfoDouble(gestion[indexGestion].activo,SYMBOL_BID);
      double points=SymbolInfoDouble(gestion[indexGestion].activo,SYMBOL_POINT);
      double sl=bid+points*gestion[indexGestion].slPoints;
      double tp=bid-points*gestion[indexGestion].tpPoints;

      if(!trade.Sell(gestion[indexGestion].lotaje,gestion[indexGestion].activo,bid,sl,tp,"principal"))
         Print("No abrio sell error : ",GetLastError()," result error ",trade.ResultRetcode());
      else
        {
         AumentarTiempo(gestion[indexGestion].activo);
         if(gestion[indexGestion].reentrada && PositionGetTicket(PositionsTotal()-1)!=0)
           {
            int digitos=(int)SymbolInfoInteger(gestion[indexGestion].activo,SYMBOL_DIGITS);
            double OP=NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)+gestion[indexGestion].stop2op*points,digitos);
            if(!trade.SellLimit(PositionGetDouble(POSITION_VOLUME),OP,gestion[indexGestion].activo,PositionGetDouble(POSITION_SL),PositionGetDouble(POSITION_PRICE_OPEN),ORDER_TIME_GTC,0,"secundaria"))
               Print("No puso sell limit error : ",GetLastError()," result error ",trade.ResultRetcode());
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void LogicaBorradoSecundarias()
  {
   int total=OrdersTotal();

   if(!VerificarPrincipal())
      for(int k=total-1; k>=0; k--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
        {
         ulong ticket=OrderGetTicket(k);
         if(ticket==0) // SE SELECCIONA CADA ORDEN PARA PODER EVALUAR (si no se selecciona no se evalua)
            continue;
         if(OrderGetInteger(ORDER_MAGIC)==NumeroMagico)
            if(!trade.OrderDelete(ticket))
               Print("No elimino pendiente error ",GetLastError()," resultCode ",trade.ResultRetcode());
        }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void LogicaAbrioSecundaria()
  {
   HistorySelect(0,TimeCurrent());
//--- número total en la lista de transacciones
   int deals=HistoryDealsTotal();
   static int DealsLast=deals;
//--- ahora vamos a procesar cada transacción
   for(int i=DealsLast; i<deals; i++)
     {
      ulong deal_ticket=              HistoryDealGetTicket(i);
      ulong magic=                    HistoryDealGetInteger(deal_ticket,DEAL_MAGIC);
      ulong entry=                    HistoryDealGetInteger(deal_ticket,DEAL_ENTRY);
      string comentario_=              HistoryDealGetString(deal_ticket,DEAL_COMMENT);
      string symbol=                   HistoryDealGetString(deal_ticket,DEAL_SYMBOL);

      if(magic==NumeroMagico && comentario_=="secundaria" && entry==DEAL_ENTRY_IN)
        {
         ModificarPrincipal(symbol);
         AumentarTiempo(symbol);
        }
     }
   DealsLast=deals;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void AumentarTiempo(string simbolo)
  {
  int size=ArraySize(gestion);
   for(int i=0; i<size; i++)
     {
      if(gestion[i].activo==simbolo)
         gestion[i].tiempo=TimeCurrent()+PeriodSeconds(PERIOD_H1)*gestion[i].horasEspera;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarPrincipal()
  {
   int total=PositionsTotal();
   for(int k=total-1; k>=0; k--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      if(PositionGetTicket(k)==0) // SE SELECCIONA CADA ORDEN PARA PODER EVALUAR (si no se selecciona no se evalua)
         continue;
      if(PositionGetInteger(POSITION_MAGIC)==NumeroMagico && PositionGetString(POSITION_COMMENT)=="principal")
         return true;
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarOperacionAbierta()
  {
   int total=PositionsTotal();
   for(int k=total-1; k>=0; k--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      if(PositionGetTicket(k)==0) // SE SELECCIONA CADA ORDEN PARA PODER EVALUAR (si no se selecciona no se evalua)
         continue;
      if(PositionGetInteger(POSITION_MAGIC)==NumeroMagico)
         return true;
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ModificarPrincipal(string simbolo)
  {
   int total=PositionsTotal();
   for(int k=total-1; k>=0; k--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong ticket=PositionGetTicket(k) ;
      if(ticket==0) // SE SELECCIONA CADA ORDEN PARA PODER EVALUAR (si no se selecciona no se evalua)
         continue;
      if(PositionGetString(POSITION_SYMBOL)==simbolo && PositionGetInteger(POSITION_MAGIC)==NumeroMagico && PositionGetString(POSITION_COMMENT)=="principal")
        {
         if(PositionGetDouble(POSITION_TP)!=PositionGetDouble(POSITION_PRICE_OPEN))
           {
            if(!trade.PositionModify(ticket,PositionGetDouble(POSITION_SL),PositionGetDouble(POSITION_PRICE_OPEN)))
               Print("No modifico posicion principal error ",GetLastError()," resultCode ",trade.ResultRetcode());
            else
               return true;
           }
         return false;
        }
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetearGestion()
  {
   ArrayResize(gestion,0);
   int size=0;
   if(Activar1)
     {
      size=ArraySize(gestion);
      ArrayResize(gestion,size+1);
      if(SetearGestionIndex(size,Activo1,Lotaje1,sl_puntos1,tp_puntos1,timeStart1,timeEnd1,Espera_Horas1,reentrada1,reentrada_puntos1))
         return false;
     }

   if(Activar2)
     {
      size=ArraySize(gestion);
      ArrayResize(gestion,size+1);
      if(SetearGestionIndex(size,Activo2,Lotaje2,sl_puntos2,tp_puntos2,timeStart2,timeEnd2,Espera_Horas2,reentrada2,reentrada_puntos2))
         return false;
     }

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetearGestionIndex(int index,string activo,double lote,int slPuntos,int tpPuntos,string timeStart,string timeEnd,int esperaHoras,bool reentrada,int reentradaPuntos)
  {

   bool Testing=(MQLInfoInteger(MQL_TESTER));

   if(!Testing)
      if(!VerificarSimbolo(activo))
         return false;

   if(!VerificarStop(activo,slPuntos,"SL Puntos"))
      return false;
   if(!VerificarStop(activo,tpPuntos,"TP Puntos"))
      return false;
   if(!VerificarStop(activo,reentradaPuntos,"Reentrada Puntos"))
      return false;

   gestion[index].activo=Testing?Symbol():activo;
   gestion[index].lotaje=lote;
   gestion[index].slPoints=slPuntos;
   gestion[index].tpPoints=tpPuntos;
   gestion[index].stop2op=reentradaPuntos;
   gestion[index].reentrada=reentrada;
   gestion[index].tiempo=0;
   gestion[index].horasEspera=esperaHoras;

   if(!VerificarLote(gestion[index].activo,lote))
      return false;

   if(!SacarHoraMinuto(timeStart,gestion[index].horaInicio,gestion[index].minutoInicio))
      return false;
   if(!SacarHoraMinuto(timeEnd,gestion[index].horaFinal,gestion[index].minutoFinal))
      return false;

   gestion[index].handle=iRSI(gestion[index].activo,PeriodoOperaciones,RSI_Periodo,RSI_Applied_Price);

   gestion[index].barras=0;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarStop(string activo,int puntosStop,string namePuntos)
  {
   int stop=(int)SymbolInfoInteger(activo,SYMBOL_TRADE_STOPS_LEVEL);

   if(stop>int(puntosStop))
     {
      Alert(namePuntos+" en ",activo," debe ser mayor a ",puntosStop);
      return false;
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarSimbolo(string simbolo)
  {
   bool isCustom;
   if(!SymbolExist(simbolo,isCustom))
     {
      Alert("Activo ",simbolo," no existe, digite nuevamente igual al simbolo que aparece en el navegador de activos");
      return false;
     }
   else
      SymbolSelect(simbolo,true);

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarLote(string Simbolo,double Lote)
  {

   double LoteEvalua=Lote/SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_STEP);
   if(LoteEvalua-((int)LoteEvalua)>0.0000)
     {
      Alert("El lotaje elegido para el activo ",Simbolo," tiene que ser multiplo del paso del activo (",SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_STEP),")");
      return false;
     }

   if(Lote<SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_MIN))
     {
      Alert("El lotaje elegido para el activo ",Simbolo," tiene que ser mayor o igual al minimo permitido lotaje (",SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_MIN),")");
      return false;
     }

   if(Lote>SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_MAX))
     {
      Alert("El lotaje elegido para el activo ",Simbolo," tiene que ser menor o igual al maximo permitido lotaje (",SymbolInfoDouble(Simbolo,SYMBOL_VOLUME_MAX),")");
      return false;
     }
   return true;
  }
//+------------------------------------------------------------------+
bool SacarHoraMinuto(string horaMinuto,int &hora,int &minuto)
  {
   string hora_minuto[];
   StringSplit(horaMinuto,':',hora_minuto);
   if(ArraySize(hora_minuto)!=2)
      return false;

   string comentario="";

   if(!VerificarEntero(hora_minuto[0],comentario))
     {
      Alert(comentario+" en "+horaMinuto);
      return false;
     }

   if(!VerificarEntero(hora_minuto[1],comentario))
     {
      Alert(comentario+" en "+horaMinuto);
      return false;
     }

   hora=(int)StringToInteger(hora_minuto[0]);
   minuto=(int)StringToInteger(hora_minuto[1]);



   if(!VerificarHora_o_Minuto(hora,true,comentario))
     {
      Alert(comentario+" en ",horaMinuto);
      return false;
     }

   if(!VerificarHora_o_Minuto(minuto,false,comentario))
     {
      Alert(comentario+" en ",horaMinuto);
      return false;
     }

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarEntero(string evaluaString,string &comentario)
  {
   for(int i=0; i<StringLen(evaluaString); i++)
     {
      ushort char_=StringGetCharacter(evaluaString,i);
      if(!('0'<=char_ && char_<='9'))
        {
         comentario="Los valores hora o minuto deben de ser valores enteros";
         return false;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarHora_o_Minuto(int clockPointer,bool IsHora,string &comentario)
  {
   comentario=IsHora?("Hora es mayor a 23"):("Minuto es mayor a 59");
   return (clockPointer<(IsHora?(24):(60)));
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
bool EvaluarHorario(int Inicio, int Final, int MInicio, int MFinal, datetime TimeEvalua)
  {
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
//|                                                                  |
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
