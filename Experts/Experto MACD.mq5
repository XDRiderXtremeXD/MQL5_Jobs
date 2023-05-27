//+------------------------------------------------------------------+
//|                                      Experto Histograma_MACD.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"


// LIBRERIA PARA GENERAR UNA ORDEN (SELL, BUY, BUY_STOP, ETC)
#include<Trade\Trade.mqh>
CTrade trade;

//SE DEFINEN LOS PARAMETROS DEL TRADE
input string Settings_Trades="***Settings_Trades***";
input double Lotes=0.01;

//SE DEFINEN LAS ALERTAS
input string Settings_Alerts="***Settings_Alerts***";
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=true;

//SE DEFINEN PARAMETROS Histograma_MACD
input string S1="------------------------Configuracion MACD------------------------";
input int Fast_Ema_Period=8;
input int Slow_Ema_Period=26;
input int Linea_Period=9;
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;

datetime TimeStart;// NOS SIRVE PARA PONER EL COMENTARIO A LAS OPERACIONES QUE OPERE EL Experto(OPCIONAL)

// ARRAY PARA GUARDAR LOS RATES DEL INSTRUMENTO EN EL QUE ESTA EL EA
MqlRates Rates[];
// ARRAY PARA GUARDAR LOS VALORES DEL HISTOGRAMA Y LA LINEA DEL MACD
double Histograma_MACD[],Linea_MACD[];
// VARIABLE PARA GUARDAR LA DEFINICION DEL MACD
int DefinitionMACD;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit() // ONINIT Esta funcion se inicia una sola vez y solo al iniciar el EA
  {
   // DEFINIMOS EL INDICADOR Histograma_MACD EN LA VARIABLE DefinitionMACD
   DefinitionMACD=iMACD(Symbol(),PERIOD_CURRENT,Fast_Ema_Period,Slow_Ema_Period,Linea_Period,Applied_Price_MACD);

   if(DefinitionMACD==INVALID_HANDLE)
      return(INIT_FAILED);

   // ESTABLECEMOS LOS ARRAY EN MODO ATEMPORAL PARA SU ACCSESO (0 SIGNIFICARA VELA ACTUAL - 1 VELA ANTERIOR - 2 VELA TRASANTERIOR.... ETC)
   ArraySetAsSeries(Histograma_MACD,true);
   ArraySetAsSeries(Linea_MACD,true);
   ArraySetAsSeries(Rates,true);

   TimeStart=TimeCurrent();

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick() /*ONTICK SE INICIA LUEGO DEL ONINIT Y FUNCIONA COMO UN BUCLE (SE REPITE VARIAS VECES... RECORRE HASTA EL ULTIMO CODIGO Y LUEGO VUELVE AL PRINCIPIO.. Y ASI ASI EN UN BUCLE
EVALUANDO DE NUEVO LAS SENTENCIAS)*/
  {
  // COPIAMOS EL RATES(close,open,high,low,time) DEL SIMBOLO EN EL QUE ESTA EL EA.. En el Arreglo Rates
   int copied=CopyRates(Symbol(),PERIOD_CURRENT,0,3,Rates);
   if(copied<=0)
      Print("Fallo al copiar los datos de precios ",GetLastError());

   //Copiamos los 3 ultimos valores de Histograma del MACD y De la Linea MACD en los arreglos Histograma_MACD y Linea_MACD
   CopyBuffer(DefinitionMACD,0,0,3,Histograma_MACD);
   CopyBuffer(DefinitionMACD,1,0,3,Linea_MACD);
   
   // Establecemos la variable PrevTime(Nos servira para que solo se abra una operacion a la vez por vela ..... ver (1) mas adelante)
   datetime static PrevTime=0;

   //Copiamos el ASK y BID Actual en las variables Ask y Bid
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   // RESETEAMOS EL ULTIMO ERROR (OPCIONAL: Sirve para borrar el historial del ultimo error)
   ResetLastError();

   // Establecemos Las variables Buy y Sell en 0... nos servira para saber cuantos Buy y Sell estan operando
   int Buy=0,Sell=0;

   for(int i=0; i<PositionsTotal(); i++) // Evaluamos todas las posiciones actuales
     {
      ulong Ticket=PositionGetTicket(i);// Seleccionamos la posicion
      
      // Si la posicion no es del Symbolo en el que esta el EA o No tiene el comentario del Experto.... Omite esta Posicion y salta a la siguiente posicion para ser evaluado
      if(PositionGetSymbol(i)!=Symbol() || PositionGetString(POSITION_COMMENT)!="Expert Final"+string(TimeStart))
         continue;
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)// Si la posicion es BUY.... Se suma la variable Buy (Buy=Buy +1)
         Buy++;
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)// Si la posicion es SELL.... Se suma la variable Buy (Sell=Sell +1)
         Sell++;
     }

   if(Histograma_MACD[2]<Linea_MACD[2] && Histograma_MACD[1]>Linea_MACD[1] && PrevTime!=Rates[0].time)
   /// SI El valor TrasAnterior del Histograma es MENOR al valor Trasanterior de La Linea_MACD del Histograma_MACD Y
   //SI El valor Anterior del Histograma es MAYOR al valor Anterior de La Linea_MACD del Histograma_MACD
   // Y Prevtime no es igual al Tiempo de la vela actual
     {
      Cerrar(POSITION_TYPE_SELL);/// ---> Cerrar todas las posiciones SELL del Simbolo en el que esta el EA
      if(Buy==0) // Si no hay Buys que ha operado el EA en el Simbolo en que esta
        {
         // Operamos Buy con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
         bool BuyTradeBool=trade.Buy(Lotes,Symbol(),Ask,0,0,"Expert Final"+string(TimeStart));
         // Si la operacion fue exitosa
         if(BuyTradeBool)
           {
            PrevTime=Rates[0].time;// PrevTime se iguala al tiempo Actual de la Vela (1)... Nos servira para que ya no opere mas en esta vela
            if(AlertPC)// Si Alerta PC esta activada
               Alert("Operacion Buy en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));// Se emite la alerta PC
            if(AlertMovil)// Si Alerta Movil esta activada
               SendNotification("Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));// Se emite la alerta MOVIL
            if(AlertMail)// Si Alerta Mail esta activada
               SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Buy en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));// Se emite la alerta MAIL
           }
         // Si no fue exitosa
         else
            Print("ERROR (No abrio Operacion):",GetLastError()); // Imprimera el error en el registro
        }
     }

   if(Histograma_MACD[2]>Linea_MACD[2] && Histograma_MACD[1]<Linea_MACD[1]  && PrevTime!=Rates[0].time)
     {
   /// SI El valor TrasAnterior del Histograma es MAYOR al valor Trasanterior de La Linea_MACD del Histograma_MACD Y
   //SI El valor Anterior del Histograma es MENOR al valor Anterior de La Linea_MACD del Histograma_MACD
   // Y Prevtime no es igual al Tiempo de la vela actual
      Cerrar(POSITION_TYPE_BUY);/// ---> Cerrar todas las posiciones BUY del Simbolo en el que esta el EA
      
      if(Sell==0)// Si no hay Sells que ha operado el EA en el Simbolo en que esta
        {        
        // Operamos Sell con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
         bool SellTradeBool=trade.Sell(Lotes,Symbol(),Bid,0,0,"Expert Final"+string(TimeStart));
         // Si la operacion fue exitosa
         if(SellTradeBool)
           {
            PrevTime=Rates[0].time;// PrevTime se iguala al tiempo Actual de la Vela (1)... Nos servira para que ya no opere mas en esta vela
            if(AlertPC)// Si Alerta PC esta activada
               Alert("Operacion Sell en ",Symbol()," ",EnumToString((ENUM_TIMEFRAMES)Period()));// Se emite la alerta PC
            if(AlertMovil)// Si Alerta Movil esta activada
               SendNotification("Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));// Se emite la alerta MOVIL
            if(AlertMail)// Si Alerta Mail esta activada
               SendMail("Experto "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()),"Operacion Sell en "+Symbol()+" "+EnumToString((ENUM_TIMEFRAMES)Period()));// Se emite la alerta MAIL
           }
         // Si no fue exitosa
         else
            Print("ERROR (No abrio Operacion):",GetLastError());// Imprimera el error en el registro
        }
     }
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cerrar(ENUM_POSITION_TYPE TipoOrden)// FUNCION CERRAR OPERACIONES Con Variable Tipo Orden
  {
   for(int i=0; i<PositionsTotal(); i++) // Evaluamos todas las posiciones
     {
      ulong Ticket=PositionGetTicket(i); // Seleccionamos la posicion
      // Si la posicion no pertenece al EA o No es del Simbolo en el que esta el EA ... Lo omite y salta a la siguiente posicion para ser evaluado
      if(PositionGetSymbol(i)!=Symbol() || PositionGetString(POSITION_COMMENT)!="Expert Final"+string(TimeStart))
      continue;
      
      if(PositionGetInteger(POSITION_TYPE)==TipoOrden) // Si la posicion Evaluada es igual al tipo de Posicion de la variable Tipo Orden
        {
         trade.PositionClose(Ticket,-1); // Cierra la posicion
        }
     }
  }
//+------------------------------------------------------------------+
