//+------------------------------------------------------------------+
//|                                                 PipsAlert SP.mq5 |
//|                                    Copyright 2020, David J. Díez |
//|                         https://www.mql5.com/es/users/davidjdiez |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, David J. Díez Munilla"
#property link      "https://www.mql5.com/en/users/davidjdiez"
#property version   "1.00"
//+--- Paramenters --------------------------------------------------!
input bool JaguarSignals = true;
input int  JaguarStart   = 6;
input int  JaguarStop    = 16;
input bool LionSignals   = true;
input int  LionStart     = 0;
input int  LionStop      = 24;
input ENUM_TIMEFRAMES AutoUpdate = PERIOD_M15;

   double RSIS[],RSIM[],RSIL[],RSIX[];
   double PDIS[],PDIM[],PDIL[],PDIX[];
   double MDIS[],MDIM[],MDIL[],MDIX[];

datetime AU=0;
datetime UNTIL=D'2020.11.29 00:00';
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit() {
   ArraySetAsSeries(RSIS,true);
   ArraySetAsSeries(RSIM,true);
   ArraySetAsSeries(RSIL,true);
   ArraySetAsSeries(RSIX,true);
   ArraySetAsSeries(PDIS,true);
   ArraySetAsSeries(PDIM,true);
   ArraySetAsSeries(PDIL,true);
   ArraySetAsSeries(PDIX,true);
   ArraySetAsSeries(MDIS,true);
   ArraySetAsSeries(MDIM,true);
   ArraySetAsSeries(MDIL,true);
   ArraySetAsSeries(MDIL,true);
return(INIT_SUCCEEDED);}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason) {
Comment(""); 
}
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {      
   if(UNTIL>TimeCurrent()){
   for(int s=0; s<SymbolsTotal(true) && AU!=iTime(Symbol(),AutoUpdate,1); s++)
     {   
      string SName=SymbolName(s,true);
      int ADXXh=iADX(SName,PERIOD_H4,14);
      int ADXLh=iADX(SName,PERIOD_H1,14);
      int ADXMh=iADX(SName,PERIOD_M30,14);
      int ADXSh=iADX(SName,PERIOD_M15,14);
      int RSISh=iRSI(SName,PERIOD_H1,14,PRICE_CLOSE);
      int RSIMh=iRSI(SName,PERIOD_H4,14,PRICE_CLOSE);
      int RSILh=iRSI(SName,PERIOD_D1,14,PRICE_CLOSE);
      int RSIXh=iRSI(SName,PERIOD_W1,14,PRICE_CLOSE);
      CopyBuffer(RSISh,0,0,3,RSIS);
      CopyBuffer(RSIMh,0,0,3,RSIM);
      CopyBuffer(RSILh,0,0,3,RSIL);
      CopyBuffer(RSIXh,0,0,3,RSIX);
      CopyBuffer(ADXSh,1,0,3,PDIS);
      CopyBuffer(ADXSh,2,0,3,MDIS);
      CopyBuffer(ADXMh,1,0,3,PDIM);
      CopyBuffer(ADXMh,2,0,3,MDIM);
      CopyBuffer(ADXLh,1,0,3,PDIL);
      CopyBuffer(ADXLh,2,0,3,MDIL);
      CopyBuffer(ADXXh,1,0,3,PDIX);
      CopyBuffer(ADXXh,2,0,3,MDIX);
      //+------------------------------------------ Internal loop ---!
      int BuyOrders=0,SellOrders=0;
      MqlDateTime time;
      TimeCurrent(time);
      
      for(int i=PositionsTotal()-1; i>=0; i--)
        {
         ulong iTicket=PositionGetTicket(i);
         if(PositionGetString(POSITION_SYMBOL)==SName)
           {
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
              {
               BuyOrders++;
              }
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
              { Print(SName);
               SellOrders++;
              }
           if(Symbol()==SName)
            Comment("SYMBOL ",Symbol(),":Buy orders: ",BuyOrders,", Sell orders: ",SellOrders);                                               // Every time 1 sell order
           }
        }
      
      for(int i=OrdersTotal()-1; i>=0; i--)
        {
         ulong iTicket=OrderGetTicket(i);
         if(OrderGetString(ORDER_SYMBOL)==SName)
           {
            if(OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_BUY || OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_BUY_STOP ||  OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_BUY_LIMIT )
               BuyOrders++;
            if(OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_SELL || OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_SELL_STOP ||  OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_SELL_LIMIT)
               SellOrders++;
           if(Symbol()==SName)
            Comment("SYMBOL ",Symbol(),":Buy orders: ",BuyOrders,", Sell orders: ",SellOrders);                                               // Every time 1 sell order
           }
        }
      //+------------------------------------------------- Jaguar ---!
      
      if(JaguarSignals==true)
        {
         if((JaguarStart<JaguarStop&&(time.hour>=JaguarStart&&time.hour<JaguarStop))
            ||(JaguarStart>JaguarStop&&(time.hour>=JaguarStart||time.hour<JaguarStop)))
           {
            if( ((RSIS[1]+RSIM[1]+RSIL[0])/3.0<40 || (RSIS[1]+RSIM[1]+RSIL[1])/3.0<40) && BuyOrders<1)
              {
               if((PDIS[1]+PDIM[1]+PDIL[1])/3.0 > (MDIS[1]+MDIM[1]+MDIL[1])/3.0)
                 {
                  SendNotification("New Jaguar "+SName+" signal: BUY.");
                  Alert("New Jaguar "+SName+" signal: BUY.");
                 }
              }
            if(  ((RSIS[1]+RSIM[1]+RSIL[0])/3.0>60 || (RSIS[1]+RSIM[1]+RSIL[1])/3.0>60) && SellOrders<1)
              {
               if( (PDIS[1]+PDIM[1]+PDIL[1])/3.0 <(MDIS[1]+MDIM[1]+MDIL[1])/3.0)
                 {
                  SendNotification("New Jaguar "+SName+" signal: SELL.");
                  Alert("New Jaguar "+SName+" signal: SELL.");
                 }
              }
           }
        }
      //+--------------------------------------------------- Lion ---!
      if(LionSignals==true)
        {
         if((LionStart<LionStop&&(time.hour>=LionStart&&time.hour<LionStop))
            ||(LionStart>LionStop&&(time.hour>=LionStart||time.hour<LionStop)))
           {
            if( ((RSIM[1]+RSIL[1]+RSIX[0])/3.0<40 || (RSIM[1]+RSIL[1]+RSIX[1])/3.0<40) && BuyOrders<1)
              { 
               if( (PDIM[1]+PDIL[1]+PDIX[1])/3.0> (MDIM[1]+MDIL[1]+MDIX[1])/3.0)
                 {
                  SendNotification("New Lion "+SName+" signal: BUY.");
                  Alert("New Lion "+SName+" signal: BUY.");
                 }
              }
            if( ((RSIM[1]+RSIL[1]+RSIX[0])/3.0>60 || (RSIM[1]+RSIL[1]+RSIX[1])/3.0>60) && SellOrders<1)
              {  
               if( (PDIM[1]+PDIL[1]+PDIX[1])/3.0 < (MDIM[1]+MDIL[1]+MDIX[1])/3.0)
                 {
                  SendNotification("New Lion "+SName+" signal: SELL.");
                  Alert("New Lion "+SName+" signal: SELL.");
                 }
              }
           }
        }
     }
   AU=iTime(Symbol(),AutoUpdate,1);
   }
  }
//+------------------------------------------------------------------+ Every time 1 sell order, notification
//+------------------------------------------------------------------+