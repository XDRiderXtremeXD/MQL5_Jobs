//+------------------------------------------------------------------+
//|                                          Martingala 2 trends.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

int LoginCliente = 51055646;
string NombreDelRobot = "Robot EA";
datetime FechaVencimiento = D'05.12.2021';

// LIBRERIA PARA GENERAR UNA ORDEN (SELL, BUY, BUY_STOP, ETC)
#include<Trade\Trade.mqh>
CTrade trade;

enum Operacion_Inicio
  {
   BUY=0,
   SELL=1,
  };

enum M_I
  {
   SUMA=0,
   MULTIPLICACION=1,
  };


//SE DEFINEN LOS PARAMETROS DEL TRADE
input string Settings_Trades="***Settings_Trades***";
input Operacion_Inicio FIRST_ORDER=BUY;
input M_I Modo_Incremento=SUMA;
input double Lote_Inicial=0.01;
input double Incremento=0.01;
input int MagicNumber=222222;
input double TP_Global=20;
//SE DEFINEN PARAMETROS Histograma_MACD
input string S5="-----------------------   Configuracion Medias Moviles  ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input ENUM_TIMEFRAMES Periodo_EMA=PERIOD_M1;
input int Fast_Ma_Periodo=14;
input int Slow_Ma_Periodo=24;
input int Ma_Shift=0;
input ENUM_MA_METHOD Ma_Method=MODE_EMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;

// ARRAY PARA GUARDAR LOS RATES DEL INSTRUMENTO EN EL QUE ESTA EL EA
MqlRates Rates[];
// ARRAY PARA GUARDAR LOS VALORES DEL HISTOGRAMA Y LA LINEA DEL MACD
double SLOW[],FAST[];
// VARIABLE PARA GUARDAR LA DEFINICION DEL MACD
int FastEma;
int SlowEma;

int DigitosVolumen=0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit() // ONINIT Esta funcion se inicia una sola vez y solo al iniciar el EA
  {
   DigitosVolumen=0;

   if(AccountInfoInteger(ACCOUNT_LOGIN) != LoginCliente)
     {
      MessageBox("Cuenta no válida. Comunicarse con el +57 310 7535705",NombreDelRobot, 0);
      ExpertRemove();
     }

   if(Fast_Ma_Periodo>=Slow_Ma_Periodo)
     {
      Alert("El periodo Fast tiene que ser menor al periodo Slow");
      return(INIT_PARAMETERS_INCORRECT);
     }




   double Division=Lote_Inicial/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
   int DivisionInt=(int)Division;

   if(Division-DivisionInt>0)
     {
      Alert("Lote no es compatible o divisible con el symbolo step permitido para este simbolo");
      Alert("Tiene que se un numero divisible entre ",SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP));
      return(INIT_PARAMETERS_INCORRECT);
     }

   double Maximo=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);
   double Minimo=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);

   if(Lote_Inicial>Maximo || Lote_Inicial<Minimo)
     {
      Alert("Lote supera el lote maximo permitido para este simbolo o es Menor al Lote minimo permitido");
      return(INIT_PARAMETERS_INCORRECT);
     }


   while(int(Minimo)<=0)
     {
      DigitosVolumen++;
      Minimo=Minimo*10;
     }


// DEFINIMOS EL INDICADOR Histograma_MACD EN LA VARIABLE DefinitionMACD
   FastEma=iMA(Symbol(),Periodo_EMA,Fast_Ma_Periodo,Ma_Shift,Ma_Method,Ma_AppliedPrice);
   SlowEma=iMA(Symbol(),Periodo_EMA,Slow_Ma_Periodo,Ma_Shift,Ma_Method,Ma_AppliedPrice);

   if(FastEma==INVALID_HANDLE)
      return(INIT_FAILED);

   if(SlowEma==INVALID_HANDLE)
      return(INIT_FAILED);

   trade.SetExpertMagicNumber(MagicNumber);

// ESTABLECEMOS LOS ARRAY EN MODO ATEMPORAL PARA SU ACCSESO (0 SIGNIFICARA VELA ACTUAL - 1 VELA ANTERIOR - 2 VELA TRASANTERIOR.... ETC)
   ArraySetAsSeries(SLOW,true);
   ArraySetAsSeries(FAST,true);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick() /*ONTICK SE INICIA LUEGO DEL ONINIT Y FUNCIONA COMO UN BUCLE (SE REPITE VARIAS VECES... RECORRE HASTA EL ULTIMO CODIGO Y LUEGO VUELVE AL PRINCIPIO.. Y ASI ASI EN UN BUCLE
EVALUANDO DE NUEVO LAS SENTENCIAS)*/
  {
   Validacion();


// COPIAMOS EL RATES(close,open,high,low,time) DEL SIMBOLO EN EL QUE ESTA EL EA.. En el Arreglo Rates
   int copied=CopyRates(Symbol(),Periodo_EMA,0,3,Rates);
   if(copied<=0)
      Print("Fallo al copiar los datos de precios ",GetLastError());

   static datetime TiempoBarra=0;

   CopyBuffer(FastEma,0,0,3,SLOW);
   CopyBuffer(SlowEma,0,0,3,FAST);

   CerrarOperaciones();

   if(Rates[0].time!=TiempoBarra)
     {
      //Copiamos los 3 ultimos valores de Histograma del MACD y De la Linea MACD en los arreglos Histograma_MACD y Linea_MACD

      // Establecemos la variable PrevTime(Nos servira para que solo se abra una operacion a la vez por vela ..... ver (1) mas adelante)
      datetime static PrevTime=0;

      //Copiamos el ASK y BID Actual en las variables Ask y Bid
      double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
      double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

      // RESETEAMOS EL ULTIMO ERROR (OPCIONAL: Sirve para borrar el historial del ultimo error)
      ResetLastError();

      // Establecemos Las variables Buy y Sell en 0... nos servira para saber cuantos Buy y Sell estan operando

      int Buy=0,Sell=0;
      int Operaciones=0;

      for(int i=0; i<PositionsTotal(); i++) // Evaluamos todas las posiciones actuales
        {
         ulong Ticket=PositionGetTicket(i);// Seleccionamos la posicion

         // Si la posicion no es del Symbolo en el que esta el EA o No tiene el comentario del Experto.... Omite esta Posicion y salta a la siguiente posicion para ser evaluado
         if(PositionGetSymbol(i)!=Symbol() || PositionGetInteger(POSITION_MAGIC)!=MagicNumber)
            continue;
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)// Si la posicion es BUY.... Se suma la variable Buy (Buy=Buy +1)
            Buy++;
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)// Si la posicion es SELL.... Se suma la variable Buy (Sell=Sell +1)
            Sell++;
        }

      Operaciones=Buy+Sell;

      if((Operaciones==0 && FIRST_ORDER==BUY) || Operaciones>0)
         if(SLOW[2]<FAST[2] && SLOW[1]>FAST[1])
            /// SI El valor TrasAnterior del Histograma es MENOR al valor Trasanterior de La Linea_MACD del Histograma_MACD Y
            //SI El valor Anterior del Histograma es MAYOR al valor Anterior de La Linea_MACD del Histograma_MACD
            // Y Prevtime no es igual al Tiempo de la vela actual
           {
            double Lotes=GetLote(Operaciones);
            // Operamos Buy con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
            bool BuyTradeBool=trade.Buy(Lotes,Symbol(),Ask,0,0," ");
            // Si la operacion no fue exitosa
            if(!BuyTradeBool)
               Print("ERROR (No abrio Operacion):",GetLastError()); // Imprimera el error en el registro

           }


      if((Operaciones==0 && FIRST_ORDER==SELL) || Operaciones>0)
         if(SLOW[2]>FAST[2] && SLOW[1]<FAST[1])
           {
            double Lotes=GetLote(Operaciones);
            /// SI El valor TrasAnterior del Histograma es MAYOR al valor Trasanterior de La Linea_MACD del Histograma_MACD Y
            //SI El valor Anterior del Histograma es MENOR al valor Anterior de La Linea_MACD del Histograma_MACD
            // Y Prevtime no es igual al Tiempo de la vela actual

            // Operamos Sell con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
            bool SellTradeBool=trade.Sell(Lotes,Symbol(),Bid,0,0," ");
            // Si la operacion no fue exitosa
            if(!SellTradeBool)
               Print("ERROR (No abrio Operacion):",GetLastError()); // Imprimera el error en el registro

           }
      TiempoBarra=Rates[0].time;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetLote(int Nivel)
  {
   double Lote=0;

   if(Modo_Incremento==SUMA)
      Lote=Lote_Inicial+Incremento*Nivel;
   else
      Lote=Lote_Inicial*MathPow(Incremento,Nivel);
   
   NormalizeDouble(Lote,DigitosVolumen);
   
   double Division=Lote/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
   int DivisionInt=(int)Division;

   if(Division-DivisionInt>0)
     {
      Print("Lote no es compatible o divisible con el symbolo step permitido para este simbolo");
      Print("Igualando al lote cercano Pemitido");
      Lote=DivisionInt*SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
     }

   double Maximo=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);

   if(Lote>Maximo)
     {
      Lote=Maximo;
      Print("Lote supera el lote maximo permitido para este simbolo");
      Print("Igualando al lote maximo");
     }
    NormalizeDouble(Lote,DigitosVolumen);
    
   return Lote;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarOperaciones()
  {

   ulong Tickets[];
   ArrayResize(Tickets,0);

   for(int i=0; i<PositionsTotal(); i++) // Evaluamos todas las posiciones actuales
     {
      ulong Ticket=PositionGetTicket(i);// Seleccionamos la posicion

      // Si la posicion no es del Symbolo en el que esta el EA o No tiene el comentario del Experto.... Omite esta Posicion y salta a la siguiente posicion para ser evaluado
      if(PositionGetSymbol(i)!=Symbol() || PositionGetInteger(POSITION_MAGIC)!=MagicNumber)
         continue;
      int Size=ArraySize(Tickets);
      ArrayResize(Tickets,Size+1);
      Tickets[Size]=Ticket;
     }

   int Size=ArraySize(Tickets);

   double Profit=0;

   for(int i=0; i<Size; i++)
     {
      bool Seleccion=PositionSelectByTicket(Tickets[i]);
      if(Seleccion)
        {
         Profit=Profit+PositionGetDouble(POSITION_PROFIT);
        }
     }

   if(Profit>=TP_Global)
     {
      for(int i=0; i<Size; i++)
        {
         bool Seleccion=PositionSelectByTicket(Tickets[i]);
         if(Seleccion)
           {
            trade.PositionClose(Tickets[i],-1);
           }
        }
     }

  }
//+------------------------------------------------------------------+


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
