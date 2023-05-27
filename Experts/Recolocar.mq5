//+------------------------------------------------------------------+
//|                                                    Recolocar.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

input int     MagicNumber  = 244325;

datetime trade_time;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   trade_time=TimeCurrent();
   //OrderSend(Symbol(),OP_BUY,0.1,Ask,10,0,Ask+100*Point(),NULL,0,0,clrMagenta);
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
//---
   //if(IsDemo()||IsTesting())
   restoreOrder();
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//+ Order Entry                                                      |
//+------------------------------------------------------------------+

void OrderEntry(string symbol, double price, int direction, double Lots, double tp, double sl)
{

   
   
   //double tp = 0,sl = 0;
   int buyticket=0,sellticket=0;  
   //datetime expiry=TimeCurrent()+(ExpiryMin*60); 
   
    if(direction==OP_BUYLIMIT)
   {
      
      buyticket = OrderSend(symbol,OP_BUYLIMIT,Lots,price,10,sl,tp,NULL,MagicNumber,0,Green);
            
   }
   
   if(direction==OP_SELLLIMIT)
   {
     
      
      sellticket = OrderSend(symbol,OP_SELLLIMIT,Lots,price,10,sl,tp,NULL,MagicNumber,0,Red);
      
    }
   
    
}

void restoreOrder(){
   
   
//--- request trade history 
   HistorySelect(trade_time,TimeCurrent()); 
//--- create objects 
   string   name; 
   uint     total=HistoryDealsTotal(); 
   ulong    ticket=0; 
   double   price; 
   double   profit; 
   datetime time; 
   string   symbol; 
   long     type; 
   long     entry; 
//--- for all deals 
   for(uint i=0;i<total;i++) 
     { 
      //--- try to get deals ticket 
      if((ticket=HistoryDealGetTicket(i))>0)
        { 
         symbol=HistoryDealGetString(ticket,DEAL_SYMBOL); 
         int magic=HistoryDealGetInteger(ticket,DEAL_MAGIC); 
         
         if(magic==MagicNumber && Symbol()==symbol){
         double orderProfit=HistoryDealGetDouble(ticket,DEAL_PROFIT); 
         double ordOP=HistoryDealGetInteger(ticket,DEAL_TIME); 
         double ordTP=HistoryDealGetDouble(ticket,DEAL_PROFIT); 
         double ordSL=OrderStopLoss();
         int ordType=OrderType();
         string ordSymbol=OrderSymbol();
         double ordLot=OrderLots();
         
         
         
         
         }
        
         time  =(datetime)HistoryDealGetInteger(ticket,DEAL_TIME); 
         type  =HistoryDealGetInteger(ticket,DEAL_TYPE); 
         entry =HistoryDealGetInteger(ticket,DEAL_ENTRY); 
         profit=HistoryDealGetDouble(ticket,DEAL_PROFIT); 
         //--- only for current symbol 
         if(price && time && symbol==Symbol()) 
           { 
            //--- create price object 
            name="TradeHistory_Deal_"+string(ticket); 
            if(entry) ObjectCreate(0,name,OBJ_ARROW_RIGHT_PRICE,0,time,price,0,0); 
            else      ObjectCreate(0,name,OBJ_ARROW_LEFT_PRICE,0,time,price,0,0); 
            //--- set object properties 
            ObjectSetInteger(0,name,OBJPROP_SELECTABLE,0); 
            ObjectSetInteger(0,name,OBJPROP_BACK,0); 
            ObjectSetInteger(0,name,OBJPROP_COLOR,type?BuyColor:SellColor); 
            if(profit!=0) ObjectSetString(0,name,OBJPROP_TEXT,"Profit: "+string(profit)); 
           } 
        } 
     } 



    OrdersTotal()
   for(int b=OrdersHistoryTotal(); b>= 0; b--)
   {
      if(OrderSelect(b,SELECT_BY_POS,MODE_HISTORY)){
      double ordProfit=OrderProfit();
      datetime ordTime=OrderCloseTime();
      double ordOP=OrderOpenPrice();
      double ordTP=OrderTakeProfit();
      double ordSL=OrderStopLoss();
      int ordType=OrderType();
      string ordSymbol=OrderSymbol();
      double ordLot=OrderLots();
      
         if(ordTime>trade_time && ordProfit>0){
            if(ordType==OP_BUY)OrderEntry(ordSymbol,ordOP,OP_BUYLIMIT,ordLot,ordTP,ordSL);
            if(ordType==OP_SELL)OrderEntry(ordSymbol,ordOP,OP_SELLLIMIT,ordLot,ordTP,ordSL);
            trade_time=TimeCurrent()+2;
         }
      }
   }
}