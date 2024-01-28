//+------------------------------------------------------------------+
//|                                                 CopyReceptor.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

datetime lastTime=0;
datetime timeLastModify=0;
string File_Data="DataEmisor";
input int NumeroMagicoReceptor=4444444;//NumeroMagico Receptor
//(Si colocas en la misma cuenta, procura que los receptores tengan el mismo numero magico)
input string S1="============== GESTION LOTAJE ===================";
input double De_Lote=1;//De Lote (Emisor)
input double A_Lote=1;//A Lote (Receptor)
input string S2="============== FILTRO POR NUMERO MAGICO EMISOR ===================";
input bool Filtro_Numero_Magico=false;
input int  numeroMagicoEmisor=222222;


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

Data Datos[];

#include<Trade\Trade.mqh>
CTrade trade;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   lastTime=TimeLocal();
   timeLastModify=TimeLocal();
   EventSetMillisecondTimer(1);
   trade.SetExpertMagicNumber(NumeroMagicoReceptor);
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   LeerDatosFile(Datos,File_Data);

  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EventKillTimer();

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {



  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void LeerDatosFile(Data &arr[],string File)
  {
   string path="Data_Copy"+"//"+File;
   int file_handle=FileOpen(path,FILE_READ|FILE_BIN|FILE_COMMON);

   if(file_handle!=INVALID_HANDLE)
     {
      datetime timeModify=(datetime)FileGetInteger(file_handle,FILE_MODIFY_DATE);
      if(timeModify>timeLastModify)
        {
         FileReadArray(file_handle,arr);
         GestionData(arr);
         lastTime=TimeLocal();
         timeLastModify=timeModify;
        }
      FileClose(file_handle);
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GestionData(Data &arr[])
  {
   Print("------------ GESTIONA SEÑAL --------------------------");
   int Size=ArraySize(arr);
   for(int i=Size-1; i>=0; i--)
     {
      string Simbolo="";
      int SizeSimbolo=ArraySize(arr[i].symbol);
      for(int j=0; j<SizeSimbolo; j++)
        {
         string character=ShortToString(arr[i].symbol[j]);
         if(character=="*")
            break;
         Simbolo+=character;
        }
      if(lastTime<arr[i].time)
        {
         //Print("(",i,")  ",Simbolo," ",arr[i].type," ",arr[i].time," ",arr[i].numberMagic," ",arr[i].lote);
         if(Symbol()==Simbolo && arr[i].numberMagic!=NumeroMagicoReceptor && (!Filtro_Numero_Magico || numeroMagicoEmisor==arr[i].numberMagic))
           {
            Operar(Symbol(),arr[i].type,arr[i].lote,arr[i].tp,arr[i].sl);
            Print("DETECTADO= (",i,")  ",Simbolo," ",arr[i].type," ",arr[i].time," ",arr[i].numberMagic," ",arr[i].lote);
           }
        }
      else
         break;
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Operar(string symbol,long tipo,double lote,double tp,double sl)
  {
   double sacar=0;
   double Lote=SacarLote(lote,sacar);
   if(tipo==DEAL_TYPE_BUY)
     {
      if(!trade.Buy(lote,symbol,SymbolInfoDouble(Symbol(),SYMBOL_ASK),sl,tp,"Experto Copy"))
         Print("Error ",GetLastError()," Codigo ",trade.ResultRetcode());
      else
         if(sacar!=0)
            if(PositionGetTicket(PositionsTotal()-1)!=0)
               if(!trade.PositionClosePartial(PositionGetInteger(POSITION_TICKET),sacar,-1))
                  Print("Error NO CERRO PARCIAL ",GetLastError()," Codigo ",trade.ResultRetcode());
     }

   if(tipo==DEAL_TYPE_SELL)
     {
      if(!trade.Sell(lote,symbol,SymbolInfoDouble(Symbol(),SYMBOL_BID),sl,tp,"Experto Copy"))
         Print("Error ",GetLastError()," Codigo ",trade.ResultRetcode());
      else
         if(sacar!=0)
            if(PositionGetTicket(PositionsTotal()-1)!=0)
               if(!trade.PositionClosePartial(PositionGetInteger(POSITION_TICKET),sacar,-1))
                  Print("Error NO CERRO PARCIAL ",GetLastError()," Codigo ",trade.ResultRetcode());
     }
  }
//+------------------------------------------------------------------+
double SacarLote(double &lote,double &sacar)
  {
   double relacion=De_Lote/A_Lote;
   sacar=0;

   lote=NormalizeDouble(lote/relacion,2);
   double min=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);

   double step=lote/SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);

   if(step-int(step)>0)
     {
      Print("lote calculado ",lote);
      Print("Lote calculado no corresponde al paso permitido");
      Print("Igualando al paso mas cercano con forme al lote calculado");
      lote=int(step)*SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
      Print("lote calculado",lote);
     }

   if(lote<min)
     {
      Print("Lote calculado menor al permitido Gestionando con ordenes parciales");
      lote=min+lote;
      Print("lote calculado INCIAL",lote);
      sacar=min;
      Print("lote calculado SACAR",min);
     }
   else
      if(lote>SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
         return SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);

   return lote;
  }
//+------------------------------------------------------------------+
