//+------------------------------------------------------------------+
//|                                                   Experto DD.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"


#define MT_WMCMD_EXPERTS   32851
#define WM_COMMAND 0x0111
#define GA_ROOT    2
#include <WinAPI\winapi.mqh>

input double Balance_Inicial=10000;
input double DD_Diario=4;
input double DD_Total=10;
input bool Contar_Comission=true;
input bool Contar_Swap=true;
input string S1="------ Configuracion Alertas -------";//----------------------
input bool Alerta_PC=true;
input bool Alerta_Movil=true;
input bool Alerta_Mail=true;

double Maximo_DD_Total=0;
double Maximo_DD_Diario=0;

#include<Trade\Trade.mqh>
CTrade trade;

int dia=-1;

#include <Trade\TerminalInfo.mqh>
CTerminalInfo InfoTrade;

double Balance_00=0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   Maximo_DD_Total=AccountInfoDouble(ACCOUNT_BALANCE)-Balance_Inicial*(DD_Total/100.0);
   Maximo_DD_Diario=Balance_Inicial-Balance_Inicial*(DD_Diario/100.0);

   ActualizarMaximoDiario();

   string Comentario="Balance Actual: "+DoubleToString(AccountInfoDouble(ACCOUNT_BALANCE),2)+"\n";
   Comentario=Comentario+"Balance Dia 00:00: "+DoubleToString(Balance_00,2)+"\n";
   Comentario=Comentario+"DD Diario para cerrar: "+DoubleToString(Maximo_DD_Diario,2)+"\n";
   Comentario=Comentario+"DD Total para cerrar: "+DoubleToString(Maximo_DD_Total,2)+"\n";
   Comment(Comentario);

   if(AccountInfoDouble(ACCOUNT_EQUITY)<=Maximo_DD_Diario)
     {
      Alert("La cuenta ya supero el Maximo Diario "+DoubleToString(Maximo_DD_Diario,2)+", asegure poner parametros correctos");
      return INIT_FAILED;
     }

   if(AccountInfoDouble(ACCOUNT_EQUITY)<=Maximo_DD_Total)
     {
      Alert("La cuenta ya supero el Maximo Total "+DoubleToString(Maximo_DD_Total,2)+", asegure poner parametros correctos");
      return INIT_FAILED;
     }

   EventSetMillisecondTimer(1);
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EventKillTimer();
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTimer()
  {
   if(InfoTrade.IsTradeAllowed())
     {
      datetime Tiempo=TimeCurrent();
      MqlDateTime time;
      TimeToStruct(Tiempo,time);

      if(time.day_of_year!=dia)
         ActualizarMaximoDiario();

      string Comentario="Balance Actual: "+DoubleToString(AccountInfoDouble(ACCOUNT_BALANCE),2)+"\n";
      Comentario=Comentario+"Balance Dia 00:00: "+DoubleToString(Balance_00,2)+"\n";
      Comentario=Comentario+"DD Diario para cerrar: "+DoubleToString(Maximo_DD_Diario,2)+"\n";
      Comentario=Comentario+"DD Total para cerrar: "+DoubleToString(Maximo_DD_Total,2)+"\n";
      Comment(Comentario);

      if(AccountInfoDouble(ACCOUNT_EQUITY)<=Maximo_DD_Diario)
        {
         CerrarPosiciones();
         AlgoTradingStatus(false);
         Alertas("Diario",Maximo_DD_Diario);
        }

      if(AccountInfoDouble(ACCOUNT_EQUITY)<=Maximo_DD_Total)
        {
         CerrarPosiciones();
         AlgoTradingStatus(false);
         Alertas("Total",Maximo_DD_Total);
        }

     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Alertas(string Frase,double Valor)
  {
   if(Alerta_PC)
      Alert("Cierre de Posiciones por DD "+Frase+" por debajo de "+DoubleToString(Valor,2));
   if(Alerta_Movil)
      SendNotification("Cierre de Posiciones por DD "+Frase+" por debajo de "+DoubleToString(Valor,2));
   if(Alerta_Mail)
      SendMail("Cierre de Posiciones por DD "+Frase+" por debajo de "+DoubleToString(Valor,2),"Cierre de Posiciones por DD "+Frase+" por debajo de "+DoubleToString(Valor,2));
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarPosiciones()
  {
   int TotalPosiciones=PositionsTotal();

   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket!=0)
         trade.PositionClose(Ticket,-1);
     }

   int OrdenesPosiciones=OrdersTotal();

   for(int i=OrdenesPosiciones-1; i>=0; i--)
     {
      ulong Ticket=OrderGetTicket(i);
      if(Ticket!=0)
         trade.OrderDelete(Ticket);
     }

  }
//+------------------------------------------------------------------+
void AlgoTradingStatus(bool Enable)
  {
   bool Status = (bool) TerminalInfoInteger(TERMINAL_TRADE_ALLOWED);

   if(Enable != Status)
     {
      HANDLE hChart = (HANDLE) ChartGetInteger(ChartID(), CHART_WINDOW_HANDLE);
      PostMessageW(GetAncestor(hChart, GA_ROOT), WM_COMMAND, MT_WMCMD_EXPERTS, 0);
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ActualizarMaximoDiario()
  {
   double Balance=AccountInfoDouble(ACCOUNT_BALANCE);

   datetime Tiempo=TimeCurrent();
   MqlDateTime time;
   TimeToStruct(Tiempo,time);
   time.hour=0;
   time.min=0;
   time.sec=0;
   Tiempo=StructToTime(time);

   HistorySelect(Tiempo,TimeCurrent());

   int     total=HistoryDealsTotal();
   ulong ticket=0;

   double ProfitTotal=0;
   Print("--------Contando Operaciones Anteriores para sacar el Balance 00 Diario---------------");
   Print("Balance Actual ",DoubleToString(Balance,2));
   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         // int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         double Profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         datetime TiempoCierre=(datetime)HistoryDealGetInteger(ticket,DEAL_TIME);
         ENUM_DEAL_TYPE Tipo=(ENUM_DEAL_TYPE)HistoryDealGetInteger(ticket,DEAL_TYPE);
         string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);

         if(entry==DEAL_ENTRY_OUT)
           {
            Print("*Operacion "+IntegerToString((total-1)-i)+" : ");
            Print("Tiempo Cierre: "+TimeToString(TiempoCierre,TIME_DATE|TIME_MINUTES)+" Activo: "+Simbolo+" TipoOP: "+EnumToString(ENUM_DEAL_TYPE(Tipo))+" Profit: "+
                  DoubleToString(Profit,2)+" Swap: ",DoubleToString(Swap,2)+" Commision: ",DoubleToString(Comision,2));
            Profit=Profit+(Contar_Comission?Comision:0)+(Contar_Swap?Swap:0);
            ProfitTotal+=Profit;
            Print("Resumen Profit para esta operacion ",Profit);
            Balance-=Profit;
            Print("--------*");
           }
        }
     }
   Print("Profit Total Calculado ",DoubleToString(ProfitTotal,2));
   Print("Balance Calculado ",DoubleToString(Balance,2));
    Print("----------------------------------------------------------------------------");
   dia=time.day_of_year;
   Balance_00=Balance;
   Maximo_DD_Diario=Balance-Balance_Inicial*(DD_Diario/100.0);
  }
//+------------------------------------------------------------------+
