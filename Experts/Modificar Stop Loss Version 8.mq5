//+------------------------------------------------------------------+
//|                                Modificar Stop Loss Version 8.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade  Trade;

input bool TodosLosSymbolos=true;

input int                  ma_period2=8;                 // período de la media
input ENUM_MA_METHOD       ma_method2=MODE_SMA;           // tipo de suavizado
input ENUM_APPLIED_PRICE   applied_price2=PRICE_CLOSE;    // tipo de precio
input ENUM_TIMEFRAMES      PeriodTimeFrames2=PERIOD_M5;        // timeframe





//input int                  ma_shift=0;                   // desplazamiento
input ENUM_MA_METHOD       ma_method=MODE_SMA;           // tipo de suavizado
input ENUM_APPLIED_PRICE   applied_price=PRICE_CLOSE;    // tipo de precio
input ENUM_TIMEFRAMES      PeriodTimeFrames=PERIOD_H1;        // timeframe
input int CantidadDeMAs=8;

input int Desplazamiento=2;
//--- búfer indicador
int Condicion=0;

double iMABuffer[3];
double iRSIBuffer[3];
double iMAmenorBuffer[3];



//double iMAmayorBuffer[3];
//double iMomentumH1[3];


double iMAmenorBufferM1[3];

double iADXMayorBuffer[3];
double iADXMayorBufferDpos[3];
double iADXMayorBufferDneg[3];

double iADXMenorBuffer[3];
double iADXMenorBufferDpos[3];
double iADXMenorBufferDneg[3];

double iEnvelopesPlus[3];
double iEnvelopesMinus[3];

double iEnvelopesPlusMayor[3];
double iEnvelopesMinusMayor[3];

double iMomentumMenor[3];
double iMomentumMenorM1[3];


double StopLossModiffyCondicion[6];


int    handle;
int    handleRSI;
int handleMediaMenor;
int iADXHandleMenor;
int iADXHandleMenorDpos;
int iADXHandleMenorDneg;

double RSIValor;

int PositionTotalAnterior;
//string comentario;



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
//Trade.Buy(8);


   return(INIT_SUCCEEDED);
  }


/*void OnTick()
  {
   static bool s=false;
   int calculated=BarsCalculated(handle);
   Comment(calculated);//," ",iMABuffer[1]);
   if(s==false){
   Print(iMABuffer[1]);
   s=true;}

  }*/
//+------------------------------------------------------------------+
//| Modificación de Stop Loss y Take Profit de la posición           |
//+------------------------------------------------------------------+
void OnTick()
  {
//CopiarEMA(Symbol(),Digits(),PERIOD_M15,10,MODE_SMA,PRICE_CLOSE,iMAmenorBuffer);
//MqlDateTime TiempoActual;
//TimeCurrent(TiempoActual);
//double ASK=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
//double BID=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   /*
   if(PositionsTotal()==0)
      {
       if(BID>iMAmenorBuffer[1])
          Trade.Buy(8);
      }*/

   int total=PositionsTotal(); // número de posiciones abiertas

   /*int PeriodTimeFramesSeconds=PeriodSeconds(PeriodTimeFrames);

   if(PeriodTimeFramesSeconds<PeriodSeconds(PERIOD_H1))
     {
      Tiempo=TiempoActual.min;
      TiempoDivisible=PeriodTimeFramesSeconds/60;
     }
   else
      if(PeriodTimeFramesSeconds<PeriodSeconds(PERIOD_D1))
        {
         Tiempo=TiempoActual.hour;
         TiempoDivisible=PeriodTimeFramesSeconds/3600;
        }
      else
         if(PeriodTimeFramesSeconds<PeriodSeconds(PERIOD_W1))
           {
            Tiempo=TiempoActual.day;
            TiempoDivisible=PeriodTimeFramesSeconds/86400;
           }
   */
//if((TiempoAnterior!=Tiempo && Tiempo%TiempoDivisible==0) || PositionTotalAnterior!=total)
//{
//Print("ENTRO");
//--- declaración de la solicitud y el resultado
   MqlTradeRequest request;
   MqlTradeResult  result;
//--- iteración de todas las posiciones abiertas
   for(int i=0; i<total; i++)
     {
      //--- parámetros de la orden
      ulong  position_ticket=PositionGetTicket(i);// ticket de la posición
      string position_symbol=PositionGetString(POSITION_SYMBOL); // símbolo

      if(TodosLosSymbolos==false)
        {
         if(Symbol()!=position_symbol)
           {
            continue;
           }
        }
      int    digits=(int)SymbolInfoInteger(position_symbol,SYMBOL_DIGITS); // número de dígitos tras la coma
      double points=SymbolInfoDouble(position_symbol,SYMBOL_POINT); // número de dígitos tras la coma
      ulong  magic=PositionGetInteger(POSITION_MAGIC); // Número mágico de la posición
      //double volume=PositionGetDouble(POSITION_VOLUME);    // volumen de la posición
      double sl=PositionGetDouble(POSITION_SL);  // Stop Loss de la posición
      double tp=PositionGetDouble(POSITION_TP);  // Take Profit de la posición
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);  // tipo de posición

      //--- cálculo de los niveles de precio actuales
      double price=PositionGetDouble(POSITION_PRICE_OPEN);
      //comentario=price+" "+iRSIBuffer[0]+" "+iRSIBuffer[1]+" "+iRSIBuffer[2];
      double bid=SymbolInfoDouble(position_symbol,SYMBOL_BID);
      double ask=SymbolInfoDouble(position_symbol,SYMBOL_ASK);
      int    stop_level=(int)SymbolInfoInteger(position_symbol,SYMBOL_TRADE_STOPS_LEVEL);

      CopiarRSI(position_symbol,digits);
      //CopiarEMA(position_symbol,digits,PERIOD_H1,10,MODE_SMA,PRICE_CLOSE,iMAmenorBuffer);
      //CopiarEMA(position_symbol,digits,PERIOD_H1,20,MODE_SMA,PRICE_CLOSE,iMAmayorBuffer);
      CopiarEMA(position_symbol,digits,PERIOD_M1,8,MODE_SMA,PRICE_CLOSE,iMAmenorBufferM1);
      CopiarEnvelopes(position_symbol,digits,PERIOD_M5,7,1,MODE_EMA,PRICE_CLOSE,0.030,0,iEnvelopesPlus);
      CopiarEnvelopes(position_symbol,digits,PERIOD_M5,7,1,MODE_EMA,PRICE_CLOSE,0.030,1,iEnvelopesMinus);
      CopiarEnvelopes(position_symbol,digits,PeriodTimeFrames,7,1,MODE_EMA,PRICE_CLOSE,0.050,0,iEnvelopesPlusMayor);
      CopiarEnvelopes(position_symbol,digits,PeriodTimeFrames,7,1,MODE_EMA,PRICE_CLOSE,0.050,1,iEnvelopesMinusMayor);
      CopiarMomentun(position_symbol,digits,PERIOD_M5,14,PRICE_CLOSE,iMomentumMenor);
      CopiarMomentun(position_symbol,digits,PERIOD_M1,14,PRICE_CLOSE,iMomentumMenorM1);

      CopiarBufferADX(position_symbol,digits,PERIOD_M15,14,0,iADXMayorBuffer);
      CopiarBufferADX(position_symbol,digits,PERIOD_M15,14,1,iADXMayorBufferDpos);
      CopiarBufferADX(position_symbol,digits,PERIOD_M15,14,2,iADXMayorBufferDneg);
      CopiarBufferADX(position_symbol,digits,PERIOD_M5,14,0,iADXMenorBuffer);
      CopiarBufferADX(position_symbol,digits,PERIOD_M5,14,1,iADXMenorBufferDpos);
      CopiarBufferADX(position_symbol,digits,PERIOD_M5,14,2,iADXMenorBufferDneg);

      double HighAnterior=iHigh(position_symbol,PeriodTimeFrames,1);
      double LowAnterior=iLow(position_symbol,PeriodTimeFrames,1);

      double HighAnteriorM5=iHigh(position_symbol,PERIOD_M5,1);
      double LowAnteriorM5=iLow(position_symbol,PERIOD_M5,1);
      double HighAnterior2M5=iHigh(position_symbol,PERIOD_M5,2);
      double LowAnterior2M5=iLow(position_symbol,PERIOD_M5,2);
      double HighAnteriorM1=iHigh(position_symbol,PERIOD_M1,1);
      double LowAnteriorM1=iLow(position_symbol,PERIOD_M1,1);

      double slModify=0;

      for(int jg=0; jg<6; jg++)
        {
         StopLossModiffyCondicion[jg]=0;
        }
      /*
      double slModify=0;  StopLossModiffyCondicion[0]
      double StopLossModiffyRSI=0; StopLossModiffyCondicion[1]
      double StopLossModifyADX55=0; StopLossModiffyCondicion[2]
      double StopLossModifyADXSec40=0; StopLossModiffyCondicion[3]
      double StopLossEnvelop=0; StopLossModiffyCondicion[4]
      */

      bool TrailingGlobal=false;

      if(type==POSITION_TYPE_BUY)
        {
         if(LowAnteriorM1>iMAmenorBufferM1[1] && iMomentumMenorM1[1]>=100.20)
           {
            //StopLossModiffyCondicion[5]=iMAmenorBufferM1[1];

            for(int jk=4; jk<8; jk++)
              {
               double valor=CopiarMediasMovilesMenores(position_symbol,digits,PERIOD_M1,jk,MODE_SMA,0);
               if(valor<LowAnteriorM1)
                 {
                  jk=8;
                  StopLossModiffyCondicion[5]=valor;
                 }
              }

           }

         if(iADXMenorBuffer[1]>55 && (iADXMenorBufferDpos[1]>iADXMenorBufferDneg[1]))
           {

            for(int jk=3; jk<8; jk++)
              {
               double valor=CopiarMediasMovilesMenores(position_symbol,digits,PERIOD_M5,jk,MODE_SMA,0);
               if(valor<LowAnteriorM5)
                 {
                  jk=8;
                  StopLossModiffyCondicion[2]=valor;
                 }
              }
           }

         if(iADXMenorBufferDpos[1]>40 && (iADXMenorBufferDpos[1]>iADXMenorBufferDneg[1]))
           {

            for(int jk=4; jk<8; jk++)
              {
               double valor=CopiarMediasMovilesMenores(position_symbol,digits,PERIOD_M5,jk,MODE_EMA,1);
               if(valor<LowAnteriorM5)
                 {
                  jk=8;
                  StopLossModiffyCondicion[3]=valor;
                 }
              }
           }

         if(iEnvelopesPlus[1]<LowAnteriorM5 && iMomentumMenor[1]>100.20)
           {
            StopLossModiffyCondicion[4]=iEnvelopesPlus[1];
           }

         if(iRSIBuffer[1]<70 && iRSIBuffer[2]>=70 && (iADXMayorBuffer[1]>35 || iADXMenorBuffer[1]>55)) //|| iADXMenorBuffer[1]>35 || iADXMenorBuffer[2]>35))
           {
            if(LowAnteriorM5>iEnvelopesMinus[1])
              {
               Print("ACAA");
               if(LowAnterior2M5<iEnvelopesMinus[2])
                 {
                  int fase=1;
                  double valor;
                  do
                    {
                     fase++;
                     valor=iLow(position_symbol,PERIOD_M5,fase);
                     if(fase==2)
                       {
                        StopLossModiffyCondicion[1]=valor;
                       }
                     else
                       {
                        if(StopLossModiffyCondicion[1]>valor)
                          {
                           StopLossModiffyCondicion[1]=valor;
                          }
                       }
                    }
                  while(valor<iEnvelopesMinus[fase] && fase<19);
                  StopLossModiffyCondicion[1]=StopLossModiffyCondicion[1];
                 }

               else
                 {
                  StopLossModiffyCondicion[1]=iEnvelopesMinus[1];
                 }
              }

            else
              {
               if(bid>LowAnteriorM5-1*points*10)
                 {
                  StopLossModiffyCondicion[1]=LowAnteriorM5-1*points*10;
                 }
               else
                 {
                  Trade.PositionClose(position_ticket);
                 }
              }
           }
         if(iEnvelopesMinusMayor[1]<LowAnterior)
           {
            StopLossModiffyCondicion[0]=iEnvelopesMinusMayor[1];
           }

        }
      else
        {
         if(HighAnteriorM1<iMAmenorBufferM1[1] && iMomentumMenorM1[1]<=99.80)
           {
            //StopLossModiffyCondicion[5]=iMAmenorBufferM1[1];

            for(int jk=4; jk<8; jk++)
              {
               double valor=CopiarMediasMovilesMenores(position_symbol,digits,PERIOD_M1,jk,MODE_SMA,0);
               if(valor>HighAnteriorM1)
                 {
                  jk=8;
                  StopLossModiffyCondicion[5]=valor;
                 }
              }
           }

         if(iADXMenorBuffer[1]>55 && (iADXMenorBufferDpos[1]<iADXMenorBufferDneg[1]))
           {
            for(int jk=4; jk<8; jk++)
              {
               double valor=CopiarMediasMovilesMenores(position_symbol,digits,PERIOD_M5,jk,MODE_SMA,0);
               if(valor>HighAnteriorM5)
                 {
                  jk=8;
                  StopLossModiffyCondicion[2]=valor;
                 }
              }
           }

         if(iADXMenorBufferDneg[1]>40 && (iADXMenorBufferDpos[1]<iADXMenorBufferDneg[1]))
           {

            for(int jk=4; jk<8; jk++)
              {
               double valor=CopiarMediasMovilesMenores(position_symbol,digits,PERIOD_M5,jk,MODE_EMA,1);
               if(valor>HighAnteriorM5)
                 {
                  jk=8;
                  StopLossModiffyCondicion[3]=valor;
                 }
              }
           }

         if(iEnvelopesMinus[1]>HighAnteriorM5 && iMomentumMenor[1]<99.80)
           {
            StopLossModiffyCondicion[4]=iEnvelopesMinus[1];

           }

         if(iRSIBuffer[1]>30 && iRSIBuffer[2]<=30 && (iADXMayorBuffer[1]>35  || iADXMenorBuffer[1]>55))  //|| iADXMenorBufferDneg[2]>35 || iADXMenorBufferDneg[2]>35))
           {
            if(HighAnteriorM5<iEnvelopesPlus[1])
              {
               if(HighAnterior2M5>iEnvelopesPlus[2])
                 {
                  int fase=1;
                  double valor;
                  do
                    {
                     fase++;
                     valor=iHigh(position_symbol,PERIOD_M5,fase);
                     if(fase==2)
                       {
                        StopLossModiffyCondicion[1]=valor;
                       }
                     else
                       {
                        if(StopLossModiffyCondicion[1]<valor)
                          {
                           StopLossModiffyCondicion[1]=valor;
                          }
                       }
                    }
                  while(valor>iEnvelopesPlus[fase] && fase<19);
                  StopLossModiffyCondicion[1]=StopLossModiffyCondicion[1];
                 }

               else
                 {
                  //comentario="ENTRO 44";
                  StopLossModiffyCondicion[1]=iEnvelopesPlus[1];
                 }
              }

            else
              {
               if(ask<HighAnteriorM5+1*points*10)
                 {
                  StopLossModiffyCondicion[1]=HighAnteriorM5+1*points*10;
                 }
               else
                 {
                  Trade.PositionClose(position_ticket);
                 }
              }
           }

         if(iEnvelopesPlusMayor[1]>HighAnterior)
           {
            StopLossModiffyCondicion[0]=iEnvelopesPlusMayor[1];
           }

        }
      slModify=ComparacionStopLoss(type);
      if(type==POSITION_TYPE_BUY)
        {
         if(slModify<sl && sl!=0)
            TrailingGlobal=false;
         else
            TrailingGlobal=true;
        }
      else
        {
         if(slModify>sl && sl!=0)
            TrailingGlobal=false;
         else
            TrailingGlobal=true;
        }
      if(slModify==0)
        {
         TrailingGlobal=false;
        }

      slModify=NormalizeDouble(slModify,digits);

      if(slModify==sl)
        {
         TrailingGlobal=false;
        }


      if(TrailingGlobal==true)
        {
         if(type==POSITION_TYPE_BUY)
           {
            if(bid<slModify)
              {
               Trade.PositionClose(position_ticket,-1);
               TrailingGlobal=false;
              }
           }
         else
           {
            if(ask>slModify)
              {
               Trade.PositionClose(position_ticket,-1);
               TrailingGlobal=false;
              }
           }

        }
      //--- reseteo de los valores de la solicitud y el resultado

      if(TrailingGlobal==true)
        {
         Print("StopLossModify=",slModify);
         ZeroMemory(request);
         ZeroMemory(result);
         //--- establecer los parámetros de la operación
         request.action  =TRADE_ACTION_SLTP; // tipo de operación comercial
         request.position=position_ticket;   // ticket de la posición
         request.symbol=position_symbol;     // símbolo
         request.sl      =slModify;                // Stop Loss de la posición
         request.tp      =tp;                // Take Profit de la posición
         request.magic=magic;        // Número mágico de la posición}
         //--- mostrar información de la modificación
         PrintFormat("Modify #%I64d %s %s",position_ticket,position_symbol,EnumToString(type));
         //--- envío de la solicitud
         if(!OrderSend(request,result))
            PrintFormat("OrderSend error %d",GetLastError());  // si no se ha logrado enviar la solicitud, mostrar el código de error
         //--- información sobre la operación
         PrintFormat("retcode=%u  deal=%I64u  order=%I64u",result.retcode,result.deal,result.order);
         Print("Condicion de Stop Loss = ",Condicion);
        }
     }
   PositionTotalAnterior=total;
//Comment(comentario);
//}
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CopiarMediasMovilesMenores(string name,int digitos,ENUM_TIMEFRAMES Time,int PeriodoIndicador,ENUM_MA_METHOD MetodoMa,int Switch)
  {
   int handleIndicator;
   double handleEma[2];
   handleIndicator=iMA(name,Time,PeriodoIndicador,Switch,MetodoMa,PRICE_CLOSE);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleIndicator,0,0,2,handleEma)<0)
     {
      Sleep(5);
     };
   ArrayReverse(handleEma,0,2);
   double Valor=NormalizeDouble(handleEma[1],digitos);
   return Valor;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopiarRSI(string name,int digitos)
  {
   handleRSI=iRSI(name,PERIOD_M5,14,PRICE_CLOSE);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleRSI,0,0,3,iRSIBuffer)<0)
     {
      Sleep(5);
     };
   ArrayReverse(iRSIBuffer,0,3);
   iRSIBuffer[0]=NormalizeDouble(iRSIBuffer[0],digitos);
   iRSIBuffer[1]=NormalizeDouble(iRSIBuffer[1],digitos);
   iRSIBuffer[2]=NormalizeDouble(iRSIBuffer[2],digitos);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopiarEMA(string name,int digitos,ENUM_TIMEFRAMES Time,int PeriodoIndicador,ENUM_MA_METHOD metodo,ENUM_APPLIED_PRICE PriceMode,double &BufferIndicador[])
  {
   handleMediaMenor=iMA(name,Time,PeriodoIndicador,0,metodo,PriceMode);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleMediaMenor,0,0,3,BufferIndicador)<0)
     {
      Sleep(5);
     };
   ArrayReverse(BufferIndicador,0,3);
   for(int i=0; i<3; i++)
     {
      BufferIndicador[i]=NormalizeDouble(BufferIndicador[i],digitos);
     }
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopiarBufferADX(string name,int digitos,ENUM_TIMEFRAMES Time,int PeriodoIndicador,int opcion,double &BufferIndicador[])
  {
   int handleIndicador;

   handleIndicador=iADX(name,Time,PeriodoIndicador);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleIndicador,opcion,0,3,BufferIndicador)<0)
     {
      Sleep(5);
     };
   ArrayReverse(BufferIndicador,0,3);
   for(int i=0; i<3; i++)
     {
      BufferIndicador[i]=NormalizeDouble(BufferIndicador[i],digitos);
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopiarEnvelopes(string name,int digitos,ENUM_TIMEFRAMES Time,int PeriodoIndicador,int shift,ENUM_MA_METHOD metodo,ENUM_APPLIED_PRICE pricemode,double desviacion,int opcion,double &BufferIndicador[])
  {
   int handleIndicador;
   handleIndicador=iEnvelopes(name,Time,PeriodoIndicador,shift,metodo,pricemode,desviacion);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleIndicador,opcion,0,3,BufferIndicador)<0)
     {
      Sleep(5);
     };
   ArrayReverse(BufferIndicador,0,3);
   for(int i=0; i<3; i++)
     {
      BufferIndicador[i]=NormalizeDouble(BufferIndicador[i],digitos);
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopiarMomentun(string name,int digitos,ENUM_TIMEFRAMES Time,int PeriodoIndicador,ENUM_APPLIED_PRICE pricemode,double &BufferIndicador[])
  {
   int handleIndicador;
   handleIndicador=iMomentum(name,Time,PeriodoIndicador,pricemode);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleIndicador,0,0,3,BufferIndicador)<0)
     {
      Sleep(5);
     };
   ArrayReverse(BufferIndicador,0,3);
   for(int i=0; i<3; i++)
     {
      BufferIndicador[i]=NormalizeDouble(BufferIndicador[i],digitos);
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double ComparacionStopLoss(ENUM_POSITION_TYPE Tipo)
  {
   double valor=0;
   bool Primero=false;
   if(Tipo==POSITION_TYPE_BUY)
     {
      for(int i=0; i<6; i++)
        {
         if(Primero==false)
           {
            if(StopLossModiffyCondicion[i]!=0)
              {
               valor=StopLossModiffyCondicion[i];
               Condicion=i;
               Primero=true;
              }
           }
         else
           {
            if(valor<StopLossModiffyCondicion[i])
              {
               valor=StopLossModiffyCondicion[i];
               Condicion=i;
              }
           }
        }
     }
   if(Tipo==POSITION_TYPE_SELL)
     {
      for(int i=0; i<6; i++)
        {
         if(Primero==false)
           {
            if(StopLossModiffyCondicion[i]!=0)
              {
               valor=StopLossModiffyCondicion[i];
               Condicion=i;
               Primero=true;
              }
           }
         else
           {
            if(valor>StopLossModiffyCondicion[i] && StopLossModiffyCondicion[i]!=0)
              {
               valor=StopLossModiffyCondicion[i];
               Condicion=i;
              }
           }
        }
     }
   return valor;
  }
//+------------------------------------------------------------------+
