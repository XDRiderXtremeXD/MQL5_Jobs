//+------------------------------------------------------------------+
//|                        Estrategia StarcBands Willian Percent.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include<Trade\Trade.mqh>
CTrade trade;
#resource "\\Indicators\\STARC_bands_1.2.ex5"


enum enPrices
  {
   pr_close,      // Close
   pr_open,       // Open
   pr_high,       // High
   pr_low,        // Low
   pr_median,     // Median
   pr_typical,    // Typical
   pr_weighted,   // Weighted
   pr_average,    // Average (high+low+open+close)/4
   pr_medianb,    // Average median body (open+close)/2
   pr_tbiased,    // Trend biased price
   pr_tbiased2,   // Trend biased (extreme) price
   pr_haclose,    // Heiken ashi close
   pr_haopen,     // Heiken ashi open
   pr_hahigh,     // Heiken ashi high
   pr_halow,      // Heiken ashi low
   pr_hamedian,   // Heiken ashi median
   pr_hatypical,  // Heiken ashi typical
   pr_haweighted, // Heiken ashi weighted
   pr_haaverage,  // Heiken ashi average
   pr_hamedianb,  // Heiken ashi median body
   pr_hatbiased,  // Heiken ashi trend biased price
   pr_hatbiased2  // Heiken ashi trend biased (extreme) price
  };
enum enMaTypes
  {
   ma_sma,    // Simple moving average
   ma_ema,    // Exponential moving average
   ma_smma,   // Smoothed MA
   ma_lwma    // Linear weighted MA
  };

input bool Ver_Indicador=true;
input bool Modo_Manual=true;
input bool Ver_Lineas_TimeFrameSuperior=true;
input bool Ver_Lineas_TimeFrameInferior=false;
input int Maximo_Velas_Espera=20;
input string S0_="------ CONFIGURAR TRADES ------ ";//----------------------------------------------------------------
input double Lote=0.01;
input double Profit_USD=20;
input double StopLoss_USD=10;
input string S0="------ CONFIGURAR GRAFICOS ------ ";//----------------------------------------------------------------
input ENUM_TIMEFRAMES TimeFrame_Superior=PERIOD_D1;// GRAFICO SUPERIOR
input ENUM_TIMEFRAMES TimeFrame=PERIOD_H1;//GRAFICO INFERIOR
input string S1="------ INDICADOR STARC BANDS (Grafico Inferior) ------";//----------------------------------------------
input int             StarcPeriod     = 6;             // STARC main period
input int             StarcFastPeriod = 3;              // Fast period (for candles color)
input enMaTypes       StarcMaType     = ma_sma;         // STARC average type
input enPrices        Price           = pr_close;       // Price
input int             AtrPeriod       = 17;            // ATR period
input double          AtrMultiplier1  = 2;              // ATR multiplier 1
input double          AtrMultiplier2  = 3;              // ATR multiplier 2
input enMaTypes       AtrMaType       = ma_sma;         // ATR averaging type
input bool            DisplayCandles  = false;           // Should candles be displayed?
input bool            Interpolate     = true;           // Interpolate mtf data ?
input string S2="----------------------- WPR (Grafico Superior) ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input int WPR_Periodo=16;
input string S8="----------------------- EMA (Grafico Superior) ---------------------";//-----------------------------------------------------------------------------------------------------------------------------------
input int Ma_Periodo=20;
input int Ma_Shift=0;
input ENUM_MA_METHOD Ma_Method=MODE_EMA;

int Handle_Stark_Band;
int Handle_WPR;
int Handle_EMA;

double ArrayEMA[];
double ArrayWPR[];
double ArrayStarkBand_UP[];
double ArrayStarkBand_DN[];

MqlRates Rates_Superior[];
MqlRates Rates_Inferior[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   if(TimeFrame==PERIOD_CURRENT)
     {
      Alert("Tiempo Inferior no puede ser PERIOD CURRENT");
      return INIT_FAILED;
     }
   if(TimeFrame_Superior==PERIOD_CURRENT)
     {
      Alert("Tiempo Superior no puede ser PERIOD CURRENT");
      return INIT_FAILED;
     }

   Handle_Stark_Band=iCustom(Symbol(),TimeFrame,"::Indicators\\STARC_bands_1.2.ex5",TimeFrame,StarcPeriod,StarcFastPeriod,StarcMaType,Price,AtrPeriod,AtrMultiplier1
                             ,AtrMultiplier2,AtrMaType,DisplayCandles,Interpolate);

   Handle_WPR=iWPR(Symbol(),TimeFrame_Superior,WPR_Periodo);

   Handle_EMA=iMA(Symbol(),TimeFrame_Superior,Ma_Periodo,Ma_Shift,Ma_Method,Handle_WPR);

   TesterHideIndicators(false);

   if(Handle_Stark_Band==INVALID_HANDLE)
     {
      Alert("Mala configuracion del Stark Band, no iniciara el Bot");
      return INIT_FAILED;
     }

   if(!MQLInfoInteger(MQL_TESTER))
     {
      int Charts=(int)ChartGetInteger(0,CHART_WINDOWS_TOTAL,0);
      for(int i=Charts; i>=0; i--)
        {
         int IndicatorsTotal=ChartIndicatorsTotal(0,i);
         for(int j=IndicatorsTotal-1; j>=0; j--)
           {
            string Nombre=ChartIndicatorName(0,i,j);
            if(StringFind(Nombre,"STARC_bands",0)!=-1)
               ChartIndicatorDelete(0,i,Nombre);
           }
        }
     }

   if(Ver_Indicador)
      ChartIndicatorAdd(0,0,Handle_Stark_Band);

   ArraySetAsSeries(Rates_Superior,true);
   ArraySetAsSeries(Rates_Inferior,true);
   ArraySetAsSeries(ArrayEMA,true);
   ArraySetAsSeries(ArrayWPR,true);
   ArraySetAsSeries(ArrayStarkBand_UP,true);
   ArraySetAsSeries(ArrayStarkBand_DN,true);

   ActualizarDatos(Symbol(),TimeFrame);
   ActualizarDatos(Symbol(),TimeFrame_Superior);

   if(!ComprobarLotaje())
      return(INIT_FAILED);
//---
   return(INIT_SUCCEEDED);
  }

datetime AnteriorDia=0;
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   if(reason==REASON_PROGRAM || reason==REASON_REMOVE || reason==REASON_RECOMPILE || reason==REASON_CHARTCLOSE || reason==REASON_PARAMETERS || reason==REASON_ACCOUNT
      || reason==REASON_CLOSE)
      if(!MQLInfoInteger(MQL_TESTER))
         ObjectsDeleteAll(0,"Linea 2020",0,OBJ_VLINE);

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {

   ActualizarDatos(Symbol(),TimeFrame);
   ActualizarDatos(Symbol(),TimeFrame_Superior);

   int BarrasInferior=iBars(NULL,TimeFrame)-1;
   int BarrasSuperior=iBars(NULL,TimeFrame_Superior)-1;

   BarrasInferior=MathMin(BarrasInferior,3);
   BarrasSuperior=MathMin(BarrasSuperior,200);

   int copied=CopyRates(NULL,TimeFrame_Superior,0,BarrasSuperior,Rates_Superior);
   if(copied<=0)
      Print("Fallo al copiar los datos de precios ",GetLastError());

   copied=CopyRates(NULL,TimeFrame,0,BarrasInferior,Rates_Inferior);
   if(copied<=0)
      Print("Fallo al copiar los datos de precios ",GetLastError());

   static datetime TiempoActual=0;

   if(TiempoActual!=Rates_Inferior[0].time)
     {
      CopyBuffer(Handle_EMA,0,0,BarrasSuperior,ArrayEMA);
      CopyBuffer(Handle_WPR,0,0,BarrasSuperior,ArrayWPR);

      bool Modo_Sell=false;
      bool Modo_Buy=false;

      datetime TiempoSuperior=0;

      for(int i=0; i<BarrasSuperior-2; i++)
        {

         if(ArrayEMA[i+1]<ArrayWPR[i+1] && ArrayEMA[i+2]>ArrayWPR[i+2])
           {
            //  Print(TimeToString(Rates_Superior[i].time,TIME_DATE|TIME_MINUTES),"  UP");
            TiempoSuperior=Rates_Superior[i].time;
            if(AnteriorDia!=TiempoSuperior)
              {
               if(Ver_Lineas_TimeFrameSuperior)
                  VLineCreate(0,"Linea 2020 1"+TimeToString(TiempoSuperior,TIME_DATE|TIME_MINUTES),0,TiempoSuperior,
                              clrAqua,STYLE_SOLID,4,false,false,true,true,0);
               AnteriorDia=TiempoSuperior;
              }

            Modo_Buy=true;
            break;
           }
         else
            if(ArrayEMA[i+1]>ArrayWPR[i+1] && ArrayEMA[i+2]<ArrayWPR[i+2])
              {
               //  Print(TimeToString(Rates_Superior[i].time,TIME_DATE|TIME_MINUTES),"  DN");
               TiempoSuperior=Rates_Superior[i].time;
               Modo_Sell=true;

               if(AnteriorDia!=TiempoSuperior)
                 {
                  if(Ver_Lineas_TimeFrameSuperior)
                     VLineCreate(0,"Linea 2020 1"+TimeToString(TiempoSuperior,TIME_DATE|TIME_MINUTES),0,TiempoSuperior,
                                 clrMagenta,STYLE_SOLID,4,false,false,true,true,0);
                  AnteriorDia=TiempoSuperior;
                 }
               break;
              }
        }

      if(Modo_Buy==false && Modo_Sell==false)
         Print("NO ENCONTRADO CRUCE  ",TimeToString(Rates_Superior[0].time,TIME_DATE|TIME_MINUTES));
      else
        {
         int IndiceInferior=iBarShift(Symbol(),TimeFrame,TiempoSuperior,true);

         if(IndiceInferior!=-1 && IndiceInferior<=Maximo_Velas_Espera)
           {
            BarrasInferior=iBars(NULL,TimeFrame)-1;
            if(IndiceInferior<=BarrasInferior)
              {
               copied=CopyRates(NULL,TimeFrame,0,IndiceInferior+1,Rates_Inferior);
               if(copied<=0)
                  Print("Fallo al copiar los datos de precios ",GetLastError());
               else
                 {
                  CopyBuffer(Handle_Stark_Band,1,0,IndiceInferior+2,ArrayStarkBand_UP);
                  CopyBuffer(Handle_Stark_Band,4,0,IndiceInferior+2,ArrayStarkBand_DN);
                  copied=CopyRates(NULL,TimeFrame,0,IndiceInferior+2,Rates_Inferior);
                  if(copied<=0)
                     Print("Fallo al copiar los datos de precios ",GetLastError());
                  else
                    {
                     bool Entra=true;
                     bool TocaBanda=false;
                     uchar Condicion=false;
                     bool Gatillo3=false;
                     //Print(IndiceInferior);

                     if(Modo_Buy?(Rates_Inferior[1].close>Rates_Inferior[1].open?true:false):(Rates_Inferior[1].close<Rates_Inferior[1].open?true:false))
                       {
                        for(int j=0; j<IndiceInferior; j++)
                          {
                           TocaBanda=Modo_Buy?(Rates_Inferior[j+1].low<ArrayStarkBand_DN[j+1]?true:false):(Rates_Inferior[j+1].high>ArrayStarkBand_UP[j+1]?true:false);
                           bool Gatillo2=Modo_Buy?(Rates_Inferior[j+1].close>Rates_Inferior[j+1].open?true:false):(Rates_Inferior[j+1].close<Rates_Inferior[j+1].open?true:false);
                           if(!Condicion)
                             {
                              if(j>0)
                                 if(Gatillo2)
                                   {
                                    Entra=false;
                                    break;
                                   }
                              if(TocaBanda)
                                 Condicion=true;
                             }
                           else
                             {
                              if(!Gatillo3 && Gatillo2)
                                 Gatillo3=true;
                              if(TocaBanda && Gatillo3)
                                {
                                 Entra=false;
                                 break;
                                }
                             }
                          }
                       }
                     else
                        Entra=false;

                     if(Entra && Condicion)
                       {
                        if(Modo_Buy)
                          {
                           if(Ver_Lineas_TimeFrameInferior)
                              VLineCreate(0,"Linea 2020"+TimeToString(Rates_Inferior[0].time,TIME_DATE|TIME_MINUTES),0,Rates_Inferior[1].time,
                                          clrGreen,STYLE_SOLID,2,false,false,true,true,0);
                           BUY();
                          }
                        else
                          {
                           //     Print("DN");
                           if(Ver_Lineas_TimeFrameInferior)
                              VLineCreate(0,"Linea 2020"+TimeToString(Rates_Inferior[0].time,TIME_DATE|TIME_MINUTES),0,Rates_Inferior[1].time,
                                          clrRed,STYLE_SOLID,2,false,false,true,true,0);
                           SELL();
                          }
                       }
                    }
                 }
              }
            else
               Print("IndiceINFERIOR es superior a Barras, ERROR");
           }
         else
            Print("Barras Evaluadas superan el maximo de Espera,IndiceINFERIOR es igual a -1");
        }
      TiempoActual=Rates_Inferior[0].time;
     }
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

//+------------------------------------------------------------------+


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

   if(!MQLInfoInteger(MQL_TESTER))
     {
      if(TimeFrame==PERIOD_M1)
         ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M1);
      if(TimeFrame==PERIOD_M2)
         ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M2);
      if(TimeFrame==PERIOD_M3)
         ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M3);
      if(Period()==PERIOD_M4)
         ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M4);
      if(Period()==PERIOD_M5)
         ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M5);
      if(Period()==PERIOD_M6)
         ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M6);
      if(Period()==PERIOD_M10)
         ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M10);
      if(Period()==PERIOD_M12)
         ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M12);
      if(Period()==PERIOD_M15)
         ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15);
      if(Period()==PERIOD_M20)
         ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M20);
      if(Period()==PERIOD_M30)
         ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M30);
      if(Period()==PERIOD_H1)
         ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_PERIOD_H1);
      if(Period()==PERIOD_H2)
         ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_PERIOD_H2);
      if(Period()==PERIOD_H3)
         ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_PERIOD_H3);
      if(Period()==PERIOD_H4)
         ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_PERIOD_H4);
      if(Period()==PERIOD_H6)
         ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_PERIOD_H6);
     }
   else
      ObjectSetInteger(chart_ID,name,OBJPROP_TIMEFRAMES,OBJ_ALL_PERIODS);
//--- ejecución con éxito
   return(true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ComprobarLotaje()
  {
   double Step=SymbolInfoDouble(NULL,SYMBOL_VOLUME_STEP);
   double Minimo=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MIN);
   double Maximo=SymbolInfoDouble(NULL,SYMBOL_VOLUME_MAX);

   double Lotaje=Lote/Step;
   double LotajeInt=double(int(Lotaje));

   if(Lotaje-LotajeInt>0)
     {
      Alert("LOTAJE NO ES COMPATIBLE A ESTE SIMBOLO.. TIENE QUE SER UN VALOR DIVISIBLE ENTRE ",DoubleToString(Step));
      return false;
     }
   if(Lote>Maximo)
     {
      Alert("LOTAJE NO ES COMPATIBLE A ESTE SIMBOLO.. ES MAYOR AL MAXIMO ",DoubleToString(Maximo));
      return false;
     }

   if(Lote<Minimo)
     {
      Alert("LOTAJE NO ES COMPATIBLE A ESTE SIMBOLO.. ES MAYOR AL MAXIMO ",DoubleToString(Maximo));
      return false;
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void BUY()
  {
   bool Operacion=true;
   if(Modo_Manual)
     {
      datetime TiempoConfirmacion=TimeLocal()+5*PeriodSeconds(PERIOD_M1);

      if(MessageBox("Confirmacion Operacion","Deseas Operar esta señal?",MB_YESNO|MB_ICONQUESTION)!=IDYES)
         Operacion=false;

      if(Operacion==true)
        {
         if(TimeLocal()>=TiempoConfirmacion)
           {
            Alert("La confirmacion excedio los 5 minutos de espera,Poner operacion manualmente");
            Operacion=true;
           }
        }
     }

   if(Operacion=true)
     {
      double Ask=SymbolInfoDouble(NULL,SYMBOL_ASK);

      double TickValue=SymbolInfoDouble(NULL,SYMBOL_TRADE_TICK_VALUE);
      int PuntosProfit=int(Profit_USD/(Lote*TickValue))+1;
      int PuntosSL=int(StopLoss_USD/(Lote*TickValue))+1;

      double StopLoss_=Ask-(PuntosSL*Point());
      double TakeProfit_=Ask+(PuntosProfit*Point());

      if(Profit_USD==0)
         TakeProfit_=0;
      if(StopLoss_USD==0)
         StopLoss_=0;


      bool BuyTradeBool=trade.Buy(Lote,Symbol(),Ask,StopLoss_,TakeProfit_,"Expert StarcBands");
      if(!BuyTradeBool)
         Print("ERROR AL EJECUTAR EL SELL ",trade.ResultRetcode()," ir https://www.mql5.com/es/docs/constants/errorswarnings/enum_trade_return_codes");
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SELL()
  {
   bool Operacion=true;
   if(Modo_Manual)
     {
      datetime TiempoConfirmacion=TimeLocal()+5*PeriodSeconds(PERIOD_M1);

      if(MessageBox("Confirmacion Operacion","Deseas Operar esta señal?",MB_YESNO|MB_ICONQUESTION)!=IDYES)
         Operacion=false;

      if(Operacion==true)
        {
         if(TimeLocal()>=TiempoConfirmacion)
           {
            Alert("La confirmacion excedio los 5 minutos de espera,Poner operacion manualmente");
            Operacion=true;
           }
        }
     }


   if(Operacion=true)
     {
      double Bid=SymbolInfoDouble(NULL,SYMBOL_BID);

      double TickValue=SymbolInfoDouble(NULL,SYMBOL_TRADE_TICK_VALUE);
      int PuntosProfit=int(Profit_USD/(Lote*TickValue))+1;
      int PuntosSL=int(StopLoss_USD/(Lote*TickValue))+1;

      double StopLoss_=Bid+(PuntosSL*Point());
      double TakeProfit_=Bid-(PuntosProfit*Point());

      if(Profit_USD==0)
         TakeProfit_=0;
      if(StopLoss_USD==0)
         StopLoss_=0;

      bool SellTradeBool=trade.Sell(Lote,Symbol(),Bid,StopLoss_,TakeProfit_,"Expert StarcBands");
      if(!SellTradeBool)
         Print("ERROR AL EJECUTAR EL SELL ",trade.ResultRetcode()," ir https://www.mql5.com/es/docs/constants/errorswarnings/enum_trade_return_codes");
     }
  }
//+------------------------------------------------------------------+
