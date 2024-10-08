//+------------------------------------------------------------------+
//|                                                  C_Wallpaper.mqh |
//|                                                      Daniel Jose |
//+------------------------------------------------------------------+
#property copyright "Daniel Jose"
#property strict 
//+------------------------------------------------------------------+
class C_WallPaper
{
	protected:
		enum eErr {FILE_NOT_FOUND, FAILED_READ, FAILED_ALLOC, FAILED_CREATE};
//+------------------------------------------------------------------+
	private	:
		uint		m_Pixels[],
					m_BMP[],
					m_Width,
					m_Height,
					m_MemWidthBMP,
					m_MemHeightBMP,
					m_MemSizeArr;
		string	m_szObjName,
					m_szRcName;
		ulong		m_Id;
//+------------------------------------------------------------------+
		bool	MsgError(const eErr err, int fp = 0)
			{
				string sz0;
				switch(err)
				{
					case FILE_NOT_FOUND  :
						sz0 = "Imagen No encontrada.";
						break;
					case FAILED_READ     :
						sz0 = "Error de lectura.";
						break;
					case FAILED_ALLOC    :
						sz0 = "Falta de memoria.";
						break;
					case FAILED_CREATE   :
						sz0 = "Falla critica de recurso interno.";
						break;
				};
				MessageBox(sz0, "AVISO", MB_OK);
				if(fp > 0) FileClose(fp);

				return false;
			}
//+------------------------------------------------------------------+
		bool	LoadBitmap(const string szFileName, uint &data[], int &width, int &height)
			{
				struct BitmapHeader
				{
					ushort	type;
					uint		size,
								reserv,
								offbits,
								imgSSize,
								imgWidth,
								imgHeight;
					ushort	imgPlanes,
								imgBitCount;
					uint		imgCompression,
								imgSizeImage,
								imgXPelsPerMeter,
								imgYPelsPerMeter,
								imgClrUsed,
								imgClrImportant;
				} Header;
				int fp;
				bool noAlpha, noFlip;
				uint imgSize;

				if((fp = FileOpen(szFileName + ".bmp", FILE_READ | FILE_BIN)) == INVALID_HANDLE) return MsgError(FILE_NOT_FOUND);
				if(FileReadStruct(fp, Header) != sizeof(Header)) return MsgError(FAILED_READ, fp);
				width = (int)Header.imgWidth;
				height = (int)Header.imgHeight;
				if(noFlip = (height < 0)) height = -height;
				if(Header.imgBitCount == 32)
				{
					uint tmp[];
					
					noAlpha = true;
					imgSize = FileReadArray(fp, data);
					if(!noFlip) for(int c0 = 0; c0 < height / 2; c0++)
					{
						ArrayCopy(tmp, data, 0, width * c0, width);
						ArrayCopy(data, data, width * c0, width * (height - c0 - 1), width);
						ArrayCopy(data, tmp, width * (height - c0 - 1), 0, width);
					}
					for(int c0 = 0; (c0 < (int)imgSize && noAlpha); c0++) if(uchar(data[c0] >> 24) != 0) noAlpha = false;
					if(noAlpha) for( int c0 = 0; c0 < (int)imgSize; c0++) data[c0] |= 0xFF000000;
				} else
				{
					int byteWidth;
					uchar tmp2[];
					
					byteWidth = width * 3;
					byteWidth = (byteWidth + 3) & ~3;
					if(ArrayResize(data, width * height) != -1) for( int c0 = 0; c0 < height; c0++)
					{
						if(FileReadArray(fp, tmp2, 0, byteWidth) != byteWidth) return MsgError(FAILED_READ, fp);
						else for(int j = 0, k = 0, p = width * (height - c0 - 1); j < width; j++, k+=3, p++)
								data[p] = 0xFF000000 | (tmp2[k+2] << 16) | (tmp2[k + 1] << 8) | tmp2[k];
					}
				}
				FileClose(fp);
				
				return true;
			}
//+------------------------------------------------------------------+
	public:
//+------------------------------------------------------------------+
		~C_WallPaper() { Destroy(); }
//+------------------------------------------------------------------+
		bool Init(const string szName, const char cView = 100)
			{
				double dValue = ((cView > 100 ? 100 : (cView < 0 ? 0 : cView)) * 2.55) / 255.0;
			
				m_Id = ChartID();
				if(!LoadBitmap(szName, m_BMP, m_MemWidthBMP, m_MemHeightBMP)) return false;
				Destroy();
				m_Height = m_MemHeightBMP;
				m_Width = m_MemWidthBMP;
				if(ArrayResize(m_Pixels, (m_MemSizeArr = m_Height * m_Width)) < 0) return MsgError(FAILED_ALLOC);
				m_szRcName = "::" + szName + (string)(GetTickCount() + MathRand());
				if(!ResourceCreate(m_szRcName, m_Pixels, m_Width, m_Height, 0, 0, 0, COLOR_FORMAT_ARGB_NORMALIZE)) return MsgError(FAILED_CREATE);
				if(!ObjectCreate(m_Id, (m_szObjName = szName), OBJ_BITMAP_LABEL, 0, 0, 0)) return MsgError(FAILED_CREATE);
				ObjectSetInteger(m_Id, m_szObjName, OBJPROP_XDISTANCE, 0);
				ObjectSetInteger(m_Id, m_szObjName, OBJPROP_YDISTANCE, 0);
				ObjectSetString(m_Id, m_szObjName, OBJPROP_BMPFILE, m_szRcName);
				ObjectSetInteger(m_Id, m_szObjName, OBJPROP_BACK, true);
				for(uint i = 0; i < m_MemSizeArr; i++) m_BMP[i] = (uchar(double(m_BMP[i] >> 24) * dValue) << 24) | m_BMP[i] & 0x00FFFFFF;
 
				return true;
			}
//+------------------------------------------------------------------+
		void Destroy(void)
			{
				ArrayFree(m_Pixels);
				if(m_szObjName != NULL)
				{
					ObjectDelete(m_Id, m_szObjName);
					m_szObjName = NULL;
				}
				if(m_szRcName != NULL)
				{
					ResourceFree(m_szRcName);
					m_szRcName = NULL;
				}
				ChartRedraw();
			}
//+------------------------------------------------------------------+
		void	Resize(void)
			{
				m_Height =(uint) ChartGetInteger(m_Id, CHART_HEIGHT_IN_PIXELS);
				m_Width = (uint) ChartGetInteger(m_Id, CHART_WIDTH_IN_PIXELS);
				double fx = (m_Width * 1.0) / m_MemWidthBMP;
				double fy = (m_Height * 1.0) / m_MemHeightBMP;
				uint pyi, pyf, pxi, pxf, tmp;

				ArrayResize(m_Pixels, m_Height * m_Width);
				ArrayInitialize(m_Pixels, 0x00FFFFFF);
				for(uint cy = 0, y = 0; cy < m_MemHeightBMP; cy++, y += m_MemWidthBMP)
				{
					pyf = (uint)(fy * cy) * m_Width;
					tmp = pyi = (uint)(fy * (cy - 1)) * m_Width;
					for(uint x = 0; x < m_MemWidthBMP; x++)
					{
						pxf = (uint)(fx * x);
						pxi = (uint)(fx * (x - 1));
						m_Pixels[pxf + pyf] = m_BMP[x + y];
						for(pxi++; pxi < pxf; pxi++) m_Pixels[pxi + pyf] = m_BMP[x + y];
					}
					for(pyi += m_Width; pyi < pyf; pyi += m_Width) for(int x = 0; x < (int)m_Width; x++)
						m_Pixels[x + pyi] = m_Pixels[x + tmp];
				}
				if(ResourceCreate(m_szRcName, m_Pixels, m_Width, m_Height, 0, 0, 0, COLOR_FORMAT_ARGB_NORMALIZE)) ChartRedraw();
			}
//+------------------------------------------------------------------+
};
//+------------------------------------------------------------------+
