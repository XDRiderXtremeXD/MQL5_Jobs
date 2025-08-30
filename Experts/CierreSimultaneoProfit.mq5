//+------------------------------------------------------------------+
//|                                       CierreSimultaneoProfit.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"


#include<Trade\Trade.mqh>
CTrade trade;

enum opcion
  {
   SOLO_EN_EL_GRAFICO=0,
   EN_TODOS_LOS_GRAFICOS=1,
  };

enum opcionEquilibrio
  {
   Perdida_Equilibrio=0,
   Ganancia_Equilibrio=1,
  };
enum opcionReferencia
  {
   una_operacion=0,
   suma_operaciones=1,
  };


input opcionReferencia Referencia = una_operacion;
input opcionEquilibrio Equilibrio = Perdida_Equilibrio;
input double Valor_Referencia=20;
input opcion Opcion_Graficos=EN_TODOS_LOS_GRAFICOS;
input double Ganancia_Total_Cierre=100;//Ganancia total Cierres (0 disable)
input double Perdida_Total_Cierre=100;//Perdida total Cierres (0 disable)


struct ticketsProfits
  {
   ulong              tickets;
   double            profit;
  };

int perdidasTotal;
int ganadasTotal;
double ganadas;
double perdidas;

double referencia_valor;

ticketsProfits ticketsGanadas[100];
ticketsProfits ticketsPerdidas[100];

double GANANCIA_TOTAL;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

//---
   EventSetMillisecondTimer(1);
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
void OnTimer()
  {
   SetearTickets();

  Comment("GANANCIA TOTAL= ",GANANCIA_TOTAL," GANADAS= ",ganadas," PERDIDAS= ",perdidas);

   if(Ganancia_Total_Cierre!=0 && GANANCIA_TOTAL>=MathAbs(Ganancia_Total_Cierre))
     {
      CierreTotal();
      return;
     }

   if(Perdida_Total_Cierre!=0 && GANANCIA_TOTAL<=(MathAbs(Perdida_Total_Cierre)*-1))
     {
      CierreTotal();
      return;
     }

   if(MathAbs(perdidas)>=Valor_Referencia && ganadas>=Valor_Referencia)
     {
      int cierreHasta=0;
      if(selectionSort(ticketsGanadas,ganadasTotal,Valor_Referencia,cierreHasta))
         CerrarTickets(ticketsGanadas,cierreHasta);

      if(selectionSort(ticketsPerdidas,perdidasTotal,Valor_Referencia,cierreHasta))
         CerrarTickets(ticketsPerdidas,cierreHasta);
     }

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetearTickets()
  {
   int pos=PositionsTotal();
   perdidasTotal=0;
   ganadasTotal=0;

   ganadas=0;
   perdidas=0;

   double profitEvalua=0;

   GANANCIA_TOTAL=0;

   for(int i=0; i<pos; i++)
     {
      ulong ticket;
      if((ticket=PositionGetTicket(i))>0)
         if(Opcion_Graficos==EN_TODOS_LOS_GRAFICOS || (Symbol()==PositionGetString(POSITION_SYMBOL)))
           {
            double profit=PositionGetDouble(POSITION_PROFIT);

            GANANCIA_TOTAL+=profit;

            if(profit<=0)
              {
               if(Referencia==suma_operaciones || Equilibrio==Ganancia_Equilibrio)
                 {
                  perdidas+=profit;
                  ticketsPerdidas[perdidasTotal].tickets=ticket;
                  ticketsPerdidas[perdidasTotal].profit=profit;
                  perdidasTotal++;
                 }
               else
                  if((profitEvalua==0 || profitEvalua>MathAbs(profit)) && Valor_Referencia<=MathAbs(profit))
                    {
                     perdidas=profit;
                     ticketsPerdidas[0].tickets=ticket;
                     ticketsPerdidas[0].profit=profit;
                     perdidasTotal=1;
                     profitEvalua=MathAbs(profit);
                    }

              }
            else
              {
               if(Referencia==suma_operaciones || Equilibrio==Perdida_Equilibrio)
                 {
                  ganadas+=profit;
                  ticketsGanadas[ganadasTotal].tickets=ticket;
                  ticketsGanadas[ganadasTotal].profit=profit;
                  ganadasTotal++;
                 }
               else
                  if((profitEvalua==0 || profitEvalua>MathAbs(profit)) && Valor_Referencia<=MathAbs(profit))
                    {
                     ganadas=profit;
                     ticketsGanadas[0].tickets=ticket;
                     ticketsGanadas[0].profit=profit;
                     ganadasTotal=1;
                     profitEvalua=MathAbs(profit);
                    }
              }
           }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool selectionSort(ticketsProfits &arr[], int size,double profitHasta,int &hasta)
  {
   double profit=0;

   for(int i = 0; i < size; ++i)
     {
      if(i<size-1)
        {
         int minIndex = i;
         for(int j = i + 1; j < size; ++j)
           {
            if(arr[j].profit < arr[minIndex].profit)
              {
               minIndex = j;
              }
           }
         ticketsProfits ticketMinimo=arr[minIndex];

         arr[minIndex]=arr[i];
         arr[i]=ticketMinimo;
        }

      profit+=MathAbs(arr[i].profit);

      if(profitHasta<=profit)
        {
         Print(profit);
         hasta=i+1;
         return true;
        }

     }

   return false;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarTickets(ticketsProfits &tickets[],int hasta)
  {

   for(int i=0;i<hasta;i++)
     {
      if(!trade.PositionClose(tickets[i].tickets,-1))
         Print("Error al cerrar ",GetLastError()," Retcode ",trade.ResultRetcode());
     }
   Print("Se cerro operaciones Simultaneo");
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CierreTotal()
  {
   int pos=PositionsTotal();
   for(int i=pos; i>=0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket>0)
         if(Opcion_Graficos==EN_TODOS_LOS_GRAFICOS || (Symbol()==PositionGetString(POSITION_SYMBOL)))
            if(!trade.PositionClose(ticket,-1))
               Print("Error al cerrar ",GetLastError()," Retcode ",trade.ResultRetcode());
     }
  }
//+------------------------------------------------------------------+
