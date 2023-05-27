//+------------------------------------------------------------------+
//|                                            MultiIndicator 17.mq5 |
//|                            Copyright 2021,Rubén Blanco Fernández |
//|                             https://www.mql5.com/en/users/vaklam |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021,Rubén Blanco Fernández"
#property link      "https://www.mql5.com/en/users/vaklam"
#property version   "1.00"
#property indicator_chart_window

#property indicator_chart_window
#property indicator_buffers 4
#property indicator_plots   4
//--- plot signal_up
#property indicator_label1  "signal_up"
#property indicator_type1   DRAW_ARROW
#property indicator_color1  clrRed
//#property indicator_style1  STYLE_SOLID
#property indicator_width1  1
//--- plot signal_down
#property indicator_label2  "signal_down"
#property indicator_type2   DRAW_ARROW
#property indicator_color2  clrRed
//#property indicator_style2  STYLE_SOLID
#property indicator_width2  1

//--- plot up_confirm
#property indicator_label3  "up_confirm"
#property indicator_type3   DRAW_ARROW
#property indicator_color3  clrYellow
//#property indicator_style3  STYLE_SOLID
#property indicator_width3  1

//--- plot down_confirm
#property indicator_label4  "down_confirm"
#property indicator_type4   DRAW_ARROW
#property indicator_color4  clrYellow
//#property indicator_style4  STYLE_SOLID
#property indicator_width4  1



input bool        Use_Indi_1 = false;     //Use Inducator 1
input string      Indicator_1 = "";       //Indicator Name 1
input int         Indi_Buy_1 = 0;         //Indicator 1 Buy Buffer
input int         Indi_Sell_1 = 1;        //Indicator 1 Sell Buffer
input int         Indi_Shift_1 = 0;       //Indicator 1 Shift

input bool        Use_Indi_2 = false;     //Use Inducator 2
input string      Indicator_2 = "";       //
input int         Indi_Buy_2 = 0;         //Indicator 2 Buy Buffer
input int         Indi_Sell_2 = 1;        //Indicator 2 Sell Buffer
input int         Indi_Shift_2 = 0;       //Indicator 2 Shift

input bool        Use_Indi_3 = false;     //Use Inducator 3
input string      Indicator_3 = "";       //Indicator Name 3
input int         Indi_Buy_3 = 0;         //Indicator 3 Buy Buffer
input int         Indi_Sell_3 = 1;        //Indicator 3 Sell Buffer
input int         Indi_Shift_3 = 0;       //Indicator 3 Shift

input bool        Use_Indi_4 = false;     //Use Inducator 4
input string      Indicator_4 = "";       //Indicator Name 4
input int         Indi_Buy_4 = 0;         //Indicator 4 Buy Buffer
input int         Indi_Sell_4 = 1;        //Indicator 4 Sell Buffer
input int         Indi_Shift_4 = 0;       //Indicator 4 Shift

input bool        Use_Indi_5 = false;     //Use Inducator 5
input string      Indicator_5 = "";       //Indicator Name 5
input int         Indi_Buy_5 = 0;         //Indicator 5 Buy Buffer
input int         Indi_Sell_5 = 1;        //Indicator 5 Sell Buffer
input int         Indi_Shift_5 = 0;       //Indicator 5 Shift

input bool        Use_Indi_6 = false;     //Use Inducator 6
input string      Indicator_6 = "";       //Indicator Name 6
input int         Indi_Buy_6 = 0;         //Indicator 6 Buy Buffer
input int         Indi_Sell_6 = 1;        //Indicator 6 Sell Buffer
input int         Indi_Shift_6 = 0;       //Indicator 6 Shift

input bool        Use_Indi_7 = false;     //Use Inducator 7
input string      Indicator_7 = "";       //Indicator Name 7
input int         Indi_Buy_7 = 0;         //Indicator 7 Buy Buffer
input int         Indi_Sell_7 = 1;        //Indicator 7 Sell Buffer
input int         Indi_Shift_7 = 0;       //Indicator 7 Shift

input bool        Use_Indi_8 = false;     //Use Inducator 8
input string      Indicator_8 = "";       //Indicator Name 8
input int         Indi_Buy_8 = 0;         //Indicator 8 Buy Buffer
input int         Indi_Sell_8 = 1;        //Indicator 8 Sell Buffer
input int         Indi_Shift_8 = 0;       //Indicator 8 Shift



input bool        Tester=true;
input datetime    Start_Date=0;
input datetime    End_Date=D'01.01.2030';
input int         Expiration =1;
input int         Martingale = 10;
input int         Time_Start = 0;
input int         Time_Stop=24;
input int         Step_Arrow= 10;
input bool        Alert_MT4 = false;
input bool        Alert_Email=false;
input string      Mail_Subject= "";
input bool        Alert_Mobile=false;

input color       Display_Color = clrYellow;
input int         Display_Font_Size = 10;
input int         Display_Between_The_Lines = 15;
input int         Display_Between_The_Columns = 70;
input int         Display_X_Offset = 10;
input int         Display_Y_Offset = 80;
input ENUM_BASE_CORNER Display_Corner = CORNER_LEFT_UPPER;


enum ENUM_Horas {_0am=0, _1am=1, _2am=2, _3am=3, _4am=4, _5am=5, _6am=6, _7am=7, _8am=8, _9am=9, _10am=10, _11am=11, _12pm=12,
                 _1pm=13, _2pm=14, _3pm=15, _4pm=16, _5pm=17, _6pm=18, _7pm=19, _8pm=20, _9pm=21, _10pm=22, _11pm=23,
                };

struct Horarios
  {
   int               HoraInicio;
   int               HoraFinal;
   int               MinutoInicio;
   int               MinutoFinal;
  };

Horarios ArrayHorarios[];


input string S1="-----------------------  CONFIGURACION HORARIOS ---------------------";//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
input string Horarios_input="15:25-15:55;17:50-18:45;21:10-22:00";


double         signal_upBuffer[];
double         signal_downBuffer[];
double         up_confirmBuffer[];
double         down_confirmBuffer[];

struct inputs
  {
   int               handle;

   bool              Use_Indi;
   string            Indicator;
   int               Indi_Buy;
   int               Indi_Sell;
   int               Indi_Shift;
   bool              upCheck;
   bool              downCheck;
  };
inputs inp[8];


bool signal_send_up=false;
bool signal_send_down=false;
datetime last_candle_time=0;

int handle;

int SizeArray=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {

   if(!RegistrarSimbolo_Horario(Horarios_input,ArrayHorarios))
     {
      return(INIT_PARAMETERS_INCORRECT);
     }

   inputsToStruct();

//--- indicator buffers mapping1
   SetIndexBuffer(0,signal_upBuffer,INDICATOR_DATA);
   ArraySetAsSeries(signal_upBuffer,true);
   PlotIndexSetString(0,PLOT_LABEL,"signal_up");
   PlotIndexSetInteger(0,PLOT_ARROW,225);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(1,signal_downBuffer,INDICATOR_DATA);
   ArraySetAsSeries(signal_downBuffer,true);
   PlotIndexSetString(1,PLOT_LABEL,"signal_down");
   PlotIndexSetInteger(1,PLOT_ARROW,226);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(2,up_confirmBuffer,INDICATOR_DATA);
   ArraySetAsSeries(up_confirmBuffer,true);
   PlotIndexSetString(2,PLOT_LABEL,"up_confirm");
   PlotIndexSetInteger(2,PLOT_ARROW,233);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   SetIndexBuffer(3,down_confirmBuffer,INDICATOR_DATA);
   ArraySetAsSeries(down_confirmBuffer,true);
   PlotIndexSetString(3,PLOT_LABEL,"down_confirm");
   PlotIndexSetInteger(3,PLOT_ARROW,234);
   PlotIndexSetDouble(3,PLOT_EMPTY_VALUE,EMPTY_VALUE);


   if(last_candle_time==0)
      last_candle_time=iTime(Symbol(),PERIOD_CURRENT,0);

   SizeArray=ArraySize(ArrayHorarios);

   for(int a=0; a<8; a++)
      if(inp[a].Use_Indi)
         inp[a].handle=iCustom(Symbol(),PERIOD_CURRENT,inp[a].Indicator);

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
   if(last_candle_time<iTime(Symbol(),PERIOD_CURRENT,0))
     {
      last_candle_time=iTime(Symbol(),PERIOD_CURRENT,0);
      signal_send_down=false;
      signal_send_up=false;
     }

   ArrayResize(signal_upBuffer,rates_total,0);
   ArrayInitialize(signal_upBuffer,EMPTY_VALUE);

   ArrayResize(signal_downBuffer,rates_total,0);
   ArrayInitialize(signal_downBuffer,EMPTY_VALUE);

   ArrayResize(up_confirmBuffer,rates_total,0);
   ArrayInitialize(up_confirmBuffer,EMPTY_VALUE);

   ArrayResize(down_confirmBuffer,rates_total,0);
   ArrayInitialize(down_confirmBuffer,EMPTY_VALUE);

   ArraySetAsSeries(time,true);
  //  ArraySetAsSeries(close,true);

   for(int i=0; i<rates_total; i++)
     {
      bool EntraHorario=false;
      for(int Indice=0; Indice<SizeArray; Indice++)
        {
         if(EvaluaHorario(ArrayHorarios[Indice].HoraInicio,ArrayHorarios[Indice].HoraFinal,ArrayHorarios[Indice].MinutoInicio,ArrayHorarios[Indice].MinutoFinal,time[i]))
           {
            EntraHorario=true;
            break;
           }
        }
      if(EntraHorario==false)
         continue;

      bool upCheck=0,downCheck=0;
      double upValue[1],downValue[1];
      for(int a=0; a<8; a++)
        {
         inp[a].upCheck=0;
         inp[a].downCheck=0;

         if(inp[a].Use_Indi)
           {
            CopyBuffer(inp[a].handle,inp[a].Indi_Buy,i-inp[a].Indi_Shift,1,upValue);
            if(upValue[0]!=EMPTY_VALUE && upValue[0]!=0)
               inp[a].upCheck=1;

            CopyBuffer(inp[a].handle,inp[a].Indi_Sell,i-inp[a].Indi_Shift,1,downValue);
            if(downValue[0]!=EMPTY_VALUE && downValue[0]!=0)
               inp[a].downCheck=1;
           }
        }


      if(inp[0].Use_Indi || inp[1].Use_Indi || inp[2].Use_Indi || inp[3].Use_Indi
         || inp[4].Use_Indi || inp[5].Use_Indi || inp[6].Use_Indi || inp[7].Use_Indi)
        {
         if((!inp[0].Use_Indi || inp[0].upCheck)
            && (!inp[1].Use_Indi || inp[1].upCheck)
            && (!inp[2].Use_Indi || inp[2].upCheck)
            && (!inp[3].Use_Indi || inp[3].upCheck)
            && (!inp[4].Use_Indi || inp[4].upCheck)
            && (!inp[5].Use_Indi || inp[5].upCheck)
            && (!inp[6].Use_Indi || inp[6].upCheck)
            && (!inp[7].Use_Indi || inp[7].upCheck))
            signal_upBuffer[i]=low[rates_total-1-i]-Point()*Step_Arrow;
         else
            signal_upBuffer[i]=EMPTY_VALUE;

         if((!inp[0].Use_Indi || inp[0].downCheck)
            && (!inp[1].Use_Indi || inp[1].downCheck)
            && (!inp[2].Use_Indi || inp[2].downCheck)
            && (!inp[3].Use_Indi || inp[3].downCheck)
            && (!inp[4].Use_Indi || inp[4].downCheck)
            && (!inp[5].Use_Indi || inp[5].downCheck)
            && (!inp[6].Use_Indi || inp[6].downCheck)
            && (!inp[7].Use_Indi || inp[7].downCheck))
            signal_downBuffer[i]=high[rates_total-1-i]+Point()*Step_Arrow;
         else
            signal_downBuffer[i]=EMPTY_VALUE;
        }
      else
        {
         signal_upBuffer[i]=EMPTY_VALUE;
         signal_downBuffer[i]=EMPTY_VALUE;
        }
       // signal_downBuffer[i]=close[i];
     }
   for(int i=0; i<rates_total; i++)
     {
      if(i<rates_total-2 && signal_upBuffer[i+1]!=EMPTY_VALUE)
         up_confirmBuffer[i]=low[rates_total-1-i]-Point()*Step_Arrow;
      else
         up_confirmBuffer[i]=EMPTY_VALUE;

      if(i<rates_total-2 && signal_downBuffer[i+1]!=EMPTY_VALUE)
         down_confirmBuffer[i]=high[rates_total-1-i]+Point()*Step_Arrow;
      else
         down_confirmBuffer[i]=EMPTY_VALUE;

     }

   if(!signal_send_down && signal_downBuffer[0]!=EMPTY_VALUE)
     {
      signal_send_down=true;
      if(Alert_MT4)
         Alert(MQLInfoString(MQL_PROGRAM_NAME)+" - "+Symbol()+" " +TFToString(Period())+ " - Sell");
      if(Alert_Email)
         SendMail(Mail_Subject,MQLInfoString(MQL_PROGRAM_NAME)+" - "+Symbol()+" " +TFToString(Period())+ " - Sell");
      if(Alert_Mobile)
         SendNotification(MQLInfoString(MQL_PROGRAM_NAME)+" - "+Symbol()+" " +TFToString(Period())+ " - Sell");
     }

   if(!signal_send_up && signal_upBuffer[0]!=EMPTY_VALUE)
     {
      signal_send_up=true;
      if(Alert_MT4)
         Alert(MQLInfoString(MQL_PROGRAM_NAME)+" - "+Symbol()+" " +TFToString(Period())+ " - Buy");
      if(Alert_Email)
         SendMail(Mail_Subject,MQLInfoString(MQL_PROGRAM_NAME)+" - "+Symbol()+" " +TFToString(Period())+ " - Buy");
      if(Alert_Mobile)
         SendNotification(MQLInfoString(MQL_PROGRAM_NAME)+" - "+Symbol()+" " +TFToString(Period())+ " - Buy");
     }


   if(Tester)
      display();


   return(rates_total);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,"display_");
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool signalCustom(string name,int buffer,int shift)
  {
   bool result=0;
//int handle=iCustom(Symbol(),PERIOD_CURRENT,name);
   double value[1];
   CopyBuffer(handle,buffer,shift,1,value);

   if(value[0]==EMPTY_VALUE || value[0]<=0)
      result=0;

//   Print("value[0]: ",value[0]);
   return result;
  }


//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void display()
  {
   int count_signals_up=0;
   int count_signals_down=0;
   int count_positive=0;
   int count_martingale[];
   int count_martingale_positive[];
   ArrayResize(count_martingale,Martingale+1);
   ArrayResize(count_martingale_positive,Martingale+1);

   for(int i=0; i<ArraySize(count_martingale); i++)
      count_martingale[i]=0;
   for(int i=0; i<ArraySize(count_martingale_positive); i++)
      count_martingale_positive[i]=0;
   for(int i=ArraySize(up_confirmBuffer)-1; i>Expiration; i--)
     {

      if(iTime(Symbol(),PERIOD_CURRENT,i)<Start_Date)
         continue;
      if(iTime(Symbol(),PERIOD_CURRENT,i)>End_Date)
         break;

      MqlDateTime intra_time;

      TimeToStruct(iTime(Symbol(),PERIOD_CURRENT,i),intra_time);
      if(intra_time.hour<Time_Start || intra_time.hour>=Time_Stop)
         continue;
      if(up_confirmBuffer[i]<EMPTY_VALUE)
        {
         count_signals_up++;
         if(dealDirection(i)==ORDER_TYPE_BUY)
            count_positive++;
         else
           {
            for(int j=0; j<ArraySize(count_martingale); j++)
              {
               int deal_dir=dealDirection(i-Expiration-j*Expiration);
               if(deal_dir>-2)
                 {
                  count_martingale[j]++;
                  if(deal_dir==ORDER_TYPE_BUY)
                    {
                     count_martingale_positive[j]++;
                     break;
                    }
                 }
               else
                  break;
              }
           }
        }

      if(down_confirmBuffer[i]<EMPTY_VALUE)
        {
         count_signals_down++;
         if(dealDirection(i)==ORDER_TYPE_SELL)
            count_positive++;
         else
           {
            for(int j=0; j<ArraySize(count_martingale); j++)
              {
               int deal_dir=dealDirection(i-Expiration-j*Expiration);
               if(deal_dir>-2)
                 {
                  count_martingale[j]++;
                  if(deal_dir==ORDER_TYPE_SELL)
                    {
                     count_martingale_positive[j]++;
                     break;
                    }
                 }
               else
                  break;
              }
           }
        }
     }

   int total  = count_signals_up+count_signals_down;
   int total_deal_curr = count_positive;
   string text = "Up: "+(string)(count_signals_up)+" | Down: "+(string)(count_signals_down);
   LabelCreate(0,"display_1",0,Display_X_Offset,Display_Y_Offset,Display_Corner,text,"Arial",Display_Font_Size,Display_Color);
   text = "Trade: "+(string)(total)+" ("+(string)count_positive+"/"+(string)(total-count_positive)+")"+" | "+(string)(total>0?DoubleToString((double)count_positive*100/total,2):(string)100)+"%";
   LabelCreate(0,"display_4",0,Display_X_Offset,Display_Y_Offset+Display_Between_The_Lines,Display_Corner,text,"Arial",Display_Font_Size,Display_Color);

   for(int i = 0; i<ArraySize(count_martingale); i++)
     {
      if(i==ArraySize(count_martingale)-1)
        {
         text = "OTM:  "+(string)(count_martingale[i]);
         LabelCreate(0,"display_"+(string)(7+i*10),0,Display_X_Offset,Display_Y_Offset+Display_Between_The_Lines*(i+2),Display_Corner,text,"Arial",Display_Font_Size,Display_Color);
        }
      else
        {
         total_deal_curr = total_deal_curr + count_martingale_positive[i];
         text = "MG"+(string)(i+1)+":  "+(string)(count_martingale[i])+" ("+(string)(count_martingale_positive[i])+"/"+(string)(count_martingale[i]-count_martingale_positive[i])+") | "+(string)(total>0?DoubleToString((double)total_deal_curr*100/total,2):(string)100)+"%";
         LabelCreate(0,"display_"+(string)(7+i*10),0,Display_X_Offset,Display_Y_Offset+Display_Between_The_Lines*(i+2),Display_Corner,text,"Arial",Display_Font_Size,Display_Color);
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int dealDirection(int  shift)
  {
   if(shift-Expiration<=0)
      return -2;
   if(iOpen(Symbol(),PERIOD_CURRENT,shift)>iClose(Symbol(),PERIOD_CURRENT,shift-Expiration+1))
      return ORDER_TYPE_SELL;
   if(iOpen(Symbol(),PERIOD_CURRENT,shift)<iClose(Symbol(),PERIOD_CURRENT,shift-Expiration+1))
      return ORDER_TYPE_BUY;
   return -1;
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool LabelCreate(const long              chart_ID=0,               // ID графика
                 const string            name="Label",             // имя метки
                 const int               sub_window=0,             // номер подокна
                 const int               x=0,                      // координата по оси X
                 const int               y=0,                      // координата по оси Y
                 const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // угол графика для привязки
                 const string            text="Label",             // текст
                 const string            font="Arial",             // шрифт
                 const int               font_size=10,             // размер шрифта
                 const color             clr=clrRed,               // цвет
                 const double            angle=0.0,                // наклон текста
                 const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // способ привязки
                 const bool              back=false,               // на заднем плане
                 const bool              selection=false,          // выделить для перемещений
                 const bool              hidden=true,              // скрыт в списке объектов
                 const long              z_order=0)                // приоритет на нажатие мышью
  {
   ResetLastError();
   ObjectDelete(0,name);
   if(!ObjectCreate(chart_ID,name,OBJ_LABEL,sub_window,0,0))
     {
      Print(__FUNCTION__,
            ": не удалось создать текстовую метку! Код ошибки = ",GetLastError());
      return(false);
     }
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
   ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
   return(true);
  }


//+------------------------------------------------------------------+
//| TFToString function                                              |
//+------------------------------------------------------------------+
string TFToString(ENUM_TIMEFRAMES tf)
  {
   string result="Current";

   if(tf==PERIOD_M1)
      result="M1";
   if(tf==PERIOD_M2)
      result="M2";
   if(tf==PERIOD_M3)
      result="M3";
   if(tf==PERIOD_M4)
      result="M4";
   if(tf==PERIOD_M5)
      result="M5";
   if(tf==PERIOD_M6)
      result="M6";
   if(tf==PERIOD_M10)
      result="M10";
   if(tf==PERIOD_M12)
      result="M12";
   if(tf==PERIOD_M15)
      result="M15";
   if(tf==PERIOD_M20)
      result="M20";
   if(tf==PERIOD_M30)
      result="M30";
   if(tf==PERIOD_H1)
      result="H1";
   if(tf==PERIOD_H2)
      result="H2";
   if(tf==PERIOD_H3)
      result="H3";
   if(tf==PERIOD_H4)
      result="H4";
   if(tf==PERIOD_H6)
      result="H6";
   if(tf==PERIOD_H8)
      result="H8";
   if(tf==PERIOD_H12)
      result="H12";
   if(tf==PERIOD_D1)
      result="D1";
   if(tf==PERIOD_W1)
      result="W1";
   if(tf==PERIOD_MN1)
      result="MN1";

   return result;
  }
//+------------------------------------------------------------------+
//| Inputs to struct function                                        |
//+------------------------------------------------------------------+
void inputsToStruct()
  {
   inp[0].Use_Indi    =Use_Indi_1;
   inp[0].Indicator   =Indicator_1;
   inp[0].Indi_Buy    =Indi_Buy_1;
   inp[0].Indi_Sell   =Indi_Sell_1;
   inp[0].Indi_Shift  =Indi_Shift_1;

   inp[1].Use_Indi    =Use_Indi_2;
   inp[1].Indicator   =Indicator_2;
   inp[1].Indi_Buy    =Indi_Buy_2;
   inp[1].Indi_Sell   =Indi_Sell_2;
   inp[1].Indi_Shift  =Indi_Shift_2;

   inp[2].Use_Indi    =Use_Indi_3;
   inp[2].Indicator   =Indicator_3;
   inp[2].Indi_Buy    =Indi_Buy_3;
   inp[2].Indi_Sell   =Indi_Sell_3;
   inp[2].Indi_Shift  =Indi_Shift_3;

   inp[3].Use_Indi    =Use_Indi_4;
   inp[3].Indicator   =Indicator_4;
   inp[3].Indi_Buy    =Indi_Buy_4;
   inp[3].Indi_Sell   =Indi_Sell_4;
   inp[3].Indi_Shift  =Indi_Shift_4;

   inp[4].Use_Indi    =Use_Indi_5;
   inp[4].Indicator   =Indicator_5;
   inp[4].Indi_Buy    =Indi_Buy_5;
   inp[4].Indi_Sell   =Indi_Sell_5;
   inp[4].Indi_Shift  =Indi_Shift_5;

   inp[5].Use_Indi    =Use_Indi_6;
   inp[5].Indicator   =Indicator_6;
   inp[5].Indi_Buy    =Indi_Buy_6;
   inp[5].Indi_Sell   =Indi_Sell_6;
   inp[5].Indi_Shift  =Indi_Shift_6;

   inp[6].Use_Indi    =Use_Indi_7;
   inp[6].Indicator   =Indicator_7;
   inp[6].Indi_Buy    =Indi_Buy_7;
   inp[6].Indi_Sell   =Indi_Sell_7;
   inp[6].Indi_Shift  =Indi_Shift_7;

   inp[7].Use_Indi    =Use_Indi_8;
   inp[7].Indicator   =Indicator_8;
   inp[7].Indi_Buy    =Indi_Buy_8;
   inp[7].Indi_Sell   =Indi_Sell_8;
   inp[7].Indi_Shift  =Indi_Shift_8;
  }

//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluaHorario(int Apertura,int Cierre,int Min_Inicio,int Min_Final,datetime Time)
  {

   MqlDateTime TimeMql;
   TimeToStruct(Time,TimeMql);

   if(Apertura==Cierre)
     {
      if(Apertura==TimeMql.hour)
        {
         if(Min_Inicio>Min_Final)
            return false;
         else
            if(Min_Inicio<=TimeMql.min && Min_Final>TimeMql.min)
               return true;
        }
      else
         return false;
     }

   if(Apertura==TimeMql.hour)
     {
      if(Min_Inicio>TimeMql.min)
         return false;
     }

   if(Cierre==TimeMql.hour)
     {
      if(Min_Final<=TimeMql.min)
         return false;
     }

   if(Apertura>Cierre && (TimeMql.hour>=Apertura || TimeMql.hour<Cierre))
      return true;
   else
      if(Apertura<Cierre && TimeMql.hour>=Apertura && TimeMql.hour<Cierre)
         return true;

   return false;
  }
//+------------------------------------------------------------------+





//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RegistrarSimbolo_Horario(string Simbolos, Horarios &ArraySymbolos[])
  {
   int Conteo=0;
   if(Simbolos=="")
      return true;

   string NombresDeLosSimbolos=Simbolos+";";
   int PosicionEncontradoAnterior=0;
   int PosicionEncontrado=0;
   while(PosicionEncontrado<StringBufferLen(NombresDeLosSimbolos) && PosicionEncontrado!=-1)
     {
      PosicionEncontrado=StringFind(NombresDeLosSimbolos,";",PosicionEncontrado+1);

      if(PosicionEncontrado!=-1)
        {
         ArrayResize(ArraySymbolos,Conteo+1);
         int Sustraccion=PosicionEncontrado-PosicionEncontradoAnterior;
         string IndiceSring=StringSubstr(NombresDeLosSimbolos,PosicionEncontradoAnterior,Sustraccion);

         int Hora_Inicio=0,Hora_Final=0,Minuto_Final=0,Minuto_Inicio=0;
         string ERRORFRASE=" ";
         if(EvaluaStringHorario(IndiceSring,Hora_Inicio,Hora_Final,Minuto_Inicio,Minuto_Final,ERRORFRASE))
           {
            ArraySymbolos[Conteo].HoraInicio=Hora_Inicio;
            ArraySymbolos[Conteo].HoraFinal=Hora_Final;
            ArraySymbolos[Conteo].MinutoInicio=Minuto_Inicio;
            ArraySymbolos[Conteo].MinutoFinal=Minuto_Final;
           }
         else
           {
            Alert(ERRORFRASE);
            return false;
           }
         PosicionEncontradoAnterior=PosicionEncontrado+1;
         Conteo++;
        }
     }

   return true;
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EvaluaStringHorario(string IndiceString,int &Hora_Inicio,int &Hora_Final,int &Minuto_Inicio,int &Minuto_Final,string &ERRORFRASE)
  {

   int Lengh=StringLen(IndiceString);


   uchar ArrayChar[];

   int Elementos=StringToCharArray(IndiceString,ArrayChar,0,WHOLE_ARRAY,0);

   if(Elementos!=12)
     {
      ERRORFRASE+="Horario mal escrito ("+IndiceString+") debe ser por ejemplo '15:25-15:55' o '15:25-15:55;17:25-17:55'  sin espacios";
      return false;
     }

   if(CharToString(ArrayChar[2])!=":")
     {
     ERRORFRASE+="Horario mal escrito ("+IndiceString+") debe ser por ejemplo '15:25-15:55' o '15:25-15:55;17:25-17:55'  sin espacios";
      return false;
     }
   if(CharToString(ArrayChar[5])!="-")
     {
      ERRORFRASE+="Horario mal escrito ("+IndiceString+") debe ser por ejemplo '15:25-15:55' o '15:25-15:55;17:25-17:55'  sin espacios";
      return false;
     }
   if(CharToString(ArrayChar[8])!=":")
     {
      ERRORFRASE+="Horario mal escrito ("+IndiceString+") debe ser por ejemplo '15:25-15:55' o '15:25-15:55;17:25-17:55'  sin espacios";
      return false;
     }

   string H1=CharToString(ArrayChar[0])+CharToString(ArrayChar[1]);

   string M1=CharToString(ArrayChar[3])+CharToString(ArrayChar[4]);

   string H2=CharToString(ArrayChar[6])+CharToString(ArrayChar[7]);

   string M2=CharToString(ArrayChar[9])+CharToString(ArrayChar[10]);

   for(int i=0; i<StringLen(H1); i++)
     {
      if(StringGetCharacter(H1,i)<48 || StringGetCharacter(H1,i)>57)
        {
         ERRORFRASE+="Horario mal escrito ("+IndiceString+") debe ser por ejemplo '15:25-15:55' o '15:25-15:55;17:25-17:55'  sin espacios";
         return false;
        }
     }

   for(int i=0; i<StringLen(M1); i++)
     {
      if(StringGetCharacter(M1,i)<48 || StringGetCharacter(M1,i)>57)
        {
         ERRORFRASE+="Horario mal escrito ("+IndiceString+") debe ser por ejemplo '15:25-15:55' o '15:25-15:55;17:25-17:55'  sin espacios";
         return false;
        }
     }

   for(int i=0; i<StringLen(H2); i++)
     {
      if(StringGetCharacter(H2,i)<48 || StringGetCharacter(H2,i)>57)
        {
        ERRORFRASE+="Horario mal escrito ("+IndiceString+") debe ser por ejemplo '15:25-15:55' o '15:25-15:55;17:25-17:55'  sin espacios";
         return false;
        }
     }

   for(int i=0; i<StringLen(M2); i++)
     {
      if(StringGetCharacter(M2,i)<48 || StringGetCharacter(M2,i)>57)
        {
         ERRORFRASE+="Horario mal escrito ("+IndiceString+") debe ser por ejemplo '15:25-15:55' o '15:25-15:55;17:25-17:55'  sin espacios";
         return false;
        }
     }

   Hora_Inicio=(int)StringToInteger(H1);
   Hora_Final=(int)StringToInteger(H2);
   Minuto_Inicio=(int)StringToInteger(M1);
   Minuto_Final=(int)StringToInteger(M2);
   
   if(Minuto_Inicio>59 || Minuto_Final>59 || Minuto_Final<0 || Minuto_Inicio<0){
   ERRORFRASE+="Horario mal escrito ("+IndiceString+") los minutos deben ser mayor o igual a 0 y menor que 60";
   return false;}
   
   if(Hora_Inicio>23 || Hora_Final>23 || Hora_Final<0 || Hora_Inicio<0){
   ERRORFRASE+="Horario mal escrito ("+IndiceString+") las horas deben ser mayor o igual a 0 y menor que 24";
   return false;
   }
   return true;
  }
//+------------------------------------------------------------------+
