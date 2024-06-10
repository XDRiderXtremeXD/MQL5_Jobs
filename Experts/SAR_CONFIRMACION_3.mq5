//+------------------------------------------------------------------+
//|                                           SAR_CONFIRMACION_3.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#resource "\\Indicators\\Indicador_SAR_Confirmacion_3.ex5"

#include<Trade\Trade.mqh>
CTrade trade;

enum Tipo_SL
  {
   Relacion_TP,
   Personalizado,
  };

enum Tipo_Operacion
  {
   Only_BUY,
   Only_SELL,
   Both,
  };



input bool CerrarAlCambiarSar=true;
input string S20="===================   OPERATIVA ===================";//=========================================================
input Tipo_Operacion TipoOperacion=Both;//Tipo Operacion
input double Lote=0.01;
input string comentario="Expert Sar";
input int magicNumber=22222;
input string S02="===================   TP Y SL ===================";//=========================================================
input Tipo_SL Tipo_SL_=Relacion_TP;//Tipo SL
input double TP_Relacion_SL=2;
input int SL_Personalizado=200;//SL Personalizado
input string S0="===================   INDICADOR ===================";//=========================================================
input string S1="*********************   Configuracion SAR *********************";//***************************************************************
input double SAR_Step=0.02;//Onda A
input double SAR_Maximun=0.2;//Onda B
input string S3_="********************* MA *********************";//***************************************************************
input int Ma_Periodo=50;
input int Ma_Shift=0;
input ENUM_MA_METHOD Ma_Method=MODE_SMA;
input ENUM_APPLIED_PRICE Ma_AppliedPrice=PRICE_CLOSE;
input string S5="*********************   Configuracion Color *********************";//***************************************************************
input color Color_Alcista=clrLime;
input color Color_Bajista=clrMagenta;


int Handle_1=0;

double Arrows_BUY[];
double Arrows_SELL[];
double SAR[];
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   Handle_1=iCustom(NULL,PERIOD_CURRENT,"::Indicators\\Indicador_SAR_Confirmacion_3.ex5",S1
                    ,SAR_Step,SAR_Maximun,
                    S3_,Ma_Periodo,Ma_Shift,Ma_Method,Ma_AppliedPrice,
                    S5,Color_Alcista,Color_Bajista);

   trade.SetExpertMagicNumber(magicNumber);

   ArraySetAsSeries(Arrows_BUY,true);
   ArraySetAsSeries(Arrows_SELL,true);
   ArraySetAsSeries(SAR,true);
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

   int Bars_Actual=iBars(Symbol(),PERIOD_CURRENT);
   static int Bars_=Bars_Actual;


   if(Bars_!=Bars_Actual)
     {
      if(BarsCalculated(Handle_1)==Bars_Actual)
        {
         if(CopyBuffer(Handle_1,1,0,3,Arrows_SELL)>0 && CopyBuffer(Handle_1,0,0,3,Arrows_BUY)>0 && CopyBuffer(Handle_1,2,0,3,SAR)>0)
           {
            //TS_SAR(SAR[1]);

            double Ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
            double Bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);

            if(CerrarAlCambiarSar)
              {
               if(SAR[1]>iClose(Symbol(),PERIOD_CURRENT,1) && SAR[2]<iClose(Symbol(),PERIOD_CURRENT,2))
                  CerrarOrdenes(false);

               if(SAR[1]<iClose(Symbol(),PERIOD_CURRENT,1) && SAR[2]>iClose(Symbol(),PERIOD_CURRENT,2))
                  CerrarOrdenes(true);
              }

            if(TipoOperacion==Only_SELL || TipoOperacion==Both)
               if(Arrows_SELL[1]!=EMPTY_VALUE)
                 {
                  EliminarPendientes(false);

                  double Entrada=SAR[2];
                  double TP=SAR[1];
                  double SL=NormalizeDouble(Entrada+MathAbs(TP-Entrada)/TP_Relacion_SL,Digits());
                  if(Tipo_SL_==Personalizado)
                     SL=SL_Personalizado==0?0:NormalizeDouble(Entrada+SL_Personalizado*Point(),Digits());

                  if(Entrada<Bid)
                    {
                     if(!trade.SellStop(Lote,Entrada,Symbol(),SL,TP,ORDER_TIME_GTC,0,comentario))
                       {
                        Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                        Print("ABRIR SELL");
                        if(!trade.Sell(Lote,Symbol(),Ask,SL,TP,comentario))
                           Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                       }
                    }
                  if(Entrada>Bid)
                    {
                     if(!trade.SellLimit(Lote,Entrada,Symbol(),SL,TP,ORDER_TIME_GTC,0,comentario))
                       {
                        Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                        Print("ABRIR SELL");
                        if(!trade.Sell(Lote,Symbol(),Ask,SL,TP,comentario))
                           Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                       }
                    }
                  if(Entrada==Bid)
                    {
                     if(!trade.Sell(Lote,Symbol(),Ask,SL,TP,comentario))
                        Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                    }

                 }

            if(TipoOperacion==Only_BUY || TipoOperacion==Both)
               if(Arrows_BUY[1]!=EMPTY_VALUE)
                 {
                  EliminarPendientes(true);

                  double Entrada=SAR[2];
                  double TP=SAR[1];
                  double SL=NormalizeDouble(Entrada-MathAbs(TP-Entrada)/TP_Relacion_SL,Digits());
                  if(Tipo_SL_==Personalizado)
                     SL=SL_Personalizado==0?0:NormalizeDouble(Entrada-SL_Personalizado*Point(),Digits());

                  if(Entrada>Ask)
                    {
                     if(!trade.BuyStop(Lote,Entrada,Symbol(),SL,TP,ORDER_TIME_GTC,0,comentario))
                       {
                        Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                        Print("ABRIR BUY");
                        if(!trade.Buy(Lote,Symbol(),Ask,SL,TP,comentario))
                           Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                       }
                    }
                  if(Entrada<Ask)
                    {
                     if(!trade.BuyLimit(Lote,Entrada,Symbol(),SL,TP,ORDER_TIME_GTC,0,comentario))
                       {
                        Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                        Print("ABRIR BUY");
                        if(!trade.Buy(Lote,Symbol(),Ask,SL,TP,comentario))
                           Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                       }
                    }
                  if(Entrada==Ask)
                    {
                     if(!trade.Buy(Lote,Symbol(),Ask,SL,TP,comentario))
                        Print("ERROR "+string(trade.ResultRetcode())+" "+string(GetLastError()));
                    }
                 }
            Bars_=Bars_Actual;
           }
        }
     }
  }


//+------------------------------------------------------------------+
void TS_SAR(double sar) // FUNCION DEL TS Y BREAK VEN
  {
   if(sar==EMPTY_VALUE)
      return;

   sar=NormalizeDouble(sar,Digits());

   for(int cnt=0; cnt<PositionsTotal(); cnt++) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)==magicNumber && PositionGetSymbol(cnt)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
        {
         double precio=PositionGetDouble(POSITION_PRICE_CURRENT);

         if(sar<precio && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && (sar>=PositionGetDouble(POSITION_SL) || PositionGetDouble(POSITION_SL) ==0))
            if(!trade.PositionModify(Ticket,sar,PositionGetDouble(POSITION_TP)))
               Print("ResultRetcode error ",trade.ResultRetcode());

         if(sar>precio && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL  && (sar<=PositionGetDouble(POSITION_SL)  || PositionGetDouble(POSITION_SL) ==0))
            if(!trade.PositionModify(Ticket,sar,PositionGetDouble(POSITION_TP)))
               Print("ResultRetcode error ",trade.ResultRetcode());

        }
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EliminarPendientes(bool soloBuys)
  {

   int ordenes=OrdersTotal();

   for(int cnt=ordenes-1; cnt>=0; cnt--)
     {
      ulong Ticket=OrderGetTicket(cnt);
      if(Ticket==0)
         continue;

      if(OrderGetInteger(ORDER_MAGIC)==magicNumber && OrderGetString(ORDER_SYMBOL)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
        {
         if(soloBuys?(OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_BUY_STOP || OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_BUY_LIMIT):(OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_SELL_STOP || OrderGetInteger(ORDER_TYPE)==ORDER_TYPE_SELL_LIMIT))
            if(!trade.OrderDelete(Ticket))
               Print("NO PUDO CERRAR PENDIENTE error: ",GetLastError()," ",trade.ResultRetcode());
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarOrdenes(bool soloBuys)
  {

   int ordenes=PositionsTotal();

   for(int cnt=ordenes-1; cnt>=0; cnt--)
     {
      ulong Ticket=PositionGetTicket(cnt);
      if(Ticket==0)
         continue;

      if(PositionGetInteger(POSITION_MAGIC)==magicNumber && PositionGetString(POSITION_SYMBOL)==Symbol()) // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
        {
         if(soloBuys?(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY):(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL))
            if(!trade.PositionClose(Ticket,-1))
               Print("NO PUDO CERRAR POSICION error: ",GetLastError()," ",trade.ResultRetcode());
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
