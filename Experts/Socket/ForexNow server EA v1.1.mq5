//+------------------------------------------------------------------+
//|                                                     SignalServer |
//|                       programming & development - Alexey Sergeev |
//+------------------------------------------------------------------+
#property link      "https://www.dominionforex.es"
#property copyright "ForexNow server EA v1.1 "

#include "SocketLib.mqh"

input string Host="0.0.0.0";
input ushort Port=8081;

bool bChangeTrades;
uchar data[];
SOCKET64 server=INVALID_SOCKET64;
SOCKET64 conns[];
int HistoryDeal=0;
string mensaje="";
datetime TiempoStart=0;
int delay=1;


struct TP_SL
  {
   ulong               ticket;
   double            TP;
   double            SL;
   long              ID;
  };


TP_SL tickets_TP_SL[];
//------------------------------------------------------------------ OnInit
int OnInit() {TiempoStart=TimeCurrent(); mensaje=""; bChangeTrades=false; OnTrade(); EventSetMillisecondTimer(1);  ArrayResize(tickets_TP_SL,0); return 0; }
//------------------------------------------------------------------ OnDeinit
void OnDeinit(const int reason) { EventKillTimer(); CloseClean(); }
//------------------------------------------------------------------ OnTrade
void OnTrade()
  {
   /* double lot=GetSymbolLot(Symbol());
    StringToCharArray("<<"+Symbol()+"|"+DoubleToString(lot,2)+">>",data); // convert the string to byte array
    bChangeTrades=true;
   */

   HistorySelect(0,TimeCurrent());
   int ActualHistory=HistoryDealsTotal();
   ulong ticket=0;

   if(HistoryDeal==0)
      HistoryDeal=ActualHistory;

   if(HistoryDeal!=0)
      if(HistoryDeal!=ActualHistory)
        {
         for(int i=HistoryDeal; i<ActualHistory; i++)
           {
            string msn="";
            if((ticket=HistoryDealGetTicket(i))>0)
              {
               string symbol=HistoryDealGetString(ticket,DEAL_SYMBOL);
               long typeOp  =HistoryDealGetInteger(ticket,DEAL_TYPE);
               long entry =HistoryDealGetInteger(ticket,DEAL_ENTRY);
               long numberMagic=HistoryDealGetInteger(ticket,DEAL_MAGIC);
               double lote=HistoryDealGetDouble(ticket,DEAL_VOLUME);
               double tp=HistoryDealGetDouble(ticket,DEAL_TP);
               double sl=HistoryDealGetDouble(ticket,DEAL_SL);
               double price=HistoryDealGetDouble(ticket,DEAL_PRICE);
               long Id=HistoryDealGetInteger(ticket,DEAL_POSITION_ID);
               //--- only for current symbo
               if(numberMagic!= 86420193)
                  if(entry==DEAL_ENTRY_IN || entry==DEAL_ENTRY_OUT)
                    {
                     msn=("<<"+symbol+"|"+DoubleToString(lote,2)+"|"+IntegerToString(entry)+"|"+IntegerToString(Id)
                          +"|"+IntegerToString(typeOp)+"|"+IntegerToString(numberMagic)+"|"+DoubleToString(sl)
                          +"|"+DoubleToString(tp)+"|"+DoubleToString(price)+"|"+IntegerToString(AccountInfoInteger(ACCOUNT_LOGIN))+">>");
                    }
              }
            if(msn!="")
               mensaje+=(msn+"*");
           }
         HistoryDeal=ActualHistory;
        }

   VerificarSiSeModificoSLTP(mensaje);
   SacarPosiciones();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SacarPosiciones()
  {
   int pos=PositionsTotal();

   ArrayResize(tickets_TP_SL,0);
   int size=ArraySize(tickets_TP_SL);
   for(int i=0; i<pos; i++)
     {
      ulong ticket;
      if((ticket=PositionGetTicket(i))>0)
        {
         int size=ArraySize(tickets_TP_SL);
         ArrayResize(tickets_TP_SL,size+1);
         tickets_TP_SL[size].SL=PositionGetDouble(POSITION_SL);
         tickets_TP_SL[size].TP=PositionGetDouble(POSITION_TP);
         tickets_TP_SL[size].ID=PositionGetInteger(POSITION_IDENTIFIER);
         tickets_TP_SL[size].ticket=PositionGetInteger(POSITION_TICKET);
        }
     }

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void VerificarSiSeModificoSLTP(string &msn)
  {
   for(int i=0; i<ArraySize(tickets_TP_SL); i++)
     {
      if(PositionSelectByTicket(tickets_TP_SL[i].ticket))
        {
         if(tickets_TP_SL[i].SL!=PositionGetDouble(POSITION_SL))
           {
            msn+=("<<"+"MODIFICARSL"+"|"+DoubleToString(PositionGetDouble(POSITION_SL))+"|"+IntegerToString(tickets_TP_SL[i].ID)+"|"+IntegerToString(PositionGetInteger(POSITION_MAGIC))+"|"+PositionGetString(POSITION_SYMBOL)+">>");
            msn+="*";
           }
         if(tickets_TP_SL[i].TP!=PositionGetDouble(POSITION_TP))
           {
            msn=("<<"+"MODIFICARTP"+"|"+DoubleToString(PositionGetDouble(POSITION_TP))+"|"+IntegerToString(tickets_TP_SL[i].ID)+"|"+IntegerToString(PositionGetInteger(POSITION_MAGIC))+"|"+PositionGetString(POSITION_SYMBOL)+">>");
            msn+="*";
           }
        }
     }
  }
//------------------------------------------------------------------ OnTimer
void OnTimer()
  {
   if(server==INVALID_SOCKET64)
      StartServer(Host,Port);
   else
     {
      AcceptClients(); // add pending clients

      if(bChangeTrades)
        {
         Print("send new posinfo to clients");
         Send();
         bChangeTrades=false;
        }
     }


   if(mensaje!="")
     {
      StringToCharArray(mensaje,data); // convert the string to byte array
      bChangeTrades=true;
      mensaje="";
     }
  }
//------------------------------------------------------------------ StartServer
void StartServer(string addr,ushort port)
  {
// initialize the library
   char wsaData[];
   ArrayResize(wsaData,sizeof(WSAData));
   int res=WSAStartup(MAKEWORD(2,2), wsaData);
   if(res!=0)
     {
      Print("-WSAStartup failed error: "+string(res));
      return;
     }

// create a socket
   server=socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
   if(server==INVALID_SOCKET64)
     {
      Print("-Create failed error: "+WSAErrorDescript(WSAGetLastError()));
      CloseClean();
      return;
     }

// bind to address and port
   Print("try bind..."+addr+":"+string(port));

   char ch[];
   StringToCharArray(addr,ch);
   sockaddr_in addrin;
   addrin.sin_family=AF_INET;
   addrin.sin_addr.u.S_addr=inet_addr(ch);
   addrin.sin_port=htons(port);
   ref_sockaddr ref;
   ref.in=addrin;
   if(bind(server,ref.ref,sizeof(addrin))==SOCKET_ERROR)
     {
      int err=WSAGetLastError();
      if(err!=WSAEISCONN)
        {
         Print("-Connect failed error: "+WSAErrorDescript(err)+". Cleanup socket");
         CloseClean();
         return;
        }
     }

// set to nonblocking mode
   int non_block=1;
   res=ioctlsocket(server,(int)FIONBIO,non_block);
   if(res!=NO_ERROR)
     {
      Print("ioctlsocket failed error: "+string(res));
      CloseClean();
      return;
     }

// listen port and accept client connections
   if(listen(server,SOMAXCONN)==SOCKET_ERROR)
     {
      Print("Listen failed with error: ",WSAErrorDescript(WSAGetLastError()));
      CloseClean();
      return;
     }

   Print("start server ok");
  }
//------------------------------------------------------------------ Accept
void AcceptClients() // Accept a client socket
  {
   if(server==INVALID_SOCKET64)
      return;

// add all pending clients
   SOCKET64 client=INVALID_SOCKET64;
   do
     {
      ref_sockaddr ch;
      int len=sizeof(ref_sockaddr);
      client=accept(server,ch.ref,len);
      if(client==INVALID_SOCKET64)
        {
         int err=WSAGetLastError();
         if(err==WSAEWOULDBLOCK)
            Comment("\nWAITING CLIENT ("+string(TimeCurrent())+")");
         else
           {
            Print("Accept failed with error: ",WSAErrorDescript(err));
            CloseClean();
           }
         return;
        }

      // set to nonblocking mode
      int non_block=1;
      int res=ioctlsocket(client, (int)FIONBIO, non_block);
      if(res!=NO_ERROR)
        {
         Print("ioctlsocket failed error: "+string(res));
         continue;
        }

      // add client socket to the array
      int n=ArraySize(conns);
      ArrayResize(conns,n+1);
      conns[n]=client;
      bChangeTrades=false; // flag to indicate that information about the position must be sent

      // show client information
      char ipstr[23]= {0};
      ref_sockaddr_in aclient;
      aclient.in=ch.in; // convert into structure to get additional information about the connection
      inet_ntop(aclient.in.sin_family, aclient.ref, ipstr, sizeof(ipstr)); // get the address
      printf("Accept new client %s : %d",CharArrayToString(ipstr),ntohs(aclient.in.sin_port));
     }
   while(client!=INVALID_SOCKET64);
  }
//------------------------------------------------------------------ SendClient
void Send()
  {
   int len=ArraySize(data);
   for(int i=ArraySize(conns)-1; i>=0; --i) // send out the information to clients
     {
      if(conns[i]==INVALID_SOCKET64)
         continue; // skip closed
      int res=send(conns[i],data,len,0); // send
      if(res==SOCKET_ERROR)
        {
         Print("-Send failed error: "+WSAErrorDescript(WSAGetLastError())+". close socket");
         Close(conns[i]);
        }
     }
  }
//------------------------------------------------------------------ CloseClean
void CloseClean() // close and clear operation
  {
   printf("Shutdown server and %d connections",ArraySize(conns));
   if(server!=INVALID_SOCKET64)
     {
      closesocket(server);   // close the server
      server=INVALID_SOCKET64;
     }
   for(int i=ArraySize(conns)-1; i>=0; --i)
      Close(conns[i]); // close the clients
   ArrayResize(conns,0);
   WSACleanup();
  }
//------------------------------------------------------------------ Close
void Close(SOCKET64 &asock) // close one socket
  {
   if(asock==INVALID_SOCKET64)
      return;
   if(shutdown(asock,SD_BOTH)==SOCKET_ERROR)
      Print("-Shutdown failed error: "+WSAErrorDescript(WSAGetLastError()));
   closesocket(asock);
   asock=INVALID_SOCKET64;
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
   return slot;
  }
//+------------------------------------------------------------------+
