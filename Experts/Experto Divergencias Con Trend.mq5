//+------------------------------------------------------------------+
//|                               Experto Divergencias Con Trend.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"


////////////////////////ACA MODIFICAS EL TIEMPO LIMITADO PARA OTRA CUENTA QUE NO SEA TUYA/////////////////
/////////////////// AÑO.MES.DIA HORA:MINUTO///////////////////
datetime UNTIL=D'2021.10.30 00:00';
double CuentasCompartidas[1]= {51055646};
string NombrePersonaCompartida[1]= {"Angelo"};

////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE  ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

///LUEGO LO COMPILAS, UNA VEZ COMPILADO LE MANDAS SOLO EL ARCHIVO .ex5 No mandes el archivo .mq5

////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE ////IMPORTANTE

/////////////////////////TU CUENTA///////////////////////////////
////////////////////////////////////////////////////////////////////////
double Cuentas[2]= {2192242,1974851};
////////////////////////////////////////////////////////////////////////

int password_status = -1;



double Star[];
double LineBlue[];
MqlRates rates[];

//datetime until=D'2020.10.18 00:00';

double StopLoss;
double TakeProfit;


input string S1__="----EXPERTO----";//---------------
input double VOLUME=0.01;//Lot
input int Tolerancia=10;
input int inpFastLength = 3; // Fast length
input int inpSlowLength = 7; // Slow length
input string S2_="---------------------";//---------------



#include<Trade\Trade.mqh>
CTrade trade;


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

enum TipoEntrada
  {
   Vela_Actual=0,
   vela_Anterior=1,
  };


input TipoEntrada Entrada=Vela_Actual;
input UsarDatos Tipo_de_Datos=High_Low;// Tipo de Datos
// OJO --------------> SI ESTA EN UNA SUBCARPETA PONER "(Nombre Sub Carpeta)/(Nombre del Indicador Pantalla Blanco)";
input string S0__="=== Configuracion Experto =======================================================================================";//=======================================================================================
input bool Modo_Experto=false;
input int Porcentaje=50;// Porcentaje para el Trailing
input bool ActivarTS=true;// Activar TS
input int PasoPorcentaje=10;// Porcentaje Trailing Stop
input Tipo_SL SL_Type=SL_igual_Impulso;// Activar SL Inicial
input int Desplazamiento_SL=0;// Desplazamiento del SL en Puntos
input string S0="=== Configuracion Grafico Divergencia =======================================================================================";//=======================================================================================
input bool Ver_Lineas_Precio=true;// Ver Divergencias en el Precio
input bool Ver_Separadores=false;
input Escala_Grafico Escala=__2;// Escala de Grafico
bool AplicarPlantilla=false;
string Tu_Plantilla="BASICA";
input string S1_="=== CONFIGURACION RSI =======================================================================================";//=======================================================================================
input bool Ver_Indicador_RSI=true;// Ver Divergencias RSI
input bool Ver_Indicador_RSI_Indicador=false;// Ver Indicador RSI
input int RSI_Periodo=14;
input ENUM_APPLIED_PRICE RSI_Applied_Price=PRICE_CLOSE;
input int Filtro_Retroceso_RSI=6;
input bool Filtro_SobreCompra_SobreVenta_RSI=false;// Filtro SobreCompra SobreVenta
input string S6_="=== CONFIGURACION MACD =======================================================================================";//=======================================================================================
input bool Ver_Indicador_MACD=true; // Ver Divergencias MACD
input bool Ver_Indicador_MACD_Indicador=false; // Ver Indicador MACD
input int Period_MACD=12;
input int Slow_Ema_MACD=26;
input int Signal_Period_MACD=9;
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;
input string S7="===  CONFIGURACION ESTOCASTICO =======================================================================================";//=======================================================================================
input bool Ver_Indicador_ESTOCASTICO=true; // Ver Divergencias Estocastico
input bool Ver_Indicador_ESTOCASTICO_Indicador=false;// Ver Indicador Estocastico
input int K_Periodo=10;
input int D_Periodo=3;
input int Slowing=5;
input ENUM_MA_METHOD Ma_Method_EST=MODE_SMA;
input ENUM_STO_PRICE STO_EST=STO_LOWHIGH;
input int Filtro_Retroceso_ESTOCASTICO=2;
input bool Filtro_SobreCompra_SobreVenta_Est=false;// Filtro SobreCompra SobreVenta
input string s7 = "=== Divergence =======================================================================================";//=======================================================================================
input bool Ver_Divergencias_con_Indicador_Atrasado=true;
input bool Filtro_Traspaso_50=true;// Filtro traspaso 50%
input Mostrar Mostrar_Lineas=MOSTRAR_LAS_ULTIMAS_X_VELAS;
input int X_Velas=300;
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
input string s74= "=== Flechas ===";//==========
input color ColorFlechaAlcista=clrSpringGreen;
input color ColorFlechaBajista=clrOrange;
uchar CodigoAlcista=221; // Codigo Alcista (32 - 255)
uchar CodigoBajista=222; // Codigo Bajista (32 - 255)
uchar AnchoFlecha=1;
input string s71= "=== Alertas =======================================================================================";//=======================================================================================
input bool AlertPC=true;
input bool AlertMovil=true;
input bool AlertMail=false;


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

int Handle_MACD=0;

int Handle_ESTOCASTICO=0;

int Sub_Window=0;

int Handle_Indicador=0;

int Fila_S=0;
int Columna_S=0;

long Open=0;

string LineaVertical="001 Linea Vertical";
string LineaHorizontal="001 Linea Horizontal";

int Espacio_Texto=0;
string Autorizacion="CuentaAutorizacion";


datetime TIME=0;

bool DiverBUY=false;
bool DiverSELL=false;

double Extremo_Sell=0;
double Extremo_Buy=0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   DiverBUY=false;
   DiverSELL=false;
   AlertasInicio=false;

   ArraySetAsSeries(Star,true);
   ArraySetAsSeries(LineBlue,true);
//Indices=SymbolInfoInteger(Symbol(),SYMBOL_SECTOR_NAME)==SECTOR_INDEXES?true:false;
   long account = AccountInfoInteger(ACCOUNT_LOGIN);

   printf("Account number =  %d", account);

   for(int i=0; i<ArraySize(Cuentas); i++)
      if(account == Cuentas[i])
        {
         password_status = 1;
         Print("EA account verified");
         break;
        }
///////////////////////Cuenta del desarrollador////////////////////
   if(account==51055644)//51055646
     {
      password_status=1;
      Print("LICENCIA HABILITADA - ESPECIAL DESARROLLADOR");
     }
/////////////////////////////////////////////////////////////////

   string NombreCuentaCompartida=" ";
   if(password_status == -1)
     {
      int CuentasCompartidasEjecutar=0;

      for(int k=0; k<ArraySize(CuentasCompartidas); k++)
        {
         if(CuentasCompartidas[k]==account)
           {
            NombreCuentaCompartida=NombrePersonaCompartida[k];
            CuentasCompartidasEjecutar++;
            break;
           }
        }
      if(CuentasCompartidasEjecutar==0)
        {
         //MessageBox("CUENTA NO HABLITADA",NULL,0);
         Alert("Cuenta no habilitada");
         return(INIT_FAILED);
        }
      else
        {
         //MessageBox(NombreCuentaCompartida+" - Licencia provista por Biticks hasta "+TimeToString(UNTIL,TIME_MINUTES),NULL,0);
         //Comment(NombreCuentaCompartida," - Licencia provista por Biticks hasta ",UNTIL);

        }
     }
   else
     {
      Print("CUENTA VERIFICADA// TIEMPO ILIMITADO");
     }



   EventSetMillisecondTimer(1);

   TesterHideIndicators(true);
//---
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EventKillTimer();

//--- destroy timer
// EventKillTimer();
  }//------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   static double SL_BUY=0;
   static double SL_SELL=0;
   static datetime Time=0;

   if(Time!=iTime(NULL,PERIOD_CURRENT,0))
     {
      IgualarDiveregencias(TIME);
      Time=iTime(NULL,PERIOD_CURRENT,0);
     }


   int copied=CopyRates(NULL,0,0,3,rates);
   ArraySetAsSeries(rates,true);

   if(copied<=0)
      Print("Fallo al copiar los datos de precios ",GetLastError());

   CopieIndicatroPersonalized(Star,7);
   CopieIndicatroPersonalized(LineBlue,5);

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
      double StopLoss_=PositionGetDouble(POSITION_SL);
      double Point_=SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_POINT);
      int Digitos_=(int)SymbolInfoInteger(PositionGetString(POSITION_SYMBOL),SYMBOL_DIGITS);
      ENUM_POSITION_TYPE Tipo=(ENUM_POSITION_TYPE) PositionGetInteger(POSITION_TYPE);



      /*
            if(LineBlue[0]<=rates[0].low)
               if(Tipo==POSITION_TYPE_BUY && (StopLoss_<NormalizeDouble(LineBlue[0]-Tolerancia*Point_,Digitos_) || StopLoss_==0))
                  if(!trade.PositionModify(position_ticket,NormalizeDouble(LineBlue[0]-Tolerancia*Point_,Digitos_),PositionGetDouble(POSITION_TP)))
                    {
                     Print("ERROR NO MODIFICO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                    }
            if(LineBlue[0]>=rates[0].high)
               if(Tipo==POSITION_TYPE_SELL && (StopLoss_>NormalizeDouble(LineBlue[0]+Tolerancia*Point_,Digitos_) || StopLoss_==0))
                  if(!trade.PositionModify(position_ticket,NormalizeDouble(LineBlue[0]+Tolerancia*Point_,Digitos_),PositionGetDouble(POSITION_TP)))
                    {
                     Print("ERROR NO MODIFICO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
                    }
            */
      if(Tipo==POSITION_TYPE_BUY)
        {
        OrdersBuy++;
         if(LineBlue[1]<=rates[1].low && (SL_BUY==0 || SL_BUY<LineBlue[1]))
            SL_BUY=LineBlue[1];

         if(Bid<=SL_BUY-Tolerancia*Point_ && SL_BUY!=0)
            trade.PositionClose(position_ticket,-1);
        }

      if(Tipo==POSITION_TYPE_SELL)
        {
         OrdersSell++;
         if(LineBlue[1]>=rates[1].high && (SL_SELL==0 || SL_SELL>LineBlue[1]))
            SL_SELL=LineBlue[1];

         if(Bid>=SL_SELL+Tolerancia*Point_ && SL_SELL!=0)
            trade.PositionClose(position_ticket,-1);
        }





      /*

            if(type==POSITION_TYPE_BUY)
              {
               OrdersBuy++;
               if(rates[1].open<Star[1]  && Star[1]!=EMPTY_VALUE)
                 {

                  trade.PositionClose(position_ticket,-1);

                  OrdersBuy--;
                 }
              }
            if(type==POSITION_TYPE_SELL)
              {
               OrdersSell++;

               if(rates[1].open>Star[1] && Star[1]!=EMPTY_VALUE)
                 {

                  trade.PositionClose(position_ticket,-1);
                  OrdersSell--;
                 }
              }*/
     }
   if(DiverSELL)
     {
      if(rates[0+Entrada].open<Star[0+Entrada]  && Star[0+Entrada]!=EMPTY_VALUE && OrdersSell==0)
        {
         if(rates[0].open<Extremo_Sell)
           {
            trade.Sell(VOLUME,Symbol(),ask,Star[0+Entrada]+10*Point(),0,"");
            SL_SELL=0;
           }
         DiverSELL=false;
        }
     }

   if(DiverBUY)
     {
      if(rates[0+Entrada].open>Star[0+Entrada] && Star[0+Entrada]!=EMPTY_VALUE && OrdersBuy==0)
        {
         if(rates[0].open>Extremo_Buy)
           {
            trade.Buy(VOLUME,Symbol(),bid,Star[0+Entrada]-10*Point(),0,"");
            SL_BUY=0;
           }
         DiverBUY=false;
        }
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*datetime ActualizarDatos(string Simbolo,ENUM_TIMEFRAMES TimeFrames)
  {
   if(TimeFrames==PERIOD_CURRENT)
     {
      TimeFrames=ENUM_TIMEFRAMES(Period());
     }

//---
   MqlRates rates_[];
   ArraySetAsSeries(rates_,true);

   int copied=CopyRates(Simbolo,TimeFrames,0,3,rates_);

   uchar Conteo=13;

   while(copied<0 && !IsStopped())
     {
      ResetLastError();
      Conteo--;
      Print("Cargando datos históricos para el símbolo ",Simbolo);
      Sleep(1000);
      copied=CopyRates(Simbolo,TimeFrames,0,3,rates_);
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

   return rates_[1].time;
//Print("Z2");
  }*/

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Divergencia(int IndiceInvertido,int shift,double &MACD_Buffer[],string INDI,double &close[],double&high[],double const &low[],int RatesTotal,datetime &time[],Indicator Indicador,bool VerIndicador,int Distancia_Maxima_,string &TipoDivergencia,string Simbolo,ENUM_TIMEFRAMES TimeFrame,bool &IsSignalbuy,
                 double &ImpulsoBuyStart,double &ImpulsoBuyEnd,double &ImpulsoSellStart,double &ImpulsoSellEnd)
  {
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
            if(FiltroTraspaso(close,high,low,shift-i,false,(uchar)i,time,ImpulsoSellEnd,ImpulsoSellStart))
              {
               Precio_UP=true;
               IndicePrecioUP=(uchar)i;
              }
           }

      if(!Precio_DN)
         if(((Tipo_de_Datos==Close_Close && close[shift]<close[shift+1-i] && close[shift]<close[shift-1-i]) || (Tipo_de_Datos==High_Low && low[shift-i]<low[shift+1-i] && low[shift-i]<low[shift-1-i])))
           {
            if(FiltroTraspaso(close,high,low,shift-i,true,(uchar)i,time,ImpulsoBuyEnd,ImpulsoBuyStart))
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


   if(Entra_Funcion_DN && MACD_DN && Precio_DN)
     {
      IndiceInvertido=IndiceInvertido_+IndicePrecioDN;
      // Print("Distancia Maxima ",Distancia_Maxima_," IndiceInvertido+3 ",IndiceInvertido+3);
      for(int i=IndiceInvertido+3+((Distancia_Minima>3)?Distancia_Minima-3:0); i<Distancia_Maxima_; i++)
        {

         if(i-1<1)
            continue;
         //  Print(i);
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

                  if(Low_2<Low_1 && EvaPendiente(IndiceInvertido,IndiceInvertido_2,MACD_First_Indice,MACD_Second_Indice,false,MACD_Buffer,close,high,low,RatesTotal,Simbolo))
                    {
                     SecondPoint=true;
                     IsSignalbuy=true;

                     /* if(TimeFrame==PERIOD_H4)
                        {
                         Print("Second  i ",IndiceInvertido_2," First second ",IndiceInvertido);


                         if(Indicador==RSI)
                            Print("RSI");
                         else
                            if(Indicador==ESTOCASTICO)
                               Print("ESTOCASTICO");
                            else
                               if(Indicador==MACD)
                                  Print("MACD");
                        }*/

                     if(Ver_Divergencias_en_un_mismo_Punto)
                        EncontroRegular=true;
                     TipoDivergencia="RE";
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

                  if(Low_2>Low_1 && EvaPendiente(IndiceInvertido,IndiceInvertido_2,MACD_First_Indice,MACD_Second_Indice,false,MACD_Buffer,close,high,low,RatesTotal,Simbolo))
                    {
                     SecondPoint=true;
                     IsSignalbuy=true;

                     /* if(TimeFrame==PERIOD_H4)
                        {
                         Print("Second  i ",IndiceInvertido_2," First second ",IndiceInvertido);
                         if(Indicador==RSI)
                            Print("RSI");
                         else
                            if(Indicador==ESTOCASTICO)
                               Print("ESTOCASTICO");
                            else
                               if(Indicador==MACD)
                                  Print("MACD");
                        }*/
                     if(Ver_Divergencias_en_un_mismo_Punto)
                        EncontroOculta=true;
                     TipoDivergencia="OC";
                    }
                 }
            //     Print("BB4");
           }
        }
      // Print("C1");
      if(SecondPoint)
         return true;
     }

   if(Entra_Funcion_UP && MACD_UP && Precio_UP)
     {
      IndiceInvertido=IndiceInvertido_+IndicePrecioUP;
      for(int i=IndiceInvertido+3+((Distancia_Minima>3)?Distancia_Minima-3:0); i<Distancia_Maxima_; i++)
        {
         if(i-1<1)
            continue;

         // Print(i);
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

                  if(High_2>High_1 && EvaPendiente(IndiceInvertido,IndiceInvertido_2,MACD_First_Indice,MACD_Second_Indice,true,MACD_Buffer,close,high,low,RatesTotal,Simbolo))
                    {
                     SecondPoint=true;
                     IsSignalbuy=false;

                     /*if(TimeFrame==PERIOD_H4)
                       {
                        Print("Second  i ",IndiceInvertido_2," First second ",IndiceInvertido);
                        if(Indicador==RSI)
                           Print("RSI");
                        else
                           if(Indicador==ESTOCASTICO)
                              Print("ESTOCASTICO");
                           else
                              if(Indicador==MACD)
                                 Print("MACD");
                       }*/

                     if(Ver_Divergencias_en_un_mismo_Punto)
                        EncontroRegular=true;

                     TipoDivergencia="RE";

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

                  if(High_2<High_1 && EvaPendiente(IndiceInvertido,IndiceInvertido_2,MACD_First_Indice,MACD_Second_Indice,true,MACD_Buffer,close,high,low,RatesTotal,Simbolo))
                    {
                     SecondPoint=true;
                     IsSignalbuy=false;

                     /*  if(TimeFrame==PERIOD_H4)
                         {
                          Print("Second  i ",IndiceInvertido_2," First second ",IndiceInvertido);
                          Print("Second i ",MACD_Medio," First seconmd ",MACD_First_Point);
                          Print("First i MACD ",MACD_First_Indice);
                          if(Indicador==RSI)
                             Print("RSI");
                          else
                             if(Indicador==ESTOCASTICO)
                                Print("ESTOCASTICO");
                             else
                                if(Indicador==MACD)
                                   Print("MACD");
                         }*/
                     //Print("MACD PRIMERO: ",MACD_Medio,"   MACD SEGUNDO",MACD_First_Point," TIEMPO: ",iTime(Symbol(),PERIOD_CURRENT,IndiceInvertido));
                     // Print(IndiceInvertido_2);

                     if(Ver_Divergencias_en_un_mismo_Punto)
                        EncontroOculta=true;

                     TipoDivergencia="OC";
                    }
                 }
           }
        }

      //   Print("C2");
      if(SecondPoint)
         return true;
     }

   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaPendiente(int IndiceFirst,int IndiceSecond,int IndiceFirst_TVI,int IndiceSecond_TVI,bool IsHigh,double &MACD_Buffer[],double const &close[],double const &high[],double const &low[],int const RatesTotal,string Simbolo)
  {

   double Points=SymbolInfoDouble(Simbolo,SYMBOL_POINT);
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
         if(Valor_Inicial+PasoZZ*Pendiente<(Tipo_de_Datos==High_Low?(high[RatesTotal-1-i]):(close[RatesTotal-1-i]))-Points*Crossing_Tolerance && IsHigh)
            return false;

         if(Valor_Inicial+PasoZZ*Pendiente>(Tipo_de_Datos==High_Low?(low[RatesTotal-1-i]):(close[RatesTotal-1-i]))+Points*Crossing_Tolerance && IsHigh==false)
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
void IgualarDiveregencias(datetime &Tiempo_Evalua)
  {
   ENUM_TIMEFRAMES TimeFrame=PERIOD_CURRENT;
//  Print("A1");
   string Symbolo=Symbol();

   datetime DATETIME=iTime(NULL,PERIOD_CURRENT,0);
// Print("A3");

   if(DATETIME!=Tiempo_Evalua)
     {
      Tiempo_Evalua=DATETIME;

      int Bars_=iBars(Symbolo,TimeFrame);
      int Maximo=Distancia_Maxima+1;
      if(Bars_<Maximo)
         Maximo=Bars_;

      double high[],low[],close[];
      datetime time[];
      double RSI_BUFFER[],MACD_BUFFER[],ESTOCASTICO_BUFFER[];


      /*int copied=CopyHigh(Symbolo,TimeFrame,0,Maximo,high);
      if(copied>-1 && index<copied)
         high=High[index];*/

      CopyHigh(Symbolo,TimeFrame,0,Maximo,high);
      CopyLow(Symbolo,TimeFrame,0,Maximo,low);
      CopyClose(Symbolo,TimeFrame,0,Maximo,close);
      CopyTime(Symbolo,TimeFrame,0,Maximo,time);

      ArraySetAsSeries(high,false);
      ArraySetAsSeries(low,false);
      ArraySetAsSeries(time,false);
      ArraySetAsSeries(close,false);

      ArrayResize(RSI_BUFFER,Maximo);
      ArrayResize(MACD_BUFFER,Maximo);
      ArrayResize(ESTOCASTICO_BUFFER,Maximo);

      ArraySetAsSeries(RSI_BUFFER,true);
      ArraySetAsSeries(MACD_BUFFER,true);
      ArraySetAsSeries(ESTOCASTICO_BUFFER,true);

      Handle_RSI=iRSI(Symbolo,TimeFrame,RSI_Periodo,RSI_Applied_Price);
      Handle_MACD=iMACD(Symbolo,TimeFrame,Period_MACD,Slow_Ema_MACD,Signal_Period_MACD,Applied_Price_MACD);
      Handle_ESTOCASTICO=iStochastic(Symbolo,TimeFrame,K_Periodo,D_Periodo,Slowing,Ma_Method_EST,STO_EST);

      int Maximo2=0;
      int Copy=0;

      bool EntraES=true;
      bool EntraMACD=true;
      bool EntraRSI=true;
      if(Ver_Indicador_ESTOCASTICO && Bars_>K_Periodo + D_Periodo +Slowing+1)
        {
         uchar Conteo=0;
         Copy=CopyBuffer(Handle_ESTOCASTICO,0,0,Maximo,ESTOCASTICO_BUFFER);
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
            Copy=CopyBuffer(Handle_ESTOCASTICO,0,0,Maximo,ESTOCASTICO_BUFFER);
            if(Conteo>3)
              {
               int Error=GetLastError();
               if(Copy<=0)
                 {
                  Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE ESTOCASTICO EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE ESTOCASTICO EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  EntraES=false;
                  break;
                  //ExpertRemove();
                 }
              }
           }
        }

      if(Ver_Indicador_RSI && Bars_>RSI_Periodo+1)
        {
         uchar Conteo=0;

         Copy=CopyBuffer(Handle_RSI,0,0,Maximo,RSI_BUFFER);
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
            Copy=CopyBuffer(Handle_RSI,0,0,Maximo,RSI_BUFFER);
            if(Conteo>3)
              {
               int Error=GetLastError();
               if(Copy<=0)
                 {
                  Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE RSI EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE RSI EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  EntraRSI=false;
                  break;
                 }
              }
           }
        }

      if(Ver_Indicador_MACD  && Bars_>Slow_Ema_MACD+Period_MACD+Signal_Period_MACD+1)
        {
         uchar Conteo=0;
         Copy=CopyBuffer(Handle_MACD,0,0,Maximo,MACD_BUFFER);
         while(Copy<=0 && !IsStopped())
           {
            if(Conteo==0)
              {
               Print("ERROR: 3 INTENTOS DE CARGAR DATOS HISTORICOS DE MACD EN ",Symbolo," ",EnumToString(TimeFrame));
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL MACD");
              }
            else
               Print(Conteo," INTENTO DE CARGAR LOS DATOS DEL MACD");

            Conteo++;
            Sleep(1000);
            Copy=CopyBuffer(Handle_MACD,0,0,Maximo,MACD_BUFFER);
            if(Conteo>3)
              {
               int Error=GetLastError();
               if(Copy<=0)
                 {
                  Alert("ERROR AL CARGAR LOS DATOS HISTORICOS DE MACD EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  Print("ERROR AL CARGAR LOS DATOS HISTORICOS DE MACD EN ",Symbolo," ",EnumToString(TimeFrame),"  Cod ",Error);
                  EntraMACD=false;
                  break;
                 }
              }
           }
        }


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

      bool ISignalBuy=false;
      bool Signal=false;

      double ImpulsoBuyStart=0;
      double ImpulsoBuyEnd=0;
      double ImpulsoSellStart=0;
      double ImpulsoSellEnd=0;

      bool SellAnterior=false;
      bool BuyAnterior=false;

      for(char i=1; i>=0; i--)
        {

         Signal=false;
         if(Ver_Indicador_RSI && EntraRSI)
            if(Divergencia(2+i,Maximo-3-i,RSI_BUFFER,"RSI",close,high,low,Maximo,time,RSI,Ver_Indicador_RSI_Indicador,Maximo-2,Frase,Symbolo,TimeFrame,ISignalBuy,ImpulsoBuyStart,ImpulsoBuyEnd,ImpulsoSellStart,ImpulsoSellEnd))
               Signal=true;
         if(Ver_Indicador_MACD && EntraMACD)
            if(Divergencia(2+i,Maximo-3-i,MACD_BUFFER,"MACD",close,high,low,Maximo,time,MACD,Ver_Indicador_MACD_Indicador,Maximo-2,Frase,Symbolo,TimeFrame,ISignalBuy,ImpulsoBuyStart,ImpulsoBuyEnd,ImpulsoSellStart,ImpulsoSellEnd))
               Signal=true;
         if(Ver_Indicador_ESTOCASTICO && EntraES)
            if(Divergencia(2+i,Maximo-3-i,ESTOCASTICO_BUFFER,"EST",close,high,low,Maximo,time,ESTOCASTICO,Ver_Indicador_ESTOCASTICO_Indicador,Maximo-2,Frase,Symbolo,TimeFrame,ISignalBuy,ImpulsoBuyStart,ImpulsoBuyEnd,ImpulsoSellStart,ImpulsoSellEnd))
               Signal=true;

         if(Signal && i==1)
           {
            if(ISignalBuy)
               BuyAnterior=true;
            if(!ISignalBuy)
               SellAnterior=true;
           }
        }

      if(Signal)
        {
         if(ISignalBuy)
           {
            DiverBUY=true;
            Extremo_Buy=low[Maximo-3]<low[Maximo-4]?low[Maximo-3]:low[Maximo-4];
            Comment("BUY ",TimeToString(DATETIME,TIME_DATE|TIME_MINUTES),"  Extremo ",DoubleToString(Extremo_Buy,Digits()));
            //if(Modo_Experto && !AlertasInicio && !BuyAnterior)
            //Buy(Symbolo,ImpulsoBuyStart,ImpulsoBuyEnd,Fila);
           }
         else
           {
            Extremo_Sell=high[Maximo-3]>high[Maximo-4]?high[Maximo-3]:high[Maximo-4];
            DiverSELL=true;
            Comment("SELL ",TimeToString(DATETIME,TIME_DATE|TIME_MINUTES),"  Extremo ",DoubleToString(Extremo_Sell,Digits()));
            //if(Modo_Experto && !AlertasInicio && !SellAnterior)
            //Sell(Symbolo,ImpulsoSellStart,ImpulsoSellEnd,Fila);
           }
        }
      AlertasInicio=false;
      ChartRedraw();
     }
  }
//+----------------------------------------------------------
//+------------------------------------------------------------------+
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
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopieIndicatroPersonalized(double &BufferIndicador[],int Buffer)
  {
   int handleIndicador;
   handleIndicador=iCustom(Symbol(),PERIOD_CURRENT,"IndicatorPersonalized",inpFastLength,inpSlowLength); // Slow length);
//ArraySetAsSeries(iMABuffer,true);
   while(CopyBuffer(handleIndicador,Buffer,0,3,BufferIndicador)<0)
     {
      Sleep(5);
     };
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*
void Buy(string Simbolo,double ImpulsoStart,double ImpulsoEnd,int Fila)
  {
   double Ask_=SymbolInfoDouble(Simbolo,SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Simbolo,SYMBOL_BID);
   double SL=0;
   double Point_=SymbolInfoDouble(Simbolo,SYMBOL_POINT);
   int Digitos_=(int)SymbolInfoInteger(Simbolo,SYMBOL_DIGITS);

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
      bool Ejecuto=trade.Buy(Lote,Simbolo,Ask_,SL,0,"EXPERTO PANEL DIVERGENCIAS");

      if(Ejecuto==false)
         Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
      else
        {
       //  ulong Resultado=trade.ResultOrder();
         //RegistrarTicket(Resultado,ImpulsoStart,ImpulsoEnd,true);
        }
     }
  }*/

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

/*
void Sell(string Simbolo,double ImpulsoStart,double ImpulsoEnd,int Fila)
  {

   double Ask_=SymbolInfoDouble(Simbolo,SYMBOL_ASK);
   double Bid=SymbolInfoDouble(Simbolo,SYMBOL_BID);
   double SL=0;
   double Point_=SymbolInfoDouble(Simbolo,SYMBOL_POINT);
   int Digitos_=(int)SymbolInfoInteger(Simbolo,SYMBOL_DIGITS);

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
      bool Ejecuto=trade.Sell(Lote,Simbolo,Bid,SL,0,"EXPERTO PANEL DIVERGENCIAS");

      if(Ejecuto==false)
         Print("ERROR NO ABRIO ORDEN MERCADO: ",GetLastError()," ResultCode()= ",trade.ResultRetcode());
      else
        {
         //ulong Resultado=trade.ResultOrder();
         //RegistrarTicket(Resultado,ImpulsoStart,ImpulsoEnd,false);
        }
     }
  }*/
//+------------------------------------------------------------------+
