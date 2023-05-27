//+------------------------------------------------------------------+
//|                                               EXPERTO FISHER.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#resource "\\Indicators\\Fisher.ex5"

int HandleADX=0;

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12pm=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

#include<Trade\Trade.mqh>
CTrade trade;
#include <Trade\AccountInfo.mqh>
CAccountInfo Info;

input string Parametros_Control="********************** HORARIO **********************";///******************************************************************************************************************************
input ENUM_Horas  Hora_Inicio=_0am;
input ENUM_Horas Hora_Final=_0am;
input string S1="********************** Condiciones **********************";///******************************************************************************************************************************
input int Fisher_Periodo=10;
input double NIVEL=0;//Nivel de Fuerza Cruce Fisher para Operar
input bool Cerrar_Fisher=false; //Cerrar por Fisher
input double Nivel_Cierre_Fisher=1.5;
input double Minimo_Valle=0.90;//Tamaño minimo del pico del valle anterior
input string S2="********************** TRADE **********************";///******************************************************************************************************************************
input bool Autolote=false;
input double Por_Cada=1000;// Por Cada (Autolote==true)
input double Operara=0.01;// Operara (Autolote==true)
input double Lote=0.01;// Lote (Autolote==false)
input int StopLoss_=100;//SL Puntos
input int TakeProfit_=300;//TP Puntos
input int NumeroMagico=22222;
input string S23="********************** TRALING STOP **********************";///******************************************************************************************************************************
input bool TrailingStop=true;// Trailing Stop
input int EmpezarTrailing=100;// Empezar Trailing (PUNTOS)
input int PasoTrailing=100;// Paso Trailing (PUNTOS)
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
MqlRates rates2[];


int HandleFisher=0;
double FISHER[];
int OnInit()
  {
  
  if(!Autolote)
  if(!EvaluarVolumen2(Lote))
  return INIT_FAILED;
  
   if(NIVEL>=Nivel_Cierre_Fisher && Cerrar_Fisher)
     {
      Alert("Nivel apertura Fisher debe ser menor a nivel cierre fisher");
      return INIT_FAILED;
     }


   HandleFisher=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\Fisher.ex5",Fisher_Periodo); // Slow length);
   ArraySetAsSeries(FISHER,true);

   TesterHideIndicators(false);
//---
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
// EventKillTimer();
  }//------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   
   if(TrailingStop)
   TrailingStop_BE();
   
   static datetime Tiempo=0;
   CopyBuffer(HandleFisher,0,0,100,FISHER);
   
   int total=PositionsTotal();
   int OrdersBuy=0, OrdersSell=0;

   int copied=CopyRates(NULL,0,0,20,rates2);
   ArraySetAsSeries(rates2,true);

   double bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   if(Info.TradeAllowed())
      for(int i=total-1; i>=0; i--)
        {
         //--- parámetros de la orden
         ulong  position_ticket=PositionGetTicket(i);// ticket de la posición
         string position_symbol=PositionGetString(POSITION_SYMBOL); // símbolo

         /* double Bid=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_BID);
          double Ask=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_ASK);
          double OrderOpen=PositionGetDouble(POSITION_PRICE_OPEN);
          double StopLoss=PositionGetDouble(POSITION_SL);
          double TakeProfit=PositionGetDouble(POSITION_TP);
          double Point_=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_POINT);
          int Digitos_=(int)SymbolInfoInteger(PositionGetString(POSITION_SYMBOL),SYMBOL_DIGITS);
          ENUM_POSITION_TYPE Tipo=(ENUM_POSITION_TYPE) PositionGetInteger(POSITION_TYPE);*/

         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
           {
           Print("Entra contador");
            if(FISHER[0]>Nivel_Cierre_Fisher)
               trade.PositionClose(position_ticket,-1);
            else
               OrdersBuy++;
           }
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
           {
            if(FISHER[0]<(Nivel_Cierre_Fisher)*-1)
               trade.PositionClose(position_ticket,-1);
            else
               OrdersSell++;
           }
        }
   if(Info.TradeAllowed())
      if(EvaluaHorario(Hora_Inicio,Hora_Final))
         if(Tiempo!=rates2[0].time)
           {
             // Comment(FISHER[2]," ",FISHER[1],"  ",OrdersBuy);
              
            Tiempo=rates2[0].time;

            if(OrdersBuy==0 && FISHER[1]>(MathAbs(NIVEL)) && FISHER[2]<0)
              {
              
              //Print("ENTRAAAA---------------------------------------------------------");
               bool Valle=false;

               for(int j=2; j<100; j++)
                 {
                  if(FISHER[j]<0 && Minimo_Valle*-1>FISHER[j])
                    {
                     Valle=true;
                     break;
                    }
                  if(FISHER[j]>0)
                     break;
                 }
               if(Valle)
                  Print("VALLE");

               if(Valle)
                 {
                  double Lote_=0.01;
                  bool Entra=true;
                  if(Autolote)
                    {
                     Lote_=NormalizeDouble(int(AccountInfoDouble(ACCOUNT_BALANCE)/Por_Cada)*Operara,2);
                     Entra=EvaluarVolumen(Lote_);
                    }
                  else
                     Lote_=Lote;

                  if(!(Info.MarginCheck(Symbol(),ORDER_TYPE_BUY,Lote_,SymbolInfoDouble(NULL,SYMBOL_ASK))<AccountInfoDouble(ACCOUNT_MARGIN_FREE)))
                    {
                     Print("NO HAY SUFICIENTE MARGEN LIBRE PARA PONER OPERACION");
                     Entra=false;
                    }

                  double TP=TakeProfit_==0?0:ask+TakeProfit_*Point();
                  double SL=StopLoss_==0?0:ask-StopLoss_*Point();

                  if(Entra)
                    {
                     if(!trade.Buy(Lote_,NULL,ask,SL,TP,NULL))
                        Print("NO OPERO... Error numero ",trade.ResultRetcode());
                    }
                 }
              }
            else
               if(OrdersSell==0 && FISHER[1]<(MathAbs(NIVEL)*-1) && FISHER[2]>0)
                 {
               //   Print("ENTRAAAA---------------------------------------------------------");
                  bool Valle=false;
                  for(int j=2; j<100; j++)
                    {
                     if(FISHER[j]>0 && Minimo_Valle<FISHER[j])
                       {
                        Valle=true;
                        break;
                       }
                     if(FISHER[j]<0)
                        break;
                    }

                  if(Valle)
                     Print("VALLE");

                  if(Valle)
                    {
                     double Lote_=0.01;
                     bool Entra=true;
                     if(Autolote)
                       {
                        Lote_=NormalizeDouble(int(AccountInfoDouble(ACCOUNT_BALANCE)/Por_Cada)*Operara,2);
                        Entra=EvaluarVolumen(Lote_);
                       }
                     else
                        Lote_=Lote;

                     if(!(Info.MarginCheck(Symbol(),ORDER_TYPE_SELL,Lote_,SymbolInfoDouble(NULL,SYMBOL_BID))<AccountInfoDouble(ACCOUNT_MARGIN_FREE)))
                       {
                        Print("NO HAY SUFICIENTE MARGEN LIBRE PARA PONER OPERACION");
                        Entra=false;
                       }
                     double TP=TakeProfit_==0?0:bid-TakeProfit_*Point();
                     double SL=StopLoss_==0?0:bid+StopLoss_*Point();

                     if(Entra)
                       {
                        if(!trade.Sell(Lote_,NULL,bid,SL,TP,NULL))
                           Print("NO OPERO... Error numero ",trade.ResultRetcode());
                       }
                    }
                 }
           }
   /* if(SymbolInfoInteger(Symbol(),SYMBOL_SPREAD)<15)
    if(EvaluaHorario(Hora_Inicio,Hora_Final))
      {
       static datetime TIME=0;
       bool IsBuy=false;

       int copied=CopyRates(NULL,0,0,20,rates2);
       ArraySetAsSeries(rates2,true);

       if(copied<=0)
          Print("Fallo al copiar los datos de precios ",GetLastError());

       if((rates2[1].high-rates2[1].low)/Point()<=Puntos)
          if(IgualarDiveregencias(TIME,IsBuy))
            {
             if(!IsBuy)
               {
                double Nivel=0;
                for(int i=2; i<20; i++)
                  {
                   if(i==2)
                      if(rates2[i].open>rates2[i].close)
                         continue;

                   if(rates2[i].open<rates2[i].close)
                      Nivel=rates2[i].low;

                   if(rates2[i].open>rates2[i].close)
                      break;
                  }



                if((Fast_Trend[1]<rates2[1].low || Slow_Trend[1]<rates2[1].low))
                  {
                   if(OrdersSell==0)
                     {
                      bool Ejecuto=0;
                      double SL=rates2[1].high+10*Point();
                      double TP=rates2[1].low-TakeProfit_*Point();//rates2[1].low-TakeProfit_*Point();
                      if(Nivel==0 || Nivel>bid)
                         Ejecuto=trade.SellStop(VOLUME,bid-15*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,TimeCurrent()+5*PeriodSeconds(Period()),NULL);
                      else
                         if((MathAbs(Nivel-rates2[1].low))/Point()<=ToleranciaPuntos)
                            Ejecuto=trade.SellStop(VOLUME,Nivel-30*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,TimeCurrent()+5*PeriodSeconds(Period()),NULL);
                      if(Ejecuto==false)
                         Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                     }
                  }
               }
             else
               {
                double Nivel=0;
                for(int i=2; i<20; i++)
                  {
                   if(i==2)
                      if(rates2[i].open<rates2[i].close)
                         continue;

                   if(rates2[i].open>rates2[i].close)
                      Nivel=rates2[i].high;

                   if(rates2[i].open<rates2[i].close)
                      break;
                  }


                if((Fast_Trend[1]>rates2[1].high || Slow_Trend[1]>rates2[1].high))
                  {
                   if(OrdersBuy==0)
                     {
                      bool Ejecuto=0;
                      double SL=rates2[1].low-10*Point();
                      double TP=rates2[1].high+TakeProfit_*Point();//rates2[1].high+TakeProfit_*Point();;
                      if(Nivel==0 || Nivel<ask)
                         Ejecuto=trade.BuyStop(VOLUME,ask+15*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,TimeCurrent()+5*PeriodSeconds(Period()),NULL);
                      else
                         if(MathAbs((Nivel-rates2[1].high))/Point()<=ToleranciaPuntos)
                            Ejecuto=trade.BuyStop(VOLUME,Nivel+30*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,TimeCurrent()+5*PeriodSeconds(Period()),NULL);

                      if(Ejecuto==false)
                         Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                     }
                  }
               }
            }
      }*/
  }
//+------------------------------------------------------------------+
void TrailingStop_BE()
  {

   int TotalPosiciones=PositionsTotal();
   for(int i=0; i<TotalPosiciones; i++)
     {
      ulong Ticket=PositionGetTicket(i);

      if(PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      if(Ticket!=0)
        {
         long Tipo_Posicion=PositionGetInteger(POSITION_TYPE);

         if(Tipo_Posicion==POSITION_TYPE_BUY)
           {
            if(PositionGetDouble(POSITION_PRICE_OPEN)+EmpezarTrailing*Point()<=PositionGetDouble(POSITION_PRICE_CURRENT) && EmpezarTrailing>0 && PasoTrailing>0)
              {
               double Evalua=NormalizeDouble(PositionGetDouble(POSITION_PRICE_CURRENT)-PasoTrailing*Point(),Digits());
               if(PositionGetDouble(POSITION_SL)==0 || PositionGetDouble(POSITION_SL)<Evalua)
                 {
                  trade.PositionModify(Ticket,Evalua,PositionGetDouble(POSITION_TP));
                 }
              }
           }
         else
           {
            if(PositionGetDouble(POSITION_PRICE_OPEN)-EmpezarTrailing*Point()>=PositionGetDouble(POSITION_PRICE_CURRENT)  && EmpezarTrailing>0 && PasoTrailing>0)
              {
               double Evalua=NormalizeDouble(PositionGetDouble(POSITION_PRICE_CURRENT)+PasoTrailing*Point(),Digits());
               if(PositionGetDouble(POSITION_SL)==0 || PositionGetDouble(POSITION_SL)>Evalua)
                 {
                  trade.PositionModify(Ticket,Evalua,PositionGetDouble(POSITION_TP));
                 }
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
bool EvaluarVolumen(double &Volumen)
  {
   double VolumenCalculado=Volumen;

   double VPaso=SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);

   double EVA=(Volumen/VPaso)-int(Volumen/VPaso);

   if(EVA!=0)
     {
      VolumenCalculado=int(Volumen/VPaso)*VPaso;
      Print("Igualando lote al mas cercano posible");
     }

   Print("Volumen Calculado es ",DoubleToString(VolumenCalculado,2));

   if(VolumenCalculado<SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN))
     {
      Print("ERROR Volumen calculado menor al lote minimo permitido por el Simbolo");
      return false;
     }
   if(VolumenCalculado>SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX))
     {
      Print("Volumen Calculado mayor al maximo permitido, igualando al maximo Permitido");
      VolumenCalculado=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX);
     }

   Volumen=VolumenCalculado;
   return true;
  }
//+------------------------------------------------------------------+
bool EvaluaHorario(int Apertura,int Cierre)
  {
   MqlDateTime TiempoActual;
   TimeToStruct(TimeCurrent(),TiempoActual);

   if(Apertura==Cierre)
      return true;

   if(Apertura>Cierre && (TiempoActual.hour>=Apertura || TiempoActual.hour<Cierre))
      return true;
   else
      if(Apertura<Cierre && TiempoActual.hour>=Apertura && TiempoActual.hour<Cierre)
         return true;

   return false;
  }
//+------------------------------------------------------------------+
bool EvaluarVolumen2(double Volumen)
  {

   double VPaso=SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);

   double EVA=(Volumen/VPaso)-int(Volumen/VPaso);

   if(EVA!=0)
     {
      Alert("VOLUMEN NO ES DIVISIBLE AL PASO DEL SIMBOLO ",VPaso);
      return false;
     }

   if(Volumen<SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN))
     {
      Alert("ERROR Volumen calculado menor al lote minimo permitido por el Simbolo");
      return false;
     }
   if(Volumen>SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX))
     {
      Alert("Volumen Calculado mayor al maximo permitido");
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
