//+------------------------------------------------------------------+
//|                                                Prueba frases.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

datetime TiempoMaximo;
bool Reproduccion=false;
bool SonidoListo=false;
string sonido;

string Cadenas[5]= {"EURUSD.wav","USDJPY.wav","USDCAD.wav","USDCHF.wav","SWITCH"};
string CadenasAlternas[5]= {" "," "," "," "," "};
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   CadenasAlternas[0]=Cadenas[3];
   CadenasAlternas[1]=Cadenas[1];
   CadenasAlternas[2]=Cadenas[0];
   CadenasAlternas[3]=Cadenas[2];
   CadenasAlternas[4]=Cadenas[4];
//---
   TiempoMaximo=TimeCurrent()+PeriodSeconds(PERIOD_H1);

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---




  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {

   static int a=0;
   static int i=0;
   
   PlaySound(Cadenas[i]);
   i++;
   if(i>4){
   i=0;}
   /*if(a==0)
     {
      if(Reproduccion==false)
        {
         sonido=CadenasAlternas[i];
         if(sonido!="SWITCH")
           {
            PlaySound(sonido);
            Reproduccion=true;
            TiempoMaximo=TimeCurrent()+(2);
           }
         else
           {
            a=1;
           }
        }
      if(TiempoMaximo<TimeCurrent())
        {
         Reproduccion=false;
         i++;
        }

     }*/
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
