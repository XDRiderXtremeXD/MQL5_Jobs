//+------------------------------------------------------------------+
//|                                                       Rango2.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict


#include <RangoHorario.mqh>
#include <Trade\AccountInfo.mqh>
CAccountInfo infoTrade;
//#include <BalanceHistory.mqh>

#include<Trade\Trade.mqh>
CTrade trade;

enum tipoBalance
  {
   INICIAL=0,
   GLOBAL=1,
  };

//BalanceHistory BalanceInicial;

input int Desfase_Puntos_COMPRA=0;
input int Desfase_Puntos_VENTA=0;
tipoBalance TipoBalance=GLOBAL;
input string S01="====== CONF TRADE =======";//======
input double PorcentajeLoteBalance=10;//Porcentaje Lote Balance
input string S02="====== CONF STOPS =======";//======
input int SL_Puntos=200;//SL Puntos
input double Relacion_TP=2;//TP:SL relacion TakeProfit
input string S012="====== CONF BE =======";//======
input bool Habilitar_BE=true;
input double Porcentaje_TP=50;
input double Desfase_BE_Puntos=5;
input string S1="====== FRANJA HORARIA 1 =======";//======
input string TiempoStart1="09:00";//Tiempo Start
input string TiempoEnd1="22:00";//Tiempo End
input string TiempoStart_Evaluacion="01:00";//Tiempo Poner Pendientes
input string Tiempo_finalizacion_Pendientes_Y_Reales="23:00";//Tiempo Evaluacion Finalizacion Reales y Pendientes
input color  Color_Franja1=clrYellow;//Color Franja
input string S0="====== CONF ID TRADE =======";//======
input string comentarioTrades="Expert";
input int numeroMagico=2222222;

RangoHorario horario_1;

struct structRango
  {
   double            high;
   double            low;
   bool              evaluar;
   int               ticketBuy;
   int               ticketSell;
   int               horaUntil;
   int               minutoUntil;
   datetime          tiempoUntil;
   color             colorArrow;
   int               ticket;
   bool              venta;
   bool              compra;
   int               horaEvaluacion;
   int               minutoEvaluacion;
   datetime          comentarioUltimo;
  };
struct restriccionRango
  {
   int               minPuntos;
   int               maxPuntos;
  };


structRango rangos[1];
string Lineas="LINEAS 2023 UNTIL";
string path="";
datetime TiempoInicial;
int ordenesHistoryAnterior=0;
double perdidaActual=0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(!horario_1.CrearLogicaRango(TiempoStart1,TiempoEnd1,"Rango1",Color_Franja1))
      return INIT_FAILED;

   if(!SetHoraMinutoUntil())
      return INIT_FAILED;

   if(!SetHoraMinutoEvaluacion())
      return INIT_FAILED;


   path="DataRangoPro"+"//"+IntegerToString(ChartID());
   ReadData();
   ordenesHistoryAnterior=0;
   perdidaActual=0;

   trade.SetExpertMagicNumber(numeroMagico);

   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   FileDelete(path);
   if(!(reason==REASON_CHARTCHANGE))
     {
      horario_1.EliminarCuadro();
      ObjectsDeleteAll(0,Lineas,0,OBJ_VLINE);
     }
   if(reason==REASON_CLOSE || reason==REASON_CHARTCHANGE)
      WriteData();
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {

   EjecutarSistemas();

   if(horario_1.NuevoRango())
     {
      SetStructSystem(horario_1.GetHighRango(),horario_1.GetLowRango(),rangos[0],true,true);
      CrearMoveLineaUntil(0);
     }

   SeleccionarTrades();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  OnChartEvent(const int id,         // Event ID
                   const long& lparam,   // Parameter of type long event
                   const double& dparam, // Parameter of type double event
                   const string& sparam  // Parameter of type string events
                  )
  {

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarOperaciones()
  {
   int totalOperaciones=PositionsTotal();
   for(int i=totalOperaciones-1; i>=0; i--)
     {
      ulong ticket=PositionGetTicket(i);

      if(ticket==0)
         continue;

      if(PositionGetString(POSITION_SYMBOL)!=Symbol() || PositionGetInteger(POSITION_MAGIC)!=numeroMagico)
         continue;

      trade.PositionClose(ticket,-1);

     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarPendientes()
  {
   int totalOperaciones=OrdersTotal();
   for(int i=totalOperaciones-1; i>=0; i--)
     {
      ulong ticket=OrderGetTicket(i);

      if(ticket==0)
         continue;

      if(OrderGetString(ORDER_SYMBOL)!=Symbol() || OrderGetInteger(ORDER_MAGIC)!=numeroMagico)
         continue;

      trade.OrderDelete(ticket);

     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarRestriccion(double high,double low,restriccionRango &restricciones_[])
  {
   int puntos=int(MathAbs(high-low)/Point());
   int size=ArraySize(restricciones_);
   for(int i=0; i<size; i++)
     {
      if(restricciones_[i].minPuntos<=puntos && puntos<=restricciones_[i].maxPuntos)
         return true;
     }
   Print("RESTRICCION CUADRO El cuadro con high ",high," y low ",low," tiene ",puntos," puntos y no generara operacion debido a las restricciones");
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CaptarRestricciones(restriccionRango &restriciones_[],string restriccion)
  {
   string restricciones_string[];
   StringSplit(restriccion,'-',restricciones_string);
   int sizeRestricciones=ArraySize(restricciones_string);

   if(sizeRestricciones<=0)
     {
      Alert("Poner por lo menos un rango de restricciones");
      return false;
     }
   ArrayResize(restriciones_,sizeRestricciones);

   for(int i=0; i<sizeRestricciones; i++)
     {
      int min,max;
      if(!VerificarRangoPuntos(restricciones_string[i],min,max))
         return false;
      restriciones_[i].minPuntos=min;
      restriciones_[i].maxPuntos=max;
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarRangoPuntos(string rangoPuntos,int &minimo,int &maximo)
  {
   string rangoPuntos_string[];
   StringSplit(rangoPuntos,':',rangoPuntos_string);
   int sizeRangoPuntos=ArraySize(rangoPuntos_string);

   if(sizeRangoPuntos!=2)
     {
      Alert("Formato Invalido en ",rangoPuntos," siga el ejemplo");
      return false;
     }

   string comentario_="";
   if(!VerificarEntero(rangoPuntos_string[0],comentario_))
     {
      Alert("Los valores del rango deben ser enteros en ",rangoPuntos);
      return false;
     }
   if(!VerificarEntero(rangoPuntos_string[1],comentario_))
     {
      Alert("Los valores del rango deben ser enteros en ",rangoPuntos);
      return false;
     }

   minimo=(int)StringToInteger(rangoPuntos_string[0]);
   maximo=(int)StringToInteger(rangoPuntos_string[1]);

   if(minimo>maximo)
     {
      Alert("Valor de la izquierda debe ser mayor en el rango puntos ",rangoPuntos);
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CrearMoveLineaUntil(int indexRango)
  {
   string nameLine=Lineas+IntegerToString(indexRango);
   if(ObjectFind(0,nameLine)!=0)
     {
      ObjectCreate(0,nameLine,OBJ_VLINE,0,rangos[indexRango].tiempoUntil,1);
      ObjectSetInteger(0,nameLine,OBJPROP_COLOR,rangos[indexRango].colorArrow);
      ObjectSetInteger(0,nameLine,OBJPROP_BACK,false);
      ObjectSetInteger(0,nameLine,OBJPROP_SELECTABLE,false);
      ObjectSetInteger(0,nameLine,OBJPROP_SELECTED,false);
      ObjectSetInteger(0,nameLine,OBJPROP_WIDTH,1);
     }

   ObjectSetInteger(0,nameLine,OBJPROP_TIME,rangos[indexRango].tiempoUntil);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetHoraMinutoUntil()
  {
   int hora,minuto;
   if(!SacarHoraMinuto(Tiempo_finalizacion_Pendientes_Y_Reales,hora,minuto))
      return false;
   rangos[0].horaUntil=hora;
   rangos[0].minutoUntil=minuto;
   rangos[0].colorArrow=Color_Franja1;

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetHoraMinutoEvaluacion()
  {
   int hora,minuto;
   if(!SacarHoraMinuto(TiempoStart_Evaluacion,hora,minuto))
      return false;
   rangos[0].horaEvaluacion=hora;
   rangos[0].minutoEvaluacion=minuto;

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EjecutarSistemas()
  {
   int i=0;

   MqlDateTime tcurrent;
   TimeToStruct(TimeCurrent(),tcurrent);

   VerificarOperacionActivada(rangos[i]);

   if(tcurrent.hour==rangos[i].horaUntil && tcurrent.min==rangos[i].minutoUntil)
     {
      CerrarPendientes();
      CerrarOperaciones();
     }


   if(tcurrent.hour==rangos[i].horaEvaluacion && tcurrent.min==rangos[i].minutoEvaluacion)
     {
      if(rangos[i].evaluar)
        {
         double high_level=rangos[i].high+Desfase_Puntos_COMPRA*Point();
         double low_level=rangos[i].low-Desfase_Puntos_VENTA*Point();

         rangos[i].comentarioUltimo=TimeCurrent();
         string comentario=TimeToString(rangos[i].comentarioUltimo,TIME_DATE|TIME_MINUTES);
         OperacionRango(true,rangos[i],high_level,comentario);

         OperacionRango(false,rangos[i],low_level,comentario);
        }
      rangos[i].evaluar=false;
     }

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void VerificarOperacionActivada(structRango &rango)
  {
   int totalOperaciones=PositionsTotal();
   for(int i=totalOperaciones-1; i>=0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket==0)
         continue;

      if(PositionGetString(POSITION_SYMBOL)!=Symbol() || PositionGetInteger(POSITION_MAGIC)!=numeroMagico)
         continue;

      if(TimeToString(rango.comentarioUltimo,TIME_DATE|TIME_MINUTES)==PositionGetString(POSITION_COMMENT))
        {
         EliminarContraria(PositionGetString(POSITION_COMMENT));
         break;
        }
     }
  }
  
void EliminarContraria(string comentario){
 
  int totalOperaciones=OrdersTotal();
   for(int i=totalOperaciones-1; i>=0; i--)
     {
      ulong ticket=OrderGetTicket(i);
      if(ticket==0)
         continue;

      if(OrderGetString(ORDER_SYMBOL)!=Symbol() || OrderGetInteger(ORDER_MAGIC)!=numeroMagico)
         continue;

      if(comentario==OrderGetString(ORDER_COMMENT))
        {
         trade.OrderDelete(ticket);
         break;
        }
     }
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OperacionRango(bool IsBuy,structRango &rango,double price,string comentario)
  {
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

//double rangoAlturaSL=(rango.high-rango.low)*Porcentaje_SL/100.0;
   double stopbuy=SL_Puntos==0?0:price-SL_Puntos*Point();
   double stopsell=SL_Puntos==0?0:price+SL_Puntos*Point();

//int rangoAlturaPuntos=int(rangoAlturaSL/Point());
   int stops=(int)SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL);
   int distanciaStop=int((IsBuy?MathAbs(Ask-rango.high):MathAbs(rango.low-Bid))/Point());

   double Lote=0.01;
   if(GetLote(IsBuy,SL_Puntos+10,Lote,price))
     {
      int ticket=-1;
      if(IsBuy?(Ask>price):(Bid<price) || (IsBuy?(Ask<=price):(Bid>=price) && distanciaStop<=stops))
        {
        double slBuy=NormalizeDouble(SL_Puntos==0?0:Ask-SL_Puntos*Point(),Digits());
        double slSell=NormalizeDouble(SL_Puntos==0?0:Bid+SL_Puntos*Point(),Digits());
        
         if(IsBuy)
            trade.Buy(Lote,Symbol(),Ask,slBuy,0,comentario);
         else
            trade.Sell(Lote,Symbol(),Bid,slSell,0,comentario);
        }
      else
        {
         if(IsBuy)
            trade.BuyStop(Lote,NormalizeDouble(price,Digits()),Symbol(),stopbuy,0,0,0,comentario);
         else
            trade.SellStop(Lote,NormalizeDouble(price,Digits()),Symbol(),stopsell,0,0,0,comentario);
        }
     }
  }

enum redondeoLote
  {
   HACIA_ARRIBA = 0,
   HACIA_ABAJO = 1,
   NORMAL = 2,
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool GetLote(int tipo,int pointsSL,double &Lotes,double price)
  {
   double Min_Lots = SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);//Buscar el lotaje minimo permitido por el broker
   double Max_Lots = SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);// Buscar el lotaje maximo permitido por el broker.
// double Lot_Size = SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_);//Buscar el tamaño del lote en la moneda base de la cuenta.
   int Stop_Level =(int)SymbolInfoInteger(Symbol(),SYMBOL_TRADE_STOPS_LEVEL); //Buscar los niveles stop de la cuenta
   int Leverage =(int) AccountInfoInteger(ACCOUNT_LEVERAGE);//Buscar el apalancamiento de la cuenta
   double TickValue=SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_VALUE);
   double stepValue=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);

   double balanceProfit=AccountInfoDouble(ACCOUNT_BALANCE);

   double Perdida=balanceProfit*PorcentajeLoteBalance/100.0;

   Lotes=Perdida/(TickValue*pointsSL);
   Lotes=RoundDouble(Lotes,2,HACIA_ABAJO);

   double Resultado=Lotes/stepValue;

   if(Resultado-int(Resultado)>0.000)
      Lotes=RoundDouble(int(RoundDouble(Resultado,0,HACIA_ABAJO))*stepValue,2,HACIA_ABAJO);

   if(Lotes<Min_Lots)
     {
      Lotes=Min_Lots;
      //Print("ERROR Lote calculado ",Lotes," para el simbolo ",Simbolo," es menor al minimo ",Min_Lots," NO OPERA");
      //return false;
     }
   else
      if(Lotes>Max_Lots)
        {
         Lotes=Max_Lots;
        }
//Que hacer si no tenemos suficiente margen en la cuenta

   if(infoTrade.FreeMarginCheck(Symbol(),ORDER_TYPE_BUY,Lotes,price)<=0 ||  GetLastError()==134)
     {
      Print("ALERTA, NO HAY MARGEN SUFICIENTE");
      Print("EL CAPIITAL ACTUAL ES: ", infoTrade.FreeMargin());
      Print("LA CANTIDAD ACTUAL DE LOTES POR OPERACION ES: ",Lotes);
      //  Print("DETENIENDO EA...");
      //ExpertRemove(); //Alertar y detener el bot
      return false;
     }
   return true;
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
void SetStructSystem(double high,double low,structRango &rango,bool venta,bool compra)
  {
   rango.high=high;
   rango.low=low;
   rango.ticketBuy=0;
   rango.ticketSell=0;
   rango.evaluar=true;
   MqlDateTime str1;
   TimeToStruct(TimeCurrent(),str1);

   rango.tiempoUntil=GetTiempoUntilRango(rango)+((str1.hour<=rango.horaUntil && rango.horaEvaluacion<rango.horaUntil)?PeriodSeconds(PERIOD_D1):0);

   rango.venta=true;
   rango.compra=true;
   Print("Se genero sistema high ",rango.high," low ",low," Tiempo duracion: ",TimeToString(rango.tiempoUntil,TIME_DATE|TIME_MINUTES));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime GetTiempoUntilRango(structRango &rango)
  {
   datetime tiempoUntil=TimeCurrent();
   MqlDateTime str1;
   TimeToStruct(tiempoUntil,str1);

   int hora=str1.hour;
   int minuto=str1.min;

   if(hora>rango.horaUntil)
      tiempoUntil=tiempoUntil+PeriodSeconds(PERIOD_D1);

   if(hora==rango.horaUntil)
      if(minuto>rango.minutoUntil)
         tiempoUntil=tiempoUntil+PeriodSeconds(PERIOD_D1);

   MqlDateTime structTiempo;
   TimeToStruct(tiempoUntil,structTiempo);
   structTiempo.hour=rango.horaUntil;
   structTiempo.min=rango.minutoUntil;
   structTiempo.sec=0;
   tiempoUntil=StructToTime(structTiempo);

   Print("Tiempo Duracion para este rango ",TimeToString(tiempoUntil,TIME_DATE|TIME_MINUTES));

   return tiempoUntil;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SeleccionarTrades()
  {
   int totalOperaciones=PositionsTotal();
   for(int i=totalOperaciones-1; i>=0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket==0)
         continue;

      if(PositionGetString(POSITION_SYMBOL)!=Symbol() || PositionGetInteger(POSITION_MAGIC)!=numeroMagico)
         continue;

      double SL=PositionGetDouble(POSITION_SL);
      double TP=PositionGetDouble(POSITION_TP);
      double OP=PositionGetDouble(POSITION_PRICE_OPEN);
      int tipo=(int)PositionGetInteger(POSITION_TYPE);
      PonerTP(OP,SL,TP,tipo);
      LogicaBE(OP,SL,TP,tipo);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void LogicaBE(double OP,double SL,double TP,int tipo)
  {
   if(!Habilitar_BE)
      return;

   if(TP==0)
      return;

   int puntos=int(MathAbs(TP-OP)/Point());
   int puntosStart=int(puntos*Porcentaje_TP/100.0);

   if(tipo==POSITION_TYPE_BUY && puntosStart>0 && NormalizeDouble(PositionGetDouble(POSITION_PRICE_CURRENT)-puntosStart*Point(),Digits())>=OP &&
      ((SL<NormalizeDouble(OP+Desfase_BE_Puntos*Point(),Digits())) || SL==0)  && PositionGetDouble(POSITION_PRICE_CURRENT)>NormalizeDouble(OP+Desfase_BE_Puntos*Point(),Digits()))

      if(!trade.PositionModify(PositionGetInteger(POSITION_TICKET),NormalizeDouble(OP+Desfase_BE_Puntos*Point(),Digits()),TP))
         Print("No modifico SL ERROR: ",GetLastError()," redcode: ",trade.ResultRetcode());

   if(tipo==POSITION_TYPE_SELL && puntosStart>0 && NormalizeDouble(PositionGetDouble(POSITION_PRICE_CURRENT)+puntosStart*Point(),Digits())<=OP &&
      ((SL>NormalizeDouble(OP-Desfase_BE_Puntos*Point(),Digits())) || SL==0) && PositionGetDouble(POSITION_PRICE_CURRENT)<NormalizeDouble(OP-Desfase_BE_Puntos*Point(),Digits()))
      if(!trade.PositionModify(PositionGetInteger(POSITION_TICKET),NormalizeDouble(OP-Desfase_BE_Puntos*Point(),Digits()),TP))
         Print("No modifico SL ERROR: ",GetLastError()," redcode: ",trade.ResultRetcode());

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PonerTP(double OP,double SL,double TP,int tipo)
  {
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);

   if(TP==0 && SL!=0)
     {
      if(tipo==POSITION_TYPE_BUY?(SL>OP):(SL<OP))
         return;

      double levelTP=NormalizeDouble(OP+MathAbs(SL-OP)*Relacion_TP*(tipo==POSITION_TYPE_BUY?1:-1),Digits());

      if(tipo==POSITION_TYPE_BUY?(Bid>=levelTP):(Ask<=levelTP))
         return;

      //Print(tipo==OP_BUY?"BUY":"SELL"+" level TP "+levelTP+"  ",OrderTicket());

      if(!trade.PositionModify(PositionGetInteger(POSITION_TICKET),SL,levelTP))
         Print("No modifico TP en "+(tipo==POSITION_TYPE_BUY?"buy":"sell")+" "+string(PositionGetInteger(POSITION_TICKET))+" error: "+IntegerToString(GetLastError()));
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void WriteData()
  {
   Print("Guardando data ");
//--- open the file
   ResetLastError();
   int handle=FileOpen(path,FILE_READ|FILE_WRITE|FILE_BIN);
   if(handle!=INVALID_HANDLE)
     {
      FileSeek(handle,0,SEEK_SET);
      FileWriteArray(handle,rangos,0,WHOLE_ARRAY);
      FileClose(handle);
     }
   else
      Print("Failed to open the file, error ",GetLastError());
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ReadData()
  {
   ResetLastError();
   int file_handle=FileOpen(path,FILE_READ|FILE_BIN);
   if(file_handle!=INVALID_HANDLE)
     {
      FileReadArray(file_handle,rangos);
      int size=ArraySize(rangos);
      Print("Cargando...");
      for(int i=0; i<size; i++)
        {
         string comentario="";
         comentario+=("high: "+DoubleToString(rangos[i].high,Digits())+" | ");
         comentario+=("low: "+DoubleToString(rangos[i].low,Digits())+" | ");
         comentario+=("evaluar: "+IntegerToString(rangos[i].evaluar)+" | ");
         comentario+=("ticketBuy: "+IntegerToString(rangos[i].ticketBuy)+" | ");
         comentario+=("ticketSell: "+IntegerToString(rangos[i].ticketSell)+" | ");
         comentario+=("horaUntil: "+IntegerToString(rangos[i].horaUntil)+" | ");
         comentario+=("minutoUntil: "+IntegerToString(rangos[i].minutoUntil)+" | ");
         comentario+=("tiempoUntil: "+TimeToString(rangos[i].tiempoUntil,TIME_DATE|TIME_MINUTES)+" | ");
         comentario+=("colorArrow: "+ColorToString(rangos[i].colorArrow)+" | ");
         comentario+=("ticket: "+IntegerToString(rangos[i].ticket)+" | ");
         Print(comentario);
        }
      FileClose(file_handle);
     }
  }

//+------------------------------------------------------------------+
datetime ActualizarDatos(string Simbolo,ENUM_TIMEFRAMES TimeFrames)
  {
   /*datetime daytimes[];
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
   if(Actualizar_==false)
      Print(" Simbolo Actualizado ",Simbolo);*/


   return iTime(Simbolo,TimeFrames,0);
  }
//+------------------------------------------------------------------+
bool LabelCreate(const long              chart_ID=0,               // chart's ID
                 const string            name="Label",             // label name
                 const int               sub_window=0,             // subwindow index
                 const int               x=0,                      // X coordinate
                 const int               y=0,                      // Y coordinate
                 const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                 const string            text="Label",             // text
                 const string            font="Arial",             // font
                 const int               font_size=10,             // font size
                 const color             clr=clrRed,               // color
                 const double            angle=0.0,                // text slope
                 const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // anchor type
                 const bool              back=false,               // in the background
                 const bool              selection=false,          // highlight to move
                 const bool              hidden=true,              // hidden in the object list
                 const long              z_order=0)                // priority for mouse click
  {
//--- reset the error value
   ResetLastError();
//--- create a text label
   if(!ObjectCreate(chart_ID,name,OBJ_LABEL,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": failed to create text label! Error code = ",GetLastError());
      return(false);
     }
//--- set label coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set the chart's corner, relative to which point coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set the text
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- set text font
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- set font size
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- set the slope angle of the text
   ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);
//--- set anchor type
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
//--- set color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- enable (true) or disable (false) the mode of moving the label by mouse
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
