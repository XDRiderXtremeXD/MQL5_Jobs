//+------------------------------------------------------------------+
//|                                                      EA Grib.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

enum TipoOperaciones
  {
   SOLO_BUYS=0,
   SOLO_SELLS=1,
   BUYS_Y_SELL=2,
  };
enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12pm=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

enum Modo_Aumento_M
  {
   Modo_Multiplicador=0, //Multiplicador
   Modo_Personalizado=1, // Personalizado
  };
double Lote=0.01;

input TipoOperaciones Tipo_Operaciones=BUYS_Y_SELL;//Tipo Operaciones
input int NumeroOperaciones=10;//Operaciones Maximas
input int Distancia=50;//Distancia Inicial
input double Distancia_Multiplicador=1.2;//Multiplicador Incremento Distancia por Nivel
input int TP_Point=400;//Take Profit de las Operaciones Principales (Puntos)
input int TP_Point_Diference=50;//Take Profit de la Operacion en Contra (Puntos)
input int SL_Point_Diference=50;//Stop Loss de la Operacion en contra (Puntos)
input Modo_Aumento_M Modo_Martingala_Aumento=Modo_Personalizado;// MODO MARTINGALA
input string S1_0_="-----------------------   Punto Equilibrio  ---------------------";//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input color Color_Equilibrio_Buy=clrAqua;
input color Color_Equilibrio_Sell=clrMagenta;
input string S1_0="-----------------------   Horario  ---------------------";//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input ENUM_Horas  Hora_Inicio=_2am;
input ENUM_Horas Hora_Final=_4pm;
input string S1_1="-----------------------   Modo Martingala (MULTIPLICADOR)  ---------------------";//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input double LoteInicial=0.01;
input int Multiplicador_Martingala=2;
input string S1_2="-----------------------   Modo Martingala (PERSONALIZADO)  ---------------------";//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input string HedgeLot="1=0.01;2=0.02;3=0.04";
input string S1_="=== CONFIGURACION RSI =======================================================================================";//=======================================================================================
input bool FiltroRSI=true;//Filtro RSI (Primera Operacion)
input int RSI_Periodo=14;
input ENUM_APPLIED_PRICE RSI_Applied_Price=PRICE_CLOSE;
input int Nivel_Buy=30;//Nivel Buy (Por debajo de)
input int Nivel_Sell=70;//Nivel Sell (Por arriba de)

string Equilibrio_Buy="Equilibrio Buy";
string Equilibrio_Sell="Equilibrio Sell";

#include<Trade\Trade.mqh>
CTrade trade;

int TicketBuy[];
double TPBuy=0;

int TicketSell[];
double TPSell=0;

ulong OrdenBuyUltima=0;
ulong OrdenSellUltima=0;

struct Nivel_HedgeLote
  {
   int               Nivel;
   double               HedgeLote;
  };

Nivel_HedgeLote Array_NivelHedgeLote[];

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   if(Modo_Martingala_Aumento==Modo_Personalizado)
     {
      if(!Funcion_Igualar_Nivel_Valores(HedgeLot))
        {
         Alert("ERROR AL ESCRIBIR EL LOTAJE, VER PESTAÑA EXPERTOS");
         return (INIT_PARAMETERS_INCORRECT);
        }
      if(!VerificarLotes())
        {
         Alert("ERROR AL ESCRIBIR EL LOTAJE, VER PESTAÑA EXPERTOS");
         return (INIT_PARAMETERS_INCORRECT);
        }
      if(!ComprobarLotaje())
        {
         Alert("ERROR AL ESCRIBIR EL LOTAJE, VER PESTAÑA EXPERTOS");
         return (INIT_PARAMETERS_INCORRECT);
        }
      ArrayResize(TicketBuy,0);
      TPBuy=SymbolInfoDouble(NULL,SYMBOL_TRADE_TICK_VALUE)*Lote_Martingala(1)*TP_Point;
      TPSell=SymbolInfoDouble(NULL,SYMBOL_TRADE_TICK_VALUE)*Lote_Martingala(1)*TP_Point;
     }
   else
     {
      for(int i=0; i<NumeroOperaciones; i++)
        {
         double Lotaje=NormalizeDouble(LoteInicial*MathPow(Multiplicador_Martingala,i),2);
         if(!ComprobarLotaje2(Lotaje,i+1))
           {
            Alert("ERROR  LOTAJE, VER PESTAÑA EXPERTOS");
            return (INIT_PARAMETERS_INCORRECT);
           }
        }
      TPBuy=SymbolInfoDouble(NULL,SYMBOL_TRADE_TICK_VALUE)*LoteInicial*TP_Point;
      TPSell=SymbolInfoDouble(NULL,SYMBOL_TRADE_TICK_VALUE)*LoteInicial*TP_Point;
     }
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {

// Comment(TPBuy,"  ",TPSell);

   if(Tipo_Operaciones==BUYS_Y_SELL || Tipo_Operaciones==SOLO_BUYS)
     {
      if(ArraySize(TicketBuy)==NumeroOperaciones)
         History(TicketBuy,OrdenBuyUltima);
      else
        {
         TP(TicketBuy,TPBuy,true);
        }

      if(!HayTrades(TicketBuy))
        {
         if(ObjectFind(0,Equilibrio_Buy)==0)
            ObjectDelete(0,Equilibrio_Buy);

         if(EvaluaHorario(Hora_Inicio,Hora_Final) && FiltroRSIFuncion(true))
            PonerBuy();
        }
      else
         GestionarBuys();
     }

   if(Tipo_Operaciones==BUYS_Y_SELL || Tipo_Operaciones==SOLO_SELLS)
     {
      if(ArraySize(TicketSell)==NumeroOperaciones)
         History(TicketSell,OrdenSellUltima);
      else
        {
         TP(TicketSell,TPSell,false);
        }

      if(!HayTrades(TicketSell))
        {

         if(ObjectFind(0,Equilibrio_Sell)==0)
            ObjectDelete(0,Equilibrio_Sell);

         if(EvaluaHorario(Hora_Inicio,Hora_Final) && FiltroRSIFuncion(false))
            PonerSell();
        }
      else
         GestionarSells();
     }

  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PonerBuy()
  {
   if(Modo_Martingala_Aumento==Modo_Multiplicador)
      Lote=LoteInicial*MathPow(Multiplicador_Martingala,0);
   else
      Lote=Lote_Martingala(1);

   double Ask=SymbolInfoDouble(NULL,SYMBOL_ASK);
   double Point_=SymbolInfoDouble(NULL,SYMBOL_POINT);

   bool Trade=trade.Buy(Lote,NULL,Ask,0,Ask+TP_Point*Point(),NULL);

   if(Trade)
     {
      ArrayResize(TicketBuy,1);
      ulong Resultado=trade.ResultOrder();
      RegistrarTicket(Resultado,0,TicketBuy);
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GestionarBuys()
  {
   double Ask=SymbolInfoDouble(NULL,SYMBOL_ASK);
   double Bid=SymbolInfoDouble(NULL,SYMBOL_BID);
   double Point_=SymbolInfoDouble(NULL,SYMBOL_POINT);

   int Size=ArraySize(TicketBuy);
   if(Size<NumeroOperaciones)
     {
      if(Size+1==NumeroOperaciones)
        {
         bool Ticket=PositionSelectByTicket(TicketBuy[Size-1]);
         if(Ticket)
           {
            if(Bid<=PositionGetDouble(POSITION_PRICE_OPEN)-(Distancia*(MathPow(Distancia_Multiplicador,Size))*Point_))
              {
               if(Modo_Martingala_Aumento==Modo_Multiplicador)
                  Lote=LoteInicial*MathPow(Multiplicador_Martingala,Size);
               else
                  Lote=Lote_Martingala(Size+1);
               Lote=NormalizeDouble(Lote,2);

               double TP_D=Bid-TP_Point_Diference*Point_;
               double SL_D=Bid+SL_Point_Diference*Point_;
               bool Trade=trade.Sell(Lote,NULL,Bid,SL_D,TP_D,NULL);
               if(Trade)
                 {
                  ArrayResize(TicketBuy,Size+1);;
                  ulong Resultado=trade.ResultOrder();
                  RegistrarTicket(Resultado,Size,TicketBuy);
                  OrdenBuyUltima=Resultado;
                 }
              }
           }
        }
      else
        {
         bool Ticket=PositionSelectByTicket(TicketBuy[Size-1]);
         if(Ticket)
           {
            if(Ask<=PositionGetDouble(POSITION_PRICE_OPEN)-(Distancia*(MathPow(Distancia_Multiplicador,Size))*Point_))
              {
               if(Modo_Martingala_Aumento==Modo_Multiplicador)
                  Lote=LoteInicial*MathPow(Multiplicador_Martingala,Size);
               else
                  Lote=Lote_Martingala(Size+1);
               bool Trade=trade.Buy(Lote,NULL,Ask,0,0,NULL);

               Lote=NormalizeDouble(Lote,2);

               if(Trade)
                 {
                  ArrayResize(TicketBuy,Size+1);;
                  ulong Resultado=trade.ResultOrder();
                  RegistrarTicket(Resultado,Size,TicketBuy);
                 }
              }
           }
        }
     }
  }




//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PonerSell()
  {
   double Bid=SymbolInfoDouble(NULL,SYMBOL_BID);
   double Point_=SymbolInfoDouble(NULL,SYMBOL_POINT);

   if(Modo_Martingala_Aumento==Modo_Multiplicador)
      Lote=LoteInicial*MathPow(Multiplicador_Martingala,0);
   else
      Lote=Lote_Martingala(1);

   bool Trade=trade.Sell(Lote,NULL,Bid,0,Bid-TP_Point*Point(),NULL);

   if(Trade)
     {
      ArrayResize(TicketSell,1);
      ulong Resultado=trade.ResultOrder();
      RegistrarTicket(Resultado,0,TicketSell);
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GestionarSells()
  {
   double Ask=SymbolInfoDouble(NULL,SYMBOL_ASK);
   double Bid=SymbolInfoDouble(NULL,SYMBOL_BID);
   double Point_=SymbolInfoDouble(NULL,SYMBOL_POINT);

   int Size=ArraySize(TicketSell);
   if(Size<NumeroOperaciones)
     {
      if(Size+1==NumeroOperaciones)
        {

         bool Ticket=PositionSelectByTicket(TicketSell[Size-1]);
         if(Ticket)
           {
            if(Bid>=PositionGetDouble(POSITION_PRICE_OPEN)+(Distancia*(MathPow(Distancia_Multiplicador,Size))*Point_))
              {
               if(Modo_Martingala_Aumento==Modo_Multiplicador)
                  Lote=LoteInicial*MathPow(Multiplicador_Martingala,Size);
               else
                  Lote=Lote_Martingala(Size+1);
               Lote=NormalizeDouble(Lote,2);
               double TP_D=Ask+TP_Point_Diference*Point_;
               double SL_D=Ask-SL_Point_Diference*Point_;
               bool Trade=trade.Buy(Lote,NULL,Ask,SL_D,TP_D,NULL);
               if(Trade)
                 {
                  ArrayResize(TicketSell,Size+1);;
                  ulong Resultado=trade.ResultOrder();
                  RegistrarTicket(Resultado,Size,TicketSell);
                  OrdenSellUltima=Resultado;
                 }
              }
           }
        }
      else
        {
         bool Ticket=PositionSelectByTicket(TicketSell[Size-1]);
         if(Ticket)
           {

            if(Ask>=PositionGetDouble(POSITION_PRICE_OPEN)+(Distancia*(MathPow(Distancia_Multiplicador,Size))*Point_))
              {
               if(Modo_Martingala_Aumento==Modo_Multiplicador)
                  Lote=LoteInicial*MathPow(Multiplicador_Martingala,Size);
               else
                  Lote=Lote_Martingala(Size+1);
               Lote=NormalizeDouble(Lote,2);
               bool Trade=trade.Sell(Lote,NULL,Bid,0,0,NULL);

               if(Trade)
                 {
                  ArrayResize(TicketSell,Size+1);;
                  ulong Resultado=trade.ResultOrder();
                  RegistrarTicket(Resultado,Size,TicketSell);
                 }
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void RegistrarTicket(ulong Orden,int Indice,int &ArraysOperaciones[])
  {
   bool Reconocio=false;
   bool Entro=false;
   int Total=PositionsTotal();


   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;
      if(PositionGetInteger(POSITION_IDENTIFIER)==Orden)
        {
         Reconocio=true;
         /*if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
           {
            trade.PositionModify(Ticket,TP==0?(PositionGetDouble(POSITION_PRICE_OPEN)-Distancia_*SymbolInfoDouble(NULL,SYMBOL_POINT)):TP,PositionGetDouble(POSITION_PROFIT));
            TP=(PositionGetDouble(POSITION_PRICE_OPEN)-Distancia_*SymbolInfoDouble(NULL,SYMBOL_POINT);
                TicketBuy[Indice]=Ticket;
           }
            else
           {
            trade.PositionModify(Ticket,TP==0?(PPositionGetDouble(POSITION_PRICE_OPEN)+Distancia_*SymbolInfoDouble(NULL,SYMBOL_POINT)):TP,PositionGetDouble(POSITION_PROFIT));
            TP=(PositionGetDouble(POSITION_PRICE_OPEN)+Distancia_*SymbolInfoDouble(NULL,SYMBOL_POINT);

           }*/
         ArraysOperaciones[Indice]=(int)Ticket;
         break;
        }
     }
   if(Reconocio==false)
      Print("No Reconocio Orden....",Orden);
  }


//+------------------------------------------------------------------+
bool HayTrades(int &ArraysOperaciones[])
  {
   int conteo=0;

   int Total=ArraySize(ArraysOperaciones);

   for(int i=Total-1; i>=0; i--)
     {
      bool Seleccion=PositionSelectByTicket(ArraysOperaciones[i]);
      if(Seleccion==false)
         continue;

      return true;
     }
   return false;
  }

//+------------------------------------------------------------------+
void History(int &ArraysOperaciones[],ulong OrdenUltima)
  {
//--- request trade history
   HistorySelect(0,TimeCurrent());
//--- create objects
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
         int Razon=(int)HistoryDealGetInteger(ticket,DEAL_REASON);


         if(ID==OrdenUltima)
           {
            if(entry==DEAL_ENTRY_OUT)
              {
               if(Razon==DEAL_REASON_SL)
                 {
                  ArrayResize(ArraysOperaciones,NumeroOperaciones-1);
                 }
               if(Razon==DEAL_REASON_TP)
                 {
                  CerrarOperaciones(ArraysOperaciones);
                 }
               break;
              }
           }
        }
     }
//--- apply on chart
   ChartRedraw();
  }
//+------------------------------------------------------------------+
void CerrarOperaciones(int &ArraysOperaciones[])
  {
   int Total=ArraySize(ArraysOperaciones);

   for(int i=Total-1; i>=0; i--)
     {
      bool Seleccion=PositionSelectByTicket(ArraysOperaciones[i]);
      if(Seleccion==false)
         continue;
      trade.PositionClose(PositionGetInteger(POSITION_TICKET),-1);
     }


  }
//+------------------------------------------------------------------+
bool EvaluaHorario(int Apertura,int Cierre)
  {
   MqlDateTime TiempoActual;
   TimeToStruct(TimeCurrent(),TiempoActual);

   if(Apertura>Cierre && (TiempoActual.hour>=Apertura || TiempoActual.hour<Cierre))
      return true;
   else
      if(Apertura<Cierre && TiempoActual.hour>=Apertura && TiempoActual.hour<Cierre)
         return true;

   return false;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Funcion_Igualar_Nivel_Valores(string Cadena)
  {
   ArrayResize(Array_NivelHedgeLote,0);
   int Size=0;
   int Conteo=0;
//string Cadena_Eva=MinimalProfit+";";
   string Cadena_Eva=Cadena+";";
   int PosicionEncontradoAnterior=0;
   int PosicionEncontrado=0;
   while(PosicionEncontrado<StringBufferLen(Cadena_Eva) && PosicionEncontrado!=-1)
     {
      PosicionEncontrado=StringFind(Cadena_Eva,";",PosicionEncontrado+1);
      if(PosicionEncontrado!=-1)
        {
         int Sustraccion=PosicionEncontrado-PosicionEncontradoAnterior;
         string Evalua_String=StringSubstr(Cadena_Eva,PosicionEncontradoAnterior,Sustraccion);
         string a=" ",b=" ";
         if(ComprobarSub(Evalua_String,a,b,true))
           {
            Size++;
            ArrayResize(Array_NivelHedgeLote,Size);
            Array_NivelHedgeLote[Size-1].Nivel=(int)a;
            Array_NivelHedgeLote[Size-1].HedgeLote=(double)b;
           }
         else
           {
            Print("Cadena String con mal planteamiento debe ser por ejemplo 1=2.3;2=2.4;etc");
            return(false);
           }
         PosicionEncontradoAnterior=PosicionEncontrado+1;
         Conteo++;
        }
     }
   return(true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ComprobarSub(string cadena,string &a,string &b,bool EsDouble)
  {
   int Dospuntos=0;
   ushort Digito=0;
   int segundo=0;
   int Numero=0;
   int Punto=0;

   for(int i=0; i<StringLen(cadena); i++)
     {
      Digito=StringGetCharacter(cadena,i);
      if((Digito<'0' || Digito>'9') && Digito!='=' && Digito!='.')
         return false;

      if(Dospuntos!=1 && Digito=='.')
         return false;

      if(Digito=='.')
         Punto++;

      if(Punto>=2)
         return false;

      if(Digito>='0' && Digito<='9')
         Numero++;

      if(Digito=='=')
        {
         Dospuntos++;
         a=StringSubstr(cadena,0,i);
         segundo=i+1;
         if(Numero==0)
            return false;
         Numero=0;
        }

      if(Dospuntos>=2)
        {
         return false;
        }
     }

   if(!EsDouble)
     {
      if(Punto!=0)
         return false;
     }

   b=StringSubstr(cadena,segundo,StringLen(cadena)-segundo);
//Print(a);
   if(Numero==0)
      return false;

   return true;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarLotes()
  {
   int Size=ArraySize(Array_NivelHedgeLote);
   if(Size==0)
     {
      Print("No hay valores para el lotaje");
      return false;
     }
   if(Size==1)
      return true;

   for(int i=1; i<Size; i++)
     {
      if(Array_NivelHedgeLote[i].Nivel<Array_NivelHedgeLote[i-1].Nivel)
        {
         Print("Los niveles deben de ser puestos de manera ordenada");
         return false;
        }
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ComprobarLotaje()
  {
   double LotajeMaximo=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);
   double LotajeMinimo=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);

   int Size=ArraySize(Array_NivelHedgeLote);

   for(int i=Size-1; i>=0; i--)
     {
      if(LotajeMinimo>Array_NivelHedgeLote[i].HedgeLote || LotajeMaximo<Array_NivelHedgeLote[i].HedgeLote)
        {
         Print("ERROR Lotaje ",Array_NivelHedgeLote[i].HedgeLote," es menor a Lotaje minimo=(",DoubleToString(LotajeMinimo,2),") o maximo=(",DoubleToString(LotajeMaximo,2)," en nivel ",Array_NivelHedgeLote[i].Nivel);
         return false;
        }
      double Division=Array_NivelHedgeLote[i].HedgeLote/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
      double Filtro=Division-int(Division);
      if(Filtro>0)
        {
         Print("ERROR Lotaje ",Array_NivelHedgeLote[i].HedgeLote," no es compatible con el paso Lotaje del Simbolo, debe ser divisible entre ",DoubleToString(SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP),2));
         return false;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Lote_Martingala(int Conteo)
  {

   int Size=ArraySize(Array_NivelHedgeLote);

   for(int i=Size-1; i>=0; i--)
     {
      if(Array_NivelHedgeLote[i].Nivel<=Conteo)
        {
         return NormalizeDouble(Array_NivelHedgeLote[i].HedgeLote,2);
        }
     }
   return (SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN));
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ComprobarLotaje2(double Lotaje,int Nivel)
  {
   double LotajeMaximo=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);
   double LotajeMinimo=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);


   if(LotajeMinimo>Lotaje|| LotajeMaximo<Lotaje)
     {
      Print("ERROR Lotaje ",Lotaje," es menor a Lotaje minimo=(",DoubleToString(LotajeMinimo,2),") o maximo=(",DoubleToString(LotajeMaximo,2)," en nivel ",Nivel);
      return false;
     }
   double Division=Lotaje/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
   double Filtro=Division-int(Division);
   if(Filtro>0)
     {
      Print("ERROR Lotaje ",Lotaje," no es compatible con el paso Lotaje del Simbolo, debe ser divisible entre ",DoubleToString(SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP),2));
      return false;
     }
   return true;
  }
//+------------------------------------------------------------------+




//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroRSIFuncion(bool IsBuy)
  {

   if(!FiltroRSI)
      return true;

   double RSI_BUFFER[];
   ArrayResize(RSI_BUFFER,2);
   ArraySetAsSeries(RSI_BUFFER,true);

   int Handle_RSI=iRSI(NULL,PERIOD_CURRENT,RSI_Periodo,RSI_Applied_Price);

   if(Bars(NULL,PERIOD_CURRENT)>RSI_Periodo+1)
     {
      uchar Conteo=0;

      int Copy=CopyBuffer(Handle_RSI,0,0,1,RSI_BUFFER);
      while(Copy<=0 && !IsStopped())
        {
         if(Conteo==0)
           {
            Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE RSI EN ",Symbol()," ",EnumToString(Period()));
            Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL RSI");
           }
         else
            Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL RSI");

         Conteo++;
         Sleep(1000);
         Copy=CopyBuffer(Handle_RSI,0,0,1,RSI_BUFFER);
         if(Conteo>3)
           {
            int Error=GetLastError();
            if(Copy<=0)
              {
               Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE RSI ");
               ExpertRemove();
              }
           }
        }
     }

   if(IsBuy)
     {
      if(RSI_BUFFER[0]<Nivel_Buy)
         return true;
     }
   else
     {
      if(RSI_BUFFER[0]>Nivel_Sell)
         return true;
     }
   return false;
  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TP(int &ArraysOperaciones[],double Profit,bool IsBuy)
  {
   int Total=ArraySize(ArraysOperaciones);
   double Profit_Plus=0;
   double PuntoEquilibrio=0;
   double Dividendo=0;
   double Divisor=0;
   for(int i=Total-1; i>=0; i--)
     {
      bool Seleccion=PositionSelectByTicket(ArraysOperaciones[i]);
      if(Seleccion==false)
         continue;
      Dividendo=Dividendo+PositionGetDouble(POSITION_VOLUME)*PositionGetDouble(POSITION_PRICE_OPEN);
      Divisor=Divisor+PositionGetDouble(POSITION_VOLUME);
     }

   if(Divisor!=0)
     {
      PuntoEquilibrio=NormalizeDouble(Dividendo/Divisor,Digits());
      Comment("Punto Equilibrio ",PuntoEquilibrio);
      if(IsBuy)
        {
         if(ObjectFind(0,Equilibrio_Buy)<0)
            HLineCreate(0,Equilibrio_Buy,0,PuntoEquilibrio,Color_Equilibrio_Buy,STYLE_SOLID,1,false,false,true,0);
         else
            ObjectSetDouble(0,Equilibrio_Buy,OBJPROP_PRICE,0,PuntoEquilibrio);
        }
      else
        {
         if(ObjectFind(0,Equilibrio_Sell)<0)
            HLineCreate(0,Equilibrio_Sell,0,PuntoEquilibrio,Color_Equilibrio_Sell,STYLE_SOLID,1,false,false,true,0);
         else
            ObjectSetDouble(0,Equilibrio_Sell,OBJPROP_PRICE,0,PuntoEquilibrio);
        }

      for(int i=Total-1; i>=0; i--)
        {
         bool Seleccion=PositionSelectByTicket(ArraysOperaciones[i]);
         if(Seleccion==false)
            continue;
         if(IsBuy)
            if(PositionGetDouble(POSITION_TP)!=PuntoEquilibrio+TP_Point*Point())
               trade.PositionModify(PositionGetInteger(POSITION_TICKET),PositionGetDouble(POSITION_SL),PuntoEquilibrio+TP_Point*Point());

         if(!IsBuy)
            if(PositionGetDouble(POSITION_TP)!=PuntoEquilibrio-TP_Point*Point())
               trade.PositionModify(PositionGetInteger(POSITION_TICKET),PositionGetDouble(POSITION_SL),PuntoEquilibrio-TP_Point*Point());
        }


      ChartRedraw();
     }

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
