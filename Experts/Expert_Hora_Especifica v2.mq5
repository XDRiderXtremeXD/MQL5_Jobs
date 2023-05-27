//+------------------------------------------------------------------+
//|                                       Expert Hora Especifica.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

enum TipoOrden
  {
   Mercado=0,
   Stop=1,
//Limit=2,
  };

double  SL,TP;

#include<Trade\Trade.mqh>
CTrade trade;

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6apm=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12pm=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

enum ENUM_MODO_LOTE
  {
   Sumatoria=0,
   Multiplicador=1,
  };

input string S1="---------------- Numero de Ordenes y Tipo ----------------";//--------------------------------
input int Cantidad_De_Ordenes=3;
input TipoOrden Orden=Mercado;
input string S2="---------------- Distancias ----------------";//--------------------------------
input int DistanciaStart=100; //Distancia Start en caso es STOP o LIMIT
input int Distancia=100; //Distancia en caso es STOP o LIMIT
input string S3="---------------- Horario----------------";//--------------------------------
input ENUM_Horas Hora=0;
input int Minutos=0; //Minutos 0-59
input int Segundos=0; //Segundos 0-59
input string S4="---------------- Lotaje ----------------";//--------------------------------
input double Lotaje_a_Operar=0.01; //Lotaje Inicial
input ENUM_MODO_LOTE Modo_Aumento=Sumatoria;
input double Aumento_Lote=3;
input string S5="---------------- TP , SL , TS----------------";//--------------------------------
input int TakeProfit=30; //Take Profit valor en puntos
input int Stop_Loss=30; // Stop loss valor en puntos
input int TakeProfit_I=30; //(INDEPENDIENTE)Take Profit valor en puntos 
input int Stop_Loss_I=30; // (INDEPENDIENTE) Stop loss valor en puntos 
input int Trail_start=0;//Empezar Trailing a X puntos en Positivo
input int Trail_Stop=100;//Mover Trailing a X puntos
//input int Breakeven=0;//BreakEven valor en puntos

datetime PrevTime=0;
string CommentExpert="EXPERTO HORA ESPECIFICO";

MqlDateTime Tiempo;

double Entrada;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   if(Minutos>59 || 0>Minutos || Segundos>59 || Segundos<0)
     {
      Print("Parametro Minutos y Segundos deben ser mayor o igual a 0 y menor a 60");
      return (INIT_FAILED);
     }
   if(Aumento_Lote<=1 && Modo_Aumento==Multiplicador)
     {
      Alert("Aumento Lote en Modo Multiplicador debe ser mayor a 1");
      return (INIT_FAILED);
     }
   else
      if(Aumento_Lote>1 && Modo_Aumento==Multiplicador)
        {
         if(NormalizeDouble(Lotaje_a_Operar*Aumento_Lote,2)==Lotaje_a_Operar)
           {
            Alert("Aumento Lote en Modo Multiplicador debe ser mayor a ",Aumento_Lote);
            return (INIT_FAILED);
           }
        }

   if(Modo_Aumento==Sumatoria)
     {
      double STEP=SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
      if(int(Aumento_Lote/STEP)-Aumento_Lote/STEP>0)
        {
         Alert("Aumento en modo sumatoria no es factible debido a que no es un paso correcto del simbolo, paso minimo es ",STEP);
         return (INIT_FAILED);
        }
     }


   double STEP=SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
   if(int(Lotaje_a_Operar/STEP)-Lotaje_a_Operar/STEP>0)
     {
      Alert("Lotaje Inicial no es valido para este simbolo , debe ser divisible de ",STEP);
      return (INIT_FAILED);
     }
   
   if(Lotaje_a_Operar>SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX) || Lotaje_a_Operar<SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN))
     {
      Alert("Lotaje Inicial no es valido para este simbolo debe ser menor o igual a ",SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX)," y mayor o igual a ",SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN));
      return (INIT_FAILED);
     }
     
   if(SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL)>TakeProfit || SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL)>Stop_Loss
    || SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL)>TakeProfit_I || SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL)>TakeProfit_I){
    Alert("Los valores del TP y Sl deben ser mayores o igual a ",SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL));
    return (INIT_FAILED);
    }

   EventSetMillisecondTimer(1);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Comment(" ");
   EventKillTimer();

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTimer()
  {
   RemainingBarTime();
   TimeToStruct(TimeLocal(),Tiempo);
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   
   Comment(Bid);
   
//Comment(TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES|TIME_SECONDS));

   TS_and_BE(); // Se llama a la funcion para realizar el Trailing Stop y El BreakEven si en caso esta activado

   if(PrevTime!=TimeLocal()) // Si Prevtime no es igual al Tiempo actual.. se ejecuta(esto es para que cuando se haya ejecutado una operacion(ya no evalue esa misma vela)
     {
      if(Tiempo.hour==Hora && Tiempo.min==Minutos && Tiempo.sec==Segundos)  // SE EJECUTA DEPENDIENDO DEL MODO DE OPERACION
        {
         PrevTime=TimeLocal();
         if(Orden==Mercado)
           {
            //PARA SELL
            SL=Stop_Loss<=0?0:Bid+Stop_Loss*Point(); //SE ESTABLECE EL SL
            TP=TakeProfit<=0?0:Bid-TakeProfit*Point();//SE ESTABLECE EL TP
            Print(Entrada," SL",SL," TP",TP);
            if(!trade.Sell(Lotaje_a_Operar,Symbol(),Bid,SL,TP,CommentExpert))
               Print("No opero Sell Bien.. ERROR:",trade.ResultRetcode());

            //PARA BUY
            SL=Stop_Loss<=0?0:Ask-Stop_Loss*Point(); //SE ESTABLECE EL SL
            TP=TakeProfit<=0?0:Ask+TakeProfit*Point(); //SE ESTABLECE EL TP
            if(!trade.Buy(Lotaje_a_Operar,Symbol(),Ask,SL,TP,CommentExpert))
               Print("No opero Buy Bien.. ERROR:",trade.ResultRetcode());
            for(int i=1; i<Cantidad_De_Ordenes; i++)
              {
               //PARA SELL STOP
               Entrada=Bid-Distancia*i*Point();
               if(i!=Cantidad_De_Ordenes-1){
               SL=Stop_Loss<=0?0:Entrada+Stop_Loss*Point(); //SE ESTABLECE EL SL
               TP=TakeProfit<=0?0:Entrada-TakeProfit*Point();}//SE ESTABLECE EL TP
               else{
               SL=Stop_Loss<=0?0:Entrada-Stop_Loss_I*Point(); //SE ESTABLECE EL SL
               TP=TakeProfit<=0?0:Entrada+TakeProfit_I*Point();} //SE ESTABLECE EL TP
               double Lote=Modo_Aumento==Sumatoria?(Lotaje_a_Operar+i*Aumento_Lote):(Lotaje_a_Operar*MathPow(Aumento_Lote,i));
               Lote=NormalizeDouble(Lote,2);
               if(Lote>SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX))
               Lote=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX);
               if(!trade.SellStop(Lote,Entrada,Symbol(),SL,TP,0,0,CommentExpert))
                  Print("No opero Sell Stop Bien.. ERROR:",trade.ResultRetcode());

               //PARA BUY STOP
               Entrada=Ask+Distancia*i*Point();
               if(i!=Cantidad_De_Ordenes-1){
               SL=Stop_Loss<=0?0:Entrada-Stop_Loss*Point(); //SE ESTABLECE EL SL
               TP=TakeProfit<=0?0:Entrada+TakeProfit*Point();} //SE ESTABLECE EL TP
               else{
               SL=Stop_Loss<=0?0:Entrada-Stop_Loss_I*Point(); //SE ESTABLECE EL SL
               TP=TakeProfit<=0?0:Entrada+TakeProfit_I*Point();} //SE ESTABLECE EL TP
               Lote=Modo_Aumento==Sumatoria?(Lotaje_a_Operar+i*Aumento_Lote):(Lotaje_a_Operar*MathPow(Aumento_Lote,i));
               Lote=NormalizeDouble(Lote,2);
               if(Lote>SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX))
               Lote=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX);
               if(!trade.BuyStop(Lote,Entrada,Symbol(),SL,TP,0,0,CommentExpert))
                  Print("No opero Buy Stop Bien.. ERROR:",trade.ResultRetcode());
              }
           }

         if(Orden==Stop)
           {
            //PARA SELL STOP
            for(int i=0; i<Cantidad_De_Ordenes; i++)
              {
               Entrada=Bid-DistanciaStart*Point()-Distancia*i*Point();
               if(i!=Cantidad_De_Ordenes-1){
               SL=Stop_Loss<=0?0:Entrada+Stop_Loss*Point(); //SE ESTABLECE EL SL
               TP=TakeProfit<=0?0:Entrada-TakeProfit*Point();}//SE ESTABLECE EL TP
               else{
               SL=Stop_Loss<=0?0:Entrada+Stop_Loss_I*Point(); //SE ESTABLECE EL SL
               TP=TakeProfit<=0?0:Entrada-TakeProfit_I*Point();} //SE ESTABLECE EL TP
               double Lote=Modo_Aumento==Sumatoria?(Lotaje_a_Operar+i*Aumento_Lote):(Lotaje_a_Operar*MathPow(Aumento_Lote,i));
               Lote=NormalizeDouble(Lote,2);
               if(Lote>SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX))
               Lote=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX);
               if(!trade.SellStop(Lote,Entrada,Symbol(),SL,TP,0,0,CommentExpert))
                  Print("No opero Sell Stop Bien.. ERROR:",trade.ResultRetcode());

               //PARA BUY STOP
               Entrada=Ask+DistanciaStart*Point()+Distancia*i*Point();
               if(i!=Cantidad_De_Ordenes-1){
               SL=Stop_Loss<=0?0:Entrada-Stop_Loss*Point(); //SE ESTABLECE EL SL
               TP=TakeProfit<=0?0:Entrada+TakeProfit*Point(); }//SE ESTABLECE EL TP
               else{
               SL=Stop_Loss<=0?0:Entrada-Stop_Loss_I*Point(); //SE ESTABLECE EL SL
               TP=TakeProfit<=0?0:Entrada+TakeProfit_I*Point();} //SE ESTABLECE EL TP
               Lote=Modo_Aumento==Sumatoria?(Lotaje_a_Operar+i*Aumento_Lote):(Lotaje_a_Operar*MathPow(Aumento_Lote,i));
               Lote=NormalizeDouble(Lote,2);
               if(Lote>SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX))
               Lote=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX);
               if(!trade.BuyStop(Lote,Entrada,Symbol(),SL,TP,0,0,CommentExpert))
                  Print("No opero Buy Stop Bien.. ERROR:",trade.ResultRetcode());
              }
           }

         /*if(Orden==Limit)
           {
            //PARA SELL
            for(int i=0; i<Cantidad_De_Ordenes; i++)
              {
               Entrada=Bid+DistanciaStart+Distancia*i*Point();
               SL=Stop_Loss<=0?0:Entrada+Stop_Loss*Point(); //SE ESTABLECE EL SL
               TP=TakeProfit<=0?0:Entrada-TakeProfit*Point();//SE ESTABLECE EL TP
               if(!trade.SellLimit(Lotaje_a_Operar*MathPow(Multiplicador_Lote,i),Entrada,Symbol(),SL,TP,0,0,CommentExpert))
                  Print("No opero Sell Limit Bien.. ERROR:",trade.ResultRetcode());
               //PARA BUY
               Entrada=Ask-DistanciaStart-Distancia*i*Point();
               SL=Stop_Loss<=0?0:Entrada-Stop_Loss*Point(); //SE ESTABLECE EL SL
               TP=TakeProfit<=0?0:Entrada+TakeProfit*Point(); //SE ESTABLECE EL TP
               if(!trade.BuyLimit(Lotaje_a_Operar*MathPow(Multiplicador_Lote,i),Entrada,Symbol(),SL,TP,0,0,CommentExpert))
                  Print("No opero Buy Limit Bien.. ERROR:",trade.ResultRetcode());
              }
           }*/
         ChartRedraw();
        }
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TS_and_BE() // FUNCION DEL TS Y BREAK VEN
  {
   int Pocisiones=PositionsTotal();
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   for(int cnt=0; cnt<Pocisiones; cnt++) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;

      if(PositionGetString(POSITION_SYMBOL)==Symbol() && PositionGetString(POSITION_COMMENT)==CommentExpert) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
         //donde esta el experto.. entonces no lo evalua
        {
         /* //BE Funcion
          if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && Breakeven>0 && PositionGetDouble(POSITION_SL)<PositionGetDouble(POSITION_PRICE_OPEN)
             && Bid-Breakeven*Point()>PositionGetDouble(POSITION_PRICE_OPEN))  //Si Operacion es un BUY y Breakeven>0 y StopLoss No esta en Precio de Entrada y El precio supera el Precio establecido para el BE
             if(!trade.PositionModify(Ticket,PositionGetDouble(POSITION_PRICE_OPEN),PositionGetDouble(POSITION_TP)))
             Print("No opero Modifico BE.. ERROR:",trade.ResultRetcode());

          if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && Breakeven>0 && PositionGetDouble(POSITION_SL)>PositionGetDouble(POSITION_PRICE_OPEN)//Si Operacion es un SELL y Breakeven>0 y StopLoss No esta en Precio de Entrada y El precio supera el Precio establecido para el BE
             && Ask+Breakeven*Point()<PositionGetDouble(POSITION_PRICE_OPEN))
             if(!trade.PositionModify(Ticket,PositionGetDouble(POSITION_PRICE_OPEN),PositionGetDouble(POSITION_TP)))
             Print("No opero Modifico BE.. ERROR:",trade.ResultRetcode());*/

         //TS Funcion
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY  && Trail_Stop>0 &&  NormalizeDouble(Bid-Trail_start*Point(),Digits())>PositionGetDouble(POSITION_PRICE_OPEN) && (NormalizeDouble(Bid-Trail_Stop*Point(),Digits())>PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0))
            if(!trade.PositionModify(Ticket,NormalizeDouble(Bid-Trail_Stop*Point(),Digits()),PositionGetDouble(POSITION_TP)))
               Print("No opero Modifico TS.. ERROR:",trade.ResultRetcode());

         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && Trail_Stop>0  &&  NormalizeDouble(Ask+Trail_start*Point(),Digits())<PositionGetDouble(POSITION_PRICE_OPEN) && (NormalizeDouble(Ask+Trail_Stop*Point(),Digits())<PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0))
            if(!trade.PositionModify(Ticket,NormalizeDouble(Ask+Trail_Stop*Point(),Digits()),PositionGetDouble(POSITION_TP)))
               Print("No opero Modifico TS.. ERROR:",trade.ResultRetcode());

        }
     }
  }

//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void RemainingBarTime()
  {
   datetime time[];
   ArrayResize(time,1);
   if(CopyTime(Symbol(),Period(),0,1,time)==-1)
      Print("ERROR");
  }
//+------------------------------------------------------------------+
