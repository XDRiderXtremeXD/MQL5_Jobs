//+------------------------------------------------------------------+
//|                                                     ma cross.mq5 |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property indicator_chart_window
#property indicator_buffers 6
#property indicator_plots   2
#property indicator_type1   DRAW_ARROW
#property indicator_color1  clrLightSeaGreen
#property indicator_width1  2
#property indicator_label1  "Bull ADX Cross"
#property indicator_type2   DRAW_ARROW
#property indicator_color2  clrRed
#property indicator_width2  2
#property indicator_label2 "Bear ADX Cross"

enum enMaTypes
{
   ma_sma,    // Simple moving average
   ma_ema,    // Exponential moving average
   ma_smma,   // Smoothed MA
   ma_lwma    // Linear weighted MA
};

input string SEPARADOR = "-----DMI OSCILADOR--------";
input int       DmiPeriod   = 32;        // DMI period
input enMaTypes DmiMaMethod = ma_smma;   // DMI smoothing method
input int       Smooth      = 0;         // Smothing period (<=1 for no smoothing)
input enMaTypes SmoothType  = ma_ema;    // Smothing method
input double    SignalPeriod = 9;        // Signal period

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
input string SEPARADOR1 = "-----ADX CROSS ALERTS INDICATOR--------";
input int    AdxPeriod        = 2;          // ADX period
input bool   alertsOn         = true;        // Turn alerts on?
input bool   alertsOnCurrent  = true;       // Alert on current bar?
input bool   alertsMessage    = true;        // Display messages on alerts?
input bool   alertsSound      = true;       // Play sound on alerts?
input bool   alertsEmail      = true;       // Send email on alerts?
input bool   alertsNotify     = true;       // Send push notification on alerts?

double crossUp[],crossDn[],cross[],DMIOS[],WT[],RSI[];

enum ENUM_TIPE_MA{
MediaMovilSimple=0,//Media Movil Simple
MediaMovilExponencial=1,// Media Movil Exponencial
MediaMovilSuavizada=2,// Media Movil Suavizada
MediaMovilPonderada=3,// Media Movil Ponderada
TMA=4,
};

input string SeparadorWT="----SEPARADOR WHITE TIGER----";
input ENUM_TIMEFRAMES TimeFrameWT=PERIOD_CURRENT;
input ENUM_TIPE_MA TipoMA=MediaMovilSimple;
input ENUM_APPLIED_PRICE TipoPrecio=PRICE_CLOSE;
input int PeriodosMA=5;
input bool MostrarLineasATR=true;
input string SeparadorATR="--------------";
input int PeriodosATR=110;
input double MultiplicadorATR=1;
input string SeparadorMax="--------------------";
input int MaxVelasHistorico=1000;
//--- indicator handles
int _adxHandle;
int _atrHandle;
int DefinitionDMIOs;
int DefinitionWT;
int DefinitionRSI;


input string SEPARADORRSI = "-----RSI--------";
input int PeriodoRSI=4;
input ENUM_APPLIED_PRICE AppliedPriceRSI=PRICE_CLOSE;


int OnInit()
  {
//--- indicator buffers mapping
    SetIndexBuffer(0,crossUp,INDICATOR_DATA);  PlotIndexSetInteger(0,PLOT_ARROW,233);
    SetIndexBuffer(1,crossDn,INDICATOR_DATA);  PlotIndexSetInteger(1,PLOT_ARROW,234);
    SetIndexBuffer(2,cross);
    SetIndexBuffer(3,WT,INDICATOR_CALCULATIONS);
    SetIndexBuffer(4,DMIOS,INDICATOR_CALCULATIONS);
    SetIndexBuffer(5,RSI,INDICATOR_CALCULATIONS);
    
    //ChartIndicatorDelete(0,1,"dsl_-_dmi_oscillator");
    
    
   _adxHandle=iADX(_Symbol,0,AdxPeriod); if(_adxHandle==INVALID_HANDLE) { return(INIT_FAILED); }
   _atrHandle=iATR(_Symbol,0,15);        if(_atrHandle==INVALID_HANDLE) { return(INIT_FAILED); }
   
   DefinitionDMIOs=iCustom(Symbol(),PERIOD_CURRENT,"dsl_-_dmi_oscillator",DmiPeriod,DmiMaMethod,Smooth,SmoothType,SignalPeriod);
   if(DefinitionDMIOs==INVALID_HANDLE) { return(INIT_FAILED); }
   
   DefinitionWT=iCustom(Symbol(),PERIOD_CURRENT,"WT_SuperT-MA_v4.7",0,1,"-",TimeFrameWT,TipoMA,TipoPrecio,PeriodosMA," ",MostrarLineasATR,PeriodosATR,MultiplicadorATR," ",MaxVelasHistorico);
   //DefinitionWT=iCustom(Symbol(),PERIOD_CURRENT,"WT_SuperT-MA_v4.7",0,1,"-",0,0,0,20," ",false,110,2.6," ",1000);
   if(DefinitionWT==INVALID_HANDLE) { return(INIT_FAILED); }
   
   DefinitionRSI=iRSI(Symbol(),PERIOD_CURRENT,PeriodoRSI,AppliedPriceRSI);
   
   //ChartIndicatorAdd(0,1,DefinitionDMIOs);

   
   
   IndicatorSetString(INDICATOR_SHORTNAME,"ADX cross "+(string)AdxPeriod+")");
return(INIT_SUCCEEDED);
}

void OnDeinit(const int reason)
{
}
int OnCalculate(const int rates_total,const int prev_calculated,const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   if(Bars(_Symbol,_Period)<rates_total) return(prev_calculated);
   if(BarsCalculated(_adxHandle)<rates_total)  return(prev_calculated);
   if(BarsCalculated(DefinitionWT)<rates_total)  return(prev_calculated);
   if(BarsCalculated(DefinitionRSI)<rates_total)  return(prev_calculated);
   double _adxVal[1],_adxpVal[1],_adxmVal[1],_atr[1];
   
   bool Alarm=false;
   int i=(int)MathMax(prev_calculated-1,1); for(; i<rates_total && !_StopFlag; i++)
   {  
      int _adxCopied =CopyBuffer(_adxHandle,0,time[i],1,_adxVal);
      int _adxpCopied=CopyBuffer(_adxHandle,1,time[i],1,_adxpVal);
      int _adxmCopied=CopyBuffer(_adxHandle,2,time[i],1,_adxmVal);
      int _atrCopied=CopyBuffer( _atrHandle,0,time[i],1,_atr);
      int _DMIOsCopied=CopyBuffer( DefinitionDMIOs,3,time[i],1,DMIOS);
      int _WTCopied=CopyBuffer( DefinitionWT,3,time[i],1,WT);
      int _RSICopied=CopyBuffer( DefinitionRSI,0,time[i],3,RSI);
            
      cross[i] = (i>0) ? (_adxpVal[0]>_adxmVal[0]) ? 1 : (_adxpVal[0]<_adxmVal[0]) ? 2 : cross[i-1] : 0;  
      crossUp[i] = EMPTY_VALUE;
      crossDn[i] = EMPTY_VALUE;
      if (i>0 && cross[i]!=cross[i-1])
      { 
         if (cross[i]== 1 && WT[0]==1 && close[i]>open[i] && close[i-1]<open[i-1] && close[i-2]<open[i-2]  
         && DMIOS[0]==1 && (RSI[1]<50 || RSI[2]<50) && RSI[0]<70 ) { crossUp[i] =  low[i]-_atr[0]; Alarm=i==rates_total-1?true:false;}
         
         if (cross[i] == 2 && WT[0]==0 && close[i]<open[i] && close[i-1]>open[i-1] && close[i-2]>open[i-2]
          && DMIOS[0]==2  && (RSI[1]>50 || RSI[2]>50) && RSI[0]>30 ) {crossDn[i] = high[i]+_atr[0]; Alarm=i==rates_total-1?true:false;}
      }
//---c
   }
   if(Alarm==true)
   manageAlerts(time,cross,rates_total);
   
return(rates_total);
}

//------------------------------------------------------------------
//
//------------------------------------------------------------------
//
//
//
//
//

void manageAlerts(const datetime& _time[], double& _trend[], int bars)
{
   if (alertsOn)
   {
      int whichBar = bars-1; if (!alertsOnCurrent) whichBar = bars-2; datetime time1 = _time[whichBar];
      if (_trend[whichBar] != _trend[whichBar-1])
      {          
         if (_trend[whichBar] == 1 ) doAlert(time1," plus DI crossing minus DI up");
         if (_trend[whichBar] == 2 ) doAlert(time1," plus DI crossing minus DI down");
      }         
   }
}   

//
//
//
//
//

void doAlert(datetime forTime, string doWhat)
{
   static string   previousAlert="nothing";
   static datetime previousTime;
   
   if (previousAlert != doWhat || previousTime != forTime) 
   {
      previousAlert  = doWhat;
      previousTime   = forTime;

      //
      //
      //
      //
      //

      string message = TimeToString(TimeLocal(),TIME_SECONDS)+" "+_Symbol+" Adx "+doWhat;
         if (alertsMessage) Alert(message);
         if (alertsEmail)   SendMail(_Symbol+"Adx",message);
         if (alertsNotify)  SendNotification(message);
         if (alertsSound)   PlaySound("alert2.wav");
   }
}


