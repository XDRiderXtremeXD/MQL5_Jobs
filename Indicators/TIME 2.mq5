//+------------------------------------------------------------------+
//|                                                Forex_Session.mq5 |
//|                                Copyright 2020, Claudio_Chumpitaz |
//|                     "https://www.mql5.com/es/users/claudioangelo"|
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, Claudio_Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.00"

#property description "Indicador para marcar las sesiones de Forex"

#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots   1
//--- parámetros input
//--- plot Color_Histogram
#property indicator_label1  "NoDrawBuffer"
#property indicator_type1   DRAW_NONE
#property indicator_width1  1

MqlDateTime EvaluaTime;

//TesterHideIndicators

input int GMT_INDICE=3; //UTC/GMT(-12 to +12)

int Multiplicador;

input int CantidadDeCuadros2=10;//Number of Squares
int CantidadDeCuadros;

input ENUM_LINE_STYLE StyleTrend=STYLE_DASH;
input bool Fondo=true;//Background
input uint WidthTrend=2;

input ENUM_LINE_STYLE StyleTabulador=STYLE_DASH;//STYLE LINE VERTICAL
input uint WidthTabulador=2;//Width Vertical


input bool VerNewYork=true;//SeeNewYork
input bool VerLondres=true;//SeeLondon
input bool VerSydney=false;//SeeSydney
input bool VerTokyo=false;//SeeTokyo

input color ColorTrendNewYork=LightSeaGreen;
input color ColorTrendLondres=Orange;
input color ColorTrendSydney=Brown;
input color ColorTrendTokyo=MediumPurple;

////////////////////HORARIO VERANO GMT+0///////////////////
///////////////////HORAS DEL 0---23////////////////////////
int HoraOpenLondres=7;
int HoraCloseLondres=16;

int HoraOpenNewYork=12;
int HoraCloseNewYork=21;

int HoraOpenSydney=22;
int HoraCloseSydney=7;

int HoraOpenTokyo=23;
int HoraCloseTokyo=8;
////////////////////////////////////////////////

input bool VerPersonalizado=false; //SeePersonalized
input uint HoraOpenPersonalizado=0;// HourOpenPersonalized
input uint HoraClosePersonalizado=9;// HourClosePersonalized
input color ColorTrendPersonalizado=Purple; // ColorTrendPersonalized

double BufferTime[];

datetime bufferOpen[100];
datetime bufferClose[100];
double bufferLow[100];
double bufferHigh[100];

bool Descargado=false;

datetime InpStartDate=0; // Se Calcula dentro de INIT

int CHARTSUBWINDOW=0;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   CantidadDeCuadros=CantidadDeCuadros2;
   if(GMT_INDICE<-11 || GMT_INDICE>12)
     {
      Print("GMT_INDICE Tiene no tienes que ser mayor que 12 y tampoco tiene que ser menor que -11");
      return(INIT_PARAMETERS_INCORRECT);
     }

   if(CantidadDeCuadros>100)
     {
      Print("Cantidad de Cdros no debe er mayor que 100");
      return(INIT_PARAMETERS_INCORRECT);
     }

   Descargado=false;

   HoraOpenLondres=HoraOpenLondres+GMT_INDICE;
   CambioHorarioConIndiceGMT(HoraOpenLondres);
   HoraCloseLondres=HoraCloseLondres+GMT_INDICE;
   CambioHorarioConIndiceGMT(HoraCloseLondres);

   HoraOpenNewYork=HoraOpenNewYork+GMT_INDICE;
   CambioHorarioConIndiceGMT(HoraOpenNewYork);
   HoraCloseNewYork=HoraCloseNewYork+GMT_INDICE;
   CambioHorarioConIndiceGMT(HoraCloseNewYork);

   HoraOpenSydney=HoraOpenSydney+GMT_INDICE;
   CambioHorarioConIndiceGMT(HoraOpenSydney);
   HoraCloseSydney=HoraCloseSydney+GMT_INDICE;
   CambioHorarioConIndiceGMT(HoraCloseSydney);

   HoraOpenTokyo=HoraOpenTokyo+GMT_INDICE;
   CambioHorarioConIndiceGMT(HoraOpenTokyo);
   HoraCloseTokyo=HoraCloseTokyo+GMT_INDICE;
   CambioHorarioConIndiceGMT(HoraCloseTokyo);

   if(HoraClosePersonalizado>23 || HoraOpenPersonalizado>23)
     {
      Print("HoraClosePersonalizado y HoraOpenPersonalizado tiene que ser menor o igual que 23");
      return(INIT_PARAMETERS_INCORRECT);
     }
   EraseTrend();
   SetIndexBuffer(0,BufferTime,INDICATOR_DATA);
   ArraySetAsSeries(BufferTime,true);

//--- indicator buffers mapping


//---
   Multiplicador=int(pow(10,Digits())/10);

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

   
   static bool CuadrosCalculo =false;
   if(CuadrosCalculo==false)
     {
      bool SalirCalculo=false;

      for(int i=0; i<CantidadDeCuadros2 && SalirCalculo==false; i++)
        {
         datetime DiaTiempo=iTime(Symbol(),PERIOD_D1,i);
         if(DiaTiempo<time[0])
           {
            if(i>1)
              {
               CantidadDeCuadros=i-2;
              }
            else
              CantidadDeCuadros=1;
            SalirCalculo=true;
           }
        }
      CuadrosCalculo=true;
     }



//if(rates_total-prev_calculated==0){/////ACTUALIZAR GRAFICO////////////
   if(Period()>PERIOD_H1 || Period()<PERIOD_M5)
     {
      return(rates_total);
     }

   ArraySetAsSeries(time,true);

   MqlDateTime EvaluaTimeActual,EvaluaTimeMarzo;
   TimeToStruct(TimeCurrent(),EvaluaTimeActual);
   int HoraActual=EvaluaTimeActual.hour;
//day,domingo=0,Lunes=1,Martes=2,Miercoles=3,Jueves=4,Viernes=5,Sabado=6
   int HoraOpenLondresTrue,HoraCloseLondresTrue,HoraOpenNewYorkTrue,HoraCloseNewYorkTrue;

///////////CAMBIO DE HORARIO LONDRES y NEWYORK///////////////////////////
//PARA CAMBIO DE HORRARIO/////

//////////////MEJORAR ESTO/////////
   bool CambioLondres=CambiodeHorarioInvierno(3,0,4,10,0,4,HoraOpenLondresTrue,HoraCloseLondresTrue,TimeCurrent(),HoraOpenLondres,HoraCloseLondres);
   bool CambioNewYork=CambiodeHorarioInvierno(3,0,2,11,0,1,HoraOpenNewYorkTrue,HoraCloseNewYorkTrue,TimeCurrent(),HoraOpenNewYork,HoraCloseNewYork);
/////////////////////////////////////////////////////////

   static uint Cantidad=CantidadDeCuadros;
////////////HORARIO LONDRES////////////////////////////
   if(VerLondres)
      CorrerPrograma(Cantidad,HoraOpenLondresTrue,HoraCloseLondresTrue,HoraActual,bufferOpen,bufferClose,bufferHigh,bufferLow,"LONDON",time,rates_total,ColorTrendLondres,1);
////////////HORARIO NEWYORK///////////////////////////
   if(VerNewYork)
      CorrerPrograma(Cantidad,HoraOpenNewYorkTrue,HoraCloseNewYorkTrue,HoraActual,bufferOpen,bufferClose,bufferHigh,bufferLow,"NEWYORK",time,rates_total,ColorTrendNewYork,3);
////////////HORARIO SYDNEY///////////////////////////
   if(VerSydney)
      CorrerPrograma(Cantidad,HoraOpenSydney,HoraCloseSydney,HoraActual,bufferOpen,bufferClose,bufferHigh,bufferLow,"SYDNEY",time,rates_total,ColorTrendSydney,2);
////////////HORARIO TOKYO///////////////////////////
   if(VerTokyo)
      CorrerPrograma(Cantidad,HoraOpenTokyo,HoraCloseTokyo,HoraActual,bufferOpen,bufferClose,bufferHigh,bufferLow,"TOKYO",time,rates_total,ColorTrendTokyo,4);
////////////HORARIO NEWYORK///////////////////////////
   if(VerPersonalizado)
      CorrerPrograma(Cantidad,HoraOpenPersonalizado,HoraClosePersonalizado,HoraActual,bufferOpen,bufferClose,bufferHigh,bufferLow,"PERSONALIZED",time,rates_total,ColorTrendPersonalizado,5);

   Cantidad=1;
   return(rates_total);
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EraseTrend();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EstaDentroDelHorario(int open,int close,int horaactual)
  {
   if(close<open)
     {
      if(horaactual>=open || horaactual<=close)
        {
         return true;
        }
      else
        {
         return false;
        }
     }
   else
     {
      if(horaactual>=open && horaactual<=close)
        {
         return true;
        }
      else
        {
         return false;
        }
     }
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EraseTrend()
  {

   for(int k=ObjectsTotal(0,0,OBJ_TEXT)-1; k>-1; k--)
     {
      string NameSymbol=ObjectName(0,k,0,OBJ_TEXT);
      if(StringFind(NameSymbol,"01TREND",0)!=-1)
        {
         ObjectDelete(0,NameSymbol);
        }
     }


   for(int k=ObjectsTotal(0,0,OBJ_TREND)-1; k>-1; k--)
     {
      string NameSymbol=ObjectName(0,k,0,OBJ_TREND);
      if(StringFind(NameSymbol,"01TREND",0)!=-1)
        {
         ObjectDelete(0,NameSymbol);
        }
     }
   for(int k=ObjectsTotal(0,1,OBJ_TREND)-1; k>-1; k--)
     {
      string NameSymbol=ObjectName(0,k,1,OBJ_TREND);
      if(StringFind(NameSymbol,"01TREND",0)!=-1)
        {
         ObjectDelete(0,NameSymbol);
        }
     }
   for(int k=ObjectsTotal(0,0,OBJ_VLINE)-1; k>-1; k--)
     {
      string NameSymbol=ObjectName(0,k,0,OBJ_VLINE);
      if(StringFind(NameSymbol,"TABULADOR ",0)!=-1)
        {
         ObjectDelete(0,NameSymbol);
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DrawTrends(int CantidadCuadros,datetime &BUFFER_Open[],datetime &BUFFER_Close[],double &BUFFER_High[],double &BUFFER_Low[],string NameSession,color ColorVisual,int NivelLineaSubwindow)
  {
   for(int i=0; i<CantidadCuadros; i++)
     {
      string NameUp="01TRENDUP"+TimeToString(BUFFER_Open[i])+" "+NameSession;
      string NameLineSubWindow="01TRENDLINEASUBWINDOW"+TimeToString(BUFFER_Open[i])+" "+NameSession;
      string NameDown="01TRENDDOWN"+TimeToString(BUFFER_Open[i])+" "+NameSession;
      string NameRigh="01TRENDRIGHT"+TimeToString(BUFFER_Open[i])+" "+NameSession;
      string NameLeftf="01TRENDLEFT"+TimeToString(BUFFER_Open[i])+" "+NameSession;
      string NameText="01TRENDTEXT"+TimeToString(BUFFER_Open[i])+" "+NameSession;

      ObjectCreate(0,NameUp,OBJ_TREND,0,BUFFER_Open[i],BUFFER_High[i],BUFFER_Close[i],BUFFER_High[i]);
      ObjectCreate(0,NameDown,OBJ_TREND,0,BUFFER_Open[i],BUFFER_Low[i],BUFFER_Close[i],BUFFER_Low[i]);
      ObjectCreate(0,NameRigh,OBJ_TREND,0,BUFFER_Close[i],BUFFER_High[i],BUFFER_Close[i],BUFFER_Low[i]);
      ObjectCreate(0,NameLeftf,OBJ_TREND,0,BUFFER_Open[i],BUFFER_High[i],BUFFER_Open[i],BUFFER_Low[i]);
      ObjectCreate(0,NameLineSubWindow,OBJ_TREND,CHARTSUBWINDOW,BUFFER_Open[i],NivelLineaSubwindow,BUFFER_Close[i],NivelLineaSubwindow);
      ObjectCreate(0,NameText,OBJ_TEXT,0,BUFFER_Open[i],BUFFER_High[i]);

      //string TEXTOVALORES="H:"+string (NormalizeDouble((BUFFER_High[i]-BUFFER_Low[i])*Multiplicador,2))+" pips";

      PropiedadesDeTrend(0,NameUp,ColorVisual,StyleTrend,WidthTrend,Fondo);
      PropiedadesDeTrend(0,NameDown,ColorVisual,StyleTrend,WidthTrend,Fondo);
      PropiedadesDeTrend(0,NameRigh,ColorVisual,StyleTrend,WidthTrend,Fondo);
      PropiedadesDeTrend(0,NameLeftf,ColorVisual,StyleTrend,WidthTrend,Fondo);
      PropiedadesDeTrend(0,NameLineSubWindow,ColorVisual,STYLE_SOLID,2,Fondo);
      PropiedadesText(0,NameText,0,NameSession,"Comic Sans",8,ColorVisual,0,false,false,true,0);
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Actualizar1erCuadro(string NameSession,datetime &BUFFER_Open[])
  {
   string NameOpen0=TimeToString(BUFFER_Open[0])+" "+NameSession;
   ObjectDelete(0,"01TRENDUP"+NameOpen0);
   ObjectDelete(0,"01TRENDDOWN"+NameOpen0);
   ObjectDelete(0,"01TRENDRIGHT"+NameOpen0);
   ObjectDelete(0,"01TRENDLEFT"+NameOpen0);
   ObjectDelete(0,"01TRENDLINEASUBWINDOW"+NameOpen0);
   ObjectDelete(0,"01TRENDTEXT"+NameOpen0);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ActualizarDatos1erCdro(datetime &BUFFER_Open[],double &BUFFER_High[],double &BUFFER_Low[])
  {
   datetime TiempoResta=TimeCurrent()-BUFFER_Open[0];
   TimeToStruct(TiempoResta,EvaluaTime);
   int Indice=EvaluaTime.hour+1;
   BUFFER_High[0]=iHigh(NULL,PERIOD_H1,iHighest(Symbol(),PERIOD_H1,MODE_HIGH,Indice,0));;
   BUFFER_Low[0]=iLow(NULL,PERIOD_H1,iLowest(Symbol(),PERIOD_H1,MODE_LOW,Indice,0));
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ActualizarDatosTodosCdros(int CantidadCdros,datetime &BUFFER_Open[],datetime &BUFFER_Close[],double &BUFFER_High[],double &BUFFER_Low[]
                               ,int CloseTimeIndex,int OpenTimeIndex,const datetime &time[],string NameSession, int const RATES_TOTAL)
  {
   int i=0;
   int j=-1;

   while(i<CantidadCdros && RATES_TOTAL-24>j)
     {
      j++;
      TimeToStruct(time[j],EvaluaTime);
      int NewCloseTimeIndex=CloseTimeIndex;
      int CambioHorarioCondicional=0;
      int NewOpenTimeIndex=OpenTimeIndex;

      if(EvaluaTime.hour==NewOpenTimeIndex && EvaluaTime.min==0 && EvaluaTime.sec==0)
        {
         NewOpenTimeIndex=OpenTimeIndex;


         //////////////////////////////////CAMBIO DE HORARIOS///////////////////////
         //PARA CAMBIO DE HORARIO FUTURO
         if(CantidadDeCuadros!=1)
           {

            if(NameSession=="LONDON")
              {
               if(CambiodeHorarioInvierno(3,0,4,10,0,4,NewOpenTimeIndex,NewCloseTimeIndex,time[j],HoraOpenLondres,HoraCloseLondres))
                 {
                  CambioHorarioCondicional=1;
                 }
               else
                  CambioHorarioCondicional=0;
              }

            else
               if(NameSession=="NEWYORK")
                 {
                  if(CambiodeHorarioInvierno(3,0,2,11,0,1,NewOpenTimeIndex,NewCloseTimeIndex,time[j],HoraOpenNewYork,HoraCloseNewYork))
                    {
                     //Print(NewOpenTimeIndex," " ,NewCloseTimeIndex);
                     CambioHorarioCondicional=-1;
                    }
                  else
                     CambioHorarioCondicional=0;
                 }
           }
         //////////////////////////////////////////////////////////////////////////

         if(NewCloseTimeIndex<OpenTimeIndex)
           {
            NewCloseTimeIndex=CloseTimeIndex+24;
           }
         else
           {
            NewCloseTimeIndex=CloseTimeIndex;
           }

         BUFFER_Open[i]=time[j+CambioHorarioCondicional];
         BUFFER_Close[i]=time[j+CambioHorarioCondicional]+((NewCloseTimeIndex-OpenTimeIndex)*(PeriodSeconds(PERIOD_H1)))-PeriodSeconds(PERIOD_CURRENT);

         //////////////////////////////////////////////////
         int shift=j-(NewCloseTimeIndex-NewOpenTimeIndex);

         if(PERIOD_CURRENT!=PERIOD_H1)
           {
            int kg=0;
            while(iTime(NULL,PERIOD_H1,kg)!=time[j])
              {
               kg++;
              }
            shift=kg-(NewCloseTimeIndex-NewOpenTimeIndex);
           }
         /////////////////////////////////////////////////

         if(i==0)
           {
            if(BUFFER_Close[0]<TimeCurrent())
              {
               BUFFER_High[0]=iHigh(NULL,PERIOD_H1,iHighest(Symbol(),PERIOD_H1,MODE_HIGH,NewCloseTimeIndex-NewOpenTimeIndex,shift+1+CambioHorarioCondicional));;
               BUFFER_Low[0]=iLow(NULL,PERIOD_H1,iLowest(Symbol(),PERIOD_H1,MODE_LOW,NewCloseTimeIndex-NewOpenTimeIndex,shift+1+CambioHorarioCondicional));
              }
           }
         else
           {
            BUFFER_High[i]=iHigh(NULL,PERIOD_H1,iHighest(Symbol(),PERIOD_H1,MODE_HIGH,NewCloseTimeIndex-NewOpenTimeIndex,shift+1+CambioHorarioCondicional));;
            BUFFER_Low[i]=iLow(NULL,PERIOD_H1,iLowest(Symbol(),PERIOD_H1,MODE_LOW,NewCloseTimeIndex-NewOpenTimeIndex,shift+1+CambioHorarioCondicional));
           }
         i++;
        }
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CondicionEvaluar(int CantidadDeCdros,int OpenTimeIndex,int CloseTimeIndex,int HoraActual)
  {
   if(CantidadDeCdros==1 && EstaDentroDelHorario(OpenTimeIndex,CloseTimeIndex,HoraActual)==false)
     {
      return false;
     }
   else
     {
      return true;
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CorrerPrograma(int Cantidad,int OpenTimeIndex,int CloseTimeIndex,int HoraActual,datetime &BUFFER_Open[],datetime &BUFFER_Close[],double &BUFFER_High[]
                    ,double &BUFFER_Low[],string NameSession,const datetime &time[],int const RATES_TOTAL,color ColorVisual, int LineaNivelSubwindow)
  {

   Draw_Tabulador(NameSession,OpenTimeIndex,ColorVisual);

   if(CondicionEvaluar(Cantidad,OpenTimeIndex,CloseTimeIndex,HoraActual))
     {

      ActualizarDatosTodosCdros(Cantidad,BUFFER_Open,BUFFER_Close,BUFFER_High,BUFFER_Low,CloseTimeIndex,OpenTimeIndex,time,NameSession,RATES_TOTAL);

      if(BUFFER_Close[0]>=TimeCurrent())
        {
         ActualizarDatos1erCdro(BUFFER_Open,BUFFER_High,BUFFER_Low);
        }

      if(EstaDentroDelHorario(OpenTimeIndex,CloseTimeIndex,HoraActual)==true)
        {
         Actualizar1erCuadro(NameSession,BUFFER_Open);
        }
      DrawTrends(Cantidad,BUFFER_Open,BUFFER_Close,BUFFER_High,BUFFER_Low,NameSession,ColorVisual,LineaNivelSubwindow);
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PropiedadesDeTrend(long chart_ID=0, string name="TrendLine",color clr=clrRed,const ENUM_LINE_STYLE style=STYLE_SOLID,
                        int width=1, bool back=false)
  {
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_LEFT,false);
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,false);
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,false);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,false);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CambioHorarioConIndiceGMT(int &Hora)
  {
   if(Hora<0)
     {
      Hora=24+Hora;
     }
   if(Hora>23)
     {
      Hora=Hora%24;
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime TiempoCalendarioRequerido(int Mes,int Day,int DayConteo,datetime TimeAEvaluar)
  {
   MqlDateTime EvaluaDiaCalendarioRequerido;
   datetime TimeActualAhora=TimeAEvaluar;
   TimeToStruct(TimeActualAhora,EvaluaDiaCalendarioRequerido);
   EvaluaDiaCalendarioRequerido.mon=Mes;
   EvaluaDiaCalendarioRequerido.day=1;
   EvaluaDiaCalendarioRequerido.hour=0;
   EvaluaDiaCalendarioRequerido.min=0;
   EvaluaDiaCalendarioRequerido.sec=0;
   TimeActualAhora=StructToTime(EvaluaDiaCalendarioRequerido);
   TimeToStruct(TimeActualAhora,EvaluaDiaCalendarioRequerido);

   int DiaRequerido=0;

   for(int days=1; days<32; days++)
     {
      EvaluaDiaCalendarioRequerido.day=days;
      if(days>1)
        {
         int ValorDayOfWeek=EvaluaDiaCalendarioRequerido.day_of_week;
         ValorDayOfWeek++;
         EvaluaDiaCalendarioRequerido.day_of_week=ValorDayOfWeek%7;
        }

      if(EvaluaDiaCalendarioRequerido.day_of_week==Day)
        {
         DiaRequerido++;
        }

      if(DiaRequerido==DayConteo)
        {
         datetime TiempoRequerido=StructToTime(EvaluaDiaCalendarioRequerido);
         return TiempoRequerido;
        }
     }

   return TimeCurrent();
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CambiodeHorarioInvierno(int MesInicioVerano,int DiaInicioVerano,int OrdinalDelMesDiaInicioVerano,
                             int MesFinalVerano,int DiaFinalVerano, int OrdinalDelMesDiaFinalVerano,
                             int &HoraOpen, int &HoraClose, datetime TimeEvaluar, int HoraOpenVerano
                             ,int HoraCloseVerano)
  {

   if(TiempoCalendarioRequerido(MesInicioVerano,DiaInicioVerano,OrdinalDelMesDiaInicioVerano,TimeEvaluar)>TimeEvaluar
      || TiempoCalendarioRequerido(MesFinalVerano,DiaFinalVerano,OrdinalDelMesDiaFinalVerano,TimeEvaluar)<TimeEvaluar)
     {

      HoraOpen=HoraOpenVerano+1;
      CambioHorarioConIndiceGMT(HoraOpen);
      HoraClose=HoraCloseVerano+1;
      CambioHorarioConIndiceGMT(HoraClose);
      return true;
     }
   else
     {
      HoraOpen =HoraOpenVerano;
      HoraClose=HoraCloseVerano;
      return false;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Draw_Tabulador(string NameSession,int OpenTimeIndex,color ColorTabulador)
  {

   string NameTabulador="TABULADOR "+NameSession;
   if(ObjectFind(0,NameTabulador)<0)
     {
      datetime TIME_TABULADOR=TimeCurrent();
      MqlDateTime Tabulador;
      TimeToStruct(TIME_TABULADOR,Tabulador);

      if(Tabulador.hour>=OpenTimeIndex)
        {
         TIME_TABULADOR=TIME_TABULADOR+PeriodSeconds(PERIOD_D1);
        }
      TimeToStruct(TIME_TABULADOR,Tabulador);
      Tabulador.hour=OpenTimeIndex;
      Tabulador.min=0;
      Tabulador.sec=0;
      TIME_TABULADOR=StructToTime(Tabulador);


      //Print(TimeToString(TIME_TABULADOR));
      if(ObjectCreate(0,NameTabulador,OBJ_VLINE,0,TIME_TABULADOR,0))
        {
         PropiedadesDeVLine(0,NameTabulador,ColorTabulador,StyleTabulador,WidthTabulador,false);
        }
     }
   else
     {
      datetime tab=(datetime)ObjectGetInteger(ChartID(),NameTabulador,OBJPROP_TIME,0);

      if(TimeCurrent()>=tab)
        {
         ObjectDelete(0,NameTabulador);
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PropiedadesText(const long         chart_ID=0,               // ID del gráfico
                     const string            name="Text",              // nombre del objeto
                     const int               sub_window=0,             // número de subventana
                     const string            text="Text",              // el texto
                     const string            font="Arial",             // fuente
                     const int               font_size=10,             // tamaño de la fuente
                     const color             clr=clrRed,               // color
                     const double            angle=0.0,                // inclinación del texto
                     const bool              back=false,               // al fondo
                     const bool              selection=false,          // seleccionar para mover
                     const bool              hidden=true,              // ocultar en la lista de objetos
                     const long              z_order=0)                // prioridad para el clic del ratón
  {
//--- ponemos el texto
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- establecemos la fuente del texto
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- establecemos el tamaño del texto
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- establecemos el color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de desplazamiento del texto con ratón
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- ocultamos (true) o mostramos (false) el nombre del objeto gráfico en la lista de objetos
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PropiedadesDeVLine(long chart_ID=0, string name="TABULADOR ",color clr=clrRed,const ENUM_LINE_STYLE style=STYLE_SOLID,
                        int width=1, bool back=false)
  {
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_LEFT,false);
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,false);
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,false);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,false);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CheckLoadHistory(string symbol,ENUM_TIMEFRAMES period,datetime start_date)
  {
   datetime first_date=0;
   datetime times[100];
//--- check symbol & period
   if(symbol==NULL || symbol=="")
      symbol=Symbol();
   if(period==PERIOD_CURRENT)
      period=Period();
//--- check if symbol is selected in the MarketWatch
   if(!SymbolInfoInteger(symbol,SYMBOL_SELECT))
     {
      if(GetLastError()==ERR_MARKET_UNKNOWN_SYMBOL)
         return(-1);
      SymbolSelect(symbol,true);
     }
//--- check if data is present
   SeriesInfoInteger(symbol,period,SERIES_FIRSTDATE,first_date);
   if(first_date>0 && first_date<=start_date)
      return(1);
//--- don't ask for load of its own data if it is an indicator
   if(MQL5InfoInteger(MQL5_PROGRAM_TYPE)==PROGRAM_INDICATOR && Period()==period && Symbol()==symbol)
      return(-4);
//--- second attempt
   if(SeriesInfoInteger(symbol,PERIOD_M1,SERIES_TERMINAL_FIRSTDATE,first_date))
     {
      //--- there is loaded data to build timeseries
      if(first_date>0)
        {
         //--- force timeseries build
         CopyTime(symbol,period,first_date+PeriodSeconds(period),1,times);
         //--- check date
         if(SeriesInfoInteger(symbol,period,SERIES_FIRSTDATE,first_date))
            if(first_date>0 && first_date<=start_date)
               return(2);
        }
     }
//--- max bars in chart from terminal options
   int max_bars=TerminalInfoInteger(TERMINAL_MAXBARS);
//--- load symbol history info
   datetime first_server_date=0;
   while(!SeriesInfoInteger(symbol,PERIOD_M1,SERIES_SERVER_FIRSTDATE,first_server_date) && !IsStopped())
      Sleep(5);
//--- fix start date for loading
   if(first_server_date>start_date)
      start_date=first_server_date;
   if(first_date>0 && first_date<first_server_date)
      Print("Warning: first server date ",first_server_date,
            " for ",symbol," does not match to first series date ",first_date);
//--- load data step by step
   int fail_cnt=0;
   while(!IsStopped())
     {
      //--- wait for timeseries build
      while(!SeriesInfoInteger(symbol,period,SERIES_SYNCHRONIZED) && !IsStopped())
         Sleep(5);
      //--- ask for built bars
      int bars=Bars(symbol,period);
      if(bars>0)
        {
         if(bars>=max_bars)
            return(-2);
         //--- ask for first date
         if(SeriesInfoInteger(symbol,period,SERIES_FIRSTDATE,first_date))
            if(first_date>0 && first_date<=start_date)
               return(0);
        }
      //--- copying of next part forces data loading
      int copied=CopyTime(symbol,period,bars,100,times);
      if(copied>0)
        {
         //--- check for data
         if(times[0]<=start_date)
            return(0);
         if(bars+copied>=max_bars)
            return(-2);
         fail_cnt=0;
        }
      else
        {
         //--- no more than 100 failed attempts
         fail_cnt++;
         if(fail_cnt>=100)
            return(-5);
         Sleep(10);
        }
     }
//--- stopped
   return(-3);
  }
//+------------------------------------------------------------------+
//| devuelve a la cadena valor del período                           |
//+------------------------------------------------------------------+
string GetPeriodName(ENUM_TIMEFRAMES period)
  {
   if(period==PERIOD_CURRENT)
      period=Period();
//---
   switch(period)
     {
      case PERIOD_M1:
         return("M1");
      case PERIOD_M2:
         return("M2");
      case PERIOD_M3:
         return("M3");
      case PERIOD_M4:
         return("M4");
      case PERIOD_M5:
         return("M5");
      case PERIOD_M6:
         return("M6");
      case PERIOD_M10:
         return("M10");
      case PERIOD_M12:
         return("M12");
      case PERIOD_M15:
         return("M15");
      case PERIOD_M20:
         return("M20");
      case PERIOD_M30:
         return("M30");
      case PERIOD_H1:
         return("H1");
      case PERIOD_H2:
         return("H2");
      case PERIOD_H3:
         return("H3");
      case PERIOD_H4:
         return("H4");
      case PERIOD_H6:
         return("H6");
      case PERIOD_H8:
         return("H8");
      case PERIOD_H12:
         return("H12");
      case PERIOD_D1:
         return("Daily");
      case PERIOD_W1:
         return("Weekly");
      case PERIOD_MN1:
         return("Monthly");
     }
//---
   return("unknown period");
  }


//+------------------------------------------------------------------+
