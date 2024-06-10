//+------------------------------------------------------------------+
//|                                              Experto Mas v20.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

#include<Trade\Trade.mqh>
CTrade trade;

#include <Trade\AccountInfo.mqh>
CAccountInfo InfoAccount;

#include <Trade\TerminalInfo.mqh>
CTerminalInfo TerminalInfo;

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12pm=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };


input string S1="-----------------------   Configuracion TF  ---------------------";//----------------------------------------
input ENUM_TIMEFRAMES TimeFrame1=PERIOD_M1;//TF PRINCIPAL
input ENUM_TIMEFRAMES TimeFrame2=PERIOD_M5;//TF 2
input ENUM_TIMEFRAMES TimeFrame3=PERIOD_M15;//TF 3
input bool Habilitar_Filtro_TF2=false;
input bool Habilitar_Filtro_TF3=false;
input string S3="-----------------------   Configuracion Experto  ---------------------";//----------------------------------------
input double Lote=0.01;
input int TP_=100;
input int SL_=100;
input int MagicNumber=2222;
input string CommentExpert="Experto";
input string S4="-----------------------   Configuracion Horario  ---------------------";//----------------------------------------
input ENUM_Horas  Hora_Inicio=_2am;
input int Minuto_Inicio=0;
input ENUM_Horas Hora_Final=_4pm;
input int Minuto_Final=0;
input color Clr_Start=clrRed;
input color Clr_End=clrYellow;
input string S51="-----------------------   Configuracion MM TF 1  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_TF1=14;
input int Ma_Shift_TF1=0;
input ENUM_MA_METHOD Ma_Method_TF1=MODE_EMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_TF1=PRICE_CLOSE;
input int Distancia_Filtro_Minimo_TF1=100;//TF1 Distancia desde la EMA Minimo (Puntos)
input int Distancia_Filtro_Maximo_TF1=500;//TF1 Distancia desde la EMA Maximo (Puntos)
input string S52="-----------------------   Configuracion MM TF 2  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_TF2=14;
input int Ma_Shift_TF2=0;
input ENUM_MA_METHOD Ma_Method_TF2=MODE_EMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_TF2=PRICE_CLOSE;
input int Distancia_Filtro_Minimo_TF2=100;//TF2 Distancia desde la EMA Minimo (Puntos)
input int Distancia_Filtro_Maximo_TF2=500;//TF2 Distancia desde la EMA Maximo (Puntos)
input string S53="-----------------------   Configuracion MM TF 3  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo_TF3=14;
input int Ma_Shift_TF3=0;
input ENUM_MA_METHOD Ma_Method_TF3=MODE_EMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice_TF3=PRICE_CLOSE;
input int Distancia_Filtro_Minimo_TF3=100;//TF3 Distancia desde la EMA Minimo (Puntos)
input int Distancia_Filtro_Maximo_TF3=500;//TF3 Distancia desde la EMA Maximo (Puntos)
input string S7="-----------------------   Configuracion Trailing  ---------------------";//-----------------------------------------------
input bool ActivarTrailing=false;// ACTIVAR TRAILING STOP
input uint TrailingStart=200;
input uint TrailingInit=100;
input uint TrailingStep=10;
input bool Cerrar_si_falla=true;
input string S8="-----------------------   Configuracion BE  ---------------------";//-----------------------------------------------
input bool ActivarBloqueo=false;//ACTIVAR BLOQUEO DE GANANCIAS
input uint BE_Puntos=200;//BREAK EVEN + PUNTOS
input uint Puntos_Bloqueo=100; // PUNTOS PARA BLOQUEO DE GANANCIAS

MqlRates rates[];
string VLine="VLine ES 562023";
string VLineEnd="VLineEnd ES 562023";

int Ma1,Ma2,Ma3;
double MA1_Buffer[],MA2_Buffer[],MA3_Buffer[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(Minuto_Inicio>59)
     {
      Alert("Minuto Inicio debe ser menor a 60");
      return INIT_PARAMETERS_INCORRECT;
     }

   if(Minuto_Final>59)
     {
      Alert("Minuto Final debe ser menor a 60");
      return INIT_PARAMETERS_INCORRECT;
     }

   if(ActivarTrailing)
     {
      if(TrailingInit>=TrailingStart)
        {
         Alert("ERROR : TRAILING INIT DEBE SER MENOR A TRAILING START");
         return INIT_PARAMETERS_INCORRECT;
        }
     }

   if(ActivarBloqueo)
     {
      if(BE_Puntos<=Puntos_Bloqueo)
        {
         Alert("ERROR : (PUNTOS PARA BLOQUEO) DEBE SER MENOR A (BREAK EVEN + PUNTOS)");
         return INIT_PARAMETERS_INCORRECT;
        }
     }

   Ma1=iMA(Symbol(),TimeFrame1,Ma_Periodo_TF1,Ma_Shift_TF1,Ma_Method_TF1,Ma_AppliedPrice_TF1);

   if(Habilitar_Filtro_TF2)
      Ma2=iMA(Symbol(),TimeFrame2,Ma_Periodo_TF2,Ma_Shift_TF2,Ma_Method_TF2,Ma_AppliedPrice_TF2);
   if(Habilitar_Filtro_TF3)
      Ma3=iMA(Symbol(),TimeFrame3,Ma_Periodo_TF3,Ma_Shift_TF3,Ma_Method_TF3,Ma_AppliedPrice_TF3);


   trade.SetExpertMagicNumber(MagicNumber);

   ArraySetAsSeries(MA1_Buffer,true);
   ArraySetAsSeries(MA2_Buffer,true);
   ArraySetAsSeries(MA3_Buffer,true);

   ArrayResize(MA1_Buffer,3);
   ArrayResize(MA2_Buffer,3);
   ArrayResize(MA3_Buffer,3);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectDelete(0,VLineEnd);
   ObjectDelete(0,VLine);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   if(CopyRates(Symbol(),TimeFrame1,0,3,rates)<0)
      return;


   if(CopyBuffer(Ma1,0,0,3,MA1_Buffer)<=0)
      return;

   if(Habilitar_Filtro_TF2)
      if(CopyBuffer(Ma2,0,0,3,MA2_Buffer)<=0)
         return;

   if(Habilitar_Filtro_TF3)
      if(CopyBuffer(Ma3,0,0,3,MA3_Buffer)<=0)
         return;

   CondicionEmasComentarios(MA1_Buffer[0],MA2_Buffer[0],MA3_Buffer[0]);

   int Operaciones=0;
   NumeroDeOperaciones(Operaciones);



   if(EvaluarHorario(Hora_Inicio,Hora_Final,Minuto_Inicio,Minuto_Final,TimeCurrent()))
     {
      datetime TiempoStart=CalcularTiempoStart();
      int Ticket=0;

      if(ObjectFind(0,VLine))
         VLineCreate(0,VLine,0,TiempoStart,Clr_Start,STYLE_SOLID,1,false,false,true,0);
      else
         ObjectSetInteger(0,VLine,OBJPROP_TIME,0,TiempoStart);

      ObjectDelete(0,VLineEnd);

      if(TerminalInfo.IsTradeAllowed() && Operaciones==0 && !OperacionPorDia())
        {
         bool EsCompra=false;
         if(CondicionEmas(MA1_Buffer[0],MA2_Buffer[0],MA3_Buffer[0],EsCompra))
           {
            if(EsCompra)
               Operar_(true,CommentExpert,Lote,SL_,TP_);
            else
               Operar_(false,CommentExpert,Lote,SL_,TP_);
           }
        }
     }
   else
     {
      datetime tiempoFinal=CalcularTiempoEnd();
      if(ObjectFind(0,VLineEnd))
         VLineCreate(0,VLineEnd,0,tiempoFinal,Clr_End,STYLE_SOLID,1,false,false,true,0);
      else
         ObjectSetInteger(0,VLineEnd,OBJPROP_TIME,0,tiempoFinal);
     }



   if(ActivarTrailing)
      if(Funcion_Trailing())
         PonerTP_ZERO();

   if(ActivarBloqueo)
      Funcion_Bloqueo();

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Funcion_Bloqueo() // FUNCION DEL TS Y BREAK VEN
  {

   int TotalPosiciones=PositionsTotal();
   for(int i=0; i<TotalPosiciones; i++)
     {
      ulong Ticket=PositionGetTicket(i);

      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)!=MagicNumber || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;


      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && (PositionGetDouble(POSITION_SL)<NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)+Puntos_Bloqueo*Point(),Digits()) || PositionGetDouble(POSITION_SL)==0)  &&  NormalizeDouble(PositionGetDouble(POSITION_PRICE_CURRENT)-BE_Puntos*Point(),Digits())>PositionGetDouble(POSITION_PRICE_OPEN))  //Si Operacion es un BUY y Breakeven>0 y StopLoss No esta en Precio de Entrada y El precio supera el Precio establecido para el BE
         if(!trade.PositionModify(Ticket,NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)+Puntos_Bloqueo*Point(),Digits()),PositionGetDouble(POSITION_TP)))
            Print("Error al modificar SL ",GetLastError()," code ",trade.ResultRetcode());



      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && (PositionGetDouble(POSITION_SL)>NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)-Puntos_Bloqueo*Point(),Digits()) || PositionGetDouble(POSITION_SL)==0) && NormalizeDouble(PositionGetDouble(POSITION_PRICE_CURRENT)+BE_Puntos*Point(),Digits())<PositionGetDouble(POSITION_PRICE_OPEN))
         if(!trade.PositionModify(Ticket,NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)-Puntos_Bloqueo*Point(),Digits()),PositionGetDouble(POSITION_TP)))
            Print("Error al modificar SL ",GetLastError()," code ",trade.ResultRetcode());
     }

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool PonerTP_ZERO()
  {
   int TotalPosiciones=PositionsTotal();
   for(int i=0; i<TotalPosiciones; i++)
     {
      ulong Ticket=PositionGetTicket(i);

      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)!=MagicNumber || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;
      //donde esta el experto.. entonces no lo evalua
        {
         if(PositionGetDouble(POSITION_TP)!=0)
            if(!trade.PositionModify(Ticket,PositionGetDouble(POSITION_SL),0))
               Print("Error al modificar SL ",GetLastError()," code ",trade.ResultRetcode());
        }
     }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool OperacionPorDia()
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
         int type =(int)HistoryDealGetInteger(ticket,DEAL_TYPE);
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
         if(Magic==MagicNumber && Symbol()==Simbolo)
           {
            if(entry==DEAL_ENTRY_IN && (type==DEAL_TYPE_BUY || type==DEAL_TYPE_SELL))
              {
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
bool CondicionEmas(double MA1,double MA2, double MA3,bool &EsCompra)
  {
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   if(MA1<Ask)
      if(Distancia_Filtro_Maximo_TF1*Point()>=MathAbs(Ask-MA1) && Distancia_Filtro_Minimo_TF1*Point()<=MathAbs(Ask-MA1)
         && (!Habilitar_Filtro_TF2 || (MA2<Ask && Distancia_Filtro_Maximo_TF2*Point()>=MathAbs(Ask-MA2) && Distancia_Filtro_Minimo_TF2*Point()<=MathAbs(Ask-MA2)))
         && (!Habilitar_Filtro_TF3 || (MA3<Ask && Distancia_Filtro_Maximo_TF3*Point()>=MathAbs(Ask-MA3) && Distancia_Filtro_Minimo_TF3*Point()<=MathAbs(Ask-MA3))))
        {
         EsCompra=true;
         return true;
        }

   if(MA1>Bid)
      if(Distancia_Filtro_Maximo_TF1*Point()>=MathAbs(MA1-Bid) && Distancia_Filtro_Minimo_TF1*Point()<=MathAbs(MA1-Bid)
         && (!Habilitar_Filtro_TF2 || (MA2>Bid &&Distancia_Filtro_Maximo_TF2*Point()>=MathAbs(MA2-Bid) && Distancia_Filtro_Minimo_TF2*Point()<=MathAbs(MA2-Bid)))
         && (!Habilitar_Filtro_TF3 || (MA3>Bid &&Distancia_Filtro_Maximo_TF3*Point()>=MathAbs(MA3-Bid) && Distancia_Filtro_Minimo_TF3*Point()<=MathAbs(MA3-Bid))))
        {
         EsCompra=false;
         return true;
        }

   return false;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CondicionEmasComentarios(double MA1,double MA2, double MA3)
  {
   enum tipo
     {
      NEUTRO,
      VENTA,
      COMPRA,
     };

   string comentario="";
   tipo TF1=NEUTRO;
   tipo TF2=NEUTRO;
   tipo TF3=NEUTRO;

   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   if(MA1<Ask)
      if(Distancia_Filtro_Maximo_TF1*Point()>=MathAbs(Bid-MA1) && Distancia_Filtro_Minimo_TF1*Point()<=MathAbs(Bid-MA1))
         TF1=COMPRA;

   if(MA1>Bid)
      if(Distancia_Filtro_Maximo_TF1*Point()>=MathAbs(MA1-Ask) && Distancia_Filtro_Minimo_TF1*Point()<=MathAbs(MA1-Ask))
         TF1=VENTA;

   comentario+="TF1 ";
   comentario+=((TF1==COMPRA?"COMPRA":(TF1==VENTA?"VENTA":"NEUTRAL"))+" | ");

   if(Habilitar_Filtro_TF2)
     {
      if(MA2<Ask)
         if((Distancia_Filtro_Maximo_TF2*Point()>=MathAbs(Bid-MA2) && Distancia_Filtro_Minimo_TF2*Point()<=MathAbs(Bid-MA2)))
            TF2=COMPRA;

      if(MA2>Bid)
         if((Distancia_Filtro_Maximo_TF2*Point()>=MathAbs(Ask-MA2) && Distancia_Filtro_Minimo_TF2*Point()<=MathAbs(Ask-MA2)))
            TF2=VENTA;

      comentario+="TF2 ";
      comentario+=((TF2==COMPRA?"COMPRA":(TF2==VENTA?"VENTA":"NEUTRAL"))+" | ");
     }

   if(Habilitar_Filtro_TF3)
     {
      if(MA3<Ask)
         if((Distancia_Filtro_Maximo_TF3*Point()>=MathAbs(Bid-MA3) && Distancia_Filtro_Minimo_TF3*Point()<=MathAbs(Bid-MA3)))
            TF3=COMPRA;

      if(MA3>Bid)
         if((Distancia_Filtro_Maximo_TF3*Point()>=MathAbs(Ask-MA3) && Distancia_Filtro_Minimo_TF3*Point()<=MathAbs(Ask-MA3)))
            TF3=VENTA;

      comentario+="TF3 ";
      comentario+=((TF3==COMPRA?"COMPRA":(TF3==VENTA?"VENTA":"NEUTRAL"))+" | ");
     }

   Comment(comentario);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void NumeroDeOperaciones(int &Operaciones)
  {
   Operaciones=0;

   for(int cnt=PositionsTotal()-1; cnt>=0; cnt--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      if(!PositionSelectByTicket(PositionGetTicket(cnt))) // SE SELECCIONA CADA ORDEN PARA PODER EVALUAR (si no se selecciona no se evalua)
         continue;
      if(PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetString(POSITION_SYMBOL)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
         //donde esta el experto.. entonces no lo evalua
        {
         Operaciones++;
        }
     }
  }
//+------------------------------------------------------------------+
void Operar_(bool EsCompra,string comentario,double lote,int stopLoss,int takeProfit)
  {
   long spread=SymbolInfoInteger(Symbol(),SYMBOL_SPREAD);
   if(spread>=stopLoss)
     {
      Print("No opera porque el Spread es muy alto y no deja poner el Stop Loss");
      return;
     }

   if(EsCompra)
     {
      if(InfoAccount.FreeMarginCheck(Symbol(),ORDER_TYPE_BUY,lote,SymbolInfoDouble(Symbol(),SYMBOL_ASK))<0)
        {
         Print("No puede operar porque se opero sin margen disponible para poner operaciones con lote ",lote);
         return;
        }


      double stopLoss_=stopLoss==0?0:SymbolInfoDouble(Symbol(),SYMBOL_ASK)-stopLoss*Point();
      double takeProfit_=takeProfit==0?0:SymbolInfoDouble(Symbol(),SYMBOL_ASK)+takeProfit*Point();

      if(!trade.Buy(lote,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_ASK),stopLoss_,takeProfit_,comentario))
         Print("No opero buy error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
   else
     {
      if(InfoAccount.FreeMarginCheck(Symbol(),ORDER_TYPE_SELL,lote,SymbolInfoDouble(Symbol(),SYMBOL_BID))<0)
        {
         Print("No puede operar porque se opero sin margen disponible para poner operaciones con lote ",lote);
         return;
        }

      double stopLoss_=stopLoss==0?0:SymbolInfoDouble(Symbol(),SYMBOL_BID)+stopLoss*Point();
      double takeProfit_=takeProfit==0?0:SymbolInfoDouble(Symbol(),SYMBOL_BID)-takeProfit*Point();

      if(!trade.Sell(lote,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_BID),stopLoss_,takeProfit_,comentario))
         Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Funcion_Trailing()
  {
   uint DiferenciaStep=TrailingStart-TrailingInit+TrailingStep;
   uint Diferencia=TrailingStart-TrailingInit;

   bool modifico=false;

   for(int cnt=PositionsTotal()-1; cnt>=0; cnt--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      if(!PositionSelectByTicket(PositionGetTicket(cnt))) // SE SELECCIONA CADA ORDEN PARA PODER EVALUAR (si no se selecciona no se evalua)
         continue;
      if(PositionGetInteger(POSITION_MAGIC)==MagicNumber && PositionGetString(POSITION_SYMBOL)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
         //donde esta el experto.. entonces no lo evalua
        {
         long Ticket=PositionGetInteger(POSITION_TICKET);
         long Tipo=PositionGetInteger(POSITION_TYPE);
         double current=PositionGetDouble(POSITION_PRICE_CURRENT);
         double sl=PositionGetDouble(POSITION_SL);
         double tp=PositionGetDouble(POSITION_TP);
         double open=PositionGetDouble(POSITION_PRICE_OPEN);

         if(Tipo==POSITION_TYPE_BUY && (NormalizeDouble(current-DiferenciaStep*Point(),Digits())>sl || sl==0) && NormalizeDouble(current-TrailingStart*Point(),Digits())>open)
            if(!trade.PositionModify(Ticket,NormalizeDouble(current-Diferencia*Point(),Digits()),PositionGetDouble(POSITION_TP)))
              {
               Print("Error al modificar SL ",GetLastError()," code ",trade.ResultRetcode());
               Print("Procede a cerrar");
               ResetLastError();
               if(Cerrar_si_falla)
                 {
                  Print("Procede a cerrar");
                  if(!trade.PositionClose(PositionGetInteger(POSITION_TICKET),-1))
                     Print("Error al cerrar la orden SELL ",GetLastError());
                 }
              }
            else
               modifico= true;

         if(Tipo==POSITION_TYPE_SELL  && (NormalizeDouble(current+DiferenciaStep*Point(),Digits())<sl || sl==0) && NormalizeDouble(current+TrailingStart*Point(),Digits())<open)
            if(!trade.PositionModify(Ticket,NormalizeDouble(current+Diferencia*Point(),Digits()),PositionGetDouble(POSITION_TP)))
              {
               Print("Error al modificar SL ",GetLastError()," code ",trade.ResultRetcode());
               Print("Procede a cerrar");
               ResetLastError();
               if(Cerrar_si_falla)
                 {
                  Print("Procede a cerrar");
                  if(!trade.PositionClose(PositionGetInteger(POSITION_TICKET),-1))
                     Print("Error al cerrar la orden SELL ",GetLastError());
                 }
              }
            else
               modifico= true;
        }
     }

   return modifico;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluarHorario(int Inicio, int Final, int MInicio, int MFinal, datetime TimeEvalua)
  {
   MqlDateTime tiempo;
   TimeToStruct(TimeEvalua,tiempo);

   int Minuto=tiempo.min;
   int Hora=tiempo.hour;

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
//|                                                                  |
//+------------------------------------------------------------------+
datetime CalcularTiempoStart()
  {
   MqlDateTime Inicio;

   if(Hora_Inicio>Hora_Final)
      TimeToStruct(TimeCurrent()-PeriodSeconds(PERIOD_D1),Inicio);
   else
      TimeToStruct(TimeCurrent(),Inicio);

   Inicio.sec=0;
   Inicio.min=0;
   Inicio.hour=Hora_Inicio;
   datetime TiempoInicio=StructToTime(Inicio);

   int BarInicio=iBarShift(Symbol(),PERIOD_H1,TiempoInicio,true);
   int Intentos=0;

   while(true && Intentos<5 && BarInicio==-1)
     {
      TiempoInicio=TiempoInicio-PeriodSeconds(PERIOD_D1);
      BarInicio=iBarShift(Symbol(),PERIOD_H1,TiempoInicio,true);
      Intentos++;
     }

   TiempoInicio=TiempoInicio+PeriodSeconds(PERIOD_M1)*Minuto_Inicio;


   return TiempoInicio;
  }
//+------------------------------------------------------------------+
bool VLineCreate(const long            chart_ID=0,        // chart's ID
                 const string          name="VLine",      // line name
                 const int             sub_window=0,      // subwindow index
                 datetime              time=0,            // line time
                 const color           clr=clrRed,        // line color
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // line style
                 const int             width=1,           // line width
                 const bool            back=false,        // in the background
                 const bool            selection=true,    // highlight to move
                 const bool            hidden=true,       // hidden in the object list
                 const long            z_order=0)         // priority for mouse click
  {
//--- if the line time is not set, draw it via the last bar
   if(!time)
      time=TimeCurrent();
//--- reset the error value
   ResetLastError();
//--- create a vertical line
   if(!ObjectCreate(chart_ID,name,OBJ_VLINE,sub_window,time,0))
     {
      Print(__FUNCTION__,
            ": failed to create a vertical line! Error code = ",GetLastError());
      return(false);
     }
//--- set line color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set line display style
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- set line width
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of moving the line by mouse
//--- when creating a graphical object using ObjectCreate function, the object cannot be
//--- highlighted and moved by default. Inside this method, selection parameter
//--- is true by default making it possible to highlight and move the object
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- hide (true) or display (false) graphical object name in the object list
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- set the priority for receiving the event of a mouse click in the chart
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- successful execution
   return(true);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime CalcularTiempoEnd()
  {
   MqlDateTime Final;

   TimeToStruct(TimeCurrent(),Final);

   Final.sec=0;
   Final.min=0;
   Final.hour=Hora_Final;
   datetime TiempoFinal=StructToTime(Final);

   int BarFinal=iBarShift(Symbol(),PERIOD_H1,TiempoFinal,true);
   int Intentos=0;

   while(true && Intentos<5 && BarFinal==-1)
     {
      TiempoFinal=TiempoFinal-PeriodSeconds(PERIOD_D1);
      BarFinal=iBarShift(Symbol(),PERIOD_H1,TiempoFinal,true);
      Intentos++;
     }

   TiempoFinal=TiempoFinal+PeriodSeconds(PERIOD_M1)*Minuto_Final;

   return TiempoFinal;
  }
//+------------------------------------------------------------------+
