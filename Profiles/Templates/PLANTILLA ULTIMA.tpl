<chart>
id=132714416411542255
symbol=NAS100
description=US Tech 100 Index
period_type=1
period_size=4
digits=1
tick_size=0.000000
position_time=1646798400
scale_fix=0
scale_fixed_min=12660.468144
scale_fixed_max=14156.906425
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=32
mode=1
fore=0
grid=0
volume=0
scroll=1
shift=1
shift_size=27.091964
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
window_top=605
window_right=1278
window_bottom=1210
window_type=1
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
windows_total=3

<window>
height=238.979769
objects=1859

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
TransparienciaDePatronesSinRSIoEST=true
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
path=Indicators\Mi Indicador Angelo Patrones.ex5
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
name=SELL
draw=3
style=0
width=2
arrow=234
color=16711935
</graph>

<graph>
name=BUY
draw=3
style=0
width=2
arrow=233
color=16711935
</graph>

<graph>
name=SELLCONFIRMACION
draw=3
style=0
width=2
arrow=234
color=-1
</graph>

<graph>
name=BUYCONFIRMACION
draw=3
style=0
width=2
arrow=233
color=-1
</graph>

<graph>
name=ENTRADA SELL
draw=3
style=0
width=2
arrow=233
color=16776960
</graph>

<graph>
name=ENTRADA BUY
draw=3
style=0
width=2
arrow=234
color=16776960
</graph>
<inputs>
TransparienciaDePatronesSinRSIoEST=false
STO_Price=2
Velas_Confirmacion=6
Hora_Inicio=8
Hora_Final=22
Nivel=0.1
S0=-----------------------   Configuracion Estocastico ---------------------
K_Periodo=5
D_Periodo=3
Slowing=3
Ma_Method_EST=0
S11=-----------------------   Configuracion RSI ---------------------
Filter_MA=true
Tolerancia_Puntos=0
Period_MA=50
Shift_MA=1
APP_MA=1
MODE_MA=0
S1=-----------------------   Configuracion Momentun ---------------------
Momentun_Periodo=7
Momentun_Applied_Price=1
S1_=-----------------------   Configuracion RSI---------------------
Condicion_Signal_Contrarias=true
RSI_Period=14
APP_RSI=1
S12_============================================= CONFIGURACION TREND ============================================
FiltroTrend=true
inpFastLength=3
inpSlowLength=7
EsperaMaxima=5
Settings_Alerts=***Settings_Alerts***
AlertPC=false
AlertMovil=false
AlertMail=false
</inputs>
</indicator>

<indicator>
name=Moving Average
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

<graph>
name=
draw=129
style=0
width=1
arrow=251
color=16777215
</graph>
period=50
method=0
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\INDICADOR PATRONES PRO\PATRONES PRO FINAL.ex5
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
name=SELL
draw=3
style=0
width=2
arrow=234
color=-1
</graph>

<graph>
name=BUY
draw=3
style=0
width=2
arrow=233
color=-1
</graph>

<graph>
name=SELL CONFIRMACION
draw=3
style=0
width=2
arrow=234
color=65535
</graph>

<graph>
name=BUY CONFIRMACION
draw=3
style=0
width=2
arrow=233
color=65535
</graph>

<graph>
name=
draw=0
style=0
width=1
arrow=251
color=
</graph>

<graph>
name=
draw=0
style=0
width=1
arrow=251
color=
</graph>

<graph>
name=
draw=0
style=0
width=1
color=
</graph>

<graph>
name=
draw=0
style=0
width=1
color=
</graph>
<inputs>
Espera=5
VelasEvaluadas=500
Testeado=0
Repintado=false
RepintadoFisher=true
Ver_Sop_Res_Historial=false
Hora_Inicio=8
Hora_Final=8
Tolerancia_Puntos_Flecha=30
S00=-----------------------   Configuracion Confirmaciones para Patrones ---------------------
Filter_Estocastico=true
Filter_MA=true
Filter_RSI=true
S0=-----------------------   Configuracion Estocastico ---------------------
K_Periodo=5
D_Periodo=3
Slowing=3
Ma_Method_EST=0
S11=-----------------------   Configuracion MA---------------------
Tolerancia_Puntos=0
Period_MA_SLOW=150
Period_MA=50
Shift_MA=0
APP_MA=1
MODE_MA=0
S1_=-----------------------   Configuracion RSI---------------------
RSI_Period=14
APP_RSI=1
Settings_Alerts=-----------------------Settings_Alerts-----------------------
Activar_Alerta_Confirmacion=true
Activar_Alerta=false
Audio_Alerta_Confirmacion=alert2
AlertPC=true
AlertMovil=false
AlertMail=false
S1__=-----------------------   Configuracion SOP RES---------------------
Ver_Sop_Res=true
BackLimit=3000
pus1=/////////////////////////////////////////////////
zone_show_weak=true
zone_show_untested=true
zone_show_turncoat=true
zone_fuzzfactor=0.75
SeparacionTexto=10
Conector=false
S12_============================================= CONFIGURACION TREND ============================================
FiltroTrend=true
PeriodoFisher=10
</inputs>
</indicator>
<object>
type=109
name=2021.11.01 00:30 Índice Manufacturero del AIG
hidden=1
descr=Índice Manufacturero del AIG
color=16119285
selectable=0
date1=1635726600
</object>

<object>
type=109
name=2021.11.01 01:00 PMI de la Manufactura del Commonwealth Bank
hidden=1
descr=PMI de la Manufactura del Commonwealth Bank 58.2 / 57.3
color=15658671
selectable=0
date1=1635728400
</object>

<object>
type=109
name=2021.11.01 03:30 Préstamos Hipotecarios m/m
hidden=1
descr=Préstamos Hipotecarios m/m -4.0% / -0.9%
color=13353215
selectable=0
date1=1635737400
</object>

<object>
type=109
name=2021.11.01 03:30 Préstamos de Inversión Inmobiliaria m/m
hidden=1
descr=Préstamos de Inversión Inmobiliaria m/m
color=16119285
selectable=0
date1=1635737400
</object>

<object>
type=109
name=2021.11.01 03:30 Anuncios de Empleo del ANZ m/m
hidden=1
descr=Anuncios de Empleo del ANZ m/m 6.2% / -0.2%
color=15658671
selectable=0
date1=1635737400
</object>

<object>
type=109
name=2021.11.01 08:30 Índice de Precios de Materias primas del RBA a
hidden=1
descr=Índice de Precios de Materias primas del RBA a/a
color=16119285
selectable=0
date1=1635755400
</object>

<object>
type=109
name=2021.11.01 16:45 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit
color=16119285
selectable=0
date1=1635785100
</object>

<object>
type=109
name=2021.11.01 17:00 Gasto en Construcción m/m
hidden=1
descr=Gasto en Construcción m/m
color=16119285
selectable=0
date1=1635786000
</object>

<object>
type=109
name=2021.11.01 17:00 PMI manufacturero del ISM
hidden=1
descr=PMI manufacturero del ISM
color=16119285
selectable=0
date1=1635786000
</object>

<object>
type=109
name=2021.11.01 17:00 Índice de precios en el sector manufacturero d
hidden=1
descr=Índice de precios en el sector manufacturero de ISM
color=16119285
selectable=0
date1=1635786000
</object>

<object>
type=109
name=2021.11.01 17:00 ISM Empleo Manufacturero
hidden=1
descr=ISM Empleo Manufacturero
color=16119285
selectable=0
date1=1635786000
</object>

<object>
type=109
name=2021.11.01 17:00 ISM Nuevos Pedidos en la Industria Manufacture
hidden=1
descr=ISM Nuevos Pedidos en la Industria Manufacturera
color=16119285
selectable=0
date1=1635786000
</object>

<object>
type=109
name=2021.11.01 18:30 Subasta de Letras del Tesoro a 3 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 3 Meses
color=16119285
selectable=0
date1=1635791400
</object>

<object>
type=109
name=2021.11.01 18:30 Subasta de Letras del Tesoro a 6 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 6 Meses
color=16119285
selectable=0
date1=1635791400
</object>

<object>
type=109
name=2021.11.02 06:30 Decisión del Banco de la Reserva de Australia 
hidden=1
descr=Decisión del Banco de la Reserva de Australia sobre la Tasa de 
color=16119285
selectable=0
date1=1635834600
</object>

<object>
type=109
name=2021.11.02 08:50 Discurso de Guy Debelle, Vicegobernador del RB
hidden=1
descr=Discurso de Guy Debelle, Vicegobernador del RBA
color=16119285
selectable=0
date1=1635843000
</object>

<object>
type=109
name=2021.11.02 18:30 Subasta de Letras del Tesoro a 52 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 52 Semanas
color=16119285
selectable=0
date1=1635877800
</object>

<object>
type=109
name=2021.11.03 00:30 Índice de Construcción del AIG
hidden=1
descr=Índice de Construcción del AIG
color=16119285
selectable=0
date1=1635899400
</object>

<object>
type=109
name=2021.11.03 01:00 PMI del Sector Servicios del Commonwealth Bank
hidden=1
descr=PMI del Sector Servicios del Commonwealth Bank
color=16119285
selectable=0
date1=1635901200
</object>

<object>
type=109
name=2021.11.03 01:00 PMI Compuesto del Commonwealth Bank
hidden=1
descr=PMI Compuesto del Commonwealth Bank
color=16119285
selectable=0
date1=1635901200
</object>

<object>
type=109
name=2021.11.03 03:30 Permisos de Construcción m/m
hidden=1
descr=Permisos de Construcción m/m
color=16119285
selectable=0
date1=1635910200
</object>

<object>
type=109
name=2021.11.03 03:30 Aprobaciones de Construcción de Viviendas Part
hidden=1
descr=Aprobaciones de Construcción de Viviendas Particulares m/m
color=16119285
selectable=0
date1=1635910200
</object>

<object>
type=109
name=2021.11.03 03:30 Pack de Gráficos del RBA
hidden=1
descr=Pack de Gráficos del RBA
color=16119285
selectable=0
date1=1635910200
</object>

<object>
type=109
name=2021.11.03 15:15 Cambio del Empleo no Agrícola ADP
hidden=1
descr=Cambio del Empleo no Agrícola ADP
color=16119285
selectable=0
date1=1635952500
</object>

<object>
type=109
name=2021.11.03 16:45 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit
color=16119285
selectable=0
date1=1635957900
</object>

<object>
type=109
name=2021.11.03 16:45 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit
color=16119285
selectable=0
date1=1635957900
</object>

<object>
type=109
name=2021.11.03 17:00 Pedidos Industriales m/m
hidden=1
descr=Pedidos Industriales m/m
color=16119285
selectable=0
date1=1635958800
</object>

<object>
type=109
name=2021.11.03 17:00 Pedidos Industriales excl. Transporte m/m
hidden=1
descr=Pedidos Industriales excl. Transporte m/m
color=16119285
selectable=0
date1=1635958800
</object>

<object>
type=109
name=2021.11.03 17:00 Envíos de Bienes de Capital no Relacionados co
hidden=1
descr=Envíos de Bienes de Capital no Relacionados con la Defensa excl
color=16119285
selectable=0
date1=1635958800
</object>

<object>
type=109
name=2021.11.03 17:00 ISM no Manufacturero del PMI
hidden=1
descr=ISM no Manufacturero del PMI
color=16119285
selectable=0
date1=1635958800
</object>

<object>
type=109
name=2021.11.03 17:00 ISM Empleo en la Industria no Manufacturera
hidden=1
descr=ISM Empleo en la Industria no Manufacturera
color=16119285
selectable=0
date1=1635958800
</object>

<object>
type=109
name=2021.11.03 17:00 ISM Nuevos Pedidos en la Industria no Manufact
hidden=1
descr=ISM Nuevos Pedidos en la Industria no Manufacturera
color=16119285
selectable=0
date1=1635958800
</object>

<object>
type=109
name=2021.11.03 17:00 Índice de Precios de la Industria no Manufactu
hidden=1
descr=Índice de Precios de la Industria no Manufacturera de ISM
color=16119285
selectable=0
date1=1635958800
</object>

<object>
type=109
name=2021.11.03 17:00 ISM Actividad Comercial en la Industria no Man
hidden=1
descr=ISM Actividad Comercial en la Industria no Manufacturera
color=16119285
selectable=0
date1=1635958800
</object>

<object>
type=109
name=2021.11.03 17:30 AIE Cambio en las Reservas de Crudo
hidden=1
descr=AIE Cambio en las Reservas de Crudo
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 AIE Cambio en las Reservas de Crudo en Cushing
hidden=1
descr=AIE Cambio en las Reservas de Crudo en Cushing
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 AIE Cambio en la Importación de Petróleo
hidden=1
descr=AIE Cambio en la Importación de Petróleo
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 AIE Cambio en la Producción de Combustible Des
hidden=1
descr=AIE Cambio en la Producción de Combustible Destilado
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 AIE Cambio en las Reservas de Combustible Dest
hidden=1
descr=AIE Cambio en las Reservas de Combustible Destilado
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 AIE Cambio en la Producción de Gasolina
hidden=1
descr=AIE Cambio en la Producción de Gasolina
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 AIE Cambio en las Reservas de Combustible para
hidden=1
descr=AIE Cambio en las Reservas de Combustible para Calefacción
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 AIE Cambios en las Reservas de Gasolina
hidden=1
descr=AIE Cambios en las Reservas de Gasolina
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 Cambio de Entradas Diarias de Petróleo Crudo d
hidden=1
descr=Cambio de Entradas Diarias de Petróleo Crudo de Refinería de la
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 17:30 Cambio en la Tasa de Utilización de las Refine
hidden=1
descr=Cambio en la Tasa de Utilización de las Refinerías de la EIA
color=16119285
selectable=0
date1=1635960600
</object>

<object>
type=109
name=2021.11.03 21:00 Declaración del CFMA
hidden=1
descr=Declaración del CFMA
color=16119285
selectable=0
date1=1635973200
</object>

<object>
type=109
name=2021.11.03 21:00 Decisión de la Tasa de Interés de la Reserva F
hidden=1
descr=Decisión de la Tasa de Interés de la Reserva Federal
color=16119285
selectable=0
date1=1635973200
</object>

<object>
type=109
name=2021.11.03 21:30 Conferencia de Prensa del FOMC
hidden=1
descr=Conferencia de Prensa del FOMC
color=16119285
selectable=0
date1=1635975000
</object>

<object>
type=109
name=2021.11.04 03:30 Exportaciones m/m
hidden=1
descr=Exportaciones m/m
color=16119285
selectable=0
date1=1635996600
</object>

<object>
type=109
name=2021.11.04 03:30 Importaciones m/m
hidden=1
descr=Importaciones m/m
color=16119285
selectable=0
date1=1635996600
</object>

<object>
type=109
name=2021.11.04 03:30 Balance Comercial
hidden=1
descr=Balance Comercial
color=16119285
selectable=0
date1=1635996600
</object>

<object>
type=109
name=2021.11.04 03:30 Ventas minoristas t/t
hidden=1
descr=Ventas minoristas t/t
color=16119285
selectable=0
date1=1635996600
</object>

<object>
type=109
name=2021.11.04 14:30 Número de Despidos de Challenger
hidden=1
descr=Número de Despidos de Challenger
color=16119285
selectable=0
date1=1636036200
</object>

<object>
type=109
name=2021.11.04 14:30 Número de Despidos de Challenger a/a
hidden=1
descr=Número de Despidos de Challenger a/a
color=16119285
selectable=0
date1=1636036200
</object>

<object>
type=109
name=2021.11.04 15:30 Balance Comercial
hidden=1
descr=Balance Comercial
color=16119285
selectable=0
date1=1636039800
</object>

<object>
type=109
name=2021.11.04 15:30 Exportaciones
hidden=1
descr=Exportaciones
color=16119285
selectable=0
date1=1636039800
</object>

<object>
type=109
name=2021.11.04 15:30 Importaciones
hidden=1
descr=Importaciones
color=16119285
selectable=0
date1=1636039800
</object>

<object>
type=109
name=2021.11.04 15:30 Productivdad no agraria t/t
hidden=1
descr=Productivdad no agraria t/t
color=16119285
selectable=0
date1=1636039800
</object>

<object>
type=109
name=2021.11.04 15:30 Costes Laborales Unitarios t/t
hidden=1
descr=Costes Laborales Unitarios t/t
color=16119285
selectable=0
date1=1636039800
</object>

<object>
type=109
name=2021.11.04 15:30 Peticiones Iniciales del Subsidio de Desempleo
hidden=1
descr=Peticiones Iniciales del Subsidio de Desempleo
color=16119285
selectable=0
date1=1636039800
</object>

<object>
type=109
name=2021.11.04 15:30 Peticiones Continuas del Subsidio de Desempleo
hidden=1
descr=Peticiones Continuas del Subsidio de Desempleo
color=16119285
selectable=0
date1=1636039800
</object>

<object>
type=109
name=2021.11.04 15:30 Número Medio de Peticiones Iniciales del Subsi
hidden=1
descr=Número Medio de Peticiones Iniciales del Subsidio de Desempleo 
color=16119285
selectable=0
date1=1636039800
</object>

<object>
type=109
name=2021.11.04 17:30 AIE Cambios en la Reserva de Gas Natural
hidden=1
descr=AIE Cambios en la Reserva de Gas Natural
color=16119285
selectable=0
date1=1636047000
</object>

<object>
type=109
name=2021.11.04 18:30 Subasta de Letras del Tesoro a 4 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 4 Semanas
color=16119285
selectable=0
date1=1636050600
</object>

<object>
type=109
name=2021.11.04 18:30 Subasta de Letras del Tesoro a 8 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 8 Semanas
color=16119285
selectable=0
date1=1636050600
</object>

<object>
type=109
name=2021.11.05 00:30 Índice de Servicios del AIG
hidden=1
descr=Índice de Servicios del AIG
color=16119285
selectable=0
date1=1636072200
</object>

<object>
type=109
name=2021.11.05 03:30 Declaración del Banco de la Reserva de Austral
hidden=1
descr=Declaración del Banco de la Reserva de Australia sobre Política
color=16119285
selectable=0
date1=1636083000
</object>

<object>
type=109
name=2021.11.05 15:30 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 Cambio en el empleo no agrícola
hidden=1
descr=Cambio en el empleo no agrícola
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 Tasa de Participación
hidden=1
descr=Tasa de Participación
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 Ganancias Promedio por Hora m/m
hidden=1
descr=Ganancias Promedio por Hora m/m
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 Ganancias Promedio por Hora a/a
hidden=1
descr=Ganancias Promedio por Hora a/a
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 Promedio de Horas Semanales
hidden=1
descr=Promedio de Horas Semanales
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 Nóminas Gubernamentales
hidden=1
descr=Nóminas Gubernamentales
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 Nóminas no Agrícolas Privadas
hidden=1
descr=Nóminas no Agrícolas Privadas
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 U6 Tasa de Desempleo
hidden=1
descr=U6 Tasa de Desempleo
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 15:30 Cambio en el Empleo Manufacturero
hidden=1
descr=Cambio en el Empleo Manufacturero
color=16119285
selectable=0
date1=1636126200
</object>

<object>
type=109
name=2021.11.05 20:00 Recuento de Plataformas Petrolíferas de EE.UU 
hidden=1
descr=Recuento de Plataformas Petrolíferas de EE.UU de Baker Hughes
color=16119285
selectable=0
date1=1636142400
</object>

<object>
type=109
name=2021.11.05 20:00 Recuento de plataformas petrolíferas en EE.UU.
hidden=1
descr=Recuento de plataformas petrolíferas en EE.UU. de Baker Hughes
color=16119285
selectable=0
date1=1636142400
</object>

<object>
type=109
name=2021.11.05 22:00 Crédito al Consumo de la FRS m/m
hidden=1
descr=Crédito al Consumo de la FRS m/m
color=16119285
selectable=0
date1=1636149600
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de AUD de la CF
hidden=1
descr=Posiciones Netas Especulativas de AUD de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Cobre de la 
hidden=1
descr=Posiciones Netas Especulativas de Cobre de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Plata de la 
hidden=1
descr=Posiciones Netas Especulativas de Plata de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Oro de la CF
hidden=1
descr=Posiciones Netas Especulativas de Oro de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Crudo de la 
hidden=1
descr=Posiciones Netas Especulativas de Crudo de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Aluminio de 
hidden=1
descr=Posiciones Netas Especulativas de Aluminio de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Maíz de la C
hidden=1
descr=Posiciones Netas Especulativas de Maíz de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Gas Natural 
hidden=1
descr=Posiciones Netas Especulativas de Gas Natural de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Soja de la C
hidden=1
descr=Posiciones Netas Especulativas de Soja de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Trigo de la 
hidden=1
descr=Posiciones Netas Especulativas de Trigo de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
type=109
name=2021.11.05 22:30 Posiciones Netas Especulativas de Nasdaq 100 d
hidden=1
descr=Posiciones Netas Especulativas de Nasdaq 100 de la CFTC
color=16119285
selectable=0
date1=1636151400
</object>

<object>
name=H4 Vertical Line 1828
color=16776960
ray=1
date1=1635724800
</object>

<object>
type=20
name=SSSR#S0 Strength=Weak
hidden=1
color=13959039
background=1
selectable=0
filling=1
date1=1586736000
date2=1647360000
value1=8129.962500
value2=8027.437500
</object>

<object>
type=20
name=SSSR#S1 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1587484800
date2=1647360000
value1=8402.141071
value2=8298.458929
</object>

<object>
type=20
name=SSSR#S2 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1587700800
date2=1647360000
value1=8606.019643
value2=8468.128571
</object>

<object>
type=20
name=SSSR#S3 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1589472000
date2=1647360000
value1=8958.039286
value2=8800.780357
</object>

<object>
type=20
name=SSSR#S4 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1590595200
date2=1647360000
value1=9263.071429
value2=9136.364286
</object>

<object>
type=20
name=SSSR#S5 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1592208000
date2=1647360000
value1=9491.717857
value2=9325.941071
</object>

<object>
type=20
name=SSSR#S6 Strength=Verified, Test Count=3
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1592942400
date2=1647360000
value1=10501.750000
value2=10236.100000
</object>

<object>
type=20
name=SSSR#S7 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1593446400
date2=1647360000
value1=9830.885714
value2=9696.657143
</object>

<object>
type=20
name=SSSR#S8 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1600704000
date2=1647360000
value1=10814.489286
value2=10608.460714
</object>

<object>
type=20
name=SSSR#S9 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1604347200
date2=1647360000
value1=11050.192857
value2=10908.153571
</object>

<object>
type=20
name=SSSR#S10 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1605024000
date2=1647360000
value1=11668.550000
value2=11433.425000
</object>

<object>
type=20
name=SSSR#S11 Strength=Verified, Test Count=2
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1605571200
date2=1647360000
value1=12382.271429
value2=12027.900000
</object>

<object>
type=20
name=SSSR#S12 Strength=Verified, Test Count=1
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1605772800
date2=1647360000
value1=11869.810714
value2=11773.941071
</object>

<object>
type=20
name=SSSR#S13 Strength=Untested
hidden=1
color=15130800
background=1
selectable=0
filling=1
date1=1616688000
date2=1647360000
value1=12720.925000
value2=12574.787500
</object>

<object>
type=20
name=SSSR#S14 Strength=Weak
hidden=1
color=13959039
background=1
selectable=0
filling=1
date1=1617120000
date2=1647360000
value1=12863.221429
value2=12759.239286
</object>

<object>
type=20
name=SSSR#S15 Strength=Verified, Test Count=2
hidden=1
color=15453831
background=1
selectable=0
filling=1
date1=1620892800
date2=1647360000
value1=13056.678571
value2=12870.575000
</object>

<object>
type=20
name=SSSR#R16 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1637596800
date2=1647360000
value1=16802.500000
value2=16700.200000
</object>

<object>
type=20
name=SSSR#R17 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1640692800
date2=1647360000
value1=16688.000000
value2=16614.300000
</object>

<object>
type=20
name=SSSR#R18 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1640880000
date2=1647360000
value1=16599.800000
value2=16528.300000
</object>

<object>
type=20
name=SSSR#R19 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1642003200
date2=1647360000
value1=16077.100000
value2=15956.000000
</object>

<object>
type=20
name=SSSR#R20 Strength=Weak
hidden=1
color=14053594
background=1
selectable=0
filling=1
date1=1642420800
date2=1647360000
value1=15698.800000
value2=15594.800000
</object>

<object>
type=20
name=SSSR#R21 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1643803200
date2=1647360000
value1=15325.700000
value2=15188.800000
</object>

<object>
type=20
name=SSSR#R22 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1644436800
date2=1647360000
value1=15117.800000
value2=15039.000000
</object>

<object>
type=20
name=SSSR#R23 Strength=Untested
hidden=1
color=13850042
background=1
selectable=0
filling=1
date1=1644998400
date2=1647360000
value1=14721.800000
value2=14611.700000
</object>

<object>
type=20
name=SSSR#R24 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1646121600
date2=1647360000
value1=14453.900000
value2=14201.700000
</object>

<object>
type=20
name=SSSR#R25 Strength=Verified, Test Count=1
hidden=1
color=3937500
background=1
selectable=0
filling=1
date1=1646856000
date2=1647360000
value1=13923.400000
value2=13738.800000
</object>

<object>
type=101
name=VelasOPV1647345600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1647316800
value1=13148.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21647316800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1647273600
value1=13005.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1647316800
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1647273600
value1=12993.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1647028800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1647000000
value1=13781.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21647028800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1646985600
value1=13887.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1646956800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1646928000
value1=13413.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21646956800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1646913600
value1=13389.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1646884800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1646856000
value1=13801.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646740800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646712000
value1=13094.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646712000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646683200
value1=13244.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1646683200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1646654400
value1=13907.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21646683200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1646640000
value1=13825.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646640000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646611200
value1=13519.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21646280000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1646236800
value1=14320.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1646236800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1646208000
value1=14174.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21646236800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1646193600
value1=14147.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21646208000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1646164800
value1=14000.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1645790400
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1645747200
value1=13801.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645732800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645704000
value1=13054.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1645732800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1645704000
value1=13042.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21645646400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1645603200
value1=14071.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645545600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645516800
value1=13717.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21645444800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1645401600
value1=14111.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21645416000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1645200000
value1=13904.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1645156800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1645128000
value1=14125.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1645056000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1645027200
value1=14390.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21645056000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1645012800
value1=14378.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1645027200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1644998400
value1=14655.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21645027200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1644984000
value1=14700.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21645012800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1644969600
value1=14543.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1644883200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1644854400
value1=14410.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1644854400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1644825600
value1=14027.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1644825600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1644796800
value1=14203.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1644609600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1644580800
value1=14803.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21644609600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1644566400
value1=14775.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21644595200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1644552000
value1=14533.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1644465600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1644436800
value1=15097.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1644321600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1644292800
value1=14540.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1644220800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1644192000
value1=14602.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21644220800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1644004800
value1=14623.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1644004800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1643976000
value1=14363.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643932800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1643904000
value1=14462.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643932800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1643889600
value1=14636.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1643904000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1643860800
value1=14910.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643817600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643788800
value1=15302.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643817600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1643788800
value1=15314.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643745600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1643716800
value1=15001.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643644800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1643616000
value1=14567.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643644800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1643601600
value1=14587.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643400000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1643371200
value1=13864.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643400000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1643356800
value1=13833.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643356800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1643328000
value1=14087.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643313600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1643284800
value1=14449.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643313600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1643270400
value1=14346.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643284800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1643256000
value1=13887.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643284800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1643241600
value1=13850.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643241600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1643212800
value1=14678.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643169600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1643140800
value1=13952.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643169600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1643126400
value1=13893.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643112000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1643083200
value1=14153.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643068800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643040000
value1=13902.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643068800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1643040000
value1=13890.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643068800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1643025600
value1=13708.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643025600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1642982400
value1=14613.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1642996800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1642795200
value1=14397.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1642996800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1642795200
value1=14385.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1642766400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1642737600
value1=14672.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1642723200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1642694400
value1=15284.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21642636800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1642593600
value1=15409.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1642593600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1642564800
value1=15056.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1642593600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1642564800
value1=15044.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21642593600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1642550400
value1=15052.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1642521600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1642492800
value1=15290.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1642478400
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1642435200
value1=15558.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21642449600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1642406400
value1=15672.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1642420800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1642392000
value1=15517.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21642420800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1642377600
value1=15507.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1642147200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1642118400
value1=15414.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1642104000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1642075200
value1=16016.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21642075200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1642032000
value1=15821.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21642032000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1641988800
value1=16046.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1641916800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1641888000
value1=15770.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21641902400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1641859200
value1=15580.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1641859200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1641830400
value1=15267.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1641859200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1641830400
value1=15255.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21641859200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1641816000
value1=15151.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1641816000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1641787200
value1=15705.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21641816000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1641772800
value1=15682.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1641801600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1641772800
value1=15587.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21641801600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1641585600
value1=15517.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1641499200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1641470400
value1=15596.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21641412800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1641369600
value1=16292.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1641384000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1641355200
value1=16167.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21641384000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1641340800
value1=16171.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1641182400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1640980800
value1=16347.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21640966400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1640923200
value1=16391.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1640851200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1640808000
value1=16520.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1640822400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1640793600
value1=16428.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21640793600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1640750400
value1=16591.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1640793600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1640750400
value1=16603.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640721600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640692800
value1=16643.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21640721600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1640678400
value1=16686.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640563200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640275200
value1=16386.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1640088000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1640059200
value1=15857.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21640088000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1640044800
value1=15817.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21639972800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1639756800
value1=15948.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1639771200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1639742400
value1=15647.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21639771200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1639728000
value1=15656.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1639713600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1639684800
value1=15806.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1639670400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1639641600
value1=16483.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21639670400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1639627200
value1=16458.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1639526400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1639497600
value1=15743.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1639526400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1639497600
value1=15731.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21639483200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1639440000
value1=16132.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21639425600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1639382400
value1=16437.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21639036800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1638993600
value1=16422.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1639008000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1638979200
value1=16303.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21639008000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1638964800
value1=16242.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1638964800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1638936000
value1=16437.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21638820800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1638777600
value1=15583.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1638792000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1638763200
value1=15836.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21638792000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1638748800
value1=15800.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1638504000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1638475200
value1=16054.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21638504000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1638460800
value1=16092.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1638475200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1638446400
value1=15754.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21638475200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1638432000
value1=15780.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1638374400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1638345600
value1=16425.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21638374400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1638331200
value1=16429.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21638331200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1638288000
value1=16093.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1638302400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1638273600
value1=16483.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1638201600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1638172800
value1=16159.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21638201600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1638158400
value1=16157.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21638158400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1637942400
value1=16019.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1638158400
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1637942400
value1=16007.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21637856000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1637812800
value1=16463.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1637784000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1637755200
value1=16092.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21637784000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1637740800
value1=16173.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1637755200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1637726400
value1=16381.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637712000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637683200
value1=16108.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1637697600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1637668800
value1=16446.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1637683200
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1637640000
value1=16264.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637611200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637582400
value1=16794.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1637611200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1637582400
value1=16806.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1637323200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1637294400
value1=16601.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21637193600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1637150400
value1=16262.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1637049600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1637020800
value1=16252.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21637049600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1637006400
value1=16256.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21637035200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1636992000
value1=16117.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1636732800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1636704000
value1=16037.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21636718400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1636675200
value1=16122.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1636689600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1636660800
value1=16033.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21636689600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1636646400
value1=16005.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1636660800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1636632000
value1=16144.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21636660800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1636617600
value1=16146.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21636545600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1636502400
value1=16126.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636488000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636459200
value1=16424.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1636488000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1636459200
value1=16436.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1636444800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1636416000
value1=16289.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636416000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636387200
value1=16416.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21636416000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1636372800
value1=16426.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21636358400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1636142400
value1=16264.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636344000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636142400
value1=16367.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21636329600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1636113600
value1=16483.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1636329600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1636113600
value1=16495.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635825600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635796800
value1=15930.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21635811200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1635768000
value1=15769.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635796800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635768000
value1=15905.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1635753600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1635724800
value1=15934.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21635753600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1635537600
value1=15945.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635465600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635436800
value1=15814.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1635465600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1635436800
value1=15826.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635379200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635350400
value1=15755.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1635379200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1635350400
value1=15767.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21635321600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1635278400
value1=15529.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1635278400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1635249600
value1=15737.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21635278400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1635235200
value1=15642.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1635134400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1634932800
value1=15298.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634860800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634832000
value1=15521.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634774400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634745600
value1=15433.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1634760000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1634731200
value1=15484.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1634702400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1634673600
value1=15452.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21634702400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1634659200
value1=15465.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634529600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634328000
value1=15200.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1634529600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1634328000
value1=15212.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21634328000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1634284800
value1=15059.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1634270400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1634241600
value1=15114.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1634097600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1634068800
value1=14592.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1634068800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1634040000
value1=14817.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21634068800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1634025600
value1=14821.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21634040000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1633996800
value1=14597.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1633982400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1633953600
value1=14724.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1633708800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1633680000
value1=14839.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21633708800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1633665600
value1=14835.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1633651200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1633622400
value1=15022.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21633550400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1633507200
value1=14423.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633392000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633363200
value1=14371.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1633363200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1633334400
value1=14666.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633104000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633075200
value1=14594.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21633104000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1633060800
value1=14552.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21633017600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1632974400
value1=14921.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1633017600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1632974400
value1=14933.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21632974400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1632931200
value1=14714.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1632931200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1632902400
value1=14958.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632888000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632859200
value1=14762.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1632787200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1632758400
value1=15136.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1632744000
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1632700800
value1=15435.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1632513600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1632484800
value1=15183.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21632513600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1632470400
value1=15177.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1632297600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1632268800
value1=14941.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21632297600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1632254400
value1=14929.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1632240000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1632211200
value1=15182.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632196800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632168000
value1=14981.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21632196800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1632153600
value1=14809.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1632110400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1631908800
value1=15285.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1631836800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1631808000
value1=15414.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21631836800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1631793600
value1=15357.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1631721600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1631692800
value1=15463.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21631692800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1631649600
value1=15377.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1631563200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1631534400
value1=15590.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21631563200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1631520000
value1=15563.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21631304000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1631260800
value1=15663.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21631260800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1631217600
value1=15541.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21631232000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1631188800
value1=15700.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1631232000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1631188800
value1=15712.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21631203200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1631160000
value1=15534.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1631203200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1631160000
value1=15522.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1631116800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1631088000
value1=15623.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1631044800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1631016000
value1=15596.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21631044800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1631001600
value1=15610.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1630670400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1630641600
value1=15652.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1630641600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1630612800
value1=15581.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1630612800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1630584000
value1=15707.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21630612800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1630569600
value1=15686.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630540800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630512000
value1=15714.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1630540800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1630512000
value1=15726.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21630540800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1630497600
value1=15723.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21630468800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1630425600
value1=15631.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1630468800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1630425600
value1=15643.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630425600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630396800
value1=15682.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21630425600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1630382400
value1=15705.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1630382400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1630353600
value1=15639.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21630051200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1630008000
value1=15258.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21629878400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1629835200
value1=15398.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21629849600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1629806400
value1=15306.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629820800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629792000
value1=15410.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629792000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629763200
value1=15365.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1629748800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1629720000
value1=15112.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21629734400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1629691200
value1=15181.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1629475200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1629446400
value1=14861.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21629475200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1629432000
value1=14841.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629403200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629374400
value1=14730.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21629403200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1629360000
value1=14704.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21629316800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1629273600
value1=14966.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1629288000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1629259200
value1=15051.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21629259200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1629216000
value1=14895.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1629158400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1629129600
value1=15015.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21629158400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1629115200
value1=14912.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21629086400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1628870400
value1=15163.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1628870400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1628841600
value1=15129.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1628856000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1628812800
value1=15062.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1628668800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1628640000
value1=15021.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1628596800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1628568000
value1=15105.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21628596800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1628553600
value1=15091.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21628510400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1628467200
value1=15022.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628222400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628193600
value1=15203.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21628092800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1628049600
value1=15110.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1627963200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1627934400
value1=14952.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1627920000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1627891200
value1=15079.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21627920000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1627876800
value1=15090.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21627646400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1627603200
value1=14828.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1627531200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1627502400
value1=14972.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1627459200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1627430400
value1=14993.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1627401600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1627372800
value1=15068.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21627401600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1627358400
value1=15049.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627358400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627329600
value1=15160.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1627358400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1627329600
value1=15172.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21627329600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1627286400
value1=15055.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1627329600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1627286400
value1=15043.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1627300800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1627272000
value1=15142.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1627286400
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1627070400
value1=15161.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1627027200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1626998400
value1=15032.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21627027200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1626984000
value1=15034.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21626969600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1626926400
value1=14914.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626739200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626710400
value1=14443.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1626739200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1626710400
value1=14431.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21626739200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1626696000
value1=14440.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1626465600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1626436800
value1=14901.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21626465600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1626422400
value1=14877.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1626422400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1626393600
value1=14730.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1626364800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1626336000
value1=14994.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21626364800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1626321600
value1=14994.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1626336000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1626307200
value1=14870.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21626336000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1626292800
value1=14870.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21626307200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1626264000
value1=15029.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1626192000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1626163200
value1=14961.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1626120000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1626091200
value1=14923.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21625832000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1625788800
value1=14638.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21625803200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1625760000
value1=14790.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1625774400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1625745600
value1=14538.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21625774400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1625731200
value1=14542.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625688000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625659200
value1=14918.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1625688000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1625659200
value1=14930.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21625688000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1625644800
value1=14906.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1625601600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1625572800
value1=14822.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21625587200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1625544000
value1=14666.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625558400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625529600
value1=14748.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625529600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625486400
value1=14746.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1625500800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1625472000
value1=14682.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21625212800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1625169600
value1=14581.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1625212800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1625169600
value1=14593.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1625184000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1625155200
value1=14488.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21625184000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1625140800
value1=14470.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625126400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625097600
value1=14609.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1625126400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1625097600
value1=14621.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21625126400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1625083200
value1=14605.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625083200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625054400
value1=14609.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21624867200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1624651200
value1=14336.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624651200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624622400
value1=14425.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1624608000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1624579200
value1=14330.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624579200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624550400
value1=14419.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21624449600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1624406400
value1=14336.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623787200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623758400
value1=14154.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623686400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623657600
value1=14076.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21623283200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1623240000
value1=13929.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1623211200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1623182400
value1=13792.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21623211200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1623168000
value1=13783.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21623153600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1623110400
value1=13891.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1623081600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1623052800
value1=13680.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21623081600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1623038400
value1=13695.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21623038400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1622822400
value1=13810.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1623038400
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1622822400
value1=13822.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622793600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1622764800
value1=13477.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622707200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1622678400
value1=13730.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622649600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1622620800
value1=13612.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21622649600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1622606400
value1=13608.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21622577600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1622534400
value1=13784.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622131200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1622102400
value1=13611.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622073600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1622044800
value1=13753.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622044800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1622016000
value1=13675.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21622030400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1621987200
value1=13747.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21622001600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1621958400
value1=13608.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621972800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621944000
value1=13760.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21621972800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1621929600
value1=13753.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1621828800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1621627200
value1=13349.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21621828800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1621612800
value1=13388.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1621584000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1621555200
value1=13575.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1621454400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1621425600
value1=12948.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21621454400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1621411200
value1=12960.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1621353600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1621324800
value1=13449.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1621296000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1621267200
value1=13180.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620907200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1620878400
value1=13093.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21620907200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1620864000
value1=13101.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620878400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620849600
value1=12969.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620878400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1620849600
value1=12957.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620820800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1620792000
value1=13236.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620792000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1620763200
value1=13385.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620763200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620734400
value1=13064.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620763200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1620734400
value1=13052.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21620763200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1620720000
value1=13078.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620619200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1620417600
value1=13707.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21620388800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1620345600
value1=13694.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620244800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1620216000
value1=13703.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21620244800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1620201600
value1=13691.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1620187200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1620158400
value1=13508.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21620187200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1620144000
value1=13407.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620072000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1620043200
value1=13983.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21620057600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1620014400
value1=13855.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1619726400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1619697600
value1=14099.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1619611200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1619582400
value1=14014.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21619611200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1619568000
value1=14016.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21619596800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1619553600
value1=13953.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21619107200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1619064000
value1=13973.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21618848000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1618804800
value1=14084.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21618804800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1618588800
value1=13994.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1618804800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1618588800
value1=13982.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618430400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618401600
value1=14039.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1618315200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1618286400
value1=13771.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21618286400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1618243200
value1=13865.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1618228800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1618200000
value1=13774.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21618214400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1617998400
value1=13867.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1617998400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1617969600
value1=13646.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21617998400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1617955200
value1=13646.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617969600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617940800
value1=13830.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1617955200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1617926400
value1=13875.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617782400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617753600
value1=13626.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1617753600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1617724800
value1=13653.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1617724800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1617696000
value1=13532.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21617696000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1617652800
value1=13656.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617609600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617580800
value1=13382.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1617177600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1617148800
value1=12964.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21617177600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1617134400
value1=12950.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21617148800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1617105600
value1=12782.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21617076800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1617033600
value1=13043.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1616990400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1616788800
value1=13013.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1616788800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1616760000
value1=12739.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21616788800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1616745600
value1=12677.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21616716800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1616673600
value1=12612.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1616601600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1616572800
value1=13181.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1616544000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1616515200
value1=13187.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21616544000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1616500800
value1=13210.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1616500800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1616472000
value1=13003.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1616054400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1616025600
value1=13303.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1616025600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1615996800
value1=12953.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21616025600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1615982400
value1=12934.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615939200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1615910400
value1=13277.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615795200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1615766400
value1=13036.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615449600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1615406400
value1=12713.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615406400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1615377600
value1=13021.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615377600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1615334400
value1=12712.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615348800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1615320000
value1=12855.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615348800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1615305600
value1=12895.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615276800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1615233600
value1=12318.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615248000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1615204800
value1=12745.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615219200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1615190400
value1=12409.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615219200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1615176000
value1=12368.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615176000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1614974400
value1=12789.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614931200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614902400
value1=12305.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614931200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1614902400
value1=12293.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21614931200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1614888000
value1=12297.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614888000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1614859200
value1=12825.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21614888000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1614844800
value1=12737.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614859200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614830400
value1=12559.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614859200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1614830400
value1=12547.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21614758400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1614715200
value1=13051.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614700800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1614672000
value1=13176.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21614700800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1614657600
value1=13154.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21614672000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1614628800
value1=13356.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614556800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1614355200
value1=13093.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21614556800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1614340800
value1=13119.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614153600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1614124800
value1=13270.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21614153600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1614110400
value1=13292.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614124800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614096000
value1=12882.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614124800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1614096000
value1=12870.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21614124800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1614081600
value1=12750.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614081600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1614052800
value1=13343.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614067200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614038400
value1=13261.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21614067200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1614024000
value1=13187.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1613764800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1613736000
value1=13753.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21613764800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1613721600
value1=13756.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21613692800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1613649600
value1=13462.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1613692800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1613649600
value1=13450.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21613635200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1613592000
value1=13750.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1613606400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1613577600
value1=13622.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21613606400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1613563200
value1=13538.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21613577600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1613534400
value1=13814.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1613548800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1613520000
value1=13711.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1613476800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1613448000
value1=13919.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21613476800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1613433600
value1=13931.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1613160000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1613131200
value1=13641.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21613160000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1613116800
value1=13677.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21613073600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1613030400
value1=13754.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1612900800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1612872000
value1=13629.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21612900800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1612857600
value1=13647.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21612785600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1612742400
value1=13715.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21612555200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1612512000
value1=13565.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1612555200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1612512000
value1=13553.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1612526400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1612497600
value1=13649.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1612440000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1612411200
value1=13367.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1612353600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1612324800
value1=13619.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21611936000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1611892800
value1=12932.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611878400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1611849600
value1=13429.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611849600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611820800
value1=12937.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611849600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1611820800
value1=12925.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21611849600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1611806400
value1=12905.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611806400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611777600
value1=12954.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611748800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611720000
value1=13606.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611748800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1611720000
value1=13618.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611662400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1611633600
value1=13381.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21611648000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1611604800
value1=13508.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611619200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1611590400
value1=13374.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611604800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611576000
value1=13589.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21611604800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1611561600
value1=13542.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1611604800
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1611561600
value1=13554.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21611345600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1611302400
value1=13297.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611302400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611273600
value1=13407.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611288000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1611259200
value1=13435.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611259200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1611230400
value1=13280.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21611259200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1611216000
value1=13301.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611230400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1611201600
value1=13415.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611072000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1611043200
value1=12967.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21611072000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1611028800
value1=12972.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1610956800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1610928000
value1=12750.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21610956800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1610740800
value1=12724.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1610740800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1610712000
value1=12962.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21610740800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1610697600
value1=12941.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1610712000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1610683200
value1=12825.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1610668800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1610625600
value1=13062.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1610640000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1610611200
value1=12917.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21610640000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1610596800
value1=12929.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1610611200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1610582400
value1=13046.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1610496000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1610467200
value1=12837.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21610352000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1610136000
value1=13139.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1610035200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1610006400
value1=12660.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21610020800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1609977600
value1=12776.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1609963200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1609934400
value1=12550.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1609905600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1609876800
value1=12878.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1609833600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1609804800
value1=12762.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21609790400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1609747200
value1=12984.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21609761600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1609718400
value1=12844.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1609387200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1609358400
value1=12835.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1609358400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1609329600
value1=12939.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21609358400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1609315200
value1=12935.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609272000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609243200
value1=12949.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21608753600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1608710400
value1=12769.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1608667200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1608638400
value1=12783.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21608667200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1608624000
value1=12788.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21608624000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1608580800
value1=12755.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1608580800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1608552000
value1=12453.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608321600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608292800
value1=12812.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1608321600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1608292800
value1=12824.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21608321600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1608278400
value1=12804.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21608292800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1608249600
value1=12693.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1608264000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1608235200
value1=12776.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1608134400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1608105600
value1=12665.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1608062400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1608033600
value1=12603.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1607932800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1607904000
value1=12447.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21607932800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1607716800
value1=12467.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21607673600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1607630400
value1=12441.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607630400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607601600
value1=12208.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607601600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607572800
value1=12292.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607515200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607486400
value1=12677.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21607443200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1607400000
value1=12624.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21607414400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1607371200
value1=12547.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1607356800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1607328000
value1=12487.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21607356800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1607313600
value1=12463.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1607112000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1607083200
value1=12436.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21607112000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1607068800
value1=12459.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21607097600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1607054400
value1=12544.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607083200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607054400
value1=12544.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1606924800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1606896000
value1=12475.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21606924800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1606881600
value1=12483.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21606910400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1606867200
value1=12394.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606881600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606852800
value1=12496.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21606881600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1606838400
value1=12538.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606824000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606795200
value1=12425.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21606824000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1606780800
value1=12426.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1606766400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1606737600
value1=12325.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21606766400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1606723200
value1=12331.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1606737600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1606708800
value1=12182.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606723200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606694400
value1=12318.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1606291200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1606262400
value1=12195.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1606291200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1606262400
value1=12207.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21606248000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1606204800
value1=11918.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1606219200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1606190400
value1=12004.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21606190400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1606147200
value1=11861.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21605700800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1605657600
value1=11923.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21605643200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1605600000
value1=12081.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1605614400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1605585600
value1=11988.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21605614400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1605571200
value1=11984.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1605585600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1605556800
value1=12126.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1605556800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1605528000
value1=11882.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1605528000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1605499200
value1=12078.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21605528000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1605484800
value1=12091.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21605484800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1605268800
value1=11797.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1605484800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1605268800
value1=11785.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21605211200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1605168000
value1=11997.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21605182400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1605139200
value1=11778.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1605153600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1605124800
value1=11945.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21605153600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1605110400
value1=11951.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604937600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604908800
value1=12418.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1604923200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1604894400
value1=12417.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21604923200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1604880000
value1=12442.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1604678400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1604649600
value1=11863.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21604678400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1604635200
value1=11894.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604649600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1604620800
value1=12067.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1604620800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1604592000
value1=12016.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21604620800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1604577600
value1=11969.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1604390400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1604361600
value1=11163.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21604376000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1604332800
value1=10944.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21604347200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1604304000
value1=11250.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1604044800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1604016000
value1=11160.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1604001600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603972800
value1=11172.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603987200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1603944000
value1=11334.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1603987200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1603944000
value1=11346.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603958400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603929600
value1=11211.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1603944000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1603915200
value1=11167.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603857600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1603814400
value1=11661.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1603396800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1603368000
value1=11761.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603396800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1603353600
value1=11733.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1603368000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1603339200
value1=11603.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603368000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1603324800
value1=11600.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1603281600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1603252800
value1=11778.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1603123200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1603094400
value1=11986.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1603080000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1602878400
value1=11818.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1602878400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1602849600
value1=12059.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1602835200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1602806400
value1=11976.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21602835200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1602792000
value1=11969.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21602748800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1602705600
value1=12017.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1602748800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1602705600
value1=12029.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602705600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602676800
value1=12186.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1602691200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1602648000
value1=12210.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1602648000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1602619200
value1=12074.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21602648000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1602604800
value1=12016.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1602561600
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1602518400
value1=12231.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1602244800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1602216000
value1=11632.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1602187200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1602158400
value1=11616.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21602028800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1601985600
value1=11539.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1602028800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1601985600
value1=11551.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601956800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1601928000
value1=11529.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21601899200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1601856000
value1=11406.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21601539200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1601496000
value1=11375.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601510400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1601481600
value1=11561.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601481600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1601452800
value1=11187.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21601481600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1601438400
value1=11168.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601438400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1601409600
value1=11314.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601380800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1601352000
value1=11484.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21601380800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1601337600
value1=11480.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601323200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1601294400
value1=11391.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21601064000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1601020800
value1=10818.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21601035200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1600992000
value1=11017.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600876800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1600848000
value1=11263.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21600862400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1600819200
value1=11081.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600804800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1600776000
value1=11117.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600761600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1600732800
value1=11071.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600675200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1600646400
value1=11033.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21600675200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1600459200
value1=11009.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600459200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1600430400
value1=11203.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21600387200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1600344000
value1=10909.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600272000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1600243200
value1=11574.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600243200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1600214400
value1=11408.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21600243200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1600200000
value1=11393.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21600228800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1600185600
value1=11521.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600156800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1600128000
value1=11236.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21600156800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1600113600
value1=11236.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21600056000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1599840000
value1=10926.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599840000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1599811200
value1=11362.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21599840000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1599796800
value1=11380.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599753600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1599724800
value1=11293.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599667200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1599638400
value1=11321.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599638400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599609600
value1=11078.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21599638400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1599595200
value1=10926.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599552000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1599523200
value1=11593.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599523200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599480000
value1=11422.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21599494400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1599451200
value1=11361.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599436800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599235200
value1=11358.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599235200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1599206400
value1=11825.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599206400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599177600
value1=11581.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599091200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1599062400
value1=12309.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599076800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599048000
value1=12472.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21599076800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1599033600
value1=12493.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1598976000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1598947200
value1=12277.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1598904000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1598875200
value1=11982.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21598904000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1598860800
value1=11995.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598875200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598846400
value1=12113.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21598875200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1598832000
value1=12122.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21598644800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1598601600
value1=11914.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598616000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598587200
value1=12035.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1598616000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1598587200
value1=12047.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598558400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598529600
value1=12075.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21598544000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1598500800
value1=11940.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1598544000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1598500800
value1=11928.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598457600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598428800
value1=11814.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598428800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598400000
value1=11780.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1598385600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1598356800
value1=11568.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1598356800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1598328000
value1=11717.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21598328000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1598284800
value1=11540.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1598299200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1598270400
value1=11752.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1598299200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1598270400
value1=11764.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21598299200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1598256000
value1=11725.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1598040000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1598011200
value1=11442.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21598040000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1597996800
value1=11399.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21598011200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1597968000
value1=11553.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597924800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1597896000
value1=11243.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597852800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597824000
value1=11455.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1597852800
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1597809600
value1=11455.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1597766400
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1597723200
value1=11265.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597636800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1597435200
value1=11142.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597363200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1597334400
value1=11296.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21597305600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1597262400
value1=11095.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21597233600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1597190400
value1=10875.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1597233600
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1597190400
value1=10863.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597161600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1597132800
value1=11192.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596787200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596758400
value1=11306.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21596787200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1596744000
value1=11317.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21596729600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1596686400
value1=11081.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596643200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1596614400
value1=11183.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21596571200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1596528000
value1=10985.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596513600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1596484800
value1=11092.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1596225600
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1596182400
value1=10972.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596196800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1596168000
value1=10844.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21596139200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1596096000
value1=10503.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595923200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1595894400
value1=10794.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595520000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1595491200
value1=10946.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21595404800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1595361600
value1=10841.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595361600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595332800
value1=11056.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595347200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1595318400
value1=11091.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21595260800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1595217600
value1=10545.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595232000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1595203200
value1=10674.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21595232000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1595016000
value1=10693.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21595016000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1594972800
value1=10664.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594944000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1594900800
value1=10635.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594828800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1594785600
value1=10669.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594800000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1594756800
value1=10774.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594771200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1594728000
value1=10358.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594684800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594656000
value1=11050.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594684800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1594656000
value1=11062.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594656000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1594612800
value1=10865.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594396800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1594353600
value1=10648.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594368000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1594324800
value1=10792.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594324800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594296000
value1=10781.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594324800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1594296000
value1=10793.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1594296000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1594252800
value1=10643.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594166400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594137600
value1=10677.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594166400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1594137600
value1=10689.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594166400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1594123200
value1=10729.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594152000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1594108800
value1=10527.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594123200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594094400
value1=10648.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594108800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1594080000
value1=10699.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594008000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1593792000
value1=10339.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594008000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1593777600
value1=10307.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593792000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593763200
value1=10416.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593763200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593734400
value1=10406.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593734400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1593705600
value1=10439.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21593734400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1593691200
value1=10455.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1593590400
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1593547200
value1=10184.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593547200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1593518400
value1=9940.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21593547200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1593504000
value1=9940.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593518400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1593489600
value1=10065.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21593518400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1593475200
value1=10059.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593403200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1593201600
value1=9780.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593158400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1593129600
value1=10149.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593057600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1593028800
value1=9964.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593000000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1592971200
value1=10272.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21593000000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1592956800
value1=10278.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21592985600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1592942400
value1=10168.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592956800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1592928000
value1=10332.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592899200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1592870400
value1=10182.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21592899200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1592856000
value1=10194.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21592812800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1592596800
value1=9843.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592596800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1592568000
value1=10148.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21592596800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1592553600
value1=10132.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592496000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1592467200
value1=10066.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592467200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1592438400
value1=9867.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592380800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1592352000
value1=10019.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21592366400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1592323200
value1=9864.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1592236800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1592208000
value1=9461.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592236800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1592208000
value1=9449.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591992000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1591948800
value1=9819.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591948800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1591905600
value1=9585.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591862400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591833600
value1=10120.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591848000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1591819200
value1=10131.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591790400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1591761600
value1=10041.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591747200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591718400
value1=10030.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1591660800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1591617600
value1=9736.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591617600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1591574400
value1=9882.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591372800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1591344000
value1=9708.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591372800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1591329600
value1=9730.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591315200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1591286400
value1=9561.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591257600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1591214400
value1=9732.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1591228800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1591185600
value1=9630.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591142400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1591113600
value1=9561.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591142400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1591099200
value1=9495.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591128000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1591084800
value1=9697.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591084800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1591041600
value1=9624.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591041600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1590998400
value1=9483.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1591041600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1590998400
value1=9471.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591012800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1590984000
value1=9616.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591012800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1590969600
value1=9606.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590739200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1590710400
value1=9374.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21590724800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1590681600
value1=9595.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590652800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1590624000
value1=9511.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21590652800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1590609600
value1=9504.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590624000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1590595200
value1=9291.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21590624000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1590580800
value1=9167.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21590595200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1590552000
value1=9523.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1590595200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1590552000
value1=9535.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21590566400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1590523200
value1=9369.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1590566400
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1590523200
value1=9357.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21590508800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1590465600
value1=9635.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21590163200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1590120000
value1=9235.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590120000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1590091200
value1=9343.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590076800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1590048000
value1=9407.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21590076800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1590033600
value1=9401.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1590033600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1590004800
value1=9530.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590033600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1590004800
value1=9542.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589961600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1589918400
value1=9264.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589932800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1589904000
value1=9447.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589932800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1589889600
value1=9436.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1589918400
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1589875200
value1=9285.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589558400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1589529600
value1=9166.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589457600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1589428800
value1=8940.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589356800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1589313600
value1=8994.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589256000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1589212800
value1=9370.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1589256000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1589212800
value1=9382.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589227200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1589198400
value1=9136.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589227200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1589184000
value1=9113.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589198400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589169600
value1=9303.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589198400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1589155200
value1=9316.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1589198400
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1589155200
value1=9328.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21588968000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1588924800
value1=9167.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1588968000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1588924800
value1=9155.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588939200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588910400
value1=9270.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588939200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1588910400
value1=9282.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21588838400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1588795200
value1=8928.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588752000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1588723200
value1=8875.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588723200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1588694400
value1=9056.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588680000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1588651200
value1=8953.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21588680000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1588636800
value1=8913.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588132800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1588104000
value1=8730.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588104000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1588075200
value1=8956.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21588104000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1588060800
value1=8978.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588046400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1588017600
value1=8798.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21587729600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1587686400
value1=8494.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21587686400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1587643200
value1=8818.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587614400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1587585600
value1=8675.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587556800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1587528000
value1=8431.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587412800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1587384000
value1=8701.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21587412800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1587369600
value1=8690.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587369600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1587340800
value1=8861.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21587355200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1587139200
value1=8685.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1587153600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1587124800
value1=8922.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587067200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1587038400
value1=8817.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21587009600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1586966400
value1=8686.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586980800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1586952000
value1=8480.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586952000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586923200
value1=8708.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586923200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1586894400
value1=8733.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586865600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586836800
value1=8516.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21586736000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1586433600
value1=8354.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586448000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1586419200
value1=8095.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586419200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1586390400
value1=8251.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586332800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1586304000
value1=7955.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21586332800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1586289600
value1=7946.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586304000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586275200
value1=8266.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586289600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1586260800
value1=8325.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586246400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1586217600
value1=8082.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21586246400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1586203200
value1=8124.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586188800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1586160000
value1=7879.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21586145600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1585929600
value1=7417.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585929600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1585886400
value1=7506.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1585929600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1585886400
value1=7494.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585886400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1585857600
value1=7681.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585843200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1585814400
value1=7605.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585843200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1585800000
value1=7625.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585814400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1585771200
value1=7457.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585641600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1585612800
value1=7964.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585641600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1585598400
value1=7926.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585281600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1585252800
value1=7921.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585238400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1585209600
value1=7302.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585238400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1585195200
value1=7314.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585152000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1585123200
value1=7787.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585108800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1585080000
value1=7662.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585022400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1584993600
value1=7023.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584950400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584921600
value1=6646.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584950400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1584734400
value1=6612.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584720000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1584691200
value1=7662.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584691200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1584648000
value1=7122.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584604800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1584576000
value1=7368.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584604800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1584561600
value1=7458.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584576000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584547200
value1=6811.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584576000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1584518400
value1=6981.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584504000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1584475200
value1=7418.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584504000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1584460800
value1=7534.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584475200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1584432000
value1=6990.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584446400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1584417600
value1=7322.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584446400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1584403200
value1=7323.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584417600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1584388800
value1=6972.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584129600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1584100800
value1=7760.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1584100800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1584072000
value1=7253.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583928000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1583899200
value1=8073.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583928000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1583884800
value1=8103.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583884800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1583856000
value1=7998.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583884800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1583841600
value1=7921.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583856000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1583827200
value1=8376.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583812800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583784000
value1=7808.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1583784000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1583755200
value1=7902.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583726400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1583524800
value1=8340.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583726400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1583510400
value1=8597.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583712000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1583496000
value1=8301.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583380800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1583352000
value1=8925.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583308800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1583265600
value1=8497.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583265600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1583222400
value1=8938.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583236800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1583208000
value1=8723.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583236800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1583193600
value1=8740.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21583222400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1583179200
value1=8912.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583164800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1583136000
value1=8579.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583121600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1582920000
value1=8565.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582920000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582891200
value1=8111.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582833600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582804800
value1=8501.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582804800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582776000
value1=8678.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582804800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1582776000
value1=8666.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582804800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1582761600
value1=8682.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582761600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1582732800
value1=8964.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582761600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1582718400
value1=9055.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582732800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582704000
value1=8766.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582718400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1582689600
value1=8945.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582646400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582617600
value1=9051.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582632000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1582588800
value1=9226.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582617600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582588800
value1=9141.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582603200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1582560000
value1=9028.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582315200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1582286400
value1=9624.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582300800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1582257600
value1=9520.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1582300800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1582257600
value1=9508.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582041600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1582012800
value1=9523.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1581897600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1581696000
value1=9570.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21581897600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1581681600
value1=9574.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21581624000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1581580800
value1=9491.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1581566400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1581537600
value1=9642.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21581566400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1581523200
value1=9645.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21581494400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1581451200
value1=9505.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1581494400
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1581451200
value1=9493.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1581422400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1581393600
value1=9595.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21581422400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1581379200
value1=9599.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1581336000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1581307200
value1=9451.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21581321600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1581105600
value1=9311.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21581105600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1581062400
value1=9374.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1581048000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1581019200
value1=9485.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21581048000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1581004800
value1=9481.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21581019200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1580976000
value1=9382.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580990400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1580961600
value1=9478.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580932800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580904000
value1=9479.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21580932800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1580889600
value1=9482.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580904000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1580875200
value1=9309.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21580889600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1580846400
value1=9384.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21580731200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1580688000
value1=9113.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580702400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1580500800
value1=8966.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21580702400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1580486400
value1=8949.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21580299200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1580256000
value1=9170.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1580299200
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1580256000
value1=9182.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580212800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1580184000
value1=9060.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580184000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580155200
value1=8937.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580155200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580126400
value1=8909.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580155200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1580126400
value1=8897.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579737600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579708800
value1=9263.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1579737600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1579708800
value1=9275.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21579680000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1579636800
value1=9154.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21579622400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1579579200
value1=9094.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1579622400
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1579579200
value1=9082.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21579564800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1579507200
value1=9139.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1579564800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1579507200
value1=9127.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579521600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579492800
value1=9196.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579291200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579262400
value1=9199.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1579291200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1579262400
value1=9211.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21579291200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1579248000
value1=9195.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1579248000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1579204800
value1=9171.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578988800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578960000
value1=9117.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1578988800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1578960000
value1=9129.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21578988800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1578945600
value1=9127.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1578931200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1578902400
value1=9039.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21578902400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1578686400
value1=8958.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578672000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1578643200
value1=9066.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21578600000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1578556800
value1=9010.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1578470400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1578441600
value1=8720.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21578340800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1578297600
value1=8710.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21578297600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1578081600
value1=8722.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1578268800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1578067200
value1=8865.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21578081600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1578038400
value1=8703.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21578038400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1577995200
value1=8912.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1578024000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577995200
value1=8912.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21577923200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1577793600
value1=8662.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1577793600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1577750400
value1=8757.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1577764800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1577736000
value1=8697.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21577707200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1577664000
value1=8816.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1577707200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1577664000
value1=8828.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1577678400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1577476800
value1=8747.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577664000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577462400
value1=8812.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577217600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577188800
value1=8737.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1577174400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1577145600
value1=8684.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1576843200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1576814400
value1=8676.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1576756800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1576713600
value1=8577.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21576728000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1576684800
value1=8639.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1576713600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1576684800
value1=8639.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1576627200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1576598400
value1=8615.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1576252800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1576224000
value1=8549.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1576137600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1576108800
value1=8444.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1576051200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1576022400
value1=8338.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1575979200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1575950400
value1=8397.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1575964800
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1575921600
value1=8337.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21575864000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1575648000
value1=8431.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21575576000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1575532800
value1=8361.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1575417600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1575388800
value1=8201.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21575417600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1575374400
value1=8155.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21575388800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1575345600
value1=8359.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1575244800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1575043200
value1=8393.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21575057600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1575014400
value1=8462.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1575057600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1575014400
value1=8474.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21575000000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1574942400
value1=8469.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574913600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574884800
value1=8479.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1574913600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1574884800
value1=8491.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21574913600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1574870400
value1=8479.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574870400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574841600
value1=8451.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1574870400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1574841600
value1=8463.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574755200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574726400
value1=8423.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1574755200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1574726400
value1=8435.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21574654400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1574438400
value1=8243.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21574395200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1574352000
value1=8240.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21574193600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1574150400
value1=8402.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574179200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574150400
value1=8402.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21574121600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1574078400
value1=8265.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1574121600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1574078400
value1=8253.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1574092800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1574064000
value1=8369.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1573761600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1573732800
value1=8199.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21573617600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1573574400
value1=8315.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21573588800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1573545600
value1=8236.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1573588800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1573545600
value1=8224.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21573531200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1573488000
value1=8277.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21573502400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1573459200
value1=8201.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1573444800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1573243200
value1=8283.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21573214400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1573171200
value1=8181.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21573128000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1573084800
value1=8174.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21573027200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1572984000
value1=8187.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572998400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572969600
value1=8258.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1572566400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1572537600
value1=8038.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572379200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572350400
value1=8137.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1571961600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1571932800
value1=8005.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21571961600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1571918400
value1=7998.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21571918400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1571875200
value1=7897.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1571918400
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1571875200
value1=7885.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1571817600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1571788800
value1=7809.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21571745600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1571702400
value1=7999.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1571745600
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1571702400
value1=8011.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1571659200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1571616000
value1=7929.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21571630400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1571414400
value1=7846.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1571342400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1571313600
value1=8009.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21571342400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1571299200
value1=8012.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1571270400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1571241600
value1=7893.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21571270400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1571227200
value1=7887.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571198400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571169600
value1=7977.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21571198400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1571155200
value1=7988.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1571155200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1571126400
value1=7915.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1571083200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1571054400
value1=7810.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21571054400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1571011200
value1=7901.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1570694400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1570665600
value1=7604.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21570680000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1570636800
value1=7746.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1570536000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1570507200
value1=7798.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21570536000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1570492800
value1=7797.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1570492800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1570464000
value1=7811.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1570449600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1570420800
value1=7760.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1570118400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1570089600
value1=7592.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21570118400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1570075200
value1=7594.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1570104000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1570075200
value1=7512.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1569988800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1569960000
value1=7674.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1569859200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1569830400
value1=7759.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21569859200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1569816000
value1=7762.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21569844800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1569801600
value1=7691.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21569614400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1569571200
value1=7829.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1569614400
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1569571200
value1=7841.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21569585600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1569542400
value1=7724.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1569585600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1569542400
value1=7712.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21569528000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1569484800
value1=7844.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1569499200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1569470400
value1=7755.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21569499200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1569456000
value1=7766.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569369600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569340800
value1=7673.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21569268800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1569225600
value1=7787.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21568937600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1568894400
value1=7980.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1568937600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1568894400
value1=7992.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1568894400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1568865600
value1=7822.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21568880000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1568836800
value1=7932.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21568707200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1568664000
value1=7901.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1568707200
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1568664000
value1=7913.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21568635200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1568592000
value1=7773.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21568361600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1568318400
value1=7909.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1568332800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1568304000
value1=7990.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21568332800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1568289600
value1=8006.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1568304000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1568275200
value1=7894.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568289600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568260800
value1=7967.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21568289600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1568246400
value1=7981.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1568174400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1568145600
value1=7844.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1568102400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1568073600
value1=7883.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21568102400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1568059200
value1=7883.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568016000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567987200
value1=7912.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1567987200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1567785600
value1=7837.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567800000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567771200
value1=7904.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1567800000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1567756800
value1=7918.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567756800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567728000
value1=7908.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567684800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567656000
value1=7854.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1567612800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1567584000
value1=7749.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1567569600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1567526400
value1=7574.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1567512000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1567483200
value1=7681.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21567512000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1567468800
value1=7687.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21567483200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1567440000
value1=7598.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1567483200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1567440000
value1=7586.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21567454400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1567411200
value1=7716.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21567425600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1567382400
value1=7606.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1567152000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1567108800
value1=7675.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1567022400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1566993600
value1=7489.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21567022400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1566979200
value1=7507.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21566993600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1566950400
value1=7622.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21566864000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1566820800
value1=7496.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1566864000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1566820800
value1=7484.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1566820800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1566792000
value1=7414.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21566806400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1566590400
value1=7342.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21566489600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1566446400
value1=7700.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21566460800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1566417600
value1=7796.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21566374400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1566331200
value1=7630.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21566316800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1566273600
value1=7766.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1566288000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1566259200
value1=7678.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21566288000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1566244800
value1=7679.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1566259200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1566230400
value1=7764.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565928000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1565884800
value1=7416.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565899200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1565856000
value1=7588.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1565841600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1565812800
value1=7447.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1565726400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1565697600
value1=7524.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565697600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1565654400
value1=7616.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1565568000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1565366400
value1=7624.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565222400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1565179200
value1=7367.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1565179200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1565150400
value1=7441.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565179200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1565136000
value1=7430.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565164800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1565121600
value1=7539.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1565092800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1565064000
value1=7380.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1565078400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1565049600
value1=7265.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565078400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1565035200
value1=7206.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564963200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1564761600
value1=7626.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1564732800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1564704000
value1=7741.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1564704000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1564675200
value1=8013.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21564704000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1564660800
value1=8028.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564646400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1564617600
value1=7825.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1564516800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1564488000
value1=7912.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1564488000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1564444800
value1=8035.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21564459200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1564416000
value1=7966.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1564430400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1564401600
value1=8043.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21564430400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1564387200
value1=8044.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21564401600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1564358400
value1=7977.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1564401600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1564358400
value1=7965.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21564372800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1564156800
value1=8051.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21564156800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1564113600
value1=8034.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1564099200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1564070400
value1=7894.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21563998400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1563955200
value1=7899.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1563969600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1563940800
value1=7976.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21563969600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1563926400
value1=7982.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1563912000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1563883200
value1=7972.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21563912000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1563868800
value1=7974.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1563480000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1563451200
value1=7915.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21563451200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1563408000
value1=7817.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1563451200
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1563408000
value1=7805.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1563379200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1563350400
value1=7973.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21563350400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1563307200
value1=7905.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1563220800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1563192000
value1=7991.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21563220800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1563177600
value1=7989.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1562846400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1562817600
value1=7964.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1562846400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1562817600
value1=7976.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1562774400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1562745600
value1=7778.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1562745600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1562716800
value1=7871.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21562688000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1562644800
value1=7710.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1562558400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1562356800
value1=7866.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21562544000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1562328000
value1=7762.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1562328000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1562299200
value1=7908.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1562011200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1561982400
value1=7851.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21562011200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1561968000
value1=7842.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1561953600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1561752000
value1=7826.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21561953600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1561737600
value1=7726.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1561593600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1561564800
value1=7683.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21561593600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1561550400
value1=7720.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1561492800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1561464000
value1=7757.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21561478400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1561435200
value1=7679.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1561435200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1561406400
value1=7719.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21561435200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1561392000
value1=7712.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21561392000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1561348800
value1=7791.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21561104000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1561060800
value1=7769.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1561060800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1561032000
value1=7817.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1561060800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1561032000
value1=7829.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21561060800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1561017600
value1=7820.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1560974400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1560945600
value1=7683.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1560772800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1560744000
value1=7539.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1560499200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1560456000
value1=7472.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21560398400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1560355200
value1=7452.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1560326400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1560297600
value1=7548.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21560326400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1560283200
value1=7553.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1560283200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1560254400
value1=7623.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1560283200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1560254400
value1=7635.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21559865600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1559822400
value1=7187.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1559836800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1559808000
value1=7284.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21559764800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1559721600
value1=7265.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1559649600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1559620800
value1=6970.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1559649600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1559606400
value1=6966.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1559592000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1559563200
value1=7153.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1559577600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1559548800
value1=7071.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1559563200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1559534400
value1=7051.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1559275200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1559232000
value1=7277.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1559174400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1559145600
value1=7171.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1559088000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1559059200
value1=7364.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21559088000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1559044800
value1=7389.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21559044800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1559001600
value1=7366.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1558713600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1558684800
value1=7377.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1558656000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1558627200
value1=7247.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1558656000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1558627200
value1=7235.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21558584000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1558540800
value1=7479.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1558555200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1558526400
value1=7389.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21558497600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1558454400
value1=7500.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1558440000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1558411200
value1=7454.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21558353600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1558310400
value1=7573.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1558123200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1558094400
value1=7487.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21558123200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1558080000
value1=7484.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1558008000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1557979200
value1=7456.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21558008000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1557964800
value1=7447.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21557993600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1557950400
value1=7539.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1557950400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1557921600
value1=7328.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21557950400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1557907200
value1=7334.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21557907200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1557864000
value1=7383.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1557820800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1557792000
value1=7301.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1557806400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1557777600
value1=7268.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1557705600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1557504000
value1=7495.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21557705600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1557489600
value1=7410.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1557475200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1557446400
value1=7660.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21557475200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1557432000
value1=7666.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1557432000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1557403200
value1=7459.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1557345600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1557316800
value1=7580.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21557331200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1557288000
value1=7712.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1557244800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1557216000
value1=7782.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21557244800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1557201600
value1=7818.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1557115200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1556913600
value1=7765.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21557115200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1556899200
value1=7886.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1556841600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1556812800
value1=7670.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1556812800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1556784000
value1=7802.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21556726400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1556683200
value1=7876.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1556625600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1556596800
value1=7765.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21556553600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1556510400
value1=7872.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1556308800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1556280000
value1=7851.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21556265600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1556222400
value1=7755.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1556222400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1556193600
value1=7885.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1556193600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1556164800
value1=7886.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21556193600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1556150400
value1=7883.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1556136000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1556107200
value1=7855.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1556136000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1556107200
value1=7867.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21556136000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1556092800
value1=7857.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21556121600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1556078400
value1=7789.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21556092800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1556049600
value1=7847.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1555963200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1555934400
value1=7643.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1555920000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1555891200
value1=7730.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21555920000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1555617600
value1=7735.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21555603200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1555560000
value1=7630.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1555531200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1555502400
value1=7740.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1555531200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1555502400
value1=7752.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21555099200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1555056000
value1=7668.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1555099200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1555056000
value1=7680.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1554969600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554940800
value1=7663.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1554969600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1554940800
value1=7675.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21554883200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1554840000
value1=7549.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1554840000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1554811200
value1=7549.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1554796800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554768000
value1=7625.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21554710400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1554494400
value1=7621.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1554710400
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1554494400
value1=7633.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1554696000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554494400
value1=7621.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1554364800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554336000
value1=7593.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21554220800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1554177600
value1=7448.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1554192000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554163200
value1=7501.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1554134400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554105600
value1=7485.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21554134400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1554091200
value1=7488.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21553673600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1553630400
value1=7328.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1553673600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1553630400
value1=7316.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1553644800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1553601600
value1=7445.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1553616000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1553587200
value1=7319.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21553616000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1553572800
value1=7316.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21553601600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1553558400
value1=7386.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1553256000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1553227200
value1=7534.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1553241600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1553212800
value1=7534.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1553198400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1553169600
value1=7340.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21553169600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1553126400
value1=7435.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1553155200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1553126400
value1=7435.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21553126400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1553083200
value1=7308.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1553097600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1553068800
value1=7387.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21553083200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1553040000
value1=7311.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1553040000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1553011200
value1=7403.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21553040000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1552996800
value1=7417.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21552953600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1552910400
value1=7281.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1552924800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1552896000
value1=7352.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21552924800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1552881600
value1=7354.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1552881600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1552680000
value1=7338.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1552622400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1552593600
value1=7225.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21552593600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1552550400
value1=7313.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1552579200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1552550400
value1=7313.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1552564800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1552521600
value1=7236.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1552536000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1552507200
value1=7306.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21552478400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1552435200
value1=7170.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1552420800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1552377600
value1=7147.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1552392000
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1552348800
value1=7225.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1552262400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1552060800
value1=6941.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21552262400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1552046400
value1=6923.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21551974400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1551931200
value1=7066.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21551844800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1551801600
value1=7202.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1551801600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1551772800
value1=7187.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21551700800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1551657600
value1=7225.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1551700800
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1551657600
value1=7237.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1551657600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1551456000
value1=7114.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21551657600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1551441600
value1=7085.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21551470400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1551427200
value1=7176.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1551398400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1551369600
value1=7148.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21551340800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1551297600
value1=7141.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21551268800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1551225600
value1=7145.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21551182400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1551139200
value1=7056.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1551124800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1551096000
value1=7188.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21550822400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1550779200
value1=7004.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1550822400
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1550779200
value1=6992.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21550764800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1550721600
value1=7114.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21550678400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1550635200
value1=7036.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1550606400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1550577600
value1=7018.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21550606400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1550563200
value1=7021.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1550491200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1550448000
value1=7101.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1550232000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1550203200
value1=6956.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1550160000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1550131200
value1=7072.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21550160000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1550116800
value1=7074.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21550131200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1550088000
value1=6983.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1550131200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1550088000
value1=6971.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21550059200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1550016000
value1=7075.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1549944000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1549915200
value1=6886.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21549944000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1549900800
value1=6879.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21549915200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1549872000
value1=6984.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21549886400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1549843200
value1=6878.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1549483200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1549454400
value1=7059.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1549468800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1549440000
value1=6978.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21549468800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1549425600
value1=6974.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1549454400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1549425600
value1=7037.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1548993600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1548964800
value1=6931.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1548993600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1548964800
value1=6943.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21548849600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1548806400
value1=6653.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1548792000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1548763200
value1=6740.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1548345600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1548316800
value1=6724.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1548273600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1548244800
value1=6736.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21548259200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1548216000
value1=6619.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1548216000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1548187200
value1=6620.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21548216000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1548172800
value1=6591.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1548187200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1548144000
value1=6764.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1548158400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1548129600
value1=6701.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1548043200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1547841600
value1=6809.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21548043200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1547827200
value1=6839.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21547683200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1547640000
value1=6750.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1547640000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1547611200
value1=6712.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21547582400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1547539200
value1=6539.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1547553600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1547524800
value1=6620.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21547553600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1547510400
value1=6620.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1547510400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1547481600
value1=6593.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21547510400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1547467200
value1=6592.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21547424000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1547208000
value1=6548.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1547136000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1547107200
value1=6529.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1547078400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1547049600
value1=6657.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1547064000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1547020800
value1=6541.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1546977600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1546948800
value1=6599.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1546891200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1546848000
value1=6379.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21546588800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1546545600
value1=6111.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21546560000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1546516800
value1=6314.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1546531200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1546502400
value1=6161.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21546531200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1546488000
value1=6161.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1546416000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1546286400
value1=6394.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21546387200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1546257600
value1=6255.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21546243200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1546027200
value1=6305.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21546027200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1545984000
value1=6386.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1545883200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1545681600
value1=6216.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1545624000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1545422400
value1=5986.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1545350400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1545321600
value1=6148.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1545235200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1545206400
value1=6552.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1545177600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1545148800
value1=6576.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1545105600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1545076800
value1=6454.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1545105600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1545076800
value1=6442.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21545048000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1545004800
value1=6659.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1545019200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1544817600
value1=6568.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1544803200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1544774400
value1=6649.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21544702400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1544659200
value1=6840.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1544702400
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1544659200
value1=6852.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1544659200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1544630400
value1=6898.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21544659200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1544616000
value1=6893.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1544587200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1544558400
value1=6669.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21544587200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1544544000
value1=6640.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1544558400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1544529600
value1=6826.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21544529600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1544486400
value1=6647.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1544529600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1544486400
value1=6635.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1544112000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1544083200
value1=6617.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1544112000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1544083200
value1=6605.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1544054400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1544011200
value1=6878.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21543996800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1543953600
value1=6778.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1543953600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1543924800
value1=7075.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21543939200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1543896000
value1=6967.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1543867200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1543838400
value1=7132.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1543852800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1543824000
value1=7158.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21543852800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1543809600
value1=7163.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1543608000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1543579200
value1=6955.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1543579200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1543550400
value1=6934.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21543521600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1543478400
value1=6852.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21543334400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1543291200
value1=6734.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21543276800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1543233600
value1=6581.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1542844800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1542816000
value1=6656.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21542844800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1542801600
value1=6666.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1542772800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1542744000
value1=6490.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1542744000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1542715200
value1=6431.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1542398400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1542369600
value1=6787.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21542398400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1542355200
value1=6785.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1542297600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1542254400
value1=6858.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1542268800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1542240000
value1=6736.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1542211200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1542182400
value1=6778.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1542211200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1542182400
value1=6766.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21542211200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1542168000
value1=6756.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1542096000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1542067200
value1=6801.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1542096000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1542067200
value1=6789.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21542096000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1542052800
value1=6783.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1542024000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1541995200
value1=7111.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21542024000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1541980800
value1=7121.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21541995200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1541779200
value1=6969.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1541736000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1541707200
value1=7121.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21541534400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1541491200
value1=6889.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1541462400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1541433600
value1=6871.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21541433600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1541390400
value1=7002.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1541174400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1541145600
value1=7124.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1541102400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1541073600
value1=6918.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1541088000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1541044800
value1=7012.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1541030400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1541001600
value1=7056.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21540987200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1540944000
value1=6804.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21540944000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1540900800
value1=6642.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21540915200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1540872000
value1=6812.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21540886400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1540843200
value1=6683.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1540584000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1540555200
value1=6730.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1540468800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1540440000
value1=6813.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1540324800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1540296000
value1=6922.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21540324800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1540281600
value1=6994.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21540252800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1540209600
value1=7225.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21540195200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1539979200
value1=7035.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1540195200
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1539979200
value1=7023.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21539950400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1539907200
value1=7192.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21539921600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1539878400
value1=7070.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1539921600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1539878400
value1=7058.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1539864000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1539820800
value1=7243.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1539820800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1539792000
value1=7223.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1539662400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1539633600
value1=7035.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21539648000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1539604800
value1=7173.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1539288000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1539259200
value1=6950.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21539273600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1539230400
value1=6908.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1539158400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1539129600
value1=7417.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21539115200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1539072000
value1=7307.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1539043200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1539014400
value1=7255.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1539014400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1538985600
value1=7356.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1538956800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1538755200
value1=7314.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1538726400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1538697600
value1=7544.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1538697600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1538668800
value1=7423.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1538668800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1538640000
value1=7568.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21538611200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1538568000
value1=7707.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21538553600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1538510400
value1=7608.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1538524800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1538496000
value1=7698.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1538496000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1538467200
value1=7597.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21538409600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1538366400
value1=7720.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1538164800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1538136000
value1=7588.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1538064000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1538035200
value1=7556.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21538064000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1538020800
value1=7550.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21538049600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1538006400
value1=7616.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21537977600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1537934400
value1=7630.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1537977600
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1537934400
value1=7642.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1537804800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1537761600
value1=7528.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1537459200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1537416000
value1=7475.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1537430400
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1537387200
value1=7534.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1537401600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1537372800
value1=7449.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21537401600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1537358400
value1=7432.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1537257600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1537228800
value1=7392.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1537200000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1537171200
value1=7573.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1536825600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1536796800
value1=7516.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21536825600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1536782400
value1=7518.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21536811200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1536768000
value1=7444.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1536696000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1536667200
value1=7390.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21536696000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1536652800
value1=7408.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21536667200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1536624000
value1=7509.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21536609600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1536566400
value1=7506.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1536609600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1536566400
value1=7518.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1536350400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1536321600
value1=7378.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21536264000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1536220800
value1=7565.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1536264000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1536220800
value1=7577.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1536235200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1536206400
value1=7493.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1536235200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1536192000
value1=7505.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1536105600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1536076800
value1=7589.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21535745600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1535702400
value1=7618.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1535716800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1535688000
value1=7681.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1535673600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1535644800
value1=7715.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1535673600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1535644800
value1=7727.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1535659200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1535616000
value1=7628.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21535616000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1535572800
value1=7692.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21535472000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1535428800
value1=7551.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1535472000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1535428800
value1=7539.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1535443200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1535414400
value1=7609.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21535025600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1534982400
value1=7396.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1535011200
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1534968000
value1=7457.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21534924800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1534881600
value1=7331.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1534896000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1534867200
value1=7465.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21534896000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1534852800
value1=7468.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1534780800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1534752000
value1=7434.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1534723200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1534521600
value1=7327.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21534723200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1534507200
value1=7300.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21534521600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1534478400
value1=7409.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1534435200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1534406400
value1=7446.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1534377600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1534348800
value1=7306.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1534334400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1534305600
value1=7420.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21534320000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1534276800
value1=7479.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1534320000
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1534276800
value1=7491.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21534219200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1534176000
value1=7385.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21534204800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1534161600
value1=7494.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1534161600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1534132800
value1=7361.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1533859200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1533830400
value1=7522.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21533801600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1533758400
value1=7437.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1533801600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1533758400
value1=7425.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1533715200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1533686400
value1=7498.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21533585600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1533542400
value1=7373.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1533585600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1533542400
value1=7361.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21533556800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1533513600
value1=7440.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1533240000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1533211200
value1=7199.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21533196800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1533153600
value1=7310.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1533096000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1533067200
value1=7310.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1532995200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1532966400
value1=7155.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1532980800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1532937600
value1=7321.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1532952000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1532923200
value1=7230.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21532952000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1532908800
value1=7239.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21532606400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1532563200
value1=7443.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21532520000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1532476800
value1=7373.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1532361600
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1532318400
value1=7302.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21531972800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1531929600
value1=7370.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21531900800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1531785600
value1=7350.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1531756800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1531728000
value1=7420.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1531728000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1531699200
value1=7424.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1531512000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1531483200
value1=7340.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1531497600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1531468800
value1=7406.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1531483200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1531454400
value1=7424.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21531483200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1531440000
value1=7423.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1531267200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1531238400
value1=7319.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21531224000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1531180800
value1=7341.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1530878400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1530849600
value1=7165.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21530792000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1530748800
value1=6988.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1530648000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1530619200
value1=7161.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21530561600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1530518400
value1=6977.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1530288000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1530259200
value1=7119.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21530288000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1530244800
value1=7121.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1530216000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1530187200
value1=6936.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21530201600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1530158400
value1=7046.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21530144000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1530100800
value1=7158.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1530115200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1530086400
value1=6987.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1530057600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1530028800
value1=7137.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1530014400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1529985600
value1=7027.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21529697600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1529654400
value1=7278.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1529640000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1529611200
value1=7189.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1529582400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1529553600
value1=7353.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21529582400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1529539200
value1=7361.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1529438400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1529409600
value1=7125.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21529438400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1529395200
value1=7133.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1529380800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1529352000
value1=7282.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21529380800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1529337600
value1=7283.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1529092800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1529064000
value1=7210.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21528992000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1528948800
value1=7171.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1528934400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1528905600
value1=7281.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21528920000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1528876800
value1=7200.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21528891200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1528848000
value1=7260.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21528790400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1528747200
value1=7153.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21528488000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1528444800
value1=7071.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21528444800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1528401600
value1=7186.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1528444800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1528401600
value1=7198.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1528401600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1528372800
value1=7241.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1528286400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1528257600
value1=7229.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1528243200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1528200000
value1=7129.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1528128000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1528099200
value1=7146.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1527552000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1527508800
value1=6958.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1527278400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1527249600
value1=6928.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21527264000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1527220800
value1=7011.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1527264000
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1527220800
value1=7023.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21527163200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1527120000
value1=6910.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21527105600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1527062400
value1=6815.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21527019200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1526976000
value1=6969.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1526904000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1526860800
value1=6955.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21526587200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1526544000
value1=6881.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1526299200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1526270400
value1=7016.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21526299200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1526256000
value1=7017.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1526256000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1526054400
value1=6913.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1526068800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1526040000
value1=6997.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1525924800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1525896000
value1=6928.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1525881600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1525852800
value1=6875.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21525780800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1525737600
value1=6859.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21525723200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1525680000
value1=6790.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1525694400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1525665600
value1=6858.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1525694400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1525665600
value1=6870.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1525464000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1525435200
value1=6598.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21525276800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1525233600
value1=6747.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21525176000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1525132800
value1=6649.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1525176000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1525132800
value1=6661.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1525147200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1525118400
value1=6586.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21525104000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1525060800
value1=6734.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1524844800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1524801600
value1=6725.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1524758400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1524729600
value1=6558.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21524758400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1524715200
value1=6546.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1524729600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1524700800
value1=6636.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1524672000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1524643200
value1=6462.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1524672000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1524643200
value1=6450.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1524643200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1524614400
value1=6562.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21524643200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1524600000
value1=6562.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1524628800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1524600000
value1=6507.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21524600000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1524556800
value1=6741.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21524556800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1524513600
value1=6645.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1524139200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1524110400
value1=6884.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1524139200
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1524096000
value1=6888.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21523894400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1523851200
value1=6627.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1523894400
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1523851200
value1=6615.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1523649600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1523620800
value1=6732.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21523620800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1523577600
value1=6629.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1523548800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1523520000
value1=6571.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21523548800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1523505600
value1=6574.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21523534400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1523491200
value1=6647.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1523476800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1523448000
value1=6549.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21523347200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1523304000
value1=6453.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21523289600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1523246400
value1=6540.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21522872000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1522828800
value1=6285.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1522785600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1522756800
value1=6499.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21522785600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1522742400
value1=6481.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1522728000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1522699200
value1=6373.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21522728000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1522684800
value1=6305.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1522296000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1522252800
value1=6420.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1522094400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1522065600
value1=6694.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21522094400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1522051200
value1=6693.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1522051200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1522022400
value1=6559.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1522036800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1521835200
value1=6502.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1521835200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1521806400
value1=6732.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21521806400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1521763200
value1=6567.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1521676800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1521648000
value1=6957.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21521676800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1521633600
value1=6937.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21521662400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1521619200
value1=6851.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1521662400
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1521619200
value1=6839.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1521576000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1521547200
value1=6926.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1521504000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1521475200
value1=6792.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1521475200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1521446400
value1=6907.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21521230400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1521187200
value1=7078.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1521100800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1521072000
value1=6989.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21521057600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1521014400
value1=7118.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1520971200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1520942400
value1=7212.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1520971200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1520942400
value1=7224.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21520870400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1520827200
value1=7175.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1520366400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1520337600
value1=6963.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21520236800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1520020800
value1=6835.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1520020800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1519992000
value1=6631.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1520020800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1519992000
value1=6619.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21519992000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1519948800
value1=6800.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1519761600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1519732800
value1=7028.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21519718400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1519675200
value1=7029.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1519718400
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1519675200
value1=7041.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21519646400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1519603200
value1=6876.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1519617600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1519416000
value1=6948.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1519344000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1519315200
value1=6851.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1519257600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1519228800
value1=6906.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21519257600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1519214400
value1=6883.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21519228800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1519185600
value1=6762.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1519156800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1519128000
value1=6719.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21519041600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1518998400
value1=6838.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21519027200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1518811200
value1=6771.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1518998400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1518796800
value1=6867.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21518552000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1518508800
value1=6462.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1518508800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1518480000
value1=6498.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1518393600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1518192000
value1=6152.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21518393600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1518177600
value1=6268.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1518076800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1518033600
value1=6479.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1518048000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1518019200
value1=6719.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21518048000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1518004800
value1=6742.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1518019200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1517990400
value1=6569.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21518019200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1517976000
value1=6552.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21517990400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1517947200
value1=6696.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1517918400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1517889600
value1=6282.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1517918400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1517889600
value1=6270.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21517918400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1517875200
value1=6243.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1517860800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1517832000
value1=6665.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21517832000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1517788800
value1=6702.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1517515200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1517486400
value1=6879.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1517342400
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1517299200
value1=6986.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1517212800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1517184000
value1=7064.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1517212800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1517184000
value1=7076.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21516924800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1516881600
value1=7001.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1516824000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1516795200
value1=7018.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1516824000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1516780800
value1=7000.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21516723200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1516680000
value1=6972.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1516392000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1516363200
value1=6870.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1516348800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1516305600
value1=6840.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21516305600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1516262400
value1=6781.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1516305600
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1516262400
value1=6769.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1516262400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1516233600
value1=6847.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1516132800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1516104000
value1=6862.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1516132800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1516104000
value1=6874.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21516132800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1516089600
value1=6835.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21516017600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1515974400
value1=6813.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21515628800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1515585600
value1=6606.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1515556800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1515528000
value1=6702.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21514908800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1514865600
value1=6380.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21514894400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1514851200
value1=6440.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1514865600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1514577600
value1=6381.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1514577600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1514548800
value1=6482.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21514577600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1514534400
value1=6482.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1514246400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1513958400
value1=6444.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21513929600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1513886400
value1=6461.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1513900800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1513872000
value1=6530.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1513713600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1513684800
value1=6543.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1513022400
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1512979200
value1=6332.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1512979200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1512763200
value1=6331.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21512720000
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1512676800
value1=6307.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1512676800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1512648000
value1=6275.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1512576000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1512532800
value1=6218.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1512518400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1512489600
value1=6342.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21512504000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1512460800
value1=6217.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1512475200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1512446400
value1=6301.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21512475200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1512432000
value1=6302.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21512460800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1512417600
value1=6245.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1512345600
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1512144000
value1=6271.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21512345600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1512129600
value1=6231.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1512043200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1512014400
value1=6278.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1512028800
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1511985600
value1=6331.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1512000000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1511971200
value1=6266.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21511870400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1511827200
value1=6383.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1511870400
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1511827200
value1=6371.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1511769600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1511740800
value1=6437.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1511380800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1511352000
value1=6413.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1511251200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1511208000
value1=6295.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21511193600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1511150400
value1=6279.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21510819200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1510776000
value1=6243.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21510790400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1510747200
value1=6303.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1510790400
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1510747200
value1=6315.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1510761600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1510732800
value1=6241.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1510603200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1510574400
value1=6269.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21510574400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1510531200
value1=6349.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21510315200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1510272000
value1=6345.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1510272000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1510243200
value1=6237.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21510272000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1510228800
value1=6261.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1510214400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1510185600
value1=6380.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21510099200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1510056000
value1=6290.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1510056000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1510027200
value1=6360.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1510056000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1510027200
value1=6372.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1509955200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1509926400
value1=6327.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1509652800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1509624000
value1=6275.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1509609600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1509580800
value1=6201.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1509566400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1509537600
value1=6306.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1509566400
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1509523200
value1=6313.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1509350400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1509321600
value1=6251.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1508976000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1508947200
value1=6025.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1508976000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1508947200
value1=6013.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21508788800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1508745600
value1=6152.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21508529600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1508486400
value1=6094.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1508500800
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1508472000
value1=6146.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1508227200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1508198400
value1=6152.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21507881600
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1507838400
value1=6057.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21507838400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1507795200
value1=6060.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1507752000
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1507708800
value1=6042.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1507723200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1507680000
value1=6097.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21507694400
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1507651200
value1=6040.700000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1507579200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1507550400
value1=6108.100000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1507320000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1507291200
value1=6024.900000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1507305600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1507276800
value1=6095.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21507147200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1507104000
value1=5971.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1506945600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1506916800
value1=6017.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21506945600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1506902400
value1=6018.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1506945600
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1506902400
value1=6030.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21506643200
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1506600000
value1=5899.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1506456000
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1506427200
value1=5936.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1506427200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1506398400
value1=5858.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1506326400
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1506297600
value1=5973.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1506110400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1506081600
value1=5904.500000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1506081600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1506052800
value1=5908.200000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21505764800
hidden=1
descr=VOx2
color=16777215
selectable=0
angle=0
date1=1505721600
value1=5981.400000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1505491200
hidden=1
descr=VOCM
color=16777215
selectable=0
angle=0
date1=1505448000
value1=5994.000000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1505275200
hidden=1
descr=VO
color=16777215
selectable=0
angle=0
date1=1505246400
value1=6030.300000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1504497600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1504296000
value1=5994.800000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1504094400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1504065600
value1=5924.600000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

</window>

<window>
height=13.267755
objects=0

<indicator>
name=Custom Indicator
path=Indicators\EST_Histogram_v1.ex5
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
name=Color_Histogram
draw=11
style=0
width=2
arrow=251
color=255,25600,42495,3329330
</graph>
<inputs>
PeriodK=5
PeriodD=3
PeriodSlowing=3
Mode_MA=0
Mode_STO=0
LevelIndicatorDown=20
LevelIndicatorUp=80
</inputs>
</indicator>
</window>

<window>
height=14.483839
objects=0

<indicator>
name=Custom Indicator
path=Indicators\RSI_Histogram_v1.ex5
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
name=Color_Histogram
draw=11
style=0
width=2
arrow=251
color=255,25600,42495,3329330
</graph>
<inputs>
PeriodIndicator=14
ApliedPrice=1
LevelIndicatorDown=30
LevelIndicatorUp=70
</inputs>
</indicator>
</window>
</chart>