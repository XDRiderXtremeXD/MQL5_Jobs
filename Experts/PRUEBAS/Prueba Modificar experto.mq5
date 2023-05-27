//+------------------------------------------------------------------+
//|                                     Prueba Modificar experto.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|  Enumeración de modos de crear el manejador                      |
//+------------------------------------------------------------------+

input int                  ma_period=10;                 // período de la media
//input int                  ma_shift=0;                   // desplazamiento
input ENUM_MA_METHOD       ma_method=MODE_SMA;           // tipo de suavizado
input ENUM_APPLIED_PRICE   applied_price=PRICE_CLOSE;    // tipo de precio
input ENUM_TIMEFRAMES      period=PERIOD_H1;        // timeframe
input int CantidadDeMAs=8;

input int Desplazamiento=2;
//--- búfer indicador
double iMABuffer[2];
int    handle;

uint PeriodosMA[8];
double ValoresMAs[8];

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
   
   if(CantidadDeMAs>8){
   Print("Cantidad de EMAS no debe superar el valor de 8");
   return(INIT_FAILED);
    }
   
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
//--- declaración de la solicitud y el resultado
   MqlTradeRequest request;
   MqlTradeResult  result;
   int total=PositionsTotal(); // número de posiciones abiertas
//--- iteración de todas las posiciones abiertas
   for(int i=0; i<total; i++)
     {
      //--- parámetros de la orden
      ulong  position_ticket=PositionGetTicket(i);// ticket de la posición
      string position_symbol=PositionGetString(POSITION_SYMBOL); // símbolo
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
      double bid=SymbolInfoDouble(position_symbol,SYMBOL_BID);
      double ask=SymbolInfoDouble(position_symbol,SYMBOL_ASK);
      int    stop_level=(int)SymbolInfoInteger(position_symbol,SYMBOL_TRADE_STOPS_LEVEL);

      CopiarMediasMoviles(position_symbol,digits);
      double HighAnterior=iHigh(position_symbol,period,1);
      double LowAnterior=iLow(position_symbol,period,1);

      bool Trailing=false;
      bool TrailingGlobal=false;

      if(type==POSITION_TYPE_BUY)
        {
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
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopiarMediasMoviles(string name,int digitos)
  {

   for(int i=0; i<CantidadDeMAs; i++)
     {
      handle=iMA(name,period,PeriodosMA[i],0,ma_method,applied_price);
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
