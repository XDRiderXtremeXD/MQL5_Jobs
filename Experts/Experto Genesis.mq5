//+------------------------------------------------------------------+
//|                                              Experto Genesis.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property link      "https://www.makeitsmart.ai/"
#property version   "7.10"
#property description "Creado por ING Efrain Caballero"
#property description "Version 7.10 de EA Genesis :)"
#property strict
//+------------------------------------------------------------------+
//|  Variables                                                       |
//+------------------------------------------------------------------+
#include <MQLMySQL.mqh>

enum Trade
  {
   BUY,   // Solo Compra
   SELL,  // Solo Venta
   BOTH   // Venta y Compra
  };

enum LOTS_TYPE
  {
   FixedLot,     // Lote Fijo
   IncreasingLot // Lote Inteligente
  };

double    MinProfit_     = 2.00; // Minima Ganancia $ Cierra Perdidas
double    LOTB            = 0.01;  // Lote Compra
double    LOTS            = 0.01;  // Lote Ventas
int       MinStepB        = 70;   // Grilla minima Compra
int       MinStepS        = 70;   // Grilla minima Venta


input  bool      CanRestart     = true; //Resetear despues del Ciclo
  Trade     TypeOrders     = BOTH;
  LOTS_TYPE LotsType    = IncreasingLot;
double    LotBalance     = 0.0;   // LoteBalance (si 0.0 = No Balance)
double    AMinProfit_    = 00.00; // Minima Ganancia $ Cierra Todo
  int       MinStepPlus    = 0;     // Otro Control de Riesgo
  bool      UsePartlyClose = true;  // Disminuir todos los lotes despues de cerrar
  int       MAGIC          = 7799;  // Firma de transacciones de Genesis
  int       Slippage       = 3000;  // Cantidad de Transacciones
double    CLOSE_BY_RATIO = 1.00;//Cerrar por Ratio (0.01 to 1.00)
double    SingleTradeProfit_=1.0;//Beneficio si (Venta/Compra) solamente
double    LOT = 0.01;  // Lote

// DATAMIS
input string static DATAMIS = "DATAMIS"; // DATAMIS
input double initial = 100000; //Capital Inicial
input int minutes = 5; //Sincronización (minutos)
input string customer = "DemoGen7.10,8540245"; //Número de cliente


int             NumeroDeCuenta          = 8540245;
datetime        Fecha                   = D'2021.04.01 00:00';

 string static velocity0 = "BOOSTER"; // Booster
 double velAcumMin0 = 0;       // Nivel de acumulación mínimo
 double velAcumMax0 = -5000;       // Nivel de acumulación máximo
 double buyLot0 = 0.2;         // Lote Compra
 double sellLot0 = 0.2;        // Lote Venta
 double profitCycle0 = 40;     // Minima Ganancia $ Cierra Perdidas
 int buyGrid0 = 60;         // Grilla Compra
 int sellGrid0 = 60;        // Grilla Venta

 string static velocity1 = "Variables para velocidad 1"; // Velocidad 1
 double velAcumMin1 = -5001;       // Nivel de acumulación mínimo
 double velAcumMax1 = -12000;       // Nivel de acumulación máximo
 double buyLot1 = 0.1;         // Lote Compra
 double sellLot1 = 0.1;        // Lote Venta
 double profitCycle1 = 20.00;     // Minima Ganancia $ Cierra Perdidas
 int buyGrid1 = 70;         // Grilla Compra
 int sellGrid1 = 70;        // Grilla Venta

 string static velocity2 = "Variables para velocidad 2"; // Velocidad 2
 double velAcumMin2 = -12001;       // Nivel de acumulación mínimo
 double velAcumMax2 = -18000;       // Nivel de acumulación máximo
 double buyLot2 = 0.1;         // Lote Compra
 double sellLot2 = 0.1;        // Lote Venta
 double profitCycle2 = 20.00;     // Minima Ganancia $ Cierra Perdidas
 int buyGrid2 = 80;         // Grilla Compra
 int sellGrid2 = 00;        // Grilla Venta

 string static velocity3 = "Variables para velocidad 3"; // Velocidad 3
 double velAcumMin3 = -18001;       // Nivel de acumulación mínimo
 double velAcumMax3 = -24000;       // Nivel de acumulación máximo
 double buyLot3 = 0.1;         // Lote Compra
 double sellLot3 = 0.1;        // Lote Venta
 double profitCycle3 = 20.00;     // Minima Ganancia $ Cierra Perdidas
 int buyGrid3 = 70;         // Grilla Compra
 int sellGrid3 = 70;        // Grilla Venta

 string static velocity4 = "Variables para velocidad 4"; // Velocidad 4
 double velAcumMin4 = -24001;       // Nivel de acumulación mínimo
 double velAcumMax4 = -30000;       // Nivel de acumulación máximo
 double buyLot4 = 0.1;         // Lote Compra
 double sellLot4 = 0.1;        // Lote Venta
 double profitCycle4 = 0.00;     // Minima Ganancia $ Cierra Perdidas
 int buyGrid4 = 80;         // Grilla Compra
 int sellGrid4 = 80;        // Grilla Venta

 string static velocity5 = "Variables para velocidad 5"; // Velocidad 5
 double velAcumMin5 = -30001;       // Nivel de acumulación mínimo
 double velAcumMax5 = -100000;       // Nivel de acumulación máximo
 double buyLot5 = 0.1;         // Lote Compra
 double sellLot5 = 0.1;        // Lote Venta
 double profitCycle5 = -200.00;     // Minima Ganancia $ Cierra Perdidas
 int buyGrid5 = 70;         // Grilla Compra
 int sellGrid5 = 70;        // Grilla Venta


  string    GrupoTransMadre = "Corrida de Operacion Madre";//*********** Operacion Madre ****************
 int TakeProfitPip = 20; // Pip para Corrida...

//Nuevas variables de operaciones de bloqueo
 string static BloqueoAvanzado = "Bloqueo Inteligente"; // Bloqueo y Desbloqueo por niveles
 double blockOperation1 = -45000;    // Nivel de bloqueo 1
 double blockOperation2 = -50000;    // Nivel de bloqueo 2
 double blockOperation3 = -60000;    // Nivel de bloqueo 3
 double blockOperation4 = -100000;   // Nivel de bloqueo 4

 double percentage1 = 1.00;    // Porcentaje de bloqueo 1
 double percentage2 = 0.25;    // Porcentaje de bloqueo 2
 double percentage3 = 0.25;    // Porcentaje de bloqueo 3
 double percentage4 = 0.25;    // Porcentaje de bloqueo 4

 int stoploss1 = 200;    // StopLoss de la operación de bloqueo 1
 int stoploss2 = 200;    // StopLoss de la operación de bloqueo 2
 int stoploss3 = 200;    // StopLoss de la operación de bloqueo 3
 int stoploss4 = 200;    // StopLoss de la operación de bloqueo 4

 int trailingStop1 = 25;    // Trailing stop de la operación de bloqueo 1
 int trailingStop2 = 25;    // Trailing stop de la operación de bloqueo 2
 int trailingStop3 = 25;    // Trailing stop de la operación de bloqueo 3
 int trailingStop4 = 25;    // Trailing stop de la operación de bloqueo 4

 int trailingStep1 = 25;    // Paso de la operación de bloqueo 1
 int trailingStep2 = 25;    // Paso de la operación de bloqueo 2
 int trailingStep3 = 25;    // Paso de la operación de bloqueo 3
 int trailingStep4 = 25;    // Paso de la operación de bloqueo 4

 int trailingProfit1 = 200;    // Profit de la operación de bloqueo 1
 int trailingProfit2 = 200;    // Profit de la operación de bloqueo 2 
 int trailingProfit3 = 200;    // Profit de la operación de bloqueo 3
 int trailingProfit4 = 200;    // Profit de la operación de bloqueo 4

//Efrain Cobertura
  string    GrupoCobertura = "Bloqueo Manual Emergencia";//*********** Cobertura ****************
  string    GrupoAlerta = "Peligro Calcular con precisión";//*********** Advertencia!**************** 
  int       PipsRecorridosC = 2000; //Pips recorridos
  double    LotajeC = 2; //Lotaje ops de cobertura (0 para usar el del sistema)
  double    StopLossInicialC = 50; //Stop Loss inicial
  double    TrailingStopC = 25; //Trailing Stop
  double    PasoTrailingStopC = 10; //Paso Trailing Stop
  int       MaximoOpsC = 1; //Maximo operaciones simultaneas de cobertura
  int       MagicC = 55555; //Firma de transacciones de cobertura
  bool      Debug = true; //Mostrar trazas de log
  double    AccumulationAmount = -50000000; //Monto de acumulación -50000 es el 50% de una cuenta de 100.000

//Efrain Cobertura
const double PIPS_3 = 0.010;
const double PIPS_5 = 0.00010;

string name = "IA Genesis";
double LotBuy = 0.0;
double LotSel = 0.0;
double MinProfit, AMinProfit, SingleTradeProfit;

//Efrain Cobertura
int digitos = 0;
int compras = 0;
int ventas = 0;
double distanciaStopLossInicialC = 0.0;
double distanciaTrailingStopC = 0.0;
double distanciaPasoTrailingStopC = 0.0;
double ultimoPrecioCompra = 0.0;
double ultimoPrecioVenta = DBL_MAX;
double pipDivider = PIPS_5;
double pipsRecorridosCompras = 0.0;
double pipsRecorridosVentas = 0.0;
double precioAperturaCompra = 0.0;
double precioAperturaVenta = 0.0;

double distanciaTrailing1 = 0.0;
double distanciaTrailing2 = 0.0;
double distanciaTrailing3 = 0.0;
double distanciaTrailing4 = 0.0;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
  
  return(INIT_SUCCEEDED);

//Efrain Cobertura
   digitos = (int)MarketInfo(Symbol(), MODE_DIGITS); //XXXJPY = 3.0, Otros = 5.0
   if(digitos == 3)
     {
      pipDivider = PIPS_3;
     }
   distanciaStopLossInicialC = calcularDistancia(StopLossInicialC);
   distanciaTrailingStopC = calcularDistancia(TrailingStopC);
   distanciaTrailing1 = calcularDistancia(trailingStop1);
   distanciaTrailing2 = calcularDistancia(trailingStop2);
   distanciaTrailing3 = calcularDistancia(trailingStop3);
   distanciaTrailing4 = calcularDistancia(trailingStop4);
   distanciaPasoTrailingStopC = calcularDistancia(PasoTrailingStopC);

   ObjectCreate(name, OBJ_LABEL, 0, 0, 0);
   ObjectSet(name, OBJPROP_CORNER, 2);
   ObjectSet(name, OBJPROP_XDISTANCE, 10);
   ObjectSet(name, OBJPROP_YDISTANCE, 10);
   ObjectSetText(name, name, 14, "Arial", Red);

   CalcMinProfits();

   if(LotBalance <= 0.0)
     {
      LotBuy = LOTB;
      LotSel = LOTS;
     }
   else
     {
      if(OrdersTotals(MAGIC, Symbol(), OP_BUY) == 0 || !UsePartlyClose)
        {
         LotBuy = NormalizeLot(AccountBalance() / LotBalance * LOTB, Symbol());
        }
      else
        {
         LotBuy = GetMinLot(MAGIC, Symbol(), OP_BUY);
        }
      if(OrdersTotals(MAGIC, Symbol(), OP_SELL) == 0 || !UsePartlyClose)
        {
         LotSel =NormalizeLot(AccountBalance() / LotBalance * LOTS, Symbol());
        }
      else
        {
         LotSel = GetMinLot(MAGIC, Symbol(), OP_SELL);
        }
     }

   return INIT_SUCCEEDED;
  }

//Efrain Cobertura
void seguimientoTrailing()
  {
   double nuevoSL = 0.0;

//Solo se evalua cuando el precio de ha movido los N pips que indica el PasoTrailingStopC
   RefreshRates();
   bool moverCompras = false;
   double precioCompra = NormalizeDouble(Ask, Digits());
   if(precioCompra > ultimoPrecioCompra)
     {
      double diferenciaCompra = precioCompra - ultimoPrecioCompra;
      double pipsDiferenciaCompra = calcularPips(diferenciaCompra);
      if(pipsDiferenciaCompra > PasoTrailingStopC)
        {
         moverCompras = true;
         ultimoPrecioCompra = precioCompra;
        }
     }
   bool moverVentas = false;
   double precioVenta = NormalizeDouble(Bid, Digits());
   if(precioVenta < ultimoPrecioVenta)
     {
      double diferenciaVenta = ultimoPrecioVenta - precioVenta;
      double pipsDiferenciaVenta = calcularPips(diferenciaVenta);
      if(pipsDiferenciaVenta > PasoTrailingStopC)
        {
         moverVentas = true;
         ultimoPrecioVenta = precioVenta;
        }
     }

//Ordenes de cobertura abiertas
   for(int i = OrdersTotal() - 1; i >= 0; i--)
     {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderSymbol() == Symbol())
           {
            if(OrderMagicNumber() == MagicC && OrderCloseTime() == 0)
              {
               //if (Debug) Print("***** Op Cobertura #" + (string)OrderTicket() + " OrderProfit: " + (string)OrderProfit());
               if(OrderProfit() > 0)
                 {
                  //Se va a intentar mover el trailing stop
                  RefreshRates();
                  if(OrderType() == OP_BUY && moverCompras)
                    {
                     //Si es compra, el precio actual - TrailingStopC
                     precioCompra = NormalizeDouble(Ask, Digits());
                     nuevoSL = precioCompra - distanciaTrailingStopC;
                     if(OrderModify(OrderTicket(), OrderOpenPrice(), nuevoSL, 0, 0, clrOrange))
                       {
                        if(Debug)
                           Print("***** Op Cobertura COMPRA #" + (string)OrderTicket() + " se mueve su SL a " + (string)nuevoSL);
                       }
                     else
                       {
                        GetLastError();
                       }
                    }
                  if(OrderType() == OP_SELL && moverVentas)
                    {
                     //Si es venta, el precio actual + TrailingStopC
                     precioVenta = NormalizeDouble(Bid, Digits());
                     nuevoSL = precioVenta + distanciaTrailingStopC;
                     if(OrderModify(OrderTicket(), OrderOpenPrice(), nuevoSL, 0, 0, clrOrange))
                       {
                        if(Debug)
                           Print("***** Op Cobertura VENTA #" + (string)OrderTicket() + " se mueve su SL a " + (string)nuevoSL);
                       }
                     else
                       {
                        GetLastError();
                       }
                    }
                 }
              }
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int contarOpsCobertura()
  {
   int numOpsAbiertasC = 0;
   for(int i = OrdersTotal() - 1; i >= 0; i--)
     {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderSymbol() == Symbol())
           {
            if(OrderMagicNumber() == MagicC && OrderCloseTime() == 0)
              {
               numOpsAbiertasC++;
              }
           }
        }
     }
   return numOpsAbiertasC;
  }


//+------------------------------------------------------------------+
//|  DATAMIS                                                         |
//+------------------------------------------------------------------+
void synchronization()
  {
   string INI, Host, User, Password, Database, Socket, Query; // database credentials
   int Port, ClientFlag;
   int DB; // database identifiers

   Print(MySqlVersion());

   INI = TerminalInfoString(TERMINAL_DATA_PATH)+"\\MQL4\\Scripts\\dbConnection.ini";

   Print(INI);

   Host = ReadIni(INI, "MYSQL", "Host");
   User = ReadIni(INI, "MYSQL", "User");
   Password = ReadIni(INI, "MYSQL", "Password");
   Database = ReadIni(INI, "MYSQL", "Database");
   Port     = StrToInteger(ReadIni(INI, "MYSQL", "Port"));
   Socket   = ReadIni(INI, "MYSQL", "Socket");
   ClientFlag = StrToInteger(ReadIni(INI, "MYSQL", "ClientFlag"));
   ENUM_ACCOUNT_TRADE_MODE account_type=(ENUM_ACCOUNT_TRADE_MODE)AccountInfoInteger(ACCOUNT_TRADE_MODE);
   string trade_mode;
   switch(account_type)
     {
      case  ACCOUNT_TRADE_MODE_DEMO:
         trade_mode="demo";
         break;
      case  ACCOUNT_TRADE_MODE_CONTEST:
         trade_mode="contest";
         break;
      default:
         trade_mode="real";
         break;
     }

   Print("Host: ",Host, ", User: ", User, ", Database: ",Database);

   Print("Connecting...");

   DB = MySqlConnect(Host, User, Password, Database, Port, Socket, ClientFlag);

   if(DB == -1)
     {
      Alert("Connection failed! Error: "+MySqlErrorDescription);
     }
   else
     {
      Print("Connected! DBID #", DB);
      
      string Update = "UPDATE transactions SET is_close = 1 WHERE account_id = \'" + (string)AccountNumber() + "\'";
      
      if(!MySqlExecute(DB, Update))
        {
         Print("Error: ", MySqlErrorDescription);
         Print("Query: ", Query);
        }

      Query = "INSERT INTO `accounts` (account_id, name, company, leverage, balance, margin, floating, equity, initial, type, customer, create_at, update_at) VALUES (\'"
              + (string)AccountNumber() + "\',\'" + (string)AccountName() + "\',\'" + (string)AccountCompany() + "\',\'" + (string)AccountLeverage() + "\',\'"
              + (string)AccountBalance() + "\',\'" + (string)AccountMargin() + "\',\'" + (string)AccountProfit() + "\',\'" + (string)AccountEquity() + "\',\'"
              + (string)initial + "\',\'" + (string)trade_mode + "\',\'" + (string)customer + "\',\'" + (string)TimeCurrent() + "\',\'" + (string)TimeCurrent() + "\') ON DUPLICATE KEY UPDATE name = \'" + (string)AccountName() + "\', company = \'" + (string)AccountCompany() + "\', leverage = \'" + (string)AccountLeverage()
              + "\', balance = \'" + (string)AccountBalance() + "\', margin = \'" + (string)AccountMargin() + "\', floating = \'" + (string)AccountProfit() + "\', equity = \'" + (string)AccountEquity()
              + "\', initial = \'" + (string)initial + "\', update_at = \'" + (string)TimeCurrent() + "\', type = \'" + (string)trade_mode + "\', customer = \'" + (string)customer + "\'";

      transactions(DB, MODE_TRADES);
      transactions(DB, MODE_HISTORY);
      if(!MySqlExecute(DB, Query))
        {
         Print("Error: ", MySqlErrorDescription);
         Print("Query: ", Query);
        }
     }

   MySqlDisconnect(DB);
  }
// fin datamis
void OnTick()
  {
  
   //DATAMIS 
   static datetime lastTime = 0;
   static int DELAY = minutes * 60;

   if(TimeCurrent() < lastTime + DELAY)
      return;

   Print("Se reproduce cada x segundos: ", DELAY);
   lastTime = TimeCurrent();

   synchronization();

    // findatamis

   if(AccountNumber() != NumeroDeCuenta || TimeCurrent() >= Fecha)
     {

      Alert(" Genesis necesita actualizacion ") ;
      return;

     }
   
   if (trailingStep1 > 0 && trailingProfit1 > 0) {
      
      seguimientoTrailing(trailingStep1, distanciaTrailing1, trailingProfit1, MAGIC + 1, Debug);
   }
   
   if (trailingStep2 > 0 && trailingProfit2 > 0) {
   
      seguimientoTrailing(trailingStep2, distanciaTrailing2, trailingProfit2, MAGIC + 1, Debug);
   }
   
   if (trailingStep3 > 0 && trailingProfit3 > 0) {
   
      seguimientoTrailing(trailingStep3, distanciaTrailing3, trailingProfit3, MAGIC + 1, Debug);
   }
   
   if (trailingStep4 > 0 && trailingProfit4 > 0) {
   
      seguimientoTrailing(trailingStep4, distanciaTrailing4, trailingProfit4, MAGIC + 1, Debug);
   }
   
   if(isUniqueBlockOperation(OP_BUY, Symbol()) || isUniqueBlockOperation(OP_SELL, Symbol()))
     {
      Alert("Block account for accumulation");
      return;
     }

   validateZeroValues();
   validateMinAndMaxValues();

   LOTB = getBuyLot(AccountProfit());
   LOTS = getSelLot(AccountProfit());
   MinProfit_ = getMinProfit(AccountProfit());
   MinStepB = getMinStepB(AccountProfit());
   MinStepS = getMinStepS(AccountProfit());

   int
   b = 0,
   s = 0,
   BuyMaxTic  = 0,
   SellMinTic = 0;
   double
   BuyProfit  = 0,
   SellProfit = 0,
   BuyMin     = 0,
   SellMax    = 0,
   BuyMinLot  = 0,
   SellMaxLot = 0,
   BuyLot     = 0,
   SellLot    = 0,
   BuyMax     = 0,
   SellMin    = 0,
   SellTicProfit = 0,
   BuyTicProfit  = 0;
   bool CanCloseBy = false;

   if(!CanRestart && OrdersTotals(MAGIC, Symbol(), -1) == 0)
     {
      return;
     }

//Efrain Cobertura
   if(TrailingStopC > 0 && PasoTrailingStopC > 0)
     {
      seguimientoTrailing();
     }

   for(int i = OrdersTotal() - 1; i >= 0; i--)
      if(OrderSelect(i, SELECT_BY_POS))
         if(OrderSymbol() == Symbol())
            if(OrderMagicNumber() == MAGIC)
              {
               if(OrderType() == OP_BUY)
                 {
                  b++;
                  if(OrderOpenPrice() < BuyMin || BuyMin == 0)
                    {
                     BuyMin = OrderOpenPrice();
                     BuyMinLot = OrderLots();
                    }
                  if(OrderOpenPrice() > BuyMax || BuyMin == 0)
                    {
                     BuyMax = OrderOpenPrice();
                     BuyMaxTic = OrderTicket();
                     BuyTicProfit = OrderProfit() + OrderCommission() + OrderSwap();
                    }
                  if(OrderProfit() + OrderCommission() + OrderSwap() > 0)
                    {
                     BuyProfit += OrderProfit() + OrderCommission() + OrderSwap();
                    }
                 }
               if(OrderType() == OP_SELL)
                 {
                  s++;
                  if(OrderOpenPrice() > SellMax || SellMax == 0)
                    {
                     SellMax = OrderOpenPrice();
                     SellMaxLot = OrderLots();
                    }
                  if(OrderOpenPrice() < SellMin || SellMin == 0)
                    {
                     SellMin = OrderOpenPrice();
                     SellMinTic = OrderTicket();
                     SellTicProfit = OrderProfit() + OrderCommission() + OrderSwap();
                    }
                  if(OrderProfit() + OrderCommission() + OrderSwap() > 0)
                    {
                     SellProfit += OrderProfit() + OrderCommission() + OrderSwap();
                    }
                 }
              }

//Suma profit final
   double ProfitBuy = BuyTicProfit + BuyProfit;
   double ProfitSel = SellTicProfit + SellProfit;

   if(LotsType == FixedLot)
     {
      BuyLot = LotBuy;
      SellLot = LotSel;
     }
   else
     {
      BuyLot = iif(b == 0, LotBuy, BuyMinLot + LotBuy);
      SellLot = iif(s == 0, LotSel, SellMaxLot + LotBuy);
     }

   double BuyDist  = NormalizeDouble(MinStepB*Point()+MinStepPlus*Point()*b,Digits());
   double SellDist = NormalizeDouble(MinStepS*Point()+MinStepPlus*Point()*s,Digits());

   double lotajeCobertura = LotajeC;
   int ticketCobertura = -1;
   double slCobertura = 0.0;
   double precioCobertura = 0.0;

   if(TypeOrders == BUY || TypeOrders == BOTH)
      if((b == 0) || (b > 0 && (BuyMin - Ask) >= BuyDist))
        {
         precioAperturaCompra = NormalizeDouble(Ask, Digits());
         if(OrderSend(Symbol(), OP_BUY, NormalizeDouble(BuyLot, 2), precioAperturaCompra, Slippage, 0, 0, "My order", MAGIC, 0, clrGreen) < 0)
           {
            Print(" Error open Buy N ", GetLastError());
           }
         else
           {
            //Efrain Cobertura
            ventas = 0;
            compras++;
            int numOpsAbiertasC = contarOpsCobertura();
            precioAperturaCompra = getPrecioAperturaViejo(OP_BUY);
            double distanciaCompra = MathAbs(Bid - precioAperturaCompra);
            pipsRecorridosCompras = calcularPips(distanciaCompra);
            if(Debug)
               Print("pipsRecorridosCompras: " + (string)pipsRecorridosCompras);

            if((pipsRecorridosCompras >= PipsRecorridosC) && (numOpsAbiertasC < MaximoOpsC))
              {
               //if ((compras == NumOpConsecutivasC) && (numOpsAbiertasC < MaximoOpsC)) {
               if(LotajeC <= 0)
                 {
                  lotajeCobertura = SellLot;
                 }
               precioCobertura = NormalizeDouble(Bid, Digits());
               slCobertura = precioCobertura + distanciaStopLossInicialC;
               ticketCobertura = OrderSend(Symbol(), OP_SELL, NormalizeDouble(lotajeCobertura, 2), precioCobertura, Slippage, slCobertura, 0, "CoberturaV", MagicC, 0, clrDarkOliveGreen);
               if(ticketCobertura < 0)
                 {
                  Print(" Error open Sell cobertura N " + (string)GetLastError() + " SL: " + (string)slCobertura + ", AT: " + (string)precioCobertura);
                 }
               else
                 {
                  compras = 0;
                  Print("***Abierta VENTA de cobertura con ticket " + (string)ticketCobertura + " - " + (string)pipsRecorridosCompras + " ***");
                 }
              }
           }
        }

   if(TypeOrders == SELL || TypeOrders == BOTH)
      if((s == 0) || (s > 0 && (Bid - SellMax) >= SellDist))
        {
         precioAperturaVenta = NormalizeDouble(Bid, Digits());
         if(OrderSend(Symbol(), OP_SELL, NormalizeDouble(SellLot, 2), precioAperturaVenta, Slippage, 0, 0, "My order", MAGIC, 0, clrGreen) < 0)
           {
            Print(" Error open Sell N ", GetLastError());
           }
         else
           {
            //Efrain Cobertura
            compras = 0;
            ventas++;
            int numOpsAbiertasC = contarOpsCobertura();
            precioAperturaVenta = getPrecioAperturaViejo(OP_SELL);
            double distanciaVenta = MathAbs(precioAperturaVenta - Ask);
            pipsRecorridosVentas = calcularPips(distanciaVenta);
            if(Debug)
               Print("pipsRecorridosVentas: " + (string)pipsRecorridosVentas);

            if((pipsRecorridosVentas >= PipsRecorridosC) && (numOpsAbiertasC < MaximoOpsC))
              {
               //if ((ventas == NumOpConsecutivasC) && (numOpsAbiertasC < MaximoOpsC)) {
               if(LotajeC <= 0)
                 {
                  lotajeCobertura = BuyLot;
                 }
               precioCobertura = NormalizeDouble(Ask, Digits());
               slCobertura = precioCobertura - distanciaStopLossInicialC;
               ticketCobertura = OrderSend(Symbol(), OP_BUY, NormalizeDouble(lotajeCobertura, 2), precioCobertura, Slippage, slCobertura, 0, "CoberturaC", MagicC, 0, clrDarkOliveGreen);
               if(ticketCobertura < 0)
                 {
                  Print(" Error open Buy cobertura N " + (string)GetLastError() + " SL: " + (string)slCobertura + ", AT: " + (string)precioCobertura);
                 }
               else
                 {
                  ventas = 0;
                  Print("***Abierta COMPRA de cobertura con ticket " + (string)ticketCobertura + " - " + (string)pipsRecorridosVentas + " ***");
                 }
              }
           }
        }

   if(ProfitBuy+iif(UsePartlyClose,CalcWhatLoss(MAGIC,Symbol(),OP_BUY,BuyMaxTic),0.0)>=MinProfit && b>=2)
     {
      CloseAll(OP_BUY,BuyMaxTic);
      iif(UsePartlyClose,0.0,ClosePartly(MAGIC,Symbol(),OP_BUY));
     }
   if(ProfitSel+iif(UsePartlyClose,CalcWhatLoss(MAGIC,Symbol(),OP_SELL,SellMinTic),0.0)>=MinProfit && s>=2)
     {
      CloseAll(OP_SELL,SellMinTic);
      iif(UsePartlyClose,0.0,ClosePartly(MAGIC,Symbol(),OP_SELL));
     }

   if(LotBalance<=0.0)
     {
      LotBuy=LOTB;
      LotSel=LOTS;
     }
   else
     {
      if(OrdersTotals(MAGIC,Symbol(),OP_BUY)==0 || !UsePartlyClose)
        {
         LotBuy=NormalizeLot(AccountBalance()/LotBalance*LOTB,Symbol());
        }
      else
        {
         LotBuy=GetMinLot(MAGIC,Symbol(),OP_BUY);
        }
      if(OrdersTotals(MAGIC,Symbol(),OP_SELL)==0 || !UsePartlyClose)
        {
         LotSel=NormalizeLot(AccountBalance()/LotBalance*LOTS,Symbol());
        }
      else
        {
         LotSel=GetMinLot(MAGIC,Symbol(),OP_SELL);
        }
     }

//--------test de close by
   int c1,c2;
   double Ratio,p1,p2;
   c1=OrdersTotals(MAGIC,Symbol(),OP_BUY);
   c2=OrdersTotals(MAGIC,Symbol(),OP_SELL);
   p1=CalcProfits(MAGIC,Symbol(),OP_BUY);
   p2=CalcProfits(MAGIC,Symbol(),OP_SELL);
   if(1==c1 && 1==c2 && p1!=0 && p2!=0 && p1+p2>=AMinProfit)
     {
      Ratio=p1/p2;
      if(Ratio>1)
        {
         Ratio=1.0/Ratio;  //make it <= 1.0
        }
      if(Ratio>=CLOSE_BY_RATIO)
        {
         CloseBy(MAGIC,Symbol());
        }
     }

//Sell/Buy Only Profit To Close
   if(1==c1 && p1>=SingleTradeProfit && TypeOrders==BUY)
     {
      CloseAll(MAGIC,Symbol(),OP_BUY);
     }
   if(1==c2 && p2>=SingleTradeProfit && TypeOrders==SELL)
     {
      CloseAll(MAGIC,Symbol(),OP_SELL);
     }

   CalcMinProfits();//MinProfit,AMinProfit Ratio Changed To Lot And Balance
//makeBlockOperation(OP_BUY, Symbol(), MAGIC, AccumulationAmount);
//makeBlockOperation(OP_SELL, Symbol(), MAGIC, AccumulationAmount);

   makeBlockOperationByVelocity(AccountProfit(), Symbol(), MAGIC, AccumulationAmount);
   TakeProfitMotherOrder(Symbol(), MAGIC, TakeProfitPip, LOT); //Recorro todas las ordenes en busca de las ordenes madres


   Comment("booster",
           "Capitalizacion B= ", LOTB, "\n",
           "Capitalizacion S= ", LOTS, "\n",
           "Ciclo= ", MinProfit_, "\n",
           "Grilla Compra= ", MinStepB, "\n",
           "Grilla Venta= ", MinStepS, "\n",
           "Bloqueo= ", blockOperation1, "\n");
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Print("Genesis Desactivado");
  }


//+------------------------------------------------------------------+
//| Function for insert or update orders in MySQL                    |
//+------------------------------------------------------------------+
void transactions(int DB, int mode)
  {

   int isClose = (mode == MODE_HISTORY)? 1 : 0;

   for(int i = 0 ; i < OrdersTotal() ; i++)
     {
      if(!OrderSelect(i, SELECT_BY_POS,  mode))
         continue;

      string Query = "INSERT INTO `transactions` (transaction_id, account_id, type, profit, swap, symbol, lots, commission, is_close, open_price, close_price, mode, close_at, open_at, create_at, update_at) VALUES (\'"
                     + (string)OrderTicket() + "\',\'" + (string)AccountNumber() + "\',\'" + (string)OrderType() + "\',\'" + (string)OrderProfit() + "\',\'" + (string)OrderSwap() + "\',\'"
                     + (string)OrderSymbol() + "\',\'" + (string)OrderLots() + "\',\'" + (string)OrderCommission() + "\',\'" + (string)isClose + "\',\'"
                     + (string)OrderOpenPrice() + "\',\'" + (string)OrderClosePrice() + "\',\'" + (string)mode + "\',\'" + (string)OrderCloseTime() + "\',\'" + (string)OrderOpenTime() + "\',\'" + (string)TimeCurrent() + "\',\'" + (string)TimeCurrent() + "\') ON DUPLICATE KEY UPDATE profit = \'" + (string)OrderProfit() + "\', swap = \'" + (string)OrderSwap() + "\', symbol = \'" + (string)OrderSymbol()
                     + "\', lots = \'" + (string)OrderLots() + "\', commission = \'" + (string)OrderCommission() + "\', open_price = \'" + (string)OrderOpenPrice() + "\', close_price = \'" + (string)OrderClosePrice()
                     + "\', close_at = \'" + (string)OrderCloseTime() + "\', open_at = \'" + (string)OrderOpenTime() + "\', update_at = \'" + (string)TimeCurrent() + "\', is_close = \'" + (string)isClose + "\', mode = \'" + (string)mode + "\'";

      if(!MySqlExecute(DB, Query))
        {
         Print("Error: ", MySqlErrorDescription);
         Print("Query: ", Query);
        }
     }
     
  }

//+------------------------Fin Datamis------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseAll(int aType,int ticket)
  {
   for(int i=OrdersTotal()-1; i>=0; i--)
      if(OrderSelect(i,SELECT_BY_POS))
         if(OrderSymbol()==Symbol())
            if(OrderMagicNumber()==MAGIC)
              {
               if(OrderType()==aType && OrderType()==OP_BUY)
                  if(OrderProfit()+OrderCommission()+OrderSwap()>0 || OrderTicket()==ticket)
                     if(!OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(Bid,Digits()),Slippage,clrRed))
                        Print(" OrderClose OP_BUY Error N",GetLastError());

               if(OrderType()==aType && OrderType()==OP_SELL)
                  if(OrderProfit()+OrderCommission()+OrderSwap()>0 || OrderTicket()==ticket)
                     if(!OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(Ask,Digits()),Slippage,clrRed))
                        Print(" OrderClose OP_SELL Error N",GetLastError());

              }
  }

//+------------------------------------------------------------------+
//| Validate zero values for min and max values                      |
//+------------------------------------------------------------------+
void validateZeroValues()
  {
   if(!(velAcumMax0 < 0))
     {
      Alert("Los niveles de acumulación de velocidad 0 deben ser menores a cero en su maximo");
     }

   if(!(velAcumMin1 <= 0 && velAcumMax1 < 0))
     {
      Alert("Los niveles de acumulación de velocidad 1 deben ser menores a cero");
     }

   if(!(velAcumMin2 <= 0 && velAcumMax2 < 0))
     {
      Alert("Los niveles de acumulación de velocidad 2 deben ser menores a cero");
     }

   if(!(velAcumMin3 <= 0 && velAcumMax3 < 0))
     {
      Alert("Los niveles de acumulación de velocidad 3 deben ser menores a cero");
     }

   if(!(velAcumMin4 <= 0 && velAcumMax4 < 0))
     {
      Alert("Los niveles de acumulación de velocidad 4 deben ser menores a cero");
     }

   if(!(velAcumMin5 <= 0 && velAcumMax5 < 0))
     {
      Alert("Los niveles de acumulación de velocidad 5 deben ser menores a cero");
     }
  }

//+------------------------------------------------------------------+
//| Validate min and max values                                      |
//+------------------------------------------------------------------+
void validateMinAndMaxValues()
  {
   if(!(velAcumMin0 > velAcumMax0 && velAcumMax0 > velAcumMin1))
     {
      Alert("Los niveles de acumulación de velocidad 0 mal configurado");
     }

   if(!(velAcumMin1 > velAcumMax1 && velAcumMax1 > velAcumMin2))
     {
      Alert("Los niveles de acumulación de velocidad 1 mal configurado");
     }

   if(!(velAcumMin2 > velAcumMax2 && velAcumMax2 > velAcumMin3))
     {
      Alert("Los niveles de acumulación de velocidad 2 mal configurado");
     }

   if(!(velAcumMin3 > velAcumMax3 && velAcumMax3 > velAcumMin4))
     {
      Alert("Los niveles de acumulación de velocidad 3 mal configurado");
     }

   if(!(velAcumMin4 > velAcumMax4 && velAcumMax4 > velAcumMin5))
     {
      Alert("Los niveles de acumulación de velocidad 4 mal configurado");
     }

   if(!(velAcumMin5 > velAcumMax5))
     {
      Alert("Los niveles de acumulación de velocidad 5 mal configurado");
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double getBuyLot(double floating)
  {
   double value = buyLot0;

   if(velAcumMin0 > floating && floating >= velAcumMax0)
      value = buyLot0;

   if(velAcumMin1 > floating && floating >= velAcumMax1)
      value = buyLot1;

   if(velAcumMin2 > floating && floating >= velAcumMax2)
      value = buyLot2;

   if(velAcumMin3 > floating && floating >= velAcumMax3)
      value = buyLot3;

   if(velAcumMin4 > floating && floating >= velAcumMax4)
      value = buyLot4;

   if(velAcumMin5 > floating && floating >= velAcumMax5)
      value = buyLot5;

   return value;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double getSelLot(double floating)
  {
   double value = sellLot0;

   if(velAcumMin0 > floating && floating >= velAcumMax0)
      value = sellLot0;

   if(velAcumMin1 > floating && floating >= velAcumMax1)
      value = sellLot1;

   if(velAcumMin2 > floating && floating >= velAcumMax2)
      value = sellLot2;

   if(velAcumMin3 > floating && floating >= velAcumMax3)
      value = sellLot3;

   if(velAcumMin4 > floating && floating >= velAcumMax4)
      value = sellLot4;

   if(velAcumMin5 > floating && floating >= velAcumMax5)
      value = sellLot5;

   return value;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double getMinProfit(double floating)
  {
   double value = profitCycle0;

   if(velAcumMin0 > floating && floating >= velAcumMax0)
      value = profitCycle0;

   if(velAcumMin1 > floating && floating >= velAcumMax1)
      value = profitCycle1;

   if(velAcumMin2 > floating && floating >= velAcumMax2)
      value = profitCycle2;

   if(velAcumMin3 > floating && floating >= velAcumMax3)
      value = profitCycle3;

   if(velAcumMin4 > floating && floating >= velAcumMax4)
      value = profitCycle4;

   if(velAcumMin5 > floating && floating >= velAcumMax5)
      value = profitCycle5;

   return value;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int getMinStepB(double floating)
  {
   int value = buyGrid0;

   if(velAcumMin0 > floating && floating >= velAcumMax0)
      value = buyGrid0;

   if(velAcumMin1 > floating && floating >= velAcumMax1)
      value = buyGrid1;

   if(velAcumMin2 > floating && floating >= velAcumMax2)
      value = buyGrid2;

   if(velAcumMin3 > floating && floating >= velAcumMax3)
      value = buyGrid3;

   if(velAcumMin4 > floating && floating >= velAcumMax4)
      value = buyGrid4;

   if(velAcumMin5 > floating && floating >= velAcumMax5)
      value = buyGrid5;

   return value;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int getMinStepS(double floating)
  {
   int value = sellGrid0;

   if(velAcumMin0 > floating && floating >= velAcumMax0)
      value = sellGrid0;

   if(velAcumMin1 > floating && floating >= velAcumMax1)
      value = sellGrid1;

   if(velAcumMin2 > floating && floating >= velAcumMax2)
      value = sellGrid2;

   if(velAcumMin3 > floating && floating >= velAcumMax3)
      value = sellGrid3;

   if(velAcumMin4 > floating && floating >= velAcumMax4)
      value = sellGrid4;

   if(velAcumMin5 > floating && floating >= velAcumMax5)
      value = sellGrid5;

   return value;
  }

//from here:   Efrain code start
//---------------------------------------------
double iif(bool Test,double TruePart,double FalsePart) {if(Test)return TruePart; return FalsePart;}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CalcMinProfits()
  {
   double MinLot;
   if(LotBalance<=0.0)
     {
      MinProfit =MinProfit_ ;
      AMinProfit=AMinProfit_;
      SingleTradeProfit=SingleTradeProfit_;
     }
   else
     {
      MinLot=iif(LotBuy<LotSel,LotBuy,LotSel);
      MinProfit =MinLot/LOTB*MinProfit_ ;
      AMinProfit=MinLot/LOTB*AMinProfit_;
      SingleTradeProfit=MinLot/LOTB*SingleTradeProfit_;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CloseAll(int Magic,string deal,int dir)
  {
   int i;

   RefreshRates();
   for(i=OrdersTotal()-1; i>=0; i--)
     {
      if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         Print("Error Select: ",__LINE__);
         RefreshRates();
         break;
        }
      if(OrderSymbol()==deal && (OrderMagicNumber()==Magic || Magic==-1) && (OrderType()==dir || dir==-1))
        {
         if(OrderType()==OP_BUY)
           {
            if(!OrderClose(OrderTicket(),OrderLots(),SymbolInfoDouble(OrderSymbol(), SYMBOL_BID),3000,clrLightGreen))
              {
               PlaySound("::error.wav");
               Print("Canot Close "+OrderSymbol());
               RefreshRates();
               break;
              }
           }
         if(OrderType()==OP_SELL)
           {
            if(!OrderClose(OrderTicket(),OrderLots(),SymbolInfoDouble(OrderSymbol(), SYMBOL_ASK),3000,clrLightPink))
              {
               PlaySound("::error.wav");
               Print("Canot Close "+OrderSymbol());
               RefreshRates();
               break;
              }
           }
        }
     }

   return(true);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ClosePartly(int Magic,string deal,int dir)
  {
   int i;
   string s="";
   double lot;

   RefreshRates();
   for(i=OrdersTotal()-1; i>=0; i--)
     {
      if(IsStopped())
        {
         return false;
        }
      if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         Print("Error Select: ",__LINE__);
         RefreshRates();
         break;
        }
      //---------------------------------------------------
      if(OrderSymbol()==deal && (OrderMagicNumber()==Magic || Magic==-1) && (OrderType()==dir || dir==-1))
        {
         lot=iif(OP_BUY==dir,LotBuy,LotSel);
         if(lot>=MarketInfo(deal,MODE_MINLOT) && OrderLots()>lot)
           {
            if(OrderType()==OP_BUY)
              {
               if(!OrderClose(OrderTicket(),lot,SymbolInfoDouble(OrderSymbol(), SYMBOL_BID),3000,clrLightGreen))
                 {
                  PlaySound("::error.wav");
                  Print("Canot Close "+OrderSymbol());
                  RefreshRates();
                  break;
                 }
              }
            if(OrderType()==OP_SELL)
              {
               if(!OrderClose(OrderTicket(),lot,SymbolInfoDouble(OrderSymbol(), SYMBOL_ASK),3000,clrLightPink))
                 {
                  PlaySound("::error.wav");
                  Print("Canot Close "+OrderSymbol());
                  RefreshRates();
                  break;
                 }
              }
           }
        }
     }

   return(true);
  }
//---------------------------------------------
double CalcWhatLoss(int Magic,string deal,int dir,int Ticket)
  {
   int i;
   double lossBig=0,lossSmall=0;
   double lotMin=0,LotAll=0;

   RefreshRates();
   for(i=OrdersTotal()-1; i>=0; i--)
     {
      if(IsStopped())
        {
         return false;
        }
      if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         Print("Error Select: ",__LINE__);
         RefreshRates();
         break;
        }
      //---------------------------------------------------
      if(OrderSymbol()==deal && (OrderMagicNumber()==Magic || Magic==-1) && OrderType()==dir)
        {
         lossBig=OrderProfit()+OrderCommission()+OrderSwap();
         if(OrderLots()>iif(OP_BUY==dir,LotBuy,LotSel) && lossBig<0 && OrderTicket() !=Ticket) //remove first & last orders & all profit orders
           {
            lotMin=iif(OP_BUY==dir,LotBuy,LotSel);
            LotAll =OrderLots();

            lossSmall+=lossBig/(LotAll/lotMin);//ok

           }
        }
      //---------------------------------------------------
     }

   return(lossSmall);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CalcProfits(int Magic,string sym,int Dir) //
  {
   double profitloss=0.0;
   bool Err;

   while(true)
     {
      profitloss=0.0;
      Err=false;
      RefreshRates();
      for(int i=OrdersTotal()-1; i>=0; i--)
        {
         if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
           {
            Err=true;
            break;
           }
         if((OrderType()==OP_BUY || OrderType()==OP_SELL)&&(OrderType()==Dir || Dir==-1) && ((OrderMagicNumber()==Magic || Magic==-1) && (OrderSymbol()==sym || sym=="" || sym==NULL)))
           {
            profitloss+=OrderProfit()+OrderCommission()+OrderSwap();
           }
        }
      if(!Err)
        {
         break;
        }
     }

   return(profitloss);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetMinLot(int Magic,string sym,int Dir)
  {
   double Min=0.0;
   bool Err;

   while(true)
     {
      Min=DBL_MAX;
      Err=false;
      RefreshRates();
      for(int i=OrdersTotal()-1; i>=0; i--)
        {
         if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
           {
            Err=true;
            break;
           }
         if((OrderType()==OP_BUY || OrderType()==OP_SELL)&&(OrderType()==Dir || Dir==-1) && ((OrderMagicNumber()==Magic || Magic==-1) && (OrderSymbol()==sym || sym=="" || sym==NULL)))
           {
            if(OrderLots()<Min)
              {
               Min=OrderLots();
              }
           }
        }
      if(!Err)
        {
         break;
        }
     }

   return(Min);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string NUM(double number,int n)
  {
   return(DoubleToStr(number,n));
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double NormalizeLot(double eLot,string sym)
  {
   double LotNrm,MinLot,LotStp;

   MinLot=MarketInfo(sym,MODE_MINLOT);
   LotStp=MarketInfo(sym,MODE_LOTSTEP);
   eLot=(double)NUM(eLot,6);//convert 1.000e-18 to 0.0
   LotNrm=(double)NUM(MathFloor(eLot/LotStp)*LotStp,6);
   if(MathAbs(LotNrm)<MinLot)
      return 0;
   return(LotNrm);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OrdersTotals(int Magic,string sym,int Direction)
  {
   int x=0,i;
   bool error;

   while(true)
     {
      x=0;
      error=false;
      for(i=0; i<OrdersTotal(); i++)
        {
         if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
           {
            RefreshRates();
            error=true;
            break;
           }
         if((OrderMagicNumber()==Magic || Magic==-1) && (OrderType()==OP_BUY || OrderType()==OP_SELL)&&(OrderType()==Direction || Direction==-1) && (OrderSymbol()==sym || sym=="" || sym==NULL))
           {
            x++;
           }
        }
      if(!error)
        {
         break;
        }
      if(IsStopped())
        {
         return -1;
        };
     }
   return(x);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CloseBy(int Magic,string sym)  //false ==fin, true ==not yet
  {
   int t1=0,t2=0,err;
   bool r;

   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         RefreshRates();
         return true;
        }

      if(OrderSymbol()==sym && OrderType()==OP_BUY  && t1==0 && (OrderMagicNumber()==Magic || Magic==-1))
        {
         t1=OrderTicket();
        }

      if(OrderSymbol()==sym && OrderType()==OP_SELL && t2==0 && (OrderMagicNumber()==Magic || Magic==-1))
        {
         t2=OrderTicket();
        }

      if(t1>0 && t2>0)
        {
         r=OrderCloseBy(t1,t2);
         Alert("Cierre de ciclo de genesis :)");
         SendMail("Cierre de ciclo de genesis :) de" + Symbol(),"Trabajando");
         PlaySound("::coin.wav");//eoo.wav
         err=GetLastError();
         if(err!=ERR_NO_ERROR)
           {
            Print("OrderCloseBy() Error: ");
           }
         return true;
        }
     }
   return false;
  }

//Efrain Cobertura
double calcularDistancia(double pips)
  {
   return pips * pipDivider;
  }

//Efrain Cobertura
double calcularPips(double distancia)
  {
   return distancia / pipDivider;
  }

//Efrain Cobertura
double getPrecioAperturaViejo(int tipoOperacion)
  {
//Se busca el precio de apertura de la operacion abierta mas antigua
   double precioApertura = 0.0;
//Ordenes NO de cobertura abiertas
   for(int i = 0; i < OrdersTotal(); i++)
     {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderSymbol() == Symbol())
           {
            if(OrderMagicNumber() == MAGIC && OrderCloseTime() == 0)
              {
               if(OrderType() == tipoOperacion)
                 {
                  precioApertura = OrderOpenPrice();
                  if(Debug)
                     Print("***** Op #" + (string)OrderTicket() + " precioApertura " + (string)precioApertura);
                  break;
                 }
              }
           }
        }
     }
   return precioApertura;
  }

//+------------------------------------------------------------------+
//| Calculando lotes para el tipo de operacion y simbolo              |
//+------------------------------------------------------------------+
double calculateLot(int type, string symbol, int magic)
  {
   double   lot = 0;
   int    i = 0, orders = OrdersTotal();

   if(orders > 0)
     {
      for(i= orders - 1; i >= 0; i--)
        {
         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
           {
            if(OrderType() == type && OrderSymbol() == symbol && OrderMagicNumber() == magic)
               lot = lot + OrderLots();
           }
        }
     }

   return lot;
  }

//+------------------------------------------------------------------+
//| cuenta de operacion sell o buy                                   |
//+------------------------------------------------------------------+
int countOperation(int type, string symbol, int magic)
  {
   int _countOrd = 0;

   for(int i = 0; i < OrdersTotal(); i++)
     {
      int orderSelect = OrderSelect(i, SELECT_BY_POS, MODE_TRADES);
      if(OrderSymbol() == symbol && OrderType() == type && OrderMagicNumber() == magic)
        {
            _countOrd++;
        }
     }
   return(_countOrd);
  }

//+------------------------------------------------------------------+
//|Realizar operación de bloque para el símbolo actual               |
//+------------------------------------------------------------------+
int makeBlockOperation(int type, string symbol, int magic, double accumulation, double percentage, string number, int pip)
  {
   color operationColor = type == OP_BUY ? clrGreen : clrDarkOliveGreen;
   int typeCalculate = type == OP_BUY? OP_SELL : OP_BUY;
   double lotBlock = calculateLot(typeCalculate, symbol, magic);
   double openPrice = type == OP_BUY ? NormalizeDouble(Ask, Digits()) : NormalizeDouble(Bid, Digits());
   string comment = type == OP_BUY ? "BUY" : "SELL";
   double stoploss = type == OP_BUY ? Ask - NormalizeDouble(pip * Point, Digits()) : Bid + NormalizeDouble(pip * Point, Digits());

   if(countOperation(typeCalculate, symbol, magic) <= 1)
     {
      return (INIT_FAILED);
     }

   if(lotBlock == 0)
     {
      return (INIT_FAILED);
     }

   if(isUniqueBlockOperationByNumber(type, symbol, number))
     {
      return (INIT_FAILED);
     }

   if(accumulation >= 0)
     {
      return (INIT_FAILED);
     }

   return OrderSend(symbol, type, NormalizeDouble(lotBlock * percentage, 2), openPrice, Slippage, stoploss, 0, "BlockAccount" + comment + symbol + number, magic + 1, 0, operationColor);
  }

//+------------------------------------------------------------------+
//| Esta función calcula solo existe una operación de bloque única   |
//+------------------------------------------------------------------+
bool isUniqueBlockOperationByNumber(int type, string symbol, string number)
  {
   bool isUnique = false;
   string comment = type == OP_BUY ? "BUY" : "SELL";

   for(int i = 0; i < OrdersTotal(); i++)
     {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES) == true)
        {
         if(OrderComment() == "BlockAccount" + comment + symbol + number)
           {
            return (true);
           }
        }
     }

   return(isUnique);
  }

//+------------------------------------------------------------------+
//| Esta función calcula solo existe una operación de bloque única   |
//+------------------------------------------------------------------+
bool isUniqueBlockOperation(int type, string symbol)
  {
   bool isUnique = false;
   string comment = type == OP_BUY ? "BUY" : "SELL";

   for(int i = 0; i < OrdersTotal(); i++)
     {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES) == true)
        {
         if(OrderComment() == "BlockAccount" + comment + symbol + "1"
            || OrderComment() == "BlockAccount" + comment + symbol + "2"
            || OrderComment() == "BlockAccount" + comment + symbol + "3"
            || OrderComment() == "BlockAccount" + comment + symbol + "4"
            || OrderComment() == "BlockAccount" + comment + symbol + "5"
            || OrderComment() == "BlockAccount" + comment + symbol + "6"
            || OrderComment() == "BlockAccount" + comment + symbol + "7"
            || OrderComment() == "BlockAccount" + comment + symbol + "8")
           {
            return (true);
           }
        }
     }

   return(isUnique);
  }
//+------------------------------------------------------------------+

/*
   TECNICO:
   - En brokers de 4 digitos 1 punto = 1 pip. En brokers de 5 digitos 1 punto = 1/10 pips. 1 pip = 10 puntos. Ej: 568,67 puntos = 56,86 pips
   - La segunda cifra del cursor 'crosshair' mide la distancia en puntos.
   - Ask - Arriba - Compra || Bid - Abajo - Venta
*/

//+------------------------------------------------------------------+
//| Calcular los take profit de las ordenes madre                    |
//+------------------------------------------------------------------+
void TakeProfitMotherOrder(string symbol, int magic, int takeProfitPips, double lot)
  {
   double takeProfit = 0;
   double point = (Digits % 2 == 1)? Point * 10 : Point;


   for(int i = 0; i < OrdersTotal(); i++)
     {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderType() == OP_BUY)
           {
            takeProfit = NormalizeDouble(OrderOpenPrice() + (takeProfitPips * point), Digits);
           }

         if(OrderType() == OP_SELL)
           {
            takeProfit = NormalizeDouble(OrderOpenPrice() - (takeProfitPips * point), Digits);
           }

         if(takeProfit != 0 && OrderLots() == lot && OrderSymbol() == symbol && OrderMagicNumber() == magic)
           {
            if(!OrderModify(OrderTicket(), OrderOpenPrice(), OrderStopLoss(), takeProfit, 0, clrOrange))
              {
               Print("Order nro. " + (string)OrderTicket() + " no pudo ser modificada para el take profit " + (string)takeProfit);
              }
           }

         takeProfit = 0;
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void makeBlockOperationByVelocity(double floating, string symbol, int magic, double amount)
  {
// Print(floating);
   if(floating <= blockOperation1 && floating > blockOperation2 && percentage1 > 0)
     {
      makeBlockOperation(OP_BUY, symbol, magic, amount, percentage1, "1", stoploss1);
      makeBlockOperation(OP_SELL, symbol, magic, amount, percentage1, "5", stoploss1);
     }

   if(floating < 0 && floating <= blockOperation2 && floating > blockOperation3 && percentage1 > 0)
     {
      makeBlockOperation(OP_BUY, symbol, magic, amount, percentage2, "2", stoploss2);
      makeBlockOperation(OP_SELL, symbol, magic, amount, percentage2, "6", stoploss2);
     }

   if(floating < 0 && floating <= blockOperation3 && floating > blockOperation4 && percentage1 > 0)
     {
      makeBlockOperation(OP_BUY, symbol, magic, amount, percentage3, "3", stoploss3);
      makeBlockOperation(OP_SELL, symbol, magic, amount, percentage3, "7", stoploss3);
     }

   if(floating < 0 && floating <= blockOperation4 && percentage1 > 0)
     {
      makeBlockOperation(OP_BUY, symbol, magic, amount, percentage4, "4", stoploss4);
      makeBlockOperation(OP_SELL, symbol, magic, amount, percentage4, "8", stoploss4);
     }
  }
//+------------------------------------------------------------------+
//
void seguimientoTrailing(double pasoTrailingStopC, double distanciaTrailing, double profit, int magic, bool debug)
  {
   double nuevoSL = 0.0;

//Solo se evalua cuando el precio de ha movido los N pips que indica el PasoTrailingStopC
   RefreshRates();
   bool moverCompras = false;
   double precioCompra = NormalizeDouble(Ask, Digits());
   if(precioCompra > ultimoPrecioCompra)
     {
      double diferenciaCompra = precioCompra - ultimoPrecioCompra;
      double pipsDiferenciaCompra = calcularPips(diferenciaCompra);
      if(pipsDiferenciaCompra > pasoTrailingStopC)
        {
         moverCompras = true;
         ultimoPrecioCompra = precioCompra;
        }
     }
   bool moverVentas = false;
   double precioVenta = NormalizeDouble(Bid, Digits());
   if(precioVenta < ultimoPrecioVenta)
     {
      double diferenciaVenta = ultimoPrecioVenta - precioVenta;
      double pipsDiferenciaVenta = calcularPips(diferenciaVenta);
      if(pipsDiferenciaVenta > pasoTrailingStopC)
        {
         moverVentas = true;
         ultimoPrecioVenta = precioVenta;
        }
     }

//Ordenes de cobertura abiertas
   for(int i = OrdersTotal() - 1; i >= 0; i--)
     {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderSymbol() == Symbol())
           {
            if(OrderMagicNumber() == magic && OrderCloseTime() == 0)
              {
               //if (Debug) Print("***** Op Cobertura #" + (string)OrderTicket() + " OrderProfit: " + (string)OrderProfit());
               if(OrderProfit() > 0)
                 {
                  //Se va a intentar mover el trailing stop
                  RefreshRates();
                  if(OrderType() == OP_BUY && moverCompras)
                    {
                     //Si es compra, el precio actual - TrailingStopC
                     precioCompra = NormalizeDouble(Ask, Digits());
                     nuevoSL = precioCompra - distanciaTrailing;
                     
                     // Si el stoploss supera el precio de apertura
                     if (OrderOpenPrice() < nuevoSL + profit){
                        continue;
                     }
                     
                     if(OrderModify(OrderTicket(), OrderOpenPrice(), nuevoSL, 0, 0, clrOrange))
                       {
                        if(debug)
                           Print("***** Op Cobertura COMPRA #" + (string)OrderTicket() + " se mueve su SL a " + (string)nuevoSL);
                       }
                     else
                       {
                        GetLastError();
                       }
                    }
                  if(OrderType() == OP_SELL && moverVentas)
                    {
                     //Si es venta, el precio actual + TrailingStopC
                     precioVenta = NormalizeDouble(Bid, Digits());
                     nuevoSL = precioVenta + distanciaTrailing;
                     
                     // Si el stoploss supera el precio de apertura
                     if (OrderOpenPrice() > nuevoSL + profit){
                        continue;
                     }
                     
                     if(OrderModify(OrderTicket(), OrderOpenPrice(), nuevoSL, 0, 0, clrOrange))
                       {
                        if(debug)
                           Print("***** Op Cobertura VENTA #" + (string)OrderTicket() + " se mueve su SL a " + (string)nuevoSL);
                       }
                     else
                       {
                        GetLastError();
                       }
                    }
                 }
              }
           }
        }
     }
  }
