//+------------------------------------------------------------------+
//|                                                    GenesisV7.mq5 |
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

#include<Trade\Trade.mqh>
#include <Trade\PositionInfo.mqh>
#include <Trade\SymbolInfo.mqh>

CTrade trade;
CPositionInfo InfoPosition;
CSymbolInfo SimboloInfo;



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


int             NumeroDeCuenta          = 187960;
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

string NameExpertExpert = "IA Genesis";
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
   digitos = (int)SymbolInfoInteger(Symbol(),SYMBOL_DIGITS); //XXXJPY = 3.0, Otros = 5.0
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

   ObjectCreate(0,NameExpertExpert, OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0,NameExpertExpert, OBJPROP_CORNER, CORNER_RIGHT_LOWER);
   ObjectSetInteger(0,NameExpertExpert, OBJPROP_XDISTANCE, 10);
   ObjectSetInteger(0,NameExpertExpert, OBJPROP_YDISTANCE, 10);
   ObjectSetString(0, NameExpertExpert,OBJPROP_TEXT,NameExpertExpert);
   ObjectSetString(0,NameExpertExpert,OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,NameExpertExpert,OBJPROP_FONTSIZE,14);
   ObjectSetInteger(0,NameExpertExpert,OBJPROP_COLOR,clrRed);

   CalcMinProfits();

   if(LotBalance <= 0.0)
     {
      LotBuy = LOTB;
      LotSel = LOTS;
     }
   else
     {
      if(OrdersTotals(MAGIC, Symbol(), POSITION_TYPE_BUY) == 0 || !UsePartlyClose)
        {
         LotBuy = NormalizeLot(AccountInfoDouble(ACCOUNT_BALANCE) / LotBalance * LOTB, Symbol());
        }
      else
        {
         LotBuy = GetMinLot(MAGIC, Symbol(), POSITION_TYPE_BUY);
        }
      if(OrdersTotals(MAGIC, Symbol(), POSITION_TYPE_SELL) == 0 || !UsePartlyClose)
        {
         LotSel =NormalizeLot(AccountInfoDouble(ACCOUNT_BALANCE) / LotBalance * LOTS, Symbol());
        }
      else
        {
         LotSel = GetMinLot(MAGIC, Symbol(), POSITION_TYPE_SELL);
        }
     }
   
   trade.SetExpertMagicNumber(MAGIC);
   return INIT_SUCCEEDED;
  }

//Efrain Cobertura
void seguimientoTrailing()
  {
   double nuevoSL = 0.0;
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
//Solo se evalua cuando el precio de ha movido los N pips que indica el PasoTrailingStopC
   SimboloInfo.RefreshRates();
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
   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {
      ulong TicketPosition=PositionGetTicket(i);

      if(TicketPosition!=0)
        {
         if(PositionGetString(POSITION_SYMBOL) == Symbol())
           {
            if(PositionGetInteger(POSITION_MAGIC) == MagicC)
              {
               //if (Debug) Print("***** Op Cobertura #" + (string)OrderTicket() + " OrderProfit: " + (string)OrderProfit());
               if(PositionGetDouble(POSITION_PROFIT) > 0)
                 {
                  //Se va a intentar mover el trailing stop
                  SimboloInfo.RefreshRates();
                  if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY && moverCompras)
                    {
                     //Si es compra, el precio actual - TrailingStopC
                     precioCompra = NormalizeDouble(Ask, Digits());
                     nuevoSL = precioCompra - distanciaTrailingStopC;
                     bool Modificar=trade.PositionModify(TicketPosition,nuevoSL,0);
                     if(Modificar)
                       {
                        if(Debug)
                           Print("***** Op Cobertura COMPRA #" + (string)TicketPosition + " se mueve su SL a " + (string)nuevoSL);
                       }
                     else
                       {
                        GetLastError();
                       }
                    }
                  if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL && moverVentas)
                    {
                     //Si es venta, el precio actual + TrailingStopC
                     precioVenta = NormalizeDouble(Bid, Digits());
                     nuevoSL = precioVenta + distanciaTrailingStopC;
                     bool Modificar=trade.PositionModify(TicketPosition,nuevoSL,0);
                     if(Modificar)
                       {
                        if(Debug)
                           Print("***** Op Cobertura VENTA #" + (string)TicketPosition + " se mueve su SL a " + (string)nuevoSL);
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
   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {
      ulong TicketPosition=PositionGetTicket(i);

      if(TicketPosition!=0)
        {

         if(PositionGetString(POSITION_SYMBOL) == Symbol())
           {
            if(PositionGetInteger(POSITION_MAGIC) == MagicC)
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
   Port     = (int)StringToInteger(ReadIni(INI, "MYSQL", "Port"));
   Socket   = ReadIni(INI, "MYSQL", "Socket");
   ClientFlag = (int)StringToInteger(ReadIni(INI, "MYSQL", "ClientFlag"));
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

      string Update = "UPDATE transactions SET is_close = 1 WHERE account_id = \'" + (string)AccountInfoInteger(ACCOUNT_LOGIN) + "\'";

      if(!MySqlExecute(DB, Update))
        {
         Print("Error: ", MySqlErrorDescription);
         Print("Query: ", Query);
        }

      Query = "INSERT INTO `accounts` (account_id, NameExpert, company, leverage, balance, margin, floating, equity, initial, type, customer, create_at, update_at) VALUES (\'"
              + (string)AccountInfoInteger(ACCOUNT_LOGIN) + "\',\'" + (string)AccountInfoString(ACCOUNT_NAME) + "\',\'" + (string)AccountInfoString(ACCOUNT_COMPANY) + "\',\'" + (string)AccountInfoInteger(ACCOUNT_LEVERAGE) + "\',\'"
              + (string)AccountInfoDouble(ACCOUNT_BALANCE) + "\',\'" + (string)AccountInfoDouble(ACCOUNT_MARGIN) + "\',\'" + (string)AccountInfoDouble(ACCOUNT_PROFIT) + "\',\'" + (string)AccountInfoDouble(ACCOUNT_EQUITY) + "\',\'"
              + (string)initial + "\',\'" + (string)trade_mode + "\',\'" + (string)customer + "\',\'" + (string)TimeCurrent() + "\',\'" + (string)TimeCurrent() + "\') ON DUPLICATE KEY UPDATE NameExpert = \'" + (string)AccountInfoString(ACCOUNT_NAME) + "\', company = \'" + AccountInfoString(ACCOUNT_COMPANY) + "\', leverage = \'" + (string)AccountInfoInteger(ACCOUNT_LEVERAGE)
              + "\', balance = \'" + (string)AccountInfoDouble(ACCOUNT_BALANCE)+ "\', margin = \'" + (string)AccountInfoDouble(ACCOUNT_MARGIN) + "\', floating = \'" + (string)AccountInfoDouble(ACCOUNT_PROFIT) + "\', equity = \'" + (string)AccountInfoDouble(ACCOUNT_EQUITY)
              + "\', initial = \'" + (string)initial + "\', update_at = \'" + (string)TimeCurrent() + "\', type = \'" + (string)trade_mode + "\', customer = \'" + (string)customer + "\'";

     //transactions(DB, MODE_TRADES); ////////HABILITAR ESTO
      //transactions(DB, MODE_HISTORY); ////////HABILITAR ESTO
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

   if(AccountInfoInteger(ACCOUNT_LOGIN) != NumeroDeCuenta || TimeCurrent() >= Fecha)
     {

      Alert(" Genesis necesita actualizacion ") ;
      return;

     }

   if(trailingStep1 > 0 && trailingProfit1 > 0)
     {

      seguimientoTrailing(trailingStep1, distanciaTrailing1, trailingProfit1, MAGIC + 1, Debug);
     }

   if(trailingStep2 > 0 && trailingProfit2 > 0)
     {

      seguimientoTrailing(trailingStep2, distanciaTrailing2, trailingProfit2, MAGIC + 1, Debug);
     }

   if(trailingStep3 > 0 && trailingProfit3 > 0)
     {

      seguimientoTrailing(trailingStep3, distanciaTrailing3, trailingProfit3, MAGIC + 1, Debug);
     }

   if(trailingStep4 > 0 && trailingProfit4 > 0)
     {

      seguimientoTrailing(trailingStep4, distanciaTrailing4, trailingProfit4, MAGIC + 1, Debug);
     }

   if(isUniqueBlockOperation(POSITION_TYPE_BUY, Symbol()) || isUniqueBlockOperation(POSITION_TYPE_SELL, Symbol()))
     {
      Alert("Block account for accumulation");
      return;
     }

   validateZeroValues();
   validateMinAndMaxValues();

   LOTB = getBuyLot(AccountInfoDouble(ACCOUNT_PROFIT));
   LOTS = getSelLot(AccountInfoDouble(ACCOUNT_PROFIT));
   MinProfit_ = getMinProfit(AccountInfoDouble(ACCOUNT_PROFIT));
   MinStepB = getMinStepB(AccountInfoDouble(ACCOUNT_PROFIT));
   MinStepS = getMinStepS(AccountInfoDouble(ACCOUNT_PROFIT));

   int
   b = 0,
   s = 0;
   ulong BuyMaxTic  = 0,
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

   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {

      ulong TicketPosition=PositionGetTicket(i);

      if(TicketPosition!=0)
        {
         if(PositionGetString(POSITION_SYMBOL) == Symbol())
           {

            if(PositionGetInteger(POSITION_MAGIC) == MAGIC)
              {
               if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY)
                 {
                  b++;
                  if(PositionGetDouble(POSITION_PRICE_OPEN) < BuyMin || BuyMin == 0)
                    {
                     BuyMin = PositionGetDouble(POSITION_PRICE_OPEN);
                     BuyMinLot = PositionGetDouble(POSITION_VOLUME);
                    }
                  if(PositionGetDouble(POSITION_PRICE_OPEN) > BuyMax || BuyMin == 0)
                    {
                     BuyMax = PositionGetDouble(POSITION_PRICE_OPEN);
                     BuyMaxTic = TicketPosition;
                     BuyTicProfit = PositionGetDouble(POSITION_PROFIT) + PositionGetDouble(POSITION_SWAP) + InfoPosition.Commission();
                    }
                  if(PositionGetDouble(POSITION_PROFIT) + PositionGetDouble(POSITION_SWAP)+InfoPosition.Commission() > 0)
                    {
                     BuyProfit += PositionGetDouble(POSITION_PROFIT) + PositionGetDouble(POSITION_SWAP) + InfoPosition.Commission();
                    }
                 }
               if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL)
                 {
                  s++;
                  if(PositionGetDouble(POSITION_PRICE_OPEN) > SellMax || SellMax == 0)
                    {
                     SellMax = PositionGetDouble(POSITION_PRICE_OPEN);
                     SellMaxLot = PositionGetDouble(POSITION_VOLUME);
                    }
                  if(PositionGetDouble(POSITION_PRICE_OPEN) < SellMin || SellMin == 0)
                    {
                     SellMin = PositionGetDouble(POSITION_PRICE_OPEN);
                     SellMinTic = TicketPosition;
                     SellTicProfit = PositionGetDouble(POSITION_PROFIT) + PositionGetDouble(POSITION_SWAP)+InfoPosition.Commission();
                    }
                  if(PositionGetDouble(POSITION_PROFIT) + PositionGetDouble(POSITION_SWAP)+InfoPosition.Commission() > 0)
                    {
                     SellProfit += PositionGetDouble(POSITION_PROFIT) + PositionGetDouble(POSITION_SWAP)+InfoPosition.Commission();
                    }
                 }
              }
           }
        }
     }
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
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
   ulong ticketCobertura = -1;
   double slCobertura = 0.0;
   double precioCobertura = 0.0;

   if(TypeOrders == BUY || TypeOrders == BOTH)
      if((b == 0) || (b > 0 && (BuyMin - Ask) >= BuyDist))
        {
         precioAperturaCompra = NormalizeDouble(Ask, Digits());
         bool Ejecucion=trade.Buy(NormalizeDouble(BuyLot, 2),Symbol(),precioAperturaCompra,0,0,"My order");

         if(Ejecucion==false || trade.ResultRetcode()!=TRADE_RETCODE_DONE)// Comprobar
           {
            if(Ejecucion==false)
               Print(" Error open Buy N ", GetLastError());
            else
               Print(" Open Buy N con ERROR", trade.ResultRetcode());
           }
         else
           {
            //Efrain Cobertura
            ventas = 0;
            compras++;
            int numOpsAbiertasC = contarOpsCobertura();
            precioAperturaCompra = getPrecioAperturaViejo(POSITION_TYPE_BUY);
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

               Ejecucion=trade.Sell(NormalizeDouble(lotajeCobertura, 2),Symbol(),precioCobertura,slCobertura,0,"CoberturaV");

               if(Ejecucion==true && trade.ResultRetcode()==TRADE_RETCODE_DONE)//COmprobar
                 {
                  ticketCobertura=trade.ResultDeal();
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
        }

   if(TypeOrders == SELL || TypeOrders == BOTH)
      if((s == 0) || (s > 0 && (Bid - SellMax) >= SellDist))
        {
         precioAperturaVenta = NormalizeDouble(Bid, Digits());

         bool Ejecucion=trade.Sell(NormalizeDouble(SellLot, 2),Symbol(),precioAperturaVenta,0,0,"My order");

         if(Ejecucion==false || trade.ResultRetcode()!=TRADE_RETCODE_DONE)// Comprobar
           {
            if(Ejecucion==false)
               Print(" Error open Buy N ", GetLastError());
            else
               Print(" Open Buy N con ERROR", trade.ResultRetcode());
           }
         else
           {
            //Efrain Cobertura
            compras = 0;
            ventas++;
            int numOpsAbiertasC = contarOpsCobertura();
            precioAperturaVenta = getPrecioAperturaViejo(POSITION_TYPE_SELL);
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

               Ejecucion=trade.Buy(NormalizeDouble(lotajeCobertura, 2),Symbol(),precioCobertura,slCobertura,0,"CoberturaC");

               if(Ejecucion==true && trade.ResultRetcode()==TRADE_RETCODE_DONE)//COmprobar
                 {
                  ticketCobertura=trade.ResultDeal();
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
        }

   if(ProfitBuy+iif(UsePartlyClose,CalcWhatLoss(MAGIC,Symbol(),POSITION_TYPE_BUY,BuyMaxTic),0.0)>=MinProfit && b>=2)
     {
      CloseAll(POSITION_TYPE_BUY,BuyMaxTic);
      iif(UsePartlyClose,0.0,ClosePartly(MAGIC,Symbol(),POSITION_TYPE_BUY));
     }
   if(ProfitSel+iif(UsePartlyClose,CalcWhatLoss(MAGIC,Symbol(),POSITION_TYPE_SELL,SellMinTic),0.0)>=MinProfit && s>=2)
     {
      CloseAll(POSITION_TYPE_SELL,SellMinTic);
      iif(UsePartlyClose,0.0,ClosePartly(MAGIC,Symbol(),POSITION_TYPE_SELL));
     }

   if(LotBalance<=0.0)
     {
      LotBuy=LOTB;
      LotSel=LOTS;
     }
   else
     {
      if(OrdersTotals(MAGIC,Symbol(),POSITION_TYPE_BUY)==0 || !UsePartlyClose)
        {
         LotBuy=NormalizeLot(AccountInfoDouble(ACCOUNT_BALANCE)/LotBalance*LOTB,Symbol());
        }
      else
        {
         LotBuy=GetMinLot(MAGIC,Symbol(),POSITION_TYPE_BUY);
        }
      if(OrdersTotals(MAGIC,Symbol(),POSITION_TYPE_SELL)==0 || !UsePartlyClose)
        {
         LotSel=NormalizeLot(AccountInfoDouble(ACCOUNT_BALANCE)/LotBalance*LOTS,Symbol());
        }
      else
        {
         LotSel=GetMinLot(MAGIC,Symbol(),POSITION_TYPE_SELL);
        }
     }

//--------test de close by
   int c1,c2;
   double Ratio,p1,p2;
   c1=OrdersTotals(MAGIC,Symbol(),POSITION_TYPE_BUY);
   c2=OrdersTotals(MAGIC,Symbol(),POSITION_TYPE_SELL);
   p1=CalcProfits(MAGIC,Symbol(),POSITION_TYPE_BUY);
   p2=CalcProfits(MAGIC,Symbol(),POSITION_TYPE_SELL);
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
      CloseAll(MAGIC,Symbol(),POSITION_TYPE_BUY);
     }
   if(1==c2 && p2>=SingleTradeProfit && TypeOrders==SELL)
     {
      CloseAll(MAGIC,Symbol(),POSITION_TYPE_SELL);
     }

   CalcMinProfits();//MinProfit,AMinProfit Ratio Changed To Lot And Balance
//makeBlockOperation(POSITION_TYPE_BUY, Symbol(), MAGIC, AccumulationAmount);
//makeBlockOperation(POSITION_TYPE_SELL, Symbol(), MAGIC, AccumulationAmount);

   makeBlockOperationByVelocity(AccountInfoDouble(ACCOUNT_PROFIT), Symbol(), MAGIC, AccumulationAmount);
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

//////////HABILITAR ESTO////////HABILITAR ESTO////////HABILITAR ESTO////////HABILITAR ESTO
//+------------------------------------------------------------------+
//| Function for insert or update orders in MySQL                    |
//+------------------------------------------------------------------+
/*
void transactions(int DB, int mode)
  {

   int isClose = (mode == MODE_HISTORY)? 1 : 0;

   for(int i = 0 ; i < OrdersTotal() ; i++)
     {
      if(!OrderSelect(i, SELECT_BY_POS,  mode))
         continue;

      string Query = "INSERT INTO `transactions` (transaction_id, account_id, type, profit, swap, symbol, lots, commission, is_close, open_price, close_price, mode, close_at, open_at, create_at, update_at) VALUES (\'"
                     + (string)OrderTicket() + "\',\'" + (string)AccountNumber() + "\',\'" + (string)PositionGetInteger(POSITION_TYPE) + "\',\'" + (string)OrderProfit() + "\',\'" + (string)OrderSwap() + "\',\'"
                     + (string)OrderSymbol() + "\',\'" + (string)OrderLots() + "\',\'" + (string)OrderCommission() + "\',\'" + (string)isClose + "\',\'"
                     + (string)PositionGetDouble(POSITION_PRICE_OPEN) + "\',\'" + (string)OrderClosePrice() + "\',\'" + (string)mode + "\',\'" + (string)OrderCloseTime() + "\',\'" + (string)OrderOpenTime() + "\',\'" + (string)TimeCurrent() + "\',\'" + (string)TimeCurrent() + "\') ON DUPLICATE KEY UPDATE profit = \'" + (string)OrderProfit() + "\', swap = \'" + (string)OrderSwap() + "\', symbol = \'" + (string)OrderSymbol()
                     + "\', lots = \'" + (string)OrderLots() + "\', commission = \'" + (string)OrderCommission() + "\', open_price = \'" + (string)PositionGetDouble(POSITION_PRICE_OPEN) + "\', close_price = \'" + (string)OrderClosePrice()
                     + "\', close_at = \'" + (string)OrderCloseTime() + "\', open_at = \'" + (string)OrderOpenTime() + "\', update_at = \'" + (string)TimeCurrent() + "\', is_close = \'" + (string)isClose + "\', mode = \'" + (string)mode + "\'";

      if(!MySqlExecute(DB, Query))
        {
         Print("Error: ", MySqlErrorDescription);
         Print("Query: ", Query);
        }
     }

  }*/

//+------------------------Fin Datamis------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseAll(int aType,ulong ticket)
  {
   for(int i=PositionsTotal()-1; i>=0; i--)
     {

      ulong TicketPosition=PositionGetTicket(i);

      if(TicketPosition!=0)
        {
         if(PositionGetString(POSITION_SYMBOL)==Symbol())
           {
            if(PositionGetInteger(POSITION_MAGIC)==MAGIC)
              {
               if(PositionGetInteger(POSITION_TYPE)==aType && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
                 {
                  if(PositionGetDouble(POSITION_PROFIT)+InfoPosition.Commission()+PositionGetDouble(POSITION_SWAP)>0 || TicketPosition==ticket)
                    {
                     if(!trade.PositionClose(TicketPosition,-1))
                        Print(" OrderClose POSITION_TYPE_BUY Error N",GetLastError());
                    }
                 }

               if(PositionGetInteger(POSITION_TYPE)==aType && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
                 {
                  if(PositionGetDouble(POSITION_PROFIT)+InfoPosition.Commission()+PositionGetDouble(POSITION_SWAP)>0 || TicketPosition==ticket)
                    {
                     if(!trade.PositionClose(TicketPosition,-1))
                        Print(" OrderClose POSITION_TYPE_SELL Error N",GetLastError());
                    }
                 }
              }
           }
        }
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
bool CloseAll(int Magic,string deal,ENUM_POSITION_TYPE dir)
  {
   int i;

   SimboloInfo.RefreshRates();
   for(i=PositionsTotal()-1; i>=0; i--)
     {
      ulong TicketPosition=PositionGetTicket(i);

      if(TicketPosition==0)
        {
         Print("Error Select: ",__LINE__);
         SimboloInfo.RefreshRates();
         break;
        }
      if(PositionGetString(POSITION_SYMBOL)==deal && (PositionGetInteger(POSITION_MAGIC)==Magic || Magic==-1) && (PositionGetInteger(POSITION_TYPE)==dir || dir==-1))
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
           {
            bool Cierre=trade.PositionClose(TicketPosition,-1);
            if(!Cierre)
              {
               PlaySound("::error.wav");
               Print("Canot Close "+PositionGetString(POSITION_SYMBOL));
               SimboloInfo.RefreshRates();
               break;
              }
           }
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
           {
            bool Cierre=trade.PositionClose(TicketPosition,-1);
            if(!Cierre)
              {
               PlaySound("::error.wav");
               Print("Canot Close "+PositionGetString(POSITION_SYMBOL));
               SimboloInfo.RefreshRates();
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
bool ClosePartly(int Magic,string deal,ENUM_POSITION_TYPE dir)
  {
   int i;
   string s="";
   double lot;

   SimboloInfo.RefreshRates();
   for(i=PositionsTotal()-1; i>=0; i--)
     {
      if(IsStopped())
        {
         return false;
        }
      ulong TicketPosition=PositionGetTicket(i);
      if(TicketPosition==0)
        {
         Print("Error Select: ",__LINE__);
         SimboloInfo.RefreshRates();
         break;
        }
      //---------------------------------------------------
      if(PositionGetString(POSITION_SYMBOL)==deal && (PositionGetInteger(POSITION_MAGIC)==Magic || Magic==-1) && (PositionGetInteger(POSITION_TYPE)==dir || dir==-1))
        {
         lot=iif(POSITION_TYPE_BUY==dir,LotBuy,LotSel);
         if(lot>=SymbolInfoDouble(deal,SYMBOL_VOLUME_MIN) && PositionGetDouble(POSITION_VOLUME)>lot)
           {
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
              {
               bool Cierre=trade.PositionClose(TicketPosition,-1);
               if(!Cierre)
                 {
                  PlaySound("::error.wav");
                  Print("Canot Close "+PositionGetString(POSITION_SYMBOL));
                  SimboloInfo.RefreshRates();
                  break;
                 }
              }
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
              {
               bool Cierre=trade.PositionClose(TicketPosition,-1);
               if(!Cierre)
                 {
                  PlaySound("::error.wav");
                  Print("Canot Close "+PositionGetString(POSITION_SYMBOL));
                  SimboloInfo.RefreshRates();
                  break;
                 }
              }
           }
        }
     }

   return(true);
  }
//---------------------------------------------
double CalcWhatLoss(int Magic,string deal,ENUM_POSITION_TYPE dir,ulong Ticket)
  {
   int i;
   double lossBig=0,lossSmall=0;
   double lotMin=0,LotAll=0;

   SimboloInfo.RefreshRates();
   for(i=PositionsTotal()-1; i>=0; i--)
     {
      if(IsStopped())
        {
         return false;
        }
      ulong TicketPosition=PositionGetTicket(i);

      if(TicketPosition==0)
        {
         Print("Error Select: ",__LINE__);
         SimboloInfo.RefreshRates();
         break;
        }
      //---------------------------------------------------
      if(PositionGetString(POSITION_SYMBOL)==deal && (PositionGetInteger(POSITION_MAGIC)==Magic || Magic==-1) && PositionGetInteger(POSITION_TYPE)==dir)
        {
         lossBig=PositionGetDouble(POSITION_PROFIT)+InfoPosition.Commission()+PositionGetDouble(POSITION_SWAP);//COMPROBAR COMMISION
         if(PositionGetDouble(POSITION_VOLUME)>iif(POSITION_TYPE_BUY==dir,LotBuy,LotSel) && lossBig<0 && TicketPosition !=Ticket) //remove first & last orders & all profit orders
           {
            lotMin=iif(POSITION_TYPE_BUY==dir,LotBuy,LotSel);
            LotAll =PositionGetDouble(POSITION_VOLUME);

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
double CalcProfits(int Magic,string sym,ENUM_POSITION_TYPE Dir) //
  {
   double profitloss=0.0;
   bool Err;

   while(true)
     {
      profitloss=0.0;
      Err=false;
      SimboloInfo.RefreshRates();
      for(int i=PositionsTotal()-1; i>=0; i--)
        {
         ulong TicketPosition=PositionGetTicket(i);
         if(TicketPosition==0)
           {
            Err=true;
            break;
           }
         if((PositionGetInteger(POSITION_TYPE)==Dir || Dir==-1) && ((PositionGetInteger(POSITION_MAGIC)==Magic || Magic==-1) && (PositionGetString(POSITION_SYMBOL)==sym || sym=="" || sym==NULL)))
           {
            profitloss+=PositionGetDouble(POSITION_PROFIT)+InfoPosition.Commission()+PositionGetDouble(POSITION_SWAP);
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
double GetMinLot(int Magic,string sym,ENUM_POSITION_TYPE Dir)
  {
   double Min=0.0;
   bool Err;

   while(true)
     {
      Min=DBL_MAX;
      Err=false;
      SimboloInfo.RefreshRates();
      for(int i=PositionsTotal()-1; i>=0; i--)
        {
         ulong TicketPosition=PositionGetTicket(i);

         if(TicketPosition==0)
           {
            Err=true;
            break;
           }
         if((PositionGetInteger(POSITION_TYPE)==Dir || Dir==-1) && ((PositionGetInteger(POSITION_MAGIC)==Magic || Magic==-1) && (PositionGetString(POSITION_SYMBOL)==sym || sym=="" || sym==NULL)))
           {
            if(PositionGetDouble(POSITION_VOLUME)<Min)
              {
               Min=PositionGetDouble(POSITION_VOLUME);
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
   return(DoubleToString(number,n));
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double NormalizeLot(double eLot,string sym)
  {
   double LotNrm,MinLot,LotStp;

   MinLot=SymbolInfoDouble(sym,SYMBOL_VOLUME_MIN);
   LotStp=SymbolInfoDouble(sym,SYMBOL_VOLUME_STEP);
   eLot=(double)NUM(eLot,6);//convert 1.000e-18 to 0.0
   LotNrm=(double)NUM(MathFloor(eLot/LotStp)*LotStp,6);
   if(MathAbs(LotNrm)<MinLot)
      return 0;
   return(LotNrm);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OrdersTotals(int Magic,string sym,ENUM_POSITION_TYPE Direction)
  {
   int x=0,i;
   bool error;

   while(true)
     {
      x=0;
      error=false;
      for(i=0; i<PositionsTotal(); i++)
        {
         ulong TicketPosition=PositionGetTicket(i);

         if(TicketPosition==0)
           {
            SimboloInfo.RefreshRates();
            error=true;
            break;
           }
         if((PositionGetInteger(POSITION_MAGIC)==Magic || Magic==-1) && (PositionGetInteger(POSITION_TYPE)==Direction || Direction==-1) && (PositionGetString(POSITION_SYMBOL)==sym || sym=="" || sym==NULL))
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
   ulong t1=0,t2=0,err;
   bool r;

   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong TicketPosition=PositionGetTicket(i);

        if(TicketPosition==0)
        {
         SimboloInfo.RefreshRates();
         return true;
        }

      if(PositionGetString(POSITION_SYMBOL)==sym && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY  && t1==0 && (PositionGetInteger(POSITION_MAGIC)==Magic || Magic==-1))
        {
         t1=TicketPosition;
        }

      if(PositionGetString(POSITION_SYMBOL)==sym && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && t2==0 && (PositionGetInteger(POSITION_MAGIC)==Magic || Magic==-1))
        {
         t2=TicketPosition;
        }

      if(t1>0 && t2>0)
        {
         r=trade.PositionCloseBy(t1,t2);
         Alert("Cierre de ciclo de genesis :)");
         SendMail("Cierre de ciclo de genesis :) de" + Symbol(),"Trabajando");
         PlaySound("::coin.wav");//eoo.wav
         err=GetLastError();
         if(err!=ERR_SUCCESS)
           {
            Print("PositionCloseBy() Error: ");
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
double getPrecioAperturaViejo(ENUM_POSITION_TYPE tipoOperacion)
  {
//Se busca el precio de apertura de la operacion abierta mas antigua
   double precioApertura = 0.0;
//Ordenes NO de cobertura abiertas
   for(int i = 0; i < PositionsTotal(); i++)
     {
      ulong TicketPosition=PositionGetTicket(i);

       if(TicketPosition!=0)
        {
         if(PositionGetString(POSITION_SYMBOL) == Symbol())
           {
            if(PositionGetInteger(POSITION_MAGIC) == MAGIC)
              {
               if(PositionGetInteger(POSITION_TYPE) == tipoOperacion)
                 {
                  precioApertura = PositionGetDouble(POSITION_PRICE_OPEN);
                  if(Debug)
                     Print("***** Op #" + (string)TicketPosition + " precioApertura " + (string)precioApertura);
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
double calculateLot(ENUM_POSITION_TYPE type, string symbol, int magic)
  {
   double   lot = 0;
   int    i = 0, orders = PositionsTotal();

   if(orders > 0)
     {
      for(i= orders - 1; i >= 0; i--)
        {
         ulong TicketPosition=PositionGetTicket(i);
         
         if(TicketPosition!=0)
           {
            if(PositionGetInteger(POSITION_TYPE) == type && PositionGetString(POSITION_SYMBOL)  == symbol && PositionGetInteger(POSITION_MAGIC) == magic)
               lot = lot + PositionGetDouble(POSITION_VOLUME);
           }
        }
     }

   return lot;
  }

//+------------------------------------------------------------------+
//| cuenta de operacion sell o buy                                   |
//+------------------------------------------------------------------+
int countOperation(ENUM_POSITION_TYPE type, string symbol, int magic)
  {
   int _countOrd = 0;

   for(int i = 0; i < PositionsTotal(); i++)
     {
      ulong TicketPosition=PositionGetTicket(i);
      if(PositionGetString(POSITION_SYMBOL) == symbol && PositionGetInteger(POSITION_TYPE) == type && PositionGetInteger(POSITION_MAGIC) == magic)
        {
         _countOrd++;
        }
     }
   return(_countOrd);
  }

//+------------------------------------------------------------------+
//|Realizar operación de bloque para el símbolo actual               |
//+------------------------------------------------------------------+
ulong makeBlockOperation(ENUM_POSITION_TYPE type, string symbol, int magic, double accumulation, double percentage, string number, int pip)
  {
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   color operationColor = type == POSITION_TYPE_BUY ? clrGreen : clrDarkOliveGreen;
   ENUM_POSITION_TYPE typeCalculate = type == POSITION_TYPE_BUY? POSITION_TYPE_SELL : POSITION_TYPE_BUY;
   double lotBlock = calculateLot(typeCalculate, symbol, magic);
   double openPrice = type == POSITION_TYPE_BUY ? NormalizeDouble(Ask, Digits()) : NormalizeDouble(Bid, Digits());
   string comment = type == POSITION_TYPE_BUY ? "BUY" : "SELL";
   double stoploss = type == POSITION_TYPE_BUY ? Ask - NormalizeDouble(pip * Point(), Digits()) : Bid + NormalizeDouble(pip * Point(), Digits());

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
   trade.SetExpertMagicNumber(MAGIC+1);
   bool Ejecuccion=false;
   if(type==POSITION_TYPE_BUY)
   Ejecuccion=trade.Buy(NormalizeDouble(lotBlock * percentage, 2),Symbol(),openPrice,stoploss,0,"BlockAccount" + comment + symbol + number); //magic + 1);
   else
   Ejecuccion=trade.Sell(NormalizeDouble(lotBlock * percentage, 2),Symbol(),openPrice,stoploss,0,"BlockAccount" + comment + symbol + number); //magic + 1);
   
   ulong Ticket=trade.ResultDeal();
   
   trade.SetExpertMagicNumber(MAGIC);
   
   return  Ticket;
  }

//+------------------------------------------------------------------+
//| Esta función calcula solo existe una operación de bloque única   |
//+------------------------------------------------------------------+
bool isUniqueBlockOperationByNumber(ENUM_POSITION_TYPE type, string symbol, string number)
  {
   bool isUnique = false;
   string comment = type == POSITION_TYPE_BUY ? "BUY" : "SELL";

   for(int i = 0; i < PositionsTotal(); i++)
     {
      ulong TicketPosition=PositionGetTicket(i);

      if(TicketPosition!=0)
        {
         if(PositionGetString(POSITION_COMMENT) == "BlockAccount" + comment + symbol + number)
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
bool isUniqueBlockOperation(ENUM_POSITION_TYPE type, string symbol)
  {
   bool isUnique = false;
   string comment = type == POSITION_TYPE_BUY ? "BUY" : "SELL";

   for(int i = 0; i < PositionsTotal(); i++)
     {
      ulong TicketPosition=PositionGetTicket(i);

      if(TicketPosition!=0)
        {
         if(PositionGetString(POSITION_COMMENT) == "BlockAccount" + comment + symbol + "1"
            || PositionGetString(POSITION_COMMENT) == "BlockAccount" + comment + symbol + "2"
            || PositionGetString(POSITION_COMMENT) == "BlockAccount" + comment + symbol + "3"
            || PositionGetString(POSITION_COMMENT) == "BlockAccount" + comment + symbol + "4"
            || PositionGetString(POSITION_COMMENT) == "BlockAccount" + comment + symbol + "5"
            || PositionGetString(POSITION_COMMENT) == "BlockAccount" + comment + symbol + "6"
            || PositionGetString(POSITION_COMMENT) == "BlockAccount" + comment + symbol + "7"
            || PositionGetString(POSITION_COMMENT) == "BlockAccount" + comment + symbol + "8")
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
   double point = (Digits() % 2 == 1)? Point() * 10 : Point();


   for(int i = 0; i < PositionsTotal(); i++)
     {
      ulong TicketPosition=PositionGetTicket(i);
      
      if(TicketPosition!=0)
        {
         if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY)
           {
            takeProfit = NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN) + (takeProfitPips * point), Digits());
           }

         if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL)
           {
            takeProfit = NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN) - (takeProfitPips * point), Digits());
           }

         if(takeProfit != 0 && PositionGetDouble(POSITION_VOLUME) == lot && PositionGetString(POSITION_SYMBOL) == symbol && PositionGetInteger(POSITION_MAGIC) == magic)
           {
            if(!trade.PositionModify(TicketPosition,PositionGetDouble(POSITION_SL),takeProfit))
              {
               Print("Order nro. " + (string)TicketPosition + " no pudo ser modificada para el take profit " + (string)takeProfit);
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
      makeBlockOperation(POSITION_TYPE_BUY, symbol, magic, amount, percentage1, "1", stoploss1);
      makeBlockOperation(POSITION_TYPE_SELL, symbol, magic, amount, percentage1, "5", stoploss1);
     }

   if(floating < 0 && floating <= blockOperation2 && floating > blockOperation3 && percentage1 > 0)
     {
      makeBlockOperation(POSITION_TYPE_BUY, symbol, magic, amount, percentage2, "2", stoploss2);
      makeBlockOperation(POSITION_TYPE_SELL, symbol, magic, amount, percentage2, "6", stoploss2);
     }

   if(floating < 0 && floating <= blockOperation3 && floating > blockOperation4 && percentage1 > 0)
     {
      makeBlockOperation(POSITION_TYPE_BUY, symbol, magic, amount, percentage3, "3", stoploss3);
      makeBlockOperation(POSITION_TYPE_SELL, symbol, magic, amount, percentage3, "7", stoploss3);
     }

   if(floating < 0 && floating <= blockOperation4 && percentage1 > 0)
     {
      makeBlockOperation(POSITION_TYPE_BUY, symbol, magic, amount, percentage4, "4", stoploss4);
      makeBlockOperation(POSITION_TYPE_SELL, symbol, magic, amount, percentage4, "8", stoploss4);
     }
  }
//+------------------------------------------------------------------+
//
void seguimientoTrailing(double pasoTrailingStopC, double distanciaTrailing, double profit, int magic, bool debug)
  {
   double nuevoSL = 0.0;
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
//Solo se evalua cuando el precio de ha movido los N pips que indica el PasoTrailingStopC
   SimboloInfo.RefreshRates();
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

   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {
      ulong TicketPosition=PositionGetTicket(i);
      if(TicketPosition!=0)
        {
         if(PositionGetString(POSITION_SYMBOL) == Symbol())
           {
            if(PositionGetInteger(POSITION_MAGIC) == magic )
              {
               //if (Debug) Print("***** Op Cobertura #" + (string)OrderTicket() + " OrderProfit: " + (string)OrderProfit());
               if(PositionGetDouble(POSITION_PROFIT) > 0)
                 {
                  //Se va a intentar mover el trailing stop
                  SimboloInfo.RefreshRates();
                  if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY && moverCompras)
                    {
                     //Si es compra, el precio actual - TrailingStopC
                     precioCompra = NormalizeDouble(Ask, Digits());
                     nuevoSL = precioCompra - distanciaTrailing;

                     // Si el stoploss supera el precio de apertura
                     if(PositionGetDouble(POSITION_PRICE_OPEN) < nuevoSL + profit)
                       {
                        continue;
                       }
                       
                     if(trade.PositionModify(TicketPosition,nuevoSL,0))
                       {
                        if(debug)
                           Print("***** Op Cobertura COMPRA #" + (string)TicketPosition + " se mueve su SL a " + (string)nuevoSL);
                       }
                     else
                       {
                        GetLastError();
                       }
                    }
                  if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL && moverVentas)
                    {
                     //Si es venta, el precio actual + TrailingStopC
                     precioVenta = NormalizeDouble(Bid, Digits());
                     nuevoSL = precioVenta + distanciaTrailing;

                     // Si el stoploss supera el precio de apertura
                     if(PositionGetDouble(POSITION_PRICE_OPEN) > nuevoSL + profit)
                       {
                        continue;
                       }

                     if(trade.PositionModify(TicketPosition,nuevoSL,0))
                       {
                        if(debug)
                           Print("***** Op Cobertura VENTA #" + (string)TicketPosition + " se mueve su SL a " + (string)nuevoSL);
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
