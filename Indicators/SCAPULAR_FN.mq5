//+------------------------------------------------------------------+
//|                                                     scapular.mq4 |
//|                        Copyright 2014, MetaQuotes Software Corp. |
//|                                                    +256701838757 |
//+------------------------------------------------------------------+
#property copyright "Copyright 2014, MetaQuotes Software Corp."
#property link      "+256701838757"
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0
#include <Trade\SymbolInfo.mqh>
CSymbolInfo SInfo;

int m=366, ak=2020;

int MA_Definicion_Close_5;
double MA_Buffer_Close_5[];
int MA_Definicion_Open_5;
double MA_Buffer_Open_5[];

int MA_Definicion_Close_20;
double MA_Buffer_Close_20[];

int MACD_Definicion_Close_12;
double MACD_Buffer_Close_12_MAIN[];
double MACD_Buffer_Close_12_SIGNAL[];

int MA_Definicion_Close_12 ;
int MA_Definicion_High_12 ;
int MA_Definicion_Low_12  ;

double  MA_Buffer_Close_12[]; 
double  MA_Buffer_High_12[]; 
double  MA_Buffer_Low_12[]; 

int Bands_Definicion;
double Bands_Bufffer[];

int Handle;
double HandleBuffer[1];
     
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   //---- indicators
    ObjectsDeleteAll(0,-1,-1);
    SInfo.RefreshRates();
    
    MA_Definicion_Close_5=iMA(NULL, PERIOD_H1, 5, 0, MODE_SMMA, PRICE_CLOSE);
    MA_Definicion_Open_5=iMA(NULL, PERIOD_H1, 5, 0, MODE_SMMA, PRICE_OPEN);
    
    MA_Definicion_Close_20=iMA(NULL, PERIOD_H1, 20, 0, MODE_EMA, PRICE_CLOSE);
    
    MACD_Definicion_Close_12=iMACD(NULL,PERIOD_H1,12,26,9,PRICE_CLOSE);
    
    MA_Definicion_Close_12 = iMA(NULL, PERIOD_H1, 12, 0, MODE_SMA, PRICE_CLOSE);
    MA_Definicion_High_12  = iMA(NULL, PERIOD_H1, 3, 0, MODE_LWMA, PRICE_HIGH);
    MA_Definicion_Low_12  = iMA(NULL, PERIOD_H1, 3, 0, MODE_LWMA, PRICE_LOW);     
    
    Bands_Definicion= iBands (NULL,PERIOD_H1,30,1,0,PRICE_CLOSE);//Bollinger bands 
    
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
//---

 if(Check()==false)                  // If the using conditions do not..
      return(0);                          // ..meet the requirements, then exit
 
   // The main code of the program must be specified here
   buu();


   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
bool Check() 
{                          
   MqlDateTime TiempoCurrent;
   TimeToStruct(TimeCurrent(),TiempoCurrent);
   
   if ((TiempoCurrent.day_of_year<m)&&(TiempoCurrent.year==ak))           // If the password is correct, then..
      return(true);          // ..allow the real account to trade
   Alert("renew your Subscrition with Charles Bulet: +256701838757 OR ALLAN :+256779631463  SMS:+256789523022 ");
   return(false);                      // Exit user-defined function
  }
//------------

int buu()
  {
   int     A=0, B=0, C=0, D=0, E=0, F=0, G=0, H=0, K=0;
   int  AH1=0, BH1=0,CH1=0;
   bool   H4B = false,H1B= false ;
   bool   H4S = false,H1S= false; 
  
  
//--------------------------------------------------------------------

// ONE Hour
//---------------------------------------------------------------------------

   //==================
   //the moving averages
   //====================
 
   CopyBuffer(MA_Definicion_Close_5,0,0,1,MA_Buffer_Close_5);
   CopyBuffer(MA_Definicion_Open_5,0,0,1,MA_Buffer_Open_5);
   double mac51 = MA_Buffer_Close_5[0];
   double mac81 = MA_Buffer_Open_5[0];

   //------------------------
   //PRESSURE
   //==========================
   CopyBuffer(MA_Definicion_Close_20,0,0,1,MA_Buffer_Close_20);
   double macX1 = MA_Buffer_Close_20[0];
   //=========================
   // MACD
   //==========================
   CopyBuffer(MACD_Definicion_Close_12,0,0,1,MACD_Buffer_Close_12_MAIN);
   CopyBuffer(MACD_Definicion_Close_12,1,0,1,MACD_Buffer_Close_12_SIGNAL);
   double main1 =   MACD_Buffer_Close_12_MAIN[0];
   double signal1 = MACD_Buffer_Close_12_SIGNAL[0];
   
   //=========================
   // TREND
   //==========================   
   CopyBuffer(MA_Definicion_Close_12,0,6,1,MA_Buffer_Close_12);
   CopyBuffer(MA_Definicion_High_12,0,0,1,MA_Buffer_High_12);
   CopyBuffer(MA_Definicion_Low_12,0,0,1,MA_Buffer_Low_12);
   
    Print("hola");
   double trend1 = MA_Buffer_Close_12[0];
   double maH1 = MA_Buffer_High_12[0];
   double maL1 = MA_Buffer_Low_12[0];
   
   //===============================================
   // candle & bands
   //==============================================
    Print("hola");
   
   CopyBuffer(Bands_Definicion,0,0,1,Bands_Bufffer);
   double bbh1= Bands_Bufffer[0];
   
 ObjectCreate(0,"b ", OBJ_LABEL, 0, 0, 0);

//---- buy conditions
if((maL1>trend1)&&(maL1 > bbh1))
{

   if(mac51 > mac81) 
     {
      A=1;
      ObjectSetString(0,"b ",OBJPROP_TEXT, "One Hour  =  " +IntegerToString(A,0,0));
      //, 8, "Ariel", White);
      ObjectSetInteger(0,"b ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"b ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b ", OBJPROP_YDISTANCE, 50);
        
      }
     
   
   if( main1 > signal1 && main1 < 0   && signal1 < 0 ) 
     {
      A =1 + A;
      ObjectSetString(0,"b ",OBJPROP_TEXT, "One Hour =  " +IntegerToString(A,0,0));
      // 8, "Ariel", SkyBlue);
      ObjectSetInteger(0,"b ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b ",OBJPROP_COLOR,clrSkyBlue);
      ObjectSetInteger(0,"b ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b ", OBJPROP_YDISTANCE, 50);
     
      }
    if( macX1 > mac81)
     {
        A=2+A;
      ObjectSetString(0,"b ",OBJPROP_TEXT, "One Hour =  " +IntegerToString(A,0,0));
      // 8, "Ariel", Blue);
      ObjectSetInteger(0,"b ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b ",OBJPROP_COLOR,clrBlue);
      ObjectSetInteger(0,"b ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b ", OBJPROP_YDISTANCE, 50);

    }
     
 }    
       
//---- sell conditions
if((maH1<trend1)&&(maH1 < bbh1))
{

   if(mac81 >mac51 )  
    {
      A=-1;
     ObjectSetString(0,"b ",OBJPROP_TEXT, "One Hour =  " +IntegerToString(A,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"b ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"b ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"b ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b ", OBJPROP_YDISTANCE, 50);
     } 
    
    
    if( main1 < signal1 && main1 > 0 && signal1 >0 ) 
    {
      A=-1 + A;
      ObjectSetString(0,"b ",OBJPROP_TEXT, "One Hour =  " +IntegerToString(A,0,0));
      // 8, "Ariel", Salmon);
      ObjectSetInteger(0,"b ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b ",OBJPROP_COLOR,clrSalmon);
      ObjectSetInteger(0,"b ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"b ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b ", OBJPROP_YDISTANCE, 50);

      
      }
      
         if( macX1 < mac81)  
         {
          A=-2+A;
          H1S= true;
          ObjectSetString(0,"b ",OBJPROP_TEXT, "One Hour =  " +IntegerToString(A,0,0));
      // 8, "Ariel", Red);
      ObjectSetInteger(0,"b ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b ",OBJPROP_COLOR,clrRed);
      ObjectSetInteger(0,"b ", OBJPROP_CORNER,4);
      ObjectSetInteger(0,"b ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b ", OBJPROP_YDISTANCE, 50);

         }
 }

//--------------------------------------------------------------------

// ONE MINUTE
//---------------------------------------------------------------------------

   //==================
   //the moving averages
   //====================
   Handle=iMA(NULL, PERIOD_M1, 5, 0, MODE_SMMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac5 = HandleBuffer[0];
   Handle=iMA(NULL, PERIOD_M1, 8, 0, MODE_SMMA, PRICE_OPEN);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac8 = HandleBuffer[0];

   //------------------------
   //PRESSURE
   //==========================
   Handle=iMA(NULL, PERIOD_M1, 20, 0, MODE_EMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double macX = HandleBuffer[0];
  
   
   //=========================
   // MACD
   //==========================
   Handle=iMACD(NULL,PERIOD_M1,12,26,9,PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double main = HandleBuffer[0];
   CopyBuffer(Handle,1,0,1,HandleBuffer);
   double signal = HandleBuffer[0];
       
   //=========================
   // TREND
   //==========================   
    Handle=iMA(NULL, PERIOD_M1, 12, 0, MODE_SMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,6,1,HandleBuffer);
   double trend = HandleBuffer[0];
   Handle=iMA(NULL, PERIOD_M1, 3, 0, MODE_LWMA, PRICE_HIGH);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double maH = HandleBuffer[0];
   Handle=iMA(NULL, PERIOD_M1, 3, 0, MODE_LWMA, PRICE_LOW);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double maL = HandleBuffer[0];
   
   //===============================================
   // candle & bands
   //==============================================
   Handle=iBands (NULL,PERIOD_M1,30,1,0,PRICE_CLOSE);//Bollinger bands 
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double bbh= HandleBuffer[0];


 ObjectCreate(0,"b1 ", OBJ_LABEL, 0, 0, 0);

//---- buy conditions
if((maL>trend)&&(maL > bbh))
{

   if(mac5 > mac8) 
     {
      B=1;
      ObjectSetString(0,"b1 ",OBJPROP_TEXT, "One Minute =  " +IntegerToString(B,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"b1 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b1 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b1 ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"b1 ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b1 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b1 ", OBJPROP_YDISTANCE, 10);
      }
     
   
   if( main > signal &&  main<0 && signal <0) 
     {
      B =1 + B;
      ObjectSetString(0,"b1 ",OBJPROP_TEXT, "One Minute =  " +IntegerToString(B,0,0));
      // 8, "Ariel", SkyBlue);
      ObjectSetInteger(0,"b1 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b1 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b1 ",OBJPROP_COLOR,clrSkyBlue);
      ObjectSetInteger(0,"b1 ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b1 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b1 ", OBJPROP_YDISTANCE, 10);
     
      }
    if (macX > mac8)
     {
        B=2+B;
      ObjectSetString(0,"b1 ",OBJPROP_TEXT, "One Minute =  " +IntegerToString(B,0,0));
      // 8, "Ariel", Blue);
      ObjectSetInteger(0,"b1 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b1 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b1 ",OBJPROP_COLOR,clrBlue);
      ObjectSetInteger(0,"b1 ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b1 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b1 ", OBJPROP_YDISTANCE, 10);

    }
     
 }    
       
//---- sell conditions

if((maH<trend)&&(maH < bbh))
{

   if(mac8 >mac5 )  
    {
      B=-1;
      ObjectSetString(0,"b1 ",OBJPROP_TEXT, "One Minute =  " +IntegerToString(B,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"b1 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b1 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b1 ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"b1 ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"b1 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b1 ", OBJPROP_YDISTANCE, 10);
     } 
    
    
    if( main < signal &&  main >0 && signal > 0) 
    {
      B=-1 + B;
     ObjectSetString(0,"b1 ",OBJPROP_TEXT, "One Minute =  " +IntegerToString(B,0,0));
      // 8, "Ariel", Salmon);
      ObjectSetInteger(0,"b1 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b1 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b1 ",OBJPROP_COLOR,clrSalmon);
      ObjectSetInteger(0,"b1 ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"b1 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b1 ", OBJPROP_YDISTANCE, 10);

      
      }
      
         if( macX < mac8)  
         {
          B=-2+B;
          ObjectSetString(0,"b1 ",OBJPROP_TEXT, "One Minute =  " +IntegerToString(B,0,0));
      // 8, "Ariel", Red);
      ObjectSetInteger(0,"b1 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b1 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b1 ",OBJPROP_COLOR,clrRed);
      ObjectSetInteger(0,"b1 ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"b1 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b1 ", OBJPROP_YDISTANCE, 10);

         }
 } 
 


 //--------------------------------------------------------------------

// FIVE MINUTE
//---------------------------------------------------------------------------

      //==================
   //the moving averages
   //====================
   Handle=iMA(NULL, PERIOD_M5, 5, 0, MODE_SMMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac55 = HandleBuffer[0];
   Handle=iMA(NULL, PERIOD_M5, 8, 0, MODE_SMMA, PRICE_OPEN);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac85 = HandleBuffer[0];

   //------------------------
   //PRESSURE
   //==========================
   Handle=iMA(NULL, PERIOD_M5, 20, 0, MODE_EMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double macX5 = HandleBuffer[0];
  
   
   //=========================
   // MACD
   //==========================
   Handle=iMACD(NULL,PERIOD_M5,12,26,9,PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double main5= HandleBuffer[0];
   Handle=iMACD(NULL,PERIOD_M5,12,26,9,PRICE_CLOSE);
   CopyBuffer(Handle,1,0,1,HandleBuffer);
   double signal5 = HandleBuffer[0];
       
   //=========================
   // TREND
   //==========================   
   Handle=iMA(NULL, PERIOD_M5, 12, 0, MODE_SMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,6,1,HandleBuffer);
   double trend5 = HandleBuffer[0];
   Handle=iMA(NULL, PERIOD_M5, 3, 0, MODE_LWMA, PRICE_HIGH);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double maH5 = HandleBuffer[0];
   Handle=iMA(NULL, PERIOD_M5, 3, 0, MODE_LWMA, PRICE_LOW);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double maL5 = HandleBuffer[0];
   
   //===============================================
   // candle & bands
   //==============================================
   Handle=iBands (NULL,PERIOD_M5,30,1,0,PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double bbh5= HandleBuffer[0];
   
 ObjectCreate(0,"b5 ", OBJ_LABEL, 0, 0, 0);

//---- buy conditions
if((maL5>trend5)&&(maL5 > bbh5))
{

   if(mac55 > mac85) 
     {
      C=1;
      ObjectSetString(0,"b5 ",OBJPROP_TEXT, "Five Minute =  " +IntegerToString(C,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"b5 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b5 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b5 ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"b5 ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b5 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b5 ", OBJPROP_YDISTANCE, 20);
      }
     
   
   if( main5 > signal5 && main5 < 0 && signal5 <0) 
     {
      C =1 + C;
      ObjectSetString(0,"b5 ",OBJPROP_TEXT, "Five Minute =  " +IntegerToString(C,0,0));
      // 8, "Ariel", SkyBlue);
      ObjectSetInteger(0,"b5 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b5 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b5 ",OBJPROP_COLOR,clrSkyBlue);
      ObjectSetInteger(0,"b5 ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b5 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b5 ", OBJPROP_YDISTANCE, 20);
     
      }
         if( macX5 > mac85)  
     {
        C=2+C;
      ObjectSetString(0,"b5 ",OBJPROP_TEXT, "Five Minute =  " +IntegerToString(C,0,0));
      // 8, "Ariel", Blue);
      ObjectSetInteger(0,"b5 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b5 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b5 ",OBJPROP_COLOR,clrBlue);
      ObjectSetInteger(0,"b5 ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b5 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b5 ", OBJPROP_YDISTANCE, 20);

    }
     
 }    
       
//---- sell conditions

if((maH5 <trend5)&&(maH5 < bbh5))
{

   if(mac85 >mac55 )  
    {
      C=-1;
     ObjectSetString(0,"b5 ",OBJPROP_TEXT, "Five Minute =  " +IntegerToString(C,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"b5 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b5 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b5 ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"b5 ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"b5 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b5 ", OBJPROP_YDISTANCE, 20);
     } 
    
    
    if( main5 < signal5 && main5 > 0 && signal5 > 0) 
    {
      C=-1 + C;
      ObjectSetString(0,"b5 ",OBJPROP_TEXT, "Five Minute =  " +IntegerToString(C,0,0));
      // 8, "Ariel", Salmon);
      ObjectSetInteger(0,"b5 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b5 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b5 ",OBJPROP_COLOR,clrSalmon);
      ObjectSetInteger(0,"b5 ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"b5 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b5 ", OBJPROP_YDISTANCE, 20);

      
      }
      
         if( macX5 < mac85)  
         {
          C=-2+C;
          ObjectSetString(0,"b5 ",OBJPROP_TEXT, "Five Minute =  " +IntegerToString(C,0,0));
      // 8, "Ariel", Red);
      ObjectSetInteger(0,"b5 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b5 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b5 ",OBJPROP_COLOR,clrRed);
      ObjectSetInteger(0,"b5 ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"b5 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b5 ", OBJPROP_YDISTANCE, 20);

         }
 } 

 //--------------------------------------------------------------------

//FIFFTEEN MINUTE
//---------------------------------------------------------------------------
   //==================
   //the moving averages
   //====================
   Handle=iMA(NULL, PERIOD_M15, 5, 0, MODE_SMMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac515 = HandleBuffer[0];
   
   Handle=iMA(NULL, PERIOD_M15, 8, 0, MODE_SMMA, PRICE_OPEN);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac815 = HandleBuffer[0];

   //------------------------
   //PRESSURE
   //==========================
   Handle=iMA(NULL, PERIOD_M15, 20, 0, MODE_EMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac115 = HandleBuffer[0];
  
   
   //=========================
   // MACD
   //==========================
   Handle=iMACD(NULL,PERIOD_M15,12,26,9,PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double main15 = HandleBuffer[0];
   CopyBuffer(Handle,1,0,1,HandleBuffer);
   double signal15 = HandleBuffer[0];
       
   //=========================
   // TREND
   //==========================   
   Handle=iMA(NULL, PERIOD_M15, 12, 0, MODE_SMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,6,1,HandleBuffer);
   double trend15 =HandleBuffer[0];
   
   Handle=iMA(NULL, PERIOD_M15, 3, 0, MODE_LWMA, PRICE_HIGH);
   CopyBuffer(Handle,0,0,1,HandleBuffer);   
   double maH15 = HandleBuffer[0];
   
    Handle=iMA(NULL, PERIOD_M15, 3, 0, MODE_LWMA, PRICE_LOW);
   CopyBuffer(Handle,0,0,1,HandleBuffer); 
   double maL15 = HandleBuffer[0];
   
   //===============================================
   // candle & bands
   //==============================================
   Handle=iBands (NULL,PERIOD_M15,30,1,0,PRICE_CLOSE);//Bollinger bands 
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double bbh15= HandleBuffer[0];
   
   
 ObjectCreate(0,"b115 ", OBJ_LABEL, 0, 0, 0);

//---- buy conditions
if((maL15>trend15)&&(maL15 > bbh15))
{

   if(mac515 > mac815) 
     {
      D=1;
      ObjectSetString(0,"b115 ",OBJPROP_TEXT, "FIFFTEEN Minute =  " +IntegerToString(D,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"b115 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b115 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b115 ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"b115 ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b115 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b115 ", OBJPROP_YDISTANCE, 30);
      }
     
   
   if( main15 > signal15 && main15 < 0 && signal15 < 0) 
     {
      D =1 + D;
      ObjectSetString(0,"b115 ",OBJPROP_TEXT, "FIFFTEEN Minute =  " +IntegerToString(D,0,0));
      // 8, "Ariel", SkyBlue);
      ObjectSetInteger(0,"b115 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b115 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b115 ",OBJPROP_COLOR,clrSkyBlue);
      ObjectSetInteger(0,"b115 ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b115 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b115 ", OBJPROP_YDISTANCE, 30);
     
      }
         if( mac115 > mac815)  
     {
        D=2+D;
     ObjectSetString(0,"b115 ",OBJPROP_TEXT, "FIFFTEEN Minute =  " +IntegerToString(D,0,0));
      // 8, "Ariel", Blue);
      ObjectSetInteger(0,"b115 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b115 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b115 ",OBJPROP_COLOR,clrBlue);
      ObjectSetInteger(0,"b115 ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b115 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b115 ", OBJPROP_YDISTANCE, 30);

    }
     
 }    
       
//---- sell conditions

if((maH15 < trend15)&&(maH15 < bbh15))
{

   if(mac815 >mac515 )  
    {
      D=-1;
      ObjectSetString(0,"b115 ",OBJPROP_TEXT, "FIFFTEEN Minute =  " +IntegerToString(D,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"b115 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b115 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b115 ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"b115 ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"b115 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b115 ", OBJPROP_YDISTANCE, 30);
     } 
    
    
    if( main15 < signal15 && main15 > 0 &&  signal15 > 0) 
    {
      D=-1 + D;
      ObjectSetString(0,"b115 ",OBJPROP_TEXT, "FIFFTEEN Minute =  " +IntegerToString(D,0,0));
      // 8, "Ariel", Salmon);
      ObjectSetInteger(0,"b115 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b115 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b115 ",OBJPROP_COLOR,clrSalmon);
      ObjectSetInteger(0,"b115 ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"b115 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b115 ", OBJPROP_YDISTANCE, 30);

      
      }
      
         if( mac115 < mac815)  
         {
          D=-2+D;
      ObjectSetString(0,"b115 ",OBJPROP_TEXT, "FIFFTEEN Minute =  " +IntegerToString(D,0,0));
      // 8, "Ariel", Red);
      ObjectSetInteger(0,"b115 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b115 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b115 ",OBJPROP_COLOR,clrRed);
      ObjectSetInteger(0,"b115 ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"b115 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b115 ", OBJPROP_YDISTANCE, 30);

         }
 } 
 
 //--------------------------------------------------------------------

// THIRTY MINUTE
//---------------------------------------------------------------------------

   //==================
   //the moving averages
   //====================
   Handle=iMA(NULL, PERIOD_M30, 5, 0, MODE_SMMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac530 = HandleBuffer[0];
   Handle=iMA(NULL, PERIOD_M30, 8, 0, MODE_SMMA, PRICE_OPEN);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac830 = HandleBuffer[0];

   //------------------------
   //PRESSURE
   //==========================
   Handle=iMA(NULL, PERIOD_M30, 20, 0, MODE_EMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac30 = HandleBuffer[0];
  
   
   //=========================
   // MACD
   //==========================
   Handle=iMACD(NULL,PERIOD_M30,12,26,9,PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double main30 = HandleBuffer[0];
   
   Handle=iMACD(NULL,PERIOD_M30,12,26,9,PRICE_CLOSE);
   CopyBuffer(Handle,1,0,1,HandleBuffer);
   double signal30 = HandleBuffer[0];
       
   //=========================
   // TREND
   //==========================   
   Handle=iMA(NULL, PERIOD_M30, 12, 0, MODE_SMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,6,1,HandleBuffer);
   double trend30 = HandleBuffer[0];
   
   Handle=iMA(NULL, PERIOD_M30, 3, 0, MODE_LWMA, PRICE_HIGH);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double maH30 = HandleBuffer[0];
   
   Handle=iMA(NULL, PERIOD_M30, 3, 0, MODE_LWMA, PRICE_LOW);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double maL30 =HandleBuffer[0];
   
   //===============================================
   // candle & bands
   //==============================================
    Handle=iBands (NULL,PERIOD_M30,30,1,0,PRICE_CLOSE);//Bollinger bands 
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double bbh30= HandleBuffer[0]; 
   
 ObjectCreate(0,"b130 ", OBJ_LABEL, 0, 0, 0);

//---- buy conditions
if((maL30>trend30)&&(maL30 > bbh30))
{

   if(mac530 > mac830) 
     {
      E=1;
      ObjectSetString(0,"b130 ",OBJPROP_TEXT, "Thirty Minute =  " +IntegerToString(E,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"b130 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b130 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b130 ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"b130 ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b130 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b130 ", OBJPROP_YDISTANCE, 40);
      }
     
   
   if( main30 > signal30 &&  main30 < 0 &&  signal30 > 0) 
     {
      E =1 + E;
      ObjectSetString(0,"b130 ",OBJPROP_TEXT, "Thirty Minute =  " +IntegerToString(E,0,0));
      // 8, "Ariel", SkyBlue);
      ObjectSetInteger(0,"b130 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b130 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b130 ",OBJPROP_COLOR,clrSkyBlue);
      ObjectSetInteger(0,"b130 ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b130 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b130 ", OBJPROP_YDISTANCE, 40);
     
      }
         if( mac30 > mac830)  
     {
        E=2+E;
      ObjectSetString(0,"b130 ",OBJPROP_TEXT, "Thirty Minute =  " +IntegerToString(E,0,0));
      // 8, "Ariel", Blue);
      ObjectSetInteger(0,"b130 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b130 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b130 ",OBJPROP_COLOR,clrBlue);
      ObjectSetInteger(0,"b130 ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b130 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b130 ", OBJPROP_YDISTANCE, 40);

    }
     
 }    
       
//---- sell conditions

if((maH30>trend30)&&(maH30 > bbh30))
{

   if(mac830 >mac530 )  
    {
      E=-1;
      ObjectSetString(0,"b130 ",OBJPROP_TEXT, "Thirty Minute =  " +IntegerToString(E,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"b130 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b130 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b130 ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"b130 ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"b130 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b130 ", OBJPROP_YDISTANCE, 40);
     } 
    
    
    if( main30 < signal30 &&  main30 > 0 &&  signal30 > 0) 
    {
      E=-1 + E;
      ObjectSetString(0,"b130 ",OBJPROP_TEXT, "Thirty Minute =  " +IntegerToString(E,0,0));
      // 8, "Ariel", Salmon);
      ObjectSetInteger(0,"b130 ",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"b130 ",OBJPROP_FONT,"Ariel");
      ObjectSetInteger(0,"b130 ",OBJPROP_COLOR,clrSalmon);
      ObjectSetInteger(0,"b130 ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"b130 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b130 ", OBJPROP_YDISTANCE, 40);

      
      }
      
         if( mac30 < mac830)  
         {
          E=-2+E;
          ObjectSetString(0,"b130 ",OBJPROP_TEXT, "Thirty Minute =  " +IntegerToString(E,0,0));
      // 8, "Ariel", Red);
          ObjectSetInteger(0,"b130 ",OBJPROP_FONTSIZE,8);
          ObjectSetString(0,"b130 ",OBJPROP_FONT,"Ariel");
          ObjectSetInteger(0,"b130 ",OBJPROP_COLOR,clrRed);
          ObjectSetInteger(0,"b130 ", OBJPROP_CORNER, 4);
          ObjectSetInteger(0,"b130 ", OBJPROP_XDISTANCE, 10);
          ObjectSetInteger(0,"b130 ", OBJPROP_YDISTANCE, 40);
         }
 } 



  int done = A+B+C+D+E;
       ObjectCreate(0,"allan12 ", OBJ_LABEL, 0, 0, 0);
       ObjectSetString(0,"allan12 ",OBJPROP_TEXT,"Lower  T-Frames ( 1m - 1hr)= 20 " );//, 8, "ArielBlack",Teal);
       ObjectSetInteger(0,"allan12 ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"allan12 ",OBJPROP_FONT,"ArielBlack");
       ObjectSetInteger(0,"allan12 ",OBJPROP_COLOR,clrTeal);
       ObjectSetInteger(0,"allan12 ", OBJPROP_CORNER, 3);
       ObjectSetInteger(0,"allan12 ", OBJPROP_XDISTANCE, 5);
       ObjectSetInteger(0,"allan12 ", OBJPROP_YDISTANCE,5);

  
       ObjectCreate(0,"allan1 ", OBJ_LABEL, 0, 0, 0);
       ObjectSetString(0,"allan1 ",OBJPROP_TEXT,"" +IntegerToString(done,0,0));//, 30, "ArielBlack",Yellow);
       ObjectSetInteger(0,"allan1 ",OBJPROP_FONTSIZE,30);
       ObjectSetString(0,"allan1 ",OBJPROP_FONT,"ArielBlack");
       ObjectSetInteger(0,"allan1 ",OBJPROP_COLOR,clrYellow);
       ObjectSetInteger(0,"allan1 ", OBJPROP_CORNER, 3);
       ObjectSetInteger(0,"allan1 ", OBJPROP_XDISTANCE, 50);
       ObjectSetInteger(0,"allan1 ", OBJPROP_YDISTANCE, 50);
//--------------------------------------------------------------------

// four Hour
//---------------------------------------------------------------------------
   //==================
   //the moving averages
   //====================
   Handle=iMA(NULL, PERIOD_H4, 5, 0, MODE_SMMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac514 = HandleBuffer[0];
   Handle=iMA(NULL, PERIOD_H4, 8, 0, MODE_SMMA, PRICE_OPEN);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac814 = HandleBuffer[0];

   //------------------------
   //PRESSURE
   //==========================
   Handle=iMA(NULL, PERIOD_H4, 20, 0, MODE_EMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac14 = HandleBuffer[0];
  
   
   //=========================
   // MACD
   //==========================
   Handle=iMACD(NULL,PERIOD_H4,12,26,9,PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double main14 = HandleBuffer[0];
   Handle=iMACD(NULL,PERIOD_H4,12,26,9,PRICE_CLOSE);
   CopyBuffer(Handle,1,0,1,HandleBuffer);
   double signal14 = HandleBuffer[0];
       
   //=========================
   // TREND
   //==========================   
   Handle=iMA(NULL, PERIOD_H4, 12, 0, MODE_SMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,6,1,HandleBuffer);
   double trend14 = HandleBuffer[0];
   
   Handle=iMA(NULL, PERIOD_H4, 3, 0, MODE_LWMA, PRICE_HIGH);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double maH14 = HandleBuffer[0];
   
   Handle=iMA(NULL, PERIOD_H4, 3, 0, MODE_LWMA, PRICE_LOW);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double maL14 = HandleBuffer[0];
   
   //===============================================
   // candle & bands
   //==============================================
   Handle=iBands (NULL,PERIOD_H4,30,1,0,PRICE_CLOSE);//Bollinger bands 
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double bbh14= HandleBuffer[0];
   
   
 ObjectCreate(0,"b4 ", OBJ_LABEL, 0, 0, 0);

//---- buy conditions
if((maL14>trend14)&&(maL14 > bbh14))
{

   if(mac514 > mac814) 
     {
      F=1;
      ObjectSetString(0,"b4 ",OBJPROP_TEXT, "FOUR Hour =  " +IntegerToString(F,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"b4 ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"b4 ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"b4 ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"b4 ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b4 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b4 ", OBJPROP_YDISTANCE, 60);
      }
     
   
   if( main14 > signal14 &&  main14 < 0 && signal14 < 0) 
     {
      F =1 + F;
      ObjectSetString(0,"b4 ",OBJPROP_TEXT, "FOUR Hour =  " +IntegerToString(F,0,0));
      // 8, "Ariel", Skyblue);
      ObjectSetInteger(0,"b4 ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"b4 ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"b4 ",OBJPROP_COLOR,clrSkyBlue);
      ObjectSetInteger(0,"b4 ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b4 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b4 ", OBJPROP_YDISTANCE, 60);
     
      }
         if( mac14 > mac814)  
     {
        F=2+F;
        H4B = true;
      ObjectSetString(0,"b4 ",OBJPROP_TEXT, "FOUR Hour =  " +IntegerToString(F,0,0));
      // 8, "Ariel", Blue);
      ObjectSetInteger(0,"b4 ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"b4 ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"b4 ",OBJPROP_COLOR,clrBlue);
      ObjectSetInteger(0,"b4 ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"b4 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b4 ", OBJPROP_YDISTANCE, 60);

    }
     
 }    
       
//---- sell conditions

if((maH14<trend14)&&(maH14 < bbh14))
{

   if(mac814 >mac514 )  
    {
      F=-1;
      ObjectSetString(0,"b4 ",OBJPROP_TEXT, "FOUR Hour =  " +IntegerToString(F,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"b4 ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"b4 ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"b4 ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"b4 ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"b4 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b4 ", OBJPROP_YDISTANCE, 60);
     } 
    
    
    if( main14 < signal14 &&  main14 > 0 &&  signal14 > 0) 
    {
      F=-1 + F;
      ObjectSetString(0,"b4 ",OBJPROP_TEXT, "FOUR Hour =  " +IntegerToString(F,0,0));
      // 8, "Ariel", Salmon);
      ObjectSetInteger(0,"b4 ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"b4 ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"b4 ",OBJPROP_COLOR,clrSalmon);
      ObjectSetInteger(0,"b4 ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"b4 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b4 ", OBJPROP_YDISTANCE, 60);

      
      }
      
         if( mac14 < mac814)  
         {
          F=-2+F;
          H4S = true;
          ObjectSetString(0,"b4 ",OBJPROP_TEXT, "FOUR Hour =  " +IntegerToString(F,0,0));
      // 8, "Ariel",Red);
      ObjectSetInteger(0,"b4 ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"b4 ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"b4 ",OBJPROP_COLOR,clrRed);
      ObjectSetInteger(0,"b4 ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"b4 ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"b4 ", OBJPROP_YDISTANCE, 60);

         }
 }
 
//--------------------------------------------------------------------

// Day
//---------------------------------------------------------------------------
   //==================
   //the moving averages
   //====================
   Handle=iMA(NULL, PERIOD_D1, 5, 0, MODE_SMMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac51D = HandleBuffer[0];
   
   Handle=iMA(NULL, PERIOD_D1, 8, 0, MODE_SMMA, PRICE_OPEN);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac81D = HandleBuffer[0];

   //------------------------
   //PRESSURE
   //==========================
   Handle=iMA(NULL, PERIOD_D1, 20, 0, MODE_EMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac1D = HandleBuffer[0];
  
   
   //=========================
   // MACD
   //==========================
   Handle=iMACD(NULL,PERIOD_D1,12,26,9,PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double main1D = HandleBuffer[0];
   
   Handle=iMACD(NULL,PERIOD_D1,12,26,9,PRICE_CLOSE);
   CopyBuffer(Handle,1,0,1,HandleBuffer);
   double signal1D = HandleBuffer[0];
       
   //=========================
   // TREND
   //==========================   
   Handle=iMA(NULL, PERIOD_D1, 12, 0, MODE_SMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,6,1,HandleBuffer);
   double trend1D = HandleBuffer[0];
   
   Handle=iMA(NULL, PERIOD_D1, 3, 0, MODE_LWMA, PRICE_HIGH);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double maH1D = HandleBuffer[0];
   
   Handle=iMA(NULL, PERIOD_D1, 3, 0, MODE_LWMA, PRICE_LOW);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double maL1D = HandleBuffer[0];
   
   //===============================================
   // candle & bands
   //==============================================
   Handle=iBands (NULL,PERIOD_D1,30,1,0,PRICE_CLOSE);//Bollinger bands 
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double bbh1D= HandleBuffer[0]; 
   
   
   
   
 ObjectCreate(0,"bD ", OBJ_LABEL, 0, 0, 0);

//---- buy conditions
if((maL1D>trend1D)&&(maL1D > bbh1D))
{

   if(mac51D > mac81D) 
     {
      G=1;
      ObjectSetString(0,"bD ",OBJPROP_TEXT, "Day =  " +IntegerToString(G,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"bD ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bD ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bD ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"bD ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"bD ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bD ", OBJPROP_YDISTANCE, 70);
        
      }
     
   
   if( main1D > signal1D &&  main1D < 0 && signal1D < 0) 
     {
      G =1 + G;
      ObjectSetString(0,"bD ",OBJPROP_TEXT, "Day =  " +IntegerToString(G,0,0));
      // 8, "Ariel", SkyBlue);
      ObjectSetInteger(0,"bD ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bD ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bD ",OBJPROP_COLOR,clrSkyBlue);
      ObjectSetInteger(0,"bD ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"bD ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bD ", OBJPROP_YDISTANCE, 70);
     
      }
         if( mac1D > mac81D)  
     {
        G=2+G;
      ObjectSetString(0,"bD ",OBJPROP_TEXT, "Day =  " +IntegerToString(G,0,0));
      // 8, "Ariel", Blue);
      ObjectSetInteger(0,"bD ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bD ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bD ",OBJPROP_COLOR,clrBlue);
      ObjectSetInteger(0,"bD ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"bD ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bD ", OBJPROP_YDISTANCE, 70);

    }
     
 }    
       
//---- sell conditions

if((maH1D< trend1D)&&(maH1D < bbh1D))
{

   if(mac81D >mac51D )  
    {
      G=-1;
      ObjectSetString(0,"bD ",OBJPROP_TEXT, "Day =  " +IntegerToString(G,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"bD ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bD ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bD ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"bD ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"bD ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bD ", OBJPROP_YDISTANCE, 70);
     } 
    
    
    if( main1D < signal1D && main1D >0 && signal1D > 0) 
    {
      G=-1 + G;
      ObjectSetString(0,"bD ",OBJPROP_TEXT, "Day =  " +IntegerToString(G,0,0));
      // 8, "Ariel", Salmon);
      ObjectSetInteger(0,"bD ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bD ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bD ",OBJPROP_COLOR,clrSalmon);
      ObjectSetInteger(0,"bD ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"bD ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bD ", OBJPROP_YDISTANCE, 70);

      
      }
      
         if( mac1D < mac81D)  
         {
          G=-2+G;
         ObjectSetString(0,"bD ",OBJPROP_TEXT, "Day =  " +IntegerToString(G,0,0));
         // 8, "Ariel", Red);
         ObjectSetInteger(0,"bD ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bD ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bD ",OBJPROP_COLOR,clrRed);
         ObjectSetInteger(0,"bD ", OBJPROP_CORNER, 4);
         ObjectSetInteger(0,"bD ", OBJPROP_XDISTANCE, 10);
         ObjectSetInteger(0,"bD ", OBJPROP_YDISTANCE, 70);

         }
 }
 //--------------------------------------------------------------------

// WEEK
//---------------------------------------------------------------------------

   //==================
   //the moving averages
   //====================
   Handle=iMA(NULL, PERIOD_W1, 5, 0, MODE_SMMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac51W = HandleBuffer[0];
   
   Handle=iMA(NULL, PERIOD_W1, 8, 0, MODE_SMMA, PRICE_OPEN);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac81W = HandleBuffer[0];

   //------------------------
   //PRESSURE
   //==========================
   Handle=iMA(NULL, PERIOD_W1, 20, 0, MODE_EMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac1W = HandleBuffer[0];
  
   
   //=========================
   // MACD
   //==========================
   Handle=iMACD(NULL,PERIOD_W1,12,26,9,PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double main1W = HandleBuffer[0];
   
   Handle=iMACD(NULL,PERIOD_W1,12,26,9,PRICE_CLOSE);
   CopyBuffer(Handle,1,0,1,HandleBuffer);
   double signal1W = HandleBuffer[0];
       
   //=========================
   // TREND
   //==========================   
    Handle=iMA(NULL, PERIOD_W1, 12, 0, MODE_SMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,6,1,HandleBuffer);
   double trend1W = HandleBuffer[0];
   
   Handle=iMA(NULL, PERIOD_W1, 3, 0, MODE_LWMA, PRICE_HIGH);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double maH1W = HandleBuffer[0];
   
   Handle=iMA(NULL, PERIOD_W1, 3, 0, MODE_LWMA, PRICE_LOW);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double maL1W = HandleBuffer[0];
   
   //===============================================
   // candle & bands
   //==============================================
   Handle=iBands (NULL,PERIOD_W1,30,1,0,PRICE_CLOSE);//Bollinger bands 
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double bbh1W= HandleBuffer[0];
   
   
   
 ObjectCreate(0,"bW ", OBJ_LABEL, 0, 0, 0);

//---- buy conditions
if((maL1W>trend1W)&&(maL1W > bbh1W))
{

   if(mac51W > mac81W) 
     {
      H=1;
      ObjectSetString(0,"bW ",OBJPROP_TEXT, "WEEK  =  " +IntegerToString(H,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"bW ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bW ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bW ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"bW ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"bW ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bW ", OBJPROP_YDISTANCE, 80);
      }
     
   
   if( main1W > signal1W && main1W < 0 &&  signal1W < 0) 
     {
      H =1 + H;
      ObjectSetString(0,"bW ",OBJPROP_TEXT, "WEEK  =  " +IntegerToString(H,0,0));
      // 8, "Ariel", SkyBlue);
      ObjectSetInteger(0,"bW ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bW ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bW ",OBJPROP_COLOR,clrSkyBlue);
      ObjectSetInteger(0,"bW ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"bW ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bW ", OBJPROP_YDISTANCE, 80);
     
      }
         if( mac1W > mac81W)  
     {
        H=2+H;
      ObjectSetString(0,"bW ",OBJPROP_TEXT, "WEEK  =  " +IntegerToString(H,0,0));
      // 8, "Ariel", Blue);
      ObjectSetInteger(0,"bW ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bW ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bW ",OBJPROP_COLOR,clrBlue);
      ObjectSetInteger(0,"bW ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"bW ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bW ", OBJPROP_YDISTANCE, 80);

    }
     
 }    
       
//---- sell conditions

if((maH1W<trend1W)&&(maH1W < bbh1W))
{

   if(mac81W >mac51W )  
    {
      H=-1;
      ObjectSetString(0,"bW ",OBJPROP_TEXT, "WEEK  =  " +IntegerToString(H,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"bW ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bW ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bW ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"bW ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"bW ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bW ", OBJPROP_YDISTANCE, 80);
     } 
    
    
    if( main1W < signal1W && main1W > 0 &&  signal1W > 0 ) 
    {
      H=-1 + H;
      ObjectSetString(0,"bW ",OBJPROP_TEXT, "WEEK  =  " +IntegerToString(H,0,0));
      // 8, "Ariel", Salmon);
      ObjectSetInteger(0,"bW ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bW ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bW ",OBJPROP_COLOR,clrSalmon);
      ObjectSetInteger(0,"bW ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"bW ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bW ", OBJPROP_YDISTANCE, 80);

      
      }
      
         if( mac1W < mac81W)  
         {
          H=-2+H;
          ObjectSetString(0,"bW ",OBJPROP_TEXT, "WEEK  =  " +IntegerToString(H,0,0));
      // 8, "Ariel", Red);
      ObjectSetInteger(0,"bW ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bW ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bW ",OBJPROP_COLOR,clrRed);
      ObjectSetInteger(0,"bW ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"bW ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bW ", OBJPROP_YDISTANCE, 80);

         }
 }
 
   
//--------------------------------------------------------------------

// MONTH
//---------------------------------------------------------------------------

   //==================
   //the moving averages
   //====================
   Handle=iMA(NULL, PERIOD_MN1, 5, 0, MODE_SMMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac51M = HandleBuffer[0];
   
   Handle=iMA(NULL, PERIOD_MN1, 8, 0, MODE_SMMA, PRICE_OPEN);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac81M = HandleBuffer[0];

   //------------------------
   //PRESSURE
   //==========================
    Handle=iMA(NULL, PERIOD_MN1, 20, 0, MODE_EMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double mac1M = HandleBuffer[0];
  
   
   //=========================
   // MACD
   //==========================
   Handle=iMACD(NULL,PERIOD_MN1,12,26,9,PRICE_CLOSE);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double main1M = HandleBuffer[0];
   CopyBuffer(Handle,1,0,1,HandleBuffer);
   double signal1M = HandleBuffer[0];
       
   //=========================
   // TREND
   //==========================   
   Handle= iMA(NULL, PERIOD_MN1, 12, 0, MODE_SMA, PRICE_CLOSE);
   CopyBuffer(Handle,0,6,1,HandleBuffer);
   double trend1M = HandleBuffer[0];
   
   Handle= iMA(NULL, PERIOD_MN1, 3, 0, MODE_LWMA, PRICE_HIGH);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double maH1M = HandleBuffer[0];
   
   Handle= iMA(NULL, PERIOD_MN1, 3, 0, MODE_LWMA, PRICE_LOW);
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double maL1M = HandleBuffer[0];
   
   //===============================================
   // candle & bands
   //==============================================
   Handle=iBands (NULL,PERIOD_MN1,30,1,0,PRICE_CLOSE);//Bollinger bands 
   CopyBuffer(Handle,0,0,1,HandleBuffer);
   double bbh1M= HandleBuffer[0];
   
   
   
 ObjectCreate(0,"bM ", OBJ_LABEL, 0, 0, 0);

//---- buy conditions
if((maL1M>trend1M)&&(maL1M > bbh1M))
{

   if(mac51M > mac81M) 
     {
      K=1;
      ObjectSetString(0,"bM ",OBJPROP_TEXT, "MONTH =  " +IntegerToString(K,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"bM ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bM ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bM ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"bM ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"bM ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bM ", OBJPROP_YDISTANCE, 90);
      }
     
   
   if( main1M > signal1M && main1M <0 && signal1M < 0) 
     {
      K =1 + K;
      ObjectSetString(0,"bM ",OBJPROP_TEXT, "MONTH =  " +IntegerToString(K,0,0));
      // 8, "Ariel", SkyBlue);
      ObjectSetInteger(0,"bM ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bM ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bM ",OBJPROP_COLOR,clrSkyBlue);
      ObjectSetInteger(0,"bM ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"bM ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bM ", OBJPROP_YDISTANCE, 90);
     
      }
         if( mac1M > mac81M)  
     {
        K=2+K;
      ObjectSetString(0,"bM ",OBJPROP_TEXT, "MONTH =  " +IntegerToString(K,0,0));
      // 8, "Ariel", Blue);
      ObjectSetInteger(0,"bM ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bM ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bM ",OBJPROP_COLOR,clrBlue);
      ObjectSetInteger(0,"bM ", OBJPROP_CORNER, 1);
      ObjectSetInteger(0,"bM ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bM ", OBJPROP_YDISTANCE, 90);

    }
     
 }    
       
//---- sell conditions

if((maH1M<trend1M)&&(maH1W < bbh1M))
{

   if(mac81M >mac51M )  
    {
      K=-1;
      ObjectSetString(0,"bM ",OBJPROP_TEXT, "MONTH =  " +IntegerToString(K,0,0));
      // 8, "Ariel", White);
      ObjectSetInteger(0,"bM ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bM ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bM ",OBJPROP_COLOR,clrWhite);
      ObjectSetInteger(0,"bM ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"bM ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bM ", OBJPROP_YDISTANCE, 90);
     } 
    
    
    if( main1M < signal1M && main1M > 0 && signal1M > 0) 
    {
      K=-1 + K;
      ObjectSetString(0,"bM ",OBJPROP_TEXT, "MONTH =  " +IntegerToString(K,0,0));
      // 8, "Ariel", Salmon);
      ObjectSetInteger(0,"bM ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bM ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bM ",OBJPROP_COLOR,clrSalmon);
      ObjectSetInteger(0,"bM ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"bM ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bM ", OBJPROP_YDISTANCE, 90);

      
      }
      
         if( mac1M < mac81M)  
         {
          K=-2+K;
          ObjectSetString(0,"bM ",OBJPROP_TEXT, "MONTH =  " +IntegerToString(K,0,0));
      // 8, "Ariel", Red);
      ObjectSetInteger(0,"bM ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"bM ",OBJPROP_FONT,"Ariel");
       ObjectSetInteger(0,"bM ",OBJPROP_COLOR,clrRed);
      ObjectSetInteger(0,"bM ", OBJPROP_CORNER, 4);
      ObjectSetInteger(0,"bM ", OBJPROP_XDISTANCE, 10);
      ObjectSetInteger(0,"bM ", OBJPROP_YDISTANCE, 90);

         }
 }
      
 //-------------------------------------------------------------------- 
   
  
 
   

       
   int donel =F+G+H+K;
   
      ObjectCreate(0,"allan2 ", OBJ_LABEL, 0, 0, 0);
       ObjectSetString(0,"allan2 ",OBJPROP_TEXT,"Upper  T-Frames ( 4hr - Mn)=16 "); //, 8, "ArielBlack",Teal);
       ObjectSetInteger(0,"allan2 ",OBJPROP_FONTSIZE,8);
       ObjectSetString(0,"allan2 ",OBJPROP_FONT,"ArielBlack");
       ObjectSetInteger(0,"allan2 ",OBJPROP_COLOR,clrTeal);
       ObjectSetInteger(0,"allan2 ", OBJPROP_CORNER, 2);
       ObjectSetInteger(0,"allan2 ", OBJPROP_XDISTANCE, 5);
       ObjectSetInteger(0,"allan2 ", OBJPROP_YDISTANCE,5);
       
      ObjectCreate(0,"allan ", OBJ_LABEL, 0, 0, 0);
       ObjectSetString(0,"allan ",OBJPROP_TEXT,"" +IntegerToString(donel,0,0));//, 50, "ArielBlack",Yellow);
       ObjectSetInteger(0,"allan ",OBJPROP_FONTSIZE,50);
       ObjectSetString(0,"allan ",OBJPROP_FONT,"ArielBlack");
       ObjectSetInteger(0,"allan ",OBJPROP_COLOR,clrYellow);
       ObjectSetInteger(0,"allan ", OBJPROP_CORNER, 2);
       ObjectSetInteger(0,"allan ", OBJPROP_XDISTANCE, 40);
       ObjectSetInteger(0,"allan ", OBJPROP_YDISTANCE, 40);
       
       
           
       int done11 =A+B+C+D+E+F+G+H+K;
       ObjectCreate(0,"allana ", OBJ_LABEL, 0, 0, 0);
       ObjectSetString(0,"allana ",OBJPROP_TEXT,"" +IntegerToString(done11,0,0));//, 80, "ArielBlack",LightBlue);
       ObjectSetInteger(0,"allana ",OBJPROP_FONTSIZE,80);
       ObjectSetString(0,"allana ",OBJPROP_FONT,"ArielBlack");
       ObjectSetInteger(0,"allana ",OBJPROP_COLOR,clrLightBlue);
       ObjectSetInteger(0,"allana ", OBJPROP_CORNER, 2);
       ObjectSetInteger(0,"allana ", OBJPROP_XDISTANCE, 450);
       ObjectSetInteger(0,"allana ", OBJPROP_YDISTANCE, 40);
       
   
//---- lot size
   //lot=0.0001*AccountEquity();
  // if(lot<0.01)  lot=0.01;
double gap =0,gapp=0,sum=0,range=0,op,cp,gaap, retrace,mean=0,a=0;
int i;
op=iOpen(NULL,PERIOD_D1,0);
cp=iClose(NULL,PERIOD_D1,0);
for(i=1;i<21;i++)
{
  // gap=iHigh(NULL,PERIOD_D1,i)-iLow(NULL,PERIOD_D1,i);
   sum=sum+gap;
   if(iClose(NULL,01,i)<iOpen(NULL,0,i))
   {
      a=iClose(NULL,0,i)-iLow(NULL,0,i);
      gap = iOpen(NULL,0,i) - iLow(NULL,0,i);
   }
   if(iClose(NULL,0,i)>iOpen(NULL,0,i))
   {
      a=iHigh(NULL,0,i)-iClose(NULL,0,i);
      gap = iHigh(NULL,0,i) - iOpen(NULL,0,i);
   }
   mean=mean+a;
}
   retrace=(mean/20)/Point();

range=sum/20;
gapp=range/Point();

gaap=MathRound(gapp);
               NormalizeDouble(gaap,0);
              ObjectCreate(0,"allancac ", OBJ_LABEL, 0, 0, 0);
              ObjectSetString(0,"allancac ",OBJPROP_TEXT,"Mean Range      =  " +DoubleToString(gaap,0)); //, 22, "ArielBlack",Orange);
              ObjectSetInteger(0,"allancac ",OBJPROP_FONTSIZE,22);
              ObjectSetString(0,"allancac ",OBJPROP_FONT,"ArielBlack");
               ObjectSetInteger(0,"allancac ",OBJPROP_COLOR,clrOrange);
              ObjectSetInteger(0,"allancac ", OBJPROP_CORNER, 2);
              ObjectSetInteger(0,"allancac ", OBJPROP_XDISTANCE, 100);
              ObjectSetInteger(0,"allancac ", OBJPROP_YDISTANCE, 240);
              
              NormalizeDouble(retrace,0);
              ObjectCreate(0,"allancaac ", OBJ_LABEL, 0, 0, 0);
              ObjectSetString(0,"allancaac ",OBJPROP_TEXT,"Retracement    =   "+DoubleToString(retrace,0));// , 22, "ArielBlack",SandyBrown);
              ObjectSetInteger(0,"allancaac ",OBJPROP_FONTSIZE,22);
              ObjectSetString(0,"allancaac ",OBJPROP_FONT,"ArielBlack");
               ObjectSetInteger(0,"allancaac ",OBJPROP_COLOR,clrSandyBrown);
              ObjectSetInteger(0,"allancaac ", OBJPROP_CORNER, 2);
              ObjectSetInteger(0,"allancaac ", OBJPROP_XDISTANCE, 100);
              ObjectSetInteger(0,"allancaac ", OBJPROP_YDISTANCE, 180);
              
 
             double mk= (double)SymbolInfoInteger(Symbol(),SYMBOL_SPREAD);
      
               ObjectCreate(0,"allancacDb ", OBJ_LABEL, 0, 0, 0);
              ObjectSetString(0,"allancacDb ",OBJPROP_TEXT,"Spread     =  "+DoubleToString(mk,0)); //, 22, "ArielBlack",Red);
              ObjectSetInteger(0,"allancacDb ",OBJPROP_FONTSIZE,22);
              ObjectSetString(0,"allancacDb ",OBJPROP_FONT,"ArielBlack");
               ObjectSetInteger(0,"allancacDb ",OBJPROP_COLOR,clrRed);
              ObjectSetInteger(0,"allancacDb ", OBJPROP_CORNER, 2);
              ObjectSetInteger(0,"allancacDb ", OBJPROP_XDISTANCE, 100); 
              ObjectSetInteger(0,"allancacDb ", OBJPROP_YDISTANCE, 60);
   
   double mmm=0;
   if(iOpen(Symbol(),PERIOD_D1,0)>iClose(Symbol(),PERIOD_D1,0))
   {
      mmm= iOpen(Symbol(),PERIOD_D1,0) - iLow(Symbol(),PERIOD_D1,0);
   }
   
   if(iOpen(Symbol(),PERIOD_D1,0)<iClose(Symbol(),PERIOD_D1,0))
   {
      mmm= iHigh(Symbol(),PERIOD_D1,0) - iOpen(Symbol(),PERIOD_D1,0);
   }
   
              mmm = mmm/Point();
               ObjectCreate(0,"allancacD ", OBJ_LABEL, 0, 0, 0);
              ObjectSetString(0,"allancacD ",OBJPROP_TEXT,"H/L pip distance     =  "+DoubleToString(mmm,0));//, 22, "ArielBlack",Gold);
              ObjectSetInteger(0,"allancacD ",OBJPROP_FONTSIZE,22);
              ObjectSetString(0,"allancacD ",OBJPROP_FONT,"ArielBlack");
               ObjectSetInteger(0,"allancacD ",OBJPROP_COLOR,clrGold);
              ObjectSetInteger(0,"allancacD ", OBJPROP_CORNER, 2);
              ObjectSetInteger(0,"allancacD ", OBJPROP_XDISTANCE, 100);
              ObjectSetInteger(0,"allancacD ", OBJPROP_YDISTANCE, 300);

   double granged=(iClose(NULL,PERIOD_D1,0)-iOpen(NULL,PERIOD_D1,0))/Point();
   NormalizeDouble(granged,0);
               ObjectCreate(0,"allancacDd ", OBJ_LABEL, 0, 0, 0);
              ObjectSetString(0,"allancacDd ",OBJPROP_TEXT,"Pips Moved    =  "+DoubleToString(granged,0)); //, 22, "ArielBlack",Salmon);
              ObjectSetInteger(0,"allancacDd ",OBJPROP_FONTSIZE,22);
              ObjectSetString(0,"allancacDd ",OBJPROP_FONT,"ArielBlack");
               ObjectSetInteger(0,"allancacDd ",OBJPROP_COLOR,clrSalmon);
              ObjectSetInteger(0,"allancacDd ", OBJPROP_CORNER, 2);
              ObjectSetInteger(0,"allancacDd ", OBJPROP_XDISTANCE, 100);
              ObjectSetInteger(0,"allancacDd ", OBJPROP_YDISTANCE, 120);

       
   
 
               ObjectCreate(0,"allancacDdm ", OBJ_LABEL, 0, 0, 0);
              ObjectSetString(0,"allancacDdm ",OBJPROP_TEXT,"Pips to be Moved    =  "+DoubleToString((0.75*gaap),0)); //, 22, "ArielBlack",Yellow);
              ObjectSetInteger(0,"allancacDdm ",OBJPROP_FONTSIZE,22);
              ObjectSetString(0,"allancacDdm ",OBJPROP_FONT,"ArielBlack");
               ObjectSetInteger(0,"allancacDdm ",OBJPROP_COLOR,clrYellow);
              ObjectSetInteger(0,"allancacDdm ", OBJPROP_CORNER, 2);
              ObjectSetInteger(0,"allancacDdm ", OBJPROP_XDISTANCE, 100);
              ObjectSetInteger(0,"allancacDdm ", OBJPROP_YDISTANCE, 360);


   return(0);
  }