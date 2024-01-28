//+------------------------------------------------------------------+
//|                                             Estocastico_Pepe.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#property indicator_separate_window
#property indicator_buffers 4
#property indicator_plots   3
//--- plot ColorLine
#property indicator_label1  "Est Value"
#property indicator_type1   DRAW_COLOR_LINE
//--- estableceremos 5 colores para colorear cada barra (se almacenan en un array especial)
#property indicator_color1  clrRed,clrGreen,clrWhite // (se puede especificar hasta 64 colores) 
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

#property indicator_label2  "BUY"
#property indicator_type2   DRAW_ARROW
#property indicator_color2  clrGreen
#property indicator_width2  2

#property indicator_label3  "SELL"
#property indicator_type3   DRAW_ARROW
#property indicator_color3  clrRed
#property indicator_width3  2

input string S7="========== Configuracion Estocastico ==========";//==========================================================================================
input int K_Periodo=5;
input int D_Periodo=3;
input int Slowing=3;
input ENUM_MA_METHOD Ma_Method_EST=MODE_SMA;
input ENUM_STO_PRICE STO_EST=STO_LOWHIGH;
input int level_sobrecompra=70;//Nivel Sobre Compra Normal
input int level_sobreventa=30;//Nivel Sobre Venta Normal
input string S4="========== Configuracion Niveles en Horario ==========";//==========================================================================================
input string Start="21:48";
input string End="23:05";
input int level_sobrecompra_horario=75;//Nivel Sobre Compra Horario
input int level_sobreventa_horario=25;//Nivel Sobre Venta Horario
input string S8="========== Configuracion Alerta ==========";//==========================================================================================
input bool PC=false;
input bool Movil=false;

//--- búfer para dibujar
double         StochasticLineBuffer[];
double         StochasticLineColors[];

double ARROW_SELL[];
double ARROW_BUY[];

int horaStart=0;
int minutoStart=0;
int horaEnd=0;
int minutoEnd=0;

int sto_handle=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   SetIndexBuffer(0,StochasticLineBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,StochasticLineColors,INDICATOR_COLOR_INDEX);

   SetIndexBuffer(2,ARROW_BUY,INDICATOR_DATA);
   SetIndexBuffer(3,ARROW_SELL,INDICATOR_DATA);

   ArraySetAsSeries(StochasticLineBuffer,true);
   ArraySetAsSeries(StochasticLineColors,true);

   ArraySetAsSeries(ARROW_BUY,true);
   ArraySetAsSeries(ARROW_SELL,true);

   PlotIndexSetInteger(1,PLOT_ARROW,108);
   PlotIndexSetInteger(2,PLOT_ARROW,108);

   SetIndicatorPropiedades();

   if(!SacarHoraMinuto(Start,horaStart,minutoStart))
      return INIT_PARAMETERS_INCORRECT;
   if(!SacarHoraMinuto(End,horaEnd,minutoEnd))
      return INIT_PARAMETERS_INCORRECT;

   if(!SetHandleEstocastico())
      return INIT_FAILED;

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
//--- check if all data calculated
   if(BarsCalculated(sto_handle)<rates_total)
      return(0);
//--- we can copy not all data
   int to_copy=BarrasFaltanIterar(prev_calculated,rates_total);
//--- try to copy
   if(CopyBuffer(sto_handle,0,0,to_copy,StochasticLineBuffer)<=0)
      return(0);

   for(int shift=to_copy-1; shift>=0; shift--)
     {
      bool horarioLevels=EvaluarHorario(horaStart,horaEnd,minutoStart,minutoEnd,time[shift]);
      double lSobreCompra=horarioLevels?level_sobrecompra_horario:level_sobrecompra;
      double lSobreVenta=horarioLevels?level_sobreventa_horario:level_sobreventa;

      SetColorLineStocastico(shift,lSobreCompra,lSobreVenta);
      SetArrowSignals(shift,rates_total);
     }

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetHandleEstocastico()
  {
   sto_handle=iStochastic(Symbol(),PERIOD_CURRENT,K_Periodo,D_Periodo,Slowing,Ma_Method_EST,STO_EST);
   if(INVALID_HANDLE==sto_handle)
     {
      Alert("ERROR en el indicador estocastico ",GetLastError());
      return false;
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetIndicatorPropiedades()
  {
   IndicatorSetInteger(INDICATOR_LEVELS,2);

   IndicatorSetDouble(INDICATOR_LEVELVALUE,0,level_sobrecompra);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,1,level_sobreventa);

   IndicatorSetInteger(INDICATOR_LEVELCOLOR,0,clrRed);
   IndicatorSetInteger(INDICATOR_LEVELCOLOR,1,clrGreen);

   IndicatorSetDouble(INDICATOR_MAXIMUM,100);
   IndicatorSetDouble(INDICATOR_MINIMUM,0);

   IndicatorSetInteger(INDICATOR_DIGITS,2);

   IndicatorSetString(INDICATOR_SHORTNAME,"Estocastico Pepe ("+"K="+IntegerToString(K_Periodo)+"  D="+IntegerToString(D_Periodo)+"  Slowing="+IntegerToString(Slowing)+")");

   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,MathMax(MathMax(K_Periodo,D_Periodo),Slowing)+1);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetColorLineStocastico(int shift,double sobrecompra,double sobreventa)
  {
//0 Red, 1 Green, 2 White, ver linea 17
   StochasticLineColors[shift]=2;

   if(StochasticLineBuffer[shift]>=sobrecompra)
      StochasticLineColors[shift]=0;

   if(StochasticLineBuffer[shift]<=sobreventa)
      StochasticLineColors[shift]=1;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetArrowSignals(int shift,int const rates_total)
  {
   ARROW_BUY[shift]=EMPTY_VALUE;
   ARROW_SELL[shift]=EMPTY_VALUE;

   if(shift<rates_total-1)
     {
      if(StochasticLineBuffer[shift]>=level_sobrecompra && StochasticLineBuffer[shift+1]<=level_sobreventa)
        {
         ARROW_BUY[shift]=50;
         if(shift==1)
            Alertas("EstSignal compra");
        }

      if(StochasticLineBuffer[shift]<=level_sobreventa && StochasticLineBuffer[shift+1]>=level_sobrecompra)
        {
         ARROW_SELL[shift]=50;
         if(shift==1)
            Alertas("EstSignal venta");
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Alertas(string mensaje)
  {
   if(PC)
      Alert(mensaje+" en "+Symbol()+" "+EnumToString(Period()));

   if(Movil)
      SendNotification(mensaje+" en "+Symbol()+" "+EnumToString(Period()));
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SacarHoraMinuto(string horaMinuto,int &hora,int &minuto)
  {
   string hora_minuto[];
   StringSplit(horaMinuto,':',hora_minuto);
   if(ArraySize(hora_minuto)!=2)
      return false;

   string comentario_="";

   if(!VerificarEntero(hora_minuto[0],comentario_))
     {
      Alert(comentario_+" en "+horaMinuto);
      return false;
     }

   if(!VerificarEntero(hora_minuto[1],comentario_))
     {
      Alert(comentario_+" en "+horaMinuto);
      return false;
     }

   hora=(int)StringToInteger(hora_minuto[0]);
   minuto=(int)StringToInteger(hora_minuto[1]);



   if(!VerificarHora_o_Minuto(hora,true,comentario_))
     {
      Alert(comentario_+" en ",horaMinuto);
      return false;
     }

   if(!VerificarHora_o_Minuto(minuto,false,comentario_))
     {
      Alert(comentario_+" en ",horaMinuto);
      return false;
     }

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarEntero(string evaluaString,string &comentario_)
  {
   for(int i=0; i<StringLen(evaluaString); i++)
     {
      ushort char_=StringGetCharacter(evaluaString,i);
      if(!('0'<=char_ && char_<='9'))
        {
         comentario_="Los valores hora o minuto deben de ser valores enteros";
         return false;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarHora_o_Minuto(int clockPointer,bool IsHora,string &comentario_)
  {
   comentario_=IsHora?("Hora es mayor a 23"):("Minuto es mayor a 59");
   return (clockPointer<(IsHora?(24):(60)));
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluarHorario(int Inicio, int Final, int MInicio, int MFinal, datetime TimeEvalua)
  {

   MqlDateTime time;
   TimeToStruct(TimeEvalua,time);

   int Minuto = time.min;
   int Hora = time.hour;

   if((Inicio < Final)?(!(Inicio <= Hora && Hora <= Final)):(!(Inicio <= Hora || Hora <= Final)))
      return false;

   if(Inicio!=Final)
     {
      if(Inicio == Hora)
         if(Minuto < MInicio)
            return false;

      if(Final == Hora)
         if(Minuto >= MFinal)
            return false;
     }
   else
     {
      if(MFinal > MInicio)
        {
         if(Hora != Inicio)
            return false;
        }
      else
         if(MFinal < MInicio)
           {
            if(Hora == Inicio)
               if(!(MInicio <= Minuto || Minuto < MFinal))
                  return false;
           }
     }
   return true;
  }
//+------------------------------------------------------------------+
