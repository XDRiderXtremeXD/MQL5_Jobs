
//+------------------------------------------------------------------+
//|                      Patrones Regresiva Alerta Mitad Vela        |
//|                                      Modifier: Claudio Chumpitaz |
//|                      https://www.mql5.com/es/users/claudioangelo |
//|                          Based on MT4 indicator by: Carl Sanders |
//+------------------------------------------------------------------+

//double KArray[];
//double RSIMAIN[];
//input uint RSI_Period=14;

#property copyright "Claudio Chumpitaz"
#property link      "https://www.mql5.com/es/users/claudioangelo"
#property version   "1.01"
#property description "Indicador que avisa mediante una alerta la formacion de un patron regresivo"
#property description "con vela recien formandose- en otras palabras te avisa cuando se esta formando"
#property description "el patron regresivo y no cuando ha terminado de formarse la vela"

#property indicator_chart_window
#property indicator_buffers 2
#property indicator_plots   0




input string SEPARADOR = "-----ZERO-LAG--------";
input int InpPeriod=14; //Periodo ZERO_LAG
input   ENUM_APPLIED_PRICE   InpPrice=PRICE_MEDIAN; //Price ZERO_LAG
//Change it to true if you broker uses extra digit in quotes

input bool UseExtraDigit=false;


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Text_VelasOpuestas=8;

//input bool VelasRSI=true;
//input bool VelasRSI_Alert=false;
int Text_VelasRSI=8;

//---- buffers
double ArrowSignalUP[];
double ArrowSignalDOWN[];

double ZERO_LAG_buffer[];
double ZERO_LAG_buffer_Valor[];
double RSIbuffer[];
double EMAbuffer[];

string period;
int  Pointer_Offset = 0;         // The offset value for the arrow to be located off the candle high or low point.
int  High_Offset = 0;            // The offset value added to the high arrow pointer for correct plotting of the pattern label.
int  Offset_Caida_VelaOpuesta = 0;       // The offset value of the shooting star above or below the pointer arrow.
int  Offset_Subida_VelaOpuesta = 0;
int  IncOffset=0;              // The offset value that is added to a cummaltive offset value for each pass through the routine so any
// additional candle patterns that are also met, the label will print above the previous label.
double VALORVELASOPUESTAS=0;

double Candle_WickBody_Percent=0;

//int DefinitionEstochastic;
//int DefinitionRSI;
int DefinitionZERO_LAG;

color COLORVO=Aqua;

int paso=0;
bool CUENTA=false;
bool ALERTAACTIVADA=false;
datetime TiempoPrevio=0;
int MAXIMO=0;
int vez=1;


//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnInit()
  {
   if(ChartScaleGet()<2)
      paso=0;
   else
      paso=1;
//DefinitionRSI=iRSI(NULL,PERIOD_CURRENT,RSI_Period,PRICE_CLOSE);
   DefinitionZERO_LAG=iCustom(Symbol(),PERIOD_CURRENT,"Zero-lag-MA",InpPrice,InpPeriod);
   DefinitionRSI=iRSI(Symbol(),PERIOD_CURRENT,PeriodoRSI,PriceRSI);
   DefinitionEMA=iMA(Symbol(),PERIOD_CURRENT,EMA_PERIOD,ShiftEMA, Mode_Line_EMA,Price_Ema);



   IndicatorSetString(INDICATOR_SHORTNAME,"RSI TENDENCIAL");
//172, 115
   PlotIndexSetInteger(0,PLOT_ARROW,225);
   PlotIndexSetInteger(1,PLOT_ARROW,226);

   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,0);

   SetIndexBuffer(2,ZERO_LAG_buffer,INDICATOR_CALCULATIONS);

    ArraySetAsSeries(ZERO_LAG_buffer,true);
    ArrayInitialize(ZERO_LAG_buffer,0);




int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &Time[],
                const double &Open[],
                const double &High[],
                const double &Low[],
                const double &Close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {


static datetime prevtime=0;
int MAXIMO;
if(prevtime!=Time[0] && prevtime!=0){
MAXIMO=2;
}
else MAXIMO=rates_total;

else return rates_total;
for(int Start=1; Start<MAXIMO; Start++)
     {
      
      
      
      
      prevtime=Time[0];
     }
return rates_total;
}