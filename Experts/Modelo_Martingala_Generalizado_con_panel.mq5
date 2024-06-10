//+------------------------------------------------------------------+
//|                     Modelo_Martingala_Generalizado_con_panel.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link "https://www.mql5.com"
#property version "1.00"
#property strict

#include <PanelSimpleFilasColumnas.mqh>
Panelfilas_columnas_ Panel;

#include<Trade\Trade.mqh>
CTrade trade;

enum tipo_Operaciones
  {
   ONLY_BUY = 0,
   ONLY_SELL = 1,
   BUYS_SELLS = 2,
  };

enum tipoDeLote
  {
   FIJO = 0,
   BALANCE = 1,
  };

enum redondeoLote
  {
   HACIA_ARRIBA = 0,
   HACIA_ABAJO = 1,
   NORMAL = 2,
  };

enum m_bases
  {
   USD = 0,
   EUR = 1,
   JPY = 2,
  };

enum ENUM_Horas
  {
   _0am = 0,   //:  0 am
   _1am = 1,   //:  1 am
   _2am = 2,   //:  2 am
   _3am = 3,   //:  3 am
   _4am = 4,   //:  4 am
   _5am = 5,   //:  5 am
   _6am = 6,   //:  6 am
   _7am = 7,   //:  7 am
   _8am = 8,   //:  8 am
   _9am = 9,   //:  9 am
   _10am = 10, //: 10 am
   _11am = 11, //: 11 am
   _12pm = 12, //: 12 pm
   _1pm = 13,  //:  1 pm
   _2pm = 14,  //:  2 pm
   _3pm = 15,  //:  3 pm
   _4pm = 16,  //:  4 pm
   _5pm = 17,  //:  5 pm
   _6pm = 18,  //:  6 pm
   _7pm = 19,  //:  7 pm
   _8pm = 20,  //:  8 pm
   _9pm = 21,  //:  9 pm
   _10pm = 22, //:  10 pm
   _11pm = 23, //:  11 pm
  };

// Parámetros de entrada
input int MagicNumber = 2222;
input tipo_Operaciones tipoOperaciones = ONLY_BUY;
input ENUM_TIMEFRAMES timeFrame_Trade = PERIOD_M15;
m_bases monedaBaseOrigenInput=USD;//Moneda base
input int spread_máximo = 10; // Spread Maximo
input string Comentario = "Exp Martingala";
input string S0 = "**************** LOTE ****************"; //****************************************************************
input tipoDeLote tipo_Lote = FIJO;                          // Tipo Multiplicador
input double MULTIPLICADOR_FIJO = 20;
input double MULTIPLICADOR_BALANCE = 500;
input redondeoLote Tipo_Redondeo = NORMAL;
input string S2 = "**************** MARTINGALA ****************"; //****************************************************************
input double TasaCrecimiento = 1.15;                               // Tasa Crecimiento
input int P = 1;                 // Tipo Redondeo
input string S3 = "**************** TAKE_PROFIT ****************"; //****************************************************************
input double SemillaTP=0.5;//Semilla TP
input double TasaCrecimientoBeneficio = 1.1;                       //Tasa Crecimiento Beneficio
input double ConstanteBeneficio = 0;                            // Constante Beneficio
input double MultiploTP = 2;                                     // Multiplo TP
input string S1 = "**************** BLOQUES ****************";    //****************************************************************
input int Distancia1 = 5;                                         // Distancia 1
input int Bloque1 = 3;                                            // Bloque 1
input int Distancia2 = 10;                                        // Distancia 2
input int Bloque2 = 5;                                            // Bloque 2
input int Distancia3 = 15;                                        // Distancia 3
input int Bloque3 = 15;                                           // Bloque 3
// Variables globales
string c_Buy="",c_Sell="";

string LineSell="Line Equilibrio Sell";
string LineBuy="Line Equilibrio Buy";

string cerrarBuy="Boton Buy";
string cerrarSell="Boton Sell";
// Función para calcular el tamaño del lote
double CalcularTamanoLote(double multiplicador, int n)
  {
   double lote = 0.01*multiplicador;

   if(n > 1)
     {
      lote = RoundDouble(0.01 * MathPow(TasaCrecimiento, n - P),2,Tipo_Redondeo)* multiplicador;
     }
// Print("Lote redondeado ", lote);
   return lote;
  }

// Función para calcular el nivel de TP
double CalcularProfitTP(double LoteInicial, int n)
  {
   double nivelTP = SemillaTP;
   if(n > 1)
     {
      double nivelAnterior = CalcularProfitTP(LoteInicial, n - 1);
      Print("Antes del redondeo ",(nivelAnterior * TasaCrecimientoBeneficio + ConstanteBeneficio));
      Print("Despues ",MathRound((nivelAnterior * TasaCrecimientoBeneficio + ConstanteBeneficio) / MultiploTP) * MultiploTP);
      nivelTP =MathRound((nivelAnterior * TasaCrecimientoBeneficio + ConstanteBeneficio) / MultiploTP) * MultiploTP;
     }
   Print("Profit Calculado NIVEL ",n," = ", nivelTP);
   Print("-----------------------------------------------------");
   return nivelTP;
  }

// Función para abrir una orden de compra
void AbrirCompra(double lote, double LoteInicial, int numOperaciones,double lotesTotal,double ultimoLote)
  {
   double stopLoss = 0;
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   if(trade.Buy(lote,Symbol(),Ask,0,0,(Comentario + " B" + IntegerToString(numOperaciones + 1))))
     {
      ulong ticket=PositionGetTicket(PositionsTotal()-1);
      Print("Orden de compra abierta. Ticket: ", ticket);
      double takeProfit = CalcularProfitTP(LoteInicial, numOperaciones + 1);
      takeProfit=takeProfit*int(LoteInicial/0.01);
      Print("Resultado multiplicado por LOTEINICIAL/0.01= ",takeProfit);
      takeProfit=RoundDouble(takeProfit,2,HACIA_ARRIBA);
      Print("Resultado redondeado a 2 digitos Hacia arriba ",takeProfit);
      c_Buy="BUY:  PROFIT CALCULADO  "+ DoubleToString(takeProfit, 2)+" Nro Operaciones: "+IntegerToString(numOperaciones+1)+" UltimoLote: "+DoubleToString(lote);
      TextearPanel(true,IntegerToString(numOperaciones+1),DoubleToString(lote+lotesTotal,2),DoubleToString(lote,2),DoubleToString(takeProfit, 2));
      double PrecioTakeProfit = SacarPrecioTP_ParaProfit_Conjunto(true, takeProfit);
      double PrecioEquilibrio = SacarPrecioTP_ParaProfit_Conjunto(true, 0);
      PutPriceTakeProfits(true, PrecioTakeProfit);
      DibujarMoverEquilibrio(LineBuy,PrecioEquilibrio);
      // ultimoPrecioCompra = Ask;
     }
   else
     {
      Print("Error al abrir orden de compra. Código de error: ",GetLastError()," result error ",trade.ResultRetcode());
     }
  }

// Función para abrir una orden de venta
void AbrirVenta(double lote, double LoteInicial, int numOperaciones,double lotesTotal,double ultimoLote)
  {
   double stopLoss = 0;
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   if(trade.Sell(lote,Symbol(),Bid,0,0,(Comentario + " S" + IntegerToString(numOperaciones + 1))))
     {
      ulong ticket=PositionGetTicket(PositionsTotal()-1);
      Print("Orden de venta abierta. Ticket: ", ticket);
      double takeProfit = CalcularProfitTP(LoteInicial, numOperaciones + 1);
      takeProfit=takeProfit*int(LoteInicial/0.01);
      Print("Resultado multiplicado por LOTEINICIAL/0.01= ",takeProfit);
      takeProfit=RoundDouble(takeProfit,2,HACIA_ARRIBA);
      Print("Resultado redondeado a 2 digitos Hacia arriba ",takeProfit);
      c_Sell="SELL:  PROFIT CALCULADO  "+ DoubleToString(takeProfit, 2)+" Nro Operaciones: "+IntegerToString(numOperaciones+1)+" UltimoLote: "+DoubleToString(lote);
      TextearPanel(false,IntegerToString(numOperaciones+1),DoubleToString(lote+lotesTotal,2),DoubleToString(lote,2),DoubleToString(takeProfit, 2));
      double PrecioTakeProfit = SacarPrecioTP_ParaProfit_Conjunto(false, takeProfit);
      double PrecioEquilibrio = SacarPrecioTP_ParaProfit_Conjunto(false, 0);
      PutPriceTakeProfits(false, PrecioTakeProfit);
      DibujarMoverEquilibrio(LineSell,PrecioEquilibrio);
      // ultimoPrecioVenta = Bid;
     }
   else
     {
      Print("Error al abrir orden de venta. Código de error: ",GetLastError()," result error ",trade.ResultRetcode());
     }
  }

// Función para abrir las operaciones
void AbrirOperaciones()
  {
   int nmbBuys = 0, nmbSells = 0;
   double ultimoPrecioCompra = 0, ultimoPrecioVenta = 0;
   datetime startTimeBuy, startTimeSell;
   double lotesTotalBuy=0, lotesTotalSell=0;
   double ultimoLoteBuy=0,ultimoLoteSell=0;
   double profitBuy=0,profitSell=0;
   GetValorOrdersByMagic(ultimoPrecioCompra, ultimoPrecioVenta, nmbBuys, nmbSells, startTimeBuy, startTimeSell,
                         lotesTotalBuy, lotesTotalSell,ultimoLoteBuy,ultimoLoteSell,profitBuy,profitSell);

   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   TextearPanel(true,IntegerToString(nmbBuys),DoubleToString(lotesTotalBuy,2),DoubleToString(ultimoLoteBuy,2));
   TextearPanel(false,IntegerToString(nmbSells),DoubleToString(lotesTotalSell,2),DoubleToString(ultimoLoteSell,2));
   Panel.Text(0,5,"PAct: "+DoubleToString(profitBuy,2));
   Panel.Text(1,5,"PAct: "+DoubleToString(profitSell,2));

   if(tipoOperaciones == ONLY_BUY || tipoOperaciones == BUYS_SELLS)
     {
      double multiplicador = CalcularMultiplicador(startTimeBuy);
      double loteInicial=CalcularTamanoLote(multiplicador, 1);
      double lote = CalcularTamanoLote(multiplicador, nmbBuys+1);
      if(lote > 0)
        {
         if(nmbBuys == 0 || (nmbBuys < Bloque1 && ((ultimoPrecioCompra - Ask) / Point()) >= Distancia1) ||
            (nmbBuys >= Bloque1 && nmbBuys < Bloque1 + Bloque2 && ((ultimoPrecioCompra - Ask) / Point()) >= Distancia2) ||
            (nmbBuys >= Bloque1 + Bloque2 && nmbSells < Bloque1 + Bloque2 + Bloque3 && ((ultimoPrecioCompra - Ask) / Point()) >= Distancia3))
           {
            AbrirCompra(lote, loteInicial, nmbBuys,lotesTotalBuy,ultimoLoteBuy);
            // AbrirVenta(lote);
           }
        }
     }
   if(tipoOperaciones == ONLY_SELL || tipoOperaciones == BUYS_SELLS)
     {
      double multiplicador = CalcularMultiplicador(startTimeSell);
      double loteInicial=CalcularTamanoLote(multiplicador, 1);
      double lote = CalcularTamanoLote(multiplicador, nmbSells + 1);

      if(lote > 0)
        {
         if(nmbSells == 0 || (nmbSells < Bloque1 && ((Bid - ultimoPrecioVenta) / Point()) >= Distancia1) ||
            (nmbSells >= Bloque1 && nmbSells < Bloque1 + Bloque2 && ((Bid - ultimoPrecioVenta) / Point()) >= Distancia2) ||
            (nmbSells >= Bloque1 + Bloque2 && nmbSells < Bloque1 + Bloque2 + Bloque3 && ((Bid - ultimoPrecioVenta) / Point()) >= Distancia3))
           {
            AbrirVenta(lote, loteInicial, nmbSells,lotesTotalSell,ultimoLoteSell);
            // AbrirVenta(lote);
           }
        }
     }
  }
// Funcion para obtener el numero de operaciones abiertas tanto buys y sells como tambien el precio de las ultimas entradas de cada tipo
void GetValorOrdersByMagic(double &ultimoPrecioC, double &ultimoPrecioV, int &operacionesCompra, int &operacionesVenta
                           , datetime &startTimeBuy, datetime &startTimeSell,double &lotesTotalBuy,double &lotesTotalSell,double &ultimoLoteBuy,double &ultimoLoteSell,double &profitBuy,double &profitSell)
  {
   operacionesCompra = 0;
   operacionesVenta = 0;
   ultimoPrecioC = 0;
   ultimoPrecioV = 0;
   startTimeBuy = 0;
   startTimeSell = 0;
   profitBuy=0;
   profitSell=0;

   int TotalOrdenes = PositionsTotal();

   for(int k=TotalOrdenes-1; k>=0; k--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      if(PositionGetTicket(k)==0) // SE SELECCIONA CADA ORDEN PARA PODER EVALUAR (si no se selecciona no se evalua)
         continue;
      // Filtrar por número mágico y tiempo de apertura
      if(PositionGetInteger(POSITION_MAGIC) == MagicNumber && PositionGetString(POSITION_SYMBOL) == Symbol())
        {
         if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY)
           {
            profitBuy+=PositionGetDouble(POSITION_PROFIT);
            startTimeBuy = (datetime)PositionGetInteger(POSITION_TIME);
            if(ultimoPrecioC == 0 || ultimoPrecioC > PositionGetDouble(POSITION_PRICE_OPEN))
              {
               ultimoPrecioC = PositionGetDouble(POSITION_PRICE_OPEN);
               ultimoLoteBuy=PositionGetDouble(POSITION_VOLUME);
              }
            operacionesCompra++;
            lotesTotalBuy+=PositionGetDouble(POSITION_VOLUME);
           }
         if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL)
           {
            profitSell+=PositionGetDouble(POSITION_PROFIT);
            startTimeSell = (datetime)PositionGetInteger(POSITION_TIME);
            if(ultimoPrecioV == 0 || ultimoPrecioV < PositionGetDouble(POSITION_PRICE_OPEN))
              {
               ultimoPrecioV = PositionGetDouble(POSITION_PRICE_OPEN);
               ultimoLoteSell=PositionGetDouble(POSITION_VOLUME);
              }
            operacionesVenta++;
            lotesTotalSell+=PositionGetDouble(POSITION_VOLUME);
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PutPriceTakeProfits(bool IsBuys, double takeProfit)
  {

   int TotalOrdenes = PositionsTotal();

   for(int k=TotalOrdenes-1; k>=0; k--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      if(PositionGetTicket(k)==0) // SE SELECCIONA CADA ORDEN PARA PODER EVALUAR (si no se selecciona no se evalua)
         continue;
      // Filtrar por número mágico y tiempo de apertura
      if(PositionGetInteger(POSITION_MAGIC) == MagicNumber && PositionGetString(POSITION_SYMBOL) == Symbol())
         if(takeProfit!=PositionGetDouble(POSITION_TP))
           {
            if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY && IsBuys)
              {
               if(!trade.PositionModify(PositionGetInteger(POSITION_TICKET),PositionGetDouble(POSITION_SL),takeProfit))
                  Print("ERROR AL PONER EL TAKEPROFIT ,",GetLastError(),"  ",takeProfit," ",PositionGetDouble(POSITION_TP)," result error ",trade.ResultRetcode());
              }
            if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL && !IsBuys)
              {
               if(!trade.PositionModify(PositionGetInteger(POSITION_TICKET),PositionGetDouble(POSITION_SL),takeProfit))
                  Print("ERROR AL PONER EL TAKEPROFIT ,",GetLastError(),"  ",takeProfit," ",PositionGetDouble(POSITION_TP)," result error ",trade.ResultRetcode());
              }
           }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool HasCandleClosed(string symbol, ENUM_TIMEFRAMES timeframe)
  {
   static datetime prevCandleTime = iTime(symbol, timeframe, 0);
   datetime currentCandleTime = iTime(symbol, timeframe, 0);

   if(prevCandleTime != currentCandleTime)
     {
      prevCandleTime = currentCandleTime;
      return true;
     }

   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*bool AreBarsLoaded(string symbol, ENUM_TIMEFRAMES timeframe)
  {
   MqlRates rates[];
   int count = 2;
   int loadBars = LoadBars(symbol, timeframe, 0, count, rates);
   if(loadBars < 0)
      return false;

   int loadedBars = iBars(symbol, timeframe);
   int requiredBars = iBars(NULL, timeframe);

   return (loadedBars == requiredBars);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int LoadBars(string symbol, int timeframe, int startBar, int count, MqlRates &rates[])
  {
   return CopyRates(symbol, timeframe, startBar, count, rates);
  }
*/
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CalculateBalanceInPeriod(datetime startTime)
  {

   double initialBalance = AccountInfoDouble(ACCOUNT_BALANCE);
// Calcular el balance en el período de tiempo
   double balance = initialBalance;

   HistorySelect(startTime,TimeCurrent());
//--- create objects
   string   name=Symbol();
   uint     total=HistoryDealsTotal();
   ulong    ticket=0;
   double   price;
   double   profit;
   double   swap;
   double  commision;
   datetime time;
   string   symbol;
   long     type;
   long     entry;
   int        MN;
//--- for all deals
   for(uint i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         //--- get deals properties
         price =HistoryDealGetDouble(ticket,DEAL_PRICE);
         time  =(datetime)HistoryDealGetInteger(ticket,DEAL_TIME);
         symbol=HistoryDealGetString(ticket,DEAL_SYMBOL);
         type  =HistoryDealGetInteger(ticket,DEAL_TYPE);
         entry =HistoryDealGetInteger(ticket,DEAL_ENTRY);
         profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         commision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         MN=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         //--- only for current symbol
         double balanceLocal = 0;

         //ACAAAAAAAAAAAAAAAAAAAAAAAAAA
         if(MN==MagicNumber && symbol==Symbol())
            if(entry==DEAL_ENTRY_IN)
               if(type == DEAL_TYPE_BUY || type == DEAL_TYPE_SELL)
                  balanceLocal = profit + swap + commision;

         balance = balance - balanceLocal;
        }
     }
   return balance;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CalcularMultiplicador(datetime startTime)
  {
   if(tipo_Lote == FIJO)
      return MULTIPLICADOR_FIJO;

   double balanceStart = CalculateBalanceInPeriod(startTime);
   return NormalizeDouble(balanceStart / (MULTIPLICADOR_BALANCE), 2);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double RoundDouble(double value, int decimalDigits, redondeoLote roundingMethod)
  {
   double multiplier = MathPow(10, decimalDigits);
   double roundedValue = value * multiplier;

   if(roundingMethod == HACIA_ARRIBA)  // Redondeo hacia arriba
      roundedValue = MathCeil(roundedValue);
   else
      if(roundingMethod == HACIA_ABAJO)  // Redondeo hacia abajo
         roundedValue = MathFloor(roundedValue);
      else // Redondeo normal
         roundedValue = MathRound(roundedValue);

   return roundedValue / multiplier;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluarHorario(int Inicio, int Final, int MInicio, int MFinal, datetime TimeEvalua)
  {
   if(Inicio==Final && MInicio==MFinal)
      return true;


   MqlDateTime timeEvalua;
   TimeToStruct(TimeEvalua,timeEvalua);

   int Minuto = timeEvalua.min;
   int Hora = timeEvalua.hour;

   if((Inicio < Final)?(!(Inicio <= Hora && Hora <= Final)):(!(Inicio <= Hora || Hora <= Final)))
      return false;

   if(Inicio!=Final)
     {
      if(Inicio == Hora)
         if(Minuto < MInicio)
            return false;

      if(Final == Hora)
         if(Minuto >= MFinal)
            return false;
     }
   else
     {
      if(MFinal > MInicio)
        {
         if(Hora != Inicio)
            return false;

         if(!(Minuto >= MInicio && Minuto < MFinal))
            return false;
        }
      else
         if(MFinal < MInicio)
           {
            if(Hora == Inicio)
               if(!(MInicio <= Minuto || Minuto < MFinal))
                  return false;
           }
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double SacarPrecioTP_ParaProfit_Conjunto(bool TipoBuy, double Profit)
  {
   double sumaDeLotes = 0;
   double sumaDeProducto_lote_openPriceBreak = 0;

   int TotalOrdenes = PositionsTotal();

   for(int k=TotalOrdenes-1; k>=0; k--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      if(PositionGetTicket(k)==0) // SE SELECCIONA CADA ORDEN PARA PODER EVALUAR (si no se selecciona no se evalua)
         continue;
      if(PositionGetInteger(POSITION_MAGIC)== MagicNumber && PositionGetString(POSITION_SYMBOL) == Symbol())  // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
         // donde esta el experto.. entonces no lo evalua
        {
         if(TipoBuy && PositionGetInteger(POSITION_TYPE) != POSITION_TYPE_BUY)
            continue;
         if(!TipoBuy && PositionGetInteger(POSITION_TYPE) != POSITION_TYPE_SELL)
            continue;

         sumaDeLotes += PositionGetDouble(POSITION_VOLUME);
         double openPriceBreak = 0;
         // double Adicionar=int(OrderCommission()/(SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE)*OrderLots()));
         //  Adicionar+=int(OrderSwap()/(SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE)*OrderLots()));
         //double Adicionar = int(OrderCommission() / (SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_VALUE) * PositionGetDouble(POSITION_VOLUME)));
         double Adicionar = int(PositionGetDouble(POSITION_SWAP) / (SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_VALUE) * PositionGetDouble(POSITION_VOLUME)));
         openPriceBreak = RoundDouble(PositionGetDouble(POSITION_PRICE_OPEN) + Adicionar * Point() * (TipoBuy ? -1 : 1), Digits(), HACIA_ARRIBA);
         sumaDeProducto_lote_openPriceBreak += PositionGetDouble(POSITION_VOLUME) * openPriceBreak;
        }
     }

   double precioProfit = (Profit * Point()) / (SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_VALUE));
   precioProfit = ((TipoBuy ? 1 : -1) * precioProfit + sumaDeProducto_lote_openPriceBreak) / sumaDeLotes;

   Print("Precio Profit  ", precioProfit);
   precioProfit = RoundDouble(precioProfit, Digits(), HACIA_ARRIBA);
   Print(precioProfit);
   return precioProfit;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarOperacionesPorMagicNumberYsimbolo(int magicNumber, string symbol)
  {
   int TotalOrdenes = PositionsTotal();

   for(int k=TotalOrdenes-1; k>=0; k--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong ticket=PositionGetTicket(k);

      if(ticket==0) // SE SELECCIONA CADA ORDEN PARA PODER EVALUAR (si no se selecciona no se evalua)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)== magicNumber && PositionGetString(POSITION_SYMBOL) == symbol)
        {
         if(trade.PositionClose(PositionGetInteger(POSITION_TICKET),-1))
            Print("Se cerró la orden: ", ticket);
         else
            Print("Error al cerrar la orden: ", ticket, ", Error: ", GetLastError()," result error ",trade.ResultRetcode());
        }
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double ConvertirMonedaADolares(string simbolo,double cantidad)
  {
   string monedaBaseOrigen = StringSubstr(simbolo, 0, 3);  // Obtener la moneda base del símbolo actual

   string monedaBase=(monedaBaseOrigenInput==USD?"USD":(monedaBaseOrigenInput==EUR?"EUR":"JPY"));

   if(monedaBase == monedaBaseOrigen)
     {
      return cantidad;  // No se necesita conversión si las monedas son iguales
     }
   else
     {
      double tipoCambioOrigen = SymbolInfoDouble(monedaBase + monedaBaseOrigen, SYMBOL_BID);  // Obtener tipo de cambio origen

      double equivalente = cantidad * tipoCambioOrigen;

      return equivalente;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SonMonedasForex(string simbolo)
  {
   string array[10] = {"USD", "EUR", "JPY", "CHF", "CAD", "GBP", "NZD", "AUD", "XAU", "XAG"};

   string monedaBase = StringSubstr(simbolo, 0, 3);
   string otraMoneda = StringSubstr(simbolo, 3);

   int longitud = ArraySize(array);

   bool esMonedaBaseForex = false;
   bool esOtraMonedaForex = false;

   for(int i = 0; i < longitud; i++)
     {
      if(monedaBase == array[i])
        {
         esMonedaBaseForex = true;
        }

      if(otraMoneda == array[i])
        {
         esOtraMonedaForex = true;
        }

      if(esMonedaBaseForex && esOtraMonedaForex)
        {
         return true;
        }
     }

   return false;
  }

// Función de inicialización
int OnInit()
  {
   LineSell+=IntegerToString(MagicNumber);
   LineBuy+=IntegerToString(MagicNumber);

   if(!CrearPanel())
      return INIT_FAILED;

   trade.SetExpertMagicNumber(MagicNumber);

   return INIT_SUCCEEDED;
  }

// Función de inicio
void OnTick()
  {
   if(SymbolInfoInteger(Symbol(), SYMBOL_SPREAD) <= spread_máximo)
     {
      //if(AreBarsLoaded(Symbol(), timeFrame_Trade))
      if(HasCandleClosed(Symbol(), timeFrame_Trade))
        {
         AbrirOperaciones();
        }
     }

   ActualizarPanel();

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectDelete(0,LineBuy);
   ObjectDelete(0,LineSell);
   ObjectDelete(0,cerrarBuy);
   ObjectDelete(0,cerrarSell);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ActualizarPanel()
  {

   static int nmbBuysLast=0,nmbSellsLast=0;
   int nmbBuys = 0, nmbSells = 0;
   double ultimoPrecioCompra = 0, ultimoPrecioVenta = 0;
   datetime startTimeBuy, startTimeSell;
   double lotesTotalBuy=0, lotesTotalSell=0;
   double ultimoLoteBuy=0,ultimoLoteSell=0;
   double profitBuy=0,profitSell=0;
   GetValorOrdersByMagic(ultimoPrecioCompra, ultimoPrecioVenta, nmbBuys, nmbSells, startTimeBuy, startTimeSell,
                         lotesTotalBuy, lotesTotalSell,ultimoLoteBuy,ultimoLoteSell,profitBuy,profitSell);


   if(nmbSells==0)
      if(ObjectFind(0,LineSell)==0)
         ObjectDelete(0,LineSell);
   if(nmbBuys==0)
      if(ObjectFind(0,LineBuy)==0)
         ObjectDelete(0,LineBuy);

   TextearPanel(true,IntegerToString(nmbBuys),DoubleToString(lotesTotalBuy,2),DoubleToString(ultimoLoteBuy,2));
   TextearPanel(false,IntegerToString(nmbSells),DoubleToString(lotesTotalSell,2),DoubleToString(ultimoLoteSell,2));
   Panel.Text(0,5,"PAct: "+DoubleToString(profitBuy,2));
   Panel.Text(1,5,"PAct: "+DoubleToString(profitSell,2));

   if(nmbBuys!=0)
      if(nmbBuys!=nmbBuysLast)
        {
         double multiplicador = CalcularMultiplicador(startTimeBuy);
         double loteInicial=0.01*multiplicador;
         double takeProfit = CalcularProfitTP(loteInicial, nmbBuys);
         takeProfit=takeProfit*int(loteInicial/0.01);
         Print("Resultado multiplicado por LOTEINICIAL/0.01= ",takeProfit);
         takeProfit=RoundDouble(takeProfit,2,HACIA_ARRIBA);
         Print("Resultado redondeado a 2 digitos Hacia arriba ",takeProfit);
         TextearPanel(true,IntegerToString(nmbBuys+1),DoubleToString(lotesTotalBuy,2),DoubleToString(ultimoLoteBuy,2),DoubleToString(takeProfit, 2));
         double PrecioTakeProfit = SacarPrecioTP_ParaProfit_Conjunto(true, takeProfit);
         double PrecioEquilibrio = SacarPrecioTP_ParaProfit_Conjunto(true, 0);
         PutPriceTakeProfits(true, PrecioTakeProfit);
         DibujarMoverEquilibrio(LineBuy,PrecioEquilibrio);
         nmbBuysLast=nmbBuys;
         ChartRedraw();
        }

   if(nmbSells!=0)
      if(nmbSells!=nmbSellsLast)
        {
         double multiplicador = CalcularMultiplicador(startTimeSell);
         double loteInicial=0.01*multiplicador;
         double takeProfit = CalcularProfitTP(loteInicial, nmbSells);
         takeProfit=takeProfit*int(loteInicial/0.01);
         Print("Resultado multiplicado por LOTEINICIAL/0.01= ",takeProfit);
         takeProfit=RoundDouble(takeProfit,2,HACIA_ARRIBA);
         Print("Resultado redondeado a 2 digitos Hacia arriba ",takeProfit);
         TextearPanel(false,IntegerToString(nmbBuys+1),DoubleToString(lotesTotalSell,2),DoubleToString(ultimoLoteSell,2),DoubleToString(takeProfit, 2));
         double PrecioTakeProfit = SacarPrecioTP_ParaProfit_Conjunto(false, takeProfit);
         double PrecioEquilibrio = SacarPrecioTP_ParaProfit_Conjunto(false, 0);
         PutPriceTakeProfits(false, PrecioTakeProfit);
         DibujarMoverEquilibrio(LineSell,PrecioEquilibrio);
         nmbSellsLast=nmbSells;
         ChartRedraw();
        }

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DibujarMoverEquilibrio(string LineaNombres,double Precio)
  {
   if(ObjectFind(0,LineaNombres)!=0)
      HLineCreate(0,LineaNombres,0,Precio,clrYellow,STYLE_SOLID,2,true,false,true,0);
   else
      ObjectSetDouble(0,LineaNombres,OBJPROP_PRICE,0,Precio);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CrearPanel()
  {
   int filas=6;
   int columnas=2;

   if(!Panel.CrearPanel(10,40,CORNER_RIGHT_LOWER,filas,columnas,"Panel View",0,0,140,30))
      return false;

   Panel.Text(0,0,"BUY");
   Panel.Text(1,0,"SELL");

   Panel.Text(0,1,"Nord: ");
   Panel.Text(1,1,"Nord: ");

   Panel.Text(0,2,"Vol: ");
   Panel.Text(1,2,"Vol: ");

   Panel.Text(0,3,"Vol Ult: ");
   Panel.Text(1,3,"Vol Ult: ");

   Panel.Text(0,4,"PCalc: ");
   Panel.Text(1,4,"PCalc: ");

   Panel.Text(0,5,"PAct: ");
   Panel.Text(1,5,"PAct: ");

   color FondoColorDefault=C'31, 31, 31';

   for(int i=0; i<filas; i++)
      for(int j=0; j<columnas; j++)
        {
         if(i==0)
            Panel.ColorTexto(j,i,clrLimeGreen);
         /*if(i!=0 && j!=0)
           {
            Panel.ColorTexto(j,i,clrAqua);
            Panel.FontTexto(j,i,"Impact");
           }*/

         Panel.ColorBg(j,i,(i%2==0?clrBlack:FondoColorDefault));
         Panel.ColorBorder(j,i,clrWhite);
        }

   ButtonCreate(0,cerrarBuy,0,150+140,40+1,140,30,CORNER_RIGHT_LOWER,"Cerrar","Arial",10,clrWhite,clrRed,clrWhite,false,false,false,true,0);
   ButtonCreate(0,cerrarSell,0,150,40+1,140,30,CORNER_RIGHT_LOWER,"Cerrar","Arial",10,clrWhite,clrRed,clrWhite,false,false,false,true,0);

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TextearPanel(bool IsBuy,string numOperaciones,string totalLotes,string lote,string tpCalculado)
  {
   int c=IsBuy?0:1;
   Panel.Text(c,1,"Nord: "+numOperaciones);
   Panel.Text(c,2,"Vol: "+totalLotes);
   Panel.Text(c,3,"Vol Ult: "+lote);
   Panel.Text(c,4,"PCalc: "+tpCalculado);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TextearPanel(bool IsBuy,string numOperaciones,string totalLotes,string lote)
  {
   int c=IsBuy?0:1;
   Panel.Text(c,1,"Nord: "+numOperaciones);
   Panel.Text(c,2,"Vol: "+totalLotes);
   Panel.Text(c,3,"Vol Ult: "+lote);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarBuys()
  {

   int TotalOrdenes = PositionsTotal();

   for(int k=TotalOrdenes-1; k>=0; k--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong ticket=PositionGetTicket(k);

      if(ticket==0) // SE SELECCIONA CADA ORDEN PARA PODER EVALUAR (si no se selecciona no se evalua)
         continue;

      if(PositionGetInteger(POSITION_MAGIC) == MagicNumber && PositionGetString(POSITION_SYMBOL) == Symbol())
        {
         long tipo = PositionGetInteger(POSITION_TYPE);

         if(tipo == POSITION_TYPE_BUY)
           {
            if(trade.PositionClose(PositionGetInteger(POSITION_TICKET),-1))
               Print("Se cerró la orden: ", ticket);
            else
               Print("Error al cerrar la orden: ", ticket, ", Error: ", GetLastError()," result error ",trade.ResultRetcode());
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarSells()
  {
   int TotalOrdenes = PositionsTotal();

   for(int k=TotalOrdenes-1; k>=0; k--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong ticket=PositionGetTicket(k);

      if(ticket==0) // SE SELECCIONA CADA ORDEN PARA PODER EVALUAR (si no se selecciona no se evalua)
         continue;

      if(PositionGetInteger(POSITION_MAGIC) == MagicNumber && PositionGetString(POSITION_SYMBOL) == Symbol())
        {
         long tipo = PositionGetInteger(POSITION_TYPE);

         if(tipo == POSITION_TYPE_SELL)
           {
            if(trade.PositionClose(PositionGetInteger(POSITION_TICKET),-1))
               Print("Se cerró la orden: ", ticket);
            else
               Print("Error al cerrar la orden: ", ticket, ", Error: ", GetLastError()," result error ",trade.ResultRetcode());
           }
        }
     }
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
//|                                                                  |
//+------------------------------------------------------------------+
bool ButtonCreate(const long              chart_ID=0,               // chart's ID
                  const string            name="Button",            // button name
                  const int               sub_window=0,             // subwindow index
                  const int               x=0,                      // X coordinate
                  const int               y=0,                      // Y coordinate
                  const int               width=50,                 // button width
                  const int               height=18,                // button height
                  const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                  const string            text="Button",            // text
                  const string            font="Arial",             // font
                  const int               font_size=10,             // font size
                  const color             clr=clrBlack,             // text color
                  const color             back_clr=C'236,233,216',  // background color
                  const color             border_clr=clrNONE,       // border color
                  const bool              state=false,              // pressed/released
                  const bool              back=false,               // in the background
                  const bool              selection=false,          // highlight to move
                  const bool              hidden=true,              // hidden in the object list
                  const long              z_order=0)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create the button
   if(!ObjectCreate(chart_ID,name,OBJ_BUTTON,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": failed to create the button! Error code = ",GetLastError());
      return(false);
     }
//--- set button coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set button size
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- set the chart's corner, relative to which point coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set the text
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- set text font
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- set font size
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- set text color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set background color
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- set border color
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- set button state
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
//--- enable (true) or disable (false) the mode of moving the button by mouse
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
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//--- Check the event by pressing a mouse button
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      string clickedChartObject=sparam;
      //--- If you click on the object with the name buttonID
      if(clickedChartObject==cerrarBuy)
        {
         CerrarBuys();
         ActualizarPanel();
         ObjectSetInteger(0,cerrarBuy,OBJPROP_STATE,false);
        }

      if(clickedChartObject==cerrarSell)
        {
         CerrarSells();
         ActualizarPanel();
         ObjectSetInteger(0,cerrarSell,OBJPROP_STATE,false);
        }

      ChartRedraw();// Forced redraw all chart objects
     }
  }
//+------------------------------------------------------------------+
