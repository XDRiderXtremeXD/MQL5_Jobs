//+------------------------------------------------------------------+
//|                      Señal Estrategia Estocastico RSI Rebote.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property description "Para que se pueda Leer los soportes y resistencias tiene"
#property description "que estar un archivo con el formato bin con el Nombre del Simbolo "
#property description "actual en la direccion \\Files\\SoportesYResistenciasMarcadas"


////////RESTRICCIONES MAXIMO 20 SIMBOLOS, MAXIMO 60 LINEAS DE SOPORTES Y RESISTENCIAS/////////


//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
string ArraySymbolos[20];
double ArrayResistenciasSoportes[20][60];
int SIZEResSop[20];
input int PipsIntervalo=10;

int Conteo=0; //Numero de Simbolos
input string NombresDeLosSimbolosAnalizar="USDJPY NZDUSD USDCAD"; //Nombres de los Simbolos
// Separar Con un espacio
double iRSIBuffer[3];
double iESTBuffer[3];
double HighAnterior[3];
double LowAnterior[3];
int time;

MqlDateTime TIEMPOACTUAL;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {

   string NombresDeLosSimbolos=NombresDeLosSimbolosAnalizar+" ";
   int PosicionEncontradoAnterior=0;
   int PosicionEncontrado=0;
   while(PosicionEncontrado<StringBufferLen(NombresDeLosSimbolos) && PosicionEncontrado!=-1)
     {
      PosicionEncontrado=StringFind(NombresDeLosSimbolos," ",PosicionEncontrado+1);
      if(PosicionEncontrado!=-1)
        {
         ArraySymbolos[Conteo]=StringSubstr(NombresDeLosSimbolos,PosicionEncontradoAnterior,6);
         PosicionEncontradoAnterior=PosicionEncontrado+1;
         Conteo++;
        }

     }
   bool SymboloPersonalizado;
   for(int i=0; i<Conteo; i++)
     {
      if(!SymbolExist(ArraySymbolos[i],SymboloPersonalizado))
        {
         Print("ERROR SYMBOLO ",ArraySymbolos[i]," NO ENCONTRADO");
         return(INIT_PARAMETERS_INCORRECT);
        }
     }

   NombresDeLosSimbolos="";
   for(int z=0; z<Conteo; z++)
     {
      NombresDeLosSimbolos=NombresDeLosSimbolos+ArraySymbolos[z]+" ";

      string InpFileName=ArraySymbolos[z]+".bin";
      string InpDirectoryName="SoportesYResistenciasMarcadas";

      string path=InpDirectoryName+"//"+InpFileName;
      //--- abrimos archivo
      ResetLastError();

      double arr[];
      int file_handle=FileOpen(path,FILE_READ|FILE_BIN);
      if(file_handle!=INVALID_HANDLE)
        {
         //--- leemos todos los datos desde el archivo al array
         FileReadArray(file_handle,arr,0,60);
         //--- obtenemos el tamaño del array
         int size=ArraySize(arr);
         //--- imprimimos los datos desde el array
         for(int jk=0; jk<size; jk++)
           {
            ArrayResistenciasSoportes[z][jk]=arr[jk];
            Print(ArraySymbolos[z]+"[",jk,"]=",arr[jk]);
           }
         SIZEResSop[z]=size;
         Print("Total data = ",size);



         //--- cerramos el archivo
         FileClose(file_handle);
        }
      else
        {
         Print("No hay archivo de "+InpFileName);
         Print("File open failed, error ",GetLastError());
         return(INIT_PARAMETERS_INCORRECT);
        }
     }

   Print("Bot analizando para los simbolos: "+NombresDeLosSimbolos);
   Print("-----------------------------******************-----------------");


   for(int zk=0; zk<Conteo; zk++)
     {
      for(int jk=0; jk<SIZEResSop[zk]; jk++)
        {
         Print(ArraySymbolos[zk]+"[",jk,"]=",ArrayResistenciasSoportes[zk][jk]);
        }
      Print("Total data = ",SIZEResSop[zk]);
     }

   TimeToStruct(TimeCurrent(),TIEMPOACTUAL);
   time=TIEMPOACTUAL.hour;
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnTick()
  {


   string Comentario=" ";
   static int timeanterior=-1;

   TimeToStruct(TimeCurrent(),TIEMPOACTUAL);
   time=TIEMPOACTUAL.hour;

   if(time!=timeanterior)
     {
      for(int i=0; i<Conteo; i++)
        {
         int    digits=(int)SymbolInfoInteger(ArraySymbolos[i],SYMBOL_DIGITS); // número de dígitos tras la coma
         double points=SymbolInfoDouble(ArraySymbolos[i],SYMBOL_POINT); // número de dígitos tras la coma

         CopiarRSI(ArraySymbolos[i],digits);
         CopiarEST(ArraySymbolos[i],digits);
         CopiarLowHighAnteriores(ArraySymbolos[i]);


         for(int ik=0; ik<SIZEResSop[i]; ik++)
           {
            if(ArrayResistenciasSoportes[i][ik]<HighAnterior[1]+PipsIntervalo*points*10 &&
               ArrayResistenciasSoportes[i][ik]>LowAnterior[1]-PipsIntervalo*points*10)
              {

               //+------------------------------------------------------------------+
               //|                                 RSI                              |
               //+------------------------------------------------------------------+

               if(iRSIBuffer[2]>=70 && iRSIBuffer[1]<70)
                 {
                  Comentario=Comentario+" (RSI Sell "+ArraySymbolos[i]+ " L:"+DoubleToString(ArrayResistenciasSoportes[i][ik])+")";
                 }
               else
                  if(iRSIBuffer[2]<=30 && iRSIBuffer[1]>30)
                    {
                     Comentario=Comentario+" (RSI Buy "+ArraySymbolos[i]+" L:"+DoubleToString(ArrayResistenciasSoportes[i][ik])+")";

                    }
               //+------------------------------------------------------------------+
               //|                                 EST                              |
               //+------------------------------------------------------------------+
               if(iESTBuffer[2]>=80 && iESTBuffer[1]<80)
                 {
                  Comentario=Comentario+" (EST Sell "+ArraySymbolos[i]+" L:"+DoubleToString(ArrayResistenciasSoportes[i][ik])+")";

                 }
               else
                  if(iESTBuffer[2]<=20 && iESTBuffer[1]>20)
                    {
                     Comentario=Comentario+" (EST Buy "+ArraySymbolos[i]+" L:"+DoubleToString(ArrayResistenciasSoportes[i][ik])+")";

                    }
               //+------------------------------------------------------------------+
               //|                                                             |
               //+------------------------------------------------------------------+
              }
           }

        }
      timeanterior=time;
      bool Notificacion;
      
      if(Comentario!=" "){
      if (254<StringLen(Comentario)){
        Notificacion=SendNotification(StringSubstr(Comentario,0,254));
        Notificacion=SendNotification(StringSubstr(Comentario,255,StringLen(Comentario)-254));
      }
      else
      Notificacion=SendNotification(Comentario);}
      
      Print("******"+Comentario);
     }
     
  }


//// VOID VOID VOID VOID // FUNTIONS FUNTIONS////////////////////////////
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopiarRSI(string name,int digitos)
  {
   int handle=iRSI(name,PERIOD_H1,14,PRICE_CLOSE);
   while(CopyBuffer(handle,0,0,3,iRSIBuffer)<0)
     {
      Sleep(5);
     };
   ArrayReverse(iRSIBuffer,0,3);/*
   iRSIBuffer[0]=NormalizeDouble(iRSIBuffer[0],digitos);
   iRSIBuffer[1]=NormalizeDouble(iRSIBuffer[1],digitos);
   iRSIBuffer[2]=NormalizeDouble(iRSIBuffer[2],digitos);*/
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopiarEST(string name,int digitos)
  {
   int handle=iStochastic(name,PERIOD_H1,5,3,3,MODE_SMA,STO_LOWHIGH);
   while(CopyBuffer(handle,0,0,3,iESTBuffer)<0)
     {
      Sleep(5);
     };
   ArrayReverse(iESTBuffer,0,3);/*
   iESTBuffer[0]=NormalizeDouble(iESTBuffer[0],digitos);
   iESTBuffer[1]=NormalizeDouble(iESTBuffer[1],digitos);
   iESTBuffer[2]=NormalizeDouble(iESTBuffer[2],digitos);*/
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CopiarLowHighAnteriores(string name)
  {
   for(int i=0; i<3; i++)
     {
      HighAnterior[i]=iHigh(name,PERIOD_H1,i);
      LowAnterior[i]=iLow(name,PERIOD_H1,i);
     }
  }
//+------------------------------------------------------------------+
