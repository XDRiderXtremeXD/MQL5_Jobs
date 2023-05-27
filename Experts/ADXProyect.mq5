//+------------------------------------------------------------------+
//|                                                   ADXProyect.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"


#include<Trade\Trade.mqh>
CTrade trade;

enum Tipo_Ejecucion
  {
   Vela_Actual=0,
   Vela_Cerrada=1,
  };

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12pm=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };


input Tipo_Ejecucion Tipo_Entrada=Vela_Cerrada;
input string S1="------------ Configuracion Lote ----";//-------------------------------
input double Lote=0.01;//Lote por cada (x)
input double Cada=1000;//Cada
input string Horario="------------ Horario ------------";///******************************************************************************************************************************
input bool Filtro_Horario=true;
input ENUM_Horas  Hora_Inicio=_0am;
input ENUM_Horas Hora_Final=_9am;
input string S2="---- Configuracion STOP ----";//-------------------------------
input int Porcentaje_Stop=0;// Porcentaje STOP(Balance Inicio Dia) (disable 0)
input string S3_="------------ Configuracion TrailingStop ----";//-------------------------------
input bool Activar_Trailing=true;
input double TS=0.5;//Porcentaje Trail
input int X_trail=200;//Mover cada X puntos
input string S3="------------ Configuracion Trade ----";//-------------------------------
input double TP=0.5;// Porcentaje TP (disable = 0)
input double SL=0.5;// Porcentaje SL (disable = 0)
input int MagicNumb=22222;
input string S4="------------ Configuracion ADX ----";//-------------------------------
input int ADX_Period=14;
input int Nivel_ADX_Principal=15;//ADX Principal encima del Nivel       ======>
input int Nivel_ADX_Secundario=20;//ADX Secundario traspaso del Nivel   ======>
input string S5="------------ Configuracion EMA ----";//-------------------------------
input bool Filtro_EMA=true;
input int MA_Period=200;
input int MA_Shift=0;
input ENUM_MA_METHOD MA_MODE=MODE_SMA;
input ENUM_APPLIED_PRICE MA_APP=PRICE_CLOSE;
input string S6="------------ Configuracion Filtro Ascendente ----";//-------------------------------
input bool Activar_Filtro_Ascendente=true;
input int Velas_Anteriores_Evaluadas=1;



int Handle_MA=0;
int Handle_ADX=0;

double ADX_plus[];
double ADX_minus[];
double ADX[];

double MA[];

datetime TimeStop=0;
bool Activo=true;

datetime Tiempo=0;


//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(Hora_Inicio==Hora_Final)
     {
      Alert("Hora Inicio debe ser diferente a Hora Final");
      return INIT_PARAMETERS_INCORRECT;
     }


   Activo=true;

   Handle_MA=iMA(Symbol(),PERIOD_CURRENT,MA_Period,MA_Shift,MA_MODE,MA_APP);
   Handle_ADX=iADX(Symbol(),PERIOD_CURRENT,ADX_Period);

   if(Handle_MA==INVALID_HANDLE)
     {
      Alert("MA MAL CONFIGURADO");
      return  INIT_FAILED;
     }

   if(Handle_ADX==INVALID_HANDLE)
     {
      Alert("ADX MAL CONFIGURADO");
      return  INIT_FAILED;
     }


   trade.SetExpertMagicNumber(MagicNumb);

   TesterHideIndicators(false);

   ArraySetAsSeries(ADX,true);
   ArraySetAsSeries(ADX_minus,true);
   ArraySetAsSeries(ADX_plus,true);
   ArraySetAsSeries(MA,true);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {


  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   if(Activar_Trailing)
      Trailing();


   double BalanceInicial=BalanceInicial();

   double PerdidaMaxima=BalanceInicial*Porcentaje_Stop/100.0;

   string Comentario="";
   if(!Activo)
      Comentario=Comentario+"\nTiempo para Reiniciar(24H): "+TimeToString(TimeStop,TIME_DATE|TIME_MINUTES);
   else
      Comentario="Balance Inicial Diaria : "+DoubleToString(BalanceInicial,2)+" Perdida para Parar :"+DoubleToString(PerdidaMaxima,2)+" Estado del Bot "+(Activo?"Activo":"Desactivo");
   Comment(Comentario);

   if(Porcentaje_Stop>0 && Activo && BalanceInicial-PerdidaMaxima>AccountInfoDouble(ACCOUNT_BALANCE))
     {
      Activo=false;
      TimeStop=TimeCurrent()+PeriodSeconds(PERIOD_D1);
     }
   if(!Activo)
     {
      if(TimeStop<TimeCurrent())
         Activo=true;
     }

   bool Carga=true;

   int Velas=MathMax(3,Velas_Anteriores_Evaluadas+2);

   if(CopyBuffer(Handle_ADX,0,0,3,ADX)<=0)
      Carga=false;
   if(CopyBuffer(Handle_ADX,1,0,Velas,ADX_plus)<=0)
      Carga=false;
   if(CopyBuffer(Handle_ADX,2,0,Velas,ADX_minus)<=0)
      Carga=false;
   if(CopyBuffer(Handle_MA,0,0,3,MA)<=0)
      Carga=false;
      
      
      Comment(ADX_plus[0]," " ,ADX_minus[0]);

//if(iTime(Symbol(),PERIOD_CURRENT,0)==D'2022.01.03 09:57')
// Print(RSI_UP[1]," ",RSI_DN[1]);

   if(Carga)
      if(ComprobarHorario(Hora_Inicio,Hora_Final))
         if(Tiempo!=iTime(Symbol(),PERIOD_CURRENT,0))
           {
            if(FiltrarAscendente(true,ADX_plus,ADX_minus))
               if(ADX_plus[Tipo_Entrada]>Nivel_ADX_Secundario && ADX_plus[Tipo_Entrada+1]<Nivel_ADX_Secundario && ADX[Tipo_Entrada]>Nivel_ADX_Principal && (!Filtro_EMA || MA[Tipo_Entrada]>iClose(Symbol(),PERIOD_CURRENT,0)))
                 {
                  // if(iTime(Symbol(),PERIOD_CURRENT,0)==D'2022.01.03 09:57')
                  //Print("Entra");

                  Buy(Activo);
                  Tiempo=iTime(Symbol(),PERIOD_CURRENT,0);
                 }
            if(FiltrarAscendente(false,ADX_plus,ADX_minus))
               if(ADX_minus[Tipo_Entrada]>Nivel_ADX_Secundario && ADX_minus[Tipo_Entrada+1]<Nivel_ADX_Secundario && ADX[Tipo_Entrada]>Nivel_ADX_Principal && (!Filtro_EMA || MA[Tipo_Entrada]<iClose(Symbol(),PERIOD_CURRENT,0)))
                 {
                  Sell(Activo);
                  Tiempo=iTime(Symbol(),PERIOD_CURRENT,0);
                 }
           }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Buy(bool Actividad)
  {
   int TotalPosiciones=PositionsTotal();
   bool HayBuy=false;
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);

      if(PositionGetInteger(POSITION_MAGIC)!=MagicNumb)
         continue;

      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
        {
         HayBuy=true;
        }
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
         HayBuy=true;
     }
   if(Actividad)
     {
      if(!HayBuy)
        {

         double Calculo= int(AccountInfoDouble(ACCOUNT_BALANCE)/Cada);
         Calculo=Calculo*Lote;
         if(Calculo>SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
            Calculo=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);

         if(Calculo>=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
           {
            double Entrada=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
            int TP_C=CalcularTP(Calculo,Entrada);
            int SL_C=CalcularSL(Calculo,Entrada);
            // int TS_C=CalcularTS(Calculo,Entrada);
            Print("TP ",TP_C," SL: ",SL_C);
            if((TP_C>=5 || TP==0) && (SL_C>=5 || SL==0))
              {
               double SL_=NormalizeDouble(Entrada-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*SL_C,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
               double TP_=NormalizeDouble(Entrada+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*TP_C,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
               bool Trade=trade.Buy(Calculo,Symbol(),Entrada,SL==0?0:SL_,TP==0?0:TP_,"EXPERT RSI");
               if(!Trade)
                  Print("ERROR al poner BUY ",trade.ResultRetcode());
              }
            else
               Print("ERROR TP O SL , Calculo menor que 4 puntos "+"TP: "+IntegerToString(TP_C)+" SL: "+IntegerToString(SL_C));
           }
         else
            Print("No hay suficiente balance para poner un Lote correcto");

        }
      else
         Print("HAY UN BUY ACTIVO por eso no ejecuta otro BUY");
     }
   else
      Print("Pudo ejecutar BUY pero Experto esta deshabilitado");
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Sell(bool Actividad)
  {
   int TotalPosiciones=PositionsTotal();
   bool HaySell=false;
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);

      if(PositionGetInteger(POSITION_MAGIC)!=MagicNumb)
         continue;

      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
        {
         HaySell=true;
        }
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
         HaySell=true;
     }

   if(Actividad)
     {
      if(!HaySell)
        {
         double Calculo= int(AccountInfoDouble(ACCOUNT_BALANCE)/Cada);
         Calculo=Calculo*Lote;
         if(Calculo>SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
            Calculo=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);


         if(Calculo>=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
           {
            double Entrada=SymbolInfoDouble(Symbol(),SYMBOL_BID);

            int TP_C=CalcularTP(Calculo,Entrada);
            int SL_C=CalcularSL(Calculo,Entrada);
            // int TS_C=CalcularTS(Calculo,Entrada);
            //Print("TP ",TP_C," SL: ",SL_C);
            if((TP_C>=5 || TP==0) && (SL_C>=5 || SL==0))
              {
               double SL_=NormalizeDouble(Entrada+SymbolInfoDouble(Symbol(),SYMBOL_POINT)*SL_C,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
               double TP_=NormalizeDouble(Entrada-SymbolInfoDouble(Symbol(),SYMBOL_POINT)*TP_C,(int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS));
               bool Trade=trade.Sell(Calculo,Symbol(),Entrada,SL==0?0:SL_,TP==0?0:TP_,"EXPERT RSI");
               if(!Trade)
                  Print("ERROR al poner SELL ",trade.ResultRetcode());
              }
            else
               Print("ERROR TP O SL , Calculo menor que 4 puntos "+"TP: "+IntegerToString(TP_C)+" SL: "+IntegerToString(SL_C));
           }
         else
            Print("No hay suficiente balance para poner un Lote correcto");

        }
      else
         Print("HAY UN SELL ACTIVO por eso no ejecuta otro SELL");
     }
   else
      Print("Pudo ejecutar SELL pero Experto esta deshabilitado");
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CalcularTP(double Calculo,double Precio)
  {
   int TP_=int((Precio*(TP/100.0))/Point());

   return TP_;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CalcularTS(double Calculo,double Precio)
  {
   int TS_=int((Precio*(TS/100.0))/Point());

   return TS_;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CalcularSL(double Calculo,double Precio)
  {
   int SL_=int((Precio*(SL/100.0))/Point());

   return SL_;
  }


//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double BalanceInicial()
  {
   double ProfitTotal=0;
//--- request trade history
   HistorySelect(iTime(Symbol(),PERIOD_D1,0),TimeCurrent());
//--- create objects
   int     total=HistoryDealsTotal();
   ulong    ticket=0;
//--- for all deals
   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         // int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         double Profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         //string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);

         if(entry==DEAL_ENTRY_OUT || entry==DEAL_ENTRY_IN)
           {
            Profit=Profit+Comision+Swap;
            ProfitTotal=Profit+ProfitTotal;
           }
        }
      //}
     }
   return AccountInfoDouble(ACCOUNT_BALANCE)-ProfitTotal;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  Trailing()
  {
   int TotalPosiciones=PositionsTotal();
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket!=0)
        {
         if(PositionGetInteger(POSITION_MAGIC)!=MagicNumb)
            continue;

         //if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
         //{
         double SL_=PositionGetDouble(POSITION_SL);
         double Entrada=PositionGetDouble(POSITION_PRICE_OPEN);
         double Precio=PositionGetDouble(POSITION_PRICE_CURRENT);
         double TP_=PositionGetDouble(POSITION_TP);
         double StopLoss=0;
         int PuntosTS=CalcularTS(1,Entrada);
         double POINT=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_POINT);

         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
           {
            double TRAIL_START=NormalizeDouble(Entrada+PuntosTS*POINT,Digits());

            double Distancia_alpha=TRAIL_START-Entrada-2*X_trail*Point();
            if(Distancia_alpha<0)
               Distancia_alpha=0;

            if(Precio>=TRAIL_START)
              {

               if(SL_<Entrada || SL_==0)
                  StopLoss=Entrada;
               else
                  if(SL_!=0)
                    {
                     if(Precio-SL_-Distancia_alpha>=2*X_trail*Point())
                        StopLoss=SL_+X_trail*Point();
                    }
               if((SL_==0 || (StopLoss!=SL_&& SL_<StopLoss))  && StopLoss!=0)
                 {
                  //Print(Distancia_alpha);
                  //Print("BUY  SL en: ",StopLoss);
                  trade.PositionModify(Ticket,StopLoss,TP_);
                 }

              }
           }


         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
           {
            double TRAIL_START=NormalizeDouble(Entrada-PuntosTS*POINT,Digits());

            double Distancia_alpha=MathAbs(TRAIL_START-Entrada)-2*X_trail*Point();
            if(Distancia_alpha<0)
               Distancia_alpha=0;

            if(Precio<=TRAIL_START)
              {

               if(SL_>Entrada || SL_==0)
                  StopLoss=Entrada;
               else
                  if(SL_!=0)
                    {
                     if(MathAbs(Precio-SL_)-Distancia_alpha>=2*X_trail*Point())
                        StopLoss=SL_-X_trail*Point();
                    }
               if((SL_==0 || (StopLoss!=SL_&& SL_>StopLoss))  && StopLoss!=0)
                 {
                  // Print(Distancia_alpha);
                  //Print("SELL  SL en: ",StopLoss);
                  trade.PositionModify(Ticket,StopLoss,TP_);
                 }

              }
           }


        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ComprobarHorario(int Inicio,int Final)
  {

   if(!Filtro_Horario)
      return true;

   MqlDateTime tiempo;
   TimeToStruct(TimeCurrent(),tiempo);


   if(Inicio<Final)
     {
      if(!(tiempo.hour>=Inicio && tiempo.hour<Final))
         return false;
     }
   else
     {
      if(!(tiempo.hour>=Inicio || tiempo.hour<Final))
         return false;
     }
   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltrarAscendente(bool isBuy,double &plus[],double &minus[])
  {
   if(!Activar_Filtro_Ascendente)
      return true;



   for(int i=0; i<Velas_Anteriores_Evaluadas; i++)
     {
      if(isBuy)
        {
         if(plus[i+Tipo_Entrada]<plus[i+1+Tipo_Entrada])
            return false;
        }
      else
        {
         if(minus[i+Tipo_Entrada]<minus[i+1+Tipo_Entrada])
            return false;
        }
     }
     return true;
  }
//+------------------------------------------------------------------+
