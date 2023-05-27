//+------------------------------------------------------------------+
//|                                          BreakOut Tendencias.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 4
#property indicator_plots   2

#property indicator_label1  "SELL"
#property indicator_color1  clrPink
#property indicator_type1   DRAW_ARROW
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

#property indicator_label2  "BUY"
#property indicator_color2  clrOrange
#property indicator_type2   DRAW_ARROW
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

double ArrowSignalUP[];
double ArrowSignalDN[];

int Puntos_Rompimiento;
double Puntos_UP[];
double Puntos_DN[];

enum Modo_Horario_Mercado{
Semanal=0, //  7 dias de  7
Laborable=1, // 5 dias de 7
};

input int DistanciaMinima=10;  //Distancia Minima en Numero de Velas
input int DistanciaMaxima=100; //Distancia Maxima en Numero de Velas
input Modo_Horario_Mercado Horario_Mercado=Laborable;
input color Color_Trend=clrRed;
input int NUMERODEBARRAS=40; //Extender la linea en Numero de Barras
input int NumeroDeVelasMaximas_=1000; //Conteo Maxima Numero X de Velas hacia atras
input string Settings_Alligator="***Settings_Alligator***";
input int Jaw=13;
input int Jaw_Shift=8;
input int Teeth=8;
input int Teeth_Shift=5;
input int Lips=5;
input int Lips_Shift=3;
input ENUM_MA_METHOD Mode_Alligator=MODE_SMMA;
input ENUM_APPLIED_PRICE AppliedPrice_Alligator=PRICE_MEDIAN;
input string Settings_Bollinger_1="***Settings_Bollinger_1***";
input int Bollinger_1_Periodo=20;
input int Bollinger_1_Shift=0;
input int Bollinger_1_Desviation=7;

double Bollinger_1_Buffer_UP[];
double Bollinger_1_Buffer_DN[];

int Alligator, Bollinger_1;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   Puntos_Rompimiento=iCustom(Symbol(),PERIOD_CURRENT,"Puntos_Rompimiento_Tendencia",Settings_Alligator,Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,
                              Lips_Shift,Mode_Alligator,AppliedPrice_Alligator,Settings_Bollinger_1,Bollinger_1_Periodo,Bollinger_1_Shift,Bollinger_1_Desviation);

   Alligator=iAlligator(Symbol(),PERIOD_CURRENT,Jaw,Jaw_Shift,Teeth,Teeth_Shift,Lips,Lips_Shift,Mode_Alligator,AppliedPrice_Alligator);
   Bollinger_1=iBands(Symbol(),PERIOD_CURRENT,Bollinger_1_Periodo,Bollinger_1_Shift,Bollinger_1_Desviation,Alligator);

   SetIndexBuffer(0,ArrowSignalUP,INDICATOR_DATA);
   SetIndexBuffer(1,ArrowSignalDN,INDICATOR_DATA);
   SetIndexBuffer(2,Bollinger_1_Buffer_DN,INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,Bollinger_1_Buffer_UP,INDICATOR_CALCULATIONS);

   PlotIndexSetInteger(0,PLOT_ARROW,170);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(1,PLOT_ARROW,170);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   ArraySetAsSeries(Puntos_DN,true);
   ArraySetAsSeries(Puntos_UP,true);

   ArrayResize(Puntos_DN,DistanciaMaxima+3+1);
   ArrayResize(Puntos_UP,DistanciaMaxima+3+1);

   ArraySetAsSeries(Bollinger_1_Buffer_DN,false);
   ArraySetAsSeries(Bollinger_1_Buffer_UP,false);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &Time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   int NumeroDeVelasMaximas=rates_total<(NumeroDeVelasMaximas_+DistanciaMaxima+1)?rates_total-DistanciaMaxima-4:NumeroDeVelasMaximas_;
   
   if(NumeroDeVelasMaximas<0)
   return rates_total;
   
   static datetime prevtime=0;
   static int IndiceRes=0;
   static int IndiceSop=0;
   string NombreTrendRes="Break_Res";
   string NombreTrendSop="Break_Sop";

   if(BarsCalculated(Bollinger_1)<rates_total)
      return(0);
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<=0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      to_copy++;
     }
   if(CopyBuffer(Bollinger_1,1,0,to_copy,Bollinger_1_Buffer_UP)<=0)
      return(0);
   if(CopyBuffer(Bollinger_1,2,0,to_copy,Bollinger_1_Buffer_DN)<=0)
      return(0);


   if(prevtime==Time[rates_total-1])
      return(rates_total);


   prevtime=Time[rates_total-1];

   int START=0;
   if(prev_calculated!=0)
     {
      START=rates_total-1;
     }
   else
     {
      START=rates_total-NumeroDeVelasMaximas;
      ArrayInitialize(ArrowSignalUP,EMPTY_VALUE);
      ArrayInitialize(ArrowSignalDN,EMPTY_VALUE);
     }

   for(int shift=START; shift<rates_total; shift++)
     {
      CopyBuffer(Puntos_Rompimiento,0,rates_total-1-shift,DistanciaMaxima+3,Puntos_DN);
      CopyBuffer(Puntos_Rompimiento,1,rates_total-1-shift,DistanciaMaxima+3,Puntos_UP);
      
      bool Condicion1_Sell=false;
      bool Condicion2_Sell=false;
      bool Condicion1_Buy=false;
      bool Condicion2_Buy=false;
      int LineasTotales=ObjectsTotal(0,0,OBJ_TREND);
      for(int i=0; i<LineasTotales; i++)
        {
         string NameTrendResSopEva=ObjectName(0,i,0,OBJ_TREND);
         if(StringFind(NameTrendResSopEva,"Break_Res",0)!=-1)
           {
            if(datetime(ObjectGetInteger(0,NameTrendResSopEva,OBJPROP_TIME,1))>=Time[shift-1])
              {
               double ValorActualObjeto=ObjectGetValueByTime(0,NameTrendResSopEva,Time[shift-1],0);
               double ValorActualObjeto2=ObjectGetValueByTime(0,NameTrendResSopEva,Time[shift-2],0);
               double ValorActualObjeto3=ObjectGetValueByTime(0,NameTrendResSopEva,Time[shift-3],0);
               if(ValorActualObjeto!=0 && ValorActualObjeto<close[shift-1] && ValorActualObjeto>open[shift-1])
                 {
                 Condicion1_Buy=true;
                  //ArrowSignalUP[shift-1]=low[shift-1];
                  //break;
                 }
               if((Bollinger_1_Buffer_UP[shift-1]>ValorActualObjeto && Bollinger_1_Buffer_UP[shift-2]<ValorActualObjeto2 && ValorActualObjeto!=0 && ValorActualObjeto2!=0 )|| 
                  (Bollinger_1_Buffer_UP[shift-2]>ValorActualObjeto2 && Bollinger_1_Buffer_UP[shift-3]<ValorActualObjeto3 && ValorActualObjeto2!=0 && ValorActualObjeto3!=0  ) ){
                 Condicion2_Sell=true;
                  }
              }
           }
          if(StringFind(NameTrendResSopEva,"Break_Sop",0)!=-1)
           {
            if(datetime(ObjectGetInteger(0,NameTrendResSopEva,OBJPROP_TIME,1))>=Time[shift-1])
              {
               double ValorActualObjeto=ObjectGetValueByTime(0,NameTrendResSopEva,Time[shift-1],0);
               double ValorActualObjeto2=ObjectGetValueByTime(0,NameTrendResSopEva,Time[shift-2],0);
               double ValorActualObjeto3=ObjectGetValueByTime(0,NameTrendResSopEva,Time[shift-3],0);
               if(ValorActualObjeto!=0 && ValorActualObjeto>close[shift-1] && ValorActualObjeto<open[shift-1] )
                 {
                  Condicion1_Sell=true;
                  //ArrowSignalDN[shift-1]=high[shift-1];
                  //break;
                 }
               if((Bollinger_1_Buffer_DN[shift-1]<ValorActualObjeto && Bollinger_1_Buffer_DN[shift-2]>ValorActualObjeto2  && ValorActualObjeto!=0 && ValorActualObjeto2!=0 )|| 
                  (Bollinger_1_Buffer_DN[shift-2]<ValorActualObjeto2 && Bollinger_1_Buffer_DN[shift-3]>ValorActualObjeto3 && ValorActualObjeto2!=0 && ValorActualObjeto3!=0 )){
                  Condicion2_Buy=true;
                }
              }
           }
        }
      if(Condicion1_Sell==true && Condicion2_Sell==true)
      ArrowSignalDN[shift-1]=high[shift-1];
      if(Condicion1_Buy==true && Condicion2_Buy==true)
      ArrowSignalUP[shift-1]=low[shift-1];
      
      if(Puntos_UP[2]!=EMPTY_VALUE)
        {
         for(int j=DistanciaMinima+3; j<DistanciaMaxima+3; j++)
           {
            if(Puntos_UP[j]!=EMPTY_VALUE && Puntos_UP[2]<Puntos_UP[j])
              {
               //Print("Entra");
               IndiceRes++;
               NombreTrendRes="Break_Res"+string(IndiceRes);
               //Print(shift-j);
               //Print(Time[shift-j],"  ",Puntos_UP[j],"  ",Time[shift-2],"   ",Puntos_UP[2]);
               if(!ObjectCreate(0,NombreTrendRes,OBJ_TREND,0,Time[shift-j],Puntos_UP[j],Time[shift-2],Puntos_UP[2]))
                  Print("No se creo");
               else
                 {
                  double DiferenciaX=(shift-2)-(shift-j);
                  double DifrenciaY=Puntos_UP[2]-Puntos_UP[j];
                  double Pendiente=DifrenciaY/DiferenciaX;

                  for(int L=shift-3; L>shift-j; L--)
                    {
                     double Valor=ObjectGetValueByTime(0,NombreTrendRes,Time[L],0);
                     if(Valor+7*Point()<Bollinger_1_Buffer_UP[L] && Valor!=0)
                       {
                        ObjectDelete(0,NombreTrendRes);
                        IndiceRes--;
                        break;
                       }
                    }
                  if(ObjectFind(0,NombreTrendRes)==0)
                    {
                     datetime TiempoFinal=Time[shift-2]+(PeriodSeconds(PERIOD_CURRENT))*NUMERODEBARRAS;//+20];///CAMBIO
                     datetime TiempoInicio=Time[shift-j];
                     MqlDateTime TiempoInicioMql5, TiempoFinalMql5;
                     TimeToStruct(TiempoFinal,TiempoFinalMql5);
                     TimeToStruct(TiempoInicio,TiempoInicioMql5);
                     int DayFirst=TiempoInicioMql5.day_of_year;
                     int DayLast=TiempoFinalMql5.day_of_year;

                     TiempoFinal=Time[shift-2]+(PeriodSeconds(PERIOD_CURRENT))*NUMERODEBARRAS;
                     
                     if((TiempoFinalMql5.day_of_week==0 || TiempoFinalMql5.day_of_week==6) && Horario_Mercado==Laborable) //|| (TiempoFinalMql5.day_of_week<TiempoInicioMql5.day_of_week && int((DayLast-DayFirst)/7)==0))
                       {
                        TiempoFinal=TiempoFinal+(PeriodSeconds(PERIOD_D1))*2;
                       }
                     //if(int((DayLast-DayFirst)/7)>0)
                     //{
                     //TiempoFinal=(datetime)(TiempoFinal+PeriodSeconds(PERIOD_D1)*(MathPow(2,int((DayLast-DayFirst)/7))));
                     //}
                     double ValorUltimo=Puntos_UP[2]+Pendiente*NUMERODEBARRAS;
                     ResetLastError();
                     if(!ObjectMove(0,NombreTrendRes,1,TiempoFinal,ValorUltimo))
                       {
                        Print("Error: No se movio ",GetLastError());
                       }
                     ObjectSetInteger(0,NombreTrendRes,OBJPROP_COLOR,Color_Trend);
                    }
                 }
              }
           }
        }
      if(Puntos_DN[2]!=EMPTY_VALUE)
        {
         for(int j=DistanciaMinima+3; j<DistanciaMaxima+3; j++)
           {
            if(Puntos_DN[j]!=EMPTY_VALUE && Puntos_DN[2]>Puntos_DN[j])
              {
               //Print("Entra");
               IndiceSop++;
               NombreTrendSop="Break_Sop"+string(IndiceSop);
               //Print(shift-j);
               //Print(Time[shift-j],"  ",Puntos_UP[j],"  ",Time[shift-2],"   ",Puntos_UP[2]);
               if(!ObjectCreate(0,NombreTrendSop,OBJ_TREND,0,Time[shift-j],Puntos_DN[j],Time[shift-2],Puntos_DN[2]))
                  Print("No se creo");
               else
                 {
                  double DiferenciaX=(shift-2)-(shift-j);
                  double DifrenciaY=Puntos_DN[2]-Puntos_DN[j];
                  double Pendiente=DifrenciaY/DiferenciaX;

                  for(int L=shift-3; L>shift-j; L--)
                    {
                     double Valor=ObjectGetValueByTime(0,NombreTrendSop,Time[L],0);
                     if(Valor-7*Point()>Bollinger_1_Buffer_DN[L] && Valor!=0)
                       {
                        ObjectDelete(0,NombreTrendSop);
                        IndiceSop--;
                        break;
                       }
                    }
                  if(ObjectFind(0,NombreTrendSop)==0)
                    {
                     datetime TiempoFinal=Time[shift-2]+(PeriodSeconds(PERIOD_CURRENT))*NUMERODEBARRAS;//+20];///CAMBIO
                     datetime TiempoInicio=Time[shift-j];
                     MqlDateTime TiempoInicioMql5, TiempoFinalMql5;
                     TimeToStruct(TiempoFinal,TiempoFinalMql5);
                     TimeToStruct(TiempoInicio,TiempoInicioMql5);
                     int DayFirst=TiempoInicioMql5.day_of_year;
                     int DayLast=TiempoFinalMql5.day_of_year;

                     TiempoFinal=Time[shift-2]+(PeriodSeconds(PERIOD_CURRENT))*NUMERODEBARRAS;
                     if(TiempoFinalMql5.day_of_week==0 || TiempoFinalMql5.day_of_week==6) //|| (TiempoFinalMql5.day_of_week<TiempoInicioMql5.day_of_week && int((DayLast-DayFirst)/7)==0))
                       {
                        TiempoFinal=TiempoFinal+(PeriodSeconds(PERIOD_D1))*2;
                       }
                     //if(int((DayLast-DayFirst)/7)>0)
                     //{
                     //TiempoFinal=(datetime)(TiempoFinal+PeriodSeconds(PERIOD_D1)*(MathPow(2,int((DayLast-DayFirst)/7))));
                     //}
                     double ValorUltimo=Puntos_DN[2]+Pendiente*NUMERODEBARRAS;
                     ResetLastError();
                     if(!ObjectMove(0,NombreTrendSop,1,TiempoFinal,ValorUltimo))
                       {
                        Print("Error: No se movio ",GetLastError());
                       }
                     ObjectSetInteger(0,NombreTrendSop,OBJPROP_COLOR,Color_Trend);
                    }
                 }
              }
           }
        }
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,0,OBJ_TREND);
   for(int k=ObjectsTotal(0,0,OBJ_TREND)-1; k>-1; k--)
     {
      string NameTrend=ObjectName(0,k,0,OBJ_TREND);
      if(StringFind(NameTrend,"Break_Res",0)!=-1 || StringFind(NameTrend,"Break_Sop",0)!=-1)
         ObjectDelete(0,NameTrend);
     }
  }
//+------------------------------------------------------------------+
