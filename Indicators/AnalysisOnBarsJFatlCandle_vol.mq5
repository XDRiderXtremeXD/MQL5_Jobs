//+------------------------------------------------------------------+
//|                                AnalysisOnBarsJFatlCandle_vol.mq5 |
//|                               Copyright © 2018, Nikolay Kositsin | 
//|                              Khabarovsk,   farria@mail.redcom.ru | 
//+------------------------------------------------------------------+
#property copyright "Copyright © 2018, Nikolay Kositsin"
#property link "farria@mail.redcom.ru"
#property description "Информационный форекс индикатор AnalysisOnBarsJFatlCandle отображает бары JFatlCandle, без учета цены, бары отображаются в пунктах, умноженных на усреднённые объёмы."
//---- номер версии индикатора
#property version   "1.02"
//---- отрисовка индикатора в отдельном окне
#property indicator_separate_window
//+----------------------------------------------+
//|  Параметры отрисовки индикатора              |
//+----------------------------------------------+
//---- для расчета и отрисовки индикатора использовано пять буферов
#property indicator_buffers 5
//---- использовано всего одно графическое построение
#property indicator_plots   1
//---- в качестве индикатора использованы цветные свечи
#property indicator_type1   DRAW_COLOR_CANDLES
#property indicator_color1   clrMagenta,clrGray,clrBlue
//---- отображение метки индикатора
#property indicator_label1  "AnalysisOnBarsJFatlCandle Open;AnalysisOnBarsJFatlCandle High;AnalysisOnBarsJFatlCandle Low;AnalysisOnBarsJFatlCandle Close"
//+----------------------------------------------+
//|  Описание классов усреднений                 |
//+----------------------------------------------+
#include <SmoothAlgorithms.mqh> 
//+----------------------------------------------+
//---- объявление переменной класса CJJMA из файла JJMASeries_Cls.mqh
CJJMA JMA;
//+----------------------------------------------+
//|  объявление констант                         |
//+----------------------------------------------+
#define RESET  0 // Константа для возврата терминалу команды на пересчёт индикатора
//+----------------------------------------------+
//|  ВХОДНЫЕ ПАРАМЕТРЫ ИНДИКАТОРА                |
//+----------------------------------------------+
input uint JLength=15;                                 // глубина JMA сглаживания                   
input int JPhase=100;                                  // параметр JMA сглаживания,
//---- изменяющийся в пределах -100 ... +100, влияет на качество переходного процесса;
input int FATLShift=0;                                 // сдвиг Фатла по горизонтали в барах
input ENUM_APPLIED_VOLUME VolumeType=VOLUME_TICK;      // объём             
//+----------------------------------------------+
//---- объявление динамических массивов, которые будут в дальнейшем использованы в качестве индикаторных буферов
double ExtOpenBuffer[];
double ExtHighBuffer[];
double ExtLowBuffer[];
double ExtCloseBuffer[];
double ExtColorBuffer[];

//---- Объявление целых переменных начала отсчёта данных
int min_rates_total;
//---- Объявление целых переменных для хендлов индикаторов
int Ind_Handle[4];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//---- инициализация глобальных переменных 
   min_rates_total=39+30;

//---- объявление перечислений 
   enum Applied_price_ //Тип константы
     {
      PRICE_CLOSE_ = 1,     //PRICE_CLOSE
      PRICE_OPEN_,          //PRICE_OPEN
      PRICE_HIGH_,          //PRICE_HIGH
      PRICE_LOW_            //PRICE_LOW
     };

//---- получение хендлов индикатора JFatl
   Ind_Handle[0]=iCustom(NULL,0,"JFatl",JLength,JPhase,PRICE_OPEN_,0,0);
   if(Ind_Handle[0]==INVALID_HANDLE)
     {
      Print(" Не удалось получить хендл индикатора iJFatl["+string(0)+"]!");
      return(INIT_FAILED);
     }

   Ind_Handle[1]=iCustom(NULL,0,"JFatl",JLength,JPhase,PRICE_HIGH_,0,0);
   if(Ind_Handle[1]==INVALID_HANDLE)
     {
      Print(" Не удалось получить хендл индикатора iJFatl["+string(1)+"]!");
      return(INIT_FAILED);
     }

   Ind_Handle[2]=iCustom(NULL,0,"JFatl",JLength,JPhase,PRICE_LOW_,0,0);
   if(Ind_Handle[2]==INVALID_HANDLE)
     {
      Print(" Не удалось получить хендл индикатора iJFatl["+string(2)+"]!");
      return(INIT_FAILED);
     }

   Ind_Handle[3]=iCustom(NULL,0,"JFatl",JLength,JPhase,PRICE_CLOSE_,0,0);
   if(Ind_Handle[3]==INVALID_HANDLE)
     {
      Print(" Не удалось получить хендл индикатора iJFatl["+string(3)+"]!");
      return(INIT_FAILED);
     }

//---- превращение динамических массивов в индикаторные буферы
   SetIndexBuffer(0,ExtOpenBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,ExtHighBuffer,INDICATOR_DATA);
   SetIndexBuffer(2,ExtLowBuffer,INDICATOR_DATA);
   SetIndexBuffer(3,ExtCloseBuffer,INDICATOR_DATA);

//---- превращение динамического массива в цветовой, индексный буфер   
   SetIndexBuffer(4,ExtColorBuffer,INDICATOR_COLOR_INDEX);

//---- индексация элементов в буферах как в таймсериях
   ArraySetAsSeries(ExtOpenBuffer,true);
   ArraySetAsSeries(ExtHighBuffer,true);
   ArraySetAsSeries(ExtLowBuffer,true);
   ArraySetAsSeries(ExtCloseBuffer,true);
   ArraySetAsSeries(ExtColorBuffer,true);

//---- осуществление сдвига начала отсчета отрисовки индикатора 1
   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,min_rates_total);
//---- запрет на отображение значений индикатора в левом верхнем углу окна индикатора
   PlotIndexSetInteger(0,PLOT_SHOW_DATA,false);

//---- Установка формата точности отображения индикатора
   IndicatorSetInteger(INDICATOR_DIGITS,0);
//---- имя для окон данных и метка для субъокон 
   string short_name="AnalysisOnBarsJFatlCandle_vol";
   IndicatorSetString(INDICATOR_SHORTNAME,short_name);
//--- завершение инициализации
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
//---- проверка количества баров на достаточность для расчёта
   if(BarsCalculated(Ind_Handle[0])<rates_total
      || BarsCalculated(Ind_Handle[1])<rates_total
      || BarsCalculated(Ind_Handle[2])<rates_total
      || BarsCalculated(Ind_Handle[3])<rates_total
      || rates_total<min_rates_total)
      return(RESET);

//---- объявления локальных переменных 
   int to_copy,limit,bar;
   int maxbar=rates_total-1;
   double vol,xvol;

//---- расчёты необходимого количества копируемых данных и стартового номера limit для цикла пересчёта баров
   if(prev_calculated>rates_total || prev_calculated<=0)// проверка на первый старт расчёта индикатора
     {
      limit=maxbar; // стартовый номер для расчёта всех баров
     }
   else
     {
      limit=rates_total-prev_calculated; // стартовый номер для расчёта новых баров
     }

   to_copy=limit+1;

//---- копируем вновь появившиеся данные в массивы
   if(CopyBuffer(Ind_Handle[0],0,0,to_copy,ExtOpenBuffer)<=0) return(RESET);
   if(CopyBuffer(Ind_Handle[1],0,0,to_copy,ExtHighBuffer)<=0) return(RESET);
   if(CopyBuffer(Ind_Handle[2],0,0,to_copy,ExtLowBuffer)<=0) return(RESET);
   if(CopyBuffer(Ind_Handle[3],0,0,to_copy,ExtCloseBuffer)<=0) return(RESET);
   
//--- индексация элементов в массиве как в таймсерии
   if(VolumeType==VOLUME_TICK) ArraySetAsSeries(tick_volume,true);
   else ArraySetAsSeries(volume,true); 


//---- Основной цикл исправления и окрашивания свечей
   for(bar=limit; bar>=0 && !IsStopped(); bar--)
     {
      double Max=MathMax(ExtOpenBuffer[bar],ExtCloseBuffer[bar]);
      double Min=MathMin(ExtOpenBuffer[bar],ExtCloseBuffer[bar]);
      //----
      ExtHighBuffer[bar]=MathMax(Max,ExtHighBuffer[bar]);
      ExtLowBuffer[bar]=MathMin(Min,ExtLowBuffer[bar]);      
      //----
      ExtHighBuffer[bar]-=ExtOpenBuffer[bar];
      ExtLowBuffer[bar]-=ExtOpenBuffer[bar];
      ExtCloseBuffer[bar]-=ExtOpenBuffer[bar];
      ExtOpenBuffer[bar]-=ExtOpenBuffer[bar];
      //----
      //ExtOpenBuffer[bar]/=_Point;
      ExtHighBuffer[bar]/=_Point;
      ExtLowBuffer[bar]/=_Point;
      ExtCloseBuffer[bar]/=_Point;
      if(VolumeType==VOLUME_TICK) vol=double(tick_volume[bar]);
      else vol=double(volume[bar]);
      xvol=JMA.JJMASeries(maxbar,prev_calculated,rates_total,0,JPhase,JLength,vol,bar,true);
      ExtOpenBuffer[bar]*=xvol;
      ExtHighBuffer[bar]*=xvol;
      ExtLowBuffer[bar]*=xvol;
      ExtCloseBuffer[bar]*=xvol;
      //----
      if(ExtOpenBuffer[bar]<ExtCloseBuffer[bar]) ExtColorBuffer[bar]=2.0;
      else if(ExtOpenBuffer[bar]>ExtCloseBuffer[bar]) ExtColorBuffer[bar]=0.0;
      else ExtColorBuffer[bar]=1.0;
     }
//----     
   return(rates_total);
  }
//+------------------------------------------------------------------+
