//+------------------------------------------------------------------+
//|                                     Trailing Stop Smart 2022.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#resource  "\\Indicators\\fractalsmod.ex5"
#include<Trade\Trade.mqh>
CTrade trade;

input uint Pips_Desplazamiento=1;
input int Nivel_ADX=30;
input int Nivel_SobreCompra=70;
input int Nivel_SobreVenta=30;
input string S1="|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|       Configuracion SOP RES       |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|";//---------------------------------------------
input int leftbars      = 4;
input int rightbars     = 4;
input int shift         = 4;
input string S8="|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|       Configuracion RSI       |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int RSI_Periodo=9;
input string S6_="|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|              MACD            |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|";//*--
input int Period_MACD=4;
input int Slow_Ema_MACD=18;
input int Signal_Period_MACD=9;
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;
input string S9="|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|       Configuracion ADX      |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int ADX_Periodo=14;
input ENUM_APPLIED_PRICE ADX_APPrice=PRICE_CLOSE;

double M15BufferUP[];
double M5BufferUP[];
double M1BufferUP[];
double M15BufferDN[];
double M5BufferDN[];
double M1BufferDN[];

double RSIBuffer_M15[];
double RSIBuffer_M5[];
double RSIBuffer_M1[];

double ADXBuffer_M15_Plus[];
double ADXBuffer_M5_Plus[];
double ADXBuffer_M1_Plus[];
double ADXBuffer_M15_Minus[];
double ADXBuffer_M5_Minus[];
double ADXBuffer_M1_Minus[];


int ArrayComparacion[8];
int Bars_Minimo=0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   ArrayComparacion[0]=leftbars;
   ArrayComparacion[1]=rightbars;
   ArrayComparacion[2]=shift;
   ArrayComparacion[3]=RSI_Periodo;
   ArrayComparacion[4]=Period_MACD;
   ArrayComparacion[5]=Slow_Ema_MACD;
   ArrayComparacion[6]=Signal_Period_MACD;
   ArrayComparacion[7]=ADX_Periodo;

   Bars_Minimo=ArrayMaximum(ArrayComparacion,0,WHOLE_ARRAY);

   ArraySetAsSeries(M15BufferUP,true);
   ArraySetAsSeries(M5BufferUP,true);
   ArraySetAsSeries(M1BufferUP,true);
   ArraySetAsSeries(M15BufferDN,true);
   ArraySetAsSeries(M5BufferDN,true);
   ArraySetAsSeries(M1BufferDN,true);


   ArraySetAsSeries(RSIBuffer_M15,true);
   ArraySetAsSeries(RSIBuffer_M5,true);
   ArraySetAsSeries(RSIBuffer_M1,true);

   ArraySetAsSeries(ADXBuffer_M15_Plus,true);
   ArraySetAsSeries(ADXBuffer_M5_Plus,true);
   ArraySetAsSeries(ADXBuffer_M1_Plus,true);
   ArraySetAsSeries(ADXBuffer_M15_Minus,true);
   ArraySetAsSeries(ADXBuffer_M5_Minus,true);
   ArraySetAsSeries(ADXBuffer_M1_Minus,true);
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
   TS_();
//Comment(SymbolInfoDouble("NAS100",SYMBOL_TRADE_TICK_VALUE),"   ",SymbolInfoDouble("GER40",SYMBOL_TRADE_TICK_VALUE));
//double Tick=SymbolInfoDouble("USDCAD",SYMBOL_TRADE_TICK_VALUE);
//double Tick2=SymbolInfoDouble("EURUSD",SYMBOL_TRADE_TICK_VALUE);
   /* int Puntos=100;
    int Puntos2=100;
    while(Tick<1)
      {
       Tick=Tick*10;
       Puntos=Puntos*10;
      }
    while(Tick2<1)
      {
       Tick2=Tick2*10;
       Puntos2=Puntos2*10;
      }*/

// Comment(Tick,"   ",Tick2);


  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CambiarSTOPLOSS(double Precio,ulong Ticket,ENUM_POSITION_TYPE Tipo)
  {

   if(PositionSelectByTicket(Ticket))
     {
      string Symbolo=PositionGetString(POSITION_SYMBOL);
      double Bid=SymbolInfoDouble(Symbolo,SYMBOL_BID);
      double Ask=SymbolInfoDouble(Symbolo,SYMBOL_ASK);
      double OrderOpen=PositionGetDouble(POSITION_PRICE_OPEN);
      double StopLoss=PositionGetDouble(POSITION_SL);
      double Point_=SymbolInfoDouble(Symbolo,SYMBOL_POINT);
      int Digitos_=(int)SymbolInfoInteger(Symbolo,SYMBOL_DIGITS);
      double Tick=SymbolInfoDouble(Symbolo,SYMBOL_TRADE_TICK_VALUE);

      int Puntos=10;
      while(Tick<1)
        {
         Tick=Tick*10;
         Puntos=Puntos*10;
        }

      Puntos=Puntos*(int(Pips_Desplazamiento));
      double Puntos_P=Point_*Puntos;

      if(Tipo==POSITION_TYPE_SELL)
         Precio=Precio+Puntos_P;
      else
         if(Tipo==POSITION_TYPE_BUY)
            Precio=Precio-Puntos_P;

      Precio=NormalizeDouble(Precio,Digitos_);


      if(Tipo==POSITION_TYPE_BUY && Bid>Precio && Precio>OrderOpen && (StopLoss==0 || StopLoss<Precio))
         if(!trade.PositionModify(Ticket,Precio,PositionGetDouble(POSITION_TP)))
            Print("ERROR NO MODIFICO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
         else
            Print("BUY Stop Loss Se modifico a ",Precio," con Ticket ",Ticket);

      if(Tipo==POSITION_TYPE_SELL && Ask<Precio && Precio<OrderOpen && (StopLoss==0 || StopLoss>Precio))
         if(!trade.PositionModify(Ticket,Precio,PositionGetDouble(POSITION_TP)))
            Print("ERROR NO MODIFICO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
         else
            Print("SELL Stop Loss Se modifico a ",Precio," con Ticket ",Ticket);
     }
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TS_() // FUNCION DEL TS Y BREAK VEN
  {
   int Total=PositionsTotal();
   for(int i=Total-1; i>=0; i--)
     {
      ulong Ticket=PositionGetTicket(i);
      if(Ticket==0)
         continue;
      string Symbolo=PositionGetString(POSITION_SYMBOL);
      ENUM_POSITION_TYPE Tipo= (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

      ActualizarDatos(Symbolo,PERIOD_M15);
      ActualizarDatos(Symbolo,PERIOD_M5);
      ActualizarDatos(Symbolo,PERIOD_M1);

      if(Bars(Symbolo,PERIOD_M1)<=(Bars_Minimo+1) || Bars(Symbolo,PERIOD_M5)<=(Bars_Minimo+1) || Bars(Symbolo,PERIOD_M15)<=(Bars_Minimo+1))
         continue;


      if(CopiarBuffers(Symbolo))
        {
         // Comment(Tick,"   ",Tick2);

         Comment("RSI M1= ",DoubleToString(RSIBuffer_M1[0],2),"  RSI M5= ",DoubleToString(RSIBuffer_M5[1],2),"  RSI M15= ",DoubleToString(RSIBuffer_M15[1],2));

         if(Tipo==POSITION_TYPE_BUY)
           {
            if(RSIBuffer_M15[0]>=Nivel_SobreCompra)
              {
               if(RSIBuffer_M5[0]>=Nivel_SobreCompra)
                 {
                  if(RSIBuffer_M1[1]>=Nivel_SobreCompra)
                    {
                     if(ADXBuffer_M1_Plus[1]>=Nivel_ADX)
                        CambiarSTOPLOSS(M1BufferDN[0],Ticket,Tipo);

                     continue;
                    }
                 }
               if(ADXBuffer_M5_Plus[1]>=Nivel_ADX)
                  CambiarSTOPLOSS(M5BufferDN[0],Ticket,Tipo);
              }
            else
              {
               if(ADXBuffer_M15_Plus[1]>=Nivel_ADX)
                  CambiarSTOPLOSS(M15BufferDN[0],Ticket,Tipo);
              }
           }
         else
            if(Tipo==POSITION_TYPE_SELL)
              {
               if(RSIBuffer_M15[0]<=Nivel_SobreVenta)
                 {
                  if(RSIBuffer_M5[0]<=Nivel_SobreVenta)
                    {
                     if(RSIBuffer_M1[1]<=Nivel_SobreVenta)
                       {
                        if(ADXBuffer_M1_Minus[1]>=Nivel_ADX)
                           CambiarSTOPLOSS(M1BufferUP[0],Ticket,Tipo);

                        continue;
                       }
                    }
                  if(ADXBuffer_M5_Minus[1]>=Nivel_ADX)
                     CambiarSTOPLOSS(M5BufferUP[0],Ticket,Tipo);

                 }
               else
                 {
                  if(ADXBuffer_M15_Minus[1]>=Nivel_ADX)
                     CambiarSTOPLOSS(M15BufferUP[0],Ticket,Tipo);
                 }
              }
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CopiarBuffers(string Symbolo)
  {

   int Handle_M15=iCustom(Symbolo,PERIOD_M15,"::Indicators\\fractalsmod.ex5",leftbars,rightbars,shift);
   int Handle_M5=iCustom(Symbolo,PERIOD_M5,"::Indicators\\fractalsmod.ex5",leftbars,rightbars,shift);
   int Handle_M1=iCustom(Symbolo,PERIOD_M1,"::Indicators\\fractalsmod.ex5",leftbars,rightbars,shift);

   int Handle_MACD_15=iMACD(Symbolo,PERIOD_M15,Period_MACD,Slow_Ema_MACD,Signal_Period_MACD,Applied_Price_MACD);
   int Handle_RSI_15=iRSI(Symbolo,PERIOD_M15,RSI_Periodo,Handle_MACD_15);

   int Handle_MACD_5=iMACD(Symbolo,PERIOD_M5,Period_MACD,Slow_Ema_MACD,Signal_Period_MACD,Applied_Price_MACD);
   int Handle_RSI_5=iRSI(Symbolo,PERIOD_M5,RSI_Periodo,Handle_MACD_5);

   int Handle_MACD_1=iMACD(Symbolo,PERIOD_M1,Period_MACD,Slow_Ema_MACD,Signal_Period_MACD,Applied_Price_MACD);
   int Handle_RSI_1=iRSI(Symbolo,PERIOD_M1,RSI_Periodo,Handle_MACD_1);

   int ADX_Handle_M15=iADX(Symbolo,PERIOD_M15,ADX_Periodo);
   int ADX_Handle_M5=iADX(Symbolo,PERIOD_M5,ADX_Periodo);
   int ADX_Handle_M1=iADX(Symbolo,PERIOD_M1,ADX_Periodo);


   uchar Conteo=0;
   int Copy=CopyBuffer(ADX_Handle_M15,2,0,3,ADXBuffer_M15_Minus);
   while(Copy<=0 && !IsStopped())
     {
      if(Conteo==0)
        {
         Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE ADX EN ",Symbolo," ",EnumToString(PERIOD_M15));
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL ADX ");
        }
      else
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL ADX");

      Conteo++;
      Sleep(1000);
      Copy=CopyBuffer(ADX_Handle_M15,2,0,3,ADXBuffer_M15_Minus);
      if(Conteo>3)
        {
         int Error=GetLastError();
         if(Copy<=0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE  ADX EN ",Symbolo," ",EnumToString(PERIOD_M15),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE  ADX EN ",Symbolo," ",EnumToString(PERIOD_M15),"  Cod ",Error);
            Print("NO EVALUARA ADX EN ",Symbolo," ",EnumToString(PERIOD_M15),"  Cod ",Error);
            return false;
           }
        }
     }
   Conteo=0;
   Copy=CopyBuffer(ADX_Handle_M5,2,0,3,ADXBuffer_M5_Minus);
   while(Copy<=0 && !IsStopped())
     {
      if(Conteo==0)
        {
         Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE ADX EN ",Symbolo," ",EnumToString(PERIOD_M5));
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL ADX ");
        }
      else
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL ADX");

      Conteo++;
      Sleep(1000);
      Copy=CopyBuffer(ADX_Handle_M5,2,0,3,ADXBuffer_M5_Minus);
      if(Conteo>3)
        {
         int Error=GetLastError();
         if(Copy<=0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE  ADX EN ",Symbolo," ",EnumToString(PERIOD_M5),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE  ADX EN ",Symbolo," ",EnumToString(PERIOD_M5),"  Cod ",Error);
            Print("NO EVALUARA ADX EN ",Symbolo," ",EnumToString(PERIOD_M5),"  Cod ",Error);
            return false;
           }
        }
     }

   Conteo=0;
   Copy=CopyBuffer(ADX_Handle_M1,2,0,3,ADXBuffer_M1_Minus);
   while(Copy<=0 && !IsStopped())
     {
      if(Conteo==0)
        {
         Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE ADX EN ",Symbolo," ",EnumToString(PERIOD_M1));
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL ADX ");
        }
      else
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL ADX");

      Conteo++;
      Sleep(1000);
      Copy=CopyBuffer(ADX_Handle_M1,2,0,3,ADXBuffer_M1_Minus);
      if(Conteo>3)
        {
         int Error=GetLastError();
         if(Copy<=0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE  ADX EN ",Symbolo," ",EnumToString(PERIOD_M1),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE  ADX EN ",Symbolo," ",EnumToString(PERIOD_M1),"  Cod ",Error);
            Print("NO EVALUARA ADX EN ",Symbolo," ",EnumToString(PERIOD_M1),"  Cod ",Error);
            return false;
           }
        }
     }


   Conteo=0;
   Copy=CopyBuffer(ADX_Handle_M15,1,0,3,ADXBuffer_M15_Plus);
   while(Copy<=0 && !IsStopped())
     {
      if(Conteo==0)
        {
         Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE ADX EN ",Symbolo," ",EnumToString(PERIOD_M15));
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL ADX ");
        }
      else
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL ADX");

      Conteo++;
      Sleep(1000);
      Copy=CopyBuffer(ADX_Handle_M15,1,0,3,ADXBuffer_M15_Plus);
      if(Conteo>3)
        {
         int Error=GetLastError();
         if(Copy<=0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE  ADX EN ",Symbolo," ",EnumToString(PERIOD_M15),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE  ADX EN ",Symbolo," ",EnumToString(PERIOD_M15),"  Cod ",Error);
            Print("NO EVALUARA ADX EN ",Symbolo," ",EnumToString(PERIOD_M15),"  Cod ",Error);
            return false;
           }
        }
     }

   Conteo=0;
   Copy=CopyBuffer(ADX_Handle_M5,1,0,3,ADXBuffer_M5_Plus);
   while(Copy<=0 && !IsStopped())
     {
      if(Conteo==0)
        {
         Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE ADX EN ",Symbolo," ",EnumToString(PERIOD_M5));
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL ADX ");
        }
      else
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL ADX");

      Conteo++;
      Sleep(1000);
      Copy=CopyBuffer(ADX_Handle_M5,1,0,3,ADXBuffer_M5_Plus);
      if(Conteo>3)
        {
         int Error=GetLastError();
         if(Copy<=0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE  ADX EN ",Symbolo," ",EnumToString(PERIOD_M5),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE  ADX EN ",Symbolo," ",EnumToString(PERIOD_M5),"  Cod ",Error);
            Print("NO EVALUARA ADX EN ",Symbolo," ",EnumToString(PERIOD_M5),"  Cod ",Error);
            return false;
           }
        }
     }

   Conteo=0;
   Copy=CopyBuffer(ADX_Handle_M1,1,0,3,ADXBuffer_M1_Plus);
   while(Copy<=0 && !IsStopped())
     {
      if(Conteo==0)
        {
         Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE ADX EN ",Symbolo," ",EnumToString(PERIOD_M1));
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL ADX ");
        }
      else
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL ADX");

      Conteo++;
      Sleep(1000);
      Copy=CopyBuffer(ADX_Handle_M1,1,0,3,ADXBuffer_M1_Plus);
      if(Conteo>3)
        {
         int Error=GetLastError();
         if(Copy<=0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE  ADX EN ",Symbolo," ",EnumToString(PERIOD_M1),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE  ADX EN ",Symbolo," ",EnumToString(PERIOD_M1),"  Cod ",Error);
            Print("NO EVALUARA ADX EN ",Symbolo," ",EnumToString(PERIOD_M1),"  Cod ",Error);
            return false;
           }
        }
     }


   Conteo=0;
   Copy=CopyBuffer(Handle_RSI_15,0,0,3,RSIBuffer_M15);
   while(Copy<=0 && !IsStopped())
     {
      if(Conteo==0)
        {
         Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE RSI EN ",Symbolo," ",EnumToString(PERIOD_M15));
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL RSI ");
        }
      else
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL RSI");

      Conteo++;
      Sleep(1000);
      Copy=CopyBuffer(Handle_RSI_15,0,0,3,RSIBuffer_M15);
      if(Conteo>3)
        {
         int Error=GetLastError();
         if(Copy<=0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE  RSI EN ",Symbolo," ",EnumToString(PERIOD_M15),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE  RSI EN ",Symbolo," ",EnumToString(PERIOD_M15),"  Cod ",Error);
            Print("NO EVALUARA RSI EN ",Symbolo," ",EnumToString(PERIOD_M15),"  Cod ",Error);
            return false;
           }
        }
     }


   Conteo=0;
   Copy=CopyBuffer(Handle_RSI_5,0,0,3,RSIBuffer_M5);
   while(Copy<=0 && !IsStopped())
     {
      if(Conteo==0)
        {
         Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE RSI EN ",Symbolo," ",EnumToString(PERIOD_M5));
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL RSI ");
        }
      else
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL RSI");

      Conteo++;
      Sleep(1000);
      Copy=CopyBuffer(Handle_RSI_5,0,0,3,RSIBuffer_M5);
      if(Conteo>3)
        {
         int Error=GetLastError();
         if(Copy<=0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE  RSI EN ",Symbolo," ",EnumToString(PERIOD_M5),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE  RSI EN ",Symbolo," ",EnumToString(PERIOD_M5),"  Cod ",Error);
            Print("NO EVALUARA RSI EN ",Symbolo," ",EnumToString(PERIOD_M5),"  Cod ",Error);
            return false;
           }
        }
     }


   Conteo=0;
   Copy=CopyBuffer(Handle_RSI_1,0,0,3,RSIBuffer_M1);
   while(Copy<=0 && !IsStopped())
     {
      if(Conteo==0)
        {
         Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE RSI EN ",Symbolo," ",EnumToString(PERIOD_M1));
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL RSI ");
        }
      else
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL RSI");

      Conteo++;
      Sleep(1000);
      Copy=CopyBuffer(Handle_RSI_1,0,0,3,RSIBuffer_M1);
      if(Conteo>3)
        {
         int Error=GetLastError();
         if(Copy<=0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE  RSI EN ",Symbolo," ",EnumToString(PERIOD_M1),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE  RSI EN ",Symbolo," ",EnumToString(PERIOD_M1),"  Cod ",Error);
            Print("NO EVALUARA RSI EN ",Symbolo," ",EnumToString(PERIOD_M1),"  Cod ",Error);
            return false;
           }
        }
     }


   Conteo=0;
   Copy=CopyBuffer(Handle_M15,0,0,3,M15BufferUP);
   while(Copy<=0 && !IsStopped())
     {
      if(Conteo==0)
        {
         Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE SOP RES EN ",Symbolo," ",EnumToString(PERIOD_M15));
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL  SOP RES ");
        }
      else
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL  SOP RES ");

      Conteo++;
      Sleep(1000);
      Copy=CopyBuffer(Handle_M15,0,0,3,M15BufferUP);
      if(Conteo>3)
        {
         int Error=GetLastError();
         if(Copy<=0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE  SOP RES EN ",Symbolo," ",EnumToString(PERIOD_M15),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE  SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M15),"  Cod ",Error);
            Print("NO EVALUARA  SOP RES EN ",Symbolo," ",EnumToString(PERIOD_M15),"  Cod ",Error);
            return false;
           }
        }
     }

   Conteo=0;
   Copy=CopyBuffer(Handle_M5,0,0,3,M5BufferUP);
   while(Copy<=0 && !IsStopped())
     {
      if(Conteo==0)
        {
         Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M5));
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL  SOP RES ");
        }
      else
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL  SOP RES ");

      Conteo++;
      Sleep(1000);
      Copy=CopyBuffer(Handle_M5,0,0,3,M5BufferUP);
      if(Conteo>3)
        {
         int Error=GetLastError();
         if(Copy<=0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE  SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M5),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE  SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M5),"  Cod ",Error);
            Print("NO EVALUARA  SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M5),"  Cod ",Error);
            return false;
           }
        }
     }

   Conteo=0;
   Copy=CopyBuffer(Handle_M1,0,0,3,M1BufferUP);
   while(Copy<=0 && !IsStopped())
     {
      if(Conteo==0)
        {
         Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE  SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M1));
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL  SOP RES ");
        }
      else
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL  SOP RES ");

      Conteo++;
      Sleep(1000);
      Copy=CopyBuffer(Handle_M1,0,0,3,M1BufferUP);
      if(Conteo>3)
        {
         int Error=GetLastError();
         if(Copy<=0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE  SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M1),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE  SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M1),"  Cod ",Error);
            Print("NO EVALUARA SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M1),"  Cod ",Error);
            return false;
           }
        }
     }



   Conteo=0;
   Copy=CopyBuffer(Handle_M15,1,0,3,M15BufferDN);
   while(Copy<=0 && !IsStopped())
     {
      if(Conteo==0)
        {
         Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE SOP RES EN ",Symbolo," ",EnumToString(PERIOD_M15));
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL  SOP RES ");
        }
      else
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL  SOP RES ");

      Conteo++;
      Sleep(1000);
      Copy=CopyBuffer(Handle_M15,1,0,3,M15BufferDN);
      if(Conteo>3)
        {
         int Error=GetLastError();
         if(Copy<=0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE  SOP RES EN ",Symbolo," ",EnumToString(PERIOD_M15),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE  SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M15),"  Cod ",Error);
            Print("NO EVALUARA  SOP RES EN ",Symbolo," ",EnumToString(PERIOD_M15),"  Cod ",Error);
            return false;
           }
        }
     }

   Conteo=0;
   Copy=CopyBuffer(Handle_M5,1,0,3,M5BufferDN);
   while(Copy<=0 && !IsStopped())
     {
      if(Conteo==0)
        {
         Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M5));
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL  SOP RES ");
        }
      else
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL  SOP RES ");

      Conteo++;
      Sleep(1000);
      Copy=CopyBuffer(Handle_M5,1,0,3,M5BufferDN);
      if(Conteo>3)
        {
         int Error=GetLastError();
         if(Copy<=0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE  SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M5),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE  SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M5),"  Cod ",Error);
            Print("NO EVALUARA  SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M5),"  Cod ",Error);
            return false;
           }
        }
     }

   Conteo=0;
   Copy=CopyBuffer(Handle_M1,1,0,3,M1BufferDN);
   while(Copy<=0 && !IsStopped())
     {
      if(Conteo==0)
        {
         Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE  SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M1));
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL  SOP RES ");
        }
      else
         Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL  SOP RES ");

      Conteo++;
      Sleep(1000);
      Copy=CopyBuffer(Handle_M1,1,0,3,M1BufferDN);
      if(Conteo>3)
        {
         int Error=GetLastError();
         if(Copy<=0)
           {
            Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE  SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M1),"  Cod ",Error);
            Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE  SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M1),"  Cod ",Error);
            Print("NO EVALUARA SOP RES  EN ",Symbolo," ",EnumToString(PERIOD_M1),"  Cod ",Error);
            return false;
           }
        }
     }


   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime ActualizarDatos(string Simbolo,ENUM_TIMEFRAMES TimeFrames)
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
            ExpertRemove();
           }
        }
     }

   return rates[1].time;
//Print("Z2");
  }
//+------------------------------------------------------------------+
