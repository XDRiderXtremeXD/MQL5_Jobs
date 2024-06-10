//+------------------------------------------------------------------+
//|                                            FormatoHoraMinuto.mqh |
//|                        Copyright 2021, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property strict
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SacarHoraMinuto(string horaMinuto,int &hora,int &minuto)
  {
   string hora_minuto[];
   StringSplit(horaMinuto,':',hora_minuto);
   if(ArraySize(hora_minuto)!=2)
      return false;

   string comentario="";

   if(!VerificarEntero(hora_minuto[0],comentario))
     {
      Alert(comentario+" en "+horaMinuto);
      return false;
     }

   if(!VerificarEntero(hora_minuto[1],comentario))
     {
      Alert(comentario+" en "+horaMinuto);
      return false;
     }

   hora=(int)StringToInteger(hora_minuto[0]);
   minuto=(int)StringToInteger(hora_minuto[1]);



   if(!VerificarHora_o_Minuto(hora,true,comentario))
     {
      Alert(comentario+" en ",horaMinuto);
      return false;
     }

   if(!VerificarHora_o_Minuto(minuto,false,comentario))
     {
      Alert(comentario+" en ",horaMinuto);
      return false;
     }

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarEntero(string evaluaString,string &comentario)
  {
   for(int i=0; i<StringLen(evaluaString); i++)
     {
      ushort char_=StringGetCharacter(evaluaString,i);
      if(!('0'<=char_ && char_<='9'))
        {
         comentario="Los valores hora o minuto deben de ser valores enteros";
         return false;
        }
     }
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool VerificarHora_o_Minuto(int clockPointer,bool IsHora,string &comentario)
  {
   comentario=IsHora?("Hora es mayor a 23"):("Minuto es mayor a 59");
   return (clockPointer<(IsHora?(24):(60)));
  }
//+------------------------------------------------------------------+
