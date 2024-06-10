//+------------------------------------------------------------------+
//|                                                   ATR_Expert.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;

enum Tipo
  {
   Apertura,
   Cierre,
  };

enum tipo_Lote
  {
   Fijo,
   Porcentaje,
  };

#include <FormatoHoraMinuto.mqh>

input string S1="============ VELA REFERENCIA HORARIA ==============";//==============================================================================================
input string Vela_Seleccionada="10:30";
input Tipo TipoCalculo=Cierre;
input ENUM_TIMEFRAMES Periodo_Vela=PERIOD_M30;
input string S22="============ CONDICIONES ==============";//==============================================================================================
input double Multiplicador_ATR=2;//Valor Stop Loss Multiplicador
input int atr_period=14;
input bool Invertido=false;
input double Ratio_TP=1.1;
input string S2="============ TRAILING ==============";//==============================================================================================
input bool Trailing=false;
input double Porcentaje_Rango=50;
input string S3="============ GESTION RIESGO ==============";//==============================================================================================
input tipo_Lote Tipo_Lote=Fijo;
input double Lote_Fijo=0.01;
input double Lote_Porcentaje=1;
input string S4="============ EXPERT IDE ==============";//==============================================================================================
input int numberMagic=22222;
input string comentarioExpert="Expert ATR";//Comentario Expert

int hora_vela=0;
int minuto_vela=0;

int atr_handle=0;

double ATR[];
MqlRates rates[];

struct IDS_Posiciones
  {
   int               ID;
   ulong               Ticket;
   int               Puntos_SL;
   int               BarrasCargadas;
   string            Simbolo;
  };

struct Sistema
  {
   int               rangoSL;
   int               rangoTP;
   double            precioReferencia;
  };


IDS_Posiciones ID_Pos[];
Sistema System;

string UP="Linea UP 2024";
string DN="Linea DN 2024";
string OPEN="Linea OPEN 2024";

int Posiciones=0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   Posiciones=0;
   System.precioReferencia=0;

   if(!SacarHoraMinuto(Vela_Seleccionada,hora_vela,minuto_vela))
      return INIT_FAILED;

   if(!VerificarLoteFijo())
      return INIT_FAILED;

   atr_handle=iATR(Symbol(),Periodo_Vela,atr_period);

   ArraySetAsSeries(ATR,true);
   ArraySetAsSeries(rates,true);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectDelete(0,UP);
   ObjectDelete(0,DN);

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   int barras_actuales=LoadBarsFromSymbol(Symbol(),Periodo_Vela);
   static int barLast=barras_actuales;

   int copiaBarras=MathMin(4,barras_actuales);

   if(barras_actuales!=barLast)
     {
      if(CopyRates(Symbol(),Periodo_Vela,0,copiaBarras,rates)>0)
        {
         MqlDateTime timeReferencia;
         TimeToStruct(rates[1].time,timeReferencia);

         if(timeReferencia.hour==hora_vela && timeReferencia.min==minuto_vela)
           {
            if(BarsCalculated(atr_handle)==barras_actuales)
              {
               if(CopyBuffer(atr_handle,0,0,3,ATR)>0)
                 {
                  int rangoATR=int(Multiplicador_ATR*(ATR[1]/Point()));
                  System.rangoSL=rangoATR;
                  int RangoATR_TP=int(rangoATR*Ratio_TP);
                  System.rangoTP=RangoATR_TP;
                  System.precioReferencia=TipoCalculo==Cierre?rates[1].close:rates[1].open;

                  DibujarLineas(System.precioReferencia,System.rangoSL);

                  barLast=barras_actuales;
                 }
              }
           }
        }
     }

   if(Trailing)
      SistemaTrailing();

   if(System.precioReferencia!=0)
     {
      if(System.precioReferencia+System.rangoSL*Point()<=SymbolInfoDouble(Symbol(),SYMBOL_BID))
        {
         double Lote=0.01;
         if(ObtenerLote(Lote,System.rangoSL))
           {
            if(!Invertido)
               Operar(false,comentarioExpert,Lote,System.rangoSL,System.rangoTP);
            else
               Operar(true,comentarioExpert,Lote,System.rangoSL,System.rangoTP);
           }
         System.precioReferencia=0;

         ObjectSetInteger(0,DN,OBJPROP_COLOR,clrNONE);
         ObjectSetInteger(0,UP,OBJPROP_COLOR,clrNONE);
         ObjectSetInteger(0,OPEN,OBJPROP_COLOR,clrNONE);
         ChartRedraw();
        }
      if(System.precioReferencia-System.rangoSL*Point()>=SymbolInfoDouble(Symbol(),SYMBOL_BID))
        {
         double Lote=0.01;
         if(ObtenerLote(Lote,System.rangoSL))
           {
            if(!Invertido)
               Operar(true,comentarioExpert,Lote,System.rangoSL,System.rangoTP);
            else
               Operar(false,comentarioExpert,Lote,System.rangoSL,System.rangoTP);
           }
         System.precioReferencia=0;

         ObjectSetInteger(0,DN,OBJPROP_COLOR,clrNONE);
         ObjectSetInteger(0,UP,OBJPROP_COLOR,clrNONE);
         ObjectSetInteger(0,OPEN,OBJPROP_COLOR,clrNONE);
         ChartRedraw();
        }
     }
  }
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
bool ObtenerDireccion(MqlRates &rates_[])
  {
   bool direccion=rates[1].close<rates[1].open;

   if(Invertido==true)
      direccion=!direccion;

   return direccion;
  }
//+------------------------------------------------------------------+
void Operar(bool isBuy,string comentario,double lote,int stopLoss,int takeProfit)
  {
   if(isBuy)
     {
      double stopLoss_=stopLoss==0?0:SymbolInfoDouble(Symbol(),SYMBOL_ASK)-stopLoss*Point();
      double takeProfit_=takeProfit==0?0:SymbolInfoDouble(Symbol(),SYMBOL_ASK)+takeProfit*Point();

      if(!trade.Buy(lote,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_ASK),stopLoss_,takeProfit_,comentario))
         Print("No opero buy error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
   else
     {
      double stopLoss_=stopLoss==0?0:SymbolInfoDouble(Symbol(),SYMBOL_BID)+stopLoss*Point();
      double takeProfit_=takeProfit==0?0:SymbolInfoDouble(Symbol(),SYMBOL_BID)-takeProfit*Point();

      if(!trade.Sell(lote,Symbol(),SymbolInfoDouble(Symbol(),SYMBOL_BID),stopLoss_,takeProfit_,comentario))
         Print("No opero sell error : ",GetLastError()," result error ",trade.ResultRetcode());
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ObtenerLote(double &Lote,int SL_Puntos)
  {
   if(Tipo_Lote==Fijo)
     {
      Lote=Lote_Fijo;
      return true;
     }

   return CalcularLotaje(Lote,SL_Puntos);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CalcularLotaje(double &Lots,int SL_Puntos)
  {
   double Tick_Value=SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE);
   double Perdida=AccountInfoDouble(ACCOUNT_BALANCE);
   Perdida=Perdida*(Lote_Porcentaje/100.0);
   double Lotaje=Perdida/(Tick_Value*SL_Puntos);

   Lots=int(Lotaje*100);
   Lots=NormalizeDouble(Lots/100.0,2);

   double Lote_Step=Lots/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
   int Lote_Step_int=int(Lots/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP));

// Print("Lote calculado es igual a  ",DoubleToString(Lots,2));

   if((Lote_Step-Lote_Step_int)>0)
     {
      Lots=Lote_Step_int*SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
      Print("Redondeando al Lote mas cercano permitido");
     }

   Print("Lote Calculado ",DoubleToString(Lots,2));

   if(Lots>SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
     {
      Print("Lote Calculado ",DoubleToString(Lots,2)," es mayor al lote maximo permitido... igualando al lote maximo permitido");
      Lots=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);
      return true;
     }

   if(Lots>=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
      return true;
   else
      Print("No opero porque el lote calculado es inferior al Lote Minimo para el simbolo");

   Print("Error al calcular el Lotaje... revisar los comentarios en la pestaña Expertos");
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarLoteFijo()
  {

   if(Tipo_Lote!=Fijo)
      return true;

   double Lote_Step=Lote_Fijo/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
   int Lote_Step_int=int(Lote_Fijo/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP));

   if(Lote_Fijo==SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
      return true;

   if((Lote_Step-Lote_Step_int)>0)
     {
      Alert("El Lotaje Fijo debe ser divisible entre ",SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP));
      return false;
     }

   if(Lote_Fijo>SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
     {
      Alert("Lote Fijo debe ser menor o igual al lotaje maximo permitido ",SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX));
      return false;
     }

   if(Lote_Fijo<SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
     {
      Alert("Lote Fijo debe ser mayor o igual al lotaje maximo permitido ",SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN));
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
void Actualizar_Tickets()
  {
   int TotalPosiciones=PositionsTotal();

   if(TotalPosiciones!=Posiciones)
     {
      //Print("------------------------------------------------------");
      ArrayResize(ID_Pos,0);
      for(int i=TotalPosiciones-1; i>=0; i--)
        {
         ulong Ticket=PositionGetTicket(i);
         int ID_=(int)PositionGetInteger(POSITION_IDENTIFIER);
         int Size=ArraySize(ID_Pos);
         ArrayResize(ID_Pos,Size+1);
         ID_Pos[Size].ID=ID_;
         ID_Pos[Size].Ticket=Ticket;
         ID_Pos[Size].Puntos_SL=0;
         ID_Pos[Size].Simbolo=PositionGetSymbol(i);
        }

      HistorySelect(TimeCurrent()-PeriodSeconds(PERIOD_MN1)*2,TimeCurrent());
      //--- create objects
      int     total=HistoryDealsTotal();
      ulong    ticket=0;

      for(int j=ArraySize(ID_Pos)-1; j>=0; j--)
         for(int i=total-1; i>=0; i--)
           {
            //--- try to get deals ticket
            if((ticket=HistoryDealGetTicket(i))>0)
              {
               int ID  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
               int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
               int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
               double SL =HistoryDealGetDouble(ticket,DEAL_SL);
               double TP =HistoryDealGetDouble(ticket,DEAL_TP);
               double OP =HistoryDealGetDouble(ticket,DEAL_PRICE);
               string Symbolo =HistoryDealGetString(ticket,DEAL_SYMBOL);

               if(ID_Pos[j].ID==ID && entry==DEAL_ENTRY_IN)
                 {
                  ID_Pos[j].Puntos_SL=int(MathAbs(SL-OP)/(SymbolInfoDouble(Symbolo,SYMBOL_POINT)));
                  //Print("ID ",ID," MAGIG ",Magic," ENTRY ",EnumToString(ENUM_DEAL_ENTRY(entry)));
                  //Print("SL ",SL," TP ",TP," OP ",OP);

                  break;
                 }
               //}
              }
           }
      Posiciones=TotalPosiciones;
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SistemaTrailing()
  {
   Actualizar_Tickets();

   for(int j=ArraySize(ID_Pos)-1; j>=0; j--)
     {
      if(PositionSelectByTicket(ID_Pos[j].Ticket))
        {

         string Simbolo=PositionGetString(POSITION_SYMBOL);
         double Points=SymbolInfoDouble(Simbolo,SYMBOL_POINT);
         double current=PositionGetDouble(POSITION_PRICE_CURRENT);
         double open=PositionGetDouble(POSITION_PRICE_OPEN);
         double SL=PositionGetDouble(POSITION_SL);
         double TP=PositionGetDouble(POSITION_TP);
         int digits=(int)SymbolInfoInteger(Simbolo,SYMBOL_DIGITS);
         long tipo=PositionGetInteger(POSITION_TYPE);

         int Puntos_Trailing=MathMax((int)SymbolInfoInteger(Simbolo,SYMBOL_TRADE_STOPS_LEVEL)+10,int(ID_Pos[j].Puntos_SL*(Porcentaje_Rango/100.0)));

         Print(Puntos_Trailing);

         if(tipo==POSITION_TYPE_BUY && Puntos_Trailing>0 && NormalizeDouble(current-Puntos_Trailing*Points,digits)>open &&
            ((current-SL>=Puntos_Trailing*2*Point() && SL<NormalizeDouble(current-Puntos_Trailing*Points,digits)) || SL==0))
            trade.PositionModify(ID_Pos[j].Ticket,NormalizeDouble(current-Puntos_Trailing*Points,digits),TP);

         if(tipo==POSITION_TYPE_SELL && Puntos_Trailing>0 && NormalizeDouble(current+Puntos_Trailing*Points,digits)<open &&
            ((SL-current>=Puntos_Trailing*2*Points && SL>NormalizeDouble(current+Puntos_Trailing*Points,digits)) || SL==0))
            trade.PositionModify(ID_Pos[j].Ticket,NormalizeDouble(current+Puntos_Trailing*Points,digits),TP);
        }
     }

  }

//+------------------------------------------------------------------+
bool HLineCreate(const long            chart_ID=0,        // ID del gráfico
                 const string          name="HLine",      // nombre de la línea
                 const int             sub_window=0,      // índice de subventana
                 double                price=0,           // precio de la línea
                 const color           clr=clrRed,        // color de la línea
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de la línea
                 const int             width=1,           // grosor de la línea
                 const bool            back=false,        // al fondo
                 const bool            selection=true,    // seleccionar para mover
                 const bool            hidden=true,       // ocultar en la lista de objetos
                 const long            z_order=0)         // prioridad para el clic del ratón
  {
//--- si el precio no ha sido establecido, la ponemos en el nivel del precio Bid actual
   if(!price)
      price=SymbolInfoDouble(Symbol(),SYMBOL_BID);
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la línea horizontal
   if(!ObjectCreate(chart_ID,name,OBJ_HLINE,sub_window,0,price))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la línea horizontal! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos el color de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el estilo de visualización de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- establecemos el grosor de la línea
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de desplazamiento de la línea con ratón
//--- cuando el objeto gráfico se crea usando la función ObjectCreate, por defecto el objeto
//--- no se puede seleccionar y mover. Mientras que dentro de este método el parámetro selection
//--- por defecto es igual a true, lo que permite seleccionar y mover este objeto
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- establecemos la prioridad para obtener el evento de cliquear sobre el gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- ejecución con éxito
   return(true);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DibujarLineas(double precio,double rango)
  {
   if(ObjectFind(0,UP)!=0)
      HLineCreate(0,UP,0,precio+rango*Point(),clrAqua,STYLE_DASHDOT,1,false,false,true,0);
   else
     {
      ObjectSetInteger(0,UP,OBJPROP_COLOR,clrAqua);
      ObjectSetDouble(0,UP,OBJPROP_PRICE,0,precio+rango*Point());
     }

   if(ObjectFind(0,DN)!=0)
      HLineCreate(0,DN,0,precio-rango*Point(),clrAqua,STYLE_DASHDOT,1,false,false,true,0);
   else
     {
      ObjectSetInteger(0,DN,OBJPROP_COLOR,clrAqua);
      ObjectSetDouble(0,DN,OBJPROP_PRICE,0,precio-rango*Point());
     }

   if(ObjectFind(0,OPEN)!=0)
      HLineCreate(0,OPEN,0,precio,clrYellow,STYLE_DASHDOT,1,false,false,true,0);
   else
     {
      ObjectSetInteger(0,OPEN,OBJPROP_COLOR,clrYellow);
      ObjectSetDouble(0,OPEN,OBJPROP_PRICE,0,precio);
     }
  }
//+------------------------------------------------------------------+
