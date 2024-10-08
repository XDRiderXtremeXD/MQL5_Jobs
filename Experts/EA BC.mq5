//+------------------------------------------------------------------+
//|                                                EA INDICATORS.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;

////////////////////////ACA MODIFICAS EL TIEMPO LIMITADO PARA OTRA CUENTA QUE NO SEA TUYA/////////////////
/////////////////// AÑO.MES.DIA HORA:MINUTO///////////////////
datetime Tiempo_Limite=D'2020.10.30 00:00';
double CuentaCompartida= 233223424;
////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

///LUEGO LO COMPILAS, UNA VEZ COMPILADO LE MANDAS SOLO EL ARCHIVO .ex5 No mandes el archivo .mq5

////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

///////////////////////// CUENTAS SIN LIMITE ///////////////////////////////
////////////////////////////////////////////////////////////////////////
double Cuentas[7]= {61419631,30259343,30607936,613774175,61357054};
////////////////////////////////////////////////////////////////////////

enum TipoOperacion
  {
   Buy=0,
   Sell=1,
   Buy_y_Sell=2,//Buy y Sell
  };


input string S0="************* INDICATOR ENTRY POINTS PRO *********************";//***************************************
input string nameIndicator="BC-Spike_Detector";//Name Indicator
input int AllBars=1243602;//AllBars: How many bars to calculate on, 0 -all
input int Outstup=30;//Outstup: Percentage distance to consider new low/high.
input int Period_=9;//Period: Number of bars to seek high/low on.
input string S7="************* SETTING EA *********************";//***************************************
input TipoOperacion Tipo=Buy_y_Sell;
input uint Velas_Espera=3;
input string S8="=== Trades===";//------------>
input bool Martingala=true;
input double Multiplicador=2;
input string S9="=== Trades===";//------------>
input double Lote=0.01;
input uint SL=100;//SL Puntos (0 disable)
input uint TP=100;//TP Puntos (0 disable)
input int MagicNumber=22222;
/*
input string S11="=== BE Y TS===";//------------>
input bool Activar_TS=true;//Activar Trailing Stop
input uint TS_Start_=200;//TS Start (Puntos)
input uint TS_Stop_=100;//TS Stop (Puntos)
input uint TS_Step_=10;//TS Step (Puntos)
input bool Activar_BE=true;//Activar BreakEven
input uint BE_Distancia=100;//BreakEven (Puntos)
*/


int handle_bc_spike=0;
int handle_EMA;

double EMA[];
double BC[];//1
double Close[];
uint wait=0;

bool password_status=false;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   password_status=false;
   if(!ControlCuentaOnInit())
      return INIT_FAILED;


   handle_bc_spike=iCustom(Symbol(),PERIOD_CURRENT,nameIndicator,AllBars,Outstup,Period_);
   handle_EMA = iMA(Symbol(),PERIOD_CURRENT,100,0,MODE_EMA,PRICE_CLOSE);
   wait=MathMax(Velas_Espera+2,3);

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   if(INVALID_HANDLE==handle_bc_spike)
     {
      Alert("BC SIGNALS MAL CONFIGURADO");
      return INIT_PARAMETERS_INCORRECT;
     }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   ArraySetAsSeries(BC,true);
   ArraySetAsSeries(Close,true);
   ArraySetAsSeries(EMA,true);

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   trade.SetExpertMagicNumber(MagicNumber);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Comment("");
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   if(!ControlCuentaOnTick())
      ExpertRemove();
   CopyBuffer(handle_EMA,0,0,1,EMA);

   string Comentario="";
   static int BARS=iBars(Symbol(),PERIOD_CURRENT);
   int BarsActual=iBars(Symbol(),PERIOD_CURRENT);

   if(BARS!=BarsActual)
     {
      for(int i=0; i<1; i++)
        {
         if(BarsCalculated(handle_bc_spike)!=BarsActual)
            continue;

         if(CopyBuffer(handle_bc_spike,0,0,wait,BC)<=0)
            continue;

         if(CopyClose(Symbol(),PERIOD_CURRENT,0,wait,Close)<=0)
            continue;

         bool BC_bool=(BC[Velas_Espera]!=EMPTY_VALUE && BC[Velas_Espera]!=0);

         if(BC_bool)
           {
            if(Tipo==Buy_y_Sell && EMA[0] > SymbolInfoDouble(Symbol(),SYMBOL_BID))
               if(Close[Velas_Espera]<BC[Velas_Espera])
                  if(Evaluar_1_tipo_Operacion(false))
                     SELL(SL,TP,Lote);
            if(Tipo==Buy_y_Sell  && EMA[0] < SymbolInfoDouble(Symbol(),SYMBOL_ASK))
               if(Close[Velas_Espera]>BC[Velas_Espera])
                  if(Evaluar_1_tipo_Operacion(true))
                     BUY(SL,TP,Lote);
           }

         BARS=BarsActual;
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BUY(int SL_,int TP_,double Lote_P)
  {
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double TakeProfit=TP_==0?0:Ask+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*TP_;
   double StopLoss=SL_==0?0:Ask-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*SL_;
   Lote_P=Lote_P*(MathPow(Multiplicador,OperacionesPerdidas(true)));
   
   if(ControlLote(Lote_P))
     {

      if(trade.Buy(Lote_P,Symbol(),Ask,StopLoss,TakeProfit,"EA Indicators"))
        {
         ulong Ticket=trade.ResultDeal();
         Print(" Ticket Transaccion:"+string(Ticket)+" Ticket Orden:"+string(trade.ResultOrder())+" Ejecuto con Codigo"+string(trade.ResultRetcode()));
        }
      else
         Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SELL(int SL_,int TP_,double Lote_P)
  {
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double TakeProfit=TP_==0?0:Bid-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*TP_;
   double StopLoss=SL_==0?0:Bid+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*SL_;
   Lote_P=Lote_P*(MathPow(Multiplicador,OperacionesPerdidas(false)));

   if(ControlLote(Lote_P))
     {
      if(trade.Sell(Lote_P,Symbol(),Bid,StopLoss,TakeProfit,"EA Indicators"))
        {
         ulong Ticket=trade.ResultDeal();
         Print(" Ticket Transaccion:"+string(Ticket)+" Ticket Orden:"+string(trade.ResultOrder())+" Ejecuto con Codigo"+string(trade.ResultRetcode()));
        }
      else
         Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ControlCuentaOnInit()
  {
   Comment("Cargando Numero Cuenta...");
   Sleep(1000);

   long account = AccountInfoInteger(ACCOUNT_LOGIN);

   printf("Account number =  %d", account);

   for(int i=0; i<ArraySize(Cuentas); i++)
      if(account == Cuentas[i])
        {
         password_status = true;
         Print("EA account verified");
         Comment("");
         break;
        }
///////////////////////Cuenta del desarrollador////////////////////
   if(account==2303919)//51055646
     {
      password_status=true;
      Comment("LICENCIA HABILITADA - ESPECIAL DESARROLLADOR");
     }
/////////////////////////////////////////////////////////////////

   if(password_status == false)
     {
      if(CuentaCompartida!=account)
        {
         Alert("Cuenta No Habilitada");
         return false;
        }
      else
         Comment("Licencia con tiempo limite Hasta ",TimeToString(Tiempo_Limite,TIME_DATE|TIME_MINUTES));
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ControlCuentaOnTick()
  {
   if(!password_status)
     {
      static bool Alerta=true;
      if(TimeCurrent()>Tiempo_Limite)
        {
         if(Alerta)
           {
            Alert("Tiempo limite superado, comuniquese con el proveedor ");
            Alerta=false;
           }
         return false;
        }
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*
void Funcion_Trailing_BE(bool TS,bool BE,int Breakeven,int Start,int Init,int Step)
  {
//REFERENCIA OPEN PRICE (TS STOP)
   uint menor_cantidad=Start-Init+Step;
   uint Diferencia=Start-Init;//**


   int Posiciones=PositionsTotal();

   for(int cnt=Posiciones-1; cnt>=0; cnt--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong ticket=0;
      if((ticket=PositionGetTicket(cnt))!=0)
        {


         ENUM_POSITION_TYPE Type=ENUM_POSITION_TYPE(PositionGetInteger(POSITION_TYPE));
         double Open=PositionGetDouble(POSITION_PRICE_OPEN);
         double Pos_SL=PositionGetDouble(POSITION_SL);
         double Pos_TP=PositionGetDouble(POSITION_TP);
         double Pos_Price=PositionGetDouble(POSITION_PRICE_CURRENT);
         string Simbolo=PositionGetString(POSITION_SYMBOL);
         long MgNumber=PositionGetInteger(POSITION_MAGIC);

         if(MgNumber!=MagicNumber || Simbolo!=Symbol())
            continue;

         if(BE && Breakeven>0)
           {
            //BE Funcion
            if(Type==POSITION_TYPE_BUY && (Pos_SL<Open || Pos_SL==0) && Pos_Price-Breakeven*Point()>=Open)  //Si Operacion es un BUY y Breakeven>0 y StopLoss No esta en Precio de Entrada y El precio supera el Precio establecido para el BE
               if(trade.PositionModify(ticket,Open,Pos_TP))
                 {
                  ulong Ticket=trade.ResultDeal();
                  Print(" Ticket BE Transaccion:"+string(Ticket)+" Ticket Orden:"+string(trade.ResultOrder())+" Ejecuto con Codigo"+string(trade.ResultRetcode()));
                 }
               else
                  Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));

            if(Type==POSITION_TYPE_SELL && (Pos_SL>Open || Pos_SL==0) && Pos_Price+Breakeven*Point()<=Open)
               if(trade.PositionModify(ticket,Open,Pos_TP))
                 {
                  ulong Ticket=trade.ResultDeal();
                  Print(" Ticket BE Transaccion:"+string(Ticket)+" Ticket Orden:"+string(trade.ResultOrder())+" Ejecuto con Codigo"+string(trade.ResultRetcode()));
                 }
               else
                  Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
           }

         if(TS)
           {
            if(Type==POSITION_TYPE_BUY && (NormalizeDouble(Pos_Price-menor_cantidad*Point(),Digits())>=Pos_SL || Pos_SL==0) && NormalizeDouble(Pos_Price-Start*Point(),Digits())>=Open)
               if(trade.PositionModify(ticket,NormalizeDouble(Pos_Price-Diferencia*Point(),Digits()),Pos_TP))
                 {
                  ulong Ticket=trade.ResultDeal();
                  Print(" Ticket TS Transaccion:"+string(Ticket)+" Ticket Orden:"+string(trade.ResultOrder())+" Ejecuto con Codigo"+string(trade.ResultRetcode()));
                 }
               else
                  Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));



            if(Type==POSITION_TYPE_SELL  && (NormalizeDouble(Pos_Price+menor_cantidad*Point(),Digits())<=Pos_SL || Pos_SL==0) && NormalizeDouble(Pos_Price+Start*Point(),Digits())<=Open)
               if(trade.PositionModify(ticket,NormalizeDouble(Pos_Price+Diferencia*Point(),Digits()),Pos_TP))
                 {
                  ulong Ticket=trade.ResultDeal();
                  Print(" Ticket TS Transaccion:"+string(Ticket)+" Ticket Orden:"+string(trade.ResultOrder())+" Ejecuto con Codigo"+string(trade.ResultRetcode()));
                 }
               else
                  Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
           }
        }
     }
  }
//+------------------------------------------------------------------+
*/


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OperacionesPerdidas(bool IsBuy)
  {

   double ProfitTotal=0;
//--- request trade history
   HistorySelect(0,TimeCurrent());
//--- create objects
   int     total=HistoryDealsTotal();
   ulong    ticket=0;
//--- for all deals
   int operaciones=0;


   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         double profit=(double)HistoryDealGetDouble(ticket,DEAL_PROFIT);
         string symbol=(string)HistoryDealGetString(ticket,DEAL_SYMBOL);
         long type=HistoryDealGetInteger(ticket,DEAL_TYPE);

         if((type==DEAL_TYPE_SELL && IsBuy==true) || (type==DEAL_TYPE_BUY && IsBuy==false))
            if(MagicNumber==Magic && Symbol()==symbol)
               if(entry==DEAL_ENTRY_OUT)
                 {
                  Print(profit);
                  Print(TimeToString(HistoryDealGetInteger(ticket,DEAL_TIME),TIME_DATE|TIME_MINUTES));
                  if(profit>0)
                     break;
                  operaciones++;
                 }
         //}
        }
     }
   return operaciones;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ControlLote(double &Lote_)
  {

   double LoteEvalua=Lote_/SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
   if(LoteEvalua-((int)LoteEvalua)>0)
     {
      Lote_=int(LoteEvalua)*SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
     }

   if(Lote_<SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN))
     {
      Lote_=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN);
      return true;
     }

   if(Lote_>SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX))
     {
      Lote_=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX);
      return true;
     }

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Evaluar_1_tipo_Operacion(bool IsBuy)
  {
   int Posiciones=PositionsTotal();

   for(int cnt=Posiciones-1; cnt>=0; cnt--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong ticket=0;
      if((ticket=PositionGetTicket(cnt))!=0)
        {

         if(MagicNumber==PositionGetInteger(POSITION_MAGIC) && PositionGetString(POSITION_SYMBOL)==Symbol())
           {
            if(IsBuy)
              {
               if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
                  return false;
              }
            else
              {
               if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
                  return false;
              }
           }
        }
     }
   return true;
  }
//+------------------------------------------------------------------+
