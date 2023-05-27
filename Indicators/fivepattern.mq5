//+------------------------------------------------------------------+
//|                                                  FivePattern.mq5 |
//|                                     Copyright 2014, A. Emelyanov |
//|                                        A.Emelyanov2010@yandex.ru |
//+------------------------------------------------------------------+
//| Indicator: � & W Wave Patterns by A. Merrill                     |
//| �������������:                                                   |
//| � & W Wave Patterns by Arthur A. Merrill, Chappaqua,             |
//| N.Y.: Analysis Press, 1983                                       |
//+------------------------------------------------------------------+
//| Now   version 2.01 - stable, for trade.                          |
//| Prev. version 1.XX - for test.                                   |
//+------------------------------------------------------------------+
#property copyright "Copyright 2014, A. Emelyanov"
#property link      "A.Emelyanov2010@yandex.ru"
#property version   "2.01"
//+------------------------------------------------------------------+
//| ������������ ������� (������)                                    |
//+------------------------------------------------------------------+
//#property icon "\\Images\\fp.ico"
//+------------------------------------------------------------------+
//| �������� ���������� (���������� ������������)                    |
//+------------------------------------------------------------------+
#property description "� and W Wave Patterns by A. Merrill.\n"
#property description "�  Name Indicator buffers:"
#property description "0  ExtPointE[]    - Point E;"
#property description "1  ExtDeltaDE[]   - Delta DE;"
#property description "2  ExtEvolution[] - Point Evolution;"
#property description "3  ExtMutation[]  - Point Mutation;"
#property description "4  ExtSumModel[]  = Count_Evolution/(Count_Evolution + Count_Mutation)."
//+------------------------------------------------------------------+
//| �������� �������� ����������                                     |
//+------------------------------------------------------------------+
#property indicator_buffers 5
#property indicator_plots   5
#property indicator_label1  "Point E"
#property indicator_type1   DRAW_NONE
#property indicator_label2  "Delta DE"
#property indicator_type2   DRAW_NONE
#property indicator_label3  "Evolution"
#property indicator_type3   DRAW_NONE
#property indicator_label4  "Mutation"
#property indicator_type4   DRAW_NONE
#property indicator_label5  "Sum Model"
#property indicator_type5   DRAW_NONE
//+------------------------------------------------------------------+
//| ������������ ����������                                          |
//+------------------------------------------------------------------+
#include <MyMath\Pattern\MyCPatternZigzag.mqh>
#include <MyArrays\MyCListPattern.mqh>
#include <MyObjects\MyCComment.mqh>
//+------------------------------------------------------------------+
//| input parameters                                                 |
//+------------------------------------------------------------------+
//--- Main
input  int             Depth      = 24;         // Zigzag: ������ ���� ������(Depth)
input  int             Deviation  = 12;         // Zigzag: ��������� ���� � ������(Deviation)
input  int             Backstep   = 9;          // Zigzag: ������ �� ������ ������(Backstep)
sinput int             HistSize   = 500;        // Zigzag: ������ ������� ��� ��������
//--- Arrow
sinput color           ColorArrow = clrBlue;    // ���� ��������� �����
//--- Trend
sinput color           ColorTrend = clrGold;    // ���� ��������� �����
sinput int             WidthTrend = 2;          // ������� ��������� �����
sinput bool            BackTrend  = true;       // ������ ���� ��� ��������� �����
sinput ENUM_LINE_STYLE StyleTrend = STYLE_SOLID;// ����� ��������� �����
//--- HLine
sinput color           ColorUpHLine   = clrBlue;// ���� ����� �������������        
sinput color           ColorDownHLine = clrRed; // ���� ����� ���������        
sinput int             WidthHLine = 2;          // ������� ����� ������
sinput bool            BackHLine  = true;       // ������ ���� ��� ����� ������
sinput ENUM_LINE_STYLE StyleHLine = STYLE_SOLID;// ����� ����� ������
//+------------------------------------------------------------------+
//| ���������� ����������                                            |
//+------------------------------------------------------------------+
int                    Line       = 1;          // ����� ������ ������ �����������
MyCPatternZigzag*      MyPatternZigzag;         // �����: ������ ��������� �������
MyCListPattern*        MyListPattern;           // �����: ��������� ����������� ��������
MyCComment*            MyComment;               // �����: �����������
//+------------------------------------------------------------------+
//|������ ��� ����������(������������ � ���������� �������� ��������)|
//+------------------------------------------------------------------+
double                 ExtPointE[];             // �����: ��� �������� ����� E
double                 ExtDeltaDE[];            // �����: ��� �������� ����� ����� D-E(� �������!)
double                 ExtEvolution[];          // �����: ��� �������� ��������
double                 ExtMutation[];           // �����: ��� �������� �������
double                 ExtSumModel[];           // �����: ��� �������� ��������-������
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   //--- ���������� ������� ���, ������ ������ ���� ������ �� ������� ����, ����� ������������ �� ������ ��������
   if(!ChartShiftGet(0))
     {
      ChartShiftSet(true, 0);
     }
   //---
   SetIndexBuffer(0,ExtPointE,    INDICATOR_DATA);
   SetIndexBuffer(1,ExtDeltaDE,   INDICATOR_DATA);
   SetIndexBuffer(2,ExtEvolution, INDICATOR_DATA);
   SetIndexBuffer(3,ExtMutation,  INDICATOR_DATA);
   SetIndexBuffer(4,ExtSumModel,  INDICATOR_DATA);
   IndicatorSetInteger(INDICATOR_DIGITS,_Digits);
   //--- 
   MyPatternZigzag= new MyCPatternZigzag;
   MyComment      = new MyCComment;
   MyListPattern  = new MyCListPattern;
   //--- Main
   MyPatternZigzag.SetDepth(Depth);
   MyPatternZigzag.SetDeviation(Deviation);
   MyPatternZigzag.SetBackstep(Backstep);
   MyPatternZigzag.AddPointerCommet(MyComment);
   MyPatternZigzag.SetNumberLineComment(Line);         // ����� ������ ��������
   MyPatternZigzag.SetSizeBuffers(HistSize);
   //--- Arrow, HLine & Trend
   MyListPattern.SetColorArrow(ColorArrow);
   MyListPattern.SetColorTrend(ColorTrend);
   MyListPattern.SetStyleTrend(StyleTrend);
   MyListPattern.SetWidthTrend(WidthTrend);
   MyListPattern.SetBackTrend(BackTrend);
   MyListPattern.SetStyleHLine(StyleHLine);
   MyListPattern.SetColorUpHLine(ColorUpHLine);
   MyListPattern.SetColorDownHLine(ColorDownHLine);
   MyListPattern.SetWidthHLine(WidthHLine);
   MyListPattern.SetBackHLine(BackHLine);
   //---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Deinit                                                           |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   delete MyPatternZigzag;
   delete MyListPattern;
   delete MyComment;
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
   //--- ������ ����������� ��������� ��� "����� �������"
   if(rates_total > HistSize)
     {
      //--- ���� �� ��� �������? � ��� �� ������ �� �����...
      int nHowMush = rates_total-prev_calculated;
      //--- ���� ��������
      if(nHowMush > 0)
        {
         //--- ��������� ����������
         double   new_high[],new_low[];
         datetime new_time[];
         //--- ���������� ������ �������
         ArrayResize(new_high,HistSize,0);
         ArrayResize(new_low,HistSize,0);
         
         ArrayResize(new_time,HistSize,0);
         //--- ������ �� ���� � ������� �������
         int nStart = 0;                              // ������ ������ ��������(���������)
         int nCopy  = 0;                              // ������ � �������� ���������� ����������� �� ��������� ������
         if(prev_calculated == 0)
           {//--- ������ ��������
            nStart = HistSize - 1;
           }else
              {//--- ����������� ��������
               nStart = prev_calculated - 1;
              }
         //--- �������
         for(;nStart<rates_total;nStart++)
           {
            //--- ����� �� ���� �������� ����������
            nCopy = 1+nStart-HistSize;
            //--- ����������� ������
            ArrayCopy(new_low, low, 0,nCopy,HistSize);
            ArrayCopy(new_high,high,0,nCopy,HistSize);
            ArrayCopy(new_time,time,0,nCopy,HistSize);
            //--- ������
            MyPatternZigzag.GetNamePattern(new_high,new_low,new_time);
            //--- ���������� ������: Evolution, Mutation, SumModel
            double dwDE          = MathAbs(MyPatternZigzag.GetE()-MyPatternZigzag.GetD());
            dwDE                 = dwDE/_Point;
            ExtDeltaDE[nStart]   = dwDE;                               // ����� ��� �������� ����� ����� D-E
            ExtPointE[nStart]    = MyPatternZigzag.GetE();             // ����� ��� �������� ����� E
            ExtEvolution[nStart] = MyPatternZigzag.GetPointEvolution();// ����� ��� �������� ��������
            ExtMutation[nStart]  = MyPatternZigzag.GetPointMutation(); // ����� ��� �������� �������
            ExtSumModel[nStart]  = MyPatternZigzag.GetSumModel();      // ����� ��� �������� ��������-������
           }
         //--- ����� �������
         DrawPattern();
        }
     }else
        {
         return(0);
        }
   //--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| ������� ��� ����������� �������� �� �������                      |
//+------------------------------------------------------------------+
void DrawPattern(void)
  {
   //--- 1. ������� �� ����� �������
   MyPatternZigzag.PrintComment();
   //--- 2. ������� �� ����� �������
   MyListPattern.Insert(MyPatternZigzag.GetA(), MyPatternZigzag.GetTimeA(), 
                        MyPatternZigzag.GetB(), MyPatternZigzag.GetTimeB(),
                        MyPatternZigzag.GetC(), MyPatternZigzag.GetTimeC(),
                        MyPatternZigzag.GetD(), MyPatternZigzag.GetTimeD(),
                        MyPatternZigzag.GetE(), MyPatternZigzag.GetTimeE(),
                        MyPatternZigzag.GetPointEvolution(),MyPatternZigzag.GetTimeEvolution(),
                        MyPatternZigzag.GetPointMutation(), MyPatternZigzag.GetTimeMutation());   
  }
//+------------------------------------------------------------------+
//| ������� ����������, ������� �� ����� ����������� �������� �������|
//| � �������� �� ������� ����.                                      |
//+------------------------------------------------------------------+
bool ChartShiftGet(long chart_ID=0)
  {
   //--- ���������� ���������� ��� ��������� �������� ��������
   long value;
   //--- ������� �������� ������
   ResetLastError();
   //--- ������� �������� ��������
   if(!ChartGetInteger(chart_ID,CHART_SHIFT,0,value))
     {
      //--- ������� ��������� �� ������ � ������ "��������"
      Print(__FUNCTION__+", Error Code = ",GetLastError());
      return(false);
     }
   //--- �������� value... :-)
   if(value <= 0) return(false);
   //--- �������� ����������
   return(true);
  }
//+------------------------------------------------------------------+
//| ������� ��������/��������� ����� ����������� �������� ������� �  |
//| �������� �� ������� ����.                                        |
//+------------------------------------------------------------------+
bool ChartShiftSet(bool value, long chart_ID=0)
  {
   //--- ������� �������� ������
   ResetLastError();
   //--- ��������� �������� ��������
   if(!ChartSetInteger(chart_ID,CHART_SHIFT,0,value))
     {
      //--- ������� ��������� �� ������ � ������ "��������"
      Print(__FUNCTION__+", Error Code = ",GetLastError());
      return(false);
     }
   //--- �������� ����������
   return(true);
  }
//+------------------------------------------------------------------+