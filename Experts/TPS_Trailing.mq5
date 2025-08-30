//+------------------------------------------------------------------+
//|                                                 TPS_Trailing.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

#include <Trade\Trade.mqh>
CTrade trade;



input string S1="===== Conf sistema =====";//=======================================
input string Mercado="10-10-5";//GrupoMercado
input string Equilibro_Movimiento_Puntos="10-20-30";
input string S2="===== Conf TP =====";//=======================================
input int TP1_Defecto_Puntos=20;//TP en Puntos, Si no se puso el TP
input int SL1_Defecto_Puntos=20;//SL en Puntos, Si no se puso el SL
input int Desfase_TP_Puntos=200;
input string S3="===== Conf Ordenes Contrarias =====";//=======================================
input int numeroOrdenes=2;
input int Desfase_Ordenes_Puntos=200;
input string S4="===== Conf Trailing =====";//=======================================
input int StepTrailing=5;




input int numeroMagico=2222;

int history_total=0;

int GrupoMercado[];
int EquilibrioArreglo[];

struct sistema
  {
   ulong             ticketsMercado[100];
   ulong             ticketsPendientes[10];
   long              equilibrio[10];
   int               gruposMercado[10];
   double            tps[10];
   int               stepTrailing;
   bool              isBuy;
   int               totalMercado;
   int               totalPendientes;
   int               totalGrupos;
   double            slInicial;
   double            tpInicial;
   bool              operativo;
   bool              moverSL;
  };

sistema NewSistem[];
int totalMercado=0;
int orderTotal=0;

string Lineas="LINEAS 2024";


string InpDirectoryName="TP_Trailing";
string path;

#define OP_BUY 0
#define OP_SELL 1
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   orderTotal=OrdersTotal();
   path=InpDirectoryName+"//"+Symbol();

   HistorySelect(0,TimeCurrent());
   history_total=HistoryDealsTotal();

   totalMercado=0;

   if(!CaptarDesfases(GrupoMercado,Mercado))
      return INIT_FAILED;
   if(!CaptarDesfases(EquilibrioArreglo,Equilibro_Movimiento_Puntos))
      return INIT_FAILED;

   if(ArraySize(EquilibrioArreglo)<ArraySize(GrupoMercado))
     {
      Alert("EL NUMERO DE DATOS DE EQUILIBRIO DEBE SER IGUAL AL NUMERO DE GRUPO Mercado");
      return INIT_PARAMETERS_INCORRECT;
     }

   if(ArraySize(GrupoMercado)>10)
     {
      Alert("SOLO SE PUEDE ADMITIR HASTA 10 GRUPOS");
      return INIT_PARAMETERS_INCORRECT;
     }

   if(totalMercado>100)
     {
      Alert("LA SUMA DEL TOTAL DE Mercado NO PUEDE SUPERAR 100");
      return INIT_PARAMETERS_INCORRECT;
     }


   for(int i=0 ; i<ArraySize(GrupoMercado) ; i++)
      totalMercado+=(GrupoMercado[i]);

   LoadData();

   trade.SetExpertMagicNumber(numeroMagico);

   for(int j=0;j<ArraySize(NewSistem);j++)
     {
      if(NewSistem[j].operativo==true)
         for(int i=0 ; i<NewSistem[j].totalGrupos; i++)
            HLineCreate(0,Lineas+"INDICE "+IntegerToString(j)+IntegerToString(i),0,NewSistem[j].tps[i],clrGray,STYLE_DASHDOT,1,false,false,true,0);
     }

   EventSetMillisecondTimer(1);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,Lineas,-1,-1);

   WriteData();

   /* if(reason==REASON_CLOSE || reason==REASON_CHARTCHANGE)
       WriteData();
    else
      {
       FileDelete(path);
      }*/
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   trade.SetExpertMagicNumber(numeroMagico);
   NuevosSistemas();
   for(int i=0; i<ArraySize(NewSistem); i++)
      GestionarSistema(NewSistem[i],i);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GestionarSistema(sistema &system,int indice)
  {
   if(system.operativo==false)
      return;

   LogicaMoverTrailing(system);
   LogicaMoverTPSL(system);

   if(!HayMercadoActivas(system))
     {
      system.operativo=false;
      ObjectsDeleteAll(0,Lineas+"INDICE "+IntegerToString(indice),-1,OBJ_HLINE);
      ChartRedraw();
     }

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HayMercadoActivas(sistema &system)
  {
   for(int j=0; j<system.totalMercado; j++)
     {
      if(PositionSelectByTicket(system.ticketsMercado[j]))
         return true;
     }


   CerrarPendientes(system);

   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarPendientes(sistema &system)
  {
   for(int j=0; j<system.totalPendientes; j++)
     {
      if(OrderSelect(system.ticketsPendientes[j]))
        {
         if(!trade.OrderDelete(system.ticketsPendientes[j]))
            Print("No se cerro la orden pendiente ",GetLastError()," ",trade.ResultRetcode());
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void LogicaMoverTrailing(sistema &system)
  {
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   int size=system.totalGrupos;
   int numeroMercadoGestiona=system.totalMercado;

   for(int i=size-1; i>=0; i--)
     {
      if(system.isBuy?(system.tps[i]<=Bid):(system.tps[i]>=Ask))
        {
         system.moverSL=false;
         for(int j=0; j<numeroMercadoGestiona; j++)
           {
            if(!PositionSelectByTicket(system.ticketsMercado[j]))
               continue;

            ulong ticket=system.ticketsMercado[j];
            //TS Funcion
            if(system.isBuy==true && ((Bid-PositionGetDouble(POSITION_SL)>=system.stepTrailing*2*Point() && PositionGetDouble(POSITION_SL)<NormalizeDouble(Bid-system.stepTrailing*Point(),Digits())) || PositionGetDouble(POSITION_SL)==0))
               if(!trade.PositionModify(ticket,NormalizeDouble(Bid-system.stepTrailing*Point(),Digits()),PositionGetDouble(POSITION_TP)))
                  Print("Position Modify error ",GetLastError()," ",trade.ResultRetcode());

            if(system.isBuy==false && ((PositionGetDouble(POSITION_SL)-Ask>=system.stepTrailing*2*Point() && PositionGetDouble(POSITION_SL)>NormalizeDouble(Ask+system.stepTrailing*Point(),Digits())) || PositionGetDouble(POSITION_SL)==0))
               if(!trade.PositionModify(ticket,NormalizeDouble(Ask+system.stepTrailing*Point(),Digits()),PositionGetDouble(POSITION_TP)))
                  Print("Position Modify error ",GetLastError()," ",trade.ResultRetcode());

           }

         for(int j=numeroMercadoGestiona; j<system.totalMercado; j++)
           {
            if(!PositionSelectByTicket(system.ticketsMercado[j]))
               continue;

            ulong ticket=system.ticketsMercado[j];

            if(system.isBuy==true && (PositionGetDouble(POSITION_SL)<NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)+system.equilibrio[i]*Point(),Digits()) || PositionGetDouble(POSITION_SL)==0))
               if(!trade.PositionModify(ticket,NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)+system.equilibrio[i]*Point(),Digits()),PositionGetDouble(POSITION_TP)))
                  Print("Position Modify error ",GetLastError()," ",trade.ResultRetcode());

            if(system.isBuy==false && (PositionGetDouble(POSITION_SL)>NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)-system.equilibrio[i]*Point(),Digits()) || PositionGetDouble(POSITION_SL)==0))
               if(!trade.PositionModify(ticket,NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN)-system.equilibrio[i]*Point(),Digits()),PositionGetDouble(POSITION_TP)))
                  Print("Position Modify error ",GetLastError()," ",trade.ResultRetcode());
           }


         for(int j=0; j<system.totalPendientes; j++)
           {
            if(PositionSelectByTicket(system.ticketsPendientes[j]))
              {
               ulong ticket=system.ticketsPendientes[j];
               if(system.isBuy==true && ((Bid-PositionGetDouble(POSITION_SL)>=system.stepTrailing*2*Point() && PositionGetDouble(POSITION_SL)<NormalizeDouble(Bid-system.stepTrailing*Point(),Digits())) || PositionGetDouble(POSITION_SL)==0))
                  if(!trade.PositionModify(ticket,NormalizeDouble(Bid-system.stepTrailing*Point(),Digits()),PositionGetDouble(POSITION_TP)))
                     Print("Position Modify error ",GetLastError()," ",trade.ResultRetcode());

               if(system.isBuy==false && ((PositionGetDouble(POSITION_SL)-Ask>=system.stepTrailing*2*Point() && PositionGetDouble(POSITION_SL)>NormalizeDouble(Ask+system.stepTrailing*Point(),Digits())) || PositionGetDouble(POSITION_SL)==0))
                  if(!trade.PositionModify(ticket,NormalizeDouble(Ask+system.stepTrailing*Point(),Digits()),PositionGetDouble(POSITION_TP)))
                     Print("Position Modify error ",GetLastError()," ",trade.ResultRetcode());
              }
           }

         CerrarPendientes(system);

         break;
        }
      numeroMercadoGestiona-=system.gruposMercado[i];
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void LogicaMoverTPSL(sistema &system)
  {
   bool Entra=false;
   double SL=0,TP=0;
   ulong ticketModificado=-1;

   for(int j=0; j<system.totalPendientes; j++)
     {
      if(OrderSelect(system.ticketsPendientes[j]))
        {
         SL=NormalizeDouble(OrderGetDouble(ORDER_SL),Digits());
         TP=NormalizeDouble(OrderGetDouble(ORDER_TP),Digits());

         if(system.slInicial!=SL || system.tpInicial!=TP)
           {
            ticketModificado=system.ticketsPendientes[j];
            break;
           }
        }

      if(PositionSelectByTicket(system.ticketsPendientes[j]))
        {
         SL=NormalizeDouble(PositionGetDouble(POSITION_SL),Digits());
         TP=NormalizeDouble(PositionGetDouble(POSITION_TP),Digits());
         if(system.slInicial!=SL || system.tpInicial!=TP)
           {
            ticketModificado=system.ticketsPendientes[j];
            break;
           }
        }
     }


   if(ticketModificado==-1)
      for(int j=0; j<system.totalMercado; j++)
         if(PositionSelectByTicket((int)system.ticketsMercado[j]))
           {
            SL=NormalizeDouble(PositionGetDouble(POSITION_SL),Digits());
            TP=NormalizeDouble(PositionGetDouble(POSITION_TP),Digits());
            if(system.slInicial!=SL || system.tpInicial!=TP)
              {
               ticketModificado=system.ticketsMercado[j];
               break;
              }
           }


   if(ticketModificado==-1)
      return;


   if(system.moverSL)
      if(system.slInicial!=SL)
        {
         for(int j=0; j<system.totalMercado; j++)
           {
            if(system.ticketsMercado[j]==ticketModificado)
               continue;

            if(!PositionSelectByTicket(system.ticketsMercado[j]))
               continue;
            if(!trade.PositionModify((int)system.ticketsMercado[j],SL,PositionGetDouble(POSITION_TP)))
               Print("No modifico SL error ",GetLastError()," retcode ",trade.ResultRetcode()," ",system.ticketsMercado[j]," ",ticketModificado);
           }

         for(int j=0; j<system.totalPendientes; j++)
           {
            if(system.ticketsPendientes[j]==ticketModificado)
               continue;

            if(OrderSelect(system.ticketsPendientes[j]))
              {
               if(!trade.OrderModify(system.ticketsPendientes[j],OrderGetDouble(ORDER_PRICE_OPEN),SL,OrderGetDouble(ORDER_TP),0,0,0))
                  Print("No modifico SL error ",GetLastError()," retcode ",trade.ResultRetcode()," ",system.ticketsPendientes[j]," ",ticketModificado);
              }
            if(PositionSelectByTicket(system.ticketsPendientes[j]))
              {
               if(!trade.PositionModify((int)system.ticketsPendientes[j],SL,PositionGetDouble(POSITION_TP)))
                  Print("No modifico SL error ",GetLastError()," retcode ",trade.ResultRetcode()," ",system.ticketsPendientes[j]," ",ticketModificado);
              }
           }
         system.slInicial=SL;
        }

   if(system.tpInicial!=TP)
     {
      for(int j=0; j<system.totalMercado; j++)
        {
         if(system.ticketsMercado[j]==ticketModificado)
            continue;

         if(!PositionSelectByTicket(system.ticketsMercado[j]))
            continue;

         if(!trade.PositionModify((int)system.ticketsMercado[j],PositionGetDouble(POSITION_SL),TP))
            Print("No modifico TP error ",GetLastError()," retcode ",trade.ResultRetcode()," ",system.ticketsMercado[j]," ",ticketModificado);
        }

      for(int j=0; j<system.totalPendientes; j++)
        {
         if(system.ticketsPendientes[j]==ticketModificado)
            continue;

         if(OrderSelect(system.ticketsPendientes[j]))
           {
            if(!trade.OrderModify(system.ticketsPendientes[j],OrderGetDouble(ORDER_PRICE_OPEN),OrderGetDouble(ORDER_SL),TP,0,0,0))
               Print("No modifico TP error ",GetLastError()," retcode ",trade.ResultRetcode()," ",system.ticketsPendientes[j]," ",ticketModificado);
           }
         if(PositionSelectByTicket(system.ticketsPendientes[j]))
           {
            if(!trade.PositionModify((int)system.ticketsPendientes[j],PositionGetDouble(POSITION_SL),TP))
               Print("No modifico TP error ",GetLastError()," retcode ",trade.ResultRetcode()," ",system.ticketsPendientes[j]," ",ticketModificado);
           }
        }

      system.tpInicial=TP;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IniciarSistema(int indice,sistema &system,ulong ticket,double OP,double SL,double TP,ulong tipo,double Lote)
  {
   HistorySelect(iTime(Symbol(),PERIOD_D1,0),TimeCurrent());

   if(TP!=0)
     {
      if(!trade.PositionModify(ticket,SL,0))
        {
         Print("No modifico su tp a 0 ",GetLastError()," retcode:",trade.ResultRetcode());
         return false;
        }
     }


   if(SL==0 && SL1_Defecto_Puntos!=0)
     {
      SL=NormalizeDouble(OP+((tipo==OP_BUY)?-1:1)*SL1_Defecto_Puntos*Point(),Digits());
      if(!trade.PositionModify(ticket,SL,TP))
        {
         Print("No modifico su sl ",GetLastError()," retcode:",trade.ResultRetcode());
         return false;
        }
     }
  Print("============= DATOS ====================");
//ArrayResize(system.ticketsMercado,totalMercado);
   system.ticketsMercado[0]=ticket;
   
   Print("POSICION 0 ",ticket);
   for(int i=1; i<totalMercado; i++)
     {
      ticket=0;
      if(tipo==OP_BUY)
         ticket=BUY(Symbol(),SL,0,Lote,IntegerToString(i),numeroMagico);
      if(tipo==OP_SELL)
         ticket=SELL(Symbol(),SL,0,Lote,IntegerToString(i),numeroMagico);
      if(ticket!=0)
        {
         system.ticketsMercado[i]=ticket;
        }
      Print("POSICION ",ticket);
     }
  
  //////////////////////////////////////////
  
  for(int i=0;i<PositionsTotal();i++){
  Print("F POSICION TICKET: ",PositionGetTicket(i)," ID: ",PositionGetInteger(POSITION_IDENTIFIER)," MAGIC: ",PositionGetInteger(POSITION_MAGIC));  
  }
  /////////////////////////////////////////

   for(int j=1; j<=numeroOrdenes; j++)
     {
      ticket=0;
      double precio=OP+((tipo==OP_BUY)?-1:1)*Desfase_Ordenes_Puntos*Point()*j;

      if(tipo==OP_BUY)
         if(precio>SL)
            ticket=BUYLIMIT(Symbol(),precio,SL,0,Lote,IntegerToString(j),numeroMagico,indice);
      if(tipo==OP_SELL)
         if(precio<SL)
            ticket=SELLLIMIT(Symbol(),precio,SL,0,Lote,IntegerToString(j),numeroMagico,indice);
      if(ticket!=0)
        {
         system.ticketsPendientes[j-1]=ticket;
        }
      Print("ORDEN ",ticket);
     }


   int sizeGrupo=ArraySize(GrupoMercado);
   system.totalGrupos=sizeGrupo;
   ArrayCopy(system.equilibrio,EquilibrioArreglo,0,0,WHOLE_ARRAY);
   ArrayCopy(system.gruposMercado,GrupoMercado,0,0,WHOLE_ARRAY);
//ArrayResize(system.tps,sizeGrupo);

   if(TP==0)
      TP=TP1_Defecto_Puntos==0?0:((tipo==OP_BUY)?OP+TP1_Defecto_Puntos*Point():OP-TP1_Defecto_Puntos*Point());

   int multiploDireccion=(tipo==OP_BUY)?1:-1;
   for(int i=0 ; i<sizeGrupo ; i++)
     {
      system.tps[i]=NormalizeDouble(TP+multiploDireccion*i*Point()*Desfase_TP_Puntos,Digits());
      HLineCreate(0,Lineas+"INDICE "+IntegerToString(indice)+IntegerToString(i),0,system.tps[i],clrGray,STYLE_DASHDOT,1,false,false,true,0);
     }



   system.stepTrailing=StepTrailing;
   system.isBuy=(tipo==OP_BUY);
   system.totalMercado=totalMercado;
   system.totalPendientes=numeroOrdenes;
   system.slInicial=SL;
   system.tpInicial=0;
   system.operativo=true;
   system.moverSL=true;

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ulong SELL(string activo,double sl,double tp,double lotaje,string commentExpert,int magicNumber)
  {

   double BID=SymbolInfoDouble(activo,SYMBOL_BID);

   if(trade.Sell(lotaje,activo,BID,sl,tp,commentExpert))
     {
      ulong ticket=PositionGetTicket(PositionsTotal()-1);
      if(ticket!=0)
        {
         //Print("SELL order opened : ",PositionGetDouble(POSITION_PRICE_OPEN));
         return ticket;
        }
     }
   else
      Print("Error opening SELL order : ",GetLastError()," ",trade.ResultRetcode());// IMPRIME ERROR

   return -1;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ulong BUY(string activo,double sl,double tp,double lotaje,string commentExpert,int magicNumber)
  {
   double ASK=SymbolInfoDouble(activo,SYMBOL_ASK);

   if(trade.Buy(lotaje,activo,ASK,sl,tp,commentExpert))
     {
      ulong ticket=PositionGetTicket(PositionsTotal()-1);
      if(ticket!=0)
        {
         //Print("SELL order opened : ",PositionGetDouble(POSITION_PRICE_OPEN));
         return ticket;
        }
      else
         Print("Error opening BUY order : ",GetLastError()," ",trade.ResultRetcode());// IMPRIME ERROR
     }
   return -1;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ulong SELLLIMIT(string activo,double precio,double sl,double tp,double lotaje,string commentExpert,int magicNumber,int indice)
  {
   if(trade.SellLimit(lotaje,precio,activo,sl,tp,0,0,"PE "+IntegerToString(indice)))
     {
      return trade.ResultOrder();
     }
   else
      Print("Error opening SELL LIMIT order : ",GetLastError()," ",trade.ResultRetcode());// IMPRIME ERROR

   return -1;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ulong BUYLIMIT(string activo,double precio,double sl,double tp,double lotaje,string commentExpert,int magicNumber,int indice)
  {

   if(trade.BuyLimit(lotaje,precio,activo,sl,tp,0,0,"PE "+IntegerToString(indice)))
     {
      return trade.ResultOrder();
     }
   else
      Print("Error opening BUY LIMIT order : ",GetLastError()," ",trade.ResultRetcode());// IMPRIME ERROR

   return -1;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void NuevosSistemas()
  {
   HistorySelect(0,TimeCurrent());
   int totalActual=HistoryDealsTotal();

   if(totalActual>history_total)
     {
      for(int i=totalActual-1; i>=history_total; i--)
        {
         ulong deal_ticket=HistoryDealGetTicket(i);
         double volume=HistoryDealGetDouble(deal_ticket,DEAL_VOLUME);
         ulong deal_type=HistoryDealGetInteger(deal_ticket,DEAL_TYPE);
         long deal_entry=HistoryDealGetInteger(deal_ticket,DEAL_ENTRY);
         string symbol=HistoryDealGetString(deal_ticket,DEAL_SYMBOL);
         long position_ID=HistoryDealGetInteger(deal_ticket,DEAL_POSITION_ID);
         long magic=HistoryDealGetInteger(deal_ticket,DEAL_MAGIC);
         string comentario=HistoryDealGetString(deal_ticket,DEAL_COMMENT);
         double open=HistoryDealGetDouble(deal_ticket,DEAL_PRICE);
         double sl=HistoryDealGetDouble(deal_ticket,DEAL_SL);
         double tp=HistoryDealGetDouble(deal_ticket,DEAL_TP);

         if(magic!=numeroMagico && symbol==Symbol() && deal_entry==DEAL_ENTRY_IN && (deal_type==DEAL_TYPE_BUY || deal_type==DEAL_TYPE_SELL))
           {
            //EL ID SIEMPRE ES EL TICKET DE LA POSICION
            int indiceSistema=CaptarIndice();
            IniciarSistema(indiceSistema,NewSistem[indiceSistema],PositionGetTicket(PositionsTotal()-1),open,sl,tp,deal_type,volume);
           }
        }
     }
   history_total=totalActual;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ulong ObtenerTicket(ulong ID)
  {
   for(int i=PositionsTotal()-1;i>=0;i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket!=0)
        {
         if(PositionGetInteger(POSITION_IDENTIFIER)==ID)
           {
            return PositionGetInteger(POSITION_TICKET);
           }
        }
     }
   return -1;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CaptarIndice()
  {
   int Size=ArraySize(NewSistem);
   for(int i=0; i<ArraySize(NewSistem); i++)
      if(NewSistem[i].operativo==false)
         return i;

   ArrayResize(NewSistem,Size+1);

   return Size;
  }
//+------------------------------------------------------------------+
bool CaptarDesfases(int &Desfases[],string desfases)
  {
   string desfases_string[];
   StringSplit(desfases,'-',desfases_string);

   if(ArraySize(desfases_string)==0)
     {
      Alert("Tienes que poner por lo menos un desfase");
      return false;
     }

   ArrayResize(Desfases,ArraySize(desfases_string));

   for(int i=0; i<ArraySize(desfases_string); i++)
     {
      string comentario="";
      if(!VerificarEntero(desfases_string[i],comentario))
         return false;

      Desfases[i]=(int)StringToInteger(desfases_string[i]);
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarEntero(string evaluaString,string &comentario)
  {
   for(int i=0; i<StringLen(evaluaString); i++)
     {
      ushort char_=StringGetCharacter(evaluaString,i);
      if(!('0'<=char_ && char_<='9'))
        {
         comentario="Los valores hora o minuto deben de ser valores enteros";
         return false;
        }
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HLineCreate(const long            chart_ID=0,        // chart's ID
                 const string          name="HLine",      // line name
                 const int             sub_window=0,      // subwindow index
                 double                price=0,           // line price
                 const color           clr=clrRed,        // line color
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // line style
                 const int             width=1,           // line width
                 const bool            back=false,        // in the background
                 const bool            selection=true,    // highlight to move
                 const bool            hidden=true,       // hidden in the object list
                 const long            z_order=0)         // priority for mouse click
  {
//--- if the price is not set, set it at the current Bid price level
   if(!price)
      price=SymbolInfoDouble(Symbol(),SYMBOL_BID);
//--- reset the error value
   ResetLastError();
//--- create a horizontal line
   if(!ObjectCreate(chart_ID,name,OBJ_HLINE,sub_window,0,price))
     {
      Print(__FUNCTION__,
            ": failed to create a horizontal line! Error code = ",GetLastError());
      return(false);
     }
//--- set line color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set line display style
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- set line width
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of moving the line by mouse
//--- when creating a graphical object using ObjectCreate function, the object cannot be
//--- highlighted and moved by default. Inside this method, selection parameter
//--- is true by default making it possible to highlight and move the object
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- hide (true) or display (false) graphical object name in the object list
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- set the priority for receiving the event of a mouse click in the chart
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- successful execution
   return(true);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
void WriteData()
  {
//--- open the file
   ResetLastError();
   int handle=FileOpen(path,FILE_READ|FILE_WRITE|FILE_BIN);
   if(handle!=INVALID_HANDLE)
     {
      //--- write array data to the end of the file
      FileSeek(handle,0,SEEK_SET);
      FileWriteArray(handle,NewSistem,0,WHOLE_ARRAY);
      //--- close the file
      FileClose(handle);
     }
   else
      Print("Failed to open the file, error ",GetLastError());
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void LoadData()
  {
   ResetLastError();
   int file_handle=FileOpen(path,FILE_READ|FILE_BIN);
   if(file_handle!=INVALID_HANDLE)
     {
      //--- read all data from the file to the array
      FileReadArray(file_handle,NewSistem,0,WHOLE_ARRAY);
      FileClose(file_handle);
      Print("CARGO ARCHIVO");
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
