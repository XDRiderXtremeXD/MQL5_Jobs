//+------------------------------------------------------------------+
//|             Patrones con Momentun con Indicator Perzonalized.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                   Indicador MultiDivergencia.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property indicator_chart_window
#property  indicator_buffers 9
#property  indicator_plots 2



double PipsGandos=0;

datetime TimeInicio=0;

enum Mostrar
  {
   MOSTRAR_TODO=0,
   MOSTRAR_LAS_ULTIMAS_X_VELAS=1,
  };

enum Ver_Divergencias
  {
   MOSTRAR_TODAS=0,
   MOSTRAR_UNA_DIVERGENCIA=1,
  };

enum UsarDatos
  {
   Close_Close=0,
   High_Low=1,
  };

int SegundaVela=0;
int TerceraVela=0;
int CuartaVela=0;
int QuintaVela=0;
int Otras=0;


enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12am=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };
input string Parametros_Control="**********************Parametros Control**********************";///******************************************************************************************************************************
input ENUM_Horas  Hora_Inicio=_0am;
input ENUM_Horas Hora_Final=_10pm;


input int Margen=10;
input UsarDatos Tipo_de_Datos=High_Low;// Tipo de Datos
input bool Ver_Lineas_Precio=true;
input string S1_="============================================ CONFIGURACION RSI ============================================";//======================================================================
input bool Ver_Indicador_RSI=true;// Ver Divergencias RSI
input bool Ver_Indicador_RSI_Indicador=false;// Ver Indicador RSI
input int RSI_Periodo=14;
input ENUM_APPLIED_PRICE RSI_Applied_Price=PRICE_CLOSE;
input int Filtro_Retroceso_RSI=6;
input bool Filtro_SobreCompra_SobreVenta_RSI=false;// Filtro SobreCompra SobreVenta
input string S6_="============================================ CONFIGURACION MACD ============================================";//*--
input bool Ver_Indicador_MACD=true; // Ver Divergencias MACD
input bool Ver_Indicador_MACD_Indicador=false; // Ver Indicador MACD
input int Period_MACD=12;
input int Slow_Ema_MACD=26;
input int Signal_Period_MACD=9;
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;
input string S7="============================================  CONFIGURACION ESTOCASTICO ============================================";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Ver_Indicador_ESTOCASTICO=true; // Ver Divergencias Estocastico
input bool Ver_Indicador_ESTOCASTICO_Indicador=false;// Ver Indicador Estocastico
input int K_Periodo=10;
input int D_Periodo=3;
input int Slowing=5;
input ENUM_MA_METHOD Ma_Method_EST=MODE_SMA;
input ENUM_STO_PRICE STO_EST=STO_LOWHIGH;
input int Filtro_Retroceso_ESTOCASTICO=2;
input bool Filtro_SobreCompra_SobreVenta_Est=false;// Filtro SobreCompra SobreVenta
input string s7 = "============================================ Divergence ============================================";//==========
input bool Ver_Divergencias_con_Indicador_Atrasado=true;
input bool Filtro_Traspaso_50=true;// Filtro traspaso 50%
input bool Filtro_Trix=false;
input Mostrar Mostrar_Lineas=MOSTRAR_LAS_ULTIMAS_X_VELAS;
input int X_Velas=10000;
input Ver_Divergencias Ver_Divergencias_en_un_mismo_Punto=MOSTRAR_UNA_DIVERGENCIA;// Ver Divergencias en un mismo punto
input bool Ver_Divergencia_Oculta=true;
input bool Ver_Divergencia_Regular=true;
input color ColorDivergenceOculta=clrMagenta;
input color ColorDivergenceRegular=clrAqua;
input ENUM_LINE_STYLE Estilo_Linea=STYLE_SOLID;
input int Grosor_Linea=1;
input int Crossing_Tolerance=20;//Line Crossing Tolerance in Points
input int Distancia_Maxima=500;// Distancia Minima  (Filtro por Distancia maxima de la diveregencia)
input int Distancia_Minima=50;//Distancia Minima (Filtro por Distancia minima de la diveregencia)
input string s74= "============================================ Flechas ============================================";//==========
input color ColorFlechaAlcista=clrSpringGreen;
input color ColorFlechaBajista=clrOrange;
input uchar CodigoAlcista=221; // Codigo Alcista (32 - 255)
input uchar CodigoBajista=222; // Codigo Bajista (32 - 255)
input uchar AnchoFlecha=1;
input string s71= "============================================ Alertas ============================================";//==========
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;
input bool Conector=false;
input string S11_="============================================ CONFIGURACION TRIX ============================================";//======================================================================
input int Periodo_Trix=14;
input ENUM_APPLIED_PRICE Applied_Price_Trix=PRICE_CLOSE;
input string S12_="============================================ CONFIGURACION TREND ============================================";//======================================================================
input bool FiltroTrend=true;
input int inpFastLength = 3; // Fast length
input int inpSlowLength = 7; // Slow length
//input int AumentoP=50;
//input int AumentoN=30;


datetime TimeLast=0;

bool Valido=false;
string ObjPrefix="Divergence_TVI_1234";

int IndiceStart=0;
int IndiceStart2=0;
int Indice=0;

double RSI_BUFFER[];
int Handle_RSI=0;

double MACD_BUFFER[];
int Handle_MACD=0;

double ESTOCASTICO_BUFFER[];
int Handle_ESTOCASTICO=0;

double Trix_BUFFER[];
int Handle_Trix=0;

double Close_Trend[];
double Start_trend[];
double Slow_Trend[];
int HandleTrend=0;

int NumeroMuestreo=1;

datetime TiempoZigZag=0;

int ChartIndicatorRSI=-1;
int ChartIndicatorMACD=-1;
int ChartIndicatorESTOCASTICO=-1;

enum Indicator
  {
   RSI=0,
   MACD=1,
   ESTOCASTICO=2,
  };

long CHAR_ID_=0;

int PeriodoIndicadores;

double A_UP[];
double A_DN[];


double High_Diver_UP=0;
double Low_Diver_UP=0;

double High_Diver_DN=0;
double Low_Diver_DN=0;
bool Diver_UP=false;
bool Diver_DN=false;

bool DiverBUY_PIPS=false;
bool DiverSELL_PIPS=false;

double OPEN_BUY=0;
double OPEN_SELL=0;

string TextoPips="PipsComprobacion";

int Mes=0;

double HighSL=0;
double LowSL=0;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   High_Diver_UP=0;
   Low_Diver_UP=0;

   High_Diver_DN=0;
   Low_Diver_DN=0;
   if(Conector)
     {
      long currChart,prevChart=ChartFirst();
      int i_=0,limit2=100;
      while(i_<limit2)// We have certainly not more than 100 open charts
        {
         if(ChartGetString(prevChart,CHART_COMMENT)=="DIVERGENCIAS")
           {
            CHAR_ID_=prevChart;
            break;
           }

         currChart=ChartNext(prevChart); // Get the new chart ID by using the previous chart ID
         if(currChart<0)
            break;          // Have reached the end of the chart list
         //Print(i,ChartSymbol(currChart)," ID =",currChart);
         prevChart=currChart;// let's save the current chart ID for the ChartNext()
         i_++;// Do not forget to increase the counter
        }
     }

   if(CodigoAlcista<32)
     {
      Alert("Codigo Flecha Alcista Erroneo visite (https://www.mql5.com/es/docs/constants/objectconstants/wingdings)");
      return(INIT_PARAMETERS_INCORRECT);
     }

   if(CodigoBajista<32)
     {
      Alert("Codigo Flecha Bajista Erroneo visite (https://www.mql5.com/es/docs/constants/objectconstants/wingdings)");
      return(INIT_PARAMETERS_INCORRECT);
     }


   IndiceStart=0;
   IndiceStart2=0;
   SegundaVela=0;
   Otras=0;


   IndicatorSetString(INDICATOR_SHORTNAME,"MULTI Divergencia");

   IniciarIndicadores();

   SetIndexBuffer(0,A_UP,INDICATOR_DATA);
   SetIndexBuffer(1,A_DN,INDICATOR_DATA);
   PlotIndexSetInteger(0,PLOT_DRAW_TYPE,DRAW_ARROW);
   PlotIndexSetInteger(1,PLOT_DRAW_TYPE,DRAW_ARROW);
   PlotIndexSetInteger(0,PLOT_ARROW,225);
   PlotIndexSetInteger(1,PLOT_ARROW,226);
   PlotIndexSetInteger(0,PLOT_LINE_WIDTH,3);
   PlotIndexSetInteger(1,PLOT_LINE_WIDTH,3);
   PlotIndexSetInteger(0,PLOT_LINE_COLOR,clrAqua);
   PlotIndexSetInteger(1,PLOT_LINE_COLOR,clrAqua);

   SetIndexBuffer(2,RSI_BUFFER,INDICATOR_DATA);
   SetIndexBuffer(3,MACD_BUFFER,INDICATOR_DATA);
   SetIndexBuffer(4,ESTOCASTICO_BUFFER,INDICATOR_DATA);
   SetIndexBuffer(5,Trix_BUFFER,INDICATOR_DATA);
   SetIndexBuffer(6,Close_Trend,INDICATOR_DATA);
   SetIndexBuffer(7,Start_trend,INDICATOR_DATA);
   SetIndexBuffer(8,Slow_Trend,INDICATOR_DATA);

   ArraySetAsSeries(RSI_BUFFER,true);
   ArraySetAsSeries(MACD_BUFFER,true);
   ArraySetAsSeries(ESTOCASTICO_BUFFER,true);
   ArraySetAsSeries(Trix_BUFFER,true);

   Handle_RSI=iRSI(Symbol(),PERIOD_CURRENT,RSI_Periodo,RSI_Applied_Price);
   Handle_MACD=iMACD(Symbol(),PERIOD_CURRENT,Period_MACD,Slow_Ema_MACD,Signal_Period_MACD,Applied_Price_MACD);
   Handle_ESTOCASTICO=iStochastic(Symbol(),PERIOD_CURRENT,K_Periodo,D_Periodo,Slowing,Ma_Method_EST,STO_EST);
   Handle_Trix=iTriX(NULL,PERIOD_CURRENT,Periodo_Trix,Applied_Price_Trix);
   HandleTrend=iCustom(Symbol(),PERIOD_CURRENT,"IndicatorPersonalized",inpFastLength,inpSlowLength); // Slow length);

   if(HandleTrend==INVALID_HANDLE && FiltroTrend)
     {
      Print("ERROR: FILTRO TREND MAL CONFIGURADO");
      return(INIT_FAILED);
     }

   if(Handle_ESTOCASTICO==INVALID_HANDLE && Ver_Indicador_ESTOCASTICO)
     {
      Print("ERROR: ESTOCASTICO MAL CONFIGURADO");
      return(INIT_FAILED);
     }

   if(Handle_MACD==INVALID_HANDLE && Ver_Indicador_MACD)
     {
      Print("ERROR: MACD MAL CONFIGURADO");
      return(INIT_FAILED);
     }

   if(Handle_RSI==INVALID_HANDLE && Ver_Indicador_RSI)
     {
      Print("ERROR: RSI MAL CONFIGURADO");
      return(INIT_FAILED);
     }

   if(Ver_Indicador_RSI && Ver_Indicador_RSI_Indicador)
      if(ChartIndicatorRSI==-1)
        {
         int Indice2=(int)ChartGetInteger(CHAR_ID_,CHART_WINDOWS_TOTAL);
         ChartIndicatorAdd(CHAR_ID_,Indice2,Handle_RSI);
         ChartIndicatorRSI=Indice2;
        }

   if(Ver_Indicador_MACD && Ver_Indicador_MACD_Indicador)
      if(ChartIndicatorMACD==-1)
        {
         int Indice2=(int)ChartGetInteger(CHAR_ID_,CHART_WINDOWS_TOTAL);
         ChartIndicatorAdd(CHAR_ID_,Indice2,Handle_MACD);
         ChartIndicatorMACD=Indice2;
        }

   if(Ver_Indicador_ESTOCASTICO && Ver_Indicador_ESTOCASTICO_Indicador)
      if(ChartIndicatorESTOCASTICO==-1)
        {
         int Indice2=(int)ChartGetInteger(CHAR_ID_,CHART_WINDOWS_TOTAL);
         ChartIndicatorAdd(CHAR_ID_,Indice2,Handle_ESTOCASTICO);
         ChartIndicatorESTOCASTICO=Indice2;
        }


   if(Conector && CHAR_ID_==0)
     {
      Print("Grafico no encontrado para conectar con el EA");
      return(INIT_FAILED);
     }


   PeriodoIndicadores=0;
   if(Ver_Indicador_RSI)
      if(PeriodoIndicadores<RSI_Periodo)
         PeriodoIndicadores=RSI_Periodo+1;

   if(Ver_Indicador_ESTOCASTICO)
     {
      if(PeriodoIndicadores<K_Periodo)
         PeriodoIndicadores=K_Periodo+1;
      if(PeriodoIndicadores<D_Periodo)
         PeriodoIndicadores=D_Periodo+1;
      if(PeriodoIndicadores<Slowing)
         PeriodoIndicadores=Slowing+1;
     }

   if(Ver_Indicador_MACD)
      if(PeriodoIndicadores<Period_MACD)
         PeriodoIndicadores=Period_MACD+1;

   ArrayInitialize(A_DN,EMPTY_VALUE);
   ArrayInitialize(A_UP,EMPTY_VALUE);
//--- indicator buffers mapping


   Diver_UP=false;
   Diver_DN=false;

//---
   return(INIT_SUCCEEDED);
  }


//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   static int Conteozz=0;
   static string Comentario=" ";
   static bool Backtesting=false;
   static int PIPSTotales=0;
   if(Backtesting)
      Comment("Profits ganados desde ",TimeToString(TimeInicio,TIME_DATE|TIME_MINUTES)," = ",Comentario+" Mes("+IntegerToString(Mes)+")="+DoubleToString(PipsGandos,2)+" PIPS TOTALES= "+IntegerToString(PIPSTotales));

   ChartRedraw();
   ArraySetAsSeries(high,false);
   ArraySetAsSeries(low,false);
   ArraySetAsSeries(time,false);
   ArraySetAsSeries(close,false);
   ArraySetAsSeries(open,false);

   if(Ver_Indicador_MACD)
      if(BarsCalculated(Handle_MACD)<rates_total)
         return(0);

   if(Ver_Indicador_RSI)
      if(BarsCalculated(Handle_RSI)<rates_total)
         return(0);

   if(Ver_Indicador_ESTOCASTICO)
      if(BarsCalculated(Handle_ESTOCASTICO)<rates_total)
         return(0);

   if(Filtro_Trix)
      if(BarsCalculated(Handle_Trix)<rates_total)
         return(0);

   if(FiltroTrend)
      if(BarsCalculated(HandleTrend)<rates_total)
         return(0);


   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
////// NAIN LINE............
   if(Ver_Indicador_RSI)
      if(CopyBuffer(Handle_RSI,0,0,to_copy,RSI_BUFFER)<=0)
         return(0);

   if(Ver_Indicador_MACD)
      if(CopyBuffer(Handle_MACD,0,0,to_copy,MACD_BUFFER)<=0)
         return(0);

   if(Ver_Indicador_ESTOCASTICO)
      if(CopyBuffer(Handle_ESTOCASTICO,0,0,to_copy,ESTOCASTICO_BUFFER)<=0)
         return(0);

   if(Filtro_Trix)
      if(CopyBuffer(Handle_Trix,0,0,to_copy,Trix_BUFFER)<=0)
         return(0);

   if(FiltroTrend)
      if(CopyBuffer(HandleTrend,3,0,to_copy,Close_Trend)<=0)
         return(0);
   if(FiltroTrend)
      if(CopyBuffer(HandleTrend,5,0,to_copy,Slow_Trend)<=0)
         return(0);
   if(FiltroTrend)
      if(CopyBuffer(HandleTrend,7,0,to_copy,Start_trend)<=0)
         return(0);


   static datetime Tiempo=0;
   if(Tiempo!=time[rates_total-1])
     {
      if(Ver_Indicador_RSI)
         ChartIndicator_Eva_RSI();
      if(Ver_Indicador_MACD)
         ChartIndicator_Eva_MACD();
      if(Ver_Indicador_ESTOCASTICO)
         ChartIndicator_Eva_ESTOCASTICO();

      MqlDateTime TiempoDia;
      TimeToStruct(time[rates_total-1],TiempoDia);
      static int TiempoDiaAnterior=TiempoDia.day_of_year;

      if(Mostrar_Lineas==MOSTRAR_LAS_ULTIMAS_X_VELAS && rates_total>X_Velas+3 && TiempoDiaAnterior!=TiempoDia.day_of_year)
        {
         int Lineas=ObjectsTotal(CHAR_ID_,0,OBJ_TREND);
         for(int i=0; i<Lineas; i++)
           {
            string Nombre_Linea=ObjectName(CHAR_ID_,i,0,OBJ_TREND);
            if(StringFind(Nombre_Linea,ObjPrefix,0)!=-1 && ObjectGetInteger(CHAR_ID_,Nombre_Linea,OBJPROP_TIME,0)<(time[rates_total-X_Velas-1]))
               ObjectDelete(CHAR_ID_,Nombre_Linea);
           }
         int Flechas=ObjectsTotal(CHAR_ID_,0,OBJ_ARROW);
         for(int i=0; i<Flechas; i++)
           {
            string Nombre_Arrow=ObjectName(CHAR_ID_,i,0,OBJ_ARROW);
            if(StringFind(Nombre_Arrow,ObjPrefix,0)!=-1 && ObjectGetInteger(CHAR_ID_,Nombre_Arrow,OBJPROP_TIME,0)<(time[rates_total-X_Velas-1]))
               ObjectDelete(CHAR_ID_,Nombre_Arrow);
           }
         ChartRedraw();
         TiempoDiaAnterior=TiempoDia.day_of_year;
        }

      Tiempo=time[rates_total-1];
     }
   else
      return rates_total;

   int START;
   if(prev_calculated==0)
     {
      START=Mostrar_Lineas==MOSTRAR_TODO?(1+PeriodoIndicadores):((rates_total-X_Velas-1)<1?1:rates_total-X_Velas-1);
      ArrayInitialize(A_DN,EMPTY_VALUE);
      ArrayInitialize(A_DN,EMPTY_VALUE);
      Diver_UP=false;
      Diver_DN=false;

     }
   else
      START=rates_total-3;

// Print("RATES TOTAL",rates_total);

//Comment(rates_total-1-IndiceStart,"  Indice ",rates_total-1-Indice);
   for(int shift = START; shift < rates_total-2 ; shift++)
     {
      A_DN[shift]=EMPTY_VALUE;
      A_UP[shift]=EMPTY_VALUE;

      if(FiltroTrend)
        {
         if(DiverBUY_PIPS)
           {
            if(LowSL<Slow_Trend[shift] && Slow_Trend[shift]<=low[shift])
               LowSL=Slow_Trend[shift];


            //if(Start_trend[shift]>=open[shift] && Start_trend[shift]!=EMPTY_VALUE)
            if(LowSL-Margen*Point()>=low[shift])
              {
               if(!Backtesting)
                 {
                  TimeInicio=time[shift];
                  Backtesting=true;
                 }

               Print(TimeToString(time[shift],TIME_DATE|TIME_MINUTES));
               double Resta=(LowSL-OPEN_BUY)/Point()-Margen;
               string PIPS=DoubleToString(Resta,2);
               PipsGandos=Resta+PipsGandos;
               PIPSTotales+=int(Resta);
               TextCreate(0,TextoPips+TimeToString(time[shift],TIME_DATE|TIME_MINUTES),0,time[shift],high[shift],PIPS,"Arial",20,clrWhite,0,ANCHOR_LOWER,false,false,false,0);
               DiverBUY_PIPS=false;
              }
           }

         if(DiverSELL_PIPS)
           {

            if(HighSL>Slow_Trend[shift] && Slow_Trend[shift]>=high[shift])
               HighSL=Slow_Trend[shift];
            // if(Start_trend[shift]<=open[shift] && Start_trend[shift]!=EMPTY_VALUE)
            if(HighSL+Margen*Point()<=high[shift])
              {
               if(!Backtesting)
                 {
                  TimeInicio=time[shift];
                  Backtesting=true;
                 }
               Print(TimeToString(time[shift],TIME_DATE|TIME_MINUTES));
               double Resta=(OPEN_SELL-HighSL)/Point()-Margen;
               string PIPS=DoubleToString(Resta,2);
               PipsGandos=Resta+PipsGandos;
               PIPSTotales+=int(Resta);
               TextCreate(0,TextoPips+TimeToString(time[shift],TIME_DATE|TIME_MINUTES),0,time[shift],low[shift],PIPS,"Arial",20,clrWhite,0,ANCHOR_UPPER,false,false,false,0);
               DiverSELL_PIPS=false;
              }
           }
        }



      if(!EvaluaHorario(Hora_Inicio,Hora_Final,time[shift]))
        {
         Diver_UP=false;
         Diver_DN=false;
         continue;
        }


      MqlDateTime TiempoDia;
      TimeToStruct(time[shift],TiempoDia);
      static int TiempoDiaAnterior=TiempoDia.day_of_year;

      if(TiempoDia.mon!=Mes || Mes==0)
        {
         if(Mes!=0)
            Comentario=Comentario+"  Mes("+IntegerToString(Mes)+")="+DoubleToString(PipsGandos,2);
         if(Conteozz%10==0)
            Comentario=Comentario+"\n";
         Mes=TiempoDia.mon;
         PipsGandos=0;
         Conteozz++;
        }



      if(FiltroTrend)
        {
         if(Close_Trend[shift]!=EMPTY_VALUE)
           {
            if(Diver_UP)
              {
               //  Comment(High_Diver_UP,"  ",Low_Diver_UP);
               if(Start_trend[shift]>=open[shift] && Start_trend[shift]!=EMPTY_VALUE)
                 {
                  // if(High_Diver_UP+AumentoN*Point()>open[shift] && Low_Diver_UP-AumentoP*Point()<open[shift])
                  if(open[shift]<=High_Diver_UP)
                    {
                     Print(TimeToString(time[shift],TIME_DATE|TIME_MINUTES),"  SELL");
                     A_DN[shift]=high[shift];
                     DiverSELL_PIPS=true;
                     OPEN_SELL=Slow_Trend[shift-1];
                     HighSL=Start_trend[shift];
                    }
                  Diver_UP=false;
                 }
              }

            if(Diver_DN)
              {

               if(Start_trend[shift]<=open[shift] && Start_trend[shift]!=EMPTY_VALUE)
                 {
                  //if(High_Diver_DN+AumentoP*Point()>open[shift] && Low_Diver_DN-AumentoN*Point()<open[shift])
                  if(open[shift]>=Low_Diver_DN)
                    {
                     Print(TimeToString(time[shift],TIME_DATE|TIME_MINUTES),"  BUY");
                     A_UP[shift]=low[shift];
                     DiverBUY_PIPS=true;
                     OPEN_BUY=Slow_Trend[shift-1];
                     LowSL=Start_trend[shift];
                    }
                  Diver_DN=false;
                 }
              }
           }
        }


      int PrefixTrend=0;
      bool ISignalBuy=false;
      bool Signal=false;
      if(Ver_Indicador_RSI)
         if(Divergencia(rates_total-1-shift,shift,time[shift],PrefixTrend,RSI_BUFFER,ChartIndicatorRSI,"RSI",close,high,low,rates_total,time,RSI,Ver_Indicador_RSI_Indicador,ISignalBuy))
           {
            if(shift==rates_total-3)
               Signal=true;
            if(ISignalBuy)
              {
               Diver_DN=true;
               High_Diver_DN=high[shift+1]>high[shift]?high[shift+1]:high[shift];
               Low_Diver_DN=low[shift+1]<low[shift]?low[shift+1]:low[shift];
               //  A_DN[shift]=low[shift];

              }
            else
              {
               High_Diver_UP=high[shift+1]>high[shift]?high[shift+1]:high[shift];
               Low_Diver_UP=low[shift+1]<low[shift]?low[shift+1]:low[shift];

               Diver_UP=true;
              }
           }
      if(Ver_Indicador_MACD)
         if(Divergencia(rates_total-1-shift,shift,time[shift],PrefixTrend,MACD_BUFFER,ChartIndicatorMACD,"MACD",close,high,low,rates_total,time,MACD,Ver_Indicador_MACD_Indicador,ISignalBuy))
           {
            if(shift==rates_total-3)
               Signal=true;
            if(ISignalBuy)
              {
               Diver_DN=true;
               High_Diver_DN=high[shift+1]>high[shift]?high[shift+1]:high[shift];
               Low_Diver_DN=low[shift+1]<low[shift]?low[shift+1]:low[shift];
               //  A_DN[shift]=low[shift];

              }
            else
              {
               High_Diver_UP=high[shift+1]>high[shift]?high[shift+1]:high[shift];
               Low_Diver_UP=low[shift+1]<low[shift]?low[shift+1]:low[shift];

               Diver_UP=true;
              }
           }
      if(Ver_Indicador_ESTOCASTICO)
         if(Divergencia(rates_total-1-shift,shift,time[shift],PrefixTrend,ESTOCASTICO_BUFFER,ChartIndicatorESTOCASTICO,"EST",close,high,low,rates_total,time,ESTOCASTICO,Ver_Indicador_ESTOCASTICO_Indicador,ISignalBuy))
           {

            if(shift==rates_total-3)
               Signal=true;
            if(ISignalBuy)
              {
               Diver_DN=true;
               High_Diver_DN=high[shift+1]>high[shift]?high[shift+1]:high[shift];
               Low_Diver_DN=low[shift+1]<low[shift]?low[shift+1]:low[shift];
               //  A_DN[shift]=low[shift];

              }
            else
              {
               High_Diver_UP=high[shift+1]>high[shift]?high[shift+1]:high[shift];
               Low_Diver_UP=low[shift+1]<low[shift]?low[shift+1]:low[shift];

               Diver_UP=true;
              }
           }

      if(Signal)
         Alertas("Señal",ISignalBuy);

      ChartRedraw();
      //}
     }


//Comment(time[IndiceStart]);

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {

   ObjectsDeleteAll(0,TextoPips,0,OBJ_TEXT);

   if(reason!=REASON_CHARTCLOSE)
     {
      ObjectsDeleteAll(CHAR_ID_,ObjPrefix,0,OBJ_TREND);

      for(int i=0; i<ChartGetInteger(CHAR_ID_,CHART_WINDOWS_TOTAL); i++)
        {
         ObjectsDeleteAll(CHAR_ID_,ObjPrefix,i,OBJ_TREND);
         ObjectsDeleteAll(CHAR_ID_,ObjPrefix,i,OBJ_ARROW);
        }


      for(int i=(int)ChartGetInteger(CHAR_ID_,CHART_WINDOWS_TOTAL)-1; i>=0; i--)
        {
         for(int j=ChartIndicatorsTotal(CHAR_ID_,i)-1; j>=0; j--)
           {
            string NombreIndi=ChartIndicatorName(CHAR_ID_,i,j);
            if(StringFind(NombreIndi,"Stoch",0)!=-1 && NombreIndi!="MULTI Divergencia")
               ChartIndicatorDelete(CHAR_ID_,i,NombreIndi);
            if(StringFind(NombreIndi,"MACD",0)!=-1 && NombreIndi!="MULTI Divergencia")
               ChartIndicatorDelete(CHAR_ID_,i,NombreIndi);
            if(StringFind(NombreIndi,"RSI",0)!=-1 && NombreIndi!="MULTI Divergencia")
               ChartIndicatorDelete(CHAR_ID_,i,NombreIndi);
           }
        }
      ChartRedraw();
     }
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Divergencia(int IndiceInvertido,int shift,datetime TimeShift,int &Prefix,double &MACD_Buffer[],int ChartIndicator,string INDI,double const &close[],double const &high[],double const &low[],int const RatesTotal,datetime const &time[],Indicator Indicador,bool VerIndicador,bool &IsSignalbuy)
  {
   bool FirstPoint=false;
   bool SecondPoint=false;
   double MACD_First_Point=0;
   int MACD_First_Indice=0;
   double MACD_Posterior,MACD_Anterior,MACD_Medio;
   int MACD_Second_Indice=0;
   bool EncontroOculta=false;
   bool EncontroRegular=false;
   double Flecha=0;
   bool Filtro_MACD=false;
   uchar IndicePrecioUP=0;
   uchar IndicePrecioDN=0;


   bool Precio_UP=false;
   bool MACD_UP=false;
   bool Entra_Funcion_UP=false;

   bool Precio_DN=false;
   bool MACD_DN=false;
   bool Entra_Funcion_DN=false;
   int IndiceInvertido_=IndiceInvertido;

   for(uchar i=0; i<2; i++)
     {
      if(IndiceInvertido+1+i>RatesTotal-1 || shift-1-i<0)
         continue;

      if(i==1)
        {
         if(Precio_UP || MACD_UP)
            Entra_Funcion_UP=true;
         if(Precio_DN || MACD_DN)
            Entra_Funcion_DN=true;

         if(!Ver_Divergencias_con_Indicador_Atrasado)
           {
            if(!Precio_UP)
               Entra_Funcion_UP=false;
            if(!Precio_DN)
               Entra_Funcion_DN=false;
           }

         if(!Entra_Funcion_UP && !Entra_Funcion_DN)
            return false;
        }

      if(!Precio_UP)
         if(((Tipo_de_Datos==Close_Close && close[shift-i]>close[shift+1-i] && close[shift-i]>close[shift-1-i]) || (Tipo_de_Datos==High_Low && high[shift-i]>high[shift+1-i] && high[shift-i]>high[shift-1-i])))
           {
            if(FiltroTraspaso(close,high,low,shift-i,false,(uchar)i,time))
              {
               Precio_UP=true;
               IndicePrecioUP=(uchar)i;
              }
           }

      if(!Precio_DN)
         if(((Tipo_de_Datos==Close_Close && close[shift]<close[shift+1-i] && close[shift]<close[shift-1-i]) || (Tipo_de_Datos==High_Low && low[shift-i]<low[shift+1-i] && low[shift-i]<low[shift-1-i])))
           {
            if(FiltroTraspaso(close,high,low,shift-i,true,(uchar)i,time))
              {
               Precio_DN=true;
               IndicePrecioDN=(uchar)i;
              }
           }

      MACD_Posterior=MACD_Buffer[IndiceInvertido-1+i];
      MACD_Medio=MACD_Buffer[IndiceInvertido+i];
      MACD_Anterior=MACD_Buffer[IndiceInvertido+1+i];

      if(MACD_Medio<MACD_Anterior && MACD_Medio<MACD_Posterior)
        {
         Flecha=MACD_Buffer[IndiceInvertido+i];
         bool Filtro=true;
         if(Indicador==RSI)
           {
            Filtro=(MACD_Medio<(MACD_Anterior-Filtro_Retroceso_RSI));
            Filtro=(Filtro_SobreCompra_SobreVenta_RSI)?(30>MACD_Medio):Filtro;// Filtro SobreCompra SobreVenta
           }
         else
            if(Indicador==ESTOCASTICO)
              {
               Filtro=(MACD_Medio<(MACD_Anterior-Filtro_Retroceso_ESTOCASTICO));
               Filtro=(Filtro_SobreCompra_SobreVenta_Est)?(20>MACD_Medio):Filtro;// Filtro SobreCompra SobreVenta
              }
            else
               if(Indicador==MACD)
                  Filtro=(MACD_Medio<0);


         if(Filtro)
           {
            MACD_First_Point=MACD_Medio;
            MACD_First_Indice=IndiceInvertido+i;
            MACD_DN=true;
           }
        }
      else
         if(MACD_Medio>MACD_Anterior && MACD_Medio>MACD_Posterior)
           {
            Flecha=MACD_Buffer[IndiceInvertido+i];
            bool Filtro=true;
            if(Indicador==RSI)
              {
               Filtro=(MACD_Medio>(MACD_Anterior+Filtro_Retroceso_RSI));
               Filtro=(Filtro_SobreCompra_SobreVenta_RSI)?(70<MACD_Medio):Filtro;
              }
            else
               if(Indicador==ESTOCASTICO)
                 {
                  Filtro=(MACD_Medio>(MACD_Anterior+ Filtro_Retroceso_ESTOCASTICO));
                  Filtro=(Filtro_SobreCompra_SobreVenta_Est)?(80<MACD_Medio):Filtro;
                 }// Filtro SobreCompra SobreVenta}
               else
                  if(Indicador==MACD)
                     Filtro=(MACD_Medio>0);


            if(Filtro)
              {
               MACD_First_Point=MACD_Medio;
               MACD_First_Indice=IndiceInvertido+i;
               MACD_UP=true;
              }
           }
     }


   if(Entra_Funcion_DN && MACD_DN && Precio_DN && FiltroTrix(true,IndiceInvertido_))
     {
      IndiceInvertido=IndiceInvertido_+IndicePrecioDN;

      for(int i=IndiceInvertido+3+((Distancia_Minima>3)?Distancia_Minima-3:0); i<IndiceInvertido+3+Distancia_Maxima && i<RatesTotal-1; i++)
        {
         if(i-1<1)
            continue;

         MACD_Posterior=MACD_Buffer[i-1];
         MACD_Medio=MACD_Buffer[i];
         MACD_Anterior=MACD_Buffer[i+1];

         bool Filtro=true;

         if(Indicador==RSI)
           {
            Filtro=(MACD_Medio<(MACD_Anterior-Filtro_Retroceso_RSI));
           }
         else
            if(Indicador==ESTOCASTICO)
              {
               Filtro=(MACD_Medio<(MACD_Anterior-Filtro_Retroceso_ESTOCASTICO));
              }
            else
               if(Indicador==MACD)
                 {
                  if(MACD_Medio>0)
                     Filtro_MACD=true;
                  Filtro=(MACD_Medio<0 && Filtro_MACD);
                 }

         if(MACD_Medio<MACD_Anterior && MACD_Medio<MACD_Posterior && Filtro)
           {
            int IndiceInvertido_2=0;
            if(Ver_Divergencia_Regular && !EncontroRegular)
               if(ZigZag(i,IndiceInvertido_2,false,close,high,low,RatesTotal) && MACD_First_Point>MACD_Medio)
                 {

                  MACD_Second_Indice=i;

                  double Low_1=0;
                  double Low_2=0;
                  if(Tipo_de_Datos==Close_Close)
                    {
                     Low_1=close[RatesTotal-1-IndiceInvertido_2];
                     Low_2=close[RatesTotal-1-IndiceInvertido];
                    }
                  else
                    {
                     Low_1=low[RatesTotal-1-IndiceInvertido_2];
                     Low_2=low[RatesTotal-1-IndiceInvertido];
                    }

                  if(Low_2<Low_1 && EvaPendiente(IndiceInvertido,IndiceInvertido_2,MACD_First_Indice,MACD_Second_Indice,false,MACD_Buffer,close,high,low,RatesTotal))
                    {
                     SecondPoint=true;
                     IsSignalbuy=true;
                     Prefix++;
                     string Nombre=ObjPrefix+"Divergence"+TimeToString(TimeShift,TIME_DATE|TIME_MINUTES)+(string) Prefix+INDI;

                     if(ObjectFind(CHAR_ID_,Nombre)<0)
                       {
                        if(Ver_Lineas_Precio)
                          {
                           TrendCreate(CHAR_ID_,Nombre,0,time[RatesTotal-1-IndiceInvertido_2],Low_1,time[RatesTotal-1-IndiceInvertido],Low_2,ColorDivergenceRegular,Estilo_Linea,Grosor_Linea,true,false,false,true,0);

                           if(Tipo_de_Datos==Close_Close)
                              Low_2=close[RatesTotal-1-(IndiceInvertido-IndicePrecioDN)];
                           else
                              Low_2=low[RatesTotal-1-(IndiceInvertido-IndicePrecioDN)];

                           ArrowCreate(CHAR_ID_,Nombre+"Arrow",0,time[RatesTotal-1-(IndiceInvertido-IndicePrecioDN)],Low_2,CodigoAlcista,ANCHOR_TOP,ColorFlechaAlcista,STYLE_SOLID,AnchoFlecha,true,false,true,0);
                          }
                        // if(Ver_Indicador_RSI)
                        // {
                        if(VerIndicador)
                           if(ChartIndicator!=-1)
                             {
                              TrendCreate(CHAR_ID_,Nombre+"Indi",ChartIndicator,time[RatesTotal-1-MACD_Second_Indice],MACD_Medio,time[RatesTotal-1-MACD_First_Indice],MACD_First_Point,ColorDivergenceRegular,Estilo_Linea,Grosor_Linea,true,false,false,true,0);
                              ArrowCreate(CHAR_ID_,Nombre+"Indi"+"Arrow",ChartIndicator,time[RatesTotal-1-MACD_First_Indice],Flecha,CodigoAlcista,ANCHOR_TOP,ColorFlechaAlcista,STYLE_SOLID,AnchoFlecha,true,false,true,0);
                             }
                        //}
                       }//TimeLast=Time[i];
                     if(Ver_Divergencias_en_un_mismo_Punto)
                        EncontroRegular=true;
                    }
                 }

            IndiceInvertido_2=0;
            if(Ver_Divergencia_Oculta && !EncontroOculta)
               if(ZigZag(i,IndiceInvertido_2,false,close,high,low,RatesTotal) && MACD_First_Point<MACD_Medio)
                 {
                  MACD_Second_Indice=i;
                  double Low_1=0;
                  double Low_2=0;

                  if(Tipo_de_Datos==Close_Close)
                    {
                     Low_1=close[RatesTotal-1-IndiceInvertido_2];
                     Low_2=close[RatesTotal-1-IndiceInvertido];
                    }
                  else
                    {
                     Low_1=low[RatesTotal-1-IndiceInvertido_2];
                     Low_2=low[RatesTotal-1-IndiceInvertido];
                    }

                  if(Low_2>Low_1 && EvaPendiente(IndiceInvertido,IndiceInvertido_2,MACD_First_Indice,MACD_Second_Indice,false,MACD_Buffer,close,high,low,RatesTotal))
                    {
                     SecondPoint=true;
                     IsSignalbuy=true;
                     Prefix++;
                     string Nombre=ObjPrefix+"Divergence"+TimeToString(TimeShift,TIME_DATE|TIME_MINUTES)+(string) Prefix+INDI;
                     if(ObjectFind(CHAR_ID_,Nombre)<0)
                       {
                        if(Ver_Lineas_Precio)
                          {
                           TrendCreate(CHAR_ID_,Nombre,0,time[RatesTotal-1-IndiceInvertido_2],Low_1,time[RatesTotal-1-IndiceInvertido],Low_2,ColorDivergenceOculta,Estilo_Linea,Grosor_Linea,true,false,false,true,0);

                           if(Tipo_de_Datos==Close_Close)
                              Low_2=close[RatesTotal-1-(IndiceInvertido-IndicePrecioDN)];
                           else
                              Low_2=low[RatesTotal-1-(IndiceInvertido-IndicePrecioDN)];

                           ArrowCreate(CHAR_ID_,Nombre+"Arrow",0,time[RatesTotal-1-(IndiceInvertido-IndicePrecioDN)],Low_2,CodigoAlcista,ANCHOR_TOP,ColorFlechaAlcista,STYLE_SOLID,AnchoFlecha,true,false,true,0);
                          }
                        // if(Ver_Indicador_RSI)
                        // {
                        if(VerIndicador)
                           if(ChartIndicator!=-1)
                             {
                              TrendCreate(CHAR_ID_,Nombre+"Indi",ChartIndicator,time[RatesTotal-1-MACD_Second_Indice],MACD_Medio,time[RatesTotal-1-MACD_First_Indice],MACD_First_Point,ColorDivergenceOculta,Estilo_Linea,Grosor_Linea,true,false,false,true,0);
                              ArrowCreate(CHAR_ID_,Nombre+"Indi"+"Arrow",ChartIndicator,time[RatesTotal-1-MACD_First_Indice],Flecha,CodigoAlcista,ANCHOR_TOP,ColorFlechaAlcista,STYLE_SOLID,AnchoFlecha,true,false,true,0);
                             }
                        //}
                       }//TimeLast=Time[i];
                     if(Ver_Divergencias_en_un_mismo_Punto)
                        EncontroOculta=true;
                    }
                 }
           }
        }
      if(SecondPoint)
         return true;
     }

   if(Entra_Funcion_UP && MACD_UP && Precio_UP && FiltroTrix(false,IndiceInvertido_))
     {
      IndiceInvertido=IndiceInvertido_+IndicePrecioUP;

      for(int i=IndiceInvertido+3+((Distancia_Minima>3)?Distancia_Minima-3:0); i<IndiceInvertido+3+Distancia_Maxima  && i<RatesTotal-1; i++)
        {
         if(i-1<1)
            continue;

         MACD_Posterior=MACD_Buffer[i-1];
         MACD_Medio=MACD_Buffer[i];
         MACD_Anterior=MACD_Buffer[i+1];

         bool Filtro=true;
         if(Indicador==RSI)
            Filtro=(MACD_Medio>(MACD_Anterior+Filtro_Retroceso_RSI));
         else
            if(Indicador==ESTOCASTICO)
               Filtro=(MACD_Medio>(MACD_Anterior+ Filtro_Retroceso_ESTOCASTICO));
            else
               if(Indicador==MACD)
                 {
                  if(MACD_Medio<0)
                     Filtro_MACD=true;
                  Filtro=(MACD_Medio>0 && Filtro_MACD);
                 }

         if(MACD_Medio>MACD_Anterior && MACD_Medio>MACD_Posterior && Filtro)
           {

            int IndiceInvertido_2=0;
            if(Ver_Divergencia_Regular && !EncontroRegular)
               if(ZigZag(i,IndiceInvertido_2,true,close,high,low,RatesTotal)  && MACD_First_Point<MACD_Medio)
                 {
                  MACD_Second_Indice=i;
                  double High_1=0;
                  double High_2=0;

                  if(Tipo_de_Datos==Close_Close)
                    {
                     High_1=close[RatesTotal-1-IndiceInvertido_2];
                     High_2=close[RatesTotal-1-IndiceInvertido];
                    }
                  else
                    {
                     High_1=high[RatesTotal-1-IndiceInvertido_2];
                     High_2=high[RatesTotal-1-IndiceInvertido];
                    }

                  if(High_2>High_1 && EvaPendiente(IndiceInvertido,IndiceInvertido_2,MACD_First_Indice,MACD_Second_Indice,true,MACD_Buffer,close,high,low,RatesTotal))
                    {
                     SecondPoint=true;
                     IsSignalbuy=false;
                     Prefix++;
                     string Nombre=ObjPrefix+"Divergence"+TimeToString(TimeShift,TIME_DATE|TIME_MINUTES)+(string)Prefix;
                     if(ObjectFind(CHAR_ID_,Nombre)<0)
                       {
                        if(Ver_Lineas_Precio)
                          {
                           TrendCreate(CHAR_ID_,Nombre,0,time[RatesTotal-1-IndiceInvertido_2],High_1,time[RatesTotal-1-IndiceInvertido],High_2,ColorDivergenceRegular,Estilo_Linea,Grosor_Linea,true,false,false,true,0);

                           if(Tipo_de_Datos==Close_Close)
                              High_2=close[RatesTotal-1-(IndiceInvertido-IndicePrecioUP)];
                           else
                              High_2=high[RatesTotal-1-(IndiceInvertido-IndicePrecioUP)];

                           ArrowCreate(CHAR_ID_,Nombre+"Arrow",0,time[RatesTotal-1-(IndiceInvertido-IndicePrecioUP)],High_2,CodigoBajista,ANCHOR_BOTTOM,ColorFlechaBajista,STYLE_SOLID,AnchoFlecha,true,false,true,0);
                          }
                        if(VerIndicador)
                           if(ChartIndicator!=-1)
                             {
                              TrendCreate(CHAR_ID_,Nombre+"Indi",ChartIndicator,time[RatesTotal-1-MACD_Second_Indice],MACD_Medio,time[RatesTotal-1-MACD_First_Indice],MACD_First_Point,ColorDivergenceRegular,Estilo_Linea,Grosor_Linea,true,false,false,true,0);
                              ArrowCreate(CHAR_ID_,Nombre+"Indi"+"Arrow",ChartIndicator,time[RatesTotal-1-MACD_First_Indice],Flecha,CodigoBajista,ANCHOR_BOTTOM,ColorFlechaBajista,STYLE_SOLID,AnchoFlecha,true,false,true,0);
                             }
                       }
                     if(Ver_Divergencias_en_un_mismo_Punto)
                        EncontroRegular=true;

                    }
                 }

            IndiceInvertido_2=0;
            if(Ver_Divergencia_Oculta && !EncontroOculta)
               if(ZigZag(i,IndiceInvertido_2,true,close,high,low,RatesTotal)  && MACD_First_Point>MACD_Medio)
                 {

                  MACD_Second_Indice=i;

                  double High_1=0;
                  double High_2=0;

                  if(Tipo_de_Datos==Close_Close)
                    {
                     High_1=close[RatesTotal-1-IndiceInvertido_2];
                     High_2=close[RatesTotal-1-IndiceInvertido];
                    }
                  else
                    {
                     High_1=high[RatesTotal-1-IndiceInvertido_2];
                     High_2=high[RatesTotal-1-IndiceInvertido];
                    }

                  if(High_2<High_1 && EvaPendiente(IndiceInvertido,IndiceInvertido_2,MACD_First_Indice,MACD_Second_Indice,true,MACD_Buffer,close,high,low,RatesTotal))
                    {
                     SecondPoint=true;
                     IsSignalbuy=false;
                     Prefix++;
                     string Nombre=ObjPrefix+"Divergence"+TimeToString(TimeShift,TIME_DATE|TIME_MINUTES)+(string)Prefix;
                     if(ObjectFind(CHAR_ID_,Nombre)<0)
                       {
                        if(Ver_Lineas_Precio)
                          {
                           TrendCreate(CHAR_ID_,Nombre,0,time[RatesTotal-1-IndiceInvertido_2],High_1,time[RatesTotal-1-IndiceInvertido],High_2,ColorDivergenceOculta,Estilo_Linea,Grosor_Linea,true,false,false,true,0);

                           if(Tipo_de_Datos==Close_Close)
                              High_2=close[RatesTotal-1-(IndiceInvertido-IndicePrecioUP)];
                           else
                              High_2=high[RatesTotal-1-(IndiceInvertido-IndicePrecioUP)];

                           ArrowCreate(CHAR_ID_,Nombre+"Arrow",0,time[RatesTotal-1-(IndiceInvertido-IndicePrecioUP)],High_2,CodigoBajista,ANCHOR_BOTTOM,ColorFlechaBajista,STYLE_SOLID,AnchoFlecha,true,false,true,0);
                          }

                        if(VerIndicador)
                           if(ChartIndicator!=-1)
                             {
                              TrendCreate(CHAR_ID_,Nombre+"Indi",ChartIndicator,time[RatesTotal-1-MACD_Second_Indice],MACD_Medio,time[RatesTotal-1-MACD_First_Indice],MACD_First_Point,ColorDivergenceOculta,Estilo_Linea,Grosor_Linea,true,false,false,true,0);
                              ArrowCreate(CHAR_ID_,Nombre+"Indi"+"Arrow",ChartIndicator,time[RatesTotal-1-MACD_First_Indice],Flecha,CodigoBajista,ANCHOR_BOTTOM,ColorFlechaBajista,STYLE_SOLID,AnchoFlecha,true,false,true,0);
                             }
                       }
                     if(Ver_Divergencias_en_un_mismo_Punto)
                        EncontroOculta=true;

                    }
                 }
           }
        }

      if(SecondPoint)
         return true;
     }

   ChartRedraw(CHAR_ID_);

   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaPendiente(int IndiceFirst,int IndiceSecond,int IndiceFirst_TVI,int IndiceSecond_TVI,bool IsHigh,double &MACD_Buffer[],double const &close[],double const &high[],double const &low[],int const RatesTotal)
  {
   double DiferenciaX=IndiceSecond-IndiceFirst;
   double DiferenciaY=IsHigh?(Tipo_de_Datos==High_Low?(high[RatesTotal-1-IndiceFirst]-high[RatesTotal-1-IndiceSecond]):(close[RatesTotal-1-IndiceFirst]-close[RatesTotal-1-IndiceSecond])):(Tipo_de_Datos==High_Low?(low[RatesTotal-1-IndiceFirst]-low[RatesTotal-1-IndiceSecond]):(close[RatesTotal-1-IndiceFirst]-close[RatesTotal-1-IndiceSecond]));
   double Pendiente=DiferenciaY/DiferenciaX;

   DiferenciaX=IndiceSecond_TVI-IndiceFirst_TVI;
   double valor_1=MACD_Buffer[IndiceFirst_TVI];
   double valor_2=MACD_Buffer[IndiceSecond_TVI];
   DiferenciaY=valor_1-valor_2;
   double Pendiente_TVI=DiferenciaY/DiferenciaX;


   double Valor_Inicial_TVI=MACD_Buffer[IndiceSecond];
   double Valor_Inicial=IsHigh?(Tipo_de_Datos==High_Low?(high[RatesTotal-1-IndiceSecond]):(close[RatesTotal-1-IndiceSecond])):(Tipo_de_Datos==High_Low?(low[RatesTotal-1-IndiceSecond]):(close[RatesTotal-1-IndiceSecond]));
   int PasoTVI=1, PasoZZ=1;

   int Inicial=IndiceSecond>IndiceSecond_TVI?IndiceSecond:IndiceSecond_TVI;
   int Final=IndiceFirst<IndiceFirst_TVI?IndiceFirst:IndiceFirst_TVI;

   for(int i=Inicial-1; i>Final; i--)
     {
      double TVI=MACD_Buffer[i];

      if(i<IndiceSecond_TVI && i>IndiceFirst_TVI)
        {
         if(Valor_Inicial_TVI+PasoTVI*Pendiente_TVI<TVI && IsHigh)
            return false;

         if(Valor_Inicial_TVI+PasoTVI*Pendiente_TVI>TVI && IsHigh==false)
            return false;

         PasoTVI++;
        }

      if(i<IndiceSecond && i>IndiceFirst)
        {
         if(Valor_Inicial+PasoZZ*Pendiente<(Tipo_de_Datos==High_Low?(high[RatesTotal-1-i]):(close[RatesTotal-1-i]))-Point()*Crossing_Tolerance && IsHigh)
            return false;

         if(Valor_Inicial+PasoZZ*Pendiente>(Tipo_de_Datos==High_Low?(low[RatesTotal-1-i]):(close[RatesTotal-1-i]))+Point()*Crossing_Tolerance && IsHigh==false)
            return false;
         PasoZZ++;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ZigZag(int i,int &IndiceZigZag,bool IsHigh,double const &close[],double const &high[],double const &low[],int const RatesTotal)
  {

   for(int j=NumeroMuestreo*-1; j<=NumeroMuestreo; j++)
     {
      if(Tipo_de_Datos==Close_Close)
        {
         if((IsHigh && close[RatesTotal-1-(i+j)]>close[RatesTotal-1-(i+j+1)] &&  close[RatesTotal-1-(i+j)]>close[RatesTotal-1-(i+j-1)]) || (!IsHigh && close[RatesTotal-1-(i+j)]<close[RatesTotal-1-(i+j+1)] &&  close[RatesTotal-1-(i+j)]<close[RatesTotal-1-(i+j-1)]))
           {
            IndiceZigZag=i+j;
            return true;
           }
        }
      else
         if((IsHigh && high[RatesTotal-1-(i+j)]>high[RatesTotal-1-(i+j+1)] &&  high[RatesTotal-1-(i+j)]>high[RatesTotal-1-(i+j-1)]) || (!IsHigh && low[RatesTotal-1-(i+j)]<low[RatesTotal-1-(i+j+1)] &&  low[RatesTotal-1-(i+j)]<low[RatesTotal-1-(i+j-1)]))
           {
            IndiceZigZag=i+j;
            return true;
           }
     }
   return false;
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
//--- reset the error value
   ResetLastError();
//--- create a trend line by the given coordinates
   if(!ObjectCreate(chart_ID,name,OBJ_TREND,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": failed to create a trend line! Error code = ",GetLastError());
      Print("chartID ",chart_ID);
      Print("chartIDReal ",ChartID());
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
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int ChartIndicator_Eva_RSI()
  {
   ChartIndicatorRSI=-1;

   string iName="RSI("+string(RSI_Periodo)+")";

   for(int i=0; i<ChartGetInteger(CHAR_ID_,CHART_WINDOWS_TOTAL); i++)
     {
      for(int j=ChartIndicatorsTotal(CHAR_ID_,i)-1; j>=0; j--)
        {
         string NombreIndi=ChartIndicatorName(CHAR_ID_,i,j);

         if(NombreIndi==iName)
           {
            ChartIndicatorRSI=i;
            return i;
           }
        }
     }
   return ChartIndicatorRSI;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int ChartIndicator_Eva_MACD()
  {
   ChartIndicatorMACD=-1;

   string iName="MACD("+string(Period_MACD)+","+string(Slow_Ema_MACD)+","+string(Signal_Period_MACD)+")";

   for(int i=0; i<ChartGetInteger(CHAR_ID_,CHART_WINDOWS_TOTAL); i++)
     {
      for(int j=ChartIndicatorsTotal(CHAR_ID_,i)-1; j>=0; j--)
        {
         string NombreIndi=ChartIndicatorName(CHAR_ID_,i,j);

         if(NombreIndi==iName)
           {
            ChartIndicatorMACD=i;
            return i;
           }
        }
     }
   return ChartIndicatorMACD;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int ChartIndicator_Eva_ESTOCASTICO()
  {
   ChartIndicatorESTOCASTICO=-1;

   string iName="Stoch("+string(K_Periodo)+","+string(D_Periodo)+","+string(Slowing)+")";

   for(int i=0; i<ChartGetInteger(CHAR_ID_,CHART_WINDOWS_TOTAL); i++)
     {
      for(int j=ChartIndicatorsTotal(CHAR_ID_,i)-1; j>=0; j--)
        {
         string NombreIndi=ChartIndicatorName(CHAR_ID_,i,j);

         if(NombreIndi==iName)
           {
            ChartIndicatorESTOCASTICO=i;
            return i;
           }
        }
     }
   return ChartIndicatorESTOCASTICO;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IniciarIndicadores()
  {
   if(Ver_Indicador_RSI)
     {
      ChartIndicatorRSI=-1;
      string iName="RSI("+string(RSI_Periodo)+")";

      for(int i=0; i<ChartGetInteger(CHAR_ID_,CHART_WINDOWS_TOTAL); i++)
        {
         for(int j=ChartIndicatorsTotal(CHAR_ID_,i)-1; j>=0; j--)
           {
            string NombreIndi=ChartIndicatorName(CHAR_ID_,i,j);

            if(NombreIndi==iName)
              {
               ChartIndicatorRSI=i;
              }
            else
               if(StringFind(NombreIndi,"RSI",0)!=-1 && NombreIndi!="MULTI Divergencia")
                  ChartIndicatorDelete(CHAR_ID_,i,NombreIndi);
           }
        }
     }
   else
      for(int i=0; i<ChartGetInteger(CHAR_ID_,CHART_WINDOWS_TOTAL); i++)
        {
         for(int j=ChartIndicatorsTotal(CHAR_ID_,i)-1; j>=0; j--)
           {
            string NombreIndi=ChartIndicatorName(CHAR_ID_,i,j);

            if(StringFind(NombreIndi,"RSI",0)!=-1 && NombreIndi!="MULTI Divergencia")
               ChartIndicatorDelete(CHAR_ID_,i,NombreIndi);
           }
        }

   if(Ver_Indicador_MACD)
     {
      ChartIndicatorMACD=-1;

      for(int i=0; i<ChartGetInteger(CHAR_ID_,CHART_WINDOWS_TOTAL); i++)
        {
         for(int j=ChartIndicatorsTotal(CHAR_ID_,i)-1; j>=0; j--)
           {
            string NombreIndi=ChartIndicatorName(CHAR_ID_,i,j);

            if(StringFind(NombreIndi,"MACD",0)!=-1 && NombreIndi!="MULTI Divergencia")
               ChartIndicatorDelete(CHAR_ID_,i,NombreIndi);
           }
        }
     }

   if(Ver_Indicador_ESTOCASTICO)
     {
      ChartIndicatorESTOCASTICO=-1;

      for(int i=0; i<ChartGetInteger(CHAR_ID_,CHART_WINDOWS_TOTAL); i++)
        {
         for(int j=ChartIndicatorsTotal(CHAR_ID_,i)-1; j>=0; j--)
           {
            string NombreIndi=ChartIndicatorName(CHAR_ID_,i,j);

            if(StringFind(NombreIndi,"Stoch",0)!=-1 && NombreIndi!="MULTI Divergencia")
               ChartIndicatorDelete(CHAR_ID_,i,NombreIndi);
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ArrowCreate(const long              chart_ID=0,           // ID del gráfico
                 const string            name="Arrow",         // nombre de la flecha
                 const int               sub_window=0,         // número de subventana
                 datetime                time=0,               // hora del punto de anclaje
                 double                  price=0,              // precio del punto de anclaje
                 const uchar             arrow_code=252,       // código de la flecha
                 const ENUM_ARROW_ANCHOR anchor=ANCHOR_BOTTOM, // posición del punto de anclaje
                 const color             clr=clrRed,           // color de la flecha
                 const ENUM_LINE_STYLE   style=STYLE_SOLID,    // estilo de la línea del contorno
                 const int               width=3,              // tamaño de la flecha
                 const bool              back=false,           // al fondo
                 const bool              selection=true,       // seleccionar para mover
                 const bool              hidden=true,          // ocultar en la lista de objetos
                 const long              z_order=0)            // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos la flecha
   if(!ObjectCreate(chart_ID,name,OBJ_ARROW,sub_window,time,price))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la flecha! Código del error = ",GetLastError());
      Print("chartID ",chart_ID);
      return(false);
     }
//--- establecemos el código de la flecha
   ObjectSetInteger(chart_ID,name,OBJPROP_ARROWCODE,arrow_code);
//--- establecemos el modo de anclaje
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
//--- establecemos el color de la flecha
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el estilo de la línea del contorno
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- establecemos el tamaño de la flecha
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de desplazamiento de la flecha con ratón
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
void Alertas(string Frase,bool IsBuy)
  {
   string Tipo=IsBuy?" BUY ":" SELL ";

   if(AlertPC)
      Alert("Divergencia "+Frase+Tipo+"en "+Symbol()+" Periodo "+EnumToString(ENUM_TIMEFRAMES(Period())));
   if(AlertMovil)
      SendNotification("Divergencia "+Frase+Tipo+"en "+Symbol()+" Periodo "+EnumToString(ENUM_TIMEFRAMES(Period())));
   if(AlertMail)
      SendMail("Divergencia "+Frase+Tipo+"en "+Symbol()+" Periodo "+EnumToString(ENUM_TIMEFRAMES(Period())),"Divergencia "+Frase+"en "+Symbol()+" Periodo "+EnumToString(ENUM_TIMEFRAMES(Period())));
  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroTraspaso(double const &close[],double const &high[],double const &low[],int shift,bool isBuy,uchar j,datetime const &time[])
  {

   if(!Filtro_Traspaso_50)
     {
      return true;
     }
   else
     {
      if(isBuy)
        {
         if(Tipo_de_Datos==Close_Close)
           {
            for(int i=1; i<100 && shift-2>1 ; i++)
              {
               if(close[shift-i]>close[shift-i-1])
                 {
                  double Rango=MathAbs(close[shift-i]-close[shift]);
                  if(Rango/2.0>=MathAbs(close[shift]-close[shift+1+j]))
                     return true;
                  else
                     return false;
                  break;
                 }
               if(i==99)
                  return false;
              }
           }
         else
           {
            for(int i=1; i<100 && shift-2>1 ; i++)
              {
               if(high[shift-i]>high[shift-i-1])
                 {
                  double Rango=MathAbs(high[shift-i]-low[shift]);

                  if(Rango/2.0>=MathAbs(low[shift]-high[shift+1+j]))
                     return true;
                  else
                     return false;
                  break;
                 }
               if(i==99)
                  return false;
              }
           }
        }
      else
        {
         if(Tipo_de_Datos==Close_Close)
           {
            for(int i=1; i<100 && shift-2>1 ; i++)
              {
               if(close[shift-i]<close[shift-i-1])
                 {
                  double Rango=MathAbs(close[shift-i]-close[shift]);
                  if(Rango/2.0>=MathAbs(close[shift]-close[shift+1+j]))
                     return true;
                  else
                     return false;
                  break;
                 }
               if(i==99)
                  return false;
              }
           }
         else
           {
            for(int i=1; i<100 && shift-2>1 ; i++)
              {
               if(low[shift-i]<low[shift-i-1])
                 {
                  double Rango=MathAbs(low[shift-i]-high[shift]);
                  if(Rango/2.0>=MathAbs(high[shift]-low[shift+1+j]))
                     return true;
                  else
                     return false;
                  break;
                 }
               if(i==99)
                  return false;
              }
           }
        }

     }
   return false;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroTrix(bool IsBuy,int Indice__)
  {
   if(Filtro_Trix==false)
      return true;
   else
     {
      if(IsBuy)
        {
         if(Trix_BUFFER[Indice__]<0)
            return true;
        }
      else
        {
         if(Trix_BUFFER[Indice__]>0)
            return true;
        }

     }
   return false;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopieIndicatroPersonalized(double &BufferIndicador[],int NumeroBuffer,int IndiceStart_)
  {
   int handleIndicador;
   handleIndicador=iCustom(Symbol(),PERIOD_CURRENT,"IndicatorPersonalized",inpFastLength,inpSlowLength); // Slow length);
//ArraySetAsSeries(iMABuffer,true);
   if(CopyBuffer(handleIndicador,NumeroBuffer,IndiceStart_,1,BufferIndicador)<0)
     {
      Print(IndiceStart_);
      ArrayResize(BufferIndicador,4);
      BufferIndicador[0]=0;
     };
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FTrend(bool IsBuy,int Indice_)
  {
   double Close[];
   double Open[];
   ArraySetAsSeries(Close,true);
   ArraySetAsSeries(Open,true);

   CopieIndicatroPersonalized(Close,3,Indice_);
   CopieIndicatroPersonalized(Open,0,Indice_);

   if(Close[0]!=EMPTY_VALUE && Open[0]!=EMPTY_VALUE)
     {
      if(IsBuy)
        {
         if(Close[0]>Open[0])
            return true;
         else
            return false;
        }
      else
        {
         if(Close[0]<Open[0])
            return true;
         else
            return false;
        }
     }
   return false;
  }
//+------------------------------------------------------------------+
bool TextCreate(const long              chart_ID=0,               // ID del gráfico
                const string            name="Text",              // nombre del objeto
                const int               sub_window=0,             // número de subventana
                datetime                time=0,                   // hora del punto de anclaje
                double                  price=0,                  // precio del punto de anclaje
                const string            text="Text",              // el texto
                const string            font="Arial",             // fuente
                const int               font_size=10,             // tamaño de la fuente
                const color             clr=clrRed,               // color
                const double            angle=0.0,                // inclinación del texto
                const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // modo de anclaje
                const bool              back=false,               // al fondo
                const bool              selection=false,          // seleccionar para mover
                const bool              hidden=true,              // ocultar en la lista de objetos
                const long              z_order=0)                // prioridad para el clic del ratón
  {
//--- establecemos las coordenadas del punto de anclaje si todavía no han sido establecidas
//--- anulamos el valor del error
   ResetLastError();
//--- creamos el objeto "Texto"
   if(!ObjectCreate(chart_ID,name,OBJ_TEXT,sub_window,time,price))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear el objeto \"Texto\"! Código del error = ",GetLastError());
      return(false);
     }
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
//--- activar (true) o desactivar (false) el modo de desplazamiento del texto con ratón
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
bool EvaluaHorario(int Apertura,int Cierre,datetime Time)
  {
   MqlDateTime TiempoActual;
   TimeToStruct(Time,TiempoActual);

   if(Apertura==Cierre)
      return true;

   if(Apertura>Cierre && (TiempoActual.hour>=Apertura || TiempoActual.hour<Cierre))
      return true;
   else
      if(Apertura<Cierre && TiempoActual.hour>=Apertura && TiempoActual.hour<Cierre)
         return true;

   return false;
  }
//+------------------------------------------------------------------+
