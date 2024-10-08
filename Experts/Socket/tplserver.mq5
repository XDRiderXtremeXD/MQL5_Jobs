//+------------------------------------------------------------------+
//|                                                        TplServer |
//|                       programming & development - Alexey Sergeev |
//+------------------------------------------------------------------+
#property copyright "© 2006-2016 Alexey Sergeev"
#property link      "profy.mql@gmail.com"
#property version   "1.00"

#include "SocketLib.mqh"

input string Host="0.0.0.0";
input ushort Port=8080;

uchar tpl[];
int iCnt=0;
string exname="";
SOCKET64 server=INVALID_SOCKET64;
//------------------------------------------------------------------	OnInit
int OnInit()
  {
   EventSetTimer(1);
   exname=MQLInfoString(MQL_PROGRAM_NAME)+".ex5";
   return 0;
  }
//------------------------------------------------------------------	OnDeinit
void OnDeinit(const int reason)
  {
   EventKillTimer();
   CloseClean();
  }
//------------------------------------------------------------------	OnChartEvent
void OnChartEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
   if(iCnt==0) // limit on creating template file - no more than once per second
     {
      Print("Create TPL");
      uchar buf[];
      CreateTpl(buf);
      uchar smb[]; StringToCharArray(Symbol(),smb); ArrayResize(smb,10);
      uchar tf[]; StringToCharArray(IntegerToString(Period()),tf); ArrayResize(tf,10);

      // create data for sending
      ArrayCopy(tpl,smb, ArraySize(tpl)); // add symbol name
      ArrayCopy(tpl, tf, ArraySize(tpl)); // add period value
      ArrayCopy(tpl,buf, ArraySize(tpl)); // add the template itself
     }
   iCnt++;
  }
//------------------------------------------------------------------	OnTimer
void OnTimer()
  {
   iCnt=0; // reset the template creation counter

   if(server==INVALID_SOCKET64)
      StartServer(Host,Port);
   else
     {
      // get all clients in a loop and send the current chart template to each client
      SOCKET64 client=INVALID_SOCKET64;
      do
        {
         client=AcceptClient(); // Accept a client socket
         if(client==INVALID_SOCKET64) return;

         int slen=ArraySize(tpl);
         int res=send(client,tpl,slen,0);
         if(res==SOCKET_ERROR) Print("-Send failed error: "+WSAErrorDescript(WSAGetLastError()));
         else printf("Sent %d bytes of %d",res,slen);

         if(shutdown(client,SD_BOTH)==SOCKET_ERROR) Print("-Shutdown failed error: "+WSAErrorDescript(WSAGetLastError()));
         closesocket(client);
        }
      while(client!=INVALID_SOCKET64);
     }
  }
//------------------------------------------------------------------	StartServer
void StartServer(string addr,ushort port)
  {
// initialize the library
   char wsaData[]; ArrayResize(wsaData,sizeof(WSAData));
   int res=WSAStartup(MAKEWORD(2,2), wsaData);
   if(res!=0) { Print("-WSAStartup failed error: "+string(res)); return; }

// create socket
   server=socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
   if(server==INVALID_SOCKET64) { Print("-Create failed error: "+WSAErrorDescript(WSAGetLastError())); CloseClean(); return; }

// bind to address and port
   Print("try bind..."+addr+":"+string(port));

   char ch[]; StringToCharArray(addr,ch);
   sockaddr_in addrin;
   addrin.sin_family=AF_INET;
   addrin.sin_addr.u.S_addr=inet_addr(ch);
   addrin.sin_port=htons(port);
   ref_sockaddr ref; ref.in=addrin;
   if(bind(server,ref.ref,sizeof(addrin))==SOCKET_ERROR)
     {
      int err=WSAGetLastError();
      if(err!=WSAEISCONN) { Print("-Connect failed error: "+WSAErrorDescript(err)+". Cleanup socket"); CloseClean(); return; }
     }

// set to nonblocking mode
   int non_block=1;
   res=ioctlsocket(server,(int)FIONBIO,non_block);
   if(res!=NO_ERROR) { Print("ioctlsocket failed error: "+string(res)); CloseClean(); return; }

// listen port and accept client connections
   if(listen(server,SOMAXCONN)==SOCKET_ERROR) { Print("Listen failed with error: ",WSAErrorDescript(WSAGetLastError())); CloseClean(); return; }

   Print("start server ok");
  }
//------------------------------------------------------------------	Accept
SOCKET64 AcceptClient() // Accept a client socket
  {
   if(server==INVALID_SOCKET64) return INVALID_SOCKET64;
   ref_sockaddr ch;
   int len=sizeof(ref_sockaddr);
   SOCKET64 new_sock=accept(server,ch.ref,len);
//sockaddr_in aclient=(sockaddr_in)ch; convert into structure, if it is necessary to get additional information about the connection
   if(new_sock==INVALID_SOCKET64)
     {
      int err=WSAGetLastError();
      if(err==WSAEWOULDBLOCK) Comment("\nWAITING CLIENT ("+string(TimeCurrent())+")");
      else { Print("Accept failed with error: ",WSAErrorDescript(err)); CloseClean(); return INVALID_SOCKET64; }
     }
   return new_sock;
  }
//------------------------------------------------------------------	CloseClean
void CloseClean() // close socket
  {
   if(server!=INVALID_SOCKET64) { closesocket(server); server=INVALID_SOCKET64; }
   WSACleanup();
   Print("stop server");
  }

//------------------------------------------------------------------
#import "kernel32.dll"
int CreateFileW(string lpFileName,uint dwDesiredAccess,uint dwShareMode,uint lpSecurityAttributes,uint dwCreationDisposition,uint dwFlagsAndAttributes,int hTemplateFile);
bool ReadFile(int h,ushort &lpBuffer[],uint nNumberOfBytesToRead,uint &lpNumberOfBytesRead,int lpOverlapped=0);
uint SetFilePointer(int h,int lDistanceToMove,int,uint dwMoveMethod);
bool CloseHandle(int h);
uint GetFileSize(int h,int);
#import

#define FILE_BEGIN		       		0
#define OPEN_EXISTING       		3
#define GENERIC_READ        		0x80000000
#define FILE_ATTRIBUTE_NORMAL		0x00000080
#define FILE_SHARE_READ_         0x00000001  
//------------------------------------------------------------------	LoadTpl
bool CreateTpl(uchar &abuf[])
  {
   string path=TerminalInfoString(TERMINAL_PATH);
   string name="tcpsend.tpl";

// create template
   ChartSaveTemplate(0,name);

// read the template to the array
   path+="\\Profiles\\Templates\\"+name;
   int h=CreateFileW(path, GENERIC_READ, FILE_SHARE_READ_, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
   if(h==INVALID_HANDLE) return false;
   uint sz=GetFileSize(h,NULL);
   ushort rbuf[];
   ArrayResize(rbuf,sz); ArrayInitialize(rbuf,0);
   SetFilePointer(h,0,NULL,FILE_BEGIN); // move to the top
   int r; ReadFile(h,rbuf,sz,r,NULL);
   CloseHandle(h);

// remove the EA name from the template
   string a=ShortArrayToString(rbuf);
   ArrayResize(rbuf,0);
   StringReplace(a,exname," ");
   StringToShortArray(a,rbuf);

// copy the file to a byte array (keeping Unicode)
   sz=ArraySize(rbuf);
   ArrayResize(abuf,sz*2);
   for(uint i=0; i<sz;++i) { abuf[2*i]=(uchar)rbuf[i]; abuf[2*i+1]=(uchar)(rbuf[i]>>8); }

   return true;
  }
//+------------------------------------------------------------------+
