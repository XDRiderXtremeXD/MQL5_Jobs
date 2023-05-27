<chart>
id=132714417182518190
symbol=USDJPY
description=US Dollar vs Japanese Yen
period_type=1
period_size=4
digits=3
tick_size=0.000000
position_time=1664481600
scale_fix=0
scale_fixed_min=136.090000
scale_fixed_max=152.150000
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=4
mode=1
fore=0
grid=0
volume=0
scroll=1
shift=1
shift_size=20.251177
fixed_pos=0.000000
ticker=1
ohlc=0
one_click=0
one_click_btn=1
bidline=1
askline=1
lastline=0
days=1
descriptions=1
tradelines=1
tradehistory=0
window_left=0
window_top=0
window_right=1055
window_bottom=979
window_type=3
floating=0
floating_left=0
floating_top=0
floating_right=0
floating_bottom=0
floating_type=1
floating_toolbar=1
floating_tbstate=
background_color=0
foreground_color=16777215
barup_color=65280
bardown_color=255
bullcandle_color=32768
bearcandle_color=17919
chartline_color=65535
volumes_color=3329330
grid_color=10061943
bidline_color=10061943
askline_color=255
lastline_color=49152
stops_color=255
windows_total=1

<expert>
name=EXPERTO CONTROL v3
path=Experts\EXPERTO CONTROL v3.ex5
expertmode=1
<inputs>
Capital_Base=2000
Porcentaje_Perdida=2
S1=-----------------------   CONFIGURACION BOTONES  ---------------------
CORNER_BOTON=0
Boton_Desplazamiento_X=5
Boton_Desplazamiento_Y=27
SizeTexto=10
Espacio=1
S4=-----------------------   CONFIGURACION TRADES  ---------------------
Conteo_Operaciones=0
Contar_Swap=true
Contar_Comission=true
MagicNumber=22222
Maxima_Ganancia=100
Maxima_Perdida=100
</inputs>
</expert>

<window>
height=137.033298
objects=109

<indicator>
name=Main
path=
apply=1
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=0.000000
scale_fix_max=0
scale_fix_max_val=0.000000
expertmode=0
fixed_height=-1
</indicator>

<indicator>
name=Moving Average
path=
apply=1
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.703776
scale_fix_min=0
scale_fix_min_val=0.684836
scale_fix_max=0
scale_fix_max_val=0.722717
expertmode=0
fixed_height=-1

<graph>
name=
draw=129
style=0
width=2
color=16776960
</graph>
period=50
method=0
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\Patrones.ex5
apply=0
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=0.000000
scale_fix_max=0
scale_fix_max_val=0.000000
expertmode=0
fixed_height=-1

<graph>
name=
draw=3
style=0
width=1
arrow=170
color=42495
</graph>

<graph>
name=
draw=3
style=0
width=1
arrow=115
color=16748574
</graph>

<graph>
name=
draw=3
style=0
width=1
arrow=104
color=8388736
</graph>

<graph>
name=
draw=3
style=0
width=1
arrow=170
color=42495
</graph>
<inputs>
S8====  CONFIGURACION TREND FORCE =======================================================================================
FiltroTrend=true
MayorFilter=0.5
trendPeriod=3
TriggerUp=0.4
TriggerDown=-0.4
S8_====  CONFIGURACION =======================================================================================
TransparienciaDePatronesSinRSIoEST=false
COLORTRANSPARIENCIA=16777215
VerResSop3=false
K_Estocastico=5
D_Estocastico=3
Ralentizacion_Estocastico=3
RSI_Period=14
UseExtraDigit=false
Show_Alert=true
Display_ShootStar_2=false
Show_ShootStar_Alert_2=false
Display_ShootStar_3=false
Show_ShootStar_Alert_3=false
Display_ShootStar_4=false
Show_ShootStar_Alert_4=false
Color_ShootStar=9639167
Display_Hammer_2=false
Show_Hammer_Alert_2=false
Display_Hammer_3=false
Show_Hammer_Alert_3=false
Display_Hammer_4=false
Show_Hammer_Alert_4=false
Color_Hammer=16711680
Display_Doji=false
Show_Doji_Alert=false
Color_Doji=8388352
Display_Stars=false
Show_Stars_Alert=false
Star_Body_Length=5
Color_Star=16776960
Display_Dark_Cloud_Cover=false
Show_DarkCC_Alert=false
Color_DarkCC=2763429
Display_Piercing_Line=false
Show_Piercing_Line_Alert=false
Color_Piercing_Line=16711680
Display_Bearish_Engulfing=false
Show_Bearish_Engulfing_Alert=false
Color_Bearish_Engulfing=255
Display_Bullish_Engulfing=false
Show_Bullish_Engulfing_Alert=false
Color_Bullish_Engulfing=16711680
VelasOpuestasEnVolumen=true
VelasOpuestasEnVolumen_Alert=false
VelasOpuestasEnVolumenx2=true
VelasOpuestasEnVolumenx2_Alert=false
VelasOpuestasEnVolumenConMartillo=true
VelasOpuestasEnVolumenConMartillo_Alert=false
VelasRSI=true
VelasRSI_Alert=false
VelasEST=false
VelasEST_Alert=false
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\IndicatorPersonalized.ex5
apply=0
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=0.000000
scale_fix_max=0
scale_fix_max_val=0.000000
expertmode=0
fixed_height=-1

<graph>
name=PTL trend candles
draw=17
style=0
width=1
arrow=251
color=16748574,3937500
</graph>

<graph>
name=PTL slow line
draw=1
style=2
width=1
arrow=251
color=16748574
</graph>

<graph>
name=PTL fast line
draw=1
style=2
width=1
arrow=251
color=3937500
</graph>

<graph>
name=PTL trend start
draw=12
style=0
width=2
arrow=159
color=16748574,3937500
</graph>
<inputs>
inpFastLength=10
inpSlowLength=30
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\Examples\ZigzagColor.ex5
apply=0
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=0.000000
scale_fix_max=0
scale_fix_max_val=0.000000
expertmode=0
fixed_height=-1

<graph>
name=ZigzagColor
draw=15
style=0
width=1
arrow=251
color=16748574,255
</graph>
<inputs>
InpDepth=12
InpDeviation=5
InpBackstep=3
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\INDICADOR PATRONES PRO\PROBANDO INDICADOR.ex5
apply=0
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=0.000000
scale_fix_max=0
scale_fix_max_val=0.000000
expertmode=0
fixed_height=-1

<graph>
name=DN Rebote
draw=3
style=0
width=2
arrow=234
color=16711935
</graph>

<graph>
name=UP Rebote
draw=3
style=0
width=2
arrow=233
color=16711935
</graph>
<inputs>
Settings_Condiciones_Patron=-----------------------Settings CONDICIONES PATRON-----------------------
VelasEvaluadas=2000
Testeado=0
Repintado=false
Tolerancia_Puntos_Flecha=30
Espera=8
EsperarConfirmacion=8
Settings_Horario=-----------------------Settings HORARIO-----------------------
Hora_Inicio=14
Hora_Final=8
Domingo=true
Lunes=true
Martes=true
Miercoles=true
Jueves=true
Viernes=true
Settings_Alerts=-----------------------Settings ALERTAS-----------------------
Activar_Alerta=false
Activar_Alerta_Confirmacion=false
Audio_Alerta_Confirmacion=alert2
Activar_Alerta_Confirmacion_Tendencia=true
AlertPC=true
AlertMovil=true
AlertMail=false
S1__=-----------------------   Configuracion SOP RES---------------------
Ver_Sop_Res=false
BackLimit=200
S111__=-----------------------   Configuracion TREND FORCE--------------------
trendPeriod=8
TriggerUp=0.4
TriggerDown=-0.4
pus1=/////////////////////////////////////////////////
zone_show_weak=true
zone_show_untested=true
zone_show_turncoat=true
zone_fuzzfactor=0.75
SeparacionTexto=10
Conector=false
S12_============================================= CONFIGURACION TREND COLOR ============================================
inpFastLength=7
inpSlowLength=15
Tolerancia_Personalized=0
S13_============================================= CONFIGURACION TREND COLOR PRINCIPAL ============================================
Habilitar_Trend_Filter=true
inpFastLengthP=20
inpSlowLengthP=30
S112__============================================= CONFIGURACION TRENDFORCE PRINCIPAL ============================================
Habilitar_TrendForce_Filter=true
trendPeriodP=2
TriggerUpP=0.3
TriggerDownP=-0.3
S113__===== CONFIGURACION PERIODOS ============================================
M5=false
M6=false
M10=false
M12=false
M15=true
M20=true
M30=true
H1=true
H2=true
H3=true
H4=true
</inputs>
</indicator>
<object>
type=11
name=H4 Gann Grid 9534
date1=1634011200
date2=1634011200
value1=1.154940
ganndir=0
pipsperbar=1.000000
</object>

<object>
type=109
name=2021.11.29 17:00 Ventas de Viviendas Pendientes m/m
hidden=1
descr=Ventas de Viviendas Pendientes m/m 7.5% / -3.0%
color=15658671
selectable=0
date1=1638205200
</object>

<object>
type=109
name=2021.11.29 17:00 Ventas de Viviendas Pendientes a/a
hidden=1
descr=Ventas de Viviendas Pendientes a/a -1.4% / -17.0%
color=15658671
selectable=0
date1=1638205200
</object>

<object>
type=109
name=2021.11.29 17:00 Índice de Ventas de Viviendas Pendientes
hidden=1
descr=Índice de Ventas de Viviendas Pendientes
color=16119285
selectable=0
date1=1638205200
</object>

<object>
type=109
name=2021.11.29 17:30 Índice Manufacturero de la Fed de Dallas
hidden=1
descr=Índice Manufacturero de la Fed de Dallas 11.8 / 9.6
color=15658671
selectable=0
date1=1638207000
</object>

<object>
type=109
name=2021.11.29 18:30 Subasta de Letras del Tesoro a 3 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 3 Meses
color=16119285
selectable=0
date1=1638210600
</object>

<object>
type=109
name=2021.11.29 18:30 Subasta de Letras del Tesoro a 6 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 6 Meses
color=16119285
selectable=0
date1=1638210600
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de CHF de la CF
hidden=1
descr=Posiciones Netas Especulativas de CHF de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Cobre de la 
hidden=1
descr=Posiciones Netas Especulativas de Cobre de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Plata de la 
hidden=1
descr=Posiciones Netas Especulativas de Plata de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Oro de la CF
hidden=1
descr=Posiciones Netas Especulativas de Oro de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Crudo de la 
hidden=1
descr=Posiciones Netas Especulativas de Crudo de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Aluminio de 
hidden=1
descr=Posiciones Netas Especulativas de Aluminio de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Maíz de la C
hidden=1
descr=Posiciones Netas Especulativas de Maíz de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Gas Natural 
hidden=1
descr=Posiciones Netas Especulativas de Gas Natural de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Soja de la C
hidden=1
descr=Posiciones Netas Especulativas de Soja de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Trigo de la 
hidden=1
descr=Posiciones Netas Especulativas de Trigo de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.29 22:30 Posiciones Netas Especulativas de Nasdaq 100 d
hidden=1
descr=Posiciones Netas Especulativas de Nasdaq 100 de la CFTC
color=16119285
selectable=0
date1=1638225000
</object>

<object>
type=109
name=2021.11.30 10:00 Barómetro Económico del Instituto KOF
hidden=1
descr=Barómetro Económico del Instituto KOF
color=16119285
selectable=0
date1=1638266400
</object>

<object>
type=109
name=2021.11.30 16:00 Índice de Precios de la Vivienda m/m
hidden=1
descr=Índice de Precios de la Vivienda m/m
color=16119285
selectable=0
date1=1638288000
</object>

<object>
type=109
name=2021.11.30 16:00 Índice de Precios Inmobiliarios a/a
hidden=1
descr=Índice de Precios Inmobiliarios a/a
color=16119285
selectable=0
date1=1638288000
</object>

<object>
type=109
name=2021.11.30 16:00 Índice de Precios de Vivienda (HPI)
hidden=1
descr=Índice de Precios de Vivienda (HPI)
color=16119285
selectable=0
date1=1638288000
</object>

<object>
type=109
name=2021.11.30 16:00 Índice Compuesto de Precios de Viviendas S&P/C
hidden=1
descr=Índice Compuesto de Precios de Viviendas S&P/CS-20 s.a. m/m
color=16119285
selectable=0
date1=1638288000
</object>

<object>
type=109
name=2021.11.30 16:45 Barómetro de los negocios de Chicago de MNI
hidden=1
descr=Barómetro de los negocios de Chicago de MNI
color=16119285
selectable=0
date1=1638290700
</object>

<object>
type=109
name=2021.11.30 17:00 Índice de Confianza del Consumidor de la CB
hidden=1
descr=Índice de Confianza del Consumidor de la CB
color=16119285
selectable=0
date1=1638291600
</object>

<object>
type=109
name=2021.11.30 17:30 Ingresos por Servicios de la Fed de Dallas
hidden=1
descr=Ingresos por Servicios de la Fed de Dallas
color=16119285
selectable=0
date1=1638293400
</object>

<object>
type=109
name=2021.11.30 17:30 Actividad Comercial del Sector Servicios de la
hidden=1
descr=Actividad Comercial del Sector Servicios de la Fed de Dallas
color=16119285
selectable=0
date1=1638293400
</object>

<object>
type=109
name=2021.11.30 18:30 Subasta de Letras del Tesoro a 52 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 52 Semanas
color=16119285
selectable=0
date1=1638297000
</object>

<object>
type=109
name=2021.12.01 09:30 IPC m/m
hidden=1
descr=IPC m/m
color=16119285
selectable=0
date1=1638351000
</object>

<object>
type=109
name=2021.12.01 09:30 IPC a/a
hidden=1
descr=IPC a/a
color=16119285
selectable=0
date1=1638351000
</object>

<object>
type=109
name=2021.12.01 10:30 PMI de la Manufactura de procure.ch
hidden=1
descr=PMI de la Manufactura de procure.ch
color=16119285
selectable=0
date1=1638354600
</object>

<object>
type=109
name=2021.12.01 15:15 Cambio del Empleo no Agrícola ADP
hidden=1
descr=Cambio del Empleo no Agrícola ADP
color=16119285
selectable=0
date1=1638371700
</object>

<object>
type=109
name=2021.12.01 17:00 Gasto en Construcción m/m
hidden=1
descr=Gasto en Construcción m/m
color=16119285
selectable=0
date1=1638378000
</object>

<object>
type=109
name=2021.12.01 17:00 PMI manufacturero del ISM
hidden=1
descr=PMI manufacturero del ISM
color=16119285
selectable=0
date1=1638378000
</object>

<object>
type=109
name=2021.12.01 17:00 Índice de precios en el sector manufacturero d
hidden=1
descr=Índice de precios en el sector manufacturero de ISM
color=16119285
selectable=0
date1=1638378000
</object>

<object>
type=109
name=2021.12.01 17:00 ISM Empleo Manufacturero
hidden=1
descr=ISM Empleo Manufacturero
color=16119285
selectable=0
date1=1638378000
</object>

<object>
type=109
name=2021.12.01 17:00 ISM Nuevos Pedidos en la Industria Manufacture
hidden=1
descr=ISM Nuevos Pedidos en la Industria Manufacturera
color=16119285
selectable=0
date1=1638378000
</object>

<object>
type=109
name=2021.12.01 17:30 AIE Cambio en las Reservas de Crudo
hidden=1
descr=AIE Cambio en las Reservas de Crudo
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 AIE Cambio en las Reservas de Crudo en Cushing
hidden=1
descr=AIE Cambio en las Reservas de Crudo en Cushing
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 AIE Cambio en la Importación de Petróleo
hidden=1
descr=AIE Cambio en la Importación de Petróleo
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 AIE Cambio en la Producción de Combustible Des
hidden=1
descr=AIE Cambio en la Producción de Combustible Destilado
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 AIE Cambio en las Reservas de Combustible Dest
hidden=1
descr=AIE Cambio en las Reservas de Combustible Destilado
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 AIE Cambio en la Producción de Gasolina
hidden=1
descr=AIE Cambio en la Producción de Gasolina
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 AIE Cambio en las Reservas de Combustible para
hidden=1
descr=AIE Cambio en las Reservas de Combustible para Calefacción
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 AIE Cambios en las Reservas de Gasolina
hidden=1
descr=AIE Cambios en las Reservas de Gasolina
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 Cambio de Entradas Diarias de Petróleo Crudo d
hidden=1
descr=Cambio de Entradas Diarias de Petróleo Crudo de Refinería de la
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 17:30 Cambio en la Tasa de Utilización de las Refine
hidden=1
descr=Cambio en la Tasa de Utilización de las Refinerías de la EIA
color=16119285
selectable=0
date1=1638379800
</object>

<object>
type=109
name=2021.12.01 21:00 Libro Beige de la Fed
hidden=1
descr=Libro Beige de la Fed
color=16119285
selectable=0
date1=1638392400
</object>

<object>
type=109
name=2021.12.02 09:30 Ventas minoristas a/a
hidden=1
descr=Ventas minoristas a/a
color=16119285
selectable=0
date1=1638437400
</object>

<object>
type=109
name=2021.12.02 14:30 Número de Despidos de Challenger
hidden=1
descr=Número de Despidos de Challenger
color=16119285
selectable=0
date1=1638455400
</object>

<object>
type=109
name=2021.12.02 14:30 Número de Despidos de Challenger a/a
hidden=1
descr=Número de Despidos de Challenger a/a
color=16119285
selectable=0
date1=1638455400
</object>

<object>
type=109
name=2021.12.02 17:30 AIE Cambios en la Reserva de Gas Natural
hidden=1
descr=AIE Cambios en la Reserva de Gas Natural
color=16119285
selectable=0
date1=1638466200
</object>

<object>
type=109
name=2021.12.02 18:30 Subasta de Letras del Tesoro a 4 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 4 Semanas
color=16119285
selectable=0
date1=1638469800
</object>

<object>
type=109
name=2021.12.02 18:30 Subasta de Letras del Tesoro a 8 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 8 Semanas
color=16119285
selectable=0
date1=1638469800
</object>

<object>
type=109
name=2021.12.03 15:30 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 Cambio en el empleo no agrícola
hidden=1
descr=Cambio en el empleo no agrícola
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 Tasa de Participación
hidden=1
descr=Tasa de Participación
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 Ganancias Promedio por Hora m/m
hidden=1
descr=Ganancias Promedio por Hora m/m
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 Ganancias Promedio por Hora a/a
hidden=1
descr=Ganancias Promedio por Hora a/a
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 Promedio de Horas Semanales
hidden=1
descr=Promedio de Horas Semanales
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 Nóminas Gubernamentales
hidden=1
descr=Nóminas Gubernamentales
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 Nóminas no Agrícolas Privadas
hidden=1
descr=Nóminas no Agrícolas Privadas
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 U6 Tasa de Desempleo
hidden=1
descr=U6 Tasa de Desempleo
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 15:30 Cambio en el Empleo Manufacturero
hidden=1
descr=Cambio en el Empleo Manufacturero
color=16119285
selectable=0
date1=1638545400
</object>

<object>
type=109
name=2021.12.03 17:00 Pedidos Industriales m/m
hidden=1
descr=Pedidos Industriales m/m
color=16119285
selectable=0
date1=1638550800
</object>

<object>
type=109
name=2021.12.03 17:00 Pedidos Industriales excl. Transporte m/m
hidden=1
descr=Pedidos Industriales excl. Transporte m/m
color=16119285
selectable=0
date1=1638550800
</object>

<object>
type=109
name=2021.12.03 17:00 Envíos de Bienes de Capital no Relacionados co
hidden=1
descr=Envíos de Bienes de Capital no Relacionados con la Defensa excl
color=16119285
selectable=0
date1=1638550800
</object>

<object>
type=109
name=2021.12.03 17:00 ISM no Manufacturero del PMI
hidden=1
descr=ISM no Manufacturero del PMI
color=16119285
selectable=0
date1=1638550800
</object>

<object>
type=109
name=2021.12.03 17:00 ISM Empleo en la Industria no Manufacturera
hidden=1
descr=ISM Empleo en la Industria no Manufacturera
color=16119285
selectable=0
date1=1638550800
</object>

<object>
type=109
name=2021.12.03 17:00 ISM Nuevos Pedidos en la Industria no Manufact
hidden=1
descr=ISM Nuevos Pedidos en la Industria no Manufacturera
color=16119285
selectable=0
date1=1638550800
</object>

<object>
type=109
name=2021.12.03 17:00 Índice de Precios de la Industria no Manufactu
hidden=1
descr=Índice de Precios de la Industria no Manufacturera de ISM
color=16119285
selectable=0
date1=1638550800
</object>

<object>
type=109
name=2021.12.03 17:00 ISM Actividad Comercial en la Industria no Man
hidden=1
descr=ISM Actividad Comercial en la Industria no Manufacturera
color=16119285
selectable=0
date1=1638550800
</object>

<object>
type=109
name=2021.12.03 20:00 Recuento de Plataformas Petrolíferas de EE.UU 
hidden=1
descr=Recuento de Plataformas Petrolíferas de EE.UU de Baker Hughes
color=16119285
selectable=0
date1=1638561600
</object>

<object>
type=109
name=2021.12.03 20:00 Recuento de plataformas petrolíferas en EE.UU.
hidden=1
descr=Recuento de plataformas petrolíferas en EE.UU. de Baker Hughes
color=16119285
selectable=0
date1=1638561600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de CHF de la CF
hidden=1
descr=Posiciones Netas Especulativas de CHF de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Cobre de la 
hidden=1
descr=Posiciones Netas Especulativas de Cobre de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Plata de la 
hidden=1
descr=Posiciones Netas Especulativas de Plata de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Oro de la CF
hidden=1
descr=Posiciones Netas Especulativas de Oro de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Crudo de la 
hidden=1
descr=Posiciones Netas Especulativas de Crudo de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Aluminio de 
hidden=1
descr=Posiciones Netas Especulativas de Aluminio de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Maíz de la C
hidden=1
descr=Posiciones Netas Especulativas de Maíz de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Gas Natural 
hidden=1
descr=Posiciones Netas Especulativas de Gas Natural de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Soja de la C
hidden=1
descr=Posiciones Netas Especulativas de Soja de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Trigo de la 
hidden=1
descr=Posiciones Netas Especulativas de Trigo de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.12.03 22:30 Posiciones Netas Especulativas de Nasdaq 100 d
hidden=1
descr=Posiciones Netas Especulativas de Nasdaq 100 de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=109
name=2021.11.29 22:00 Discurso del Miembro del FOMC, John Williams
hidden=1
descr=Discurso del Miembro del FOMC, John Williams
color=16119285
selectable=0
date1=1638223200
</object>

<object>
type=109
name=2021.11.29 22:05 Discurso del Presidente del Sistema de la Rese
hidden=1
descr=Discurso del Presidente del Sistema de la Reserva Federal, Jero
color=16119285
selectable=0
date1=1638223500
</object>

<object>
type=109
name=2021.11.30 00:05 Discurso de la Gobernadora de la Fed, Michelle
hidden=1
descr=Discurso de la Gobernadora de la Fed, Michelle Bowman
color=16119285
selectable=0
date1=1638230700
</object>

<object>
type=109
name=2021.11.30 17:00 Discurso del Presidente del Sistema de la Rese
hidden=1
descr=Discurso del Presidente del Sistema de la Reserva Federal, Jero
color=16119285
selectable=0
date1=1638291600
</object>

<object>
type=109
name=2021.11.30 17:30 Discurso del Miembro del FOMC, John Williams
hidden=1
descr=Discurso del Miembro del FOMC, John Williams
color=16119285
selectable=0
date1=1638293400
</object>

<object>
type=109
name=2021.11.30 20:00 Discurso del Vicepresidente de la Fed, Richard
hidden=1
descr=Discurso del Vicepresidente de la Fed, Richard Clarida
color=16119285
selectable=0
date1=1638302400
</object>

<object>
type=109
name=2021.12.01 16:45 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit
color=16119285
selectable=0
date1=1638377100
</object>

<object>
type=109
name=2021.12.02 15:30 Peticiones Iniciales del Subsidio de Desempleo
hidden=1
descr=Peticiones Iniciales del Subsidio de Desempleo
color=16119285
selectable=0
date1=1638459000
</object>

<object>
type=109
name=2021.12.02 15:30 Peticiones Continuas del Subsidio de Desempleo
hidden=1
descr=Peticiones Continuas del Subsidio de Desempleo
color=16119285
selectable=0
date1=1638459000
</object>

<object>
type=109
name=2021.12.02 15:30 Número Medio de Peticiones Iniciales del Subsi
hidden=1
descr=Número Medio de Peticiones Iniciales del Subsidio de Desempleo 
color=16119285
selectable=0
date1=1638459000
</object>

<object>
type=109
name=2021.12.02 18:00 Discurso de Randal Quarles, Gobernador de la F
hidden=1
descr=Discurso de Randal Quarles, Gobernador de la Fed
color=16119285
selectable=0
date1=1638468000
</object>

<object>
type=109
name=2021.12.03 16:45 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit
color=16119285
selectable=0
date1=1638549900
</object>

<object>
type=109
name=2021.12.03 16:45 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit
color=16119285
selectable=0
date1=1638549900
</object>

</window>
</chart>