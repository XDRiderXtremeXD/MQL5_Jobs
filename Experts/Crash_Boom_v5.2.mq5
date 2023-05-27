//+------------------------------------------------------------------+
//|                                                   Crash_Boom.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// LIBRERIA PARA GENERAR UNA ORDEN (SELL, BUY, BUY_STOP, ETC)
#include<Trade\Trade.mqh>
CTrade trade;

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12am=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

enum MODO
  {
   UP=0,
   DOWN=1,
  };

enum Modo_CG
  {
   Reinicio_Automatico=0,
   Cierre_Total=1,
  };

input string S1="------------------ CONFIGURACION EXPERTO ------------------";
input double Close_All_Profit=0.25;
MODO Modo_Operacion=UP; // Direccion Herramienta Financiera
input int Entrar_Barra=4;// Entrar en la (X) Barra Positivo
input int Maximas_Operaciones_Normales=5;
input double Lotes=0.2;
input double SL=0; //Stop Loss (in pips)
input double TP=0; //Take Profit (in pips)
input int Trailing_Stop=0;// Trailing Stop (in pips)
input int Trailing_Step=0;// Trailing Step (in pips)
input int Gap=1000;//Gap in pips
input ENUM_TIMEFRAMES Time_Frame=PERIOD_CURRENT;
input int Magic_Number=2222222;
input string CommentExpert="Experto Crash Boom";
input string S2="------------------ CONFIGURACION OPERACIONES CONTRARIAS ------------------";
input bool Habilitar_Operaciones_Contrarias=true; // Habilitar Operaciones Contrarias
input int Entrar_Barra_Contraria=4;// Entrar en la (X) Barra Positivo
input int Maximas_Operaciones_Contrarias=5;
input double Lotes_2=0.2; // Lotes
input double SL_2=0; //Stop Loss (in pips)
double TP_2=0; //Take Profit (in pips)
input string S3="------------------ CONFIGURACION CIERRE EXPERTO POR GANANCIA ------------------";
input bool Activar_Cierre_Experto=false;
input Modo_CG Modo_Cierre_Ganancia=Reinicio_Automatico;
input double Ganancia=100;
input ENUM_Horas Hora_Reinicio=_0am;// Hora Reinicio(Si es Reinicio Automatico)
input string S4="------------------ CONFIGURACION MANEJO DE FLOTANTE------------------";
input bool Manejo_Flotante_=true; // Activar Cierre por Maximo Flotante
input int Maximo_Cierre=1;//Cierre Maximo
input double FlotanteMaximo=100;//Flotante Maximo
input string S5="------------------ CONFIGURACION MANEJO DE TENDENCIA-----------------";
input string Nombre_Indicador="Peace";
input bool Filtro_Trend_1=false;
input ENUM_TIMEFRAMES Periodo_Filtro_1=PERIOD_CURRENT;
input bool Filtro_Trend_2=false;
input ENUM_TIMEFRAMES Periodo_Filtro_2=PERIOD_H1;
input bool Filtro_Trend_3=false;
input ENUM_TIMEFRAMES Periodo_Filtro_3=PERIOD_H4;

int Filtro_1,Filtro_2,Filtro_3;

double BALANCE_EMPIEZA=0;

int OrdenesNormales=0;
int OrdenesContrarias=0;

int Entrar_Barra_Rates=0;
bool Horario_Desabilitado=false;

double Filtro_1_BUY[],Filtro_1_SELL[],Filtro_2_BUY[],Filtro_2_SELL[], Filtro_3_BUY[],Filtro_3_SELL[];



MqlRates rates[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   Horario_Desabilitado=false;

   if(StringFind(Symbol(),"Crash",0)!=-1)
      Modo_Operacion=UP;
   else
      if(StringFind(Symbol(),"Boom",0)!=-1)
         Modo_Operacion=DOWN;
      else
        {
         Alert("Simbolo no es Crash ni boom");
         return INIT_FAILED;
        }

   trade.SetExpertMagicNumber(Magic_Number);
   ArraySetAsSeries(rates,true);

   BALANCE_EMPIEZA=AccountInfoDouble(ACCOUNT_BALANCE);

   if(Entrar_Barra>Entrar_Barra_Contraria)
      Entrar_Barra_Rates=Entrar_Barra;
   else
      Entrar_Barra_Rates=Entrar_Barra_Contraria;

   Filtro_1=iCustom(Symbol(),Periodo_Filtro_1,Nombre_Indicador,false,false,false," ",false,clrNONE,clrNONE,16,"Impact",10,20);
   if(Filtro_1==INVALID_HANDLE)
     {
      Alert("INVALID HANDLE FILTRO 1 TREND");
      return INIT_FAILED;
     }

   Filtro_2=iCustom(Symbol(),Periodo_Filtro_2,Nombre_Indicador,false,false,false," ",false,clrNONE,clrNONE,16,"Impact",10,20);
   if(Filtro_2==INVALID_HANDLE)
     {
      Alert("INVALID HANDLE FILTRO 2 TREND");
      return INIT_FAILED;
     }

   Filtro_3=iCustom(Symbol(),Periodo_Filtro_3,Nombre_Indicador,false,false,false," ",false,clrNONE,clrNONE,16,"Impact",10,20);
   if(Filtro_3==INVALID_HANDLE)
     {
      Alert("INVALID HANDLE FILTRO 3 TREND");
      return INIT_FAILED;
     }

   ArraySetAsSeries(Filtro_1_BUY,true);
   ArraySetAsSeries(Filtro_1_SELL,true);
   ArraySetAsSeries(Filtro_2_BUY,true);
   ArraySetAsSeries(Filtro_2_SELL,true);
   ArraySetAsSeries(Filtro_3_BUY,true);
   ArraySetAsSeries(Filtro_3_SELL,true);


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

   MqlDateTime TimeCurrent_;
   TimeToStruct(TimeCurrent(),TimeCurrent_);

   if(Horario_Desabilitado==true && TimeCurrent_.hour==Hora_Reinicio)
     {
      BALANCE_EMPIEZA=AccountInfoDouble(ACCOUNT_BALANCE);
      Horario_Desabilitado=false;
     }


   if(AccountInfoDouble(ACCOUNT_EQUITY)-BALANCE_EMPIEZA>=Ganancia && Activar_Cierre_Experto && Horario_Desabilitado==false)
     {
      Alert("Ganancia Objetiva Obtenida ",DoubleToString(Ganancia,2),"$ Cierre del Experto");
      Close_All_Experto();

      if(Modo_Cierre_Ganancia==Cierre_Total)
         ExpertRemove();
      else
        {
         Horario_Desabilitado=true;
        }
     }


   if(Horario_Desabilitado==false)
     {

      if(Manejo_Flotante_)
         Manejo_Flotante();

      TrailingStop();
      static datetime prevTime=0;


      int copied=CopyRates(Symbol(),Time_Frame,0,Entrar_Barra_Rates+2,rates);

      double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
      double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

      CopyBuffer(Filtro_1,0,0,3,Filtro_1_BUY);
      CopyBuffer(Filtro_1,1,0,3,Filtro_1_SELL);
      CopyBuffer(Filtro_2,0,0,3,Filtro_2_BUY);
      CopyBuffer(Filtro_2,1,0,3,Filtro_2_SELL);
      CopyBuffer(Filtro_3,0,0,3,Filtro_3_BUY);
      CopyBuffer(Filtro_3,1,0,3,Filtro_3_SELL);
      
       Close_All_();
       
      if(prevTime!=rates[0].time)
        {         
         if(MathAbs(rates[1].close-rates[0].open)/Point()<=Gap)
           {
            if(Modo_Operacion==UP)
              {
               //if(rates[1].close<rates[1].open)
               Close_Velas_Contarias(true);

               Total_Posiciones(true);

               bool Condicion=true;
               for(int i=1; i<Entrar_Barra; i++)
                 {
                  if(rates[i].close<rates[i].open)
                    {
                     Condicion=false;
                     break;
                    }
                 }

               bool Condicion_EMA=true;
               if(Filtro_Trend_1 && Filtro_1_BUY[0]==EMPTY_VALUE)
                  Condicion_EMA=false;
               if(Filtro_Trend_2 && Filtro_2_BUY[0]==EMPTY_VALUE)
                  Condicion_EMA=false;
               if(Filtro_Trend_3 && Filtro_3_BUY[0]==EMPTY_VALUE)
                  Condicion_EMA=false;

               if(Condicion && Maximas_Operaciones_Normales>OrdenesNormales && Condicion_EMA)
                 {
                  double TP_=TP==0?0:Ask+TP*Point();
                  TP_=NormalizeDouble(TP_,Digits());
                  double SL_=SL==0?0:Bid-SL*Point();
                  SL_=NormalizeDouble(SL_,Digits());
                  // Operamos UP con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
                  bool BuyTradeBool=trade.Buy(Lotes,Symbol(),Ask,SL_,TP_,CommentExpert);
                  if(BuyTradeBool==false)
                     Print("Entrada ", Ask," SL=",SL_);
                 }

               bool Condicion_2=true;

               for(int i=1; i<Entrar_Barra_Contraria; i++)
                 {
                  if(rates[i].close<rates[i].open)
                    {
                     Condicion_2=false;
                     break;
                    }
                 }

               if(Condicion_2 && Condicion_EMA)
                 {
                  if(Habilitar_Operaciones_Contrarias && OrdenesContrarias<Maximas_Operaciones_Contrarias)
                    {
                     double TP_=TP_2==0?0:Bid-TP_2*Point();
                     TP_=NormalizeDouble(TP_,Digits());
                     double SL_=SL_2==0?0:Ask+SL_2*Point();
                     SL_=NormalizeDouble(SL_,Digits());
                     // Operamos DOWN con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
                     bool SellTradeBool=trade.Sell(Lotes_2,Symbol(),Bid,SL_,TP_,CommentExpert);
                     if(SellTradeBool==false)
                        Print("Entrada ", Bid," SL=",SL_);
                    }
                 }
              }
            if(Modo_Operacion==DOWN)
              {

               // if(rates[1].close>rates[1].open)
               Close_Velas_Contarias(false);

               Total_Posiciones(false);

               bool Condicion=true;
               for(int i=1; i<Entrar_Barra; i++)
                 {
                  if(rates[i].close>rates[i].open)
                    {
                     Condicion=false;
                     break;
                    }
                 }
                 
               bool Condicion_EMA=true;
               if(Filtro_Trend_1 && Filtro_1_SELL[0]==EMPTY_VALUE)
                  Condicion_EMA=false;
               if(Filtro_Trend_2 && Filtro_2_SELL[0]==EMPTY_VALUE)
                  Condicion_EMA=false;
               if(Filtro_Trend_3 && Filtro_3_SELL[0]==EMPTY_VALUE)
                  Condicion_EMA=false;

               if(Condicion && OrdenesNormales<Maximas_Operaciones_Normales && Condicion_EMA)
                 {
                  double TP_=TP==0?0:Bid-TP*Point();
                  TP_=NormalizeDouble(TP_,Digits());
                  double SL_=SL==0?0:Ask+SL*Point();
                  SL_=NormalizeDouble(SL_,Digits());
                  // Operamos DOWN con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
                  bool SellTradeBool=trade.Sell(Lotes,Symbol(),Bid,SL_,TP_,CommentExpert);
                  if(SellTradeBool==false)
                     Print("Entrada ", Bid," SL=",SL_);
                 }

               bool Condicion_2=true;
               for(int i=1; i<Entrar_Barra_Contraria; i++)
                 {
                  if(rates[i].close>rates[i].open)
                    {
                     Condicion_2=false;
                     break;
                    }
                 }

               if(Condicion_2 && Condicion_EMA)
                 {
                  if(Habilitar_Operaciones_Contrarias && OrdenesContrarias<Maximas_Operaciones_Contrarias)
                    {
                     double TP_=TP_2==0?0:Ask+TP_2*Point();
                     TP_=NormalizeDouble(TP_,Digits());
                     double SL_=SL_2==0?0:Bid-SL_2*Point();
                     SL_=NormalizeDouble(SL_,Digits());
                     // Operamos UP con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
                     bool BuyTradeBool=trade.Buy(Lotes_2,Symbol(),Ask,SL_,TP_,CommentExpert);
                     if(BuyTradeBool==false)
                        Print("Entrada ", Ask," SL=",SL_);
                    }
                 }
              }
           }

         prevTime=rates[0].time;
        }
     }
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
      double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
      double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
      // if(PositionGetString(POSITION_COMMENT)!=CommentExpert)
      // continue;qp
      if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      if(Ticket!=0)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && Trailing_Stop>0 && NormalizeDouble(Bid-Trailing_Stop*Point()*10,Digits())>PositionGetDouble(POSITION_PRICE_OPEN)
            && (Bid-PositionGetDouble(POSITION_SL)>=Trailing_Step*2* Point() || PositionGetDouble(POSITION_SL)==0 || PositionGetDouble(POSITION_SL)<PositionGetDouble(POSITION_PRICE_OPEN)) && PositionGetDouble(POSITION_SL)<NormalizeDouble(Bid-Trailing_Step*Point(),Digits()))
           {
            double Evalua=NormalizeDouble(Bid-Trailing_Step*Point(),Digits());
            trade.PositionModify(Ticket,Evalua,PositionGetDouble(POSITION_TP));
           }

         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && Trailing_Stop>0 && NormalizeDouble(Ask+Trailing_Stop*Point()*10,Digits())<PositionGetDouble(POSITION_PRICE_OPEN) &&
            (PositionGetDouble(POSITION_SL)-Ask>=Trailing_Step*2*Point() || PositionGetDouble(POSITION_SL)==0 || PositionGetDouble(POSITION_SL)>PositionGetDouble(POSITION_PRICE_OPEN)) && PositionGetDouble(POSITION_SL)>NormalizeDouble(Ask+Trailing_Step*Point(),Digits()))
           {
            double Evalua=NormalizeDouble(Ask+Trailing_Step*Point(),Digits());
            trade.PositionModify(Ticket,Evalua,PositionGetDouble(POSITION_TP));
           }

        }
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Close_Velas_Contarias(bool IsUP)
  {
   int TotalPosiciones=PositionsTotal();
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;
     if(Ticket==0)continue;
         
      if(IsUP==true)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
           {
            trade.PositionClose(Ticket,-1);
           }
        }

      if(IsUP==false)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
            trade.PositionClose(Ticket,-1);
        }
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Close_All_()
  {
   double Profit=0;
   ulong Array_Posiciones[];
  
   ArrayResize(Array_Posiciones,1);
   int Posiciones=0;

   int TotalPosiciones=PositionsTotal();
   for(int i=0; i<TotalPosiciones; i++)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      if(Modo_Operacion==UP)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
            continue;
        }

      if(Modo_Operacion==DOWN)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
            continue;
        }

      if(Ticket!=0)
        {
         ArrayResize(Array_Posiciones,Posiciones+1);
         Array_Posiciones[Posiciones]=Ticket;
         Posiciones++;
         if(PositionGetDouble(POSITION_PROFIT)<0)
         Profit=Profit+PositionGetDouble(POSITION_PROFIT);
        }
     }

   if(Profit>=Close_All_Profit)
     {
      for(int i=0; i<ArraySize(Array_Posiciones); i++)
        {
         ulong Ticket=Array_Posiciones[i];
         if(PositionSelectByTicket(Ticket))
            trade.PositionClose(Ticket,-1);
        }
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Close_All_Experto()
  {

   int TotalPosiciones=PositionsTotal();
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      trade.PositionClose(Ticket,-1);
      trade.PositionClose(Ticket,-1);
     }

  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Total_Posiciones(bool IsUP)
  {

   OrdenesNormales=0;
   OrdenesContrarias=0;

   int TotalPosiciones=PositionsTotal();
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      if(IsUP==true)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
            OrdenesContrarias++;
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
            OrdenesNormales++;
        }

      if(IsUP==false)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
            OrdenesContrarias++;
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
            OrdenesNormales++;
        }

     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
void Manejo_Flotante()
  {

   struct Posiciones_
     {
      ulong          Ticket_;
      double         Precio;
     };

   int Cierre_Veces=0;

   Posiciones_ Array_Posiciones[];

   ArrayResize(Array_Posiciones,1);
   int Posiciones=0;

   double Total=0;

   int TotalPosiciones=PositionsTotal();
   for(int i=0; i<TotalPosiciones; i++)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetInteger(POSITION_MAGIC)!=Magic_Number || PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      if(Modo_Operacion==UP)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
            continue;
        }

      if(Modo_Operacion==DOWN)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
            continue;
        }

      if(Ticket!=0)
        {
         ArrayResize(Array_Posiciones,Posiciones+1);
         Array_Posiciones[Posiciones].Ticket_=Ticket;
         Array_Posiciones[Posiciones].Precio=PositionGetDouble(POSITION_PRICE_OPEN);
         Posiciones++;
         Total=Total+PositionGetDouble(POSITION_PROFIT);
        }
     }

   double ArrayPrecio[];
   Posiciones=0;

   if(Total<(-1*FlotanteMaximo))
     {
      for(int i=0; i<ArraySize(Array_Posiciones); i++)
        {
         ArrayResize(ArrayPrecio,Posiciones+1);
         ArrayPrecio[Posiciones]=Array_Posiciones[i].Precio;
         Posiciones++;
        }

      ArraySort(ArrayPrecio);

      string Comentario=" ";

      for(int i=0; i<ArraySize(ArrayPrecio); i++)
        {
         Comentario=Comentario+" , "+string(i+1)+"="+DoubleToString(ArrayPrecio[i],2);
        }
      Print(Comentario);

      Comentario=" ARRAY ";
      for(int i=0; i<ArraySize(Array_Posiciones); i++)
        {
         Comentario=Comentario+" , "+string(i+1)+"="+DoubleToString(Array_Posiciones[i].Precio,2);
        }
      Print(Comentario);

      if(Modo_Operacion==UP)
        {
         for(int i=ArraySize(ArrayPrecio)-1; i>=0; i--)
           {
            if(Cierre_Veces>=Maximo_Cierre)
               break;

            for(int j=0; j<ArraySize(Array_Posiciones); j++)
              {
               if(Array_Posiciones[j].Precio==ArrayPrecio[i])
                 {
                  ulong Ticket=Array_Posiciones[j].Ticket_;
                  if(PositionSelectByTicket(Ticket) && Cierre_Veces<Maximo_Cierre)
                    {
                     trade.PositionClose(Ticket,-1);
                     Cierre_Veces++;
                    }
                  if(Cierre_Veces>=Maximo_Cierre)
                     break;
                 }
              }
            if(Cierre_Veces>=Maximo_Cierre)
               break;
           }
        }


      if(Modo_Operacion==DOWN)
        {
         for(int i=0; i<ArraySize(ArrayPrecio); i++)
           {
            if(Cierre_Veces>=Maximo_Cierre)
               break;

            for(int j=0; j<ArraySize(Array_Posiciones); j++)
              {
               if(Array_Posiciones[j].Precio==ArrayPrecio[i])
                 {
                  ulong Ticket=Array_Posiciones[j].Ticket_;
                  if(PositionSelectByTicket(Ticket) && Cierre_Veces<Maximo_Cierre)
                    {
                     trade.PositionClose(Ticket,-1);
                     Cierre_Veces++;
                    }
                  if(Cierre_Veces>=Maximo_Cierre)
                     break;
                 }
              }
            if(Cierre_Veces>=Maximo_Cierre)
               break;
           }
        }
     }
  }
//+------------------------------------------------------------------+
