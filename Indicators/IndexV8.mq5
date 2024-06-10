//+------------------------------------------------------------------+
//|                                                      IndexV8.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#property indicator_separate_window

#property indicator_buffers 3
#property indicator_plots 3

#property indicator_type1   DRAW_LINE
#property indicator_style1  STYLE_SOLID
#property indicator_color1  clrRed
#property indicator_width1  1

#property indicator_style2  STYLE_DASH
#property indicator_color2  clrGold
#property indicator_width2  1

#property indicator_style3  STYLE_DOT
#property indicator_color3  clrLime
#property indicator_width3  1


//+------------------------------------------------------------------+
//| Input Parameters                                                 |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
input string             Formula           = "USD";                                // Formula (* and / only)
input double             Power             = 1.0;                                  // Power
input double             Scale             = 1.0;                                  // Scale

input ENUM_APPLIED_PRICE AppliedPrice      = PRICE_CLOSE;                          // Applied price

input int                MAPeriod          = 0;                                    // MA period

input int                DiffMAPeriod      = 0;                                    // Diff MA period

input ENUM_MA_METHOD     MAMethod          = MODE_SMA;                             // MA method

input string             IndexCalcCurrs    = "AUD,CAD,CHF,EUR,GBP,JPY,NZD,USD";    // Index calculation currency set

input bool               LogScale          = false;                                // Logarithmic scale

input bool               ShowMAs           = false;                                // Show Moving Averages
input int                PeriodMA1         = 20;                                   // Short MA Period
input ENUM_MA_METHOD     MA1Method         = MODE_SMA;                             // Short MA Method
input int                PeriodMA2         = 40;                                   // Long MA Period
input ENUM_MA_METHOD     MA2Method         = MODE_SMA;                             // Long MA Method

input int                MaxBars           = 100;                                  // Bar count limit

input bool               OpenCharts        = false;                                 // Open required charts


//+------------------------------------------------------------------+
//| Internal Variables                                               |
//+------------------------------------------------------------------+


string IndexBaseCurr = "USD";


double X[], MA1[], MA2[];

//numenator
string _n[];
int _nCount = 0;

//denominator
string _d[];
int _dCount = 0;

string _indexCalcCurrsA[], shortname;

struct Symbs
  {
   bool              New;
   int               Dir;
   long              Chart;
   MqlRates          Rates[];
   string            Name;
  };

Symbs gS[];

int gicrossCount;
bool IndStart, gbFirst;


//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CheckSymbol(string &Sym)
  {

   bool   exist = false;

   for(int i = 0; i < SymbolsTotal(false); i++)
     {

      string name = SymbolName(i, false);
      if(StringFind(name, Sym, 0) > -1)
        {
         bool prevselect = (bool) SymbolInfoInteger(name, SYMBOL_SELECT);
         if(prevselect || (!prevselect && SymbolSelect(name, true)))
           {

            if(SymbolInfoInteger(name, SYMBOL_TRADE_MODE) != SYMBOL_TRADE_MODE_DISABLED)
              {
               exist = true;

               Sym   = name;
               break;
              }

            else
              {

               if(!prevselect)
                  SymbolSelect(name, false);
              }
           }

        }
     }


   return(exist);

  }

//+------------------------------------------------------------------+

// curr1/curr2: EUR/USD, #AA/USD, USD/_SP500, USD/AUD.
bool index__addSymbol(string curr1, string curr2, Symbs &gs[])
  {

   string sym = "";
   bool isCross = true;
   long calcmode;
   string base1 = SymbolInfoString(curr1, SYMBOL_CURRENCY_BASE);
   string base2 = SymbolInfoString(curr2, SYMBOL_CURRENCY_BASE);

   if(curr2 == "USD" && ((SymbolInfoInteger(curr1, SYMBOL_TRADE_CALC_MODE, calcmode) && calcmode != 0) || (base1 != NULL && SymbolInfoString(curr1, SYMBOL_CURRENCY_PROFIT) == base1)))
     {
      sym = curr1;
      isCross = false;

     }
   else
      if(curr1 == "USD"  && ((SymbolInfoInteger(curr2, SYMBOL_TRADE_CALC_MODE, calcmode) && calcmode != 0) || (base2 != NULL && SymbolInfoString(curr2, SYMBOL_CURRENCY_PROFIT) == base2)))
        {
         sym = curr2;
         isCross = false;

        }
      else
        {
         sym = curr1 + curr2;
        }


   if(!CheckSymbol(sym))
     {
      if(isCross)
        {
         sym = curr2 + curr1;
         if(!CheckSymbol(sym))
            sym = "";
        }

      else
         sym = "";
     }


   if(sym != "")
     {
      int si = StringArrayIndexOf(gs, sym);
      if(isCross)
        {
         if(si >= 0)
           {

            if(curr1 == SymbolInfoString(sym, SYMBOL_CURRENCY_BASE))
               gs[si].Dir++;
            else
               gs[si].Dir--;
           }
         else
           {

            if(curr1 == SymbolInfoString(sym, SYMBOL_CURRENCY_BASE))
               SymbsArrayAdd(gs, sym, 1);
            else
               SymbsArrayAdd(gs, sym, -1);


           }
        }
      else
        {
         if(si >= 0)
           {

            if(StringFind(sym, curr1, 0) >= 0)
               gs[si].Dir++;
            else
               gs[si].Dir--;
           }
         else
           {

            if(StringFind(sym, curr1, 0) >= 0)
               SymbsArrayAdd(gs, sym, 1);
            else
               SymbsArrayAdd(gs, sym, -1);
           }
        }

      return(true);
     }

   return(false);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int SymbsArrayAdd(Symbs& arr[], string value, int dir)
  {
   int c = ArraySize(arr);
   ArrayResize(arr, c + 1);
   arr[c].Name = value;
   arr[c].Dir  = dir;

   CopyRates(value,_Period,0,WHOLE_ARRAY,arr[c].Rates);
   return(c);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int StringArrayAdd(string& arr[], string value)
  {
   int c = ArraySize(arr);
   ArrayResize(arr, c + 1);
   arr[c] = value;
   return(c);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool index__getSymbols(string index, string baseCurr, string& currs[], Symbs &gs[])
  {

   bool ok = true;

   int cc = ArraySize(currs);

   for(int i = 0; i < cc; i++)
     {
      string curr2 = currs[i];
      if(index != curr2)
        {
         if(index == baseCurr)
            index__addSymbol(baseCurr, curr2, gs);
         else
            if(curr2 == baseCurr)
               index__addSymbol(index, baseCurr, gs);
            else
              {
               if(!(index__addSymbol(index, baseCurr, gs)
                    && index__addSymbol(baseCurr, curr2, gs)))
                 {

                  continue;
                 }
              }
        }
     }

   ok = ok && (ArraySize(gs) != 0);

   return(ok);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int StringArrayIndexOf(Symbs& array[], string value, int startingFrom = 0)
  {
   int index = - 1;
   int count = ArraySize(array);

   for(int i = startingFrom; i < count; i++)
     {
      if(array[i].Name == value)
        {
         index = i;
         break;
        }
     }

   return(index);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int StringArrayIndexOf(string& array[], string value, int startingFrom = 0)
  {
   int index = - 1;
   int count = ArraySize(array);

   for(int i = startingFrom; i < count; i++)
     {
      if(array[i] == value)
        {
         index = i;
         break;
        }
     }

   return(index);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IndexInitA(string index, string baseCurr, string& calcCurrs[], Symbs &gs[], int& crossCount)
  {


   ArrayResize(gs, 0);
   crossCount = ArraySize(calcCurrs);
   if(StringArrayIndexOf(calcCurrs, index) == -1)
      crossCount++;

   bool ok = crossCount > 0;
   ok = ok && index__getSymbols(index, baseCurr, calcCurrs, gs);

   return(ok);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string TrimLeft(string s, int ch = 0)
  {
   if(ch == 0)
     {
      StringTrimLeft(s);
     }
   else
     {
      int len = StringLen(s);


      int cut = 0;

      for(int i = 0; i < len; i++)
        {
         if(StringGetCharacter(s, i) == ch)
            cut++;
         else
            break;
        }

      if(cut > 0)
        {
         if(cut > len - 1)
            s = "";
         else
            s = StringSubstr(s, cut);
        }
     }
   return(s);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string TrimRight(string s, int ch = 0)
  {
   if(ch == 0)
     {
      StringTrimRight(s);
     }
   else
     {
      int len = StringLen(s);


      int cut = len;

      for(int i = len - 1; i >= 0; i--)
        {
         if(StringGetCharacter(s, i) == ch)
            cut--;
         else
            break;
        }

      if(cut != len)
        {
         if(cut == 0)
            s = "";
         else
            s = StringSubstr(s, 0, cut);
        }
     }
   return(s);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string Trim(string s, int ch = 0)
  {
   if(ch == 0)
     {
      StringTrimRight(s);
      StringTrimLeft(s);
      return s;
     }
   else
      return(TrimLeft(TrimRight(s, ch), ch));
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int SplitString(string s, string sep, string& parts[], bool removeEmpty = false)
  {
   int count = 0;
   int sepLen = StringLen(sep);

   string part;
   while(true)
     {
      int p = StringFind(s, sep);
      if(p >= 0)
        {
         if(p == 0)
            part = "";
         else
            part = StringSubstr(s, 0, p);

         if(!removeEmpty || (Trim(part) != ""))
           {
            count++;
            ArrayResize(parts, count);
            parts[count - 1] = part;
           }

         s = StringSubstr(s, p + sepLen);
        }
      else
        {

         if(!removeEmpty || (Trim(s) != ""))
           {
            count++;
            ArrayResize(parts, count);
            parts[count - 1] = s;
           }

         break;
        }
     }


   if((count > 0) && (parts[count - 1] == ""))
     {
      count--;
      ArrayResize(parts, count);
     }

   return(count);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int StringArrayGroupCount(string& src[], string& dest[], int& count[])
  {
   int srcCount = ArraySize(src);


   int destCount = 0;
   ArrayResize(dest, 0);
   ArrayResize(count, 0);

   for(int i = 0; i < srcCount; i++)
     {
      int index = StringArrayIndexOf(dest, src[i]);

      if(index >= 0)
        {

         count[index]++;
        }
      else
        {

         destCount++;
         ArrayResize(dest, destCount);
         ArrayResize(count, destCount);
         dest[destCount - 1] = src[i];
         count[destCount - 1] = 1;
        }
     }

   return (destCount);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int StringArrayGroup(string& src[], string& dest[])
  {
   int count[];
   int destCount = StringArrayGroupCount(src, dest, count);
   return (destCount);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringArrayToString(string& a[], string separator)
  {
   string res = "";
   int c = ArraySize(a);

   for(int i = 0; i < c; i++)
     {
      if(i != 0)
         StringConcatenate(res,res, separator);

      res = res + a[i];
     }

   return(res);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string ReplaceString(string inputString, string from, string to)
  {
   string result = "";
   int inputLength = StringLen(inputString);
   int fromLength = StringLen(from);

   for(int i = 0; i < inputLength; i++)
     {
      string s = StringSubstr(inputString, i, fromLength);

      if(s == from)
        {
         StringConcatenate(result,result, to);
         i += fromLength - 1;
        }
      else
        {
         StringConcatenate(result,result, StringSubstr(inputString, i, 1));
        }
     }

   return(result);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string UpperString(string s)
  {
   StringToUpper(s);
   return(s);
  }


//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   IndStart = true;
   gicrossCount = 0;

   _nCount = _dCount = 0;
   ArrayResize(_n, _nCount);
   ArrayResize(_d, _dCount);

   string f = UpperString(Trim(Formula));


   ushort ch = StringGetCharacter(f, 0);

   if((ch != '*') && (ch != '/'))
      f = "*" + f;

   f = f + "*";


   f = ReplaceString(f, "[0]", Symbol());

   if(StringLen(Symbol()) == 6)
     {
      f = ReplaceString(f, "[1]", StringSubstr(Symbol(), 0, 3));

      f = ReplaceString(f, "[2]", StringSubstr(Symbol(), 3, 3));

     }


   string indexes[];
   ZeroMemory(indexes);
   int indexCount = 0;


   string sym = "";
   int dir = 0;
   string ns = "";
   string ds = "";
   int fLen = StringLen(f);

   for(int i = 0; i < fLen; i++)
     {
      ch = StringGetCharacter(f, i);

      if((ch == '*') || (ch == '/'))
        {

         if(StringLen(sym) != 0)
           {
            if(dir == 1)
              {
               _nCount++;
               ArrayResize(_n, _nCount);
               _n[_nCount - 1] = sym;
               ns = ns + " [" + sym + "]";

               if(isIndex(sym))
                  StringArrayAdd(indexes, TrimLeft(sym, '!'));
              }
            else
               if(dir == -1)
                 {
                  _dCount++;
                  ArrayResize(_d, _dCount);
                  _d[_dCount - 1] = sym;
                  ds = ds + " [" + sym + "]";

                  if(isIndex(sym))
                     StringArrayAdd(indexes, TrimLeft(sym, '!'));
                 }

            sym = "";
           }


         dir = (ch == '*') ? 1 : -1;
        }
      else
        {
         sym = sym + ShortToString(ch);
        }
     }


   indexCount = ArraySize(indexes);

   if(indexCount > 0)
     {

      string calcCurrs = IndexCalcCurrs + "," + StringArrayToString(indexes, ",");

      indexCount = SplitString(calcCurrs, ",", indexes, true);
      indexCount = StringArrayGroup(indexes, _indexCalcCurrsA);

     }


   for(int k = 0; k < _nCount; k ++)
     {
      if(isIndex(_n[k]) && !IndexInitA(_n[k], IndexBaseCurr, _indexCalcCurrsA, gS, gicrossCount))
        {
         return(INIT_FAILED);
        }
     }

   for(int k = 0; k < _dCount; k++)
     {
      if(isIndex(_d[k]) && !IndexInitA(_d[k], IndexBaseCurr, _indexCalcCurrsA, gS, gicrossCount))
        {
         return(INIT_FAILED);
        }

     }


   shortname = MQLInfoString(MQL_PROGRAM_NAME) + ": " +
               (LogScale ? "100*ln(" : "") +
               (Power != 1 ? "(" : "") +
               (Scale != 1 ? DoubleToCompactString(Scale) + "*" : "") + Trim(f, '*') +
               (Power != 1 ? ")^" + DoubleToCompactString(Power) : "") +
               (LogScale ? ")" : "") +
               "," + AppliedPriceToString(AppliedPrice);

   IndicatorSetString(INDICATOR_SHORTNAME, shortname);


   if(ArraySize(gS) > 0)
     {

      if(OpenCharts)
        {
         gbFirst = true;

         for(int w = 0; w < ChartGetInteger(0,CHART_WINDOWS_TOTAL,0); w++)
           {
            for(int ind = 0; ind < ChartIndicatorsTotal(ChartID(), w); ind++)
              {

               string name = ChartIndicatorName(ChartID(), w, ind);

               if(name == shortname)
                  break;
               else
                  if(StringFind(name, MQLInfoString(MQL_PROGRAM_NAME), 0) >= 0)
                    {
                     gbFirst = false;
                     break;
                    }
              }
           }

         if(gbFirst)
           {
            long lastChart = ChartFirst(), Charts[];
            ArrayResize(Charts, 0);

            int w = 0, newcharts = 0, modcharts = 0, closedcharts = 0;

            while(w < CHARTS_MAX)
              {

               if(lastChart < 0)
                  break;
               if(ChartSymbol(lastChart) != NULL)
                 {
                  w++;
                  ArrayResize(Charts, w);
                  Charts[w-1] = lastChart;
                 }
               lastChart = ChartNext(lastChart);
              }


            for(int s = 0; s < ArraySize(gS); s++)
              {
               if(gS[s].Name == _Symbol)
                  continue;
               bool found = false;

               if(w > 1)
                 {
                  for(int chart = 0; chart < ArraySize(Charts); chart++)
                    {
                     if(ChartSymbol(Charts[chart]) == gS[s].Name)
                       {
                        if(ChartGetInteger(Charts[chart], CHART_FOREGROUND))
                          {

                           if(ChartSetSymbolPeriod(Charts[chart], gS[s].Name, (ENUM_TIMEFRAMES)_Period))
                             {
                              if(ChartSetInteger(Charts[chart], CHART_FOREGROUND, false))
                                {
                                 modcharts++;
                                 gS[s].Chart = Charts[chart];
                                 gS[s].New   = true;
                                 ChartSetString(Charts[chart], CHART_COMMENT, "\n ===  Chart opened by "+shortname + " ("+_Symbol+")  === ");
                                 ChartRedraw(Charts[chart]);
                                 found = true;
                                 break;
                                }
                             }
                          }

                        else
                          {

                           if(ChartPeriod(Charts[chart]) == (ENUM_TIMEFRAMES)_Period)
                             {
                              found = true;
                              break;
                             }
                          }
                       }
                    }
                 }

               if(!found)
                 {

                  OpenNewChart(w, newcharts, s, _Period);

                 }

              }

            for(int chart = 0; chart < ArraySize(Charts); chart++)
              {
               if(ChartGetInteger(Charts[chart], CHART_FOREGROUND))
                 {
                  bool inarray = false;
                  for(int nc = 0; nc < ArraySize(gS); nc++)
                    {
                     if(Charts[chart] == gS[nc].Chart)
                       {
                        inarray = true;
                        break;
                       }

                    }

                  if(!inarray)
                    {
                     ResetLastError();
                     if(!ChartClose(Charts[chart]))
                       {
                        PrintFormat("No se pudo cerrar el antiguo gráfico abierto ID: %I64d,  Símbolo: %s,  Tf: %s. Código de error: %d",
                                    Charts[chart], ChartSymbol(Charts[chart]), EnumToString(ChartPeriod(Charts[chart])), GetLastError());
                       }

                     else
                        closedcharts++;
                    }
                 }
              }

            if(newcharts + modcharts + closedcharts > 0)
              {

               if(newcharts > 0)
                  PrintFormat("Total nuevos gráficos abiertos %d", newcharts);
               if(modcharts > 0)
                  PrintFormat("Total gráficos modificados %d", modcharts);
               if(closedcharts > 0)
                  PrintFormat("Total gráficos antiguos cerrados %d", closedcharts);
               ChartSetInteger(0, CHART_BRING_TO_TOP, true);
              }
           }
        }
     }


   SetIndexBuffer(0, X,INDICATOR_DATA);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0.0);
   PlotIndexSetString(0,PLOT_LABEL,shortname);

   if(ShowMAs)
     {

      SetIndexBuffer(1, MA1,INDICATOR_DATA);
      SetIndexBuffer(2, MA2,INDICATOR_DATA);
      PlotIndexSetInteger(1,PLOT_DRAW_TYPE,DRAW_LINE);
      PlotIndexSetInteger(2,PLOT_DRAW_TYPE,DRAW_LINE);
      PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,0.0);
      PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,0.0);

      PlotIndexSetString(1,PLOT_LABEL,"SMA" + IntegerToString(PeriodMA1));
      PlotIndexSetString(2,PLOT_LABEL,"SMA" + IntegerToString(PeriodMA2));
     }

   else
     {
      PlotIndexSetInteger(1,PLOT_DRAW_TYPE,DRAW_NONE);
      PlotIndexSetInteger(2,PLOT_DRAW_TYPE,DRAW_NONE);
     }

   ArrayInitialize(X, 0.0);
   ArrayInitialize(MA1, 0.0);
   ArrayInitialize(MA2, 0.0);

   ArraySetAsSeries(X,true);
   ArraySetAsSeries(MA1,true);
   ArraySetAsSeries(MA2,true);


   IndicatorSetInteger(INDICATOR_DIGITS, 5);


   return(INIT_SUCCEEDED);

  }


//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string DoubleToCompactString(double d, int digits = 8)
  {
   string s = DoubleToString(d, digits);


   if(StringFind(s, ".") != -1)
     {
      s = TrimRight(s, '0');
      s = TrimRight(s, '.');
     }

   return(s);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string AppliedPriceToString(int ap, bool verbose = false)
  {
   if(verbose)
     {
      switch(ap)
        {
         case 0:
            return("Close");
         case 1:
            return("Open");
         case 2:
            return("High");
         case 3:
            return("Low");
         case 4:
            return("Median");
         case 5:
            return("Typical");
         case 6:
            return("Weighted");
         default:
            return("Unknown");
        }
     }
   else
     {
      switch(ap)
        {
         case 0:
            return("C");
         case 1:
            return("O");
         case 2:
            return("H");
         case 3:
            return("L");
         case 4:
            return("HL");
         case 5:
            return("HLC");
         case 6:
            return("HLCC");
         default:
            return("?");
        }
     }
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool OpenNewChart(int total, int &newcharts, int idx, int tf = 0)
  {

   bool opened = false;
   string Sym = gS[idx].Name;

   if(tf == 0)
      tf = _Period;
   ENUM_TIMEFRAMES etf = (ENUM_TIMEFRAMES) tf;

   if(total + newcharts < CHARTS_MAX)
     {

      ResetLastError();
      long currChart = ChartOpen(Sym, tf);
      if(currChart == 0)
        {
         PrintFormat("No ha sido posible abrir nuevo gráfico para el Símbolo: %s TimeFrame: %s. Cóigo de error: %d",
                     Sym, EnumToString(etf), GetLastError());
         gS[idx].Chart = -1;
        }

      else
        {

         opened = true;
         newcharts++;

         gS[idx].Chart = currChart;
         gS[idx].New   = true;

         ENUM_CHART_MODE mode       = (ENUM_CHART_MODE)ChartGetInteger(0, CHART_MODE, 0);
         int             scale      = (int)            ChartGetInteger(0, CHART_SCALE, 0);
         bool            askline    = (bool)           ChartGetInteger(0, CHART_SHOW_ASK_LINE, 0);
         bool            periodsep  = (bool)           ChartGetInteger(0, CHART_SHOW_PERIOD_SEP, 0);
         bool            volumes    = (bool)           ChartGetInteger(0, CHART_SHOW_VOLUMES, 0);
         color           back       = (color)          ChartGetInteger(0, CHART_COLOR_BACKGROUND, 0);
         color           fore       = (color)          ChartGetInteger(0, CHART_COLOR_FOREGROUND, 0);
         color           grid       = (color)          ChartGetInteger(0, CHART_COLOR_GRID, 0);
         color           volcolor   = (color)          ChartGetInteger(0, CHART_COLOR_VOLUME, 0);
         color           chartup    = (color)          ChartGetInteger(0, CHART_COLOR_CHART_UP, 0);
         color           chartdn    = (color)          ChartGetInteger(0, CHART_COLOR_CHART_DOWN, 0);
         color           chartline  = (color)          ChartGetInteger(0, CHART_COLOR_CHART_LINE, 0);
         color           candlebull = (color)          ChartGetInteger(0, CHART_COLOR_CANDLE_BULL, 0);
         color           candlebear = (color)          ChartGetInteger(0, CHART_COLOR_CANDLE_BEAR, 0);
         color           colorbid   = (color)          ChartGetInteger(0, CHART_COLOR_BID, 0);
         color           colorask   = (color)          ChartGetInteger(0, CHART_COLOR_ASK, 0);

         ChartSetInteger(currChart, CHART_MODE,              mode);
         ChartSetInteger(currChart, CHART_FOREGROUND,        false);
         ChartSetInteger(currChart, CHART_SHIFT,             true);
         ChartSetInteger(currChart, CHART_AUTOSCROLL,        true);
         ChartSetInteger(currChart, CHART_SCALE,             scale);
         ChartSetInteger(currChart, CHART_SHOW_OHLC,         true);
         ChartSetInteger(currChart, CHART_SHOW_BID_LINE,     true);
         ChartSetInteger(currChart, CHART_SHOW_ASK_LINE,     askline);
         ChartSetInteger(currChart, CHART_SHOW_PERIOD_SEP,   periodsep);
         ChartSetInteger(currChart, CHART_SHOW_GRID,         false);
         ChartSetInteger(currChart, CHART_SHOW_VOLUMES,      volumes);
         ChartSetInteger(currChart, CHART_SHOW_OBJECT_DESCR, true);
         ChartSetInteger(currChart, CHART_COLOR_BACKGROUND,  back);
         ChartSetInteger(currChart, CHART_COLOR_FOREGROUND,  fore);
         ChartSetInteger(currChart, CHART_COLOR_GRID,        grid);
         ChartSetInteger(currChart, CHART_COLOR_VOLUME,      volcolor);
         ChartSetInteger(currChart, CHART_COLOR_CHART_UP,    chartup);
         ChartSetInteger(currChart, CHART_COLOR_CHART_DOWN,  chartdn);
         ChartSetInteger(currChart, CHART_COLOR_CHART_LINE,  chartline);
         ChartSetInteger(currChart, CHART_COLOR_CANDLE_BULL, candlebull);
         ChartSetInteger(currChart, CHART_COLOR_CANDLE_BEAR, candlebear);
         ChartSetInteger(currChart, CHART_COLOR_BID,         colorbid);
         ChartSetInteger(currChart, CHART_COLOR_ASK,         colorask);
         ChartSetInteger(currChart, CHART_SHOW_TRADE_LEVELS, true);
         ChartSetInteger(currChart, CHART_DRAG_TRADE_LEVELS, true);
         ChartSetInteger(currChart, CHART_SHOW_DATE_SCALE,   true);
         ChartSetInteger(currChart, CHART_SHOW_PRICE_SCALE,  true);
         ChartSetString(currChart, CHART_COMMENT,           "\n ===  Chart opened by "+shortname + " ("+_Symbol+")  === ");
         ChartRedraw(currChart);

        }
     }

   else
     {
      PrintFormat("Ningún gráfico abierto para el Símbolo: %s TimeFrame: %s, pero has llegado al Máx de gráficos abiertos: %d. No se puede abrir ninguno más",
                  Sym, EnumToString(etf), CHARTS_MAX);

     }

   return(opened);

  }


//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {

   if(OpenCharts && gbFirst)
     {
      int size = ArraySize(gS);

      if(size > 0)
        {

         int cnt = 0;
         for(int c = size - 1; c >= 0; c--)
           {
            if(!gS[c].New)
               continue;

            long id = gS[c].Chart;
            if(id <= 0)
               continue;
            string sym = ChartSymbol(id);

            if(reason != REASON_CHARTCHANGE && reason != REASON_PARAMETERS)
              {
               ResetLastError();
               if(!ChartClose(id))
                 {
                  PrintFormat("No se pudo cerrar el nuevo gráfico abierto ID: %I64d,  Símbolo: %s,  Tf: %s. Código de error: %d",
                              id, sym, EnumToString(ChartPeriod(id)), GetLastError());
                 }

               else
                 {

                  cnt++;
                 }
              }

            else
              {
               ResetLastError();
               if(!ChartSetInteger(id, CHART_FOREGROUND, true))
                 {
                  PrintFormat("No se pudo pasar a segundo plano el nuevo gráfico abierto ID: %I64d,  Símbolo: %s,  Tf: %s. Código de error: %d",
                              id, sym, EnumToString(ChartPeriod(id)), GetLastError());
                 }

               else
                 {

                  cnt++;
                 }
              }
           }

         if(cnt > 0)
           {
            string msg;
            if(reason != REASON_CHARTCHANGE && reason != REASON_PARAMETERS)
               msg = "cerrados";
            else
               msg = "pasados a segundo plano";
            PrintFormat("Total nuevos gráficos %s: %d", msg, cnt);
            ChartSetInteger(0, CHART_BRING_TO_TOP, true);

           }
        }
     }


   string text = "";

   switch(reason)
     {
      case REASON_PROGRAM:
         text="El indicador llamó a la función Remove";
         break;
      case REASON_REMOVE:
         text="El indicador "+__FILE__+" se eliminó del gráfico";
         break;
      case REASON_RECOMPILE:
         text="El indicador "+__FILE__+" se recompiló";
         break;
      case REASON_CHARTCHANGE:
         text="El Símbolo o el Timeframe cambiaron";
         break;
      case REASON_CHARTCLOSE:
         text="El gráfico se cerró";
         break;
      case REASON_PARAMETERS:
         text="Los parámetros de entrada fueron modificados por el usuario";
         break;
      case REASON_ACCOUNT:
         text="La cuenta cambió";
         break;
      case REASON_TEMPLATE:
         text="Una nueva plantilla fue añadida al gráfico";
         break;
      case REASON_INITFAILED:
         text="El indicador no se inicializó correctamente";
         break;
      case REASON_CLOSE:
         text="El terminal se cerró";
         break;

      default:
         text="Otra razón para deinicializar";

     }

   Print("Finalizando "+MQLInfoString(MQL_PROGRAM_NAME)+" - Código: "+IntegerToString(reason)+" "+text);
   
   for(int r = 0; r < ArraySize(gS); r++)
      ArraySetAsSeries(gS[r].Rates,true);

  }


//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double MA(string symbol, ENUM_TIMEFRAMES timeframe, ENUM_APPLIED_PRICE ap, int maPeriod, ENUM_MA_METHOD maMethod, int bar,datetime const &Time[], int idx = -1)
  {


   double p = 0.0;
   bool select = true;
   if(idx != -1)
      symbol = gS[idx].Name;
   if(symbol != _Symbol)
     {
      long res;
      select = SymbolInfoInteger(symbol, SYMBOL_SELECT, res) && res > 0;
      if(!select)
         select =  SymbolSelect(symbol, true);

      if(select)
         bar = iBarShift(symbol, timeframe, Time[bar]);
     }

   if(select)
     {

      MqlTick tick;
      SymbolInfoTick(symbol, tick);

      if(maPeriod > 0)
        {
         double MA[1];
         int handle=iMA(symbol,timeframe,maPeriod,0,maMethod,ap);
         CopyBuffer(handle,0,bar,1,MA);
         return MA[0];
        }


      double h, l, c;


      switch(ap)
        {
         case PRICE_CLOSE:
            if(idx == -1)
               p = iClose(symbol, timeframe, bar);
            else
               p = gS[idx].Rates[bar].close;
            break;

         case PRICE_OPEN:
            if(idx == -1)
               p = iOpen(symbol, timeframe, bar);
            else
               p = gS[idx].Rates[bar].open;
            break;

         case PRICE_HIGH:
            if(idx == -1)
               p = iHigh(symbol, timeframe, bar);
            else
               p = gS[idx].Rates[bar].high;
            break;

         case PRICE_LOW:
            if(idx == -1)
               p = iLow(symbol, timeframe, bar);
            else
               p = gS[idx].Rates[bar].low;
            break;

         case PRICE_MEDIAN:
            if(idx == -1)
              {
               h = iHigh(symbol, timeframe, bar);
               l = iLow(symbol, timeframe, bar);
              }
            else
              {
               h = gS[idx].Rates[bar].high;
               l = gS[idx].Rates[bar].low;
              }
            if(h != 0 && l != 0)
               p = (h + l) / 2.0;
            break;

         case PRICE_TYPICAL:
            if(idx == -1)
              {
               h = iHigh(symbol, timeframe, bar);
               l = iLow(symbol, timeframe, bar);
               c = iClose(symbol, timeframe, bar);
              }
            else
              {
               h = gS[idx].Rates[bar].high;
               l = gS[idx].Rates[bar].low;
               c = gS[idx].Rates[bar].close;
              }
            if(h != 0 && l != 0 && c != 0)
               p = (h + l + c) / 3.0;
            break;

         case PRICE_WEIGHTED:
            if(idx == -1)
              {
               h = iHigh(symbol, timeframe, bar);
               l = iLow(symbol, timeframe, bar);
               c = iClose(symbol, timeframe, bar);
              }
            else
              {
               h = gS[idx].Rates[bar].high;
               l = gS[idx].Rates[bar].low;
               c = gS[idx].Rates[bar].close;
              }
            if(h != 0 && l != 0 && c != 0)
               p = (h + l + 2.0 * c) / 4.0;
            break;
        }
     }

   return(p);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Index(int crossCount, ENUM_APPLIED_PRICE ap, int maPeriod, ENUM_MA_METHOD maMethod, int bar,datetime const &Time[])
  {
   int c = 0;
   double value, q;


   value = 1.0;

   int sc = ArraySize(gS);

   for(int j = 0; j < sc; j++)
     {
      q = MA("",PERIOD_CURRENT, ap, maPeriod, maMethod, bar,Time,j);

      if(q > 0 && q < EMPTY_VALUE)
        {
         value *= MathPow(q, 1.0 * gS[j].Dir  / crossCount);
         c++;
        }

     }

   if(sc == 0)
      value = 0.0;

   return(value);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool isIndex(string &sym)
  {
   int len = StringLen(sym);

   if(len > 0)
     {
      ushort char0 = StringGetCharacter(sym, 0);


      if((len == 3) && (char0 >= 'A') && (char0 <= 'Z'))
         return(true);


      return(char0 == '!');
     }

   return(false);
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double getValue(string sym, int bar,datetime const &Time[])
  {
   double v = EMPTY_VALUE;

   if(isIndex(sym))
     {
      if(StringGetCharacter(sym, 0) == '!')
         sym = StringSubstr(sym, 1);

      v = Index(gicrossCount, AppliedPrice, MAPeriod, MAMethod, bar,Time);

      if(DiffMAPeriod > 0 && v > 0)
        {
         double d = Index(gicrossCount, AppliedPrice, DiffMAPeriod, MAMethod, bar,Time);
         v = (d > 0) ? v / d : 0;
        }
     }
   else
     {

      v = MA(sym, PERIOD_CURRENT, AppliedPrice, MAPeriod, MAMethod, bar,Time);

      if(DiffMAPeriod > 0 && v > 0)
        {
         double d = MA(sym, PERIOD_CURRENT, AppliedPrice, DiffMAPeriod, MAMethod, bar,Time);
         v = (d > 0) ? v / d : 0;
        }
     }

   return(v);
  }


//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
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

   static int minserie = INT_MAX;
   int limit;

   if(prev_calculated <= 0 || prev_calculated > rates_total)

     {
      ArrayInitialize(X, 0.0);
      ArrayInitialize(MA1, 0.0);
      ArrayInitialize(MA2, 0.0);
      ResetLastError();

      for(int r = 0; r < ArraySize(gS); r++)
        {
         if(!CopyRates(gS[r].Name,_Period,0,MathMax(600,MaxBars+100),gS[r].Rates)
            || ArraySize(gS[r].Rates) <= 512 || gS[r].Rates[0].time == 0)
           {
            Print("ERROR AL CARGAR ",_LastError);
            return(0);
           }

         if(ArraySize(gS[r].Rates) < minserie)
            minserie = ArraySize(gS[r].Rates);

        }


      limit = MathMin(MathMin(rates_total - 1, minserie - 1), MaxBars - 1 + (ShowMAs==true?MathMax(PeriodMA1, PeriodMA2):0));


      PlotIndexGetInteger(0,PLOT_DRAW_BEGIN,rates_total - (limit + 1));
      PlotIndexGetInteger(1,PLOT_DRAW_BEGIN,rates_total - (limit + 1 - (ShowMAs==true?PeriodMA1:0)));
      PlotIndexGetInteger(2,PLOT_DRAW_BEGIN,rates_total - (limit + 1 - (ShowMAs==true?PeriodMA2:0)));

     }
   else
     {
      limit = MathMin(rates_total - prev_calculated, MathMin(minserie - 1, MaxBars - 1 + (ShowMAs==true?MathMax(PeriodMA1, PeriodMA2):0)));
     }


   double x, v;
   for(int i = limit; i >= 0; i--)
     {
      x = 1;
      for(int k = 0; k < _nCount; k ++)
        {
         v = getValue(_n[k], i,time);
         
         if(v == EMPTY_VALUE)
           {
            x = -1;
            break;
           }
         else
           {
            x *= v;
           }
        }


      if(x < 0)
        {
         X[i] = EMPTY_VALUE;
         continue;
        }


      for(int k = 0; k < _dCount; k++)
        {
         v = getValue(_d[k], i,time);

         if((v == EMPTY_VALUE) || (v == 0))
           {
            x = -1;
            break;
           }
         else
           {
            x /= v;
           }
        }


      if(x < 0)
        {
         X[i] = EMPTY_VALUE;
         continue;
        }


      x = Scale * MathPow(x, Power);


      if(LogScale && (x > 0))
         x = MathLog(x) * 100.0;

      X[i] = x;
     }

   if(ShowMAs)
     {
      for(int m = MathMin(limit, MaxBars + MathMax(PeriodMA1, PeriodMA2) - PeriodMA1 - 1); m >= 0; m--)
        {
         MA1[m] = iMAOnArray(X,PeriodMA1, 0, MA1Method, m);
        }

      for(int m = MathMin(limit, MaxBars + MathMax(PeriodMA1, PeriodMA2) - PeriodMA2 - 1); m >= 0; m--)
        {
         MA2[m] = iMAOnArray(X,PeriodMA2, 0, MA2Method, m);
        }
     }

   IndStart = false;

   return(rates_total);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double iMAOnArray(double& array[], int period, int ma_shift, ENUM_MA_METHOD ma_method, int shift)
  {

   double buf[], arr[];
   int total = ArraySize(array);

   if(total <= period)
      return 0;

   if(shift > total - period - ma_shift)
      return 0;

   switch(ma_method)
     {

      case MODE_SMA:
        {

         total = ArrayCopy(arr, array, 0, shift + ma_shift, period);
         if(ArrayResize(buf, total) < 0)
            return 0;

         double sum = 0;
         int i, pos = total-1;

         for(i = 1; i < period; i++, pos--)

            sum += arr[pos];

         while(pos >= 0)
           {

            sum += arr[pos];

            buf[pos] = sum / period;

            sum -= arr[pos + period - 1];

            pos--;

           }

         return buf[0];

        }



      case MODE_EMA:
        {

         if(ArrayResize(buf, total) < 0)

            return 0;

         double pr = 2.0 / (period + 1);

         int pos = total - 2;



         while(pos >= 0)
           {

            if(pos == total - 2)

               buf[pos+1] = array[pos+1];

            buf[pos] = array[pos] * pr + buf[pos+1] * (1-pr);

            pos--;

           }

         return buf[shift+ma_shift];

        }



      case MODE_SMMA:
        {

         if(ArrayResize(buf, total) < 0)

            return(0);

         double sum = 0;

         int i, k, pos;



         pos = total - period;

         while(pos >= 0)
           {

            if(pos == total - period)
              {

               for(i = 0, k = pos; i < period; i++, k++)
                 {

                  sum += array[k];

                  buf[k] = 0;

                 }

              }

            else

               sum = buf[pos+1] * (period-1) + array[pos];

            buf[pos]=sum/period;

            pos--;

           }

         return buf[shift+ma_shift];

        }



      case MODE_LWMA:
        {

         if(ArrayResize(buf, total) < 0)

            return 0;

         double sum = 0.0, lsum = 0.0;

         double price;

         int i, weight = 0, pos = total-1;



         for(i = 1; i <= period; i++, pos--)
           {

            price = array[pos];

            sum += price * i;

            lsum += price;

            weight += i;

           }

         pos++;

         i = pos + period;

         while(pos >= 0)
           {

            buf[pos] = sum / weight;

            if(pos == 0)

               break;

            pos--;

            i--;

            price = array[pos];

            sum = sum - lsum + price * period;

            lsum -= array[i];

            lsum += price;

           }

         return buf[shift+ma_shift];

        }

     }

   return 0;

  }



// 2014-04-03 12:59:20 UTC
// MQLMake 1.22. Copyright © FXcoder, 2011-2014. http://fxcoder.net

// 2016-04-23 12:16:55 UTC
// Copyright © Robertomar, 2016. http://www.tradingunited.es/foro/members/robertomar.html

//+------------------------------------------------------------------+
