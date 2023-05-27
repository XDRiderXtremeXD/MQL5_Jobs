//+------------------------------------------------------------------+
//|                                    Boost_System_Professional.mq5 |
//|                                     Copyright © 2016, surtrading |
//|                                    https://t.me/surtrading_admin |
//+------------------------------------------------------------------+
#property copyright "Creador y Fundador"
#property link "https://t.me/surtrading_admin"
#property description ""
#property version   "1.00"
//#property     icon        "\\Images\\boost.ico"
#property indicator_chart_window 
#property indicator_buffers 2
#property indicator_plots   2
//+----------------------------------------------+
//|  Параметры отрисовки верхнего индикатора     |
//+----------------------------------------------+

#property indicator_type1   DRAW_ARROW
#property indicator_color1  clrWhite
#property indicator_width1  3
#property indicator_label1  "Boost_System_Professional"
//+----------------------------------------------+
//|  Параметры отрисовки нижнего индикатора      |
//+----------------------------------------------+
#property indicator_type2   DRAW_ARROW
#property indicator_color2  clrWhite
#property indicator_width2  3
#property indicator_label2 "Boost_System_Professional"

int FECHA = D'2021.11.30';
int ID    = 51055646;
#define  PREFIX "Boost_System_Professional"
//+----------------------------------------------+
//| Входные параметры индикатора                 |
//+----------------------------------------------+
input uint GSv_range=2;
input int Shift=0; 
input uint  UpLable=234;
input uint  DnLable=233;
//+----------------------------------------------+
double HighestBuffer[];
double LowestBuffer[];

int min_rates_total;
//----
double h,l;
bool cur_h,cur_l;
bool draw_up,draw_dn,initfl;
int  fPoint_i,sPoint_i,s_up,s_dn,drawf,lb;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+  
int OnInit()
  {
    //--------------------------------------------------------------------//
   Comment(PREFIX+" Activado");   
  if( TimeCurrent()>FECHA) 
      {
        Comment("RSI Caducado");
     Alert(Symbol() + "Caduco, Contacta:@surtrading_admin");
      return(1);
   }
  if (AccountInfoInteger(ACCOUNT_LOGIN)!= ID) { 
  Comment("¡ID NO AUTORIZADA");
  return(1);}
 //-----------------------------------------------------------------// 
   min_rates_total=2;
   
   SetIndexBuffer(0,LowestBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,HighestBuffer,INDICATOR_DATA);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,NULL);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,NULL);

   PlotIndexSetInteger(0,PLOT_ARROW,DnLable);
   PlotIndexSetInteger(1,PLOT_ARROW,UpLable);

   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,min_rates_total);
   PlotIndexSetInteger(1,PLOT_DRAW_BEGIN,min_rates_total);

   PlotIndexSetInteger(0,PLOT_SHIFT,Shift);
   PlotIndexSetInteger(1,PLOT_SHIFT,Shift);

   ArraySetAsSeries(LowestBuffer,true);
   ArraySetAsSeries(HighestBuffer,true);

   IndicatorSetString(INDICATOR_SHORTNAME,"Boost_System_Professional");

   IndicatorSetInteger(INDICATOR_DIGITS,_Digits);
//----
  return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(
                const int rates_total,    // количество истории в барах на текущем тике
                const int prev_calculated,// количество истории в барах на предыдущем тике
                const datetime &time[],
                const double &open[],
                const double& high[],     // ценовой массив максимумов цены для расчёта индикатора
                const double& low[],      // ценовой массив минимумов цены  для расчёта индикатора
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[]
                )
  {
//---- проверка количества баров на достаточность для расчёта
   if(rates_total<min_rates_total) return(0);

//---- индексация элементов в массивах как в таймсериях  
   ArraySetAsSeries(open,true);
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);
   ArraySetAsSeries(close,true);

//---- Объявление целых переменных
   int i,bar,bar1,limit,count;

//---- расчёты стартового номера limit для цикла пересчёта баров
   if(prev_calculated>rates_total || prev_calculated<=0)// проверка на первый старт расчёта индикатора
     {
      limit=rates_total-min_rates_total; // стартовый номер для расчёта всех баров
      initfl=0;
      draw_up=0;
      draw_dn=0;
      cur_h=0;
      cur_l=0;
     }
   else
     {
      limit=rates_total-prev_calculated; // стартовый номер для расчёта новых баров
     }

//---- первоначальная инициализация
   if(initfl!=1) myInit(rates_total,open,high,low,close);
   int bars2=rates_total-2;
   int bars1=rates_total-1;

//---- основной цикл расчёта индикатора
   for(bar=limit; bar>=0 && !IsStopped(); bar--)
     {
      bar1=bar+1;
      count=bars1-bar;
      HighestBuffer[bar]=NULL;
      LowestBuffer[bar]=NULL;
      //---- если на предыдущем баре был отрисован экстремум
      if((HighestBuffer[bar1]>0 || LowestBuffer[bar1]>0)&& lb!=count)
        {
         if(draw_up) s_dn=0;
         else if(draw_dn) s_up=0;
        }
      if(lb!=count)
        {
         cur_h=0;
         cur_l=0;
        }
      if(bar>bars2-drawf || (high[bar]<=high[bar1] && low[bar]>=low[bar1])) continue;
      if(draw_up)
        {
         //---- если линия направлена вверх
         if(high[bar]>h)
           {
            //---- если достигнут новый максимум
            h=high[bar];
            cur_h=1;
           }
         if(low[bar]<l)
           {
            //---- если достигнут новый минимум
            l=low[bar];
            //---- если это не тот же самый бар
            if(lb!=count || cur_l!=1)s_dn++;
            cur_l=1;
           }
         //---- если счетчики равны
         if(s_up==s_dn)
           {
            //---- если последний бар одновременно новый максимум и минимум
            if(cur_h==cur_l && cur_l==1)
              {
               //---- если свеча медвежья
               if(close[bar]<=open[bar])
                 {
                  draw_up=0;
                  draw_dn=1;
                  fPoint_i=sPoint_i;
                  sPoint_i=count;
                  LowestBuffer[bar]=l;
                  //Print("Entra44444444");
                  for(i=bars2-fPoint_i; i>bar; i--)
                    {
                     HighestBuffer[i]=NULL;
                     LowestBuffer[i]=NULL;
                    }
                 }
               else
                 {
                  //---- если свеча бычья
                  sPoint_i=count;
                  HighestBuffer[bar]=h;
                  for(i=bars2-fPoint_i; i>bar; i--)
                    {
                     HighestBuffer[i]=NULL;
                     LowestBuffer[i]=NULL;
                    }
                 }
              }
            else
              {
               //---- если последний бар только новый максимум
               if(cur_h==1)
                 {
                  sPoint_i=count;
                  HighestBuffer[bar]=h;
                  l=low[bar];
                  for(i=bars2-fPoint_i; i>bar; i--)
                    {
                     HighestBuffer[i]=NULL;
                     LowestBuffer[i]=NULL;
                    }
                 }
               else
                 {
                  if(cur_l==1)
                    {
                     //---- если последний бар только новый минимум
                     draw_up=0;
                     draw_dn=1;
                     fPoint_i=sPoint_i;
                     sPoint_i=count;
                     LowestBuffer[bar]=l;
                     if(bar==0)Alert("Confirmacion Buy");
                     h=high[bar];
                     for(i=bars2-fPoint_i; i>bar; i--)
                    {
                     HighestBuffer[i]=NULL;
                     LowestBuffer[i]=NULL;
                    }
                    }
                 }
              }
           }
         else
           {
            //---- иначе если смены направления нет явно (счетчик Dn свечей не равен GSv_range)
            //---- если достигнут новый максимум
            if(cur_h==1)
              {
               sPoint_i=count;
               HighestBuffer[bar]=h;
               for(i=bars2-fPoint_i; i>bar; i--)
                    {
                     HighestBuffer[i]=NULL;
                     LowestBuffer[i]=NULL;
                    }
               l=low[bar];
              }
           }
        }
      else
        {
         //---- если линия направлена вниз
         if(high[bar]>h)
           {
            //---- если достигнут новый максимум
            h=high[bar];
            if(lb!=count || cur_h!=1) s_up++;
            cur_h=1;
            //---- если это не тот же самый бар
           }
         if(low[bar]<l)
           {
            //---- если достигнут новый минимум
            l=low[bar];
            cur_l=1;
           }
         //---- если счетчики равны 
         if(s_up==s_dn)
           {
            //---- если последний бар одновременно новый максимум и минимум
            if(cur_h==cur_l && cur_l==1)
              {
               //---- если свеча медвежья
               if(close[bar]<=open[bar])
                 {
                  sPoint_i=count;
                  LowestBuffer[bar]=l;
                  //Print("Entra11111");
                  for(i=bars2-fPoint_i; i>bar; i--)
                    {
                     HighestBuffer[i]=NULL;
                     LowestBuffer[i]=NULL;
                    }
                 }
               else
                 {
                  //---- если свеча бычья
                  draw_up=1;
                  draw_dn=0;
                  fPoint_i=sPoint_i;
                  sPoint_i=count;
                  HighestBuffer[bar]=h;
                  for(i=bars2-fPoint_i; i>bar; i--)
                    {
                     HighestBuffer[i]=NULL;
                     LowestBuffer[i]=NULL;
                    }
                 }
              }
            else
              {
               //---- если последний бар только новый максимум
               if(cur_h==1)
                 {
                  draw_up=1;
                  draw_dn=0;
                  fPoint_i=sPoint_i;
                  sPoint_i=count;
                  HighestBuffer[bar]=h;
                  if(bar==0)Alert("Confirmacion Sell");
                  l=low[bar];
                  for(i=bars2-fPoint_i; i>bar; i--)
                    {
                     HighestBuffer[i]=NULL;
                     LowestBuffer[i]=NULL;
                    }
                 }
               else
                 {
                  if(cur_l==1)
                    {
                     //---- если последний бар только новый минимум
                     sPoint_i=count;
                     LowestBuffer[bar]=l;
                    // Print("Entra2222222");
                     h=high[bar];
                     for(i=bars2-fPoint_i; i>bar; i--)
                    {
                     HighestBuffer[i]=NULL;
                     LowestBuffer[i]=NULL;
                    }
                    }
                 }
              }
           }
         else
           {
            //---- иначе если смены направления нет явно (счетчик Up свечей не равен GSv_range)
            //---- если достигнут новый минимум
            if(cur_l==1)
              {
               sPoint_i=count;
               LowestBuffer[bar]=l;
              Print("Entra3333333333   ",l);
               for(i=bars2-fPoint_i; i>bar; i--)
                    {
                     HighestBuffer[i]=NULL;
                     LowestBuffer[i]=NULL;
                    }
               h=high[bar];
              }
           }
        }
      if(lb!=count) lb=count;
     }
//----     
   return(rates_total);
  }
//+------------------------------------------------------------------+
// Функция начальной инициализации индикатора                        |
//+------------------------------------------------------------------+
void myInit(
            const int bars,
            const double &Open[],
            const double &High[],
            const double &Low[],
            const double &Close[])
  {
  Print("Primera vez");
//---- 
   int index,index1;
   int bars1=bars-1;
   fPoint_i=0;
   h=High[bars1];
   l=Low[bars1];
   for(index=bars-2; index>=0; index--)
     {
      index1=index+1;
      if(High[index]>High[index1] || Low[index]<Low[index1])
        {
         if(High[index]>h && High[index]>High[index1]) s_up++;
         if(Low[index]<l && Low[index]<Low[index1]) s_dn++;
        }
      else continue;
      if(s_up==s_dn && s_up==GSv_range)
        {
         h=High[index];
         l=Low[index];
         sPoint_i=bars1-index;
         if(Close[index]>=Open[index])
           {
            s_dn=0;
            LowestBuffer[bars1]=Low[bars1];
            HighestBuffer[index]=High[index];
            draw_up=1;
            break;
           }
         else
           {
            s_up=0;
            HighestBuffer[bars1]=High[bars1];
            LowestBuffer[index]=Low[index];
            draw_dn=1;
            break;
           }
        }
      else
        {
         h=High[index];
         l=Low[index];
         sPoint_i=bars1-index;
         if(s_up==GSv_range)
           {
            s_dn=0;
            LowestBuffer[bars1]=Low[bars1];
            HighestBuffer[index]=High[index];
            draw_up=1;
            break;
           }
         else
           {
            if(s_dn==GSv_range)
              {
               s_up=0;
               HighestBuffer[bars1]=High[bars1];
               LowestBuffer[index]=Low[index];
               draw_dn=1;
               break;
              }
           }
        }
     }
   initfl=1;
   drawf=sPoint_i;
//----
  }
//+------------------------------------------------------------------+
