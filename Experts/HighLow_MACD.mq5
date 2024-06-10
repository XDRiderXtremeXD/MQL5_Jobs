//+------------------------------------------------------------------+
//|                                                 HighLow_MACD.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;
#include <Trade\AccountInfo.mqh>
CAccountInfo InfoAccount;


#include <ConversionHorarioBroker.mqh>
ConversionHorarioBroker Conversion;

enum tipo
  {
   COMPRAS_VENTAS=0,
   SOLO_VENTAS=1,
   SOLO_COMPRAS=2,
  };

enum tipo2
  {
   SOLO_VENTAS_HE=0,
   SOLO_COMPRAS_HE=1,
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



input bool Operar=true;
input ENUM_TIMEFRAMES Periodo_Operaciones=PERIOD_M2;
input tipo tipo_operaciones=COMPRAS_VENTAS;
input string S0="========== Configuracion Trade ==========";//==========================================================================================
input double Volumen=1;
input int StopLoss=1200;
input int TakeProfit_1=800;
input int TakeProfit_2=1200;
input int TakeProfit_3=2000;
input int TakeProfit_4=2500;
input int MaximoPerdidas=2;
input string ExpertComentario="3 MACDS";
input int NumeroMagico=243525;
input string S011="========== Configuracion TS ==========";//==========================================================================================
input int Primer_TrailingSL=0;
input int Segundo_TrailingSL=60;
input int Tercer_TrailingSL=150;
input string S1="========== Configuracion High Low Line ==========";//==========================================================================================
input ENUM_Horas HoraStart=16;
input string S2="========== Configuracion MACD ==========";//==========================================================================================
input int Ema_Rapida=120;//EMA Rapida
input int Ema_Lenta=240;//EMA Lenta
input int MediaMovilExponencial=18;//Periodo Media Movil Exponencial
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;
input string S3="========== Configuracion HORARIO ==========";//==========================================================================================
input ENUM_Horas Hora_Inicio=_10am;
input int Minuto_Inicio=0;
input ENUM_Horas Hora_Final=_9pm;
input int Minuto_Final=30;
input string S011111="========== Configuracion OPERACION HORA ESPECIFICA ==========";//==========================================================================================
input bool OperarHoraEspecifica=false;
input double Volumen_HE=1;
input int StopLoss_HE=200;
input int TakeProfit_HE=200;
input string ExpertComentario_HE="Hora Especifica";
input ENUM_Horas Hora_Ejecuta=_10am;
input int Minuto_Ejecuta=0;
input tipo2 tipo_operacion_HE=SOLO_COMPRAS_HE;

int PuntosAfavor_=400;
int PuntosRiesgo_=-400;


#resource "\\Indicators\\MACD_colores.ex5"
#resource "\\Indicators\\High_Low_Diario.ex5"


int macd_handle=0;
int HL_handle=0;
//BUFFERS
double MACD_COLOR[];
double MACD_VALOR[];
double HIGH[];
double LOW[];

double volumenReal=0;
int copiaBarras=500;

int DiferenciaGMT=0;

MqlRates rates[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   copiaBarras=MathMax(500,(24*60*60)/(PeriodSeconds(PERIOD_CURRENT))+4);
   volumenReal=NormalizeDouble(Volumen*4,2);

   if(!VerificacionesLoteTPSL(StopLoss,TakeProfit_1,Volumen))
      return INIT_PARAMETERS_INCORRECT;

   if(!VerificacionesLoteTPSL(StopLoss_HE,TakeProfit_HE,Volumen_HE))
      return INIT_PARAMETERS_INCORRECT;

   if(!VerificacionesTP_TS())
      return INIT_PARAMETERS_INCORRECT;

   ArraySetAsSeries(rates,true);
   ArraySetAsSeries(MACD_COLOR,true);
   ArraySetAsSeries(MACD_VALOR,true);
   ArraySetAsSeries(HIGH,true);
   ArraySetAsSeries(LOW,true);

   trade.SetExpertMagicNumber(NumeroMagico);

   macd_handle=iCustom(Symbol(),Periodo_Operaciones,"::Indicators\\MACD_colores","",Ema_Rapida,Ema_Lenta,MediaMovilExponencial,Applied_Price_MACD);
   HL_handle=iCustom(Symbol(),Periodo_Operaciones,"::Indicators\\High_Low_Diario",HoraStart);

   if(MQLInfoInteger(MQL_TESTER))
     {
      ChartIndicatorAdd(0,0,macd_handle);
      ChartIndicatorAdd(0,0,HL_handle);
     }

   Conversion.InitSetearGMTyDST(-6);
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
   int barras_actuales=LoadBarsFromSymbol(Symbol(),Periodo_Operaciones);
   static int barLast=barras_actuales;


//if(barras_actuales!=barLast)
     {
      if(CopyRates(Symbol(),Periodo_Operaciones,0,copiaBarras,rates)>0)
        {
         if(BarsCalculated(macd_handle)==barras_actuales && BarsCalculated(HL_handle)==barras_actuales)
           {
            if(CopyBuffer(macd_handle,0,0,copiaBarras,MACD_VALOR)>0 && CopyBuffer(macd_handle,1,0,copiaBarras,MACD_COLOR)>0 && CopyBuffer(HL_handle,0,0,copiaBarras,HIGH)>0 && CopyBuffer(HL_handle,1,0,copiaBarras,LOW)>0)
              {
               bool CierraCompras=false;
               if(CondicionSalida(CierraCompras))
                  CerrarPosiciones(CierraCompras);

               bool EsVenta=false;
               if(barras_actuales!=barLast)
                 {
                  FuncionHoraEspecifica();
                 // Print("Entra Barra ","Low= ",LOW[1]);
                  if(CondicionEntrada(EsVenta))
                    {
                    // Print(EsVenta?"ENTRO CONDICION VENTA":"ENTRO CONDICION COMPRA");

                     CerrarPosiciones(EsVenta);

                     if(EvaluarHorario(Hora_Inicio,Hora_Final,Minuto_Inicio,Minuto_Final,rates[0].time))
                        if(Operar)
                           if(!HayOperaciones(EsVenta))
                              //if(VerificarPerdidas())
                              if(tipo_operaciones==COMPRAS_VENTAS || (EsVenta?tipo_operaciones==SOLO_COMPRAS:tipo_operaciones==SOLO_VENTAS))
                                {
                                // Print("Entro condicion tipo");
                                   {
                                  //  Print("Entro condicion horario");
                                   // Print("Opera");
                                    Operar_(!EsVenta,ExpertComentario,volumenReal,StopLoss,0);
                                   }
                                }
                    }
                  barLast=barras_actuales;
                 }
              }
           }
        }
     }


   TrailingStop();

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FuncionHoraEspecifica()
  {
   if(!OperarHoraEspecifica)
      return;

   MqlDateTime time;
   datetime tiempoEvalua=rates[1].time;
   TimeToStruct(tiempoEvalua,time);
   bool EsCompra=(tipo_operacion_HE==SOLO_COMPRAS_HE);
   if(time.hour==Hora_Ejecuta && time.min==Minuto_Ejecuta)
      if(!HayOperaciones(EsCompra))
        {
         Operar_(EsCompra,ExpertComentario_HE,Volumen_HE,StopLoss_HE,TakeProfit_HE);
        }
  }

//+------------------------------------------------------------------+
bool CondicionEntrada(bool &EsVenta)
  {

   /* El valor absoluto de DifMacD debe ser mayor a 0.13 y cumplir estas condiciones dependiendo del horario(de México):
       a) De 0:00 a 6:29 es 0.20
       b) De 6:30 a 8:29 es 0.14
       c) De 8:30 hasta las 13:00 es 0.25
   */

   bool CondicionDiftBuy=false;
   bool CondicionDiftSell=false;

   double Dift=0.20;
   if(Conversion.DentroHora_TuGMT_a_Broker(21,0,0,0,TimeCurrent())){
      Dift=0.25;
      }
   else
     {
      double MaximoMACD,MinimoMACD;
      SacarMaximoMinimo(MaximoMACD,MinimoMACD);

      if(MACD_VALOR[1]>MaximoMACD)
         CondicionDiftBuy=true;
      if(MACD_VALOR[1]<MinimoMACD)
         CondicionDiftSell=true;


      if(Conversion.DentroHora_TuGMT_a_Broker(0,6,0,29,TimeCurrent()))
         Dift=0.20;
      else
         if(Conversion.DentroHora_TuGMT_a_Broker(6,8,30,59,TimeCurrent()))
            Dift=0.14;
         else
            if(Conversion.DentroHora_TuGMT_a_Broker(8,13,30,0,TimeCurrent()))
               Dift=0.25;
     }

   //Print("Dift ",Dift);
   //Print("MACD ",MACD_VALOR[1]);

   if(MathAbs(MACD_VALOR[1])>=Dift)
     {
      CondicionDiftBuy=true;
      CondicionDiftSell=true;
     }
  
  
  //Print("Condicion Dift compra=",CondicionDiftBuy," Condicion Dift venta=",CondicionDiftSell);
  
   if(CondicionDiftBuy)
      if(MACD_COLOR[1]==1 && HIGH[1]>HIGH[2])
        {
         //Print("Entra condicion Macd compra");
         for(int i=2;i<copiaBarras-1;i++)
           {
            if(MACD_COLOR[i]==0)
               break;

            if(i==copiaBarras-2)
               return false;

            if(HIGH[i]>HIGH[i+1])
               return false;
           }
         EsVenta=false;
         return true;
        }



   if(CondicionDiftSell)
      if(MACD_COLOR[1]==0 && LOW[1]<LOW[2])
        {
          //Print("Entra condicion Macd venta");
         for(int i=2;i<copiaBarras-1;i++)
           {
            if(MACD_COLOR[i]==1)
               break;

            if(i==copiaBarras-2)
               return false;

            if(LOW[i]<LOW[i+1])
               return false;
           }
         EsVenta=true;
         return true;
        }


   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SacarMaximoMinimo(double &MaximoUPMACD,double &MinimoDNMACD)
  {
   MaximoUPMACD=0;
   MinimoDNMACD=0;
   bool restar=false;
   MqlDateTime time;
   TimeToStruct(TimeCurrent(),time);
   int hora=time.hour;
   time.min=Minuto_Inicio;
   time.sec=0;
   if(hora<Hora_Inicio)
      restar=true;
   time.hour=Hora_Inicio;
   datetime untilTime=StructToTime(time)-(restar?PeriodSeconds(PERIOD_D1):0);

   for(int i=2;i<copiaBarras;i++)
     {
      if(rates[i].time<=untilTime)
         break;

      if(MaximoUPMACD<MACD_VALOR[i])
         MaximoUPMACD=MACD_VALOR[i];

      if(MinimoDNMACD>MACD_VALOR[i])
         MinimoDNMACD=MACD_VALOR[i];
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CondicionSalida(bool &CierraCompras)
  {
   if(MACD_COLOR[1]==0 && MACD_COLOR[2]==1)
     {
      CierraCompras=true;
      return true;
     }
   if(MACD_COLOR[1]==1 && MACD_COLOR[2]==0)
     {
      CierraCompras=false;
      return true;
     }
   return false;
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
void Operar_(bool EsCompra,string comentario,double lote,int stopLoss,int takeProfit)
  {
   long spread=SymbolInfoInteger(Symbol(),SYMBOL_SPREAD);
   if(spread>=stopLoss && stopLoss!=0)
     {
      Print("No opera porque el Spread es muy alto y no deja poner el Stop Loss");
      return;
     }

   if(EsCompra)
     {
      if(InfoAccount.FreeMarginCheck(Symbol(),ORDER_TYPE_BUY,lote*4,SymbolInfoDouble(Symbol(),SYMBOL_ASK))<0)
        {
         Print("No puede operar porque se opero sin margen disponible para poner 3 operaciones con lote ",lote);
         return;
        }


      double stopLoss_=stopLoss==0?0:SymbolInfoDouble(Symbol(),SYMBOL_ASK)-stopLoss*Point();
      double takeProfit_=takeProfit==0?0:SymbolInfoDouble(Symbol(),SYMBOL_ASK)+takeProfit*Point();

      if(!trade.Buy(lote,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_ASK),stopLoss_,takeProfit_,comentario))
         Print("No opero buy error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
   else
     {
      if(InfoAccount.FreeMarginCheck(Symbol(),ORDER_TYPE_SELL,lote*4,SymbolInfoDouble(Symbol(),SYMBOL_BID))<0)
        {
         Print("No puede operar porque se opero sin margen disponible para poner 3 operaciones con lote ",lote);
         return;
        }

      double stopLoss_=stopLoss==0?0:SymbolInfoDouble(Symbol(),SYMBOL_BID)+stopLoss*Point();
      double takeProfit_=takeProfit==0?0:SymbolInfoDouble(Symbol(),SYMBOL_BID)-takeProfit*Point();

      if(!trade.Sell(lote,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_BID),stopLoss_,takeProfit_,comentario))
         Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
  }
//+------------------------------------------------------------------+
void CerrarPosiciones(bool CierraCompras)
  {
   int totalPositions=PositionsTotal();
   for(int i =totalPositions-1; i >= 0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket!=0)
         if(CierraCompras?PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY:PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
            trade.PositionClose(ticket,-1);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HayOperaciones(bool Compras)
  {
   int totalPositions=PositionsTotal();
   for(int i =totalPositions-1; i >= 0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket!=0)
         if(Compras?PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY:PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
           {
            Print("No opera porque hay operaciones");
            return true;
           }
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluarHorario(int Inicio, int Final, int MInicio, int MFinal, datetime Time)
  {
   MqlDateTime TimeEvalua;
   TimeToStruct(Time,TimeEvalua);

   int Minuto = TimeEvalua.min;
   int Hora = TimeEvalua.hour;

   if((Inicio < Final)?((Inicio <= Hora && Hora <= Final)==false):((Inicio <= Hora || Hora <= Final)==false))
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
//|                                                                  |
//+------------------------------------------------------------------+
void TrailingStop()
  {
   int TotalPosiciones=PositionsTotal();
   for(int i=0; i<TotalPosiciones; i++)
     {
      ulong Ticket=PositionGetTicket(i);

      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)!=NumeroMagico || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;
      if(PositionGetString(POSITION_COMMENT)==ExpertComentario_HE)
         continue;


      if(Ticket!=0)
        {
         MoverSL_TrailingNormal(PuntosAfavor_,PuntosRiesgo_);
         MoverSL_QuitarLote(TakeProfit_1,Primer_TrailingSL,4);
         MoverSL_QuitarLote(TakeProfit_2,Segundo_TrailingSL,3);
         MoverSL_QuitarLote(TakeProfit_3,Tercer_TrailingSL,2);
         MoverSL_QuitarLote(TakeProfit_4,Tercer_TrailingSL,1);
        }

     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void MoverSL_QuitarLote(int TakeProfit,int TrailingSL,int multiploVolumen)
  {
   double Precio=PositionGetDouble(POSITION_PRICE_CURRENT);

   ulong Ticket=PositionGetInteger(POSITION_TICKET);

   if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && TakeProfit>0 && NormalizeDouble(Precio-TakeProfit*Point(),Digits())>=PositionGetDouble(POSITION_PRICE_OPEN))
     {
      if(NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)+TrailingSL*Point(),Digits())>PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0)
         trade.PositionModify(Ticket,NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)+TrailingSL*Point(),Digits()),PositionGetDouble(POSITION_TP));

      if(PositionGetDouble(POSITION_VOLUME)==NormalizeDouble(Volumen*multiploVolumen,2))
         trade.Sell(Volumen,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_BID),0,0,ExpertComentario);
     }

   if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && TakeProfit>0 && NormalizeDouble(Precio+TakeProfit*Point(),Digits())<=PositionGetDouble(POSITION_PRICE_OPEN))
     {
      if(NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)-TrailingSL*Point(),Digits())<PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0)
         trade.PositionModify(Ticket,NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)-TrailingSL*Point(),Digits()),PositionGetDouble(POSITION_TP));

      if(PositionGetDouble(POSITION_VOLUME)==NormalizeDouble(Volumen*multiploVolumen,2))
         trade.Buy(Volumen,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_ASK),0,0,ExpertComentario);
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void MoverSL_TrailingNormal(int PuntosAfavor,int PuntosRiesgo)
  {
   double Precio=PositionGetDouble(POSITION_PRICE_CURRENT);

   ulong Ticket=PositionGetInteger(POSITION_TICKET);

   if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && PuntosAfavor>0 && NormalizeDouble(Precio-PuntosAfavor*Point(),Digits())>=PositionGetDouble(POSITION_PRICE_OPEN))
     {
      if(NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)+PuntosRiesgo*Point(),Digits())>PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0)
         trade.PositionModify(Ticket,NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)+PuntosRiesgo*Point(),Digits()),PositionGetDouble(POSITION_TP));
     }

   if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && PuntosAfavor>0 && NormalizeDouble(Precio+PuntosAfavor*Point(),Digits())<=PositionGetDouble(POSITION_PRICE_OPEN))
     {
      if(NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)-PuntosRiesgo*Point(),Digits())<PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0)
         trade.PositionModify(Ticket,NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)-PuntosRiesgo*Point(),Digits()),PositionGetDouble(POSITION_TP));
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarPerdidas()
  {
   MqlDateTime str1;
   TimeToStruct(TimeCurrent(),str1);

   str1.hour=0;
   str1.min=0;
   str1.sec=0;

   double slLast=0;

   datetime dia=StructToTime(str1);
//--- request trade history
   HistorySelect(dia,TimeCurrent());
//--- create objects
   int     total=HistoryDealsTotal();
   ulong    ticket=0;
   int perdidas=0;
   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         // int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         double Profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double SL=HistoryDealGetDouble(ticket,DEAL_SL);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
         int reason=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         string comentario=HistoryDealGetString(ticket,DEAL_COMMENT);
         //string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
         if(Magic==NumeroMagico && Symbol()==Simbolo)
           {
            if(entry==DEAL_ENTRY_OUT && reason==DEAL_REASON_SL && Profit<0)
              {
               if(slLast!=SL)
                 {
                  slLast=SL;
                  perdidas++;
                 }
              }
           }
        }
     }

   if(perdidas>=MaximoPerdidas)
      return false;

   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificacionesLoteTPSL(int SL, int TP,double Vol)
  {

   long stopMin=SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL);
   if(SL<stopMin)
     {
      Alert("El Stop Loss Puntos debe ser mayor o igual a ",stopMin," para este activo");
      return false;
     }

   if(TP<stopMin)
     {
      Alert("El TakeProfit Menor Puntos debe ser mayor o igual a ",stopMin," para este activo");
      return false;
     }

   double vMax=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX);
   double vMin=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN);

   if(Vol==vMin)
      return true;


   if(Vol<vMin)
     {
      Alert("EL VOLUMEN DEBE SER MAYOR O IGUAL A ",vMin);
      return false;
     }

   if(Vol>SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX))
     {
      Alert("EL VOLUMEN DEBE SER MENOR O IGUAL A ",vMax);
      return false;
     }

   double LoteEvalua=Vol/SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
   if(LoteEvalua-((int)LoteEvalua)>0)
     {
      Alert("EL VOLUMEN DEBE SER MULTIPLO A ",SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP));
      return false;
     }

   return true;
  }


//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificacionesTP_TS()
  {

   if(TakeProfit_1>TakeProfit_2 || TakeProfit_2>TakeProfit_3)
     {
      Alert("Los TakeProfits deben ser cantidades con orden creciente, por ejemplo TP1=20 TP2=30 TP3=40");
      return false;
     }

   if(Primer_TrailingSL>TakeProfit_2)
     {
      Alert("El primer Trailing Stop (Primer_TakeProfit) debe ser menor a TakeProfit2 ",TakeProfit_2);
      return false;
     }

   if(Segundo_TrailingSL>TakeProfit_3)
     {
      Alert("El segundo Trailing Stop (Primer_TakeProfit) debe ser menor a TakeProfit3 ",TakeProfit_3);
      return false;
     }


   return true;
  }
//+------------------------------------------------------------------+
