//+------------------------------------------------------------------+
//|                                                          DOT.MMS |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright   "MQL5"
#property link        "http://www.mql4.com"
#property version     "1.0"
#property description "-----------------------------------------------------------------------------------------------------------------------"
#property description "El indicador muestra utiliza dos RSI para hacer un backtest con sus señales."

#property indicator_separate_window
#property indicator_buffers 10
#property indicator_plots 6
#property indicator_color1  clrGold
#property indicator_color2  clrMagenta
#property indicator_color3  clrDodgerBlue
#property indicator_color4  clrGold
#property indicator_color5  clrRed
#property indicator_color6  clrLime
#property indicator_width6  3
#property indicator_width5  3
#property indicator_levelcolor clrWhite
#property indicator_levelstyle STYLE_DOT

#property indicator_maximum 100
#property indicator_minimum 0

enum ENUM0 
 {
   Var0,//  Backtest en tiempo real
   Var1,//  Backtest por número máximo de barras
   Var2,//  Backtest desde una fecha determinada
   Var3 //  Backtest desactivado
 };
enum ENUM1
 {  
   On,//  SeOn
   Off//  Off
 }; 
enum ENUM2 
 {
   VarB,//  Solo señales de compra
   VarS,//  Solo señales de venta
   VarA //  Todas las señales Buy & Sell
 };
enum ENUM3
 {  
   Win0,//  Mostrar en el chart principal
   Win1 //  Mostrar en ventana del indicador
 };

input string ____________DOT_MMS____________ = "<<<< CONFIGURACIÓN PRINCIPAL >>>>";
input  ENUM2  Signal              = VarA;              //Elija el tipo de señales: 
input string aa                  = "====== Configuración BUY ==========";//Configuración BUY
input int    RSI_Period_Up       = 3;                 //Periodos del RSI para compras
input int    RSI_Level_Up        = 5;                 //Nivel para compras
input int    Shift_Signal_Up     = 0;                 //Desplazamiento de la señal
input bool   Revers_Up           = false;             //Invertir/Contrarestar RSI
input string ab                  = "====== Configuración SELL ==========";//Configuración Sell
input int    RSI_Period_Dn       = 3;                 //Periodos del RSI para ventas
input int    RSI_Level_Dn        = 95;                //Nivel para ventas
input int    Shift_Signal_Dn     = 0;                 //Desplazamiento de la señal
input bool   Revers_Dn           = false;             //Invertir/Contrarestar RSI

//-------------------------------------------------------------------------------------+
input string bb                  = "_____CONFIGURACIÓN DEL BACKTEST____";//CONFIGURACIÓN DEL BACKTEST    
input  ENUM0  RunBacktest         = Var1;              //Elija la temporalidad para el backtest     
input string TimeStart           = "2015.10.25 15:00";//Señales desde la fecha:
input int    History             = 1440;              //Número máximo de barras a contar:
input  ENUM3  SetWind             = Win1;              //Dónde mostrar los resultados del backtest:
input  ENUM1  KlikSig             = Off;               //Flechas de tendencia:
//-------------------------------------------------------------------------------------+  
input string Time_Start_End      = "___Acotar horario de trading___";//Acotar horario de trading
input string Time_Start          = "08:00";           //Hora de inicio: 
input string Time_End            = "17:59";           //Hora de finalización:
//-------------------------------------------------------------------------------------+
input string Arr                 = "___CONFIGURACIÓN DE ALERTAS___";//CONFIGURACIÓN DE ALERTAS
input bool   ArrPredv            = true;              //Mostrar flechas preliminares
input bool   ArrOsnov            = true;              //Mostrar flechas principales
input int    Arr_code_Up         = 233;               //Código flechas Up
input int    Arr_code_Dn         = 234;               //Código flechas Down
input color  Arr_color_Up        = clrLime;           //Color flechas Up
input color  Arr_color_Dn        = clrMagenta;        //Color flechas Down 
input int    Arr_width           = 1;                 //Tamaño de las flechas
input bool   ArrowDisp           = false;             //Desplazamiento de flechas por ATR
input int    Arr_otstup          = 0;                 //Desplazamiento de flechas

input bool   AlertsMessage       = true;              //Alertas por ventana emergente
input bool   AlertsSound         = false;             //Alertas por sonido

bool     Color_Sig_Line = true;
//-------------------------------------------------------------------------------------+
int      Corner = 1;
int      YDistance = -60;
int      XDistance = 0;
color    BackTestColorDn = clrOrangeRed;  
color    BackTestColorUp = C'0,191,0';
color    BackTestColorSg = clrMediumSeaGreen;
//-------------------------------------------------------------------------------------+
double   ArrowsUp[];
double   ArrowsDn[];

double   B_count[];
double   B_itm[];
double   B_count_winrate;
double   B_count_total=0;
double   B_count_itm=0;
double   B_count_otm=0;
#define  PREFIX "DOT_"
double   S_count[];
double   S_itm[];
double   S_count_winrate;
double   S_count_total=0;
double   S_count_itm=0;
double   S_count_otm=0;

datetime TimeBegin;
datetime LastBarTime=0;;
int      HistBar;
int      BarBegin;
bool     Trade;
double   RSI_Up[];
double   RSI_Dn[];
double   Upper[];
double   Lower[];
int      overSold; 
int      overBought;
int      Sig_Up0;
int      Sig_Up1;
int      Sig_Dn0;
int      Sig_Dn1;
datetime TimeBarUp;
datetime TimeBarDn;

int RSI_Dn_;
int RSI_Up_;
int ATR;

double RSI_Dn_Buffer[];
double RSI_Up_Buffer[];
double ATR_Buffer[];

//---------------------------------------------------------------------------------------------------+
int OnInit()
{
//-----     
   SetIndexBuffer(0,ArrowsUp,INDICATOR_DATA);      
   PlotIndexSetString (0,PLOT_LABEL,NULL);
   PlotIndexSetInteger(0,PLOT_ARROW,233);
   SetIndexBuffer(1,ArrowsDn,INDICATOR_DATA);    
   PlotIndexSetString (1,PLOT_LABEL,NULL);
   PlotIndexSetInteger(0,PLOT_ARROW,234);
   
if(ArrOsnov)
 {    
   PlotIndexSetInteger(0,PLOT_DRAW_TYPE,PLOT_ARROW);
   PlotIndexSetInteger(1,PLOT_DRAW_TYPE,PLOT_ARROW);
 }else{     
   PlotIndexSetInteger(0,PLOT_DRAW_TYPE,DRAW_NONE);
   PlotIndexSetInteger(1,PLOT_DRAW_TYPE,DRAW_NONE);
 } 
//+----- 
   SetIndexBuffer(2,RSI_Up,INDICATOR_DATA);
   PlotIndexSetString (2,PLOT_LABEL,"SigLine");
   PlotIndexSetInteger(2,PLOT_DRAW_TYPE,DRAW_LINE);
      
   SetIndexBuffer(3,RSI_Dn,INDICATOR_DATA);
   PlotIndexSetString (3,PLOT_LABEL,"SigLine");
   PlotIndexSetInteger(3,PLOT_DRAW_TYPE,DRAW_LINE);
   
   SetIndexBuffer(4,Upper,INDICATOR_DATA);
   PlotIndexSetString (4,PLOT_LABEL,NULL);
   
   SetIndexBuffer(5,Lower,INDICATOR_DATA);
   PlotIndexSetString (5,PLOT_LABEL,NULL);
   
   IndicatorSetDouble(INDICATOR_LEVELVALUE,RSI_Level_Up);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,RSI_Level_Dn);    
//+----- 
   SetIndexBuffer(6,B_count,INDICATOR_DATA);
   PlotIndexSetInteger(6,PLOT_DRAW_TYPE,DRAW_NONE);
   
   SetIndexBuffer(7,B_itm,INDICATOR_DATA);
   PlotIndexSetInteger(7,PLOT_DRAW_TYPE,DRAW_NONE);
   
   SetIndexBuffer(8,S_count,INDICATOR_DATA);
   PlotIndexSetInteger(8,PLOT_DRAW_TYPE,DRAW_NONE);
   
   SetIndexBuffer(9,S_itm,INDICATOR_DATA);
   PlotIndexSetInteger(9,PLOT_DRAW_TYPE,DRAW_NONE);
//+----   
   overSold = RSI_Level_Up;
   overBought = RSI_Level_Dn;
//+----- 
 if(RunBacktest!=3)
  {
   int xdp;
   int xds;
   if(KlikSig==0)
    { 
      xdp = 0;
      xds = 0;
    }else{
      xdp = 30;
      xds = 30;
      XDistance = XDistance-30;
    }
      ObjectFon("fon-ind",10+xdp,65,-195+xds,72,1, C'18,34,46', clrGainsboro);//xd, yd, xs, ys
      ObjectFon("fon-in1",10+xdp,100,-195+xds,1,0,clrGray, clrGray);
      if(KlikSig==0)ObjectFon("fon-in2",12+xdp,70,-28+xds,62,0,C'18,34,46', clrGray);//xd, yd, xs, ys
    
  }
 if(RunBacktest==0)//в реальном времени 
    TimeBegin = iTime(Symbol(),PERIOD_CURRENT,0); 
          
    RSI_Dn_=iRSI(Symbol(),0,RSI_Period_Dn,PRICE_CLOSE);
    RSI_Up_=iRSI(Symbol(),0,RSI_Period_Up,PRICE_CLOSE);      
    
    ATR=iATR(NULL,0,20);
    
    IndicatorSetString(INDICATOR_SHORTNAME,"MMSDOT");
          
   return (0);
}
//---------------------------------------------------------------------------------------------------+
void OnDeinit(const int reason)   
{  
   Comment("");                                  
   for(int i = ObjectsTotal(0,-1,-1)-1; i >= 0; i--)  if(StringSubstr(ObjectName(0,i,-1,-1), 0, StringLen(PREFIX)) == PREFIX) ObjectDelete(0,ObjectName(0,i,-1,-1));  
}  
//---------------------------------------------------------------------------------------------------+
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
   ArraySetAsSeries(Time,true);
   ArraySetAsSeries(High,true);
   ArraySetAsSeries(Low,true);
   ArraySetAsSeries(Close,true);
   ArraySetAsSeries(Open,true);
   
   ArrayResize(B_count,rates_total);
   ArrayResize(B_itm,rates_total);
   ArrayResize(S_count,rates_total);
   ArrayResize(S_itm,rates_total);
   
   static bool Comprobacion=false;
   
   if(MQLInfoString(MQL_PROGRAM_NAME) != "MMSDOT")
      { if(Comprobacion==false){
        Alert("Has cambiado el nombre del indicador \" ",MQLInfoString(MQL_PROGRAM_NAME)," \" ?   :)  No lo cambies jodío porque entonces no funciona :)");
        Comprobacion=true;}
        return(rates_total);
      }
    
  if(RunBacktest==0)//En tiempo real
   {
     BarBegin = iBarShift(NULL,0,TimeBegin);
     HistBar = BarBegin;
     vertical_line(BarBegin,Lime,Time); 
   }
  if(RunBacktest==1)//Por un máximo de barras
   {
     HistBar = History;
     TimeBegin = Time[History]; 
     vertical_line(HistBar,Lime,Time); 
     if(LastBarTime != Time[0]) ObjectDelete(0,PREFIX+TimeToString(Time[HistBar+1],TIME_MINUTES));
   }
  if(RunBacktest==2)//Desde una fecha determinada
   {
     TimeBegin = StringToTime(TimeStart);
     BarBegin = iBarShift(NULL,0,TimeBegin);
     HistBar = BarBegin; 
     vertical_line(HistBar,Lime,Time);
   } 
  if(RunBacktest==3)//Backtest desactivado 
     HistBar = History;
//---------------------------------------------------------------------------------------------------+   
  int i,counted_bars = prev_calculated;
  if (counted_bars < 0) return (-1);
  if (counted_bars > 0) counted_bars--;
  int limit = MathMin(rates_total-counted_bars,HistBar+100);

  for(i=limit; i>=0; i--)
   {  
     string Time_S=TimeToString(StringToTime(Time_Start),TIME_MINUTES); 
     string Time_E=TimeToString(StringToTime(Time_End),TIME_MINUTES);
     string Time_i=TimeToString(Time[i],TIME_MINUTES);

     if(Time_S < Time_E && Time_i >= Time_S && Time_i <= Time_E) Trade=true; 
       else {
        if(Time_S > Time_E && (Time_i >= Time_S || Time_i <= Time_E)) // Hasta la medianoche/cierre del día
      {Trade=true;} else {Trade=false; // Comment("Trading limitado por el horario");
       }
     }
      
   if(Signal==VarA || Signal==VarB)
     {
       CopyBuffer(RSI_Up_,0,i,4,RSI_Up_Buffer);
       if(!Revers_Up)
         RSI_Up[i] = RSI_Up_Buffer[0]; 
         else
         RSI_Up[i] = (RSI_Up_Buffer[0]*-1)+100;
     } else
       RSI_Up[i] = 50;
     
   if(Signal==VarA || Signal==VarS)
     { 
      CopyBuffer(RSI_Dn_,0,i,4,RSI_Dn_Buffer);
       if(!Revers_Dn)
         RSI_Dn[i] = RSI_Dn_Buffer[0]; 
         else
         RSI_Dn[i] = (RSI_Dn_Buffer[0]*-1)+100;
     } else
       RSI_Dn[i] = 50;  

   if(Color_Sig_Line)
     {        
      if(RSI_Dn[i] > overBought)
        { 
          Upper[i] = RSI_Dn[i]; 
          Upper[i+1] = RSI_Dn[i+1];
        } else {
          Upper[i] = EMPTY_VALUE;
          if (Upper[i+2] == EMPTY_VALUE) Upper[i+1]  = EMPTY_VALUE;
        }
      
      if(RSI_Up[i] < overSold) 
        { 
          Lower[i] = RSI_Up[i]; 
          Lower[i+1] = RSI_Up[i+1]; 
        } else { 
          Lower[i] = EMPTY_VALUE;
          if (Lower[i+2] == EMPTY_VALUE) Lower[i+1]  = EMPTY_VALUE;
        } 
     } else {
       Upper[i]  = EMPTY_VALUE;
       Lower[i]  = EMPTY_VALUE; 
     }
  
  if(Trade)
   { 
      if(ArrPredv && RSI_Up[i+2]>RSI_Level_Up && RSI_Up[i+1]>RSI_Level_Up && RSI_Up[i]<RSI_Level_Up) 
         {
           arrows_wind(i,"P_Up1",Arr_otstup ,159,Arr_color_Up,Arr_width,false,Time,High,Low);
           Sig_Up0=1;
         } else {
           Sig_Up0=0;
         }
  
      if(ArrPredv && RSI_Dn[i+2]<RSI_Level_Dn && RSI_Dn[i+1]<RSI_Level_Dn && RSI_Dn[i]>RSI_Level_Dn) 
         {
           arrows_wind(i,"P_Dn1",Arr_otstup ,159,Arr_color_Dn,Arr_width,true,Time,High,Low);
           Sig_Dn0=1;
         } else {      
           Sig_Dn0=0;
         }

      if(RSI_Up[i+3+Shift_Signal_Up]>RSI_Level_Up && RSI_Up[i+2+Shift_Signal_Up]>RSI_Level_Up && RSI_Up[i+1+Shift_Signal_Up]<RSI_Level_Up)
         { 
           if(ArrOsnov)arrows_wind(i,"O_Up1",Arr_otstup ,Arr_code_Up,Arr_color_Up,Arr_width,false,Time,High,Low);
           ArrowsUp[i]=0.1;
           Sig_Up1=1;
         } else {
           Sig_Up1=0;
         } 
      
      if(RSI_Dn[i+3+Shift_Signal_Dn]<RSI_Level_Dn && RSI_Dn[i+2+Shift_Signal_Dn]<RSI_Level_Dn && RSI_Dn[i+1+Shift_Signal_Dn]>RSI_Level_Dn) 
         {
           if(ArrOsnov)arrows_wind(i,"O_Dn1",Arr_otstup ,Arr_code_Dn,Arr_color_Dn,Arr_width,true,Time,High,Low);
           ArrowsDn[i]=99.9;
           Sig_Dn1=1;
         } else {
           Sig_Dn1=0;
         }
       }
   }    
//---------------------------------------------------------------------------------------------------+  
 if(AlertsMessage || AlertsSound)
  { 
   string message1 = (MQLInfoString(MQL_PROGRAM_NAME) +" - "+Symbol()+"  "+PeriodString()+" - Posible señal Buy");
   string message2 = (MQLInfoString(MQL_PROGRAM_NAME) +" - "+Symbol()+"  "+PeriodString()+" - Posible señal Sell");
       
    if(TimeBarUp!=Time[0] && Sig_Up0==1)
     { 
        if (AlertsMessage) Alert(message1);
        if (AlertsSound)   PlaySound("alert2.wav");
        TimeBarUp=Time[0];
     }
    if(TimeBarDn!=Time[0] && Sig_Dn0==1)
     { 
        if (AlertsMessage) Alert(message2);
        if (AlertsSound)   PlaySound("alert2.wav");
        TimeBarDn=Time[0];
    }
  }
//---------------------------------------------------------------------------------------------------+           
   if(KlikSig==0)
     {
       if(ArrowsUp[0]!=EMPTY_VALUE && ArrowsUp[0]!=0) object_klik("Info-up","5","Webdings",27,Gold,7,15); else ObjectDelete(0,PREFIX+"Info-up");
       if(ArrowsDn[0]!=EMPTY_VALUE && ArrowsDn[0]!=0) object_klik("Info-dn","6","Webdings",27,Magenta,7,50); else ObjectDelete(0,PREFIX+"Info-dn");
     }  
//---------------------------------------------------------------------------------------------------+  
    
 if(RunBacktest!=3)
  {
    B_count_total   = 0;
    B_count_itm     = 0;
    B_count_otm     = 0;
    B_count_winrate = 0;
    
    S_count_total   = 0;
    S_count_itm     = 0;
    S_count_otm     = 0;
    S_count_winrate = 0;
        
  for(i=HistBar-1; i>=0; i--)
   {
    if(LastBarTime != Time[i])
      {          
       if(ArrowsUp[i+1]>0 && ArrowsUp[i+1]!=EMPTY_VALUE)
          B_count[i] = 1; else B_count[i] = 0;
          
       if(ArrowsUp[i+1]>0 && ArrowsUp[i+1]!=EMPTY_VALUE && Open[i+1] < Close[i+1])
          B_itm[i] = 1; else B_itm[i] = 0;

        B_count_total += (int)B_count[i];
        B_count_itm   += (int)B_itm[i];
        B_count_otm    = B_count_total - B_count_itm;
       if(B_count_total>0)  B_count_winrate = (B_count_itm*100)/B_count_total;
//---------------
       if(ArrowsDn[i+1]>0 && ArrowsDn[i+1]!=EMPTY_VALUE)
          S_count[i] = 1; else S_count[i] = 0;

       if(ArrowsDn[i+1]>0 && ArrowsDn[i+1]!=EMPTY_VALUE && Open[i+1] > Close[i+1]) 
          S_itm[i] = 1; else S_itm[i] = 0;

        S_count_total += (int)S_count[i];
        S_count_itm   += (int)S_itm[i];
        S_count_otm    = S_count_total - S_count_itm;
        
       if(S_count_total>0)  S_count_winrate = (S_count_itm*100)/S_count_total;
//---------------
              
       BackTest((int)B_count_total,(int)B_count_itm,(int)B_count_otm,B_count_winrate,
                (int)S_count_total,(int)S_count_itm,(int)S_count_otm,S_count_winrate, Time,Close);          

      }
    }
  }
//---------------------------------------------------------------------------------------------------+  
   return (rates_total);
}
//---------------------------------------------------------------------------------------------------+
void arrows_wind(int k, string N,int ots,int Code,color clr, int ArrowSize,bool up,datetime const &Time[],double const &High[],double const &Low[])                 
{           
   string objName = PREFIX+N+TimeToString(Time[k],TIME_MINUTES);
   double gap;
   CopyBuffer(ATR,0,k,1,ATR_Buffer);
   if(ArrowDisp) gap = ATR_Buffer[0]+ots*Point(); else gap = ots*Point();
   
   ObjectCreate(0,objName, OBJ_ARROW,0,Time[k],0);
   ObjectSetInteger(0,objName, OBJPROP_COLOR, clr);  
   ObjectSetInteger (0,objName, OBJPROP_ARROWCODE,Code);
   ObjectSetInteger(0,objName, OBJPROP_WIDTH,ArrowSize);
   ObjectSetInteger(0,objName,OBJPROP_BACK,true);  
   if (up)
    {
      ObjectSetInteger(0,objName, OBJPROP_ANCHOR,ANCHOR_BOTTOM);
      ObjectSetDouble(0,objName,OBJPROP_PRICE,0,High[k]+gap);
    }else{  
      ObjectSetInteger(0,objName, OBJPROP_ANCHOR,ANCHOR_TOP);
      ObjectSetDouble(0,objName,OBJPROP_PRICE,0,Low[k]-gap);
    }
}
//---------------------------------------------------------------------------------------------------+
void object_klik(string z,string x,string m,int b,color c,int k,int v)
{
 string objName = PREFIX+z; 
 int wind_ind;
   
   if(SetWind!=Win0)
     {
       int indicatorWindow = ChartWindowFind(0,"MMSDOT");
       if(indicatorWindow < 0) return;  
       wind_ind=indicatorWindow;
     } else wind_ind=0;
     
   if(ObjectFind(0,objName)==-1){
   ObjectCreate (0,objName,OBJ_LABEL,wind_ind,0,0);}
   ObjectSetString(0,objName,OBJPROP_TEXT,x);
   ObjectSetInteger(0,objName,OBJPROP_FONTSIZE,b);
   ObjectSetString(0,objName,OBJPROP_FONT,m);
   ObjectSetInteger(0,objName,OBJPROP_COLOR,c);
   ObjectSetInteger(0,objName,OBJPROP_CORNER,Corner);
   ObjectSetInteger (0,objName,OBJPROP_XDISTANCE,XDistance+k);
   ObjectSetInteger (0,objName,OBJPROP_YDISTANCE,YDistance+v+48);
   ObjectSetInteger (0,objName,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,objName,OBJPROP_BACK,false);
} 
//---------------------------------------------------------------------------------------------------+
void vertical_line(int k, color clr,datetime const &Time[])   
{
   string objName = PREFIX+TimeToString(Time[k],TIME_MINUTES);
   
   ObjectCreate(0,objName, OBJ_VLINE,0,Time[k],0);
   ObjectSetInteger   (0,objName, OBJPROP_COLOR, clr);  
   ObjectSetInteger   (0,objName, OBJPROP_BACK, true);
   ObjectSetInteger   (0,objName, OBJPROP_STYLE, 2);
   ObjectSetInteger   (0,objName, OBJPROP_WIDTH, 0); 
   ObjectSetInteger   (0,objName, OBJPROP_SELECTABLE, false); 
   ObjectSetInteger   (0,objName, OBJPROP_HIDDEN, true); 
}
//---------------------------------------------------------------------------------------------------+
void ObjectFon(string names,int xd,int yd,int xs,int ys,int type,color bgcol,color foncol)
{
   string name = PREFIX+names;
   int wind_ind;
   if(SetWind!=Win0)
     {
       int indicatorWindow = ChartWindowFind(0,"MMSDOT");
       if(indicatorWindow < 0) return;  
       wind_ind=indicatorWindow;
     } else wind_ind=0;
    
   if(ObjectFind   (0,name)==-1){
   ObjectCreate    (0,name,OBJ_RECTANGLE_LABEL,wind_ind,0,0);}
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,xd+XDistance);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,yd+YDistance);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,ys);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,xs);
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,bgcol);
   ObjectSetInteger(0,name,OBJPROP_COLOR,foncol);
   ObjectSetInteger(0,name,OBJPROP_STYLE,STYLE_SOLID);
   ObjectSetInteger(0,name,OBJPROP_WIDTH,1);
   ObjectSetInteger(0,name,OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);
   if(type==1)
     ObjectSetInteger(0,name,OBJPROP_BORDER_TYPE,BORDER_RAISED);
    else
     ObjectSetInteger(0,name,OBJPROP_BORDER_TYPE,BORDER_FLAT);
}    
//---------------------------------------------------------------------------------------------------+
void BackTest(int B_total_of_trades, int B_total_itm, int B_total_otm, double B_total_winrate,
              int S_total_of_trades, int S_total_itm, int S_total_otm, double S_total_winrate,
              const datetime &Time[], const double &Close[])
{
   string name = PREFIX+"Info";
   color B_Color_Winrate; 
   color S_Color_Winrate;
   int FontSize = 10;
   
   if (B_total_winrate<50)
      B_Color_Winrate = BackTestColorDn; else B_Color_Winrate = BackTestColorUp;
      
   if (S_total_winrate<50)
      S_Color_Winrate = BackTestColorDn; else S_Color_Winrate = BackTestColorUp;
      
   int wind_ind;
   if(SetWind!=Win0)
     {
       int indicatorWindow = ChartWindowFind(0,"MMSDOT");
       if(indicatorWindow < 0) return;  
       wind_ind=indicatorWindow;
     } else wind_ind=0;
     
   ObjectCreate (0,name+"1",OBJ_LABEL,wind_ind,Time[0],Close[0]);
   ObjectSetString(0,name+"1",OBJPROP_TEXT,"B-sig");
   ObjectSetInteger(0,name+"1",OBJPROP_FONTSIZE,FontSize);
   ObjectSetString(0,name+"1",OBJPROP_FONT,NULL);
   ObjectSetInteger(0,name+"1",OBJPROP_COLOR,BackTestColorSg);  
   ObjectSetInteger(0,name+"1",OBJPROP_XDISTANCE,XDistance+185);
   ObjectSetInteger(0,name+"1",OBJPROP_YDISTANCE,YDistance+110);//110/75
   ObjectSetInteger(0,name+"1",OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name+"1",OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,name+"1",OBJPROP_SELECTABLE,false);
   
   
   ObjectCreate (0,name+"2",OBJ_LABEL,wind_ind,Time[0],Close[0]);
   ObjectSetString(0,name+"2",OBJPROP_TEXT,"Win");
   ObjectSetInteger(0,name+"2",OBJPROP_FONTSIZE,FontSize);
   ObjectSetString(0,name+"2",OBJPROP_FONT,NULL);
   ObjectSetInteger(0,name+"2",OBJPROP_COLOR,BackTestColorUp);  
   ObjectSetInteger(0,name+"2",OBJPROP_XDISTANCE,XDistance+150);
   ObjectSetInteger(0,name+"2",OBJPROP_YDISTANCE,YDistance+110);//110/75
   ObjectSetInteger(0,name+"2",OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name+"2",OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,name+"2",OBJPROP_SELECTABLE,false);
   
   
   ObjectCreate (0,name+"3",OBJ_LABEL,wind_ind,Time[0],Close[0]);
   ObjectSetString(0,name+"3",OBJPROP_TEXT,"Lose");
   ObjectSetInteger(0,name+"3",OBJPROP_FONTSIZE,FontSize);
   ObjectSetString(0,name+"3",OBJPROP_FONT,NULL);
   ObjectSetInteger(0,name+"3",OBJPROP_COLOR,BackTestColorDn);  
   ObjectSetInteger(0,name+"3",OBJPROP_XDISTANCE,XDistance+115);
   ObjectSetInteger(0,name+"3",OBJPROP_YDISTANCE,YDistance+110);//110/75
   ObjectSetInteger(0,name+"3",OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name+"3",OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,name+"3",OBJPROP_SELECTABLE,false);
   
   ObjectCreate (0,name+"4",OBJ_LABEL,wind_ind,Time[0],Close[0]);
   ObjectSetString(0,name+"4",OBJPROP_TEXT,"WinRate");
   ObjectSetInteger(0,name+"4",OBJPROP_FONTSIZE,FontSize);
   ObjectSetString(0,name+"4",OBJPROP_FONT,NULL);
   ObjectSetInteger(0,name+"4",OBJPROP_COLOR,B_Color_Winrate);  
   ObjectSetInteger(0,name+"4",OBJPROP_XDISTANCE,XDistance+70);
   ObjectSetInteger(0,name+"4",OBJPROP_YDISTANCE,YDistance+110);//110/75
   ObjectSetInteger(0,name+"4",OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name+"4",OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,name+"4",OBJPROP_SELECTABLE,false);
   
   ObjectCreate(0,name+"5",OBJ_LABEL,wind_ind,Time[0],Close[0]);
    ObjectSetString(0,name+"5",OBJPROP_TEXT,IntegerToString(B_total_itm));
   ObjectSetInteger(0,name+"5",OBJPROP_FONTSIZE,FontSize);
   ObjectSetString(0,name+"5",OBJPROP_FONT,NULL);
   ObjectSetInteger(0,name+"5",OBJPROP_COLOR,BackTestColorUp);
   ObjectSetInteger(0,name+"5",OBJPROP_XDISTANCE,XDistance+150);
   ObjectSetInteger(0,name+"5",OBJPROP_YDISTANCE,YDistance+125);
   ObjectSetInteger(0,name+"5",OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name+"5",OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,name+"5",OBJPROP_SELECTABLE,false);
   
   ObjectCreate(0,name+"6",OBJ_LABEL,wind_ind,Time[0],Close[0]);
    ObjectSetString(0,name+"6",OBJPROP_TEXT,IntegerToString(B_total_otm));
   ObjectSetInteger(0,name+"6",OBJPROP_FONTSIZE,FontSize);
   ObjectSetString(0,name+"6",OBJPROP_FONT,NULL);
   ObjectSetInteger(0,name+"6",OBJPROP_COLOR,BackTestColorDn);
   ObjectSetInteger(0,name+"6",OBJPROP_XDISTANCE,XDistance+115);
   ObjectSetInteger(0,name+"6",OBJPROP_YDISTANCE,YDistance+125);
   ObjectSetInteger(0,name+"6",OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name+"6",OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,name+"6",OBJPROP_SELECTABLE,false);
   
   ObjectCreate(0,name+"7",OBJ_LABEL,wind_ind,Time[0],Close[0]);
    ObjectSetString(0,name+"7",OBJPROP_TEXT,DoubleToString(B_total_winrate,1));
   ObjectSetInteger(0,name+"7",OBJPROP_FONTSIZE,FontSize);
   ObjectSetString(0,name+"7",OBJPROP_FONT,NULL);
   ObjectSetInteger(0,name+"7",OBJPROP_COLOR,B_Color_Winrate);
   ObjectSetInteger(0,name+"7",OBJPROP_XDISTANCE,XDistance+70);
   ObjectSetInteger(0,name+"7",OBJPROP_YDISTANCE,YDistance+125);
   ObjectSetInteger(0,name+"7",OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name+"7",OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,name+"7",OBJPROP_SELECTABLE,false);
   
   ObjectCreate(0,name+"8",OBJ_LABEL,wind_ind,Time[0],Close[0]);
   ObjectSetString(0,name+"8",OBJPROP_TEXT,IntegerToString(B_total_of_trades));
   ObjectSetInteger(0,name+"8",OBJPROP_FONTSIZE,FontSize);
   ObjectSetString(0,name+"8",OBJPROP_FONT,NULL);
   ObjectSetInteger(0,name+"8",OBJPROP_COLOR,BackTestColorSg);
   ObjectSetInteger(0,name+"8",OBJPROP_XDISTANCE,XDistance+185);
   ObjectSetInteger(0,name+"8",OBJPROP_YDISTANCE,YDistance+125);
   ObjectSetInteger(0,name+"8",OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name+"8",OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,name+"8",OBJPROP_SELECTABLE,false);
//----
   ObjectCreate(0,name+"11",OBJ_LABEL,wind_ind,Time[0],Close[0]);
   ObjectSetString(0,name+"11",OBJPROP_TEXT,"S-sig");
   ObjectSetInteger(0,name+"11",OBJPROP_FONTSIZE,FontSize);
   ObjectSetString(0,name+"11",OBJPROP_FONT,NULL);
   ObjectSetInteger(0,name+"11",OBJPROP_COLOR,BackTestColorSg);
   ObjectSetInteger(0,name+"11",OBJPROP_XDISTANCE,XDistance+185);
   ObjectSetInteger(0,name+"11",OBJPROP_YDISTANCE,YDistance+75);//75
   ObjectSetInteger(0,name+"11",OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name+"11",OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,name+"11",OBJPROP_SELECTABLE,false);
   
   ObjectCreate(0,name+"12",OBJ_LABEL,wind_ind,Time[0],Close[0]);
   ObjectSetString(0,name+"12",OBJPROP_TEXT,"Win");
   ObjectSetInteger(0,name+"12",OBJPROP_FONTSIZE,FontSize);
   ObjectSetString(0,name+"12",OBJPROP_FONT,NULL);
   ObjectSetInteger(0,name+"12",OBJPROP_COLOR,BackTestColorUp);
   ObjectSetInteger(0,name+"12",OBJPROP_XDISTANCE,XDistance+150);
   ObjectSetInteger(0,name+"12",OBJPROP_YDISTANCE,YDistance+75);
   ObjectSetInteger(0,name+"12",OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name+"12",OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,name+"12",OBJPROP_SELECTABLE,false);
   
   ObjectCreate(0,name+"13",OBJ_LABEL,wind_ind,Time[0],Close[0]);
   ObjectSetString(0,name+"13",OBJPROP_TEXT,"Lose");
   ObjectSetInteger(0,name+"13",OBJPROP_FONTSIZE,FontSize);
   ObjectSetString(0,name+"13",OBJPROP_FONT,NULL);
   ObjectSetInteger(0,name+"13",OBJPROP_COLOR,BackTestColorDn);
   ObjectSetInteger(0,name+"13",OBJPROP_XDISTANCE,XDistance+115);
   ObjectSetInteger(0,name+"13",OBJPROP_YDISTANCE,YDistance+75);
   ObjectSetInteger(0,name+"13",OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name+"13",OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,name+"13",OBJPROP_SELECTABLE,false);
   
   ObjectCreate(0,name+"14",OBJ_LABEL,wind_ind,Time[0],Close[0]);
   ObjectSetString(0,name+"14",OBJPROP_TEXT,"WinRate");
   ObjectSetInteger(0,name+"14",OBJPROP_FONTSIZE,FontSize);
   ObjectSetString(0,name+"14",OBJPROP_FONT,NULL);
   ObjectSetInteger(0,name+"14",OBJPROP_COLOR,S_Color_Winrate);
   ObjectSetInteger(0,name+"14",OBJPROP_XDISTANCE,XDistance+70);
   ObjectSetInteger(0,name+"14",OBJPROP_YDISTANCE,YDistance+75);
   ObjectSetInteger(0,name+"14",OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name+"14",OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,name+"14",OBJPROP_SELECTABLE,false);
   
   ObjectCreate(0,name+"15",OBJ_LABEL,wind_ind,Time[0],Close[0]);
   ObjectSetString(0,name+"15",OBJPROP_TEXT,IntegerToString(S_total_itm));
   ObjectSetInteger(0,name+"15",OBJPROP_FONTSIZE,FontSize);
   ObjectSetString(0,name+"15",OBJPROP_FONT,NULL);
   ObjectSetInteger(0,name+"15",OBJPROP_COLOR,BackTestColorUp);
   ObjectSetInteger(0,name+"15",OBJPROP_XDISTANCE,XDistance+150);
   ObjectSetInteger(0,name+"15",OBJPROP_YDISTANCE,YDistance+90);//90
   ObjectSetInteger(0,name+"15",OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name+"15",OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,name+"15",OBJPROP_SELECTABLE,false);
   
   ObjectCreate(0,name+"16",OBJ_LABEL,wind_ind,Time[0],Close[0]);
   ObjectSetString(0,name+"16",OBJPROP_TEXT,IntegerToString(S_total_otm));
   ObjectSetInteger(0,name+"16",OBJPROP_FONTSIZE,FontSize);
   ObjectSetString(0,name+"16",OBJPROP_FONT,NULL);
   ObjectSetInteger(0,name+"16",OBJPROP_COLOR,BackTestColorDn);
   ObjectSetInteger(0,name+"16",OBJPROP_XDISTANCE,XDistance+115);
   ObjectSetInteger(0,name+"16",OBJPROP_YDISTANCE,YDistance+90);
   ObjectSetInteger(0,name+"16",OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name+"16",OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,name+"16",OBJPROP_SELECTABLE,false);
   
   ObjectCreate(0,name+"17",OBJ_LABEL,wind_ind,Time[0],Close[0]);
   ObjectSetString(0,name+"17",OBJPROP_TEXT,DoubleToString(S_total_winrate,1)+"%");
   ObjectSetInteger(0,name+"17",OBJPROP_FONTSIZE,FontSize);
   ObjectSetString(0,name+"17",OBJPROP_FONT,NULL);
   ObjectSetInteger(0,name+"17",OBJPROP_COLOR,S_Color_Winrate);
   ObjectSetInteger(0,name+"17",OBJPROP_XDISTANCE,XDistance+70);
   ObjectSetInteger(0,name+"17",OBJPROP_YDISTANCE,YDistance+90);
   ObjectSetInteger(0,name+"17",OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name+"17",OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,name+"17",OBJPROP_SELECTABLE,false);
   
   ObjectCreate(0,name+"18",OBJ_LABEL,wind_ind,Time[0],Close[0]);
   ObjectSetString(0,name+"18",OBJPROP_TEXT,IntegerToString(S_total_of_trades));
   ObjectSetInteger(0,name+"18",OBJPROP_FONTSIZE,FontSize);
   ObjectSetString(0,name+"18",OBJPROP_FONT,NULL);
   ObjectSetInteger(0,name+"18",OBJPROP_COLOR,BackTestColorSg);
   ObjectSetInteger(0,name+"18",OBJPROP_XDISTANCE,XDistance+185);
   ObjectSetInteger(0,name+"18",OBJPROP_YDISTANCE,YDistance+90);
   ObjectSetInteger(0,name+"18",OBJPROP_CORNER,Corner);
   ObjectSetInteger(0,name+"18",OBJPROP_ANCHOR,ANCHOR_CENTER);
   ObjectSetInteger(0,name+"18",OBJPROP_SELECTABLE,false);
}
//---------------------------------------------------------------------------------------------------+
string PeriodString()
{
    switch (_Period) 
     {
        case PERIOD_M1:  return("M1");
        case PERIOD_M5:  return("M5");
        case PERIOD_M15: return("M15");
        case PERIOD_M30: return("M30");
        case PERIOD_H1:  return("H1");
        case PERIOD_H4:  return("H4");
        case PERIOD_D1:  return("D1");
        case PERIOD_W1:  return("W1");
        case PERIOD_MN1: return("MN1");
     }    
   return("M" + string(_Period));
}
//---------------------------------------------------------------------------------------------------+