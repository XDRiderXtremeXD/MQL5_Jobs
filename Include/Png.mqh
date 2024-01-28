//+------------------------------------------------------------------+
//|                                                          Png.mqh |
//|                                    Copyright 2023, Nikolai Semko |
//|                         https://www.mql5.com/ru/users/nikolay7ko |
//|                                                   www.BeeXXI.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, Nikolai Semko"
#property link      "www.BeeXXI.com"
#property link      "SemkoNV@bk.ru"
#property version   "1.02"
#property strict

#define INT  (int(0))
#define LONG (long(0))
#define WORD (short(0))
#define BYTE (char(0))
#define _ceil(x) (x-(int)x>0)?(int)x+1:(int)x
#define _round(x) (x>0)?(int)(x+0.5):(int)(x-0.5)
#define _floor(x) (x>0)?(int)x:((int)x-x>0)?(int)x-1:(int)x
#define protected public
#include <Canvas\Canvas.mqh>
#undef protected


class CPng {
private:
   enum PNGLoadError {
      PNGError_NoError         =0,            // Success
      PNGError_Unknown         =0x80000000,   // Unknonwn error
      PNGError_BadStream       =0x80000001,   // Stream is invalid
      PNGError_Unsupported     =0x80000002,   // Unsupported PNG format
   };

   struct PNGInfo {
      uint              width;
      uint              height;
      uchar             bit_depth;
      uchar             clr_type;
      uchar             compression;
      uchar             filter;
      uchar             interlace;
      int               bpp;        // bytes per pixel
      int               bpr;        // bytes per row
   };

   struct Stream {
      uchar             data[];
      uint              size;
      uint              pos;

      bool              IsEmpty(void) const {
         return(size==0);
      }
      bool              IsEOF  (void) const {
         return(pos>=size);
      }
      bool              IsValid(void) const {
         return((uint)ArraySize(data)>=size && pos<size);
      }
      uint              Avail  (void) const {
         return(IsEOF()?0:size-pos);
      }
      bool              ReadArray(uchar &array[],int count) {
         if(!IsValid() || (pos+count)>size)
            return(false);
         //---
         int read=ArrayCopy(array,data,0,pos,count);
         pos+=read;
         return(read==count);
      }
      long              ReadLong(void) {
         long res=0;
         //---
         if(IsValid())
            for(int i=0; i<sizeof(long) && pos<size; i++,pos++)
               res=(res<<8)+data[pos];
         //---
         return(res);
      }
      int               ReadInt(void) {
         int res=0;
         //---
         if(IsValid())
            for(int i=0; i<sizeof(int) && pos<size; i++,pos++)
               res=(res<<8)+data[pos];
         //---
         return(res);
      }

      template<typename T>
      T                 operator>>(T) {
         T res=0;
         //---
         if(IsValid())
            for(int i=0; i<sizeof(T) && pos<size; i++,pos++)
               res=T((res<<8)+data[pos]);
         //---
         return(res);
      }
   };
   union rgb {
      uchar             argb[4];
      uint              clr;
   };
   rgb               col;
   bool              PNGLoad(const uchar &_png[],uint start,uint count,uint &image[],int &width,int &height,PNGLoadError &error);
   bool              PNGSingnatureCheckup(Stream &stream);
   uint              CRCUpdate(uint crc,uchar &array[],uint start,uint count);
   uint              CRC(uchar &array[],uint start,uint count);
   string            CanvName;
   string            _CanvName;
   bool              form_Canvas;
   bool              _form_Canvas;

public:
   CCanvas           C;
   CCanvas           _C;
   uint              bmp[];
   uint              _bmp[]; // resized bmp
   int               width,height;
   int               _width,_height; // for resized bmp
                     CPng(); // Get PNG from file
                     CPng(string file_path, bool create_canvas = false, int x = 0, int y = 0); // Get PNG from file
                     CPng(const uchar &bin_data[], bool create_canvas = false, int x = 0, int y = 0); // Get PNG from resource
                    ~CPng();
   void              LoadFromArray(const uchar &bin_data[], bool create_canvas = false, int x = 0, int y = 0); // Get PNG from resource
   void              Resize(double NewWidth);  // Resize Image
   bool              CreateCanvas(const int x, const int y);   // Creating canvas for bpm[] array (original size)
   bool              _CreateCanvas(const int x, const int y);  // Creating a canvas for the _bpm[] array (resized)
   bool              MoveCanvas(const int x,const int y);      // Move image canvas to original size
   bool              _MoveCanvas(const int x,const int y);     // Moving the resized image canvas
   void              BmpArrayFree() {ArrayFree(bmp);}          // Clear the main bitmap array to save memory if it is no longer needed
};
//+------------------------------------------------------------------+
CPng::CPng(const uchar &bin_data[], bool create_canvas = false, int x = 0, int y = 0) {
   PNGLoadError err;
   _width = 0;
   _height = 0;
   int size=ArraySize(bin_data);
   PNGLoad(bin_data,0,size,bmp,width,height,err);
   if (create_canvas) CreateCanvas(x,y);
};
//+------------------------------------------------------------------+
CPng::CPng(string file_path, bool create_canvas = false, int x = 0, int y = 0) {
   ResetLastError();
   _width = 0;
   _height = 0;
   int file_handle=FileOpen(file_path,FILE_READ|FILE_BIN);
   uchar png[];
   PNGLoadError err;
   if(file_handle!=INVALID_HANDLE) {
      //--- прочитаем все данные из файла в массив
      FileReadArray(file_handle,png);
      //long count=FileLoad(path,png,FILE_COMMON);
      //--- получим размер массива

      FileClose(file_handle);
   } else
      Print("File open failed, error ",GetLastError());
   int size=ArraySize(png);
   PNGLoad(png,0,size,bmp,width,height,err);
   if (create_canvas) CreateCanvas(x,y);
}
//+------------------------------------------------------------------+
CPng::~CPng() {
   if (form_Canvas) C.Destroy();
   if (_form_Canvas) _C.Destroy();
}
//+------------------------------------------------------------------+
void CPng::LoadFromArray(const uchar &bin_data[], bool create_canvas = false, int x = 0, int y = 0) {
   PNGLoadError err;
   _width = 0;
   _height = 0;
   int size=ArraySize(bin_data);
   PNGLoad(bin_data,0,size,bmp,width,height,err);
   if (create_canvas) CreateCanvas(x,y);
};
//+------------------------------------------------------------------+
bool CPng::PNGLoad(const uchar &_png[],uint start,uint count,uint &image[],int &Width,int &Height,PNGLoadError &error) {
   Stream stream;
   ArrayCopy(stream.data,_png,0,start,count);
   stream.pos =0;
   stream.size=count;
//---
   error=PNGError_Unknown;
//--- first let’s check the flow
   if(!PNGSingnatureCheckup(stream)) {
      error=PNGError_BadStream;
      return(false);
   }
//---
   PNGInfo   header= {};
   bool        is_header=false;
   uint        length,crc,id;
   uchar       data[],prev[];
   uint        pal[];
//---
   for(int chunk=0; chunk>=0; chunk++) {
      //--- get chunk length
      length=uint(stream>>INT);
      //--- check the flow length
      if(stream.Avail()<(length+sizeof(id)+sizeof(crc))) {
         error=PNGError_BadStream;
         return(false);
      }
      //--- calculate CRC
      crc=CRC(stream.data,stream.pos,length+sizeof(id));
      //--- get ID
      id=uint(stream>>INT);
      //--- dismember the chunk
      switch(id) {
      // tRNS
      case 0x74524e53:
         //--- had to have a headline
         if(!is_header) {
            error=PNGError_BadStream;
            return(false);
         }
         //---
         for(int i=0,c=ArraySize(pal); i<c; i++)
            pal[i]=(pal[i]&0xFFFFFF)|(stream.data[stream.pos+i]<<24);
         //---
         stream.pos+=length;
         break;

      // PLTE
      case 0x504c5445:
         //--- had to have a headline
         if(!is_header) {
            error=PNGError_BadStream;
            return(false);
         }
         //---
         ArrayResize(pal,length/3);
         //---
         for(uint i=0,c=length/3; i<c; i++)
            pal[i]=0xFF000000+(stream.data[stream.pos+i*3+0]<<16)+(stream.data[stream.pos+i*3+1]<<8)+stream.data[stream.pos+i*3+2];
         //---
         stream.pos+=length;
         break;

      // IEND
      case 0x49454e44:
         //--- had to have a headline
         if(!is_header) {
            error=PNGError_BadStream;
            return(false);
         }
         //---
         {
            uchar result[];
            //uchar key[]={1,0,0,0};
            int res=CryptDecode(CRYPT_ARCH_ZIP,data,result,result);

            if(res==0)
               return(false);
            //---
            Width =int(header.width);
            Height=int(header.height);
            //---
            ArrayResize(image,Width*Height);
            ArrayResize(prev,Width);
            ArrayInitialize(prev,0);
            //---
            for(int y=0,offset=0; y<Height; y++) {
               uchar filter=result[offset++];

               int byte_width=0;
               switch(header.clr_type) {
               case 6:
                  byte_width=1;
               case 2:
                  byte_width+=3;
                  break;
               case 3:
                  byte_width=1;
                  break;
               }
               //---
               switch(filter) {
               case 1:
                  for(int i=0; i<(Width-1)*byte_width; i++)
                     result[offset+i+byte_width]+=result[offset+i];
                  break; // sub
               case 2:
                  for(int i=0; i<Width*byte_width; i++)
                     result[offset+i]+=prev[i];
                  break; // up
               case 3:
                  for(int i=0; i<byte_width; i++)
                     result[offset+i]=uchar((int)result[offset+i]+(int)prev[i]/2);
                  for(int i=byte_width; i<Width*byte_width; i++)
                     result[offset+i]=uchar((int)result[offset+i]+((int)result[offset+i-byte_width]+prev[i])/2);
                  break; // avg
               // paeth
               case 4:
                  for(int i=0; i<byte_width; i++)
                     result[offset+i]+=prev[i];
                  for(int i=byte_width; i<Width*byte_width; i++) {
                     int a, b, c, pa, pb, pc, p;
                     a = result[offset+i-byte_width];
                     c = prev[i-byte_width];
                     b = prev[i];
                     p = b - c;
                     pc = a - c;
                     pa = p < 0 ? -p : p;
                     pb = pc < 0 ? -pc : pc;
                     pc = (p + pc) < 0 ? -(p + pc) : p + pc;
                     if (pb < pa) {
                        pa = pb;
                        a = b;
                     }
                     if (pc < pa) a = c;
                     result[offset+i]=uchar(result[offset+i]+a);
                  }
                  break;
               default:
                  error=PNGError_Unsupported;
                  //return(false);
               }

               ArrayCopy(prev,result,0,offset,Width*byte_width);
               //---
               for(int x=0; x<Width; x++) {
                  uint clr;
                  //---
                  switch(header.clr_type) {
                  case 6:
                     clr=(result[offset++]<<16)
                         +(result[offset++]<< 8)
                         +(result[offset++]<< 0)
                         +(result[offset++]<<24);
                     break;
                  case 2:
                     clr=(result[offset++]<<16)
                         +(result[offset++]<< 8)
                         +(result[offset++]<< 0)
                         +0xFF000000;
                     break;
                  case 3:
                     clr=pal[result[offset]];
                     break;
                  default:
                     error=PNGError_Unsupported;
                     return(false);
                  }

                  image[y*Width+x]=clr;
               }
            }

            int file=FileOpen("1.bin",FILE_SHARE_READ|FILE_WRITE|FILE_BIN);
            FileWriteArray(file,image);
            FileClose(file);
         }
         //---
         stream.pos+=length;
         chunk=-2;
         break;
      // IHDR
      case 0x49484452:
         //--- note that the title was met
         is_header=true;
         //--- read the title
         header.width      =stream>>INT;
         header.height     =stream>>INT;
         header.bit_depth  =stream>>BYTE;
         header.clr_type   =stream>>BYTE;
         header.compression=stream>>BYTE;
         header.filter     =stream>>BYTE;
         header.interlace  =stream>>BYTE;
         //--- header should be first, width and height cannot be zero
         if(chunk!=0 || header.width==0 || header.height==0) {
            error=PNGError_BadStream;
            return(false);
         }
         //---
         if(header.bit_depth!=8 || (header.clr_type!=2 && header.clr_type!=6) || header.filter!=0 || header.compression!=0 || header.interlace!=0) {
            error=PNGError_Unsupported;
            return(false);
         }
         //---
         break;
      // IDAT
      case 0x49444154:
         ArrayCopy(data,stream.data,ArraySize(data),stream.pos,length);
         stream.pos+=length;
         break;

      default:
         stream.pos+=length;
         break;
      }
      //--- let’s check CRC
      if(crc!=stream>>INT) {
         error=PNGError_BadStream;
         return(false);
      }
   }
//---
   return(true);
}
//+------------------------------------------------------------------+
bool CPng::PNGSingnatureCheckup(Stream &stream) {
//--- сигнатура PNG
   const long sign=((((((((((((long(137<<8)+80)<<8)+78)<<8)+71)<<8)+13)<<8)+10)<<8)+26)<<8)+10;
//--- проверим сигнатуру
   return(stream>>LONG==sign);
}
//+------------------------------------------------------------------+
uint CPng::CRCUpdate(uint crc,uchar &array[],uint start,uint count) {
   struct SCRCTable {
      uint              data[256];
                     SCRCTable() {
         uint c;

         for(uint n=0; n<256; n++) {
            c=n;
            c=((c&1)!=0)?0xedb88320^(c>>1):c>>1;
            c=((c&1)!=0)?0xedb88320^(c>>1):c>>1;
            c=((c&1)!=0)?0xedb88320^(c>>1):c>>1;
            c=((c&1)!=0)?0xedb88320^(c>>1):c>>1;
            c=((c&1)!=0)?0xedb88320^(c>>1):c>>1;
            c=((c&1)!=0)?0xedb88320^(c>>1):c>>1;
            c=((c&1)!=0)?0xedb88320^(c>>1):c>>1;
            c=((c&1)!=0)?0xedb88320^(c>>1):c>>1;
            //---
            data[n]=c;
         }
      }
      uint              operator[](int n) {
         return(data[n]);
      }
   };
//---
   static SCRCTable table;
//---
   if(ArraySize(array)<int(start+count))
      return(0);
//---
   for(uint n=0; n<count; n++,start++)
      crc=table[(crc^array[start])&0xff]^(crc>>8);
//---
   return crc;
}
//+------------------------------------------------------------------+
uint CPng::CRC(uchar &array[],uint start,uint count) {
   return(CRCUpdate(0xFFFFFFFF,array,start,count)^0xFFFFFFFF);
}
//+------------------------------------------------------------------+
void CPng::Resize(double NewWidth) {
   if(NewWidth==0) NewWidth=1;
   double k=NewWidth/width; // less than one
   double k2=k*k;
   double kk=width/NewWidth;  // more than one
   double w1=(double)width*k;
   _width=_ceil(w1);
   double h1=(double)height*k;
   _height=_ceil(h1);
   int ArrSize=_width*_height;
   ArrayResize(_bmp,ArrSize);
   int pos=0;
   double y0=0,x0,y1=kk,x1;
   int SizeArr = width*height;
   for(int y=0; y<_height; y++,y0=y1,y1+=kk) {
      x0=0;
      x1=kk;
      for(int x=0; x<_width; x++,x0=x1,x1+=kk,pos++) {
         int xs=(int)x0;
         int xf=(int)x1;
         int ys=(int)y0;
         int yf=(int)y1;
         double r=0,g=0,b=0,p=0;
         int pos2=ys*(int)width+xs;
         for(int Y1=ys; Y1<=yf; Y1++,pos2+=(int)width) {
            double dx,dy;
            int pos1=pos2;
            if(Y1==ys) {
               dy=ys+1-y0;
               if(ys==yf) dy=dy-1+y1-yf;
            } else if(Y1==yf) dy=y1-yf;
            else dy=1;
            for(int X1=xs; X1<=xf; X1++,pos1++) {
               if(pos1<SizeArr) {
                  if(bmp[pos1]!=0) {
                     col.clr=bmp[pos1];
                     if(X1==xs) {
                        dx=xs+1-x0;
                        if(xs==xf) dx=dx-1+x1-xf;
                     } else if(X1==xf) dx=x1-xf;
                     else dx=1;
                     dx=dx*dy;
                     r+=(double)col.argb[2]*dx;
                     g+=(double)col.argb[1]*dx;
                     b+=(double)col.argb[0]*dx;
                     p+=(double)col.argb[3]*dx;
                  }
               } else break;
            }
         }
         col.argb[0]=uchar(b*k2);
         col.argb[1]=uchar(g*k2);
         col.argb[2]=uchar(r*k2);
         col.argb[3]=uchar(p*k2);
         _bmp[pos]=col.clr;
      }
   }
}
//+------------------------------------------------------------------+
bool CPng::CreateCanvas(const int x, const int y) {
   if (width<1 || height<1) return false;
   if (CanvName == NULL) CanvName="Image"+string(GetTickCount()+MathRand());
   if(!C.CreateBitmapLabel(0,0,CanvName,x,y,width,height,COLOR_FORMAT_ARGB_NORMALIZE)) { // create canvas with the size of the current window
      Print("Error creating canvas: ",GetLastError());
      return false;
   }
   ArrayCopy(C.m_pixels, bmp);
   C.Update();
   form_Canvas = true;
   return true;
}
//+------------------------------------------------------------------+
bool CPng::_CreateCanvas(const int x, const int y) {
   if (_width<1 || _height<1) return false;
   if (_CanvName == NULL) _CanvName="Image"+string(GetTickCount()+MathRand());
   if(!_C.CreateBitmapLabel(0,0,_CanvName,x,y,_width,_height,COLOR_FORMAT_ARGB_NORMALIZE)) {// create canvas with the size of the current window
      Print("Error creating canvas: ",GetLastError());
      return false;
   }
   ArrayCopy(_C.m_pixels, _bmp);
   _C.Update();
   _form_Canvas = true;
   return true;
}
//+------------------------------------------------------------------+
bool CPng::MoveCanvas(const int x,const int y) {
   if(ObjectSetInteger(C.m_chart_id,C.m_objname,OBJPROP_XDISTANCE,x) && ObjectSetInteger(C.m_chart_id,C.m_objname,OBJPROP_YDISTANCE,y))  { C.Update(); return(true);}
   else return(false);
}
//+------------------------------------------------------------------+
bool CPng::_MoveCanvas(const int x,const int y) {
   if(ObjectSetInteger(_C.m_chart_id,_C.m_objname,OBJPROP_XDISTANCE,x) && ObjectSetInteger(_C.m_chart_id,_C.m_objname,OBJPROP_YDISTANCE,y))  { _C.Update(); return(true);}
   else return(false);
}
//+------------------------------------------------------------------+
