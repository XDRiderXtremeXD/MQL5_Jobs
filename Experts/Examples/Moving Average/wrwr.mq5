
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#include <Trade\Trade.mqh>

uint Periods[8];
double Medias[8];

input ENUM_TIMEFRAMES TimeFrames=PERIOD_H1;

input bool ModStopLossAllPositionsForex=false;
//Si es false... solo se moficara el Par actual donde se pone el robot, si es true, se modificara todas las
// Posiciones que estan abiertas indistintamente donde se ha puesto el robot
extern int NumeroDeMedias=4; 
input uint Periods1=3;
input uint Periods2=4;
input uint Periods3=5;
input uint Periods4=8;
input uint Periods5=34;
input uint Periods6=55;
input uint Periods7=89;
input uint Periods8=144;
input uint Desplazamiento=2;
input bool DesacteMedInferAguantarPos=false;

//Si se pone False siempre se Movera al mas Proximo de la Media que este mas serca cumpliendo las condiciones 
//Si se pone True se desactivara el stop loss lo tomara al mas lejano para aguantar posicion....
extern double CompValGananEnPips=10;
// Continuacion de Arrib... si se pone true.. Se evaluara dependiendo de la Variable CompValGananEnPips
long Ticket;
double HIGH,LOW;
int Tiempo,TiempoDivisible,TiempoAnterior;
int Segundos;
datetime TimesDate[];

/////////////////////////////
/*
datetime daytimes[];
double   double_array[][6];
*/
////////////////////////////

int OnInit()
  {
   if(NumeroDeMedias>8){
   NumeroDeMedias=8;}
   if(NumeroDeMedias<1){
   Print("El numero de Medias tiene que ser mayor a 0");
   return(INIT_PARAMETERS_INCORRECT);
   }
  
   Periods[0]=Periods1;
   Periods[1]=Periods2;
   Periods[2]=Periods3;
   Periods[3]=Periods4;
   Periods[4]=Periods5;
   Periods[5]=Periods6;
   Periods[6]=Periods7;
   Periods[7]=Periods8;
   
   CompValGananEnPips=CompValGananEnPips*10;
  
   if(NumeroDeMedias>1){
      for(int i=1;i<NumeroDeMedias;i++){
         if(Periods[i]<Periods[i-1]){
         Print("ERROR EN PARAMETROS: Los Peridos tienen que ser en orden ascendente Periods1<Periods2<Periods3........");
         return(INIT_PARAMETERS_INCORRECT); 
         }
      }
   }
   if(NumeroDeMedias<1){
   return(INIT_PARAMETERS_INCORRECT); 
   }   
   ///// PROBADOR DE NOTIFICACIONES CON EXITO 
   bool Notificacion=SendNotification("Programa Iniciado");
   
   //int Opensel=OrderSend(NULL,OP_BUY,0.4,Ask,0,0,0,NULL,12,0,0); 
   TiempoAnterior=-1;
   return(INIT_SUCCEEDED);
  }

void OnTick()
  { 
   //Comment(iCustom(NULL,NULL,"MEDIADESPLAZADADIFERENCIA",10,6,0,2));
    MqlDateTime TiempoActual;
    TimeToStruct(TimeCurrent(),TiempoActual);
      
   if(PeriodSeconds(TimeFrames)<PeriodSeconds(PERIOD_H1)){
   Tiempo=TiempoActual.min;
   TiempoDivisible=PeriodSeconds(TimeFrames);}
   else if(PeriodSeconds(TimeFrames)<PeriodSeconds(PERIOD_D1)){
   Tiempo=TiempoActual.hour;
   TiempoDivisible=PeriodSeconds(TimeFrames)/PeriodSeconds(PERIOD_H1);}
   else if(PeriodSeconds(TimeFrames)<PeriodSeconds(PERIOD_W1)){
   Tiempo=TiempoActual.day;
   TiempoDivisible=PeriodSeconds(TimeFrames)/PeriodSeconds(PERIOD_D1);}
   
   Segundos=TiempoActual.sec;
   
   if(TiempoAnterior!=Tiempo && Tiempo%TiempoDivisible==0 && 10<Segundos && Segundos<50){
   Print("-----------------------------------------------------------------------");
   Print("Entro al bucle");
   for(int i=0; i<OrdersTotal(); i++)
     {
      if(OrderSelect(i)==true)  // If the next is available
        {
         if(ModStopLossAllPositionsForex==false){
         if (OrderGetString(ORDER_SYMBOL)!= Symbol()) continue;}
         long Tip=OrderGetInteger(ORDER_TYPE);                   // Order type ORDER_TYPE
         Ticket=OrderGetInteger(ORDER_TICKET);
         
         if(Tip==ORDER_TYPE_BUY || Tip==ORDER_TYPE_SELL){
            
            //CopySeries(TimesDate,MODE_TIME,OrderSymbol(),TimeFrames);
           
            HIGH=iHigh(OrderGetString(ORDER_SYMBOL),TimeFrames,1);
            Print("HIGH es igual a= ",HIGH);
            LOW=iLow(OrderGetString(ORDER_SYMBOL),TimeFrames,1);
            Print("LOW es igual a= ",LOW);
            double Proximo,Lejano;
            double Ganancias;
            double StopLossMove;
            double Punto=SymbolInfoDouble(OrderGetString(ORDER_SYMBOL), SYMBOL_POINT);
            int Digitos=SymbolInfoInteger(OrderGetString(ORDER_SYMBOL), SYMBOL_DIGITS);
            for(int j=0;j<NumeroDeMedias;j++){
            //----//Medias[j]=NormalizeDouble(iMA(OrderGetString(ORDER_SYMBOL),TimeFrames,Periods[j],0,MODE_SMA,PRICE_CLOSE,1),Digitos);
            }
            
         
            if(Tip==ORDER_TYPE_BUY)
           {  ////SI LA VELA ANTERIOR SU MINIMO ES MAYOR A LA MEDIA MOVIL
              //Y TAMBIEN SI ORDER STOPLOSS ES MENOR QUE ABAJO(MEDIA DESPLAZADA)
            Print("Se detecto Orden Tipo BUY en el par ",OrderGetString(ORDER_SYMBOL));
            double BID=SymbolInfoDouble(OrderGetString(ORDER_SYMBOL), SYMBOL_BID);
            Ganancias=(BID - OrderGetDouble(ORDER_PRICE_OPEN)*(10^Digitos));
            
            EVALUAMEDIAS(Tip,Proximo,Lejano);
            
            if(Proximo!=NULL && Lejano!=NULL){
            Proximo=Proximo-Desplazamiento*Punto*10; 
            Lejano=Lejano-Desplazamiento*Punto*10;
            Print("Precio Proximo para el cambio de StopLoss= ",Proximo);}
            else{Print("Precio No se Modifica porque Lejano y Proximo = NULL");}  
            
            StopLossMove=Proximo;
            
            if(DesacteMedInferAguantarPos==true){
            if(Ganancias<CompValGananEnPips){
            StopLossMove=Lejano;
            Print("Precio Lejano para el cambio de StopLoss= ",Lejano);}
            }
            
            if(StopLossMove!=NULL &&  OrderGetDouble(ORDER_SL)<StopLossMove)
            if(!OrderModify(OrderGetInteger(ORDER_TICKET), OrderGetDouble(ORDER_PRICE_OPEN), StopLossMove, OrderTakeProfit(), OrderExpiration(), clrNONE)){
            Print("Error setting Buy trailing stop: ", GetLastError());}
            else{Print("Se cambio el StopLoss a =",StopLossMove);}
            MqlTradeRequest
           }
           
           
            if(Tip==ORDER_TYPE_SELL) 
            {////SI LA VELA ANTERIOR SU MAXIMO ES MENOR A LA MEDIA MOVIL
              //Y TAMBIEN SI ORDER STOPLOSS ES MAYOR QUE ARRIBA(MEDIA DESPLAZADA)
            Print("Se detecto Orden Tipo SELL en el par ",OrderSymbol());
            double ASK=MarketInfo(OrderSymbol(),MODE_ASK);
            Ganancias=(OrderOpenPrice()-ASK)*(10^Digitos);
            
            EVALUAMEDIAS(Tip,Proximo,Lejano);
            
            if(Proximo!=NULL && Lejano!=NULL){
            Proximo=Proximo+Desplazamiento*Punto*10; 
            Lejano=Lejano+Desplazamiento*Punto*10;
            Print("Precio Proximo para el cambio de StopLoss= ",Proximo);}
            else{Print("Precio No se Modifica porque Lejano y Proximo = NULL");} 
            
            StopLossMove=Proximo;
            
            if(DesacteMedInferAguantarPos==true){
            if(Ganancias<CompValGananEnPips){
            StopLossMove=Lejano;
            Print("Precio Lejano para el cambio de StopLoss= ",Lejano);}
            }
            
            double OrderStopLOSS=OrderStopLoss();
            
            if(OrderStopLoss()==0.0){
            OrderStopLOSS=1000000000000;}
            if(StopLossMove!=NULL && OrderStopLOSS>StopLossMove)
            if(!OrderModify(OrderTicket(), OrderOpenPrice(), StopLossMove, OrderTakeProfit(), OrderExpiration(), clrNONE)){
            Print("Error setting Buy trailing stop: ", GetLastError());}
            else{Print("Se cambio el StopLoss a =",StopLossMove);}
            }
         }
         
         
        }
    }
   
   TiempoAnterior=Tiempo;
  }
  
}
     
void EVALUAMEDIAS(int MODE,double &PROXIMO,double &LEJANO){

   LEJANO=NULL;
   PROXIMO=NULL;
   bool Comparacion=False;
   if(MODE==OP_BUY){ 
      for(int j=0;j<NumeroDeMedias;j++){
         if(Medias[j]<LOW){
            if(Comparacion==False){
               PROXIMO=Medias[j];
               LEJANO=Medias[j];
               Comparacion=True;
            }  
            else{
               if(Medias[j]>PROXIMO){
               PROXIMO=Medias[j];
               }
               if(Medias[j]<LEJANO){
               LEJANO=Medias[j];
               }
            }   
         }
      } 
   }
   
   if(MODE==OP_SELL){ 
      for(int j=0;j<NumeroDeMedias;j++){
         if(Medias[j]>HIGH){
            if(Comparacion==false){
               LEJANO=Medias[j];
               PROXIMO=Medias[j];
               Comparacion=true;
            }  
            else{
               if(Medias[j]>LEJANO){
               LEJANO=Medias[j];
               }
               if(Medias[j]<PROXIMO){
               PROXIMO=Medias[j];
               }
            }   
         }
      }  
   }
}

void OnDeinit(const int reason){
bool Notificacion=SendNotification("Programa Cerrado");
}


/*
void CopySeries(datetime &array[],int MODE,string SYMBOL,int PERIOD)
  {
   ArrayCopySeries(array,MODE,SYMBOL,PERIOD);
   int lasterror=GetLastError();
   if(lasterror==4066) // ERR_HISTORY_WILL_UPDATED
     {
      int attempt=0;
      while(lasterror==4066 && attempt<10)
        {
         Sleep(5000);
         ArrayCopySeries(array,MODE,SYMBOL,PERIOD);
         lasterror=GetLastError();
        }
     }
  }*/