//+------------------------------------------------------------------+
//|                                               IN34.Equity_v8.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2009, Xupypr"
#property link      "http://www.mql4.com/ru/users/Xupypr"

#property indicator_separate_window
#property indicator_buffers 4
#property indicator_color1 SteelBlue
#property indicator_color2 OrangeRed
#property indicator_color3 SlateGray
#property indicator_color4 ForestGreen
#property indicator_width1 1
#property indicator_width2 2
#property indicator_width3 1
#property indicator_width4 1

//------------- Фильтр истории торгов
extern bool     Only_Trade=false;   // Учитывать только позиции, исключив пополнение/снятие средств
extern string   Only_Magics="";     // Учитывать только позиции с магическими номерами (через любой разделитель)
extern string   Only_Symbols="";    // Учитывать только позиции по инструментам (через любой разделитель)
extern string   Only_Comment="";    // Учитывать только позиции с наличием комментария (например [sl] или [tp])
extern bool     Only_Current=false; // Учитывать только позиции по текущему инструменту
extern bool     Only_Buys=false;    // Учитывать только позиции на покупку
extern bool     Only_Sells=false;   // Учитывать только позиции на продажу

//------------- Внешний вид индикатора
extern bool     Show_Balance=true;  // Отображать баланс
extern bool     Show_Margin=false;  // Отображать залог (только в режиме реального времени)
extern bool     Show_Free=false;    // Отображать свободные средства (только в режиме реального времени)
extern bool     Show_Info=false;    // Отображать дополнительную информацию о просадках, включая ФВ

//------------- Настройка сигналов о просадке
extern double   Alert_Drawdown=0;   // Предупреждать о просадке средств в процентах за период (0 - отключить)
extern double   Max_Drawdown=25;    // Максимально допустимая просадка в процентах за период ("красная зона")
extern bool     Current_Day=true;   // Просадка будет наблюдаться только за текущий день
extern datetime Begin_Monitoring=D'2009.08.17 00:00'; // Начало наблюдения за просадкой (если Current_Day=false)

//------------- Другие параметры
extern bool     File_Write=false;   // Запись данных о эквити и балансе в файл
extern datetime Draw_Begin=D'2001.01.01 00:00'; // Начальная дата отрисовки индикатора

int      DrawBeginBar,Window;
string   ShortName,Unique;
double   Equity[],Balance[],Margin[],Free[];
double   StartBalance,CurrentBalance,MaxPeak,MaxProfit;
double   AbsDrawdown,MaxDrawdown,RelDrawdown,Drawdown,RecoveryFactor;

datetime OpenTime_Ticket[][2]; // время открытия и номер тикета
int      OpenBar[];            // номер бара открытия
int      CloseBar[];           // номер бара закрытия
int      Type[];               // тип операции
string   Instrument[];         // инструмент
double   Lots[];               // количество лотов
double   OpenPrice[];          // цена открытия
double   ClosePrice[];         // цена закрытия
double   Commission[];         // комиссия
double   Swap[];               // накопленный своп
double   CurSwap[];            // текущий своп
double   DaySwap[];            // дневной своп
double   Profit[];             // чистая прибыль
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(Only_Magics=="" && Only_Symbols=="" && Only_Comment=="" && !Only_Current && !Only_Buys && !Only_Sells)
      ShortName="Total";
   else
     {
      if(Only_Magics!="")
         ShortName=Only_Magics;
      else
         ShortName="";
      if(Only_Symbols!="")
         StringConcatenate(ShortName,ShortName," ",Only_Symbols);
      else
         if(Only_Current)
            StringConcatenate(ShortName,ShortName," ",Symbol());
      if(Only_Comment!="")
         StringConcatenate(ShortName,ShortName," ",Only_Comment);
      if(Only_Sells)
         Only_Buys=false;
      if(Only_Buys)
         StringConcatenate(ShortName,ShortName," Buys");
      if(Only_Sells)
         StringConcatenate(ShortName,ShortName," Sells");
     }
   if(Only_Trade)
      StringConcatenate(ShortName,ShortName," Zero");
   SetIndexBuffer(0,Equity,INDICATOR_DATA);
   PlotIndexSetString(0,PLOT_LABEL,ShortName+" Equity");
   PlotIndexSetInteger(0,PLOT_DRAW_TYPE,DRAW_LINE);
   SetIndexBuffer(1,Balance,INDICATOR_DATA);
   PlotIndexSetString(1,PLOT_LABEL,ShortName+" Balance");
   PlotIndexSetInteger(1,PLOT_DRAW_TYPE,DRAW_LINE);
   SetIndexBuffer(2,Margin,INDICATOR_DATA);
   PlotIndexSetString(2,PLOT_LABEL,ShortName+" Margin");
   PlotIndexSetInteger(2,PLOT_DRAW_TYPE,DRAW_LINE);
   SetIndexBuffer(3,Free,INDICATOR_DATA);
   PlotIndexSetString(3,PLOT_LABEL,ShortName+" Free");
   PlotIndexSetInteger(3,PLOT_DRAW_TYPE,DRAW_LINE);

   StringConcatenate(ShortName,ShortName," Equity");
   if(Show_Balance)
      StringConcatenate(ShortName,ShortName," Balance");
   if(Show_Margin)
      StringConcatenate(ShortName,ShortName," Margin");
   if(Show_Free)
      StringConcatenate(ShortName,ShortName," Free");
   Unique=DoubleToString(GetTickCount()+MathRand(),0);
   DrawBeginBar=iBarShift(NULL,0,Draw_Begin);

   IndicatorSetInteger(INDICATOR_DIGITS,2);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//|  Custom indicator deinitialization function                      |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   DeleteAll();
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,      // tamaño de series temporales de entrada
                 const int prev_calculated,  // procesado de barras en la anterior llamada
                 const datetime& Time[],     // Time
                 const double& Open[],       // Open
                 const double& High[],       // High
                 const double& Low[],        // Low
                 const double& Close[],      // Close
                 const long& Tick_volume[],  // Tick Volume
                 const long& Volume[],       // Real Volume
                 const int& Spread[]         // Spread
               )
  {
  
  ArraySetAsSeries(Time,true);
  ArraySetAsSeries(High,true);
  ArraySetAsSeries(Low,true);
  ArraySetAsSeries(Open,true);
  ArraySetAsSeries(Close,true);
  
  
   static int anumber=-1;
   static bool first;
   static string minfosymbols;
   string filename,text,date,time;
   double profitloss,spread,lotsize;
   int handle,bar,i,j,start1,total,historytotal,opentotal;
//int tick=GetTickCount();

   if(anumber!=AccountInfoInteger(ACCOUNT_LOGIN))
     {
      DeleteAll();
      IndicatorSetString(INDICATOR_SHORTNAME,Unique);
      ChartWindowFind(0,Unique);
      IndicatorSetString(INDICATOR_SHORTNAME,ShortName);
      ArrayInitialize(Balance,EMPTY_VALUE);
      ArrayInitialize(Equity,EMPTY_VALUE);
      ArrayInitialize(Margin,EMPTY_VALUE);
      ArrayInitialize(Free,EMPTY_VALUE);
      anumber=(int)AccountInfoInteger(ACCOUNT_LOGIN);
      minfosymbols="";
      first=true;
     }
   if(HistoryDealGetTicket(0)==0)
      return(rates_total);

   if(first)
     {
      first=false;
      MaxPeak=0.0;
      MaxProfit=0.0;
      AbsDrawdown=0.0;
      MaxDrawdown=0.0;
      RelDrawdown=0.0;
      if(Period()>PERIOD_D1)
        {
         Alert("Период не может быть больше D1");
         return(0);
        }
      historytotal=HistoryDealsTotal();
      opentotal=PositionsTotal();
      total=historytotal+opentotal;
      ArrayResize(OpenTime_Ticket,total);
      for(i=0; i<historytotal; i++)
        {
         int ticket=HistoryDealGetTicket(i);
         if(ticket!=0)
           {
            if(SelectHistory())
              {
               OpenTime_Ticket[i][0]=HistoryDealGetInteger(ticket,DEAL_TIME);
               OpenTime_Ticket[i][1]=ticket;
              }
            else
              {
               OpenTime_Ticket[i][0]=EMPTY_VALUE;
               total--;
              }
           }
        }
      if(opentotal>0)
        {
         for(i=0; i<opentotal; i++)
           {
            int ticket=PositionGetTicket(i);
            if(ticket!=0)
              {
               if(SelectPosition())
                 {
                  OpenTime_Ticket[historytotal+i][0]=(datetime)PositionGetInteger(POSITION_TIME);
                  OpenTime_Ticket[historytotal+i][1]=ticket;
                 }
               else
                 {
                  OpenTime_Ticket[historytotal+i][0]=EMPTY_VALUE;
                  total--;
                 }
              }
           }
        }
      ArraySort(OpenTime_Ticket);
      ArrayResize(OpenTime_Ticket,total);
      ArrayResize(OpenBar,total);
      ArrayResize(CloseBar,total);
      ArrayResize(Type,total);
      ArrayResize(Lots,total);
      ArrayResize(Instrument,total);
      ArrayResize(OpenPrice,total);
      ArrayResize(ClosePrice,total);
      ArrayResize(Commission,total);
      ArrayResize(Swap,total);
      ArrayResize(CurSwap,total);
      ArrayResize(DaySwap,total);
      ArrayResize(Profit,total);
      for(i=0; i<total; i++)
         if(OrderSelect(OpenTime_Ticket[i][1],SELECT_BY_TICKET))
            ReadOrder(i);
      if(Type[0]<6 && !Only_Trade)
        {
         Alert("История сделок загружена не полностью");
         return(0);
        }
      if(File_Write)
        {
         filename=StringConcatenate(AccountNumber(),"_",Period(),".csv");
         handle=FileOpen(filename,FILE_CSV|FILE_WRITE);
         if(handle<0)
            Alert("Ошибка #",GetLastError()," при открытии файла");
         else
            if(FileWrite(handle,"Date","Time","Equity","Balance")<=0)
               Print("Ошибка #",GetLastError()," при записи в файл");
        }
      start1=0;
      StartBalance=0.0;
      CurrentBalance=0.0;
      for(i=OpenBar[0]; i>=0; i--)
        {
         profitloss=0.0;
         for(j=start1; j<total; j++)
           {
            if(OpenBar[j]<i)
               break;
            if(CloseBar[start1]>i)
               start1++;
            if(CloseBar[j]==i && ClosePrice[j]!=0)
               CurrentBalance+=Swap[j]+Commission[j]+Profit[j];
            else
               if(OpenBar[j]>=i && CloseBar[j]<=i)
                 {
                  if(Type[j]>5)
                    {
                     CurrentBalance+=Profit[j];
                     if(i==OpenBar[0])
                        StartBalance=Profit[j];
                     if(!Only_Trade && i<=DrawBeginBar)
                       {
                        text=StringConcatenate(Instrument[j],": ",DoubleToStr(Profit[j],2)," ",AccountCurrency());
                        LineCreate("Balance "+TimeToStr(OpenTime_Ticket[j][0]),OBJ_VLINE,2,OrangeRed,text,Time[i],0);
                       }
                     continue;
                    }
                  if(i>DrawBeginBar)
                     continue;
                  if(MarketInfo(Instrument[j],MODE_POINT)==0)
                    {
                     if(StringFind(minfosymbols,Instrument[j])==-1)
                       {
                        Alert("В обзоре рынка не хватает "+Instrument[j]);
                        minfosymbols=StringConcatenate(minfosymbols," ",Instrument[j]);
                       }
                     continue;
                    }
                  bar=iBarShift(Instrument[j],0,Time[i]);
                  if(TimeDayOfWeek(iTime(Instrument[j],0,bar))!=TimeDayOfWeek(iTime(Instrument[j],0,bar+1)) && OpenBar[j]!=bar)
                    {
                     int pcm=MarketInfo(Instrument[j],MODE_PROFITCALCMODE);
                     switch(pcm)
                       {
                        case 0:
                          {
                           if(TimeDayOfWeek(iTime(Instrument[j],0,bar))==4)
                              CurSwap[j]+=3*DaySwap[j];
                           else
                              CurSwap[j]+=DaySwap[j];
                          }
                        break;
                        case 1:
                          {
                           if(TimeDayOfWeek(iTime(Instrument[j],0,bar))==1)
                              CurSwap[j]+=3*DaySwap[j];
                           else
                              CurSwap[j]+=DaySwap[j];
                          }
                       }
                    }
                  lotsize=LotSize(Instrument[j],Time[i]);
                  if(Type[j]==OP_BUY)
                     profitloss+=Commission[j]+CurSwap[j]+(iClose(Instrument[j],0,bar)-OpenPrice[j])*Lots[j]*lotsize;
                  else
                    {
                     spread=MarketInfo(Instrument[j],MODE_POINT)*MarketInfo(Instrument[j],MODE_SPREAD);
                     profitloss+=Commission[j]+CurSwap[j]+(OpenPrice[j]-iClose(Instrument[j],0,bar)-spread)*Lots[j]*lotsize;
                    }
                 }
           }
         if(i>DrawBeginBar)
            continue;
         Equity[i]=NormalizeDouble(CurrentBalance+profitloss,2);
         if(Show_Balance)
            Balance[i]=NormalizeDouble(CurrentBalance,2);
         if(Show_Info)
            Drawdown(CurrentBalance+profitloss);
         if(File_Write && handle>0)
           {
            date=TimeToStr(Time[i],TIME_DATE);
            time=TimeToStr(Time[i],TIME_MINUTES);
            if(FileWrite(handle,date,time,CurrentBalance+profitloss,CurrentBalance)<=0)
               Print("Ошибка #",GetLastError()," при записи в файл");
           }
        }
      ArrayResize(OpenTime_Ticket,opentotal);
      if(opentotal>0)
         for(i=0; i<opentotal; i++)
            if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
               OpenTime_Ticket[i][1]=OrderTicket();
      if(File_Write && handle>0)
         FileClose(handle);
     }
   else
     {
      if(Only_Magics=="" && Only_Symbols=="" && Only_Comment=="" && !Only_Current && !Only_Buys && !Only_Sells && !Only_Trade)
        {
         Equity[0]=AccountEquity();
         if(Show_Balance)
            Balance[0]=AccountBalance();
         if(Show_Margin)
            Margin[0]=AccountMargin();
         if(Show_Free)
            Free[0]=AccountFreeMargin();
         if(Show_Info)
            Drawdown(AccountEquity());
        }
      else
        {
         opentotal=ArraySize(OpenTime_Ticket);
         if(opentotal>0)
           {
            for(i=0; i<opentotal; i++)
              {
               if(!OrderSelect(OpenTime_Ticket[i][1],SELECT_BY_TICKET))
                  continue;
               if(OrderCloseTime()==0)
                  continue;
               else
                  if(Select())
                     CurrentBalance+=OrderCommission()+OrderSwap()+OrderProfit();
              }
           }
         profitloss=0.0;
         opentotal=OrdersTotal();
         if(opentotal>0)
           {
            for(i=0; i<opentotal; i++)
              {
               if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
                  continue;
               if(Select())
                  profitloss+=OrderCommission()+OrderSwap()+OrderProfit();
              }
           }
         Equity[0]=NormalizeDouble(CurrentBalance+profitloss,2);
         if(Show_Balance)
            Balance[0]=NormalizeDouble(CurrentBalance,2);
         if(Show_Info)
            Drawdown(CurrentBalance+profitloss);
         ArrayResize(OpenTime_Ticket,opentotal);
         if(opentotal>0)
            for(i=0; i<opentotal; i++)
               if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
                  OpenTime_Ticket[i][1]=OrderTicket();
        }
     }
   LineCreate("Equity Level",OBJ_HLINE,1,SteelBlue,"",0,Equity[0]);

   if(Show_Info)
     {
      if(MaxDrawdown>0)
        {
         RecoveryFactor=(Equity[0]-StartBalance)/MaxDrawdown;
         text=StringConcatenate(": ",DoubleToStr(RecoveryFactor,2));
         LabelCreate("Recovery Factor",text,10);
        }
      text=StringConcatenate(": ",DoubleToStr(AbsDrawdown,2)," ",AccountCurrency());
      LabelCreate("Absolute Drawdown",text,30);
      if(MaxPeak>0)
        {
         text=StringConcatenate(": ",DoubleToStr(MaxDrawdown,2)," ",AccountCurrency()," (",DoubleToStr(100*MaxDrawdown/MaxPeak,2),"%)");
         LabelCreate("Maximal Drawdown",text,50);
        }
      text=StringConcatenate(": ",DoubleToStr(RelDrawdown,2),"% (",DoubleToStr(Drawdown,2)," ",AccountCurrency(),")");
      LabelCreate("Relative Drawdown",text,70);
     }

   if(Alert_Drawdown>0)
      AlertDrawdown();
//Print("Calculating - ",GetTickCount()-tick," ms");
   return(rates_total);
  }
//+------------------------------------------------------------------+
//|  Создание текстовой метки                                        |
//+------------------------------------------------------------------+
void LabelCreate(string name,string str,int y)
  {
   string objectname=StringConcatenate(name," ",Unique);
   if(ObjectFind(objectname)==-1)
     {
      ObjectCreate(0,objectname,OBJ_LABEL,Window,0,0);
      ObjectSet(objectname,OBJPROP_XDISTANCE,10);
      ObjectSet(objectname,OBJPROP_YDISTANCE,y);
      ObjectSet(objectname,OBJPROP_CORNER,1);
      ObjectSet(objectname,OBJPROP_COLOR,SlateGray);
     }
   ObjectSetText(objectname,name+str);
  }
//+------------------------------------------------------------------+
//|  Создание линии                                                  |
//+------------------------------------------------------------------+
void LineCreate(string name,int type,int width,color clr,string str,datetime time1,double price1,datetime time2=0,double price2=0)
  {
   string objectname=StringConcatenate(name," ",Unique);
   if(ObjectFind(objectname)==-1)
     {
      ObjectCreate(objectname,type,Window,time1,price1,time2,price2);
      ObjectSet(objectname,OBJPROP_WIDTH,width);
      if(type==OBJ_TREND)
         ObjectSet(objectname,OBJPROP_RAY,false);
      if(type==OBJ_HLINE)
         ObjectSet(objectname,OBJPROP_STYLE,STYLE_DOT);
     }
   ObjectSetText(objectname,str);
   ObjectSet(objectname,OBJPROP_COLOR,clr);
   ObjectSet(objectname,OBJPROP_TIME1,time1);
   ObjectSet(objectname,OBJPROP_PRICE1,price1);
   ObjectSet(objectname,OBJPROP_TIME2,time2);
   ObjectSet(objectname,OBJPROP_PRICE2,price2);
  }
//+------------------------------------------------------------------+
//|  Удаление объектов по признаку                                   |
//+------------------------------------------------------------------+
void DeleteAll()
  {
   int total=ObjectsTotal()-1;
   for(int i=total; i>=0; i--)
     {
      string name=ObjectName(i);
      if(StringFind(name,Unique)!=-1)
         ObjectDelete(name);
     }
  }
//+------------------------------------------------------------------+
//|  Чтение данных ордера                                            |
//+------------------------------------------------------------------+
void ReadOrder(int n)
  {
   OpenBar[n]=iBarShift(NULL,0,OrderOpenTime());
   Type[n]=OrderType();
   if(OrderType()>5)
      Instrument[n]=OrderComment();
   else
      Instrument[n]=OrderSymbol();
   Lots[n]=OrderLots();
   OpenPrice[n]=OrderOpenPrice();
   if(OrderCloseTime()!=0)
     {
      CloseBar[n]=iBarShift(NULL,0,OrderCloseTime());
      ClosePrice[n]=OrderClosePrice();
     }
   else
     {
      CloseBar[n]=0;
      ClosePrice[n]=0.0;
     }
   Commission[n]=OrderCommission();
   Swap[n]=OrderSwap();
   Profit[n]=OrderProfit();
   if(OrderType()>5 && Only_Trade)
      Profit[n]=0.0;
   CurSwap[n]=0.0;
   int swapdays=0;
   for(int b=OpenBar[n]-1; b>=CloseBar[n]; b--)
     {
      if(TimeDayOfWeek(iTime(NULL,0,b))!=TimeDayOfWeek(iTime(NULL,0,b+1)))
        {
         int pcm=MarketInfo(Instrument[n],MODE_PROFITCALCMODE);
         switch(pcm)
           {
            case 0:
              {
               if(TimeDayOfWeek(iTime(NULL,0,b))==4)
                  swapdays+=3;
               else
                  swapdays++;
              }
            break;
            case 1:
              {
               if(TimeDayOfWeek(iTime(NULL,0,b))==1)
                  swapdays+=3;
               else
                  swapdays++;
              }
           }
        }
     }
   if(swapdays>0)
      DaySwap[n]=Swap[n]/swapdays;
   else
      DaySwap[n]=0.0;
   if(Lots[n]==0)
     {
      string ticket=StringSubstr(OrderComment(),StringFind(OrderComment(),"#")+1);
      if(OrderSelect(StrToInteger(ticket),SELECT_BY_TICKET,MODE_HISTORY))
         Lots[n]=OrderLots();
     }
  }
//+------------------------------------------------------------------+
//|  Расчёт просадки на всей истории счёта                           |
//+------------------------------------------------------------------+
int Drawdown(double equity)
  {
   double relative;
   if(equity<0)
      return(-1);
   if(AbsDrawdown<StartBalance-equity)
      AbsDrawdown=StartBalance-equity;
   if(equity>MaxProfit)
      MaxProfit=equity;
   if(MaxDrawdown<MaxProfit-equity)
     {
      MaxDrawdown=MaxProfit-equity;
      MaxPeak=MaxProfit;
      if(MaxPeak>0)
        {
         relative=100*MaxDrawdown/MaxPeak;
         if(RelDrawdown<relative)
           {
            RelDrawdown=relative;
            Drawdown=MaxDrawdown;
           }
        }
     }
   return(0);
  }
//+------------------------------------------------------------------+
//|  Наблюдение и предупреждение о просадках за период               |
//+------------------------------------------------------------------+
int AlertDrawdown()
  {
   static int day;
   static bool first=true;
   static double maxpeak,maxprofit,maxdrawdown,reldrawdown,drawdown,balanceDD,maxDD;
   static datetime time,timemaxprofit;
   int bar=0;
   double high,relative,level,curdrawdown;
   datetime timehigh,timelow;
   string drawdownstr,text;
   color clr;

   if(first)
     {
      first=false;
      day=Day();
      if(Current_Day)
         time=StrToTime(TimeToStr(Time[0],TIME_DATE));
      else
         time=Begin_Monitoring;
      if(time<Draw_Begin)
         time=Draw_Begin;
      if(time<OpenTime_Ticket[0][0])
         time=OpenTime_Ticket[0][0];
      bar=iBarShift(NULL,0,time);
      maxprofit=0.0;
      maxdrawdown=0.0;
      reldrawdown=0.0;
      balanceDD=0.0;
      maxDD=Alert_Drawdown;
     }
   else
      if(Current_Day && Day()!=day)
         first=true;
   for(int i=bar; i>=0; i--)
     {
      if(Equity[i]<0)
         return(-1);
      high=Equity[i];
      if(high>maxprofit)
        {
         timemaxprofit=Time[i];
         maxprofit=high;
         maxdrawdown=0.0;
         reldrawdown=0.0;
         maxDD=Alert_Drawdown;
        }
      if(Show_Balance && balanceDD<Balance[i]-Equity[i])
         balanceDD=Balance[i]-Equity[i];
      if(maxdrawdown<maxprofit-Equity[i])
        {
         maxdrawdown=maxprofit-Equity[i];
         maxpeak=maxprofit;
         timehigh=timemaxprofit;
         if(maxpeak>0)
           {
            relative=NormalizeDouble(100*maxdrawdown/maxpeak,1);
            if(reldrawdown<relative)
              {
               reldrawdown=relative;
               drawdown=maxdrawdown;
               timelow=Time[i];
              }
           }
        }
     }
   if(ObjectFind("up")>0)
     {
      if(ObjectGet("up",OBJPROP_PRICE1)<Equity[0])
        {
         Alert("Эквити выше максимального уровня");
         ObjectSet("up",OBJPROP_PRICE1,Equity[0]);
        }
     }
   if(ObjectFind("down")>0)
     {
      if(ObjectGet("down",OBJPROP_PRICE1)>Equity[0])
        {
         Alert("Эквити ниже минимального уровня");
         ObjectSet("down",OBJPROP_PRICE1,Equity[0]);
        }
     }

   if(Alert_Drawdown>0)
     {
      if(reldrawdown>maxDD)
        {
         maxDD=reldrawdown;
         if(maxDD>Max_Drawdown)
           {
            text=StringConcatenate("Внимание! Превышен уровень допустимой просадки на ",DoubleToStr(maxDD-Max_Drawdown,1),"%\n");
            text=StringConcatenate(text,"Допустимая просадка задана на уровне ",DoubleToStr(Max_Drawdown,1),"%\n");
           }
         else
           {
            text=StringConcatenate("Превышен уровень сигнальной просадки на ",DoubleToStr(maxDD-Alert_Drawdown,1),"%\n");
            text=StringConcatenate(text,"Сигнальная просадка задана на уровне ",DoubleToStr(Alert_Drawdown,1),"%\n");
           }
         drawdownstr=StringConcatenate(DoubleToStr(reldrawdown,1),"% (",DoubleToStr(drawdown,2)," ",AccountCurrency(),")");
         text=StringConcatenate(text,"Просадка в средствах за текущий период составила ",drawdownstr,"\n");
         if(balanceDD>0)
            text=StringConcatenate(text,"Просадка от баланса - ",DoubleToStr(balanceDD,2)," ",AccountCurrency(),"\n");
         text=StringConcatenate(text,"Название индикатора: ",ShortName);
         Alert(text);
         if(maxDD>Max_Drawdown)
            clr=Red;
         else
            clr=DarkOrange;
         LineCreate("Drawdown Line",OBJ_TREND,2,clr,"       "+drawdownstr,timehigh,maxpeak,timelow,maxpeak-drawdown);
        }
     }
   LineCreate("Begin Monitoring",OBJ_VLINE,1,SlateGray,"Begin Monitoring",time,0);
   level=NormalizeDouble(maxprofit,2);
   LineCreate("Max Profit",OBJ_TREND,1,DodgerBlue,"Max Profit",timemaxprofit,level,Time[0],level);
   level=NormalizeDouble(maxprofit*(1-Alert_Drawdown/100),2);
   LineCreate("Alert Drawdown",OBJ_TREND,1,DarkOrange,"Alert Drawdown "+DoubleToStr(Alert_Drawdown,1)+"%",timemaxprofit,level,Time[0],level);
   level=NormalizeDouble(maxprofit*(1-Max_Drawdown/100),2);
   LineCreate("Max Drawdown",OBJ_TREND,1,Red,"Max Drawdown "+DoubleToStr(Max_Drawdown,1)+"%",timemaxprofit,level,Time[0],level);
   if(Show_Info)
     {
      curdrawdown=maxprofit-Equity[0];
      text=StringConcatenate(": ",DoubleToStr(curdrawdown,2)," ",AccountCurrency()," (",DoubleToStr(100*curdrawdown/maxprofit,2),"%)");
      LabelCreate("Current Drawdown",text,90);
     }
   return(0);
  }
//+------------------------------------------------------------------+
//|  Определение размера контракта                                   |
//+------------------------------------------------------------------+
double LotSize(string symbol,datetime tbar)
  {
   double size,close1,close2;
   string BQ,currency=AccountCurrency();
   int pcm=MarketInfo(symbol,MODE_PROFITCALCMODE);
   switch(pcm)
     {
      case 0:
        {
         int sbar=iBarShift(symbol,0,tbar);
         size=MarketInfo(symbol,MODE_LOTSIZE);
         if(StringSubstr(symbol,3,3)=="USD")
            break;
         if(StringSubstr(symbol,0,3)=="USD")
           {
            close1=iClose(symbol,0,sbar);
            if(close1>0)
               size=size/close1;
           }
         else
           {
            BQ=StringSubstr(symbol,0,3)+"USD";
            if(iClose(BQ,0,0)==0)
               BQ="USD"+StringSubstr(symbol,0,3);
            if(iClose(BQ,0,0)==0)
               break;
            int BQbar=iBarShift(BQ,0,tbar);
            close1=iClose(symbol,0,sbar);
            close2=iClose(BQ,0,BQbar);
            if(close1>0 && close2>0)
              {
               if(StringSubstr(BQ,0,3)=="USD")
                  size=size/close2/close1;
               else
                  size=size*close2/close1;
              }
           }
        }
      break;
      case 1:
         size=MarketInfo(symbol,MODE_LOTSIZE);
         break;
      case 2:
         size=MarketInfo(symbol,MODE_TICKVALUE)/MarketInfo(symbol,MODE_TICKSIZE);
     }
   if(currency!="USD")
     {
      BQ=currency+"USD";
      if(iClose(BQ,0,0)==0)
        {
         BQ="USD"+currency;
         close1=iClose(BQ,0,iBarShift(BQ,0,tbar));
         if(close1>0)
            size*=close1;
        }
      else
        {
         close1=iClose(BQ,0,iBarShift(BQ,0,tbar));
         if(close1>0)
            size/=close1;
        }
     }
   return(size);
  }
//+------------------------------------------------------------------+
//|  Выбор ордера по критериям                                       |
//+------------------------------------------------------------------+
bool SelectPosition()
  {
   if(Only_Magics!="" && StringFind(Only_Magics,DoubleToString(PositionGetInteger(POSITION_MAGIC),0))==-1)
      return(false);
   if(Only_Symbols!="" && StringFind(Only_Symbols,PositionGetString(POSITION_SYMBOL))==-1)
      return(false);
   else
      if(Only_Current && PositionGetString(POSITION_SYMBOL)!=Symbol())
         return(false);
   if(Only_Comment!="" && StringFind(PositionGetString(POSITION_COMMENT),Only_Comment)==-1)
      return(false);
   if(Only_Buys && POSITION_TYPE_BUY!=PositionGetInteger(POSITION_TYPE))
      return(false);
   if(Only_Sells && POSITION_TYPE_SELL!=PositionGetInteger(POSITION_TYPE))
      return(false);
   return(true);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SelectHistory()
  {
   if(Only_Magics!="" && StringFind(Only_Magics,DoubleToString(PositionGetInteger(POSITION_MAGIC),0))==-1)
      return(false);
   if(Only_Symbols!="" && StringFind(Only_Symbols,PositionGetString(POSITION_SYMBOL))==-1)
      return(false);
   else
      if(Only_Current && PositionGetString(POSITION_SYMBOL)!=Symbol())
         return(false);
   if(Only_Comment!="" && StringFind(PositionGetString(POSITION_COMMENT),Only_Comment)==-1)
      return(false);
   if(Only_Buys && POSITION_TYPE_BUY!=PositionGetInteger(POSITION_TYPE))
      return(false);
   if(Only_Sells && POSITION_TYPE_SELL!=PositionGetInteger(POSITION_TYPE))
      return(false);
   return(true);
  }
//+------------------------------------------------------------------+
