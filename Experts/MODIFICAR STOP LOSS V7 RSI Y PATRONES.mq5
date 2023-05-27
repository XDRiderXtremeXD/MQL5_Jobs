//+------------------------------------------------------------------+
//|                        MODIFICAR STOP LOSS V7 RSI Y PATRONES.mq5 |
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
double iMABuffer[3];
double iRSIBuffer[3];
double iMAmenorBuffer[20];
double iADXMenorBuffer[20];
double iADXMenorBufferDpos[20];
double iADXMenorBufferDneg[20];

int    handle;
int    handleRSI;
int handleMediaMenor;
int iADXHandleMenor;
int iADXHandleMenorDpos;
int iADXHandleMenorDneg;

uint PeriodosMA[8];
double ValoresMAs[8];
double RSIValor;

int TiempoAnterior=-1;
int Tiempo, TiempoDivisible;
int PositionTotalAnterior;
string comentario;


input uint Period1=3;
input uint Period2=4;
input uint Period3=5;
input uint Period4=8;
input uint Period5=10;
input uint Period6=12;
input uint Period7=14;
input uint Period8=16;



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   //Trade.Buy(1,NULL,0,0,0,NULL);
   TiempoAnterior=-1;

   if(CantidadDeMAs>8)
     {
      Print("Cantidad de EMAS no debe superar el valor de 8");
      return(INIT_FAILED);
     }
   PositionTotalAnterior=-1;

   PeriodosMA[0]=Period1;
   PeriodosMA[1]=Period2;
   PeriodosMA[2]=Period3;
   PeriodosMA[3]=Period4;
   PeriodosMA[4]=Period5;
   PeriodosMA[5]=Period6;
   PeriodosMA[6]=Period7;
   PeriodosMA[7]=Period8;
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
   MqlDateTime TiempoActual;
   TimeCurrent(TiempoActual);
   int total=PositionsTotal(); // número de posiciones abiertas
   
   double ASK=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   /*if(PositionsTotal()==0)
     {
      if(ASK<iMAmenorBuffer[1])
         Trade.Buy(8);
     }*/

   int PeriodTimeFramesSeconds=PeriodSeconds(PeriodTimeFrames);

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
      double slModify=0;
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);  // tipo de posición

      //--- cálculo de los niveles de precio actuales
      double price=PositionGetDouble(POSITION_PRICE_OPEN);
      //comentario=price+" "+iRSIBuffer[0]+" "+iRSIBuffer[1]+" "+iRSIBuffer[2];
      double bid=SymbolInfoDouble(position_symbol,SYMBOL_BID);
      double ask=SymbolInfoDouble(position_symbol,SYMBOL_ASK);
      int    stop_level=(int)SymbolInfoInteger(position_symbol,SYMBOL_TRADE_STOPS_LEVEL);

      CopiarMediasMoviles(position_symbol,digits);
      CopiarRSI(position_symbol,digits);
      CopiarEMAmenor(position_symbol,digits);
      CopiarADXmenor(position_symbol,digits);
      CopiarADXmenorDpos(position_symbol,digits);

      double HighAnterior=iHigh(position_symbol,PeriodTimeFrames,1);
      double LowAnterior=iLow(position_symbol,PeriodTimeFrames,1);

      double HighAnteriorM5=iHigh(position_symbol,PERIOD_M5,1);
      double LowAnteriorM5=iLow(position_symbol,PERIOD_M5,1);
      double HighAnterior2M5=iHigh(position_symbol,PERIOD_M5,2);
      double LowAnterior2M5=iLow(position_symbol,PERIOD_M5,2);
     
      Comment(LowAnterior2M5," ",iMAmenorBuffer[1]," ",iADXMenorBuffer[1]);
      double StopLossModiffyRSI=0;

      bool Trailing=false;
      bool TrailingGlobal=false;

      if(type==POSITION_TYPE_BUY)
        {
         if(iRSIBuffer[1]<70 && iRSIBuffer[2]>=70 && (iADXMenorBuffer[1]>35 || iADXMenorBuffer[2]>35|| iADXMenorBufferDpos[1]>55 || iADXMenorBufferDpos[2]>55 ))//|| iADXMenorBufferDpos[1]>35 || iADXMenorBufferDpos[2]>35))
           {
            if(LowAnteriorM5>iMAmenorBuffer[1])
              {
               if(LowAnterior2M5<iMAmenorBuffer[2])
                 {
                  int fase=1;
                  double valor;
                  do
                    {
                     fase++;
                     valor=iLow(position_symbol,PERIOD_M5,fase);
                     if(fase==2)
                       {
                        StopLossModiffyRSI=valor;
                       }
                     else
                       {
                        if(StopLossModiffyRSI>valor)
                          {
                           StopLossModiffyRSI=valor;
                          }
                       }
                    }
                  while(valor<iMAmenorBuffer[fase] && fase<19);
                  StopLossModiffyRSI=StopLossModiffyRSI-1*points*10;
                 }

               else
                 {
                  StopLossModiffyRSI=iMAmenorBuffer[1]-1*points*10;
                 }
              }

            else
              {
               if(bid>LowAnteriorM5-1*points*10)
                 {
                  StopLossModiffyRSI=LowAnteriorM5-1*points*10;
                 }
               else
                 {
                  Trade.PositionClose(position_ticket);
                 }
              }

            if(StopLossModiffyRSI<sl && sl!=0)
              {
               StopLossModiffyRSI=0;
              }

           }

         for(int c=0; c<CantidadDeMAs; c++)
           {
            if(ValoresMAs[c]<bid && LowAnterior>ValoresMAs[c])
              {
               Trailing=true;
               c=CantidadDeMAs;
              }
           }
         bool ValorMAsl=false;
         if(Trailing==true)
           {
            for(int c=0; c<CantidadDeMAs; c++)
              {
               if(ValoresMAs[c]<bid && LowAnterior>ValoresMAs[c])
                 {
                  if(ValorMAsl==false)
                    {
                     slModify=ValoresMAs[c];
                     ValorMAsl=true;
                    }
                  else
                    {
                     if(slModify<ValoresMAs[c])
                       {
                        slModify=ValoresMAs[c];
                       }
                    }
                 }
              }
            slModify=slModify-Desplazamiento*points*10;
            if(sl<slModify || sl==0)
              {
               TrailingGlobal=true;
              }
           }
        }
      else
        {

         if(iRSIBuffer[1]>30 && iRSIBuffer[2]<=30 && (iADXMenorBuffer[1]>35 || iADXMenorBufferDneg[1]>35 || iADXMenorBufferDpos[1]>55 || iADXMenorBufferDpos[2]>55 ))//|| iADXMenorBufferDneg[2]>35 || iADXMenorBufferDneg[2]>35))
           {
            if(HighAnteriorM5<iMAmenorBuffer[1])
              {
               if(HighAnterior2M5>iMAmenorBuffer[2])
                 {
                  int fase=1;
                  double valor;
                  do
                    {
                     fase++;
                     valor=iHigh(position_symbol,PERIOD_M5,fase);
                     if(fase==2)
                       {
                        StopLossModiffyRSI=valor;
                       }
                     else
                       {
                        if(StopLossModiffyRSI<valor)
                          {
                           StopLossModiffyRSI=valor;
                          }
                       }
                    }
                  while(valor>iMAmenorBuffer[fase] && fase<19);
                  StopLossModiffyRSI=StopLossModiffyRSI+1*points*10;
                 }

               else
                 {
                  //comentario="ENTRO 44";
                  StopLossModiffyRSI=iMAmenorBuffer[1]+1*points*10;
                 }
              }

            else
              {
               if(ask<HighAnteriorM5+1*points*10)
                 {
                  StopLossModiffyRSI=HighAnteriorM5+1*points*10;
                 }
               else
                 {
                  Trade.PositionClose(position_ticket);
                 }
              }

            if(StopLossModiffyRSI>sl && sl!=0)
              {
               StopLossModiffyRSI=0;
              }
           }

         for(int c=0; c<CantidadDeMAs; c++)
           {
            if(ValoresMAs[c]>ask && HighAnterior<ValoresMAs[c])
              {
               Trailing=true;
               c=CantidadDeMAs;
              }
           }
         bool ValorMAsl=false;
         if(Trailing==true)
           {
            for(int c=0; c<CantidadDeMAs; c++)
              {
               if(ValoresMAs[c]>ask && HighAnterior<ValoresMAs[c])
                 {
                  if(ValorMAsl==false)
                    {
                     slModify=ValoresMAs[c];
                     ValorMAsl=true;
                    }
                  else
                    {
                     if(slModify>ValoresMAs[c])
                       {
                        slModify=ValoresMAs[c];
                       }
                    }
                 }
              }
            slModify=slModify+Desplazamiento*points*10;
            if(sl>slModify || sl==0)
              {
               TrailingGlobal=true;
              }
           }
        }


      if(StopLossModiffyRSI!=0)
        {
         if(TrailingGlobal==true)
           {
            if(type==POSITION_TYPE_BUY)
              {
               if(slModify<StopLossModiffyRSI)
                 {
                  slModify=StopLossModiffyRSI;
                 }
              }
            else
              {
               if(slModify>StopLossModiffyRSI)
                 {
                  slModify=StopLossModiffyRSI;
                 }
              }
           }
         else
           {
            TrailingGlobal=true;
            slModify=StopLossModiffyRSI;
           }
        }

      slModify=NormalizeDouble(slModify,digits);



      if(slModify==sl)
        {
         TrailingGlobal=false;
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
        }
     }
   TiempoAnterior=Tiempo;
   PositionTotalAnterior=total;
   //Comment(comentario);
//}
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopiarMediasMoviles(string name,int digitos)
  {

   for(int i=0; i<CantidadDeMAs; i++)
     {
      handle=iMA(name,PeriodTimeFrames,PeriodosMA[i],0,ma_method,applied_price);
      //ArraySetAsSeries(iMABuffer,true);
      while(CopyBuffer(handle,0,0,2,iMABuffer)<0)
        {
         Sleep(5);
        };
      ArrayReverse(iMABuffer,0,2);
      ValoresMAs[i]=NormalizeDouble(iMABuffer[1],digitos);
     }
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
void CopiarEMAmenor(string name,int digitos)
  {
   handleMediaMenor=iMA(name,PeriodTimeFrames2,ma_period2,0,ma_method2,applied_price);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleMediaMenor,0,0,20,iMAmenorBuffer)<0)
     {
      Sleep(5);
     };
   ArrayReverse(iMAmenorBuffer,0,20);
   for(int i=0; i<20; i++)
     {
      iMAmenorBuffer[i]=NormalizeDouble(iMAmenorBuffer[i],digitos);
     }
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

void CopiarADXmenor(string name,int digitos)
  {
   iADXHandleMenor=iADX(name,PERIOD_M15,14);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(iADXHandleMenor,0,0,20,iADXMenorBuffer)<0)
     {
      Sleep(5);
     };
   ArrayReverse(iADXMenorBuffer,0,20);
   for(int i=0; i<20; i++)
     {
      iADXMenorBuffer[i]=NormalizeDouble(iADXMenorBuffer[i],digitos);
     }
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

void CopiarADXmenorDpos(string name,int digitos)
  {
   iADXHandleMenorDpos=iADX(name,PeriodTimeFrames2,14);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(iADXHandleMenorDpos,0,0,20,iADXMenorBufferDpos)<0)
     {
      Sleep(5);
     };
   ArrayReverse(iADXMenorBufferDpos,0,20);
   for(int i=0; i<20; i++)
     {
      iADXMenorBufferDpos[i]=NormalizeDouble(iADXMenorBufferDpos[i],digitos);
     }
  }
//+------------------------------------------------------------------+