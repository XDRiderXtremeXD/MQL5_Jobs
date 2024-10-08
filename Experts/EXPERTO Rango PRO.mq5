//+------------------------------------------------------------------+
//|                                            EXPERTO Rango PRO.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict


#include<Trade\Trade.mqh>
CTrade trade;

datetime DateTime=0;


enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12pm=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

enum Tipo_Lotaje
  {
   Riesgo_Fijo=0,
   Riesgo_Porcentaje=1,
  };

enum Risk_Mode
  {
   Balance=0,//Balance
   Equity=1,//Equity
  };

enum Ordenes_Tipo
  {
   Ordenes_Pendientes=0,
   Ordenes_Mercado=1,
  };


input Ordenes_Tipo Tipo_Ordenes=Ordenes_Pendientes;
input string S1="--------------------------- CONFIGURACION LOTAJE ---------------------------";//---------------------------------------------------------------------------------------
input Tipo_Lotaje Lotaje_Tipo=Riesgo_Porcentaje;
input double Lotaje_Fijo=0.01;//Lote Fijo(Lotaje Tipo=Riesgo Fijp)
input double Porcentaje_Riesgo=10;//Porcentaje(Lotaje Tipo=RiesgoPorcentaje)
Risk_Mode Risk=Balance;
input string S4="----------------------- TP y SL -----------------------";//---------------------------------------------------------------------------------------
input int SL=200;
input int TP=1200;
input string S2="---------------------- RANGO OPERATIVO ----------------------";//---------------------------------------------------------------------------------------
input string InicioRango="2:00";
input string FinalRango="4:00";
input string InicioSesion="6:00";//Inicio Operacion
input string FinalSesion="8:00";//Final Operacion
input string S3="----- MARGEN/SPREAD -----";//---------------------------------------------------------------------------------------
input int Margen_Buy=10;
input int Margen_Sell=10;
input string S5="----------------------- FILTROS -----------------------";//---------------------------------------------------------------------------------------
input int Max_Trades=3;
input int Puntos_Entra=100;//Puntos entra de nuevo Filtro Rango
input int Puntos_Pendientes_Cercania=30;
input string S1_6="----------------  SL DINAMICO -------------------";//----------------------------------------------------------------
input bool SL_Dinamico=true;
input int TrailingStart=200;//TS Start
input int TrailingStop=150;//TS Stop
input int TrailingStep=100;//TS Step
input string STSS_="------------------------------------ LIMITADORES ------------------------------------";//---------------------------------------------------------------------------------------
input string SS_="Si se pone en 0 se desactiva limitador";//......................................
input double Ganancia_Limitador_Porcentaje_Diario=0;//Ganancia Limitador Porcentaje DIARIO
input double Ganancia_Limitador_Porcentaje_Mensual=10;//Ganancia Limitador Porcentaje MENSUAL
input double Perdida_Limitador_Porcentaje_Diario=5;//Perdida Limitador Porcentaje DIARIO
input double Perdida_Limitador_Porcentaje_Mensual=0;//Perdida Limitador Porcentaje MENSUAL
input bool Cierre_en_Limitador=true;
input string S7="---------------------- NOTIFICACIONES ----------------------";//---------------------------------------------------------------------------------------
input bool Mensaje_Alerta=false;
input bool Mensaje_Movil=false;
input bool E_mail=false;
input string _S22_="-------- CONFIGURACION RECTANGULO Y LINEAS---------";//---------------------------------------------------------------------------------------
input bool VerRectangulo=true;
input color ColorRectangulo=clrRed;
input bool FondoRectangulo=true;
input bool VerSesion=true;
input color ColorSession=clrLawnGreen;
input bool VerLineasCercania=true;
input color CercaniaColor=clrMagenta;
input ENUM_LINE_STYLE CercaniaEstilo=STYLE_DASHDOTDOT;
input bool VerLineasEntra=true;
input color EntraColor=clrAqua;
input ENUM_LINE_STYLE EntraEstilo=STYLE_DASHDOTDOT;
input string S6="----------------------- OTROS AJUSTES -----------------------";//---------------------------------------------------------------------------------------
input bool Display=true;
input string Comentario="Comentario Expert";//Comentario en la orden
input int Magic_Number=0;

string Rectangulo="001 RECTANGULO";
string VInicio="001 Vertical I";
string VFinal="001 Vertical F";



int Inicio_Rango_Hora=0;
int Inicio_Rango_Minutos=0;
int Final_Rango_Hora=0;
int Final_Rango_Minutos=0;
int Inicio_Sesion_Hora=0;
int Inicio_Sesion_Minutos=0;
int Fin_Sesion_Hora=0;
int Fin_Sesion_Minutos=0;

bool Diario=true;
bool Mensual=true;

int HistoryAnterior=0;
datetime TiempoInicio=0,TiempoFinal=0;
datetime TiempoInicioTrades=0;

string ComentarioLimitador="";
double BalanceMes=0;
double BalanceDia=0;

double H=0,L=0;
bool CalculoValores=false;
bool EntroSell=false,EntroBuy=false;
string Horizontales="001 Horizontal";
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   H=0;
   L=0;
   CalculoValores=false;
   EntroSell=false;
   EntroBuy=false;

   BalanceMes=0;
   BalanceDia=0;
   TiempoInicio=0;
   TiempoFinal=0;
   TiempoInicioTrades=0;

   Diario=true;
   Mensual=true;

   HistoryAnterior=0;

   if(!VerificarDateTime(InicioRango,Inicio_Rango_Hora,Inicio_Rango_Minutos))
     {
      Alert("Texto mal escrito en Inicio Rango");
      return INIT_PARAMETERS_INCORRECT;
     }

   if(!VerificarDateTime(FinalRango,Final_Rango_Hora,Final_Rango_Minutos))
     {
      Alert("Texto mal escrito en Inicio Rango");
      return INIT_PARAMETERS_INCORRECT;
     }

   if(!VerificarDateTime(InicioSesion,Inicio_Sesion_Hora,Inicio_Sesion_Minutos))
     {
      Alert("Texto mal escrito en Inicio Rango");
      return INIT_PARAMETERS_INCORRECT;
     }

   if(!VerificarDateTime(FinalSesion,Fin_Sesion_Hora,Fin_Sesion_Minutos))
     {
      Alert("Texto mal escrito en Inicio Rango");
      return INIT_PARAMETERS_INCORRECT;
     }


   if(Lotaje_Tipo!=Riesgo_Fijo)
     {
      if(SL<=0)
        {
         Alert("Error SL debe ser mayor a 0 para calcular el Lote en Riesgo Dinamico");
         return INIT_PARAMETERS_INCORRECT;
        }
     }

   if(Inicio_Sesion_Hora==Fin_Sesion_Hora)
     {
      Alert("Hora Inicio Sesion debe ser diferente a Hora Fin Sesion..");
      return INIT_PARAMETERS_INCORRECT;
     }

   if(Inicio_Rango_Hora==Final_Rango_Hora)
     {
      Alert("Hora Inicio Rango debe ser diferente a Hora Fin Rango..");
      return INIT_PARAMETERS_INCORRECT;
     }

//datetime M1=ActualizarDatos(NULL,PERIOD_M1);
   trade.SetExpertMagicNumber(Magic_Number);

   InicializarCuadros();

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   /*  ObjectsDeleteAll(0,PP_,0,OBJ_TREND);
     ObjectsDeleteAll(0,R1_,0,OBJ_TREND);
     ObjectsDeleteAll(0,R2_,0,OBJ_TREND);
     ObjectsDeleteAll(0,R3_,0,OBJ_TREND);
     ObjectsDeleteAll(0,S1_,0,OBJ_TREND);
     ObjectsDeleteAll(0,S2_,0,OBJ_TREND);
     ObjectsDeleteAll(0,S3_,0,OBJ_TREND);
   */

   if(ObjectFind(0,Rectangulo)==0)
      ObjectDelete(0,Rectangulo);

   if(ObjectFind(0,VInicio)==0)
      ObjectDelete(0,VInicio);

   if(ObjectFind(0,VFinal)==0)
      ObjectDelete(0,VFinal);

   ObjectsDeleteAll(0,Horizontales,0,OBJ_TREND);

//DesaparecerOrdenes();
   Comment(" ");
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {

   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   if(SL_Dinamico)
      TS_and_BE();

   double Profit=0;
   int Trades=TiempoInicioTrades==0?0:CalculoTradesPorSesion(TiempoInicioTrades,Profit);

   CierresLIMITADORES();

   if(Display)
     {
      Comment("RANGEBOT \n ------------------------------------------- \n"
              +"Spread: "+IntegerToString(SymbolInfoInteger(NULL,SYMBOL_SPREAD))+"\n ------------------------------------------- \n"+
              "Profit actual SESION: "+DoubleToString(Profit,2)+"\n Nro de Ordenes abiertas en el dia: "+IntegerToString(Trades)+"\n Entro Cuadro Buy "+EntroBuy+" -- Entro Cuadro Sell "+EntroSell+
              ((!Diario || !Mensual)?("\n"+ComentarioLimitador):"")
             );
     }

   if(Trades>=Max_Trades)
      DesaparecerOrdenes();

   if(TiempoFinal!=0 && TimeCurrent()>=TiempoFinal)
     {
      DesaparecerOrdenes();
      //CerrarOrdenes();
      CalculoValores=false;
      EntroBuy=false;
      EntroSell=false;
     }

   datetime M1=iTime(Symbol(),PERIOD_M1,0);

   if(DateTime!=M1)
     {
      MqlDateTime TimeMinuto;
      TimeToStruct(iTime(NULL,PERIOD_M1,0),TimeMinuto);

      if(TimeMinuto.hour==Inicio_Sesion_Hora && TimeMinuto.min==Inicio_Sesion_Minutos)
        {
         if(TiempoInicio!=iTime(NULL,PERIOD_M1,0))
           {
            TiempoInicio=iTime(NULL,PERIOD_M1,0);
            TiempoFinal=TiempoInicio+(Inicio_Sesion_Hora>Fin_Sesion_Hora?((24-Inicio_Sesion_Hora+Fin_Sesion_Hora)*60*60):((Fin_Sesion_Hora-Inicio_Sesion_Hora)*60*60))-
                        (Inicio_Sesion_Minutos*60)+(Fin_Sesion_Minutos)*60;
            TiempoInicioTrades=TiempoInicio;
           }
         CalculoValores=false;
         DibujarTodo();
         EntroBuy=Ask<H?true:false;
         EntroSell=Bid>L?true:false;
        }
      InicializarCuadros();
      DateTime=M1;
     }


   if(Diario && Mensual)
     {
      if(TimeCurrent()>=TiempoInicio && TimeCurrent()<TiempoFinal && Trades<Max_Trades)
        {
         if(CalculoValores)
           {
            if(!Detectar(false,TiempoInicio,TiempoFinal))
               if(!EntroSell)
                  if(L+Puntos_Entra*Point()<Bid)
                     EntroSell=true;

            if(!Detectar(true,TiempoInicio,TiempoFinal))
               if(!EntroBuy)
                  if(H-Puntos_Entra*Point()>Ask)
                     EntroBuy=true;

            if(Tipo_Ordenes==Ordenes_Pendientes)
              {
               // if(!CalculoValores|| (!Detectar(true,TiempoInicio,TiempoFinal) && H-((H-L)*Porcentaje_Entra/100.0)<Ask))
               if(H+Margen_Buy*Point()>Ask)
                  if((!Detectar(true,TiempoInicio,TiempoFinal) && EntroBuy && H-Puntos_Pendientes_Cercania*Point()<=Ask))
                    {
                     BUYSTOP(Symbol(),H+Margen_Buy*Point());
                     EntroBuy=false;
                    }
               if(L-Margen_Sell*Point()<Bid)
                  if((!Detectar(false,TiempoInicio,TiempoFinal) && EntroSell && L+Puntos_Pendientes_Cercania*Point()>=Bid))
                    {
                     SELLSTOP(Symbol(),L-Margen_Sell*Point());
                     EntroSell=false;
                    }
              }
            else
              {
               if((!Detectar(true,TiempoInicio,TiempoFinal) && EntroBuy && H+Margen_Buy*Point()<=Ask))
                 {
                  BUY(Symbol());
                  EntroBuy=false;
                 }
               if((!Detectar(false,TiempoInicio,TiempoFinal) && EntroSell && L-Margen_Sell*Point()>=Bid))
                 {
                  SELL(Symbol());
                  EntroSell=false;
                 }
              }
           }
         else
           {
            Alert("Rango No encontrado");
            TiempoInicio=TiempoFinal+1;
           }
        }
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CalculoTradesPorSesion(datetime Inicio,double &Profit)
  {

//Print("-------------------------------------");
   Profit=0;
   int Ordenes=0;

   int Total=PositionsTotal();
   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_TIME)<Inicio)
         break;

      if(PositionGetInteger(POSITION_MAGIC)==Magic_Number && PositionGetSymbol(i)==Symbol())
         Profit+=PositionGetDouble(POSITION_PROFIT);
     }

   HistorySelect(Inicio,TimeCurrent());

   int     total=HistoryDealsTotal();
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
         double Profit_=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         //string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);

         if(Magic==Magic_Number)
           {
            if(entry==DEAL_ENTRY_OUT)
              {
               Profit_=Profit_+(true?Comision:0)+(true?Swap:0);
               Profit=Profit_+Profit;
              }
            if(entry==DEAL_ENTRY_IN)
               Ordenes++;
           }
         //}
        }
     }



   return Ordenes;
  }
//+------------------------------------------------------------------+
/*
datetime ActualizarDatos(string Simbolo,ENUM_TIMEFRAMES TimeFrames)
  {
   datetime daytimes[];
   ArrayResize(daytimes,1);

   int error;
   bool Actualizar_=true;
   ResetLastError();
//---- the Time[] array was sroted in the descending order
   ArrayCopySeries(daytimes,MODE_TIME,Simbolo,TimeFrames);
   error=GetLastError();


   if((error==4073 || error==4066) && Actualizar_)
     {
      Print("Actualizando Simbolo ",Simbolo," en Periodo ",EnumToString((ENUM_TIMEFRAMES) TimeFrames));
      Actualizar_=false;
     }

   if(error==4066 || error==4073)
     {
      //---- make two more attempts to read
      while((error==4066 || error==4073) && !IsStopped())
        {
         Sleep(1000);
         ArrayCopySeries(daytimes,MODE_TIME,Simbolo,TimeFrames);
         error=GetLastError();
         //---- check the current daily bar time
        }
     }
//Print(error);
//Print("Z1");
//Print("ARRAY SIZE= ",ArraySize(daytimes));
   if(Actualizar_==false)
      Print(" Simbolo Actualizado ",Simbolo);


   return daytimes[0];
//Print("Z2");
  }
*/


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SELLSTOP(string Simbolo,double Precio)
  {
   double ASK=SymbolInfoDouble(Simbolo,SYMBOL_ASK);
   double POINT=SymbolInfoDouble(Simbolo,SYMBOL_POINT);
   double BID=SymbolInfoDouble(Simbolo,SYMBOL_BID);

   double SL_=SL<=0?0:Precio+SL*POINT; //SE ESTABLECE EL SL
   double TP_=TP<=0?0:Precio-TP*POINT;//SE ESTABLECE EL TP

   bool Operacion=true;
   double Lotaje=0;

   if(Lotaje_Tipo==Riesgo_Fijo)
      Lotaje=Lotaje_Fijo;
   else
     {
      if(!CalcularLotaje(Lotaje))
         Operacion=false;
     }

   if(Operacion)
     {
      bool Ticket=trade.SellStop(Lotaje,Precio,NULL,SL_,TP_,ORDER_TIME_GTC,0,Comentario);

      if(trade.ResultRetcode()!=TRADE_RETCODE_DONE) // SI FUE EJECUTADO BIEN ENTONCES
         Print("Error opening SELLSTOP order : ",GetLastError());// IMPRIME ERROR
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BUYSTOP(string Simbolo,double Precio)
  {
   double ASK=SymbolInfoDouble(Simbolo,SYMBOL_ASK);
   double POINT=SymbolInfoDouble(Simbolo,SYMBOL_POINT);
   double BID=SymbolInfoDouble(Simbolo,SYMBOL_BID);

   double SL_=SL<=0?0:Precio-SL*POINT; //SE ESTABLECE EL SL
   double TP_=TP<=0?0:Precio+TP*POINT; //SE ESTABLECE EL TP

   bool Operacion=true;
   double Lotaje=0;

   if(Lotaje_Tipo==Riesgo_Fijo)
      Lotaje=Lotaje_Fijo;
   else
     {
      if(!CalcularLotaje(Lotaje))
         Operacion=false;
     }

   if(Operacion)
     {
      bool Ticket=trade.BuyStop(Lotaje,Precio,NULL,SL_,TP_,ORDER_TIME_GTC,0,Comentario);

      if(trade.ResultRetcode()!=TRADE_RETCODE_DONE) // SI FUE EJECUTADO BIEN ENTONCES
         Print("Error opening BUYSTOP order : ",GetLastError());// IMPRIME ERROR
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SELL(string Simbolo)
  {
   double ASK=SymbolInfoDouble(Simbolo,SYMBOL_ASK);
   double POINT=SymbolInfoDouble(Simbolo,SYMBOL_POINT);
   double BID=SymbolInfoDouble(Simbolo,SYMBOL_BID);

   double SL_=SL<=0?0:BID+SL*POINT; //SE ESTABLECE EL SL
   double TP_=TP<=0?0:BID-TP*POINT;//SE ESTABLECE EL TP

   bool Operacion=true;
   double Lotaje=0;

   if(Lotaje_Tipo==Riesgo_Fijo)
      Lotaje=Lotaje_Fijo;
   else
     {
      if(!CalcularLotaje(Lotaje))
         Operacion=false;
     }

   if(Operacion)
     {
      bool Ticket=trade.Sell(Lotaje,Symbol(),BID,SL_,TP_,Comentario);

      if(trade.ResultRetcode()!=TRADE_RETCODE_DONE) // SI FUE EJECUTADO BIEN ENTONCES
         Print("Error opening SELL order : ",GetLastError());// IMPRIME ERROR
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BUY(string Simbolo)
  {
   double ASK=SymbolInfoDouble(Simbolo,SYMBOL_ASK);
   double POINT=SymbolInfoDouble(Simbolo,SYMBOL_POINT);
   double BID=SymbolInfoDouble(Simbolo,SYMBOL_BID);

   double SL_=SL<=0?0:ASK-SL*POINT; //SE ESTABLECE EL SL
   double TP_=TP<=0?0:ASK+TP*POINT; //SE ESTABLECE EL TP

   bool Operacion=true;
   double Lotaje=0;

   if(Lotaje_Tipo==Riesgo_Fijo)
      Lotaje=Lotaje_Fijo;
   else
     {
      if(!CalcularLotaje(Lotaje))
         Operacion=false;
     }

   if(Operacion)
     {
      bool Ticket=trade.Buy(Lotaje,Symbol(),ASK,SL_,TP_,Comentario);

      if(trade.ResultRetcode()!=TRADE_RETCODE_DONE) // SI FUE EJECUTADO BIEN ENTONCES
         Print("Error opening BUY order : ",GetLastError());// IMPRIME ERROR
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Detectar(bool isBuy,datetime Inicio,datetime Final)
  {
   for(int cnt=OrdersTotal()-1; cnt>=0; cnt--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=OrderGetTicket(cnt);
      if(Ticket==0)
         continue;

      if(OrderGetInteger(ORDER_MAGIC)==Magic_Number && OrderGetString(ORDER_SYMBOL)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
         //donde esta el experto.. entonces no lo evalua
        {
         if(OrderGetInteger(ORDER_TIME_SETUP)<Inicio)
            break;

         if(OrderGetInteger(ORDER_TIME_SETUP)<Final)
           {
            if(isBuy)
              {
               if(OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_BUY_STOP)
                  return true;
              }
            else
              {
               if(OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_SELL_STOP)
                  return true;
              }
           }
        }
     }

   int Total=PositionsTotal();
   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_TIME)<Inicio)
         break;

      if(PositionGetInteger(POSITION_MAGIC)==Magic_Number && PositionGetSymbol(i)==Symbol())
        {
         if(isBuy)
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
               return true;

         if(!isBuy)
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
               return true;
        }
     }


   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DesaparecerOrdenes()
  {
   for(int cnt=OrdersTotal()-1; cnt>=0; cnt--) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=OrderGetTicket(cnt);
      if(Ticket==0)
         continue;
      if(OrderGetInteger(ORDER_MAGIC)==Magic_Number && OrderGetString(ORDER_SYMBOL)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
         //donde esta el experto.. entonces no lo evalua
        {
         trade.OrderDelete(OrderGetInteger(ORDER_TICKET));
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarOrdenes()
  {
   int Total=PositionsTotal();
   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)==Magic_Number && PositionGetSymbol(i)==Symbol())
         trade.PositionClose(Ticket,-1);
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VLineCreate(const long            chart_ID=0,        // chart's ID
                 const string          name="VLine",      // line name
                 const int             sub_window=0,      // subwindow index
                 datetime              time=0,            // line time
                 const color           clr=clrRed,        // line color
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // line style
                 const int             width=1,           // line width
                 const bool            back=false,        // in the background
                 const bool            selection=true,    // highlight to move
                 const bool            hidden=true,       // hidden in the object list
                 const long            z_order=0)         // priority for mouse click
  {
//--- if the line time is not set, draw it via the last bar
   if(!time)
      time=TimeCurrent();
//--- reset the error value
   ResetLastError();
//--- create a vertical line
   if(!ObjectCreate(chart_ID,name,OBJ_VLINE,sub_window,time,0))
     {
      Print(__FUNCTION__,
            ": failed to create a vertical line! Error code = ",GetLastError());
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
bool RectangleCreate(const long            chart_ID=0,        // chart's ID
                     const string          name="Rectangle",  // rectangle name
                     const int             sub_window=0,      // subwindow index
                     datetime              time1=0,           // first point time
                     double                price1=0,          // first point price
                     datetime              time2=0,           // second point time
                     double                price2=0,          // second point price
                     const color           clr=clrRed,        // rectangle color
                     const ENUM_LINE_STYLE style=STYLE_SOLID, // style of rectangle lines
                     const int             width=1,           // width of rectangle lines
                     const bool            fill=false,        // filling rectangle with color
                     const bool            back=false,        // in the background
                     const bool            selection=true,    // highlight to move
                     const bool            hidden=true,       // hidden in the object list
                     const long            z_order=0)         // priority for mouse click
  {

//Print("Entra Rectangulo");
//--- set anchor points' coordinates if they are not set
//--- reset the error value
   ResetLastError();
//--- create a rectangle by the given coordinates
   if(!ObjectCreate(chart_ID,name,OBJ_RECTANGLE,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": failed to create a rectangle! Error code = ",GetLastError());
      return(false);
     }
//--- set rectangle color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set the style of rectangle lines
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- set width of the rectangle lines
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- enable (true) or disable (false) the mode of filling the rectangle
   ObjectSetInteger(chart_ID,name,OBJPROP_FILL,fill);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of highlighting the rectangle for moving
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
//|                                                                  |
//+------------------------------------------------------------------+
bool TrendCreate(const long            chart_ID=0,        // chart's ID
                 const string          name="TrendLine",  // line name
                 const int             sub_window=0,      // subwindow index
                 datetime              time1=0,           // first point time
                 double                price1=0,          // first point price
                 datetime              time2=0,           // second point time
                 double                price2=0,          // second point price
                 const color           clr=clrRed,        // line color
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // line style
                 const int             width=1,           // line width
                 const bool            back=false,        // in the background
                 const bool            selection=true,    // highlight to move
                 const bool            ray_right=false,   // line's continuation to the right
                 const bool            hidden=true,       // hidden in the object list
                 const long            z_order=0)         // priority for mouse click
  {
//--- set anchor points' coordinates if they are not set
//--- reset the error value
   ResetLastError();
//--- create a trend line by the given coordinates
   if(!ObjectCreate(chart_ID,name,OBJ_TREND,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": failed to create a trend line! Error code = ",GetLastError());
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
//--- enable (true) or disable (false) the mode of continuation of the line's display to the right
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right);
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
void TS_and_BE() // FUNCION DEL TS Y BREAK VEN
  {
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   uint DiferenciaStep=TrailingStart-(TrailingStart-TrailingStop)+TrailingStep;
   uint Diferencia=TrailingStop;

   for(int cnt=0; cnt<PositionsTotal(); cnt++) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)==Magic_Number && PositionGetSymbol(cnt)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && (NormalizeDouble(Bid-DiferenciaStep*Point(),Digits())>=PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL) ==0) && NormalizeDouble(Bid-TrailingStart*Point(),Digits())>=PositionGetDouble(POSITION_PRICE_OPEN))
            if(!trade.PositionModify(Ticket,NormalizeDouble(Bid-Diferencia*Point(),Digits()),PositionGetDouble(POSITION_TP)))
               Print("ResultRetcode error ",trade.ResultRetcode());

         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL  && (NormalizeDouble(Ask+DiferenciaStep*Point(),Digits())<=PositionGetDouble(POSITION_SL)  || PositionGetDouble(POSITION_SL) ==0) && NormalizeDouble(Ask+TrailingStart*Point(),Digits())<=PositionGetDouble(POSITION_PRICE_OPEN))
            if(!trade.PositionModify(Ticket,NormalizeDouble(Ask+Diferencia*Point(),Digits()),PositionGetDouble(POSITION_TP)))
               Print("ResultRetcode error ",trade.ResultRetcode());
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CalcularLotaje(double &Lots)
  {
   double Tick_Value=SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE);
   int rango=SL+1;
   double Perdida=Risk==Balance?AccountInfoDouble(ACCOUNT_BALANCE):AccountInfoDouble(ACCOUNT_EQUITY);
   Perdida=Perdida*(Porcentaje_Riesgo/100.0);
   Print("Perdida Calculada ",DoubleToString(Perdida,2));
   double Lotaje=Perdida/(Tick_Value*rango);

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
     }


   if(Lots>=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN))
     {
      return true;
     }
   else
      Print("No opero porque el lote calculado es inferior al Lote Minimo para el simbolo");

   Alert("Error al calcular el Lotaje... revisar los comentarios en la pestaña Expertos");
   return false;
  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool  VerificarDateTime(string Texto,int &Hora,int &Minutos)
  {
   int Numero=0;
   int NumeroSeparacion=0;
   int IndiceSeparacion=0;
   for(int i=0; i<StringLen(Texto); i++)
     {
      ushort CHAR=StringGetCharacter(Texto,i);

      if((CHAR>'9' || CHAR<'0') && CHAR!=':')
         return false;

      if(CHAR==':')
        {
         NumeroSeparacion++;
         IndiceSeparacion=i;
        }

      if(NumeroSeparacion>1)
         return false;
     }

   if(NumeroSeparacion==0)
      return false;

   if((StringLen(Texto)-1)==IndiceSeparacion)
      return false;

   Hora=int(StringSubstr(Texto,0,IndiceSeparacion));
   Minutos=int(StringSubstr(Texto,IndiceSeparacion+1,StringLen(Texto)-IndiceSeparacion-1));


   if(Hora>23 || Hora<0)
     {
      Alert("Hora debe ser menor o igual a 23 en ",Texto);
      return false;
     }

   if(Minutos>59 || Minutos<0)
     {
      Alert("Minutos debe ser menor o igual a 59 en ",Texto);
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
double GananciaPerdidaCerrada(datetime Tiempo)
  {
   double Balance=AccountInfoDouble(ACCOUNT_BALANCE);

   HistorySelect(Tiempo,TimeCurrent());

   int     total=HistoryDealsTotal();
   ulong    ticket=0;
//--- for all deals


   for(int i=total-1; i>=0; i--)
     {
      //--- try to get deals ticket
      if((ticket=HistoryDealGetTicket(i))>0)
        {
         int ID_  =(int)HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
         int entry =(int)HistoryDealGetInteger(ticket,DEAL_ENTRY);
         // int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);
         double Profit_=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         double Comision=HistoryDealGetDouble(ticket,DEAL_COMMISSION);
         double Swap=HistoryDealGetDouble(ticket,DEAL_SWAP);
         int Magic=(int)HistoryDealGetInteger(ticket,DEAL_MAGIC);
         //string Simbolo=HistoryDealGetString(ticket,DEAL_SYMBOL);

         if(Magic==Magic_Number)
            if(entry==DEAL_ENTRY_OUT)
              {
               Profit_=Profit_+(true?Comision:0)+(true?Swap:0);
               Balance=Balance-Profit_;
              }
         //}
        }
     }
   return Balance;

   /*
      double GananciaLimitador=Balance*(LimitadorGanancia/100.0);
      double PerdidaLimitador=Balance*(LimitadorPerdida/100.0);

      if(LimitadorGanancia!=0)
         if(GananciaLimitador<=AccountInfoDouble(ACCOUNT_BALANCE)-Balance)
           {
            ComentarioLimitador="DETENIDO POR LIMITADOR GANANCIA "+ID;
            if(Cierre_en_Limitador)
              {
               CerrarOrdenes();
               DesaparecerOrdenes();
               TiempoInicio_=TiempoFinal_+1;
              }

            return false;
           }

      if(LimitadorPerdida!=0)
         if(PerdidaLimitador<=Balance-AccountInfoDouble(ACCOUNT_BALANCE))
           {
            if(Cierre_en_Limitador)
              {
               CerrarOrdenes();
               DesaparecerOrdenes();
               TiempoInicio_=TiempoFinal_+1;
              }

            ComentarioLimitador="DETENIDO POR LIMITADOR PERDIDA "+ID;
            return false;
           }
        */

  }
//+------------------------------------------------------------------+
void DibujarTodo()
  {
   int IndiceInicio=-1;
   int IndiceFinal=-1;

   MqlDateTime strFinal,strInicio;
   TimeToStruct(TimeCurrent(),strFinal);

   strFinal.hour=Final_Rango_Hora;
   strFinal.min=Final_Rango_Minutos;

   datetime TiempoBuscaFinal=StructToTime(strFinal);
   if(TiempoBuscaFinal>TimeCurrent())
      TiempoBuscaFinal=TiempoBuscaFinal-PeriodSeconds(PERIOD_D1);

   IndiceFinal=iBarShift(Symbol(),PERIOD_M1,TiempoBuscaFinal,true);

   for(int i=0; i<5 && IndiceFinal==-1; i++)
     {
      IndiceFinal=iBarShift(Symbol(),PERIOD_M1,TiempoBuscaFinal,true);
      TiempoBuscaFinal-=PeriodSeconds(PERIOD_D1);
     }
   if(IndiceFinal!=-1)
     {
      TimeToStruct(TiempoBuscaFinal,strInicio);

      strInicio.hour=Inicio_Rango_Hora;
      strInicio.min=Inicio_Rango_Minutos;

      datetime TiempoBuscaInicio=StructToTime(strInicio);

      if(TiempoBuscaInicio>TiempoBuscaFinal)
         TiempoBuscaInicio=TiempoBuscaInicio-PeriodSeconds(PERIOD_D1);

      IndiceInicio=iBarShift(Symbol(),PERIOD_M1,TiempoBuscaInicio,true);

      for(int i=0; i<5 && IndiceInicio==-1; i++)
        {
         IndiceInicio=iBarShift(Symbol(),PERIOD_M1,TiempoBuscaInicio,true);
         TiempoBuscaInicio-=PeriodSeconds(PERIOD_D1);
        }
     }

   if(IndiceFinal!=-1 && IndiceInicio!=-1)
     {
      H=iHigh(NULL,PERIOD_M1,iHighest(NULL,PERIOD_M1,MODE_HIGH,IndiceInicio-(IndiceFinal),IndiceFinal+1));
      L=iLow(NULL,PERIOD_M1,iLowest(NULL,PERIOD_M1,MODE_LOW,IndiceInicio-(IndiceFinal),IndiceFinal+1));

      if(ObjectFind(0,Rectangulo)==0)
         ObjectDelete(0,Rectangulo);

      int IndiceInicioPeriodo=iBarShift(NULL,Period(),iTime(NULL,PERIOD_M1,IndiceInicio));
      int IndiceFinalPeriodo=iBarShift(NULL,Period(),iTime(NULL,PERIOD_M1,IndiceFinal));


      if(VerRectangulo)
        {
         if(ObjectFind(0,Rectangulo)!=0)
            RectangleCreate(0,Rectangulo,0,iTime(NULL,Period(),IndiceFinalPeriodo),H,
                            iTime(NULL,Period(),IndiceInicioPeriodo),L,ColorRectangulo,STYLE_SOLID,1,FondoRectangulo,false,false,true,0);
         else
           {
            ObjectMove(0,Rectangulo,0,iTime(NULL,Period(),IndiceFinalPeriodo),H);
            ObjectMove(0,Rectangulo,1,iTime(NULL,Period(),IndiceInicioPeriodo),L);
           }
        }
      if(VerSesion)
        {
         if(ObjectFind(0,VInicio)!=0)
            VLineCreate(0,VInicio,0,TiempoInicio,ColorSession,STYLE_SOLID,1,false,false,true,0);
         else
            ObjectMove(0,VInicio,0,TiempoInicio,0);

         if(ObjectFind(0,VFinal)!=0)
            VLineCreate(0,VFinal,0,TiempoFinal,ColorSession,STYLE_SOLID,1,false,false,true,0);
         else
            ObjectMove(0,VFinal,0,TiempoFinal,0);
        }
      if(VerLineasEntra)
        {
         if(ObjectFind(0,Horizontales+"UP"+"ENTRA")!=0)
            TrendCreate(0,Horizontales+"UP"+"ENTRA",0,TiempoInicio,H-Point()*Puntos_Entra,TiempoFinal,H-Point()*Puntos_Entra,EntraColor,EntraEstilo,1,false,false,false,true,0);
         else
           {
            ObjectMove(0,Horizontales+"UP"+"ENTRA",0,TiempoInicio,H-Point()*Puntos_Entra);
            ObjectMove(0,Horizontales+"UP"+"ENTRA",1,TiempoFinal,H-Point()*Puntos_Entra);
           }

         if(ObjectFind(0,Horizontales+"DN"+"ENTRA")!=0)
            TrendCreate(0,Horizontales+"DN"+"ENTRA",0,TiempoInicio,L+Point()*Puntos_Entra,TiempoFinal,L+Point()*Puntos_Entra,EntraColor,EntraEstilo,1,false,false,false,true,0);
         else
           {
            ObjectMove(0,Horizontales+"DN"+"ENTRA",0,TiempoInicio,L+Point()*Puntos_Entra);
            ObjectMove(0,Horizontales+"DN"+"ENTRA",1,TiempoFinal,L+Point()*Puntos_Entra);
           }
        }

      if(Tipo_Ordenes==Ordenes_Pendientes)
         if(VerLineasCercania)
           {
            if(ObjectFind(0,Horizontales+"UP"+"CERCA")!=0)
               TrendCreate(0,Horizontales+"UP"+"CERCA",0,TiempoInicio,H-Point()*Puntos_Pendientes_Cercania,TiempoFinal,H-Point()*Puntos_Pendientes_Cercania,CercaniaColor,CercaniaEstilo,1,false,false,false,true,0);
            else
              {
               ObjectMove(0,Horizontales+"DN"+"CERCA",0,TiempoInicio,H-Point()*Puntos_Pendientes_Cercania);
               ObjectMove(0,Horizontales+"DN"+"CERCA",1,TiempoFinal,H-Point()*Puntos_Pendientes_Cercania);
              }

            if(ObjectFind(0,Horizontales+"DN"+"CERCA")!=0)
               TrendCreate(0,Horizontales+"DN"+"CERCA",0,TiempoInicio,L+Point()*Puntos_Pendientes_Cercania,TiempoFinal,L+Point()*Puntos_Pendientes_Cercania,CercaniaColor,CercaniaEstilo,1,false,false,false,true,0);
            else
              {
               ObjectMove(0,Horizontales+"DN"+"CERCA",0,TiempoInicio,L+Point()*Puntos_Pendientes_Cercania);
               ObjectMove(0,Horizontales+"DN"+"CERCA",1,TiempoFinal,L+Point()*Puntos_Pendientes_Cercania);
              }
           }
      ChartRedraw();
      CalculoValores=true;
     }
   else
     {
      Alert("No se encontro las barras necesarias para poder evaluar el rectangulo y las lineas");
      CalculoValores=false;
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CierresLIMITADORES()
  {
   HistorySelect(0,TimeCurrent());
   int hstTotal=HistoryDealsTotal();

   static datetime Dia=0,Mes=0;
   datetime diaActual=iTime(Symbol(),PERIOD_D1,0);
   datetime mesActual=iTime(Symbol(),PERIOD_MN1,0);
//datetime M1=ActualizarDatos(NULL,PERIOD_M1);
   if(Diario && Mensual)
      if(HistoryAnterior!=hstTotal)
        {
         Diario=true;
         Mensual=true;
         BalanceDia=GananciaPerdidaCerrada(diaActual);
         BalanceMes=GananciaPerdidaCerrada(mesActual);
         HistoryAnterior=hstTotal;
        }
   if(Dia!=diaActual)
     {
      Diario=true;
      BalanceDia=GananciaPerdidaCerrada(diaActual);
      Dia=diaActual;
     }
   if(Mes!=mesActual)
     {
      Mensual=true;
      BalanceMes=GananciaPerdidaCerrada(mesActual);
      Mes=mesActual;
     }

   if(Mensual)
      Mensual=EvaluarBalanceProfitsAbiertos(BalanceMes,"MENSUAL",Ganancia_Limitador_Porcentaje_Mensual,Perdida_Limitador_Porcentaje_Mensual);

   if(Diario)
      Diario=EvaluarBalanceProfitsAbiertos(BalanceDia,"DIARIA",Ganancia_Limitador_Porcentaje_Diario,Perdida_Limitador_Porcentaje_Diario);

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluarBalanceProfitsAbiertos(double Balance,string ID,double LimitadorGanancia,double LimitadorPerdida)
  {

   int Total=PositionsTotal();
   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)==Magic_Number && PositionGetSymbol(i)==Symbol())
         Balance=Balance-PositionGetDouble(POSITION_PROFIT)-PositionGetDouble(POSITION_SWAP);
     }


   double GananciaLimitador=Balance*(LimitadorGanancia/100.0);
   double PerdidaLimitador=Balance*(LimitadorPerdida/100.0);

   if(LimitadorGanancia!=0)
      if(GananciaLimitador<=AccountInfoDouble(ACCOUNT_BALANCE)-Balance)
        {
         ComentarioLimitador="DETENIDO POR LIMITADOR GANANCIA "+ID;
         if(Cierre_en_Limitador)
           {
            CerrarOrdenes();
            TiempoInicio=TiempoFinal+1;
           }
         DesaparecerOrdenes();
         return false;
        }

   if(LimitadorPerdida!=0)
      if(PerdidaLimitador<=Balance-AccountInfoDouble(ACCOUNT_BALANCE))
        {
         if(Cierre_en_Limitador)
           {
            CerrarOrdenes();
            TiempoInicio=TiempoFinal+1;
           }
         DesaparecerOrdenes();

         ComentarioLimitador="DETENIDO POR LIMITADOR PERDIDA "+ID;
         return false;
        }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void InicializarCuadros()
  {
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   if(TiempoInicio==0 && TiempoFinal==0)
     {
      MqlDateTime str1;
      TimeToStruct(TimeCurrent(),str1);

      str1.hour=Inicio_Sesion_Hora;
      str1.min=Inicio_Sesion_Minutos;

      datetime TiempoBusca=StructToTime(str1);
      if(TiempoBusca>TimeCurrent())
         TiempoBusca=TiempoBusca-PeriodSeconds(PERIOD_D1);

      int shift=iBarShift(Symbol(),PERIOD_M1,TiempoBusca,true);

      for(int i=0; i<5 && shift==-1; i++)
        {
         shift=iBarShift(Symbol(),PERIOD_M1,TiempoBusca,true);
         TiempoBusca-=PeriodSeconds(PERIOD_D1);
        }
      if(shift!=-1)
        {
         TiempoInicio=iTime(NULL,PERIOD_M1,shift);
         TiempoFinal=TiempoInicio+(Inicio_Sesion_Hora>Fin_Sesion_Hora?((24-Inicio_Sesion_Hora+Fin_Sesion_Hora)*60*60):((Fin_Sesion_Hora-Inicio_Sesion_Hora)*60*60))-
                     (Inicio_Sesion_Minutos*60)+(Fin_Sesion_Minutos)*60;
         TiempoInicioTrades=TiempoInicio;

         CalculoValores=false;
         DibujarTodo();
         EntroBuy=Ask<H?true:false;
         EntroSell=Bid>L?true:false;
        }
     }
  }
//+------------------------------------------------------------------+
