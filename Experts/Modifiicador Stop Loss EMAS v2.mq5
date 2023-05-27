//+------------------------------------------------------------------+
//|                               Modifiicador Stop Loss EMAS v2.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
//#include<Trade\Trade.mqh>
//CTrade  Trade;

//input int                  ma_shift=0;                   // desplazamiento
input ENUM_MA_METHOD       ma_method=MODE_SMA;           // tipo de suavizado
input ENUM_APPLIED_PRICE   applied_price=PRICE_CLOSE;    // tipo de precio
input ENUM_TIMEFRAMES      PeriodTimeFrames=PERIOD_H1;        // timeframe

//input int                  ma_shift=0;                   // desplazamiento
input ENUM_MA_METHOD       ma_method2=MODE_SMA;           // tipo de suavizado
input ENUM_APPLIED_PRICE   applied_price2=PRICE_CLOSE;    // tipo de precio
input ENUM_TIMEFRAMES      PeriodTimeFrames2=PERIOD_M5;        // timeframe
input int                  PeriodMASec=8;        // timeframe

input int CantidadDeMAs=8;

input int Desplazamiento=2;
//--- búfer indicador
double iMABuffer[2];
double iMABuffer2[2];
int    handle;
int    handle2;
double ValorMASecond;

uint PeriodosMA[8];
double ValoresMAs[8];
int TiempoAnterior=-1;
int Tiempo, TiempoDivisible;
int PositionTotalAnterior;

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
  
   //Trade.Sell(0.1);
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


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
//--- declaración de la solicitud y el resultado
   MqlTradeRequest request;
   MqlTradeResult  result;
//--- iteración de todas las posiciones abiertas
   int total=PositionsTotal(); // número de posiciones abiertas
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
      double slModify=NormalizeDouble(0,digits);
      double slModify2=NormalizeDouble(0,digits);
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);  // tipo de posición

      //--- cálculo de los niveles de precio actuales
      double OpenPrice=PositionGetDouble(POSITION_PRICE_OPEN);
      double bid=SymbolInfoDouble(position_symbol,SYMBOL_BID);
      double ask=SymbolInfoDouble(position_symbol,SYMBOL_ASK);
      int    stop_level=(int)SymbolInfoInteger(position_symbol,SYMBOL_TRADE_STOPS_LEVEL);

      CopiarMediasMoviles(position_symbol,digits);
      CopiarMediaMovilSec(position_symbol,digits);
      double HighAnterior=iHigh(position_symbol,PeriodTimeFrames,1);
      double LowAnterior=iLow(position_symbol,PeriodTimeFrames,1);
      double HighAnterior2=iHigh(position_symbol,PeriodTimeFrames2,1);
      double LowAnterior2=iLow(position_symbol,PeriodTimeFrames2,1);


      bool Trailing=false;
      bool TrailingGlobal=false;

      if(type==POSITION_TYPE_BUY)
        {

         if( (sl<OpenPrice || sl==0) && LowAnterior2>ValorMASecond)
           {
            double Modificador=ValorMASecond-10*Desplazamiento*points;
            if(sl==0)
              {
               if(Modificador<OpenPrice)
                  slModify2=Modificador;
               else
                  slModify2=OpenPrice;
              }
            else
              {
               if(Modificador<OpenPrice && sl<Modificador)
                  slModify2=Modificador;
               else
                  if(Modificador>OpenPrice && sl<Modificador)
                     slModify2=OpenPrice;
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
           if(slModify2!=0 && TrailingGlobal==true){
           if(slModify<slModify2){
           slModify=slModify2;
           }
           }
           else if(slModify2!=0 && TrailingGlobal==false){
           slModify=slModify2;
           TrailingGlobal=true;
           }
           
           if(bid<slModify && TrailingGlobal==true){
           TrailingGlobal=false;
           }
           
        }
      else
        {
        if( (sl>OpenPrice || sl==0) && HighAnterior2<ValorMASecond)
           {
            double Modificador=ValorMASecond+10*Desplazamiento*points;
            if(sl==0)
              {
               if(Modificador>OpenPrice)
                  slModify2=Modificador;
               else
                  slModify2=OpenPrice;
              }
            else
              {
               if(Modificador>OpenPrice && sl>Modificador)
                  slModify2=Modificador;
               else
                  if(Modificador<OpenPrice && sl>Modificador)
                     slModify2=OpenPrice;
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
           
           if(slModify2!=0 && TrailingGlobal==true){
           if(slModify>slModify2){
           slModify=slModify2;
           }
           }
           else if(slModify2!=0 && TrailingGlobal==false){
           slModify=slModify2;
           TrailingGlobal=true;
           }
           
           if(ask>slModify && TrailingGlobal==true){
           TrailingGlobal=false;
           }
           
        }
      slModify=NormalizeDouble(slModify,digits);
      if(slModify==sl)
        {
         TrailingGlobal=false;
        }
        
      Comment("slModify=",slModify," ","slModify2= ",slModify2,"\n",TimeToString(TimeCurrent(),TIME_DATE|TIME_SECONDS));
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
void CopiarMediaMovilSec(string name,int digitos)
  {
   handle2=iMA(name,PeriodTimeFrames2,PeriodMASec,0,ma_method2,applied_price2);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handle2,0,0,2,iMABuffer2)<0)
     {
      Sleep(5);
     };
   ArrayReverse(iMABuffer2,0,2);
   ValorMASecond=NormalizeDouble(iMABuffer2[1],digitos);
  }
//+------------------------------------------------------------------+
