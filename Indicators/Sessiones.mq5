//+------------------------------------------------------------------+
//|                                                    Sessiones.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window

enum GMT_VALUES
  {
   minus_11=-11,//GMT -11:00
   minus_10=-10,//GMT -10:00
   minus_9=-9,//GMT -09:00
   minus_8=-8,//GMT -08:00
   minus_7=-7,//GMT -07:00
   minus_6=-6,//GMT -06:00
   minus_5=-5,//GMT -05:00
   minus_4=-4,//GMT -04:00
   minus_3=-3,//GMT -03:00
   minus_2=-2,//GMT -02:00
   minus_1=-1,//GMT -01:00
   central_0=-0,//GMT Coordinate Universal Time
   plus_1=1,//GMT 01:00
   plus_2=2,//GMT 02:00
   plus_3=3,//GMT 03:00
   plus_4=4,//GMT 04:00
   plus_5=5,//GMT 05:00
   plus_6=6,//GMT 06:00
   plus_7=7,//GMT 07:00
   plus_8=8,//GMT 08:00
   plus_9=9,//GMT 09:00
   plus_10=10,//GMT 10:00
   plus_11=11,//GMT 11:00
   plus_12=12,//GMT 12:00
   plus_13=13,//GMT 13:00
  };

enum ENUM_Horas
  {
   _0am = 0,   //:  0 am
   _1am = 1,   //:  1 am
   _2am = 2,   //:  2 am
   _3am = 3,   //:  3 am
   _4am = 4,   //:  4 am
   _5am = 5,   //:  5 am
   _6am = 6,   //:  6 am
   _7am = 7,   //:  7 am
   _8am = 8,   //:  8 am
   _9am = 9,   //:  9 am
   _10am = 10, //: 10 am
   _11am = 11, //: 11 am
   _12pm = 12, //: 12 pm
   _1pm = 13,  //:  1 pm
   _2pm = 14,  //:  2 pm
   _3pm = 15,  //:  3 pm
   _4pm = 16,  //:  4 pm
   _5pm = 17,  //:  5 pm
   _6pm = 18,  //:  6 pm
   _7pm = 19,  //:  7 pm
   _8pm = 20,  //:  8 pm
   _9pm = 21,  //:  9 pm
   _10pm = 22, //:  10 pm
   _11pm = 23, //:  11 pm
  };


input bool NewYork=true;//New York
input bool Londres=true;//London
input bool Sidney=true;//Sidney
input bool Tokio=true;//Tokyo
input string S1="===== Colors =====";//====================================================
input color color_NY=clrGray;//color New York
input color color_LO=clrMagenta;//color London
input color color_SI=clrAqua;//color Sidney
input color color_TO=clrYellow;//color Tokyo
input string S2="===== Personalized =====";//====================================================
input bool Personalized=false;
input GMT_VALUES GMT=minus_5;
input ENUM_Horas hourStart=10;
input ENUM_Horas hourEnd=5;
input color color_PE=clrWhite;//color Personalized
input string name_Personalized="PERSONALIZED";
input string S3="===== Conf Rectangle =====";//====================================================
input bool view=true;
input bool fill_=false;//fill
input uint lineWidth=1;
input ENUM_LINE_STYLE lineStyle=STYLE_SOLID;

#define  NAME_AMERICAN "NEW YORK"
#define  GMT_PRINCIPAL_AMERICAN -5
#define  GMT_VERANO_AMERICAN -4
#define  DIA_INICIO_SEMANA_VERANO_AMERICAN 0//(0 es domingo 1 2 3 4 5 6)
#define  DIA_INICIO_CARDINAL_SEMANA_AMERICAN 2//es el numero que indica el numero de posicion del mes, por ejemplo (primer 1) domingo del mes
#define  MES_INICIO_VERANO_AMERICAN 3
#define  HORA_INICIO_VERANO_AMERICAN 2
#define  DIA_FINAL_SEMANA_VERANO_AMERICAN 0//(0 es domingo 1 2 3 4 5 6)
#define  DIA_FINAL_CARDINAL_SEMANA_AMERICAN 1//es el numero que indica el numero de posicion del mes, por ejemplo (primer 1) domingo del mes
#define  MES_FINAL_VERANO_AMERICAN 11
#define  HORA_FINAL_VERANO_AMERICAN 2

#define  NAME_EUROPEAN "LONDON"
#define  GMT_PRINCIPAL_EUROPEAN 0
#define  GMT_VERANO_EUROPEAN 1
#define  DIA_INICIO_SEMANA_VERANO_EUROPEAN 0//(0 es domingo 1 2 3 4 5 6)
#define  DIA_INICIO_CARDINAL_SEMANA_EUROPEAN 0//es el numero que indica el numero de posicion del mes, por ejemplo (primer 1) domingo del mes
#define  MES_INICIO_VERANO_EUROPEAN 3
#define  HORA_INICIO_VERANO_EUROPEAN 1
#define  DIA_FINAL_SEMANA_VERANO_EUROPEAN 0//(0 es domingo 1 2 3 4 5 6)
#define  DIA_FINAL_CARDINAL_SEMANA_EUROPEAN 0//es el numero que indica el numero de posicion del mes, por ejemplo (primer 1) domingo del mes
#define  MES_FINAL_VERANO_EUROPEAN 10
#define  HORA_FINAL_VERANO_EUROPEAN 2

#define  NAME_AUSTRALIAN "SIDNEY"
#define  GMT_PRINCIPAL_AUSTRALIAN 10
#define  GMT_VERANO_AUSTRALIAN 11
#define  DIA_INICIO_SEMANA_VERANO_AUSTRALIAN 0//(0 es domingo 1 2 3 4 5 6)
#define  DIA_INICIO_CARDINAL_SEMANA_AUSTRALIAN 1//es el numero que indica el numero de posicion del mes, por ejemplo (primer 1) domingo del mes
#define  MES_INICIO_VERANO_AUSTRALIAN 10
#define  HORA_INICIO_VERANO_AUSTRALIAN 2
#define  DIA_FINAL_SEMANA_VERANO_AUSTRALIAN 0//(0 es domingo 1 2 3 4 5 6)
#define  DIA_FINAL_CARDINAL_SEMANA_AUSTRALIAN 1//es el numero que indica el numero de posicion del mes, por ejemplo (primer 1) domingo del mes
#define  MES_FINAL_VERANO_AUSTRALIAN 4
#define  HORA_FINAL_VERANO_AUSTRALIAN 3

#define  NAME_ASIAN "TOKYO"
#define  GMT_PRINCIPAL_ASIAN 9

#property indicator_buffers 5
#property indicator_plots   5

//--- las propiedades de la línea están establecidas por medio de las directivas del compilador
#property indicator_label1  NAME_AMERICAN      // nombre de la construcción para la "Ventana de datos" 
#property indicator_type1   DRAW_LINE   // tipo de construcción gráfica - una línea 
#property indicator_color1  clrRed      // color de la línea 
#property indicator_style1  STYLE_SOLID // estilo de la línea 
#property indicator_width1  2           // grosor de la línea 

#property indicator_label2  NAME_EUROPEAN      // nombre de la construcción para la "Ventana de datos" 
#property indicator_type2  DRAW_LINE   // tipo de construcción gráfica - una línea 
#property indicator_color2  clrMagenta      // color de la línea 
#property indicator_style2  STYLE_SOLID // estilo de la línea 
#property indicator_width2  2           // grosor de la línea 

#property indicator_label3  NAME_AUSTRALIAN      // nombre de la construcción para la "Ventana de datos" 
#property indicator_type3   DRAW_LINE   // tipo de construcción gráfica - una línea 
#property indicator_color3  clrAqua     // color de la línea 
#property indicator_style3  STYLE_SOLID // estilo de la línea 
#property indicator_width3  2           // grosor de la línea 

#property indicator_label4  NAME_ASIAN      // nombre de la construcción para la "Ventana de datos" 
#property indicator_type4   DRAW_LINE   // tipo de construcción gráfica - una línea 
#property indicator_color4  clrYellow      // color de la línea 
#property indicator_style4  STYLE_SOLID // estilo de la línea 
#property indicator_width4  2           // grosor de la línea 

#property indicator_label5  "PERSONALIZED"      // nombre de la construcción para la "Ventana de datos" 
#property indicator_type5   DRAW_LINE   // tipo de construcción gráfica - una línea 
#property indicator_color5  clrWhite     // color de la línea 
#property indicator_style5  STYLE_SOLID // estilo de la línea 
#property indicator_width5  2           // grosor de la línea 

double         LineNY[];
double         LineLO[];
double         LineSI[];
double         LineTO[];
double         LinePE[];

struct Horario
  {
   datetime          timeStart;
   datetime          timeEnd;
   int               value;
   datetime          timeStartVerano;
   datetime          timeEndVerano;
   int               GMT_Verano;
   int               GMT_Principal;
   bool              cambioLinea;
   string            name;
   color             color_session;
   int               num_textos;
   int               num_cuadros;
   int               hour_start;
   int               hour_end;
  };

Horario horarios[];

int Year=0;
string subFixLines="V Lines Horarios ";
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   SetHorarios();
//--- vinculación del array con el búfer indicador
   SetIndexBuffer(0,LineNY,INDICATOR_DATA);
   SetIndexBuffer(1,LineLO,INDICATOR_DATA);
   SetIndexBuffer(2,LineSI,INDICATOR_DATA);
   SetIndexBuffer(3,LineTO,INDICATOR_DATA);
   SetIndexBuffer(4,LinePE,INDICATOR_DATA);

   PlotIndexSetInteger(0,PLOT_LINE_COLOR,color_NY);
   PlotIndexSetInteger(1,PLOT_LINE_COLOR,color_LO);
   PlotIndexSetInteger(2,PLOT_LINE_COLOR,color_SI);
   PlotIndexSetInteger(3,PLOT_LINE_COLOR,color_TO);
   PlotIndexSetInteger(4,PLOT_LINE_COLOR,color_PE);

   PlotIndexSetString(4,PLOT_LABEL,name_Personalized);

   ArrayInitialize(LineNY,EMPTY_VALUE);
   ArrayInitialize(LineLO,EMPTY_VALUE);
   ArrayInitialize(LineSI,EMPTY_VALUE);
   ArrayInitialize(LineTO,EMPTY_VALUE);
   ArrayInitialize(LinePE,EMPTY_VALUE);

   IndicatorSetDouble(INDICATOR_MAXIMUM,ArraySize(horarios)+1);
   IndicatorSetDouble(INDICATOR_MINIMUM,0);
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

   if(prev_calculated==0)
     {
      ObjectsDeleteAll(0,subFixLines,-1,-1);
      Year=0;
      SetHorarios();
     }

   for(int i=MathMax(2,MathMin(prev_calculated,rates_total-1)); i<rates_total; i++)
     {
      if(prev_calculated!=rates_total)
        {
         LineNY[i]=EMPTY_VALUE;
         LineLO[i]=EMPTY_VALUE;
         LineSI[i]=EMPTY_VALUE;
         LineTO[i]=EMPTY_VALUE;
         LinePE[i]=EMPTY_VALUE;

         if(PeriodSeconds(Period())>PeriodSeconds(PERIOD_H1))
            continue;

         SetYearHorario(time[i]);

         for(int j=0; j<ArraySize(horarios); j++)
           {
            EliminarTextoCuadroIncorrecto(horarios[j],time[i]);
            SetLineHorario(horarios[j],time,open[i],i);
            CreateRectangles(horarios[j],i,low[i],high[i],time[i]);

            if(i==rates_total-1)
              {
               SetVLine(horarios[j]);
               OcultarVLine(horarios[j],time[i]);
              }
           }
        }

      for(int j=0; j<ArraySize(horarios); j++)
         ModifyRectanglesValues(horarios[j],high[i],low[i],time[i]);
     }

   ChartRedraw();
//--- volveremos el valor prev_calculated para la siguiente llamada de la función
   return(rates_total);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,subFixLines,-1,-1);
  }
//+------------------------------------------------------------------+
void SetLineHorario(Horario &horario,datetime const &time[],double open,int shift)
  {
   if(horario.timeStart==0 || time[shift]>horario.timeEnd)
     {
      datetime startLast=horario.timeStart;
      datetime endLast=horario.timeEnd;

      horario.cambioLinea=true;

      int DST=TimeDaylightSavings();
      int GMT_=int(TimeTradeServer()-TimeGMT());

      GMT_=GMT_/3600;
      if(DST!=0)
         GMT_=GMT_-(DST/3600);

      int horaend=horario.hour_end-1;
      horaend=horaend<0?23:horaend;

      MqlDateTime structStart,structEnd;
      TimeToStruct(time[shift],structStart);
      TimeToStruct(time[shift],structEnd);
      structStart.hour=horario.hour_start;
      structStart.min=0;
      structStart.sec=0;
      structEnd.hour=horaend;
      structEnd.min=59;
      structEnd.sec=0;

      int desfaseHoras=(horario.GMT_Principal==horario.GMT_Verano || !(horario.timeStartVerano<horario.timeEndVerano?
                        (horario.timeStartVerano<=time[shift] && time[shift]<=horario.timeEndVerano):
                        (horario.timeStartVerano<=time[shift] || time[shift]<=horario.timeEndVerano)))
                       ?horario.GMT_Principal:horario.GMT_Verano;

      //  Print(desfaseHoras==horario.GMT_Principal,"   ",horario.timeEndVerano);

      desfaseHoras=GMT_-desfaseHoras;

      horario.timeStart=StructToTime(structStart)+PeriodSeconds(PERIOD_H1)*desfaseHoras;
      horario.timeEnd=StructToTime(structEnd)+PeriodSeconds(PERIOD_H1)*desfaseHoras;

      if(horario.timeStart==startLast)
        {
         horario.timeStart=horario.timeStart+PeriodSeconds(PERIOD_D1);
         horario.timeEnd=horario.timeEnd+PeriodSeconds(PERIOD_D1);
        }

      if(horario.timeStart>horario.timeEnd)
         horario.timeEnd=horario.timeEnd+PeriodSeconds(PERIOD_D1);

      if(TimeCurrent()-15*PeriodSeconds(PERIOD_D1)<=time[shift])
         SetText(horario,open);
     }

   if(horario.timeStart<= time[shift] && time[shift]<horario.timeEnd)
     {
      if(horario.name==NAME_AMERICAN)
         LineNY[shift]=horario.value;
      else
         if(horario.name==NAME_EUROPEAN)
            LineLO[shift]=horario.value;
         else
            if(horario.name==NAME_AUSTRALIAN)
               LineSI[shift]=horario.value;
            else
               if(horario.name==NAME_ASIAN)
                  LineTO[shift]=horario.value;
               else
                  LinePE[shift]=horario.value;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CreateRectangles(Horario &horario,int shift,double low,double high,datetime time)
  {
   if(!(TimeCurrent()-15*PeriodSeconds(PERIOD_D1)<=time))
      return;

   bool cambioCuadro=false;

   if(horario.name==NAME_AMERICAN)
      cambioCuadro=(LineNY[shift-1]==EMPTY_VALUE && LineNY[shift]!=EMPTY_VALUE);
   else
      if(horario.name==NAME_EUROPEAN)
         cambioCuadro=(LineLO[shift-1]==EMPTY_VALUE && LineLO[shift]!=EMPTY_VALUE);
      else
         if(horario.name==NAME_AUSTRALIAN)
            cambioCuadro=(LineSI[shift-1]==EMPTY_VALUE && LineSI[shift]!=EMPTY_VALUE);
         else
            if(horario.name==NAME_ASIAN)
               cambioCuadro=(LineTO[shift-1]==EMPTY_VALUE && LineTO[shift]!=EMPTY_VALUE);
            else
               cambioCuadro=(LinePE[shift-1]==EMPTY_VALUE && LinePE[shift]!=EMPTY_VALUE);

   if(cambioCuadro)
     {
      horario.num_cuadros++;
      horario.num_cuadros=horario.num_cuadros%15;
      string nameLineRectangle=subFixLines+horario.name+"nameRectangle"+IntegerToString(horario.num_cuadros);

      if(view && horario.timeStart<=time)
        {
         if(ObjectFind(0,nameLineRectangle)!=0)
            RectangleCreate(0,nameLineRectangle,0,horario.timeStart,low,horario.timeEnd,high,horario.color_session,lineStyle,lineWidth,fill_,false,false,true,0);
         else
           {
            ObjectSetInteger(0,nameLineRectangle,OBJPROP_TIME,0,horario.timeStart);
            ObjectSetInteger(0,nameLineRectangle,OBJPROP_TIME,1,horario.timeEnd);
            ObjectSetDouble(0,nameLineRectangle,OBJPROP_PRICE,0,low);
            ObjectSetDouble(0,nameLineRectangle,OBJPROP_PRICE,1,high);
           }
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetYearHorario(datetime time)
  {
   MqlDateTime timeEvalua;
   TimeToStruct(time,timeEvalua);
   if(Year==0 || timeEvalua.year!=Year)
     {
      for(int i=0; i<ArraySize(horarios); i++)
        {
         if(horarios[i].name==NAME_AMERICAN)
           {
            Obtener_DayOfWeek_X(DIA_INICIO_SEMANA_VERANO_AMERICAN, DIA_INICIO_CARDINAL_SEMANA_AMERICAN, horarios[i].timeStartVerano, timeEvalua.year, MES_INICIO_VERANO_AMERICAN, HORA_INICIO_VERANO_AMERICAN);
            Obtener_DayOfWeek_X(DIA_FINAL_SEMANA_VERANO_AMERICAN, DIA_FINAL_CARDINAL_SEMANA_AMERICAN, horarios[i].timeEndVerano, timeEvalua.year, MES_FINAL_VERANO_AMERICAN, HORA_FINAL_VERANO_AMERICAN);
           }
         if(horarios[i].name==NAME_EUROPEAN)
           {
            Obtener_DayOfWeek_X(DIA_INICIO_SEMANA_VERANO_EUROPEAN, DIA_INICIO_CARDINAL_SEMANA_EUROPEAN, horarios[i].timeStartVerano, timeEvalua.year, MES_INICIO_VERANO_EUROPEAN, HORA_INICIO_VERANO_EUROPEAN);
            Obtener_DayOfWeek_X(DIA_FINAL_SEMANA_VERANO_EUROPEAN, DIA_FINAL_CARDINAL_SEMANA_EUROPEAN,horarios[i].timeEndVerano, timeEvalua.year,MES_FINAL_VERANO_EUROPEAN, HORA_FINAL_VERANO_EUROPEAN);
           }
         if(horarios[i].name==NAME_AUSTRALIAN)
           {
            Obtener_DayOfWeek_X(DIA_INICIO_SEMANA_VERANO_AUSTRALIAN, DIA_INICIO_CARDINAL_SEMANA_AUSTRALIAN, horarios[i].timeStartVerano, timeEvalua.year,MES_INICIO_VERANO_AUSTRALIAN, HORA_INICIO_VERANO_AUSTRALIAN);
            Obtener_DayOfWeek_X(DIA_FINAL_SEMANA_VERANO_AUSTRALIAN, DIA_FINAL_CARDINAL_SEMANA_AUSTRALIAN, horarios[i].timeEndVerano, timeEvalua.year, MES_FINAL_VERANO_AUSTRALIAN, HORA_FINAL_VERANO_AUSTRALIAN);
           }
        }

      Year=timeEvalua.year;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetHorarios()
  {
   ArrayResize(horarios,0);

   if(Personalized)
     {
      int size=ArraySize(horarios);
      ArrayResize(horarios,size+1);
      horarios[size].timeStart=0;
      horarios[size].timeEnd=0;
      horarios[size].timeStartVerano=0;
      horarios[size].timeEndVerano=0;
      horarios[size].GMT_Verano=GMT;
      horarios[size].GMT_Principal=GMT;
      horarios[size].value=size+1;
      horarios[size].name=name_Personalized;
      horarios[size].color_session=color_PE;
      horarios[size].num_textos=0;
      horarios[size].num_cuadros=0;
      horarios[size].hour_start=hourStart;
      horarios[size].hour_end=hourEnd;
     }

   if(NewYork)
     {
      int size=ArraySize(horarios);
      ArrayResize(horarios,size+1);
      horarios[size].timeStart=0;
      horarios[size].timeEnd=0;
      horarios[size].timeStartVerano=0;
      horarios[size].timeEndVerano=0;
      horarios[size].GMT_Verano=GMT_VERANO_AMERICAN;
      horarios[size].GMT_Principal=GMT_PRINCIPAL_AMERICAN;
      horarios[size].value=size+1;
      horarios[size].name=NAME_AMERICAN;
      horarios[size].color_session=color_NY;
      horarios[size].num_textos=0;
      horarios[size].num_cuadros=0;
      horarios[size].hour_start=8;
      horarios[size].hour_end=17;
     }

   if(Londres)
     {
      int size=ArraySize(horarios);
      ArrayResize(horarios,size+1);
      horarios[size].timeStart=0;
      horarios[size].timeEnd=0;
      horarios[size].timeStartVerano=0;
      horarios[size].timeEndVerano=0;
      horarios[size].GMT_Verano=GMT_VERANO_EUROPEAN;
      horarios[size].GMT_Principal=GMT_VERANO_EUROPEAN;
      horarios[size].value=size+1;
      horarios[size].name=NAME_EUROPEAN;
      horarios[size].color_session=color_LO;
      horarios[size].num_textos=0;
      horarios[size].num_cuadros=0;
      horarios[size].hour_start=8;
      horarios[size].hour_end=17;
     }

   if(Sidney)
     {
      int size=ArraySize(horarios);
      ArrayResize(horarios,size+1);
      horarios[size].timeStart=0;
      horarios[size].timeEnd=0;
      horarios[size].timeStartVerano=0;
      horarios[size].timeEndVerano=0;
      horarios[size].GMT_Verano=GMT_VERANO_AUSTRALIAN;
      horarios[size].GMT_Principal=GMT_PRINCIPAL_AUSTRALIAN;
      horarios[size].value=size+1;
      horarios[size].name=NAME_AUSTRALIAN;
      horarios[size].color_session=color_SI;
      horarios[size].num_textos=0;
      horarios[size].num_cuadros=0;
      horarios[size].hour_start=8;
      horarios[size].hour_end=17;
     }

   if(Tokio)
     {
      int size=ArraySize(horarios);
      ArrayResize(horarios,size+1);
      horarios[size].timeStart=0;
      horarios[size].timeEnd=0;
      horarios[size].timeStartVerano=0;
      horarios[size].timeEndVerano=0;
      horarios[size].GMT_Verano=GMT_PRINCIPAL_ASIAN;
      horarios[size].GMT_Principal=GMT_PRINCIPAL_ASIAN;
      horarios[size].value=size+1;
      horarios[size].name=NAME_ASIAN;
      horarios[size].color_session=color_TO;
      horarios[size].num_textos=0;
      horarios[size].num_cuadros=0;
      horarios[size].hour_start=8;
      horarios[size].hour_end=17;
     }
  }
//+------------------------------------------------------------------+


bool Obtener_DayOfWeek_X(uint dayOfWeek/*Cardinal*/,uint cardinalDay/*ULTIMO= 0*/,datetime &resultTimeDay,uint year,uint mes,uint hora=0,uint minuto=0,uint segundos=0)
  {
// (0 means Sunday,1,2,3,4,5,6)
   if(dayOfWeek>6)
      return false;

   string dayTime;
   StringConcatenate(dayTime,IntegerToString(year),".",GetClockNumberFormat(mes),".",GetClockNumberFormat(1)
                     ," ",GetClockNumberFormat(hora),":",GetClockNumberFormat(minuto),":",GetClockNumberFormat(segundos));

   datetime timeEvaluaDayDatetime=StringToTime(dayTime);

   if(timeEvaluaDayDatetime==TimeLocal())
      return false;

   int dia =1;
   int diaDeLaSemana = 0;
   int suma=1;

   MqlDateTime timeEvaluaDay;
   TimeToStruct(timeEvaluaDayDatetime,timeEvaluaDay);

   while(mes == timeEvaluaDay.mon)
     {
      if(timeEvaluaDay.day_of_week == dayOfWeek)  // 0 representa el domingo
        {
         diaDeLaSemana++;
         resultTimeDay=StructToTime(timeEvaluaDay);

         if(diaDeLaSemana == cardinalDay)
            return true;
         suma=7;
        }
      dia+=suma;
      timeEvaluaDayDatetime=StructToTime(timeEvaluaDay);
      timeEvaluaDayDatetime+=PeriodSeconds(PERIOD_D1);
      TimeToStruct(timeEvaluaDayDatetime,timeEvaluaDay);
     }

   if(cardinalDay!=0)
     {
      Print("No encontro");
      return false;
     }

   return true; // No se encontró el x-ésimo domingo en el mes y año dados
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string GetClockNumberFormat(int value)
  {
   string formatClockNumber=value<10?("0"+IntegerToString(value)):IntegerToString(value);
   return formatClockNumber;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetVLine(Horario &horario)
  {
   if(horario.cambioLinea)
     {
      string nameLine=subFixLines+horario.name;
      string nameLineTrend=subFixLines+horario.name+"TREND";

      if(ObjectFind(0,nameLine)!=0)
         VLineCreate(0,nameLine,0,horario.timeStart,horario.color_session,STYLE_DASHDOT,1,false,false,true,true,0);
      else
         ObjectSetInteger(0,nameLine,OBJPROP_TIME,0,horario.timeStart);

      int subWindow=(MQLInfoInteger(MQL_TESTER))?1:(int)ChartGetInteger(0, CHART_WINDOW_IS_VISIBLE, 0);

      if(ObjectFind(0,nameLineTrend)!=subWindow)
         TrendCreate(0,nameLineTrend,subWindow,horario.timeStart,horario.value,horario.timeEnd,horario.value,horario.color_session,STYLE_DOT,1,false,false,false,false,true,0);
      else
        {
         datetime tiempo=(datetime)ObjectGetInteger(0,nameLineTrend,OBJPROP_TIME,0);
         if(horario.timeStart>tiempo)
           {
            ObjectSetInteger(0,nameLineTrend,OBJPROP_TIME,0,horario.timeStart);
            ObjectSetInteger(0,nameLineTrend,OBJPROP_TIME,1,horario.timeEnd);
           }
        }
      horario.cambioLinea=false;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetText(Horario &horario,double open)
  {
   horario.num_textos++;
   horario.num_textos=(horario.num_textos%15);

   string nameLineText=subFixLines+horario.name+"name"+IntegerToString(horario.num_textos);

   int subWindow=(MQLInfoInteger(MQL_TESTER))?1:(int)ChartGetInteger(0, CHART_WINDOW_IS_VISIBLE, 0);
   if(ObjectFind(0,nameLineText)!=subWindow)
      TextCreate(0,nameLineText,subWindow,horario.timeStart,horario.value,horario.name,"Arial",10,horario.color_session,0,ANCHOR_LEFT_LOWER,false,false,true,0);
   else
      ObjectSetInteger(0,nameLineText,OBJPROP_TIME,0,horario.timeStart);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void EliminarTextoCuadroIncorrecto(Horario &horario,datetime time)
  {
   if(!(TimeCurrent()-15*PeriodSeconds(PERIOD_D1)<=time))
      return;

   string nameLineText=subFixLines+horario.name+"name"+IntegerToString(horario.num_textos);
   string nameLineRectangle=subFixLines+horario.name+"nameRectangle"+IntegerToString(horario.num_textos);

   int subWindow=(MQLInfoInteger(MQL_TESTER))?1:(int)ChartGetInteger(0, CHART_WINDOW_IS_VISIBLE, 0);

   if(ObjectFind(0,nameLineText)==subWindow)
     {
      datetime tiempo=(datetime)ObjectGetInteger(0,nameLineText,OBJPROP_TIME,0);
      if(tiempo<time)
        {
         if(iBarShift(Symbol(),PERIOD_CURRENT,tiempo,true)==-1)
           {
            ObjectDelete(0,nameLineText);
            //   if(ObjectFind(0,nameLineRectangle)==0)
            //    ObjectDelete(0,nameLineRectangle);
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ModifyRectanglesValues(Horario &horario,double high,double low,datetime time)
  {
   if(!(TimeCurrent()-15*PeriodSeconds(PERIOD_D1)<=time))
      return;

   string nameLineRectangle=subFixLines+horario.name+"nameRectangle"+IntegerToString(horario.num_cuadros);

   if(view && horario.timeStart<=time)
     {
      if(ObjectFind(0,nameLineRectangle)==0)
        {
         ObjectSetInteger(0,nameLineRectangle,OBJPROP_TIME,1,horario.timeEnd);
         if(low<ObjectGetDouble(0,nameLineRectangle,OBJPROP_PRICE,0))
            ObjectSetDouble(0,nameLineRectangle,OBJPROP_PRICE,0,low);
         if(high>ObjectGetDouble(0,nameLineRectangle,OBJPROP_PRICE,1))
            ObjectSetDouble(0,nameLineRectangle,OBJPROP_PRICE,1,high);
        }
     }

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OcultarVLine(Horario &horario,datetime time)
  {
   string nameLine=subFixLines+horario.name;
   datetime tiempo=(datetime)ObjectGetInteger(0,nameLine,OBJPROP_TIME,0);

   if(tiempo<=time)
     {
      if(ObjectFind(0,nameLine)==0)
         ObjectSetInteger(0,nameLine,OBJPROP_COLOR,0,clrNONE);
     }
   else
      if(ObjectFind(0,nameLine)==0)
         ObjectSetInteger(0,nameLine,OBJPROP_COLOR,0,horario.color_session);

  }

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
   if(!time)
      time=TimeCurrent();
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
//--- ejecución con éxito
   return(true);
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
//--- anulamos el valor del error
   ResetLastError();
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
bool RectangleCreate(const long            chart_ID=0,        // ID del gráfico
                     const string          name="Rectangle",  // nombre del rectángulo
                     const int             sub_window=0,      // número de subventana
                     datetime              time1=0,           // hora del primer punto
                     double                price1=0,          // precio del primer punto
                     datetime              time2=0,           // hora del segundo punto
                     double                price2=0,          // precio del segundo punto
                     const color           clr=clrRed,        // color del rectángulo
                     const ENUM_LINE_STYLE style=STYLE_SOLID, // estilo de las líneas del rectángulo
                     const int             width=1,           // grosor de las líneas del rectángulo
                     const bool            fill=false,        // relleno del rectángulo con el color
                     const bool            back=false,        // al fondo
                     const bool            selection=true,    // seleccionar para mover
                     const bool            hidden=true,       // ocultar en la lista de objetos
                     const long            z_order=0)         // prioridad para el clic del ratón
  {
//--- anulamos el valor del error
   ResetLastError();
//--- creamos el rectángulo según las coordenadas establecidas
   if(!ObjectCreate(chart_ID,name,OBJ_RECTANGLE,sub_window,time1,price1,time2,price2))
     {
      Print(__FUNCTION__,
            ": ¡Fallo al crear el rectángulo! Código del error = ",GetLastError());
      return(false);
     }
//--- establecemos el color del rectángulo
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- establecemos el estilo de las líneas del rectángulo
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
//--- establecemos el grosor de las líneas del rectángulo
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
//--- activar (true) o desactivar (false) el modo de relleno del rectángulo
   ObjectSetInteger(chart_ID,name,OBJPROP_FILL,fill);
//--- mostramos en el primer plano (false) o al fondo (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- activar (true) o desactivar (false) el modo de selección del rectángulo para mover
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

//+------------------------------------------------------------------+
