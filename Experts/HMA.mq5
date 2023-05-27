//+------------------------------------------------------------------+
//|                                                          HMA.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// LIBRERIA PARA GENERAR UNA ORDEN (SELL, BUY, BUY_STOP, ETC)
#include<Trade\Trade.mqh>
CTrade trade;


int   Buy=0;
int  Sell=0;

enum Modo_Entrar
  {
   En_el_Momento=0,
   A_Cierre_Vela=1,
  };

bool Operar=false;


double Pivot_Buy_Anterior=0;
double Pivot_Sell_Anterior=0;
//SE DEFINEN LOS PARAMETROS DEL TRADE

bool Vez=false;

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12am=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

input color ColorTiempo=clrBlack;
input string S0="--------------------------Settings_Horario--------------------------";//-------------------------------
input ENUM_Horas Hora_Entrada=_0am;
input int Minuto_Entrada=0;
input ENUM_Horas Hora_Salida=_0am;
input int Minuto_Salida=0;
input string S1="--------------------------Settings_HMA--------------------------";//--------------------------
input string Nombres_HMA="HMA5";
input int Period_HMA_Cierre=18;
input ENUM_MA_METHOD Mehod_HMA_Cierre=MODE_LWMA;
input int Period_HMA_Entrada=50;
input ENUM_MA_METHOD Mehod_HMA_Entrada=MODE_LWMA;
input string Settings_Trades="--------------------------Settings_Trades--------------------------";//-------------------------------
input bool Activar_Trades=true; //Activar Trades
input double Lotes=0.01;
input int  TP=200;//TakeProfit en Puntos
input int  SL=200;//StopLoss en Puntos
input bool ActivarTrailing=true;
input int EmpezarTrailing=0; // Empezar Trailing en Puntos
input int PasoTrailing=0; // Paso Trailing en Puntos
//input int MagicNumber=123456;
input int Control_Spread=0; //Control Spread en Puntos
input string S2="--------------------------Settings_Conditions--------------------------";//-------------------------------
input bool Utilizar_Pivot=true;
input bool Habilitar_Caja=true;// Habilitar o Desabilitar Pregunta? Si UtilizarPivot==true
input int Pivot=3;
input int Espacio=3;
input int Distancia=3;
input int Size_Minimo=7;// Tamaño Minimo en 3 velas anteriores (en Ticks)
input Modo_Entrar Entrar=A_Cierre_Vela;// (Utilizar_Pivot==false) Entrar
input Modo_Entrar Cierre_Por_HMA=A_Cierre_Vela;// Cierre por HMA
input int Distancia_Pivot=0; // Distancia Desplazamiento Pivot;
//SE DEFINEN LAS ALERTAS
input string Settings_Alerts="--------------------------Settings_Alerts--------------------------";//-----------------------------
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=true;
input bool ActivarAlertasPivot=true;
input string S3="--------------------------Settings_Button--------------------------";//-----------------------------
input bool Boton_Start_in=false;
input int DesplazarTextoDerecha=30;
input ENUM_BASE_CORNER CORNER_BOTON=CORNER_LEFT_UPPER;
input int Boton_Desplazamiento_X=40;
input int Boton_Desplazamiento_Y=40;
input string S4="--------------------------Settings_Ordenes_Pendientes--------------------------";//-----------------------------
input color Color_Pivot=clrGray;
input ENUM_LINE_STYLE Style_Line_Pivot=STYLE_DASHDOT;
input int Width_Pivot=1;

double HMA_Cierre_Color[],HMA_Cierre_Value[];
double HMA_Entrada_Color[],HMA_Entrada_Value[];
MqlRates Rates[];

int HMA_Cierre_Definition,HMA_Entrada_Definition;
string CommentExpert=" ";

datetime TiempoBuy=0;
datetime TiempoSell=0;

double Pivot_Buy=0,Pivot_Sell=0;


//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit() // ONINIT Esta funcion se inicia una sola vez y solo al iniciar el EA
  {
   if(Boton_Start_in)
      Operar=true;
   else
      Operar=false;

   int Desplace1=0,Desplace=0;
   ENUM_ANCHOR_POINT ANCHOR=ANCHOR_LEFT_LOWER;
   if(CORNER_BOTON==CORNER_LEFT_UPPER)
      ANCHOR=ANCHOR_LEFT_UPPER;
   if(CORNER_BOTON==CORNER_LEFT_LOWER)
      ANCHOR=ANCHOR_LEFT_UPPER;
   if(CORNER_BOTON==CORNER_RIGHT_UPPER)
     {
      ANCHOR=ANCHOR_RIGHT_UPPER;
      Desplace1=50;
      Desplace=30;
     } //Desplace1 y Desplace tamaño de Ancho de Cada Boton
   if(CORNER_BOTON==CORNER_RIGHT_LOWER)
     {
      ANCHOR=ANCHOR_RIGHT_UPPER;
      Desplace1=50;
      Desplace=30;
     } //Desplace1 y Desplace tamaño de Ancho de Cada Boton



   if(ObjectFind(0,"BOTONWITCH")!=0)
     {
      ButtonCreate(0,"BOTONWITCH",0,Boton_Desplazamiento_X+Desplace,Boton_Desplazamiento_Y,30,20,CORNER_BOTON,"OFF","Arial",10,clrRed,C'236,233,216',clrYellow,false,false,false,true,0);
      ObjectSetInteger(0,"BOTONWITCH",OBJPROP_STATE,false);

      if(Boton_Start_in)
        {
         ObjectSetString(0,"BOTONWITCH",OBJPROP_TEXT,"ON");
         ObjectSetInteger(0,"BOTONWITCH",OBJPROP_COLOR,clrGreen);
         ObjectSetInteger(0,"BOTONWITCH",OBJPROP_STATE,true);
        }
     }


   if(ObjectFind(0,"LABEL_TIME")!=0)
      ButtonCreate(0,"LABEL_TIME",0,Boton_Desplazamiento_X+Desplace+30+5,Boton_Desplazamiento_Y,60,20,CORNER_BOTON,"Tiempo","Arial",10,ColorTiempo,C'236,233,216',clrYellow,false,false,false,true,0);


   Pivot_Buy=0;
   Pivot_Sell=0;
   HMA_Cierre_Definition=iCustom(Symbol(),PERIOD_CURRENT,Nombres_HMA,Period_HMA_Cierre,Mehod_HMA_Cierre);
   HMA_Entrada_Definition=iCustom(Symbol(),PERIOD_CURRENT,Nombres_HMA,Period_HMA_Entrada,Mehod_HMA_Entrada);

   if(Minuto_Entrada<0 || Minuto_Entrada>59)
     {
      Alert("Minuto de Entrada debe ser <59 y >=0");
      return(INIT_PARAMETERS_INCORRECT);
     }
   if(Minuto_Salida<0 || Minuto_Salida>59)
     {
      Alert("Minuto de Salida debe ser <59 y >=0");
      return(INIT_PARAMETERS_INCORRECT);
     }
   if(Distancia>98 || Distancia<0)
     {
      Alert("Distancia debe ser >0 y <98");
      return(INIT_PARAMETERS_INCORRECT);
     }

   if(!Utilizar_Pivot)
      Vez=true;

// ESTABLECEMOS LOS ARRAY EN MODO ATEMPORAL PARA SU ACCSESO (0 SIGNIFICARA VELA ACTUAL - 1 VELA ANTERIOR - 2 VELA TRASANTERIOR.... ETC)
   ArraySetAsSeries(Rates,true);
   ArraySetAsSeries(HMA_Cierre_Color,true);
   ArraySetAsSeries(HMA_Cierre_Value,true);
   ArraySetAsSeries(HMA_Entrada_Color,true);
   ArraySetAsSeries(HMA_Entrada_Value,true);

   CommentExpert="Expert Final";

   EventSetMillisecondTimer(10);

//trade.SetExpertMagicNumber(MagicNumber);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick() /*ONTICK SE INICIA LUEGO DEL ONINIT Y FUNCIONA COMO UN BUCLE (SE REPITE VARIAS VECES... RECORRE HASTA EL ULTIMO CODIGO Y LUEGO VUELVE AL PRINCIPIO.. Y ASI ASI EN UN BUCLE
EVALUANDO DE NUEVO LAS SENTENCIAS)*/
  {

   if(Operar)
     {
      if(ActivarTrailing)
         TrailingStop_BE();

      Poner_SL_TP();

      // COPIAMOS EL RATES(close,open,high,low,time) DEL SIMBOLO EN EL QUE ESTA EL EA.. En el Arreglo Rates
      int copied=CopyRates(Symbol(),PERIOD_CURRENT,0,100,Rates);
      if(copied<=0)
         Print("Fallo al copiar los datos de precios ",GetLastError());

      //Copiamos los 3 ultimos valores de Histograma del MACD y De la Linea MACD en los arreglos Histograma_MACD y Linea_MACD

      CopyBuffer(HMA_Cierre_Definition,0,0,100,HMA_Cierre_Value);
      CopyBuffer(HMA_Cierre_Definition,1,0,100,HMA_Cierre_Color);
      CopyBuffer(HMA_Entrada_Definition,0,0,100,HMA_Entrada_Value);
      CopyBuffer(HMA_Entrada_Definition,1,0,100,HMA_Entrada_Color);

      Salida();

      // Establecemos la variable PrevTime(Nos servira para que solo se abra una operacion a la vez por vela ..... ver (1) mas adelante)
      datetime static PrevTime=0;

      //Copiamos el ASK y BID Actual en las variables Ask y Bid
      double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
      double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
      int Spread=(int)SymbolInfoInteger(Symbol(),SYMBOL_SPREAD);

      // RESETEAMOS EL ULTIMO ERROR (OPCIONAL: Sirve para borrar el historial del ultimo error)
      ResetLastError();

      if(EvaluaHorario(Hora_Entrada,Minuto_Entrada,Hora_Salida,Minuto_Salida) && Activar_Trades)
        {
         bool Condicion_Principal_Buy=false;
         bool Condicion_Principal_Sell=false;

         if(PrevTime!=Rates[0].time)
           {
            if((HMA_Entrada_Color[1]==1 && HMA_Entrada_Color[2]==0) || (HMA_Entrada_Color[1]==0 && HMA_Entrada_Color[2]==1))
              {
               if(ObjectFind(0,"PIVOT_BUY")==0)
                  ObjectDelete(0,"PIVOT_BUY");
               if(ObjectFind(0,"PIVOT_SELL")==0)
                  ObjectDelete(0,"PIVOT_SELL");
               Vez=false;
              }
           }

         if(Utilizar_Pivot)
           {
            if(PrevTime!=Rates[0].time)
               /// SI El valor TrasAnterior del Histograma es MENOR al valor Trasanterior de La Linea_MACD del Histograma_MACD Y
               //SI El valor Anterior del Histograma es MAYOR al valor Anterior de La Linea_MACD del Histograma_MACD
               // Y Prevtime no es igual al Tiempo de la vela actual
              {
               double P_Sell=DetectarPivot(false,TiempoSell);
               double P_Buy=DetectarPivot(true,TiempoBuy);

               if(P_Buy!=0)
                  Pivot_Buy=P_Buy+Distancia_Pivot*Point();
               if(P_Sell!=0)
                  Pivot_Sell=P_Sell-Distancia_Pivot*Point();

               if(HMA_Entrada_Color[0]==1 && Pivot_Buy_Anterior!=P_Buy && P_Buy!=0)
                 {
                  if(ActivarAlertasPivot)
                    {
                     if(AlertPC)
                        Alert(" Pivot Buy detectado en el precio ",DoubleToString(P_Buy,Digits())," en ",Symbol()," en ",EnumToString(ENUM_TIMEFRAMES(Period())));
                     if(AlertMovil)
                        SendNotification(" Pivot Buy detectado en el precio "+DoubleToString(P_Buy,Digits())+" en "+Symbol()+" en "+EnumToString(ENUM_TIMEFRAMES(Period())));
                     if(AlertMail)
                        SendMail(" Pivot Buy detectado en el precio "+DoubleToString(P_Buy,Digits())+" en "+Symbol()+" en "+EnumToString((ENUM_TIMEFRAMES) Period())," Pivot Buy detectado en el precio "+DoubleToString(P_Buy,Digits())+" en "+Symbol()+" en "+EnumToString(ENUM_TIMEFRAMES(Period())));
                    }
                  Pivot_Buy_Anterior=P_Buy;
                 }

               if(HMA_Entrada_Color[0]==0 && Pivot_Sell_Anterior!=P_Sell && P_Sell!=0)
                 {
                  if(ActivarAlertasPivot)
                    {
                     if(AlertPC)
                        Alert(" Pivot Sell detectado en el precio ",DoubleToString(P_Sell,Digits())," en ",Symbol()," en ",EnumToString(ENUM_TIMEFRAMES(Period())));
                     if(AlertMovil)
                        SendNotification(" Pivot Sell detectado en el precio "+DoubleToString(P_Sell,Digits())+" en "+Symbol()+" en "+EnumToString(ENUM_TIMEFRAMES(Period())));
                     if(AlertMail)
                        SendMail(" Pivot Sell detectado en el precio "+DoubleToString(P_Sell,Digits())+" en "+Symbol()+" en "+EnumToString((ENUM_TIMEFRAMES) Period())," Pivot Buy detectado en el precio "+DoubleToString(P_Sell,Digits())+" en "+Symbol()+" en "+EnumToString(ENUM_TIMEFRAMES(Period())));
                    }
                  Pivot_Sell_Anterior=P_Sell;
                 }

               if(P_Sell!=0)
                 {
                  if(ObjectFind(0,"PIVOT_SELL")!=0)
                     HLineCreate(0,"PIVOT_SELL",0,Pivot_Sell,Color_Pivot,Style_Line_Pivot,Width_Pivot,false,false,true,0);
                 }
               if(P_Buy!=0)
                 {
                  if(ObjectFind(0,"PIVOT_BUY")!=0)
                     HLineCreate(0,"PIVOT_BUY",0,Pivot_Buy,Color_Pivot,Style_Line_Pivot,Width_Pivot,false,false,true,0);
                 }
              }
            if(Ask>Pivot_Buy && Pivot_Buy!=0)
               Condicion_Principal_Buy=true;
            if(Bid<Pivot_Sell && Pivot_Sell!=0)
               Condicion_Principal_Sell=true;
           }
         else
           {
            Condicion_Principal_Buy=true;
            Condicion_Principal_Sell=true;

            bool Size_Vela=false;
            for(int i=1; i<4; i++)
              {
               if(Rates[i].high-Rates[i].low>=Size_Minimo*Point())
                  Size_Vela=true;
               break;
              }

            if(HMA_Entrada_Color[Distancia+1]==1 || Size_Vela==false)
               Condicion_Principal_Buy=false;

            if(HMA_Entrada_Color[Distancia+1]==0 || Size_Vela==false)
               Condicion_Principal_Sell=false;
           }

         /*Comment("Pivot Buy= ",Pivot_Buy," Tiempo= ",TimeToString(TiempoBuy,TIME_DATE|TIME_MINUTES),"\n"
                 , "Pivot Sell= ",Pivot_Sell," Tiempo= ",TimeToString(TiempoSell,TIME_DATE|TIME_MINUTES),"\n",
                 "Entro en Tramo= ",Vez);*/

         Operaciones();

         if(Condicion_Principal_Buy && ((Vez==false && !Utilizar_Pivot)|| Utilizar_Pivot)  && HMA_Entrada_Color[0]==1 && (Control_Spread==0 || Spread<=Control_Spread))
           {

            bool Condicion_Distancia_=Condicion_Distancia(true);
            bool Condicion_Espacio_=Condicion_Espacio(Ask);

            if(Condicion_Distancia_ && Condicion_Espacio_ && Buy==0)
              {
               bool EntrarPivot=true;
               if(Utilizar_Pivot && Habilitar_Caja)
                 {
                  datetime TiempoAlerta=TimeCurrent();
                  PlaySound("alert.wav");
                  if(AlertMovil)
                     SendNotification("Entrar Pivot BUY en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period()))+"?");
                  if(AlertMail)
                     SendMail("Entrar Pivot BUY en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period()))+"?","Entrar Pivot BUY en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period()))+"?");
                  int ID=MessageBox("Entrar a Operar Pivot Buy?",NULL,MB_YESNO|MB_ICONQUESTION);
                  if(ID!=6)
                     EntrarPivot=false;
                  else
                     if(TimeCurrent()>TiempoAlerta+60*5)
                       {
                        Alert("Tiempo Excedio los ",5," minutos para aceptar... No se ejecuta la operacion");
                        EntrarPivot=false;
                       }
                 }

               if(EntrarPivot)
                 {
                  double TP_=TP==0?0:Ask+TP*Point();
                  double SL_=SL==0?0:Bid-SL*Point();
                  // Operamos Buy con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
                  bool BuyTradeBool=trade.Buy(Lotes,Symbol(),Ask,SL_,TP_,CommentExpert);
                  // Si la operacion fue exitosa
                  if(BuyTradeBool)
                    {
                     Vez=true;
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
            Pivot_Buy=0;
            if(ObjectFind(0,"PIVOT_BUY")==0)
               ObjectDelete(0,"PIVOT_BUY");
           }


         if(Condicion_Principal_Sell && ((Vez==false && !Utilizar_Pivot)|| Utilizar_Pivot) && HMA_Entrada_Color[0]==0 && (Control_Spread==0 || Spread<=Control_Spread))
           {
            bool Condicion_Distancia_=Condicion_Distancia(false);
            bool Condicion_Espacio_=Condicion_Espacio(Bid);


            if(Condicion_Distancia_ && Condicion_Espacio_ && Sell==0)
              {
               bool EntrarPivot=true;
               if(Utilizar_Pivot && Habilitar_Caja)
                 {
                  datetime TiempoAlerta=TimeCurrent();
                  PlaySound("alert.wav");
                  if(AlertMovil)
                     SendNotification("Entrar Pivot SELL en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period()))+"?");
                  if(AlertMail)
                     SendMail("Entrar Pivot SELL en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period()))+"?","Entrar Pivot SELL en "+Symbol()+" "+EnumToString(ENUM_TIMEFRAMES(Period()))+"?");
                  int ID=MessageBox("Entrar a Operar Pivot SELL?",NULL,MB_YESNO|MB_ICONQUESTION);
                  if(ID!=6)
                     EntrarPivot=false;
                  else
                     if(TimeCurrent()>TiempoAlerta+60*5)
                       {
                        Alert("Tiempo Excedio los ",5," minutos para aceptar... No se ejecuta la operacion");
                        EntrarPivot=false;
                       }
                 }
               if(EntrarPivot)
                 {
                  double TP_=TP==0?0:Bid-TP*Point();
                  double SL_=SL==0?0:Ask+SL*Point();
                  bool SellTradeBool=trade.Sell(Lotes,Symbol(),Bid,SL_,TP_,CommentExpert);
                  // Si la operacion fue exitosa
                  if(SellTradeBool)
                    {
                     Vez=true;
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
            Pivot_Sell=0;
            if(ObjectFind(0,"PIVOT_SELL")==0)
               ObjectDelete(0,"PIVOT_SELL");
           }
        }
      else
        {
         Pivot_Buy=0;
         Pivot_Sell=0;
         Vez=false;

         if(ObjectFind(0,"PIVOT_BUY")==0)
            ObjectDelete(0,"PIVOT_BUY");
         if(ObjectFind(0,"PIVOT_SELL")==0)
            ObjectDelete(0,"PIVOT_SELL");
        }
      /*
      if(Histograma_MACD[2]>Linea_MACD[2] && Histograma_MACD[1]<Linea_MACD[1]  && PrevTime!=Rates[0].time && Linea_MA[1]<Linea_MA[2])
       {
        /// SI El valor TrasAnterior del Histograma es MAYOR al valor Trasanterior de La Linea_MACD del Histograma_MACD Y
        //SI El valor Anterior del Histograma es MENOR al valor Anterior de La Linea_MACD del Histograma_MACD
        // Y Prevtime no es igual al Tiempo de la vela actual
        if(Histograma_MACD[1]>Close_Level)
           Cerrar(POSITION_TYPE_BUY);/// ---> Cerrar todas las posiciones BUY del Simbolo en el que esta el EA

        if(Histograma_MACD[1]>Open_Level)
          {
           double TP=InpTakeProfit==0?0:Bid-InpTakeProfit*Point();
           // Operamos Sell con el Lote establecido en el parametro Lotes... y agregando el comentario del Experto
           bool SellTradeBool=trade.Sell(Lotes,Symbol(),Bid,0,TP,CommentExpert);
           // Si la operacion fue exitosa
           if(SellTradeBool)
             {
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
       }*/
      PrevTime=Rates[0].time;// PrevTime se iguala al tiempo Actual de la Vela (1)... Nos servira para que ya no opere mas en esta vela
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {

   bool STATEACTUAL=ObjectGetInteger(0,"BOTONWITCH",OBJPROP_STATE,0);
   static bool STATEANTERIOR=Boton_Start_in?true:false;

   if(STATEACTUAL==true && STATEANTERIOR==false)
     {
      Operar=true;
      ChartRedraw();
      ObjectSetString(0,"BOTONWITCH",OBJPROP_TEXT,"ON");
      ObjectSetInteger(0,"BOTONWITCH",OBJPROP_COLOR,clrGreen);
      STATEANTERIOR=true;
      Sleep(50);
     }
   else
      if(STATEACTUAL==false && STATEANTERIOR==true)
        {
         Operar=false;
         ChartRedraw();
         ObjectSetString(0,"BOTONWITCH",OBJPROP_TEXT,"OFF");
         ObjectSetInteger(0,"BOTONWITCH",OBJPROP_COLOR,clrRed);
         STATEANTERIOR=false;
         Sleep(50);
        }
   if(ObjectFind(0,"LABEL_TIME")==0)
      ObjectSetString(0,"LABEL_TIME",OBJPROP_TEXT,TimeToString(TimeCurrent(),TIME_MINUTES|TIME_SECONDS));
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   if(ObjectFind(0,"BOTONWITCH")==0)
      ObjectDelete(0,"BOTONWITCH");

   if(ObjectFind(0,"PIVOT_BUY")==0)
      ObjectDelete(0,"PIVOT_BUY");
   if(ObjectFind(0,"PIVOT_SELL")==0)
      ObjectDelete(0,"PIVOT_SELL");
   if(ObjectFind(0,"LABEL_TIME")==0)
      ObjectDelete(0,"LABEL_TIME");

   EventKillTimer();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TrailingStop_BE()
  {

   int TotalPosiciones=PositionsTotal();
   for(int i=0; i<TotalPosiciones; i++)
     {
      ulong Ticket=PositionGetTicket(i);

      if(PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      if(Ticket!=0)
        {
         long Tipo_Posicion=PositionGetInteger(POSITION_TYPE);

         if(Tipo_Posicion==POSITION_TYPE_BUY)
           {
            if(PositionGetDouble(POSITION_PRICE_OPEN)+EmpezarTrailing*Point()<=PositionGetDouble(POSITION_PRICE_CURRENT) && EmpezarTrailing>0 && PasoTrailing>0)
              {
               double Evalua=PositionGetDouble(POSITION_PRICE_CURRENT)-PasoTrailing*Point();
               if(PositionGetDouble(POSITION_SL)==0 || PositionGetDouble(POSITION_SL)<Evalua)
                 {
                  trade.PositionModify(Ticket,Evalua,PositionGetDouble(POSITION_TP));
                 }
              }
           }
         else
           {
            if(PositionGetDouble(POSITION_PRICE_OPEN)-EmpezarTrailing*Point()>=PositionGetDouble(POSITION_PRICE_CURRENT)  && EmpezarTrailing>0 && PasoTrailing>0)
              {
               double Evalua=PositionGetDouble(POSITION_PRICE_CURRENT)+PasoTrailing*Point();
               if(PositionGetDouble(POSITION_SL)==0 || PositionGetDouble(POSITION_SL)>Evalua)
                 {
                  trade.PositionModify(Ticket,Evalua,PositionGetDouble(POSITION_TP));
                 }
              }
           }
        }
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Poner_SL_TP()
  {
   int TotalPosiciones=PositionsTotal();
   for(int i=0; i<TotalPosiciones; i++)
     {
      ulong Ticket=PositionGetTicket(i);

      if(PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      if(Ticket!=0)
        {
         long Tipo_Posicion=PositionGetInteger(POSITION_TYPE);
         if(PositionGetDouble(POSITION_SL)==0 || PositionGetDouble(POSITION_TP)==0)
           {
            if(Tipo_Posicion==POSITION_TYPE_BUY)
              {
               double TP_=TP==0?0:PositionGetDouble(POSITION_PRICE_OPEN)+TP*Point();
               double SL_=SL==0?0:PositionGetDouble(POSITION_PRICE_OPEN)-SL*Point();
               trade.PositionModify(Ticket,SL_,TP_);
              }
            else
              {
               double TP_=TP==0?0:PositionGetDouble(POSITION_PRICE_OPEN)-TP*Point();
               double SL_=SL==0?0:PositionGetDouble(POSITION_PRICE_OPEN)+SL*Point();
               trade.PositionModify(Ticket,SL_,TP_);
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double DetectarPivot(bool isBuy, datetime &Tiempo)
  {
   if(HMA_Entrada_Color[1]==0)
      Pivot_Buy=0;
   else
      Pivot_Sell=0;

   for(int i=1+Pivot; i<100-Pivot && (Tiempo==0 || Tiempo<Rates[i].time); i++)
     {

      int indice=i-5<1?1:i-5;
      if(HMA_Entrada_Color[indice]==0 && isBuy)
         break;
      if(HMA_Entrada_Color[indice]==1 && !isBuy)
         break;


      bool Entra=true;
      for(int j=1; j<Pivot+1; j++)
        {

         if(isBuy)
           {
            if(Rates[i].high<Rates[i-j].high)
              {
               Entra=false;
               break;
              }

            if(Rates[i].high<Rates[i+j].high)
              {
               Entra=false;
               break;
              }
           }

         else
           {
            if(Rates[i].low>Rates[i-j].low)
              {
               Entra=false;
               break;
              }

            if(Rates[i].low>Rates[i+j].low)
              {
               Entra=false;
               break;
              }
           }
        }
      if(Entra)
        {
         Tiempo=Rates[i].time;
         Print(TimeToString(Rates[i].time,TIME_DATE|TIME_MINUTES));
         if(isBuy)
            return Rates[i].high;
         else
            return Rates[i].low;
        }
     }
   return 0;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Condicion_Distancia(bool isBuy)
  {

   for(int i=1; i<Distancia+1; i++)
     {
      if(isBuy)
        {
         if(HMA_Entrada_Color[i]==0)
            return false;
        }
      else
        {
         if(HMA_Entrada_Color[i]==1)
            return false;
        }

     }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Condicion_Espacio(double Precio)
  {
   if(Espacio==0)
      return true;

   if(MathAbs(Precio-HMA_Entrada_Value[0])<Espacio*Point())
      return false;

   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluaHorario(int Apertura,int Minuto_Apertura,int Cierre,int Minuto_Cierre)
  {
   MqlDateTime TiempoActual;
   TimeToStruct(TimeCurrent(),TiempoActual);

   bool EntraHorario=false;
   if(Apertura>Cierre && (TiempoActual.hour>=Apertura || TiempoActual.hour<=Cierre))
     {
      if(TiempoActual.hour==Apertura && TiempoActual.min<Minuto_Apertura)
         return false;
      if(TiempoActual.hour==Cierre && TiempoActual.min>=Minuto_Cierre)
         return false;
      return true;
     }
   else
      if(Apertura<Cierre && (TiempoActual.hour>=Apertura && TiempoActual.hour<=Cierre))
        {
         if(TiempoActual.hour==Apertura && TiempoActual.min<Minuto_Apertura)
            return false;
         if(TiempoActual.hour==Cierre && TiempoActual.min>=Minuto_Cierre)
            return false;
         return true;
        }
   if(Apertura==Cierre)
     {
      return true;
     }

   return false;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Salida()
  {
   int TotalPosiciones=PositionsTotal();
   for(int i=TotalPosiciones-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      if(HMA_Cierre_Color[0+Cierre_Por_HMA]==1 && HMA_Cierre_Color[1+Cierre_Por_HMA]==0 && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
         trade.PositionClose(Ticket,-1);
      if(HMA_Cierre_Color[0+Cierre_Por_HMA]==0 && HMA_Cierre_Color[1+Cierre_Por_HMA]==1 && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
         trade.PositionClose(Ticket,-1);
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ButtonCreate(const long              chart_ID=0,               // ID del gráfico
                  const string            name="Button",            // nombre del botón
                  const int               sub_window=0,             // número de subventana
                  const int               x=0,                      // coordenada por el eje X
                  const int               y=0,                      // coordenada por el eje Y
                  const int               width=50,                 // ancho del botón
                  const int               height=18,                // alto del botón
                  const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace
                  const string            text="Button",            // texto
                  const string            font="Arial",             // fuente
                  const int               font_size=10,             // tamaño de la fuente
                  const color             clr=clrBlack,             // color del texto
                  const color             back_clr=C'236,233,216',  // color del fondo
                  const color             border_clr=clrNONE,       // color del borde
                  const bool              state=false,              // pulsado/no pulsado
                  const bool              back=false,               // al fondo
                  const bool              selection=false,          // seleccionar para mover
                  const bool              hidden=true,              // ocultar en la lista de objetos
                  const long              z_order=0)                //prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos el botón
   if(!ObjectCreate(chart_ID,name,OBJ_BUTTON,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear el botón! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos las coordenadas del botón
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- establecemos el tamaño del botón
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del punto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- ponemos el texto
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- establecemos la fuente del texto
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- establecemos el tamaño del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- establecemos el color del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el color del fondo
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- establecemos el color del borde
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- set button state
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
//--- activar (true) o desactivar (false) el modo de desplazamiento del botón con ratón
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
void Operaciones()
  {
   Buy=0;
   Sell=0;
   int TotalPosiciones=PositionsTotal();
   for(int i=0; i<TotalPosiciones; i++)
     {
      ulong Ticket=PositionGetTicket(i);

      if(PositionGetString(POSITION_SYMBOL)!=Symbol())
         continue;

      if(Ticket!=0)
        {
         long Tipo_Posicion=PositionGetInteger(POSITION_TYPE);
         if(PositionGetDouble(POSITION_SL)==0 || PositionGetDouble(POSITION_TP)==0)
           {
            if(Tipo_Posicion==POSITION_TYPE_BUY)
              {
               Buy++;
              }
            else
              {
               Sell++;
              }
           }
        }
     }

  }
//+------------------------------------------------------------------+
bool LabelCreate(const long              chart_ID=0,               // ID del gráfico
                 const string            name="Label",             // nombre de la etiqueta
                 const int               sub_window=0,             // número de subventana
                 const int               x=0,                      // coordenada por el eje X
                 const int               y=0,                      // coordenada por el eje Y
                 const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // esquina del gráfico para el enlace
                 const string            text="Label",             // texto
                 const string            font="Arial",             // fuente
                 const int               font_size=10,             // tamaño de la fuente
                 const color             clr=clrRed,               // color
                 const double            angle=0.0,                // inclinación del texto
                 const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // modo de anclaje
                 const bool              back=false,               // al fondo
                 const bool              selection=false,          // seleccionar para mover
                 const bool              hidden=true,              // ocultar en la lista de objetos
                 const long              z_order=0)                //prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la etiqueta de texto
   if(!ObjectCreate(chart_ID,name,OBJ_LABEL,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la etiqueta de texto! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos las coordenadas de la etiqueta
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- establecemos la esquina del gráfico respecto a la cual van a determinarse las coordenadas del punto
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- ponemos el texto
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- establecemos la fuente del texto
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- establecemos el tamaño del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- establecemos el ángulo de inclinación del texto
   ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);
//--- establecemos el modo de anclaje
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
//--- establecemos el color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de desplazamiento de la etiqueta con ratón
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
