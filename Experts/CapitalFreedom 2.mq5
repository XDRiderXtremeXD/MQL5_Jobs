//+------------------------------------------------------------------+
//|                                               CapitalFreedom.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property strict
#include <JAson.mqh>
//--- input parameters
input string   endpoint="http://localhost/api/users/";
input int      intervalo=60;

double BalanceInicial=5000;
double PorcentajeDiario=5;
double PorcentajeAcumulado=10;

int diaActual=-1;

#include<Trade\Trade.mqh>
CTrade trade;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CJAVal jSON(NULL,jtUNDEF);
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   diaActual=-1;
//--- create timer
   EventSetTimer(intervalo);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   EventKillTimer();

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
   string mensaje="Activo";
   CierreBalanceDiario(mensaje);
   CierreBalanceAcumulado(mensaje);

   string json=GetDataJson(mensaje);
   Print("Data: ",json);
   SendData(json);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CierreBalanceDiario(string &mensaje)
  {
   MqlDateTime tiempo;
   TimeToStruct(TimeCurrent(),tiempo);
   tiempo.hour=0;
   tiempo.min=0;
   tiempo.sec=0;
   datetime tiempoStart=StructToTime(tiempo);

   double profit=0;

   datetime from_date=tiempoStart;// desde el principio
   datetime to_date=TimeCurrent();// hasta el momento actual
//--- vamos a solicitar el historial de transacciones del período especificado
   HistorySelect(from_date,to_date);
//--- número total en la lista de transacciones
   int deals=HistoryDealsTotal();
//--- ahora vamos a procesar cada transacción
   for(int i=0; i<deals; i++)
     {
      ulong deal_ticket=               HistoryDealGetTicket(i);
      long deal_type=                 HistoryDealGetInteger(deal_ticket,DEAL_TYPE);
      long deal_entry=                HistoryDealGetInteger(deal_ticket,DEAL_ENTRY);
      double deal_profit=             HistoryDealGetDouble(deal_ticket,DEAL_PROFIT);

      if(deal_entry==DEAL_ENTRY_OUT)
         if(deal_type==DEAL_TYPE_BUY || deal_type==DEAL_TYPE_SELL)
            profit+=deal_profit;
     }



   static datetime tiempoStartReal=tiempoStart;
   if(tiempoStartReal!=tiempoStart)
      Comment("");

   if((BalanceInicial*PorcentajeDiario/100.0)*-1>=profit)
     {
      Comment("Supero el numero de balance Diario Porcentaje ",PorcentajeDiario);
      mensaje="Pausado por Porcentaje perdida diaria";
      CerrarOperaciones();
     }

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CierreBalanceAcumulado(string &mensaje)
  {
   double Equidad=AccountInfoDouble(ACCOUNT_EQUITY);

   if(BalanceInicial-BalanceInicial*PorcentajeAcumulado>=Equidad)
     {
      Comment("Supero el numero de balance Acumulado Porcentaje ",PorcentajeAcumulado);
      mensaje="Pausado por Porcentaje perdida diaria";
      CerrarOperaciones();
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarOperaciones()
  {
   int totalPositions=PositionsTotal();
   for(int i = totalPositions-1; i >= 0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket!=0)
         trade.PositionClose(ticket,-1);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string GetDataJson(string mensaje)
  {
   int LIMITE_CERRADAS=20;

   string out="";
   jSON.Clear();
   jSON["mensaje"]=mensaje;
   jSON["AccountBalance"]=AccountInfoDouble(ACCOUNT_BALANCE);
   jSON["AccountCredit"]=AccountInfoDouble(ACCOUNT_CREDIT);
   jSON["AccountCompany"]=AccountInfoString(ACCOUNT_COMPANY);
   jSON["AccountCurrency"]=AccountInfoString(ACCOUNT_CURRENCY);
   jSON["AccountEquity"]=AccountInfoDouble(ACCOUNT_EQUITY);
   jSON["AccountFreeMargin"]=AccountInfoDouble(ACCOUNT_MARGIN_FREE);
   jSON["AccountLeverage"]=AccountInfoInteger(ACCOUNT_LEVERAGE);
   jSON["AccountMargin"]=AccountInfoDouble(ACCOUNT_MARGIN);
   jSON["AccountName"]=AccountInfoString(ACCOUNT_NAME);
   jSON["AccountNumber"]=AccountInfoInteger(ACCOUNT_LOGIN);
   jSON["AccountProfit"]=AccountInfoDouble(ACCOUNT_PROFIT);
   jSON["AccountServer"]=AccountInfoString(ACCOUNT_SERVER);

   bool hayOpenOrders=false;

   int posicionesTotal=PositionsTotal();
   for(int i=posicionesTotal-1; i>=0; i--)
     {
      long ticket=(long)PositionGetTicket(i);
      if(ticket!=0)
        {
         hayOpenOrders=true;
         CJAVal orderObject;
         orderObject.Clear();
         orderObject["TicketNumber"]=ticket;
         orderObject["TicketSwap"]=PositionGetDouble(POSITION_SWAP);
         orderObject["TicketCommission"]=0;
         orderObject["TicketSymbol"]=PositionGetString(POSITION_SYMBOL);
         orderObject["TicketType"]=PositionGetInteger(POSITION_TYPE);
         orderObject["TicketDate"]=TimeToString(PositionGetInteger(POSITION_TIME),TIME_DATE|TIME_MINUTES);
         jSON["OpenOrders"].Add(orderObject);
        }
     }

   int pendientesTotal=OrdersTotal();
   for(int i=posicionesTotal-1; i>=0; i--)
     {
      long ticket=(long)OrderGetTicket(i);
      if(ticket!=0)
        {
         int tipo=(int)OrderGetInteger(ORDER_TYPE);
         if(!(tipo>=2 && tipo<=6))
            continue;
         hayOpenOrders=true;
         CJAVal orderObject;
         orderObject.Clear();
         orderObject["TicketNumber"]=ticket;
         orderObject["TicketSwap"]=0;
         orderObject["TicketCommission"]=0;
         orderObject["TicketSymbol"]=OrderGetString(ORDER_SYMBOL);
         orderObject["TicketType"]=tipo;
         orderObject["TicketDate"]=TimeToString(OrderGetInteger(ORDER_TIME_SETUP),TIME_DATE|TIME_MINUTES);
         jSON["OpenOrders"].Add(orderObject);
        }
     }

   if(hayOpenOrders==false)
      jSON["OpenOrders"][0];


   datetime from_date=0;          // desde el principio
   datetime to_date=TimeCurrent();// hasta el momento actual
   HistorySelect(from_date,to_date);

   int historyDeals=HistoryDealsTotal();
   int totalRegister=0;
   for(int i=historyDeals-1; i>=0 ; i--)
     {
      long deal_ticket= (long)HistoryDealGetTicket(i);
      double volume=                    HistoryDealGetDouble(deal_ticket,DEAL_VOLUME);
      double deal_swap=                    HistoryDealGetDouble(deal_ticket,DEAL_SWAP);
      double deal_comission=                    HistoryDealGetDouble(deal_ticket,DEAL_COMMISSION);
      datetime transaction_time=(datetime)HistoryDealGetInteger(deal_ticket,DEAL_TIME);
      ulong order_ticket=              HistoryDealGetInteger(deal_ticket,DEAL_ORDER);
      long deal_type= (long)      HistoryDealGetInteger(deal_ticket,DEAL_TYPE);
      string symbol=                    HistoryDealGetString(deal_ticket,DEAL_SYMBOL);
      ulong entry=               HistoryDealGetInteger(deal_ticket,DEAL_ENTRY);

      if(entry==DEAL_ENTRY_OUT && (deal_type==DEAL_TYPE_BUY || deal_type==DEAL_TYPE_SELL))
        {
         CJAVal historyObject;
         historyObject.Clear();
         deal_type=((deal_type==DEAL_TYPE_BUY)?DEAL_TYPE_SELL:DEAL_TYPE_BUY);
         historyObject["TicketNumber"]=deal_ticket;
         historyObject["TicketSwap"]=deal_swap;
         historyObject["TicketCommission"]=deal_comission;
         historyObject["TicketSymbol"]=symbol;
         historyObject["TicketType"]=deal_type;
         historyObject["TicketCloseDate"]=TimeToString(transaction_time,TIME_DATE|TIME_MINUTES);
         jSON["LastOrders"].Add(historyObject);
         totalRegister++;
        }
      if(totalRegister>=LIMITE_CERRADAS)
         break;
     }
   if(totalRegister==0)
      jSON["LastOrders"][0];


   jSON.Serialize(out);
   return out;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SendData(string jsonData)
  {
   string url =endpoint; // Reemplaza esto con la URL de tu API
   string cookie=NULL;
   string headers = "Content-Type: application/json";
   string resultHeaders;
   char post[],result[],postCharArray[];
   int res;
//--- Reset the last error code
   ResetLastError();
   int timeout=5000; //--- Timeout below 1000 (1 sec.) is not enough for slow Internet connection
   StringToCharArray(jsonData,postCharArray,0,StringLen(jsonData),CP_ACP);
//Print(ArraySize(postCharArray));
   res=WebRequest("POST",url,headers,timeout,postCharArray,result,resultHeaders);
// Maneja la respuesta (result) según las necesidades de tu aplicación
//--- Checking errors
   if(res==-1)
     {
      Print("Error in WebRequest. Error code  =",GetLastError());
      //--- Perhaps the URL is not listed, display a message about the necessity to add the address
      Print("Add the address '"+url+"' in the list of allowed URLs on tab 'Expert Advisors'","Error",MB_ICONINFORMATION);
     }
   else
      Print("Respuesta de la API: cod ",IntegerToString(res)," ",CharArrayToString(result,0,WHOLE_ARRAY));
  }

//+------------------------------------------------------------------+
/* EXAMPLE TO JSON
void OnStart()
  {
   string in,out;
   CJAVal js(NULL,jtUNDEF); bool b;

//---
   Print("JASon Example Deserialization:");
//---
   in="{\"a\":[1,2]}"; out="";
   b=js.Deserialize(in);
   js.Serialize(out);
   Print(in+" -> "+out);

  in="{ \"array\": [ { \"symbol\": \"USDJPY\", \"type\": \"Buy\", \"lot\": 0.5, \"price_open\": 102.36, \"price_close\": 102.44, \"stop_loss\": 99.25, \"take_profit\": 103.25 }, { \"symbol\": \"EURUSD\", \"type\": \"Sell\", \"lot\": 0.2, \"price_open\": 1.1044, \"price_close\": 1.1252, \"stop_loss\": 1.1434, \"take_profit\": 1.0922 } ] }";
  //in="{ \"array\": [ { \"s\": 1 }, { \"s\": 2 } ] }";
  js.Clear(); out="";
   b=js.Deserialize(in);
   js.Serialize(out);
   Print(out);

   in="{\"description\":\"\\u041d\\u043e\\u0432\\u043e\\u0435 \\u0432 \\u0432\\u0435\\u0440\\u0441\\u0438\\u0438 v.2\"}";
   js.Clear(); out="";
   b=js.Deserialize(in);
   js.Serialize(out);
   Print(in+" -> "+out);

//---
   in="{\"a\":[{\"b\":1},{\"c\":2}]}"; out="";
   b=js.Deserialize(in);
   js.Serialize(out);
   Print(in+" -> "+out);
//---
   in="{\"res\":{\"tas\":[{\"mas1\":[{\"ma1\":{\"t\":1}}]}]}"; out="";
   b=js.Deserialize(in); js.Serialize(out);
   Print(in+" -> "+out);
//---
   string ma1="{\"ma1\":{\"t1\":1}}";
   string ma2="{\"ma2\":{\"t2\":1}}";
   string mas=StringFormat("{\"mas1\":[%s,%s]}", ma1, ma2);
   in=StringFormat("{\"tas\":[%s,%s]}",mas,mas); out="";
   b=js.Deserialize(in); js.Serialize(out);
   Print(in+" -> "+out);
//---

   Print("JASon Example Serialization:");
   js.Clear();
   out=""; js.Serialize(out);
//---
   js["Test"]=1.4;
   out=""; js.Serialize(out); Print(out);
//---
   Print("JASon Example Array access:");
   js["DirAccess"][0]=-1;
   js["DirAccess"][1]=22;
   string a[] = {"test", "add", "to array"};
   for (int i=0; i<3; ++i) js["ArrayAdd"].Add(a[i]);
   CJAVal* js_ac=js["ArrayCopy"];  // create element 'ArrayCopy' first
   js_ac.Set(js["DirAccess"].m_e);

   out=""; js.Serialize(out); Print(out);
//---
   CJAVal jb;
   jb["JS"].Set(js);
   out=""; jb.Serialize(out,false);
   Print(out);
//---
   jb["Arr"].Add(js);
   out=""; jb.Serialize(out,false);
   Print(out);
//---
   jb["Arr"].Add(js);
   out=""; jb.Serialize(out,false);
   Print(out);
//---
   b=jb.Deserialize(out);
   Print("deserialize=",b);}
   */
//+------------------------------------------------------------------+
