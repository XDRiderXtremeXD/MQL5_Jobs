//+------------------------------------------------------------------+
//|                                            MI EXPERTO ANGELO.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

double FastDnPts[],FastUpPts[];
double SlowDnPts[],SlowUpPts[];

double zone_hi[1000],zone_lo[1000];
int    zone_start[1000],zone_hits[1000],zone_type[1000],zone_strength[1000],zone_count=0;
bool   zone_turn[1000];

#define ZONE_SUPPORT 1
#define ZONE_RESIST  2

#define ZONE_WEAK      0
#define ZONE_TURNCOAT  1
#define ZONE_UNTESTED  2
#define ZONE_VERIFIED  3
#define ZONE_PROVEN    4

#define UP_POINT 1
#define DN_POINT -1

int time_offset=0;

double ner_lo_zone_P1[];
double ner_lo_zone_P2[];
double ner_hi_zone_P1[];
double ner_hi_zone_P2[];

double ATR[1];

int DefinitionATR;




double Doji_Star_Ratio= 0;
double Doji_MinLength = 0;
double Star_MinLength = 0;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_ShootStar = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Hammer = 0;          // The offset value of the hammer above or below the pointer arrow.
int  Offset_Doji = 0;            // The offset value of the doji above or below the pointer arrow.
int  Offset_Star = 0;            // The offset value of the star above or below the pointer arrow.
int  Offset_Piercing_Line = 0;   // The offset value of the piercing line above or below the pointer arrow.
int  Offset_DarkCC = 0;          // The offset value of the dark cloud cover above or below the pointer arrow.
int  Offset_Bullish_Engulfing = 0;
int  Offset_Bearish_Engulfing = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
int VALORVELASOPUESTAS=0;
int IncOffset2=0;
int VELASLARGAS=0;
int MultAnt=0;
double MAYOR,MENOR;

double Piercing_Line_Ratio = 0;
int Piercing_Candle_Length = 0;
int Engulfing_Length=0;
double Candle_WickBody_Percent=0;
int CandleLength=0;

double ValorSopRes;
double VolumenVelasOPCM;
double VolumenMartillo;


#include<Trade\Trade.mqh>
CTrade trade;

int Columnas=0;

string Array_Symbolos[];
string Botones_Symbolos[];
bool Botones_Symbolos_Bool[];
string Edit_Symbolos[];

#include<Trade\Trade.mqh>

struct Edits
  {
   string            Lotaje_String;
   double            Lotaje_Double;
  };

struct Tickets_NivelTS
  {
   ulong              Ticket;
   double            NivelTS;
   int               Puntos_Impulso;
  };

Edits Edit_Symbolos_Anteriores[];
Tickets_NivelTS Tickets_TS[];

#resource "\\Indicators\\INDICADOR PATRONES PRO\\PATRONES PRO.ex5"
////MODIFICAR NOMBRE DEL INIDCADOR ARRIBA Y TAMBIEN EN LA LINEA 1016
#resource "\\Indicators\\INDICADOR PATRONES PRO\\EMA_COLOR.ex5"

enum Mostrar
  {
   MOSTRAR_TODO=0,
   MOSTRAR_LAS_ULTIMAS_X_VELAS=1,
  };

enum Tipo_SL
  {
   Arriba_de_flecha=0,// Arriba de la flecha
   SL_igual_Impulso=1,// SL Igual a Impulso
  };

enum Size_Linea_Cuadro
  {
   _1=1,//1
   _2=2,//2
   _3=3,//3
  };

enum Escala_Grafico
  {
   __1=1,//1
   __2=2,//2
   __3=3,//3
   __4=4,//4
   __5=5,//5
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


enum TP_Tipo
  {
   TP_NORMAL=0,
   TP_TRAILING=1,
   SIN_TP=2,
  };

enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12pm=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

input int ToleranciaPuntos=50;
input int Puntos=200;
input string S1__="----EXPERTO----";//---------------
input double VOLUME=0.01;//Lot
input int TakeProfit_=300;
input bool Repintado=false;
input string S001="============================  CONFIGURACION CONFIRMACION PATRONES ============================";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input bool Filter_Estocastico=true;//Patron con Estocastico
input bool Filter_MA=true;//Patron con EMA
input bool Filter_RSI=true;//Patron con RSI
//input bool TransparienciaDePatronesSinRSIoEST=true;
//input UsarDatos Tipo_de_Datos=High_Low;// Tipo de Datos
input string S0="=== Configuracion SOP RES =======================================================================================";//=======================================================================================
bool FiltroSupportRes=true;
input bool VerSopRes=true;
input int Testeado=1;// Sop o Res, Fuerza Mayor a...
input int Tolerancia_Puntos_Flecha=30;
input int BackLimit=3000;
input string pus1="/////////////////////////////////////////////////";
input bool zone_show_weak=true;//Mostrar zonas débiles
input bool zone_show_untested = true;//Mostrar zonas retesteadas
input bool zone_show_turncoat = true;//Mostrar zonas rotas
input double zone_fuzzfactor=0.75;
input int SeparacionTexto=10;
//input string pus2="/////////////////////////////////////////////////";
//input bool fractals_show=false;
double fractal_fast_factor = 3.0;
double fractal_slow_factor = 6.0;
//input bool SetGlobals=true;
//input string pus3="/////////////////////////////////////////////////";
//input bool zone_solid=true;
//input int zone_linewidth=1;
//input int zone_style=0;
//input bool zone_show_info=true;
//input int zone_label_shift=0;
bool zone_merge=true;
bool zone_extend=true;
//input string pus4="/////////////////////////////////////////////////";
//input bool zone_show_alerts  = false;
//input bool zone_alert_popups = true;
//input bool zone_alert_sounds = true;
//input int zone_alert_waitseconds=300;
//input string pus5="/////////////////////////////////////////////////";
//input int Text_size=8;
//input string Text_font = "Courier New";
//input color Text_color = clrWhite;
//input string sup_name = "Soporte";
//input string res_name = "Resistencia";
//input string test_name= "Retesteado";
input string Horario="********************** Horario **********************";///******************************************************************************************************************************
input ENUM_Horas  Hora_Inicio=_0am;
input ENUM_Horas Hora_Final=_0am;
input string S1_="================= CONFIGURACION RSI =======================================================================================";//=======================================================================================
input bool Ver_RSI=false;// Ver Divergencias RSI
input bool Ver_Indicador_RSI_Indicador=false;// Ver Indicador RSI
input int RSI_Periodo=14;
input ENUM_APPLIED_PRICE RSI_Applied_Price=PRICE_CLOSE;
//input int Filtro_Retroceso_RSI=6;
//input bool Filtro_SobreCompra_SobreVenta_RSI=false;// Filtro SobreCompra SobreVenta
input string S6_="=== CONFIGURACION MA =======================================================================================";//=======================================================================================
input bool Ver_Emas=true;
input int Tolerancia_Puntos=0;
input int Period_MA_SLOW=150;
input int Period_MA=50;
input int Shift_MA=0;
input ENUM_APPLIED_PRICE APP_MA=PRICE_CLOSE;
input ENUM_MA_METHOD MODE_MA=MODE_SMA;
input int Grosor_Fast=1;
input int Grosor_Slow=2;
input color Color_Fast=clrYellow;
input color Color_Slow=clrWhite;
input ENUM_LINE_STYLE Estilo_Fast=STYLE_SOLID;
input ENUM_LINE_STYLE Estilo_Slow=STYLE_SOLID;
input string S7="===  CONFIGURACION ESTOCASTICO =======================================================================================";//=======================================================================================
input bool Ver_ESTOCASTICO=false; // Ver Divergencias Estocastico
input bool Ver_Indicador_ESTOCASTICO_Indicador=false;// Ver Indicador Estocastico
input int K_Periodo=5;
input int D_Periodo=3;
input int Slowing=3;
input ENUM_MA_METHOD Ma_Method_EST=MODE_SMA;
input ENUM_STO_PRICE STO_EST=STO_LOWHIGH;
//input int Filtro_Retroceso_ESTOCASTICO=2;
//input bool Filtro_SobreCompra_SobreVenta_Est=false;// Filtro SobreCompra SobreVenta
input string s71= "=== Alertas =======================================================================================";//=======================================================================================
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;
input string S12_="============================================ CONFIGURACION TREND ============================================";//======================================================================
input bool FiltroTrend=true;
input int inpFastLength = 10; // Fast length
input int inpSlowLength = 20; // Slow length

int InicioX=0;
int FinalX=0;
int InicioY=0;
int FinalY=0;


string Pantalla="001 Pantalla Negra";

string AlertaComentario=" ";

bool AlertasInicio=true;

int CharIndicator=0;


enum Indicator
  {
   RSI=0,
   MACD=1,
   ESTOCASTICO=2,
  };

int NumeroMuestreo=1;
int Filas_Totales=0;


int Handle_RSI=0;

int Handle_MA=0;
int Handle_MA_S=0;

int Handle_ESTOCASTICO=0;

int Sub_Window=0;

int Handle_Indicador=0;

int Fila_S=0;
int Columna_S=0;

long Open_CHARD=0;

string LineaVertical="001 Linea Vertical";
string LineaHorizontal="001 Linea Horizontal";

int Espacio_Texto=0;
string Autorizacion="CuentaAutorizacion";

datetime TiempoAlerta=0;
bool AlertaPersonalizada=false;



int ColumnaRSeleccionado=1;

int FilaRSeleccionado=2;

datetime UNTIL=D'2022.01.29 00:00';

double Slow_Trend[];
double Start_trend[];
double Close_Trend[];
double Fast_Trend[];
MqlRates rates2[];

//datetime until=D'2020.10.18 00:00';

double StopLoss_;
double TakeProfit;

int HandleTrend=0;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   ArraySetAsSeries(Close_Trend,true);
   ArraySetAsSeries(Slow_Trend,true);
   ArraySetAsSeries(Start_trend,true);
   ArraySetAsSeries(Fast_Trend,true);

   HandleTrend=iCustom(Symbol(),PERIOD_CURRENT,"IndicatorPersonalized",inpFastLength,inpSlowLength); // Slow length);

   if(HandleTrend==INVALID_HANDLE && FiltroTrend)
     {
      Print("ERROR: FILTRO TREND MAL CONFIGURADO");
      return(INIT_FAILED);
     }

   TesterHideIndicators(true);
//---
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
// EventKillTimer();
  }//------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {


   CopyBuffer(HandleTrend,3,0,6,Close_Trend);
   CopyBuffer(HandleTrend,5,0,6,Slow_Trend);
   CopyBuffer(HandleTrend,6,0,6,Fast_Trend);
   CopyBuffer(HandleTrend,7,0,6,Start_trend);
   int copied=CopyRates(NULL,0,0,20,rates2);
   ArraySetAsSeries(rates2,true);


   int total=PositionsTotal();
   int OrdersBuy=0, OrdersSell=0;

   double bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   double ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   for(int i=0; i<total; i++)
     {
      //--- parámetros de la orden
      ulong  position_ticket=PositionGetTicket(i);// ticket de la posición
      string position_symbol=PositionGetString(POSITION_SYMBOL); // símbolo
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);  // tipo de posición


      double Bid=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_BID);
      double Ask=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_ASK);
      double OrderOpen=PositionGetDouble(POSITION_PRICE_OPEN);
      double StopLoss=PositionGetDouble(POSITION_SL);
      double TakeProfit__=PositionGetDouble(POSITION_TP);
      double Point_=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_POINT);
      int Digitos_=(int)SymbolInfoInteger(PositionGetString(POSITION_SYMBOL),SYMBOL_DIGITS);
      ENUM_POSITION_TYPE Tipo=(ENUM_POSITION_TYPE) PositionGetInteger(POSITION_TYPE);

      if(type==POSITION_TYPE_BUY)
        {
          if((Fast_Trend[1]<rates2[1].low && Slow_Trend[1]<rates2[1].low))
             {
              if(StopLoss==0 || StopLoss<Fast_Trend[1]-10*Point_)
                 trade.PositionModify(position_ticket,Fast_Trend[1]-10*Point_,TakeProfit__);
             }
         OrdersBuy++;
        }
      if(type==POSITION_TYPE_SELL)
        {
         /* if((Fast_Trend[1]>rates2[1].high && Slow_Trend[1]>rates2[1].high))
            {
             if(StopLoss==0 || StopLoss>Fast_Trend[1]+10*Point_)
                trade.PositionModify(position_ticket,Fast_Trend[1]+10*Point_,TakeProfit__);
            }*/


          if((Fast_Trend[1]>rates2[1].high && Slow_Trend[1]>rates2[1].high))
            {
             if(StopLoss==0 || StopLoss>Fast_Trend[1]+10*Point_)
                trade.PositionModify(position_ticket,Fast_Trend[1]+10*Point_,TakeProfit__);
            }
         OrdersSell++;
        }
     }
   if(SymbolInfoInteger(Symbol(),SYMBOL_SPREAD)<15)
      if(EvaluaHorario(Hora_Inicio,Hora_Final))
        {
         static datetime TIME=0;
         bool IsBuy=false;

         if(copied<=0)
            Print("Fallo al copiar los datos de precios ",GetLastError());

         if((rates2[1].high-rates2[1].low)/Point()<=Puntos)
            if(IgualarDiveregencias(TIME,IsBuy))
              {
               if(!IsBuy)
                 {
                  double Nivel=0;
                  for(int i=2; i<20; i++)
                    {
                     if(i==2)
                        if(rates2[i].open>rates2[i].close)
                           continue;

                     if(rates2[i].open<rates2[i].close)
                        Nivel=rates2[i].low;

                     if(rates2[i].open>rates2[i].close)
                        break;
                    }



                  if((Fast_Trend[1]<rates2[1].low || Slow_Trend[1]<rates2[1].low))
                    {
                     if(OrdersSell==0)
                       {
                        bool Ejecuto=0;
                        double SL=rates2[1].high+10*Point();
                        double TP=0;//rates2[1].low-TakeProfit_*Point();
                        if(Nivel==0 || Nivel>bid)
                           Ejecuto=trade.SellStop(VOLUME,bid-15*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,TimeCurrent()+5*PeriodSeconds(Period()),NULL);
                        else
                           if((MathAbs(Nivel-rates2[1].low))/Point()<=ToleranciaPuntos)
                              Ejecuto=trade.SellStop(VOLUME,Nivel-30*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,TimeCurrent()+5*PeriodSeconds(Period()),NULL);
                        if(Ejecuto==false)
                           Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                       }
                    }
                 }
               else
                 {
                  double Nivel=0;
                  for(int i=2; i<20; i++)
                    {
                     if(i==2)
                        if(rates2[i].open<rates2[i].close)
                           continue;

                     if(rates2[i].open>rates2[i].close)
                        Nivel=rates2[i].high;

                     if(rates2[i].open<rates2[i].close)
                        break;
                    }


                  if((Fast_Trend[1]>rates2[1].high || Slow_Trend[1]>rates2[1].high))
                    {
                     if(OrdersBuy==0)
                       {
                        bool Ejecuto=0;
                        double SL=rates2[1].low-10*Point();
                        double TP=0;//rates2[1].high+TakeProfit_*Point();;
                        if(Nivel==0 || Nivel<ask)
                           Ejecuto=trade.BuyStop(VOLUME,ask+15*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,TimeCurrent()+5*PeriodSeconds(Period()),NULL);
                        else
                           if(MathAbs((Nivel-rates2[1].high))/Point()<=ToleranciaPuntos)
                              Ejecuto=trade.BuyStop(VOLUME,Nivel+30*Point(),Symbol(),SL,TP,ORDER_TIME_SPECIFIED,TimeCurrent()+5*PeriodSeconds(Period()),NULL);

                        if(Ejecuto==false)
                           Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                       }
                    }
                 }
              }
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
//|                                                                  |
//+------------------------------------------------------------------+
bool Divergencia(double &Close[],double&High[],double const &Low[],double &Open[],int RatesTotal,bool &IsSignalbuy,double &RSI_Array[],double &E_Array[],double &MA_Array[],double &MAS_Array[],double POINT)
  {

   static double O[10],C[10],L[10],H[10];
   static double CL[10],BL[10],BLa[10],BL90[10],UW[10],LW[10],BodyHigh[10],BodyLow[10],BB[10];
   for(int i=0; i<10; i++)
     {
      BodyHigh[i]=0;
      BodyLow[i]=0;
     }

   for(int j=0; j<1; j++)
     {
      for(int i=0; i<4; i++)
        {
         O[i]=Open[i+j];
         H[i]=High[i+j];
         L[i]=Low[i+j];
         C[i]=Close[i+j];

         if(O[i]>C[i])
           {
            BodyHigh[i]= O[i];
            BodyLow[i] = C[i];
           }
         else
           {
            BodyHigh[i]= C[i];
            BodyLow[i] = O[i];
           }

         CL[i]=High[i+j]-Low[i+j];
         BL[i] = Open[i+j] - Close[i+j];
         UW[i] = High[i+j] - BodyHigh[i];
         LW[i] = BodyLow[i] - Low[i+j];
         BLa[i]= MathAbs(BL[i]);
         //BL90[i]=BLa[i]*Candle_WickBody_Percent;
         BB[i]=(BLa[i]/POINT)/10;//TAMAÑO DEL VAOR ABSOUTO DEL TAMAÑO DEL CUERPO EN PIPS NORMALES
        }

      bool CondicionSell=false;
      bool CondicionBuy=false;


      if(!CondicionSell || !CondicionBuy)
         if(Filter_RSI)
           {
            //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2<H[1]))
            if(RSI_Array[2]<30)
               CondicionBuy=true;
            //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2>L[1]))
            if(RSI_Array[2]>70)
               CondicionSell=true;
           }

      if(!CondicionSell || !CondicionBuy)
         if(Filter_Estocastico)
           {
            //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2<H[1]))
            if((E_Array[3]<20 || E_Array[2]<20) && E_Array[1]>=20)
               CondicionBuy=true;
            //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2>L[1]))
            if((E_Array[3]>80 || E_Array[2]>80) && E_Array[1]<=80)
               CondicionSell=true;
           }


      if(!CondicionSell || !CondicionBuy)
         if(Filter_MA)
           {
            //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2<H[1]))
            if(((H[1]+Tolerancia_Puntos*POINT>MA_Array[1] && L[1]-Tolerancia_Puntos*POINT<MA_Array[1]) || (H[1]+Tolerancia_Puntos*POINT>MAS_Array[1] && L[1]-Tolerancia_Puntos*POINT<MAS_Array[1])) && MAS_Array[1]>MAS_Array[2] && MAS_Array[2]>MAS_Array[3] && MAS_Array[3]>MAS_Array[4])
               CondicionBuy=true;
            //if(!(H[1]+Tolerancia_Puntos*Point()>ValorMA_2 && L[1]-Tolerancia_Puntos*Point()<ValorMA_2 && ValorMAS_2>L[1]))
            if(((H[1]+Tolerancia_Puntos*POINT>MA_Array[1] && L[1]-Tolerancia_Puntos*POINT<MA_Array[1]) || (H[1]+Tolerancia_Puntos*POINT>MAS_Array[1] && L[1]-Tolerancia_Puntos*POINT<MAS_Array[1])) && MAS_Array[1]<MAS_Array[2] && MAS_Array[2]<MAS_Array[3] && MAS_Array[3]<MAS_Array[4])
               CondicionSell=true;

           }

      /*if(CondicionBuy)
         if(!(C[1]>(C[2]>O[2]?C[2]:O[2])))
            CondicionBuy=false;

      if(CondicionSell)
         if(!(C[1]<(C[2]<O[2]?C[2]:O[2])))
            CondicionSell=false;
      */
      if(!CondicionBuy && !CondicionSell)
         return false;
      // Check for Velas opuestas en Volumen
      if((O[1]>C[1] && O[2]<C[2])||(O[1]<C[1] && O[2]>C[2]))
        {

         if((BB[1]>(BB[2]/2))&& BB[2]>VALORVELASOPUESTAS)
           {

            if(O[1]>C[1] && O[2]<C[2] && O[3]<C[3])
              {
               IsSignalbuy=false;
               if(CondicionSell)
                  return true;
              }

            else
               if(O[1]<C[1] && O[2]>C[2] && O[3]>C[3])
                 {
                  IsSignalbuy=true;
                  if(CondicionBuy)
                     return true;
                 }
           }
        }




      // Check for Velas opuestas en Volumen x2

      if(((O[1]>C[1] && O[2]>C[2] && O[3]<C[3]) || (O[1]<C[1] && O[2]<C[2] && O[3]>C[3])) && (BB[2]<(BB[3]/2)))
        {
         if((BB[1]+BB[2]>(BB[3]/2))&& BB[3]>VALORVELASOPUESTAS)
           {


            //if(VelasOpuestasEnVolumenx2 == true)
            //{


            if(O[1]>C[1] && O[2]>C[2] && O[3]<C[3])
              {
               IsSignalbuy=false;
               if(CondicionSell)
                  return true;
              }

            else
               if(CondicionBuy)
                 {
                  IsSignalbuy=true;
                  return true;
                 }
            //  }

           }
        }

      // Check for Velas opuestas en Volumen x2 v2

      if(((O[1]>C[1] && O[2]<C[2] && O[3]<C[3]) || (O[1]<C[1] && O[2]>C[2] && O[3]>C[3])) && (BB[2]<(BB[1]*3/4))) ///&& (BB[2]<(BB[1]/2))
        {
         if((BB[3]+BB[2]>(BB[1]/2))&& BB[1]>VALORVELASOPUESTAS)
           {


            //if(VelasOpuestasEnVolumenx2 == true)
            //{


            if(O[1]>C[1] && O[2]<C[2] && O[3]<C[3])
              {
               IsSignalbuy=false;
               if(CondicionSell)
                  return true;
              }
            else
               if(CondicionBuy)
                 {
                  IsSignalbuy=true;
                  return true;
                 }
            //   }

           }
        }


      ////////////////////////////////////////////////////////////////////////////////////////////

      ////////////////////////////////////////////////////////////////////////////////////////////
      /// VELAS CON MARTILLO
      if(BB[3]>VolumenVelasOPCM && BB[1]>VolumenVelasOPCM && BB[2]<VolumenMartillo)
        {
         if((O[3]<C[3] && C[1]<O[1]) || (O[3]>C[3] && C[1]>O[1]))
           {
            //if(VelasOpuestasEnVolumenConMartillo == true)
            //{

            if(O[3]<C[3] && C[1]<O[1])
              {
               IsSignalbuy=false;
               if(CondicionSell)
                  return true;
              }
            else
               if(O[3]>C[3] && C[1]>O[1])
                 {
                  IsSignalbuy=true;
                  if(CondicionBuy)
                     return true;
                 }
            //}

           }

        }
     }
   return false;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IgualarDiveregencias(datetime &Tiempo_Evalua,bool & ISignalBuy)
  {

   string Symbolo=Symbol();
   ENUM_TIMEFRAMES TimeFrame=Period();
   datetime DATETIME=ActualizarDatos(Symbolo,TimeFrame);
// Print("A3");

   if(DATETIME!=Tiempo_Evalua)
     {
      Tiempo_Evalua=DATETIME;

      double Point_=SymbolInfoDouble(Symbolo,SYMBOL_POINT);
      /*  if(TimeFrame==PERIOD_M1)
          {
           Print("ENTRA");
           Print(Symbolo,"  ",TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES));
          }*/


      int Bars_=Bars(Symbolo,TimeFrame);

      int Maximo=MathMin(Bars_,BackLimit)+1;

      if(Maximo<15)
         return false;

      double high[],low[],close[],open[];
      datetime time[];
      double RSI_BUFFER[],MA_BUFFER[],ESTOCASTICO_BUFFER[],MAS_BUFFER[];


      /*int copied=CopyHigh(Symbolo,TimeFrame,0,Maximo,high);
      if(copied>-1 && index<copied)
         high=High[index];*/
      // Print(Maximo," ",Symbolo," ",TimeFrame);

      CopyHigh(Symbolo,TimeFrame,0,Maximo,high);
      CopyLow(Symbolo,TimeFrame,0,Maximo,low);
      CopyClose(Symbolo,TimeFrame,0,Maximo,close);
      CopyTime(Symbolo,TimeFrame,0,Maximo,time);
      CopyOpen(Symbolo,TimeFrame,0,Maximo,open);

      ArrayResize(FastDnPts,Maximo);
      ArrayResize(FastUpPts,Maximo);
      ArrayResize(SlowDnPts,Maximo);
      ArrayResize(SlowUpPts,Maximo);
      ArraySetAsSeries(SlowDnPts,true);
      ArraySetAsSeries(SlowUpPts,true);
      ArraySetAsSeries(FastDnPts,true);
      ArraySetAsSeries(FastUpPts,true);

      ArrayInitialize(SlowDnPts,0);
      ArrayInitialize(SlowUpPts,0);
      ArrayInitialize(FastDnPts,0);
      ArrayInitialize(FastUpPts,0);

      ArraySetAsSeries(high,true);
      ArraySetAsSeries(low,true);
      ArraySetAsSeries(time,true);
      ArraySetAsSeries(close,true);
      ArraySetAsSeries(open,true);

      ArrayResize(RSI_BUFFER,15);
      ArrayResize(MAS_BUFFER,15);
      ArrayResize(MA_BUFFER,15);
      ArrayResize(ESTOCASTICO_BUFFER,15);

      ArraySetAsSeries(RSI_BUFFER,true);
      ArraySetAsSeries(MAS_BUFFER,true);
      ArraySetAsSeries(MA_BUFFER,true);
      ArraySetAsSeries(ESTOCASTICO_BUFFER,true);

      Handle_RSI=iRSI(Symbolo,TimeFrame,RSI_Periodo,RSI_Applied_Price);
      Handle_MA=iMA(Symbolo,TimeFrame,Period_MA,Shift_MA,MODE_MA,APP_MA);
      Handle_MA_S=iMA(Symbolo,TimeFrame,Period_MA_SLOW,Shift_MA,MODE_MA,APP_MA);
      Handle_ESTOCASTICO=iStochastic(Symbolo,TimeFrame,K_Periodo,D_Periodo,Slowing,Ma_Method_EST,STO_EST);

      int Maximo2=0;
      int Copy=0;

      bool Estocastico=true;
      bool Rsi=true;
      bool Ma=true;
      bool Ma_S=true;

      if(Bars_>K_Periodo + D_Periodo +Slowing+1)
        {
         uchar Conteo=0;
         Copy=CopyBuffer(Handle_ESTOCASTICO,0,0,15,ESTOCASTICO_BUFFER);
         while(Copy<=0 && !IsStopped())
           {
            if(Conteo==0)
              {
               Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE ESTOCASTICO EN ",Symbolo," ",EnumToString(TimeFrame));
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL ESTOCASTICO");
              }
            else
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL ESTOCASTICO");

            Conteo++;
            Sleep(1000);
            Copy=CopyBuffer(Handle_ESTOCASTICO,0,0,15,ESTOCASTICO_BUFFER);
            if(Conteo>3)
              {
               int Error=GetLastError();
               if(Copy<=0)
                 {
                  Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE ESTOCASTICO EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE ESTOCASTICO EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Print("NO EVALUARA ESTOCASTICO EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Estocastico=false;
                 }
              }
           }
        }
      else
         Estocastico=false;

      if(Bars_>RSI_Periodo+1)
        {
         uchar Conteo=0;

         Copy=CopyBuffer(Handle_RSI,0,0,15,RSI_BUFFER);
         while(Copy<=0 && !IsStopped())
           {
            if(Conteo==0)
              {
               Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE RSI EN ",Symbolo," ",EnumToString(TimeFrame));
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL RSI");
              }
            else
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL RSI");

            Conteo++;
            Sleep(1000);
            Copy=CopyBuffer(Handle_RSI,0,0,15,RSI_BUFFER);
            if(Conteo>3)
              {
               int Error=GetLastError();
               if(Copy<=0)
                 {
                  Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE RSI EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE RSI EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Print("NO EVALUARA RSI EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Rsi=false;
                 }
              }
           }
        }
      else
         Rsi=false;

      if(Bars_>Period_MA+1)
        {
         uchar Conteo=0;
         Copy=CopyBuffer(Handle_MA,0,0,15,MA_BUFFER);
         while(Copy<=0 && !IsStopped())
           {
            if(Conteo==0)
              {
               Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE MA FAST EN ",Symbolo," ",EnumToString(TimeFrame));
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL MA FAST");
              }
            else
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL MA FAST");

            Conteo++;
            Sleep(1000);
            Copy=CopyBuffer(Handle_MA,0,0,15,MA_BUFFER);
            if(Conteo>3)
              {
               int Error=GetLastError();
               if(Copy<=0)
                 {
                  Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE MA FAST EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE MA FAST EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Print("NO EVALUARA MA FAST EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Ma=false;
                 }
              }
           }
        }
      else
         Ma=false;


      if(Bars_>Period_MA_SLOW+1)
        {
         uchar Conteo=0;
         Copy=CopyBuffer(Handle_MA_S,0,0,15,MAS_BUFFER);
         while(Copy<=0 && !IsStopped())
           {
            if(Conteo==0)
              {
               Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE MA SLOW EN ",Symbolo," ",EnumToString(TimeFrame));
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL MA SLOW");
              }
            else
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL MA SLOW");

            Conteo++;
            Sleep(1000);
            Copy=CopyBuffer(Handle_MA_S,0,0,15,MAS_BUFFER);
            if(Conteo>3)
              {
               int Error=GetLastError();
               if(Copy<=0)
                 {
                  Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE MA SLOW EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE MA SLOW EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Print("NO EVALUARA MA FAST EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Ma_S=false;
                 }
              }
           }
        }
      else
         Ma_S=false;



      /*    for(int i=1; i<3; i++)
            {
             if(Columna==17 && Fila==2)
               {
                Print("i ",i," ",Symbolo,"  ",EnumToString(TimeFrame)," ",close[Maximo-1-i],"  RSI ",RSI_BUFFER[i],
                      " EST "" ",ESTOCASTICO_BUFFER[i],"  MACD ",MACD_BUFFER[i]);
               }
            }*/

      //Print(Maximo,"  ",Symbolo,"  ",TimeFrame);
      //Print(RSI_BUFFER[1],"  ",RSI_BUFFER[2],"  ",RSI_BUFFER[3]);


      /*if(TimeFrame==PERIOD_M3 && Symbolo=="NZDUSD")
        {
         Print(Symbolo," high penultimo ",high[Maximo-2]);
         Print(Columna,"  ",Fila);
        }*/
      //if(TimeFrame==PERIOD_H1 && Symbolo=="EURUSD")
      //  Print(Symbolo," RSI penultimo ",RSI_BUFFER[1]);

      string Frase=" ";
      // Print("high  ",ArraySize(high)," low ",ArraySize(low)," close ",ArraySize(close)," time ",ArraySize(time)," RSI ",ArraySize(RSI_BUFFER)," MACD ",ArraySize(MACD_BUFFER)," ESTOCASTICO ",ArraySize(ESTOCASTICO_BUFFER));

      bool Signal=false;

      double ImpulsoBuyStart=0;
      double ImpulsoBuyEnd=0;
      double ImpulsoSellStart=0;
      double ImpulsoSellEnd=0;

      bool SellAnterior=false;
      bool BuyAnterior=false;

      for(char i=1; i>0; i--)
        {

         Signal=false;

         if(Rsi && Estocastico && Ma && Ma_S)
           {
            IgualarValores(TimeFrame);
            if(Divergencia(close,high,low,open,15,ISignalBuy,RSI_BUFFER,ESTOCASTICO_BUFFER,MA_BUFFER,MAS_BUFFER,Point_))
              {
               if(FiltroSupRes(low[1],high[1],ISignalBuy,high,low,close,TimeFrame,Symbolo,Maximo))
                  Signal=true;
              }
           }
        }

      if(Signal)
         return true;
     }

   return false;
  }
//+----------------------------------------------------------
//+------------------------------------------------------------------+
/*
bool FiltroTraspaso(double const &close[],double const &high[],double const &low[],int shift,bool isBuy,uchar j,datetime const &time[],double &ImpulsoEnd,double &ImpulsoStart)
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
            for(int i=1; i<100 && shift-i-1>1 ; i++)
              {
               if(close[shift-i]>close[shift-i-1])
                 {
                  double Rango=MathAbs(close[shift-i]-close[shift]);
                  if(Rango/2.0>=MathAbs(close[shift]-close[shift+1+j]))
                    {
                     ImpulsoStart=close[shift];
                     ImpulsoEnd=close[shift-i];
                     return true;
                    }
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
            for(int i=1; i<100 && shift-i-1>1 ; i++)
              {
               if(high[shift-i]>high[shift-i-1])
                 {
                  double Rango=MathAbs(high[shift-i]-low[shift]);

                  if(Rango/2.0>=MathAbs(low[shift]-high[shift+1+j]))
                    {
                     ImpulsoStart=low[shift];
                     ImpulsoEnd=high[shift-i];
                     return true;
                    }
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
            for(int i=1; i<100 && shift-i-1>1 ; i++)
              {
               if(close[shift-i]<close[shift-i-1])
                 {
                  double Rango=MathAbs(close[shift-i]-close[shift]);
                  if(Rango/2.0>=MathAbs(close[shift]-close[shift+1+j]))
                    {
                     ImpulsoStart=close[shift];
                     ImpulsoEnd=close[shift-i];
                     return true;
                    }
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
            for(int i=1; i<100&& shift-i-1>1 ; i++)
              {
               if(low[shift-i]<low[shift-i-1])
                 {
                  double Rango=MathAbs(low[shift-i]-high[shift]);
                  if(Rango/2.0>=MathAbs(high[shift]-low[shift+1+j]))
                    {
                     ImpulsoStart=high[shift];
                     ImpulsoEnd=low[shift-i];
                     return true;
                    }
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
  }*/

/*
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Buy(string Simbolo,double ImpulsoStart,double ImpulsoEnd,int Fila)
  {
   double Ask_=SymbolInfoDouble(Simbolo,SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Simbolo,SYMBOL_BID);
   double SL=0;
   double Point_=SymbolInfoDouble(Simbolo,SYMBOL_POINT);
   int Digitos_=(int)SymbolInfoInteger(Simbolo,SYMBOL_DIGITS);
   double TP=0;

   if(Tipo_TP==TP_NORMAL)
      TP=ImpulsoStart+MathAbs(ImpulsoStart-ImpulsoEnd)*Porcentaje/100.0;

   int Stops=(int)SymbolInfoInteger(PositionGetString(POSITION_SYMBOL),SYMBOL_TRADE_STOPS_LEVEL);

   if(SL_Type==Arriba_de_flecha)
     {
      SL=ImpulsoStart<Bid?NormalizeDouble(ImpulsoStart-Desplazamiento_SL*Point_,Digitos_):0;
      if(MathAbs(ImpulsoStart-Bid)/Point_<Stops)
         SL=Bid-(Stops+2)*Point_;
     }
   else
     {
      SL=ImpulsoStart-(MathAbs(ImpulsoStart-ImpulsoEnd))-Desplazamiento_SL*Point_;
      if(MathAbs(ImpulsoStart-ImpulsoEnd)/Point_<Stops)
         SL=Bid-(Stops+2)*Point_;
     }
   SL=NormalizeDouble(SL,Digitos_);

   if(ObjectFind(0,Edit_Symbolos[Fila-2])==0)
     {
      double Lote=StringToDouble(ObjectGetString(0,Edit_Symbolos[Fila-2],OBJPROP_TEXT,0));
      bool Ejecuto=trade.Buy(Lote,Simbolo,Ask_,SL,TP,"EXPERTO PANEL DIVERGENCIAS");

      if(Ejecuto==false)
         Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
      else
         if(Tipo_TP==TP_TRAILING)
           {
            ulong Resultado=trade.ResultOrder();
            RegistrarTicket(Resultado,ImpulsoStart,ImpulsoEnd,true);
           }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Sell(string Simbolo,double ImpulsoStart,double ImpulsoEnd,int Fila)
  {

   double Ask_=SymbolInfoDouble(Simbolo,SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Simbolo,SYMBOL_BID);
   double SL=0;
   double Point_=SymbolInfoDouble(Simbolo,SYMBOL_POINT);
   int Digitos_=(int)SymbolInfoInteger(Simbolo,SYMBOL_DIGITS);

   double TP=0;
   if(Tipo_TP==TP_NORMAL)
      TP=ImpulsoStart-MathAbs(ImpulsoStart-ImpulsoEnd)*Porcentaje/100.0;

   int Stops=(int)SymbolInfoInteger(PositionGetString(POSITION_SYMBOL),SYMBOL_TRADE_STOPS_LEVEL);

   if(SL_Type==Arriba_de_flecha)
     {
      SL=ImpulsoStart>Ask_?NormalizeDouble(ImpulsoStart+Desplazamiento_SL*Point_,Digitos_):0;
      if(MathAbs(ImpulsoStart-Ask_)/Point_<Stops)
         SL=Ask_+(Stops+2)*Point_;
     }
   else
     {
      SL=ImpulsoStart+(MathAbs(ImpulsoStart-ImpulsoEnd))+Desplazamiento_SL*Point_;
      if(MathAbs(ImpulsoStart-ImpulsoEnd)/Point_<Stops)
         SL=Ask_+(Stops+2)*Point_;
     }
   SL=NormalizeDouble(SL,Digitos_);

   if(ObjectFind(0,Edit_Symbolos[Fila-2])==0)
     {
      double Lote=StringToDouble(ObjectGetString(0,Edit_Symbolos[Fila-2],OBJPROP_TEXT,0));
      bool Ejecuto=trade.Sell(Lote,Simbolo,Bid,SL,TP,"EXPERTO PANEL DIVERGENCIAS");

      if(Ejecuto==false)
         Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
      else
         if(Tipo_TP==TP_TRAILING)
           {
            ulong Resultado=trade.ResultOrder();
            RegistrarTicket(Resultado,ImpulsoStart,ImpulsoEnd,false);
           }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void RegistrarTicket(ulong Orden,double ImpulsoStart,double ImpulsoEnd,bool isBuy)
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

         int Size=ArraySize(Tickets_TS);
         double Point_=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_POINT);

         for(int j=0; j<Size; j++)
           {
            if(Tickets_TS[j].Ticket==-1)
              {
               double Nivel=isBuy?(ImpulsoStart+(MathAbs(ImpulsoEnd-ImpulsoStart)*Porcentaje/100.0)):(ImpulsoStart-(MathAbs(ImpulsoStart-ImpulsoEnd)*Porcentaje/100.0));
               Entro=true;
               Tickets_TS[j].Ticket=Ticket;
               Tickets_TS[j].NivelTS=Nivel;
               Tickets_TS[j].Puntos_Impulso=int(MathAbs(ImpulsoEnd-ImpulsoStart)/Point_);
               Print("Nivel ",Tickets_TS[j].NivelTS," Ticket ",Tickets_TS[j].Ticket," Puntos ",Tickets_TS[j].Puntos_Impulso);
               break;
              }
           }
         if(!Entro)
           {
            double Nivel=isBuy?(ImpulsoStart+(MathAbs(ImpulsoEnd-ImpulsoStart)*Porcentaje/100.0)):(ImpulsoStart-(MathAbs(ImpulsoStart-ImpulsoEnd)*Porcentaje/100.0));
            ArrayResize(Tickets_TS,Size+10);
            for(int j=Size; j<Size+10; j++)
               Tickets_TS[j].Ticket=-1;
            Tickets_TS[Size].Ticket=Ticket;
            Tickets_TS[Size].NivelTS=Nivel;
            Tickets_TS[Size].Puntos_Impulso=int(MathAbs(ImpulsoEnd-ImpulsoStart)/Point_);
            Print("Nivel ",Tickets_TS[Size].NivelTS," Ticket ",Tickets_TS[Size].Ticket," Puntos ",Tickets_TS[Size].Puntos_Impulso);
           }
         break;
        }
     }
   if(Reconocio==false)
      Print("No Reconocio Orden....",Orden);
  }
//+------------------------------------------------------------------+

*/




//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluaHorario(int Apertura,int Cierre)
  {
   MqlDateTime TiempoActual;
   TimeToStruct(TimeCurrent(),TiempoActual);

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

//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void IgualarValores(ENUM_TIMEFRAMES Periodo)
  {

   switch(Periodo)
     {
      case PERIOD_M1:
      case PERIOD_M2:
      case PERIOD_M3:
      case PERIOD_M4:
         //period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=10;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Hammer=5;
         Offset_ShootStar=5;
         Offset_Doji = 5;
         Offset_Star = 5;
         Offset_Piercing_Line=5;
         Offset_DarkCC=5;
         Offset_Bearish_Engulfing = 5;
         Offset_Bullish_Engulfing = 5;
         IncOffset=16;
         VALORVELASOPUESTAS=4;
         IncOffset2=4;
         VELASLARGAS=5;
         ValorSopRes=0.2;
         VolumenVelasOPCM=1;
         VolumenMartillo=0.5;
         break;
      case PERIOD_M5:
      case PERIOD_M6:
      case PERIOD_M10:
      case PERIOD_M12:
         // period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=10;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Hammer=5;
         Offset_ShootStar=5;
         Offset_Doji = 5;
         Offset_Star = 5;
         Offset_Piercing_Line=5;
         Offset_DarkCC=5;
         Offset_Bearish_Engulfing = 5;
         Offset_Bullish_Engulfing = 5;
         IncOffset=16;
         VALORVELASOPUESTAS=4;
         IncOffset2=4;
         VELASLARGAS=5;
         ValorSopRes=0.5;
         VolumenVelasOPCM=1;
         VolumenMartillo=0.5;
         break;
      case PERIOD_M15:
      case PERIOD_M20:
         //  period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=0;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Hammer=5;
         Offset_ShootStar=5;
         Offset_Doji = 5;
         Offset_Star = 5;
         Offset_Piercing_Line=5;
         Offset_DarkCC=5;
         Offset_Bearish_Engulfing = 5;
         Offset_Bullish_Engulfing = 5;
         IncOffset=16;
         VALORVELASOPUESTAS=4;
         IncOffset2=4;
         VELASLARGAS=7;
         ValorSopRes=0.5;
         VolumenVelasOPCM=1;
         VolumenMartillo=0.5;
         break;
      case PERIOD_M30:
         //    period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=15;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=15;
         Offset_Hammer=5;
         Offset_ShootStar=5;
         Offset_Doji = 5;
         Offset_Star = 5;
         Offset_Piercing_Line=5;
         Offset_DarkCC=5;
         Offset_Bearish_Engulfing = 5;
         Offset_Bullish_Engulfing = 5;
         IncOffset=16;
         VALORVELASOPUESTAS=4;
         IncOffset2=4;
         VELASLARGAS=10;
         ValorSopRes=1;
         VolumenVelasOPCM=3;
         VolumenMartillo=1;
         break;
      case PERIOD_H1:
      case PERIOD_H2:
      case PERIOD_H3:
         //   period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=25;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=30;
         High_Offset=20;
         Offset_Hammer=10;
         Offset_ShootStar=30;
         Offset_Doji = 8;
         Offset_Star = 8;
         Offset_Piercing_Line=8;
         Offset_DarkCC=8;
         Offset_Bearish_Engulfing = 8;
         Offset_Bullish_Engulfing = 8;
         IncOffset=40;
         VALORVELASOPUESTAS=4;
         IncOffset2=100;
         VELASLARGAS=10;
         ValorSopRes=1;
         VolumenVelasOPCM=5;
         VolumenMartillo=2;
         break;
      case PERIOD_H4:
      case PERIOD_H6:
      case PERIOD_H8:
         //    period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=20;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=70;
         High_Offset=150;
         Offset_Hammer=40;
         Offset_ShootStar=40;
         Offset_Doji = 10;
         Offset_Star = 10;
         Offset_Piercing_Line=10;
         Offset_DarkCC=10;
         Offset_Bearish_Engulfing = 10;
         Offset_Bullish_Engulfing = 10;
         IncOffset=120;
         VALORVELASOPUESTAS=10;
         IncOffset2=120;
         VELASLARGAS=20;
         ValorSopRes=3;
         VolumenVelasOPCM=5;
         VolumenMartillo=2;
         break;
      case PERIOD_H12:
      case PERIOD_D1:
         //    period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=30;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=150;
         High_Offset=220;
         Offset_Hammer=40;
         Offset_ShootStar=40;
         Offset_Doji = 15;
         Offset_Star = 15;
         Offset_Piercing_Line=15;
         Offset_DarkCC=15;
         Offset_Bearish_Engulfing = 15;
         Offset_Bullish_Engulfing = 15;
         IncOffset=180;
         VALORVELASOPUESTAS=15;
         IncOffset2=180;
         VELASLARGAS=40;
         ValorSopRes=3;
         VolumenVelasOPCM=5;
         VolumenMartillo=2;
         break;
      case PERIOD_W1:
         //    period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=40;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=35;
         Offset_Hammer=80;
         Offset_ShootStar=80;
         Offset_Doji = 20;
         Offset_Star = 20;
         Offset_Piercing_Line=20;
         Offset_DarkCC=20;
         Offset_Bearish_Engulfing = 20;
         Offset_Bullish_Engulfing = 20;
         IncOffset=35;
         VALORVELASOPUESTAS=50;
         IncOffset2=40;
         VELASLARGAS=30;
         ValorSopRes=5;
         VolumenVelasOPCM=5;
         VolumenMartillo=2;
         break;
      case PERIOD_MN1:
         //   period=EnumToString(ENUM_TIMEFRAMES(Period()));
         Doji_Star_Ratio=0;
         Piercing_Line_Ratio=0.5;
         Piercing_Candle_Length=10;
         Engulfing_Length=50;
         Candle_WickBody_Percent=0.9;
         CandleLength=12;
         Pointer_Offset=9;
         High_Offset=45;
         Offset_Hammer=140;
         Offset_ShootStar=140;
         Offset_Doji = 30;
         Offset_Star = 30;
         Offset_Piercing_Line=30;
         Offset_DarkCC=30;
         Offset_Bearish_Engulfing = 30;
         Offset_Bullish_Engulfing = 30;
         IncOffset=45;
         VALORVELASOPUESTAS=50;
         IncOffset2=50;
         VELASLARGAS=30;
         ValorSopRes=5;
         VolumenVelasOPCM=5;
         VolumenMartillo=2;
         break;
      default:
         Piercing_Candle_Length*=10;
         Engulfing_Length*=10;
         Candle_WickBody_Percent*=10;
         CandleLength*=10;
         Pointer_Offset*=10;
         High_Offset*=10;
         Offset_Hammer*=10;
         Offset_ShootStar*=10;
         Offset_Doji *= 10;
         Offset_Star *= 10;
         Offset_Piercing_Line*=10;
         Offset_DarkCC=10;
         Offset_Bearish_Engulfing *= 10;
         Offset_Bullish_Engulfing *= 10;
         IncOffset*=10;
         VELASLARGAS=30;
         ValorSopRes=5;
         VolumenVelasOPCM=5;
         VolumenMartillo=2;
         break;
     }

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Fractal(int M,int P,int shift,const double &High[],const double &Low[],ENUM_TIMEFRAMES Periodo,string Symbolo)
  {
   int PeriodoEva=PeriodSeconds(Periodo)/60;

   if(PeriodoEva>P)
      P=PeriodoEva;

   P=int(P/PeriodoEva*2+MathCeil(P/PeriodoEva/2));

   if(shift<P)
      return(false);

   if(shift>=Bars(Symbolo,Periodo)-P)
      return(false);

   if(ArraySize(High)<=shift+P || ArraySize(Low)<=shift+P)
      return false;

   for(int i=1; i<=P; i++)
     {
      if(M==UP_POINT)
        {
         if(High[shift+i]>High[shift])
            return(false);
         if(High[shift-i]>=High[shift])
            return(false);
        }
      if(M==DN_POINT)
        {
         if(Low[shift+i]<Low[shift])
            return(false);
         if(Low[shift-i]<=Low[shift])
            return(false);
        }
     }
   return(true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FastFractals(double &High[],double &Low[],double &Close[],ENUM_TIMEFRAMES Periodo,string Symbolo,int &Maximo)
  {

   int shift;
   int limit=MathMin(Bars(Symbolo,Periodo),BackLimit+(Repintado?0:1));
   int P=int((PeriodSeconds(Periodo)/60)*fractal_fast_factor);

   if(Maximo<limit+1)
     {
      Maximo=limit+1;
      CopyHigh(Symbolo,Periodo,0,Maximo,High);
      CopyLow(Symbolo,Periodo,0,Maximo,Low);
      CopyClose(Symbolo,Periodo,0,Maximo,Close);

      ArrayResize(FastDnPts,Maximo);
      ArrayResize(FastUpPts,Maximo);
      ArrayResize(SlowDnPts,Maximo);
      ArrayResize(SlowUpPts,Maximo);
     }

   FastUpPts[0] = 0.0;
   FastUpPts[1] = 0.0;
   FastDnPts[0] = 0.0;
   FastDnPts[1] = 0.0;

   for(shift=limit; shift>1; shift--)
     {
      if(Fractal(UP_POINT,P,shift,High,Low,Periodo,Symbolo)==true)
         FastUpPts[shift]=High[shift];
      else
         FastUpPts[shift]=0.0;

      if(Fractal(DN_POINT,P,shift,High,Low,Periodo,Symbolo)==true)
         FastDnPts[shift]=Low[shift];
      else
         FastDnPts[shift]=0.0;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SlowFractals(const double &High[],const double &Low[],ENUM_TIMEFRAMES Periodo,string Symbolo)
  {

   int shift;
   int limit=MathMin(Bars(Symbolo,Periodo),BackLimit+(Repintado?0:1));
   int P=int((PeriodSeconds(Periodo)/60)*fractal_slow_factor);

   SlowUpPts[0] = 0.0;
   SlowUpPts[1] = 0.0;
   SlowDnPts[0] = 0.0;
   SlowDnPts[1] = 0.0;

   for(shift=limit; shift>1; shift--)
     {
      if(Fractal(UP_POINT,P,shift,High,Low,Periodo,Symbolo)==true)
         SlowUpPts[shift]=High[shift];
      else
         SlowUpPts[shift]=0.0;

      if(Fractal(DN_POINT,P,shift,High,Low,Periodo,Symbolo)==true)
         SlowDnPts[shift]=Low[shift];
      else
         SlowDnPts[shift]=0.0;
     }
  }
//+------------------------------------------------------------------+
bool FindZones(const double &High[],const double &Close[],const double &Low[],ENUM_TIMEFRAMES Periodo,string Symbolo)
  {
   int Prueba=Repintado?0:1;
   int i,j=0,shift,bustcount=0,testcount=0;
   double hival,loval;
   bool turned=false,hasturned=false;

   double temp_hi[2000],temp_lo[2000];
   int    temp_start[2000],temp_hits[2000],temp_strength[2000],temp_count=0;
   bool   temp_turn[2000],temp_merge[2000];
   int merge1[2000],merge2[2000],merge_count=0;

   DefinitionATR=iATR(Symbolo,Periodo,7);

// iterate through zones from oldest to youngest (ignore recent 5 bars),
// finding those that have survived through to the present___
   for(shift=MathMin(Bars(Symbolo,Periodo)-1,BackLimit); shift>5+Prueba; shift--)
     {
      //double atr= iATR(NULL,0,7,shift);
      CopyBuffer(DefinitionATR,0,shift,1,ATR);
      double atr=ATR[0];
      double fu = atr/2 * zone_fuzzfactor;
      bool isWeak;
      bool touchOk= false;
      bool isBust = false;

      if(FastUpPts[shift]>0.001)
        {
         // a zigzag High point
         isWeak=true;
         if(SlowUpPts[shift]>0.001)
            isWeak=false;

         hival=High[shift];
         if(zone_extend==true)
            hival+=fu;

         loval=MathMax(MathMin(Close[shift],High[shift]-fu),High[shift]-fu*2);
         turned=false;
         hasturned=false;
         isBust=false;

         bustcount = 0;
         testcount = 0;

         for(i=shift-1; i>=Prueba; i--)
           {
            if((turned==false && FastUpPts[i]>=loval && FastUpPts[i]<=hival) ||
               (turned==true && FastDnPts[i]<=hival && FastDnPts[i]>=loval))
              {
               // Potential touch, just make sure its been 10+candles since the prev one
               touchOk=true;
               for(j=i+1; j<i+11; j++)
                 {
                  if((turned==false && FastUpPts[j]>=loval && FastUpPts[j]<=hival) ||
                     (turned==true && FastDnPts[j]<=hival && FastDnPts[j]>=loval))
                    {
                     touchOk=false;
                     break;
                    }
                 }

               if(touchOk==true)
                 {
                  // we have a touch_  If its been busted once, remove bustcount
                  // as we know this level is still valid & has just switched sides
                  bustcount=0;
                  testcount++;
                 }
              }

            if((turned==false && High[i]>hival) ||
               (turned==true && Low[i]<loval))
              {
               // this level has been busted at least once
               bustcount++;

               if(bustcount>1 || isWeak==true)
                 {
                  // busted twice or more
                  isBust=true;
                  break;
                 }

               if(turned == true)
                  turned = false;
               else
                  if(turned==false)
                     turned=true;

               hasturned=true;

               // forget previous hits
               testcount=0;
              }
           }

         if(isBust==false)
           {
            // level is still valid, add to our list
            temp_hi[temp_count] = hival;
            temp_lo[temp_count] = loval;
            temp_turn[temp_count] = hasturned;
            temp_hits[temp_count] = testcount;
            temp_start[temp_count] = shift;
            temp_merge[temp_count] = false;

            if(testcount>3)
               temp_strength[temp_count]=ZONE_PROVEN;
            else
               if(testcount>0)
                  temp_strength[temp_count]=ZONE_VERIFIED;
               else
                  if(hasturned==true)
                     temp_strength[temp_count]=ZONE_TURNCOAT;
                  else
                     if(isWeak==false)
                        temp_strength[temp_count]=ZONE_UNTESTED;
                     else
                        temp_strength[temp_count]=ZONE_WEAK;

            temp_count++;
           }
        }
      else
         if(FastDnPts[shift]>0.001)
           {
            // a zigzag Low point
            isWeak=true;
            if(SlowDnPts[shift]>0.001)
               isWeak=false;

            loval=Low[shift];
            if(zone_extend==true)
               loval-=fu;

            hival=MathMin(MathMax(Close[shift],Low[shift]+fu),Low[shift]+fu*2);
            turned=false;
            hasturned=false;

            bustcount = 0;
            testcount = 0;
            isBust=false;

            for(i=shift-1; i>=Prueba; i--)
              {
               if((turned==true && FastUpPts[i]>=loval && FastUpPts[i]<=hival) ||
                  (turned==false && FastDnPts[i]<=hival && FastDnPts[i]>=loval))
                 {
                  // Potential touch, just make sure its been 10+candles since the prev one
                  touchOk=true;
                  for(j=i+1; j<i+11; j++)
                    {
                     if((turned==true && FastUpPts[j]>=loval && FastUpPts[j]<=hival) ||
                        (turned==false && FastDnPts[j]<=hival && FastDnPts[j]>=loval))
                       {
                        touchOk=false;
                        break;
                       }
                    }

                  if(touchOk==true)
                    {
                     // we have a touch_  If its been busted once, remove bustcount
                     // as we know this level is still valid & has just switched sides
                     bustcount=0;
                     testcount++;
                    }
                 }

               if((turned==true && High[i]>hival) ||
                  (turned==false && Low[i]<loval))
                 {
                  // this level has been busted at least once
                  bustcount++;

                  if(bustcount>1 || isWeak==true)
                    {
                     // busted twice or more
                     isBust=true;
                     break;
                    }

                  if(turned == true)
                     turned = false;
                  else
                     if(turned==false)
                        turned=true;

                  hasturned=true;

                  // forget previous hits
                  testcount=0;
                 }
              }

            if(isBust==false)
              {
               // level is still valid, add to our list
               temp_hi[temp_count] = hival;
               temp_lo[temp_count] = loval;
               temp_turn[temp_count] = hasturned;
               temp_hits[temp_count] = testcount;
               temp_start[temp_count] = shift;
               temp_merge[temp_count] = false;

               if(testcount>3)
                  temp_strength[temp_count]=ZONE_PROVEN;
               else
                  if(testcount>0)
                     temp_strength[temp_count]=ZONE_VERIFIED;
                  else
                     if(hasturned==true)
                        temp_strength[temp_count]=ZONE_TURNCOAT;
                     else
                        if(isWeak==false)
                           temp_strength[temp_count]=ZONE_UNTESTED;
                        else
                           temp_strength[temp_count]=ZONE_WEAK;

               temp_count++;
              }
           }
     }


//  Print("B");
// look for overlapping zones___

   if(j>=2000)
      return false;

   if(zone_merge==true)
     {
      merge_count=1;
      int iterations=0;
      while(merge_count>0 && iterations<3)
        {
         merge_count=0;
         iterations++;

         for(i=0; i<temp_count; i++)
            temp_merge[i]=false;

         for(i=0; i<temp_count-1; i++)
           {
            if(temp_hits[i]==-1 || temp_merge[j]==true)
               continue;

            for(j=i+1; j<temp_count; j++)
              {
               if(temp_hits[j]==-1 || temp_merge[j]==true)
                  continue;

               if((temp_hi[i]>=temp_lo[j] && temp_hi[i]<=temp_hi[j]) ||
                  (temp_lo[i] <= temp_hi[j] && temp_lo[i] >= temp_lo[j]) ||
                  (temp_hi[j] >= temp_lo[i] && temp_hi[j] <= temp_hi[i]) ||
                  (temp_lo[j] <= temp_hi[i] && temp_lo[j] >= temp_lo[i]))
                 {
                  merge1[merge_count] = i;
                  merge2[merge_count] = j;
                  temp_merge[i] = true;
                  temp_merge[j] = true;
                  merge_count++;
                 }
              }
           }

         // ___ and merge them ___
         for(i=0; i<merge_count; i++)
           {
            int target = merge1[i];
            int source = merge2[i];

            temp_hi[target] = MathMax(temp_hi[target], temp_hi[source]);
            temp_lo[target] = MathMin(temp_lo[target], temp_lo[source]);
            temp_hits[target] += temp_hits[source];
            temp_start[target] = MathMax(temp_start[target], temp_start[source]);
            temp_strength[target]=MathMax(temp_strength[target],temp_strength[source]);
            if(temp_hits[target]>3)
               temp_strength[target]=ZONE_PROVEN;

            if(temp_hits[target]==0 && temp_turn[target]==false)
              {
               temp_hits[target]=1;
               if(temp_strength[target]<ZONE_VERIFIED)
                  temp_strength[target]=ZONE_VERIFIED;
              }

            if(temp_turn[target] == false || temp_turn[source] == false)
               temp_turn[target] = false;
            if(temp_turn[target] == true)
               temp_hits[target] = 0;

            temp_hits[source]=-1;
           }
        }
     }


// Print("C");
// copy the remaining list into our official zones arrays
   zone_count=0;
   for(i=0; i<temp_count; i++)
     {
      if(temp_hits[i]>=0 && zone_count<1000)
        {
         zone_hi[zone_count]       = temp_hi[i];
         zone_lo[zone_count]       = temp_lo[i];
         zone_hits[zone_count]     = temp_hits[i];
         zone_turn[zone_count]     = temp_turn[i];
         zone_start[zone_count]    = temp_start[i];
         zone_strength[zone_count] = temp_strength[i];

         if(zone_hi[zone_count]<Close[4+Prueba])
            zone_type[zone_count]=ZONE_SUPPORT;
         else
            if(zone_lo[zone_count]>Close[4+Prueba])
               zone_type[zone_count]=ZONE_RESIST;
            else
              {
               for(j=5+Prueba; j<1000; j++)
                 {
                  if(Close[j]<zone_lo[zone_count])
                    {
                     zone_type[zone_count]=ZONE_RESIST;
                     break;
                    }
                  else
                     if(Close[j]>zone_hi[zone_count])
                       {
                        zone_type[zone_count]=ZONE_SUPPORT;
                        break;
                       }
                 }

               if(j==1000)
                  zone_type[zone_count]=ZONE_SUPPORT;
              }

         zone_count++;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool FiltroSupRes(double Low,double High,bool isBuy,double &high[],double &low[],double &close[],ENUM_TIMEFRAMES TimeFrame,string Symbolo,int &Maximo)
  {
   if(!FiltroSupportRes)
      return true;

   FastFractals(high,low,close,TimeFrame,Symbolo,Maximo);
   SlowFractals(high,low,TimeFrame,Symbolo);
   if(!FindZones(high,close,low,TimeFrame,Symbolo))
     {
      Print("Mala Ejecucion ",TimeFrame," ",Symbolo);
      return false;
     }

   double POINT=SymbolInfoDouble(Symbolo,SYMBOL_POINT);

   if(!isBuy)
     {
      for(int i=0; i<zone_count; i++)
        {
         if(zone_type[i]==ZONE_RESIST)
            if(zone_hits[i]>Testeado)
               if(zone_hi[i]>High && zone_lo[i]-Tolerancia_Puntos_Flecha*POINT<High && Low<zone_lo[i])
                  return true;
        }
     }
   else
     {
      for(int i=0; i<zone_count; i++)
        {
         if(zone_type[i]==ZONE_SUPPORT)
            if(zone_hits[i]>Testeado)
               if(zone_hi[i]+Tolerancia_Puntos_Flecha*POINT>Low && zone_lo[i]<Low && High>zone_hi[i])
                  return true;
        }
     }

   return false;
  }
//+-
//+------------------------------------------------------------------+
