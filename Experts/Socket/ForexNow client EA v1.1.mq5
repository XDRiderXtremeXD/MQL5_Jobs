//+------------------------------------------------------------------+
//|                                                     SignalClient |
//|                       programming & development - Alexey Sergeev |
//+------------------------------------------------------------------+
#property link      "https://www.dominionforex.es"
#property copyright "ForexNow client EA v1.1 "

#include "SocketLib.mqh"
#include <Trade\Trade.mqh>
CTrade trade;
int NumeroMagicoReceptor=86420193;

input string Host="127.0.0.1";
input ushort Port=8081;
input string S1="============== GESTION LOTAJE RELACION ===================";//============================
input double De_Lote=1;//De Lote (Emisor)
input double A_Lote=1;//A Lote (Receptor)
input string S3="============== FILTRO POR NUMERO MAGICO EMISOR ===================";//==========================
input bool Filtro_Numero_Magico=false;//Filtro Numero Magico
input int  numeroMagicoEmisor=222222;//Numero Magico Emisor

SOCKET64 client=INVALID_SOCKET64; // client socket
string msg=""; // queue of received messages

struct tRelacion
  {
   long              IDPosEmisor;
   long              IDPosReceptor;
   long              TicketReceptor;
  };
datetime LiberarTiempo=0;

tRelacion TicketsRelacion[];
string path_tRelacion="";
//------------------------------------------------------------------ OnInit
int OnInit()
  {
   /*
   if(AccountInfoInteger(ACCOUNT_MARGIN_MODE)==ACCOUNT_MARGIN_MODE_RETAIL_HEDGING)
     {
      Alert("Client work only with Netting accounts"); return INIT_FAILED;
     }*/
   ArrayResize(TicketsRelacion,0);
   trade.SetExpertMagicNumber(NumeroMagicoReceptor);
   LiberarTiempo=iTime(Symbol(),PERIOD_H1,0);

   path_tRelacion="Data_Copy"+"//"+"TR"+IntegerToString(ChartID())+IntegerToString(AccountInfoInteger(ACCOUNT_LOGIN));
   LeerDatosTicketsRelacion(TicketsRelacion);

   EventSetMillisecondTimer(1);
   return INIT_SUCCEEDED;
  }
//------------------------------------------------------------------ OnInit
void OnDeinit(const int reason)
  {

   if(reason==REASON_CHARTCHANGE || reason==REASON_CLOSE)
      GuardarDatos(TicketsRelacion);
   else
      FileDelete(path_tRelacion);

   EventKillTimer();
   CloseClean();
  }
//------------------------------------------------------------------ OnInit
void OnTimer()
  {
   if(client==INVALID_SOCKET64)
      StartClient(Host,Port);
   else
     {
      uchar data[];
      if(Receive(data)>0) // receive data
        {
         msg+=CharArrayToString(data); // if something was received, add it to the total string
         printf("received msg from server: %s",msg);
        }
      CheckMessage();
     }

   if(LiberarTiempo!=iTime(Symbol(),PERIOD_H1,0))
     {
      LiberarMemoriaRelacion();
      LiberarTiempo=iTime(Symbol(),PERIOD_H1,0);
     }
  }
//------------------------------------------------------------------ CloseClean
void StartClient(string addr,ushort port)
  {
// initialize the library
   int res=0;
   char wsaData[];
   ArrayResize(wsaData, sizeof(WSAData));
   res=WSAStartup(MAKEWORD(2,2), wsaData);
   if(res!=0)
     {
      Print("-WSAStartup failed error: "+string(res));
      return;
     }

// create a socket
   client=socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
   if(client==INVALID_SOCKET64)
     {
      Print("-Create failed error: "+WSAErrorDescript(WSAGetLastError()));
      CloseClean();
      return;
     }

// connect to server
   char ch[];
   StringToCharArray(addr,ch);
   sockaddr_in addrin;
   addrin.sin_family=AF_INET;
   addrin.sin_addr.u.S_addr=inet_addr(ch);
   addrin.sin_port=htons(port);

   ref_sockaddr ref;
   ref.in=addrin;
   res=connect(client,ref.ref,sizeof(addrin));
   if(res==SOCKET_ERROR)
     {
      int err=WSAGetLastError();
      if(err!=WSAEISCONN)
        {
         Print("-Connect failed error: "+WSAErrorDescript(err));
         CloseClean();
         return;
        }
     }

// set to nonblocking mode
   int non_block=1;
   res=ioctlsocket(client,(int)FIONBIO,non_block);
   if(res!=NO_ERROR)
     {
      Print("ioctlsocket failed error: "+string(res));
      CloseClean();
      return;
     }

   Print("connect OK");
  }
//------------------------------------------------------------------ Receive
int Receive(uchar &rdata[]) // Receive until the peer closes the connection
  {
   if(client==INVALID_SOCKET64)
      return 0; // if the socket is still not open

   char rbuf[512];
   int rlen=512;
   int r=0,res=0;
   do
     {
      res=recv(client,rbuf,rlen,0);
      if(res<0)
        {
         int err=WSAGetLastError();
         if(err!=WSAEWOULDBLOCK)
           {
            Print("-Receive failed error: "+string(err)+" "+WSAErrorDescript(err));
            CloseClean();
            return -1;
           }
         break;
        }
      if(res==0 && r==0)
        {
         Print("-Receive. connection closed");
         CloseClean();
         return -1;
        }
      r+=res;
      ArrayCopy(rdata,rbuf,ArraySize(rdata),0,res);
     }
   while(res>0 && res>=rlen);
   return r;
  }
//------------------------------------------------------------------ CloseClean
void CloseClean() // close socket
  {
   if(client!=INVALID_SOCKET64)
     {
      if(shutdown(client,SD_BOTH)==SOCKET_ERROR)
         Print("-Shutdown failed error: "+WSAErrorDescript(WSAGetLastError()));
      closesocket(client);
      client=INVALID_SOCKET64;
     }

   WSACleanup();
   Print("close socket");
  }
//------------------------------------------------------------------ CheckMessage
void CheckMessage()
  {
   string messages[];
   string resMessages[];

   if(msg=="")
      return;

   if(StringSplit(msg,'*',resMessages)<=1)
     {
      printf("-wrong messages info: %s",msg);
      return;
     }
   for(int i=0; i<ArraySize(resMessages)-1; i++)
     {
      string pos=resMessages[i];
      while(FindNextPos(pos))
        {
         printf("server position: %s",pos);
        };  // get the most recent change from the server
      if(StringLen(pos)<=0)
         continue;
      // receive data from the message
      string res[];

      if(StringSplit(pos,'|',res)==5)
        {
         string mensaje=res[0];
         double priceModify=StringToDouble(res[1]);
         long idPosition=StringToInteger(res[2]);
         long numberMagic=StringToInteger(res[3]);
         string simbol=res[4];
         ModificarSLTP(mensaje=="MODIFICARTP",priceModify,idPosition,numberMagic,simbol);
         continue;
        }




      if(StringSplit(pos,'|',res)!=10)
        {
         printf("-wrong pos info: %s",pos);
         continue;
        }
      //Simbolo Lote EntryDeal IDPosition TipoOperacion NumeroMagico StopLoss TakeProfit PrecioDeEntrada IDLogin
      string smb=res[0];

      double lot=NormalizeDouble(StringToDouble(res[1]),2);
      long entryDeal=StringToInteger(res[2]);
      long idPosition=StringToInteger(res[3]);
      long typeOperacion=StringToInteger(res[4]);
      long numberMagic=StringToInteger(res[5]);
      double StopLoss=StringToDouble(res[6]);
      double TakeProfit=StringToDouble(res[7]);
      double PrecioDeEntrada=StringToDouble(res[8]);
      long IDLogin=StringToInteger(res[9]);

      GestionData(smb,lot,entryDeal,idPosition,typeOperacion,numberMagic,StopLoss,TakeProfit,PrecioDeEntrada,IDLogin);
     }
   msg="";
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GestionData(string simbolo,double lote,long tipoEntry,long IdPosicion,long tipoOperacion,long numeroMagico,
                 double SL,double TP,double OP,long IDLOGIN)
  {
   Print("ENTRA GESTION");
   if(Symbol()==simbolo && numeroMagico!=NumeroMagicoReceptor && (!Filtro_Numero_Magico || numeroMagicoEmisor==numeroMagico))
     {

      Print("ENTRA GESTION ",Symbol());

      if(tipoEntry==DEAL_ENTRY_IN)
        {
         Print("Entra gestion entry");
         Operar(Symbol(),tipoOperacion,lote,TP,SL,IdPosicion);
        }
      if(tipoEntry==DEAL_ENTRY_OUT)
        {
         Print("Entra gestion out");
         CerrarPosicionReceptor(IdPosicion);
        }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ModificarSLTP(bool IsTP,double price,long IdPosicion,long numeroMagico,string simbolo)
  {
   if(Symbol()==simbolo && numeroMagico!=NumeroMagicoReceptor && (!Filtro_Numero_Magico || numeroMagicoEmisor==numeroMagico))
     {
      int Size=ArraySize(TicketsRelacion);

      for(int s=0; s<Size; s++)
        {

         if(IdPosicion==TicketsRelacion[s].IDPosEmisor)
           {
            int Posiciones=PositionsTotal();
            for(int i=0; i<Posiciones; i++)
              {
               if(PositionGetTicket(i)>0)
                  if(PositionGetInteger(POSITION_IDENTIFIER)==TicketsRelacion[s].IDPosReceptor)
                    {
                     if(!IsTP)
                       {
                        if(!trade.PositionModify(PositionGetTicket(i),NormalizeDouble(price,Digits()),PositionGetDouble(POSITION_TP)))
                           Print("No pudo modificar posicion ",GetLastError()," resultRetcode ",trade.ResultRetcode());
                       }
                     else
                       {
                        if(!trade.PositionModify(PositionGetTicket(i),PositionGetDouble(POSITION_SL),NormalizeDouble(price,Digits())))
                           Print("No pudo modificar posicion ",GetLastError()," resultRetcode ",trade.ResultRetcode());
                       }
                     return;
                    }
              }
           }
        }

      Print("No se encontro operacion para modificar");
      return;
     }
  }

//------------------------------------------------------------------ SyncSymbolLot
/*bool SyncSymbolLot(string smb,double nlot)
  {
// synchronize the server and client volumes
   CTrade trade;
   double clot=GetSymbolLot(smb); // get the current lot for the symbol
   if(clot==nlot) { Print("nothing change"); return true; } // if the volumes are equal, do nothing

                                                            // first, check the special case of no positions present on the server
   if(nlot==0 && clot!=0) { Print("full close position"); return trade.PositionClose(smb); }

// if the server has a position, change it on the client
   double dif=NormalizeDouble(nlot-clot,2);
// buy or sell depending on the difference
   if(dif>0) { Print("add Buy position"); return trade.Buy(dif,smb); }
   else { Print("add Sell position"); return trade.Sell(-dif,smb); }
  }*/
//------------------------------------------------------------------ FindNextPos
bool FindNextPos(string &pos)
  {
   int b=StringFind(pos, "<<");
   if(b<0)
      return false; // no beginning of the message
   int e=StringFind(pos, ">>");
   if(e<0)
      return false; // no end of the message

   pos=StringSubstr(pos,b+2,e-b-2); // get the information block
   return true;
  }
//------------------------------------------------------------------ GetSymbolLot
double GetSymbolLot(string smb)
  {
   double slot=0;
   int n=PositionsTotal();
   for(int i=0; i<n; ++i)
     {
      PositionSelectByTicket(PositionGetTicket(i));
      if(PositionGetString(POSITION_SYMBOL)!=smb)
         continue; // filter the position of the current symbol, where the server is running
      double lot=PositionGetDouble(POSITION_VOLUME); // get the volume
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
         lot=-lot; // consider the direction
      slot+=lot; // add to the sum
     }
   return NormalizeDouble(slot,2);
  }
//+------------------------------------------------------------------+
void Operar(string symbol,long tipo,double lote,double tp,double sl,long ticket)
  {
   double sacar=0;
   double Lote=SacarLote(lote,sacar);
   if(tipo==DEAL_TYPE_BUY)
     {
      if(!trade.Buy(lote,symbol,SymbolInfoDouble(Symbol(),SYMBOL_ASK),sl,tp,"Experto Copy"))
         Print("Error ",GetLastError()," Codigo ",trade.ResultRetcode());
      else
        {
         ulong lastTicket=PositionGetTicket(PositionsTotal()-1);
         if(lastTicket!=0)
           {
            if(sacar!=0)
               if(!trade.PositionClosePartial(PositionGetInteger(POSITION_TICKET),sacar,-1))
                  Print("Error NO CERRO PARCIAL ",GetLastError()," Codigo ",trade.ResultRetcode());
           }
         lastTicket=PositionGetTicket(PositionsTotal()-1);
         if(lastTicket!=0)
            GuardarTicket(ticket,PositionGetInteger(POSITION_IDENTIFIER),lastTicket);
        }
     }

   if(tipo==DEAL_TYPE_SELL)
     {
      if(!trade.Sell(lote,symbol,SymbolInfoDouble(Symbol(),SYMBOL_BID),sl,tp,"Experto Copy"))
         Print("Error ",GetLastError()," Codigo ",trade.ResultRetcode());
      else
        {
         ulong lastTicket=PositionGetTicket(PositionsTotal()-1);
         if(lastTicket!=0)
           {
            if(sacar!=0)
               if(PositionGetTicket(PositionsTotal()-1)!=0)
                  if(!trade.PositionClosePartial(PositionGetInteger(POSITION_TICKET),sacar,-1))
                     Print("Error NO CERRO PARCIAL ",GetLastError()," Codigo ",trade.ResultRetcode());
           }
         lastTicket=PositionGetTicket(PositionsTotal()-1);
         if(lastTicket!=0)
            GuardarTicket(ticket,PositionGetInteger(POSITION_IDENTIFIER),lastTicket);
        }
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
      // Print("lote calculado ",lote);
      // Print("Lote calculado no corresponde al paso permitido");
      // Print("Igualando al paso mas cercano con forme al lote calculado");
      lote=int(step)*SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP);
      // Print("lote calculado",lote);
     }

   if(lote<min)
     {
      // Print("Lote calculado menor al permitido Gestionando con ordenes parciales");
      lote=min+lote;
      //  Print("lote calculado INCIAL",lote);
      sacar=min;
      // Print("lote calculado SACAR",min);
     }
   else
      if(lote>SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX))
         return SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);

   return lote;
  }
//+------------------------------------------------------------------+
void GuardarTicket(long idEmisor,long idReceptor,long ticketReceptor)
  {
   int Size=ArraySize(TicketsRelacion);
   bool Cambio=false;
   for(int s=0; s<Size; s++)
     {
      if(idEmisor==TicketsRelacion[s].IDPosEmisor)
        {
         Cambio=true;
         TicketsRelacion[s].IDPosReceptor=idReceptor;
         TicketsRelacion[s].TicketReceptor=ticketReceptor;
         //Print("GUARDO ",TicketsRelacion[s].TicketReceptor," ",TicketsRelacion[s].TicketEmisor);
         break;
        }
     }
   if(Cambio==false)
     {
      ArrayResize(TicketsRelacion,Size+1);
      TicketsRelacion[Size].IDPosReceptor=idReceptor;
      TicketsRelacion[Size].IDPosEmisor=idEmisor;
      TicketsRelacion[Size].TicketReceptor=ticketReceptor;
      //  Print("GUARDO ",TicketsRelacion[Size].TicketReceptor," ",TicketsRelacion[Size].TicketEmisor);
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CerrarPosicionReceptor(ulong idEmisor)
  {
   /*int Size=ArraySize(TicketsRelacion);
   for(int s=0; s<Size; s++)
     {
      if(PositionSelectByTicket(TicketsRelacion[s].TicketReceptor))
        {
         if(idEmisor==TicketsRelacion[s].IDPosEmisor)
           {
            if(!trade.PositionClose(TicketsRelacion[s].TicketReceptor,-1))
               Print("No pudo cerrar posicion ",GetLastError()," resultRetcode ",trade.ResultRetcode());
            return;
           }
        }
     }*/
   int Size=ArraySize(TicketsRelacion);
   for(int s=0; s<Size; s++)
     {
      if(idEmisor==TicketsRelacion[s].IDPosEmisor)
        {
         int Posiciones=PositionsTotal();
         for(int i=0; i<Posiciones; i++)
           {
            if(PositionGetTicket(i)>0)
               if(PositionGetInteger(POSITION_IDENTIFIER)==TicketsRelacion[s].IDPosReceptor)
                 {
                  if(!trade.PositionClose(PositionGetTicket(i),-1))
                     Print("No pudo cerrar posicion ",GetLastError()," resultRetcode ",trade.ResultRetcode());
                  return;
                 }
           }
        }
     }

   Print("No se encontro operacion para cerrar");
   return;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
void LiberarMemoriaRelacion()
  {
   long ID_Pos[];
   int SizePos=PositionsTotal();
   ArrayResize(ID_Pos,SizePos);
   for(int i=0; i<SizePos; i++)
      if(PositionGetTicket(i)>0)
         ID_Pos[i]=PositionGetInteger(POSITION_IDENTIFIER);

   int SizeArreglo=ArraySize(TicketsRelacion);
   for(int i=0; i<ArraySize(TicketsRelacion); i++)
     {
      bool Encontro=false;
      for(int j=0; j<SizePos; j++)
        {
         if(TicketsRelacion[i].IDPosReceptor==ID_Pos[j])
           {
            ArrayRemove(ID_Pos,j,1);
            SizePos--;
            Encontro=true;
            break;
           }
        }
      if(!Encontro)
        {
         ArrayRemove(TicketsRelacion,i,1);
         int size=ArraySize(TicketsRelacion);
         ArrayResize(TicketsRelacion,size-1);
         i--;
        }
     }

  }
//+------------------------------------------------------------------+
void GuardarDatos(tRelacion &IDs[])
  {
   Print("TOTAL ",ArraySize(IDs));

//--- open the file
   int handle=FileOpen(path_tRelacion,FILE_READ|FILE_WRITE|FILE_BIN|FILE_COMMON);
   FileDelete(path_tRelacion,FILE_COMMON);

   if(handle!=INVALID_HANDLE)
     {
      //--- write array data to the end of the file
      FileSeek(handle,0,SEEK_SET);
      FileWriteArray(handle,IDs,0,WHOLE_ARRAY);
      FileClose(handle);
     }
   else
      Print("Failed to open the file, error ","TR",IntegerToString(ChartID()),IntegerToString(AccountInfoInteger(ACCOUNT_LOGIN))," ",GetLastError());
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void LeerDatosTicketsRelacion(tRelacion &arr[])
  {
   int file_handle=FileOpen(path_tRelacion,FILE_READ|FILE_BIN|FILE_COMMON);

   if(file_handle!=INVALID_HANDLE)
     {
      FileReadArray(file_handle,arr);
      FileClose(file_handle);
     }

  }

//+------------------------------------------------------------------+
