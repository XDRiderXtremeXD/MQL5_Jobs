//+------------------------------------------------------------------+
//|                                                   EA Diario2.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

int HandleADX=0;


#include<Trade\Trade.mqh>
CTrade trade;


enum ENUM_Horas {_0am=0,_1am=1,_2am=2,_3am=3,_4am=4,_5am=5,_6am=6,_7am=7,_8am=8,_9am=9,_10am=10,_11am=11,_12pm=12,
                 _1pm=13,_2pm=14,_3pm=15,_4pm=16,_5pm=17,_6pm=18,_7pm=19,_8pm=20,_9pm=21,_10pm=22,_11pm=23,
                };

ENUM_TIMEFRAMES TimeFrame=PERIOD_H1;

input bool Borrar_Orden_Contraria=true;
input int Desfase=0;//Desfase en Puntos
input string S13="------------------SETTINGS TOLERANCIA---------------";//-------------------------------------------------
input bool Activar_Tolerancia_Rango=true;
input int SizeMaximo=200;//Tamaño Maximo en Puntos del rangp
input string S1="------------------SETTINGS HOUR---------------";//-------------------------------------------------
input ENUM_Horas Hora_Start=_1am;
input uint Minuto_Start=0;
input ENUM_Horas Hora_End=_10am;
input uint Minuto_End=0;
input string S12="------------------ DAYS------------------";//=========================================
input bool Lunes=true;
input bool Martes=true;
input bool Miercoles=true;
input bool Jueves=true;
input bool Viernes=true;
input string S2="------------------SETTINGS TRADING---------------";//--------------------------------------------------
input double Lote=0.01;
input int StopLoss=100;
input int TakeProfit=100;
input int MagicNumber=22030;
input string S5="------------------TRAILING STOP---------------";//--------------------------------------------------
input bool UseTrailing=false;
input int Trail_Start=100;//Empezar Trailing stop valor en (Puntos) en Profit
input int Trail_Stop=100;//Paso Trailing stop Valor en (Puntos)
input string S6="------------------BREAK EVEN---------------";//--------------------------------------------------
input bool UseBreakEven=false;
input uint Breakeven=10;
input string S7="------------------SETTINGS CUADRO---------------";//--------------------------------------------------
input color clrLinea=clrAqua;
input ENUM_LINE_STYLE estiloLinea=STYLE_DASH;
input int widthLinea=1;

string Cuadro="CUADRO UP 2023A";

ulong TicketUP=-1;
ulong TicketDN=-1;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(Minuto_Start>59 || Minuto_End>59)
     {
      Alert("Los minutos deben ser menor que 60");
      return INIT_FAILED;
     }

   trade.SetExpertMagicNumber(MagicNumber);

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectDelete(0,Cuadro);
   ObjectsDeleteAll(0,Cuadro,0,OBJ_VLINE);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   TS_and_BE();
   if(Borrar_Orden_Contraria)
   EliminarContraria();

   if(!ActualizarDatos(Symbol(),PERIOD_D1))
      ExpertRemove();
   if(!ActualizarDatos(Symbol(),PERIOD_M1))
      ExpertRemove();

   static datetime TIEMPOACTUAL=0;

   MqlDateTime TIEMPODAY;
   TimeToStruct(TimeCurrent(),TIEMPODAY);



   if(TIEMPOACTUAL!=iTime(NULL,PERIOD_D1,0))
     {
      if((TIEMPODAY.day_of_week==1 && Lunes) || (TIEMPODAY.day_of_week==2 && Martes)
         || (TIEMPODAY.day_of_week==3 && Miercoles) || (TIEMPODAY.day_of_week==4 && Jueves) || (TIEMPODAY.day_of_week==5 && Viernes))
        {
         if(TIEMPODAY.hour==Hora_End && TIEMPODAY.min==Minuto_End)
           {
            TicketUP=-1;
            TicketDN=-1;

            MqlDateTime Evalua;
            int BarStart,BarEnd;
            CalcularTiempos(BarStart,BarEnd);
            TimeToStruct(iTime(NULL,PERIOD_D1,0)+PeriodSeconds(PERIOD_D1),Evalua);
            Evalua.min=0;
            Evalua.sec=0;
            Evalua.hour=Hora_End;
            datetime TiempoEvalua=StructToTime(Evalua);

            double ValorMaximo=iHigh(Symbol(),PERIOD_M1,iHighest(Symbol(),PERIOD_M1,MODE_HIGH,BarStart-BarEnd,BarEnd));
            double ValorMinimo=iLow(Symbol(),PERIOD_M1,iLowest(Symbol(),PERIOD_M1,MODE_LOW,BarStart-BarEnd,BarEnd));

            if((Activar_Tolerancia_Rango && ((ValorMaximo-ValorMinimo)/SymbolInfoDouble(Symbol(),SYMBOL_POINT))<=SizeMaximo)|| !Activar_Tolerancia_Rango)
              {
               double SL=StopLoss==0?0:ValorMinimo+StopLoss*Point()-Desfase*Point();
               double TP=TakeProfit==0?0:ValorMinimo-TakeProfit*Point()-Desfase*Point();
               bool EjecutoGlobal=false;

               bool Ejecuto=0;
               Ejecuto=trade.SellStop(Lote,ValorMinimo-Desfase*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,TiempoEvalua,NULL);
               if(Ejecuto==false)
                  Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
               else
                 {
                  Print("RETCODE   ",trade.ResultRetcode());
                  TicketDN=trade.ResultOrder();
                  Print("ORDER   ",TicketDN);
                  EjecutoGlobal=true;
                  TIEMPOACTUAL=iTime(NULL,PERIOD_D1,0);
                 }

               SL=StopLoss==0?0:ValorMaximo-StopLoss*Point()+Desfase*Point();
               TP=TakeProfit==0?0:ValorMaximo+TakeProfit*Point()+Desfase*Point();

               Ejecuto=0;
               Ejecuto=trade.BuyStop(Lote,ValorMaximo+Desfase*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,TiempoEvalua,NULL);
               if(Ejecuto==false)
                  Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
               else
                 {
                  Print("RETCODE   ",trade.ResultRetcode());
                  TicketUP=trade.ResultOrder();
                  Print("ORDER   ",TicketUP);
                  EjecutoGlobal=true;
                  TIEMPOACTUAL=iTime(NULL,PERIOD_D1,0);
                 }


               if(EjecutoGlobal)
                 {

                  datetime TiempoInicio=iTime(Symbol(),PERIOD_M1,BarEnd);
                  datetime TiempoFinal=iTime(Symbol(),PERIOD_M1,BarStart);
                  if(ObjectFind(0,Cuadro+"START")!=0)
                     VLineCreate(0,Cuadro+"START",0,TiempoInicio,clrLinea,estiloLinea,widthLinea,false,false,true,true,0);
                  else
                     ObjectSetInteger(0,Cuadro+"START",OBJPROP_TIME,0,TiempoInicio);

                  if(ObjectFind(0,Cuadro+"END")!=0)
                     VLineCreate(0,Cuadro+"END",0,TiempoFinal,clrLinea,estiloLinea,widthLinea,false,false,true,true,0);
                  else
                     ObjectSetInteger(0,Cuadro+"END",OBJPROP_TIME,0,TiempoFinal);

                  if(ObjectFind(0,Cuadro)!=0)
                    {
                     if(!RectangleCreate(0,Cuadro,0,TiempoFinal,ValorMaximo,TiempoInicio,ValorMinimo,clrLinea,estiloLinea,widthLinea,true,false,false,true,0))
                        Print("No creo cuadro ERROR ",GetLastError());
                    }
                  else
                    {
                     ObjectSetInteger(0,Cuadro,OBJPROP_COLOR,0,clrLinea);
                     ObjectSetDouble(0,Cuadro,OBJPROP_PRICE,0,ValorMaximo);
                     ObjectSetDouble(0,Cuadro,OBJPROP_PRICE,1,ValorMinimo);
                     ObjectSetInteger(0,Cuadro,OBJPROP_TIME,0,TiempoFinal);
                     ObjectSetInteger(0,Cuadro,OBJPROP_TIME,1,TiempoInicio);
                    }
                  ChartRedraw();
                 }
              }
            else
              {
               TIEMPOACTUAL=iTime(NULL,PERIOD_D1,0);
              }
           }
        }
     }

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RectangleCreate(const long            chart_ID=0,        // ID del gráfico
                     const string          name="Rectangle",  // nombre del rectángulo
                     const int             sub_window=0,      // número de subventana
                     datetime              time1=0,           // hora del primer punto
                     double                price1=0,          // precio del primer punto
                     datetime              time2=0,           // hora del segundo punto
                     double                price2=0,          // precio del segundo punto
                     const color           clr=clrRed,        // color del rectángulo
                     const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de las líneas del rectángulo
                     const int             width=1,           // grosor de las líneas del rectángulo
                     const bool            fill=false,        // relleno del rectángulo con el color
                     const bool            back=false,        // al fondo
                     const bool            selection=true,    // seleccionar para mover
                     const bool            hidden=true,       // ocultar en la lista de objetos
                     const long            z_order=0)         // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos el rectángulo según las coordenadas establecidas
   if(!ObjectCreate(chart_ID,name,OBJ_RECTANGLE,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear el rectángulo! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos el color del rectángulo
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el estilo de las líneas del rectángulo
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- establecemos el grosor de las líneas del rectángulo
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- activar (true) o desactivar (false) el modo de relleno del rectángulo
   ObjectSetInteger(chart_ID,name,OBJPROP_FILL,fill);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de selección del rectángulo para mover
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
//|                                                                  |
//+------------------------------------------------------------------+
bool VLineCreate(const long            chart_ID=0,        // ID del gráfico
                 const string          name="VLine",      // nombre de la línea
                 const int             sub_window=0,      // índice de subventana
                 datetime              time=0,            // hora de la línea
                 const color           clr=clrRed,        // color de la línea
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de la línea
                 const int             width=1,           // grosor de la línea
                 const bool            back=false,        // al fondo
                 const bool            selection=true,    // seleccionar para mover
                 const bool            ray=true,          // continuación de la línea abajo
                 const bool            hidden=true,       // ocultar en la lista de objetos
                 const long            z_order=0)         // prioridad para el clic del ratón
  {
//--- si la hora de la línea no está definida, la trazamos en la última barra
   if(!time)
      time=TimeCurrent();
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la línea vertical
   if(!ObjectCreate(chart_ID,name,OBJ_VLINE,sub_window,time,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la línea vertical! Código del error = ",GetLastError());
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
//--- activar (true) o desactivar (false) el modo de visualización de la línea en las subventanas del gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY,ray);
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- establecemos la prioridad para obtener el evento de cliquear sobre el gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- ejecución con éxito
   return(true);
  }
//+------------------------------------------------------------------+
bool ActualizarDatos(string Simbolo,ENUM_TIMEFRAMES TimeFrames)
  {
   if(TimeFrames==PERIOD_CURRENT)
     {
      TimeFrames=ENUM_TIMEFRAMES(Period());
     }
//---
   MqlRates rates[];
   ArraySetAsSeries(rates,true);

   int copied=CopyRates(Simbolo,TimeFrames,0,50,rates);

   uchar Conteo=13;

   while(copied<0 && !IsStopped())
     {
      ResetLastError();
      Conteo--;
      Print("Cargando datos históricos para el símbolo ",Simbolo);
      Sleep(1000);
      copied=CopyRates(Simbolo,TimeFrames,0,100,rates);
      if(Conteo<10)
        {
         int Error=GetLastError();
         if(copied<0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE ",Simbolo," ",EnumToString(TimeFrames),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE ",Simbolo," ",EnumToString(TimeFrames),"  Cod ",Error);
            return false;
           }
        }
     }

   return true;
//Print("Z2");
  }
//+------------------------------------------------------------------+
void TS_and_BE() // FUNCION DEL TS Y BREAK VEN
  {
   int Pocisiones=PositionsTotal();
   double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

   for(int cnt=0; cnt<Pocisiones; cnt++) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;

      if(PositionGetString(POSITION_SYMBOL)==Symbol() && PositionGetInteger(POSITION_MAGIC)==MagicNumber) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
         //donde esta el experto.. entonces no lo evalua
        {
         if(UseBreakEven)
           {
            //BE Funcion
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && Breakeven>0 && PositionGetDouble(POSITION_SL)<PositionGetDouble(POSITION_PRICE_OPEN)
               && Bid-Breakeven*Point()>PositionGetDouble(POSITION_PRICE_OPEN))  //Si Operacion es un BUY y Breakeven>0 y StopLoss No esta en Precio de Entrada y El precio supera el Precio establecido para el BE
               if(!trade.PositionModify(Ticket,PositionGetDouble(POSITION_PRICE_OPEN),PositionGetDouble(POSITION_TP)))
                  Print("No opero Modifico BE.. ERROR:",trade.ResultRetcode());

            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && Breakeven>0 && PositionGetDouble(POSITION_SL)>PositionGetDouble(POSITION_PRICE_OPEN)//Si Operacion es un SELL y Breakeven>0 y StopLoss No esta en Precio de Entrada y El precio supera el Precio establecido para el BE
               && Ask+Breakeven*Point()<PositionGetDouble(POSITION_PRICE_OPEN))
               if(!trade.PositionModify(Ticket,PositionGetDouble(POSITION_PRICE_OPEN),PositionGetDouble(POSITION_TP)))
                  Print("No opero Modifico BE.. ERROR:",trade.ResultRetcode());
           }

         //TS Funcion
         if(UseTrailing)
           {
            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY  && Trail_Stop>0 &&  NormalizeDouble(Bid-Trail_Start*Point(),Digits())>PositionGetDouble(POSITION_PRICE_OPEN) && (NormalizeDouble(Bid-Trail_Stop*Point(),Digits())>PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0))
               if(!trade.PositionModify(Ticket,NormalizeDouble(Bid-Trail_Stop*Point(),Digits()),PositionGetDouble(POSITION_TP)))
                  Print("No opero Modifico TS.. ERROR:",trade.ResultRetcode());

            if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && Trail_Stop>0  &&  NormalizeDouble(Ask+Trail_Start*Point(),Digits())<PositionGetDouble(POSITION_PRICE_OPEN) && (NormalizeDouble(Ask+Trail_Stop*Point(),Digits())<PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL)==0))
               if(!trade.PositionModify(Ticket,NormalizeDouble(Ask+Trail_Stop*Point(),Digits()),PositionGetDouble(POSITION_TP)))
                  Print("No opero Modifico TS.. ERROR:",trade.ResultRetcode());
           }

        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CalcularTiempos(int &BarStart,int &BarEnd)
  {
   MqlDateTime EvaluaEnd,EvaluaStart;
   TimeToStruct(iTime(NULL,PERIOD_D1,Hora_End<Hora_Start?1:0),EvaluaStart);
   TimeToStruct(iTime(NULL,PERIOD_D1,0),EvaluaEnd);

   EvaluaStart.min=(int)Minuto_Start;
   EvaluaStart.sec=0;
   EvaluaStart.hour=Hora_Start;

   EvaluaEnd.min=(int)Minuto_End;
   EvaluaEnd.sec=0;
   EvaluaEnd.hour=Hora_End;

   datetime TiempoStart=StructToTime(EvaluaStart);
   datetime TiempoEnd=StructToTime(EvaluaEnd);

   BarStart=iBarShift(Symbol(),PERIOD_M1,TiempoStart,false);
   BarEnd=iBarShift(Symbol(),PERIOD_M1,TiempoEnd,false);

   Print(TiempoStart," ",TiempoEnd," ",BarStart,"  ",BarEnd);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EliminarContraria()
  {

   if(TicketDN!=-1)
      if(!OrderSelect(TicketDN))
        {
         if(OrderSelect(TicketUP))
            trade.OrderDelete(TicketUP);
        }

   if(TicketUP!=-1)
      if(!OrderSelect(TicketUP))
        {
         if(OrderSelect(TicketDN))
            trade.OrderDelete(TicketDN);
        }

  }
//+------------------------------------------------------------------+
