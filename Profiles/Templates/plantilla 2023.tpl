<chart>
id=132713823097546546
symbol=NZDCAD
description=New Zealand Dollar vs Canadian Dollar
period_type=1
period_size=1
digits=5
tick_size=0.000000
position_time=1673370000
scale_fix=0
scale_fixed_min=0.848200
scale_fixed_max=0.873900
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=4
mode=1
fore=0
grid=0
volume=0
scroll=0
shift=1
shift_size=17.514124
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
window_right=779
window_bottom=864
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

<expert>
name=CONTROL LOTAJE 2
path=Experts\CONTROL LOTAJE PERDIDAS GANANCIAS\CONTROL LOTAJE 2.ex5
expertmode=1
<inputs>
Capital_Base=6000.0
Porcentaje_Perdida=0.6
S1=-----------------------   CONFIGURACION BOTONES  ---------------------
CORNER_BOTON=0
Boton_Desplazamiento_X=5
Boton_Desplazamiento_Y=27
SizeTexto=10
Espacio=1
MagicNumber=22222
</inputs>
</expert>

<window>
height=238.979769
objects=2190

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
scale_fix_max_val=100.000000
expertmode=0
fixed_height=-1

<graph>
name=
draw=129
style=0
width=2
arrow=251
color=16776960
</graph>
period=50
method=0
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
arrow=251
color=13382297
</graph>
period=150
method=0
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\SUPRESFINAL.ex5
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
S1__=-----------------------   Configuracion SOP RES---------------------
Ver_Sop_Res=false
BackLimit=500
pus1=/////////////////////////////////////////////////
zone_show_weak=true
zone_show_untested=true
zone_show_turncoat=true
zone_fuzzfactor=0.75
SeparacionTexto=10
</inputs>
</indicator>

<indicator>
name=Custom Indicator
path=Indicators\INDICADOR PATRONES PRO\PATRONES ANTIGUO PERSONALIZED V4.ex5
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
Settings_Condiciones_Patron=-----------------------Settings CONDICIONES PATRON-----------------------
VelasEvaluadas=1000
Testeado=0
Repintado=false
Tolerancia_Puntos_Flecha=0
Settings_Horario=-----------------------Settings HORARIO-----------------------
Hora_Inicio=8
Hora_Final=8
Domingo=true
Lunes=true
Martes=true
Miercoles=true
Jueves=true
Viernes=true
Settings_Alerts=-----------------------Settings ALERTAS-----------------------
AlertPC=false
AlertMovil=false
AlertMail=false
S1__=-----------------------   Configuracion SOP RES---------------------
Ver_Sop_Res=false
BackLimit=500
S111__=-----------------------   Configuracion TREND FORCE--------------------
trendPeriod=4
TriggerUp=0.8
TriggerDown=-0.8
pus1=/////////////////////////////////////////////////
zone_show_weak=true
zone_show_untested=true
zone_show_turncoat=true
zone_fuzzfactor=0.75
SeparacionTexto=10
Conector=false
</inputs>
</indicator>
<object>
type=109
name=2021.07.26 Todo el día Reunión del Consejo de Economía y Finanz
hidden=1
descr=Reunión del Consejo de Economía y Finanzas
color=16119285
selectable=0
date1=1627268400
</object>

<object>
type=109
name=2021.07.26 10:00 Índice de Precios al Productor a/a
hidden=1
descr=Índice de Precios al Productor a/a 15.4% / 13.2%
color=15658671
selectable=0
date1=1627293600
</object>

<object>
type=109
name=2021.07.26 11:30 Expectaciones de los Negocios del Ifo
hidden=1
descr=Expectaciones de los Negocios del Ifo 101.2 / 103.5
color=13353215
selectable=0
date1=1627299000
</object>

<object>
type=109
name=2021.07.26 11:30 Situación Actual de los Negocios del Ifo
hidden=1
descr=Situación Actual de los Negocios del Ifo 100.4 / 97.7
color=15658671
selectable=0
date1=1627299000
</object>

<object>
type=109
name=2021.07.26 11:30 Clima de Negocios del Ifo
hidden=1
descr=Clima de Negocios del Ifo 100.8 / 100.5
color=15658671
selectable=0
date1=1627299000
</object>

<object>
type=109
name=2021.07.26 15:56 Subasta de Deuda Pública (BTF) a 3 meses
hidden=1
descr=Subasta de Deuda Pública (BTF) a 3 meses
color=16119285
selectable=0
date1=1627314960
</object>

<object>
type=109
name=2021.07.26 15:56 Subasta de Deuda Pública (BTF) a 6 meses
hidden=1
descr=Subasta de Deuda Pública (BTF) a 6 meses
color=16119285
selectable=0
date1=1627314960
</object>

<object>
type=109
name=2021.07.26 15:56 Subasta de Deuda Pública (BTF) a 12 meses
hidden=1
descr=Subasta de Deuda Pública (BTF) a 12 meses
color=16119285
selectable=0
date1=1627314960
</object>

<object>
type=109
name=2021.07.26 17:00 Ventas de Viviendas Nuevas
hidden=1
descr=Ventas de Viviendas Nuevas 0.676 M / 0.814 M
color=13353215
selectable=0
date1=1627318800
</object>

<object>
type=109
name=2021.07.26 17:00 Ventas de Viviendas Nuevas m/m
hidden=1
descr=Ventas de Viviendas Nuevas m/m -6.6% / 4.0%
color=13353215
selectable=0
date1=1627318800
</object>

<object>
type=109
name=2021.07.26 17:30 Índice Manufacturero de la Fed de Dallas
hidden=1
descr=Índice Manufacturero de la Fed de Dallas 27.3 / 33.5
color=13353215
selectable=0
date1=1627320600
</object>

<object>
type=109
name=2021.07.26 18:30 Subasta de Letras del Tesoro a 3 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 3 Meses
color=16119285
selectable=0
date1=1627324200
</object>

<object>
type=109
name=2021.07.26 18:30 Subasta de Letras del Tesoro a 6 Meses
hidden=1
descr=Subasta de Letras del Tesoro a 6 Meses
color=16119285
selectable=0
date1=1627324200
</object>

<object>
type=109
name=2021.07.26 20:00 Subasta de Obligaciones del Estado a 2 Años
hidden=1
descr=Subasta de Obligaciones del Estado a 2 Años
color=16119285
selectable=0
date1=1627329600
</object>

<object>
type=109
name=2021.07.27 11:00 Balanza Comercial no Comunitaria
hidden=1
descr=Balanza Comercial no Comunitaria
color=16119285
selectable=0
date1=1627383600
</object>

<object>
type=109
name=2021.07.27 11:00 Masa Monetaria M3 del BCE a/a
hidden=1
descr=Masa Monetaria M3 del BCE a/a 8.3% / 7.9%
color=15658671
selectable=0
date1=1627383600
</object>

<object>
type=109
name=2021.07.27 11:00 Préstamos para Hogares del BCE a/a
hidden=1
descr=Préstamos para Hogares del BCE a/a 4.0% / 4.2%
color=13353215
selectable=0
date1=1627383600
</object>

<object>
type=109
name=2021.07.27 11:00 Préstamos para Empresas no Financieras del BCE
hidden=1
descr=Préstamos para Empresas no Financieras del BCE a/a 1.9% / 0.7%
color=15658671
selectable=0
date1=1627383600
</object>

<object>
type=109
name=2021.07.27 11:00 Préstamos del Sector Privado del BCE a/a
hidden=1
descr=Préstamos del Sector Privado del BCE a/a 3.0% / 2.6%
color=15658671
selectable=0
date1=1627383600
</object>

<object>
type=109
name=2021.07.27 12:36 Subasta de Deuda a 2 años (CTZ)
hidden=1
descr=Subasta de Deuda a 2 años (CTZ)
color=16119285
selectable=0
date1=1627389360
</object>

<object>
type=109
name=2021.07.27 13:00 Número Total de Solicitantes de Empleo
hidden=1
descr=Número Total de Solicitantes de Empleo 3417.6 K / 3561.8 K
color=15658671
selectable=0
date1=1627390800
</object>

<object>
type=109
name=2021.07.27 15:30 Pedidos de Bienes Duraderos m/m
hidden=1
descr=Pedidos de Bienes Duraderos m/m 0.8% / 0.9%
color=13353215
selectable=0
date1=1627399800
</object>

<object>
type=109
name=2021.07.27 15:30 Pedidos Básicos de Bienes Buraderos m/m
hidden=1
descr=Pedidos Básicos de Bienes Buraderos m/m 0.3% / -0.1%
color=15658671
selectable=0
date1=1627399800
</object>

<object>
type=109
name=2021.07.27 15:30 Pedidos de Bienes Duraderos excl. Defensa m/m
hidden=1
descr=Pedidos de Bienes Duraderos excl. Defensa m/m 1.0% / -0.4%
color=15658671
selectable=0
date1=1627399800
</object>

<object>
type=109
name=2021.07.27 15:30 Pedidos de Bienes de Capital no Relacionados c
hidden=1
descr=Pedidos de Bienes de Capital no Relacionados con la Defensa exc
color=15658671
selectable=0
date1=1627399800
</object>

<object>
type=109
name=2021.07.27 15:30 Envíos de Bienes de Capital no Relacionados co
hidden=1
descr=Envíos de Bienes de Capital no Relacionados con la Defensa excl
color=13353215
selectable=0
date1=1627399800
</object>

<object>
type=109
name=2021.07.27 16:00 Índice de Precios de la Vivienda m/m
hidden=1
descr=Índice de Precios de la Vivienda m/m 1.7% / 1.8%
color=13353215
selectable=0
date1=1627401600
</object>

<object>
type=109
name=2021.07.27 16:00 Índice de Precios Inmobiliarios a/a
hidden=1
descr=Índice de Precios Inmobiliarios a/a 18.1% / 16.7%
color=15658671
selectable=0
date1=1627401600
</object>

<object>
type=109
name=2021.07.27 16:00 Índice de Precios de Vivienda (HPI)
hidden=1
descr=Índice de Precios de Vivienda (HPI) 337.4 / 333.2
color=15658671
selectable=0
date1=1627401600
</object>

<object>
type=109
name=2021.07.27 16:00 Índice Compuesto de Precios de Viviendas S&P/C
hidden=1
descr=Índice Compuesto de Precios de Viviendas S&P/CS-20 s.a. m/m 1.8
color=15658671
selectable=0
date1=1627401600
</object>

<object>
type=109
name=2021.07.27 17:00 Índice de Confianza del Consumidor de la CB
hidden=1
descr=Índice de Confianza del Consumidor de la CB 129.1 / 117.3
color=15658671
selectable=0
date1=1627405200
</object>

<object>
type=109
name=2021.07.27 17:00 Índice de Actividad Manufacturera de la Fed de
hidden=1
descr=Índice de Actividad Manufacturera de la Fed de Richmond 27 / 20
color=15658671
selectable=0
date1=1627405200
</object>

<object>
type=109
name=2021.07.27 17:00 Envíos de Bienes Manufactureros de la Fed de R
hidden=1
descr=Envíos de Bienes Manufactureros de la Fed de Richmond
color=16119285
selectable=0
date1=1627405200
</object>

<object>
type=109
name=2021.07.27 17:00 Ingresos por Servicios de la Fed de Richmond
hidden=1
descr=Ingresos por Servicios de la Fed de Richmond 19 / 27
color=13353215
selectable=0
date1=1627405200
</object>

<object>
type=109
name=2021.07.27 17:30 Ingresos por Servicios de la Fed de Dallas
hidden=1
descr=Ingresos por Servicios de la Fed de Dallas 21.7 / 20.0
color=15658671
selectable=0
date1=1627407000
</object>

<object>
type=109
name=2021.07.27 17:30 Actividad Comercial del Sector Servicios de la
hidden=1
descr=Actividad Comercial del Sector Servicios de la Fed de Dallas 33
color=13353215
selectable=0
date1=1627407000
</object>

<object>
type=109
name=2021.07.27 20:00 Subasta de Obligaciones del Estado a 5 Años
hidden=1
descr=Subasta de Obligaciones del Estado a 5 Años
color=16119285
selectable=0
date1=1627416000
</object>

<object>
type=109
name=2021.07.28 09:00 Índice de Precios de Importación m/m
hidden=1
descr=Índice de Precios de Importación m/m 1.6% / 0.6%
color=13353215
selectable=0
date1=1627462800
</object>

<object>
type=109
name=2021.07.28 09:00 Índice de Precios de Importación a/a
hidden=1
descr=Índice de Precios de Importación a/a 12.9% / 10.9%
color=13353215
selectable=0
date1=1627462800
</object>

<object>
type=109
name=2021.07.28 09:00 Índice de Precios de Exportación m/m
hidden=1
descr=Índice de Precios de Exportación m/m 0.8% / 0.9%
color=13353215
selectable=0
date1=1627462800
</object>

<object>
type=109
name=2021.07.28 09:00 Índice de Precios de Exportación a/a
hidden=1
descr=Índice de Precios de Exportación a/a 5.0% / 4.5%
color=15658671
selectable=0
date1=1627462800
</object>

<object>
type=109
name=2021.07.28 09:00 Clima de Consumo de la GfK
hidden=1
descr=Clima de Consumo de la GfK -0.3 / -3.6
color=15658671
selectable=0
date1=1627462800
</object>

<object>
type=109
name=2021.07.28 09:45 Índice de confianza del consumidor
hidden=1
descr=Índice de confianza del consumidor 101 / 100
color=15658671
selectable=0
date1=1627465500
</object>

<object>
type=109
name=2021.07.28 11:00 Índice de Confianza Empresarial
hidden=1
descr=Índice de Confianza Empresarial 115.7 / 112.7
color=15658671
selectable=0
date1=1627470000
</object>

<object>
type=109
name=2021.07.28 11:00 Índice de Confianza del Consumidor
hidden=1
descr=Índice de Confianza del Consumidor 116.6 / 113.0
color=15658671
selectable=0
date1=1627470000
</object>

<object>
type=109
name=2021.07.28 12:46 Subasta de Deuda a 6 meses (BOT)
hidden=1
descr=Subasta de Deuda a 6 meses (BOT)
color=16119285
selectable=0
date1=1627476360
</object>

<object>
type=109
name=2021.07.28 15:30 Inventarios mayoristas m/m
hidden=1
descr=Inventarios mayoristas m/m 0.8% / 1.2%
color=15658671
selectable=0
date1=1627486200
</object>

<object>
type=109
name=2021.07.28 15:30 Balanza Comercial de Mercancías
hidden=1
descr=Balanza Comercial de Mercancías $-91.207 B / $-88.739 B
color=13353215
selectable=0
date1=1627486200
</object>

<object>
type=109
name=2021.07.28 15:30 Inventarios Minoristas m/m
hidden=1
descr=Inventarios Minoristas m/m 0.3% / -0.8%
color=13353215
selectable=0
date1=1627486200
</object>

<object>
type=109
name=2021.07.28 15:30 Inventarios Minoristas excl. Automóviles m/m
hidden=1
descr=Inventarios Minoristas excl. Automóviles m/m
color=16119285
selectable=0
date1=1627486200
</object>

<object>
type=109
name=2021.07.28 17:30 AIE Cambio en las Reservas de Crudo
hidden=1
descr=AIE Cambio en las Reservas de Crudo -4.089 M / -2.637 M
color=15658671
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 AIE Cambio en las Reservas de Crudo en Cushing
hidden=1
descr=AIE Cambio en las Reservas de Crudo en Cushing -1.268 M / -1.12
color=15658671
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 AIE Cambio en la Importación de Petróleo
hidden=1
descr=AIE Cambio en la Importación de Petróleo -0.616 M / 0.372 M
color=15658671
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 AIE Cambio en la Producción de Combustible Des
hidden=1
descr=AIE Cambio en la Producción de Combustible Destilado -0.163 M /
color=15658671
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 AIE Cambio en las Reservas de Combustible Dest
hidden=1
descr=AIE Cambio en las Reservas de Combustible Destilado -3.088 M / 
color=15658671
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 AIE Cambio en la Producción de Gasolina
hidden=1
descr=AIE Cambio en la Producción de Gasolina 0.649 M / -0.216 M
color=13353215
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 AIE Cambio en las Reservas de Combustible para
hidden=1
descr=AIE Cambio en las Reservas de Combustible para Calefacción 0.10
color=13353215
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 AIE Cambios en las Reservas de Gasolina
hidden=1
descr=AIE Cambios en las Reservas de Gasolina -2.253 M / -0.492 M
color=15658671
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 Cambio de Entradas Diarias de Petróleo Crudo d
hidden=1
descr=Cambio de Entradas Diarias de Petróleo Crudo de Refinería de la
color=16119285
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 17:30 Cambio en la Tasa de Utilización de las Refine
hidden=1
descr=Cambio en la Tasa de Utilización de las Refinerías de la EIA
color=16119285
selectable=0
date1=1627493400
</object>

<object>
type=109
name=2021.07.28 21:00 Declaración del CFMA
hidden=1
descr=Declaración del CFMA
color=16119285
selectable=0
date1=1627506000
</object>

<object>
type=109
name=2021.07.28 21:00 Decisión de la Tasa de Interés de la Reserva F
hidden=1
descr=Decisión de la Tasa de Interés de la Reserva Federal
color=16119285
selectable=0
date1=1627506000
</object>

<object>
type=109
name=2021.07.28 21:30 Conferencia de Prensa del FOMC
hidden=1
descr=Conferencia de Prensa del FOMC
color=16119285
selectable=0
date1=1627507800
</object>

<object>
type=109
name=2021.07.29 09:45 PPI m/m
hidden=1
descr=PPI m/m 1.1% / 0.3%
color=15658671
selectable=0
date1=1627551900
</object>

<object>
type=109
name=2021.07.29 10:00 IPC m/m
hidden=1
descr=IPC m/m -0.7% / 0.5%
color=13353215
selectable=0
date1=1627552800
</object>

<object>
type=109
name=2021.07.29 10:00 IPC a/a
hidden=1
descr=IPC a/a 2.9% / 2.4%
color=15658671
selectable=0
date1=1627552800
</object>

<object>
type=109
name=2021.07.29 10:00 IPCA m/m
hidden=1
descr=IPCA m/m -1.2% / -0.5%
color=13353215
selectable=0
date1=1627552800
</object>

<object>
type=109
name=2021.07.29 10:00 IPCA a/a
hidden=1
descr=IPCA a/a 2.9% / 2.8%
color=15658671
selectable=0
date1=1627552800
</object>

<object>
type=109
name=2021.07.29 10:00 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 15.26% / 16.50%
color=15658671
selectable=0
date1=1627552800
</object>

<object>
type=109
name=2021.07.29 10:55 Cambio del Desempleo
hidden=1
descr=Cambio del Desempleo -91 K / 0 K
color=15658671
selectable=0
date1=1627556100
</object>

<object>
type=109
name=2021.07.29 10:55 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 2.598 M / 2.711 M
color=15658671
selectable=0
date1=1627556100
</object>

<object>
type=109
name=2021.07.29 10:55 Desempleo no ajustado a variaciones estacional
hidden=1
descr=Desempleo no ajustado a variaciones estacionales 2.590 M / 2.64
color=15658671
selectable=0
date1=1627556100
</object>

<object>
type=109
name=2021.07.29 12:00 PPI m/m
hidden=1
descr=PPI m/m 1.4% / 1.4%
color=16119285
selectable=0
date1=1627560000
</object>

<object>
type=109
name=2021.07.29 12:00 Índice de Precios al Productor a/a
hidden=1
descr=Índice de Precios al Productor a/a 9.1% / 9.4%
color=13353215
selectable=0
date1=1627560000
</object>

<object>
type=109
name=2021.07.29 12:00 Indicador de Confianza Industrial
hidden=1
descr=Indicador de Confianza Industrial 14.6 / 12.2
color=15658671
selectable=0
date1=1627560000
</object>

<object>
type=109
name=2021.07.29 12:00 Indicador del Sentimiento servicios
hidden=1
descr=Indicador del Sentimiento servicios 19.3 / 14.8
color=15658671
selectable=0
date1=1627560000
</object>

<object>
type=109
name=2021.07.29 12:00 Indicador del Sentimiento Económico
hidden=1
descr=Indicador del Sentimiento Económico 119.0 / 116.3
color=15658671
selectable=0
date1=1627560000
</object>

<object>
type=109
name=2021.07.29 12:00 Índice de Confianza del Consumidor
hidden=1
descr=Índice de Confianza del Consumidor -4.4 / -4.4
color=16119285
selectable=0
date1=1627560000
</object>

<object>
type=109
name=2021.07.29 12:00 Expectativas de Precios al Consumidor
hidden=1
descr=Expectativas de Precios al Consumidor 30.0 / 27.3
color=15658671
selectable=0
date1=1627560000
</object>

<object>
type=109
name=2021.07.29 12:00 Expectativas de Precios de Venta de la Industr
hidden=1
descr=Expectativas de Precios de Venta de la Industria 35.4 / 42.5
color=13353215
selectable=0
date1=1627560000
</object>

<object>
type=109
name=2021.07.29 13:30 Subasta de Deuda a 5 años (BTP)
hidden=1
descr=Subasta de Deuda a 5 años (BTP)
color=16119285
selectable=0
date1=1627565400
</object>

<object>
type=109
name=2021.07.29 13:30 Subasta de Deuda a 10 años (BTP)
hidden=1
descr=Subasta de Deuda a 10 años (BTP)
color=16119285
selectable=0
date1=1627565400
</object>

<object>
type=109
name=2021.07.29 13:52 Índice de Confianza Empresarial
hidden=1
descr=Índice de Confianza Empresarial 1.9 / 4.4
color=13353215
selectable=0
date1=1627566720
</object>

<object>
type=109
name=2021.07.29 14:30 Actas de la Reunión de Política Monetaria y Cr
hidden=1
descr=Actas de la Reunión de Política Monetaria y Crediticia del BCE
color=16119285
selectable=0
date1=1627569000
</object>

<object>
type=109
name=2021.07.29 15:00 IPC m/m
hidden=1
descr=IPC m/m 0.9% / 0.2%
color=15658671
selectable=0
date1=1627570800
</object>

<object>
type=109
name=2021.07.29 15:00 IPC a/a
hidden=1
descr=IPC a/a 3.8% / 2.3%
color=15658671
selectable=0
date1=1627570800
</object>

<object>
type=109
name=2021.07.29 15:00 IPCA m/m
hidden=1
descr=IPCA m/m 0.5% / 0.1%
color=15658671
selectable=0
date1=1627570800
</object>

<object>
type=109
name=2021.07.29 15:00 IPCA a/a
hidden=1
descr=IPCA a/a 3.1% / 2.1%
color=15658671
selectable=0
date1=1627570800
</object>

<object>
type=109
name=2021.07.29 15:30 Producto Interior Bruto t/t
hidden=1
descr=Producto Interior Bruto t/t 6.5% / -5.8%
color=15658671
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 15:30 Deflactor del PIB t/t
hidden=1
descr=Deflactor del PIB t/t 6.0% / 2.4%
color=15658671
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 15:30 Índice Básico de Precio del PCE m/m
hidden=1
descr=Índice Básico de Precio del PCE m/m 6.1% / 1.8%
color=15658671
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 15:30 Índice de Precio del PCE m/m
hidden=1
descr=Índice de Precio del PCE m/m 6.4% / 1.5%
color=15658671
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 15:30 Consumo Personal Real t/t
hidden=1
descr=Consumo Personal Real t/t 11.8% / 11.5%
color=15658671
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 15:30 PIB Ventas t/t
hidden=1
descr=PIB Ventas t/t 7.7% / 7.6%
color=15658671
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 15:30 Peticiones Iniciales del Subsidio de Desempleo
hidden=1
descr=Peticiones Iniciales del Subsidio de Desempleo 400 K / 390 K
color=13353215
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 15:30 Peticiones Continuas del Subsidio de Desempleo
hidden=1
descr=Peticiones Continuas del Subsidio de Desempleo 3.269 M / 3.060 
color=13353215
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 15:30 Número Medio de Peticiones Iniciales del Subsi
hidden=1
descr=Número Medio de Peticiones Iniciales del Subsidio de Desempleo 
color=13353215
selectable=0
date1=1627572600
</object>

<object>
type=109
name=2021.07.29 17:00 Ventas de Viviendas Pendientes m/m
hidden=1
descr=Ventas de Viviendas Pendientes m/m -1.9% / -3.9%
color=15658671
selectable=0
date1=1627578000
</object>

<object>
type=109
name=2021.07.29 17:00 Ventas de Viviendas Pendientes a/a
hidden=1
descr=Ventas de Viviendas Pendientes a/a -1.9% / 32.3%
color=13353215
selectable=0
date1=1627578000
</object>

<object>
type=109
name=2021.07.29 17:00 Índice de Ventas de Viviendas Pendientes
hidden=1
descr=Índice de Ventas de Viviendas Pendientes
color=16119285
selectable=0
date1=1627578000
</object>

<object>
type=109
name=2021.07.29 17:30 AIE Cambios en la Reserva de Gas Natural
hidden=1
descr=AIE Cambios en la Reserva de Gas Natural 36 B / 52 B
color=15658671
selectable=0
date1=1627579800
</object>

<object>
type=109
name=2021.07.29 18:30 Subasta de Letras del Tesoro a 4 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 4 Semanas
color=16119285
selectable=0
date1=1627583400
</object>

<object>
type=109
name=2021.07.29 18:30 Subasta de Letras del Tesoro a 8 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 8 Semanas
color=16119285
selectable=0
date1=1627583400
</object>

<object>
type=109
name=2021.07.29 20:00 Subasta de Obligaciones del Estado a 7 Años
hidden=1
descr=Subasta de Obligaciones del Estado a 7 Años
color=16119285
selectable=0
date1=1627588800
</object>

<object>
type=109
name=2021.07.30 08:30 Producto Interior Bruto t/t
hidden=1
descr=Producto Interior Bruto t/t 0.9% / -0.4%
color=15658671
selectable=0
date1=1627633800
</object>

<object>
type=109
name=2021.07.30 08:30 Producto Interior Bruto a/a
hidden=1
descr=Producto Interior Bruto a/a 18.7% / -4.6%
color=15658671
selectable=0
date1=1627633800
</object>

<object>
type=109
name=2021.07.30 08:30 Gasto del Consumidor m/m
hidden=1
descr=Gasto del Consumidor m/m 0.3% / -11.9%
color=15658671
selectable=0
date1=1627633800
</object>

<object>
type=109
name=2021.07.30 09:00 Producto Interior Bruto t/t
hidden=1
descr=Producto Interior Bruto t/t 1.5% / -1.8%
color=15658671
selectable=0
date1=1627635600
</object>

<object>
type=109
name=2021.07.30 09:00 Producto Interior Bruto a/a
hidden=1
descr=Producto Interior Bruto a/a 9.6% / -3.4%
color=15658671
selectable=0
date1=1627635600
</object>

<object>
type=109
name=2021.07.30 09:45 IPC m/m
hidden=1
descr=IPC m/m 0.1% / 0.3%
color=13353215
selectable=0
date1=1627638300
</object>

<object>
type=109
name=2021.07.30 09:45 IPC a/a
hidden=1
descr=IPC a/a 1.2% / 1.5%
color=13353215
selectable=0
date1=1627638300
</object>

<object>
type=109
name=2021.07.30 09:45 IPCA m/m
hidden=1
descr=IPCA m/m 0.1% / 0.2%
color=13353215
selectable=0
date1=1627638300
</object>

<object>
type=109
name=2021.07.30 09:45 IPCA a/a
hidden=1
descr=IPCA a/a 1.6% / 1.9%
color=13353215
selectable=0
date1=1627638300
</object>

<object>
type=109
name=2021.07.30 10:00 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 9.7% / 10.6%
color=15658671
selectable=0
date1=1627639200
</object>

<object>
type=109
name=2021.07.30 10:00 Producto Interior Bruto t/t
hidden=1
descr=Producto Interior Bruto t/t 2.8% / -2.5%
color=15658671
selectable=0
date1=1627639200
</object>

<object>
type=109
name=2021.07.30 10:00 Producto Interior Bruto a/a
hidden=1
descr=Producto Interior Bruto a/a 19.8% / -4.3%
color=15658671
selectable=0
date1=1627639200
</object>

<object>
type=109
name=2021.07.30 10:00 Ventas minoristas a/a
hidden=1
descr=Ventas minoristas a/a 1.4% / 32.0%
color=13353215
selectable=0
date1=1627639200
</object>

<object>
type=109
name=2021.07.30 11:00 Producto Interior Bruto t/t
hidden=1
descr=Producto Interior Bruto t/t 2.7% / -0.9%
color=15658671
selectable=0
date1=1627642800
</object>

<object>
type=109
name=2021.07.30 11:00 Producto Interior Bruto a/a
hidden=1
descr=Producto Interior Bruto a/a 17.3% / -1.1%
color=15658671
selectable=0
date1=1627642800
</object>

<object>
type=109
name=2021.07.30 11:00 Cuenta corriente
hidden=1
descr=Cuenta corriente €0.900 B / €-0.004 B
color=15658671
selectable=0
date1=1627642800
</object>

<object>
type=109
name=2021.07.30 12:00 IPC m/m
hidden=1
descr=IPC m/m -0.1% / 0.1%
color=13353215
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 IPC a/a
hidden=1
descr=IPC a/a 2.2% / 1.9%
color=15658671
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 IPCA m/m
hidden=1
descr=IPCA m/m -1.1% / -0.7%
color=13353215
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 IPCA a/a
hidden=1
descr=IPCA a/a 0.9% / 1.3%
color=13353215
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 CPI Básico m/m
hidden=1
descr=CPI Básico m/m -0.4% / 0.0%
color=13353215
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 IPC Básico a/a
hidden=1
descr=IPC Básico a/a 0.7% / 0.9%
color=13353215
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 Producto Interior Bruto t/t
hidden=1
descr=Producto Interior Bruto t/t 2.0% / -0.4%
color=15658671
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 Producto Interior Bruto a/a
hidden=1
descr=Producto Interior Bruto a/a 13.7% / -1.5%
color=15658671
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 7.7% / 7.8%
color=15658671
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 IPC excl. Energía y Comida no Procesada m/m
hidden=1
descr=IPC excl. Energía y Comida no Procesada m/m -0.3% / -0.3%
color=16119285
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 IPC excl. Energía y Comida no Procesada a/a
hidden=1
descr=IPC excl. Energía y Comida no Procesada a/a 0.9% / 0.9%
color=16119285
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 Índice de Precios al Consumidor
hidden=1
descr=Índice de Precios al Consumidor
color=16119285
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:00 IPC Básico
hidden=1
descr=IPC Básico
color=16119285
selectable=0
date1=1627646400
</object>

<object>
type=109
name=2021.07.30 12:30 Índice de Confianza del Consumidor
hidden=1
descr=Índice de Confianza del Consumidor 91.9 / 93.1
color=13353215
selectable=0
date1=1627648200
</object>

<object>
type=109
name=2021.07.30 15:30 Índice Básico de Precio del PCE m/m
hidden=1
descr=Índice Básico de Precio del PCE m/m 0.4% / 0.3%
color=15658671
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Índice Básico de Precio del PCE a/a
hidden=1
descr=Índice Básico de Precio del PCE a/a 3.5% / 3.0%
color=15658671
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Índice de Precio del PCE m/m
hidden=1
descr=Índice de Precio del PCE m/m 0.5% / 0.1%
color=15658671
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Índice de Precio del PCE a/a
hidden=1
descr=Índice de Precio del PCE a/a 4.0% / 3.4%
color=15658671
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Gastos de las Personas Físicas m/m
hidden=1
descr=Gastos de las Personas Físicas m/m 1.0% / -0.2%
color=15658671
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Ingresos Personales m/m
hidden=1
descr=Ingresos Personales m/m 0.1% / -8.2%
color=15658671
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Consumo Personal Real m/m
hidden=1
descr=Consumo Personal Real m/m 0.5% / 0.1%
color=15658671
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Índice de Coste del Empleo t/t
hidden=1
descr=Índice de Coste del Empleo t/t 0.7% / 0.7%
color=16119285
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Beneficios de Empleo t/t
hidden=1
descr=Beneficios de Empleo t/t 0.4% / 0.6%
color=13353215
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 15:30 Salarios de Empleo t/t
hidden=1
descr=Salarios de Empleo t/t 0.9% / 0.8%
color=15658671
selectable=0
date1=1627659000
</object>

<object>
type=109
name=2021.07.30 16:30 Discurso de Christine Lagarde, Presidenta del 
hidden=1
descr=Discurso de Christine Lagarde, Presidenta del BCE
color=16119285
selectable=0
date1=1627662600
</object>

<object>
type=109
name=2021.07.30 16:45 Barómetro de los negocios de Chicago de MNI
hidden=1
descr=Barómetro de los negocios de Chicago de MNI 73.4 / 70.9
color=15658671
selectable=0
date1=1627663500
</object>

<object>
type=109
name=2021.07.30 17:00 Índice del Sentimiento del Consumidor de la Un
hidden=1
descr=Índice del Sentimiento del Consumidor de la Universidad de Mich
color=15658671
selectable=0
date1=1627664400
</object>

<object>
type=109
name=2021.07.30 17:00 Expectativas del Consumidor de la Universidad 
hidden=1
descr=Expectativas del Consumidor de la Universidad de Michigan 79.0 
color=15658671
selectable=0
date1=1627664400
</object>

<object>
type=109
name=2021.07.30 17:00 Condiciones Actuales de la Universidad de Mich
hidden=1
descr=Condiciones Actuales de la Universidad de Michigan 84.5 / 84.5
color=16119285
selectable=0
date1=1627664400
</object>

<object>
type=109
name=2021.07.30 17:00 Previsión de la Inflación de la Universidad de
hidden=1
descr=Previsión de la Inflación de la Universidad de Michigan 4.7% / 
color=13353215
selectable=0
date1=1627664400
</object>

<object>
type=109
name=2021.07.30 17:00 Previsión de la Inflación a 5 años de la Unive
hidden=1
descr=Previsión de la Inflación a 5 años de la Universidad de Michiga
color=13353215
selectable=0
date1=1627664400
</object>

<object>
type=109
name=2021.07.30 18:47 Media Truncada del Consumo Personal Real de la
hidden=1
descr=Media Truncada del Consumo Personal Real de la Fed de Dallas, T
color=13353215
selectable=0
date1=1627670820
</object>

<object>
type=109
name=2021.07.30 20:00 Recuento de Plataformas Petrolíferas de EE.UU 
hidden=1
descr=Recuento de Plataformas Petrolíferas de EE.UU de Baker Hughes
color=16119285
selectable=0
date1=1627675200
</object>

<object>
type=109
name=2021.07.30 20:00 Recuento de plataformas petrolíferas en EE.UU.
hidden=1
descr=Recuento de plataformas petrolíferas en EE.UU. de Baker Hughes
color=16119285
selectable=0
date1=1627675200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Cobre de la 
hidden=1
descr=Posiciones Netas Especulativas de Cobre de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Plata de la 
hidden=1
descr=Posiciones Netas Especulativas de Plata de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Oro de la CF
hidden=1
descr=Posiciones Netas Especulativas de Oro de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Crudo de la 
hidden=1
descr=Posiciones Netas Especulativas de Crudo de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Aluminio de 
hidden=1
descr=Posiciones Netas Especulativas de Aluminio de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Maíz de la C
hidden=1
descr=Posiciones Netas Especulativas de Maíz de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Gas Natural 
hidden=1
descr=Posiciones Netas Especulativas de Gas Natural de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Soja de la C
hidden=1
descr=Posiciones Netas Especulativas de Soja de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Trigo de la 
hidden=1
descr=Posiciones Netas Especulativas de Trigo de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de Nasdaq 100 d
hidden=1
descr=Posiciones Netas Especulativas de Nasdaq 100 de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.30 22:30 Posiciones Netas Especulativas de EUR de la CF
hidden=1
descr=Posiciones Netas Especulativas de EUR de la CFTC
color=16119285
selectable=0
date1=1627684200
</object>

<object>
type=109
name=2021.07.31 03:30 Discurso de la Gobernadora de la Reserva Feder
hidden=1
descr=Discurso de la Gobernadora de la Reserva Federal, Lael Brainard
color=16119285
selectable=0
date1=1627702200
</object>

<object>
type=109
name=2021.11.29 10:00 Discurso de Joachim Wuermeling, miembro de la 
hidden=1
descr=Discurso de Joachim Wuermeling, miembro de la Junta Ejecutiva d
color=16119285
selectable=0
date1=1638180000
</object>

<object>
type=109
name=2021.11.29 10:00 IPC m/m
hidden=1
descr=IPC m/m 0.4% / 1.3%
color=13353215
selectable=0
date1=1638180000
</object>

<object>
type=109
name=2021.11.29 10:00 IPC a/a
hidden=1
descr=IPC a/a 5.6% / 6.1%
color=13353215
selectable=0
date1=1638180000
</object>

<object>
type=109
name=2021.11.29 10:00 IPCA m/m
hidden=1
descr=IPCA m/m 0.3% / 0.5%
color=13353215
selectable=0
date1=1638180000
</object>

<object>
type=109
name=2021.11.29 10:00 IPCA a/a
hidden=1
descr=IPCA a/a 5.6% / 5.7%
color=13353215
selectable=0
date1=1638180000
</object>

<object>
type=109
name=2021.11.29 10:30 Discurso de la presidenta del Comité de Superv
hidden=1
descr=Discurso de la presidenta del Comité de Supervisión del BCE, An
color=16119285
selectable=0
date1=1638181800
</object>

<object>
type=109
name=2021.11.29 11:00 PPI m/m
hidden=1
descr=PPI m/m 7.1% / 1.6%
color=15658671
selectable=0
date1=1638183600
</object>

<object>
type=109
name=2021.11.29 11:00 Índice de Precios al Productor a/a
hidden=1
descr=Índice de Precios al Productor a/a 20.4% / 15.0%
color=15658671
selectable=0
date1=1638183600
</object>

<object>
type=109
name=2021.11.29 12:00 Indicador de Confianza Industrial
hidden=1
descr=Indicador de Confianza Industrial 14.1 / 14.2
color=13353215
selectable=0
date1=1638187200
</object>

<object>
type=109
name=2021.11.29 12:00 Indicador del Sentimiento servicios
hidden=1
descr=Indicador del Sentimiento servicios 18.4 / 16.9
color=15658671
selectable=0
date1=1638187200
</object>

<object>
type=109
name=2021.11.29 12:00 Indicador del Sentimiento Económico
hidden=1
descr=Indicador del Sentimiento Económico 117.5 / 118.3
color=13353215
selectable=0
date1=1638187200
</object>

<object>
type=109
name=2021.11.29 12:00 Índice de Confianza del Consumidor
hidden=1
descr=Índice de Confianza del Consumidor -6.8 / -6.8
color=16119285
selectable=0
date1=1638187200
</object>

<object>
type=109
name=2021.11.29 12:00 Expectativas de Precios al Consumidor
hidden=1
descr=Expectativas de Precios al Consumidor 39.3 / 40.3
color=13353215
selectable=0
date1=1638187200
</object>

<object>
type=109
name=2021.11.29 12:00 Expectativas de Precios de Venta de la Industr
hidden=1
descr=Expectativas de Precios de Venta de la Industria 49.0 / 43.6
color=15658671
selectable=0
date1=1638187200
</object>

<object>
type=109
name=2021.11.29 13:30 Discurso de Isabel Schnabel, Miembro del Conse
hidden=1
descr=Discurso de Isabel Schnabel, Miembro del Consejo Ejecutivo del 
color=16119285
selectable=0
date1=1638192600
</object>

<object>
type=109
name=2021.11.29 13:57 Índice de Confianza Empresarial
hidden=1
descr=Índice de Confianza Empresarial 4.4 / 3.3
color=15658671
selectable=0
date1=1638194220
</object>

<object>
type=109
name=2021.11.29 15:00 IPC m/m
hidden=1
descr=IPC m/m -0.2% / -0.3%
color=15658671
selectable=0
date1=1638198000
</object>

<object>
type=109
name=2021.11.29 15:00 IPC a/a
hidden=1
descr=IPC a/a 5.2% / 4.6%
color=15658671
selectable=0
date1=1638198000
</object>

<object>
type=109
name=2021.11.29 15:00 IPCA m/m
hidden=1
descr=IPCA m/m 0.3% / 0.4%
color=13353215
selectable=0
date1=1638198000
</object>

<object>
type=109
name=2021.11.29 15:00 IPCA a/a
hidden=1
descr=IPCA a/a 6.0% / 4.7%
color=15658671
selectable=0
date1=1638198000
</object>

<object>
type=109
name=2021.11.29 15:55 Subasta de Deuda Pública (BTF) a 3 meses
hidden=1
descr=Subasta de Deuda Pública (BTF) a 3 meses
color=16119285
selectable=0
date1=1638201300
</object>

<object>
type=109
name=2021.11.29 15:55 Subasta de Deuda Pública (BTF) a 6 meses
hidden=1
descr=Subasta de Deuda Pública (BTF) a 6 meses
color=16119285
selectable=0
date1=1638201300
</object>

<object>
type=109
name=2021.11.29 15:55 Subasta de Deuda Pública (BTF) a 12 meses
hidden=1
descr=Subasta de Deuda Pública (BTF) a 12 meses
color=16119285
selectable=0
date1=1638201300
</object>

<object>
type=109
name=2021.11.29 16:00 Discurso del miembro del Comité de Supervisión
hidden=1
descr=Discurso del miembro del Comité de Supervisión del BCE, Pentti 
color=16119285
selectable=0
date1=1638201600
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
name=2021.11.29 17:05 Discurso de Burkhard Balz, miembro de la Junta
hidden=1
descr=Discurso de Burkhard Balz, miembro de la Junta Ejecutiva del Bb
color=16119285
selectable=0
date1=1638205500
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
name=2021.11.29 19:15 Discurso de Christine Lagarde, Presidenta del 
hidden=1
descr=Discurso de Christine Lagarde, Presidenta del BCE
color=16119285
selectable=0
date1=1638213300
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
name=2021.11.29 22:30 Posiciones Netas Especulativas de EUR de la CF
hidden=1
descr=Posiciones Netas Especulativas de EUR de la CFTC
color=16119285
selectable=0
date1=1638225000
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
name=2021.11.30 09:45 IPC m/m
hidden=1
descr=IPC m/m 0.4% / 0.2%
color=15658671
selectable=0
date1=1638265500
</object>

<object>
type=109
name=2021.11.30 09:45 IPC a/a
hidden=1
descr=IPC a/a 2.8% / 2.8%
color=16119285
selectable=0
date1=1638265500
</object>

<object>
type=109
name=2021.11.30 09:45 IPCA m/m
hidden=1
descr=IPCA m/m 0.4% / 0.1%
color=15658671
selectable=0
date1=1638265500
</object>

<object>
type=109
name=2021.11.30 09:45 IPCA a/a
hidden=1
descr=IPCA a/a 3.4% / 3.3%
color=15658671
selectable=0
date1=1638265500
</object>

<object>
type=109
name=2021.11.30 09:45 Producto Interior Bruto t/t
hidden=1
descr=Producto Interior Bruto t/t 3.0% / 3.0%
color=16119285
selectable=0
date1=1638265500
</object>

<object>
type=109
name=2021.11.30 09:45 Producto Interior Bruto a/a
hidden=1
descr=Producto Interior Bruto a/a 3.3% / 3.3%
color=16119285
selectable=0
date1=1638265500
</object>

<object>
type=109
name=2021.11.30 09:45 Gasto del Consumidor m/m
hidden=1
descr=Gasto del Consumidor m/m -0.4% / -1.3%
color=15658671
selectable=0
date1=1638265500
</object>

<object>
type=109
name=2021.11.30 09:45 PPI m/m
hidden=1
descr=PPI m/m 2.9% / 1.2%
color=15658671
selectable=0
date1=1638265500
</object>

<object>
type=109
name=2021.11.30 10:00 Ventas minoristas a/a
hidden=1
descr=Ventas minoristas a/a -0.7% / -1.2%
color=15658671
selectable=0
date1=1638266400
</object>

<object>
type=109
name=2021.11.30 10:55 Cambio del Desempleo
hidden=1
descr=Cambio del Desempleo -34 K / -47 K
color=13353215
selectable=0
date1=1638269700
</object>

<object>
type=109
name=2021.11.30 10:55 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo 2.428 M / 2.479 M
color=15658671
selectable=0
date1=1638269700
</object>

<object>
type=109
name=2021.11.30 10:55 Desempleo no ajustado a variaciones estacional
hidden=1
descr=Desempleo no ajustado a variaciones estacionales 2.317 M / 2.32
color=15658671
selectable=0
date1=1638269700
</object>

<object>
type=109
name=2021.11.30 11:00 Producto Interior Bruto t/t
hidden=1
descr=Producto Interior Bruto t/t 2.6% / 2.6%
color=16119285
selectable=0
date1=1638270000
</object>

<object>
type=109
name=2021.11.30 11:00 Producto Interior Bruto a/a
hidden=1
descr=Producto Interior Bruto a/a 3.9% / 3.8%
color=15658671
selectable=0
date1=1638270000
</object>

<object>
type=109
name=2021.11.30 11:00 Cuenta corriente
hidden=1
descr=Cuenta corriente €2.220 B / €0.351 B
color=15658671
selectable=0
date1=1638270000
</object>

<object>
type=109
name=2021.11.30 12:00 IPC m/m
hidden=1
descr=IPC m/m 0.5% / 0.0%
color=15658671
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 IPC a/a
hidden=1
descr=IPC a/a 4.9% / 4.4%
color=15658671
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 IPCA m/m
hidden=1
descr=IPCA m/m 0.8% / 0.0%
color=15658671
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 IPCA a/a
hidden=1
descr=IPCA a/a 4.0% / 3.3%
color=15658671
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 CPI Básico m/m
hidden=1
descr=CPI Básico m/m 0.1% / 0.5%
color=13353215
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 IPC Básico a/a
hidden=1
descr=IPC Básico a/a 2.6% / 2.1%
color=15658671
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 IPC excl. Energía y Comida no Procesada m/m
hidden=1
descr=IPC excl. Energía y Comida no Procesada m/m 0.1% / 0.3%
color=13353215
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 IPC excl. Energía y Comida no Procesada a/a
hidden=1
descr=IPC excl. Energía y Comida no Procesada a/a 2.6% / 2.1%
color=15658671
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 Índice de Precios al Consumidor
hidden=1
descr=Índice de Precios al Consumidor
color=16119285
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:00 IPC Básico
hidden=1
descr=IPC Básico
color=16119285
selectable=0
date1=1638273600
</object>

<object>
type=109
name=2021.11.30 12:15 Discurso del Presidente del Banco Federal de A
hidden=1
descr=Discurso del Presidente del Banco Federal de Alemania, Jens Wei
color=16119285
selectable=0
date1=1638274500
</object>

<object>
type=109
name=2021.11.30 13:14 Subasta de Deuda a 5 años (BTP)
hidden=1
descr=Subasta de Deuda a 5 años (BTP)
color=16119285
selectable=0
date1=1638278040
</object>

<object>
type=109
name=2021.11.30 13:14 Subasta de Deuda a 10 años (BTP)
hidden=1
descr=Subasta de Deuda a 10 años (BTP)
color=16119285
selectable=0
date1=1638278040
</object>

<object>
type=109
name=2021.11.30 16:00 Índice de Precios de la Vivienda m/m
hidden=1
descr=Índice de Precios de la Vivienda m/m 0.9% / 1.4%
color=13353215
selectable=0
date1=1638288000
</object>

<object>
type=109
name=2021.11.30 16:00 Índice de Precios Inmobiliarios a/a
hidden=1
descr=Índice de Precios Inmobiliarios a/a 17.7% / 19.3%
color=13353215
selectable=0
date1=1638288000
</object>

<object>
type=109
name=2021.11.30 16:00 Índice de Precios de Vivienda (HPI)
hidden=1
descr=Índice de Precios de Vivienda (HPI) 354.6 / 353.8
color=15658671
selectable=0
date1=1638288000
</object>

<object>
type=109
name=2021.11.30 16:00 Índice Compuesto de Precios de Viviendas S&P/C
hidden=1
descr=Índice Compuesto de Precios de Viviendas S&P/CS-20 s.a. m/m 1.0
color=13353215
selectable=0
date1=1638288000
</object>

<object>
type=109
name=2021.11.30 16:45 Barómetro de los negocios de Chicago de MNI
hidden=1
descr=Barómetro de los negocios de Chicago de MNI 61.8 / 66.8
color=13353215
selectable=0
date1=1638290700
</object>

<object>
type=109
name=2021.11.30 17:00 Anuncio del Presidente del Sistema de la Reser
hidden=1
descr=Anuncio del Presidente del Sistema de la Reserva Federal, Jerom
color=16119285
selectable=0
date1=1638291600
</object>

<object>
type=109
name=2021.11.30 17:00 Índice de Confianza del Consumidor de la CB
hidden=1
descr=Índice de Confianza del Consumidor de la CB 109.5 / 111.6
color=13353215
selectable=0
date1=1638291600
</object>

<object>
type=109
name=2021.11.30 17:30 Ingresos por Servicios de la Fed de Dallas
hidden=1
descr=Ingresos por Servicios de la Fed de Dallas 25.4 / 16.9
color=15658671
selectable=0
date1=1638293400
</object>

<object>
type=109
name=2021.11.30 17:30 Actividad Comercial del Sector Servicios de la
hidden=1
descr=Actividad Comercial del Sector Servicios de la Fed de Dallas 22
color=15658671
selectable=0
date1=1638293400
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
name=2021.11.30 18:30 Subasta de Letras del Tesoro a 52 Semanas
hidden=1
descr=Subasta de Letras del Tesoro a 52 Semanas
color=16119285
selectable=0
date1=1638297000
</object>

<object>
type=109
name=2021.11.30 19:00 Discurso de Claudia Buch, Vicepresidenta del B
hidden=1
descr=Discurso de Claudia Buch, Vicepresidenta del Bbk
color=16119285
selectable=0
date1=1638298800
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
name=2021.12.01 09:00 Ventas Minoristas m/m
hidden=1
descr=Ventas Minoristas m/m
color=16119285
selectable=0
date1=1638349200
</object>

<object>
type=109
name=2021.12.01 09:00 Ventas minoristas a/a
hidden=1
descr=Ventas minoristas a/a
color=16119285
selectable=0
date1=1638349200
</object>

<object>
type=109
name=2021.12.01 10:00 Registro de Nuevos Automóviles m/m
hidden=1
descr=Registro de Nuevos Automóviles m/m
color=16119285
selectable=0
date1=1638352800
</object>

<object>
type=109
name=2021.12.01 10:00 Registro de Nuevos Automóviles a/a
hidden=1
descr=Registro de Nuevos Automóviles a/a
color=16119285
selectable=0
date1=1638352800
</object>

<object>
type=109
name=2021.12.01 10:00 Reunión de Política no Monetaria del BCE
hidden=1
descr=Reunión de Política no Monetaria del BCE
color=16119285
selectable=0
date1=1638352800
</object>

<object>
type=109
name=2021.12.01 10:15 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit
color=16119285
selectable=0
date1=1638353700
</object>

<object>
type=109
name=2021.12.01 10:45 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit
color=16119285
selectable=0
date1=1638355500
</object>

<object>
type=109
name=2021.12.01 10:50 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit
color=16119285
selectable=0
date1=1638355800
</object>

<object>
type=109
name=2021.12.01 10:55 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit
color=16119285
selectable=0
date1=1638356100
</object>

<object>
type=109
name=2021.12.01 11:00 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit
color=16119285
selectable=0
date1=1638356400
</object>

<object>
type=109
name=2021.12.01 12:30 Subasta de Obligaciones del Estado a 5 Años
hidden=1
descr=Subasta de Obligaciones del Estado a 5 Años
color=16119285
selectable=0
date1=1638361800
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
name=2021.12.01 16:45 PMI de Manufacturación de Markit
hidden=1
descr=PMI de Manufacturación de Markit
color=16119285
selectable=0
date1=1638377100
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
name=2021.12.01 19:00 Discurso de Johannes Beermann, miembro de la J
hidden=1
descr=Discurso de Johannes Beermann, miembro de la Junta Ejecutiva de
color=16119285
selectable=0
date1=1638385200
</object>

<object>
type=109
name=2021.12.01 19:00 Registro de Nuevos Automóviles m/m
hidden=1
descr=Registro de Nuevos Automóviles m/m
color=16119285
selectable=0
date1=1638385200
</object>

<object>
type=109
name=2021.12.01 19:00 Registro de Nuevos Automóviles a/a
hidden=1
descr=Registro de Nuevos Automóviles a/a
color=16119285
selectable=0
date1=1638385200
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
name=2021.12.02 10:00 Variación del Desempleo
hidden=1
descr=Variación del Desempleo
color=16119285
selectable=0
date1=1638439200
</object>

<object>
type=109
name=2021.12.02 11:00 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo
color=16119285
selectable=0
date1=1638442800
</object>

<object>
type=109
name=2021.12.02 11:40 Subasta de Obligaciones del Estado a 10 años
hidden=1
descr=Subasta de Obligaciones del Estado a 10 años
color=16119285
selectable=0
date1=1638445200
</object>

<object>
type=109
name=2021.12.02 12:00 PPI m/m
hidden=1
descr=PPI m/m
color=16119285
selectable=0
date1=1638446400
</object>

<object>
type=109
name=2021.12.02 12:00 Índice de Precios al Productor a/a
hidden=1
descr=Índice de Precios al Productor a/a
color=16119285
selectable=0
date1=1638446400
</object>

<object>
type=109
name=2021.12.02 12:00 Tasa de Desempleo
hidden=1
descr=Tasa de Desempleo
color=16119285
selectable=0
date1=1638446400
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
name=2021.12.02 16:00 Discurso de Fabio Panetta, Miembro del Consejo
hidden=1
descr=Discurso de Fabio Panetta, Miembro del Consejo Ejecutivo del BC
color=16119285
selectable=0
date1=1638460800
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
name=2021.12.02 18:00 Discurso de Randal Quarles, Gobernador de la F
hidden=1
descr=Discurso de Randal Quarles, Gobernador de la Fed
color=16119285
selectable=0
date1=1638468000
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
name=2021.12.03 09:45 Producción Industrial m/m
hidden=1
descr=Producción Industrial m/m
color=16119285
selectable=0
date1=1638524700
</object>

<object>
type=109
name=2021.12.03 09:45 Balace Presupuestario del Gobierno
hidden=1
descr=Balace Presupuestario del Gobierno
color=16119285
selectable=0
date1=1638524700
</object>

<object>
type=109
name=2021.12.03 10:15 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit
color=16119285
selectable=0
date1=1638526500
</object>

<object>
type=109
name=2021.12.03 10:15 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit
color=16119285
selectable=0
date1=1638526500
</object>

<object>
type=109
name=2021.12.03 10:30 Discurso de Christine Lagarde, Presidenta del 
hidden=1
descr=Discurso de Christine Lagarde, Presidenta del BCE
color=16119285
selectable=0
date1=1638527400
</object>

<object>
type=109
name=2021.12.03 10:45 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit
color=16119285
selectable=0
date1=1638528300
</object>

<object>
type=109
name=2021.12.03 10:45 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit
color=16119285
selectable=0
date1=1638528300
</object>

<object>
type=109
name=2021.12.03 10:50 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit
color=16119285
selectable=0
date1=1638528600
</object>

<object>
type=109
name=2021.12.03 10:50 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit
color=16119285
selectable=0
date1=1638528600
</object>

<object>
type=109
name=2021.12.03 10:55 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit
color=16119285
selectable=0
date1=1638528900
</object>

<object>
type=109
name=2021.12.03 10:55 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit
color=16119285
selectable=0
date1=1638528900
</object>

<object>
type=109
name=2021.12.03 11:00 PMI de servicios de Markit
hidden=1
descr=PMI de servicios de Markit
color=16119285
selectable=0
date1=1638529200
</object>

<object>
type=109
name=2021.12.03 11:00 PMI de Compuesto de Markit
hidden=1
descr=PMI de Compuesto de Markit
color=16119285
selectable=0
date1=1638529200
</object>

<object>
type=109
name=2021.12.03 12:00 Ventas Minoristas m/m
hidden=1
descr=Ventas Minoristas m/m
color=16119285
selectable=0
date1=1638532800
</object>

<object>
type=109
name=2021.12.03 12:00 Ventas minoristas a/a
hidden=1
descr=Ventas minoristas a/a
color=16119285
selectable=0
date1=1638532800
</object>

<object>
type=109
name=2021.12.03 13:00 Registro de Nuevos Automóviles m/m
hidden=1
descr=Registro de Nuevos Automóviles m/m
color=16119285
selectable=0
date1=1638536400
</object>

<object>
type=109
name=2021.12.03 13:00 Registro de Nuevos Automóviles a/a
hidden=1
descr=Registro de Nuevos Automóviles a/a
color=16119285
selectable=0
date1=1638536400
</object>

<object>
type=109
name=2021.12.03 15:00 Discurso del miembro del Comité Ejecutivo del 
hidden=1
descr=Discurso del miembro del Comité Ejecutivo del BCE, Philip Lane
color=16119285
selectable=0
date1=1638543600
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
name=2021.12.03 22:30 Posiciones Netas Especulativas de EUR de la CF
hidden=1
descr=Posiciones Netas Especulativas de EUR de la CFTC
color=16119285
selectable=0
date1=1638570600
</object>

<object>
type=20
name=SSSR#S0 Strength=Turncoat
hidden=1
color=2330219
background=1
selectable=0
filling=1
date1=1672416000
date2=1674072000
value1=0.863350
value2=0.860540
</object>

<object>
type=20
name=SSSR#S1 Strength=Verified, Test Count=1
hidden=1
color=32768
background=1
selectable=0
filling=1
date1=1672934400
date2=1674072000
value1=0.844430
value2=0.842024
</object>

<object>
type=20
name=SSSR#S2 Strength=Verified, Test Count=2
hidden=1
color=32768
background=1
selectable=0
filling=1
date1=1673568000
date2=1674072000
value1=0.854775
value2=0.849074
</object>

<object>
type=101
name=SSSR#0LBL
hidden=1
descr=Roto Soporte                        
color=2330219
selectable=0
angle=0
date1=1674075600
value1=0.861945
fontsz=10
fontnm=Courier New
anchorpos=0
</object>

<object>
type=100
name=SSSR#1LBL
hidden=1
color=32768
width=6
selectable=0
code_arrow=140
date1=1674075600
value1=0.843227
</object>

<object>
type=100
name=SSSR#2LBL
hidden=1
color=32768
width=6
selectable=0
code_arrow=141
date1=1674075600
value1=0.851924
</object>

<object>
type=101
name=VelasOPV1673928000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1673920800
value1=0.858020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1673870400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1673863200
value1=0.853080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1673524800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1673517600
value1=0.851950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1673438400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1673431200
value1=0.853410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1673359200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1673352000
value1=0.855480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21672992000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1672981200
value1=0.848030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1672808400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1672801200
value1=0.856800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21672808400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1672797600
value1=0.856490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1672747200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1672740000
value1=0.845800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1672747200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1672740000
value1=0.845400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1672711200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1672704000
value1=0.854960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21672711200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1672700400
value1=0.854790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1672693200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1672686000
value1=0.856070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1672290000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1672282800
value1=0.861600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1672254000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1672246800
value1=0.860580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1672254000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1672246800
value1=0.860980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1672243200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1672236000
value1=0.857860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1671696000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1671688800
value1=0.859400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21671696000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1671685200
value1=0.860280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1671656400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1671649200
value1=0.853970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1671512400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1671505200
value1=0.863360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1671469200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1671462000
value1=0.867930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1671228000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1671220800
value1=0.875960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1671213600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1671206400
value1=0.873570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1671112800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1671105600
value1=0.863400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1670954400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1670947200
value1=0.881950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1670954400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1670947200
value1=0.882350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1670850000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1670842800
value1=0.878040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21670817600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1670806800
value1=0.871430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1670342400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1670335200
value1=0.865650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1669986000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1669978800
value1=0.861520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21669986000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1669975200
value1=0.861850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1669831200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1669824000
value1=0.837770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21669831200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1669820400
value1=0.839730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1669784400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1669777200
value1=0.844780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1669752000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1669744800
value1=0.846300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1669752000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1669744800
value1=0.846700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21669388400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1669377600
value1=0.831300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1669312800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1669305600
value1=0.838710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1669312800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1669305600
value1=0.839110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1669273200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1669266000
value1=0.836190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21669273200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1669262400
value1=0.836570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1669035600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1669028400
value1=0.820300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1669010400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1669003200
value1=0.821910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1668787200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1668780000
value1=0.828650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1668510000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1668502800
value1=0.817100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1668510000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1668502800
value1=0.817500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21668438000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1668427200
value1=0.805910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1668171600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1668164400
value1=0.806000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21668171600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1668160800
value1=0.805970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1667970000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1667962800
value1=0.797760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1667905200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1667898000
value1=0.797630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21667548800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1667538000
value1=0.796310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1667397600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1667390400
value1=0.801680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21667397600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1667386800
value1=0.801690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21667372400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1667361600
value1=0.799240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1667322000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1667314800
value1=0.799970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1667322000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1667314800
value1=0.800370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21667322000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1667311200
value1=0.800060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21667282400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1667271600
value1=0.796300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1666882800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1666875600
value1=0.788540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1666850400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1666843200
value1=0.793090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1666706400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1666699200
value1=0.778780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1666382400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1666375200
value1=0.788280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1666252800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1666245600
value1=0.776130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21666252800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1666242000
value1=0.775570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1666112400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1666105200
value1=0.783870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1666112400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1666105200
value1=0.784270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21666112400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1666101600
value1=0.784610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1666069200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1666062000
value1=0.778180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1665727200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1665720000
value1=0.779960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1665504000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1665496800
value1=0.775010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1665464400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1665457200
value1=0.770030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21665464400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1665453600
value1=0.769850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1664985600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1664978400
value1=0.773790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1664866800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1664859600
value1=0.774310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1664758800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1664575200
value1=0.772260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1664758800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1664575200
value1=0.771860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1664568000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1664560800
value1=0.774920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1664460000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1664452800
value1=0.780380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1664348400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1664341200
value1=0.767940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1664301600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1664294400
value1=0.774600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1664168400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1664161200
value1=0.774120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1664168400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1664161200
value1=0.773720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1663945200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1663938000
value1=0.781230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1663653600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1663646400
value1=0.786430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1663617600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1663610400
value1=0.788060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1663318800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1663311600
value1=0.793140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1663088400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1663081200
value1=0.787860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1663081200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1663074000
value1=0.799120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21662944400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1662760800
value1=0.794110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1662728400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1662721200
value1=0.799410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1662670800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1662663600
value1=0.791340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1662469200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1662462000
value1=0.796480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1662454800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1662447600
value1=0.798810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1662109200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1662102000
value1=0.796240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1662109200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1662102000
value1=0.795840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1662037200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1662030000
value1=0.806380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21662037200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1662026400
value1=0.806170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21661796000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1661785200
value1=0.801750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1661554800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1661547600
value1=0.798890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1661554800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1661547600
value1=0.798490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1660942800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1660935600
value1=0.801580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1660294800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1660287600
value1=0.825140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1660294800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1660287600
value1=0.825540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1660237200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1660230000
value1=0.824090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1660201200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1660194000
value1=0.816220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1659942000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1659934800
value1=0.810360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21659942000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1659931200
value1=0.810330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1659697200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1659690000
value1=0.812740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1659481200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1659474000
value1=0.804220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1659481200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1659474000
value1=0.803820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1659445200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1659438000
value1=0.806920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21659445200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1659434400
value1=0.806740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1659117600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1659110400
value1=0.798380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1659117600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1659110400
value1=0.797980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1658952000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1658944800
value1=0.797810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21658779200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1658768400
value1=0.803440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1658725200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1658718000
value1=0.804340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21658725200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1658714400
value1=0.803660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1658512800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1658505600
value1=0.809050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1658512800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1658505600
value1=0.809450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1658350800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1658343600
value1=0.801200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1658307600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1658300400
value1=0.807460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21658307600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1658296800
value1=0.807470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21658221200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1658210400
value1=0.802010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1657818000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1657810800
value1=0.802900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1657818000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1657810800
value1=0.803300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1657267200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1657260000
value1=0.803780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1656975600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1656968400
value1=0.796990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1656511200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1656504000
value1=0.799830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1656511200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1656504000
value1=0.799430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21656511200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1656500400
value1=0.799530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1656435600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1656428400
value1=0.804170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1656435600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1656428400
value1=0.803770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1655924400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1655917200
value1=0.816310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1655805600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1655798400
value1=0.818260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1655737200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1655730000
value1=0.827570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1655233200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1655226000
value1=0.802560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1655233200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1655226000
value1=0.802160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21655182800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1655172000
value1=0.809910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1654772400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1654765200
value1=0.812200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1654603200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1654596000
value1=0.811600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1654596000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1654588800
value1=0.812130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1654520400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1654513200
value1=0.821650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1654275600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1654268400
value1=0.818930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1654189200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1654182000
value1=0.826200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21654189200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1654178400
value1=0.826120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1653541200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1653534000
value1=0.832840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21653372000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1653361200
value1=0.822720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1653274800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1653267600
value1=0.824260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1653267600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1653087600
value1=0.823410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1652954400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1652947200
value1=0.814940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21652954400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1652943600
value1=0.814690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1652911200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1652904000
value1=0.810340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21652857200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1652846400
value1=0.816350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1652792400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1652785200
value1=0.816670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1652720400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1652713200
value1=0.813990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1652464800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1652457600
value1=0.808470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1652450400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1652443200
value1=0.810240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1652277600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1652270400
value1=0.823660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21652277600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1652266800
value1=0.823590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1651748400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1651741200
value1=0.828920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1651572000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1651564800
value1=0.826190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1651474800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1651467600
value1=0.826060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1651266000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1651258800
value1=0.827430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1651165200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1651158000
value1=0.830180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1651165200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1651158000
value1=0.829780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1651089600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1651082400
value1=0.838100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21651089600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1651078800
value1=0.838110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1651071600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1651064400
value1=0.846140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21651071600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1651060800
value1=0.846350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1650880800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1650873600
value1=0.838240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21650880800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1650870000
value1=0.838180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1650434400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1650427200
value1=0.853650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1650373200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1650366000
value1=0.852090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1650315600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1650308400
value1=0.847120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1650315600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1650308400
value1=0.846720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21650024000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1650013200
value1=0.851820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1649847600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1649840400
value1=0.857990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1649746800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1649739600
value1=0.864870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1649440800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1649433600
value1=0.859880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1649440800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1649433600
value1=0.859480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1649271600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1649264400
value1=0.865660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1649246400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1649239200
value1=0.870810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1649156400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1649149200
value1=0.873330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1649156400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1649149200
value1=0.873730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1648839600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1648832400
value1=0.862970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1648803600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1648796400
value1=0.863800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1648760400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1648753200
value1=0.864860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1648184400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1648177200
value1=0.874650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1648047600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1648040400
value1=0.877190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1647900000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1647892800
value1=0.865440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1647612000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1647604800
value1=0.866670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1647457200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1647450000
value1=0.868700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1647363600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1647356400
value1=0.871530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21647007200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1646996400
value1=0.872250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1646841600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1646834400
value1=0.879810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1646748000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1646740800
value1=0.878540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646629200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646622000
value1=0.881100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1646629200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1646622000
value1=0.881500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1646013600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1646006400
value1=0.851860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1645747200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1645740000
value1=0.860090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1645686000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1645678800
value1=0.856190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21645686000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1645675200
value1=0.856860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645542000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645534800
value1=0.859600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1645542000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1645534800
value1=0.860000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645452000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645444800
value1=0.857820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21645452000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1645441200
value1=0.857750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1645106400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1645099200
value1=0.853420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1645020000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1645012800
value1=0.841890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1644890400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1644883200
value1=0.840790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1644620400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1644613200
value1=0.844660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21644523200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1644512400
value1=0.852300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1644418800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1644411600
value1=0.849750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21644235200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1644224400
value1=0.845020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643850000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1643842800
value1=0.838270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643810400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1643799600
value1=0.843610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643634000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1643626800
value1=0.838580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643410800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1643403600
value1=0.834540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643385600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1643374800
value1=0.835250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21643353200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1643342400
value1=0.836020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643313600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1643306400
value1=0.836720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1643212800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1643205600
value1=0.839630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643104800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1643097600
value1=0.842870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1643054400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1643047200
value1=0.846970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1642770000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1642762800
value1=0.840220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21642770000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1642759200
value1=0.840010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21642701600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1642690800
value1=0.849000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1642701600
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1642690800
value1=0.850000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1642586400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1642579200
value1=0.850460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21642449600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1642438800
value1=0.849940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1642395600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1642388400
value1=0.851200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1642003200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1641996000
value1=0.849210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1641268800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1641261600
value1=0.867410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1641232800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1641225600
value1=0.863450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640977200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640970000
value1=0.863580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1640804400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1640797200
value1=0.876500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1640358000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1640350800
value1=0.871280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21640358000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1640347200
value1=0.871170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1640314800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1640307600
value1=0.872620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21640314800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1640304000
value1=0.872460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640192400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640185200
value1=0.877560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1640192400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1640185200
value1=0.877960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1640127600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1640120400
value1=0.875410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1640052000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1640044800
value1=0.866920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1639738800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1639731600
value1=0.865320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1639659600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1639652400
value1=0.872700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21639659600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1639648800
value1=0.873040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1638871200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1638864000
value1=0.862850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1638795600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1638788400
value1=0.863050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21638442800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1638432000
value1=0.869950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1638442800
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1638432000
value1=0.868950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21638277200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1638266400
value1=0.873610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1638205200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1638198000
value1=0.866490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1637931600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1637924400
value1=0.871430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1637841600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1637834400
value1=0.866860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1637715600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1637708400
value1=0.879200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637654400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637647200
value1=0.879500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1637571600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1637564400
value1=0.887160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1637218800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1637211600
value1=0.887630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21637218800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1637208000
value1=0.887670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1637186400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1637179200
value1=0.884260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21637089200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1637078400
value1=0.877020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1636646400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1636639200
value1=0.884430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1636542000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1636534800
value1=0.881660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1636394400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1636387200
value1=0.894340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1636394400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1636387200
value1=0.894740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21636394400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1636383600
value1=0.894840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1636362000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1636354800
value1=0.890040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21636142400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1636131600
value1=0.887300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1635958800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1635951600
value1=0.888820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21635958800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1635948000
value1=0.888830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1635170400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1635163200
value1=0.881310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1634922000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1634914800
value1=0.880100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1634839200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1634832000
value1=0.882020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21634839200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1634828400
value1=0.882020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634752800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634745600
value1=0.888600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634626800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634619600
value1=0.881050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1634626800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1634619600
value1=0.881450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1634230800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1634223600
value1=0.872330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1634230800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1634223600
value1=0.872730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21634230800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1634220000
value1=0.872290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1634216400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1634209200
value1=0.870670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1634184000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1634176800
value1=0.868210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21633672800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1633662000
value1=0.872180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21633633200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1633622400
value1=0.868540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1633622400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1633615200
value1=0.873380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21633622400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1633611600
value1=0.873500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1633546800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1633539600
value1=0.874380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21633546800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1633536000
value1=0.874580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1633528800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1633521600
value1=0.868780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21633528800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1633518000
value1=0.868670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632744000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632736800
value1=0.884790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21632744000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1632733200
value1=0.884720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1632420000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1632412800
value1=0.898060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632398400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632391200
value1=0.890250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21632315600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1632304800
value1=0.900210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1632157200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1632150000
value1=0.903310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1632121200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1632114000
value1=0.900100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21632121200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1632110400
value1=0.899970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1631732400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1631725200
value1=0.897310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631188800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631181600
value1=0.904510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1631188800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1631181600
value1=0.904910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631127600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631120400
value1=0.903130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1631120400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1631113200
value1=0.901550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630605600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630598400
value1=0.896390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1630605600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1630598400
value1=0.896790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1630512000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1630504800
value1=0.886220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1630022400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1630015200
value1=0.882360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1630022400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1630015200
value1=0.882760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1629946800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1629939600
value1=0.876340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629770400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629763200
value1=0.869800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1629266400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1629259200
value1=0.877250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21629176400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1629165600
value1=0.884760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1629140400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1629133200
value1=0.884530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1628758800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1628751600
value1=0.878480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1628694000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1628686800
value1=0.879140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1628474400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1628467200
value1=0.877290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1628078400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1628071200
value1=0.887680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21627642800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1627632000
value1=0.869900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1627642800
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1627632000
value1=0.868900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21627063200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1627052400
value1=0.879280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1626897600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1626890400
value1=0.873150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1626897600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1626890400
value1=0.872750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21626159600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1626148800
value1=0.872900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1626112800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1626105600
value1=0.872320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21625637600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1625626800
value1=0.875560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1625076000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1625068800
value1=0.862480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1625076000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1625068800
value1=0.862080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21625076000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1625065200
value1=0.862700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624557600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624550400
value1=0.870630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1624042800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1624032000
value1=0.861910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1623909600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1623902400
value1=0.872050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623888000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623880800
value1=0.864120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623438000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623430800
value1=0.864430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1623438000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1623430800
value1=0.864030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21623438000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1623427200
value1=0.863690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623265200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623258000
value1=0.866660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1623265200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1623258000
value1=0.866260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1623085200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1623078000
value1=0.875500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622836800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622829600
value1=0.871330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622836800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1622829600
value1=0.871730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21622836800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1622826000
value1=0.872210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622703600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622696400
value1=0.868780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622703600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1622696400
value1=0.868380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622570400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622563200
value1=0.870640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622570400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1622563200
value1=0.870240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1622451600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1622444400
value1=0.877410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1622221200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1622214000
value1=0.873030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1621857600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1621850400
value1=0.867260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1621623600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1621616400
value1=0.863320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1621008000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1621000800
value1=0.877780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620741600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1620734400
value1=0.882640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1620122400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1620115200
value1=0.880580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1619445600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1619438400
value1=0.900590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21619445600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1619434800
value1=0.900490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1619125200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1619118000
value1=0.893130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618945200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618938000
value1=0.904820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618905600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618898400
value1=0.902420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1618905600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1618898400
value1=0.902820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1618488000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1618480800
value1=0.897070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21618376400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1618365600
value1=0.886930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1617904800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1617897600
value1=0.889530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1617904800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1617897600
value1=0.889930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21617904800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1617894000
value1=0.889380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1616670000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1616662800
value1=0.874420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1616652000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1616644800
value1=0.878530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1616439600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1616432400
value1=0.899980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1616439600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1616432400
value1=0.900380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21616148000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1616137200
value1=0.897570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615820400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1615809600
value1=0.895040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615561200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1615550400
value1=0.898890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615464000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615456800
value1=0.911820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21615464000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1615453200
value1=0.911900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615374000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1615366800
value1=0.907470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615345200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615338000
value1=0.908490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615345200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1615338000
value1=0.908890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1615208400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1615201200
value1=0.901670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1615208400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1615201200
value1=0.901270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614729600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1614722400
value1=0.922670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614351600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1614344400
value1=0.919110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614254400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1614247200
value1=0.933080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614211200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614204000
value1=0.932770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614168000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614160800
value1=0.930190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1614168000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1614160800
value1=0.930590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1614016800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1614009600
value1=0.926780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21614016800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1614006000
value1=0.926710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1613581200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1613574000
value1=0.910130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612962000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612954800
value1=0.915530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1612537200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1612530000
value1=0.913130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1612472400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1612465200
value1=0.917050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1612382400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1612375200
value1=0.918050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1612278000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1612270800
value1=0.916330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1612144800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1612137600
value1=0.915920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611770400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1611763200
value1=0.915570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21611770400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1611759600
value1=0.915610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611590400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611583200
value1=0.918330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21611324000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1611313200
value1=0.913850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1611288000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1611280800
value1=0.913910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611288000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1611280800
value1=0.914310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21611288000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1611277200
value1=0.914180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611086400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1611079200
value1=0.904350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1611064800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1611057600
value1=0.905400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1610978400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1610971200
value1=0.906910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21610496000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1610485200
value1=0.919670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1610031600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1610024400
value1=0.920460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609336800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609329600
value1=0.920760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1609304400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1609297200
value1=0.919280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1609304400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1609297200
value1=0.919680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1609167600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1609160400
value1=0.911750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21608037200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1608026400
value1=0.899940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21607706000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1607695200
value1=0.906450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1607065200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1607058000
value1=0.906980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1607065200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1607058000
value1=0.906580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1606993200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1606986000
value1=0.915030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21606993200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1606982400
value1=0.915290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605902400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605895200
value1=0.909450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1605888000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1605880800
value1=0.907790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1605571200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1605564000
value1=0.904790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1605542400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1605535200
value1=0.897640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605204000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605196800
value1=0.903790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1605139200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1605132000
value1=0.900690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21605139200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1605128400
value1=0.900580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1604966400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1604959200
value1=0.889030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21604937600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1604926800
value1=0.888350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1604937600
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1604926800
value1=0.889350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1604556000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1604548800
value1=0.882760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1603893600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1603886400
value1=0.881760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603879200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1603868400
value1=0.886680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1603821600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1603814400
value1=0.885720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603796400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1603785600
value1=0.880060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603717200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603710000
value1=0.883330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1603479600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1603472400
value1=0.875390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603479600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1603468800
value1=0.875310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603368000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603360800
value1=0.877530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21603368000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1603357200
value1=0.878070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1603292400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1603285200
value1=0.870540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1603083600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1603076400
value1=0.873560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1602766800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1602759600
value1=0.869410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602133200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602126000
value1=0.867680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1602133200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1602126000
value1=0.867280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1602032400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1602025200
value1=0.874980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21601938800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1601928000
value1=0.879770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601629200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1601622000
value1=0.880400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21601629200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1601618400
value1=0.880860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21601481600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1601470800
value1=0.879520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601388000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601380800
value1=0.881110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1601035200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1601028000
value1=0.879650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1601035200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1601028000
value1=0.880050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600963200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600956000
value1=0.872570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21600963200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1600952400
value1=0.872050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600840800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600833600
value1=0.877320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600840800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1600833600
value1=0.876920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21600840800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1600830000
value1=0.877830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1600254000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1600246800
value1=0.887950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1600110000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1600102800
value1=0.885650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599861600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1599854400
value1=0.876760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599166800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1599159600
value1=0.878780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1599030000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1599022800
value1=0.887010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1599030000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1599022800
value1=0.887410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1598864400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1598857200
value1=0.879070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1598601600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1598594400
value1=0.873980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1598504400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1598497200
value1=0.874010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1598446800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1598439600
value1=0.866730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1598256000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1598248800
value1=0.859010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597946400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1597939200
value1=0.858030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21597680000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1597669200
value1=0.862390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597392000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597384800
value1=0.862880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597392000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1597384800
value1=0.862480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597334400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597327200
value1=0.865520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597334400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1597327200
value1=0.865120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597248000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597240800
value1=0.868300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597237200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597230000
value1=0.869770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597237200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1597230000
value1=0.869370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1597176000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1597168800
value1=0.873590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21597136400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1597125600
value1=0.883510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1597071600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1597064400
value1=0.880280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1596740400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1596733200
value1=0.886800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596740400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1596733200
value1=0.887200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596582000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1596574800
value1=0.881170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21596448800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1596438000
value1=0.890840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596200400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1596193200
value1=0.895390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596157200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1596150000
value1=0.899810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1596038400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1596031200
value1=0.887080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595872800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595865600
value1=0.897290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595592000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1595584800
value1=0.891710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595523600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595516400
value1=0.889520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595415600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595408400
value1=0.897680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595415600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1595408400
value1=0.898080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21595415600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1595404800
value1=0.896530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595379600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595372400
value1=0.894740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1595322000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1595314800
value1=0.885750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595322000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1595314800
value1=0.885350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1595005200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1594998000
value1=0.886390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594929600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1594922400
value1=0.889620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1594645200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1594638000
value1=0.889230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594645200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1594638000
value1=0.888830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21594249200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1594238400
value1=0.886940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1594076400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1594069200
value1=0.889540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593802800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593795600
value1=0.887540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593802800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1593795600
value1=0.887940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1593705600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1593698400
value1=0.888260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593705600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1593698400
value1=0.888660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593684000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1593676800
value1=0.885590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593637200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1593630000
value1=0.880560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21593464400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1593453600
value1=0.875830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1593212400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1593205200
value1=0.876360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1592848800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1592841600
value1=0.879560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592848800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1592841600
value1=0.879960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592546400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1592539200
value1=0.871320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1592301600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1592294400
value1=0.874040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591783200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1591776000
value1=0.877960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1591588800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1591581600
value1=0.876200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591214400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591207200
value1=0.869090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1591099200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1591092000
value1=0.847610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21591099200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1591088400
value1=0.848200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590145200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1590138000
value1=0.857110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590116400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1590109200
value1=0.855500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590084000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1590076800
value1=0.855520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21590084000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1590073200
value1=0.855790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590069600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1590062400
value1=0.850000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1590004800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589997600
value1=0.855430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1590004800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1589997600
value1=0.855830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589986800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589979600
value1=0.853970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589986800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1589979600
value1=0.854370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589954400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589947200
value1=0.850920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589954400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1589947200
value1=0.851320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589954400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1589943600
value1=0.852210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1589828400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1589821200
value1=0.845040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589540400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1589533200
value1=0.839600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589518800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1589508000
value1=0.844910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21589274000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1589263200
value1=0.854260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1589202000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1589194800
value1=0.850340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588878000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1588870800
value1=0.845470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21588878000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1588867200
value1=0.845560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588788000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1588780800
value1=0.855800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21588788000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1588777200
value1=0.855970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588694400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1588687200
value1=0.847910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1588334400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1588327200
value1=0.855120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1588273200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1588266000
value1=0.858200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21588255200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1588244400
value1=0.848070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21588240800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1588230000
value1=0.853410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1587985200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1587978000
value1=0.854520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21587985200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1587974400
value1=0.854990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1587967200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1587960000
value1=0.851590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587967200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1587960000
value1=0.851990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21587967200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1587956400
value1=0.852370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1587585600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1587578400
value1=0.839740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587585600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1587578400
value1=0.839340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587488400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1587481200
value1=0.843660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1587142800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1587135600
value1=0.849720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587142800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1587135600
value1=0.850120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587106800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1587099600
value1=0.844970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1587016800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1587009600
value1=0.839630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586822400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1586815200
value1=0.844160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1586800800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1586793600
value1=0.850640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1586372400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1586365200
value1=0.845050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1585922400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1585915200
value1=0.828850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585666800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1585659600
value1=0.844270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585303200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1585296000
value1=0.831980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585288800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1585281600
value1=0.842950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585288800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1585278000
value1=0.842180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585252800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1585245600
value1=0.840130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585242000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1585234800
value1=0.836890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21585242000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1585231200
value1=0.836710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1585130400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1585123200
value1=0.845670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584986400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1584979200
value1=0.829790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584986400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1584975600
value1=0.828880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584723600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584716400
value1=0.819650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584532800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584525600
value1=0.836400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584453600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584446400
value1=0.837630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584439200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584432000
value1=0.842360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584439200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1584428400
value1=0.841620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584370800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1584363600
value1=0.844120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21584370800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1584360000
value1=0.843640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584097200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584090000
value1=0.845130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584075600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1584068400
value1=0.856500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1584039600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1584032400
value1=0.844330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1583161200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1583154000
value1=0.838930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582740000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1582729200
value1=0.836270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1582628400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1582621200
value1=0.840960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582610400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1582599600
value1=0.845250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582578000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582570800
value1=0.844320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21582084800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1582074000
value1=0.848740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1582034400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1582027200
value1=0.846960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1581692400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1581685200
value1=0.850300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1581692400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1581685200
value1=0.849900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1581487200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1581480000
value1=0.860140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21581487200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1581476400
value1=0.860930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1581037200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1581030000
value1=0.856970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580990400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1580983200
value1=0.857210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580821200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1580814000
value1=0.856620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580810400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1580803200
value1=0.860820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580760000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1580752800
value1=0.859770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580475600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580468400
value1=0.853590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580475600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1580468400
value1=0.853190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21580475600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1580464800
value1=0.853640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580454000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580446800
value1=0.854910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580454000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1580446800
value1=0.854510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580407200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1580400000
value1=0.856770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1580238000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1580230800
value1=0.859080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1580238000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1580230800
value1=0.858680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1579809600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1579802400
value1=0.864660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579798800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579791600
value1=0.869990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579759200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579752000
value1=0.869020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1579759200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1579752000
value1=0.869420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1579726800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1579719600
value1=0.867060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1579528800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1579521600
value1=0.862320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1579208400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1579201200
value1=0.863520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1578931200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1578924000
value1=0.863970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21578394800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1578384000
value1=0.861850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1578380400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1578373200
value1=0.866250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21578322800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1578312000
value1=0.866980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1577822400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1577815200
value1=0.873420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21577822400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1577811600
value1=0.873050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1576785600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1576778400
value1=0.867600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1576706400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1576699200
value1=0.861060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1576612800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1576605600
value1=0.863110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1576170000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1576162800
value1=0.870060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1575565200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1575558000
value1=0.857830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1575565200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1575558000
value1=0.857430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21575565200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1575554400
value1=0.858000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1575378000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1575370800
value1=0.868970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1574704800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1574697600
value1=0.850610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1574661600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1574654400
value1=0.854880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1574312400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1574305200
value1=0.851660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574258400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574251200
value1=0.855740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1574143200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1574136000
value1=0.842450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1573624800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1573617600
value1=0.849520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1573624800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1573617600
value1=0.849920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1573012800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1573005600
value1=0.837100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21573012800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1573002000
value1=0.837000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1572980400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1572973200
value1=0.838410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21572980400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1572969600
value1=0.837700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572908400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572901200
value1=0.839820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1572908400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1572901200
value1=0.839420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1572645600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1572638400
value1=0.844430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572584400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572577200
value1=0.848340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1572584400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1572577200
value1=0.848740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1572282000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1572274800
value1=0.826790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571947200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571940000
value1=0.833410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1571853600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1571846400
value1=0.841250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1571774400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1571767200
value1=0.837630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1571241600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1571234400
value1=0.824150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1571036400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1571029200
value1=0.832060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1571036400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1571029200
value1=0.831660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1570791600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1570784400
value1=0.838440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21570777200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1570766400
value1=0.842080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1570654800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1570647600
value1=0.837940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1570575600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1570568400
value1=0.837490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1570460400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1570453200
value1=0.836160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1569952800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1569945600
value1=0.823710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1569952800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1569945600
value1=0.823310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21569952800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1569942000
value1=0.823240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1569826800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1569819600
value1=0.828350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21569351600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1569340800
value1=0.839900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1569009600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1569002400
value1=0.829570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568923200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568916000
value1=0.834240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1568149200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1568142000
value1=0.842620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1568149200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1568142000
value1=0.842220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1568037600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1568030400
value1=0.848390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567782000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567774800
value1=0.849260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1567782000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1567774800
value1=0.849660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21567699200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1567688400
value1=0.844660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21567540800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1567530000
value1=0.844410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567494000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567486800
value1=0.836130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1567184400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1567177200
value1=0.834430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1566986400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1566979200
value1=0.841730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1566950400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1566943200
value1=0.846910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21566950400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1566939600
value1=0.846950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1566903600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1566896400
value1=0.841230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1566903600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1566896400
value1=0.840830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1566896400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1566889200
value1=0.842290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1566896400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1566889200
value1=0.841890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1566464400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1566457200
value1=0.847450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1566464400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1566457200
value1=0.847050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1565964000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1565956800
value1=0.853250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565708400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1565697600
value1=0.856540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21565348400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1565337600
value1=0.859770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1565319600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1565312400
value1=0.859330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1564992000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1564984800
value1=0.864840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564984800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1564977600
value1=0.858610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1564668000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1564660800
value1=0.868790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1564596000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1564588800
value1=0.864050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1564556400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1564549200
value1=0.865190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564387200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1564380000
value1=0.872080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21564387200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1564376400
value1=0.872020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1564088400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1564081200
value1=0.875060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1564088400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1564081200
value1=0.874660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1563555600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1563548400
value1=0.887280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1563480000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1563472800
value1=0.885050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1563480000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1563472800
value1=0.885450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21563343200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1563332400
value1=0.879200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1563343200
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1563332400
value1=0.880200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1563289200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1563282000
value1=0.876410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1563235200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1563228000
value1=0.877890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1563235200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1563228000
value1=0.878290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1563174000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1563166800
value1=0.876770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1562644800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1562637600
value1=0.869390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1562324400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1562317200
value1=0.870650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21562137200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1562126400
value1=0.876690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1562068800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1562061600
value1=0.873050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1561676400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1561669200
value1=0.876450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1560967200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1560960000
value1=0.869450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21560967200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1560956400
value1=0.869440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1560531600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1560524400
value1=0.868540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1560531600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1560524400
value1=0.868140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1560495600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1560488400
value1=0.870370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1560495600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1560488400
value1=0.869970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1560438000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1560430800
value1=0.872200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1560438000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1560430800
value1=0.871800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1560286800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1560279600
value1=0.876190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21559833200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1559822400
value1=0.887400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1559638800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1559631600
value1=0.883850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1559055600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1559048400
value1=0.883310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1559055600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1559048400
value1=0.883710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1558724400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1558717200
value1=0.882890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1558724400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1558717200
value1=0.883290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1558090800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1558083600
value1=0.882310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21558090800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1558080000
value1=0.882510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1558000800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1557993600
value1=0.879070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1558000800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1557993600
value1=0.878670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21558000800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1557990000
value1=0.879110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1557950400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1557943200
value1=0.880710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1557936000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1557928800
value1=0.881800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1557817200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1557810000
value1=0.888310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21557511200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1557500400
value1=0.883820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1557216000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1557208800
value1=0.884720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21557216000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1557205200
value1=0.885600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1557172800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1557165600
value1=0.887450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1557140400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1557133200
value1=0.894170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21557140400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1557129600
value1=0.894610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1556719200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1556712000
value1=0.893100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1556679600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1556672400
value1=0.888930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1556600400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1556593200
value1=0.899570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1556517600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1556510400
value1=0.899530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21556499600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1556316000
value1=0.895320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1556128800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1556121600
value1=0.887860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21556128800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1556118000
value1=0.887610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1556092800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1556085600
value1=0.888860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1556064000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1556056800
value1=0.894980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1556064000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1556056800
value1=0.895380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1555974000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1555966800
value1=0.889850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1555974000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1555966800
value1=0.889450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1555606800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1555599600
value1=0.893520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21555448400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1555437600
value1=0.901390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1555016400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1555009200
value1=0.898640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1554868800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1554861600
value1=0.900770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1554357600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554350400
value1=0.907940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1554357600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1554350400
value1=0.908340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1554228000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1554220800
value1=0.898360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1554217200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1554210000
value1=0.900490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1554170400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1554163200
value1=0.901600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21553853600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1553842800
value1=0.914250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1553821200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1553814000
value1=0.909420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1553796000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1553788800
value1=0.909200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1553202000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1553194800
value1=0.917750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1552572000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1552564800
value1=0.907520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1552572000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1552564800
value1=0.907120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21552572000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1552561200
value1=0.907250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1552453200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1552446000
value1=0.912810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1552406400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1552399200
value1=0.920450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1552330800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1552323600
value1=0.916940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1551877200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1551870000
value1=0.908250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1551855600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1551848400
value1=0.903020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1551459600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1551452400
value1=0.904250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1551200400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1551193200
value1=0.911700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1551067200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1551060000
value1=0.904180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1551060000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1551052800
value1=0.899540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1550876400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1550869200
value1=0.898660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1550743200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1550736000
value1=0.897820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1550242800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1550235600
value1=0.911990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1549861200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1549854000
value1=0.900310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1549645200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1549638000
value1=0.893430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1549504800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1549497600
value1=0.893610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1549479600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1549472400
value1=0.900870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21549339200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1549328400
value1=0.900420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1548975600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1548968400
value1=0.906250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1548838800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1548831600
value1=0.909060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1548784800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1548777600
value1=0.904760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21548640800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1548457200
value1=0.902000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21547816400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1547805600
value1=0.895300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1547690400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1547683200
value1=0.897000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1547650800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1547643600
value1=0.896690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1547542800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1547535600
value1=0.909080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1547496000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1547488800
value1=0.907700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1547193600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1547186400
value1=0.901900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21546603200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1546592400
value1=0.898140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1546585200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1546578000
value1=0.904990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21546585200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1546574400
value1=0.905100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1546480800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1546473600
value1=0.898250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1546214400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1546034400
value1=0.916560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21546214400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1546030800
value1=0.916650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1546002000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1545994800
value1=0.910670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1545267600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1545260400
value1=0.911150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1545235200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1545228000
value1=0.920820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21545235200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1545224400
value1=0.920770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1545202800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1545195600
value1=0.924970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21545202800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1545192000
value1=0.925020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21544698800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1544688000
value1=0.919120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1544616000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1544608800
value1=0.915990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1544079600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1544072400
value1=0.918800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1543982400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1543975200
value1=0.922110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1543982400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1543975200
value1=0.922510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1543806000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1543798800
value1=0.916830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1543528800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1543521600
value1=0.907930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21543528800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1543518000
value1=0.907890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1543446000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1543438800
value1=0.913780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1543431600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1543424400
value1=0.907870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1543431600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1543424400
value1=0.908270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21543431600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1543420800
value1=0.908450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1543006800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1542999600
value1=0.893760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1542967200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1542960000
value1=0.900680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1542715200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1542708000
value1=0.905390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21542715200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1542704400
value1=0.904660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1542697200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1542690000
value1=0.903050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1542229200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1542222000
value1=0.900710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1542193200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1542186000
value1=0.900100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1542193200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1542186000
value1=0.900500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1541667600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1541660400
value1=0.891950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1541458800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1541451600
value1=0.875470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21541458800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1541448000
value1=0.875420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1541131200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1541124000
value1=0.872990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21540990800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1540980000
value1=0.857060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1540922400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1540915200
value1=0.863450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1540803600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1540796400
value1=0.858650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1540490400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1540483200
value1=0.855500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1540371600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1540364400
value1=0.859510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21540371600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1540360800
value1=0.859330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1540274400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1540267200
value1=0.856320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1539878400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1539871200
value1=0.858310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1539878400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1539871200
value1=0.858710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21539792000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1539781200
value1=0.850210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1539774000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1539766800
value1=0.854990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21539774000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1539763200
value1=0.854950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1539626400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1539619200
value1=0.854280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1539626400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1539619200
value1=0.854680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21539626400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1539615600
value1=0.854330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1539342000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1539334800
value1=0.846680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1539082800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1539075600
value1=0.833560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1539007200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1539000000
value1=0.839840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1538125200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1538118000
value1=0.859570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1538013600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1538006400
value1=0.869610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1538002800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1537995600
value1=0.868110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1537981200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1537974000
value1=0.859910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1537941600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1537934400
value1=0.865760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1537549200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1537542000
value1=0.860290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1537484400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1537477200
value1=0.864730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21537351200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1537340400
value1=0.856870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21537340400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1537329600
value1=0.852720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1537340400
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1537329600
value1=0.851720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1537264800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1537257600
value1=0.861580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1537210800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1537203600
value1=0.858780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1537192800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1537185600
value1=0.856630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1537178400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1537171200
value1=0.855850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21537146000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1536962400
value1=0.852450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21536944400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1536933600
value1=0.853920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21536930000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1536919200
value1=0.857580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1536847200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1536840000
value1=0.850900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1536764400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1536757200
value1=0.849420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1536580800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1536573600
value1=0.861960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1536343200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1536336000
value1=0.860660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1536123600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1536116400
value1=0.860230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1536084000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1536076800
value1=0.865690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1536066000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1536058800
value1=0.859720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1535954400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1535947200
value1=0.861190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1535727600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1535720400
value1=0.861920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1535716800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1535709600
value1=0.867140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1535551200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1535544000
value1=0.868690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1535450400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1535443200
value1=0.866090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21535130000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1535119200
value1=0.872550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1535094000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1535086800
value1=0.871150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21535094000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1535083200
value1=0.871440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1535058000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1535050800
value1=0.866860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1534942800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1534935600
value1=0.870290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1534906800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1534899600
value1=0.876040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1534784400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1534777200
value1=0.867580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1534204800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1534197600
value1=0.862530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1534118400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1533938400
value1=0.862270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1533931200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1533924000
value1=0.867190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1533780000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1533772800
value1=0.871500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1533682800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1533675600
value1=0.880930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1533632400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1533625200
value1=0.873450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1533218400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1533211200
value1=0.878880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1533056400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1533049200
value1=0.886100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1533013200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1533006000
value1=0.890740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1532617200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1532610000
value1=0.888120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1532617200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1532610000
value1=0.887720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21532617200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1532606400
value1=0.888380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1532541600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1532534400
value1=0.890500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21532541600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1532530800
value1=0.890940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1532372400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1532365200
value1=0.891210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1532001600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1531994400
value1=0.891060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1531411200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1531404000
value1=0.889050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1531195200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1531188000
value1=0.899120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1531152000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1531144800
value1=0.897340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21531152000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1531141200
value1=0.897490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21530781200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1530770400
value1=0.891620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1530201600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1530194400
value1=0.897480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1530165600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1530158400
value1=0.902360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1529560800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1529553600
value1=0.909070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1529366400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1529359200
value1=0.914220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1529341200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1529334000
value1=0.917890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21529305200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1529294400
value1=0.912410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1529089200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1529082000
value1=0.918370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1528930800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1528923600
value1=0.909700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21528797600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1528786800
value1=0.915920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1528736400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1528729200
value1=0.918090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1528736400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1528729200
value1=0.918490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1528678800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1528498800
value1=0.910610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1528466400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1528459200
value1=0.915260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1528221600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1528214400
value1=0.915660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1527876000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1527868800
value1=0.902340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21527876000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1527865200
value1=0.902340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1527793200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1527786000
value1=0.911140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1527793200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1527786000
value1=0.911540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1527710400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1527703200
value1=0.896730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1527537600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1527530400
value1=0.904300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21527537600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1527526800
value1=0.904450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1527537600
hidden=1
descr=VOCM
color=6053069
selectable=0
angle=0
date1=1527526800
value1=0.905450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1527256800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1527249600
value1=0.896600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1527184800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1527177600
value1=0.894710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1527184800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1527177600
value1=0.895110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1527062400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1527055200
value1=0.885380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21527062400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1527051600
value1=0.885760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1526972400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1526965200
value1=0.886470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21526925600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1526914800
value1=0.891420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1526619600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1526612400
value1=0.885390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21526479200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1526468400
value1=0.887700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1525780800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1525773600
value1=0.909060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1525780800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1525773600
value1=0.909460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1525737600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1525730400
value1=0.905300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21525737600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1525726800
value1=0.905650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1525366800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1525359600
value1=0.906390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1525366800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1525359600
value1=0.906790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21525323600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1525312800
value1=0.902270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1525194000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1525186800
value1=0.899810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1524812400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1524805200
value1=0.910760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1524754800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1524747600
value1=0.909600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1524733200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1524726000
value1=0.905610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1524600000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1524592800
value1=0.911250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21524600000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1524589200
value1=0.911320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1524553200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1524546000
value1=0.912930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1524499200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1524492000
value1=0.916550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1524157200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1524150000
value1=0.918740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1523998800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1523991600
value1=0.919250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1523988000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1523980800
value1=0.919520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1523988000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1523980800
value1=0.919120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1523890800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1523883600
value1=0.924270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1523862000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1523854800
value1=0.929080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21523642400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1523631600
value1=0.924830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1523322000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1523314800
value1=0.927080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1523304000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1523296800
value1=0.928110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1523257200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1523250000
value1=0.932470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1522922400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1522915200
value1=0.929740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1522861200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1522854000
value1=0.937930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1522861200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1522854000
value1=0.938330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21522861200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1522850400
value1=0.936710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21522677600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1522666800
value1=0.930460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1522357200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1522350000
value1=0.932800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1522263600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1522256400
value1=0.929930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1521568800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1521561600
value1=0.939730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1521496800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1521489600
value1=0.948730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1521428400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1521421200
value1=0.947100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1521223200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1521216000
value1=0.943110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1521007200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1521000000
value1=0.952310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1521007200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1521000000
value1=0.952710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1520816400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1520636400
value1=0.933050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1520470800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1520463600
value1=0.937410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1520384400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1520377200
value1=0.937730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21520384400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1520373600
value1=0.937730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1520337600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1520330400
value1=0.942210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1519905600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1519898400
value1=0.927830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1519826400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1519819200
value1=0.920000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21519750800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1519740000
value1=0.926790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1519311600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1519304400
value1=0.931440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1519264800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1519257600
value1=0.927480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1518807600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1518800400
value1=0.929140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1518807600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1518800400
value1=0.929540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21518735600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1518724800
value1=0.926080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1518696000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1518688800
value1=0.924820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1518591600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1518584400
value1=0.922030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1518591600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1518584400
value1=0.922430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21518591600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1518580800
value1=0.922310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21518444000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1518433200
value1=0.909620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1518192000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1518184800
value1=0.918180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1518098400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1518091200
value1=0.911640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1518048000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1518040800
value1=0.906300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1517907600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1517900400
value1=0.916340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1517835600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1517828400
value1=0.909910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21517835600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1517824800
value1=0.909810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1517587200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1517580000
value1=0.908030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21517515200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1517504400
value1=0.909680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1517428800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1517421600
value1=0.905560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1517414400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1517407200
value1=0.911730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1516932000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1516924800
value1=0.902430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1516806000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1516798800
value1=0.911820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1516730400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1516723200
value1=0.918160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1516683600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1516676400
value1=0.914840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1516298400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1516291200
value1=0.912760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1516298400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1516291200
value1=0.913160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1516125600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1516118400
value1=0.901040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1515981600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1515974400
value1=0.901050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21515981600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1515798000
value1=0.900490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1515981600
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1515798000
value1=0.899490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1515780000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1515772800
value1=0.904240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1515682800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1515675600
value1=0.909420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1515682800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1515675600
value1=0.909820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21515682800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1515672000
value1=0.909370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21515434400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1515423600
value1=0.893420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1515164400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1515157200
value1=0.896610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21515063600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1515052800
value1=0.893000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1514988000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1514980800
value1=0.891130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1514959200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1514952000
value1=0.885660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1514959200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1514952000
value1=0.885260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1514480400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1514473200
value1=0.891180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21514332800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1514322000
value1=0.894180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1513947600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1513940400
value1=0.891580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1513731600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1513724400
value1=0.896980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1513378800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1513371600
value1=0.902210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21513378800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1513368000
value1=0.902350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1513368000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1513360800
value1=0.901420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1513252800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1513245600
value1=0.900880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21513252800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1513242000
value1=0.901020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1513062000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1513054800
value1=0.891380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21512669600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1512658800
value1=0.880580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1512644400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1512637200
value1=0.876030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1512590400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1512583200
value1=0.881200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1512576000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1512568800
value1=0.871700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21512576000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1512565200
value1=0.871310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1512450000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1512442800
value1=0.875270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1512410400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1512403200
value1=0.868080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1512147600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1512140400
value1=0.872310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1512093600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1512086400
value1=0.879110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21512093600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1512082800
value1=0.878860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21511920800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1511910000
value1=0.883130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1511816400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1511809200
value1=0.882940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1511211600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1511204400
value1=0.870200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1510894800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1510887600
value1=0.876210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1510848000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1510840800
value1=0.872240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21510722000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1510711200
value1=0.878220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1510347600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1510340400
value1=0.878060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1510293600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1510286400
value1=0.877440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1510279200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1510272000
value1=0.878770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21510174800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1510164000
value1=0.879310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1509732000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1509724800
value1=0.880840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1509732000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1509724800
value1=0.880440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1509033600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1509026400
value1=0.877070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1508756400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1508749200
value1=0.882460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1507845600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1507838400
value1=0.891400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1507845600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1507838400
value1=0.891800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21507845600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1507834800
value1=0.891790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1507770000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1507762800
value1=0.880040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1507770000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1507762800
value1=0.879640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21507586400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1507575600
value1=0.885740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1507312800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1507305600
value1=0.886580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1507312800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1507305600
value1=0.886180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1506956400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1506949200
value1=0.901230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1506704400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1506697200
value1=0.903530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1506326400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1506319200
value1=0.894260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1506326400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1506319200
value1=0.893860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1506027600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1506020400
value1=0.900330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1505988000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1505980800
value1=0.901190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1505905200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1505898000
value1=0.904600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1505898000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1505890800
value1=0.897000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1505847600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1505840400
value1=0.899820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1505847600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1505840400
value1=0.900220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21505847600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1505836800
value1=0.900070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21505761200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1505750400
value1=0.886620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1505718000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1505710800
value1=0.893420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1505509200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1505502000
value1=0.891920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1505509200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1505502000
value1=0.892320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1505498400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1505491200
value1=0.888810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1505469600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1505462400
value1=0.883400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1504832400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1504825200
value1=0.875370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1504285200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1504278000
value1=0.886660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1504263600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1504256400
value1=0.890960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21504263600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1504252800
value1=0.891890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1504188000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1504180800
value1=0.901580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1504188000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1504180800
value1=0.901180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21504188000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1504177200
value1=0.902370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21504152000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1504141200
value1=0.910660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1504026000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1504018800
value1=0.911940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1503921600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1503914400
value1=0.901730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1503493200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1503486000
value1=0.906250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1503468000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1503460800
value1=0.910350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21503468000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1503457200
value1=0.909830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1502222400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1502215200
value1=0.926900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1502222400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1502215200
value1=0.926500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1502168400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1502161200
value1=0.930600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1501862400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1501855200
value1=0.938520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1501736400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1501729200
value1=0.929810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1501563600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1501556400
value1=0.940960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1501509600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1501502400
value1=0.932260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1501196400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1501189200
value1=0.942360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1501027200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1501020000
value1=0.926000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1500584400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1500577200
value1=0.933430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1500584400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1500577200
value1=0.933830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1500408000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1500400800
value1=0.933800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1500274800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1500267600
value1=0.926050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21500274800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1500264000
value1=0.925910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1499878800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1499871600
value1=0.940470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1499878800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1499871600
value1=0.940870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1499814000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1499806800
value1=0.935730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1499356800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1499349600
value1=0.936560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1499284800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1499277600
value1=0.946040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1498809600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1498802400
value1=0.953270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1498737600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1498730400
value1=0.950370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1498593600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1498586400
value1=0.958210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1498593600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1498586400
value1=0.957810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21498593600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1498582800
value1=0.957860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1498503600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1498496400
value1=0.968110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1498240800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1498233600
value1=0.969060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1498240800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1498233600
value1=0.969460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21498240800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1498230000
value1=0.969700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1497960000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1497952800
value1=0.960690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1497621600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1497614400
value1=0.959830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1497466800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1497459600
value1=0.966860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1497466800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1497459600
value1=0.967260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1497308400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1497301200
value1=0.959290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1497034800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1497027600
value1=0.966360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1497034800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1497027600
value1=0.965960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1496905200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1496898000
value1=0.974840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21496905200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1496894400
value1=0.974590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1496775600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1496768400
value1=0.970980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1496768400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1496761200
value1=0.969210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1496761200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1496754000
value1=0.967880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1496408400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1496401200
value1=0.959690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1496257200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1496250000
value1=0.960510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1496224800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1496217600
value1=0.952190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21496224800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1496214000
value1=0.952340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1496167200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1496160000
value1=0.955860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1496091600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1496084400
value1=0.947300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21495746000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1495735200
value1=0.950250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1495537200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1495530000
value1=0.949870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1495486800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1495479600
value1=0.945880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1495177200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1495170000
value1=0.934880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1495177200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1495170000
value1=0.934480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1495134000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1495126800
value1=0.938280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1494950400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1494943200
value1=0.934950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1494925200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1494918000
value1=0.937040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1494849600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1494842400
value1=0.938200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1494511200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1494504000
value1=0.935920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1494471600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1494464400
value1=0.933200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1494003600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1493996400
value1=0.952650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1493892000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1493884800
value1=0.940990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1493852400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1493845200
value1=0.941610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21493823600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1493812800
value1=0.948190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1493665200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1493658000
value1=0.945400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21493388000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1493377200
value1=0.935490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1493233200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1493226000
value1=0.932340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1493233200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1493226000
value1=0.931940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1493190000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1493182800
value1=0.939400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1493164800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1493157600
value1=0.941700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1493125200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1493118000
value1=0.942180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1493064000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1493056800
value1=0.949350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1492642800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1492635600
value1=0.945140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1492606800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1492599600
value1=0.940560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1492023600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1492016400
value1=0.917440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1492023600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1492016400
value1=0.917040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1491894000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1491886800
value1=0.924810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1491843600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1491836400
value1=0.927170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21491843600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1491832800
value1=0.926990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1491786000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1491606000
value1=0.928000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1491415200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1491408000
value1=0.930880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21491415200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1491404400
value1=0.930960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1490907600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1490900400
value1=0.930610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1490907600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1490900400
value1=0.930210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1490893200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1490886000
value1=0.932220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1490835600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1490828400
value1=0.936040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1490738400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1490731200
value1=0.936910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1490637600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1490630400
value1=0.944560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21490637600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1490626800
value1=0.945510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1490349600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1490342400
value1=0.934650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1490349600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1490342400
value1=0.934250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1490169600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1490162400
value1=0.942800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21490115600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1490104800
value1=0.936030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1490094000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1490086800
value1=0.938240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1488934800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1488927600
value1=0.931480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1488891600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1488884400
value1=0.934670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21488891600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1488880800
value1=0.934190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1488459600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1488452400
value1=0.948520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1488225600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1488218400
value1=0.947550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1487955600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1487948400
value1=0.941150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1487768400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1487761200
value1=0.945160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1487649600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1487642400
value1=0.938690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21487649600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1487638800
value1=0.938730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1487329200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1487322000
value1=0.938990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21487329200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1487318400
value1=0.939040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1486674000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1486666800
value1=0.941380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1486490400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1486483200
value1=0.958420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21486490400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1486479600
value1=0.959570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1486414800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1486407600
value1=0.959600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1486058400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1486051200
value1=0.954260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21486058400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1486047600
value1=0.954310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1485918000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1485910800
value1=0.949930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21485918000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1485907200
value1=0.948980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1485774000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1485766800
value1=0.951490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21485774000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1485763200
value1=0.951720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1485140400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1485133200
value1=0.957200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1484917200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1484910000
value1=0.952730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1484888400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1484881200
value1=0.960340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1484550000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1484542800
value1=0.931490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1484330400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1484323200
value1=0.929790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1484251200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1484244000
value1=0.938020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1483725600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1483718400
value1=0.921650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1483632000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1483624800
value1=0.924030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21483632000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1483621200
value1=0.924110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1483470000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1483462800
value1=0.924990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21483470000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1483459200
value1=0.924860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1483452000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1483444800
value1=0.927590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21483452000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1483441200
value1=0.928880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1483318800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1483138800
value1=0.929140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1483120800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1483113600
value1=0.933360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1483095600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1483088400
value1=0.936170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1483038000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1483030800
value1=0.936000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21482948000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1482937200
value1=0.935600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1482879600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1482872400
value1=0.935790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1482429600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1482422400
value1=0.934820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21482429600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1482418800
value1=0.933430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1482382800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1482375600
value1=0.929940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1481914800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1481907600
value1=0.926610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1481914800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1481907600
value1=0.926210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1481864400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1481857200
value1=0.935360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1481832000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1481824800
value1=0.938050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1481749200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1481742000
value1=0.951030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1481698800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1481691600
value1=0.948970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1481169600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1481162400
value1=0.953010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1481094000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1481086800
value1=0.947340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21481094000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1481083200
value1=0.947590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1481029200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1481022000
value1=0.943650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1480330800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1480323600
value1=0.957560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1480330800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1480323600
value1=0.957960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1480312800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1480305600
value1=0.955400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1479931200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1479924000
value1=0.942800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21479931200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1479920400
value1=0.943330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1479841200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1479834000
value1=0.943660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21479841200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1479830400
value1=0.943810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21479783600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1479772800
value1=0.949890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1479747600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1479740400
value1=0.950230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21479747600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1479736800
value1=0.950810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1479322800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1479315600
value1=0.946040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1479322800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1479315600
value1=0.945640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21479160800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1479150000
value1=0.964280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1478674800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1478667600
value1=0.990890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1478570400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1478563200
value1=0.983100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1478196000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1478188800
value1=0.981850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1478109600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1478102400
value1=0.979010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1478034000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1478026800
value1=0.957140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21478034000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1478023200
value1=0.956940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1477976400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1477969200
value1=0.962490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1477692000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1477684800
value1=0.961110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1477508400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1477501200
value1=0.954310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1477411200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1477404000
value1=0.950620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21477411200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1477400400
value1=0.950630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1477335600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1477328400
value1=0.951200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21477335600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1477324800
value1=0.950840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1476687600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1476680400
value1=0.935800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1476666000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1476486000
value1=0.929680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1476666000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1476486000
value1=0.929280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21476428400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1476417600
value1=0.941400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1476352800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1476345600
value1=0.939470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21476352800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1476342000
value1=0.939400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21476298800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1476288000
value1=0.938660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1476176400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1476169200
value1=0.930760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1475632800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1475625600
value1=0.946960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1475614800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1475607600
value1=0.950120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1475229600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1475222400
value1=0.957750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1475182800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1475175600
value1=0.957170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1475164800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1475157600
value1=0.949120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1475103600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1475096400
value1=0.952020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1475074800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1475067600
value1=0.956290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1475074800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1475067600
value1=0.955890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1474981200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1474974000
value1=0.968140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1474981200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1474974000
value1=0.968540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21474981200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1474970400
value1=0.969190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1474923600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1474916400
value1=0.962660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1474887600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1474880400
value1=0.955930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1474639200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1474632000
value1=0.945670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1474610400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1474603200
value1=0.950570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1474560000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1474552800
value1=0.952080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1473883200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1473876000
value1=0.963820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1473883200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1473876000
value1=0.964220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1473656400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1473649200
value1=0.959930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1473415200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1473408000
value1=0.954470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1473163200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1473156000
value1=0.948780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1472846400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1472839200
value1=0.945880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1472763600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1472756400
value1=0.956110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21472763600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1472752800
value1=0.955820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1472464800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1472457600
value1=0.942540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1472432400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1472252400
value1=0.937370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1472432400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1472252400
value1=0.936970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1471590000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1471582800
value1=0.927170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1471546800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1471539600
value1=0.929020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1471370400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1471363200
value1=0.929600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21471370400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1471359600
value1=0.929400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1471269600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1471262400
value1=0.933760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21471269600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1471258800
value1=0.933950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1470992400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1470985200
value1=0.932240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1470992400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1470985200
value1=0.931840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1470848400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1470841200
value1=0.945200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21470848400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1470837600
value1=0.945430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1470812400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1470805200
value1=0.943120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1470740400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1470733200
value1=0.936780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1470416400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1470409200
value1=0.943220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21470294000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1470283200
value1=0.938430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1469444400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1469437200
value1=0.920210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1469206800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1469199600
value1=0.912820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1469145600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1469138400
value1=0.917010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1469134800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1469127600
value1=0.914030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1468990800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1468983600
value1=0.914390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1468944000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1468936800
value1=0.918600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1468616400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1468609200
value1=0.927210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1468602000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1468594800
value1=0.917860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1468324800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1468317600
value1=0.955200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1468324800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1468317600
value1=0.955600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1467842400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1467835200
value1=0.922540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21467824400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1467813600
value1=0.929040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1467716400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1467709200
value1=0.925300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21467716400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1467705600
value1=0.925200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1467381600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1467374400
value1=0.929070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21467316800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1467306000
value1=0.927520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1467223200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1467216000
value1=0.928190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1467068400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1467061200
value1=0.914170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1466676000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1466668800
value1=0.922290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1466640000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1466632800
value1=0.921920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1466640000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1466632800
value1=0.922320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21466640000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1466629200
value1=0.921840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1466143200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1466136000
value1=0.909790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1466017200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1466010000
value1=0.909100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1466017200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1466010000
value1=0.909500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21465916400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1465905600
value1=0.897910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1465495200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1465488000
value1=0.909940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1465358400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1465351200
value1=0.885520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1465243200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1465236000
value1=0.888630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1465243200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1465236000
value1=0.888230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1464973200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1464966000
value1=0.899430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1464966000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1464958800
value1=0.897590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1464894000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1464886800
value1=0.895010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21464894000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1464883200
value1=0.895610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1464789600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1464782400
value1=0.892180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1464724800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1464717600
value1=0.887230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21464634800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1464624000
value1=0.876750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1464570000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1464390000
value1=0.870520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1464390000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1464382800
value1=0.871110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1464292800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1464285600
value1=0.877050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1464228000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1464220800
value1=0.874340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1464188400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1464181200
value1=0.888220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1463594400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1463587200
value1=0.874250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1463547600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1463540400
value1=0.875770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21463450400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1463439600
value1=0.873880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1462917600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1462910400
value1=0.871830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1462813200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1462806000
value1=0.877290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1462795200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1462788000
value1=0.881350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21462795200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1462784400
value1=0.881120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1462568400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1462561200
value1=0.886660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1462539600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1462532400
value1=0.877610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1462165200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1462158000
value1=0.880510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1461765600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1461758400
value1=0.861050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1461765600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1461758400
value1=0.860650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1461326400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1461319200
value1=0.875400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1461326400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1461319200
value1=0.875000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1461236400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1461229200
value1=0.879320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1461175200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1461168000
value1=0.883830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1461175200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1461168000
value1=0.883430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1461164400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1461157200
value1=0.886980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1461067200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1461060000
value1=0.897030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1460948400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1460941200
value1=0.899740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1460948400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1460941200
value1=0.900140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1460422800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1460415600
value1=0.882680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21460386800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1460376000
value1=0.888810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1460336400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1460156400
value1=0.881680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1460106000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1460098800
value1=0.886830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1460106000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1460098800
value1=0.886430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21460106000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1460095200
value1=0.886820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1459882800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1459875600
value1=0.897590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1459526400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1459519200
value1=0.902530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21459526400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1459515600
value1=0.902730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1459278000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1459270800
value1=0.896750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21459202400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1459191600
value1=0.885110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1459184400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1459177200
value1=0.889760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1458838800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1458831600
value1=0.891410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21458838800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1458828000
value1=0.891790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1458738000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1458730800
value1=0.874780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1458684000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1458676800
value1=0.878690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1458266400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1458259200
value1=0.886120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21458266400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1458255600
value1=0.886090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1457726400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1457719200
value1=0.894500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21457726400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1457715600
value1=0.894670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1457701200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1457694000
value1=0.884360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1457532000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1457524800
value1=0.909920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1457514000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1457506800
value1=0.902060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1457312400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1457132400
value1=0.903280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1457114400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1457107200
value1=0.912220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1457074800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1457067600
value1=0.906710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1457013600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1457006400
value1=0.900860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1457013600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1457006400
value1=0.901260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21457013600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1457002800
value1=0.900860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1456959600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1456952400
value1=0.897840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1456948800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1456941600
value1=0.895280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1456520400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1456513200
value1=0.896310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1456495200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1456488000
value1=0.910990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21456495200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1456484400
value1=0.911290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1456347600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1456340400
value1=0.910260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1456279200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1456272000
value1=0.913510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1455883200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1455876000
value1=0.909150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21455566400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1455555600
value1=0.918590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1455134400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1455127200
value1=0.932240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1455109200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1455102000
value1=0.924930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1454439600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1454432400
value1=0.914250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1454090400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1454083200
value1=0.908900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1454043600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1454036400
value1=0.912030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1453899600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1453892400
value1=0.920360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1453838400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1453831200
value1=0.912120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1453838400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1453831200
value1=0.911720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21453838400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1453827600
value1=0.912220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1453737600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1453730400
value1=0.916280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1453708800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1453701600
value1=0.923410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1453467600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1453460400
value1=0.920260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1453402800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1453395600
value1=0.922450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1453168800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1453161600
value1=0.941240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21453168800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1453158000
value1=0.941550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1452841200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1452834000
value1=0.924290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1452700800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1452693600
value1=0.930290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21452700800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1452690000
value1=0.930470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1452276000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1452268800
value1=0.923860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1452276000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1452268800
value1=0.923460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1452164400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1452157200
value1=0.942600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1451998800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1451991600
value1=0.932990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1451998800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1451991600
value1=0.932590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1451512800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1451505600
value1=0.947740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1451401200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1451394000
value1=0.957980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1451401200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1451394000
value1=0.958380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1451325600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1451318400
value1=0.953040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1451311200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1451304000
value1=0.950170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1450886400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1450879200
value1=0.940440
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1450886400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1450879200
value1=0.940040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1450404000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1450396800
value1=0.931250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21450404000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1450393200
value1=0.930790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1450213200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1450206000
value1=0.923690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21450213200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1450202400
value1=0.923390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1450177200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1450170000
value1=0.935000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1449572400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1449565200
value1=0.900530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1449176400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1449169200
value1=0.893000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1448989200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1448982000
value1=0.890590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1447092000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1447084800
value1=0.865660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21446714000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1446703200
value1=0.869630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1446656400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1446649200
value1=0.861800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1446602400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1446595200
value1=0.868780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1445972400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1445965200
value1=0.901670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1445864400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1445857200
value1=0.887680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1445576400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1445569200
value1=0.895880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1445367600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1445360400
value1=0.872820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1445328000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1445320800
value1=0.888890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21445230800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1445220000
value1=0.876340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1444953600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1444946400
value1=0.878900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1444888800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1444881600
value1=0.882890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1444827600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1444820400
value1=0.877150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1444392000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1444384800
value1=0.871110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1444348800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1444341600
value1=0.870050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21444096800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1444086000
value1=0.847790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPCM1444096800
hidden=1
descr=VOCM
color=14772545
selectable=0
angle=0
date1=1444086000
value1=0.846790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1443589200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1443582000
value1=0.856610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1443589200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1443582000
value1=0.857010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1443463200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1443456000
value1=0.843540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21443463200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1443452400
value1=0.844220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1443121200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1443114000
value1=0.851050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1443027600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1443020400
value1=0.836780
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1442894400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1442887200
value1=0.839360
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1442847600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1442840400
value1=0.836160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1442610000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1442602800
value1=0.845750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1442422800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1442415600
value1=0.836620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1442343600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1442336400
value1=0.834310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1442300400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1442293200
value1=0.836480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21442300400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1442289600
value1=0.836060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1442264400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1442257200
value1=0.841730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1441983600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1441976400
value1=0.831290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21441983600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1441972800
value1=0.831030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1441821600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1441814400
value1=0.848920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1441821600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1441814400
value1=0.849320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21441821600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1441810800
value1=0.849950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1441778400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1441771200
value1=0.844550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1441724400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1441717200
value1=0.830260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1441396800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1441389600
value1=0.832150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1441396800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1441389600
value1=0.831750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1441274400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1441267200
value1=0.839650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1441116000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1441108800
value1=0.833520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1440766800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1440759600
value1=0.857150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1440756000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1440748800
value1=0.851820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1440666000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1440658800
value1=0.854240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21440594000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1440583200
value1=0.861130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1440536400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1440529200
value1=0.869480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1440068400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1440061200
value1=0.869520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1440068400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1440061200
value1=0.869920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1439877600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1439870400
value1=0.865420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1439535600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1439528400
value1=0.851200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1439496000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1439488800
value1=0.859920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1439470800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1439463600
value1=0.853970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1439316000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1439308800
value1=0.859830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21439316000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1439305200
value1=0.859490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1439280000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1439272800
value1=0.855200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1439280000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1439272800
value1=0.854800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1439218800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1439211600
value1=0.862710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1438988400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1438981200
value1=0.871290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1438801200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1438794000
value1=0.857020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1438801200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1438794000
value1=0.856620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1438714800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1438707600
value1=0.863340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1438700400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1438693200
value1=0.869270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1438610400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1438603200
value1=0.868720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1438182000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1438174800
value1=0.862510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1438059600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1438052400
value1=0.866650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1437703200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1437696000
value1=0.859420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21437703200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1437692400
value1=0.859570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1437462000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1437454800
value1=0.858750
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1437462000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1437454800
value1=0.859150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21437462000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1437451200
value1=0.858890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1437390000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1437382800
value1=0.856230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1437390000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1437382800
value1=0.856630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1437148800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1437141600
value1=0.851580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21437148800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1437138000
value1=0.851330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1437040800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1437033600
value1=0.841210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21437040800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1437030000
value1=0.839640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1436418000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1436410800
value1=0.852840
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21436418000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1436407200
value1=0.852740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1435838400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1435831200
value1=0.840200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1435788000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1435780800
value1=0.850590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21435737600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1435726800
value1=0.851120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1435561200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1435554000
value1=0.846640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1435284000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1435276800
value1=0.846470
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1435284000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1435276800
value1=0.846070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1435078800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1435071600
value1=0.841260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1434506400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1434499200
value1=0.857370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21434448800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1434438000
value1=0.859650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1434387600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1434380400
value1=0.865420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1434114000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1434106800
value1=0.856820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1434114000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1434106800
value1=0.856420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21434114000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1434103200
value1=0.856640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1434049200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1434042000
value1=0.858130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1433876400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1433869200
value1=0.876540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1433487600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1433480400
value1=0.892970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1433358000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1433350800
value1=0.893530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21433358000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1433347200
value1=0.893650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1433275200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1433268000
value1=0.887920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1433156400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1433149200
value1=0.888280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1432778400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1432771200
value1=0.905800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21432778400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1432767600
value1=0.906150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1432670400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1432663200
value1=0.897390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1432256400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1432249200
value1=0.897380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1431979200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1431972000
value1=0.899520
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1431666000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1431658800
value1=0.893630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1431572400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1431565200
value1=0.901940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1431482400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1431475200
value1=0.889640
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1431457200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1431450000
value1=0.882000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1431075600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1431068400
value1=0.903700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1430758800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1430751600
value1=0.910800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1430733600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1430726400
value1=0.917830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1430521200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1430514000
value1=0.914120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1430406000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1430398800
value1=0.918000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1430330400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1430323200
value1=0.922590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1430276400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1430269200
value1=0.930880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1430193600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1430186400
value1=0.921150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1430157600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1430150400
value1=0.921730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1430150400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1430143200
value1=0.922110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1430128800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1430121600
value1=0.929000
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1429905600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1429898400
value1=0.925340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1429822800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1429815600
value1=0.919280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1429729200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1429722000
value1=0.938090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1429642800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1429635600
value1=0.945200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1429279200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1429272000
value1=0.940210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21429279200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1429268400
value1=0.940100
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1429074000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1429066800
value1=0.935590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1429023600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1429016400
value1=0.935650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1428483600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1428476400
value1=0.942830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1428368400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1428361200
value1=0.939700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1428080400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1428073200
value1=0.950020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1428080400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1428073200
value1=0.950420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1427950800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1427943600
value1=0.936510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21427950800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1427940000
value1=0.936230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1427817600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1427810400
value1=0.956480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21427817600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1427806800
value1=0.955260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1427493600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1427486400
value1=0.956580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1427374800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1427367600
value1=0.952480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1427202000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1427194800
value1=0.953670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1426820400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1426813200
value1=0.944730
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1426600800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1426593600
value1=0.940190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1426528800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1426521600
value1=0.946080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21426528800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1426518000
value1=0.946220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1426158000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1426150800
value1=0.940230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1426158000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1426150800
value1=0.940630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1426057200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1426050000
value1=0.917970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1425967200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1425960000
value1=0.919870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1425906000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1425898800
value1=0.931190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1425888000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1425880800
value1=0.923550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1424876400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1424869200
value1=0.936170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1424707200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1424700000
value1=0.950050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1424440800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1424433600
value1=0.936610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21424354400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1424343600
value1=0.937010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1423850400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1423843200
value1=0.925390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21423850400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1423839600
value1=0.925770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21423818000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1423807200
value1=0.932320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1423605600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1423598400
value1=0.935040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1423490400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1423483200
value1=0.928800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1423472400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1423465200
value1=0.923710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1423090800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1423083600
value1=0.930620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1423090800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1423083600
value1=0.931020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1422900000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1422892800
value1=0.915960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1422396000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1422388800
value1=0.922110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21422396000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1422385200
value1=0.921760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1422277200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1422270000
value1=0.930550
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21421726400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1421715600
value1=0.926080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1421283600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1421276400
value1=0.921040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21421283600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1421272800
value1=0.921150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1420545600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1420538400
value1=0.912630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1420441200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1420434000
value1=0.899560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1420214400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1420207200
value1=0.899430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1420214400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1420207200
value1=0.899030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21420214400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1420203600
value1=0.899110
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1420056000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1420048800
value1=0.903700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1420056000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1420048800
value1=0.903300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21420056000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1420045200
value1=0.903010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1419980400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1419973200
value1=0.907340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1419940800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1419933600
value1=0.911820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1419940800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1419933600
value1=0.912220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21419328800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1419318000
value1=0.896420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1418958000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1418950800
value1=0.902160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21418958000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1418947200
value1=0.901770
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1418940000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1418932800
value1=0.896580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1418860800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1418853600
value1=0.894270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21418860800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1418850000
value1=0.894410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1418745600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1418738400
value1=0.912920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21418108400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1418097600
value1=0.873870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1417723200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1417716000
value1=0.889150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21417723200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1417712400
value1=0.889830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1417644000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1417636800
value1=0.880290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1417590000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1417582800
value1=0.884760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21417590000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1417579200
value1=0.884590
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1416938400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1416931200
value1=0.875680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1416938400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1416931200
value1=0.875280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1416412800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1416405600
value1=0.894160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1416355200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1416348000
value1=0.894120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1416326400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1416319200
value1=0.901980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1415883600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1415876400
value1=0.896660
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1415883600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1415876400
value1=0.897060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21415883600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1415872800
value1=0.897280
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1415721600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1415714400
value1=0.885920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1415700000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1415692800
value1=0.878510
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1415149200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1415142000
value1=0.894500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1415034000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1415026800
value1=0.870900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1414623600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1414616400
value1=0.871290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1413500400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1413493200
value1=0.892480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21413500400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1413489600
value1=0.892300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1413464400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1413457200
value1=0.894310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21413464400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1413453600
value1=0.893490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1413439200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1413432000
value1=0.900850
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1413396000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1413388800
value1=0.898720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1413388800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1413381600
value1=0.900540
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1413388800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1413381600
value1=0.900940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1413374400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1413367200
value1=0.891720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1413180000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1413172800
value1=0.883190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1412852400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1412845200
value1=0.884650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1412852400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1412845200
value1=0.885050
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1412841600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1412834400
value1=0.883010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1412841600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1412834400
value1=0.883410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1411747200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1411740000
value1=0.875680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1411149600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1411142400
value1=0.887910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21411149600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1411138800
value1=0.888120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1411059600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1411052400
value1=0.889130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1410984000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1410976800
value1=0.891040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1410886800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1410879600
value1=0.897620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1410886800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1410879600
value1=0.897220
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1410519600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1410512400
value1=0.905480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1410451200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1410444000
value1=0.903300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1409936400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1409929200
value1=0.908810
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1409770800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1409763600
value1=0.903420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1409572800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1409565600
value1=0.912290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21409292000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1409281200
value1=0.907310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21409054400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1409043600
value1=0.913040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1408680000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1408672800
value1=0.917700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1408636800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1408629600
value1=0.917410
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1408460400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1408453200
value1=0.923870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1408420800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1408413600
value1=0.917680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1408363200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1408356000
value1=0.921950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1408356000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1408348800
value1=0.922380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1407945600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1407938400
value1=0.926080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1407880800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1407873600
value1=0.920420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1407787200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1407780000
value1=0.923130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1407250800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1407243600
value1=0.933310
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1407250800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1407243600
value1=0.933710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21407250800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1407240000
value1=0.933250
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21407160800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1407150000
value1=0.928120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1406610000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1406602800
value1=0.924930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21406250000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1406239200
value1=0.919200
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1406167200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1406160000
value1=0.921960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1406109600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1406102400
value1=0.932920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1405911600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1405904400
value1=0.935990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21405911600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1405900800
value1=0.935800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21405648800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1405638000
value1=0.930930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1405580400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1405573200
value1=0.931790
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1405580400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1405573200
value1=0.931390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1404946800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1404939600
value1=0.941320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1404918000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1404910800
value1=0.937060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1404820800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1404813600
value1=0.940390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1404806400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1404799200
value1=0.938300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1404327600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1404320400
value1=0.936260
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1403874000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1403866800
value1=0.935430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1403758800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1403751600
value1=0.940910
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1403704800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1403697600
value1=0.935480
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1403550000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1403542800
value1=0.933830
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1403211600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1403204400
value1=0.941580
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1403193600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1403186400
value1=0.946120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1403121600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1403114400
value1=0.945130
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1403121600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1403114400
value1=0.945530
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1402668000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1402660800
value1=0.938180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21402668000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1402657200
value1=0.937630
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21402635600
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1402624800
value1=0.939060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1402336800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1402329600
value1=0.924610
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1402070400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1402063200
value1=0.935160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1402070400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1402063200
value1=0.935560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1401955200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1401948000
value1=0.925400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21401955200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1401944400
value1=0.926010
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21401789600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1401778800
value1=0.924650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1401390000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1401382800
value1=0.916090
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1401390000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1401382800
value1=0.915690
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1400792400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1400785200
value1=0.931120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21400792400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1400781600
value1=0.931150
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1400583600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1400576400
value1=0.932140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1400583600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1400576400
value1=0.931740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1400540400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1400533200
value1=0.936340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21400540400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1400529600
value1=0.936350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1400461200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1400277600
value1=0.936700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1400461200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1400277600
value1=0.936300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1399572000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1399564800
value1=0.938340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21399572000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1399561200
value1=0.937700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1399514400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1399507200
value1=0.942040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1399428000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1399420800
value1=0.946350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1399428000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1399420800
value1=0.945950
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1399377600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1399370400
value1=0.956760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1399377600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1399370400
value1=0.957160
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1399352400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1399345200
value1=0.954620
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1399305600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1399298400
value1=0.954040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21399305600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1399294800
value1=0.953760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1398830400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1398823200
value1=0.939170
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21398830400
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1398819600
value1=0.939240
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1398776400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1398769200
value1=0.935720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1398776400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1398769200
value1=0.935320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1398765600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1398758400
value1=0.937390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1398247200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1398240000
value1=0.946970
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21398247200
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1398236400
value1=0.947030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1398225600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1398218400
value1=0.951560
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21398225600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1398214800
value1=0.951210
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1398160800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1398153600
value1=0.947870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21398160800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1398150000
value1=0.947870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1398092400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1398085200
value1=0.942320
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21398092400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1398081600
value1=0.942140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1397829600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1397822400
value1=0.946760
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1397674800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1397667600
value1=0.950490
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1397620800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1397613600
value1=0.942800
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1397620800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1397613600
value1=0.942400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1397588400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1397581200
value1=0.947070
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1397556000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1397548800
value1=0.948500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1397548800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1397541600
value1=0.948890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1397224800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1397217600
value1=0.952350
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1397192400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1397185200
value1=0.943400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1397142000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1397134800
value1=0.946820
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21397142000
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1397131200
value1=0.947020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1396526400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1396519200
value1=0.938290
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1396515600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1396508400
value1=0.940460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1396501200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1396494000
value1=0.942460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1396292400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1396285200
value1=0.960500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1396281600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1396274400
value1=0.951420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1396281600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1396274400
value1=0.951020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1396026000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1396018800
value1=0.959710
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21396026000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1396015200
value1=0.960080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1395763200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1395756000
value1=0.954570
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21395396000
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1395385200
value1=0.963140
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1395277200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1395270000
value1=0.958370
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1395237600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1395230400
value1=0.965040
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21395237600
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1395226800
value1=0.965400
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1395136800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1395129600
value1=0.943390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1395136800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1395129600
value1=0.942990
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21395136800
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1395126000
value1=0.943600
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1395097200
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1395090000
value1=0.945870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1395046800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1395039600
value1=0.949960
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21395046800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1395036000
value1=0.949670
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1394805600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1394798400
value1=0.944870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1394744400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1394737200
value1=0.941740
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1394647200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1394640000
value1=0.945500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21394647200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1394636400
value1=0.945650
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21394611200
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1394600400
value1=0.942920
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1394514000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1394506800
value1=0.943930
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1394200800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1394193600
value1=0.937270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21394200800
hidden=1
descr=VOx2
color=6053069
selectable=0
angle=0
date1=1394190000
value1=0.938080
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1394128800
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1394121600
value1=0.929030
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1393858800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1393851600
value1=0.930340
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1393560000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1393552800
value1=0.935980
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1393502400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1393495200
value1=0.931190
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1393272000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1393264800
value1=0.924120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1393257600
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1393250400
value1=0.918230
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1392937200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1392930000
value1=0.922880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1392926400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1392919200
value1=0.921430
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1392375600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1392368400
value1=0.919700
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1392307200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1392300000
value1=0.919890
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1392170400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1392163200
value1=0.913860
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV21392170400
hidden=1
descr=VOx2
color=14772545
selectable=0
angle=0
date1=1392159600
value1=0.913880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1392026400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1392019200
value1=0.910330
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1391558400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1391551200
value1=0.915020
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1391558400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1391551200
value1=0.915420
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1391547600
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1391540400
value1=0.910500
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1391547600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1391540400
value1=0.910900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1391446800
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1391439600
value1=0.894450
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1391083200
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1391076000
value1=0.909880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1390863600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1390856400
value1=0.916680
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1390816800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1390809600
value1=0.914380
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1390568400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1390561200
value1=0.910300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1390568400
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1390561200
value1=0.909900
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1390478400
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1390471200
value1=0.929120
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1390381200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1390374000
value1=0.915180
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1390266000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1390258800
value1=0.913060
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1390266000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1390258800
value1=0.913460
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1390240800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1390233600
value1=0.907300
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1389884400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1389877200
value1=0.905880
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1389816000
hidden=1
descr=VO
color=14772545
selectable=0
angle=0
date1=1389808800
value1=0.910940
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1389790800
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1389783600
value1=0.918720
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1389722400
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1389715200
value1=0.921270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1389621600
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1389614400
value1=0.914390
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasRSI1389024000
hidden=1
descr=RSI
color=16776960
selectable=0
angle=0
date1=1389016800
value1=0.884870
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1389024000
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1389016800
value1=0.885270
fontsz=8
fontnm=Times New Roman
anchorpos=0
</object>

<object>
type=101
name=VelasOPV1388743200
hidden=1
descr=VO
color=6053069
selectable=0
angle=0
date1=1388736000
value1=0.880640
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
scale_fix_min=1
scale_fix_min_val=0.000000
scale_fix_max=1
scale_fix_max_val=1.000000
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