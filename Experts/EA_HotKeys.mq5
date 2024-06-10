//+------------------------------------------------------------------+
//|                                                   EA_HotKeys.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"


#include<Trade\Trade.mqh>
CTrade trade;

input string Letra_compra="C";//Letra Compra
input string Letra_venta="V";//Letra Venta
input string Letra_cerrar="D";//Letra Cerrar
input string s1="====================================================";
input double Lotaje=0.01;//Lotaje
input int stop_loss=100;//Stop loss puntos
input int take_profit=100;//Take Profit puntos
input int puntos_Break_Even=300;//START Puntos Break Even
input int puntos_agrega_BE=100;//DESFASE Puntos Break Even
input string comentario="comentario Expert";//Comentario Experto


ushort letraCompra=0;
ushort letraVenta=0;
ushort letraCerrar=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   int stop=(int)SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL);

   if(puntos_Break_Even<=puntos_agrega_BE+stop)
     {
      Alert("START BREAK debe ser mayor al DESFASE BREAK por ",stop," puntos");
      return INIT_PARAMETERS_INCORRECT;
     }


   if(StringLen(Letra_compra)!=1)
     {
      Alert("La letra compra debe ser 1 letra o numero");
      return INIT_PARAMETERS_INCORRECT;
     }

   if(StringLen(Letra_venta)!=1)
     {
      Alert("La letra venta debe ser 1 letra o numero");
      return INIT_PARAMETERS_INCORRECT;
     }

   if(StringLen(Letra_cerrar)!=1)
     {
      Alert("La letra cerrar debe ser 1 letra o numero");
      return INIT_PARAMETERS_INCORRECT;
     }

   letraCompra=StringGetCharacter(Letra_compra,0);
   letraVenta=StringGetCharacter(Letra_venta,0);
   letraCerrar=StringGetCharacter(Letra_cerrar,0);

   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // identificador de evento
                  const long& lparam,   // parámetro de evento del tipo long
                  const double& dparam, // parámetro de evento del tipo double
                  const string& sparam  // parámetro de evento del tipo string
                 )
  {

   if(id==0)
     {
      double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
      double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

      if(lparam==letraCompra)
        {
         if(!trade.Buy(Lotaje,Symbol(),Ask,Ask-stop_loss*Point(),Ask+take_profit*Point(),comentario))
            Print("No opero buy error : ",GetLastError()," result error ",trade.ResultRetcode());
        }


      if(lparam==letraVenta)
        {
         if(!trade.Sell(Lotaje,Symbol(),Bid,Bid+stop_loss*Point(),Bid-take_profit*Point(),comentario))
            Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
        }

      if(lparam==letraCerrar)
         CerrarOperaciones();

      Sleep(1000);
     }

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarOperaciones()
  {
   int totalPositions=PositionsTotal();
   for(int i = totalPositions-1; i >= 0; i--)
     {
      if(PositionSelectByTicket(PositionGetTicket(i)))
         if(PositionGetString(POSITION_SYMBOL)==Symbol())
           {
            if(!trade.PositionClose(PositionGetTicket(i),-1))
               Print("No cerro operacion por ganancia, error ,",GetLastError()," ",trade.ResultRetcode());
           }
     }

  }
//+------------------------------------------------------------------+
void BreakEvent()
  {
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   for(int cnt=0; cnt<PositionsTotal(); cnt++) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      if(PositionGetTicket(cnt)==0) // SE SELECCIONA CADA ORDEN PARA PODER EVALUAR (si no se selecciona no se evalua)
         continue;

      double SL=PositionGetDouble(POSITION_SL);
      double OP=PositionGetDouble(POSITION_PRICE_OPEN);

      if(PositionGetString(POSITION_SYMBOL)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
        {

         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && (NormalizeDouble(Bid-puntos_Break_Even*Point(),Digits())>=OP)
            && (NormalizeDouble(OP+puntos_agrega_BE*Point(),Digits())>SL || SL==0))
           {
            if(!trade.PositionModify(PositionGetInteger(POSITION_TICKET),NormalizeDouble(OP+puntos_agrega_BE*Point(),Digits()),PositionGetDouble(POSITION_TP)))
               Print("Position Modify error ",GetLastError()," result error ",trade.ResultRetcode());
           }

         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && (NormalizeDouble(Ask+puntos_Break_Even*Point(),Digits())<=OP)
            && (NormalizeDouble(OP-puntos_agrega_BE*Point(),Digits())<SL || SL==0))
           {
            if(!trade.PositionModify(PositionGetInteger(POSITION_TICKET),NormalizeDouble(OP-puntos_agrega_BE*Point(),Digits()),PositionGetDouble(POSITION_TP)))
               Print("Position Modify error ",GetLastError()," result error ",trade.ResultRetcode());
           }
        }
     }
  }
//+------------------------------------------------------------------+
