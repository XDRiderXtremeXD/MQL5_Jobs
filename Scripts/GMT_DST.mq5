//+------------------------------------------------------------------+
//|                                                      GMT_DST.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
  
   datetime resultDay=0;
   int DST=TimeDaylightSavings();

   string Comentario=" ";
   int GMT=int(TimeCurrent()-TimeGMT());
   GMT=GMT/3600;

   if(DST!=0)
      GMT=GMT-(DST/3600);

   if(GMT==0)
      Comentario="GMT 0";
   else
      if(GMT<0)
         Comentario="GMT "+(GMT>0?("+"):(""))+IntegerToString((GMT));
      else
         Comentario="GMT "+(GMT>0?("+"):(""))+IntegerToString((GMT));

   if(DST==0)
      Comentario=Comentario+"    DST: no";
   else
      Comentario=Comentario+"    DST: yes";

   Print(Comentario);
//Comment(Comentario);

  }
//+------------------------------------------------------------------+
