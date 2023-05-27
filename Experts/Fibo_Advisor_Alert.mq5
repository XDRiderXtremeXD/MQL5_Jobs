//+------------------------------------------------------------------+
//|                                           Fibo_Advisor_Alert.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

//input 
int ALLFIBOS=true;

string NameSpecifiedFibo="";
double Price[2];

double NivelFibonacciAlerta;
double PorcentajesFibonacci[2];

int Direccion=0;

bool INDICADOR_HABILITADO=true;

datetime allowed_until = D'2020.10.09 00:00';


input bool alert_in_predefined_percentage=true;
double PorcentajesPredefinidosFibo[8] = {0.236, 0.382, 0.50, 0.618, 0.1, 1.618, 2.618 , 4.236};
enum ENUM_PORCENTS_PREDEFINED
{
   FIBO_23_6=0,
   FIBO_38_2=1,
   FIBO_50_0=2,
   FIBO_61_8=3,
   FIBO_100_0=4,
   FIBO_168=5,
   FIBO_261_8=6,
   FIBO_423_6=7,
};

enum ENUM_PRICE_MARKET
{
   BID=0,
   ASK=1,
};

input ENUM_PRICE_MARKET CHOOSE_PRICE_TYPE=1;
 
input ENUM_PORCENTS_PREDEFINED CHOOSE_PORCENT =0;

input string Separate1="--------------------------------------";
input string Separate2="if alert in predefined percentage false so choose Porcent Personalized";
input double CHOOSE_PORCENT_PERSONALIZED =200;
 

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
     {  
       if(CHOOSE_PORCENT_PERSONALIZED<0){
       return(INIT_PARAMETERS_INCORRECT); 
       }
     
       double Porcentaje;
       
       if(alert_in_predefined_percentage==true){
       Porcentaje= PorcentajesPredefinidosFibo[CHOOSE_PORCENT];
       }
       else
       Porcentaje=CHOOSE_PORCENT_PERSONALIZED/100;
     
       for(int k=ObjectsTotal(0,0,OBJ_FIBO)-1;k>-1;k--){
         string NameFIBO=ObjectName(0,k,0,OBJ_FIBO);
         if(ALLFIBOS==false){
         if(NameSpecifiedFibo==NameFIBO ){
          }
         }
         else{
          for(int i=0;i<2;i++){
          Print(ObjectGetDouble(0,NameFIBO,OBJPROP_PRICE,i));
          Price[i]=ObjectGetDouble(0,NameFIBO,OBJPROP_PRICE,i);
          }
         }
      } 
      
      
      double resta=Price[0]-Price[1];
      
      Print( "PRICE ALERT IN :",Price[1]+Porcentaje * resta );
      NivelFibonacciAlerta=Price[1]+ Porcentaje * resta;
      
      if(resta<0){
      Direccion=0;
      }
      else
      Direccion=1;
      
//--- create timer
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   
//--- destroy timer
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

   if(TimeCurrent()>allowed_until){
   INDICADOR_HABILITADO=false;
   }   

   if(INDICADOR_HABILITADO==true){ 
    static bool Alerta=false;
   
   if(Alerta==false){
   Alerta=true;
   if(CHOOSE_PRICE_TYPE==0){
    if(SymbolInfoDouble(Symbol(),SYMBOL_BID)<NivelFibonacciAlerta && Direccion==0){
    Alert("Alert in ",Symbol()," in price= ",NivelFibonacciAlerta);
    }
    else if(SymbolInfoDouble(Symbol(),SYMBOL_BID)>NivelFibonacciAlerta && Direccion==1){                            
    Alert("Alert in ",Symbol()," in price= ",NivelFibonacciAlerta);
    }
   }
   else{
    if(SymbolInfoDouble(Symbol(),SYMBOL_ASK)<NivelFibonacciAlerta && Direccion==0){
    Alert("Alert in ",Symbol()," in price= ",NivelFibonacciAlerta);
    }
    else if(SymbolInfoDouble(Symbol(),SYMBOL_ASK)<NivelFibonacciAlerta && Direccion==1){                            
    Alert("Alert in ",Symbol()," in price= ",NivelFibonacciAlerta);
    }
   }
   
  }
  }
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+