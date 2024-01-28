//+------------------------------------------------------------------+
//|                                           Experto_Patrones_3.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;

#resource "\\Indicators\\IP3\\Patrones16062023.ex5"

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


enum Tipo_Martingala
  {
   suma=0,
   multiplicador=1,
  };


input string S0="---------- CONF TRADES ------------";//------------------------------------------------------------------
input ENUM_TIMEFRAMES Periodo=PERIOD_CURRENT;
input double lote=0.01;
input int NumeroMagico=22222;
input string comentario="EXPERTO";
input string S11="---------- CONF HORARIO ------------";//------------------------------------------------------------------
input ENUM_Horas  Hora_Inicio=_0am;
input int Minuto_Inicio=0;
input ENUM_Horas Hora_Final=_0am;
input int Minuto_Final=0;
input string S112="---------- CONF MARTINGALA ------------";//------------------------------------------------------------------
input bool Aplicar_Martingala=true;
input Tipo_Martingala tipo_Martingala=suma;//Tipo Martingala
input double Coeficiente_Aumento=0.001;//Coeficiente Aumento
input string S1="---------- NIVELES FIBBONACI ------------";//------------------------------------------------------------------
input double nivel_fibonnaci_2da_operacion=0.25;
input double nivel_fibonnaci_TP=2.25;
input double nivel_fibonnaci_SL=-1.00;
input bool Ver_Fibo=true;
input color Color_Fibonacci=clrAqua;
input string S111="---------- PROFIT/STOP DIARIO ------------";//------------------------------------------------------------------
input double Profit=100;
input double StopLoss=10;
input string S2="---------- BANDA BOLLINGER ------------";//------------------------------------------------------------------
input int BB_Period=25;
input double BB_Deviation=2;
input int BB_Shift=0;
input ENUM_APPLIED_PRICE BB_AppliedPrice=PRICE_CLOSE;
input string S3="------------- SPARTAN ------------";//------------------------------------------------------------------
input bool aplicar_Filtro=false;
input int Periodo_Spartan=14;

int handle=0;
MqlRates rates[];
double BUY[];
double SELL[];

int posLast=0;
string Fibo="FIBO 2023";
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(!ControlParametrosLote())
      return INIT_FAILED;


   posLast=0;
   handle=iCustom(Symbol(),Periodo,"::Indicators\\IP3\\Patrones16062023.ex5",S1,BB_Period,BB_Deviation,BB_Shift,BB_AppliedPrice,
                  S2,
                  aplicar_Filtro,
                  Periodo_Spartan,
                  "",false,false,false);
   ArraySetAsSeries(rates,true);
   ArraySetAsSeries(BUY,true);
   ArraySetAsSeries(SELL,true);

   trade.SetExpertMagicNumber(NumeroMagico);
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectDelete(0,Fibo);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   int barras_actuales=LoadBarsFromSymbol(Symbol(),Periodo);

   static int barLast=barras_actuales;

   int copiaBarras=10;

   if(CondicionProfitStop())
      if(EvaluarHorario(Hora_Inicio,Hora_Final,Minuto_Inicio,Minuto_Final,TimeCurrent()))
         if(barras_actuales!=barLast)
           {
            if(CopyRates(NULL,Periodo,0,copiaBarras,rates)>0)
              {

               if(BarsCalculated(handle)==barras_actuales)
                 {
                  if(CopyBuffer(handle,1,0,3,BUY)>0 && CopyBuffer(handle,0,0,3,SELL)>0)
                    {
                     double highest=iHigh(Symbol(),Periodo,(iHighest(Symbol(),Periodo,MODE_HIGH,2,1)));
                     double lowest=iLow(Symbol(),Periodo,(iLowest(Symbol(),Periodo,MODE_LOW,2,1)));

                     double puntoInicioBuy=iHigh(Symbol(),Periodo,(iHighest(Symbol(),Periodo,MODE_HIGH,1,1)));
                     double puntoInicioSell=iLow(Symbol(),Periodo,(iLowest(Symbol(),Periodo,MODE_LOW,1,1)));

                     double Lote=CalcularLote();

                     if(lowest!=0 && puntoInicioBuy!=0)
                        if(BUY[1]!=EMPTY_VALUE)
                           PonerOperaciones(Lote,puntoInicioBuy,lowest,true);

                     if(highest!=0 && puntoInicioSell!=0)
                        if(SELL[1]!=EMPTY_VALUE)
                           PonerOperaciones(Lote,puntoInicioSell,highest,false);

                     barLast=barras_actuales;
                    }
                 }
              }
           }

   EliminarPendientes();
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int LoadBarsFromSymbol(string symbol, ENUM_TIMEFRAMES timeframe)
  {
   MqlTick tick;

   int bars = iBars(symbol, timeframe);

   bool tick_bool=SymbolInfoTick(symbol, tick);

   return bars;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PonerOperaciones(double Lote,double Precio_100,double Precio_0,bool IsBuy)
  {
   int mult=IsBuy?(1):-1;
   double Rango=MathAbs(Precio_100-Precio_0);

   double TP=NormalizeDouble(Precio_0+mult*(nivel_fibonnaci_TP)*Rango,Digits());
   double SL=NormalizeDouble(Precio_0+mult*(nivel_fibonnaci_SL)*Rango,Digits());
   double Nivel2=NormalizeDouble(Precio_0+mult*(nivel_fibonnaci_2da_operacion)*Rango,Digits());

   MqlDateTime str1;
   TimeToStruct(TimeCurrent(),str1);
   string com=IntegerToString(str1.day)+IntegerToString(str1.hour)+IntegerToString(str1.min)+IntegerToString(str1.sec);

   if(IsBuy)
     {
      if(!trade.Buy(Lote,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_ASK),SL,TP,com))
         Print("No opero buy error : ",GetLastError()," result error ",trade.ResultRetcode());
      else
        {
         if(!trade.BuyLimit(Lote,Nivel2,Symbol(),SL,TP,ORDER_TIME_GTC,0,com))
            Print("No puso buyLimit error : ",GetLastError()," result error ",trade.ResultRetcode());

         DibujarFibonacci(Precio_0,Precio_100);
        }
     }
   else
     {
      if(!trade.Sell(Lote,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_BID),SL,TP,com))
         Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
      else
        {
         if(!trade.SellLimit(Lote,Nivel2,Symbol(),SL,TP,ORDER_TIME_GTC,0,com))
            Print("No puso sellLimit error : ",GetLastError()," result error ",trade.ResultRetcode());
         DibujarFibonacci(Precio_0,Precio_100);
        }
     }
  }
//+------------------------------------------------------------------+
void EliminarPendientes()
  {
   int total=PositionsTotal();
   if(posLast!=total)
     {
      struct ticketComentario
        {
         string      com;
         ulong        ticket;
        };

      ticketComentario TicketOrdenes[];
      ArrayResize(TicketOrdenes,0);

      for(int cnt=OrdersTotal()-1; cnt>=0; cnt--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
        {
         ulong Ticket=OrderGetTicket(cnt);
         if(Ticket==0)
            continue;
         if(OrderGetInteger(ORDER_MAGIC)==NumeroMagico && OrderGetString(ORDER_SYMBOL)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
            //donde esta el experto.. entonces no lo evalua
           {
            int Size=ArraySize(TicketOrdenes);
            ArrayResize(TicketOrdenes,Size+1);
            TicketOrdenes[Size].com=OrderGetString(ORDER_COMMENT);
            TicketOrdenes[Size].ticket=Ticket;
           }
        }

      string comentarioPosicion[];
      ArrayResize(comentarioPosicion,0);

      for(int cnt=total-1; cnt>=0; cnt--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
        {
         ulong Ticket=PositionGetTicket(cnt);
         if(Ticket==0)
            continue;
         if(PositionGetInteger(POSITION_MAGIC)==NumeroMagico && PositionGetString(POSITION_SYMBOL)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
            //donde esta el experto.. entonces no lo evalua
           {
            int Size=ArraySize(comentarioPosicion);
            ArrayResize(comentarioPosicion,Size+1);
            comentarioPosicion[Size]=PositionGetString(POSITION_COMMENT);
           }
        }

      for(int i=0; i<ArraySize(TicketOrdenes); i++)
        {
         bool Encontro=false;
         for(int j=0; j<ArraySize(comentarioPosicion); j++)
           {
            if(TicketOrdenes[i].com==comentarioPosicion[j])
              {
               Encontro=true;
               break;
              }
           }
         if(!Encontro)
            trade.OrderDelete(TicketOrdenes[i].ticket);
        }
      posLast=total;
     }

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluarHorario(int Inicio, int Final, int MInicio, int MFinal, datetime TimeEvalua)
  {
   MqlDateTime str1;
   TimeToStruct(TimeEvalua,str1);

   int Minuto = str1.min;
   int Hora = str1.hour;

   if(Inicio < Final)
     {
      if(!(Inicio <= Hora && Hora <= Final))
         return false;

      if(Inicio == Hora)
         if(Minuto < MInicio)
            return false;

      if(Final == Hora)
         if(Minuto >= MFinal)
            return false;
     }
   else
     {
      if(!(Inicio <= Hora || Hora <= Final))
         return false;

      if(Inicio == Hora)
         if(Minuto < MInicio)
            return false;

      if(Final == Hora)
         if(Minuto >= MFinal)
            return false;
     }

   if(Inicio == Final)
     {
      if(MFinal > MInicio)
        {
         if(Hora != Inicio)
            return false;
        }
      else
         if(MFinal < MInicio)
           {
            if(!(MInicio <= Minuto || Minuto < MFinal))
               return false;
           }
     }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CondicionProfitStop()
  {
   double profitActual=0;

   int total=PositionsTotal();
   for(int cnt=total-1; cnt>=0; cnt--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;
      if(PositionGetInteger(POSITION_MAGIC)==NumeroMagico && PositionGetString(POSITION_SYMBOL)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
         //donde esta el experto.. entonces no lo evalua
         profitActual+=PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP);
     }


   double profitsPasado=0;
//--- request trade history
   HistorySelect(iTime(Symbol(),PERIOD_D1,0),TimeCurrent());
//--- create objects
   total=HistoryDealsTotal();
   ulong    ticket=0;
//--- for all deals
   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         // int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         double profit_=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);

         if(Magic==NumeroMagico && Symbol()==Simbolo)
            if(entry==DEAL_ENTRY_OUT || entry==DEAL_ENTRY_IN)
              {
               double profit_t=profit_+Comision+Swap;
               profitsPasado=profit_t+profitsPasado;
              }
        }
      //}
     }

   double ProfitsTotal=profitActual+profitsPasado;
   string Comentario_="PROFIT DIARIO= "+DoubleToString(ProfitsTotal,2);

   if(ProfitsTotal>=Profit)
     {
      CerrarPosiciones();
      Comentario_+="\nPAUSADO POR LLEGAR AL PROFIT O STOP DIARIO";
      Comment(Comentario_);
      return false;
     }
   if(ProfitsTotal<=(StopLoss>0?StopLoss*-1:StopLoss))
     {
      CerrarPosiciones();
      Comentario_+="\nPAUSADO POR LLEGAR AL PROFIT O STOP DIARIO";
      Comment(Comentario_);
      return false;
     }

   Comment(Comentario_);
   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarPosiciones()
  {
   int total=PositionsTotal();
   for(int cnt=total-1; cnt>=0; cnt--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;
      if(PositionGetInteger(POSITION_MAGIC)==NumeroMagico && PositionGetString(POSITION_SYMBOL)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
         //donde esta el experto.. entonces no lo evalua
         trade.PositionClose(Ticket,-1);
     }

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CalcularLote()
  {

   double LoteNuevo=lote;

   HistorySelect(0,TimeCurrent());
//--- create objects
   int total=HistoryDealsTotal();
   ulong    ticket=0;
//--- for all deals
   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         // int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         double profit_=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);
         double LoteLast=HistoryDealGetDouble(ticket,DEAL_VOLUME);

         if(Magic==NumeroMagico && Symbol()==Simbolo)
            if(entry==DEAL_ENTRY_OUT)
              {
               if(profit_<0)
                 {
                  if(tipo_Martingala==suma)
                     LoteNuevo=LoteLast+Coeficiente_Aumento;
                  else
                     LoteNuevo=LoteLast*Coeficiente_Aumento;
                 }
               break;
              }
        }
      //}
     }

   double LoteEvalua=LoteNuevo/SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
   if(LoteEvalua-((int)LoteEvalua)>0.0000)
      LoteNuevo=int(LoteEvalua)*SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);

   if(LoteNuevo<SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN))
      LoteNuevo=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN);

   if(LoteNuevo>SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX))
      LoteNuevo=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX);

   return LoteNuevo;
  }
//+------------------------------------------------------------------+
bool ControlParametrosLote()
  {

   if(lote==SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN))
      return true;

   double Step=SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
   double LoteEvalua=lote/Step;

   if(LoteEvalua-((int)LoteEvalua)>0.0000)
     {
      Alert("El lote inicial debe ser multiplo del paso permitido (",Step,")");
      return false;
     }

   if(lote<SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN))
     {
      Alert("El lote inicial debe ser mayor o igual al lote minimo permitido (",SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN),")");
      return false;
     }

   if(lote>SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX))
     {
      Alert("El lote inicial debe ser menor o igual al lote maximo permitido (",SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX),")");
      return false;
     }

   if(tipo_Martingala==suma)
     {
      LoteEvalua=Coeficiente_Aumento/Step;
      if(LoteEvalua-((int)LoteEvalua)>0.0000)
        {
         Alert("Si el Martingala es tipo suma, el coeficiente aumento debe ser multiplo al paso permitido por este activo  (",Step,")");
         return false;
        }

     }

   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DibujarFibonacci(double Precio_0,double Precio_100)
  {
   if(Ver_Fibo)
     {
      if(ObjectFind(0,Fibo)!=0)
        {
         FiboLevelsCreate(0,Fibo,0,TimeCurrent(),Precio_100,TimeCurrent()-PeriodSeconds(Periodo)*6,Precio_0,clrNONE,STYLE_DOT,1,false,false,false,false,true,0);

         double levels[5];
         levels[0]=0;
         levels[1]=1.0;
         levels[2]=nivel_fibonnaci_2da_operacion;
         levels[3]=nivel_fibonnaci_SL;
         levels[4]=nivel_fibonnaci_TP;

         color colors[5];
         colors[0]=Color_Fibonacci;
         colors[1]=Color_Fibonacci;
         colors[2]=Color_Fibonacci;
         colors[3]=Color_Fibonacci;
         colors[4]=Color_Fibonacci;

         string levels_Name[5];
         levels_Name[0]="";
         levels_Name[1]="";
         levels_Name[2]="2da Op ";
         levels_Name[3]="Stop Loss ";
         levels_Name[4]="Take Profit ";

         FiboLevelsSet(5,levels,colors,levels_Name,STYLE_DOT,1,0,Fibo);
        }
      else
        {
         ObjectSetDouble(0,Fibo,OBJPROP_PRICE,0,Precio_100);
         ObjectSetDouble(0,Fibo,OBJPROP_PRICE,1,Precio_0);
         ObjectSetInteger(0,Fibo,OBJPROP_TIME,0,TimeCurrent());
         ObjectSetInteger(0,Fibo,OBJPROP_TIME,1,TimeCurrent()-PeriodSeconds(Periodo)*6);
        }
     }
  }
//+------------------------------------------------------------------+
bool FiboLevelsCreate(const long            chart_ID=0,        // ID del gráfico
                      const string          name="FiboLevels", // nombre del objeto
                      const int             sub_window=0,      // número de subventana
                      datetime              time1=0,           // hora del primer punto
                      double                price1=0,          // precio del primer punto
                      datetime              time2=0,           // hora del segundo punto
                      double                price2=0,          // precio del segundo punto
                      const color           clr=clrRed,        // color del objeto
                      const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de las líneas del objeto
                      const int             width=1,           // grosor de las líneas del objeto
                      const bool            back=false,        // al fondo
                      const bool            selection=true,    // seleccionar para mover
                      const bool            ray_left=false,    // continuación del objeto a la izquierda
                      const bool            ray_right=false,   // continuación del objeto a la derecha
                      const bool            hidden=true,       // ocultar en la lista de objetos
                      const long            z_order=0)         // prioridad para el clic del ratón
  {
//--- establecemos las coordenadas de los puntos de anclaje si todavía no han sido establecidas
//--- creamos los "Retrocesos de Fibonacci" según las coordenadas establecidas
   if(!ObjectCreate(chart_ID,name,OBJ_FIBO,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": ¡Falo al crear los \"Retrocesos de Fibonacci\"! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos el color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el estilo de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- establecemos el grosor de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de selección del objeto para mover
//--- cuando el objeto gráfico se crea usando la función ObjectCreate, por defecto el objeto
//--- no se puede seleccionar y mover. Mientras que dentro de este método el parámetro selection
//--- por defecto es igual a true, lo que permite seleccionar y mover este objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- activamos (true) o desactivamos (false) el modo de continuación del objeto a la izquierda
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_LEFT,ray_left);
//--- activamos (true) o desactivamos (false) el modo de continuación del objeto a la derecha
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right);
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- establecemos la prioridad para obtener el evento de cliquear con el ratón sobre el gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- ejecución con éxito
   return(true);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiboLevelsSet(int             levels,            // número de las líneas del nivel
                   double          &values[],         // valores de las líneas del nivel
                   color           &colors[],         // color de las líneas del nivel
                   string          &levels_Name[],
                   ENUM_LINE_STYLE style,         // estilo de las líneas del nivel
                   int             width,         // grosor de las líneas del nivel
                   const long      chart_ID=0,        // ID del gráfico
                   const string    name="FiboLevels") // nombre del objeto
  {
//--- comprobamos los tamaños de los arrays
   if(levels!=ArraySize(values) ||levels!=ArraySize(colors) || levels!=ArraySize(levels_Name))
     {
      Print(__FUNCTION__,": ¡Error. La longitud del array no corresponde al número de los niveles!");
      return(false);
     }
//--- establecemos el número de los niveles
   ObjectSetInteger(chart_ID,name,OBJPROP_LEVELS,levels);
//--- establecemos las propiedades de los niveles en el ciclo
   for(int i=0; i<levels; i++)
     {
      //--- valor del nivel
      ObjectSetDouble(chart_ID,name,OBJPROP_LEVELVALUE,i,values[i]);
      //--- color del nivel
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELCOLOR,i,colors[i]);
      //--- estilo del nivel
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELSTYLE,i,style);
      //--- grosor del nivel
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELWIDTH,i,width);
      //--- descripción del nivel
      ObjectSetString(chart_ID,name,OBJPROP_LEVELTEXT,i,levels_Name[i]+DoubleToString(100*values[i],1));
     }
//--- ejecución con éxito
   return(true);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
