//+------------------------------------------------------------------+
//|                                           EXPERTO RETROCESOS.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12pm=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };


#include<Trade\Trade.mqh>
#include <Trade\AccountInfo.mqh>
CTrade trade;
CAccountInfo Info;

input string Parametros_Control="********************** HORARIO **********************";///******************************************************************************************************************************
input ENUM_Horas  Hora_Inicio=_0am;
input ENUM_Horas Hora_Final=_0am;
input string S1="********************** Condiciones **********************";///******************************************************************************************************************************
input ENUM_TIMEFRAMES TimeFrame=PERIOD_M5;
input int Conteo=15;
input int PorcentajeTotal=1000;//100 % en Puntos
input int Porcentaje_Activar=25;// % Para activar Funcion
input int Distancia_Puntos=100;// Distancia en Puntos
input string S2="********************** TRADE **********************";///******************************************************************************************************************************
input bool Autolote=true;
input double Por_Cada=1000;// Por Cada (Autolote==true)
input double Operara=0.01;// Operara (Autolote==true)
input double Lote=0.01;// Lote (Autolote==false)
input int SL=100;//SL Puntos
input int TP=300;//TP Puntos
input int NumeroMagico=22222;
input string S23="********************** TRALING STOP **********************";///******************************************************************************************************************************
input bool TrailingStop=true;// Trailing Stop
input int EmpezarTrailing=100;// Empezar Trailing (PUNTOS)
input int PasoTrailing=100;// Paso Trailing (PUNTOS)
input string S5="**********************   Configuracion Medias Moviles ********************** ";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Filtro_EMA=false;
input int Ma_Periodo=7;
input int Ma_Shift=0;
input ENUM_MA_METHOD Ma_Method=MODE_EMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;

int MA=0;
double MA_BUFFER[];

MqlRates rates[];

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(!Autolote)
      if(EvaluarVolumen2(Lote))
         return INIT_FAILED;

   MA=iMA(NULL,TimeFrame,Ma_Periodo,Ma_Shift,Ma_Method,Ma_AppliedPrice);
   ArraySetAsSeries(MA_BUFFER,true);

   ArraySetAsSeries(rates,true);

   trade.SetExpertMagicNumber(NumeroMagico);
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
   if(Info.TradeAllowed())
      if(TrailingStop)
         TrailingStop_BE();

   datetime TiempoActualizar=ActualizarDatos(NULL,TimeFrame);


   int copied=CopyRates(NULL,TimeFrame,0,4,rates);
   if(copied<=0)
      Print("Fallo al copiar los datos de precios ",GetLastError());

   static datetime TiempoActual=0;



   int total=OrdersTotal();
   if(Info.TradeAllowed())
      for(int i=0; i<total; i++)
        {
         ulong   Order_ticket=OrderGetTicket(i);// ticket de la posición
         if(OrderGetInteger(ORDER_MAGIC)!=NumeroMagico)
            continue;
         if(OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_BUY_STOP)
           {
            if(NormalizeDouble(rates[0].close+Distancia_Puntos*Point(),Digits())<OrderGetDouble(ORDER_PRICE_OPEN))
               trade.OrderModify(Order_ticket,NormalizeDouble(rates[0].close+Distancia_Puntos*Point(),Digits()),NormalizeDouble(rates[0].close+Distancia_Puntos*Point(),Digits())-SL*Point(),NormalizeDouble(rates[0].close+Distancia_Puntos*Point(),Digits())+TP*Point(),ORDER_TIME_GTC,0,000);
           }
         if(OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_SELL_STOP)
           {
            if(NormalizeDouble(rates[0].close-Distancia_Puntos*Point(),Digits())>OrderGetDouble(ORDER_PRICE_OPEN))
               trade.OrderModify(Order_ticket,NormalizeDouble(rates[0].close-Distancia_Puntos*Point(),Digits()),NormalizeDouble(rates[0].close-Distancia_Puntos*Point(),Digits())+SL*Point(),NormalizeDouble(rates[0].close-Distancia_Puntos*Point(),Digits())-TP*Point(),ORDER_TIME_GTC,0,000);
           }
        }

   if(Info.TradeAllowed())
      if(TiempoActual!=rates[0].time)
        {
         if(EvaluaHorario(Hora_Inicio,Hora_Final))
           {
            total=PositionsTotal();
            int OrderBuy=0;
            int OrderSell=0;

            for(int i=0; i<total; i++)
              {
               ulong  position_ticket=PositionGetTicket(i);// ticket de la posición
               if(PositionGetInteger(POSITION_MAGIC)!=NumeroMagico)
                  continue;
               if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
                  OrderBuy++;
               if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
                  OrderSell++;
              }

            total=OrdersTotal();

            for(int i=0; i<total; i++)
              {
               ulong   Order_ticket=OrderGetTicket(i);// ticket de la posición
               if(OrderGetInteger(ORDER_MAGIC)!=NumeroMagico)
                  continue;
               if(OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_BUY_STOP)
                  OrderBuy++;
               if(OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_SELL_STOP)
                  OrderSell++;
              }
            CopyBuffer(MA,0,1,Conteo,MA_BUFFER);

            bool FiltroEMA_Sell=true;

            if(Filtro_EMA)
               for(int i=0; i<Conteo-1; i++)
                 {
                  if(MA_BUFFER[i+1]>MA_BUFFER[i])
                    {
                     FiltroEMA_Sell=false;
                     break;
                    }
                 }

            bool FiltroEMA_Buy=true;

            if(Filtro_EMA)
               for(int i=0; i<Conteo-1; i++)
                 {
                  if(MA_BUFFER[i+1]<MA_BUFFER[i])
                    {
                     FiltroEMA_Buy=false;
                     break;
                    }
                 }

            if(OrderBuy==0 && FiltroEMA_Buy)
              {
               double Maximo=iHigh(NULL,TimeFrame,iHighest(NULL,TimeFrame,MODE_HIGH,Conteo,1));
               if((Maximo-rates[1].close)/Point()>=((PorcentajeTotal)*(Porcentaje_Activar/100.0)) && (rates[1].close-rates[1].open)<=0)
                 {
                  //double Minimo=iLow(NULL,PERIOD_CURRENT,iLowest(NULL,PERIOD_CURRENT,MODE_LOW,Conteo,1));
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

                  if(Entra)
                     trade.BuyStop(Lote_,rates[1].close+Distancia_Puntos*Point(),NULL,rates[1].close+Distancia_Puntos*Point()-SL*Point(),rates[1].close+Distancia_Puntos*Point()+TP*Point(),ORDER_TIME_GTC,0,NULL);
                 }
              }
            if(OrderSell==0 && FiltroEMA_Sell)
              {
               double Minimo=iLow(NULL,TimeFrame,iLowest(NULL,TimeFrame,MODE_LOW,Conteo,1));
               if((rates[1].close-Minimo)/Point()>=((PorcentajeTotal)*(Porcentaje_Activar/100.0)) && (rates[1].close-rates[1].open)>=0)
                 {
                  //  double Maximo=iHigh(NULL,PERIOD_CURRENT,iHighest(NULL,PERIOD_CURRENT,MODE_HIGH,Conteo,1));
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

                  if(Entra)
                     trade.SellStop(Lote_,rates[1].close-Distancia_Puntos*Point(),NULL,rates[1].close-Distancia_Puntos*Point()+SL*Point(),rates[1].close-Distancia_Puntos*Point()-TP*Point(),ORDER_TIME_GTC,0,NULL);
                 }
              }
           }
         TiempoActual=rates[0].time;
        }

  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
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
datetime ActualizarDatos(string Simbolo,ENUM_TIMEFRAMES TimeFrames)
  {
   if(TimeFrames==PERIOD_CURRENT)
     {
      TimeFrames=ENUM_TIMEFRAMES(Period());
     }
//---
   MqlRates rates2[];
   ArraySetAsSeries(rates2,true);

   int copied=CopyRates(Simbolo,TimeFrames,0,50,rates2);

   uchar Conteo1=13;

   while(copied<0 && !IsStopped())
     {
      ResetLastError();
      Conteo1--;
      Print("Cargando datos históricos para el símbolo ",Simbolo);
      Sleep(1000);
      copied=CopyRates(Simbolo,TimeFrames,0,100,rates2);
      if(Conteo1<10)
        {
         int Error=GetLastError();
         if(copied<0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE ",Simbolo," ",EnumToString(TimeFrames),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE ",Simbolo," ",EnumToString(TimeFrames),"  Cod ",Error);
            ExpertRemove();
           }
        }
     }

   return rates2[1].time;
//Print("Z2");
  }




//+------------------------------------------------------------------+
//|                                                                  |
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



//+------------------------------------------------------------------+
//|                                                                  |
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
//|                                                                  |
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
