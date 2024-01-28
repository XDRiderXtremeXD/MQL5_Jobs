//+------------------------------------------------------------------+
//|                                          Demo_FileWiteStruct.mq5 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                              https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
//--- mostramos la ventana de parámetros de entrada al iniciar el script
#property script_show_inputs
//--- parámetros para obtener datos desde el terminal
input string          InpSymbolName="EURUSD";           // par de divisas
input ENUM_TIMEFRAMES InpSymbolPeriod=PERIOD_H1;        // período de tiempo
input datetime        InpDateStart=D'2013.01.01 00:00'; // fecha de inicio del copiado de datos
//--- parámetros para la escritura de datos en el archivo
input string          InpFileName="EURUSD.txt";         // nombre del archivo
input string          InpDirectoryName="Data";          // nombre de la carpeta
//+------------------------------------------------------------------+
//| Estructura para almacenar los datos de la vela                               |
//+------------------------------------------------------------------+
struct candlesticks
  {
   double            open;  // precio de apertura
   double            close; // precio de cierre
   double            high;  // precio máximo
   double            low;   // precio mínimo
   datetime          date;  // fecha
  };
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   datetime     date_finish=TimeCurrent();
   int          size;
   datetime     time_buff[];
   double       open_buff[];
   double       close_buff[];
   double       high_buff[];
   double       low_buff[];
   candlesticks cand_buff[];
//--- reseteamos el valor del error
   ResetLastError();
//--- obtenemos el tiempo de aparición de barras desde el rango
   if(CopyTime(InpSymbolName,InpSymbolPeriod,InpDateStart,date_finish,time_buff)==-1)
     {
      PrintFormat("Fallo al copiar el valor de tiempo. Código del error = %d",GetLastError());
      return;
     }
//--- obtenemos los precios máximos de las barras desde el rango
   if(CopyHigh(InpSymbolName,InpSymbolPeriod,InpDateStart,date_finish,high_buff)==-1)
     {
      PrintFormat("Fallo al copiar los valores de precios máximos. Código del error = %d",GetLastError());
      return;
     }
//--- obtenemos los precios mínimos de las barras desde el rango
   if(CopyLow(InpSymbolName,InpSymbolPeriod,InpDateStart,date_finish,low_buff)==-1)
     {
      PrintFormat("Fallo al copiar los valores de precios mínimos. Código del error = %d",GetLastError());
      return;
     }
//--- obtenemos los precios de apertura de barras desde al rango
   if(CopyOpen(InpSymbolName,InpSymbolPeriod,InpDateStart,date_finish,open_buff)==-1)
     {
      PrintFormat("Fallo al copiar los valores de precios de apertura. Código del error = %d",GetLastError());
      return;
     }
//--- obtenemos los precios de cierre de barras desde el rango
   if(CopyClose(InpSymbolName,InpSymbolPeriod,InpDateStart,date_finish,close_buff)==-1)
     {
      PrintFormat("Fallo al copiar los valores de precios de cierre. Código del error = %d",GetLastError());
      return;
     }
//--- definimos la dimensión de arrays
   size=ArraySize(time_buff);
//--- guardamos todos los datos en el array de la estructura
   ArrayResize(cand_buff,size);
   for(int i=0;i<size;i++)
     {
      cand_buff[i].open=open_buff[i];
      cand_buff[i].close=close_buff[i];
      cand_buff[i].high=high_buff[i];
      cand_buff[i].low=low_buff[i];
      cand_buff[i].date=time_buff[i];
     }
 
//--- abrimos el archivo para la escritura del array de la estructura en el archivo (si no existe, se crea automáticamente)
   ResetLastError();
   int file_handle=FileOpen(InpDirectoryName+"//"+InpFileName,FILE_READ|FILE_WRITE|FILE_BIN|FILE_COMMON);
   if(file_handle!=INVALID_HANDLE)
     {
      PrintFormat("El archivo %s está abierto para la escritura",InpFileName);
      PrintFormat("Ruta del archivo: %s\\Files\\",TerminalInfoString(TERMINAL_COMMONDATA_PATH));
      //--- preparamos el contador del número de bytes
      uint counter=0;
      //--- escribimos los valores del array usando el ciclo
      for(int i=0;i<size;i++)
         counter+=FileWriteStruct(file_handle,cand_buff[i]);
      PrintFormat("En el archivo %s han sido escritos %d bytes de información",InpFileName,counter);
      PrintFormat("Total de bytes: %d * %d * %d = %d, %s",size,5,8,size*5*8,size*5*8==counter ? "Correcto" : "Error");
      //--- cerramos el archivo
      FileClose(file_handle);
      PrintFormat("Datos escritos, archivo %s cerrado",InpFileName);
     }
   else
      PrintFormat("Fallo al abrir el archivo %s, Código del error = %d",InpFileName,GetLastError());
  }