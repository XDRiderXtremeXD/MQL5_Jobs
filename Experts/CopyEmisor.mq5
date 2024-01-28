//+------------------------------------------------------------------+
//|                                                   CopyEmisor.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int HistoryDeal=0;

string File_Data="DataEmisor";

struct Data
  {
   datetime          time;
   long              type;
   ushort            symbol[40];
   double            lote;
   long              numberMagic;
   double            tp;
   double            sl;
   double            price;
  };

Data element[1];
datetime tiempoBorrar=0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   HistorySelect(0,TimeCurrent());
   HistoryDeal=HistoryDealsTotal();
   tiempoBorrar=0;

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
   BorrarDatos(File_Data);

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTrade()
  {
   HistorySelect(0,TimeCurrent());
   int ActualHistory=HistoryDealsTotal();
   ulong ticket=0;

   if(HistoryDeal!=ActualHistory)
     {
      if((ticket=HistoryDealGetTicket(ActualHistory-1))>0)
        {
         datetime time=TimeLocal();
         string symbol=HistoryDealGetString(ticket,DEAL_SYMBOL);
         long type  =HistoryDealGetInteger(ticket,DEAL_TYPE);
         long entry =HistoryDealGetInteger(ticket,DEAL_ENTRY);
         long numberMagic=HistoryDealGetInteger(ticket,DEAL_MAGIC);
         double lote=HistoryDealGetDouble(ticket,DEAL_VOLUME);
         double tp=HistoryDealGetDouble(ticket,DEAL_TP);
         double sl=HistoryDealGetDouble(ticket,DEAL_SL);
         double price=HistoryDealGetDouble(ticket,DEAL_PRICE);
         //--- only for current symbol
         if(entry==DEAL_ENTRY_IN)
           {
            element[0].time=time;
            element[0].type=type;
            element[0].numberMagic=numberMagic;
            element[0].lote=lote;
            element[0].sl=sl;
            element[0].tp=tp;
            element[0].price=price;

            for(int i=0; i<40; i++)
              {
               element[0].symbol[i]= StringGetCharacter("*",0);
               if(i<StringLen(symbol))
                  element[0].symbol[i]= StringGetCharacter(symbol,i);
              }
            GuardarDatos(element,File_Data);
           }
        }
      HistoryDeal=ActualHistory;
     }

  }
//+------------------------------------------------------------------+
void GuardarDatos(Data &Array[],string File)
  {
   string path="Data_Copy"+"//"+File;
//--- open the file

   int Size=ArraySize(Array);

   int handle=FileOpen(path,FILE_READ|FILE_WRITE|FILE_BIN|FILE_COMMON);

   if(handle!=INVALID_HANDLE)
     {
      tiempoBorrar=TimeLocal()+60;
      //--- write array data to the end of the file
      FileSeek(handle,0,SEEK_END);
      FileWriteArray(handle,Array,0,1);
      //--- close the file
      FileClose(handle);
     }
   else
      Print("Failed to open the file, error ",GetLastError());
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
void BorrarDatos(string File)
  {
   string path="Data_Copy"+"//"+File;
   if(tiempoBorrar!=0 && TimeLocal()>=tiempoBorrar)
     {
      tiempoBorrar=0;
      Print("BORRO DATA POR TIEMPO");
      FileDelete(path);
     }
  }
//+------------------------------------------------------------------+
