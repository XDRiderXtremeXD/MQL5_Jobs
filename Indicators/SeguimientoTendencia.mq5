//+------------------------------------------------------------------+
//|                                         SeguimientoTendencia.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window

#resource "\\Indicators\\MACD_colores.ex5"


#property indicator_buffers 5
#property indicator_plots   4
//--- plot ColorArrow
#property indicator_label1  "Entradas"
#property indicator_type1   DRAW_COLOR_ARROW
#property indicator_color1  clrRed,clrGreen
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2  "SL"
#property indicator_label3  "TP 1"
#property indicator_label4  "TP 2"

input int numMaximoEspera=7;//Numero maximo Espera MACD positivo
input int TP_points_small=100;//TP puntos pequeño
input int TP_points_largo_contra=250;//TP puntos largo en contra
input int TP_points_largo_positivo=200;//TP puntos largo en positivo
input int SL_points=200;//SL puntos
input string S7="========== Configuracion Estocastico ==========";//==========================================================================================
input int K_Periodo=5;
input int D_Periodo=3;
input int Slowing=3;
input ENUM_MA_METHOD Ma_Method_EST=MODE_SMA;
input ENUM_STO_PRICE STO_EST=STO_LOWHIGH;
input int level_sobrecompra=70;//Nivel Sobre Compra
input int level_sobreventa=30;//Nivel Sobre Venta
input string S8="========== Configuracion MACD ==========";//==========================================================================================
input int Ema_Rapida=12;
input int Ema_Lenta=26;
input int MediaMovilExponencial=9;
input ENUM_APPLIED_PRICE Applied_Price_MACD=PRICE_CLOSE;

//HANDLES
int macd_handle=0;
int sto_handle=0;

//BUFFERS
double         EntryBuffer[];
double         EntryColors[];
double         SL_Buffer[];
double         TP1[];
double         TP2[];

//BUFFERS AUXILIARES
double MACD[];
double STO[];

//SET STRUCT
struct Struct_Entradas
  {
   double            TP;
   double            SL;
   int               TP_Points_;
   int               SL_points_;
   datetime          TiempoEntrada;
   string            nombreLineas;
   bool              isBuy;
   bool              esperarOrdenContraria;
   uint              tipoEntrada;
  };

Struct_Entradas Entradas[];

// NAME LINES
string NameLines="LI_2023";
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(!SetHandles())
      return INIT_FAILED;

   SetIndexBuffer(0,EntryBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,EntryColors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(2,SL_Buffer,INDICATOR_DATA);
   SetIndexBuffer(3,TP1,INDICATOR_DATA);
   SetIndexBuffer(4,TP2,INDICATOR_DATA);

   PlotIndexSetInteger(0,PLOT_ARROW,117);
   PlotIndexSetInteger(0,PLOT_ARROW_SHIFT,0);
   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,MathMax(MathMax(MathMax(K_Periodo,D_Periodo),Ema_Lenta),Ema_Rapida)+2);

   ArraySetAsSeries(MACD,true);
   ArraySetAsSeries(STO,true);
   ArraySetAsSeries(EntryBuffer,true);
   ArraySetAsSeries(EntryColors,true);
   ArraySetAsSeries(SL_Buffer,true);
   ArraySetAsSeries(TP1,true);
   ArraySetAsSeries(TP2,true);

   ArrayInitialize(EntryBuffer,EMPTY_VALUE);

   ArrayInitialize(SL_Buffer,EMPTY_VALUE);
   ArrayInitialize(TP1,EMPTY_VALUE);
   ArrayInitialize(TP2,EMPTY_VALUE);

   SerIndicadorPropiedades();

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

   ArraySetAsSeries(time,true);
   ArraySetAsSeries(close,true);
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);

   int to_copy=BarrasFaltanIterar(prev_calculated,rates_total);

   if(!SetValuesIndicatorsAuxiliares(to_copy,rates_total))
      return 0;

   if(prev_calculated==0)
     {
      ObjectsDeleteAll(0,NameLines,0,-1);
      ArrayResize(Entradas,0);
      ArrayInitialize(EntryBuffer,EMPTY_VALUE);
      ArrayInitialize(SL_Buffer,EMPTY_VALUE);
      ArrayInitialize(TP1,EMPTY_VALUE);
      ArrayInitialize(TP2,EMPTY_VALUE);
      ChartRedraw();
     }

   for(int shift=MathMin(to_copy-1,5000); shift>=0; shift--)
     {
      bool isBuy=false;
      bool hayEntrada=Entradas_Tipo_1_2(shift,rates_total,time,close,isBuy);
      VerificarCierres(hayEntrada,isBuy,time[shift],rates_total-prev_calculated,high[shift],low[shift],close[shift],shift);
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(int const reason)
  {
   ObjectsDeleteAll(0,NameLines,0,-1);
   ChartRedraw();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SerIndicadorPropiedades()
  {
   IndicatorSetInteger(INDICATOR_LEVELS,5);

   IndicatorSetDouble(INDICATOR_LEVELVALUE,0,1);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,1,2);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,2,3);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,3,4);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,4,5);

   IndicatorSetInteger(INDICATOR_LEVELCOLOR,0,clrGray);
   IndicatorSetInteger(INDICATOR_LEVELCOLOR,1,clrGray);
   IndicatorSetInteger(INDICATOR_LEVELCOLOR,2,clrGray);
   IndicatorSetInteger(INDICATOR_LEVELCOLOR,3,clrGray);
   IndicatorSetInteger(INDICATOR_LEVELCOLOR,4,clrGray);

   IndicatorSetDouble(INDICATOR_MAXIMUM,5);
   IndicatorSetDouble(INDICATOR_MINIMUM,0);

   IndicatorSetInteger(INDICATOR_DIGITS,Digits());
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetHandles()
  {
   macd_handle=iCustom(Symbol(),PERIOD_CURRENT,"::Indicators\\MACD_colores"," ",Ema_Rapida,Ema_Lenta,MediaMovilExponencial,Applied_Price_MACD);

   sto_handle=iStochastic(Symbol(),PERIOD_CURRENT,K_Periodo,D_Periodo,Slowing,Ma_Method_EST,STO_EST);

   if(INVALID_HANDLE==sto_handle)
     {
      Alert("ERROR en el indicador estocastico ",GetLastError());
      return false;
     }

   if(INVALID_HANDLE==macd_handle)
     {
      Alert("ERROR en el indicador MACD ",GetLastError());
      return false;
     }

   return true;
  }

//+------------------------------------------------------------------+
int BarrasFaltanIterar(int prev_calculated,int rates_total)
  {
   int to_copy=0;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      //--- last value is always copied
      to_copy++;
     }
   return to_copy;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetValuesIndicatorsAuxiliares(int toCopy,int rates_total)
  {
   toCopy=MathMin(rates_total,toCopy+3);
//--- check if all data calculated
   if(BarsCalculated(macd_handle)<rates_total)
      return(false);
   if(BarsCalculated(sto_handle)<rates_total)
      return(false);
//--- we can copy not all data
//--- try to copy
   if(CopyBuffer(macd_handle,0,0,toCopy,MACD)<=0)
      return(false);
   if(CopyBuffer(sto_handle,0,0,toCopy,STO)<=0)
      return(false);

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CondicionEntradas_Tipo_1_2(int shift,int const rates_total,uint &TipoEntrada,bool &isBuy)
  {
//0 Red, 1 Green, 2 White, ver linea 17
   if(rates_total-1>shift)
     {
      bool PositivoMACD=(MACD[shift]>=0);

      if(STO[shift]>=level_sobrecompra && STO[shift+1]<=level_sobreventa)
        {
         if(PositivoMACD)
            TipoEntrada=1;
         else
           {
            if(MathAbs(MACD[shift])<=2)
               TipoEntrada=2;
            else
               return false;
           }

         isBuy=true;
         return true;
        }

      if(STO[shift]<=level_sobreventa && STO[shift+1]>=level_sobrecompra)
        {
         if(PositivoMACD)
           {
            if(MathAbs(MACD[shift])<=2)
               TipoEntrada=2;
            else
               return false;
           }
         else
            TipoEntrada=1;

         isBuy=false;
         return true;
        }
     }

   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Entradas_Tipo_1_2(int shift,int const rates_total,datetime const &time[],double const &close[],bool &isBuy)
  {
   uint TipoEntrada=0;
   isBuy=false;

   EntryBuffer[shift]=EMPTY_VALUE;

   if(CondicionEntradas_Tipo_1_2(shift,rates_total,TipoEntrada,isBuy))
     {
      EntryBuffer[shift]=TipoEntrada;
      EntryColors[shift]=(isBuy?1:0);
      if(shift>=1)
        {
         PushEntry(isBuy,TipoEntrada,time[shift],close[shift],shift);
         EliminarOperacionesContrarias(isBuy,time[shift]);
        }
      return true;
     }

   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int EliminarOperacionesContrarias(bool isBuy,datetime tiempoShift)
  {
   int Size=ArraySize(Entradas);
   for(int i=0; i<Size; i++)
     {
      if(Entradas[i].isBuy!=isBuy && Entradas[i].TiempoEntrada!=tiempoShift)
        {
         TrendCreate(0,NameLines+"Cierre"+TimeToString(tiempoShift,TIME_DATE|TIME_MINUTES),ChartWindowFind(),tiempoShift,0,tiempoShift,7,Entradas[i].isBuy?clrGreen:clrRed,STYLE_SOLID,4,true,false,false,false,true,0);
         if(MiddleWareDeleteSeguimiento(i,Size,tiempoShift))
            continue;
        }
     }
   return Size;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PushEntry(bool isBuy,uint TipoEntrada,datetime tiempo,double close,int shift)
  {
   string nombreLineas=NameLines+TimeToString(tiempo,TIME_DATE|TIME_MINUTES);

   double            TP_large=NormalizeDouble(close+(TipoEntrada==1?TP_points_largo_positivo:TP_points_largo_contra)*(isBuy?1:-1)*Point(),Digits());
   double            TP_small=NormalizeDouble(close+TP_points_small*(isBuy?1:-1)*Point(),Digits());
   double            SL=NormalizeDouble(close+SL_points*(isBuy?-1:+1)*Point(),Digits());
   datetime          TiempoEntrada=tiempo;
   bool              esperarOrdenContraria=(TipoEntrada==2);

   double TP[2]= {TP_small,TP_large};
   int TP_Points_[2]= {TP_points_small,(TipoEntrada==1?TP_points_largo_positivo:TP_points_largo_contra)};
   string ID[2]= {"S","L"};

   for(int i=0; i<2; i++)
     {
      string nombreLineaID=nombreLineas+ID[i];
      PushEntryArray(SL,TP[i],isBuy,nombreLineaID,TiempoEntrada,esperarOrdenContraria,TipoEntrada,TP_Points_[i]);
      Dibujar_Lineas(nombreLineaID,TP[i],SL,TiempoEntrada,isBuy);
     }
   
   SL_Buffer[shift]=SL;
   TP1[shift]=TP[0];
   TP2[shift]=TP[1];
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool PushEntry3(bool isBuy,uint TipoEntrada,datetime tiempo,double close,int TP_Puntos,int ID,int shift)
  {
   string nombreLineas=NameLines+TimeToString(tiempo,TIME_DATE|TIME_MINUTES);

   double            TP_=NormalizeDouble(close+TP_Puntos*(isBuy?1:-1)*Point(),Digits());
   double            SL=NormalizeDouble(close+SL_points*(isBuy?-1:+1)*Point(),Digits());
   datetime          TiempoEntrada=tiempo;
   bool              esperarOrdenContraria=(TipoEntrada==2);

   SL_Buffer[shift]=SL;
   if(TP1[shift]==EMPTY_VALUE)
      TP1[shift]=TP_;
   else
      TP2[shift]=TP_;

   string nombreLineaID=nombreLineas+IntegerToString(ID);
   PushEntryArray(SL,TP_,isBuy,nombreLineaID,TiempoEntrada,esperarOrdenContraria,TipoEntrada,TP_Puntos);
   Dibujar_Lineas(nombreLineaID,TP_,SL,TiempoEntrada,isBuy);

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PushEntryArray(double SL,double TP,bool isBuy,string nombreLineas,datetime TiempoEntrada,bool esperarOrdenContraria,uint TipoEntrada,int TP_Puntos)
  {
   int Size=ArraySize(Entradas);
   ArrayResize(Entradas,Size+1);
   Entradas[Size].TP=TP;
   Entradas[Size].SL=SL;
   Entradas[Size].TiempoEntrada=TiempoEntrada;
   Entradas[Size].nombreLineas=nombreLineas;
   Entradas[Size].isBuy=isBuy;
   Entradas[Size].esperarOrdenContraria=esperarOrdenContraria;
   Entradas[Size].tipoEntrada=TipoEntrada;
   Entradas[Size].TP_Points_=TP_Puntos;
  }
//+------------------------------------------------------------------+
void Dibujar_Lineas(string nameLine,double TP,double SL,datetime tiempoStart,bool isBuy)
  {
   string nameTP=nameLine+"TP";
   string nameSL=nameLine+"SL";
   TrendCreate(0,nameTP,0,tiempoStart,TP,tiempoStart,TP,isBuy?clrGreen:clrRed,STYLE_SOLID,2,false,false,false,false,true,0);
   TrendCreate(0,nameSL,0,tiempoStart,SL,tiempoStart,SL,isBuy?clrYellow:clrMagenta,STYLE_SOLID,2,false,false,false,false,true,0);
   ChartRedraw();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void VerificarCierres(bool hayEntrada,bool isBuyEntrada,datetime tiempoShift,int BarrasFaltanCalcular,double highShift,double lowShift,double closeShift,int shift)
  {
   int Size=ArraySize(Entradas);
   bool ultimasVelas=(shift<=2);
   int ID=0;

   struct addSystem
     {
      bool           IsBuy;
      int            ID_;
      int            tpPoints_;
     };

   addSystem addSegumiento[];
   ArrayResize(addSegumiento,0);


   bool Entrada3=false;
   bool Entrada3IsBuy=false;

   if(BarrasFaltanCalcular>0)
     {
      for(int i=0; i<Size; i++)
        {
         if(tiempoShift>Entradas[i].TiempoEntrada)
           {
            if(ultimasVelas) //Redibujar solo en las ultimas 2 velas para que la carga sea rapida del historial
               RedibujarLineas(Entradas[i].nombreLineas,tiempoShift);

            //CIERRE ENTRADA CONTRARIA
            if(hayEntrada)
              {
               if(Entradas[i].isBuy!=isBuyEntrada)
                  if(MiddleWareDeleteSeguimiento(i,Size,tiempoShift))
                     continue;
              }
            //CIERRE POR TP
            if(Entradas[i].isBuy?(Entradas[i].TP<=highShift):(Entradas[i].TP>=lowShift))
              {
               if(Entradas[i].TP_Points_==TP_points_largo_contra || Entradas[i].TP_Points_==TP_points_largo_positivo)
                  TrendCreate(0,NameLines+"Cierre"+TimeToString(tiempoShift,TIME_DATE|TIME_MINUTES),ChartWindowFind(),tiempoShift,0,tiempoShift,1,Entradas[i].isBuy?clrGreen:clrRed,STYLE_SOLID,4,true,false,false,false,true,0);

               if(MiddleWareDeleteSeguimiento(i,Size,tiempoShift))
                  continue;
              }
            //CIERRE POR SL
            if(Entradas[i].isBuy?(Entradas[i].SL>=lowShift):(Entradas[i].SL<=highShift))
              {
               TrendCreate(0,NameLines+"Cierre"+TimeToString(tiempoShift,TIME_DATE|TIME_MINUTES),ChartWindowFind(),tiempoShift,0,tiempoShift,7,Entradas[i].isBuy?clrGreen:clrRed,STYLE_SOLID,4,true,false,false,false,true,0);
               if(MiddleWareDeleteSeguimiento(i,Size,tiempoShift))
                  continue;
              }

            //CIERRE POR FALTA DE IMPULSO
            if(Entradas[i].tipoEntrada==3)
               continue;

            if(!EsperarOrdenContraria(i,shift))
               continue;

            int barShiftEntrada=iBarShift(Symbol(),PERIOD_CURRENT,Entradas[i].TiempoEntrada,false);
            int barShiftActual=iBarShift(Symbol(),PERIOD_CURRENT,tiempoShift,false);

            if(barShiftEntrada-barShiftActual>=numMaximoEspera)
               if(Entradas[i].isBuy?MACD[shift]<0:MACD[shift]>0)
                 {
                  Entrada3=true;
                  //ENTRADA TIPO 3
                  ID++;
                  bool isbuy=Entradas[i].isBuy;
                  int tpPoints=Entradas[i].TP_Points_;
                  EntryBuffer[shift]=3;
                  EntryColors[shift]=Entradas[i].isBuy?0:1;
                  TrendCreate(0,NameLines+"Cierre"+TimeToString(tiempoShift,TIME_DATE|TIME_MINUTES),ChartWindowFind(),tiempoShift,0,tiempoShift,7,Entradas[i].isBuy?clrGreen:clrRed,STYLE_SOLID,4,true,false,false,false,true,0);
                  Entrada3IsBuy=isbuy;

                  if(MiddleWareDeleteSeguimiento(i,Size,tiempoShift))
                    {
                     int sizeAdd=ArraySize(addSegumiento);
                     ArrayResize(addSegumiento,sizeAdd+1);
                     addSegumiento[sizeAdd].ID_=ID;
                     addSegumiento[sizeAdd].tpPoints_=tpPoints;
                     addSegumiento[sizeAdd].IsBuy=isbuy;
                     continue;
                    }
                 }
           }
        }

      if(Entrada3)
         EliminarOperacionesContrarias(!Entrada3IsBuy,tiempoShift);

      for(int i=0; i<ArraySize(addSegumiento); i++)
        {
         PushEntry3(!addSegumiento[i].IsBuy,3,tiempoShift,closeShift,addSegumiento[i].tpPoints_,addSegumiento[i].ID_,shift);
        }

      if(ultimasVelas)
         ChartRedraw();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EsperarOrdenContraria(int i,int shift)
  {
   if(!Entradas[i].esperarOrdenContraria)
      return false;

   if(Entradas[i].isBuy?(MACD[shift]>0):(MACD[shift]<0))
     {
      Entradas[i].esperarOrdenContraria=false;
      return false;
     }

   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool MiddleWareDeleteSeguimiento(int &i,int &Size,datetime tiempoShift)
  {
   RedibujarLineas(Entradas[i].nombreLineas,tiempoShift);
   if(QuitarEntradaEvaluacion(i,Size))
      i--;
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool QuitarEntradaEvaluacion(int index,int &size)
  {
   ArrayRemove(Entradas,index,1);
   ArrayResize(Entradas,size-1);
   size=size-1;
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void RedibujarLineas(string nameLines,datetime tiempoShift)
  {
   ObjectSetInteger(0,nameLines+"TP",OBJPROP_TIME,1,tiempoShift);
   ObjectSetInteger(0,nameLines+"SL",OBJPROP_TIME,1,tiempoShift);
//ChartRedraw();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool TrendCreate(const long            chart_ID=0,        // ID del gráfico
                 const string          name="TrendLine",  // Nombre de la línea
                 const int             sub_window=0,      // índice de subventana
                 datetime              time1=0,           // hora del primer punto
                 double                price1=0,          // precio del primer punto
                 datetime              time2=0,           // hora del segundo punto
                 double                price2=0,          // precio del segundo punto
                 const color           clr=clrRed,        // color de la línea
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de la línea
                 const int             width=1,           // grosor de la línea
                 const bool            back=false,        // al fondo
                 const bool            selection=true,    // seleccionar para mover
                 const bool            ray_left=false,    // continuación de la línea a la izquierda
                 const bool            ray_right=false,   // continuación de la línea a la derecha
                 const bool            hidden=true,       // ocultar en la lista de objetos
                 const long            z_order=0)         // prioridad para el clic del ratón
  {
//--- creamos la línea de tendencia según las coordenadas establecidas
   if(!ObjectCreate(chart_ID,name,OBJ_TREND,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear la línea de tendencia! Código del error = ",GetLastError());
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
//--- activamos (true) o desactivamos (false) el modo de continuación de la línea a la izquierda
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_LEFT,ray_left);
//--- activamos (true) o desactivamos (false) el modo de continuación de la línea a la derecha
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right);
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- establecemos la prioridad para obtener el evento de cliquear sobre el gráfico
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- ejecución con éxito
   return(true);
  }
//+------------------------------------------------------------------+
