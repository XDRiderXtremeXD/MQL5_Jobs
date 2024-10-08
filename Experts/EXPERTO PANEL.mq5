//+------------------------------------------------------------------+
//|                                             Panel de Trading.mq4 |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Adrian"
#property link      "libersat.es"
#property version   "1.00"
#property strict

input int MagicNumber = 131331;

int inicio_renglones = 40;
int distancia_renglones = 17;
bool banderapanel = true;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
//---
   Interfaz();
   Renglon1();
   Renglon2();
   Renglon3();
   Renglon4();
   Renglon5();
   
   BotonBUY();
   BotonSELL();
   BotonBUYLIMIT();
   BotonSELLLIMIT();
   BotonBREAKEVEN();
   BotonPANEL();
   BotonDL();
   
   if(!(StrToDouble(ObjectDescription("Risk"))>0)) Caja1();
   if(!(StrToDouble(ObjectDescription("SL"))>0)) Caja2();
   if(!(StrToDouble(ObjectDescription("TP1"))>0)) Caja3();
   if(!(StrToDouble(ObjectDescription("TP2"))>0)) Caja4();
   if(!(StrToDouble(ObjectDescription("TP3"))>0)) Caja5();
   if(!(StrToDouble(ObjectDescription("TP1pip"))>0)) Caja6();
   if(!(StrToDouble(ObjectDescription("TP2pip"))>0)) Caja7();
   if(!(StrToDouble(ObjectDescription("TP3pip"))>0)) Caja8();
   if(!(StrToDouble(ObjectDescription("PriceLimit"))>0)) Caja9();      
//---
   return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   /*DL();
   ocultarPanel();
   ObjectDelete("BotonPANEL");
   */
}
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{      
   if(OrdersTotal()>0)
   {      
      for(int i=0;i<OrdersTotal();i++)
      {
         int orders = OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         
         if (OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber)                    
         {
            if(OrderType()==OP_BUY)
            {
               double OP = OrderOpenPrice();
               double SL = OrderStopLoss();            
               double TP1 = ObjectDescription("TP1");
               double TP2 = ObjectDescription("TP2");
               double TP3 = ObjectDescription("TP3") ;  
               double TP1pip = StrToDouble(ObjectDescription("TP1"))-StrToDouble(ObjectDescription("TP1pip"))*Point()*10;
               double TP2pip = StrToDouble(ObjectDescription("TP2"))-StrToDouble(ObjectDescription("TP2pip"))*Point()*10;
               double TP3pip = StrToDouble(ObjectDescription("TP3"))-StrToDouble(ObjectDescription("TP3pip"))*Point()*10;
                           
               if(OP > SL && Bid >= TP1pip)
                  OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice(),OrderTakeProfit(),0,clrBlue);                   
               
               if(TP1 > SL && Bid >= TP2pip)
                  OrderModify(OrderTicket(),OrderOpenPrice(),TP1,OrderTakeProfit(),0,clrBlue);
                  
               if(TP2 > SL && Bid >= TP3pip)
                  OrderModify(OrderTicket(),OrderOpenPrice(),TP2,OrderTakeProfit(),0,clrBlue);
               
               if(Bid >= TP3)
                  int cierrelargos = OrderClose(OrderTicket(),OrderLots(),Bid,0,clrBlue);                  
            }
            
            if(OrderType()==OP_SELL)
            {
               double OP = OrderOpenPrice();
               double SL = OrderStopLoss();            
               double TP1 = ObjectDescription("TP1");
               double TP2 = ObjectDescription("TP2");
               double TP3 = ObjectDescription("TP3") ;  
               double TP1pip = StrToDouble(ObjectDescription("TP1"))+StrToDouble(ObjectDescription("TP1pip"))*Point()*10;
               double TP2pip = StrToDouble(ObjectDescription("TP2"))+StrToDouble(ObjectDescription("TP2pip"))*Point()*10;
               double TP3pip = StrToDouble(ObjectDescription("TP3"))+StrToDouble(ObjectDescription("TP3pip"))*Point()*10;
                           
               if(OP < SL && Ask <= TP1pip)
                  OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice(),OrderTakeProfit(),0,clrBlue);                   
               
               if(TP1 < SL && Ask <= TP2pip)
                  OrderModify(OrderTicket(),OrderOpenPrice(),TP1pip,OrderTakeProfit(),0,clrBlue);
                  
               if(TP2 < SL && Ask <= TP3pip)
                  OrderModify(OrderTicket(),OrderOpenPrice(),TP2pip,OrderTakeProfit(),0,clrBlue);
               
               if(Ask <= TP3)
                  int cierrecortos = OrderClose(OrderTicket(),OrderLots(),Ask,0,clrBlue);                  
            }
         }          
      }                                      
   }      
}
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
{
   if(id==CHARTEVENT_OBJECT_CLICK && sparam=="BotonBUY")
   {
      CompraMercado();
      Sleep(150);
      ObjectSetInteger(0,"BotonBUY",OBJPROP_STATE,false);      
   }
   
   if(id==CHARTEVENT_OBJECT_CLICK && sparam=="BotonSELL")
   {
      VentaMercado();
      Sleep(150);
      ObjectSetInteger(0,"BotonSELL",OBJPROP_STATE,false);
   }
   
   if(id==CHARTEVENT_OBJECT_CLICK && sparam=="BotonBUYLIMIT")
   {
      CompraLimite();
      Sleep(150);
      ObjectSetInteger(0,"BotonBUYLIMIT",OBJPROP_STATE,false);      
   }
   
   if(id==CHARTEVENT_OBJECT_CLICK && sparam=="BotonSELLLIMIT")
   {
      VentaLimite();
      Sleep(150);
      ObjectSetInteger(0,"BotonSELLLIMIT",OBJPROP_STATE,false);
   }
   
   if(id==CHARTEVENT_OBJECT_CLICK && sparam=="BotonBREAK")
   {
      BreakEven();
      Sleep(150);
      ObjectSetInteger(0,"BotonBREAK",OBJPROP_STATE,false);
   }
   
   if(id==CHARTEVENT_OBJECT_CLICK && sparam=="BotonDL")
   {
      DL();      
      Sleep(150);
      ObjectSetInteger(0,"BotonDL",OBJPROP_STATE,false);
   }
   
   if(id==CHARTEVENT_OBJECT_CLICK && sparam=="BotonPANEL")
   {
      PANEL();      
      Sleep(150);
      ObjectSetInteger(0,"BotonPANEL",OBJPROP_STATE,false);
   }
      
   if(id==CHARTEVENT_OBJECT_ENDEDIT)
   {                           
      if(sparam=="SL")
         dibujarLinea(sparam);               
      
      if(sparam=="TP1")
      {      
         dibujarLinea(sparam);
         dibujarLineapip1();
      }
         
      if(sparam=="TP2")
      {         
         dibujarLinea(sparam);
         dibujarLineapip2();
      }
      
      if(sparam=="TP3")
      {
         dibujarLinea(sparam);
         dibujarLineapip3();
      }
      
      if(sparam=="TP1pip")
         dibujarLineapip1();
         
      if(sparam=="TP2pip")      
         dibujarLineapip2();      
      
      if(sparam=="TP3pip")               
         dibujarLineapip3();      
      
      Renglon2bis();
   }    
}
//+------------------------------------------------------------------+

void Interfaz()
{
   long chart_ID = 0;
   string name = "Interfaz";   

   ObjectCreate(chart_ID,name,OBJ_RECTANGLE_LABEL,0,0,0);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,2); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,30); 
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,350); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,161); 
}

void setRenglones(long chart_ID,string name)
{
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,false); 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,false); 
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clrBlack); 
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,15);    
   ObjectSetString(chart_ID,name,OBJPROP_FONT,"Calibri"); 
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,9);              
}   

void setCaja(long chart_ID,string name)
{
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,false); 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,false);       
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,58); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,14); 
   ObjectSetString(chart_ID,name,OBJPROP_FONT,"Calibri"); 
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,9);   
   ObjectSetInteger(chart_ID,name,OBJPROP_ALIGN,ALIGN_RIGHT);           
}   


void Renglon1()
{
   long chart_ID = 0;
   string name = "Renglon1";

   ObjectCreate(chart_ID,name,OBJ_LABEL,0,0,0);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,inicio_renglones+distancia_renglones*0); 
   setRenglones(chart_ID,name);    
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"Balance             :");     
   Renglon1bis();
}

void Renglon1bis()
{
   long chart_ID = 0;
   string name = "Renglon1bis";  
   double bal = AccountInfoDouble(ACCOUNT_BALANCE);
   double balance = NormalizeDouble(bal,2);
   string balance_string = DoubleToString(balance,2);
   string monenda = AccountCurrency();

   ObjectCreate(chart_ID,name,OBJ_LABEL,0,0,0);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,inicio_renglones+distancia_renglones*0); 
   setRenglones(chart_ID,name);    
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,10); 
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,105);
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,balance_string+" "+monenda);
}

void Renglon2()
{
   long chart_ID = 0;
   string name = "Renglon2";

   ObjectCreate(chart_ID,name,OBJ_LABEL,0,0,0);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,inicio_renglones+distancia_renglones*1); 
   setRenglones(chart_ID,name);    
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"Risk per trade  :             %");  
   
   Renglon2bis();
}

void Renglon2bis()
{
   long chart_ID = 0;
   string name = "Renglon2bis";

   ObjectCreate(chart_ID,name,OBJ_LABEL,0,0,0);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,inicio_renglones+distancia_renglones*1); 
   setRenglones(chart_ID,name);    
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,176);    
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clrFireBrick); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"Lots: "+CalcularLote());
}

void Renglon3()
{
   long chart_ID = 0;
   string name = "Renglon3";

   ObjectCreate(chart_ID,name,OBJ_LABEL,0,0,0);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,inicio_renglones+distancia_renglones*2); 
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,350); 
   setRenglones(chart_ID,name);    
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"SL                      TP1                      TP2"); 
   Renglon3bis();
}

void Renglon3bis()
{
   long chart_ID = 0;
   string name = "Renglon3bis";

   ObjectCreate(chart_ID,name,OBJ_LABEL,0,0,0);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,inicio_renglones+distancia_renglones*2);    
   setRenglones(chart_ID,name);    
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,92);
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"                                                        TP3"); 
}

void Renglon4()
{
   long chart_ID = 0;
   string name = "Renglon4";

   ObjectCreate(chart_ID,name,OBJ_LABEL,0,0,0);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,inicio_renglones+distancia_renglones*3); 
   setRenglones(chart_ID,name);    
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"Cambio SL:      TP1  ________    TP2  ________    TP3"); 
}

void Renglon5()
{
   long chart_ID = 0;
   string name = "Renglon5";

   ObjectCreate(chart_ID,name,OBJ_LABEL,0,0,0);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,inicio_renglones+distancia_renglones*7.7); 
   setRenglones(chart_ID,name);    
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,220);
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"Price Limit"); 
}

void BotonBUY()
{
   long chart_ID = 0;
   string name = "BotonBUY";   

   ObjectCreate(chart_ID,name,OBJ_BUTTON,0,0,0);
   setRenglones(chart_ID,name);
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,11); 
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,false);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,15); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,110); 
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,95); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,34); 
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,clrLightBlue); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"B U Y ");    
}

void BotonSELL()
{
   long chart_ID = 0;
   string name = "BotonSELL";   

   ObjectCreate(chart_ID,name,OBJ_BUTTON,0,0,0);
   setRenglones(chart_ID,name);
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,11); 
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,false);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,115); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,110); 
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,95); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,34); 
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,clrLightSalmon); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"S E L L ");    
}

void BotonBUYLIMIT()
{
   long chart_ID = 0;
   string name = "BotonBUYLIMIT";   

   ObjectCreate(chart_ID,name,OBJ_BUTTON,0,0,0);
   setRenglones(chart_ID,name);
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,false);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,15); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,149); 
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,95); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,20); 
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,clrLightBlue); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"BuyLimit");    
}

void BotonSELLLIMIT()
{
   long chart_ID = 0;
   string name = "BotonSELLLIMIT";   

   ObjectCreate(chart_ID,name,OBJ_BUTTON,0,0,0);
   setRenglones(chart_ID,name);   
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,false);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,115); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,149); 
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,95); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,20); 
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,clrLightSalmon); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"SellLimit");    
}

void BotonBREAKEVEN()
{
   long chart_ID = 0;
   string name = "BotonBREAK";   

   ObjectCreate(chart_ID,name,OBJ_BUTTON,0,0,0);
   setRenglones(chart_ID,name);   
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,false);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,275); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,110); 
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,67); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,34); 
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,clrLightGray); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"BreakEven");    
}

void BotonPANEL()
{
   long chart_ID = 0;
   string name = "BotonPANEL";   

   ObjectCreate(chart_ID,name,OBJ_BUTTON,0,0,0);
   setRenglones(chart_ID,name);   
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,false);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,225); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,1); 
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,44); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,16); 
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,clrLightGray); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"PANEL");    
}

void BotonDL()
{
   long chart_ID = 0;
   string name = "BotonDL";   

   ObjectCreate(chart_ID,name,OBJ_BUTTON,0,0,0);
   setRenglones(chart_ID,name);   
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,false);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,321); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,32); 
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,30); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,30); 
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,clrLightGray); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"DL");    
}

void Caja1()
{
   long chart_ID = 0;
   string name = "Risk";   

   ObjectCreate(chart_ID,name,OBJ_EDIT,0,0,0);
   setCaja(chart_ID,name);
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,30);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,105); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,58); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"2.0");    
   
}

void Caja2()
{
   long chart_ID = 0;
   string name = "SL";
   const string sl = "0.00000";

   ObjectCreate(chart_ID,name,OBJ_EDIT,0,0,0);
   setCaja(chart_ID,name);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,30); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,74); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,sl);    
}

void Caja3()
{
   long chart_ID = 0;
   string name = "TP1";   

   ObjectCreate(chart_ID,name,OBJ_EDIT,0,0,0);
   setCaja(chart_ID,name);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,113); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,74); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"0.00000");    
}

void Caja4()
{
   long chart_ID = 0;
   string name = "TP2";   

   ObjectCreate(chart_ID,name,OBJ_EDIT,0,0,0);
   setCaja(chart_ID,name);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,197); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,74); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"0.00000");    
}

void Caja5()
{
   long chart_ID = 0;
   string name = "TP3";   

   ObjectCreate(chart_ID,name,OBJ_EDIT,0,0,0);
   setCaja(chart_ID,name);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,281); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,74); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"0.00000");    
}


void Caja6()
{
   long chart_ID = 0;
   string name = "TP1pip";   

   ObjectCreate(chart_ID,name,OBJ_EDIT,0,0,0);
   setCaja(chart_ID,name);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,113); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,91); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"5");    
}

void Caja7()
{
   long chart_ID = 0;
   string name = "TP2pip";   

   ObjectCreate(chart_ID,name,OBJ_EDIT,0,0,0);
   setCaja(chart_ID,name);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,197); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,91); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"10");    
}

void Caja8()
{
   long chart_ID = 0;
   string name = "TP3pip";   

   ObjectCreate(chart_ID,name,OBJ_EDIT,0,0,0);
   setCaja(chart_ID,name);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,281); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,91); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"15");    
}

void Caja9()
{
   long chart_ID = 0;
   string name = "PriceLimit";   

   ObjectCreate(chart_ID,name,OBJ_EDIT,0,0,0);
   setCaja(chart_ID,name);
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,219); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,152); 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,"0.00000");    
}

void CompraMercado()
{   
   double lots = CalcularLote();     
   double SL = ObjectDescription("SL");   
   
   int compra = OrderSend(NULL,OP_BUY,lots,Ask,0,SL,0,"Compra",MagicNumber,0,clrGreen);   
}

void VentaMercado()
{   
   double lots = CalcularLote();      
   double SL = ObjectDescription("SL");      
   
   int venta = OrderSend(NULL,OP_SELL,lots,Bid,0,SL,0,"Venta",MagicNumber,0,clrRed);   
}

void CompraLimite()
{   
   double lots = CalcularLoteLimite();     
   double SL = ObjectDescription("SL");   
   double PR = ObjectDescription("PriceLimit");
   
   int compra = OrderSend(NULL,OP_BUYLIMIT,lots,PR,0,SL,0,"Compra Límite",MagicNumber,0,clrGreen);   
}

void VentaLimite()
{   
   double lots = CalcularLoteLimite();     
   double SL = ObjectDescription("SL");   
   double PR = ObjectDescription("PriceLimit");
   
   int venta = OrderSend(NULL,OP_SELLLIMIT,lots,PR,0,SL,0,"Venta Límite",MagicNumber,0,clrRed);   
}

double CalcularLote()
{
   double riesgo = ObjectDescription("Risk");
   double SL = ObjectDescription("SL");
   double PR = Bid;
   double Dif = 0;
   
   if(SL<PR)
   {
      PR = Ask;
      Dif = PR - SL;
   }
   else
      Dif = SL - PR;
          
   double accBalance = AccountBalance();
   double tickValue = MarketInfo(NULL,MODE_TICKVALUE);        
   double Maximoaperder = accBalance * (riesgo/100);
   double PerdidaLote = Dif/Point();
   
   double lot = NormalizeDouble(Maximoaperder/PerdidaLote,2);
   
   return lot;
}

double CalcularLoteLimite()
{
   double riesgo = ObjectDescription("Risk");
   double SL = ObjectDescription("SL");
   double PR = ObjectDescription("PriceLimit");
   double Dif = 0;
   
   if(SL<PR)
   {
      PR = Ask;
      Dif = PR - SL;
   }
   else
      Dif = SL - PR;
          
   double accBalance = AccountBalance();
   double tickValue = MarketInfo(NULL,MODE_TICKVALUE);        
   double Maximoaperder = accBalance * (riesgo/100);
   double PerdidaLote = Dif/Point();
   
   double lot = NormalizeDouble(Maximoaperder/PerdidaLote,2);
   
   return lot;
}

void dibujarLinea(string sparam)
{
   color lineaclr;
   string linea;
   double PR;
   string textoLinea = sparam;
   
   if(sparam=="SL")
   {
      PR = ObjectDescription("SL");
      lineaclr = clrRed;
      linea = "Stop Loss";
   }
   if(sparam=="TP1")
   {
      PR = ObjectDescription("TP1");   
      lineaclr = clrLimeGreen;
      linea = "Take Profit 1";
   }
   if(sparam=="TP2")
   {
      PR = ObjectDescription("TP2");   
      lineaclr = clrLimeGreen;
      linea = "Take Profit 2";
   }
   if(sparam=="TP3")
   {
      PR = ObjectDescription("TP3");   
      lineaclr = clrLimeGreen;
      linea = "Take Profit 3";
   }

   ObjectDelete(0,linea);
   ObjectCreate(0,linea,OBJ_HLINE,0,0,PR);
   ObjectSet(linea, OBJPROP_COLOR, lineaclr);
   ObjectSet(linea, OBJPROP_WIDTH, 2);
   ObjectSetInteger(0,linea,OBJPROP_BACK,true); 
}

void dibujarLineapip1()
{
   color lineaclr = clrLimeGreen;
   string linea;
   double PR;   
        
   if(StrToDouble(ObjectDescription("TP1"))>Bid)
      PR = StrToDouble(ObjectDescription("TP1"))-StrToDouble(ObjectDescription("TP1pip"))*Point()*10;
   else
      PR = StrToDouble(ObjectDescription("TP1"))+StrToDouble(ObjectDescription("TP1pip"))*Point()*10;
      
   linea = "Take Profit 1 pip";
      
   ObjectDelete(0,linea);
   ObjectCreate(0,linea,OBJ_HLINE,0,0,PR);
   ObjectSet(linea, OBJPROP_COLOR, lineaclr);
   ObjectSet(linea, OBJPROP_WIDTH, 1);
   ObjectSet(linea, OBJPROP_STYLE, STYLE_DASH);
   ObjectSetInteger(0,linea,OBJPROP_BACK,true); 
}

void dibujarLineapip2()
{
   color lineaclr = clrLimeGreen;
   string linea;
   double PR;   
        
   if(StrToDouble(ObjectDescription("TP2"))>Bid)
      PR = StrToDouble(ObjectDescription("TP2"))-StrToDouble(ObjectDescription("TP2pip"))*Point()*10;
   else
      PR = StrToDouble(ObjectDescription("TP2"))+StrToDouble(ObjectDescription("TP2pip"))*Point()*10;
      
   linea = "Take Profit 2 pip";
      
   ObjectDelete(0,linea);
   ObjectCreate(0,linea,OBJ_HLINE,0,0,PR);
   ObjectSet(linea, OBJPROP_COLOR, lineaclr);
   ObjectSet(linea, OBJPROP_WIDTH, 1);
   ObjectSet(linea, OBJPROP_STYLE, STYLE_DASH);
   ObjectSetInteger(0,linea,OBJPROP_BACK,true); 
}

void dibujarLineapip3()
{
   color lineaclr = clrLimeGreen;
   string linea;
   double PR;   
        
   if(StrToDouble(ObjectDescription("TP3"))>Bid)
      PR = StrToDouble(ObjectDescription("TP3"))-StrToDouble(ObjectDescription("TP3pip"))*Point()*10;
   else
      PR = StrToDouble(ObjectDescription("TP3"))+StrToDouble(ObjectDescription("TP3pip"))*Point()*10;
   
   linea = "Take Profit 3 pip";
      
   ObjectDelete(0,linea);
   ObjectCreate(0,linea,OBJ_HLINE,0,0,PR);
   ObjectSet(linea, OBJPROP_COLOR, lineaclr);
   ObjectSet(linea, OBJPROP_WIDTH, 1);
   ObjectSet(linea, OBJPROP_STYLE, STYLE_DASH);
   ObjectSetInteger(0,linea,OBJPROP_BACK,true); 
}

void BreakEven()
{
   for(int i = OrdersTotal(); i >= 0; i--)
   {
      int orders = OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
      
      if (OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber)
        OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice(),OrderTakeProfit(),0,clrBlue);                   
   }
}

void PANEL()
{
   if(banderapanel)
      ocultarPanel();
   else
      mostrarPanel();
}

void ocultarPanel()
{
   ObjectDelete("Interfaz");
   ObjectDelete("Renglon1");
   ObjectDelete("Renglon1bis");
   ObjectDelete("Renglon2");
   ObjectDelete("Renglon2bis");
   ObjectDelete("Renglon3");
   ObjectDelete("Renglon3bis");
   ObjectDelete("Renglon4");
   ObjectDelete("Renglon5");
   ObjectDelete("BotonBUY");
   ObjectDelete("BotonSELL");
   ObjectDelete("BotonBUYLIMIT");
   ObjectDelete("BotonSELLLIMIT");
   ObjectDelete("BotonBREAK");
   ObjectDelete("BotonDL");
   ObjectDelete("Risk");
   ObjectDelete("SL");
   ObjectDelete("TP1");
   ObjectDelete("TP2");
   ObjectDelete("TP3");
   ObjectDelete("TP1pip");
   ObjectDelete("TP2pip");
   ObjectDelete("TP3pip");
   ObjectDelete("PriceLimit");
   
   banderapanel = false;
}

void mostrarPanel()
{
   Interfaz();
   Renglon1();
   Renglon2();
   Renglon3();
   Renglon4();
   Renglon5();
   
   BotonBUY();
   BotonSELL();
   BotonBUYLIMIT();
   BotonSELLLIMIT();
   BotonBREAKEVEN();
   BotonPANEL();
   BotonDL();
   
   Caja1();
   Caja2();
   Caja3();
   Caja4();
   Caja5();
   Caja6();
   Caja7();
   Caja8();
   Caja9();      

   banderapanel = true;
}

void DL()
{   
   ObjectDelete("Stop Loss");
   ObjectDelete("Take Profit 1");
   ObjectDelete("Take Profit 2"); 
   ObjectDelete("Take Profit 3");      
   ObjectDelete("Take Profit 1 pip");
   ObjectDelete("Take Profit 2 pip"); 
   ObjectDelete("Take Profit 3 pip");      
}