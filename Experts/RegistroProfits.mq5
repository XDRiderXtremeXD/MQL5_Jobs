//+------------------------------------------------------------------+
//|                                              RegistroProfits.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

enum tipoCuenta
  {
   GLOBAL=0,//Todas las operaciones
   FILTROS=1,//Filtros por Magic Number
  };
enum tipoRegistro
  {
   TICK=0,//TICK
   MINUTE=1,//MINUTO
  };

input tipoRegistro RegistroPor=TICK;
input tipoCuenta Conteo=FILTROS;
input string Carpeta="Data_Register_Profit";
input string Nota="magicNumber=(-1) Nose cuenta | magicNumber=(0) Operaciones Manuales";//===== NOTA =>
input int MagicNumber1=222222;//MgNumber
input int MagicNumber2=-1;//MgNumber
input int MagicNumber3=-1;//MgNumber
input int MagicNumber4=-1;//MgNumber
input int MagicNumber5=-1;//MgNumber
input int MagicNumber6=-1;//MgNumber
input int MagicNumber7=-1;//MgNumber
input int MagicNumber8=-1;//MgNumber
input int MagicNumber9=-1;//MgNumber
input int MagicNumber10=-1;//MgNumber

bool Inicio;
double lastProfit=0;
int filtrosMagicNumber[];
int horaLast;
int minLast;

struct datos_mn
  {
   int               magicNumber;
   double            profit;
  };

struct datos
  {
   datetime          fecha;
   datos_mn          datosMN[];
   double            profitTotal;
  };

datos_mn datosMagicNumber[];
datos data[];

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   Inicio=true;
   horaLast=0;
   minLast=0;
   if(Conteo==FILTROS)
     {
      if(!SetearFiltros())
         return INIT_FAILED;
      ArrayResize(datosMagicNumber,ArraySize(filtrosMagicNumber));
      for(int i=0; i<ArraySize(filtrosMagicNumber); i++)
         datosMagicNumber[i].magicNumber=filtrosMagicNumber[i];
     }
   else
     {
      ArrayResize(datosMagicNumber,1);
      datosMagicNumber[0].magicNumber=-1;
     }


   EventSetMillisecondTimer(1);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   MqlDateTime structTime;
   TimeToStruct(TimeLocal(),structTime);
   structTime.hour=0;
   structTime.min=0;
   structTime.sec=0;
   datetime tiempoDia=StructToTime(structTime);

   if(RegistrarDatos(tiempoDia))
      ArrayResize(data,0);
   EventKillTimer();
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {

   MqlDateTime structTime;
   TimeToStruct(TimeLocal(),structTime);

   double profitActual=NormalizeDouble(ProfitActual(),2);

   if(Inicio)
     {
      lastProfit=profitActual;
      horaLast=structTime.hour;
      minLast=structTime.min;
     }
   else
     {
      if(RegistroPor==TICK || minLast!=structTime.min)
        {
         if(profitActual!=lastProfit)
           {
            PushData(profitActual,TimeCurrent());
            lastProfit=profitActual;
           }
         minLast=structTime.min;
        }
     }

   if(ArraySize(data)>=5000 || structTime.hour!=horaLast)
     {
      int horaActual=structTime.hour;
      structTime.hour=0;
      structTime.min=0;
      structTime.sec=0;
      datetime tiempoDia=StructToTime(structTime)-((horaActual!=horaLast && horaActual==0)?PeriodSeconds(PERIOD_D1):0);

      if(RegistrarDatos(tiempoDia))
         ArrayResize(data,0);

      horaLast=horaActual;
     }

   Inicio=false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double ProfitActual()
  {
   for(int i=0; i<ArraySize(datosMagicNumber); i++)
      datosMagicNumber[i].profit=0;

   double profit=0;
   for(int cnt=0; cnt<PositionsTotal(); cnt++) // SE EVALUA TODAS LAS ORDENES ABIERTAS
     {
      ulong ticket=PositionGetTicket(cnt);

      if(ticket==0)
         continue;

      int index=0;
      if(Conteo==GLOBAL || VerificarFiltroMagic((int)PositionGetInteger(POSITION_MAGIC),index))  // Si la Orden no fue iniciada por el experto y tampoco es del Instrumento
         //donde esta el experto.. entonces no lo evalua
        {
         double profitCalculado=(PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP)/*+OrderCommission()*/);
         profit+=profitCalculado;
         datosMagicNumber[index].profit+=profitCalculado;
        }
     }
   return profit;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarFiltroMagic(int MagicNumber,int &indice)
  {
   for(int i=0; i<ArraySize(filtrosMagicNumber); i++)
      if(MagicNumber==filtrosMagicNumber[i])
        {
         indice=i;
         return true;
        }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PushData(double profitTotal,datetime tiempo)
  {
   int size=ArraySize(data);
   ArrayResize(data,size+1);
   data[size].fecha=tiempo;
   data[size].profitTotal=profitTotal;
   ArrayResize(data[size].datosMN,ArraySize(datosMagicNumber));
   for(int i=0; i<ArraySize(datosMagicNumber); i++)
     {
      data[size].datosMN[i].magicNumber=datosMagicNumber[i].magicNumber;
      data[size].datosMN[i].profit=NormalizeDouble(datosMagicNumber[i].profit,2);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RegistrarDatos(datetime dia)
  {
   int size=ArraySize(data);
   ResetLastError();
   string InpFileName=TimeToString(dia,TIME_DATE)+".txt";
   string path=Carpeta+"//"+InpFileName;
   bool titulo=!FileIsExist(path);

   int file_handle=FileOpen(Carpeta+"//"+InpFileName,FILE_READ|FILE_WRITE|FILE_TXT);

   if(file_handle!=INVALID_HANDLE)
     {
      FileSeek(file_handle,0,SEEK_END);
      PrintFormat("%s file is available for writing",InpFileName);
      PrintFormat("File path: %s\\Files\\",TerminalInfoString(TERMINAL_DATA_PATH));
      //--- write the time and values of signals to the file
      if(titulo)
         RegistrarProfitsMagics(file_handle,true,0);

      for(int i=0; i<size; i++)
        {
         RegistrarProfitsMagics(file_handle,false,i);
        }
      //--- close the file
      FileClose(file_handle);
      PrintFormat("Data is written, %s file is closed",InpFileName);
      return true;
     }
   else
      PrintFormat("Failed to open %s file, Error code = %d",InpFileName,GetLastError());

   return false;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetearFiltros()
  {
   ArrayResize(filtrosMagicNumber,0);
   if(MagicNumber1!=-1)
      PushFiltro(MagicNumber1);
   if(MagicNumber2!=-1)
      PushFiltro(MagicNumber2);
   if(MagicNumber3!=-1)
      PushFiltro(MagicNumber3);
   if(MagicNumber4!=-1)
      PushFiltro(MagicNumber4);
   if(MagicNumber5!=-1)
      PushFiltro(MagicNumber5);
   if(MagicNumber6!=-1)
      PushFiltro(MagicNumber6);
   if(MagicNumber7!=-1)
      PushFiltro(MagicNumber7);
   if(MagicNumber8!=-1)
      PushFiltro(MagicNumber8);
   if(MagicNumber9!=-1)
      PushFiltro(MagicNumber9);
   if(MagicNumber10!=-1)
      PushFiltro(MagicNumber10);

   if(ArraySize(filtrosMagicNumber)<=0)
     {
      Alert("Debe por lo menos poner un magicNumber valido o cambiar conteo a TODAS LAS OPERACIONES");
      return false;
     }
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void PushFiltro(int magicNumber)
  {
   int size=ArraySize(filtrosMagicNumber);
   ArrayResize(filtrosMagicNumber,size+1);
   filtrosMagicNumber[size]=magicNumber;
  }
//+------------------------------------------------------------------+
void RegistrarProfitsMagics(int &file_handle,bool titulo,int i)
  {
   int size=ArraySize(datosMagicNumber);

   if(size==1)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha Profit_Total "+IntegerToString(datosMagicNumber[0].magicNumber));
      else
         FileWrite(file_handle,TimeToString(data[i].fecha,TIME_DATE|TIME_MINUTES|TIME_SECONDS)+" "+DoubleToString(data[i].profitTotal,2)+" "+DoubleToString(data[i].datosMN[0].profit,2));
     }
   if(size==2)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha Profit_Total "+IntegerToString(datosMagicNumber[0].magicNumber)+" "+IntegerToString(datosMagicNumber[1].magicNumber));
      else
         FileWrite(file_handle,TimeToString(data[i].fecha,TIME_DATE|TIME_MINUTES|TIME_SECONDS)+" "+DoubleToString(data[i].profitTotal,2)+" "+DoubleToString(data[i].datosMN[0].profit,2)+" "+DoubleToString(data[i].datosMN[1].profit,2));
     }
   if(size==3)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha Profit_Total "+IntegerToString(datosMagicNumber[0].magicNumber)+" "+IntegerToString(datosMagicNumber[1].magicNumber)+" "+IntegerToString(datosMagicNumber[2].magicNumber));
      else
         FileWrite(file_handle,TimeToString(data[i].fecha,TIME_DATE|TIME_MINUTES|TIME_SECONDS)+" "+DoubleToString(data[i].profitTotal,2)+" "+DoubleToString(data[i].datosMN[0].profit,2)+" "+DoubleToString(data[i].datosMN[1].profit,2)+" "+DoubleToString(data[i].datosMN[2].profit,2));
     }
   if(size==4)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha Profit_Total "+IntegerToString(datosMagicNumber[0].magicNumber)+" "+IntegerToString(datosMagicNumber[1].magicNumber)+" "+IntegerToString(datosMagicNumber[2].magicNumber)+" "+IntegerToString(datosMagicNumber[3].magicNumber));
      else
         FileWrite(file_handle,TimeToString(data[i].fecha,TIME_DATE|TIME_MINUTES|TIME_SECONDS)+" "+DoubleToString(data[i].profitTotal,2)+" "+DoubleToString(data[i].datosMN[0].profit,2)+" "+DoubleToString(data[i].datosMN[1].profit,2)+" "+DoubleToString(data[i].datosMN[2].profit,2)+" "+DoubleToString(data[i].datosMN[3].profit,2));
     }
   if(size==5)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha Profit_Total "+IntegerToString(datosMagicNumber[0].magicNumber)+" "+IntegerToString(datosMagicNumber[1].magicNumber)+" "+IntegerToString(datosMagicNumber[2].magicNumber)+" "+IntegerToString(datosMagicNumber[3].magicNumber)+" "+IntegerToString(datosMagicNumber[4].magicNumber));
      else
         FileWrite(file_handle,TimeToString(data[i].fecha,TIME_DATE|TIME_MINUTES|TIME_SECONDS)+" "+DoubleToString(data[i].profitTotal,2)+" "+DoubleToString(data[i].datosMN[0].profit,2)+" "+DoubleToString(data[i].datosMN[1].profit,2)+" "+DoubleToString(data[i].datosMN[2].profit,2)+" "+DoubleToString(data[i].datosMN[3].profit,2)+" "+DoubleToString(data[i].datosMN[4].profit,2));
     }
   if(size==6)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha Profit_Total "+IntegerToString(datosMagicNumber[0].magicNumber)+" "+IntegerToString(datosMagicNumber[1].magicNumber)+" "+IntegerToString(datosMagicNumber[2].magicNumber)+" "+IntegerToString(datosMagicNumber[3].magicNumber)+" "+IntegerToString(datosMagicNumber[4].magicNumber)+" "+IntegerToString(datosMagicNumber[5].magicNumber));
      else
         FileWrite(file_handle,TimeToString(data[i].fecha,TIME_DATE|TIME_MINUTES|TIME_SECONDS)+" "+DoubleToString(data[i].profitTotal,2)+" "+DoubleToString(data[i].datosMN[0].profit,2)+" "+DoubleToString(data[i].datosMN[1].profit,2)+" "+DoubleToString(data[i].datosMN[2].profit,2)+" "+DoubleToString(data[i].datosMN[3].profit,2)+" "+DoubleToString(data[i].datosMN[4].profit,2)+" "+DoubleToString(data[i].datosMN[5].profit,2));
     }
   if(size==7)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha Profit_Total "+IntegerToString(datosMagicNumber[0].magicNumber)+" "+IntegerToString(datosMagicNumber[1].magicNumber)+" "+IntegerToString(datosMagicNumber[2].magicNumber)+" "+IntegerToString(datosMagicNumber[3].magicNumber)+" "+IntegerToString(datosMagicNumber[4].magicNumber)+" "+IntegerToString(datosMagicNumber[5].magicNumber)+" "+IntegerToString(datosMagicNumber[6].magicNumber));
      else
         FileWrite(file_handle,TimeToString(data[i].fecha,TIME_DATE|TIME_MINUTES|TIME_SECONDS)+" "+DoubleToString(data[i].profitTotal,2)+" "+DoubleToString(data[i].datosMN[0].profit,2)+" "+DoubleToString(data[i].datosMN[1].profit,2)+" "+DoubleToString(data[i].datosMN[2].profit,2)+" "+DoubleToString(data[i].datosMN[3].profit,2)+" "+DoubleToString(data[i].datosMN[4].profit,2)+" "+DoubleToString(data[i].datosMN[5].profit,2)+" "+DoubleToString(data[i].datosMN[6].profit,2));
     }
   if(size==8)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha Profit_Total "+IntegerToString(datosMagicNumber[0].magicNumber)+" "+IntegerToString(datosMagicNumber[1].magicNumber)+" "+IntegerToString(datosMagicNumber[2].magicNumber)+" "+IntegerToString(datosMagicNumber[3].magicNumber)+" "+IntegerToString(datosMagicNumber[4].magicNumber)+" "+IntegerToString(datosMagicNumber[5].magicNumber)+" "+IntegerToString(datosMagicNumber[6].magicNumber)+" "+IntegerToString(datosMagicNumber[7].magicNumber));
      else
         FileWrite(file_handle,TimeToString(data[i].fecha,TIME_DATE|TIME_MINUTES|TIME_SECONDS)+" "+DoubleToString(data[i].profitTotal,2)+" "+DoubleToString(data[i].datosMN[0].profit,2)+" "+DoubleToString(data[i].datosMN[1].profit,2)+" "+DoubleToString(data[i].datosMN[2].profit,2)+" "+DoubleToString(data[i].datosMN[3].profit,2)+" "+DoubleToString(data[i].datosMN[4].profit,2)+" "+DoubleToString(data[i].datosMN[5].profit,2)+" "+DoubleToString(data[i].datosMN[6].profit,2)+" "+DoubleToString(data[i].datosMN[7].profit,2));
     }
   if(size==9)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha Profit_Total "+IntegerToString(datosMagicNumber[0].magicNumber)+" "+IntegerToString(datosMagicNumber[1].magicNumber)+" "+IntegerToString(datosMagicNumber[2].magicNumber)+" "+IntegerToString(datosMagicNumber[3].magicNumber)+" "+IntegerToString(datosMagicNumber[4].magicNumber)+" "+IntegerToString(datosMagicNumber[5].magicNumber)+" "+IntegerToString(datosMagicNumber[6].magicNumber)+" "+IntegerToString(datosMagicNumber[7].magicNumber)+" "+IntegerToString(datosMagicNumber[8].magicNumber));
      else
         FileWrite(file_handle,TimeToString(data[i].fecha,TIME_DATE|TIME_MINUTES|TIME_SECONDS)+" "+DoubleToString(data[i].profitTotal,2)+" "+DoubleToString(data[i].datosMN[0].profit,2)+" "+DoubleToString(data[i].datosMN[1].profit,2)+" "+DoubleToString(data[i].datosMN[2].profit,2)+" "+DoubleToString(data[i].datosMN[3].profit,2)+" "+DoubleToString(data[i].datosMN[4].profit,2)+" "+DoubleToString(data[i].datosMN[5].profit,2)+" "+DoubleToString(data[i].datosMN[6].profit,2)+" "+DoubleToString(data[i].datosMN[7].profit,2)+" "+DoubleToString(data[i].datosMN[8].profit,2));
     }
  }
//+------------------------------------------------------------------+
/*EXCEL
void RegistrarProfitsMagics(int &file_handle,bool titulo,int i)
  {
   int size=ArraySize(datosMagicNumber);

   if(size==1)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha","Profit Total",datosMagicNumber[0].magicNumber);
      else
         FileWrite(file_handle,data[i].fecha,data[i].profitTotal,data[i].datosMN[0].profit);
     }
   if(size==2)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha","Profit Total",datosMagicNumber[0].magicNumber,datosMagicNumber[1].magicNumber);
      else
         FileWrite(file_handle,data[i].fecha,data[i].profitTotal,data[i].datosMN[0].profit,data[i].datosMN[1].profit);
     }
   if(size==3)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha","Profit Total",datosMagicNumber[0].magicNumber,datosMagicNumber[1].magicNumber,datosMagicNumber[2].magicNumber);
      else
         FileWrite(file_handle,data[i].fecha,data[i].profitTotal,data[i].datosMN[0].profit,data[i].datosMN[1].profit,data[i].datosMN[2].profit);
     }
   if(size==4)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha","Profit Total",datosMagicNumber[0].magicNumber,datosMagicNumber[1].magicNumber,datosMagicNumber[2].magicNumber,datosMagicNumber[3].magicNumber);
      else
         FileWrite(file_handle,data[i].fecha,data[i].profitTotal,data[i].datosMN[0].profit,data[i].datosMN[1].profit,data[i].datosMN[2].profit,data[i].datosMN[3].profit);
     }
   if(size==5)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha","Profit Total",datosMagicNumber[0].magicNumber,datosMagicNumber[1].magicNumber,datosMagicNumber[2].magicNumber,datosMagicNumber[3].magicNumber,datosMagicNumber[4].magicNumber);
      else
         FileWrite(file_handle,data[i].fecha,data[i].profitTotal,data[i].datosMN[0].profit,data[i].datosMN[1].profit,data[i].datosMN[2].profit,data[i].datosMN[3].profit,data[i].datosMN[4].profit);
     }
   if(size==6)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha","Profit Total",datosMagicNumber[0].magicNumber,datosMagicNumber[1].magicNumber,datosMagicNumber[2].magicNumber,datosMagicNumber[3].magicNumber,datosMagicNumber[4].magicNumber,datosMagicNumber[5].magicNumber);
      else
         FileWrite(file_handle,data[i].fecha,data[i].profitTotal,data[i].datosMN[0].profit,data[i].datosMN[1].profit,data[i].datosMN[2].profit,data[i].datosMN[3].profit,data[i].datosMN[4].profit,data[i].datosMN[5].profit);
     }
   if(size==7)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha","Profit Total",datosMagicNumber[0].magicNumber,datosMagicNumber[1].magicNumber,datosMagicNumber[2].magicNumber,datosMagicNumber[3].magicNumber,datosMagicNumber[4].magicNumber,datosMagicNumber[5].magicNumber,datosMagicNumber[6].magicNumber);
      else
         FileWrite(file_handle,data[i].fecha,data[i].profitTotal,data[i].datosMN[0].profit,data[i].datosMN[1].profit,data[i].datosMN[2].profit,data[i].datosMN[3].profit,data[i].datosMN[4].profit,data[i].datosMN[5].profit,data[i].datosMN[6].profit);
     }
   if(size==8)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha","Profit Total",datosMagicNumber[0].magicNumber,datosMagicNumber[1].magicNumber,datosMagicNumber[2].magicNumber,datosMagicNumber[3].magicNumber,datosMagicNumber[4].magicNumber,datosMagicNumber[5].magicNumber,datosMagicNumber[6].magicNumber,datosMagicNumber[7].magicNumber);
      else
         FileWrite(file_handle,data[i].fecha,data[i].profitTotal,data[i].datosMN[0].profit,data[i].datosMN[1].profit,data[i].datosMN[2].profit,data[i].datosMN[3].profit,data[i].datosMN[4].profit,data[i].datosMN[5].profit,data[i].datosMN[6].profit,data[i].datosMN[7].profit);
     }
   if(size==9)
     {
      if(titulo)
         FileWrite(file_handle,"Fecha","Profit Total",datosMagicNumber[0].magicNumber,datosMagicNumber[1].magicNumber,datosMagicNumber[2].magicNumber,datosMagicNumber[3].magicNumber,datosMagicNumber[4].magicNumber,datosMagicNumber[5].magicNumber,datosMagicNumber[6].magicNumber,datosMagicNumber[7].magicNumber,datosMagicNumber[8].magicNumber);
      else
         FileWrite(file_handle,data[i].fecha,data[i].profitTotal,data[i].datosMN[0].profit,data[i].datosMN[1].profit,data[i].datosMN[2].profit,data[i].datosMN[3].profit,data[i].datosMN[4].profit,data[i].datosMN[5].profit,data[i].datosMN[6].profit,data[i].datosMN[7].profit,data[i].datosMN[8].profit);
     }
  }*/
//+------------------------------------------------------------------+
