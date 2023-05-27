//+------------------------------------------------------------------+
//|                               EA Manuel Andrés olivero Pérez.mq5 |
//|                           Copyright 2021,Rubén Blanco Fernández. |
//|                             https://www.mql5.com/en/users/vaklam |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021,Rubén Blanco Fernández."
#property link      "https://www.mql5.com/en/users/vaklam"
#property version   "1.00"

//+------------------------------------------------------------------+
//| Include                                                          |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>
#include <Trade\PositionInfo.mqh>
#include <Trade\AccountInfo.mqh>
#include <Trade\OrderInfo.mqh>
//+------------------------------------------------------------------+
//| Objetos                                                          |
//+------------------------------------------------------------------+
CTrade Trade;
CPositionInfo Posicion;
CAccountInfo Cuenta;
COrderInfo Orden;


enum Tipo_Ope
  {
   BUYS_SELLS=0,
   SOLO_BUYS=1,
   SOLO_SELLS=2,
  };

//+------------------------------------------------------------------+
//| Inputs                                                           |
//+------------------------------------------------------------------+
input string   _           ="===Main Config===";
input Tipo_Ope Type_Orders=BUYS_SELLS;
input double   Lots        =0.01;
input int      FirstTP     =5000;
input int      SecondTP    =5000;
input double   Incremental =1.5;
input ulong    MagicNumber =1001;
input string S8="=== Configuracion RSI ===";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Activar_Filtro=true;
input int NivelBuy=30;
input int NivelSell=70;
input int RSI_Periodo=14;
input ENUM_APPLIED_PRICE RSI_Applied_Price=PRICE_CLOSE;

//+------------------------------------------------------------------+
//| Variables                                                        |
//+------------------------------------------------------------------+
int LoginCliente = 3090543;
string NombreDelRobot = "Robot EA";
datetime FechaVencimiento = D'01.12.2021';
double RangoLong1 = 0;
double RangoLong2 = 0;
double RangoShort1 = 0;
double RangoShort2 = 0;


int      totalb,totals;
double   lowestBuy,highestSell;
ulong    lastOrder;
bool     resizeLastOrder;

MqlTradeRequest   mqlRequest;
MqlTradeResult    mqlResult;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(AccountInfoInteger(ACCOUNT_LOGIN) != LoginCliente)
     {
      MessageBox("Cuenta no válida. Comunicarse con el +57 310 7535705",NombreDelRobot, 0);
      ExpertRemove();
     }
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   Validacion();
   getGridInfo();

   if(resizeLastOrder==1)
      resizeOrder();
   else
      if(resizeLastOrder==0)
        {
         openOrder();
         closePositiveSinglePosition();
         MoverTP();
        }

   Comment(
      "\n| Total Buy: ",totalb,
      "\n| Total Sell: ",totals,
      "\n| Lowest Buy: ",lowestBuy,
      "\n| Highest Sell: ",highestSell
   );
  }
//+------------------------------------------------------------------+
//| Resize Order function                                            |
//+------------------------------------------------------------------+
void resizeOrder()
  {
   ZeroMemory(mqlRequest);
   ZeroMemory(mqlResult);
   for(int cnt=0; cnt<PositionsTotal(); cnt++)
     {
      ulong  position_ticket=PositionGetTicket(cnt);
      if(position_ticket==lastOrder && PositionGetInteger(POSITION_MAGIC)==MagicNumber)
        {
         if(PositionGetInteger(POSITION_TYPE)==ORDER_TYPE_BUY)
           {
            mqlRequest.action   =TRADE_ACTION_DEAL;
            mqlRequest.symbol   =PositionGetString(POSITION_SYMBOL);
            mqlRequest.position =position_ticket;
            mqlRequest.volume   =NormalizeDouble(SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN),2);
            mqlRequest.type     =ORDER_TYPE_SELL;
            mqlRequest.price    =SymbolInfoDouble(Symbol(),SYMBOL_BID);
            mqlRequest.deviation=5;
            mqlRequest.magic    =MagicNumber;
            mqlRequest.comment  =NombreDelRobot;
            if(!OrderSend(mqlRequest,mqlResult))
               PrintFormat("CloseOrder error %d",GetLastError());
            else
               resizeLastOrder=0;
            return;
           }
         if(PositionGetInteger(POSITION_TYPE)==ORDER_TYPE_SELL)
           {
            mqlRequest.action   =TRADE_ACTION_DEAL;
            mqlRequest.symbol   =PositionGetString(POSITION_SYMBOL);
            mqlRequest.position =position_ticket;
            mqlRequest.volume   =NormalizeDouble(SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN),2);
            mqlRequest.type     =ORDER_TYPE_BUY;
            mqlRequest.price    =SymbolInfoDouble(Symbol(),SYMBOL_ASK);
            mqlRequest.deviation=5;
            mqlRequest.magic    =MagicNumber;
            mqlRequest.comment  =NombreDelRobot;
            if(!OrderSend(mqlRequest,mqlResult))
               PrintFormat("CloseOrder error %d",GetLastError());
            else
               resizeLastOrder=0;
            return;
           }
        }
     }
  }
//+------------------------------------------------------------------+
//| Generate lots function                                           |
//+------------------------------------------------------------------+
double generateLots(int level)
  {
   double result=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);

   result=result+MathPow(Lots,level);

   return result;
  }
//+------------------------------------------------------------------+
//| Open order function                                              |
//+------------------------------------------------------------------+
void openOrder()
  {

   double RSI_Buffer[];
   int RSI=iRSI(Symbol(),PERIOD_CURRENT,RSI_Periodo,RSI_Applied_Price);
   CopyBuffer(RSI,0,0,2,RSI_Buffer);
   ArraySetAsSeries(RSI_Buffer,true);
   
   if(((totalb==0 && ((Activar_Filtro && RSI_Buffer[0]<NivelBuy) || !Activar_Filtro)) || (totalb>0 && SymbolInfoDouble(Symbol(),SYMBOL_ASK)<lowestBuy-FirstTP*Point()))
      && (Type_Orders==BUYS_SELLS || Type_Orders==SOLO_BUYS))
     {
      ZeroMemory(mqlRequest);
      ZeroMemory(mqlResult);
      mqlRequest.action   =TRADE_ACTION_DEAL;
      mqlRequest.symbol   =Symbol();
      mqlRequest.volume   =NormalizeDouble(generateLots(totalb),2);
      mqlRequest.type     =ORDER_TYPE_BUY;
      mqlRequest.price    =SymbolInfoDouble(Symbol(),SYMBOL_ASK);
      mqlRequest.magic    =MagicNumber;
      mqlRequest.comment  =NombreDelRobot;
      mqlRequest.tp       =SymbolInfoDouble(Symbol(),SYMBOL_ASK)+FirstTP*Point();
      if(!OrderSend(mqlRequest,mqlResult))
         PrintFormat("OrderSend error %d",GetLastError());
      else
        {
         lastOrder=mqlResult.order;
         resizeLastOrder=1;
         return;
        }
     }
   if(((totals==0 && ((Activar_Filtro && RSI_Buffer[0]>NivelSell) || !Activar_Filtro)) || (totals>0 && SymbolInfoDouble(Symbol(),SYMBOL_BID)>highestSell+FirstTP*Point()))
      && (Type_Orders==BUYS_SELLS || Type_Orders==SOLO_SELLS))
     {
      ZeroMemory(mqlRequest);
      ZeroMemory(mqlResult);
      mqlRequest.action   =TRADE_ACTION_DEAL;
      mqlRequest.symbol   =Symbol();
      mqlRequest.volume   =NormalizeDouble(generateLots(totals),2);
      mqlRequest.type     =ORDER_TYPE_SELL;
      mqlRequest.price    =SymbolInfoDouble(Symbol(),SYMBOL_BID);
      mqlRequest.magic    =MagicNumber;
      mqlRequest.comment  =NombreDelRobot;
      mqlRequest.tp       =SymbolInfoDouble(Symbol(),SYMBOL_ASK)-FirstTP*Point();
      if(!OrderSend(mqlRequest,mqlResult))
         PrintFormat("OrderSend error %d",GetLastError());
      else
        {
         lastOrder=mqlResult.order;
         resizeLastOrder=1;
         return;
        }
     }
  }
//+------------------------------------------------------------------+
//| Get grid info function                                           |
//+------------------------------------------------------------------+
void getGridInfo()
  {
   totalb=0;
   totals=0;
   lowestBuy=999999999999;
   highestSell=0;
   for(int cnt=0; cnt<PositionsTotal(); cnt++)
     {
      ulong  position_ticket=PositionGetTicket(cnt);
      if(PositionGetInteger(POSITION_MAGIC)==MagicNumber)
        {
         if(PositionGetInteger(POSITION_TYPE)==ORDER_TYPE_BUY)
           {
            totalb++;
            if(lowestBuy>PositionGetDouble(POSITION_PRICE_OPEN))
               lowestBuy=PositionGetDouble(POSITION_PRICE_OPEN);
           }
         if(PositionGetInteger(POSITION_TYPE)==ORDER_TYPE_SELL)
           {
            totals++;
            if(highestSell<PositionGetDouble(POSITION_PRICE_OPEN))
               highestSell=PositionGetDouble(POSITION_PRICE_OPEN);
           }
        }
     }
  }
//+------------------------------------------------------------------+
//| Close positive single position function                          |
//+------------------------------------------------------------------+
void closePositiveSinglePosition()
  {
   for(int cnt=0; cnt<PositionsTotal(); cnt++)
     {
      ulong  position_ticket=PositionGetTicket(cnt);
      if(PositionGetInteger(POSITION_MAGIC)==MagicNumber)
        {
         if(PositionGetInteger(POSITION_TYPE)==ORDER_TYPE_BUY && totalb==1
            && SymbolInfoDouble(Symbol(),SYMBOL_BID)>=PositionGetDouble(POSITION_PRICE_OPEN)+FirstTP*Point())
           {
            mqlRequest.action   =TRADE_ACTION_DEAL;
            mqlRequest.symbol   =PositionGetString(POSITION_SYMBOL);
            mqlRequest.position =position_ticket;
            mqlRequest.volume   =NormalizeDouble(PositionGetDouble(POSITION_VOLUME),2);
            mqlRequest.type     =ORDER_TYPE_SELL;
            mqlRequest.price    =SymbolInfoDouble(Symbol(),SYMBOL_BID);
            mqlRequest.deviation=5;
            mqlRequest.comment  =NombreDelRobot;
            mqlRequest.magic    =MagicNumber;
            if(!OrderSend(mqlRequest,mqlResult))
               PrintFormat("CloseOrder error %d",GetLastError());
            else
               return;
           }
         if(PositionGetInteger(POSITION_TYPE)==ORDER_TYPE_SELL && totals==1
            && SymbolInfoDouble(Symbol(),SYMBOL_ASK)<=PositionGetDouble(POSITION_PRICE_OPEN)-FirstTP*Point())
           {
            ZeroMemory(mqlRequest);
            ZeroMemory(mqlResult);
            mqlRequest.action   =TRADE_ACTION_DEAL;
            mqlRequest.symbol   =PositionGetString(POSITION_SYMBOL);
            mqlRequest.position =position_ticket;
            mqlRequest.volume   =NormalizeDouble(PositionGetDouble(POSITION_VOLUME),2);
            mqlRequest.type     =ORDER_TYPE_BUY;
            mqlRequest.price    =SymbolInfoDouble(Symbol(),SYMBOL_ASK);
            mqlRequest.deviation=5;
            mqlRequest.comment  =NombreDelRobot;
            mqlRequest.magic    =MagicNumber;
            if(!OrderSend(mqlRequest,mqlResult))
               PrintFormat("CloseOrder error %d",GetLastError());
            else
               return;
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Validacion()
  {
   if(TimeCurrent() > FechaVencimiento)
     {
      MessageBox("El robot ha caducado. Comunicarse con el +57 310 7535705",
                 NombreDelRobot, 0);
      ExpertRemove();
     }
  }
//+------------------------------------------------------------------+
//| Procedimiento para mover el Take Profit                          |
//+------------------------------------------------------------------+
void MoverTP()
  {
   double BreakevenBuy = 0;
   double BreakevenSell = 0;
   int NumPosicionesBuy = 0;
   int NumPosicionesSell = 0;
   double NumBuy = 0;
   double DenBuy = 0;
   double NumSell = 0;
   double DenSell = 0;
   PosicionesDelEA(NumPosicionesBuy, NumPosicionesSell, NumBuy, DenBuy, NumSell, DenSell);
   BuscarBreakeven(NumPosicionesBuy, NumPosicionesSell, NumBuy, DenBuy, NumSell, DenSell,
                   BreakevenBuy, BreakevenSell);
//---Mover el TP de las posiciones Buy
   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {
      Posicion.SelectByIndex(i);
      if(Posicion.Magic() == MagicNumber &&
         Posicion.PositionType() == POSITION_TYPE_BUY &&
         NumPosicionesBuy >= 2)
        {
         double TakeProfit = NormalizeDouble(BreakevenBuy + SecondTP * Point(),
                                             (int)SymbolInfoInteger(Symbol(), SYMBOL_DIGITS));
         if(Posicion.TakeProfit() != TakeProfit)
            Trade.PositionModify(Posicion.Ticket(), 0, TakeProfit);
        }
     }
//---Mover el TP de las posiciones Sell
   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {
      Posicion.SelectByIndex(i);
      if(Posicion.Magic() == MagicNumber &&
         Posicion.PositionType() == POSITION_TYPE_SELL &&
         NumPosicionesSell >= 2)
        {
         double TakeProfit = NormalizeDouble(BreakevenSell - SecondTP * Point(),
                                             (int)SymbolInfoInteger(Symbol(), SYMBOL_DIGITS));
         if(Posicion.TakeProfit() != TakeProfit)
            Trade.PositionModify(Posicion.Ticket(), 0, TakeProfit);
        }
     }
  }
//+------------------------------------------------------------------+
//| Procedimiento que busca las posiciones del EA                    |
//+------------------------------------------------------------------+
void PosicionesDelEA(int &PosBuy, int &PosSell, double & NumBuy, double & DenBuy, double & NumSell, double & DenSell)
  {
//---Cuántas posiciones Buy y Sell hay del EA?
   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {
      Posicion.SelectByIndex(i);
      if(Posicion.Magic() == MagicNumber)
        {
         if(Posicion.PositionType() == POSITION_TYPE_BUY)
           {
            //---Incremento el número de posiciones Buy
            PosBuy++;
            //---Numerador = Numerador + Precio*Volumen
            NumBuy = NumBuy + Posicion.PriceOpen() * Posicion.Volume();
            //Denominador = Denominador + Volumen
            DenBuy = DenBuy + Posicion.Volume();
           }
         else
           {
            //---Incremento el número de posiciones Sell
            PosSell++;
            //---Numerador = Numerador + Precio*Volumen
            NumSell = NumSell + Posicion.PriceOpen() * Posicion.Volume();
            //Denominador = Denominador + Volumen
            DenSell = DenSell + Posicion.Volume();
           }
        }
     }
  }
//+------------------------------------------------------------------+
//| Procedimiento que busca el breakeven de las posiciones del mismo |
//| sentido. Breakeven de las posiciones Buy y breakeven de las Sell |
//+------------------------------------------------------------------+
void BuscarBreakeven(int PosBuy, int PosSell, double & NumBuy, double & DenBuy, double & NumSell, double & DenSell,
                     double & BreakevenBuy, double & BreakevenSell)
  {
//---Si el número de posiciones Buy < 2, no hago nada
   if(PosBuy >= 2 && DenBuy != 0)
     {
      BreakevenBuy = NumBuy / DenBuy;
      ObjectDelete(0, "BreakevenBuy");
      ObjectCreate(0, "BreakevenBuy", OBJ_HLINE, 0, TimeCurrent(), BreakevenBuy);
      ObjectSetInteger(0, "BreakevenBuy", OBJPROP_COLOR, clrChartreuse);
     }
//---Si el número de posiciones Sell < 2, no hago nada
   if(PosSell >= 2 && DenSell != 0)
     {
      BreakevenSell = NumSell / DenSell;
      ObjectDelete(0, "BreakevenSell");
      ObjectCreate(0, "BreakevenSell", OBJ_HLINE, 0, TimeCurrent(), BreakevenSell);
      ObjectSetInteger(0, "BreakevenSell", OBJPROP_COLOR, clrLightCoral);
     }
  }
//+------------------------------------------------------------------+
