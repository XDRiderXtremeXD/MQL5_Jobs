//+------------------------------------------------------------------+
//|                                                       Heiken.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#resource "\\Indicators\\heikin_juanje.ex5"


#include<Trade\Trade.mqh>
CTrade trade;

enum TipoAdicion
  {
   multiplicador,
   suma,
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


input ENUM_TIMEFRAMES Periodo_Operaciones=PERIOD_CURRENT;
input string S10="==========   TRADE ==========";//------------------------------------------------------------------------------------------------
input int MagicNumber=34353333;
input string comentario="Expert Tendencia";//Comentario de Operaciones
input bool AumentarSpreadBajista=true;//Aumentar Spread Bajista
input string S1="==========   LOTAJE  ==========";//--------------------------------------------------------------------------------------------------------------------------------------------
input double Lote_Inicial=0.1;
input TipoAdicion Tipo_Adicion=multiplicador;
input double Coeficiente_Adicion=2;
input int MaximoMultiplicador=2;
input string S3="========== Configuracion HORARIO ==========";//==========================================================================================
input bool ActivarHorario=true;
input ENUM_Horas Hora_Inicio=_10am;
input int Minuto_Inicio=0;
input ENUM_Horas Hora_Final=_10am;
input int Minuto_Final=0;
input string S4="==========   MEDIA MOVIL  ==========";//====================================================================================================================================================================================
input bool Filtro_MA=true;
input ENUM_TIMEFRAMES Ma_TF=PERIOD_CURRENT;
input int Ma_Periodo=30;//Periodo
input int Ma_shift=0;
input ENUM_MA_METHOD Ma_Method=MODE_EMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;
input string S5="==========  Filtro Area Vela Personalizada  ==========";//==============================================
input ENUM_TIMEFRAMES Periodo_Vela=PERIOD_D1;
input bool Filtro_VelaDiaria=true;
input double percent_=2;//Porcentaje Area %


int ma_heiken=0;
int ma_handle=0;

double HEI_OPEN[];
double HEI_HIGH[];
double HEI_LOW[];
double HEI_CLOSE[];

double MA[];

MqlRates rates[];
MqlRates ratesDiario[];

#include <Trade\AccountInfo.mqh>
CAccountInfo InfoAccount;
string primeraOperacion="Primera Operacion";
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

//VERIFICA SI EL LOTE Y LOS TP Y SL SON CORRECTOS PARA EL ACTIVO
   if(!VerificacionesLoteTPSL())
      return INIT_PARAMETERS_INCORRECT;

   ma_heiken=iCustom(Symbol(),Periodo_Operaciones,"::Indicators\\heikin_juanje.ex5");
   ma_handle=iMA(Symbol(),Ma_TF,Ma_Periodo,Ma_shift,Ma_Method,Ma_AppliedPrice);

   ArraySetAsSeries(HEI_LOW,true);
   ArraySetAsSeries(HEI_CLOSE,true);
   ArraySetAsSeries(HEI_OPEN,true);
   ArraySetAsSeries(HEI_HIGH,true);
   ArraySetAsSeries(MA,true);
   ArraySetAsSeries(rates,true);
   ArraySetAsSeries(ratesDiario,true);

//SETEA EL NUMERO MAGICO DE LAS OPERACIONES
   trade.SetExpertMagicNumber(MagicNumber);
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
//CARGA EL NUMERO DE BARRAS DE LA TEMPORALIDAD (Periodo_Operaciones)
   int barras_actuales=LoadBarsFromSymbol(Symbol(),Periodo_Operaciones);
   int barras_MA=LoadBarsFromSymbol(Symbol(),Ma_TF);
   static int barLast=barras_actuales;

   int copiaBarras=3;



//COPIA VALORES DE LAS ULTIMAS VELAS (CopiaBarras)
   if(CopyRates(NULL,Periodo_Operaciones,0,copiaBarras,rates)>0 && CopyRates(Symbol(),Periodo_Vela,0,3,ratesDiario)>0)
     {
      //VERIFICA SI LOS INDICADORES FUERON CARGADOS PARA TODAS LAS BARRAS ACTUALES
      if(BarsCalculated(ma_heiken)==barras_actuales && BarsCalculated(ma_handle)==barras_MA)
        {
         //COPIA LOS 3 ULTIMOS VALORES DE LOS INDICADORES EN UN ARREGLO
         if(CopyBuffer(ma_heiken,0,0,copiaBarras,HEI_OPEN)>0 && CopyBuffer(ma_heiken,1,0,copiaBarras,HEI_HIGH)
            && CopyBuffer(ma_heiken,2,0,copiaBarras,HEI_LOW)  && CopyBuffer(ma_heiken,3,0,copiaBarras,HEI_CLOSE)
            && CopyBuffer(ma_handle,0,0,copiaBarras,MA))
           {
            //SE EJECUTA CADA VEZ QUE SE CREA UNA NUEVA BARRA EN LA TEMPORALIDAD (Periodo_Operaciones)
            if(barras_actuales!=barLast)
              {
               bool EstaEnHorario=(EvaluarHorario(Hora_Inicio,Hora_Final,Minuto_Inicio,Minuto_Final,TimeCurrent()));

               if((ActivarHorario && EstaEnHorario) || !ActivarHorario)
                 {
                  barLast=barras_actuales;
                  Print("EVALUA ESTA DENTRO DEL HORARIO");
                  TS_(HEI_HIGH[1],HEI_LOW[1]);

                  bool Bajista=HEI_OPEN[1]>HEI_CLOSE[1];
                  bool Alcista=HEI_OPEN[1]<HEI_CLOSE[1];

                  long ID_op_cer_ant=0;
                  double profit_op_cer_an=0;
                  double lote_op_cer_an=0.01;

                  if(Alcista)
                     Print("Hay condicion Alcista");
                  if(Bajista)
                     Print("Hay condicion Bajista");


                  string comentario_="Heiken";
                  if(Bajista)
                     if(!Filtro_VelaDiaria || !Entra_Filtro_VelaDiaria(true,rates[1].close))
                        CerrarPosiciones(true,ID_op_cer_ant,profit_op_cer_an,lote_op_cer_an,comentario_);

                  if(Alcista)
                     if(!Filtro_VelaDiaria || !Entra_Filtro_VelaDiaria(false,rates[1].close))
                        CerrarPosiciones(false,ID_op_cer_ant,profit_op_cer_an,lote_op_cer_an,comentario_);


                  if(Bajista)
                    {
                     if(HayOperaciones(false))
                        return;
                     if(!Entra_Filtro_MA(false))
                        return;

                     if(!Entra_Filtro_VelaDiaria(false,rates[1].close))
                        return;
                    }

                  if(Alcista)
                    {
                     if(HayOperaciones(true))
                        return;
                     if(!Entra_Filtro_MA(true))
                        return;
                     if(!Entra_Filtro_VelaDiaria(true,rates[1].close))
                        return;
                    }

                  double Lote=Lote_Inicial;
                  if(!(comentario_==primeraOperacion && profit_op_cer_an>=0))
                     Lote=GetLotePorPerdida(ID_op_cer_ant,profit_op_cer_an,lote_op_cer_an,comentario_);
                  else
                     comentario_=primeraOperacion;

                  if(Bajista)
                     Operar(false,comentario_,Lote,HEI_HIGH[1],0);

                  if(Alcista)
                     Operar(true,comentario_,Lote,HEI_LOW[1],0);
                 }

               if(ActivarHorario && !EstaEnHorario)
                  CerrarPosicionesALL();
              }
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Entra_Filtro_MA(bool IsAlcista)
  {
   if(!Filtro_MA)
      return true;

   if(IsAlcista)
      if(MA[1]<rates[1].close)
         return true;

   if(!IsAlcista)
      if(MA[1]>rates[1].close)
         return true;

   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Entra_Filtro_VelaDiaria(bool IsAlcista,double precio)
  {
   if(!Filtro_VelaDiaria)
      return true;

   double max=ratesDiario[1].close>ratesDiario[1].open?ratesDiario[1].close:ratesDiario[1].open;
   double min=ratesDiario[1].close<ratesDiario[1].open?ratesDiario[1].close:ratesDiario[1].open;

   double rango= MathAbs(max-min);
   double rangoPorcentaje=rango*percent_/100;


   if(!IsAlcista)
      if(max>=precio && precio>=max-rangoPorcentaje)
         return true;

   if(IsAlcista)
      if(min<=precio && precio<=min+rangoPorcentaje)
         return true;

   if(IsAlcista)
      if(max<precio)
         return true;

   if(!IsAlcista)
      if(min>precio)
         return true;

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarPosiciones(bool Buys,long &ID_PosClose,double &profit_,double &lote,string &comentario_)
  {
   ID_PosClose=0;
   int totalPositions = PositionsTotal();
   for(int i = totalPositions-1; i >=0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket>0)
        {
         if(PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetString(POSITION_SYMBOL)==Symbol())
            if(Buys?(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY):(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL))
              {
               long id=PositionGetInteger(POSITION_IDENTIFIER);
               double profit=PositionGetDouble(POSITION_PROFIT);
               string comen=PositionGetString(POSITION_COMMENT);
               double lot=PositionGetDouble(POSITION_VOLUME);

               datetime tiempo=iTime(Symbol(),PERIOD_D1,0);
               datetime tiempoPosicion=(datetime)PositionGetInteger(POSITION_TIME);
               if(!trade.PositionClose(ticket,-1))
                  Print("Error al cerrar posicion ",GetLastError()," resultRetcode ",trade.ResultRetcode());
               else
                 {
                  if(tiempoPosicion<tiempo)
                     return;

                  Print("Cerro ",(Buys?"BUY":"SELL"));
                  Print("Con Profit ",profit);
                  ID_PosClose=id;
                  comentario_=comen;
                  lote=lot;
                  profit_=profit;
                 }
              }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarPosicionesALL()
  {
   int totalPositions = PositionsTotal();
   for(int i = totalPositions-1; i >=0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket>0)
        {
         if(PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetString(POSITION_SYMBOL)==Symbol())
           {
            if(!trade.PositionClose(ticket,-1))
               Print("Error al cerrar posicion ",GetLastError()," resultRetcode ",trade.ResultRetcode());
            else
               Print("Cerro Operacion");
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HayOperaciones(bool IsBuy)
  {
   int totalPositions = PositionsTotal();
   for(int i = totalPositions-1; i >=0; i--)
     {
      if(PositionSelectByTicket(PositionGetTicket(i)))
        {
         if(PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetString(POSITION_SYMBOL)==Symbol())
            if(IsBuy?PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY:PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
              {
               Print("HAY OPERACIONES, POR ESO NO OPERA");
               return true;
              }
        }
     }
   Print("OPERA");
   return false;
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
//|                                                                  |
//+------------------------------------------------------------------+
void Operar(bool isCompra,string comentario_,double lote,double stopLoss,int takeProfit)
  {
   double ASK=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double BID=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   if(!isCompra)
     {
      if(InfoAccount.FreeMarginCheck(Symbol(),ORDER_TYPE_SELL,lote,BID)<0)
        {
         Print("No puede operar SELL porque se opero sin margen disponible para poner una operacion con lote ",lote);
         return;
        }

      double SL=stopLoss+(AumentarSpreadBajista?(SymbolInfoInteger(Symbol(),SYMBOL_SPREAD)*Point()):0);
      double TP=takeProfit==0?0:BID-takeProfit*Point();

      if(!trade.Sell(lote,Symbol(),BID,SL,TP,comentario_))
        {
         Alert("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
         Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
        }
      else
         Print("OPERA SELL CON LOTE ",lote);
     }
   else
     {
      if(InfoAccount.FreeMarginCheck(Symbol(),ORDER_TYPE_BUY,lote,ASK)<0)
        {
         Alert("No puede operar BUY porque se opero sin margen disponible para poner una operacion con lote ",lote);
         Print("No puede operar BUY porque se opero sin margen disponible para poner una operacion con lote ",lote);
         return;
        }

      double SL=stopLoss;
      double TP=takeProfit==0?0:ASK+takeProfit*Point();

      if(!trade.Buy(lote,Symbol(),ASK,SL,TP,comentario_))
         Print("No opero buy error : ",GetLastError()," result error ",trade.ResultRetcode());
      else
         Print("OPERA BUY CON LOTE ",lote);
     }
  }

//+------------------------------------------------------------------+
bool VerificacionesLoteTPSL()
  {

   long stopMin=SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL);
   /*if(StopLoss<stopMin && StopLoss!=0)
        {
         Alert("El Stop Loss Puntos debe ser mayor o igual a ",stopMin," para este activo");
         return false;
        }*/

   /* if(TakeProfit<stopMin && TakeProfit!=0)
      {
       Alert("El TakeProfit Puntos debe ser mayor o igual a ",stopMin," para este activo");
       return false;
      }*/

   double vMax=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX);
   double vMin=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN);

   if(Lote_Inicial==vMin)
      return true;


   if(Lote_Inicial<vMin)
     {
      Alert("EL LOTE INICIAL DEBE SER MAYOR O IGUAL A ",vMin);
      return false;
     }

   if(Lote_Inicial>SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX))
     {
      Alert("EL LOTE INICIAL DEBE SER MENOR O IGUAL A ",vMax);
      return false;
     }

   double LoteEvalua=Lote_Inicial/SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
   if(LoteEvalua-((int)LoteEvalua)>0)
     {
      Alert("EL LOTE INICIAL DEBE SER MULTIPLO A ",SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP));
      return false;
     }

   return true;
  }


//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TS_(double HIGH,double LOW) // FUNCION DEL TS Y BREAK VEN
  {
// if(!Trailing_Stop)
//  return;

   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   for(int cnt=0; cnt<PositionsTotal(); cnt++) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetSymbol(cnt)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
        {
         double Precio=PositionGetDouble(POSITION_PRICE_CURRENT);
         double Open=PositionGetDouble(POSITION_PRICE_OPEN);
         double SL=PositionGetDouble(POSITION_SL);
         double TP=PositionGetDouble(POSITION_TP);
         //TS Funcion
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && LOW>0)
           {
            if((NormalizeDouble(LOW,Digits())>PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0) && LOW>PositionGetDouble(POSITION_PRICE_OPEN))
               trade.PositionModify(Ticket,NormalizeDouble(LOW,Digits()),PositionGetDouble(POSITION_TP));
           }

         if((PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && HIGH>0) && HIGH<PositionGetDouble(POSITION_PRICE_OPEN))
           {
            if(NormalizeDouble(HIGH,Digits())<PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0)
               trade.PositionModify(Ticket,NormalizeDouble(HIGH,Digits()),PositionGetDouble(POSITION_TP));
           }
        }
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetLotePorPerdida(long ID_op_cer_ant,double profit_op_cer_ant,double lote_op_cer_ant,string &comentarioOperacionNueva)
  {
   Print("EVALUA LOTE");
   double ProfitTotalDesdeInicial=0;

   double loteOperacionAnterior=0;
   double profitOperacionAnterior=0;


   if(ID_op_cer_ant!=0)
     {
      ProfitTotalDesdeInicial=profit_op_cer_ant;

      loteOperacionAnterior=lote_op_cer_ant;
      profitOperacionAnterior=profit_op_cer_ant;
     }
   Print("Profit Inicial ",ProfitTotalDesdeInicial);

   GetValues_ProfitTotal_LastTradeLote_LastTradeProfit(ProfitTotalDesdeInicial,loteOperacionAnterior,profitOperacionAnterior,ID_op_cer_ant);

   Print("PROFIT  ",ProfitTotalDesdeInicial);

   if(ProfitTotalDesdeInicial>=0)
     {
      Print("Supero el profit a positivo, retorna Lote Inicial");
      comentarioOperacionNueva=primeraOperacion;
      return Lote_Inicial;
     }

   if(profitOperacionAnterior>0)
      return loteOperacionAnterior;

   return CalcularLoteAdicionado(loteOperacionAnterior);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CalcularLoteAdicionado(double loteAnterior)
  {
   double LoteResultante=0.01;
   if(Tipo_Adicion)
     {
      LoteResultante=MathMin((MaximoMultiplicador)*Coeficiente_Adicion+Lote_Inicial,loteAnterior+Lote_Inicial);

      double Paso=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);

      double Resultado=LoteResultante/Paso;

      if(Resultado-int(Resultado)>0)
         LoteResultante=NormalizeDouble(Paso*int(Resultado),2);

      if(LoteResultante<SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
         LoteResultante=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
      else
         if(LoteResultante>SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
            LoteResultante=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);

      Print("Lote resultante ",LoteResultante);
     }
   else
     {
      LoteResultante=MathMin(MathPow(Coeficiente_Adicion,MaximoMultiplicador)*Lote_Inicial,loteAnterior*Coeficiente_Adicion);
      double Paso=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);

      double Resultado=LoteResultante/Paso;

      if(Resultado-int(Resultado)>0)
         LoteResultante=NormalizeDouble(Paso*int(Resultado),2);

      if(LoteResultante<SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
         LoteResultante=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
      else
         if(LoteResultante>SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
            LoteResultante=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);

      Print("Lote resultante ",LoteResultante);
     }
   return LoteResultante;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GetValues_ProfitTotal_LastTradeLote_LastTradeProfit(double &ProfitTotal,double &loteAnterior,double &profitAnterior,long ID_PosClose)
  {
//--- request trade history
   datetime tiempo=iTime(Symbol(),PERIOD_D1,0);
   HistorySelect(tiempo,TimeCurrent());
//--- create objects
   int     total=HistoryDealsTotal();
   ulong    ticket=0;
   Print("=========================");

   int numOp=0;
   if(ID_PosClose!=0)
     {
      Print(numOp+1," Lote ",loteAnterior," Symbolo ",Symbol()," Profit ",profitAnterior," comentario_: ");
      numOp++;
     }


   for(int i=total-1; i>=0; i--)
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         // int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         double Profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double Lote=HistoryDealGetDouble(ticket,DEAL_VOLUME);
         double SL=HistoryDealGetDouble(ticket,DEAL_SL);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
         int reason=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         string comentario_=HistoryDealGetString(ticket,DEAL_COMMENT);
         //string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
         if(Magic==MagicNumber && Symbol()==Simbolo && entry==DEAL_ENTRY_OUT)
           {
            if(ID==ID_PosClose)
               continue;

            Print(numOp+1," Lote ",Lote," Symbolo ",Simbolo," Profit ",Profit," comentario_: ",comentario_);
            numOp++;

            if(loteAnterior==0)
              {
               loteAnterior=Lote;
               profitAnterior=Profit;
              }

            ProfitTotal+=Profit;

            if(VerSiEsInicial(Lote,ID,i))
               break;
           }
        }

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerSiEsInicial(double lote,int Identifier,int indexStart)
  {
   ulong ticket=0;
   if(lote==Lote_Inicial)
      for(int j=indexStart-1; j>=0; j--)
         if((ticket=HistoryDealGetTicket(j))>0)
           {
            long entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
            string comentario_=HistoryDealGetString(ticket,DEAL_COMMENT);
            int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
            if(ID==Identifier && primeraOperacion==comentario_ && entry==DEAL_ENTRY_IN)
              {
               Print("ACA TERMINA ",comentario_);
               return true;
              }
           }
   return false;
  }
//+------------------------------------------------------------------+
bool EvaluarHorario(int Inicio, int Final, int MInicio, int MFinal, datetime TimeEvalua)
  {
   MqlDateTime Time;
   TimeToStruct(TimeEvalua,Time);

   int Minuto = Time.min;
   int Hora = Time.hour;

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

         if(!(Minuto >= MInicio && Minuto < MFinal))
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
